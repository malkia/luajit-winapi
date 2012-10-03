local ffi = require( "ffi" )
local dump = require( "etc/dump" ).dumpstring
local expat = require( "ffi/expat" )
local files = require( "etc/winapi-files" )
local outdir = "../ffi/winapi/"

if ffi.os == "Windows" then
   xmldir = (os.getenv("ProgramW6432") or os.getenv("ProgramFiles")).."/rohitab.com/API Monitor/API/"
else
   xmldir = "/Users/malkia/Downloads/API Monitor (rohitab.com)/API/"
end

local function fixpath(name)
   local fixed, pb = {}
   for i = 1, #name do
      local b = name:byte(i)
      if b == 92 then -- \
	 b = 47 -- /
      end
      if b >= 65 and b <= 90 then -- >=A && <= Z
	 b = b + 32 -- A->a
      end
      if b ~= pb or pb ~= 47 then
	 fixed[#fixed+1] = string.char(b)
      end
      pb = b
   end
   return table.concat(fixed)
end

local function fixname(oid)
   local num = tonumber(oid)
   local id = oid
   if num == nil then
      local colon = id:find(":", 1, true)
      if colon then
	 id = id:sub(1,colon-1)
	 oid = id
      end
      id = id:gsub("-","_")
      if id:sub(1,6):lower()=="const " then
	 id = id:sub(7)
      end
      if id:sub(1,1)=="[" and id:sub(-1)=="]" then
	 id = id:sub(2,-2)
      end
   end
   return (oid == id) and id or ("WINAPI_" .. id)
end

local function normalize(t)
   for index = 1, #t do
      for k,v in pairs(t[index]) do
	 t[k] = t[k] or {}
	 local p = t[k]
	 p[#p+1] = normalize(v)
      end
      t[index] = nil
   end
   return t
end

local function parse(buffer, filename)
   local stack = {{}}
   local startElementHandler = ffi.cast(
      "XML_StartElementHandler",
      function(udata, name, attr)
	 local kv, index = {}, 0
	 while attr[index] ~= nil do
	    local key   = ffi.string(attr[index+0])
	    local value = ffi.string(attr[index+1])
	    index = index + 2
	    assert( kv[key] == nil )
	    kv[key] = (key == "Filename") and fixpath(value) or fixname(value)
	 end
	 stack[#stack+1] = kv
      end)
   local endElementHandler = ffi.cast(
      "XML_EndElementHandler",
      function(udata, name)
	 local parent = stack[#stack-1]
	 parent[#parent+1] = { [ffi.string(name)] = stack[#stack] }
	 stack[#stack] = nil
      end)
   local parser = ffi.gc(expat.XML_ParserCreate(nil), expat.XML_ParserFree)
   expat.XML_SetElementHandler(parser, startElementHandler, endElementHandler)
   local status = expat.XML_Parse(parser, buffer, ffi.sizeof(buffer)-1, 1)
   startElementHandler:free()
   endElementHandler:free()
   if status == expat.XML_STATUS_ERROR then
      local ec = expat.XML_GetErrorCode(parser)
      local es = ffi.string(expat.XML_ErrorString(ec))
      local ln = expat.XML_GetCurrentLineNumber(parser)
      local cn = expat.XML_GetCurrentColumnNumber(parser)
      print( "EXPAT ERROR: " .. tonumber(ec) .. " '" .. es .. 
	     "' in file: " .. filename .. ":" .. ln .. ":" .. cn )
      return nil
   end
   assert(stack[2]==nil and stack[1][2]==nil)
   return normalize(stack[1][1].ApiMonitor)
end

local function dirname(filename)
   local p = 0
   for i=1, #filename do
      if filename:byte(i) == 47 then p = i end
   end
   return filename:sub(1, p)
end

local defined = {}

local function process(var, luafile)
   if var.Enum then
      if var.Type=="Integer" or var.Size then
	 assert(var.Type=="Integer" and var.Size)
	 local type =
	    ((var.Unsigned=="True") and "u" or "") ..
	    "int" .. tostring( 8 * tonumber(var.Size)) .. "_t"
	 luafile:write(
	    "  typedef " .. type .. " " .. var.Name .. "; //" .. var.Type .. "\n" )
	 local special_prefix =
	    (var.Name == "BOOL" or var.Name == "BOOLEAN") and (var.Name .. "_") or ""
	 for _, enum in ipairs( var.Enum[1].Set ) do
	    luafile:write(
	       "  static const " .. type .. " " ..
		  special_prefix .. enum.Name .. " = " .. enum.Value .. ";\n" )
	 end
      elseif var.Type=="Alias" or var.Base then
	 assert(var.Type=="Alias" and var.Base)
	 luafile:write(
	    "  typedef " .. var.Base .. " " .. var.Name .. "; //" .. var.Type .. "\n" )
	 for _, enum in ipairs( var.Enum[1].Set ) do
	    if defined[enum.Name]==nil then
	       defined[enum.Name]=true
	       luafile:write(
		  "  static const " .. var.Base .. " " ..
		     enum.Name .. " = " .. enum.Value .. ";\n" )
	    end
	 end
      else
	 luafile:write( "  typedef enum " .. var.Name .. " {\n" )
	 for _, enum in ipairs( var.Enum[1].Set ) do
	    if defined[enum.Name]==nil then
	       defined[enum.Name]=true
	       luafile:write(
		  "    " .. enum.Name .. " = " .. enum.Value .. ",\n" )
	    end
	 end
	 luafile:write( "  } " .. var.Name .. ";\n" )
      end
   elseif var.Type == "Pointer" or var.Type == "Alias" then
      if var.Name:find("*",1,true)==nil then
	 if var.Name ~= "unsigned char" and
	    var.Name ~= "unsigned short" and
	    var.Name ~= "short" and
	    var.Name ~= "unsigned int" and
	    var.Name ~= "unsigned long" and
	    var.Name ~= "WINAPI_unsigned long" and -- kludge
	    var.Name ~= "__int32" and
	    var.Name ~= "__int64" and
	    var.Name ~= "unsigned __int32" and
	    var.Name ~= "unsigned __int64" and
	    var.Name ~= "bool" and
	    var.Name ~= "long" and
	    var.Name ~= "int" and
	    var.Name ~= "char" and
	    var.Name ~= "size_t" and
	    var.Name ~= "time_t" and
	    var.Name ~= "va_list" and
	    var.Name ~= "signed int"
	 then
	    luafile:write(
	       "  typedef " .. var.Base .. 
		  ((var.Type == "Pointer") and " *" or " ") ..
		  var.Name .. "; //" .. var.Type .. "\n" )
	 end
      end
   elseif var.Type == "Interface" then
      luafile:write(
	 "  typedef void* " .. var.Name .. "; //" .. var.Type .. "\n" )
   elseif var.Type == "Array" then
      if var.Base .. "*" ~= var.Name then
	 local Type = var.Type
	 local Name = var.Name
	 local bracket = Name:find(" [", 1, true)
	 local in_brackets = bracket and Name:sub(bracket+2, -2) or ""
	 local space = in_brackets:find(" ", 1, true)
	 local before_space = (space and in_brackets:sub(1, space-1) or in_brackets)
	 local after_space = (space and in_brackets:sub(space) or "0"):gsub(" ","")
	 if tonumber(before_space) == nil and defined[before_space]==nil then
	    defined[before_space] = true
	    luafile:write(
	       "  enum { " .. before_space .. " = " .. var.Count .. " };\n")

	    --		     luafile:write(
	    --			"  typedef " .. var.Base .. " " ..
	    --			   var.Name .. "; //" .. var.Type .. " [" .. before_space .. "] [" .. after_space .. "] " .. var.Count .. "\n" )
	 end
      end
   elseif var.Type == "Struct" or var.Type == "Union" then
      if var.Pack then
	 luafile:write("# pragma pack( push, " .. var.Pack .. " )\n")
      end
      luafile:write( "  typedef " .. var.Type:lower() .. " " .. var.Name .. " {\n");
      for _, enum in ipairs( var.Field ) do
	 local Type = (enum.Type or enum.TYPE)
	 local Name = enum.Name
	 local bracket = Type:find(" [", 1, true)
	 if bracket then
	    Name = Name .. Type:sub(bracket+1)
	    Type = Type:sub(1,bracket-1)
	 end
	 luafile:write("    " .. Type .. " " .. Name .. ";\n") 
      end
      luafile:write( "  } " .. var.Name .. ";\n" )
      if var.Pack then
	 luafile:write("# pragma pack( pop )\n")
      end
   elseif var.Type == "Integer" then
      local type =
	 ((var.Unsigned=="True") and "u" or "") ..
	 "int" .. tostring( 8 * tonumber(var.Size)) .. "_t"
      luafile:write(
	 "  typedef " .. type .. " " .. var.Name .. "; //" .. var.Type .. "\n" )
   elseif var.Type == "Character" then
      assert(var.Name == "CHAR")
      luafile:write( "  typedef char CHAR;\n");
   elseif var.Type == "UnicodeCharacter" then
      assert(var.Name == "WCHAR")
      luafile:write( "  typedef wchar_t WCHAR;\n");
   elseif var.Type == "TCharacter" then
      assert(var.Name == "TCHAR")
      luafile:write( "  typedef char TCHAR;\n");
   elseif var.Type == "ModuleHandle" then
      luafile:write(
	 "  typedef void* " .. var.Name .. "; //" .. var.Type .. "\n" )
   elseif var.Type == "Void" then
      assert(var.Name=="void")
   elseif var.Type == "Floating" then
      assert(var.Name=="float" and var.Size=="4" or
	     var.Name=="double" and var.Size=="8")
   elseif var.Type == "Guid" then
      assert(var.Name=="GUID")
      luafile:write( "  typedef struct GUID { DWORD Data1; WORD Data2, Data3; BYTE Data4[8]; } GUID;\n")
   else
      luafile:write("//" .. dump(var).."\n")
   end
end

local function generate()
   -- All "C" definitions from the API monitor files
   local cdefs = {}
   for _, filename in ipairs(files) do
      assert(cdefs[filename]==nil)
      local file = assert(io.open(xmldir .. filename))
      local contents = file:read("*all")
      file:close()
      local buffer = ffi.new("char[?]", contents:len()+1, contents)
      cdefs[fixpath(filename)] = parse(buffer, filename)
   end

   local blacklist = {
      "internal/exception-codes.h.xml"
   }
   for _, v in ipairs(blacklist) do
      assert(cdefs[v])
      cdefs[v] = nil
   end

   local luadirs={}
   for filename, cdef in pairs(cdefs) do
      local modname = filename:gsub("%..*$", "")

      local luaname = filename:gsub("%..*$", "%.lua")
      local luadir = dirname(luaname)
      if not luadirs[luadir] then
	 luadirs[luadir] = true
	 if ffi.os == "Windows" then
	    os.execute( "md \"" .. outdir .. luadir .. "\" 1>nul 2>nul" )
	 else
	    os.execute( "mkdir -p \"" .. outdir .. luadir .. "\"" )
	 end
      end
      
      local luafile = assert(io.open(outdir..luaname, "wt"))

      for _, depend in ipairs(cdef.Include or {}) do
	 local dependFilename = fixpath(depend.Filename)
	 local dependModule = dependFilename:gsub("%..*$","")
	 if cdefs[dependFilename] then
	    assert(modname~=dependModule)
	    luafile:write(
	       "require( 'ffi/winapi/" .. dependModule .. "' )\n" )
	 else
	    luafile:write(
	       "-- require( 'ffi/winapi/" .. dependModule .. "' )\n" )
	 end
      end

      luafile:write( "local ffi = require( 'ffi' )\n" ..
		     "ffi.cdef [[\n" )
 
      for _, header in ipairs(cdef.Headers or {}) do
	 for _, var in ipairs(header.Condition or {}) do
	    assert( var.Architecture=="32" or
		    var.Architecture=="64" )
	    luafile:write("]]\n")
	    local arch = var.Architecture=="32" and "x86" or "x64"
	    luafile:write("if ffi.arch == '" .. arch .. "' then ffi.cdef[[\n")
	    for _, var in ipairs(var.Variable or {}) do
	       process(var, luafile)
	    end
	    luafile:write("]]\nend\n")
	    luafile:write("ffi.cdef[[\n")
	 end
	 for _, var in ipairs(header.Variable or {}) do
	    process(var, luafile)
	 end
      end

      local dll
      for _, module in ipairs(cdef.Module or {}) do
	 for _, var in ipairs(module.Variable or {}) do
	    process(var, luafile)
	 end

	 local return_type_width = 0
	 local api_name_width = 0
	 for _, api in ipairs(module.Api) do
	    local return_type = api.Return[1].Type
	    return_type_width = math.max( #return_type, return_type_width )
	    api_name_width = math.max( #api.Name, api_name_width )
	 end

	 for _, api in ipairs(module.Api) do
	    local return_type = api.Return[1].Type
	    luafile:write(
	       "  " .. return_type .. string.rep(" ", return_type_width - #return_type + 1) .. 
		  api.Name .. "(" .. string.rep(" ", api_name_width - #api.Name + 1))
	    local comma = ""
	    for _, param in ipairs(api.Param or {}) do
	       luafile:write( comma .. param.Type .. " " .. param.Name )
	       comma = ", "
	    end
	    luafile:write( ");\n" )
	 end
	 dll = module.Name
      end 

      luafile:write( "]]\n" )

      if dll then
	 luafile:write( "return ffi.load( '" .. dll .. "' )\n" )
      end

      luafile:close()
   end

   return cdefs
end

local function test(cdef)
--   for _, filename in ipairs(files) do
   for filename, _ in pairs(cdef) do
      local lib = "ffi/winapi/" .. fixpath(filename):gsub("%..*$", "")
      local status, error = pcall(require,lib)
      print(lib, error==true and "OK" or error)
   end
end

test(generate())

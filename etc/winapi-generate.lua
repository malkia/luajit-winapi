local ffi = require( "ffi" )
local dump = require( "etc/dump" ).dumpstring
local expat = require( "ffi/expat" )
local files = require( "etc/winapi-files" )
local outdir = "../ffi/winapi/"

print()

if ffi.os == "Windows" then
   xmldir = (os.getenv("ProgramW6432") or os.getenv("ProgramFiles")).."/rohitab.com/API Monitor/API/"
else
   xmldir = "/Users/malkia/Downloads/API Monitor (rohitab.com)/API/"
end

-- Returns the directory name of a unix-formed path
local function dirname(filename)
   local p = 0
   for i=1, #filename do
      if filename:byte(i) == 47 then p = i end
   end
   return filename:sub(1, p)
end

-- Replaces \ with /, removes duplicate /, and lowercases the name
local function fixpath(name)
   local fixed, pb = {}
   for i = 1, #name do
      local b = name:byte(i)
      if b == 92             then b = 47 end
      if b >= 65 and b <= 90 then b = b + 32 end
      if b ~= pb or pb ~= 47 then fixed[#fixed+1] = string.char(b) end
      pb = b
   end
   return table.concat(fixed)
end

local function validate_id(id)
   return id:match("[_%a]+[_%a%d]*") == id
end

local function validate_id_ptr(id)
   return id:match("[_%a]+[_%a%d]*%**") == id
end

-- Remove "const"
local function filter_const(id,type,type2)
   local o = id
   id = id:gsub(" [Cc][Oo][Nn][Ss][Tt]%*","*")
   id = id:gsub(" [Cc][Oo][Nn][Ss][Tt]%[","[")
   id = id:gsub("^[Cc][Oo][Nn][Ss][Tt] ","")
   if o ~= id then
      assert(type~="Set")
   end
   return id
end

-- Remove "dash"
local function filter_dash_slash(id,type)
   id = id:gsub("[-/]","_")
   id = id:gsub(" %+ ","_plus_")
   id = id:gsub(" %* ","_mult_")
   id = id:gsub("%(","")
   id = id:gsub("%)","")
   return id
end

-- Removes opening and closing square brackets
local function filter_brackets(id,type,type2)
   if id:sub(1,1)=="[" and id:sub(-1)=="]" then 
      assert(type~="Set")
      return "WINAPI_"..id:sub(2,-2)
   end
   return id
end

-- Remove ":" and everything after it
local function filter_cut_to_colon(id)
   local colon = id:find(":", 1, true)
   if colon then return id:sub(1,colon-1) end
   return id
end

-- Turn anything that's not _, a-zA-Z, or 0-9 to underscore
local function filter_make_underscore(id,type,type2)
   return id:gsub("[^_%a%d]","_")
end

local T = true
local builtin_types = {
   ["bool"]    = T, ["size_t"]           = T,
   ["float"]   = T, ["double"]           = T,
   ["time_t"]  = T, ["va_list"]          = T,
   ["char"]    = T, ["unsigned char"]    = T, ["signed char"]    = T,
   ["short"]   = T, ["unsigned short"]   = T, ["signed short"]   = T,
   ["int"]     = T, ["unsigned int"]     = T, ["signed int"]     = T,
   ["long"]    = T, ["unsigned long"]    = T, ["signed long"]    = T,
   ["__int32"] = T, ["unsigned __int32"] = T, ["signed __int32"] = T,
   ["__int64"] = T, ["unsigned __int64"] = T, ["signed __int64"] = T,
}
local filters = {
   Api               = {filter_dash_slash, filter_brackets  },
   Param             = {filter_dash_slash, filter_brackets  }, -- Keep "const" for parameters
   Return            = {filter_dash_slash, filter_brackets  }, -- And return types
   Field             = {filter_dash_slash, filter_brackets, filter_const  },
   Variable          = {filter_dash_slash, filter_brackets, filter_const  },
   Set               = {filter_dash_slash, filter_cut_to_colon, filter_make_underscore},
   Interface         = { Id=T, Category=T, filter_brackets, filter_const  },
   Category          = T,
   Condition         = T,
   Display           = T,
   Enum              = T,
   ErrorDecode       = T,
   ErrorLookupModule = T,
   Flag              = T,
   HelpUrl           = T,
   SourceModule      = T,
   Success           = T,
   Module            = T,
   ModuleAlias       = T,
}

local fixednames = {}
local function fixname(oid, type, type2)
   if fixednames[oid] then
      return fixednames[oid]
   end
   fixednames[oid] = oid
   if filters[type]==T or filters[type][type2]==T then
      return oid
   end
   local num = tonumber(oid)
   if num ~= nil then
      return oid
   end
   if validate_id_ptr(oid) then
      return oid
   end

   local id = oid

   for _, filter in ipairs(filters[type][type2] or filters[type]) do
      id = filter(id,type,type2)
   end

   if id ~= oid then
      local id = id:gsub("%*","") --temp
      if validate_id_ptr(id) == false then
	 print('changed',type..'/'..type2,'\n','<'..oid..'>\n','<'..id..'>')
      end
   else
      if validate_id_ptr(id) == false then
	 print('invalid',type..'/'..type2,'<'..oid..'>')
      end
   end
   
   fixednames[oid] = id
   return id
end

local function normalize(t)
   local index = 1
   while index <= #t do
      local cond = t[index].Condition
      for _,e in ipairs(cond or {}) do
	 for _,v in pairs(e) do
	    assert(v.Architecture==nil)
	    -- propagate Condition.Architecture
	    v.Architecture = cond.Architecture
	 end
	 table.insert(t, index, e)
	 index = index + 1
      end
      index = index + 1
   end
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
	    kv[key] = (key == "Filename") and fixpath(value) or fixname(value, ffi.string(name), key)
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

--[[
  typed enum   -> typedef base type; static const type enum1 = value1;
  untyped enum -> typedef enum type { enum1 = value1 } type;
--]]


local defined = {}

local function emit_typedef_int(var, f)
   assert(var.Type=="Integer" and var.Size)
   local Type = ((var.Unsigned=="True") and "u" or "") .. "int" .. tostring(8*tonumber(var.Size)) .. "_t"
   f:write( "  typedef " .. Type .. " " .. var.Name .. "; //" .. var.Type .. "\n" )
end

local function emit_typed_enum(var, f)
   local Prefix = (var.Name=="BOOL" or var.Name=="BOOLEAN") and (var.Name .. "_") or ""
   for _, enum in ipairs(var.Enum[1].Set) do
      local Name = Prefix .. enum.Name
      local Comment = defined[Name] and "//" or "  "
      defined[Name]=true
      f:write( Comment .. "static const " .. var.Name .. " " .. 
	       Name .. " = " .. enum.Value .. ";\n" )
   end
end

local function emit_untyped_enum(var, f)
   f:write( "  typedef enum " .. var.Name .. " {\n" )
   for _, enum in ipairs(var.Enum[1].Set) do
      local Comment = defined[Name] and "  //" or "    "
      defined[Name]=true
      f:write( Comment .. enum.Name .. " = " .. enum.Value .. ",\n" )
   end
   f:write( "  } " .. var.Name .. ";\n" )
end

local function process(var, luafile)
   local f = luafile

   local arch
   if var.Architecture then
      assert(var.Architecture=="32" or var.Architecture=="64")
      arch = var.Architecture=="32" and "x86" or "x64"
      f:write("]]\nif ffi.arch == '" .. arch .. "' then ffi.cdef[[\n")
   end

   if var.Enum then
      if var.Type=="Integer" or var.Size then
	 emit_typedef_int(var, f)
	 emit_typed_enum(var, f)
      elseif var.Type=="Alias" or var.Base then
	 assert(var.Type=="Alias" and var.Base)
	 local base = var.Base
	 if base == "LPCTSTR" then
	    base = "uintptr_t"
	 end
	 luafile:write(
	    "  typedef " .. base .. " " .. var.Name .. "; //" .. var.Type .. "\n" )
	 --	 assert(defined[var.Name]==nil)
	 defined[var.Name] = true
	 for _, enum in ipairs( var.Enum[1].Set ) do
	    local Comment = defined[enum.Name] and "//" or "  "
	    defined[enum.Name]=true
	    if enum.Name:find("(",1,true)==nil then
	       f:write( Comment .. "static const " .. var.Name .. " " ..
			enum.Name .. " = " .. enum.Value .. ";\n" )
	    end
	 end
      else
	 emit_untyped_enum(var, f)
      end
   elseif var.Type == "Pointer" or var.Type == "Alias" then
      if var.Base=="LPVOID" and	 var.Name=="SID*" and var.Type=="Alias" then
	 var.Base = "void"
	 var.Name = "SID"
      end
      if var.Base=="LPVOID" and	 var.Name=="MENUTEMPLATE*" and var.Type=="Alias" then
	 var.Base = "void"
	 var.Name = "MENUTEMPLATE"
      end
      if var.Base=="LPVOID" and	 var.Name=="ACTIVATION_CONTEXT*" and var.Type=="Alias" then
	 var.Base = "void"
	 var.Name = "ACTIVATION_CONTEXT"
      end
      if var.Base=="PCONTEXT" and var.Name=="CONTEXT*" and var.Type=="Alias" then
	 var.Base = "void"
	 var.Name = "CONTEXT"
      end
      if var.Name:find("*",1,true)==nil then
	 if builtin_types[var.Name] == nil then
	    luafile:write(
	       "  typedef " .. var.Base .. 
		  ((var.Type == "Pointer") and " *" or " ") ..
		  var.Name .. "; //" .. var.Type .. "\n" )
	 end
      end
   elseif var.Type == "Interface" then
      luafile:write( "  typedef void* " .. var.Name .. "; //" .. var.Type .. "\n" )
   elseif var.Type == "Array" then
      if var.Base .. "*" ~= var.Name then
	 local Type = var.Type
	 local Name = var.Name
	 local bracket = Name:find(" [", 1, true)
	 local in_brackets = bracket and Name:sub(bracket+2, -2) or ""
	 local space = in_brackets:find(" ", 1, true)
	 local before_space = (space and in_brackets:sub(1, space-1) or in_brackets)
	 local after_space = (space and in_brackets:sub(space) or "0"):gsub(" ","")
	 if tonumber(before_space) == nil and validate_id(before_space) and defined[before_space]==nil then
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
	 if Name == "WINAPI_Other values are currently unsupported" then
	    Name = "other_values_dummy"
	 end
	 luafile:write("    " .. Type .. " " .. Name .. ";\n") 
      end
      luafile:write( "  } " .. var.Name .. ";\n" )
      if var.Pack then
	 luafile:write("# pragma pack( pop )\n")
      end
   elseif var.Type == "Integer" then
      emit_typedef_int(var, f)
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
      luafile:write( "  typedef void* " .. var.Name .. "; //" .. var.Type .. "\n" )
   elseif var.Type == "Void" then
      assert(var.Name=="void")
   elseif var.Type == "Floating" then
      assert(var.Name=="float" and var.Size=="4" or var.Name=="double" and var.Size=="8")
   elseif var.Type == "Guid" then
      assert(var.Name=="GUID")
      luafile:write( "  typedef struct GUID { DWORD Data1; WORD Data2, Data3; BYTE Data4[8]; } GUID;\n")
   else
      error(dump(var))
   end
   if arch then
      luafile:write("]]\nend\n")
      luafile:write("ffi.cdef[[\n")
   end
end

local function reorder(cdefs)
   local depends = {}
   local visited = {}
   local order = {} 
   for filename, cdef in pairs(cdefs) do
      for _, depend in ipairs(cdef.Include or {}) do
	 depends[ filename ] = depends[ filename ] or {}
	 depends[ filename ][ depend.Filename ] = depends[ filename ]
      end
   end
   local function recur(filename)
      if visited[filename] then return end
      visited[filename] = true
      for k,_ in pairs(depends[filename] or {}) do recur(k) end
      order[#order+1] = filename
   end
   for filename, cdef in pairs(cdefs) do
      recur(filename)
   end
   return order
end

local function generate()
   -- All "C" definitions from the API monitor files
   local cdefs = {}
   for _, filename in ipairs(files) do
      local fixedname = fixpath(filename)
      assert(cdefs[fixedname]==nil)
      -- Still use filename, not fixedname for reading
      -- As it might be used on case-sensitive file systems (Wine on Linux?)
      local file = assert(io.open(xmldir .. filename))
      local contents = file:read("*all")
      file:close()
      local buffer = ffi.new("char[?]", contents:len()+1, contents)
      cdefs[fixedname] = parse(buffer, filename)
   end

   local luadirs={}
   for _, filename in ipairs(reorder(cdefs) or {}) do
      local cdef = cdefs[filename]
      local modname = filename:gsub("%..*$", "")
      local luaname = modname .. ".lua"
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
	 local depname = depend.Filename:gsub("%..*$","")
	 assert(depname ~= modname)
	 if cdefs[depend.Filename] then
	    luafile:write(
	       "require( 'ffi/winapi/" .. depname .. "' )\n" )
	 else
	    luafile:write(
	       "-- require( 'ffi/winapi/" .. depname .. "' )\n" )
	 end
      end

      luafile:write( "local ffi = require( 'ffi' )\n" ..
		     "ffi.cdef [[\n" )
 
      for _, header in ipairs(cdef.Headers or {}) do
	 for _, var in ipairs(header.Variable or {}) do
	    process(var, luafile)
	 end
      end

      local dll
      for _, module in ipairs(cdef.Module or {}) do
	 for _, var in ipairs(module.Variable or {}) do
	    process(var, luafile)
	 end

	 -- TODO - Move this to process
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
	       local type = param.Type
	       type = type:gsub("%[%]","*")
	       luafile:write( comma .. type .. " " .. param.Name )
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

local function test(cdefs)
   local total, bad = 0, 0
   for filename, _ in pairs(cdefs) do
      local lib = "ffi/winapi/" .. fixpath(filename):gsub("%..*$", "")
      local status, error = pcall(require,lib)
      if status ~= true then
	 print(lib.."\n"..(error==true and "OK" or error).."\n")
	 bad = bad + 1
      end
      total = total + 1
   end
   print('total',total)
   print('good',total-bad)
   print('bad',bad)
end

--generate()

test(generate())
--categories["Api"] = {}
--print(dump(categories.Api))

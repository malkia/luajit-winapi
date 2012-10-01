local ffi = require( "ffi" )
ffi.cdef [[
  typedef IAssemblyName* LPASSEMBLYNAME;
  typedef IApplicationContext* LPPAPPLICATIONCONTEXT;
]]

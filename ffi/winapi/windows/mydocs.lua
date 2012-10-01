require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  void PerUserInit( );
]]
return ffi.load( "mydocs.dll" )

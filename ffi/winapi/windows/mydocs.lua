require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  void PerUserInit( );
]]
ffi.load( 'mydocs.dll' )

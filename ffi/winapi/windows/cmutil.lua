require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  void* CmFree(   void* pvPtr);
  void* CmMalloc( size_t nBytes);
]]
ffi.load( 'CmUtil.dll' )

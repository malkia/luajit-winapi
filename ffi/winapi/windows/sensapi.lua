require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  BOOL IsDestinationReachable( LPCSTR lpszDestination, LPQOCINFO lpQOCInfo);
  Bool IsNetworkAlive(         WINAPI_NetworkAliveFlags* lpdwFlags);
]]
return ffi.load( 'Sensapi.dll' )

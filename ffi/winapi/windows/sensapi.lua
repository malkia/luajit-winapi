require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef struct QOCINFO {
    DWORD dwSize;
    DWORD dwFlags;
    DWORD dwInSpeed;
    DWORD dwOutSpeed;
  } QOCINFO;
  typedef QOCINFO *LPQOCINFO; //Pointer
  typedef DWORD WINAPI_NetworkAliveFlags; //Alias
  BOOL IsDestinationReachable( LPCSTR lpszDestination, LPQOCINFO lpQOCInfo);
  Bool IsNetworkAlive(         WINAPI_NetworkAliveFlags* lpdwFlags);
]]
return ffi.load( 'Sensapi.dll' )

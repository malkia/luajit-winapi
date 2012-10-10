require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  BOOL InternetDeInitializeAutoProxyDll( LPSTR lpszMime, DWORD dwReserved);
  BOOL InternetGetProxyInfo(             LPCSTR lpszUrl, DWORD dwUrlLength, LPSTR lpszUrlHostName, DWORD dwUrlHostNameLength, LPSTR* lplpszProxyHostName, LPDWORD lpdwProxyHostNameLength);
  BOOL InternetInitializeAutoProxyDll(   DWORD dwReserved);
]]
ffi.load( 'JSProxy.dll' )

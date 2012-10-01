require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/sockets" )
local ffi = require( "ffi" )
ffi.cdef [[
  WINAPI_INET_ADDR_OUTPUT inet_addr(   char* cp);
  char*                   inet_ntoa(   struct in_addr in);
  WINAPI_SocketCode_int   ioctlsocket( SOCKET s, WINAPI_Socket_IOCTL cmd, u_long* argp);
]]
return ffi.load( "Wsock32.dll" )

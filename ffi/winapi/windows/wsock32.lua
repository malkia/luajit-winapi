require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/sockets' )
local ffi = require( 'ffi' )
ffi.cdef [[
  INET_ADDR_OUTPUT inet_addr(   char* cp);
  char*            inet_ntoa(   struct in_addr in);
  SocketCode_int   ioctlsocket( SOCKET s, Socket_IOCTL cmd, u_long* argp);
]]
ffi.load( 'Wsock32.dll' )

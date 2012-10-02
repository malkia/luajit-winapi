require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ip' )
local ffi = require( 'ffi' )
ffi.cdef [[
  BOOL   IcmpCloseHandle(  HANDLE IcmpHandle);
  HANDLE IcmpCreateFile(   );
  DWORD  IcmpParseReplies( LPVOID ReplyBuffer, DWORD ReplySize);
  DWORD  IcmpSendEcho(     HANDLE IcmpHandle, IPAddr DestinationAddress, LPVOID RequestData, WORD RequestSize, PIP_OPTION_INFORMATION RequestOptions, LPVOID ReplyBuffer, DWORD ReplySize, DWORD Timeout);
  DWORD  IcmpSendEcho2(    HANDLE IcmpHandle, HANDLE Event, PIO_APC_ROUTINE ApcRoutine, PVOID ApcContext, IPAddr DestinationAddress, LPVOID RequestData, WORD RequestSize, PIP_OPTION_INFORMATION RequestOptions, LPVOID ReplyBuffer, DWORD ReplySize, DWORD Timeout);
]]
return ffi.load( 'Icmp.dll' )

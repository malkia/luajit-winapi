require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/sockets" )
local ffi = require( "ffi" )
ffi.cdef [[
  WINAPI_SocketCode_INT EnumProtocols(        LPINT lpiProtocols, LPVOID lpProtocolBuffer, LPDWORD lpdwBufferLength);
  void                  GetAcceptExSockaddrs( PVOID lpOutputBuffer, DWORD dwReceiveDataLength, DWORD dwLocalAddressLength, DWORD dwRemoteAddressLength, LPSOCKADDR* LocalSockaddr, LPINT LocalSockaddrLength, LPSOCKADDR* RemoteSockaddr, LPINT RemoteSockaddrLength);
  BOOL                  AcceptEx(             SOCKET sListenSocket, SOCKET sAcceptSocket, PVOID lpOutputBuffer, DWORD dwReceiveDataLength, DWORD dwLocalAddressLength, DWORD dwRemoteAddressLength, LPDWORD lpdwBytesReceived, LPOVERLAPPED lpOverlapped);
  INT                   GetAddressByName(     WINAPI_NameSpaceFlags dwNameSpace, LPGUID lpServiceType, LPTSTR lpServiceName, LPINT lpiProtocols, WINAPI_ResolutionFlags dwResolution, LPSERVICE_ASYNC_INFO lpServiceAsyncInfo, LPVOID lpCsaddrBuffer, LPDWORD lpdwBufferLength, LPTSTR lpAliasBuffer, LPDWORD lpdwAliasBufferLength);
  WINAPI_SocketCode_INT GetNameByType(        LPGUID lpServiceType, LPTSTR lpServiceName, DWORD dwNameLength);
  WINAPI_SocketCode_INT GetService(           WINAPI_NameSpaceFlags dwNameSpace, PGUID lpGuid, LPTSTR lpServiceName, WINAPI_GetService_Props dwProperties, LPVOID lpBuffer, LPDWORD lpdwBufferSize, LPSERVICE_ASYNC_INFO lpServiceAsyncInfo);
  WINAPI_SocketCode_INT GetTypeByName(        LPTSTR lpServiceName, PGUID lpServiceType);
  WINAPI_SocketCode_INT SetService(           WINAPI_NameSpaceFlags dwNameSpace, WINAPI_SetService_Operation dwOperation, WINAPI_SetService_Flags dwFlags, LPSERVICE_INFO lpServiceInfo, LPSERVICE_ASYNC_INFO lpServiceAsyncInfo, WINAPI_SetService_FlagsOut* lpdwStatusFlags);
  BOOL                  TransmitFile(         SOCKET hSocket, HANDLE hFile, DWORD nNumberOfBytesToWrite, DWORD nNumberOfBytesPerSend, LPOVERLAPPED lpOverlapped, LPTRANSMIT_FILE_BUFFERS lpTransmitBuffers, WINAPI_TransmitFile_Flags dwFlags);
  WINAPI_SocketCode_int WSARecvEx(            SOCKET s, char* buf, int len, int* flags);
]]
return ffi.load( "Mswsock.dll" )

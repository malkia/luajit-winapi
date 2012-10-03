require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/sockets' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID LPSERVICE_CALLBACK_PROC; //Alias
  typedef DWORD WINAPI_SERVICE_ADDRESS_FLAG; //Alias
  typedef struct SERVICE_ADDRESS {
    WINAPI_AddressFamily dwAddressType;
    WINAPI_SERVICE_ADDRESS_FLAG dwAddressFlags;
    DWORD dwAddressLength;
    DWORD dwPrincipalLength;
    BYTE* lpAddress;
    BYTE* lpPrincipal;
  } SERVICE_ADDRESS;
  typedef struct SERVICE_ADDRESSES {
    DWORD dwAddressCount;
    SERVICE_ADDRESS Addresses[1];
  } SERVICE_ADDRESSES;
  typedef SERVICE_ADDRESSES *LPSERVICE_ADDRESSES; //Pointer
  typedef struct SERVICE_ASYNC_INFO {
    LPSERVICE_CALLBACK_PROC lpServiceCallbackProc;
    LPARAM lParam;
    HANDLE hAsyncTaskHandle;
  } SERVICE_ASYNC_INFO;
  typedef SERVICE_ASYNC_INFO *LPSERVICE_ASYNC_INFO; //Pointer
  typedef struct SERVICE_INFO {
    LPGUID lpServiceType;
    LPTSTR lpServiceName;
    LPTSTR lpComment;
    LPTSTR lpLocale;
    DWORD dwDisplayHint;
    DWORD dwVersion;
    DWORD dwTime;
    LPTSTR lpMachineName;
    LPSERVICE_ADDRESSES lpServiceAddress;
    BLOB ServiceSpecificInfo;
  } SERVICE_INFO;
  typedef SERVICE_INFO *LPSERVICE_INFO; //Pointer
  typedef struct TRANSMIT_FILE_BUFFERS {
    LPVOID Head;
    DWORD HeadLength;
    LPVOID Tail;
    DWORD TailLength;
  } TRANSMIT_FILE_BUFFERS;
  typedef TRANSMIT_FILE_BUFFERS *LPTRANSMIT_FILE_BUFFERS; //Pointer
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
return ffi.load( 'Mswsock.dll' )

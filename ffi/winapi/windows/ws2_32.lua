require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/sockets' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef WINAPI_ERROR_CODE WINAPI_WSA_ERROR; //Alias
  typedef DWORD WINAPI_LookupServiceFlags; //Alias
  typedef DWORD WINAPI_WsaFlags; //Alias
  typedef DWORD WINAPI_WsaIoctl; //Alias
  SOCKET                  accept(                          SOCKET s, struct sockaddr* addr, int* addrlen);
  WINAPI_SocketCode_int   bind(                            SOCKET s, struct sockaddr* name, int namelen);
  WINAPI_SocketCode_int   closesocket(                     SOCKET s);
  WINAPI_SocketCode_int   connect(                         SOCKET s, struct sockaddr* name, int namelen);
  void                    freeaddrinfo(                    struct addrinfo* ai);
  WINAPI_WSA_ERROR        getaddrinfo(                     char* nodename, char* servname, struct addrinfo* hints, struct addrinfo** res);
  void                    FreeAddrInfoEx(                  PADDRINFOEX pAddrInfo);
  WINAPI_WSA_ERROR        GetAddrInfoEx(                   PCTSTR pName, PCTSTR pServiceName, WINAPI_NameSpaceFlags dwNameSpace, LPGUID lpNspId, ADDRINFOEX* pHints, PADDRINFOEX* ppResult, struct timeval* timeout, LPOVERLAPPED lpOverlapped, LPLOOKUPSERVICE_COMPLETION_ROUTINE lpCompletionRoutine, LPHANDLE lpNameHandle);
  void                    FreeAddrInfoW(                   PADDRINFOW pAddrInfo);
  WINAPI_WSA_ERROR        GetAddrInfoW(                    PCWSTR pNodeName, PCWSTR pServiceName, ADDRINFOW* pHints, PADDRINFOW* ppResult);
  struct hostent*         gethostbyaddr(                   char* addr, int len, WINAPI_AddressFamily type);
  struct hostent*         gethostbyname(                   char* name);
  WINAPI_SocketCode_int   gethostname(                     char* name, int namelen);
  WINAPI_WSA_ERROR        getnameinfo(                     struct sockaddr* sa, socklen_t salen, char* host, DWORD hostlen, char* serv, DWORD servlen, WINAPI_NI_Flags flags);
  WINAPI_WSA_ERROR        GetNameInfoW(                    SOCKADDR* pSockaddr, socklen_t SockaddrLength, PWCHAR pNodeBuffer, DWORD NodeBufferSize, PWCHAR pServiceBuffer, DWORD ServiceBufferSize, WINAPI_NI_Flags Flags);
  WINAPI_SocketCode_int   getpeername(                     SOCKET s, struct sockaddr* name, int* namelen);
  struct PROTOENT*        getprotobyname(                  char* name);
  struct PROTOENT*        getprotobynumber(                int number);
  struct servent*         getservbyname(                   char* name, char* proto);
  struct servent*         getservbyport(                   int port, char* proto);
  WINAPI_SocketCode_int   getsockname(                     SOCKET s, struct sockaddr* name, int* namelen);
  WINAPI_SocketCode_int   getsockopt(                      SOCKET s, WINAPI_SocketLevel level, WINAPI_SocketOption optname, WINAPI_LPVOID_char* optval, int* optlen);
  u_long                  htonl(                           u_long hostlong);
  u_short                 htons(                           u_short hostshort);
  WINAPI_INET_ADDR_OUTPUT inet_addr(                       char* cp);
  char*                   inet_ntoa(                       struct in_addr in);
  PCWSTR                  InetNtopW(                       INT Family, PVOID pAddr, PWSTR pStringBuf, size_t StringBufSize);
  PCSTR                   inet_ntop(                       INT Family, PVOID pAddr, PSTR pStringBuf, size_t StringBufSize);
  PCSTR                   inet_pton(                       INT Family, PCSTR pszAddrString, PVOID pAddrBuf);
  PCWSTR                  InetPtonW(                       INT Family, PCWSTR pszAddrString, PVOID pAddrBuf);
  WINAPI_SocketCode_int   ioctlsocket(                     SOCKET s, WINAPI_Socket_IOCTL cmd, u_long* argp);
  WINAPI_SocketCode_int   listen(                          SOCKET s, int backlog);
  u_long                  ntohl(                           u_long netlong);
  u_short                 ntohs(                           u_short netshort);
  WINAPI_SocketCode_int   recv(                            SOCKET s, WINAPI_LPVOID_char* buf, int len, WINAPI_SendRecvFlags flags);
  WINAPI_SocketCode_int   recvfrom(                        SOCKET s, WINAPI_LPVOID_char* buf, int len, int flags, struct sockaddr* from, int* fromlen);
  WINAPI_SocketCode_int   select(                          int nfds, fd_set* readfds, fd_set* writefds, fd_set* exceptfds, struct timeval* timeout);
  WINAPI_SocketCode_int   send(                            SOCKET s, LPVOID buf, int len, WINAPI_SendRecvFlags flags);
  WINAPI_SocketCode_int   sendto(                          SOCKET s, LPVOID buf, int len, WINAPI_SendRecvFlags flags, struct sockaddr* to, int tolen);
  WINAPI_WSA_ERROR        SetAddrInfoEx(                   PCTSTR pName, PCTSTR pServiceName, SOCKET_ADDRESS* pAddresses, DWORD dwAddressCount, LPBLOB lpBlob, DWORD dwFlags, WINAPI_NameSpaceFlags dwNameSpace, LPGUID lpNspId, struct timeval* timeout, LPOVERLAPPED lpOverlapped, LPLOOKUPSERVICE_COMPLETION_ROUTINE lpCompletionRoutine, LPHANDLE lpNameHandle);
  WINAPI_SocketCode_int   setsockopt(                      SOCKET s, WINAPI_SocketLevel level, WINAPI_SocketOption optname, LPVOID optval, int optlen);
  WINAPI_SocketCode_int   shutdown(                        SOCKET s, WINAPI_SocketShutdownFlags how);
  SOCKET                  socket(                          WINAPI_AddressFamily af, WINAPI_SocketType type, WINAPI_SocketProtocol protocol);
  SOCKET                  WSAAccept(                       SOCKET s, struct sockaddr* addr, LPINT addrlen, LPCONDITIONPROC lpfnCondition, DWORD dwCallbackData);
  WINAPI_SocketCode_INT   WSAAddressToString(              LPSOCKADDR lpsaAddress, DWORD dwAddressLength, LPWSAPROTOCOL_INFO lpProtocolInfo, LPTSTR lpszAddressString, LPDWORD lpdwAddressStringLength);
  HANDLE                  WSAAsyncGetHostByAddr(           HWND hWnd, unsigned int wMsg, char* addr, int len, int type, char* buf, int buflen);
  HANDLE                  WSAAsyncGetHostByName(           HWND hWnd, unsigned int wMsg, char* name, char* buf, int buflen);
  HANDLE                  WSAAsyncGetProtoByName(          HWND hWnd, unsigned int wMsg, char* name, char* buf, int buflen);
  HANDLE                  WSAAsyncGetProtoByNumber(        HWND hWnd, unsigned int wMsg, int number, char* buf, int buflen);
  HANDLE                  WSAAsyncGetServByName(           HWND hWnd, unsigned int wMsg, char* name, char* proto, char* buf, int buflen);
  HANDLE                  WSAAsyncGetServByPort(           HWND hWnd, unsigned int wMsg, int port, char* proto, char* buf, int buflen);
  WINAPI_SocketCode_int   WSAAsyncSelect(                  SOCKET s, HWND hWnd, unsigned int wMsg, WINAPI_FDEvents lEvent);
  WINAPI_SocketCode_int   WSACancelAsyncRequest(           HANDLE hAsyncTaskHandle);
  WINAPI_SocketCode_int   WSACleanup(                      );
  BOOL                    WSACloseEvent(                   WSAEVENT hEvent);
  WINAPI_SocketCode_int   WSAConnect(                      SOCKET s, struct sockaddr* name, int namelen, LPWSABUF lpCallerData, LPWSABUF lpCalleeData, LPQOS lpSQOS, LPQOS lpGQOS);
  BOOL                    WSAConnectByList(                SOCKET s, PSOCKET_ADDRESS_LIST SocketAddressList, LPDWORD LocalAddressLength, LPSOCKADDR LocalAddress, LPDWORD RemoteAddressLength, LPSOCKADDR RemoteAddress, struct timeval* timeout, LPWSAOVERLAPPED Reserved);
  BOOL                    WSAConnectByName(                SOCKET s, LPSTR nodename, LPSTR servicename, LPDWORD LocalAddressLength, LPSOCKADDR LocalAddress, LPDWORD RemoteAddressLength, LPSOCKADDR RemoteAddress, struct timeval* timeout, LPWSAOVERLAPPED Reserved);
  WSAEVENT                WSACreateEvent(                  );
  WINAPI_SocketCode_int   WSADuplicateSocket(              SOCKET s, DWORD dwProcessId, LPWSAPROTOCOL_INFO lpProtocolInfo);
  WINAPI_SocketCode_INT   WSAEnumNameSpaceProviders(       LPDWORD lpdwBufferLength, LPWSANAMESPACE_INFO lpnspBuffer);
  WINAPI_SocketCode_INT   WSAEnumNameSpaceProvidersEx(     LPDWORD lpdwBufferLength, LPWSANAMESPACE_INFOEX lpnspBuffer);
  WINAPI_SocketCode_int   WSAEnumNetworkEvents(            SOCKET s, WSAEVENT hEventObject, LPWSANETWORKEVENTS lpNetworkEvents);
  WINAPI_SocketCode_int   WSAEnumProtocols(                LPINT lpiProtocols, LPWSAPROTOCOL_INFO lpProtocolBuffer, LPDWORD lpdwBufferLength);
  WINAPI_SocketCode_int   WSAEventSelect(                  SOCKET s, WSAEVENT hEventObject, WINAPI_FDEvents lNetworkEvents);
  WINAPI_WSA_ERROR        WSAGetLastError(                 );
  BOOL                    WSAGetOverlappedResult(          SOCKET s, LPWSAOVERLAPPED lpOverlapped, LPDWORD lpcbTransfer, BOOL fWait, LPDWORD lpdwFlags);
  WINAPI_SocketCode_INT   WSAGetServiceClassInfo(          LPGUID lpProviderId, LPGUID lpServiceClassId, LPDWORD lpdwBufferLength, LPWSASERVICECLASSINFO lpServiceClassInfo);
  WINAPI_SocketCode_INT   WSAGetServiceClassNameByClassId( LPGUID lpServiceClassId, LPTSTR lpszServiceClassName, LPDWORD lpdwBufferLength);
  WINAPI_SocketCode_int   WSAHtonl(                        SOCKET s, u_long hostlong, u_long* lpnetlong);
  WINAPI_SocketCode_int   WSAHtons(                        SOCKET s, u_short hostshort, u_short* lpnetshort);
  WINAPI_SocketCode_INT   WSAInstallServiceClass(          LPWSASERVICECLASSINFO lpServiceClassInfo);
  WINAPI_SocketCode_int   WSAIoctl(                        SOCKET s, WINAPI_WsaIoctl dwIoControlCode, LPVOID lpvInBuffer, DWORD cbInBuffer, LPVOID lpvOutBuffer, DWORD cbOutBuffer, LPDWORD lpcbBytesReturned, LPWSAOVERLAPPED lpOverlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
  SOCKET                  WSAJoinLeaf(                     SOCKET s, struct sockaddr* name, int namelen, LPWSABUF lpCallerData, LPWSABUF lpCalleeData, LPQOS lpSQOS, LPQOS lpGQOS, DWORD dwFlags);
  WINAPI_SocketCode_INT   WSALookupServiceBegin(           LPWSAQUERYSET lpqsRestrictions, WINAPI_LookupServiceFlags dwControlFlags, LPHANDLE lphLookup);
  WINAPI_SocketCode_INT   WSALookupServiceEnd(             HANDLE hLookup);
  WINAPI_SocketCode_INT   WSALookupServiceNext(            HANDLE hLookup, WINAPI_LookupServiceFlags dwControlFlags, LPDWORD lpdwBufferLength, LPWSAQUERYSET lpqsResults);
  WINAPI_SocketCode_int   WSANtohl(                        SOCKET s, u_long netlong, u_long* lphostlong);
  WINAPI_SocketCode_int   WSANtohs(                        SOCKET s, u_short netshort, u_short* lphostshort);
  WINAPI_SocketCode_int   WSAPoll(                         ULONG nfds, INT timeout);
  WINAPI_SocketCode_int   WSAProviderConfigChange(         LPHANDLE lpNotificationHandle, LPWSAOVERLAPPED lpOverlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
  WINAPI_SocketCode_int   WSARecv(                         SOCKET s, LPWSABUF lpBuffers, DWORD dwBufferCount, LPDWORD lpNumberOfBytesRecvd, WINAPI_SendRecvFlags* lpFlags, LPWSAOVERLAPPED lpOverlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
  WINAPI_SocketCode_int   WSARecvDisconnect(               SOCKET s, LPWSABUF lpInboundDisconnectData);
  WINAPI_SocketCode_int   WSARecvFrom(                     SOCKET s, LPWSABUF lpBuffers, DWORD dwBufferCount, LPDWORD lpNumberOfBytesRecvd, LPDWORD lpFlags, struct sockaddr* lpFrom, LPINT lpFromlen, LPWSAOVERLAPPED lpOverlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
  WINAPI_SocketCode_INT   WSARemoveServiceClass(           LPGUID lpServiceClassId);
  BOOL                    WSAResetEvent(                   WSAEVENT hEvent);
  WINAPI_SocketCode_int   WSASend(                         SOCKET s, LPWSABUF lpBuffers, DWORD dwBufferCount, LPDWORD lpNumberOfBytesSent, WINAPI_SendRecvFlags dwFlags, LPWSAOVERLAPPED lpOverlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
  WINAPI_SocketCode_int   WSASendDisconnect(               SOCKET s, LPWSABUF lpOutboundDisconnectData);
  WINAPI_SocketCode_int   WSASendMsg(                      SOCKET s, LPWSAMSG lpMsg, DWORD dwFlags, LPDWORD lpNumberOfBytesSent, LPWSAOVERLAPPED lpOverlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
  WINAPI_SocketCode_int   WSASendTo(                       SOCKET s, LPWSABUF lpBuffers, DWORD dwBufferCount, LPDWORD lpNumberOfBytesSent, WINAPI_SendRecvFlags dwFlags, struct sockaddr* lpTo, int iToLen, LPWSAOVERLAPPED lpOverlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
  BOOL                    WSASetEvent(                     WSAEVENT hEvent);
  void                    WSASetLastError(                 WINAPI_WSA_ERROR iError);
  WINAPI_SocketCode_INT   WSASetService(                   LPWSAQUERYSET lpqsRegInfo, WSAESETSERVICEOP essOperation, DWORD dwControlFlags);
  SOCKET                  WSASocket(                       WINAPI_AddressFamily af, WINAPI_SocketType type, WINAPI_SocketProtocol protocol, LPWSAPROTOCOL_INFO lpProtocolInfo, GROUP g, WINAPI_WsaFlags dwFlags);
  WINAPI_WSA_ERROR        WSAStartup(                      WORD wVersionRequested, LPWSADATA lpWSAData);
  WINAPI_SocketCode_INT   WSAStringToAddress(              LPTSTR AddressString, WINAPI_AddressFamily AddressFamily, LPWSAPROTOCOL_INFO lpProtocolInfo, LPSOCKADDR lpAddress, LPINT lpAddressLength);
  DWORD                   WSAWaitForMultipleEvents(        DWORD cEvents, WSAEVENT* lphEvents, BOOL fWaitAll, DWORD dwTimeout, BOOL fAlertable);
  BOOL                    WSAIsBlocking(                   );
  BOOL                    WSAGetQOSByName(                 SOCKET s, LPWSABUF lpQOSName, LPQOS lpQOS);
]]
ffi.load( 'Ws2_32.dll' )

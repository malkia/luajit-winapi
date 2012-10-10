require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/sockets' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef ERROR_CODE WSA_ERROR; //Alias
  typedef DWORD LookupServiceFlags; //Alias
  typedef DWORD WsaFlags; //Alias
  typedef DWORD WsaIoctl; //Alias
  SOCKET           accept(                          SOCKET s, struct sockaddr* addr, int* addrlen);
  SocketCode_int   bind(                            SOCKET s, struct sockaddr* name, int namelen);
  SocketCode_int   closesocket(                     SOCKET s);
  SocketCode_int   connect(                         SOCKET s, struct sockaddr* name, int namelen);
  void             freeaddrinfo(                    struct addrinfo* ai);
  WSA_ERROR        getaddrinfo(                     char* nodename, char* servname, struct addrinfo* hints, struct addrinfo** res);
  void             FreeAddrInfoEx(                  PADDRINFOEX pAddrInfo);
  WSA_ERROR        GetAddrInfoEx(                   PCTSTR pName, PCTSTR pServiceName, NameSpaceFlags dwNameSpace, LPGUID lpNspId, ADDRINFOEX* pHints, PADDRINFOEX* ppResult, struct timeval* timeout, LPOVERLAPPED lpOverlapped, LPLOOKUPSERVICE_COMPLETION_ROUTINE lpCompletionRoutine, LPHANDLE lpNameHandle);
  void             FreeAddrInfoW(                   PADDRINFOW pAddrInfo);
  WSA_ERROR        GetAddrInfoW(                    PCWSTR pNodeName, PCWSTR pServiceName, ADDRINFOW* pHints, PADDRINFOW* ppResult);
  struct hostent*  gethostbyaddr(                   char* addr, int len, AddressFamily type);
  struct hostent*  gethostbyname(                   char* name);
  SocketCode_int   gethostname(                     char* name, int namelen);
  WSA_ERROR        getnameinfo(                     struct sockaddr* sa, socklen_t salen, char* host, DWORD hostlen, char* serv, DWORD servlen, NI_Flags flags);
  WSA_ERROR        GetNameInfoW(                    SOCKADDR* pSockaddr, socklen_t SockaddrLength, PWCHAR pNodeBuffer, DWORD NodeBufferSize, PWCHAR pServiceBuffer, DWORD ServiceBufferSize, NI_Flags Flags);
  SocketCode_int   getpeername(                     SOCKET s, struct sockaddr* name, int* namelen);
  struct PROTOENT* getprotobyname(                  char* name);
  struct PROTOENT* getprotobynumber(                int number);
  struct servent*  getservbyname(                   char* name, char* proto);
  struct servent*  getservbyport(                   int port, char* proto);
  SocketCode_int   getsockname(                     SOCKET s, struct sockaddr* name, int* namelen);
  SocketCode_int   getsockopt(                      SOCKET s, SocketLevel level, SocketOption optname, LPVOID_char* optval, int* optlen);
  u_long           htonl(                           u_long hostlong);
  u_short          htons(                           u_short hostshort);
  INET_ADDR_OUTPUT inet_addr(                       char* cp);
  char*            inet_ntoa(                       struct in_addr in);
  PCWSTR           InetNtopW(                       INT Family, PVOID pAddr, PWSTR pStringBuf, size_t StringBufSize);
  PCSTR            inet_ntop(                       INT Family, PVOID pAddr, PSTR pStringBuf, size_t StringBufSize);
  PCSTR            inet_pton(                       INT Family, PCSTR pszAddrString, PVOID pAddrBuf);
  PCWSTR           InetPtonW(                       INT Family, PCWSTR pszAddrString, PVOID pAddrBuf);
  SocketCode_int   ioctlsocket(                     SOCKET s, Socket_IOCTL cmd, u_long* argp);
  SocketCode_int   listen(                          SOCKET s, int backlog);
  u_long           ntohl(                           u_long netlong);
  u_short          ntohs(                           u_short netshort);
  SocketCode_int   recv(                            SOCKET s, LPVOID_char* buf, int len, SendRecvFlags flags);
  SocketCode_int   recvfrom(                        SOCKET s, LPVOID_char* buf, int len, int flags, struct sockaddr* from, int* fromlen);
  SocketCode_int   select(                          int nfds, fd_set* readfds, fd_set* writefds, fd_set* exceptfds, struct timeval* timeout);
  SocketCode_int   send(                            SOCKET s, LPVOID buf, int len, SendRecvFlags flags);
  SocketCode_int   sendto(                          SOCKET s, LPVOID buf, int len, SendRecvFlags flags, struct sockaddr* to, int tolen);
  WSA_ERROR        SetAddrInfoEx(                   PCTSTR pName, PCTSTR pServiceName, SOCKET_ADDRESS* pAddresses, DWORD dwAddressCount, LPBLOB lpBlob, DWORD dwFlags, NameSpaceFlags dwNameSpace, LPGUID lpNspId, struct timeval* timeout, LPOVERLAPPED lpOverlapped, LPLOOKUPSERVICE_COMPLETION_ROUTINE lpCompletionRoutine, LPHANDLE lpNameHandle);
  SocketCode_int   setsockopt(                      SOCKET s, SocketLevel level, SocketOption optname, LPVOID optval, int optlen);
  SocketCode_int   shutdown(                        SOCKET s, SocketShutdownFlags how);
  SOCKET           socket(                          AddressFamily af, SocketType type, SocketProtocol protocol);
  SOCKET           WSAAccept(                       SOCKET s, struct sockaddr* addr, LPINT addrlen, LPCONDITIONPROC lpfnCondition, DWORD dwCallbackData);
  SocketCode_INT   WSAAddressToString(              LPSOCKADDR lpsaAddress, DWORD dwAddressLength, LPWSAPROTOCOL_INFO lpProtocolInfo, LPTSTR lpszAddressString, LPDWORD lpdwAddressStringLength);
  HANDLE           WSAAsyncGetHostByAddr(           HWND hWnd, unsigned int wMsg, char* addr, int len, int type, char* buf, int buflen);
  HANDLE           WSAAsyncGetHostByName(           HWND hWnd, unsigned int wMsg, char* name, char* buf, int buflen);
  HANDLE           WSAAsyncGetProtoByName(          HWND hWnd, unsigned int wMsg, char* name, char* buf, int buflen);
  HANDLE           WSAAsyncGetProtoByNumber(        HWND hWnd, unsigned int wMsg, int number, char* buf, int buflen);
  HANDLE           WSAAsyncGetServByName(           HWND hWnd, unsigned int wMsg, char* name, char* proto, char* buf, int buflen);
  HANDLE           WSAAsyncGetServByPort(           HWND hWnd, unsigned int wMsg, int port, char* proto, char* buf, int buflen);
  SocketCode_int   WSAAsyncSelect(                  SOCKET s, HWND hWnd, unsigned int wMsg, FDEvents lEvent);
  SocketCode_int   WSACancelAsyncRequest(           HANDLE hAsyncTaskHandle);
  SocketCode_int   WSACleanup(                      );
  BOOL             WSACloseEvent(                   WSAEVENT hEvent);
  SocketCode_int   WSAConnect(                      SOCKET s, struct sockaddr* name, int namelen, LPWSABUF lpCallerData, LPWSABUF lpCalleeData, LPQOS lpSQOS, LPQOS lpGQOS);
  BOOL             WSAConnectByList(                SOCKET s, PSOCKET_ADDRESS_LIST SocketAddressList, LPDWORD LocalAddressLength, LPSOCKADDR LocalAddress, LPDWORD RemoteAddressLength, LPSOCKADDR RemoteAddress, struct timeval* timeout, LPWSAOVERLAPPED Reserved);
  BOOL             WSAConnectByName(                SOCKET s, LPSTR nodename, LPSTR servicename, LPDWORD LocalAddressLength, LPSOCKADDR LocalAddress, LPDWORD RemoteAddressLength, LPSOCKADDR RemoteAddress, struct timeval* timeout, LPWSAOVERLAPPED Reserved);
  WSAEVENT         WSACreateEvent(                  );
  SocketCode_int   WSADuplicateSocket(              SOCKET s, DWORD dwProcessId, LPWSAPROTOCOL_INFO lpProtocolInfo);
  SocketCode_INT   WSAEnumNameSpaceProviders(       LPDWORD lpdwBufferLength, LPWSANAMESPACE_INFO lpnspBuffer);
  SocketCode_INT   WSAEnumNameSpaceProvidersEx(     LPDWORD lpdwBufferLength, LPWSANAMESPACE_INFOEX lpnspBuffer);
  SocketCode_int   WSAEnumNetworkEvents(            SOCKET s, WSAEVENT hEventObject, LPWSANETWORKEVENTS lpNetworkEvents);
  SocketCode_int   WSAEnumProtocols(                LPINT lpiProtocols, LPWSAPROTOCOL_INFO lpProtocolBuffer, LPDWORD lpdwBufferLength);
  SocketCode_int   WSAEventSelect(                  SOCKET s, WSAEVENT hEventObject, FDEvents lNetworkEvents);
  WSA_ERROR        WSAGetLastError(                 );
  BOOL             WSAGetOverlappedResult(          SOCKET s, LPWSAOVERLAPPED lpOverlapped, LPDWORD lpcbTransfer, BOOL fWait, LPDWORD lpdwFlags);
  SocketCode_INT   WSAGetServiceClassInfo(          LPGUID lpProviderId, LPGUID lpServiceClassId, LPDWORD lpdwBufferLength, LPWSASERVICECLASSINFO lpServiceClassInfo);
  SocketCode_INT   WSAGetServiceClassNameByClassId( LPGUID lpServiceClassId, LPTSTR lpszServiceClassName, LPDWORD lpdwBufferLength);
  SocketCode_int   WSAHtonl(                        SOCKET s, u_long hostlong, u_long* lpnetlong);
  SocketCode_int   WSAHtons(                        SOCKET s, u_short hostshort, u_short* lpnetshort);
  SocketCode_INT   WSAInstallServiceClass(          LPWSASERVICECLASSINFO lpServiceClassInfo);
  SocketCode_int   WSAIoctl(                        SOCKET s, WsaIoctl dwIoControlCode, LPVOID lpvInBuffer, DWORD cbInBuffer, LPVOID lpvOutBuffer, DWORD cbOutBuffer, LPDWORD lpcbBytesReturned, LPWSAOVERLAPPED lpOverlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
  SOCKET           WSAJoinLeaf(                     SOCKET s, struct sockaddr* name, int namelen, LPWSABUF lpCallerData, LPWSABUF lpCalleeData, LPQOS lpSQOS, LPQOS lpGQOS, DWORD dwFlags);
  SocketCode_INT   WSALookupServiceBegin(           LPWSAQUERYSET lpqsRestrictions, LookupServiceFlags dwControlFlags, LPHANDLE lphLookup);
  SocketCode_INT   WSALookupServiceEnd(             HANDLE hLookup);
  SocketCode_INT   WSALookupServiceNext(            HANDLE hLookup, LookupServiceFlags dwControlFlags, LPDWORD lpdwBufferLength, LPWSAQUERYSET lpqsResults);
  SocketCode_int   WSANtohl(                        SOCKET s, u_long netlong, u_long* lphostlong);
  SocketCode_int   WSANtohs(                        SOCKET s, u_short netshort, u_short* lphostshort);
  SocketCode_int   WSAPoll(                         ULONG nfds, INT timeout);
  SocketCode_int   WSAProviderConfigChange(         LPHANDLE lpNotificationHandle, LPWSAOVERLAPPED lpOverlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
  SocketCode_int   WSARecv(                         SOCKET s, LPWSABUF lpBuffers, DWORD dwBufferCount, LPDWORD lpNumberOfBytesRecvd, SendRecvFlags* lpFlags, LPWSAOVERLAPPED lpOverlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
  SocketCode_int   WSARecvDisconnect(               SOCKET s, LPWSABUF lpInboundDisconnectData);
  SocketCode_int   WSARecvFrom(                     SOCKET s, LPWSABUF lpBuffers, DWORD dwBufferCount, LPDWORD lpNumberOfBytesRecvd, LPDWORD lpFlags, struct sockaddr* lpFrom, LPINT lpFromlen, LPWSAOVERLAPPED lpOverlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
  SocketCode_INT   WSARemoveServiceClass(           LPGUID lpServiceClassId);
  BOOL             WSAResetEvent(                   WSAEVENT hEvent);
  SocketCode_int   WSASend(                         SOCKET s, LPWSABUF lpBuffers, DWORD dwBufferCount, LPDWORD lpNumberOfBytesSent, SendRecvFlags dwFlags, LPWSAOVERLAPPED lpOverlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
  SocketCode_int   WSASendDisconnect(               SOCKET s, LPWSABUF lpOutboundDisconnectData);
  SocketCode_int   WSASendMsg(                      SOCKET s, LPWSAMSG lpMsg, DWORD dwFlags, LPDWORD lpNumberOfBytesSent, LPWSAOVERLAPPED lpOverlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
  SocketCode_int   WSASendTo(                       SOCKET s, LPWSABUF lpBuffers, DWORD dwBufferCount, LPDWORD lpNumberOfBytesSent, SendRecvFlags dwFlags, struct sockaddr* lpTo, int iToLen, LPWSAOVERLAPPED lpOverlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
  BOOL             WSASetEvent(                     WSAEVENT hEvent);
  void             WSASetLastError(                 WSA_ERROR iError);
  SocketCode_INT   WSASetService(                   LPWSAQUERYSET lpqsRegInfo, WSAESETSERVICEOP essOperation, DWORD dwControlFlags);
  SOCKET           WSASocket(                       AddressFamily af, SocketType type, SocketProtocol protocol, LPWSAPROTOCOL_INFO lpProtocolInfo, GROUP g, WsaFlags dwFlags);
  WSA_ERROR        WSAStartup(                      WORD wVersionRequested, LPWSADATA lpWSAData);
  SocketCode_INT   WSAStringToAddress(              LPTSTR AddressString, AddressFamily AddressFamily, LPWSAPROTOCOL_INFO lpProtocolInfo, LPSOCKADDR lpAddress, LPINT lpAddressLength);
  DWORD            WSAWaitForMultipleEvents(        DWORD cEvents, WSAEVENT* lphEvents, BOOL fWaitAll, DWORD dwTimeout, BOOL fAlertable);
  BOOL             WSAIsBlocking(                   );
  BOOL             WSAGetQOSByName(                 SOCKET s, LPWSABUF lpQOSName, LPQOS lpQOS);
]]
ffi.load( 'Ws2_32.dll' )

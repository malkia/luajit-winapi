require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID WINAPI_SOCKET_PEER_TARGET_NAME*; //Alias
  typedef LPVOID WINAPI_SOCKET_SECURITY_QUERY_TEMPLATE*; //Alias
  typedef OVERLAPPED WSAOVERLAPPED; //Alias
  typedef WSAOVERLAPPED *LPWSAOVERLAPPED; //Pointer
  typedef LPVOID LPWSAOVERLAPPED_COMPLETION_ROUTINE; //Alias
  typedef LPVOID LPLOOKUPSERVICE_COMPLETION_ROUTINE; //Alias
  typedef int socklen_t; //Alias
  typedef LPVOID LPCONDITIONPROC; //Alias
  typedef HANDLE WSAEVENT; //Alias
  typedef WSAEVENT *WINAPI_WSAEVENT*; //Pointer
  typedef unsigned int u_int; //Alias
  typedef int int [FD_MAX_EVENTS]; //Array 10
  typedef TCHAR TCHAR [WSAPROTOCOL_LEN + 1]; //Array 256
  typedef DWORD DWORD [MAX_PROTOCOL_CHAIN]; //Array 7
  typedef char char [WSADESCRIPTION_LEN + 1]; //Array 257
  typedef char char [WSASYS_STATUS_LEN + 1]; //Array 129
  typedef enum WINAPI_AddressFamily {
    AF_UNSPEC = 0,
    AF_UNIX = 1,
    AF_INET = 2,
    AF_IMPLINK = 3,
    AF_PUP = 4,
    AF_CHAOS = 5,
    AF_IPX/AF_NS = 6,
    AF_ISO/AF_OSI = 7,
    AF_ECMA = 8,
    AF_DATAKIT = 9,
    AF_CCITT = 10,
    AF_SNA = 11,
    AF_DECnet = 12,
    AF_DLI = 13,
    AF_LAT = 14,
    AF_HYLINK = 15,
    AF_APPLETALK = 16,
    AF_NETBIOS = 17,
    AF_VOICEVIEW = 18,
    AF_FIREFOX = 19,
    AF_UNKNOWN1 = 20,
    AF_BAN = 21,
    AF_ATM = 22,
    AF_INET6 = 23,
    AF_CLUSTER = 24,
    AF_12844 = 25,
    AF_IRDA = 26,
    AF_NETDES = 28,
    AF_TCNPROCESS = 29,
    AF_TCNMESSAGE = 30,
    AF_ICLFXBM = 31,
    AF_BTH = 32,
  } WINAPI_AddressFamily;
  typedef enum ADDRESS_FAMILY {
    AF_UNSPEC = 0,
    AF_UNIX = 1,
    AF_INET = 2,
    AF_IMPLINK = 3,
    AF_PUP = 4,
    AF_CHAOS = 5,
    AF_IPX/AF_NS = 6,
    AF_ISO/AF_OSI = 7,
    AF_ECMA = 8,
    AF_DATAKIT = 9,
    AF_CCITT = 10,
    AF_SNA = 11,
    AF_DECnet = 12,
    AF_DLI = 13,
    AF_LAT = 14,
    AF_HYLINK = 15,
    AF_APPLETALK = 16,
    AF_NETBIOS = 17,
    AF_VOICEVIEW = 18,
    AF_FIREFOX = 19,
    AF_UNKNOWN1 = 20,
    AF_BAN = 21,
    AF_ATM = 22,
    AF_INET6 = 23,
    AF_CLUSTER = 24,
    AF_12844 = 25,
    AF_IRDA = 26,
    AF_NETDES = 28,
    AF_TCNPROCESS = 29,
    AF_TCNMESSAGE = 30,
    AF_ICLFXBM = 31,
    AF_BTH = 32,
  } ADDRESS_FAMILY;
  typedef ADDRESS_FAMILY WINAPI_ADDRESS_FAMILY_short; //Alias
  typedef enum WINAPI_SocketType {
    SOCK_STREAM = 1,
    SOCK_DGRAM = 2,
    SOCK_RAW = 3,
    SOCK_RDM = 4,
    SOCK_SEQPACKET = 5,
  } WINAPI_SocketType;
  typedef enum WINAPI_SocketProtocol {
    IPPROTO_IP = 0,
    IPPROTO_ICMP = 1,
    IPPROTO_IGMP = 2,
    IPPROTO_GGP = 3,
    IPPROTO_IPV4 = 4,
    IPPROTO_ST = 5,
    IPPROTO_TCP = 6,
    IPPROTO_CBT = 7,
    IPPROTO_EGP = 8,
    IPPROTO_IGP = 9,
    IPPROTO_PUP = 12,
    IPPROTO_UDP = 17,
    IPPROTO_IDP = 22,
    IPPROTO_RDP = 27,
    IPPROTO_IPV6 = 41,
    IPPROTO_ROUTING = 43,
    IPPROTO_FRAGMENT = 44,
    IPPROTO_ESP = 50,
    IPPROTO_AH = 51,
    IPPROTO_ICMPV6 = 58,
    IPPROTO_NONE = 59,
    IPPROTO_DSTOPTS = 60,
    IPPROTO_ND = 77,
    IPPROTO_PIM = 103,
    IPPROTO_PGM = 113,
    IPPROTO_L2TP = 115,
    IPPROTO_SCTP = 132,
    IPPROTO_RAW = 255,
  } WINAPI_SocketProtocol;
  typedef struct struct sockaddr {
    ADDRESS_FAMILY sa_family,
    CHAR [14] sa_data,
  } struct sockaddr;
  typedef struct sockaddr *WINAPI_sockaddr*; //Pointer
  typedef struct sockaddr *WINAPI_struct sockaddr*; //Pointer
  typedef UINT WINAPI_AI_FLAGS; //Alias
  typedef struct struct addrinfo {
    WINAPI_AI_FLAGS ai_flags,
    WINAPI_AddressFamily ai_family,
    WINAPI_SocketType ai_socktype,
    WINAPI_SocketProtocol ai_protocol,
    size_t ai_addrlen,
    char* ai_canonname,
    struct sockaddr* ai_addr,
    LPVOID ai_next,
  } struct addrinfo;
  typedef struct addrinfo *WINAPI_struct addrinfo*; //Pointer
  typedef struct ADDRINFOW {
    WINAPI_AI_FLAGS ai_flags,
    WINAPI_AddressFamily ai_family,
    WINAPI_SocketType ai_socktype,
    WINAPI_SocketProtocol ai_protocol,
    size_t ai_addrlen,
    PWSTR ai_canonname,
    struct sockaddr* ai_addr,
    LPVOID ai_next,
  } ADDRINFOW;
  typedef ADDRINFOW *WINAPI_ADDRINFOW*; //Pointer
  typedef ADDRINFOW *PADDRINFOW; //Pointer
  typedef struct ADDRINFOEX {
    WINAPI_AI_FLAGS ai_flags,
    WINAPI_AddressFamily ai_family,
    WINAPI_SocketType ai_socktype,
    WINAPI_SocketProtocol ai_protocol,
    size_t ai_addrlen,
    PCTSTR ai_canonname,
    struct sockaddr* ai_addr,
    void* ai_blob,
    size_t ai_bloblen,
    LPGUID ai_provider,
    LPVOID ai_next,
  } ADDRINFOEX;
  typedef ADDRINFOEX *PADDRINFOEX; //Pointer
  typedef ADDRINFOEX *WINAPI_ADDRINFOEX*; //Pointer
  typedef enum SOCKET {
    INVALID_SOCKET = WINAPI__1,
  } SOCKET;
  typedef SOCKET SOCKET [FD_SETSIZE]; //Array 64
  typedef struct fd_set {
    u_int fd_count,
    SOCKET [FD_SETSIZE] fd_array,
  } fd_set;
  typedef struct WSAPROTOCOLCHAIN {
    int ChainLen,
    DWORD [MAX_PROTOCOL_CHAIN] ChainEntries,
  } WSAPROTOCOLCHAIN;
  typedef DWORD WINAPI_WSA_PROVIDER_FLAGS; //Alias
  typedef DWORD WINAPI_WSA_SERVICE_FLAGS_1; //Alias
  typedef enum WINAPI_NetworkByteOrder {
    BIGENDIAN = 0x0000,
    LITTLEENDIAN = 0x0001,
  } WINAPI_NetworkByteOrder;
  typedef enum WINAPI_SecurityScheme {
    SECURITY_PROTOCOL_NONE = 0x0000,
  } WINAPI_SecurityScheme;
  typedef struct WSAPROTOCOL_INFO {
    WINAPI_WSA_SERVICE_FLAGS_1 dwServiceFlags1,
    DWORD dwServiceFlags2,
    DWORD dwServiceFlags3,
    DWORD dwServiceFlags4,
    WINAPI_WSA_PROVIDER_FLAGS dwProviderFlags,
    GUID ProviderId,
    DWORD dwCatalogEntryId,
    WSAPROTOCOLCHAIN ProtocolChain,
    int iVersion,
    WINAPI_AddressFamily iAddressFamily,
    int iMaxSockAddr,
    int iMinSockAddr,
    WINAPI_SocketType iSocketType,
    WINAPI_SocketProtocol iProtocol,
    int iProtocolMaxOffset,
    WINAPI_NetworkByteOrder iNetworkByteOrder,
    WINAPI_SecurityScheme iSecurityScheme,
    DWORD dwMessageSize,
    DWORD dwProviderReserved,
    TCHAR [WSAPROTOCOL_LEN + 1] szProtocol,
  } WSAPROTOCOL_INFO;
  typedef WSAPROTOCOL_INFO *LPWSAPROTOCOL_INFO; //Pointer
  typedef struct sockaddr SOCKADDR; //Alias
  typedef SOCKADDR *WINAPI_SOCKADDR*; //Pointer
  typedef SOCKADDR *PSOCKADDR; //Pointer
  typedef SOCKADDR *LPSOCKADDR; //Pointer
  typedef union WINAPI_IN6_ADDR_u {
    UCHAR [16] Byte,
    USHORT [8] Word,
  } WINAPI_IN6_ADDR_u;
  typedef struct IN6_ADDR {
    WINAPI_IN6_ADDR_u u,
  } IN6_ADDR;
  typedef IN6_ADDR *WINAPI_IN6_ADDR*; //Pointer
  typedef ULONG WINAPI_FDEvents; //Alias
  typedef struct WSANETWORKEVENTS {
    WINAPI_FDEvents lNetworkEvents,
    int [FD_MAX_EVENTS] iErrorCode,
  } WSANETWORKEVENTS;
  typedef WSANETWORKEVENTS *LPWSANETWORKEVENTS; //Pointer
  typedef struct WINAPI_IN_ADDR_u_s1 {
    UCHAR s_b1,
    UCHAR s_b2,
    UCHAR s_b3,
    UCHAR s_b4,
  } WINAPI_IN_ADDR_u_s1;
  typedef struct WINAPI_IN_ADDR_u_s2 {
    USHORT s_w1,
    USHORT s_w2,
  } WINAPI_IN_ADDR_u_s2;
  typedef union WINAPI_IN_ADDR_u {
    WINAPI_IN_ADDR_u_s1 S_un_b,
    WINAPI_IN_ADDR_u_s2 S_un_w,
    ULONG S_addr,
  } WINAPI_IN_ADDR_u;
  typedef struct IN_ADDR {
    WINAPI_IN_ADDR_u S_un,
  } IN_ADDR;
  typedef IN_ADDR *WINAPI_IN_ADDR*; //Pointer
  typedef IN_ADDR struct in_addr; //Alias
  typedef enum SOCKET_SECURITY_PROTOCOL {
    SOCKET_SECURITY_PROTOCOL_DEFAULT = 0,
    SOCKET_SECURITY_PROTOCOL_IPSEC = 1,
    SOCKET_SECURITY_PROTOCOL_IPSEC2 = 2,
  } SOCKET_SECURITY_PROTOCOL;
  typedef ULONG WINAPI_SocketInfoFlags; //Alias
  typedef struct SOCKET_SECURITY_QUERY_INFO {
    SOCKET_SECURITY_PROTOCOL SecurityProtocol,
    WINAPI_SocketInfoFlags Flags,
    UINT64 PeerApplicationAccessTokenHandle,
    UINT64 PeerMachineAccessTokenHandle,
  } SOCKET_SECURITY_QUERY_INFO;
  typedef ULONG WINAPI_SocketSecurityFlags; //Alias
  typedef struct SOCKET_SECURITY_SETTINGS {
    SOCKET_SECURITY_PROTOCOL SecurityProtocol,
    WINAPI_SocketSecurityFlags SecurityFlags,
  } SOCKET_SECURITY_SETTINGS;
  typedef SOCKET_SECURITY_SETTINGS *WINAPI_SOCKET_SECURITY_SETTINGS*; //Pointer
  typedef struct struct timeval {
    long tv_sec,
    long tv_usec,
  } struct timeval;
  typedef struct timeval *WINAPI_struct timeval*; //Pointer
  typedef struct struct hostent {
    char* h_name,
    char** h_aliases,
    WINAPI_ADDRESS_FAMILY_short h_addrtype,
    short h_length,
    char** h_addr_list,
  } struct hostent;
  typedef struct struct PROTOENT {
    char* p_name,
    char** p_aliases,
    short p_proto,
  } struct PROTOENT;
  typedef struct SOCKET_ADDRESS {
    LPSOCKADDR lpSockaddr,
    INT iSockaddrLength,
  } SOCKET_ADDRESS;
  typedef SOCKET_ADDRESS *PSOCKET_ADDRESS; //Pointer
  typedef PSOCKET_ADDRESS *LPSOCKET_ADDRESS*; //Pointer
  typedef SOCKET_ADDRESS SOCKET_ADDRESS [1]; //Array 1
  typedef struct SOCKET_ADDRESS_LIST {
    INT iAddressCount,
    SOCKET_ADDRESS [1] Address,
  } SOCKET_ADDRESS_LIST;
  typedef SOCKET_ADDRESS_LIST *PSOCKET_ADDRESS_LIST; //Pointer
  typedef struct WSANAMESPACE_INFO {
    GUID NSProviderId,
    DWORD dwNameSpace,
    BOOL fActive,
    DWORD dwVersion,
    LPTSTR lpszIdentifier,
  } WSANAMESPACE_INFO;
  typedef WSANAMESPACE_INFO *LPWSANAMESPACE_INFO; //Pointer
  typedef struct BLOB {
    ULONG cbSize,
    BYTE* pBlobData,
  } BLOB;
  typedef BLOB *LPBLOB; //Pointer
  typedef struct WSANAMESPACE_INFOEX {
    GUID NSProviderId,
    DWORD dwNameSpace,
    BOOL fActive,
    DWORD dwVersion,
    LPTSTR lpszIdentifier,
    BLOB ProviderSpecific,
  } WSANAMESPACE_INFOEX;
  typedef WSANAMESPACE_INFOEX *LPWSANAMESPACE_INFOEX; //Pointer
  typedef struct WSANSCLASSINFO {
    LPTSTR lpszName,
    DWORD dwNameSpace,
    DWORD dwValueType,
    DWORD dwValueSize,
    LPVOID lpValue,
  } WSANSCLASSINFO;
  typedef WSANSCLASSINFO *LPWSANSCLASSINFO; //Pointer
  typedef struct WSASERVICECLASSINFO {
    LPGUID lpServiceClassId,
    LPTSTR lpszServiceClassName,
    DWORD dwCount,
    LPWSANSCLASSINFO lpClassInfos,
  } WSASERVICECLASSINFO;
  typedef WSASERVICECLASSINFO *LPWSASERVICECLASSINFO; //Pointer
  typedef enum WSAECOMPARATOR {
    COMP_EQUAL = 0,
    COMP_NOTLESS = 1,
  } WSAECOMPARATOR;
  typedef struct WSAVERSION {
    DWORD dwVersion,
    WSAECOMPARATOR ecHow,
  } WSAVERSION;
  typedef WSAVERSION *LPWSAVERSION; //Pointer
  typedef struct AFPROTOCOLS {
    INT iAddressFamily,
    INT iProtocol,
  } AFPROTOCOLS;
  typedef AFPROTOCOLS *LPAFPROTOCOLS; //Pointer
  typedef struct CSADDR_INFO {
    SOCKET_ADDRESS LocalAddr,
    SOCKET_ADDRESS RemoteAddr,
    INT iSocketType,
    INT iProtocol,
  } CSADDR_INFO;
  typedef CSADDR_INFO *LPCSADDR_INFO; //Pointer
  typedef struct WSAQUERYSET {
    DWORD dwSize,
    LPTSTR lpszServiceInstanceName,
    LPGUID lpServiceClassId,
    LPWSAVERSION lpVersion,
    LPTSTR lpszComment,
    DWORD dwNameSpace,
    LPGUID lpNSProviderId,
    LPTSTR lpszContext,
    DWORD dwNumberOfProtocols,
    LPAFPROTOCOLS lpafpProtocols,
    LPTSTR lpszQueryString,
    DWORD dwNumberOfCsAddrs,
    LPCSADDR_INFO lpcsaBuffer,
    DWORD dwOutputFlags,
    LPBLOB lpBlob,
  } WSAQUERYSET;
  typedef WSAQUERYSET *LPWSAQUERYSET; //Pointer
  typedef struct WSABUF {
    u_long len,
    WINAPI_LPVOID_char* buf,
  } WSABUF;
  typedef WSABUF *LPWSABUF; //Pointer
  typedef struct WSAMSG {
    LPSOCKADDR name,
    INT namelen,
    LPWSABUF lpBuffers,
    ULONG dwBufferCount,
    WSABUF Control,
    ULONG dwFlags,
  } WSAMSG;
  typedef WSAMSG *LPWSAMSG; //Pointer
  typedef enum WSAESETSERVICEOP {
    RNRSERVICE_REGISTER = 0,
    RNRSERVICE_DEREGISTER = 1,
    RNRSERVICE_DELETE = 2,
  } WSAESETSERVICEOP;
  typedef enum GROUP {
    SG_UNCONSTRAINED_GROUP = 0x1,
    SG_CONSTRAINED_GROUP = 0x2,
  } GROUP;
  typedef ULONG SERVICETYPE; //Alias
  typedef struct FLOWSPEC {
    ULONG TokenRate,
    ULONG TokenBucketSize,
    ULONG PeakBandwidth,
    ULONG Latency,
    ULONG DelayVariation,
    SERVICETYPE ServiceType,
    ULONG MaxSduSize,
    ULONG MinimumPolicedSize,
  } FLOWSPEC;
  typedef struct QOS {
    FLOWSPEC SendingFlowspec,
    FLOWSPEC ReceivingFlowspec,
    WSABUF ProviderSpecific,
  } QOS;
  typedef QOS *LPQOS; //Pointer
  typedef enum WINAPI_SocketLevel {
    IPPROTO_IP = 0,
    IPPROTO_IPV6 = 41,
    IPPROTO_RM = 113,
    IPPROTO_TCP = 6,
    IPPROTO_UDP = 17,
    NSPROTO_IPX = 1000,
    SOL_SOCKET = 0xffff,
  } WINAPI_SocketLevel;
  typedef DWORD WINAPI_SocketOption; //Alias
  typedef DWORD WINAPI_SendRecvFlags; //Alias
  typedef UINT WINAPI_NI_Flags; //Alias
  typedef enum WINAPI_SocketCode_int {
    SOCKET_ERROR = WINAPI__1,
  } WINAPI_SocketCode_int;
  typedef enum WINAPI_SocketCode_INT {
    SOCKET_ERROR = WINAPI__1,
  } WINAPI_SocketCode_INT;
  typedef DWORD WINAPI_NameSpaceFlags; //Alias
  typedef DWORD WINAPI_ResolutionFlags; //Alias
  typedef DWORD WINAPI_GetService_Props; //Alias
  typedef DWORD WINAPI_SetService_Operation; //Alias
  typedef DWORD WINAPI_SetService_Flags; //Alias
  typedef DWORD WINAPI_SetService_FlagsOut; //Alias
  typedef DWORD WINAPI_TransmitFile_Flags; //Alias
  typedef enum WINAPI_SocketShutdownFlags {
    SD_RECEIVE = 0x00,
    SD_SEND = 0x01,
    SD_BOTH = 0x02,
  } WINAPI_SocketShutdownFlags;
  typedef enum WINAPI_INET_ADDR_OUTPUT {
    INADDR_NONE = 0xffffffff,
  } WINAPI_INET_ADDR_OUTPUT;
  typedef enum WINAPI_Socket_IOCTL {
    FIONREAD = 0x4004667f,
    FIONBIO = 0x8004667e,
    FIOASYNC = 0x8004667d,
    SIOCSHIWAT = 0x80047300,
    SIOCGHIWAT = 0x40047301,
    SIOCSLOWAT = 0x80047302,
    SIOCGLOWAT = 0x40047303,
    SIOCATMARK = 0x40047307,
  } WINAPI_Socket_IOCTL;
]]

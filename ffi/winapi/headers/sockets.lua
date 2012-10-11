require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef OVERLAPPED WSAOVERLAPPED; //Alias
  typedef WSAOVERLAPPED *LPWSAOVERLAPPED; //Pointer
  typedef LPVOID LPWSAOVERLAPPED_COMPLETION_ROUTINE; //Alias
  typedef LPVOID LPLOOKUPSERVICE_COMPLETION_ROUTINE; //Alias
  typedef int socklen_t; //Alias
  typedef LPVOID LPCONDITIONPROC; //Alias
  typedef HANDLE WSAEVENT; //Alias
  typedef unsigned int u_int; //Alias
  enum { FD_MAX_EVENTS = 10 };
  enum { WSAPROTOCOL_LEN_plus_1 = 256 };
  enum { MAX_PROTOCOL_CHAIN = 7 };
  enum { WSADESCRIPTION_LEN_plus_1 = 257 };
  enum { WSASYS_STATUS_LEN_plus_1 = 129 };
]]
if ffi.arch == 'x86' then ffi.cdef[[
  typedef struct WSADATA {
    WORD wVersion;
    WORD wHighVersion;
    char szDescription[WSADESCRIPTION_LEN_plus_1];
    char szSystemStatus[WSASYS_STATUS_LEN_plus_1];
    unsigned short iMaxSockets;
    unsigned short iMaxUdpDg;
    WINAPI_LPVOID_char* lpVendorInfo;
  } WSADATA;
]]
end
ffi.cdef[[
]]
if ffi.arch == 'x86' then ffi.cdef[[
  typedef WSADATA *LPWSADATA; //Pointer
]]
end
ffi.cdef[[
]]
if ffi.arch == 'x86' then ffi.cdef[[
  typedef struct servent {
    char* s_name;
    char** s_aliases;
    short s_port;
    char* s_proto;
  } servent;
]]
end
ffi.cdef[[
]]
if ffi.arch == 'x86' then ffi.cdef[[
]]
end
ffi.cdef[[
]]
if ffi.arch == 'x64' then ffi.cdef[[
  typedef struct WSADATA {
    WORD wVersion;
    WORD wHighVersion;
    unsigned short iMaxSockets;
    unsigned short iMaxUdpDg;
    WINAPI_LPVOID_char* lpVendorInfo;
    char szDescription[WSADESCRIPTION_LEN_plus_1];
    char szSystemStatus[WSASYS_STATUS_LEN_plus_1];
  } WSADATA;
]]
end
ffi.cdef[[
]]
if ffi.arch == 'x64' then ffi.cdef[[
  typedef WSADATA *LPWSADATA; //Pointer
]]
end
ffi.cdef[[
]]
if ffi.arch == 'x64' then ffi.cdef[[
  typedef struct servent {
    char* s_name;
    char** s_aliases;
    char* s_proto;
    short s_port;
  } servent;
]]
end
ffi.cdef[[
]]
if ffi.arch == 'x64' then ffi.cdef[[
]]
end
ffi.cdef[[
  typedef int WINAPI_AddressFamily; //Alias
  static const WINAPI_AddressFamily AF_UNSPEC = 0;
  static const WINAPI_AddressFamily AF_UNIX = 1;
  static const WINAPI_AddressFamily AF_INET = 2;
  static const WINAPI_AddressFamily AF_IMPLINK = 3;
  static const WINAPI_AddressFamily AF_PUP = 4;
  static const WINAPI_AddressFamily AF_CHAOS = 5;
  static const WINAPI_AddressFamily AF_IPX_AF_NS = 6;
  static const WINAPI_AddressFamily AF_ISO_AF_OSI = 7;
  static const WINAPI_AddressFamily AF_ECMA = 8;
  static const WINAPI_AddressFamily AF_DATAKIT = 9;
  static const WINAPI_AddressFamily AF_CCITT = 10;
  static const WINAPI_AddressFamily AF_SNA = 11;
  static const WINAPI_AddressFamily AF_DECnet = 12;
  static const WINAPI_AddressFamily AF_DLI = 13;
  static const WINAPI_AddressFamily AF_LAT = 14;
  static const WINAPI_AddressFamily AF_HYLINK = 15;
  static const WINAPI_AddressFamily AF_APPLETALK = 16;
  static const WINAPI_AddressFamily AF_NETBIOS = 17;
  static const WINAPI_AddressFamily AF_VOICEVIEW = 18;
  static const WINAPI_AddressFamily AF_FIREFOX = 19;
  static const WINAPI_AddressFamily AF_UNKNOWN1 = 20;
  static const WINAPI_AddressFamily AF_BAN = 21;
  static const WINAPI_AddressFamily AF_ATM = 22;
  static const WINAPI_AddressFamily AF_INET6 = 23;
  static const WINAPI_AddressFamily AF_CLUSTER = 24;
  static const WINAPI_AddressFamily AF_12844 = 25;
  static const WINAPI_AddressFamily AF_IRDA = 26;
  static const WINAPI_AddressFamily AF_NETDES = 28;
  static const WINAPI_AddressFamily AF_TCNPROCESS = 29;
  static const WINAPI_AddressFamily AF_TCNMESSAGE = 30;
  static const WINAPI_AddressFamily AF_ICLFXBM = 31;
  static const WINAPI_AddressFamily AF_BTH = 32;
  typedef USHORT ADDRESS_FAMILY; //Alias
  typedef ADDRESS_FAMILY WINAPI_ADDRESS_FAMILY_short; //Alias
  typedef int WINAPI_SocketType; //Alias
  static const WINAPI_SocketType SOCK_STREAM = 1;
  static const WINAPI_SocketType SOCK_DGRAM = 2;
  static const WINAPI_SocketType SOCK_RAW = 3;
  static const WINAPI_SocketType SOCK_RDM = 4;
  static const WINAPI_SocketType SOCK_SEQPACKET = 5;
  typedef int WINAPI_SocketProtocol; //Alias
  static const WINAPI_SocketProtocol IPPROTO_IP = 0;
  static const WINAPI_SocketProtocol IPPROTO_ICMP = 1;
  static const WINAPI_SocketProtocol IPPROTO_IGMP = 2;
  static const WINAPI_SocketProtocol IPPROTO_GGP = 3;
  static const WINAPI_SocketProtocol IPPROTO_IPV4 = 4;
  static const WINAPI_SocketProtocol IPPROTO_ST = 5;
  static const WINAPI_SocketProtocol IPPROTO_TCP = 6;
  static const WINAPI_SocketProtocol IPPROTO_CBT = 7;
  static const WINAPI_SocketProtocol IPPROTO_EGP = 8;
  static const WINAPI_SocketProtocol IPPROTO_IGP = 9;
  static const WINAPI_SocketProtocol IPPROTO_PUP = 12;
  static const WINAPI_SocketProtocol IPPROTO_UDP = 17;
  static const WINAPI_SocketProtocol IPPROTO_IDP = 22;
  static const WINAPI_SocketProtocol IPPROTO_RDP = 27;
  static const WINAPI_SocketProtocol IPPROTO_IPV6 = 41;
  static const WINAPI_SocketProtocol IPPROTO_ROUTING = 43;
  static const WINAPI_SocketProtocol IPPROTO_FRAGMENT = 44;
  static const WINAPI_SocketProtocol IPPROTO_ESP = 50;
  static const WINAPI_SocketProtocol IPPROTO_AH = 51;
  static const WINAPI_SocketProtocol IPPROTO_ICMPV6 = 58;
  static const WINAPI_SocketProtocol IPPROTO_NONE = 59;
  static const WINAPI_SocketProtocol IPPROTO_DSTOPTS = 60;
  static const WINAPI_SocketProtocol IPPROTO_ND = 77;
  static const WINAPI_SocketProtocol IPPROTO_PIM = 103;
  static const WINAPI_SocketProtocol IPPROTO_PGM = 113;
  static const WINAPI_SocketProtocol IPPROTO_L2TP = 115;
  static const WINAPI_SocketProtocol IPPROTO_SCTP = 132;
  static const WINAPI_SocketProtocol IPPROTO_RAW = 255;
  typedef struct struct sockaddr {
    ADDRESS_FAMILY sa_family;
    CHAR sa_data[14];
  } struct sockaddr;
  typedef UINT WINAPI_AI_FLAGS; //Alias
  typedef struct struct addrinfo {
    WINAPI_AI_FLAGS ai_flags;
    WINAPI_AddressFamily ai_family;
    WINAPI_SocketType ai_socktype;
    WINAPI_SocketProtocol ai_protocol;
    size_t ai_addrlen;
    char* ai_canonname;
    struct sockaddr* ai_addr;
    LPVOID ai_next;
  } struct addrinfo;
  typedef struct ADDRINFOW {
    WINAPI_AI_FLAGS ai_flags;
    WINAPI_AddressFamily ai_family;
    WINAPI_SocketType ai_socktype;
    WINAPI_SocketProtocol ai_protocol;
    size_t ai_addrlen;
    PWSTR ai_canonname;
    struct sockaddr* ai_addr;
    LPVOID ai_next;
  } ADDRINFOW;
  typedef ADDRINFOW *PADDRINFOW; //Pointer
  typedef struct ADDRINFOEX {
    WINAPI_AI_FLAGS ai_flags;
    WINAPI_AddressFamily ai_family;
    WINAPI_SocketType ai_socktype;
    WINAPI_SocketProtocol ai_protocol;
    size_t ai_addrlen;
    PCTSTR ai_canonname;
    struct sockaddr* ai_addr;
    void* ai_blob;
    size_t ai_bloblen;
    LPGUID ai_provider;
    LPVOID ai_next;
  } ADDRINFOEX;
  typedef ADDRINFOEX *PADDRINFOEX; //Pointer
  typedef UINT_PTR SOCKET; //Alias
  static const SOCKET INVALID_SOCKET = -1;
  enum { FD_SETSIZE = 64 };
  typedef struct fd_set {
    u_int fd_count;
    SOCKET fd_array[FD_SETSIZE];
  } fd_set;
  typedef struct WSAPROTOCOLCHAIN {
    int ChainLen;
    DWORD ChainEntries[MAX_PROTOCOL_CHAIN];
  } WSAPROTOCOLCHAIN;
  typedef DWORD WINAPI_WSA_PROVIDER_FLAGS; //Alias
  typedef DWORD WINAPI_WSA_SERVICE_FLAGS_1; //Alias
  typedef int WINAPI_NetworkByteOrder; //Alias
  static const WINAPI_NetworkByteOrder BIGENDIAN = 0x0000;
  static const WINAPI_NetworkByteOrder LITTLEENDIAN = 0x0001;
  typedef int WINAPI_SecurityScheme; //Alias
  static const WINAPI_SecurityScheme SECURITY_PROTOCOL_NONE = 0x0000;
  typedef struct WSAPROTOCOL_INFO {
    WINAPI_WSA_SERVICE_FLAGS_1 dwServiceFlags1;
    DWORD dwServiceFlags2;
    DWORD dwServiceFlags3;
    DWORD dwServiceFlags4;
    WINAPI_WSA_PROVIDER_FLAGS dwProviderFlags;
    GUID ProviderId;
    DWORD dwCatalogEntryId;
    WSAPROTOCOLCHAIN ProtocolChain;
    int iVersion;
    WINAPI_AddressFamily iAddressFamily;
    int iMaxSockAddr;
    int iMinSockAddr;
    WINAPI_SocketType iSocketType;
    WINAPI_SocketProtocol iProtocol;
    int iProtocolMaxOffset;
    WINAPI_NetworkByteOrder iNetworkByteOrder;
    WINAPI_SecurityScheme iSecurityScheme;
    DWORD dwMessageSize;
    DWORD dwProviderReserved;
    TCHAR szProtocol[WSAPROTOCOL_LEN_plus_1];
  } WSAPROTOCOL_INFO;
  typedef WSAPROTOCOL_INFO *LPWSAPROTOCOL_INFO; //Pointer
  typedef struct sockaddr SOCKADDR; //Alias
  typedef SOCKADDR *PSOCKADDR; //Pointer
  typedef SOCKADDR *LPSOCKADDR; //Pointer
  typedef union WINAPI_IN6_ADDR_u {
    UCHAR Byte[16];
    USHORT Word[8];
  } WINAPI_IN6_ADDR_u;
  typedef struct IN6_ADDR {
    WINAPI_IN6_ADDR_u u;
  } IN6_ADDR;
  typedef ULONG WINAPI_FDEvents; //Alias
  typedef struct WSANETWORKEVENTS {
    WINAPI_FDEvents lNetworkEvents;
    int iErrorCode[FD_MAX_EVENTS];
  } WSANETWORKEVENTS;
  typedef WSANETWORKEVENTS *LPWSANETWORKEVENTS; //Pointer
  typedef struct WINAPI_IN_ADDR_u_s1 {
    UCHAR s_b1;
    UCHAR s_b2;
    UCHAR s_b3;
    UCHAR s_b4;
  } WINAPI_IN_ADDR_u_s1;
  typedef struct WINAPI_IN_ADDR_u_s2 {
    USHORT s_w1;
    USHORT s_w2;
  } WINAPI_IN_ADDR_u_s2;
  typedef union WINAPI_IN_ADDR_u {
    WINAPI_IN_ADDR_u_s1 S_un_b;
    WINAPI_IN_ADDR_u_s2 S_un_w;
    ULONG S_addr;
  } WINAPI_IN_ADDR_u;
  typedef struct IN_ADDR {
    WINAPI_IN_ADDR_u S_un;
  } IN_ADDR;
  typedef IN_ADDR struct in_addr; //Alias
  typedef UINT SOCKET_SECURITY_PROTOCOL; //Alias
  static const SOCKET_SECURITY_PROTOCOL SOCKET_SECURITY_PROTOCOL_DEFAULT = 0;
  static const SOCKET_SECURITY_PROTOCOL SOCKET_SECURITY_PROTOCOL_IPSEC = 1;
  static const SOCKET_SECURITY_PROTOCOL SOCKET_SECURITY_PROTOCOL_IPSEC2 = 2;
  typedef ULONG WINAPI_SocketInfoFlags; //Alias
  typedef struct SOCKET_SECURITY_QUERY_INFO {
    SOCKET_SECURITY_PROTOCOL SecurityProtocol;
    WINAPI_SocketInfoFlags Flags;
    UINT64 PeerApplicationAccessTokenHandle;
    UINT64 PeerMachineAccessTokenHandle;
  } SOCKET_SECURITY_QUERY_INFO;
  typedef ULONG WINAPI_SocketSecurityFlags; //Alias
  typedef struct SOCKET_SECURITY_SETTINGS {
    SOCKET_SECURITY_PROTOCOL SecurityProtocol;
    WINAPI_SocketSecurityFlags SecurityFlags;
  } SOCKET_SECURITY_SETTINGS;
  typedef struct struct timeval {
    long tv_sec;
    long tv_usec;
  } struct timeval;
  typedef struct struct hostent {
    char* h_name;
    char** h_aliases;
    WINAPI_ADDRESS_FAMILY_short h_addrtype;
    short h_length;
    char** h_addr_list;
  } struct hostent;
  typedef struct struct PROTOENT {
    char* p_name;
    char** p_aliases;
    short p_proto;
  } struct PROTOENT;
  typedef struct SOCKET_ADDRESS {
    LPSOCKADDR lpSockaddr;
    INT iSockaddrLength;
  } SOCKET_ADDRESS;
  typedef SOCKET_ADDRESS *PSOCKET_ADDRESS; //Pointer
  typedef struct SOCKET_ADDRESS_LIST {
    INT iAddressCount;
    SOCKET_ADDRESS Address[1];
  } SOCKET_ADDRESS_LIST;
  typedef SOCKET_ADDRESS_LIST *PSOCKET_ADDRESS_LIST; //Pointer
  typedef struct WSANAMESPACE_INFO {
    GUID NSProviderId;
    DWORD dwNameSpace;
    BOOL fActive;
    DWORD dwVersion;
    LPTSTR lpszIdentifier;
  } WSANAMESPACE_INFO;
  typedef WSANAMESPACE_INFO *LPWSANAMESPACE_INFO; //Pointer
  typedef struct BLOB {
    ULONG cbSize;
    BYTE* pBlobData;
  } BLOB;
  typedef BLOB *LPBLOB; //Pointer
  typedef struct WSANAMESPACE_INFOEX {
    GUID NSProviderId;
    DWORD dwNameSpace;
    BOOL fActive;
    DWORD dwVersion;
    LPTSTR lpszIdentifier;
    BLOB ProviderSpecific;
  } WSANAMESPACE_INFOEX;
  typedef WSANAMESPACE_INFOEX *LPWSANAMESPACE_INFOEX; //Pointer
  typedef struct WSANSCLASSINFO {
    LPTSTR lpszName;
    DWORD dwNameSpace;
    DWORD dwValueType;
    DWORD dwValueSize;
    LPVOID lpValue;
  } WSANSCLASSINFO;
  typedef WSANSCLASSINFO *LPWSANSCLASSINFO; //Pointer
  typedef struct WSASERVICECLASSINFO {
    LPGUID lpServiceClassId;
    LPTSTR lpszServiceClassName;
    DWORD dwCount;
    LPWSANSCLASSINFO lpClassInfos;
  } WSASERVICECLASSINFO;
  typedef WSASERVICECLASSINFO *LPWSASERVICECLASSINFO; //Pointer
  typedef UINT WSAECOMPARATOR; //Alias
  static const WSAECOMPARATOR COMP_EQUAL = 0;
  static const WSAECOMPARATOR COMP_NOTLESS = 1;
  typedef struct WSAVERSION {
    DWORD dwVersion;
    WSAECOMPARATOR ecHow;
  } WSAVERSION;
  typedef WSAVERSION *LPWSAVERSION; //Pointer
  typedef struct AFPROTOCOLS {
    INT iAddressFamily;
    INT iProtocol;
  } AFPROTOCOLS;
  typedef AFPROTOCOLS *LPAFPROTOCOLS; //Pointer
  typedef struct CSADDR_INFO {
    SOCKET_ADDRESS LocalAddr;
    SOCKET_ADDRESS RemoteAddr;
    INT iSocketType;
    INT iProtocol;
  } CSADDR_INFO;
  typedef CSADDR_INFO *LPCSADDR_INFO; //Pointer
  typedef struct WSAQUERYSET {
    DWORD dwSize;
    LPTSTR lpszServiceInstanceName;
    LPGUID lpServiceClassId;
    LPWSAVERSION lpVersion;
    LPTSTR lpszComment;
    DWORD dwNameSpace;
    LPGUID lpNSProviderId;
    LPTSTR lpszContext;
    DWORD dwNumberOfProtocols;
    LPAFPROTOCOLS lpafpProtocols;
    LPTSTR lpszQueryString;
    DWORD dwNumberOfCsAddrs;
    LPCSADDR_INFO lpcsaBuffer;
    DWORD dwOutputFlags;
    LPBLOB lpBlob;
  } WSAQUERYSET;
  typedef WSAQUERYSET *LPWSAQUERYSET; //Pointer
  typedef struct WSABUF {
    u_long len;
    WINAPI_LPVOID_char* buf;
  } WSABUF;
  typedef WSABUF *LPWSABUF; //Pointer
  typedef struct WSAMSG {
    LPSOCKADDR name;
    INT namelen;
    LPWSABUF lpBuffers;
    ULONG dwBufferCount;
    WSABUF Control;
    ULONG dwFlags;
  } WSAMSG;
  typedef WSAMSG *LPWSAMSG; //Pointer
  typedef UINT WSAESETSERVICEOP; //Alias
  static const WSAESETSERVICEOP RNRSERVICE_REGISTER = 0;
  static const WSAESETSERVICEOP RNRSERVICE_DEREGISTER = 1;
  static const WSAESETSERVICEOP RNRSERVICE_DELETE = 2;
  typedef unsigned int GROUP; //Alias
  static const GROUP SG_UNCONSTRAINED_GROUP = 0x1;
  static const GROUP SG_CONSTRAINED_GROUP = 0x2;
  typedef ULONG SERVICETYPE; //Alias
  typedef struct FLOWSPEC {
    ULONG TokenRate;
    ULONG TokenBucketSize;
    ULONG PeakBandwidth;
    ULONG Latency;
    ULONG DelayVariation;
    SERVICETYPE ServiceType;
    ULONG MaxSduSize;
    ULONG MinimumPolicedSize;
  } FLOWSPEC;
  typedef struct QOS {
    FLOWSPEC SendingFlowspec;
    FLOWSPEC ReceivingFlowspec;
    WSABUF ProviderSpecific;
  } QOS;
  typedef QOS *LPQOS; //Pointer
  typedef int WINAPI_SocketLevel; //Alias
  static const WINAPI_SocketLevel IPPROTO_RM = 113;
  static const WINAPI_SocketLevel NSPROTO_IPX = 1000;
  static const WINAPI_SocketLevel SOL_SOCKET = 0xffff;
  typedef DWORD WINAPI_SocketOption; //Alias
  typedef DWORD WINAPI_SendRecvFlags; //Alias
  typedef UINT WINAPI_NI_Flags; //Alias
  typedef int WINAPI_SocketCode_int; //Alias
  static const WINAPI_SocketCode_int SOCKET_ERROR = -1;
  typedef int WINAPI_SocketCode_INT; //Alias
  typedef DWORD WINAPI_NameSpaceFlags; //Alias
  typedef DWORD WINAPI_ResolutionFlags; //Alias
  typedef DWORD WINAPI_GetService_Props; //Alias
  typedef DWORD WINAPI_SetService_Operation; //Alias
  typedef DWORD WINAPI_SetService_Flags; //Alias
  typedef DWORD WINAPI_SetService_FlagsOut; //Alias
  typedef DWORD WINAPI_TransmitFile_Flags; //Alias
  typedef int WINAPI_SocketShutdownFlags; //Alias
  static const WINAPI_SocketShutdownFlags SD_RECEIVE = 0x00;
  static const WINAPI_SocketShutdownFlags SD_SEND = 0x01;
  static const WINAPI_SocketShutdownFlags SD_BOTH = 0x02;
  typedef unsigned long WINAPI_INET_ADDR_OUTPUT; //Alias
  static const WINAPI_INET_ADDR_OUTPUT INADDR_NONE = 0xffffffff;
  typedef long WINAPI_Socket_IOCTL; //Alias
  static const WINAPI_Socket_IOCTL FIONREAD = 0x4004667f;
  static const WINAPI_Socket_IOCTL FIONBIO = 0x8004667e;
  static const WINAPI_Socket_IOCTL FIOASYNC = 0x8004667d;
  static const WINAPI_Socket_IOCTL SIOCSHIWAT = 0x80047300;
  static const WINAPI_Socket_IOCTL SIOCGHIWAT = 0x40047301;
  static const WINAPI_Socket_IOCTL SIOCSLOWAT = 0x80047302;
  static const WINAPI_Socket_IOCTL SIOCGLOWAT = 0x40047303;
  static const WINAPI_Socket_IOCTL SIOCATMARK = 0x40047307;
]]

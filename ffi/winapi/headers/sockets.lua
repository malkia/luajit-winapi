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
    char szDescription_WSADESCRIPTION_LEN_plus_1_;
    char szSystemStatus_WSASYS_STATUS_LEN_plus_1_;
    unsigned short iMaxSockets;
    unsigned short iMaxUdpDg;
    LPVOID_char* lpVendorInfo;
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
    LPVOID_char* lpVendorInfo;
    char szDescription_WSADESCRIPTION_LEN_plus_1_;
    char szSystemStatus_WSASYS_STATUS_LEN_plus_1_;
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
  typedef int AddressFamily; //Alias
  static const AddressFamily AF_UNSPEC = 0;
  static const AddressFamily AF_UNIX = 1;
  static const AddressFamily AF_INET = 2;
  static const AddressFamily AF_IMPLINK = 3;
  static const AddressFamily AF_PUP = 4;
  static const AddressFamily AF_CHAOS = 5;
  static const AddressFamily AF_IPX_AF_NS = 6;
  static const AddressFamily AF_ISO_AF_OSI = 7;
  static const AddressFamily AF_ECMA = 8;
  static const AddressFamily AF_DATAKIT = 9;
  static const AddressFamily AF_CCITT = 10;
  static const AddressFamily AF_SNA = 11;
  static const AddressFamily AF_DECnet = 12;
  static const AddressFamily AF_DLI = 13;
  static const AddressFamily AF_LAT = 14;
  static const AddressFamily AF_HYLINK = 15;
  static const AddressFamily AF_APPLETALK = 16;
  static const AddressFamily AF_NETBIOS = 17;
  static const AddressFamily AF_VOICEVIEW = 18;
  static const AddressFamily AF_FIREFOX = 19;
  static const AddressFamily AF_UNKNOWN1 = 20;
  static const AddressFamily AF_BAN = 21;
  static const AddressFamily AF_ATM = 22;
  static const AddressFamily AF_INET6 = 23;
  static const AddressFamily AF_CLUSTER = 24;
  static const AddressFamily AF_12844 = 25;
  static const AddressFamily AF_IRDA = 26;
  static const AddressFamily AF_NETDES = 28;
  static const AddressFamily AF_TCNPROCESS = 29;
  static const AddressFamily AF_TCNMESSAGE = 30;
  static const AddressFamily AF_ICLFXBM = 31;
  static const AddressFamily AF_BTH = 32;
  typedef USHORT ADDRESS_FAMILY; //Alias
  typedef ADDRESS_FAMILY ADDRESS_FAMILY_short; //Alias
  typedef int SocketType; //Alias
  static const SocketType SOCK_STREAM = 1;
  static const SocketType SOCK_DGRAM = 2;
  static const SocketType SOCK_RAW = 3;
  static const SocketType SOCK_RDM = 4;
  static const SocketType SOCK_SEQPACKET = 5;
  typedef int SocketProtocol; //Alias
  static const SocketProtocol IPPROTO_IP = 0;
  static const SocketProtocol IPPROTO_ICMP = 1;
  static const SocketProtocol IPPROTO_IGMP = 2;
  static const SocketProtocol IPPROTO_GGP = 3;
  static const SocketProtocol IPPROTO_IPV4 = 4;
  static const SocketProtocol IPPROTO_ST = 5;
  static const SocketProtocol IPPROTO_TCP = 6;
  static const SocketProtocol IPPROTO_CBT = 7;
  static const SocketProtocol IPPROTO_EGP = 8;
  static const SocketProtocol IPPROTO_IGP = 9;
  static const SocketProtocol IPPROTO_PUP = 12;
  static const SocketProtocol IPPROTO_UDP = 17;
  static const SocketProtocol IPPROTO_IDP = 22;
  static const SocketProtocol IPPROTO_RDP = 27;
  static const SocketProtocol IPPROTO_IPV6 = 41;
  static const SocketProtocol IPPROTO_ROUTING = 43;
  static const SocketProtocol IPPROTO_FRAGMENT = 44;
  static const SocketProtocol IPPROTO_ESP = 50;
  static const SocketProtocol IPPROTO_AH = 51;
  static const SocketProtocol IPPROTO_ICMPV6 = 58;
  static const SocketProtocol IPPROTO_NONE = 59;
  static const SocketProtocol IPPROTO_DSTOPTS = 60;
  static const SocketProtocol IPPROTO_ND = 77;
  static const SocketProtocol IPPROTO_PIM = 103;
  static const SocketProtocol IPPROTO_PGM = 113;
  static const SocketProtocol IPPROTO_L2TP = 115;
  static const SocketProtocol IPPROTO_SCTP = 132;
  static const SocketProtocol IPPROTO_RAW = 255;
  typedef struct struct sockaddr {
    ADDRESS_FAMILY sa_family;
    CHAR sa_data_14_;
  } struct sockaddr;
  typedef UINT AI_FLAGS; //Alias
  typedef struct struct addrinfo {
    AI_FLAGS ai_flags;
    AddressFamily ai_family;
    SocketType ai_socktype;
    SocketProtocol ai_protocol;
    size_t ai_addrlen;
    char* ai_canonname;
    struct sockaddr* ai_addr;
    LPVOID ai_next;
  } struct addrinfo;
  typedef struct ADDRINFOW {
    AI_FLAGS ai_flags;
    AddressFamily ai_family;
    SocketType ai_socktype;
    SocketProtocol ai_protocol;
    size_t ai_addrlen;
    PWSTR ai_canonname;
    struct sockaddr* ai_addr;
    LPVOID ai_next;
  } ADDRINFOW;
  typedef ADDRINFOW *PADDRINFOW; //Pointer
  typedef struct ADDRINFOEX {
    AI_FLAGS ai_flags;
    AddressFamily ai_family;
    SocketType ai_socktype;
    SocketProtocol ai_protocol;
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
    SOCKET fd_array_FD_SETSIZE_;
  } fd_set;
  typedef struct WSAPROTOCOLCHAIN {
    int ChainLen;
    DWORD ChainEntries_MAX_PROTOCOL_CHAIN_;
  } WSAPROTOCOLCHAIN;
  typedef DWORD WSA_PROVIDER_FLAGS; //Alias
  typedef DWORD WSA_SERVICE_FLAGS_1; //Alias
  typedef int NetworkByteOrder; //Alias
  static const NetworkByteOrder BIGENDIAN = 0x0000;
  static const NetworkByteOrder LITTLEENDIAN = 0x0001;
  typedef int SecurityScheme; //Alias
  static const SecurityScheme SECURITY_PROTOCOL_NONE = 0x0000;
  typedef struct WSAPROTOCOL_INFO {
    WSA_SERVICE_FLAGS_1 dwServiceFlags1;
    DWORD dwServiceFlags2;
    DWORD dwServiceFlags3;
    DWORD dwServiceFlags4;
    WSA_PROVIDER_FLAGS dwProviderFlags;
    GUID ProviderId;
    DWORD dwCatalogEntryId;
    WSAPROTOCOLCHAIN ProtocolChain;
    int iVersion;
    AddressFamily iAddressFamily;
    int iMaxSockAddr;
    int iMinSockAddr;
    SocketType iSocketType;
    SocketProtocol iProtocol;
    int iProtocolMaxOffset;
    NetworkByteOrder iNetworkByteOrder;
    SecurityScheme iSecurityScheme;
    DWORD dwMessageSize;
    DWORD dwProviderReserved;
    TCHAR szProtocol_WSAPROTOCOL_LEN_plus_1_;
  } WSAPROTOCOL_INFO;
  typedef WSAPROTOCOL_INFO *LPWSAPROTOCOL_INFO; //Pointer
  typedef struct sockaddr SOCKADDR; //Alias
  typedef SOCKADDR *PSOCKADDR; //Pointer
  typedef SOCKADDR *LPSOCKADDR; //Pointer
  typedef union IN6_ADDR_u {
    UCHAR Byte_16_;
    USHORT Word_8_;
  } IN6_ADDR_u;
  typedef struct IN6_ADDR {
    IN6_ADDR_u u;
  } IN6_ADDR;
  typedef ULONG FDEvents; //Alias
  typedef struct WSANETWORKEVENTS {
    FDEvents lNetworkEvents;
    int iErrorCode_FD_MAX_EVENTS_;
  } WSANETWORKEVENTS;
  typedef WSANETWORKEVENTS *LPWSANETWORKEVENTS; //Pointer
  typedef struct IN_ADDR_u_s1 {
    UCHAR s_b1;
    UCHAR s_b2;
    UCHAR s_b3;
    UCHAR s_b4;
  } IN_ADDR_u_s1;
  typedef struct IN_ADDR_u_s2 {
    USHORT s_w1;
    USHORT s_w2;
  } IN_ADDR_u_s2;
  typedef union IN_ADDR_u {
    IN_ADDR_u_s1 S_un_b;
    IN_ADDR_u_s2 S_un_w;
    ULONG S_addr;
  } IN_ADDR_u;
  typedef struct IN_ADDR {
    IN_ADDR_u S_un;
  } IN_ADDR;
  typedef IN_ADDR struct in_addr; //Alias
  typedef UINT SOCKET_SECURITY_PROTOCOL; //Alias
  static const SOCKET_SECURITY_PROTOCOL SOCKET_SECURITY_PROTOCOL_DEFAULT = 0;
  static const SOCKET_SECURITY_PROTOCOL SOCKET_SECURITY_PROTOCOL_IPSEC = 1;
  static const SOCKET_SECURITY_PROTOCOL SOCKET_SECURITY_PROTOCOL_IPSEC2 = 2;
  typedef ULONG SocketInfoFlags; //Alias
  typedef struct SOCKET_SECURITY_QUERY_INFO {
    SOCKET_SECURITY_PROTOCOL SecurityProtocol;
    SocketInfoFlags Flags;
    UINT64 PeerApplicationAccessTokenHandle;
    UINT64 PeerMachineAccessTokenHandle;
  } SOCKET_SECURITY_QUERY_INFO;
  typedef ULONG SocketSecurityFlags; //Alias
  typedef struct SOCKET_SECURITY_SETTINGS {
    SOCKET_SECURITY_PROTOCOL SecurityProtocol;
    SocketSecurityFlags SecurityFlags;
  } SOCKET_SECURITY_SETTINGS;
  typedef struct struct timeval {
    long tv_sec;
    long tv_usec;
  } struct timeval;
  typedef struct struct hostent {
    char* h_name;
    char** h_aliases;
    ADDRESS_FAMILY_short h_addrtype;
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
    SOCKET_ADDRESS Address_1_;
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
    LPVOID_char* buf;
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
  typedef int SocketLevel; //Alias
  static const SocketLevel IPPROTO_RM = 113;
  static const SocketLevel NSPROTO_IPX = 1000;
  static const SocketLevel SOL_SOCKET = 0xffff;
  typedef DWORD SocketOption; //Alias
  typedef DWORD SendRecvFlags; //Alias
  typedef UINT NI_Flags; //Alias
  typedef int SocketCode_int; //Alias
  static const SocketCode_int SOCKET_ERROR = -1;
  typedef int SocketCode_INT; //Alias
  typedef DWORD NameSpaceFlags; //Alias
  typedef DWORD ResolutionFlags; //Alias
  typedef DWORD GetService_Props; //Alias
  typedef DWORD SetService_Operation; //Alias
  typedef DWORD SetService_Flags; //Alias
  typedef DWORD SetService_FlagsOut; //Alias
  typedef DWORD TransmitFile_Flags; //Alias
  typedef int SocketShutdownFlags; //Alias
  static const SocketShutdownFlags SD_RECEIVE = 0x00;
  static const SocketShutdownFlags SD_SEND = 0x01;
  static const SocketShutdownFlags SD_BOTH = 0x02;
  typedef unsigned long INET_ADDR_OUTPUT; //Alias
  static const INET_ADDR_OUTPUT INADDR_NONE = 0xffffffff;
  typedef long Socket_IOCTL; //Alias
  static const Socket_IOCTL FIONREAD = 0x4004667f;
  static const Socket_IOCTL FIONBIO = 0x8004667e;
  static const Socket_IOCTL FIOASYNC = 0x8004667d;
  static const Socket_IOCTL SIOCSHIWAT = 0x80047300;
  static const Socket_IOCTL SIOCGHIWAT = 0x40047301;
  static const Socket_IOCTL SIOCSLOWAT = 0x80047302;
  static const Socket_IOCTL SIOCGLOWAT = 0x40047303;
  static const Socket_IOCTL SIOCATMARK = 0x40047307;
]]

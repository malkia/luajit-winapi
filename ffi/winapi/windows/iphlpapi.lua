require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ip' )
require( 'ffi/winapi/headers/sockets' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PIP_ADAPTER_ADDRESSES; //Alias
  typedef ULONG NET_IFINDEX; //Alias
  typedef NET_IFINDEX *PNET_IFINDEX; //Pointer
  typedef NET_IFINDEX IF_INDEX; //Alias
  typedef ULONG IPMask; //Alias
  typedef LPVOID PTEREDO_PORT_CHANGE_CALLBACK; //Alias
  typedef LPVOID PUNICAST_IPADDRESS_CHANGE_CALLBACK; //Alias
  typedef LPVOID PIPFORWARD_CHANGE_CALLBACK; //Alias
  typedef LPVOID PIPINTERFACE_CHANGE_CALLBACK; //Alias
  typedef LPVOID PSTABLE_UNICAST_IPADDRESS_TABLE_CALLBACK; //Alias
  typedef GUID NET_IF_NETWORK_GUID; //Alias
  typedef ERROR_CODE NETIO_STATUS; //Alias
  typedef NETIO_STATUS NETIOAPI_API; //Alias
  enum { MAX_ADAPTER_ADDRESS_LENGTH = 8 };
  enum { MAX_HOSTNAME_LEN_plus_4 = 132 };
  enum { MAX_DOMAIN_NAME_LEN_plus_4 = 132 };
  enum { MAX_SCOPE_ID_LEN_plus_4 = 260 };
  enum { MAX_ADAPTER_NAME_LENGTH_plus_4 = 260 };
  enum { MAX_ADAPTER_DESCRIPTION_LENGTH_plus_4 = 132 };
  enum { MAX_ADAPTER_NAME = 128 };
  enum { IF_MAX_STRING_SIZE_plus_1 = 257 };
  enum { DNS_MAX_NAME_BUFFER_LENGTH = 256 };
  enum { MAX_INTERFACE_NAME_LEN = 256 };
  enum { TCPIP_OWNING_MODULE_SIZE = 16 };
  enum { MAXLEN_PHYSADDR = 8 };
  enum { MAXLEN_IFDESCR = 256 };
  enum { IF_MAX_PHYS_ADDRESS_LENGTH = 32 };
  enum { ScopeLevelCount = 16 };
  typedef ULONG IFTYPE; //Alias
  static const IFTYPE IF_TYPE_OTHER = 1;
  static const IFTYPE IF_TYPE_REGULAR_1822 = 2;
  static const IFTYPE IF_TYPE_HDH_1822 = 3;
  static const IFTYPE IF_TYPE_DDN_X25 = 4;
  static const IFTYPE IF_TYPE_RFC877_X25 = 5;
  static const IFTYPE IF_TYPE_ETHERNET_CSMACD = 6;
  static const IFTYPE IF_TYPE_IS088023_CSMACD = 7;
  static const IFTYPE IF_TYPE_ISO88024_TOKENBUS = 8;
  static const IFTYPE IF_TYPE_ISO88025_TOKENRING = 9;
  static const IFTYPE IF_TYPE_ISO88026_MAN = 10;
  static const IFTYPE IF_TYPE_STARLAN = 11;
  static const IFTYPE IF_TYPE_PROTEON_10MBIT = 12;
  static const IFTYPE IF_TYPE_PROTEON_80MBIT = 13;
  static const IFTYPE IF_TYPE_HYPERCHANNEL = 14;
  static const IFTYPE IF_TYPE_FDDI = 15;
  static const IFTYPE IF_TYPE_LAP_B = 16;
  static const IFTYPE IF_TYPE_SDLC = 17;
  static const IFTYPE IF_TYPE_DS1 = 18;
  static const IFTYPE IF_TYPE_E1 = 19;
  static const IFTYPE IF_TYPE_BASIC_ISDN = 20;
  static const IFTYPE IF_TYPE_PRIMARY_ISDN = 21;
  static const IFTYPE IF_TYPE_PROP_POINT2POINT_SERIAL = 22;
  static const IFTYPE IF_TYPE_PPP = 23;
  static const IFTYPE IF_TYPE_SOFTWARE_LOOPBACK = 24;
  static const IFTYPE IF_TYPE_EON = 25;
  static const IFTYPE IF_TYPE_ETHERNET_3MBIT = 26;
  static const IFTYPE IF_TYPE_NSIP = 27;
  static const IFTYPE IF_TYPE_SLIP = 28;
  static const IFTYPE IF_TYPE_ULTRA = 29;
  static const IFTYPE IF_TYPE_DS3 = 30;
  static const IFTYPE IF_TYPE_SIP = 31;
  static const IFTYPE IF_TYPE_FRAMERELAY = 32;
  static const IFTYPE IF_TYPE_RS232 = 33;
  static const IFTYPE IF_TYPE_PARA = 34;
  static const IFTYPE IF_TYPE_ARCNET = 35;
  static const IFTYPE IF_TYPE_ARCNET_PLUS = 36;
  static const IFTYPE IF_TYPE_ATM = 37;
  static const IFTYPE IF_TYPE_MIO_X25 = 38;
  static const IFTYPE IF_TYPE_SONET = 39;
  static const IFTYPE IF_TYPE_X25_PLE = 40;
  static const IFTYPE IF_TYPE_ISO88022_LLC = 41;
  static const IFTYPE IF_TYPE_LOCALTALK = 42;
  static const IFTYPE IF_TYPE_SMDS_DXI = 43;
  static const IFTYPE IF_TYPE_FRAMERELAY_SERVICE = 44;
  static const IFTYPE IF_TYPE_V35 = 45;
  static const IFTYPE IF_TYPE_HSSI = 46;
  static const IFTYPE IF_TYPE_HIPPI = 47;
  static const IFTYPE IF_TYPE_MODEM = 48;
  static const IFTYPE IF_TYPE_AAL5 = 49;
  static const IFTYPE IF_TYPE_SONET_PATH = 50;
  static const IFTYPE IF_TYPE_SONET_VT = 51;
  static const IFTYPE IF_TYPE_SMDS_ICIP = 52;
  static const IFTYPE IF_TYPE_PROP_VIRTUAL = 53;
  static const IFTYPE IF_TYPE_PROP_MULTIPLEXOR = 54;
  static const IFTYPE IF_TYPE_IEEE80212 = 55;
  static const IFTYPE IF_TYPE_FIBRECHANNEL = 56;
  static const IFTYPE IF_TYPE_HIPPIINTERFACE = 57;
  static const IFTYPE IF_TYPE_FRAMERELAY_INTERCONNECT = 58;
  static const IFTYPE IF_TYPE_AFLANE_8023 = 59;
  static const IFTYPE IF_TYPE_AFLANE_8025 = 60;
  static const IFTYPE IF_TYPE_CCTEMUL = 61;
  static const IFTYPE IF_TYPE_FASTETHER = 62;
  static const IFTYPE IF_TYPE_ISDN = 63;
  static const IFTYPE IF_TYPE_V11 = 64;
  static const IFTYPE IF_TYPE_V36 = 65;
  static const IFTYPE IF_TYPE_G703_64K = 66;
  static const IFTYPE IF_TYPE_G703_2MB = 67;
  static const IFTYPE IF_TYPE_QLLC = 68;
  static const IFTYPE IF_TYPE_FASTETHER_FX = 69;
  static const IFTYPE IF_TYPE_CHANNEL = 70;
  static const IFTYPE IF_TYPE_IEEE80211 = 71;
  static const IFTYPE IF_TYPE_IBM370PARCHAN = 72;
  static const IFTYPE IF_TYPE_ESCON = 73;
  static const IFTYPE IF_TYPE_DLSW = 74;
  static const IFTYPE IF_TYPE_ISDN_S = 75;
  static const IFTYPE IF_TYPE_ISDN_U = 76;
  static const IFTYPE IF_TYPE_LAP_D = 77;
  static const IFTYPE IF_TYPE_IPSWITCH = 78;
  static const IFTYPE IF_TYPE_RSRB = 79;
  static const IFTYPE IF_TYPE_ATM_LOGICAL = 80;
  static const IFTYPE IF_TYPE_DS0 = 81;
  static const IFTYPE IF_TYPE_DS0_BUNDLE = 82;
  static const IFTYPE IF_TYPE_BSC = 83;
  static const IFTYPE IF_TYPE_ASYNC = 84;
  static const IFTYPE IF_TYPE_CNR = 85;
  static const IFTYPE IF_TYPE_ISO88025R_DTR = 86;
  static const IFTYPE IF_TYPE_EPLRS = 87;
  static const IFTYPE IF_TYPE_ARAP = 88;
  static const IFTYPE IF_TYPE_PROP_CNLS = 89;
  static const IFTYPE IF_TYPE_HOSTPAD = 90;
  static const IFTYPE IF_TYPE_TERMPAD = 91;
  static const IFTYPE IF_TYPE_FRAMERELAY_MPI = 92;
  static const IFTYPE IF_TYPE_X213 = 93;
  static const IFTYPE IF_TYPE_ADSL = 94;
  static const IFTYPE IF_TYPE_RADSL = 95;
  static const IFTYPE IF_TYPE_SDSL = 96;
  static const IFTYPE IF_TYPE_VDSL = 97;
  static const IFTYPE IF_TYPE_ISO88025_CRFPRINT = 98;
  static const IFTYPE IF_TYPE_MYRINET = 99;
  static const IFTYPE IF_TYPE_VOICE_EM = 100;
  static const IFTYPE IF_TYPE_VOICE_FXO = 101;
  static const IFTYPE IF_TYPE_VOICE_FXS = 102;
  static const IFTYPE IF_TYPE_VOICE_ENCAP = 103;
  static const IFTYPE IF_TYPE_VOICE_OVERIP = 104;
  static const IFTYPE IF_TYPE_ATM_DXI = 105;
  static const IFTYPE IF_TYPE_ATM_FUNI = 106;
  static const IFTYPE IF_TYPE_ATM_IMA = 107;
  static const IFTYPE IF_TYPE_PPPMULTILINKBUNDLE = 108;
  static const IFTYPE IF_TYPE_IPOVER_CDLC = 109;
  static const IFTYPE IF_TYPE_IPOVER_CLAW = 110;
  static const IFTYPE IF_TYPE_STACKTOSTACK = 111;
  static const IFTYPE IF_TYPE_VIRTUALIPADDRESS = 112;
  static const IFTYPE IF_TYPE_MPC = 113;
  static const IFTYPE IF_TYPE_IPOVER_ATM = 114;
  static const IFTYPE IF_TYPE_ISO88025_FIBER = 115;
  static const IFTYPE IF_TYPE_TDLC = 116;
  static const IFTYPE IF_TYPE_GIGABITETHERNET = 117;
  static const IFTYPE IF_TYPE_HDLC = 118;
  static const IFTYPE IF_TYPE_LAP_F = 119;
  static const IFTYPE IF_TYPE_V37 = 120;
  static const IFTYPE IF_TYPE_X25_MLP = 121;
  static const IFTYPE IF_TYPE_X25_HUNTGROUP = 122;
  static const IFTYPE IF_TYPE_TRANSPHDLC = 123;
  static const IFTYPE IF_TYPE_INTERLEAVE = 124;
  static const IFTYPE IF_TYPE_FAST = 125;
  static const IFTYPE IF_TYPE_IP = 126;
  static const IFTYPE IF_TYPE_DOCSCABLE_MACLAYER = 127;
  static const IFTYPE IF_TYPE_DOCSCABLE_DOWNSTREAM = 128;
  static const IFTYPE IF_TYPE_DOCSCABLE_UPSTREAM = 129;
  static const IFTYPE IF_TYPE_A12MPPSWITCH = 130;
  static const IFTYPE IF_TYPE_TUNNEL = 131;
  static const IFTYPE IF_TYPE_COFFEE = 132;
  static const IFTYPE IF_TYPE_CES = 133;
  static const IFTYPE IF_TYPE_ATM_SUBINTERFACE = 134;
  static const IFTYPE IF_TYPE_L2_VLAN = 135;
  static const IFTYPE IF_TYPE_L3_IPVLAN = 136;
  static const IFTYPE IF_TYPE_L3_IPXVLAN = 137;
  static const IFTYPE IF_TYPE_DIGITALPOWERLINE = 138;
  static const IFTYPE IF_TYPE_MEDIAMAILOVERIP = 139;
  static const IFTYPE IF_TYPE_DTM = 140;
  static const IFTYPE IF_TYPE_DCN = 141;
  static const IFTYPE IF_TYPE_IPFORWARD = 142;
  static const IFTYPE IF_TYPE_MSDSL = 143;
  static const IFTYPE IF_TYPE_IEEE1394 = 144;
  static const IFTYPE IF_TYPE_IF_GSN = 145;
  static const IFTYPE IF_TYPE_DVBRCC_MACLAYER = 146;
  static const IFTYPE IF_TYPE_DVBRCC_DOWNSTREAM = 147;
  static const IFTYPE IF_TYPE_DVBRCC_UPSTREAM = 148;
  static const IFTYPE IF_TYPE_ATM_VIRTUAL = 149;
  static const IFTYPE IF_TYPE_MPLS_TUNNEL = 150;
  static const IFTYPE IF_TYPE_SRP = 151;
  static const IFTYPE IF_TYPE_VOICEOVERATM = 152;
  static const IFTYPE IF_TYPE_VOICEOVERFRAMERELAY = 153;
  static const IFTYPE IF_TYPE_IDSL = 154;
  static const IFTYPE IF_TYPE_COMPOSITELINK = 155;
  static const IFTYPE IF_TYPE_SS7_SIGLINK = 156;
  static const IFTYPE IF_TYPE_PROP_WIRELESS_P2P = 157;
  static const IFTYPE IF_TYPE_FR_FORWARD = 158;
  static const IFTYPE IF_TYPE_RFC1483 = 159;
  static const IFTYPE IF_TYPE_USB = 160;
  static const IFTYPE IF_TYPE_IEEE8023AD_LAG = 161;
  static const IFTYPE IF_TYPE_BGP_POLICY_ACCOUNTING = 162;
  static const IFTYPE IF_TYPE_FRF16_MFR_BUNDLE = 163;
  static const IFTYPE IF_TYPE_H323_GATEKEEPER = 164;
  static const IFTYPE IF_TYPE_H323_PROXY = 165;
  static const IFTYPE IF_TYPE_MPLS = 166;
  static const IFTYPE IF_TYPE_MF_SIGLINK = 167;
  static const IFTYPE IF_TYPE_HDSL2 = 168;
  static const IFTYPE IF_TYPE_SHDSL = 169;
  static const IFTYPE IF_TYPE_DS1_FDL = 170;
  static const IFTYPE IF_TYPE_POS = 171;
  static const IFTYPE IF_TYPE_DVB_ASI_IN = 172;
  static const IFTYPE IF_TYPE_DVB_ASI_OUT = 173;
  static const IFTYPE IF_TYPE_PLC = 174;
  static const IFTYPE IF_TYPE_NFAS = 175;
  static const IFTYPE IF_TYPE_TR008 = 176;
  static const IFTYPE IF_TYPE_GR303_RDT = 177;
  static const IFTYPE IF_TYPE_GR303_IDT = 178;
  static const IFTYPE IF_TYPE_ISUP = 179;
  static const IFTYPE IF_TYPE_PROP_DOCS_WIRELESS_MACLAYER = 180;
  static const IFTYPE IF_TYPE_PROP_DOCS_WIRELESS_DOWNSTREAM = 181;
  static const IFTYPE IF_TYPE_PROP_DOCS_WIRELESS_UPSTREAM = 182;
  static const IFTYPE IF_TYPE_HIPERLAN2 = 183;
  static const IFTYPE IF_TYPE_PROP_BWA_P2MP = 184;
  static const IFTYPE IF_TYPE_SONET_OVERHEAD_CHANNEL = 185;
  static const IFTYPE IF_TYPE_DIGITAL_WRAPPER_OVERHEAD_CHANNEL = 186;
  static const IFTYPE IF_TYPE_AAL2 = 187;
  static const IFTYPE IF_TYPE_RADIO_MAC = 188;
  static const IFTYPE IF_TYPE_ATM_RADIO = 189;
  static const IFTYPE IF_TYPE_IMT = 190;
  static const IFTYPE IF_TYPE_MVL = 191;
  static const IFTYPE IF_TYPE_REACH_DSL = 192;
  static const IFTYPE IF_TYPE_FR_DLCI_ENDPT = 193;
  static const IFTYPE IF_TYPE_ATM_VCI_ENDPT = 194;
  static const IFTYPE IF_TYPE_OPTICAL_CHANNEL = 195;
  static const IFTYPE IF_TYPE_OPTICAL_TRANSPORT = 196;
  static const IFTYPE IF_TYPE_IEEE80216_WMAN = 237;
  static const IFTYPE IF_TYPE_WWANPP = 243;
  static const IFTYPE IF_TYPE_WWANPP2 = 244;
  typedef struct SCOPE_ID {
    ULONG Value;
  } SCOPE_ID;
  typedef UINT MIB_TCP_STATE; //Alias
  static const MIB_TCP_STATE MIB_TCP_STATE_CLOSED = 1;
  static const MIB_TCP_STATE MIB_TCP_STATE_LISTEN = 2;
  static const MIB_TCP_STATE MIB_TCP_STATE_SYN_SENT = 3;
  static const MIB_TCP_STATE MIB_TCP_STATE_SYN_RCVD = 4;
  static const MIB_TCP_STATE MIB_TCP_STATE_ESTAB = 5;
  static const MIB_TCP_STATE MIB_TCP_STATE_FIN_WAIT1 = 6;
  static const MIB_TCP_STATE MIB_TCP_STATE_FIN_WAIT2 = 7;
  static const MIB_TCP_STATE MIB_TCP_STATE_CLOSE_WAIT = 8;
  static const MIB_TCP_STATE MIB_TCP_STATE_CLOSING = 9;
  static const MIB_TCP_STATE MIB_TCP_STATE_LAST_ACK = 10;
  static const MIB_TCP_STATE MIB_TCP_STATE_TIME_WAIT = 11;
  static const MIB_TCP_STATE MIB_TCP_STATE_DELETE_TCB = 12;
  typedef UINT TCP_CONNECTION_OFFLOAD_STATE; //Alias
  static const TCP_CONNECTION_OFFLOAD_STATE TcpConnectionOffloadStateInHost = 0;
  static const TCP_CONNECTION_OFFLOAD_STATE TcpConnectionOffloadStateOffloading = 1;
  static const TCP_CONNECTION_OFFLOAD_STATE TcpConnectionOffloadStateOffloaded = 2;
  static const TCP_CONNECTION_OFFLOAD_STATE TcpConnectionOffloadStateUploading = 3;
  typedef struct SOCKADDR_IN {
    ADDRESS_FAMILY sin_family;
    USHORT sin_port;
    IN_ADDR sin_addr;
    CHAR sin_zero[8];
  } SOCKADDR_IN;
  typedef struct struct sockaddr_in6 {
    ADDRESS_FAMILY sin6_family;
    USHORT sin6_port;
    ULONG sin6_flowinfo;
    IN6_ADDR sin6_addr;
    ULONG sin6_scope_id;
  } struct sockaddr_in6;
  typedef struct sockaddr_in6 SOCKADDR_IN6; //Alias
  typedef SOCKADDR_IN6 *PSOCKADDR_IN6; //Pointer
  typedef SOCKADDR_IN6 *PSOCKADDR_IN6; //Pointer
  typedef union NET_LUID {
    ULONG64 Value;
  } NET_LUID;
  typedef NET_LUID *PNET_LUID; //Pointer
  typedef struct IP_ADDRESS_STRING {
    char String[16];
  } IP_ADDRESS_STRING;
  typedef IP_ADDRESS_STRING IP_MASK_STRING; //Alias
  typedef struct IP_ADDR_STRING {
    LPVOID Next;
    IP_ADDRESS_STRING IpAddress;
    IP_MASK_STRING IpMask;
    DWORD Context;
  } IP_ADDR_STRING;
  typedef IP_ADDR_STRING *PIP_ADDR_STRING; //Pointer
  typedef UINT NL_ROUTE_PROTOCOL; //Alias
  static const NL_ROUTE_PROTOCOL MIB_IPPROTO_OTHER = 1;
  static const NL_ROUTE_PROTOCOL MIB_IPPROTO_LOCAL = 2;
  static const NL_ROUTE_PROTOCOL MIB_IPPROTO_NETMGMT = 3;
  static const NL_ROUTE_PROTOCOL MIB_IPPROTO_ICMP = 4;
  static const NL_ROUTE_PROTOCOL MIB_IPPROTO_EGP = 5;
  static const NL_ROUTE_PROTOCOL MIB_IPPROTO_GGP = 6;
  static const NL_ROUTE_PROTOCOL MIB_IPPROTO_HELLO = 7;
  static const NL_ROUTE_PROTOCOL MIB_IPPROTO_RIP = 8;
  static const NL_ROUTE_PROTOCOL MIB_IPPROTO_IS_IS = 9;
  static const NL_ROUTE_PROTOCOL MIB_IPPROTO_ES_IS = 10;
  static const NL_ROUTE_PROTOCOL MIB_IPPROTO_CISCO = 11;
  static const NL_ROUTE_PROTOCOL MIB_IPPROTO_BBN = 12;
  static const NL_ROUTE_PROTOCOL MIB_IPPROTO_OSPF = 13;
  static const NL_ROUTE_PROTOCOL MIB_IPPROTO_BGP = 14;
  static const NL_ROUTE_PROTOCOL MIB_IPPROTO_NT_AUTOSTATIC = 10002;
  static const NL_ROUTE_PROTOCOL MIB_IPPROTO_NT_STATIC = 10006;
  static const NL_ROUTE_PROTOCOL MIB_IPPROTO_NT_STATIC_NON_DOD = 10007;
  typedef NL_ROUTE_PROTOCOL MIB_IPFORWARD_PROTO; //Alias
  typedef UINT NL_ROUTE_ORIGIN; //Alias
  static const NL_ROUTE_ORIGIN NlroManual = 0;
  static const NL_ROUTE_ORIGIN NlroWellKnown = 1;
  static const NL_ROUTE_ORIGIN NlroDHCP = 2;
  static const NL_ROUTE_ORIGIN NlroRouterAdvertisement = 3;
  static const NL_ROUTE_ORIGIN Nlro6to4 = 4;
  typedef union SOCKADDR_INET {
    SOCKADDR_IN Ipv4;
    SOCKADDR_IN6 Ipv6;
    ADDRESS_FAMILY si_family;
  } SOCKADDR_INET;
  typedef struct IP_ADDRESS_PREFIX {
    SOCKADDR_INET Prefix;
    UINT8 PrefixLength;
  } IP_ADDRESS_PREFIX;
  typedef IFTYPE MIB_IF_TYPE; //Alias
  typedef struct IP_ADAPTER_INFO {
    LPVOID Next;
    DWORD ComboIndex;
    char AdapterName[MAX_ADAPTER_NAME_LENGTH_plus_4];
    char Description[MAX_ADAPTER_DESCRIPTION_LENGTH_plus_4];
    UINT AddressLength;
    BYTE Address[MAX_ADAPTER_ADDRESS_LENGTH];
    DWORD Index;
    MIB_IF_TYPE Type;
    UINT DhcpEnabled;
    PIP_ADDR_STRING CurrentIpAddress;
    IP_ADDR_STRING IpAddressList;
    IP_ADDR_STRING GatewayList;
    IP_ADDR_STRING DhcpServer;
    BOOL HaveWins;
    IP_ADDR_STRING PrimaryWinsServer;
    IP_ADDR_STRING SecondaryWinsServer;
    time_t LeaseObtained;
    time_t LeaseExpires;
  } IP_ADAPTER_INFO;
  typedef IP_ADAPTER_INFO *PIP_ADAPTER_INFO; //Pointer
  typedef struct IP_PER_ADAPTER_INFO {
    UINT AutoconfigEnabled;
    UINT AutoconfigActive;
    PIP_ADDR_STRING CurrentDnsServer;
    IP_ADDR_STRING DnsServerList;
  } IP_PER_ADAPTER_INFO;
  typedef IP_PER_ADAPTER_INFO *PIP_PER_ADAPTER_INFO; //Pointer
  typedef struct IP_UNIDIRECTIONAL_ADAPTER_ADDRESS {
    ULONG NumAdapters;
    IPAddr Address[1];
  } IP_UNIDIRECTIONAL_ADAPTER_ADDRESS;
  typedef IP_UNIDIRECTIONAL_ADAPTER_ADDRESS *PIP_UNIDIRECTIONAL_ADAPTER_ADDRESS; //Pointer
  typedef UINT MIB_IPNET_TYPE; //Alias
  static const MIB_IPNET_TYPE MIB_IPNET_TYPE_OTHER = 1;
  static const MIB_IPNET_TYPE MIB_IPNET_TYPE_INVALID = 2;
  static const MIB_IPNET_TYPE MIB_IPNET_TYPE_DYNAMIC = 3;
  static const MIB_IPNET_TYPE MIB_IPNET_TYPE_STATIC = 4;
  typedef struct MIB_IPNETROW {
    IF_INDEX dwIndex;
    DWORD dwPhysAddrLen;
    UCHAR bPhysAddr[MAXLEN_PHYSADDR];
    DWORD dwAddr;
    MIB_IPNET_TYPE Type;
  } MIB_IPNETROW;
  typedef MIB_IPNETROW *PMIB_IPNETROW; //Pointer
  enum { ANY_SIZE = 1 };
  typedef struct MIB_IPNETTABLE {
    DWORD dwNumEntries;
    MIB_IPNETROW table[ANY_SIZE];
  } MIB_IPNETTABLE;
  typedef MIB_IPNETTABLE *PMIB_IPNETTABLE; //Pointer
  typedef struct MIB_IFSTACK_ROW {
    NET_IFINDEX HigherLayerInterfaceIndex;
    NET_IFINDEX LowerLayerInterfaceIndex;
  } MIB_IFSTACK_ROW;
  typedef struct MIB_IFSTACK_TABLE {
    ULONG NumEntries;
    MIB_IFSTACK_ROW Table[ANY_SIZE];
  } MIB_IFSTACK_TABLE;
  typedef MIB_IFSTACK_TABLE *PMIB_IFSTACK_TABLE; //Pointer
  typedef UINT INTERNAL_IF_OPER_STATUS; //Alias
  static const INTERNAL_IF_OPER_STATUS IF_OPER_STATUS_NON_OPERATIONAL = 0;
  static const INTERNAL_IF_OPER_STATUS IF_OPER_STATUS_UNREACHABLE = 1;
  static const INTERNAL_IF_OPER_STATUS IF_OPER_STATUS_DISCONNECTED = 2;
  static const INTERNAL_IF_OPER_STATUS IF_OPER_STATUS_CONNECTING = 3;
  static const INTERNAL_IF_OPER_STATUS IF_OPER_STATUS_CONNECTED = 4;
  static const INTERNAL_IF_OPER_STATUS IF_OPER_STATUS_OPERATIONAL = 5;
  typedef struct MIB_IFROW {
    WCHAR wszName[MAX_INTERFACE_NAME_LEN];
    IF_INDEX dwIndex;
    IFTYPE dwType;
    DWORD dwMtu;
    DWORD dwSpeed;
    DWORD dwPhysAddrLen;
    UCHAR bPhysAddr[MAXLEN_PHYSADDR];
    DWORD dwAdminStatus;
    INTERNAL_IF_OPER_STATUS dwOperStatus;
    DWORD dwLastChange;
    DWORD dwInOctets;
    DWORD dwInUcastPkts;
    DWORD dwInNUcastPkts;
    DWORD dwInDiscards;
    DWORD dwInErrors;
    DWORD dwInUnknownProtos;
    DWORD dwOutOctets;
    DWORD dwOutUcastPkts;
    DWORD dwOutNUcastPkts;
    DWORD dwOutDiscards;
    DWORD dwOutErrors;
    DWORD dwOutQLen;
    DWORD dwDescrLen;
    UCHAR bDescr[MAXLEN_IFDESCR];
  } MIB_IFROW;
  typedef MIB_IFROW *PMIB_IFROW; //Pointer
  typedef struct MIB_IFTABLE {
    DWORD dwNumEntries;
    MIB_IFROW table[ANY_SIZE];
  } MIB_IFTABLE;
  typedef MIB_IFTABLE *PMIB_IFTABLE; //Pointer
  typedef struct MIB_IF_ROW2_s {
    BOOLEAN Flags;
  } MIB_IF_ROW2_s;
  typedef UINT TUNNEL_TYPE; //Alias
  static const TUNNEL_TYPE TUNNEL_TYPE_NONE = 0;
  static const TUNNEL_TYPE TUNNEL_TYPE_OTHER = 1;
  static const TUNNEL_TYPE TUNNEL_TYPE_DIRECT = 2;
  static const TUNNEL_TYPE TUNNEL_TYPE_6TO4 = 11;
  static const TUNNEL_TYPE TUNNEL_TYPE_ISATAP = 13;
  static const TUNNEL_TYPE TUNNEL_TYPE_TEREDO = 14;
  static const TUNNEL_TYPE TUNNEL_TYPE_IPHTTPS = 15;
  typedef UINT NDIS_MEDIUM; //Alias
  static const NDIS_MEDIUM NdisMedium802_3 = 0;
  static const NDIS_MEDIUM NdisMedium802_5 = 1;
  static const NDIS_MEDIUM NdisMediumFddi = 2;
  static const NDIS_MEDIUM NdisMediumWan = 3;
  static const NDIS_MEDIUM NdisMediumLocalTalk = 4;
  static const NDIS_MEDIUM NdisMediumDix = 5;
  static const NDIS_MEDIUM NdisMediumArcnetRaw = 6;
  static const NDIS_MEDIUM NdisMediumArcnet878_2 = 7;
  static const NDIS_MEDIUM NdisMediumAtm = 8;
  static const NDIS_MEDIUM NdisMediumWirelessWan = 9;
  static const NDIS_MEDIUM NdisMediumIrda = 10;
  static const NDIS_MEDIUM NdisMediumBpc = 11;
  static const NDIS_MEDIUM NdisMediumCoWan = 12;
  static const NDIS_MEDIUM NdisMedium1394 = 13;
  static const NDIS_MEDIUM NdisMediumInfiniBand = 14;
  static const NDIS_MEDIUM NdisMediumTunnel = 15;
  static const NDIS_MEDIUM NdisMediumNative802_11 = 16;
  static const NDIS_MEDIUM NdisMediumLoopback = 17;
  static const NDIS_MEDIUM NdisMediumWiMAX = 18;
  static const NDIS_MEDIUM NdisMediumIP = 19;
  typedef UINT NDIS_PHYSICAL_MEDIUM; //Alias
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMediumUnspecified = 0;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMediumWirelessLan = 1;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMediumCableModem = 2;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMediumPhoneLine = 3;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMediumPowerLine = 4;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMediumDSL = 5;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMediumFibreChannel = 6;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMedium1394 = 7;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMediumWirelessWan = 8;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMediumNative802_11 = 9;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMediumBluetooth = 10;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMediumInfiniband = 11;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMediumWiMax = 12;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMediumUWB = 13;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMedium802_3 = 14;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMedium802_5 = 15;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMediumIrda = 16;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMediumWiredWAN = 17;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMediumWiredCoWan = 18;
  static const NDIS_PHYSICAL_MEDIUM NdisPhysicalMediumOther = 19;
  typedef UINT NET_IF_ACCESS_TYPE; //Alias
  static const NET_IF_ACCESS_TYPE NET_IF_ACCESS_LOOPBACK = 1;
  static const NET_IF_ACCESS_TYPE NET_IF_ACCESS_BROADCAST = 2;
  static const NET_IF_ACCESS_TYPE NET_IF_ACCESS_POINT_TO_POINT = 3;
  static const NET_IF_ACCESS_TYPE NET_IF_ACCESS_POINT_TO_MULTI_POINT = 4;
  static const NET_IF_ACCESS_TYPE NET_IF_ACCESS_MAXIMUM = 5;
  typedef UINT NET_IF_DIRECTION_TYPE; //Alias
  static const NET_IF_DIRECTION_TYPE NET_IF_DIRECTION_SENDRECEIVE = 0;
  static const NET_IF_DIRECTION_TYPE NET_IF_DIRECTION_SENDONLY = 1;
  static const NET_IF_DIRECTION_TYPE NET_IF_DIRECTION_RECEIVEONLY = 2;
  typedef UINT IF_OPER_STATUS; //Alias
  static const IF_OPER_STATUS IfOperStatusUp = 1;
  static const IF_OPER_STATUS IfOperStatusDown = 2;
  static const IF_OPER_STATUS IfOperStatusTesting = 3;
  static const IF_OPER_STATUS IfOperStatusUnknown = 4;
  static const IF_OPER_STATUS IfOperStatusDormant = 5;
  static const IF_OPER_STATUS IfOperStatusNotPresent = 6;
  static const IF_OPER_STATUS IfOperStatusLowerLayerDown = 7;
  typedef UINT NET_IF_ADMIN_STATUS; //Alias
  static const NET_IF_ADMIN_STATUS NET_IF_ADMIN_STATUS_UP = 1;
  static const NET_IF_ADMIN_STATUS NET_IF_ADMIN_STATUS_DOWN = 2;
  static const NET_IF_ADMIN_STATUS NET_IF_ADMIN_STATUS_TESTING = 3;
  typedef UINT NET_IF_MEDIA_CONNECT_STATE; //Alias
  static const NET_IF_MEDIA_CONNECT_STATE MediaConnectStateUnknown = 0;
  static const NET_IF_MEDIA_CONNECT_STATE MediaConnectStateConnected = 1;
  static const NET_IF_MEDIA_CONNECT_STATE MediaConnectStateDisconnected = 2;
  typedef UINT NET_IF_CONNECTION_TYPE; //Alias
  static const NET_IF_CONNECTION_TYPE NET_IF_CONNECTION_DEDICATED = 1;
  static const NET_IF_CONNECTION_TYPE NET_IF_CONNECTION_PASSIVE = 2;
  static const NET_IF_CONNECTION_TYPE NET_IF_CONNECTION_DEMAND = 3;
  static const NET_IF_CONNECTION_TYPE NET_IF_CONNECTION_MAXIMUM = 4;
  typedef struct MIB_IF_ROW2 {
    NET_LUID InterfaceLuid;
    NET_IFINDEX InterfaceIndex;
    GUID InterfaceGuid;
    WCHAR Alias[IF_MAX_STRING_SIZE_plus_1];
    WCHAR Description[IF_MAX_STRING_SIZE_plus_1];
    ULONG PhysicalAddressLength;
    UCHAR PhysicalAddress[IF_MAX_PHYS_ADDRESS_LENGTH];
    UCHAR PermanentPhysicalAddress[IF_MAX_PHYS_ADDRESS_LENGTH];
    ULONG Mtu;
    IFTYPE Type;
    TUNNEL_TYPE TunnelType;
    NDIS_MEDIUM MediaType;
    NDIS_PHYSICAL_MEDIUM PhysicalMediumType;
    NET_IF_ACCESS_TYPE AccessType;
    NET_IF_DIRECTION_TYPE DirectionType;
    MIB_IF_ROW2_s InterfaceAndOperStatusFlags;
    IF_OPER_STATUS OperStatus;
    NET_IF_ADMIN_STATUS AdminStatus;
    NET_IF_MEDIA_CONNECT_STATE MediaConnectState;
    NET_IF_NETWORK_GUID NetworkGuid;
    NET_IF_CONNECTION_TYPE ConnectionType;
    ULONG64 TransmitLinkSpeed;
    ULONG64 ReceiveLinkSpeed;
    ULONG64 InOctets;
    ULONG64 InUcastPkts;
    ULONG64 InNUcastPkts;
    ULONG64 InDiscards;
    ULONG64 InErrors;
    ULONG64 InUnknownProtos;
    ULONG64 InUcastOctets;
    ULONG64 InMulticastOctets;
    ULONG64 InBroadcastOctets;
    ULONG64 OutOctets;
    ULONG64 OutUcastPkts;
    ULONG64 OutNUcastPkts;
    ULONG64 OutDiscards;
    ULONG64 OutErrors;
    ULONG64 OutUcastOctets;
    ULONG64 OutMulticastOctets;
    ULONG64 OutBroadcastOctets;
    ULONG64 OutQLen;
  } MIB_IF_ROW2;
  typedef MIB_IF_ROW2 *PMIB_IF_ROW2; //Pointer
  typedef struct MIB_IF_TABLE2 {
    ULONG NumEntries;
    MIB_IF_ROW2 Table[ANY_SIZE];
  } MIB_IF_TABLE2;
  typedef MIB_IF_TABLE2 *PMIB_IF_TABLE2; //Pointer
  typedef struct IP_ADAPTER_INDEX_MAP {
    ULONG Index;
    WCHAR Name[MAX_ADAPTER_NAME];
  } IP_ADAPTER_INDEX_MAP;
  typedef IP_ADAPTER_INDEX_MAP *PIP_ADAPTER_INDEX_MAP; //Pointer
  typedef struct IP_INTERFACE_INFO {
    LONG NumAdapters;
    IP_ADAPTER_INDEX_MAP Adapter[1];
  } IP_INTERFACE_INFO;
  typedef IP_INTERFACE_INFO *PIP_INTERFACE_INFO; //Pointer
  typedef struct MIB_INVERTEDIFSTACK_ROW {
    NET_IFINDEX LowerLayerInterfaceIndex;
    NET_IFINDEX HigherLayerInterfaceIndex;
  } MIB_INVERTEDIFSTACK_ROW;
  typedef struct MIB_INVERTEDIFSTACK_TABLE {
    ULONG NumEntries;
    MIB_INVERTEDIFSTACK_ROW Table[ANY_SIZE];
  } MIB_INVERTEDIFSTACK_TABLE;
  typedef MIB_INVERTEDIFSTACK_TABLE *PMIB_INVERTEDIFSTACK_TABLE; //Pointer
  typedef UINT NL_ROUTER_DISCOVERY_BEHAVIOR; //Alias
  static const NL_ROUTER_DISCOVERY_BEHAVIOR RouterDiscoveryDisabled = 0;
  static const NL_ROUTER_DISCOVERY_BEHAVIOR RouterDiscoveryEnabled = 1;
  static const NL_ROUTER_DISCOVERY_BEHAVIOR RouterDiscoveryDhcp = 2;
  static const NL_ROUTER_DISCOVERY_BEHAVIOR RouterDiscoveryUnchanged = -1;
  typedef UINT NL_LINK_LOCAL_ADDRESS_BEHAVIOR; //Alias
  static const NL_LINK_LOCAL_ADDRESS_BEHAVIOR LinkLocalAlwaysOff = 0;
  static const NL_LINK_LOCAL_ADDRESS_BEHAVIOR LinkLocalDelayed = 1;
  static const NL_LINK_LOCAL_ADDRESS_BEHAVIOR LinkLocalAlwaysOn = 2;
  static const NL_LINK_LOCAL_ADDRESS_BEHAVIOR LinkLocalUnchanged = -1;
  typedef struct NL_INTERFACE_OFFLOAD_ROD {
    BOOLEAN Value;
  } NL_INTERFACE_OFFLOAD_ROD;
  typedef struct MIB_IPINTERFACE_ROW {
    ADDRESS_FAMILY Family;
    NET_LUID InterfaceLuid;
    NET_IFINDEX InterfaceIndex;
    ULONG MaxReassemblySize;
    ULONG64 InterfaceIdentifier;
    ULONG MinRouterAdvertisementInterval;
    ULONG MaxRouterAdvertisementInterval;
    BOOLEAN AdvertisingEnabled;
    BOOLEAN ForwardingEnabled;
    BOOLEAN WeakHostSend;
    BOOLEAN WeakHostReceive;
    BOOLEAN UseAutomaticMetric;
    BOOLEAN UseNeighborUnreachabilityDetection;
    BOOLEAN ManagedAddressConfigurationSupported;
    BOOLEAN OtherStatefulConfigurationSupported;
    BOOLEAN AdvertiseDefaultRoute;
    NL_ROUTER_DISCOVERY_BEHAVIOR RouterDiscoveryBehavior;
    ULONG DadTransmits;
    ULONG BaseReachableTime;
    ULONG RetransmitTime;
    ULONG PathMtuDiscoveryTimeout;
    NL_LINK_LOCAL_ADDRESS_BEHAVIOR LinkLocalAddressBehavior;
    ULONG LinkLocalAddressTimeout;
    ULONG ZoneIndices[ScopeLevelCount];
    ULONG SitePrefixLength;
    ULONG Metric;
    ULONG NlMtu;
    BOOLEAN Connected;
    BOOLEAN SupportsWakeUpPatterns;
    BOOLEAN SupportsNeighborDiscovery;
    BOOLEAN SupportsRouterDiscovery;
    ULONG ReachableTime;
    NL_INTERFACE_OFFLOAD_ROD TransmitOffload;
    NL_INTERFACE_OFFLOAD_ROD ReceiveOffload;
    BOOLEAN DisableDefaultRoutes;
  } MIB_IPINTERFACE_ROW;
  typedef MIB_IPINTERFACE_ROW *PMIB_IPINTERFACE_ROW; //Pointer
  typedef struct MIB_IPINTERFACE_TABLE {
    ULONG NumEntries;
    MIB_IPINTERFACE_ROW Table[ANY_SIZE];
  } MIB_IPINTERFACE_TABLE;
  typedef MIB_IPINTERFACE_TABLE *PMIB_IPINTERFACE_TABLE; //Pointer
  typedef struct MIBICMPSTATS {
    DWORD dwMsgs;
    DWORD dwErrors;
    DWORD dwDestUnreachs;
    DWORD dwTimeExcds;
    DWORD dwParmProbs;
    DWORD dwSrcQuenchs;
    DWORD dwRedirects;
    DWORD dwEchos;
    DWORD dwEchoReps;
    DWORD dwTimestamps;
    DWORD dwTimestampReps;
    DWORD dwAddrMasks;
    DWORD dwAddrMaskReps;
  } MIBICMPSTATS;
  typedef struct MIBICMPINFO {
    MIBICMPSTATS icmpInStats;
    MIBICMPSTATS icmpOutStats;
  } MIBICMPINFO;
  typedef struct MIB_ICMP {
    MIBICMPINFO stats;
  } MIB_ICMP;
  typedef MIB_ICMP *PMIB_ICMP; //Pointer
  typedef UINT MIB_IPSTATS_FORWARDING; //Alias
  static const MIB_IPSTATS_FORWARDING MIB_IP_FORWARDING = 1;
  static const MIB_IPSTATS_FORWARDING MIB_IP_NOT_FORWARDING = 2;
  typedef struct MIB_IPSTATS {
    MIB_IPSTATS_FORWARDING Forwarding;
    DWORD dwDefaultTTL;
    DWORD dwInReceives;
    DWORD dwInHdrErrors;
    DWORD dwInAddrErrors;
    DWORD dwForwDatagrams;
    DWORD dwInUnknownProtos;
    DWORD dwInDiscards;
    DWORD dwInDelivers;
    DWORD dwOutRequests;
    DWORD dwRoutingDiscards;
    DWORD dwOutDiscards;
    DWORD dwOutNoRoutes;
    DWORD dwReasmTimeout;
    DWORD dwReasmReqds;
    DWORD dwReasmOks;
    DWORD dwReasmFails;
    DWORD dwFragOks;
    DWORD dwFragFails;
    DWORD dwFragCreates;
    DWORD dwNumIf;
    DWORD dwNumAddr;
    DWORD dwNumRoutes;
  } MIB_IPSTATS;
  typedef MIB_IPSTATS *PMIB_IPSTATS; //Pointer
  typedef struct MIB_ANYCASTIPADDRESS_ROW {
    SOCKADDR_INET Address;
    NET_LUID InterfaceLuid;
    NET_IFINDEX InterfaceIndex;
    SCOPE_ID ScopeId;
  } MIB_ANYCASTIPADDRESS_ROW;
  typedef MIB_ANYCASTIPADDRESS_ROW *PMIB_ANYCASTIPADDRESS_ROW; //Pointer
  typedef struct MIB_ANYCASTIPADDRESS_TABLE {
    ULONG NumEntries;
    MIB_ANYCASTIPADDRESS_ROW Table[ANY_SIZE];
  } MIB_ANYCASTIPADDRESS_TABLE;
  typedef MIB_ANYCASTIPADDRESS_TABLE *PMIB_ANYCASTIPADDRESS_TABLE; //Pointer
  typedef unsigned short MIB_IPADDR_TYPE; //Alias
  typedef struct MIB_IPADDRROW {
    DWORD dwAddr;
    IF_INDEX dwIndex;
    DWORD dwMask;
    DWORD dwBCastAddr;
    DWORD dwReasmSize;
    unsigned short unused1;
    MIB_IPADDR_TYPE wType;
  } MIB_IPADDRROW;
  typedef struct MIB_IPADDRTABLE {
    DWORD dwNumEntries;
    MIB_IPADDRROW table[ANY_SIZE];
  } MIB_IPADDRTABLE;
  typedef MIB_IPADDRTABLE *PMIB_IPADDRTABLE; //Pointer
  typedef struct MIB_MULTICASTIPADDRESS_ROW {
    SOCKADDR_INET Address;
    NET_IFINDEX InterfaceIndex;
    NET_LUID InterfaceLuid;
    SCOPE_ID ScopeId;
  } MIB_MULTICASTIPADDRESS_ROW;
  typedef MIB_MULTICASTIPADDRESS_ROW *PMIB_MULTICASTIPADDRESS_ROW; //Pointer
  typedef struct MIB_MULTICASTIPADDRESS_TABLE {
    ULONG NumEntries;
    MIB_MULTICASTIPADDRESS_ROW Table[ANY_SIZE];
  } MIB_MULTICASTIPADDRESS_TABLE;
  typedef MIB_MULTICASTIPADDRESS_TABLE *PMIB_MULTICASTIPADDRESS_TABLE; //Pointer
  typedef UINT NL_PREFIX_ORIGIN; //Alias
  static const NL_PREFIX_ORIGIN IpPrefixOriginOther = 0;
  static const NL_PREFIX_ORIGIN IpPrefixOriginManual = 1;
  static const NL_PREFIX_ORIGIN IpPrefixOriginWellKnown = 2;
  static const NL_PREFIX_ORIGIN IpPrefixOriginDhcp = 3;
  static const NL_PREFIX_ORIGIN IpPrefixOriginRouterAdvertisement = 4;
  static const NL_PREFIX_ORIGIN IpPrefixOriginUnchanged = 0x10;
  typedef UINT NL_SUFFIX_ORIGIN; //Alias
  static const NL_SUFFIX_ORIGIN IpSuffixOriginOther = 0;
  static const NL_SUFFIX_ORIGIN IpSuffixOriginManual = 1;
  static const NL_SUFFIX_ORIGIN IpSuffixOriginWellKnown = 2;
  static const NL_SUFFIX_ORIGIN IpSuffixOriginDhcp = 3;
  static const NL_SUFFIX_ORIGIN IpSuffixOriginLinkLayerAddress = 4;
  static const NL_SUFFIX_ORIGIN IpSuffixOriginRandom = 5;
  static const NL_SUFFIX_ORIGIN IpSuffixOriginUnchanged = 0x10;
  typedef UINT NL_DAD_STATE; //Alias
  static const NL_DAD_STATE IpDadStateInvalid = 0;
  static const NL_DAD_STATE IpDadStateTentative = 1;
  static const NL_DAD_STATE IpDadStateDuplicate = 2;
  static const NL_DAD_STATE IpDadStateDeprecated = 3;
  static const NL_DAD_STATE IpDadStatePreferred = 4;
  typedef struct MIB_UNICASTIPADDRESS_ROW {
    SOCKADDR_INET Address;
    NET_LUID InterfaceLuid;
    NET_IFINDEX InterfaceIndex;
    NL_PREFIX_ORIGIN PrefixOrigin;
    NL_SUFFIX_ORIGIN SuffixOrigin;
    ULONG ValidLifetime;
    ULONG PreferredLifetime;
    UINT8 OnLinkPrefixLength;
    BOOLEAN SkipAsSource;
    NL_DAD_STATE DadState;
    SCOPE_ID ScopeId;
    LARGE_INTEGER CreationTimeStamp;
  } MIB_UNICASTIPADDRESS_ROW;
  typedef MIB_UNICASTIPADDRESS_ROW *PMIB_UNICASTIPADDRESS_ROW; //Pointer
  typedef struct MIB_UNICASTIPADDRESS_TABLE {
    ULONG NumEntries;
    MIB_UNICASTIPADDRESS_ROW Table[ANY_SIZE];
  } MIB_UNICASTIPADDRESS_TABLE;
  typedef MIB_UNICASTIPADDRESS_TABLE *PMIB_UNICASTIPADDRESS_TABLE; //Pointer
  typedef union MIB_ReachabilityTime {
    ULONG LastReachable;
    ULONG LastUnreachable;
  } MIB_ReachabilityTime;
  typedef UINT NL_NEIGHBOR_STATE; //Alias
  static const NL_NEIGHBOR_STATE NlnsUnreachable = 0;
  static const NL_NEIGHBOR_STATE NlnsIncomplete = 1;
  static const NL_NEIGHBOR_STATE NlnsProbe = 2;
  static const NL_NEIGHBOR_STATE NlnsDelay = 3;
  static const NL_NEIGHBOR_STATE NlnsStale = 4;
  static const NL_NEIGHBOR_STATE NlnsReachable = 5;
  static const NL_NEIGHBOR_STATE NlnsPermanent = 6;
  static const NL_NEIGHBOR_STATE NlnsMaximum = 7;
  typedef struct MIB_IPNET_ROW2 {
    SOCKADDR_INET Address;
    NET_IFINDEX InterfaceIndex;
    NET_LUID InterfaceLuid;
    UCHAR PhysicalAddress[IF_MAX_PHYS_ADDRESS_LENGTH];
    ULONG PhysicalAddressLength;
    NL_NEIGHBOR_STATE State;
    UCHAR Flags;
    MIB_ReachabilityTime ReachabilityTime;
  } MIB_IPNET_ROW2;
  typedef MIB_IPNET_ROW2 *PMIB_IPNET_ROW2; //Pointer
  typedef struct MIB_IPNET_TABLE2 {
    ULONG NumEntries;
    MIB_IPNET_ROW2 Table[ANY_SIZE];
  } MIB_IPNET_TABLE2;
  typedef MIB_IPNET_TABLE2 *PMIB_IPNET_TABLE2; //Pointer
  typedef struct MIB_IPPATH_ROW {
    SOCKADDR_INET Source;
    SOCKADDR_INET Destination;
    NET_LUID InterfaceLuid;
    NET_IFINDEX InterfaceIndex;
    SOCKADDR_INET CurrentNextHop;
    ULONG PathMtu;
    ULONG RttMean;
    ULONG RttDeviation;
    MIB_ReachabilityTime ;
    BOOLEAN IsReachable;
    ULONG64 LinkTransmitSpeed;
    ULONG64 LinkReceiveSpeed;
  } MIB_IPPATH_ROW;
  typedef MIB_IPPATH_ROW *PMIB_IPPATH_ROW; //Pointer
  typedef struct MIB_IPPATH_TABLE {
    ULONG NumEntries;
    MIB_IPPATH_ROW Table[ANY_SIZE];
  } MIB_IPPATH_TABLE;
  typedef UINT MIB_IPFORWARD_TYPE; //Alias
  static const MIB_IPFORWARD_TYPE MIB_IPROUTE_TYPE_OTHER = 1;
  static const MIB_IPFORWARD_TYPE MIB_IPROUTE_TYPE_INVALID = 2;
  static const MIB_IPFORWARD_TYPE MIB_IPROUTE_TYPE_DIRECT = 3;
  static const MIB_IPFORWARD_TYPE MIB_IPROUTE_TYPE_INDIRECT = 4;
  typedef struct MIB_IPFORWARDROW {
    DWORD dwForwardDest;
    DWORD dwForwardMask;
    DWORD dwForwardPolicy;
    DWORD dwForwardNextHop;
    IF_INDEX dwForwardIfIndex;
    MIB_IPFORWARD_TYPE ForwardType;
    MIB_IPFORWARD_PROTO ForwardProto;
    DWORD dwForwardAge;
    DWORD dwForwardNextHopAS;
    DWORD dwForwardMetric1;
    DWORD dwForwardMetric2;
    DWORD dwForwardMetric3;
    DWORD dwForwardMetric4;
    DWORD dwForwardMetric5;
  } MIB_IPFORWARDROW;
  typedef MIB_IPFORWARDROW *PMIB_IPFORWARDROW; //Pointer
  typedef struct MIB_IPFORWARDTABLE {
    DWORD dwNumEntries;
    MIB_IPFORWARDROW table[ANY_SIZE];
  } MIB_IPFORWARDTABLE;
  typedef MIB_IPFORWARDTABLE *PMIB_IPFORWARDTABLE; //Pointer
  typedef struct MIB_IPFORWARD_ROW2 {
    NET_LUID InterfaceLuid;
    NET_IFINDEX InterfaceIndex;
    IP_ADDRESS_PREFIX DestinationPrefix;
    SOCKADDR_INET NextHop;
    UCHAR SitePrefixLength;
    ULONG ValidLifetime;
    ULONG PreferredLifetime;
    ULONG Metric;
    NL_ROUTE_PROTOCOL Protocol;
    BOOLEAN Loopback;
    BOOLEAN AutoconfigureAddress;
    BOOLEAN Publish;
    BOOLEAN Immortal;
    ULONG Age;
    NL_ROUTE_ORIGIN Origin;
  } MIB_IPFORWARD_ROW2;
  typedef MIB_IPFORWARD_ROW2 *PMIB_IPFORWARD_ROW2; //Pointer
  typedef struct MIB_IPFORWARD_TABLE2 {
    ULONG NumEntries;
    MIB_IPFORWARD_ROW2 Table[ANY_SIZE];
  } MIB_IPFORWARD_TABLE2;
  typedef MIB_IPFORWARD_TABLE2 *PMIB_IPFORWARD_TABLE2; //Pointer
  typedef struct SOCKADDR_IN6_PAIR {
    PSOCKADDR_IN6 SourceAddress;
    PSOCKADDR_IN6 DestinationAddress;
  } SOCKADDR_IN6_PAIR;
  typedef SOCKADDR_IN6_PAIR *PSOCKADDR_IN6_PAIR; //Pointer
  typedef UINT NET_ADDRESS_FORMAT; //Alias
  static const NET_ADDRESS_FORMAT NET_ADDRESS_FORMAT_UNSPECIFIED = 0;
  static const NET_ADDRESS_FORMAT NET_ADDRESS_DNS_NAME = 1;
  static const NET_ADDRESS_FORMAT NET_ADDRESS_IPV4 = 2;
  static const NET_ADDRESS_FORMAT NET_ADDRESS_IPV6 = 3;
  typedef struct NET_ADDRESS_INFO_u_s {
    WCHAR Address[DNS_MAX_NAME_BUFFER_LENGTH];
    WCHAR Port[6];
  } NET_ADDRESS_INFO_u_s;
  typedef union NET_ADDRESS_INFO_u {
    NET_ADDRESS_INFO_u_s NamedAddress;
    SOCKADDR_IN Ipv4Address;
    SOCKADDR_IN6 Ipv6Address;
    SOCKADDR IpAddress;
  } NET_ADDRESS_INFO_u;
  typedef struct NET_ADDRESS_INFO {
    NET_ADDRESS_FORMAT Format;
    NET_ADDRESS_INFO_u ;
  } NET_ADDRESS_INFO;
  typedef NET_ADDRESS_INFO *PNET_ADDRESS_INFO; //Pointer
  typedef UINT FIXED_INFO_NODETYPE; //Alias
  static const FIXED_INFO_NODETYPE BROADCAST_NODETYPE = 1;
  static const FIXED_INFO_NODETYPE PEER_TO_PEER_NODETYPE = 2;
  static const FIXED_INFO_NODETYPE MIXED_NODETYPE = 4;
  static const FIXED_INFO_NODETYPE HYBRID_NODETYPE = 8;
  typedef struct FIXED_INFO {
    char HostName[MAX_HOSTNAME_LEN_plus_4];
    char DomainName[MAX_DOMAIN_NAME_LEN_plus_4];
    PIP_ADDR_STRING CurrentDnsServer;
    IP_ADDR_STRING DnsServerList;
    FIXED_INFO_NODETYPE NodeType;
    char ScopeId[MAX_SCOPE_ID_LEN_plus_4];
    UINT EnableRouting;
    UINT EnableProxy;
    UINT EnableDns;
  } FIXED_INFO;
  typedef FIXED_INFO *PFIXED_INFO; //Pointer
  typedef struct MIB_TCP6ROW_OWNER_MODULE {
    UCHAR ucLocalAddr[16];
    DWORD dwLocalScopeId;
    DWORD dwLocalPort;
    UCHAR ucRemoteAddr[16];
    DWORD dwRemoteScopeId;
    DWORD dwRemotePort;
    MIB_TCP_STATE dwState;
    DWORD dwOwningPid;
    LARGE_INTEGER liCreateTimestamp;
    ULONGLONG OwningModuleInfo[TCPIP_OWNING_MODULE_SIZE];
  } MIB_TCP6ROW_OWNER_MODULE;
  typedef MIB_TCP6ROW_OWNER_MODULE *PMIB_TCP6ROW_OWNER_MODULE; //Pointer
  typedef struct MIB_TCPROW_OWNER_MODULE {
    MIB_TCP_STATE dwState;
    DWORD dwLocalAddr;
    DWORD dwLocalPort;
    DWORD dwRemoteAddr;
    DWORD dwRemotePort;
    DWORD dwOwningPid;
    LARGE_INTEGER liCreateTimestamp;
    ULONGLONG OwningModuleInfo[TCPIP_OWNING_MODULE_SIZE];
  } MIB_TCPROW_OWNER_MODULE;
  typedef MIB_TCPROW_OWNER_MODULE *PMIB_TCPROW_OWNER_MODULE; //Pointer
  typedef struct MIB_UDP6ROW_OWNER_MODULE {
    UCHAR ucLocalAddr[16];
    DWORD dwLocalScopeId;
    DWORD dwLocalPort;
    DWORD dwOwningPid;
    LARGE_INTEGER liCreateTimestamp;
    int dwFlags;
    ULONGLONG OwningModuleInfo[TCPIP_OWNING_MODULE_SIZE];
  } MIB_UDP6ROW_OWNER_MODULE;
  typedef MIB_UDP6ROW_OWNER_MODULE *PMIB_UDP6ROW_OWNER_MODULE; //Pointer
  typedef struct MIB_UDPROW_OWNER_MODULE {
    DWORD dwLocalAddr;
    DWORD dwLocalPort;
    DWORD dwOwningPid;
    LARGE_INTEGER liCreateTimestamp;
    int dwFlags;
    ULONGLONG OwningModuleInfo[TCPIP_OWNING_MODULE_SIZE];
  } MIB_UDPROW_OWNER_MODULE;
  typedef MIB_UDPROW_OWNER_MODULE *PMIB_UDPROW_OWNER_MODULE; //Pointer
  typedef UINT TCP_RTO_ALGORITHM; //Alias
  static const TCP_RTO_ALGORITHM MIB_TCP_RTO_OTHER = 1;
  static const TCP_RTO_ALGORITHM MIB_TCP_RTO_CONSTANT = 2;
  static const TCP_RTO_ALGORITHM MIB_TCP_RTO_RSRE = 3;
  static const TCP_RTO_ALGORITHM MIB_TCP_RTO_VANJ = 4;
  typedef struct MIB_TCPSTATS {
    TCP_RTO_ALGORITHM RtoAlgorithm;
    DWORD dwRtoMin;
    DWORD dwRtoMax;
    DWORD dwMaxConn;
    DWORD dwActiveOpens;
    DWORD dwPassiveOpens;
    DWORD dwAttemptFails;
    DWORD dwEstabResets;
    DWORD dwCurrEstab;
    DWORD dwInSegs;
    DWORD dwOutSegs;
    DWORD dwRetransSegs;
    DWORD dwInErrs;
    DWORD dwOutRsts;
    DWORD dwNumConns;
  } MIB_TCPSTATS;
  typedef MIB_TCPSTATS *PMIB_TCPSTATS; //Pointer
  typedef struct MIB_TCP6ROW {
    MIB_TCP_STATE State;
    IN6_ADDR LocalAddr;
    DWORD dwLocalScopeId;
    DWORD dwLocalPort;
    IN6_ADDR RemoteAddr;
    DWORD dwRemoteScopeId;
    DWORD dwRemotePort;
  } MIB_TCP6ROW;
  typedef MIB_TCP6ROW *PMIB_TCP6ROW; //Pointer
  typedef struct MIB_TCP6TABLE {
    DWORD dwNumEntries;
    MIB_TCP6ROW table[ANY_SIZE];
  } MIB_TCP6TABLE;
  typedef MIB_TCP6TABLE *PMIB_TCP6TABLE; //Pointer
  typedef struct MIB_TCP6ROW2 {
    IN6_ADDR LocalAddr;
    DWORD dwLocalScopeId;
    DWORD dwLocalPort;
    IN6_ADDR RemoteAddr;
    DWORD dwRemoteScopeId;
    DWORD dwRemotePort;
    MIB_TCP_STATE State;
    DWORD dwOwningPid;
    TCP_CONNECTION_OFFLOAD_STATE dwOffloadState;
  } MIB_TCP6ROW2;
  typedef struct MIB_TCP6TABLE2 {
    DWORD dwNumEntries;
    MIB_TCP6ROW2 table[ANY_SIZE];
  } MIB_TCP6TABLE2;
  typedef MIB_TCP6TABLE2 *PMIB_TCP6TABLE2; //Pointer
  typedef struct MIB_TCPROW {
    MIB_TCP_STATE State;
    DWORD dwLocalAddr;
    DWORD dwLocalPort;
    DWORD dwRemoteAddr;
    DWORD dwRemotePort;
  } MIB_TCPROW;
  typedef MIB_TCPROW *PMIB_TCPROW; //Pointer
  typedef struct MIB_TCPTABLE {
    DWORD dwNumEntries;
    MIB_TCPROW table[ANY_SIZE];
  } MIB_TCPTABLE;
  typedef MIB_TCPTABLE *PMIB_TCPTABLE; //Pointer
  typedef struct MIB_TCPROW2 {
    MIB_TCP_STATE dwState;
    DWORD dwLocalAddr;
    DWORD dwLocalPort;
    DWORD dwRemoteAddr;
    DWORD dwRemotePort;
    DWORD dwOwningPid;
    TCP_CONNECTION_OFFLOAD_STATE dwOffloadState;
  } MIB_TCPROW2;
  typedef struct MIB_TCPTABLE2 {
    DWORD dwNumEntries;
    MIB_TCPROW2 table[ANY_SIZE];
  } MIB_TCPTABLE2;
  typedef MIB_TCPTABLE2 *PMIB_TCPTABLE2; //Pointer
  typedef struct MIB_UDP6ROW {
    IN6_ADDR dwLocalAddr;
    DWORD dwLocalScopeId;
    DWORD dwLocalPort;
  } MIB_UDP6ROW;
  typedef struct MIB_UDP6TABLE {
    DWORD dwNumEntries;
    MIB_UDP6ROW table[ANY_SIZE];
  } MIB_UDP6TABLE;
  typedef MIB_UDP6TABLE *PMIB_UDP6TABLE; //Pointer
  typedef struct MIB_UDPSTATS {
    DWORD dwInDatagrams;
    DWORD dwNoPorts;
    DWORD dwInErrors;
    DWORD dwOutDatagrams;
    DWORD dwNumAddrs;
  } MIB_UDPSTATS;
  typedef MIB_UDPSTATS *PMIB_UDPSTATS; //Pointer
  typedef struct MIB_UDPROW {
    DWORD dwLocalAddr;
    DWORD dwLocalPort;
  } MIB_UDPROW;
  typedef struct MIB_UDPTABLE {
    DWORD dwNumEntries;
    MIB_UDPROW table[ANY_SIZE];
  } MIB_UDPTABLE;
  typedef MIB_UDPTABLE *PMIB_UDPTABLE; //Pointer
  typedef UINT TCPIP_OWNER_MODULE_INFO_CLASS; //Alias
  static const TCPIP_OWNER_MODULE_INFO_CLASS TCPIP_OWNER_MODULE_INFO_BASIC = 0;
  typedef UINT TCP_ESTATS_TYPE; //Alias
  static const TCP_ESTATS_TYPE TcpConnectionEstatsSynOpts = 0;
  static const TCP_ESTATS_TYPE TcpConnectionEstatsData = 1;
  static const TCP_ESTATS_TYPE TcpConnectionEstatsSndCong = 2;
  static const TCP_ESTATS_TYPE TcpConnectionEstatsPath = 3;
  static const TCP_ESTATS_TYPE TcpConnectionEstatsSendBuff = 4;
  static const TCP_ESTATS_TYPE TcpConnectionEstatsRec = 5;
  static const TCP_ESTATS_TYPE TcpConnectionEstatsObsRec = 6;
  static const TCP_ESTATS_TYPE TcpConnectionEstatsBandwidth = 7;
  static const TCP_ESTATS_TYPE TcpConnectionEstatsFineRtt = 8;
  static const TCP_ESTATS_TYPE TcpConnectionEstatsMaximum = 9;
  typedef UINT MIB_IF_TABLE_LEVEL; //Alias
  static const MIB_IF_TABLE_LEVEL MibIfTableNormal = 0;
  static const MIB_IF_TABLE_LEVEL MibIfTableRaw = 1;
  typedef UINT TCP_TABLE_CLASS; //Alias
  static const TCP_TABLE_CLASS TCP_TABLE_BASIC_LISTENER = 0;
  static const TCP_TABLE_CLASS TCP_TABLE_BASIC_CONNECTIONS = 1;
  static const TCP_TABLE_CLASS TCP_TABLE_BASIC_ALL = 2;
  static const TCP_TABLE_CLASS TCP_TABLE_OWNER_PID_LISTENER = 3;
  static const TCP_TABLE_CLASS TCP_TABLE_OWNER_PID_CONNECTIONS = 4;
  static const TCP_TABLE_CLASS TCP_TABLE_OWNER_PID_ALL = 5;
  static const TCP_TABLE_CLASS TCP_TABLE_OWNER_MODULE_LISTENER = 6;
  static const TCP_TABLE_CLASS TCP_TABLE_OWNER_MODULE_CONNECTIONS = 7;
  static const TCP_TABLE_CLASS TCP_TABLE_OWNER_MODULE_ALL = 8;
  typedef UINT UDP_TABLE_CLASS; //Alias
  static const UDP_TABLE_CLASS UDP_TABLE_BASIC = 0;
  static const UDP_TABLE_CLASS UDP_TABLE_OWNER_PID = 1;
  static const UDP_TABLE_CLASS UDP_TABLE_OWNER_MODULE = 2;
  typedef ULONG GetAdaptersAddressesFlags; //Alias
  ERROR_CODE       GetAdapterIndex(                   LPWSTR AdapterName, PULONG IfIndex);
  ERROR_CODE_ULONG GetAdaptersAddresses(              ADDRESS_FAMILY Family, GetAdaptersAddressesFlags Flags, PVOID Reserved, PIP_ADAPTER_ADDRESSES AdapterAddresses, PULONG SizePointer);
  ERROR_CODE       GetAdaptersInfo(                   PIP_ADAPTER_INFO pAdapterInfo, PULONG pOutBufLen);
  ERROR_CODE       GetPerAdapterInfo(                 ULONG IfIndex, PIP_PER_ADAPTER_INFO pPerAdapterInfo, PULONG pOutBufLen);
  ERROR_CODE       GetUniDirectionalAdapterInfo(      PIP_UNIDIRECTIONAL_ADAPTER_ADDRESS pIPIfInfo, PULONG dwOutBufLen);
  ERROR_CODE       CreateIpNetEntry(                  PMIB_IPNETROW pArpEntry);
  ERROR_CODE       CreateProxyArpEntry(               DWORD dwAddress, DWORD dwMask, DWORD dwIfIndex);
  ERROR_CODE       DeleteIpNetEntry(                  PMIB_IPNETROW pArpEntry);
  ERROR_CODE       DeleteProxyArpEntry(               DWORD dwAddress, DWORD dwMask, DWORD dwIfIndex);
  ERROR_CODE       FlushIpNetTable(                   DWORD dwIfIndex);
  ERROR_CODE       GetIpNetTable(                     PMIB_IPNETTABLE pIpNetTable, PULONG pdwSize, BOOL bOrder);
  ERROR_CODE       SendARP(                           IPAddr DestIP, IPAddr SrcIP, PULONG pMacAddr, PULONG PhyAddrLen);
  ERROR_CODE       SetIpNetEntry(                     PMIB_IPNETROW pArpEntry);
  NETIO_STATUS     ConvertInterfaceAliasToLuid(       WCHAR* InterfaceAlias, PNET_LUID InterfaceLuid);
  NETIO_STATUS     ConvertInterfaceGuidToLuid(        GUID* InterfaceGuid, PNET_LUID InterfaceLuid);
  NETIO_STATUS     ConvertInterfaceIndexToLuid(       NET_IFINDEX InterfaceIndex, PNET_LUID InterfaceLuid);
  NETIO_STATUS     ConvertInterfaceLuidToAlias(       NET_LUID* InterfaceLuid, PWSTR InterfaceAlias, SIZE_T Length);
  NETIO_STATUS     ConvertInterfaceLuidToGuid(        NET_LUID* InterfaceLuid, GUID* InterfaceGuid);
  NETIO_STATUS     ConvertInterfaceLuidToIndex(       NET_LUID* InterfaceLuid, PNET_IFINDEX InterfaceIndex);
  NETIO_STATUS     ConvertInterfaceLuidToNameA(       NET_LUID* InterfaceLuid, PSTR InterfaceName, SIZE_T Length);
  NETIO_STATUS     ConvertInterfaceLuidToNameW(       NET_LUID* InterfaceLuid, PWSTR InterfaceName, SIZE_T Length);
  NETIO_STATUS     ConvertInterfaceNameToLuidA(       CHAR* InterfaceName, PNET_LUID InterfaceLuid);
  NETIO_STATUS     ConvertInterfaceNameToLuidW(       WCHAR* InterfaceName, PNET_LUID InterfaceLuid);
  PCHAR            if_indextoname(                    NET_IFINDEX InterfaceIndex, PCHAR InterfaceName);
  NET_IFINDEX      if_nametoindex(                    PCSTR InterfaceName);
  ERROR_CODE       GetFriendlyIfIndex(                DWORD IfIndex);
  ERROR_CODE       GetIfEntry(                        PMIB_IFROW pIfRow);
  NETIOAPI_API     GetIfEntry2(                       PMIB_IF_ROW2 Row);
  NETIOAPI_API     GetIfStackTable(                   PMIB_IFSTACK_TABLE* Table);
  ERROR_CODE       GetIfTable(                        PMIB_IFTABLE pIfTable, PULONG pdwSize, BOOL bOrder);
  NETIOAPI_API     GetIfTable2(                       PMIB_IF_TABLE2* Table);
  NETIOAPI_API     GetIfTable2Ex(                     MIB_IF_TABLE_LEVEL Level, PMIB_IF_TABLE2* Table);
  ERROR_CODE       GetInterfaceInfo(                  PIP_INTERFACE_INFO pIfTable, PULONG dwOutBufLen);
  NETIOAPI_API     GetInvertedIfStackTable(           PMIB_INVERTEDIFSTACK_TABLE* Table);
  NETIOAPI_API     GetIpInterfaceEntry(               PMIB_IPINTERFACE_ROW Row);
  NETIOAPI_API     GetIpInterfaceTable(               ADDRESS_FAMILY Family, PMIB_IPINTERFACE_TABLE* Table);
  ERROR_CODE       GetNumberOfInterfaces(             PDWORD pdwNumIf);
  VOID             InitializeIpInterfaceEntry(        PMIB_IPINTERFACE_ROW Row);
  ERROR_CODE       SetIfEntry(                        PMIB_IFROW pIfRow);
  NETIOAPI_API     SetIpInterfaceEntry(               PMIB_IPINTERFACE_ROW Row);
  ERROR_CODE       GetIcmpStatistics(                 PMIB_ICMP pStats);
  ERROR_CODE       GetIpStatistics(                   PMIB_IPSTATS pStats);
  FILE_HANDLE      Icmp6CreateFile(                   );
  ERROR_CODE       Icmp6ParseReplies(                 LPVOID ReplyBuffer, DWORD ReplySize);
  ERROR_CODE       Icmp6SendEcho2(                    HANDLE IcmpHandle, HANDLE Event, PIO_APC_ROUTINE ApcRoutine, PVOID ApcContext, struct sockaddr_in6* SourceAddress, struct sockaddr_in6* DestinationAddress, LPVOID RequestData, WORD RequestSize, PIP_OPTION_INFORMATION RequestOptions, LPVOID ReplyBuffer, DWORD ReplySize, DWORD Timeout);
  ERROR_CODE       IcmpSendEcho2Ex(                   HANDLE IcmpHandle, HANDLE Event, PIO_APC_ROUTINE ApcRoutine, PVOID ApcContext, IPAddr SourceAddress, IPAddr DestinationAddress, LPVOID RequestData, WORD RequestSize, PIP_OPTION_INFORMATION RequestOptions, LPVOID ReplyBuffer, DWORD ReplySize, DWORD Timeout);
  ERROR_CODE       SetIpTTL(                          UINT nTTL);
  ERROR_CODE       AddIPAddress(                      IPAddr Address, IPMask IpMask, DWORD IfIndex, PULONG NTEContext, PULONG NTEInstance);
  NETIOAPI_API     CreateAnycastIpAddressEntry(       MIB_ANYCASTIPADDRESS_ROW* Row);
  NETIOAPI_API     CreateUnicastIpAddressEntry(       MIB_UNICASTIPADDRESS_ROW* Row);
  ERROR_CODE       DeleteIPAddress(                   ULONG NTEContext);
  NETIOAPI_API     DeleteAnycastIpAddressEntry(       MIB_ANYCASTIPADDRESS_ROW* Row);
  NETIOAPI_API     DeleteUnicastIpAddressEntry(       MIB_UNICASTIPADDRESS_ROW* Row);
  NETIOAPI_API     GetAnycastIpAddressEntry(          PMIB_ANYCASTIPADDRESS_ROW Row);
  NETIOAPI_API     GetAnycastIpAddressTable(          ADDRESS_FAMILY Family, PMIB_ANYCASTIPADDRESS_TABLE* Table);
  ERROR_CODE       GetIpAddrTable(                    PMIB_IPADDRTABLE pIpAddrTable, PULONG pdwSize, BOOL bOrder);
  NETIOAPI_API     GetMulticastIpAddressEntry(        PMIB_MULTICASTIPADDRESS_ROW Row);
  NETIOAPI_API     GetMulticastIpAddressTable(        ADDRESS_FAMILY Family, PMIB_MULTICASTIPADDRESS_TABLE* Table);
  NETIOAPI_API     GetUnicastIpAddressEntry(          PMIB_UNICASTIPADDRESS_ROW Row);
  NETIOAPI_API     GetUnicastIpAddressTable(          ADDRESS_FAMILY Family, PMIB_UNICASTIPADDRESS_TABLE* Table);
  VOID             InitializeUnicastIpAddressEntry(   PMIB_UNICASTIPADDRESS_ROW Row);
  ERROR_CODE       IpReleaseAddress(                  PIP_ADAPTER_INDEX_MAP AdapterInfo);
  ERROR_CODE       IpRenewAddress(                    PIP_ADAPTER_INDEX_MAP AdapterInfo);
  NETIOAPI_API     NotifyStableUnicastIpAddressTable( ADDRESS_FAMILY Family, PMIB_UNICASTIPADDRESS_TABLE* Table, PSTABLE_UNICAST_IPADDRESS_TABLE_CALLBACK CallerCallback, PVOID CallerContext, HANDLE* NotificationHandle);
  NETIOAPI_API     SetUnicastIpAddressEntry(          MIB_UNICASTIPADDRESS_ROW* Row);
  NETIOAPI_API     CreateIpNetEntry2(                 MIB_IPNET_ROW2* Row);
  NETIOAPI_API     DeleteIpNetEntry2(                 MIB_IPNET_ROW2* Row);
  NETIOAPI_API     FlushIpNetTable2(                  ADDRESS_FAMILY Family, NET_IFINDEX InterfaceIndex);
  NETIOAPI_API     GetIpNetEntry2(                    PMIB_IPNET_ROW2 Row);
  NETIOAPI_API     GetIpNetTable2(                    ADDRESS_FAMILY Family, PMIB_IPNET_TABLE2* Table);
  NETIOAPI_API     ResolveIpNetEntry2(                PMIB_IPNET_ROW2 Row, SOCKADDR_INET* SourceAddress);
  ERROR_CODE_ULONG ResolveNeighbor(                   SOCKADDR* NetworkAddress, PVOID PhysicalAddress, PULONG PhysicalAddressLength);
  NETIOAPI_API     SetIpNetEntry2(                    PMIB_IPNET_ROW2 Row);
  NETIOAPI_API     FlushIpPathTable(                  ADDRESS_FAMILY Family);
  NETIOAPI_API     GetIpPathEntry(                    PMIB_IPPATH_ROW Row);
  NETIOAPI_API     GetIpPathTable(                    ADDRESS_FAMILY Family, MIB_IPPATH_TABLE* Table);
  ERROR_CODE       CreateIpForwardEntry(              PMIB_IPFORWARDROW pRoute);
  NETIOAPI_API     CreateIpForwardEntry2(             MIB_IPFORWARD_ROW2* Row);
  ERROR_CODE       DeleteIpForwardEntry(              PMIB_IPFORWARDROW pRoute);
  NETIOAPI_API     DeleteIpForwardEntry2(             MIB_IPFORWARD_ROW2* Row);
  ERROR_CODE       EnableRouter(                      HANDLE* pHandle, OVERLAPPED* pOverlapped);
  ERROR_CODE       GetBestInterface(                  IPAddr dwDestAddr, PDWORD pdwBestIfIndex);
  ERROR_CODE       GetBestInterfaceEx(                struct sockaddr* pDestAddr, PDWORD pdwBestIfIndex);
  ERROR_CODE       GetBestRoute(                      DWORD dwDestAddr, DWORD dwSourceAddr, PMIB_IPFORWARDROW pBestRoute);
  NETIOAPI_API     GetBestRoute2(                     NET_LUID* InterfaceLuid, NET_IFINDEX InterfaceIndex, SOCKADDR_INET* SourceAddress, SOCKADDR_INET* DestinationAddress, ULONG AddressSortOptions, PMIB_IPFORWARD_ROW2 BestRoute, SOCKADDR_INET* BestSourceAddress);
  NETIOAPI_API     GetIpForwardEntry2(                PMIB_IPFORWARD_ROW2 Row);
  ERROR_CODE       GetIpForwardTable(                 PMIB_IPFORWARDTABLE pIpForwardTable, PULONG pdwSize, BOOL bOrder);
  NETIOAPI_API     GetIpForwardTable2(                ADDRESS_FAMILY Family, PMIB_IPFORWARD_TABLE2* Table);
  BOOL             GetRTTAndHopCount(                 IPAddr DestIpAddress, PULONG HopCount, ULONG MaxHops, PULONG RTT);
  VOID             InitializeIpForwardEntry(          PMIB_IPFORWARD_ROW2 Row);
  ERROR_CODE       SetIpForwardEntry(                 PMIB_IPFORWARDROW pRoute);
  NETIOAPI_API     SetIpForwardEntry2(                MIB_IPFORWARD_ROW2* Route);
  ERROR_CODE       SetIpStatistics(                   PMIB_IPSTATS pIpStats);
  ERROR_CODE       SetIpStatisticsEx(                 PMIB_IPSTATS pIpStats, ULONG Family);
  ERROR_CODE       UnenableRouter(                    OVERLAPPED* pOverlapped, LPDWORD lpdwEnableCount);
  VOID             FreeMibTable(                      PVOID Memory);
  NETIO_STATUS     ConvertIpv4MaskToLength(           ULONG Mask, PUINT8 MaskLength);
  NETIO_STATUS     ConvertLengthToIpv4Mask(           ULONG MaskLength, PULONG Mask);
  NETIOAPI_API     CreateSortedAddressPairs(          PSOCKADDR_IN6 SourceAddressList, ULONG SourceAddressCount, PSOCKADDR_IN6 DestinationAddressList, ULONG DestinationAddressCount, ULONG AddressSortOptions, PSOCKADDR_IN6_PAIR* SortedAddressPairList, ULONG* SortedAddressPairCount);
  ERROR_CODE       ParseNetworkString(                WCHAR* NetworkString, DWORD Types, PNET_ADDRESS_INFO AddressInfo, USHORT* PortNumber, BYTE* PrefixLength);
  ERROR_CODE       GetNetworkParams(                  PFIXED_INFO pFixedInfo, PULONG pOutBufLen);
  NETIOAPI_API     CancelMibChangeNotify2(            HANDLE NotificationHandle);
  ERROR_CODE       NotifyAddrChange(                  PHANDLE Handle, LPOVERLAPPED overlapped);
  NETIOAPI_API     NotifyIpInterfaceChange(           ADDRESS_FAMILY Family, PIPINTERFACE_CHANGE_CALLBACK Callback, PVOID CallerContext, BOOLEAN InitialNotification, HANDLE* NotificationHandle);
  ERROR_CODE       NotifyRouteChange(                 PHANDLE Handle, LPOVERLAPPED overlapped);
  NETIOAPI_API     NotifyRouteChange2(                ADDRESS_FAMILY Family, PIPFORWARD_CHANGE_CALLBACK Callback, PVOID CallerContext, BOOLEAN InitialNotification, HANDLE* NotificationHandle);
  NETIOAPI_API     NotifyUnicastIpAddressChange(      ADDRESS_FAMILY Family, PUNICAST_IPADDRESS_CHANGE_CALLBACK Callback, PVOID CallerContext, BOOLEAN InitialNotification, HANDLE* NotificationHandle);
  BOOL             CancelSecurityHealthChangeNotify(  LPOVERLAPPED notifyOverlapped);
  ERROR_CODE       NotifySecurityHealthChange(        PHANDLE pHandle, LPOVERLAPPED pOverLapped, PULONG SecurityHealthFlags);
  NETIOAPI_API     GetTeredoPort(                     USHORT* Port);
  NETIOAPI_API     NotifyTeredoPortChange(            PTEREDO_PORT_CHANGE_CALLBACK Callback, PVOID CallerContext, BOOLEAN InitialNotification, HANDLE* NotificationHandle);
  ERROR_CODE       GetExtendedTcpTable(               PVOID pTcpTable, PDWORD pdwSize, BOOL bOrder, ADDRESS_FAMILY ulAf, TCP_TABLE_CLASS TableClass, ULONG Reserved);
  ERROR_CODE       GetExtendedUdpTable(               PVOID pUdpTable, PDWORD pdwSize, BOOL bOrder, ADDRESS_FAMILY ulAf, UDP_TABLE_CLASS TableClass, ULONG Reserved);
  ERROR_CODE       GetOwnerModuleFromTcp6Entry(       PMIB_TCP6ROW_OWNER_MODULE pTcpEntry, TCPIP_OWNER_MODULE_INFO_CLASS Class, PVOID Buffer, PDWORD pdwSize);
  ERROR_CODE       GetOwnerModuleFromTcpEntry(        PMIB_TCPROW_OWNER_MODULE pTcpEntry, TCPIP_OWNER_MODULE_INFO_CLASS Class, PVOID Buffer, PDWORD pdwSize);
  ERROR_CODE       GetOwnerModuleFromUdp6Entry(       PMIB_UDP6ROW_OWNER_MODULE pUdpEntry, TCPIP_OWNER_MODULE_INFO_CLASS Class, PVOID Buffer, PDWORD pdwSize);
  ERROR_CODE       GetOwnerModuleFromUdpEntry(        PMIB_UDPROW_OWNER_MODULE pUdpEntry, TCPIP_OWNER_MODULE_INFO_CLASS Class, PVOID Buffer, PDWORD pdwSize);
  ERROR_CODE_ULONG GetPerTcp6ConnectionEStats(        PMIB_TCP6ROW Row, TCP_ESTATS_TYPE EstatsType, PUCHAR Rw, ULONG RwVersion, ULONG RwSize, PUCHAR Ros, ULONG RosVersion, ULONG RosSize, PUCHAR Rod, ULONG RodVersion, ULONG RodSize);
  ERROR_CODE_ULONG GetPerTcpConnectionEStats(         PMIB_TCPROW Row, TCP_ESTATS_TYPE EstatsType, PUCHAR Rw, ULONG RwVersion, ULONG RwSize, PUCHAR Ros, ULONG RosVersion, ULONG RosSize, PUCHAR Rod, ULONG RodVersion, ULONG RodSize);
  ERROR_CODE       GetTcpStatistics(                  PMIB_TCPSTATS pStats);
  ERROR_CODE       GetTcpStatisticsEx(                PMIB_TCPSTATS pStats, ADDRESS_FAMILY dwFamily);
  ERROR_CODE_ULONG GetTcp6Table(                      PMIB_TCP6TABLE TcpTable, PULONG SizePointer, BOOL Order);
  ERROR_CODE_ULONG GetTcp6Table2(                     PMIB_TCP6TABLE2 TcpTable, PULONG SizePointer, BOOL Order);
  ERROR_CODE       GetTcpTable(                       PMIB_TCPTABLE pTcpTable, PDWORD pdwSize, BOOL bOrder);
  ERROR_CODE_ULONG GetTcpTable2(                      PMIB_TCPTABLE2 TcpTable, PULONG SizePointer, BOOL Order);
  ERROR_CODE_ULONG SetPerTcp6ConnectionEStats(        PMIB_TCP6ROW Row, TCP_ESTATS_TYPE EstatsType, PUCHAR Rw, ULONG RwVersion, ULONG RwSize, ULONG Offset);
  ERROR_CODE_ULONG SetPerTcpConnectionEStats(         PMIB_TCP6ROW Row, TCP_ESTATS_TYPE EstatsType, PUCHAR Rw, ULONG RwVersion, ULONG RwSize, ULONG Offset);
  ERROR_CODE       SetTcpEntry(                       PMIB_TCPROW pTcpRow);
  ERROR_CODE_ULONG GetUdp6Table(                      PMIB_UDP6TABLE Udp6Table, PULONG SizePointer, BOOL Order);
  ERROR_CODE       GetUdpStatistics(                  PMIB_UDPSTATS pStats);
  ERROR_CODE       GetUdpStatisticsEx(                PMIB_UDPSTATS pStats, ADDRESS_FAMILY dwFamily);
  ERROR_CODE       GetUdpTable(                       PMIB_UDPTABLE pUdpTable, PDWORD pdwSize, BOOL bOrder);
  ERROR_CODE       AllocateAndGetTcpExTableFromStack( PVOID* ppTcpTable, BOOL bOrder, HANDLE hHeap, DWORD dwFlags, ADDRESS_FAMILY dwFamily);
  ERROR_CODE       AllocateAndGetUdpExTableFromStack( PVOID* ppUDPTable, BOOL bOrder, HANDLE hHeap, DWORD dwFlags, ADDRESS_FAMILY dwFamily);
  BOOL             IcmpCloseHandle(                   HANDLE IcmpHandle);
  FILE_HANDLE      IcmpCreateFile(                    );
  DWORD            IcmpParseReplies(                  LPVOID ReplyBuffer, DWORD ReplySize);
  ERROR_CODE       IcmpSendEcho(                      HANDLE IcmpHandle, IPAddr DestinationAddress, LPVOID RequestData, WORD RequestSize, PIP_OPTION_INFORMATION RequestOptions, LPVOID ReplyBuffer, DWORD ReplySize, DWORD Timeout);
  ERROR_CODE       IcmpSendEcho2(                     HANDLE IcmpHandle, HANDLE Event, PIO_APC_ROUTINE ApcRoutine, PVOID ApcContext, IPAddr DestinationAddress, LPVOID RequestData, WORD RequestSize, PIP_OPTION_INFORMATION RequestOptions, LPVOID ReplyBuffer, DWORD ReplySize, DWORD Timeout);
]]
ffi.load( 'Iphlpapi.dll' )

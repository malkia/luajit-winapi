require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
//typedef WCHAR* DHCP_CONST WCHAR*; //Alias
  typedef DWORD DHCP_IP_ADDRESS; //Alias
  typedef DHCP_IP_ADDRESS *LPDHCP_IP_ADDRESS; //Pointer
  typedef DWORD DHCP_IP_MASK; //Alias
  typedef DWORD DHCP_OPTION_ID; //Alias
  typedef DHCP_IP_ADDRESS DHCP_CONST DHCP_IP_ADDRESS; //Alias
  typedef LPWSTR DHCP_CONST LPWSTR; //Alias
  typedef DWORD DHCP_RESUME_HANDLE; //Alias
  typedef BOOL DHCP_CONST BOOL; //Alias
  enum { MAX_PATTERN_LENGTH = 255 };
  typedef struct DHCP_ADDR_PATTERN {
    BOOL MatchHWType;
    BYTE HWType;
    BOOL IsWildcard;
    BYTE Length;
    BYTE Pattern[MAX_PATTERN_LENGTH];
  } DHCP_ADDR_PATTERN;
  typedef DHCP_ADDR_PATTERN *LPDHCP_ADDR_PATTERN; //Pointer
  typedef struct DHCP_IPV6_ADDRESS {
    ULONGLONG HighOrderBits;
    ULONGLONG LowOrderBits;
  } DHCP_IPV6_ADDRESS;
  typedef DHCP_IPV6_ADDRESS *LPDHCP_IPV6_ADDRESS; //Pointer
  typedef struct DHCP_IP_RANGE_V6 {
    DHCP_IPV6_ADDRESS StartAddress;
    DHCP_IPV6_ADDRESS EndAddress;
  } DHCP_IP_RANGE_V6;
  typedef struct DHCP_BINARY_DATA {
    DWORD DataLength;
    BYTE* Data;
  } DHCP_BINARY_DATA;
  typedef DHCP_BINARY_DATA DHCP_CLIENT_UID; //Alias
  typedef struct DHCP_IP_RESERVATION_V6 {
    DHCP_IPV6_ADDRESS ReservedIpAddress;
    DHCP_CLIENT_UID* ReservedForClient;
    DWORD InterfaceId;
  } DHCP_IP_RESERVATION_V6;
  typedef struct DHCP_IP_RANGE {
    DHCP_IP_ADDRESS StartAddress;
    DHCP_IP_ADDRESS EndAddress;
  } DHCP_IP_RANGE;
  typedef UINT DHCP_OPTION_DATA_TYPE; //Alias
  static const DHCP_OPTION_DATA_TYPE DhcpByteOption = 0;
  static const DHCP_OPTION_DATA_TYPE DhcpWordOption = 1;
  static const DHCP_OPTION_DATA_TYPE DhcpDWordOption = 2;
  static const DHCP_OPTION_DATA_TYPE DhcpDWordDWordOption = 3;
  static const DHCP_OPTION_DATA_TYPE DhcpIpAddressOption = 4;
  static const DHCP_OPTION_DATA_TYPE DhcpStringDataOption = 5;
  static const DHCP_OPTION_DATA_TYPE DhcpBinaryDataOption = 6;
  static const DHCP_OPTION_DATA_TYPE DhcpEncapsulatedDataOption = 7;
  static const DHCP_OPTION_DATA_TYPE DhcpIpv6AddressOption = 8;
  typedef struct DWORD_DWORD {
    DWORD DWord1;
    DWORD DWord2;
  } DWORD_DWORD;
  typedef union DHCP_OPTION_ELEMENT_UNION {
    BYTE ByteOption;
    WORD WordOption;
    DWORD DWordOption;
    DWORD_DWORD DWordDWordOption;
    DHCP_IP_ADDRESS IpAddressOption;
    LPWSTR StringDataOption;
    DHCP_BINARY_DATA BinaryDataOption;
    DHCP_BINARY_DATA EncapsulatedDataOption;
    LPWSTR Ipv6AddressDataOption;
  } DHCP_OPTION_ELEMENT_UNION;
  typedef struct DHCP_OPTION_DATA_ELEMENT {
    DHCP_OPTION_DATA_TYPE OptionType;
    DHCP_OPTION_ELEMENT_UNION Element;
  } DHCP_OPTION_DATA_ELEMENT;
  typedef DHCP_OPTION_DATA_ELEMENT *LPDHCP_OPTION_DATA_ELEMENT; //Pointer
  typedef struct DHCP_BOOTP_IP_RANGE {
    DHCP_IP_ADDRESS StartAddress;
    DHCP_IP_ADDRESS EndAddress;
    ULONG BootpAllocated;
    ULONG MaxBootpAllowed;
  } DHCP_BOOTP_IP_RANGE;
  typedef struct DHCP_HOST_INFO {
    DHCP_IP_ADDRESS IpAddress;
    LPWSTR NetBiosName;
    LPWSTR HostName;
  } DHCP_HOST_INFO;
  typedef struct DHCP_IP_CLUSTER {
    DHCP_IP_ADDRESS ClusterAddress;
    DWORD ClusterMask;
  } DHCP_IP_CLUSTER;
  typedef struct DHCP_IP_RESERVATION_V4 {
    DHCP_IP_ADDRESS ReservedIpAddress;
    DHCP_CLIENT_UID* ReservedForClient;
    BYTE bAllowedClientTypes;
  } DHCP_IP_RESERVATION_V4;
  typedef union DHCP_SUBNET_ELEMENT_UNION_V5 {
    DHCP_BOOTP_IP_RANGE* IpRange;
    DHCP_HOST_INFO* SecondaryHost;
    DHCP_IP_RESERVATION_V4* ReservedIp;
    DHCP_IP_RANGE* ExcludeIpRange;
    DHCP_IP_CLUSTER* IpUsedCluster;
  } DHCP_SUBNET_ELEMENT_UNION_V5;
  typedef UINT DHCP_SUBNET_ELEMENT_TYPE; //Alias
  static const DHCP_SUBNET_ELEMENT_TYPE DhcpIpRanges = 0;
  static const DHCP_SUBNET_ELEMENT_TYPE DhcpSecondaryHosts = 1;
  static const DHCP_SUBNET_ELEMENT_TYPE DhcpReservedIps = 2;
  static const DHCP_SUBNET_ELEMENT_TYPE DhcpExcludedIpRanges = 3;
  static const DHCP_SUBNET_ELEMENT_TYPE DhcpIpUsedClusters = 4;
  static const DHCP_SUBNET_ELEMENT_TYPE DhcpIpRangesDhcpOnly = 5;
  static const DHCP_SUBNET_ELEMENT_TYPE DhcpIpRangesDhcpBootp = 6;
  static const DHCP_SUBNET_ELEMENT_TYPE DhcpIpRangesBootpOnly = 7;
  typedef struct DHCP_SUBNET_ELEMENT_DATA_V5 {
    DHCP_SUBNET_ELEMENT_TYPE ElementType;
    DHCP_SUBNET_ELEMENT_UNION_V5 Element;
  } DHCP_SUBNET_ELEMENT_DATA_V5;
  typedef DHCP_SUBNET_ELEMENT_DATA_V5 *DHCP_CONST DHCP_SUBNET_ELEMENT_DATA_V5*; //Pointer
  typedef UINT DHCP_SEARCH_INFO_TYPE; //Alias
  static const DHCP_SEARCH_INFO_TYPE DhcpClientIpAddress = 0;
  static const DHCP_SEARCH_INFO_TYPE DhcpClientHardwareAddress = 1;
  static const DHCP_SEARCH_INFO_TYPE DhcpClientName = 2;
  typedef union DHCP_CLIENT_SEARCH_UNION {
    DHCP_IP_ADDRESS ClientIpAddress;
    DHCP_CLIENT_UID ClientHardwareAddress;
    LPWSTR ClientName;
  } DHCP_CLIENT_SEARCH_UNION;
  typedef struct DHCP_SEARCH_INFO {
    DHCP_SEARCH_INFO_TYPE SearchType;
    DHCP_CLIENT_SEARCH_UNION SearchInfo;
  } DHCP_SEARCH_INFO;
  typedef DHCP_SEARCH_INFO *LPDHCP_SEARCH_INFO; //Pointer
  typedef DHCP_SEARCH_INFO *DHCP_CONST DHCP_SEARCH_INFO*; //Pointer
  typedef struct DHCP_RESERVED_SCOPE {
    DHCP_IP_ADDRESS ReservedIpAddress;
    DHCP_IP_ADDRESS ReservedIpSubnetAddress;
  } DHCP_RESERVED_SCOPE;
  typedef union DHCP_OPTION_SCOPE_UNION {
    PVOID DefaultScopeInfo;
    PVOID GlobalScopeInfo;
    DHCP_IP_ADDRESS SubnetScopeInfo;
    DHCP_RESERVED_SCOPE ReservedScopeInfo;
    LPWSTR MScopeInfo;
  } DHCP_OPTION_SCOPE_UNION;
  typedef UINT DHCP_OPTION_SCOPE_TYPE; //Alias
  static const DHCP_OPTION_SCOPE_TYPE DhcpDefaultOptions = 0;
  static const DHCP_OPTION_SCOPE_TYPE DhcpGlobalOptions = 1;
  static const DHCP_OPTION_SCOPE_TYPE DhcpSubnetOptions = 2;
  static const DHCP_OPTION_SCOPE_TYPE DhcpReservedOptions = 3;
  static const DHCP_OPTION_SCOPE_TYPE DhcpMScopeOptions = 4;
  typedef struct DHCP_OPTION_SCOPE_INFO {
    DHCP_OPTION_SCOPE_TYPE ScopeType;
    DHCP_OPTION_SCOPE_UNION ScopeInfo;
  } DHCP_OPTION_SCOPE_INFO;
  typedef DHCP_OPTION_SCOPE_INFO *LPDHCP_OPTION_SCOPE_INFO; //Pointer
  typedef DHCP_OPTION_SCOPE_INFO *DHCP_CONST DHCP_OPTION_SCOPE_INFO*; //Pointer
  typedef struct DHCP_OPTION_DATA {
    DWORD NumElements;
    LPDHCP_OPTION_DATA_ELEMENT Elements;
  } DHCP_OPTION_DATA;
  typedef DHCP_OPTION_DATA *LPDHCP_OPTION_DATA; //Pointer
  typedef struct DHCP_OPTION_VALUE {
    DHCP_OPTION_ID OptionID;
    DHCP_OPTION_DATA Value;
  } DHCP_OPTION_VALUE;
  typedef DHCP_OPTION_VALUE *LPDHCP_OPTION_VALUE; //Pointer
  typedef struct DHCP_OPTION_VALUE_ARRAY {
    DWORD NumElements;
    LPDHCP_OPTION_VALUE Values;
  } DHCP_OPTION_VALUE_ARRAY;
  typedef DHCP_OPTION_VALUE_ARRAY *LPDHCP_OPTION_VALUE_ARRAY; //Pointer
  typedef struct WINAPI_DHCP_ALL_OPTION_VALUES_s {
    LPWSTR ClassName;
    LPWSTR VendorName;
    BOOL IsVendor;
    LPDHCP_OPTION_VALUE_ARRAY OptionsArray;
  } WINAPI_DHCP_ALL_OPTION_VALUES_s;
  typedef struct DHCP_ALL_OPTION_VALUES {
    DWORD Flags;
    DWORD NumElements;
    WINAPI_DHCP_ALL_OPTION_VALUES_s* Options;
  } DHCP_ALL_OPTION_VALUES;
  typedef DHCP_ALL_OPTION_VALUES *LPDHCP_ALL_OPTION_VALUES*; //Pointer
  typedef struct DHCP_IP_RESERVATION {
    DHCP_IP_ADDRESS ReservedIpAddress;
    DHCP_CLIENT_UID* ReservedForClient;
  } DHCP_IP_RESERVATION;
  typedef union DHCP_SUBNET_ELEMENT_UNION {
    DHCP_IP_RANGE* IpRange;
    DHCP_HOST_INFO* SecondaryHost;
    DHCP_IP_RESERVATION* ReservedIp;
    DHCP_IP_RANGE* ExcludeIpRange;
    DHCP_IP_CLUSTER* IpUsedCluster;
  } DHCP_SUBNET_ELEMENT_UNION;
  typedef struct DHCP_SUBNET_ELEMENT_DATA {
    DHCP_SUBNET_ELEMENT_TYPE ElementType;
    DHCP_SUBNET_ELEMENT_UNION Element;
  } DHCP_SUBNET_ELEMENT_DATA;
  typedef DHCP_SUBNET_ELEMENT_DATA *LPDHCP_SUBNET_ELEMENT_DATA; //Pointer
  typedef UINT DHCP_SUBNET_ELEMENT_TYPE_V6; //Alias
  static const DHCP_SUBNET_ELEMENT_TYPE_V6 Dhcpv6IpRanges = 0;
  static const DHCP_SUBNET_ELEMENT_TYPE_V6 Dhcpv6ReservedIps = 1;
  static const DHCP_SUBNET_ELEMENT_TYPE_V6 Dhcpv6ExcludedIpRanges = 2;
  typedef union DHCP_SUBNET_ELEMENT_UNION_V6 {
    DHCP_IP_RANGE_V6* IpRange;
    DHCP_IP_RESERVATION_V6* ReservedIp;
    DHCP_IP_RANGE_V6* ExcludeIpRange;
  } DHCP_SUBNET_ELEMENT_UNION_V6;
  typedef struct DHCP_SUBNET_ELEMENT_DATA_V6 {
    DHCP_SUBNET_ELEMENT_TYPE_V6 ElementType;
    DHCP_SUBNET_ELEMENT_UNION_V6 Element;
  } DHCP_SUBNET_ELEMENT_DATA_V6;
  typedef DHCP_SUBNET_ELEMENT_DATA_V6 *LPDHCP_SUBNET_ELEMENT_DATA_V6; //Pointer
  typedef UINT DHCP_SEARCH_INFO_TYPE_V6; //Alias
  static const DHCP_SEARCH_INFO_TYPE_V6 Dhcpv6ClientIpAddress = 0;
  static const DHCP_SEARCH_INFO_TYPE_V6 Dhcpv6ClientDUID = 1;
  static const DHCP_SEARCH_INFO_TYPE_V6 Dhcpv6ClientName = 2;
  typedef union DHCP_CLIENT_SEARCH_UNION_V6 {
    DHCP_IPV6_ADDRESS ClientIpAddress;
    DHCP_CLIENT_UID ClientDUID;
    LPWSTR ClientName;
  } DHCP_CLIENT_SEARCH_UNION_V6;
  typedef struct DHCP_SEARCH_INFO_V6 {
    DHCP_SEARCH_INFO_TYPE_V6 SearchType;
    DHCP_CLIENT_SEARCH_UNION_V6 SearchInfo;
  } DHCP_SEARCH_INFO_V6;
  typedef DHCP_SEARCH_INFO_V6 *LPDHCP_SEARCH_INFO_V6; //Pointer
  typedef DHCP_SEARCH_INFO_V6 *DHCP_CONST DHCP_SEARCH_INFO_V6*; //Pointer
  typedef struct DHCP_RESERVED_SCOPE6 {
    DHCP_IPV6_ADDRESS ReservedIpAddress;
    DHCP_IPV6_ADDRESS ReservedIpSubnetAddress;
  } DHCP_RESERVED_SCOPE6;
  typedef UINT DHCP_OPTION_SCOPE_TYPE6; //Alias
  static const DHCP_OPTION_SCOPE_TYPE6 DhcpDefaultOptions6 = 0;
  static const DHCP_OPTION_SCOPE_TYPE6 DhcpScopeOptions6 = 1;
  static const DHCP_OPTION_SCOPE_TYPE6 DhcpReservedOptions6 = 2;
  static const DHCP_OPTION_SCOPE_TYPE6 DhcpGlobalOptions6 = 3;
  typedef union DHCP_OPTION_SCOPE_UNION6 {
    PVOID DefaultScopeInfo;
    DHCP_IPV6_ADDRESS SubnetScopeInfo;
    DHCP_RESERVED_SCOPE6 ReservedScopeInfo;
  } DHCP_OPTION_SCOPE_UNION6;
  typedef struct DHCP_OPTION_SCOPE_INFO6 {
    DHCP_OPTION_SCOPE_TYPE6 ScopeType;
    DHCP_OPTION_SCOPE_UNION6 ScopeInfo;
  } DHCP_OPTION_SCOPE_INFO6;
  typedef DHCP_OPTION_SCOPE_INFO6 *LPDHCP_OPTION_SCOPE_INFO6; //Pointer
  typedef UINT DHCP_OPTION_TYPE; //Alias
  static const DHCP_OPTION_TYPE DhcpUnaryElementTypeOption = 0;
  static const DHCP_OPTION_TYPE DhcpArrayTypeOption = 1;
  typedef struct DHCP_OPTION {
    DHCP_OPTION_ID OptionID;
    LPWSTR OptionName;
    LPWSTR OptionComment;
    DHCP_OPTION_DATA DefaultValue;
    DHCP_OPTION_TYPE OptionType;
  } DHCP_OPTION;
  typedef DHCP_OPTION *LPDHCP_OPTION; //Pointer
  typedef struct DHCP_OPTION_ARRAY {
    DWORD NumElements;
    LPDHCP_OPTION Options;
  } DHCP_OPTION_ARRAY;
  typedef DHCP_OPTION_ARRAY *LPDHCP_OPTION_ARRAY; //Pointer
  typedef struct WINAPI_DHCP_ALL_OPTIONS_s {
    DHCP_OPTION Option;
    LPWSTR VendorName;
    LPWSTR ClassName;
  } WINAPI_DHCP_ALL_OPTIONS_s;
  typedef struct DHCP_ALL_OPTIONS {
    DWORD Flags;
    LPDHCP_OPTION_ARRAY NonVendorOptions;
    DWORD NumVendorOptions;
    WINAPI_DHCP_ALL_OPTIONS_s* VendorOptions;
  } DHCP_ALL_OPTIONS;
  typedef DHCP_ALL_OPTIONS *LPDHCP_ALL_OPTIONS; //Pointer
  typedef UINT DHCP_FILTER_LIST_TYPE; //Alias
  static const DHCP_FILTER_LIST_TYPE Deny = 0;
  static const DHCP_FILTER_LIST_TYPE Allow = 1;
  typedef struct DHCP_FILTER_ADD_INFO {
    DHCP_ADDR_PATTERN AddrPatt;
    LPWSTR Comment;
    DHCP_FILTER_LIST_TYPE ListType;
  } DHCP_FILTER_ADD_INFO;
  typedef struct DHCP_FILTER_RECORD {
    DHCP_ADDR_PATTERN AddrPatt;
    LPWSTR Comment;
  } DHCP_FILTER_RECORD;
  typedef DHCP_FILTER_RECORD *LPDHCP_FILTER_RECORD; //Pointer
  typedef struct DATE_TIME {
    DWORD dwLowDateTime;
    DWORD dwHighDateTime;
  } DATE_TIME;
  typedef struct DHCP_CLASS_INFO {
    LPWSTR ClassName;
    LPWSTR ClassComment;
    DWORD ClassDataLength;
    BOOL IsVendor;
    DWORD Flags;
    LPBYTE ClassData;
  } DHCP_CLASS_INFO;
  typedef DHCP_CLASS_INFO *LPDHCP_CLASS_INFO; //Pointer
  typedef struct DHCP_CLIENT_INFO {
    DHCP_IP_ADDRESS ClientIpAddress;
    DHCP_IP_MASK SubnetMask;
    DHCP_CLIENT_UID ClientHardwareAddress;
    LPWSTR ClientName;
    LPWSTR ClientComment;
    DATE_TIME ClientLeaseExpires;
    DHCP_HOST_INFO OwnerHost;
  } DHCP_CLIENT_INFO;
  typedef DHCP_CLIENT_INFO *DHCP_CONST DHCP_CLIENT_INFO*; //Pointer
  typedef DHCP_CLIENT_INFO *LPDHCP_CLIENT_INFO; //Pointer
  typedef struct DHCP_CLIENT_INFO_V4 {
    DHCP_IP_ADDRESS ClientIpAddress;
    DHCP_IP_MASK SubnetMask;
    DHCP_CLIENT_UID ClientHardwareAddress;
    LPWSTR ClientName;
    LPWSTR ClientComment;
    DATE_TIME ClientLeaseExpires;
    DHCP_HOST_INFO OwnerHost;
    BYTE bClientType;
  } DHCP_CLIENT_INFO_V4;
  typedef DHCP_CLIENT_INFO_V4 *DHCP_CONST DHCP_CLIENT_INFO_V4*; //Pointer
  typedef DHCP_CLIENT_INFO_V4 *LPDHCP_CLIENT_INFO_V4*; //Pointer
  typedef UINT QuarantineStatus; //Alias
  static const QuarantineStatus NOQUARANTINE = 0;
  static const QuarantineStatus RESTRICTEDACCESS = 1;
  static const QuarantineStatus DROPPACKET = 2;
  static const QuarantineStatus PROBATION = 3;
  static const QuarantineStatus EXEMPT = 4;
  static const QuarantineStatus DEFAULTQUARSETTING = 5;
  static const QuarantineStatus NOQUARINFO = 6;
  typedef struct DHCP_CLIENT_INFO_VQ {
    DHCP_IP_ADDRESS ClientIpAddress;
    DHCP_IP_MASK SubnetMask;
    DHCP_CLIENT_UID ClientHardwareAddress;
    LPWSTR ClientName;
    LPWSTR ClientComment;
    DATE_TIME ClientLeaseExpires;
    DHCP_HOST_INFO OwnerHost;
    BYTE bClientType;
    BYTE AddressState;
    QuarantineStatus Status;
    DATE_TIME ProbationEnds;
    BOOL QuarantineCapable;
  } DHCP_CLIENT_INFO_VQ;
  typedef DHCP_CLIENT_INFO_VQ *LPDHCP_CLIENT_INFO_VQ; //Pointer
  typedef UINT DHCP_SUBNET_STATE; //Alias
  static const DHCP_SUBNET_STATE DhcpSubnetEnabled = 0;
  static const DHCP_SUBNET_STATE DhcpSubnetDisabled = 1;
  static const DHCP_SUBNET_STATE DhcpSubnetEnabledSwitched = 2;
  static const DHCP_SUBNET_STATE DhcpSubnetDisabledSwitched = 3;
  static const DHCP_SUBNET_STATE DhcpSubnetInvalidState = 4;
  typedef struct DHCP_SUBNET_INFO {
    DHCP_IP_ADDRESS SubnetAddress;
    DHCP_IP_MASK SubnetMask;
    LPWSTR SubnetName;
    LPWSTR SubnetComment;
    DHCP_HOST_INFO PrimaryHost;
    DHCP_SUBNET_STATE SubnetState;
  } DHCP_SUBNET_INFO;
  typedef DHCP_SUBNET_INFO *DHCP_CONST DHCP_SUBNET_INFO*; //Pointer
  typedef DHCP_SUBNET_INFO *LPDHCP_SUBNET_INFO; //Pointer
  typedef struct DHCP_SUBNET_INFO_VQ {
    DHCP_IP_ADDRESS SubnetAddress;
    DHCP_IP_MASK SubnetMask;
    LPWSTR SubnetName;
    LPWSTR SubnetComment;
    DHCP_HOST_INFO PrimaryHost;
    DHCP_SUBNET_STATE SubnetState;
    DWORD QuarantineOn;
    DWORD Reserved1;
    DWORD Reserved2;
    INT64 Reserved3;
    INT64 Reserved4;
  } DHCP_SUBNET_INFO_VQ;
  typedef DHCP_SUBNET_INFO_VQ *DHCP_CONST DHCP_SUBNET_INFO_VQ*; //Pointer
  typedef DHCP_SUBNET_INFO_VQ *LPDHCP_SUBNET_INFO_VQ; //Pointer
  typedef UINT DHCP_FORCE_FLAG; //Alias
  static const DHCP_FORCE_FLAG DhcpFullForce = 0;
  static const DHCP_FORCE_FLAG DhcpNoForce = 1;
  typedef struct DHCP_CLASS_INFO_ARRAY {
    DWORD NumElements;
    LPDHCP_CLASS_INFO Classes;
  } DHCP_CLASS_INFO_ARRAY;
  typedef DHCP_CLASS_INFO_ARRAY *LPDHCP_CLASS_INFO_ARRAY; //Pointer
  typedef struct DHCP_FILTER_ENUM_INFO {
    DWORD NumElements;
    LPDHCP_FILTER_RECORD pEnumRecords;
  } DHCP_FILTER_ENUM_INFO;
  typedef DHCP_FILTER_ENUM_INFO *LPDHCP_FILTER_ENUM_INFO; //Pointer
  typedef struct DHCPDS_SERVER {
    DWORD Version;
    LPWSTR ServerName;
    DWORD ServerAddress;
    DWORD Flags;
    DWORD State;
    LPWSTR DsLocation;
    DWORD DsLocType;
  } DHCPDS_SERVER;
  typedef DHCPDS_SERVER *LPDHCPDS_SERVER; //Pointer
  typedef DHCPDS_SERVER *LPDHCP_SERVER_INFO; //Pointer
  typedef struct DHCPDS_SERVERS {
    DWORD Flags;
    DWORD NumElements;
    LPDHCPDS_SERVER Servers;
  } DHCPDS_SERVERS;
  typedef DHCPDS_SERVERS *LPDHCP_SERVER_INFO_ARRAY; //Pointer
  typedef struct DHCP_CLIENT_INFO_ARRAY {
    DWORD NumElements;
    LPDHCP_CLIENT_INFO* Clients;
  } DHCP_CLIENT_INFO_ARRAY;
  typedef DHCP_CLIENT_INFO_ARRAY *LPDHCP_CLIENT_INFO_ARRAY; //Pointer
  typedef struct DHCP_CLIENT_INFO_V5 {
    DHCP_IP_ADDRESS ClientIpAddress;
    DHCP_IP_MASK SubnetMask;
    DHCP_CLIENT_UID ClientHardwareAddress;
    LPWSTR ClientName;
    LPWSTR ClientComment;
    DATE_TIME ClientLeaseExpires;
    DHCP_HOST_INFO OwnerHost;
    BYTE bClientType;
    BYTE AddressState;
  } DHCP_CLIENT_INFO_V5;
  typedef DHCP_CLIENT_INFO_V5 *LPDHCP_CLIENT_INFO_V5; //Pointer
  typedef struct DHCP_CLIENT_INFO_ARRAY_V5 {
    DWORD NumElements;
    LPDHCP_CLIENT_INFO_V5* Clients;
  } DHCP_CLIENT_INFO_ARRAY_V5;
  typedef DHCP_CLIENT_INFO_ARRAY_V5 *LPDHCP_CLIENT_INFO_ARRAY_V5; //Pointer
  typedef struct DHCP_CLIENT_INFO_ARRAY_VQ {
    DWORD NumElements;
    LPDHCP_CLIENT_INFO_VQ* Clients;
  } DHCP_CLIENT_INFO_ARRAY_VQ;
  typedef DHCP_CLIENT_INFO_ARRAY_VQ *LPDHCP_CLIENT_INFO_ARRAY_VQ; //Pointer
  typedef struct DHCP_CLIENT_FILTER_STATUS_INFO {
    DHCP_IP_ADDRESS ClientIpAddress;
    DHCP_IP_MASK SubnetMask;
    DHCP_CLIENT_UID ClientHardwareAddress;
    LPWSTR ClientName;
    LPWSTR ClientComment;
    DATE_TIME ClientLeaseExpires;
    DHCP_HOST_INFO OwnerHost;
    BYTE bClientType;
    BYTE AddressState;
    QuarantineStatus Status;
    DATE_TIME ProbationEnds;
    BOOL QuarantineCapable;
    DWORD FilterStatus;
  } DHCP_CLIENT_FILTER_STATUS_INFO;
  typedef DHCP_CLIENT_FILTER_STATUS_INFO *LPDHCP_CLIENT_FILTER_STATUS_INFO; //Pointer
  typedef struct DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY {
    DWORD NumElements;
    LPDHCP_CLIENT_FILTER_STATUS_INFO* Clients;
  } DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY;
  typedef DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY *LPDHCP_CLIENT_FILTER_STATUS_INFO_ARRAY; //Pointer
  typedef struct DHCP_SUBNET_ELEMENT_INFO_ARRAY {
    DWORD NumElements;
    LPDHCP_SUBNET_ELEMENT_DATA Elements;
  } DHCP_SUBNET_ELEMENT_INFO_ARRAY;
  typedef DHCP_SUBNET_ELEMENT_INFO_ARRAY *LPDHCP_SUBNET_ELEMENT_INFO_ARRAY; //Pointer
  typedef struct DHCP_IP_ARRAY {
    DWORD NumElements;
    LPDHCP_IP_ADDRESS Elements;
  } DHCP_IP_ARRAY;
  typedef DHCP_IP_ARRAY *LPDHCP_IP_ARRAY; //Pointer
  typedef struct DHCP_FILTER_GLOBAL_INFO {
    BOOL EnforceAllowList;
    BOOL EnforceDenyList;
  } DHCP_FILTER_GLOBAL_INFO;
  typedef struct SCOPE_MIB_INFO_V5 {
    DHCP_IP_ADDRESS Subnet;
    DWORD NumAddressesInuse;
    DWORD NumAddressesFree;
    DWORD NumPendingOffers;
  } SCOPE_MIB_INFO_V5;
  typedef SCOPE_MIB_INFO_V5 *LPSCOPE_MIB_INFO_V5; //Pointer
  typedef struct DHCP_MIB_INFO_V5 {
    DWORD Discovers;
    DWORD Offers;
    DWORD Requests;
    DWORD Acks;
    DWORD Naks;
    DWORD Declines;
    DWORD Releases;
    DATE_TIME ServerStartTime;
    DWORD QtnNumLeases;
    DWORD QtnPctQtnLeases;
    DWORD QtnProbationLeases;
    DWORD QtnNonQtnLeases;
    DWORD QtnExemptLeases;
    DWORD QtnCapableClients;
    DWORD QtnIASErrors;
    DWORD DelayedOffers;
    DWORD ScopesWithDelayedOffers;
    DWORD Scopes;
    LPSCOPE_MIB_INFO_V5 ScopeInfo;
  } DHCP_MIB_INFO_V5;
  typedef DHCP_MIB_INFO_V5 *LPDHCP_MIB_INFO_V5; //Pointer
  typedef struct DHCP_BIND_ELEMENT {
    ULONG Flags;
    BOOL fBoundToDHCPServer;
    DHCP_IP_ADDRESS AdapterPrimaryAddress;
    DHCP_IP_ADDRESS AdapterSubnetAddress;
    LPWSTR IfDescription;
    ULONG IfIdSize;
    LPBYTE IfId;
  } DHCP_BIND_ELEMENT;
  typedef DHCP_BIND_ELEMENT *LPDHCP_BIND_ELEMENT; //Pointer
  typedef struct DHCP_BIND_ELEMENT_ARRAY {
    DWORD NumElements;
    LPDHCP_BIND_ELEMENT Elements;
  } DHCP_BIND_ELEMENT_ARRAY;
  typedef DHCP_BIND_ELEMENT_ARRAY *LPDHCP_BIND_ELEMENT_ARRAY; //Pointer
  typedef struct DHCP_SUPER_SCOPE_TABLE_ENTRY {
    DHCP_IP_ADDRESS SubnetAddress;
    DWORD SuperScopeNumber;
    DWORD NextInSuperScope;
    LPWSTR SuperScopeName;
  } DHCP_SUPER_SCOPE_TABLE_ENTRY;
  typedef DHCP_SUPER_SCOPE_TABLE_ENTRY *LPDHCP_SUPER_SCOPE_TABLE; //Pointer
  typedef struct DHCP_SERVER_CONFIG_INFO_VQ {
    DWORD APIProtocolSupport;
    LPWSTR DatabaseName;
    LPWSTR DatabasePath;
    LPWSTR BackupPath;
    DWORD BackupInterval;
    DWORD DatabaseLoggingFlag;
    DWORD RestoreFlag;
    DWORD DatabaseCleanupInterval;
    DWORD DebugFlag;
    DWORD dwPingRetries;
    DWORD cbBootTableString;
    WCHAR* wszBootTableString;
    BOOL fAuditLog;
    BOOL QuarantineOn;
    DWORD QuarDefFail;
    BOOL QuarRuntimeStatus;
  } DHCP_SERVER_CONFIG_INFO_VQ;
  typedef DHCP_SERVER_CONFIG_INFO_VQ *LPDHCP_SERVER_CONFIG_INFO_VQ; //Pointer
  typedef struct DHCP_SERVER_CONFIG_INFO_V4 {
    DWORD APIProtocolSupport;
    LPWSTR DatabaseName;
    LPWSTR DatabasePath;
    LPWSTR BackupPath;
    DWORD BackupInterval;
    DWORD DatabaseLoggingFlag;
    DWORD RestoreFlag;
    DWORD DatabaseCleanupInterval;
    DWORD DebugFlag;
    DWORD dwPingRetries;
    DWORD cbBootTableString;
    WCHAR* wszBootTableString;
    BOOL fAuditLog;
  } DHCP_SERVER_CONFIG_INFO_V4;
  typedef DHCP_SERVER_CONFIG_INFO_V4 *LPDHCP_SERVER_CONFIG_INFO_V4; //Pointer
  typedef DHCP_IPV6_ADDRESS DHCP_RESUME_IPV6_HANDLE; //Alias
  typedef struct DHCP_CLASS_INFO_V6 {
    LPWSTR ClassName;
    LPWSTR ClassComment;
    DWORD ClassDataLength;
    BOOL IsVendor;
    DWORD EnterpriseNumber;
    DWORD Flags;
    LPBYTE ClassData;
  } DHCP_CLASS_INFO_V6;
  typedef DHCP_CLASS_INFO_V6 *LPDHCP_CLASS_INFO_V6; //Pointer
  typedef struct DHCP_SUBNET_INFO_V6 {
    DHCP_IPV6_ADDRESS SubnetAddress;
    ULONG Prefix;
    USHORT Preference;
    LPWSTR SubnetName;
    LPWSTR SubnetComment;
    DWORD State;
    DWORD ScopeId;
  } DHCP_SUBNET_INFO_V6;
  typedef DHCP_SUBNET_INFO_V6 *LPDHCP_SUBNET_INFO_V6; //Pointer
  typedef struct DHCP_CLASS_INFO_ARRAY_V6 {
    DWORD NumElements;
    LPDHCP_CLASS_INFO_V6 Classes;
  } DHCP_CLASS_INFO_ARRAY_V6;
  typedef DHCP_CLASS_INFO_ARRAY_V6 *LPDHCP_CLASS_INFO_ARRAY_V6; //Pointer
  typedef struct DHCPV6_IP_ARRAY {
    DWORD NumElements;
    LPDHCP_IPV6_ADDRESS Elements;
  } DHCPV6_IP_ARRAY;
  typedef DHCPV6_IP_ARRAY *LPDHCPV6_IP_ARRAY; //Pointer
  typedef struct DHCP_HOST_INFO_V6 {
    DHCP_IPV6_ADDRESS IpAddress;
    LPWSTR NetBiosName;
    LPWSTR HostName;
  } DHCP_HOST_INFO_V6;
  typedef struct DHCP_CLIENT_INFO_V6 {
    DHCP_IPV6_ADDRESS ClientIpAddress;
    DHCP_CLIENT_UID ClientDUID;
    DWORD AddressType;
    DWORD IAID;
    LPWSTR ClientName;
    LPWSTR ClientComment;
    DATE_TIME ClientValidLeaseExpires;
    DATE_TIME ClientPrefLeaseExpires;
    DHCP_HOST_INFO_V6 OwnerHost;
  } DHCP_CLIENT_INFO_V6;
  typedef DHCP_CLIENT_INFO_V6 *LPDHCP_CLIENT_INFO_V6; //Pointer
  typedef struct DHCP_CLIENT_INFO_ARRAY_V6 {
    DWORD NumElements;
    LPDHCP_CLIENT_INFO_V6* Clients;
  } DHCP_CLIENT_INFO_ARRAY_V6;
  typedef DHCP_CLIENT_INFO_ARRAY_V6 *LPDHCP_CLIENT_INFO_ARRAY_V6; //Pointer
  typedef struct DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6 {
    DWORD NumElements;
    LPDHCP_SUBNET_ELEMENT_DATA_V6 Elements;
  } DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6;
  typedef DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6 *LPDHCP_SUBNET_ELEMENT_INFO_ARRAY_V6; //Pointer
  typedef struct SCOPE_MIB_INFO_V6 {
    DHCP_IPV6_ADDRESS Subnet;
    ULONGLONG NumAddressesInuse;
    ULONGLONG NumAddressesFree;
    ULONGLONG NumPendingAdvertises;
  } SCOPE_MIB_INFO_V6;
  typedef SCOPE_MIB_INFO_V6 *LPSCOPE_MIB_INFO_V6; //Pointer
  typedef struct DHCP_MIB_INFO_V6 {
    DWORD Solicits;
    DWORD Advertises;
    DWORD Requests;
    DWORD Renews;
    DWORD Rebinds;
    DWORD Replies;
    DWORD Confirms;
    DWORD Declines;
    DWORD Releases;
    DWORD Informs;
    DATE_TIME ServerStartTime;
    DWORD Scopes;
    LPSCOPE_MIB_INFO_V6 ScopeInfo;
  } DHCP_MIB_INFO_V6;
  typedef DHCP_MIB_INFO_V6 *LPDHCP_MIB_INFO_V6; //Pointer
  typedef struct DHCPV6_BIND_ELEMENT {
    ULONG Flags;
    BOOL fBoundToDHCPServer;
    DHCP_IPV6_ADDRESS AdapterPrimaryAddress;
    DHCP_IPV6_ADDRESS AdapterSubnetAddress;
    LPWSTR IfDescription;
    DWORD IpV6IfIndex;
    ULONG IfIdSize;
    LPBYTE IfId;
  } DHCPV6_BIND_ELEMENT;
  typedef DHCPV6_BIND_ELEMENT *LPDHCPV6_BIND_ELEMENT; //Pointer
  typedef struct DHCPV6_BIND_ELEMENT_ARRAY {
    DWORD NumElements;
    LPDHCPV6_BIND_ELEMENT Elements;
  } DHCPV6_BIND_ELEMENT_ARRAY;
  typedef DHCPV6_BIND_ELEMENT_ARRAY *LPDHCPV6_BIND_ELEMENT_ARRAY; //Pointer
  typedef struct DHCP_SERVER_CONFIG_INFO_V6 {
    BOOL UnicastFlag;
    BOOL RapidCommitFlag;
    DWORD PreferredLifetime;
    DWORD ValidLifetime;
    DWORD T1;
    DWORD T2;
    DWORD PreferredLifetimeIATA;
    DWORD ValidLifetimeIATA;
    BOOL fAuditLog;
  } DHCP_SERVER_CONFIG_INFO_V6;
  typedef DHCP_SERVER_CONFIG_INFO_V6 *LPDHCP_SERVER_CONFIG_INFO_V6; //Pointer
  DWORD DhcpAddFilterV4(                       DHCP_CONST WCHAR* ServerIpAddress, DHCP_FILTER_ADD_INFO* AddFilterInfo, BOOL ForceFlag);
  DWORD DhcpAddServer(                         DWORD Flags, LPVOID IdInfo, LPDHCP_SERVER_INFO NewServer, LPVOID CallbackFn, LPVOID CallbackData);
  DWORD DhcpAddSubnetElementV5(                DHCP_CONST WCHAR* ServerIpAddress, DHCP_IP_ADDRESS SubnetAddress, DHCP_CONST DHCP_SUBNET_ELEMENT_DATA_V5* AddElementInfo);
  DWORD DhcpAuditLogGetParams(                 LPWSTR ServerIpAddress, DWORD Flags, LPWSTR* AuditLogDir, DWORD* DiskCheckInterval, DWORD* MaxLogFilesSize, DWORD* MinSpaceOnDisk);
  DWORD DhcpAuditLogSetParams(                 LPWSTR ServerIpAddress, DWORD Flags, LPWSTR AuditLogDir, DWORD DiskCheckInterval, DWORD MaxLogFilesSize, DWORD MinSpaceOnDisk);
  DWORD DhcpCreateClass(                       LPWSTR ServerIpAddress, DWORD ReservedMustBeZero, LPDHCP_CLASS_INFO ClassInfo);
  DWORD DhcpCreateClientInfo(                  DHCP_CONST WCHAR* ServerIpAddress, DHCP_CONST DHCP_CLIENT_INFO* ClientInfo);
  DWORD DhcpCreateClientInfoV4(                DHCP_CONST WCHAR* ServerIpAddress, DHCP_CONST DHCP_CLIENT_INFO_V4* ClientInfo);
  DWORD DhcpCreateClientInfoVQ(                DHCP_CONST WCHAR* ServerIpAddress, LPDHCP_CLIENT_INFO_VQ ClientInfo);
  DWORD DhcpCreateOptionV5(                    LPWSTR ServerIpAddress, DWORD Flags, DHCP_OPTION_ID OptionId, LPWSTR ClassName, LPWSTR VendorName, LPDHCP_OPTION OptionInfo);
  DWORD DhcpCreateSubnet(                      DHCP_CONST WCHAR* ServerIpAddress, DHCP_IP_ADDRESS SubnetAddress, DHCP_CONST DHCP_SUBNET_INFO* SubnetInfo);
  DWORD DhcpCreateSubnetVQ(                    WCHAR* ServerIpAddress, DHCP_IP_ADDRESS SubnetAddress, DHCP_CONST DHCP_SUBNET_INFO_VQ* SubnetInfo);
  DWORD DhcpDeleteClass(                       LPWSTR ServerIpAddress, DWORD ReservedMustBeZero, LPWSTR ClassName);
  DWORD DhcpDeleteClientInfo(                  DHCP_CONST WCHAR* ServerIpAddress, DHCP_CONST DHCP_SEARCH_INFO* ClientInfo);
  DWORD DhcpDeleteFilterV4(                    DHCP_CONST WCHAR* ServerIpAddress, DHCP_ADDR_PATTERN* DeleteFilterInfo);
  DWORD DhcpDeleteServer(                      DWORD Flags, LPVOID IdInfo, LPDHCP_SERVER_INFO NewServer, LPVOID CallbackFn, LPVOID CallbackData);
  DWORD DhcpDeleteSubnet(                      DHCP_CONST WCHAR* ServerIpAddress, DHCP_IP_ADDRESS SubnetAddress, DHCP_FORCE_FLAG ForceFlag);
  DWORD DhcpDeleteSuperScopeV4(                DHCP_CONST WCHAR* ServerIpAddress, DHCP_CONST LPWSTR SuperScopeName);
  VOID  DhcpDsCleanup(                         );
  DWORD DhcpDsInit(                            );
  DWORD DhcpEnumClasses(                       LPWSTR ServerIpAddress, DWORD ReservedMustBeZero, DHCP_RESUME_HANDLE* ResumeHandle, DWORD PreferredMaximum, LPDHCP_CLASS_INFO_ARRAY* ClassInfoArray, DWORD* nRead, DWORD* nTotal);
  DWORD DhcpEnumFilterV4(                      DHCP_CONST WCHAR* ServerIpAddress, LPDHCP_ADDR_PATTERN ResumeHandle, DWORD PreferrredMaximum, DHCP_FILTER_LIST_TYPE ListType, LPDHCP_FILTER_ENUM_INFO* EnumFilterInfo, DWORD* ElementsRead, DWORD* ElementsTotal);
  DWORD DhcpEnumOptionsV5(                     LPWSTR ServerIpAddress, DWORD Flags, LPWSTR ClassName, LPWSTR VendorName, DHCP_RESUME_HANDLE* ResumeHandle, DWORD PreferredMaximum, LPDHCP_OPTION_ARRAY* Options, DWORD* OptionsRead, DWORD* OptionsTotal);
  DWORD DhcpEnumOptionValuesV5(                LPWSTR ServerIpAddress, DWORD Flags, LPWSTR ClassName, LPWSTR VendorName, LPDHCP_OPTION_SCOPE_INFO ScopeInfo, DHCP_RESUME_HANDLE* ResumeHandle, DWORD PreferredMaximum, LPDHCP_OPTION_VALUE_ARRAY* OptionValues, DWORD* OptionsRead, DWORD* OptionsTotal);
  DWORD DhcpEnumServers(                       DWORD Flags, LPVOID IdInfo, LPDHCP_SERVER_INFO_ARRAY* Servers, LPVOID CallbackFn, LPVOID CallbackData);
  DWORD DhcpEnumSubnetClients(                 DHCP_CONST WCHAR* ServerIpAddress, DHCP_IP_ADDRESS SubnetAddress, DHCP_RESUME_HANDLE* ResumeHandle, DWORD PreferredMaximum, LPDHCP_CLIENT_INFO_ARRAY* ClientInfo, DWORD* ClientsRead, DWORD* ClientsTotal);
  DWORD DhcpEnumSubnetClientsV5(               DHCP_CONST WCHAR* ServerIpAddress, DHCP_IP_ADDRESS SubnetAddress, DHCP_RESUME_HANDLE* ResumeHandle, DWORD PreferredMaximum, LPDHCP_CLIENT_INFO_ARRAY_V5* ClientInfo, DWORD* ClientsRead, DWORD* ClientsTotal);
  DWORD DhcpEnumSubnetClientsVQ(               DHCP_CONST WCHAR* ServerIpAddress, DHCP_IP_ADDRESS SubnetAddress, DHCP_RESUME_HANDLE* ResumeHandle, DWORD PreferredMaximum, LPDHCP_CLIENT_INFO_ARRAY_VQ* ClientInfo, DWORD* ClientsRead, DWORD* ClientsTotal);
  DWORD DhcpEnumSubnetClientsFilterStatusInfo( DHCP_CONST WCHAR* ServerIpAddress, DHCP_IP_ADDRESS SubnetAddress, DHCP_RESUME_HANDLE* ResumeHandle, DWORD PreferredMaximum, LPDHCP_CLIENT_FILTER_STATUS_INFO_ARRAY* ClientInfo, DWORD* ClientsRead, DWORD* ClientsTotal);
  DWORD DhcpEnumSubnetElementsV5(              DHCP_CONST WCHAR* ServerIpAddress, DHCP_IP_ADDRESS SubnetAddress, DHCP_SUBNET_ELEMENT_TYPE EnumElementType, DHCP_RESUME_HANDLE* ResumeHandle, DWORD PreferredMaximum, LPDHCP_SUBNET_ELEMENT_INFO_ARRAY* EnumElementInfo, DWORD* ElementsRead, DWORD* ElementsTotal);
  DWORD DhcpEnumSubnets(                       DHCP_CONST WCHAR* ServerIpAddress, DHCP_RESUME_HANDLE* ResumeHandle, DWORD PreferredMaximum, LPDHCP_IP_ARRAY* EnumInfo, DWORD* ElementsRead, DWORD* ElementsTotal);
  DWORD DhcpGetAllOptionValues(                LPWSTR ServerIpAddress, DWORD Flags, LPDHCP_OPTION_SCOPE_INFO ScopeInfo, LPDHCP_ALL_OPTION_VALUES* Values);
  DWORD DhcpGetClassInfo(                      LPWSTR ServerIpAddress, DWORD ReservedMustBeZero, LPDHCP_CLASS_INFO PartialClassInfo, LPDHCP_CLASS_INFO* FilledClassInfo);
  DWORD DhcpGetClientInfo(                     DHCP_CONST WCHAR* ServerIpAddress, DHCP_CONST DHCP_SEARCH_INFO* SearchInfo, LPDHCP_CLIENT_INFO* ClientInfo);
  DWORD DhcpGetClientInfoV4(                   DHCP_CONST WCHAR* ServerIpAddress, DHCP_CONST DHCP_SEARCH_INFO* SearchInfo, LPDHCP_CLIENT_INFO_V4* ClientInfo);
  DWORD DhcpGetClientInfoVQ(                   DHCP_CONST WCHAR* ServerIpAddress, LPDHCP_SEARCH_INFO SearchInfo, LPDHCP_CLIENT_INFO_VQ ClientInfo);
  DWORD DhcpGetFilterV4(                       DHCP_CONST WCHAR* ServerIpAddress, DHCP_FILTER_GLOBAL_INFO* GlobalFilterInfo);
  DWORD DhcpGetMibInfoV5(                      WCHAR* ServerIpAddress, LPDHCP_MIB_INFO_V5* MibInfo);
  DWORD DhcpGetOptionInfoV5(                   LPWSTR ServerIpAddress, DWORD Flags, DHCP_OPTION_ID OptionID, LPWSTR ClassName, LPWSTR VendorName, LPDHCP_OPTION* OptionInfo);
  DWORD DhcpGetOptionValue(                    DHCP_CONST WCHAR* ServerIpAddress, DHCP_OPTION_ID OptionID, DHCP_CONST DHCP_OPTION_SCOPE_INFO* ScopeInfo, LPDHCP_OPTION_VALUE* OptionValue);
  DWORD DhcpGetOptionValueV5(                  LPWSTR ServerIpAddress, DWORD Flags, DHCP_OPTION_ID OptionID, LPWSTR ClassName, LPWSTR VendorName, LPDHCP_OPTION_SCOPE_INFO ScopeInfo, LPDHCP_OPTION_VALUE* OptionValue);
  DWORD DhcpGetServerBindingInfo(              DHCP_CONST WCHAR* ServerIpAddress, ULONG Flags, LPDHCP_BIND_ELEMENT_ARRAY* BindElementsInfo);
  DWORD DhcpGetSubnetDelayOffer(               LPWSTR ServerIpAddress, DHCP_IP_ADDRESS SubnetAddress, USHORT* TimeDelayInMilliseconds);
  DWORD DhcpGetSubnetInfo(                     DHCP_CONST WCHAR* ServerIpAddress, DHCP_IP_ADDRESS SubnetAddress, LPDHCP_SUBNET_INFO* SubnetInfo);
  DWORD DhcpGetSubnetInfoVQ(                   DHCP_CONST WCHAR* ServerIpAddress, DHCP_IP_ADDRESS SubnetAddress, LPDHCP_SUBNET_INFO_VQ* SubnetInfo);
  DWORD DhcpGetSuperScopeInfoV4(               DHCP_CONST WCHAR* ServerIpAddress, LPDHCP_SUPER_SCOPE_TABLE* SuperScopeTable);
  DWORD DhcpGetVersion(                        LPWSTR ServerIpAddress, LPDWORD MajorVersion, LPDWORD MinorVersion);
  DWORD DhcpModifyClass(                       LPWSTR ServerIpAddress, DWORD ReservedMustBeZero, LPDHCP_CLASS_INFO ClassInfo);
  DWORD DhcpRemoveOptionV5(                    LPWSTR ServerIpAddress, DWORD Flags, DHCP_OPTION_ID OptionID, LPWSTR ClassName, LPWSTR VendorName);
  DWORD DhcpRemoveOptionValueV5(               LPWSTR ServerIpAddress, DWORD Flags, DHCP_OPTION_ID OptionID, LPWSTR ClassName, LPWSTR VendorName, LPDHCP_OPTION_SCOPE_INFO ScopeInfo);
  DWORD DhcpRemoveSubnetElementV5(             DHCP_CONST WCHAR* ServerIpAddress, DHCP_IP_ADDRESS SubnetAddress, DHCP_CONST DHCP_SUBNET_ELEMENT_DATA_V5* RemoveElementInfo, DHCP_FORCE_FLAG ForceFlag);
  VOID  DhcpRpcFreeMemory(                     PVOID BufferPointer);
  DWORD DhcpServerGetConfigVQ(                 DHCP_CONST WCHAR* ServerIpAddress, LPDHCP_SERVER_CONFIG_INFO_VQ* ConfigInfo);
  DWORD DhcpServerQueryDnsRegCredentials(      LPWSTR ServerIpAddress, ULONG UnameSize, LPWSTR Uname, ULONG DomainSize, LPWSTR Domain);
  DWORD DhcpServerRedoAuthorization(           LPWSTR ServerIpAddr, ULONG dwReserved);
  DWORD DhcpServerSetConfigV4(                 DHCP_CONST WCHAR* ServerIpAddress, DWORD FieldsToSet, LPDHCP_SERVER_CONFIG_INFO_V4 ConfigInfo);
  DWORD DhcpServerSetConfigVQ(                 DHCP_CONST WCHAR* ServerIpAddress, DWORD FieldsToSet, LPDHCP_SERVER_CONFIG_INFO_VQ ConfigInfo);
  DWORD DhcpServerSetDnsRegCredentialsV5(      LPWSTR ServerIpAddress, LPWSTR Uname, LPWSTR Domain, LPWSTR Password);
  DWORD DhcpSetClientInfo(                     DHCP_CONST WCHAR* ServerIpAddress, DHCP_CONST DHCP_CLIENT_INFO* ClientInfo);
  DWORD DhcpSetClientInfoV4(                   DHCP_CONST WCHAR* ServerIpAddress, DHCP_CONST DHCP_CLIENT_INFO_V4* ClientInfo);
  DWORD DhcpSetClientInfoVQ(                   DHCP_CONST WCHAR* ServerIpAddress, LPDHCP_CLIENT_INFO_VQ ClientInfo);
  DWORD DhcpSetFilterV4(                       DHCP_CONST WCHAR* ServerIpAddress, DHCP_FILTER_GLOBAL_INFO* GlobalFilterInfo);
  DWORD DhcpSetOptionInfoV5(                   LPWSTR ServerIpAddress, DWORD Flags, DHCP_OPTION_ID OptionID, LPWSTR* ClassName, LPWSTR* VendorName, LPDHCP_OPTION OptionInfo);
  DWORD DhcpSetOptionValueV5(                  LPWSTR ServerIpAddress, DWORD Flags, DHCP_OPTION_ID OptionId, LPWSTR ClassName, LPWSTR VendorName, LPDHCP_OPTION_SCOPE_INFO ScopeInfo, LPDHCP_OPTION_DATA OptionValue);
  DWORD DhcpSetServerBindingInfo(              DHCP_CONST WCHAR* ServerIpAddress, ULONG Flags, LPDHCP_BIND_ELEMENT_ARRAY BindElementInfo);
  DWORD DhcpSetSubnetDelayOffer(               LPWSTR ServerIpAddress, DHCP_IP_ADDRESS SubnetAddress, USHORT TimeDelayInMilliseconds);
  DWORD DhcpSetSubnetInfo(                     DHCP_CONST WCHAR* ServerIpAddress, DHCP_IP_ADDRESS SubnetAddress, DHCP_CONST DHCP_SUBNET_INFO* SubnetInfo);
  DWORD DhcpSetSubnetInfoVQ(                   DHCP_CONST WCHAR* ServerIpAddress, DHCP_IP_ADDRESS SubnetAddress, DHCP_CONST DHCP_SUBNET_INFO_VQ* SubnetInfo);
  DWORD DhcpSetSuperScopeV4(                   DHCP_CONST WCHAR* ServerIpAddress, DHCP_CONST DHCP_IP_ADDRESS SubnetAddress, DHCP_CONST LPWSTR SuperScopeName, DHCP_CONST BOOL ChangeExisting);
  DWORD DhcpAddSubnetElementV6(                LPWSTR ServerIpAddress, DHCP_IPV6_ADDRESS SubnetAddress, LPDHCP_SUBNET_ELEMENT_DATA_V6 AddElementInfo);
  DWORD DhcpCreateClassV6(                     LPWSTR ServerIpAddress, DWORD ReservedMustBeZero, LPDHCP_CLASS_INFO_V6 ClassInfo);
  DWORD DhcpCreateOptionV6(                    LPWSTR ServerIpAddress, DWORD Flags, DHCP_OPTION_ID OptionId, WCHAR* ClassName, WCHAR* VendorName, LPDHCP_OPTION OptionInfo);
  DWORD DhcpCreateSubnetV6(                    LPWSTR ServerIpAddress, DHCP_IPV6_ADDRESS SubnetAddress, LPDHCP_SUBNET_INFO_V6* SubnetInfo);
  DWORD DhcpDeleteClassV6(                     LPWSTR ServerIpAddress, DWORD ReservedMustBeZero, LPWSTR ClassName);
  DWORD DhcpDeleteClientInfoV6(                LPWSTR ServerIpAddress, LPDHCP_SEARCH_INFO_V6 ClientInfo);
  DWORD DhcpDeleteSubnetV6(                    LPWSTR ServerIpAddress, DHCP_IPV6_ADDRESS SubnetAddress, DHCP_FORCE_FLAG ForceFlag);
  DWORD DhcpEnumClassesV6(                     LPWSTR ServerIpAddress, DWORD ReservedMustBeZero, DHCP_RESUME_HANDLE* ResumeHandle, DWORD PreferredMaximum, LPDHCP_CLASS_INFO_ARRAY_V6* ClassInfoArray, DWORD* nRead, DWORD* nTotal);
  DWORD DhcpEnumOptionsV6(                     LPWSTR ServerIpAddress, DWORD Flags, WCHAR* ClassName, WCHAR* VendorName, DHCP_RESUME_HANDLE* ResumeHandle, DWORD PreferredMaximum, LPDHCP_OPTION_ARRAY* Options, DWORD* OptionsRead, DWORD* OptionsTotal);
  DWORD DhcpEnumOptionValuesV6(                LPWSTR ServerIpAddress, DWORD Flags, WCHAR* ClassName, WCHAR* VendorName, LPDHCP_OPTION_SCOPE_INFO6 ScopeInfo, DHCP_RESUME_HANDLE* ResumeHandle, DWORD PreferredMaximum, LPDHCP_OPTION_VALUE_ARRAY* OptionValues, DWORD* OptionsRead, DWORD* OptionsTotal);
  DWORD DhcpEnumSubnetsV6(                     LPWSTR ServerIpAddress, DHCP_RESUME_HANDLE* ResumeHandle, DWORD PreferredMaximum, LPDHCPV6_IP_ARRAY* EnumInfo, DWORD* ElementsRead, DWORD* ElementsTotal);
  DWORD DhcpEnumSubnetClientsV6(               LPWSTR ServerIpAddress, DHCP_IPV6_ADDRESS SubnetAddress, DHCP_RESUME_IPV6_HANDLE* ResumeHandle, DWORD PreferredMaximum, LPDHCP_CLIENT_INFO_ARRAY_V6* ClientInfo, DWORD* ClientsRead, DWORD* ClientsTotal);
  DWORD DhcpEnumSubnetElementsV6(              LPWSTR ServerIpAddress, DHCP_IPV6_ADDRESS SubnetAddress, DHCP_SUBNET_ELEMENT_TYPE_V6 EnumElementType, DHCP_RESUME_HANDLE* ResumeHandle, DWORD PreferredMaximum, LPDHCP_SUBNET_ELEMENT_INFO_ARRAY_V6* EnumElementInfo, DWORD* ElementsRead, DWORD* ElementsTotal);
  DWORD DhcpGetAllOptionsV6(                   LPWSTR ServerIpAddress, DWORD Flags, LPDHCP_ALL_OPTIONS* OptionStruct);
  DWORD DhcpGetAllOptionValuesV6(              LPWSTR ServerIpAddress, DWORD Flags, LPDHCP_OPTION_SCOPE_INFO6 ScopeInfo, LPDHCP_ALL_OPTION_VALUES* Values);
  DWORD DhcpGetClientInfoV6(                   DHCP_CONST WCHAR* ServerIpAddress, DHCP_CONST DHCP_SEARCH_INFO_V6* SearchInfo, LPDHCP_CLIENT_INFO_V6* ClientInfo);
  DWORD DhcpGetMibInfoV6(                      DHCP_CONST WCHAR* ServerIpAddress, LPDHCP_MIB_INFO_V6* MibInfo);
  DWORD DhcpGetOptionInfoV6(                   LPWSTR ServerIpAddress, DWORD Flags, DHCP_OPTION_ID OptionID, WCHAR* ClassName, WCHAR* VendorName, LPDHCP_OPTION* OptionInfo);
  DWORD DhcpGetOptionValueV6(                  LPWSTR ServerIpAddress, DWORD Flags, DHCP_OPTION_ID OptionID, WCHAR* ClassName, WCHAR* VendorName, LPDHCP_OPTION_SCOPE_INFO6* ScopeInfo, LPDHCP_OPTION_VALUE OptionValue);
  DWORD DhcpGetServerBindingInfoV6(            DHCP_CONST WCHAR* ServerIpAddress, ULONG Flags, LPDHCPV6_BIND_ELEMENT_ARRAY* BindElementsInfo);
  DWORD DhcpGetSubnetInfoV6(                   LPWSTR ServerIpAddress, DHCP_IPV6_ADDRESS SubnetAddress, LPDHCP_SUBNET_INFO_V6* SubnetInfo);
  DWORD DhcpModifyClassV6(                     LPWSTR ServerIpAddress, DWORD ReservedMustBeZero, LPDHCP_CLASS_INFO_V6 ClassInfo);
  DWORD DhcpRemoveOptionV6(                    LPWSTR ServerIpAddress, DWORD Flags, DHCP_OPTION_ID OptionID, WCHAR* ClassName, WCHAR* VendorName);
  DWORD DhcpRemoveOptionValueV6(               LPWSTR ServerIpAddress, DWORD Flags, DHCP_OPTION_ID OptionID, WCHAR* ClassName, WCHAR* VendorName, LPDHCP_OPTION_SCOPE_INFO6 ScopeInfo);
  DWORD DhcpRemoveSubnetElementV6(             LPWSTR ServerIpAddress, DHCP_IPV6_ADDRESS SubnetAddress, LPDHCP_SUBNET_ELEMENT_DATA_V6 RemoveElementInfo, DHCP_FORCE_FLAG ForceFlag);
  DWORD DhcpServerGetConfigV6(                 DHCP_CONST WCHAR* ServerIpAddress, LPDHCP_OPTION_SCOPE_INFO6 ScopeInfo, LPDHCP_SERVER_CONFIG_INFO_V6* ConfigInfo);
  DWORD DhcpSetClientInfoV6(                   LPWSTR ServerIpAddress, LPDHCP_CLIENT_INFO_V6 ClientInfo);
  DWORD DhcpSetOptionInfoV6(                   LPWSTR ServerIpAddress, DWORD Flags, DHCP_OPTION_ID OptionID, WCHAR* ClassName, WCHAR* VendorName, LPDHCP_OPTION OptionInfo);
  DWORD DhcpSetOptionValueV6(                  LPWSTR ServerIpAddress, DWORD Flags, DHCP_OPTION_ID OptionId, WCHAR* ClassName, WCHAR* VendorName, LPDHCP_OPTION_SCOPE_INFO6 ScopeInfo, LPDHCP_OPTION_DATA OptionValue);
  DWORD DhcpSetServerBindingInfoV6(            DHCP_CONST WCHAR* ServerIpAddress, ULONG Flags, LPDHCPV6_BIND_ELEMENT_ARRAY BindElementsInfo);
  DWORD DhcpServerSetConfigV6(                 DHCP_CONST WCHAR* ServerIpAddress, LPDHCP_OPTION_SCOPE_INFO6 ScopeInfo, DWORD FieldsToSet, LPDHCP_SERVER_CONFIG_INFO_V6 ConfigInfo);
  DWORD DhcpSetSubnetInfoV6(                   DHCP_CONST WCHAR* ServerIpAddress, DHCP_IPV6_ADDRESS SubnetAddress, LPDHCP_SUBNET_INFO_V6 SubnetInfo);
]]
return ffi.load( 'Dhcpsapi.dll' )

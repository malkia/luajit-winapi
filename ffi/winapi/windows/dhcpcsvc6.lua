require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef struct DHCPV6CAPI_CLASSID {
    ULONG Flags;
    LPBYTE Data;
    ULONG nBytesData;
  } DHCPV6CAPI_CLASSID;
  typedef DHCPV6CAPI_CLASSID *LPDHCPV6CAPI_CLASSID; //Pointer
  typedef struct DHCPV6CAPI_PARAMS {
    ULONG Flags;
    ULONG OptionId;
    BOOL IsVendor;
    LPBYTE Data;
    DWORD nBytesData;
  } DHCPV6CAPI_PARAMS;
  typedef DHCPV6CAPI_PARAMS *LPDHCPV6CAPI_PARAMS; //Pointer
  typedef struct DHCPV6CAPI_PARAMS_ARRAY {
    ULONG nParams;
    LPDHCPV6CAPI_PARAMS Params;
  } DHCPV6CAPI_PARAMS_ARRAY;
  typedef UINT StatusCode; //Alias
  static const StatusCode STATUS_NO_ERROR = 0;
  static const StatusCode STATUS_UNSPECIFIED_FAILURE = 1;
  static const StatusCode STATUS_NO_BINDING = 3;
  static const StatusCode STATUS_NOPREFIX_AVAIL = 6;
  typedef struct DHCPV6Prefix {
    UCHAR prefix_16_;
    DWORD prefixLength;
    DWORD preferredLifeTime;
    DWORD validLifeTime;
    StatusCode status;
  } DHCPV6Prefix;
  typedef DHCPV6Prefix *LPDHCPV6Prefix; //Pointer
  typedef struct DHCPV6PrefixLeaseInformation {
    DWORD nPrefixes;
    LPDHCPV6Prefix prefixArray;
    DWORD iaid;
    time_t T1;
    time_t T2;
    time_t MaxLeaseExpirationTime;
    time_t LastRenewalTime;
    StatusCode status;
    LPBYTE ServerId;
    DWORD ServerIdLen;
  } DHCPV6PrefixLeaseInformation;
  typedef DHCPV6PrefixLeaseInformation *LPDHCPV6PrefixLeaseInformation; //Pointer
  VOID  Dhcpv6CApiCleanup(    );
  DWORD Dhcpv6CApiInitialize( LPDWORD Version);
  DWORD Dhcpv6RequestParams(  BOOL forceNewInform, LPVOID reserved, LPWSTR adapterName, LPDHCPV6CAPI_CLASSID classId, DHCPV6CAPI_PARAMS_ARRAY recdParams, LPBYTE buffer, LPDWORD pSize);
  DWORD Dhcpv6ReleasePrefix(  LPWSTR adapterName, LPDHCPV6CAPI_CLASSID classId, LPDHCPV6PrefixLeaseInformation prefixleaseInfo);
  DWORD Dhcpv6RenewPrefix(    LPWSTR adapterName, LPDHCPV6CAPI_CLASSID classId, LPDHCPV6PrefixLeaseInformation prefixleaseInfo, DWORD pdwTimeToWait, DWORD bValidatePrefix);
  DWORD Dhcpv6RequestPrefix(  LPWSTR adapterName, LPDHCPV6CAPI_CLASSID classId, LPDHCPV6PrefixLeaseInformation prefixleaseInfo, DWORD pdwTimeToWait);
]]
ffi.load( 'Dhcpcsvc6.dll' )

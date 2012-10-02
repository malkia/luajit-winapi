require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  VOID  Dhcpv6CApiCleanup(    );
  DWORD Dhcpv6CApiInitialize( LPDWORD Version);
  DWORD Dhcpv6RequestParams(  BOOL forceNewInform, LPVOID reserved, LPWSTR adapterName, LPDHCPV6CAPI_CLASSID classId, DHCPV6CAPI_PARAMS_ARRAY recdParams, LPBYTE buffer, LPDWORD pSize);
  DWORD Dhcpv6ReleasePrefix(  LPWSTR adapterName, LPDHCPV6CAPI_CLASSID classId, LPDHCPV6PrefixLeaseInformation prefixleaseInfo);
  DWORD Dhcpv6RenewPrefix(    LPWSTR adapterName, LPDHCPV6CAPI_CLASSID classId, LPDHCPV6PrefixLeaseInformation prefixleaseInfo, DWORD pdwTimeToWait, DWORD bValidatePrefix);
  DWORD Dhcpv6RequestPrefix(  LPWSTR adapterName, LPDHCPV6CAPI_CLASSID classId, LPDHCPV6PrefixLeaseInformation prefixleaseInfo, DWORD pdwTimeToWait);
]]
return ffi.load( 'Dhcpcsvc6.dll' )

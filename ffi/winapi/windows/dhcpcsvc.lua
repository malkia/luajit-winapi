require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  VOID  DhcpCApiCleanup(            );
  DWORD DhcpDeRegisterParamChange(  DWORD Flags, LPVOID Reserved, LPVOID Event);
  DWORD DhcpRegisterParamChange(    DWORD Flags, LPVOID Reserved, LPWSTR AdapterName, LPDHCPCAPI_CLASSID pClassId, DHCPCAPI_PARAMS_ARRAY Params, LPVOID Handle);
  DWORD DhcpRequestParams(          DWORD Flags, LPVOID Reserved, LPWSTR AdapterName, LPDHCPCAPI_CLASSID ClassId, DHCPCAPI_PARAMS_ARRAY SendParams, DHCPCAPI_PARAMS_ARRAY RecdParams, LPBYTE Buffer, LPDWORD pSize, LPWSTR RequestIdStr);
  DWORD DhcpRemoveDNSRegistrations( );
  DWORD DhcpUndoRequestParams(      DWORD Flags, LPVOID Reserved, LPWSTR AdapterName, LPWSTR RequestIdStr);
  DWORD DhcpCApiInitialize(         LPDWORD Version);
  VOID  McastApiCleanup(            );
  DWORD McastApiStartup(            PDWORD pVersion);
  DWORD McastEnumerateScopes(       IP_ADDR_FAMILY AddrFamily, BOOL ReQuery, PMCAST_SCOPE_ENTRY pScopeList, PDWORD pScopeLen, PDWORD pScopeCount);
  DWORD McastGenUID(                LPMCAST_CLIENT_UID pRequestID);
  DWORD McastReleaseAddress(        IP_ADDR_FAMILY AddrFamily, LPMCAST_CLIENT_UID pRequestID, PMCAST_LEASE_REQUEST pReleaseRequest);
  DWORD McastRenewAddress(          IP_ADDR_FAMILY AddrFamily, LPMCAST_CLIENT_UID pRequestID, PMCAST_LEASE_REQUEST pRenewRequest, PMCAST_LEASE_RESPONSE pRenewResponse);
  DWORD McastRequestAddress(        IP_ADDR_FAMILY AddrFamily, LPMCAST_CLIENT_UID pRequestID, PMCAST_SCOPE_CTX pScopeCtx, PMCAST_LEASE_REQUEST pAddrRequest, PMCAST_LEASE_RESPONSE pAddrResponse);
]]
return ffi.load( "Dhcpcsvc.dll" )

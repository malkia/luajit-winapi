require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef unsigned short IP_ADDR_FAMILY; //Alias
  typedef union IPNG_ADDRESS {
    DWORD IpAddrV4;
    BYTE IpAddrV6[16];
  } IPNG_ADDRESS;
  typedef struct MCAST_LEASE_REQUEST {
    LONG LeaseStartTime;
    LONG MaxLeaseStartTime;
    DWORD LeaseDuration;
    DWORD MinLeaseDuration;
    IPNG_ADDRESS ServerAddress;
    WORD MinAddrCount;
    WORD AddrCount;
    PBYTE pAddrBuf;
  } MCAST_LEASE_REQUEST;
  typedef MCAST_LEASE_REQUEST *PMCAST_LEASE_REQUEST; //Pointer
  typedef struct MCAST_LEASE_RESPONSE {
    LONG LeaseStartTime;
    LONG LeaseEndTime;
    IPNG_ADDRESS ServerAddress;
    WORD AddrCount;
    PBYTE pAddrBuf;
  } MCAST_LEASE_RESPONSE;
  typedef MCAST_LEASE_RESPONSE *PMCAST_LEASE_RESPONSE; //Pointer
  typedef struct MCAST_SCOPE_CTX {
    IPNG_ADDRESS ScopeID;
    IPNG_ADDRESS Interface;
    IPNG_ADDRESS ServerID;
  } MCAST_SCOPE_CTX;
  typedef MCAST_SCOPE_CTX *PMCAST_SCOPE_CTX; //Pointer
  typedef struct MCAST_SCOPE_ENTRY {
    MCAST_SCOPE_CTX ScopeCtx;
    IPNG_ADDRESS LastAddr;
    DWORD TTL;
    UNICODE_STRING ScopeDesc;
  } MCAST_SCOPE_ENTRY;
  typedef MCAST_SCOPE_ENTRY *PMCAST_SCOPE_ENTRY; //Pointer
  typedef struct DHCPCAPI_CLASSID {
    ULONG Flags;
    LPBYTE Data;
    ULONG nBytesData;
  } DHCPCAPI_CLASSID;
  typedef DHCPCAPI_CLASSID *LPDHCPCAPI_CLASSID; //Pointer
  typedef struct DHCPAPI_PARAMS {
    ULONG Flags;
    ULONG OptionId;
    BOOL IsVendor;
    LPBYTE Data;
    DWORD nBytesData;
  } DHCPAPI_PARAMS;
  typedef DHCPAPI_PARAMS *LPDHCPCAPI_PARAMS; //Pointer
  typedef struct DHCPCAPI_PARAMS_ARRAY {
    ULONG nParams;
    LPDHCPCAPI_PARAMS Params;
  } DHCPCAPI_PARAMS_ARRAY;
  typedef struct MCAST_CLIENT_UID {
    LPBYTE ClientUID;
    DWORD ClientUIDLength;
  } MCAST_CLIENT_UID;
  typedef MCAST_CLIENT_UID *LPMCAST_CLIENT_UID; //Pointer
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
return ffi.load( 'Dhcpcsvc.dll' )

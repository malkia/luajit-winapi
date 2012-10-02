require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/rpc' )
local ffi = require( 'ffi' )
ffi.cdef [[
  DWORD DsAddSidHistory(                HANDLE hDS, DWORD Flags, LPCTSTR SrcDomain, LPCTSTR SrcPrincipal, LPCTSTR SrcDomainController, RPC_AUTH_IDENTITY_HANDLE SrcDomainCreds, LPCTSTR DstDomain, LPCTSTR DstPrincipal);
  DWORD DsBind(                         LPCTSTR DomainControllerName, LPCTSTR DnsDomainName, HANDLE* phDS);
  DWORD DsBindingSetTimeout(            HANDLE hDS, ULONG cTimeoutSecs);
  DWORD DsBindToISTG(                   LPCTSTR SiteName, HANDLE* phDS);
  DWORD DsBindWithCred(                 LPCTSTR DomainControllerName, LPCTSTR DnsDomainName, RPC_AUTH_IDENTITY_HANDLE AuthIdentity, HANDLE* phDS);
  DWORD DsBindWithSpn(                  LPCTSTR DomainControllerName, LPCTSTR DnsDomainName, RPC_AUTH_IDENTITY_HANDLE AuthIdentity, LPCTSTR ServicePrincipalName, HANDLE* phDS);
  DWORD DsBindWithSpnEx(                LPCTSTR DomainControllerName, LPCTSTR DnsDomainName, RPC_AUTH_IDENTITY_HANDLE AuthIdentity, LPCTSTR ServicePrincipalName, DWORD BindFlags, HANDLE* phDS);
  DWORD DsClientMakeSpnForTargetServer( LPCTSTR ServiceClass, LPCTSTR ServiceName, DWORD* pcSpnLength, LPTSTR pszSpn);
  DWORD DsCrackNames(                   HANDLE hDS, DS_NAME_FLAGS flags, DS_NAME_FORMAT formatOffered, DS_NAME_FORMAT formatDesired, DWORD cNames, LPCTSTR* rpNames, PDS_NAME_RESULT* ppResult);
  DWORD DsCrackSpn(                     LPCTSTR pszSPN, DWORD* pcServiceClass, LPTSTR ServiceClass, DWORD* pcServiceName, LPTSTR ServiceName, DWORD* pcInstanceName, LPTSTR InstanceName, USHORT* pInstancePort);
  BOOL  DsCrackUnquotedMangledRdn(      LPCTSTR pszRDN, DWORD cchRDN, GUID* pGuid, DS_MANGLE_FOR* peDsMangleFor);
  void  DsFreeDomainControllerInfo(     DWORD InfoLevel, DWORD cInfo, VOID* pInfo);
  void  DsFreeNameResult(               DS_NAME_RESULT* pResult);
  void  DsFreePasswordCredentials(      RPC_AUTH_IDENTITY_HANDLE AuthIdentity);
  void  DsFreeSchemaGuidMap(            PDS_SCHEMA_GUID_MAP pGuidMap);
  void  DsFreeSpnArray(                 DWORD cSpn, LPTSTR* rpszSpn);
  DWORD DsGetDomainControllerInfo(      HANDLE hDs, LPTSTR DomainName, DWORD InfoLevel, DWORD* pcOut, VOID** ppInfo);
  DWORD DsGetRdnW(                      LPCWCH* ppDN, DWORD* pcDN, LPCWCH* ppKey, DWORD* pcKey, LPCWCH* ppVal, DWORD* pcVal);
  DWORD DsGetSpn(                       DS_SPN_NAME_TYPE ServiceType, LPCTSTR ServiceClass, LPCTSTR ServiceName, USHORT InstancePort, USHORT cInstanceNames, LPCTSTR* pInstanceNames, WINAPI_USHORT* pInstancePorts, DWORD* pcSpn, LPTSTR** prpszSpn);
  DWORD DsInheritSecurityIdentity(      HANDLE hDS, DWORD Flags, LPCTSTR SrcPrincipal, LPCTSTR DstPrincipal);
  BOOL  DsIsMangledDn(                  LPCTSTR pszDn, DS_MANGLE_FOR eDsMangleFor);
  BOOL  DsIsMangledRdnValue(            LPCTSTR pszRdn, DWORD cRdn, DS_MANGLE_FOR eDsMangleForDesired);
  DWORD DsListDomainsInSite(            HANDLE hDs, LPTSTR site, PDS_NAME_RESULT* ppDomains);
  DWORD DsListInfoForServer(            HANDLE hDs, LPTSTR server, PDS_NAME_RESULT* ppInfo);
  DWORD DsListRoles(                    HANDLE hDs, PDS_NAME_RESULT* ppRoles);
  DWORD DsListServersForDomainInSite(   HANDLE hDs, LPTSTR domain, LPTSTR site, PDS_NAME_RESULT* ppServers);
  DWORD DsListServersInSite(            HANDLE hDs, LPTSTR site, PDS_NAME_RESULT* ppServers);
  DWORD DsListSites(                    HANDLE hDs, PDS_NAME_RESULT* ppSites);
  DWORD DsMakePasswordCredentials(      LPCTSTR User, LPCTSTR Domain, LPCTSTR Password, RPC_AUTH_IDENTITY_HANDLE* pAuthIdentity);
  DWORD DsMakeSpn(                      LPCTSTR ServiceClass, LPCTSTR ServiceName, LPCTSTR InstanceName, USHORT InstancePort, LPCTSTR Referrer, DWORD* pcSpnLength, LPTSTR pszSpn);
  DWORD DsMapSchemaGuids(               HANDLE hDs, DWORD cGuids, GUID* rGuids, DS_SCHEMA_GUID_MAP** ppGuidMap);
  DWORD DsQuerySitesByCost(             HANDLE hDS, LPTSTR pwszFromSite, LPTSTR* rgwszToSites, DWORD cToSites, DWORD dwFlags, PDS_SITE_COST_INFO* prgSiteInfo);
  void  DsQuerySitesFree(               PDS_SITE_COST_INFO rgSiteInfo);
  DWORD DsQuoteRdnValue(                DWORD cUnquotedRdnValueLength, LPCTCH psUnquotedRdnValue, DWORD* pcQuotedRdnValueLength, LPTCH psQuotedRdnValue);
  DWORD DsRemoveDsDomain(               HANDLE hDs, LPTSTR DomainDN);
  DWORD DsRemoveDsServer(               HANDLE hDs, LPTSTR ServerDN, LPTSTR DomainDN, BOOL* fLastDcInDomain, BOOL fCommit);
  DWORD DsReplicaAdd(                   HANDLE hDS, LPCTSTR NameContext, LPCTSTR SourceDsaDn, LPCTSTR TransportDn, LPCTSTR SourceDsaAddress, WINAPI_PSCHEDULE pSchedule, DWORD Options);
  DWORD DsReplicaConsistencyCheck(      HANDLE hDS, DS_KCC_TASKID TaskID, DWORD dwFlags);
  DWORD DsReplicaDel(                   HANDLE hDS, LPCTSTR NameContext, LPCTSTR DsaSrc, ULONG Options);
  void  DsReplicaFreeInfo(              DS_REPL_INFO_TYPE InfoType, VOID* pInfo);
  DWORD DsReplicaGetInfoW(              HANDLE hDS, DS_REPL_INFO_TYPE InfoType, LPCWSTR pszObject, UUID* puuidForSourceDsaObjGuid, VOID** ppInfo);
  DWORD DsReplicaGetInfo2W(             HANDLE hDS, DS_REPL_INFO_TYPE InfoType, LPCWSTR pszObject, UUID* puuidForSourceDsaObjGuid, LPCWSTR pszAttributeName, LPCWSTR pszValue, DWORD dwFlags, DWORD dwEnumerationContext, VOID** ppInfo);
  DWORD DsReplicaModify(                HANDLE hDS, LPCTSTR NameContext, WINAPI_UUID* pUuidSourceDsa, LPCTSTR TransportDn, LPCTSTR SourceDsaAddress, WINAPI_PSCHEDULE pSchedule, DWORD ReplicaFlags, DWORD ModifyFields, DWORD Options);
  DWORD DsReplicaSync(                  HANDLE hDS, LPCTSTR NameContext, WINAPI_UUID* pUuidDsaSrc, ULONG Options);
  DWORD DsReplicaSyncAll(               HANDLE hDS, LPTSTR pszNameContext, ULONG ulFlags, LPVOID pCallbackData, PDS_REPSYNCALL_ERRINFO** pErrors);
  DWORD DsReplicaUpdateRefs(            HANDLE hDS, LPCTSTR NameContext, LPCTSTR DsaDest, WINAPI_UUID* pUuidDsaDest, ULONG Options);
  DWORD DsReplicaVerifyObjects(         HANDLE hDS, LPCTSTR NameContext, WINAPI_UUID* pUuidDsaSrc, ULONG ulOptions);
  DWORD DsServerRegisterSpn(            DS_SPN_WRITE_OP Operation, LPCTSTR ServiceClass, LPCTSTR UserObjectDN);
  DWORD DsUnBind(                       HANDLE* phDS);
  DWORD DsUnquoteRdnValue(              DWORD cQuotedRdnValueLength, LPCTCH psQuotedRdnValue, DWORD* pcUnquotedRdnValueLength, LPTCH psUnquotedRdnValue);
  DWORD DsWriteAccountSpn(              HANDLE hDS, DS_SPN_WRITE_OP Operation, LPCTSTR pszAccount, DWORD cSpn, LPCTSTR* rpszSpn);
]]
return ffi.load( 'Ntdsapi.dll' )

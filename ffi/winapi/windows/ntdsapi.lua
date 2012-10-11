require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/rpc' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef DWORD ScheduleType; //Alias
  static const ScheduleType SCHEDULE_INTERVAL = 0;
  static const ScheduleType SCHEDULE_BANDWIDTH = 1;
  static const ScheduleType SCHEDULE_PRIORITY = 2;
  typedef struct SCHEDULE_HEADER {
    ScheduleType Type;
    ULONG Offset;
  } SCHEDULE_HEADER;
  typedef struct SCHEDULE {
    ULONG Size;
    ULONG Bandwidth;
    ULONG NumberOfSchedules;
    SCHEDULE_HEADER Schedules[1];
  } SCHEDULE;
  typedef SCHEDULE *PSCHEDULE; //Pointer
  typedef struct DS_NAME_RESULT_ITEM {
    DWORD status;
    LPTSTR pDomain;
    LPTSTR pName;
  } DS_NAME_RESULT_ITEM;
  typedef DS_NAME_RESULT_ITEM *PDS_NAME_RESULT_ITEM; //Pointer
  typedef struct DS_NAME_RESULT {
    DWORD cItems;
    PDS_NAME_RESULT_ITEM rItems;
  } DS_NAME_RESULT;
  typedef DS_NAME_RESULT *PDS_NAME_RESULT; //Pointer
  typedef struct DS_SCHEMA_GUID_MAP {
    GUID guid;
    DWORD guidType;
    LPTSTR pName;
  } DS_SCHEMA_GUID_MAP;
  typedef DS_SCHEMA_GUID_MAP *PDS_SCHEMA_GUID_MAP; //Pointer
  typedef struct DS_SITE_COST_INFO {
    DWORD errorCode;
    DWORD cost;
  } DS_SITE_COST_INFO;
  typedef DS_SITE_COST_INFO *PDS_SITE_COST_INFO; //Pointer
  typedef UINT DS_REPSYNCALL_ERROR; //Alias
  static const DS_REPSYNCALL_ERROR DS_REPSYNCALL_WIN32_ERROR_CONTACTING_SERVER = 0;
  static const DS_REPSYNCALL_ERROR DS_REPSYNCALL_WIN32_ERROR_REPLICATING = 1;
  static const DS_REPSYNCALL_ERROR DS_REPSYNCALL_SERVER_UNREACHABLE = 2;
  typedef struct DS_REPSYNCALL_ERRINFO {
    LPTSTR pszSvrId;
    DS_REPSYNCALL_ERROR error;
    DWORD dwWin32Err;
    LPTSTR pszSrcId;
  } DS_REPSYNCALL_ERRINFO;
  typedef DS_REPSYNCALL_ERRINFO *PDS_REPSYNCALL_ERRINFO; //Pointer
  typedef DWORD DS_NAME_FLAGS; //Alias
  typedef UINT DS_NAME_FORMAT; //Alias
  static const DS_NAME_FORMAT DS_UNKNOWN_NAME = 0;
  static const DS_NAME_FORMAT DS_FQDN_1779_NAME = 1;
  static const DS_NAME_FORMAT DS_NT4_ACCOUNT_NAME = 2;
  static const DS_NAME_FORMAT DS_DISPLAY_NAME = 3;
  static const DS_NAME_FORMAT DS_DOMAIN_SIMPLE_NAME = 4;
  static const DS_NAME_FORMAT DS_ENTERPRISE_SIMPLE_NAME = 5;
  static const DS_NAME_FORMAT DS_UNIQUE_ID_NAME = 6;
  static const DS_NAME_FORMAT DS_CANONICAL_NAME = 7;
  static const DS_NAME_FORMAT DS_USER_PRINCIPAL_NAME = 8;
  static const DS_NAME_FORMAT DS_CANONICAL_NAME_EX = 9;
  static const DS_NAME_FORMAT DS_SERVICE_PRINCIPAL_NAME = 10;
  static const DS_NAME_FORMAT DS_SID_OR_SID_HISTORY_NAME = 11;
  static const DS_NAME_FORMAT DS_DNS_DOMAIN_NAME = 12;
  typedef UINT DS_MANGLE_FOR; //Alias
  static const DS_MANGLE_FOR DS_MANGLE_UNKNOWN = 0;
  static const DS_MANGLE_FOR DS_MANGLE_OBJECT_RDN_FOR_DELETION = 1;
  static const DS_MANGLE_FOR DS_MANGLE_OBJECT_RDN_FOR_NAME_CONFLICT = 2;
  typedef UINT DS_SPN_NAME_TYPE; //Alias
  static const DS_SPN_NAME_TYPE DS_SPN_DNS_HOST = 0;
  static const DS_SPN_NAME_TYPE DS_SPN_DN_HOST = 1;
  static const DS_SPN_NAME_TYPE DS_SPN_NB_HOST = 2;
  static const DS_SPN_NAME_TYPE DS_SPN_DOMAIN = 3;
  static const DS_SPN_NAME_TYPE DS_SPN_NB_DOMAIN = 4;
  static const DS_SPN_NAME_TYPE DS_SPN_SERVICE = 5;
  typedef UINT DS_KCC_TASKID; //Alias
  static const DS_KCC_TASKID DS_KCC_TASKID_UPDATE_TOPOLOGY = 0;
  typedef UINT DS_REPL_INFO_TYPE; //Alias
  static const DS_REPL_INFO_TYPE DS_REPL_INFO_NEIGHBORS = 0;
  static const DS_REPL_INFO_TYPE DS_REPL_INFO_CURSORS_FOR_NC = 1;
  static const DS_REPL_INFO_TYPE DS_REPL_INFO_METADATA_FOR_OBJ = 2;
  static const DS_REPL_INFO_TYPE DS_REPL_INFO_KCC_DSA_CONNECT_FAILURES = 3;
  static const DS_REPL_INFO_TYPE DS_REPL_INFO_KCC_DSA_LINK_FAILURES = 4;
  static const DS_REPL_INFO_TYPE DS_REPL_INFO_PENDING_OPS = 5;
  static const DS_REPL_INFO_TYPE DS_REPL_INFO_METADATA_FOR_ATTR_VALUE = 6;
  static const DS_REPL_INFO_TYPE DS_REPL_INFO_CURSORS_2_FOR_NC = 7;
  static const DS_REPL_INFO_TYPE DS_REPL_INFO_CURSORS_3_FOR_NC = 8;
  static const DS_REPL_INFO_TYPE DS_REPL_INFO_METADATA_2_FOR_OBJ = 9;
  static const DS_REPL_INFO_TYPE DS_REPL_INFO_METADATA_2_FOR_ATTR_VALUE = 10;
  typedef UINT DS_SPN_WRITE_OP; //Alias
  static const DS_SPN_WRITE_OP DS_SPN_ADD_SPN_OP = 0;
  static const DS_SPN_WRITE_OP DS_SPN_REPLACE_SPN_OP = 1;
  static const DS_SPN_WRITE_OP DS_SPN_DELETE_SPN_OP = 2;
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
  DWORD DsGetSpn(                       DS_SPN_NAME_TYPE ServiceType, LPCTSTR ServiceClass, LPCTSTR ServiceName, USHORT InstancePort, USHORT cInstanceNames, LPCTSTR* pInstanceNames, USHORT* pInstancePorts, DWORD* pcSpn, LPTSTR** prpszSpn);
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
  DWORD DsReplicaAdd(                   HANDLE hDS, LPCTSTR NameContext, LPCTSTR SourceDsaDn, LPCTSTR TransportDn, LPCTSTR SourceDsaAddress, PSCHEDULE pSchedule, DWORD Options);
  DWORD DsReplicaConsistencyCheck(      HANDLE hDS, DS_KCC_TASKID TaskID, DWORD dwFlags);
  DWORD DsReplicaDel(                   HANDLE hDS, LPCTSTR NameContext, LPCTSTR DsaSrc, ULONG Options);
  void  DsReplicaFreeInfo(              DS_REPL_INFO_TYPE InfoType, VOID* pInfo);
  DWORD DsReplicaGetInfoW(              HANDLE hDS, DS_REPL_INFO_TYPE InfoType, LPCWSTR pszObject, UUID* puuidForSourceDsaObjGuid, VOID** ppInfo);
  DWORD DsReplicaGetInfo2W(             HANDLE hDS, DS_REPL_INFO_TYPE InfoType, LPCWSTR pszObject, UUID* puuidForSourceDsaObjGuid, LPCWSTR pszAttributeName, LPCWSTR pszValue, DWORD dwFlags, DWORD dwEnumerationContext, VOID** ppInfo);
  DWORD DsReplicaModify(                HANDLE hDS, LPCTSTR NameContext, UUID* pUuidSourceDsa, LPCTSTR TransportDn, LPCTSTR SourceDsaAddress, PSCHEDULE pSchedule, DWORD ReplicaFlags, DWORD ModifyFields, DWORD Options);
  DWORD DsReplicaSync(                  HANDLE hDS, LPCTSTR NameContext, UUID* pUuidDsaSrc, ULONG Options);
  DWORD DsReplicaSyncAll(               HANDLE hDS, LPTSTR pszNameContext, ULONG ulFlags, LPVOID pCallbackData, PDS_REPSYNCALL_ERRINFO** pErrors);
  DWORD DsReplicaUpdateRefs(            HANDLE hDS, LPCTSTR NameContext, LPCTSTR DsaDest, UUID* pUuidDsaDest, ULONG Options);
  DWORD DsReplicaVerifyObjects(         HANDLE hDS, LPCTSTR NameContext, UUID* pUuidDsaSrc, ULONG ulOptions);
  DWORD DsServerRegisterSpn(            DS_SPN_WRITE_OP Operation, LPCTSTR ServiceClass, LPCTSTR UserObjectDN);
  DWORD DsUnBind(                       HANDLE* phDS);
  DWORD DsUnquoteRdnValue(              DWORD cQuotedRdnValueLength, LPCTCH psQuotedRdnValue, DWORD* pcUnquotedRdnValueLength, LPTCH psUnquotedRdnValue);
  DWORD DsWriteAccountSpn(              HANDLE hDS, DS_SPN_WRITE_OP Operation, LPCTSTR pszAccount, DWORD cSpn, LPCTSTR* rpszSpn);
]]
ffi.load( 'Ntdsapi.dll' )

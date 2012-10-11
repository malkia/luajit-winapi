require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/registry' )
require( 'ffi/winapi/headers/events' )
require( 'ffi/winapi/headers/services' )
require( 'ffi/winapi/headers/cryptography' )
require( 'ffi/winapi/headers/security' )
require( 'ffi/winapi/headers/native' )
require( 'ffi/winapi/headers/network' )
require( 'ffi/winapi/headers/processes' )
require( 'ffi/winapi/headers/shell' )
local ffi = require( 'ffi' )
ffi.cdef [[
  enum { HW_PROFILE_GUIDLEN = 39 };
  enum { MAX_PROFILE_LEN = 80 };
  enum { WCT_OBJNAME_LENGTH = 128 };
  typedef ERROR_CODE REG_ERROR; //Alias
  typedef struct HW_PROFILE_INFO {
    DWORD dwDockInfo;
    TCHAR szHwProfileGuid[HW_PROFILE_GUIDLEN];
    TCHAR szHwProfileName[MAX_PROFILE_LEN];
  } HW_PROFILE_INFO;
  typedef HW_PROFILE_INFO *LPHW_PROFILE_INFO; //Pointer
  typedef UINT WCT_OBJECT_TYPE; //Alias
  static const WCT_OBJECT_TYPE WctCriticalSectionType = 1;
  static const WCT_OBJECT_TYPE WctSendMessageType = 2;
  static const WCT_OBJECT_TYPE WctMutexType = 3;
  static const WCT_OBJECT_TYPE WctAlpcType = 4;
  static const WCT_OBJECT_TYPE WctComType = 5;
  static const WCT_OBJECT_TYPE WctThreadWaitType = 6;
  static const WCT_OBJECT_TYPE WctProcessWaitType = 7;
  static const WCT_OBJECT_TYPE WctThreadType = 8;
  static const WCT_OBJECT_TYPE WctComActivationType = 9;
  static const WCT_OBJECT_TYPE WctUnknownType = 10;
  static const WCT_OBJECT_TYPE WctSocketIoType = 11;
  static const WCT_OBJECT_TYPE WctSmbIoType = 12;
  typedef UINT WCT_OBJECT_STATUS; //Alias
  static const WCT_OBJECT_STATUS WctStatusNoAccess = 1;
  static const WCT_OBJECT_STATUS WctStatusRunning = 2;
  static const WCT_OBJECT_STATUS WctStatusBlocked = 3;
  static const WCT_OBJECT_STATUS WctStatusPidOnly = 4;
  static const WCT_OBJECT_STATUS WctStatusPidOnlyRpcss = 5;
  static const WCT_OBJECT_STATUS WctStatusOwned = 6;
  static const WCT_OBJECT_STATUS WctStatusNotOwned = 7;
  static const WCT_OBJECT_STATUS WctStatusAbandoned = 8;
  static const WCT_OBJECT_STATUS WctStatusUnknown = 9;
  static const WCT_OBJECT_STATUS WctStatusError = 10;
  typedef struct WAITCHAIN_NODE_INFO_u_s1 {
    WCHAR ObjectName[WCT_OBJNAME_LENGTH];
    LARGE_INTEGER Timeout;
    BOOL Alertable;
  } WAITCHAIN_NODE_INFO_u_s1;
  typedef struct WAITCHAIN_NODE_INFO_u_s2 {
    DWORD ProcessId;
    DWORD ThreadId;
    DWORD WaitTime;
    DWORD ContextSwitches;
  } WAITCHAIN_NODE_INFO_u_s2;
  typedef union WAITCHAIN_NODE_INFO_u {
    WAITCHAIN_NODE_INFO_u_s1 LockObject;
    WAITCHAIN_NODE_INFO_u_s2 ThreadObject;
  } WAITCHAIN_NODE_INFO_u;
  typedef struct WAITCHAIN_NODE_INFO {
    WCT_OBJECT_TYPE ObjectType;
    WCT_OBJECT_STATUS ObjectStatus;
    WAITCHAIN_NODE_INFO_u ObjectStatus;
  } WAITCHAIN_NODE_INFO;
  typedef WAITCHAIN_NODE_INFO *PWAITCHAIN_NODE_INFO; //Pointer
  typedef UINT SC_ENUM_TYPE; //Alias
  static const SC_ENUM_TYPE SC_ENUM_PROCESS_INFO = 0;
  typedef UINT TRACE_INFO_CLASS; //Alias
  static const TRACE_INFO_CLASS TraceGuidQueryList = 0;
  static const TRACE_INFO_CLASS TraceGuidQueryInfo = 1;
  static const TRACE_INFO_CLASS TraceGuidQueryProcess = 2;
  static const TRACE_INFO_CLASS TraceStackTracingInfo = 3;
  static const TRACE_INFO_CLASS TraceSystemTraceEnableFlagsInfo = 4;
  static const TRACE_INFO_CLASS TraceSampledProfileIntervalInfo = 5;
  static const TRACE_INFO_CLASS TraceProfileSourceConfigInfo = 6;
  static const TRACE_INFO_CLASS TraceProfileSourceListInfo = 7;
  static const TRACE_INFO_CLASS TracePmcEventListInfo = 8;
  static const TRACE_INFO_CLASS TracePmcCounterListInfo = 9;
  typedef TRACE_INFO_CLASS TRACE_QUERY_INFO_CLASS; //Alias
  typedef UINT PROG_INVOKE_SETTING; //Alias
  static const PROG_INVOKE_SETTING ProgressInvokeNever = 1;
  static const PROG_INVOKE_SETTING ProgressInvokeEveryObject = 2;
  static const PROG_INVOKE_SETTING ProgressInvokeOnError = 3;
  static const PROG_INVOKE_SETTING ProgressCancelOperation = 4;
  static const PROG_INVOKE_SETTING ProgressRetryOperation = 5;
  static const PROG_INVOKE_SETTING ProgressInvokePrePostError = 6;
  typedef UINT TRUSTED_INFORMATION_CLASS; //Alias
  static const TRUSTED_INFORMATION_CLASS TrustedDomainNameInformation = 1;
  static const TRUSTED_INFORMATION_CLASS TrustedControllersInformation = 2;
  static const TRUSTED_INFORMATION_CLASS TrustedPosixOffsetInformation = 3;
  static const TRUSTED_INFORMATION_CLASS TrustedPasswordInformation = 4;
  static const TRUSTED_INFORMATION_CLASS TrustedDomainInformationBasic = 5;
  static const TRUSTED_INFORMATION_CLASS TrustedDomainInformationEx = 6;
  static const TRUSTED_INFORMATION_CLASS TrustedDomainAuthInformation = 7;
  static const TRUSTED_INFORMATION_CLASS TrustedDomainFullInformation = 8;
  static const TRUSTED_INFORMATION_CLASS TrustedDomainAuthInformationInternal = 9;
  static const TRUSTED_INFORMATION_CLASS TrustedDomainFullInformationInternal = 10;
  static const TRUSTED_INFORMATION_CLASS TrustedDomainInformationEx2Internal = 11;
  static const TRUSTED_INFORMATION_CLASS TrustedDomainFullInformation2Internal = 12;
  static const TRUSTED_INFORMATION_CLASS TrustedDomainSupportedEncryptionTypes = 13;
  typedef DWORD SDRevision; //Alias
  static const SDRevision SECURITY_DESCRIPTOR_REVISION = 1;
  typedef DWORD SDDL_Revision; //Alias
  typedef ULONG SEF_Flags; //Alias
  typedef DWORD SaferScopeId; //Alias
  static const SaferScopeId SAFER_SCOPEID_MACHINE = 1;
  static const SaferScopeId SAFER_SCOPEID_USER = 2;
  typedef DWORD MandatoryPolicyFlags; //Alias
  typedef DWORD LogonFlags; //Alias
  typedef DWORD LogonType; //Alias
  static const LogonType LOGON32_LOGON_INTERACTIVE = 2;
  static const LogonType LOGON32_LOGON_NETWORK = 3;
  static const LogonType LOGON32_LOGON_BATCH = 4;
  static const LogonType LOGON32_LOGON_SERVICE = 5;
  static const LogonType LOGON32_LOGON_UNLOCK = 7;
  static const LogonType LOGON32_LOGON_NETWORK_CLEARTEXT = 8;
  static const LogonType LOGON32_LOGON_NEW_CREDENTIALS = 9;
  typedef DWORD LogonProvider; //Alias
  static const LogonProvider LOGON32_PROVIDER_DEFAULT = 0;
  static const LogonProvider LOGON32_PROVIDER_WINNT35 = 1;
  static const LogonProvider LOGON32_PROVIDER_WINNT40 = 2;
  static const LogonProvider LOGON32_PROVIDER_WINNT50 = 3;
  typedef DWORD TreeSecAction; //Alias
  typedef DWORD CredGetTargetInfoFlags; //Alias
  typedef DWORD CredType; //Alias
  static const CredType CRED_TYPE_GENERIC = 1;
  static const CredType CRED_TYPE_DOMAIN_PASSWORD = 2;
  static const CredType CRED_TYPE_DOMAIN_CERTIFICATE = 3;
  static const CredType CRED_TYPE_DOMAIN_VISIBLE_PASSWORD = 4;
  static const CredType CRED_TYPE_GENERIC_CERTIFICATE = 5;
  typedef DWORD CredEnumerateFlags; //Alias
  typedef DWORD CreateRestrictedTokenFlags; //Alias
  typedef UINT POLICY_INFORMATION_CLASS; //Alias
  static const POLICY_INFORMATION_CLASS PolicyAuditLogInformation = 1;
  static const POLICY_INFORMATION_CLASS PolicyAuditEventsInformation = 2;
  static const POLICY_INFORMATION_CLASS PolicyPrimaryDomainInformation = 3;
  static const POLICY_INFORMATION_CLASS PolicyPdAccountInformation = 4;
  static const POLICY_INFORMATION_CLASS PolicyAccountDomainInformation = 5;
  static const POLICY_INFORMATION_CLASS PolicyLsaServerRoleInformation = 6;
  static const POLICY_INFORMATION_CLASS PolicyReplicaSourceInformation = 7;
  static const POLICY_INFORMATION_CLASS PolicyDefaultQuotaInformation = 8;
  static const POLICY_INFORMATION_CLASS PolicyModificationInformation = 9;
  static const POLICY_INFORMATION_CLASS PolicyAuditFullSetInformation = 11;
  static const POLICY_INFORMATION_CLASS PolicyAuditFullQueryInformation = 11;
  static const POLICY_INFORMATION_CLASS PolicyDnsDomainInformation = 12;
  static const POLICY_INFORMATION_CLASS PolicyDnsDomainInformationInt = 13;
  static const POLICY_INFORMATION_CLASS PolicyLocalAccountDomainInformation = 14;
  typedef UINT POLICY_DOMAIN_INFORMATION_CLASS; //Alias
  static const POLICY_DOMAIN_INFORMATION_CLASS PolicyDomainQualityOfServiceInformation = 1;
  static const POLICY_DOMAIN_INFORMATION_CLASS PolicyDomainEfsInformation = 2;
  static const POLICY_DOMAIN_INFORMATION_CLASS PolicyDomainKerberosTicketInformation = 3;
  typedef struct EFS_HASH_BLOB {
    DWORD cbData;
    PBYTE pbData;
  } EFS_HASH_BLOB;
  typedef EFS_HASH_BLOB *PEFS_HASH_BLOB; //Pointer
  typedef struct ENCRYPTION_CERTIFICATE_HASH {
    DWORD cbTotalLength;
    SID* pUserSid;
    PEFS_HASH_BLOB pHash;
    LPWSTR lpDisplayInformation;
  } ENCRYPTION_CERTIFICATE_HASH;
  typedef ENCRYPTION_CERTIFICATE_HASH *PENCRYPTION_CERTIFICATE_HASH; //Pointer
  typedef struct ENCRYPTION_CERTIFICATE_HASH_LIST {
    DWORD nCert_Hash;
    PENCRYPTION_CERTIFICATE_HASH* pUsers;
  } ENCRYPTION_CERTIFICATE_HASH_LIST;
  typedef ENCRYPTION_CERTIFICATE_HASH_LIST *PENCRYPTION_CERTIFICATE_HASH_LIST; //Pointer
  typedef UINT INSTALLSPECTYPE; //Alias
  static const INSTALLSPECTYPE APPNAME = 1;
  static const INSTALLSPECTYPE FILEEXT = 2;
  static const INSTALLSPECTYPE PROGID = 3;
  static const INSTALLSPECTYPE COMCLASS = 4;
  typedef struct INSTALLSPEC_s1 {
    WCHAR* Name;
    GUID GPOId;
  } INSTALLSPEC_s1;
  typedef struct INSTALLSPEC_s2 {
    GUID Clsid;
    CLSCTX ClsCtx;
  } INSTALLSPEC_s2;
  typedef union INSTALLSPEC {
    INSTALLSPEC_s1 AppName;
    WCHAR* FileExt;
    WCHAR* ProgId;
    INSTALLSPEC_s2 COMClass;
  } INSTALLSPEC;
  typedef struct INSTALLDATA {
    INSTALLSPECTYPE Type;
    INSTALLSPEC Spec;
  } INSTALLDATA;
  typedef INSTALLDATA *PINSTALLDATA; //Pointer
  typedef struct VALENT {
    LPTSTR ve_valuename;
    DWORD ve_valuelen;
    DWORD_PTR ve_valueptr;
    DWORD ve_type;
  } VALENT;
  typedef VALENT *PVALENT; //Pointer
  typedef struct EFS_CERTIFICATE_BLOB {
    DWORD dwCertEncodingType;
    DWORD cbData;
    PBYTE pbData;
  } EFS_CERTIFICATE_BLOB;
  typedef EFS_CERTIFICATE_BLOB *PEFS_CERTIFICATE_BLOB; //Pointer
  typedef struct ENCRYPTION_CERTIFICATE {
    DWORD cbTotalLength;
    SID* pUserSid;
    PEFS_CERTIFICATE_BLOB pCertBlob;
  } ENCRYPTION_CERTIFICATE;
  typedef ENCRYPTION_CERTIFICATE *PENCRYPTION_CERTIFICATE; //Pointer
  typedef struct ENCRYPTION_CERTIFICATE_LIST {
    DWORD nUsers;
    PENCRYPTION_CERTIFICATE* pUsers;
  } ENCRYPTION_CERTIFICATE_LIST;
  typedef ENCRYPTION_CERTIFICATE_LIST *PENCRYPTION_CERTIFICATE_LIST; //Pointer
  typedef DWORD LocalState; //Alias
  typedef struct LOCALMANAGEDAPPLICATION {
    LPWSTR pszDeploymentName;
    LPWSTR pszPolicyName;
    LPWSTR pszProductId;
    LocalState dwState;
  } LOCALMANAGEDAPPLICATION;
  typedef LOCALMANAGEDAPPLICATION *PLOCALMANAGEDAPPLICATION; //Pointer
  typedef struct MANAGEDAPPLICATION {
    LPWSTR pszPackageName;
    LPWSTR pszPublisher;
    DWORD dwVersionHi;
    DWORD dwVersionLo;
    DWORD dwRevision;
    GUID GpoId;
    LPWSTR pszPolicyName;
    GUID ProductId;
    LANGID Language;
    LPWSTR pszOwner;
    LPWSTR pszCompany;
    LPWSTR pszComments;
    LPWSTR pszContact;
    LPWSTR pszSupportUrl;
    DWORD dwPathType;
    BOOL bInstalled;
  } MANAGEDAPPLICATION;
  typedef MANAGEDAPPLICATION *PMANAGEDAPPLICATION; //Pointer
  typedef struct PERF_COUNTERSET_INSTANCE {
    GUID CounterSetGuid;
    ULONG dwSize;
    ULONG InstanceId;
    ULONG InstanceNameOffset;
    ULONG InstanceNameSize;
  } PERF_COUNTERSET_INSTANCE;
  typedef PERF_COUNTERSET_INSTANCE *PPERF_COUNTERSET_INSTANCE; //Pointer
  typedef struct PERF_COUNTERSET_INFO {
    GUID CounterSetGuid;
    GUID ProviderGuid;
    ULONG NumCounters;
    ULONG InstanceType;
  } PERF_COUNTERSET_INFO;
  typedef PERF_COUNTERSET_INFO *PPERF_COUNTERSET_INFO; //Pointer
  typedef LPVOID PERFLIBREQUEST; //Alias
  typedef LPVOID PERF_MEM_ALLOC; //Alias
  typedef LPVOID PERF_MEM_FREE; //Alias
  typedef struct PERF_PROVIDER_CONTEXT {
    DWORD ContextSize;
    DWORD Reserved;
    PERFLIBREQUEST ControlCallback;
    PERF_MEM_ALLOC MemAllocRoutine;
    PERF_MEM_FREE MemFreeRoutine;
    LPVOID pMemContext;
  } PERF_PROVIDER_CONTEXT;
  typedef PERF_PROVIDER_CONTEXT *PPERF_PROVIDER_CONTEXT; //Pointer
  typedef LPVOID PEVENT_FILTER_DESCRIPTOR; //Alias
  typedef struct ENABLE_TRACE_PARAMETERS {
    ULONG Version;
    ULONG EnableProperty;
    ULONG ControlFlags;
    GUID SourceId;
    PEVENT_FILTER_DESCRIPTOR EnableFilterDesc;
  } ENABLE_TRACE_PARAMETERS;
  typedef ENABLE_TRACE_PARAMETERS *PENABLE_TRACE_PARAMETERS; //Pointer
  typedef struct TRACE_GUID_PROPERTIES {
    GUID Guid;
    ULONG GuidType;
    ULONG LoggerId;
    ULONG EnableLevel;
    ULONG EnableFlags;
    BOOLEAN IsEnable;
  } TRACE_GUID_PROPERTIES;
  typedef TRACE_GUID_PROPERTIES *PTRACE_GUID_PROPERTIES; //Pointer
  typedef struct TRACE_GUID_REGISTRATION {
    LPCGUID Guid;
    HANDLE RegHandle;
  } TRACE_GUID_REGISTRATION;
  typedef TRACE_GUID_REGISTRATION *PTRACE_GUID_REGISTRATION; //Pointer
  typedef struct INHERITED_FROM {
    LONG GenerationGap;
    LPTSTR AncestorName;
  } INHERITED_FROM;
  typedef INHERITED_FROM *PINHERITED_FROM; //Pointer
  typedef struct FN_OBJECT_MGR_FUNCTS {
    ULONG Placeholder;
  } FN_OBJECT_MGR_FUNCTS;
  typedef FN_OBJECT_MGR_FUNCTS *PFN_OBJECT_MGR_FUNCTS; //Pointer
  typedef struct LSA_TRANSLATED_SID {
    SID_NAME_USE Use;
    ULONG RelativeId;
    LONG DomainIndex;
  } LSA_TRANSLATED_SID;
  typedef LSA_TRANSLATED_SID *PLSA_TRANSLATED_SID; //Pointer
  typedef struct LSA_TRANSLATED_SID2 {
    SID_NAME_USE Use;
    PSID Sid;
    LONG DomainIndex;
    ULONG Flags;
  } LSA_TRANSLATED_SID2;
  typedef LSA_TRANSLATED_SID2 *PLSA_TRANSLATED_SID2; //Pointer
  typedef struct LSA_TRANSLATED_NAME {
    SID_NAME_USE Use;
    LSA_UNICODE_STRING Name;
    LONG DomainIndex;
  } LSA_TRANSLATED_NAME;
  typedef LSA_TRANSLATED_NAME *PLSA_TRANSLATED_NAME; //Pointer
  typedef struct TRUSTED_DOMAIN_INFORMATION_EX {
    LSA_UNICODE_STRING Name;
    LSA_UNICODE_STRING FlatName;
    PSID Sid;
    ULONG TrustDirection;
    ULONG TrustType;
    ULONG TrustAttributes;
  } TRUSTED_DOMAIN_INFORMATION_EX;
  typedef TRUSTED_DOMAIN_INFORMATION_EX *PTRUSTED_DOMAIN_INFORMATION_EX; //Pointer
  typedef ULONG LsaAuthType; //Alias
  static const LsaAuthType TRUST_AUTH_TYPE_NONE = 0;
  static const LsaAuthType TRUST_AUTH_TYPE_NT4OWF = 1;
  static const LsaAuthType TRUST_AUTH_TYPE_CLEAR = 2;
  static const LsaAuthType TRUST_AUTH_TYPE_VERSION = 3;
  typedef struct LSA_AUTH_INFORMATION {
    LARGE_INTEGER LastUpdateTime;
    LsaAuthType AuthType;
    ULONG AuthInfoLength;
    PUCHAR AuthInfo;
  } LSA_AUTH_INFORMATION;
  typedef LSA_AUTH_INFORMATION *PLSA_AUTH_INFORMATION; //Pointer
  typedef struct TRUSTED_DOMAIN_AUTH_INFORMATION {
    ULONG IncomingAuthInfos;
    PLSA_AUTH_INFORMATION IncomingAuthenticationInformation;
    PLSA_AUTH_INFORMATION IncomingPreviousAuthenticationInformation;
    ULONG OutgoingAuthInfos;
    PLSA_AUTH_INFORMATION OutgoingAuthenticationInformation;
    PLSA_AUTH_INFORMATION OutgoingPreviousAuthenticationInformation;
  } TRUSTED_DOMAIN_AUTH_INFORMATION;
  typedef TRUSTED_DOMAIN_AUTH_INFORMATION *PTRUSTED_DOMAIN_AUTH_INFORMATION; //Pointer
  typedef ULONG TRACE_MESSAGE_FLAGS; //Alias
  typedef ULONG LSA_LOOKUP_FLAGS; //Alias
  typedef LPVOID PFE_EXPORT_FUNC; //Alias
  typedef LPVOID PFE_IMPORT_FUNC; //Alias
  typedef LPVOID LPHANDLER_FUNCTION; //Alias
  typedef LPVOID LPHANDLER_FUNCTION_EX; //Alias
  typedef ULONG64 TRACEHANDLE; //Alias
  typedef TRACEHANDLE *PTRACEHANDLE; //Pointer
  typedef LPVOID WMIDPREQUEST; //Alias
  typedef LPVOID ENABLECALLBACK; //Alias
  typedef LPVOID FN_PROGRESS; //Alias
  typedef LPVOID PSID; //Alias
  typedef PVOID LSA_HANDLE; //Alias
  typedef LSA_HANDLE *PLSA_HANDLE; //Pointer
  typedef ULONG LSA_ENUMERATION_HANDLE; //Alias
  typedef LSA_ENUMERATION_HANDLE *PLSA_ENUMERATION_HANDLE; //Pointer
  typedef LPVOID HWCT; //Alias
  typedef LPVOID PWAITCHAINCALLBACK; //Alias
  typedef LPVOID PCOGETCALLSTATE; //Alias
  typedef LPVOID PCOGETACTIVATIONSTATE; //Alias
  typedef ULONGLONG REGHANDLE; //Alias
  typedef REGHANDLE *PREGHANDLE; //Pointer
  typedef OBJECT_ATTRIBUTES *PLSA_OBJECT_ATTRIBUTES; //Pointer
  typedef DWORD SHUTDOWN_FLAGS; //Alias
  typedef DWORD SHTDN_REASON; //Alias
  typedef TOKEN_ACCESS_MASK TOKEN_ACCESS_MASK_DWORD; //Alias
  REG_ERROR                 RegCloseKey(                                         HKEY hKey);
  REG_ERROR                 RegConnectRegistry(                                  LPCTSTR lpMachineName, HKEY hKey, PHKEY phkResult);
  REG_ERROR                 RegCopyTree(                                         HKEY hKeySrc, LPCTSTR lpSubKey, HKEY hKeyDest);
  REG_ERROR                 RegCreateKeyEx(                                      HKEY hKey, LPCTSTR lpSubKey, DWORD Reserved, LPTSTR lpClass, RegOptions dwOptions, REGSAM samDesired, LPSECURITY_ATTRIBUTES lpSecurityAttributes, PHKEY phkResult, RegDisposition* lpdwDisposition);
  REG_ERROR                 RegCreateKeyTransacted(                              HKEY hKey, LPCTSTR lpSubKey, DWORD Reserved, LPTSTR lpClass, RegOptions dwOptions, REGSAM samDesired, LPSECURITY_ATTRIBUTES lpSecurityAttributes, PHKEY phkResult, RegDisposition* lpdwDisposition, HANDLE hTransaction, PVOID pExtendedParemeter);
  REG_ERROR                 RegDeleteKey(                                        HKEY hKey, LPCTSTR lpSubKey);
  REG_ERROR                 RegDeleteKeyEx(                                      HKEY hKey, LPCTSTR lpSubKey, REGSAM samDesired, DWORD Reserved);
  REG_ERROR                 RegDeleteKeyTransacted(                              HKEY hKey, LPCTSTR lpSubKey, REGSAM samDesired, DWORD Reserved, HANDLE hTransaction, PVOID pExtendedParameter);
  REG_ERROR                 RegDeleteKeyValue(                                   HKEY hKey, LPCTSTR lpSubKey, LPCTSTR lpValueName);
  REG_ERROR                 RegDeleteTree(                                       HKEY hKey, LPCTSTR lpSubKey);
  REG_ERROR                 RegDeleteValue(                                      HKEY hKey, LPCTSTR lpValueName);
  REG_ERROR                 RegDisablePredefinedCache(                           );
  REG_ERROR                 RegDisablePredefinedCacheEx(                         );
  REG_ERROR                 RegDisableReflectionKey(                             HKEY hBase);
  REG_ERROR                 RegEnableReflectionKey(                              HKEY hBase);
  REG_ERROR                 RegEnumKeyEx(                                        HKEY hKey, DWORD dwIndex, LPTSTR lpName, LPDWORD lpcName, LPDWORD lpReserved, LPTSTR lpClass, LPDWORD lpcClass, PFILETIME lpftLastWriteTime);
  REG_ERROR                 RegEnumValue(                                        HKEY hKey, DWORD dwIndex, LPTSTR lpValueName, LPDWORD lpcchValueName, LPDWORD lpReserved, RegType* lpType, LPBYTE lpData, LPDWORD lpcbData);
  REG_ERROR                 RegFlushKey(                                         HKEY hKey);
  REG_ERROR                 RegGetValue(                                         HKEY hkey, LPCTSTR lpSubKey, LPCTSTR lpValue, DWORD dwFlags, RegType* pdwType, PVOID pvData, LPDWORD pcbData);
  REG_ERROR                 RegLoadKey(                                          HKEY hKey, LPCTSTR lpSubKey, LPCTSTR lpFile);
  REG_ERROR                 RegLoadMUIString(                                    HKEY hKey, LPCTSTR pszValue, LPTSTR pszOutBuf, DWORD cbOutBuf, LPDWORD pcbData, RegMuiFlags Flags, LPCTSTR pszDirectory);
  REG_ERROR                 RegNotifyChangeKeyValue(                             HKEY hKey, BOOL bWatchSubtree, RegNotifyFlags dwNotifyFilter, HANDLE hEvent, BOOL fAsynchronous);
  REG_ERROR                 RegOpenCurrentUser(                                  REGSAM samDesired, PHKEY phkResult);
  REG_ERROR                 RegOpenKeyEx(                                        HKEY hKey, LPCTSTR lpSubKey, DWORD ulOptions, REGSAM samDesired, PHKEY phkResult);
  REG_ERROR                 RegOpenKeyTransacted(                                HKEY hKey, LPCTSTR lpSubKey, DWORD ulOptions, REGSAM samDesired, PHKEY phkResult, HANDLE hTransaction, PVOID pExtendedParameter);
  REG_ERROR                 RegOpenUserClassesRoot(                              HANDLE hToken, DWORD dwOptions, REGSAM samDesired, PHKEY phkResult);
  REG_ERROR                 RegOverridePredefKey(                                HKEY hKey, HKEY hNewHKey);
  REG_ERROR                 RegQueryInfoKey(                                     HKEY hKey, LPTSTR lpClass, LPDWORD lpcClass, LPDWORD lpReserved, LPDWORD lpcSubKeys, LPDWORD lpcMaxSubKeyLen, LPDWORD lpcMaxClassLen, LPDWORD lpcValues, LPDWORD lpcMaxValueNameLen, LPDWORD lpcMaxValueLen, LPDWORD lpcbSecurityDescriptor, PFILETIME lpftLastWriteTime);
  REG_ERROR                 RegQueryMultipleValues(                              HKEY hKey, PVALENT val_list, DWORD num_vals, LPVOID lpValueBuf, LPDWORD ldwTotsize);
  REG_ERROR                 RegQueryReflectionKey(                               HKEY hBase, BOOL* bIsReflectionDisabled);
  REG_ERROR                 RegQueryValueEx(                                     HKEY hKey, LPCTSTR lpValueName, LPDWORD lpReserved, RegType* lpType, LPBYTE lpData, LPDWORD lpcbData);
  REG_ERROR                 RegReplaceKey(                                       HKEY hKey, LPCTSTR lpSubKey, LPCTSTR lpNewFile, LPCTSTR lpOldFile);
  REG_ERROR                 RegRestoreKey(                                       HKEY hKey, LPCTSTR lpFile, DWORD dwFlags);
  REG_ERROR                 RegSaveKey(                                          HKEY hKey, LPCTSTR lpFile, LPSECURITY_ATTRIBUTES lpSecurityAttributes);
  REG_ERROR                 RegSaveKeyEx(                                        HKEY hKey, LPCTSTR lpFile, LPSECURITY_ATTRIBUTES lpSecurityAttributes, DWORD Flags);
  REG_ERROR                 RegSetKeyValue(                                      HKEY hKey, LPCTSTR lpSubKey, LPCTSTR lpValueName, RegType dwType, LPCVOID lpData, DWORD cbData);
  REG_ERROR                 RegSetValueEx(                                       HKEY hKey, LPCTSTR lpValueName, DWORD Reserved, RegType dwType, BYTE* lpData, DWORD cbData);
  REG_ERROR                 RegUnLoadKey(                                        HKEY hKey, LPCTSTR lpSubKey);
  REG_ERROR                 RegCreateKey(                                        HKEY hKey, LPCTSTR lpSubKey, PHKEY phkResult);
  REG_ERROR                 RegEnumKey(                                          HKEY hKey, DWORD dwIndex, LPTSTR lpName, DWORD cchName);
  REG_ERROR                 RegOpenKey(                                          HKEY hKey, LPCTSTR lpSubKey, PHKEY phkResult);
  REG_ERROR                 RegQueryValue(                                       HKEY hKey, LPCTSTR lpSubKey, LPTSTR lpValue, PLONG lpcbValue);
  REG_ERROR                 RegSetValue(                                         HKEY hKey, LPCTSTR lpSubKey, RegType dwType, LPCTSTR lpData, DWORD cbData);
  ERROR_CODE                AddUsersToEncryptedFile(                             LPCWSTR lpFileName, PENCRYPTION_CERTIFICATE_LIST pUsers);
  void                      CloseEncryptedFileRaw(                               PVOID pvContext);
  BOOL                      DecryptFile(                                         LPCTSTR lpFileName, DWORD dwReserved);
  ERROR_CODE                DuplicateEncryptionInfoFile(                         LPCTSTR SrcFileName, LPCTSTR DstFileName, DWORD dwCreationDistribution, DWORD dwAttributes, LPSECURITY_ATTRIBUTES lpSecurityAttributes);
  BOOL                      EncryptFile(                                         LPCTSTR lpFileName);
  BOOL                      EncryptionDisable(                                   LPCWSTR DirPath, BOOL Disable);
  BOOL                      FileEncryptionStatus(                                LPCTSTR lpFileName, LPDWORD lpStatus);
  void                      FreeEncryptionCertificateHashList(                   PENCRYPTION_CERTIFICATE_HASH_LIST pHashes);
  ERROR_CODE                OpenEncryptedFileRaw(                                LPCTSTR lpFileName, ULONG ulFlags, PVOID* pvContext);
  ERROR_CODE                QueryRecoveryAgentsOnEncryptedFile(                  LPCWSTR lpFileName, PENCRYPTION_CERTIFICATE_HASH_LIST* pRecoveryAgents);
  ERROR_CODE                QueryUsersOnEncryptedFile(                           LPCWSTR lpFileName, PENCRYPTION_CERTIFICATE_HASH_LIST* pUsers);
  ERROR_CODE                ReadEncryptedFileRaw(                                PFE_EXPORT_FUNC pfExportCallback, PVOID pvCallbackContext, PVOID pvContext);
  ERROR_CODE                RemoveUsersFromEncryptedFile(                        LPCWSTR lpFileName, PENCRYPTION_CERTIFICATE_HASH_LIST pHashes);
  ERROR_CODE                SetUserFileEncryptionKey(                            PENCRYPTION_CERTIFICATE pEncryptionCertificate);
  ERROR_CODE                WriteEncryptedFileRaw(                               PFE_IMPORT_FUNC pfImportCallback, PVOID pvCallbackContext, PVOID pvContext);
  BOOL                      CreateProcessAsUser(                                 HANDLE hToken, LPCTSTR lpApplicationName, LPTSTR lpCommandLine, LPSECURITY_ATTRIBUTES lpProcessAttributes, LPSECURITY_ATTRIBUTES lpThreadAttributes, BOOL bInheritHandles, CreateProcessFlags dwCreationFlags, LPVOID lpEnvironment, LPCTSTR lpCurrentDirectory, LPSTARTUPINFO lpStartupInfo, LPPROCESS_INFORMATION lpProcessInformation);
  BOOL                      CreateProcessWithLogonW(                             LPCWSTR lpUsername, LPCWSTR lpDomain, LPCWSTR lpPassword, LogonFlags dwLogonFlags, LPCWSTR lpApplicationName, LPWSTR lpCommandLine, CreateProcessFlags dwCreationFlags, LPVOID lpEnvironment, LPCWSTR lpCurrentDirectory, LPSTARTUPINFOW lpStartupInfo, LPPROCESS_INFORMATION lpProcessInfo);
  BOOL                      CreateProcessWithTokenW(                             HANDLE hToken, LogonFlags dwLogonFlags, LPCWSTR lpApplicationName, LPWSTR lpCommandLine, CreateProcessFlags dwCreationFlags, LPVOID lpEnvironment, LPCWSTR lpCurrentDirectory, LPSTARTUPINFOW lpStartupInfo, LPPROCESS_INFORMATION lpProcessInfo);
  ERROR_CODE                GetLocalManagedApplications(                         BOOL bUserApps, LPDWORD pdwApps, PLOCALMANAGEDAPPLICATION* prgLocalApps);
  ERROR_CODE                GetManagedApplications(                              GUID* pCategory, DWORD dwQueryFlags, DWORD dwInfoLevel, LPDWORD pdwApps, PMANAGEDAPPLICATION* prgManagedApps);
  ERROR_CODE                GetManagedApplicationCategories(                     DWORD dwReserved, APPCATEGORYINFOLIST* pAppCategory);
  ERROR_CODE                InstallApplication(                                  PINSTALLDATA* pInstallInfo);
  ERROR_CODE                UninstallApplication(                                WCHAR* ProductCode, DWORD dwStatus);
  BOOL                      AbortSystemShutdown(                                 LPTSTR lpMachineName);
  ERROR_CODE                InitiateShutdown(                                    LPTSTR lpMachineName, LPTSTR lpMessage, DWORD dwGracePeriod, SHUTDOWN_FLAGS dwShutdownFlags, SHTDN_REASON dwReason);
  BOOL                      InitiateSystemShutdown(                              LPTSTR lpMachineName, LPTSTR lpMessage, DWORD dwTimeout, BOOL bForceAppsClosed, BOOL bRebootAfterShutdown);
  BOOL                      InitiateSystemShutdownEx(                            LPTSTR lpMachineName, LPTSTR lpMessage, DWORD dwTimeout, BOOL bForceAppsClosed, BOOL bRebootAfterShutdown, SHTDN_REASON dwReason);
  BOOL                      BackupEventLog(                                      HANDLE hEventLog, LPCTSTR lpBackupFileName);
  BOOL                      ClearEventLog(                                       HANDLE hEventLog, LPCTSTR lpBackupFileName);
  BOOL                      CloseEventLog(                                       HANDLE hEventLog);
  BOOL                      DeregisterEventSource(                               HANDLE hEventLog);
  BOOL                      GetEventLogInformation(                              HANDLE hEventLog, DWORD dwInfoLevel, LPVOID lpBuffer, DWORD cbBufSize, LPDWORD pcbBytesNeeded);
  BOOL                      GetNumberOfEventLogRecords(                          HANDLE hEventLog, PDWORD NumberOfRecords);
  BOOL                      GetOldestEventLogRecord(                             HANDLE hEventLog, PDWORD OldestRecord);
  BOOL                      NotifyChangeEventLog(                                HANDLE hEventLog, HANDLE hEvent);
  HANDLE                    OpenBackupEventLog(                                  LPCTSTR lpUNCServerName, LPCTSTR lpFileName);
  HANDLE                    OpenEventLog(                                        LPCTSTR lpUNCServerName, LPCTSTR lpSourceName);
  BOOL                      ReadEventLog(                                        HANDLE hEventLog, DWORD dwReadFlags, DWORD dwRecordOffset, LPVOID lpBuffer, DWORD nNumberOfBytesToRead, DWORD* pnBytesRead, DWORD* pnMinNumberOfBytesNeeded);
  HANDLE                    RegisterEventSource(                                 LPCTSTR lpUNCServerName, LPCTSTR lpSourceName);
  BOOL                      ReportEvent(                                         HANDLE hEventLog, EventLogType wType, WORD wCategory, DWORD dwEventID, PSID lpUserSid, WORD wNumStrings, DWORD dwDataSize, LPCTSTR* lpStrings, LPVOID lpRawData);
  PPERF_COUNTERSET_INSTANCE PerfCreateInstance(                                  HANDLE hProvider, LPCGUID CounterSetGuid, LPCWSTR szInstanceName, ULONG dwInstance);
  ERROR_CODE_ULONG          PerfDecrementULongCounterValue(                      HANDLE hProvider, PPERF_COUNTERSET_INSTANCE pInstance, ULONG CounterId, ULONG lValue);
  ERROR_CODE_ULONG          PerfDecrementULongLongCounterValue(                  HANDLE hProvider, PPERF_COUNTERSET_INSTANCE pInstance, ULONG CounterId, ULONGLONG llValue);
  ERROR_CODE_ULONG          PerfDeleteInstance(                                  HANDLE hProvider, PPERF_COUNTERSET_INSTANCE InstanceBlock);
  ERROR_CODE_ULONG          PerfIncrementULongCounterValue(                      HANDLE hProvider, PPERF_COUNTERSET_INSTANCE pInstance, ULONG CounterId, ULONG lValue);
  ERROR_CODE_ULONG          PerfIncrementULongLongCounterValue(                  HANDLE hProvider, PPERF_COUNTERSET_INSTANCE pInstance, ULONG CounterId, ULONGLONG llValue);
  PPERF_COUNTERSET_INSTANCE PerfQueryInstance(                                   HANDLE hProvider, LPCGUID CounterSetGuid, LPCWSTR szInstance, ULONG dwInstance);
  ERROR_CODE_ULONG          PerfSetCounterSetInfo(                               HANDLE hProvider, PPERF_COUNTERSET_INFO pTemplate, ULONG dwTemplateSize);
  ERROR_CODE_ULONG          PerfSetULongCounterValue(                            HANDLE hProvider, PPERF_COUNTERSET_INSTANCE pInstance, ULONG CounterId, ULONG lValue);
  ERROR_CODE_ULONG          PerfSetULongLongCounterValue(                        HANDLE hProvider, PPERF_COUNTERSET_INSTANCE pInstance, ULONG CounterId, ULONGLONG llValue);
  ERROR_CODE_ULONG          PerfSetCounterRefValue(                              HANDLE hProvider, PPERF_COUNTERSET_INSTANCE pInstance, ULONG CounterId, PVOID lpAddr);
  ERROR_CODE_ULONG          PerfStartProvider(                                   LPGUID ProviderGuid, PERFLIBREQUEST ControlCallback, HANDLE* phProvider);
  ERROR_CODE_ULONG          PerfStartProviderEx(                                 LPGUID ProviderGuid, PPERF_PROVIDER_CONTEXT ProviderContext, HANDLE* phProvider);
  ERROR_CODE_ULONG          PerfStopProvider(                                    HANDLE hProvider);
  SERVICE_STATUS_HANDLE     RegisterServiceCtrlHandler(                          LPCTSTR lpServiceName, LPHANDLER_FUNCTION lpHandlerProc);
  SERVICE_STATUS_HANDLE     RegisterServiceCtrlHandlerEx(                        LPCTSTR lpServiceName, LPHANDLER_FUNCTION_EX lpHandlerProc, LPVOID lpContext);
  BOOL                      SetServiceBits(                                      SERVICE_STATUS_HANDLE hServiceStatus, DWORD dwServiceBits, BOOL bSetBitsOn, BOOL bUpdateImmediately);
  BOOL                      SetServiceStatus(                                    SERVICE_STATUS_HANDLE hServiceStatus, LPSERVICE_STATUS lpServiceStatus);
  BOOL                      StartServiceCtrlDispatcher(                          SERVICE_TABLE_ENTRY* lpServiceTable);
  BOOL                      ChangeServiceConfig(                                 SC_HANDLE hService, ServiceType dwServiceType, ServiceStartType dwStartType, ServiceErrorControl dwErrorControl, LPCTSTR lpBinaryPathName, LPCTSTR lpLoadOrderGroup, LPDWORD lpdwTagId, LPCTSTR lpDependencies, LPCTSTR lpServiceStartName, LPCTSTR lpPassword, LPCTSTR lpDisplayName);
  BOOL                      ChangeServiceConfig2(                                SC_HANDLE hService, ServiceInfoLevel dwInfoLevel, LPVOID lpInfo);
  BOOL                      CloseServiceHandle(                                  SC_HANDLE hSCObject);
  BOOL                      ControlService(                                      SC_HANDLE hService, ServiceControl dwControl, LPSERVICE_STATUS lpServiceStatus);
  BOOL                      ControlServiceEx(                                    SC_HANDLE hService, DWORD dwControl, DWORD dwInfoLevel, PVOID pControlParams);
  SC_HANDLE                 CreateService(                                       SC_HANDLE hSCManager, LPCTSTR lpServiceName, LPCTSTR lpDisplayName, ServiceAccess dwDesiredAccess, ServiceType dwServiceType, ServiceStartType dwStartType, ServiceErrorControl dwErrorControl, LPCTSTR lpBinaryPathName, LPCTSTR lpLoadOrderGroup, LPDWORD lpdwTagId, LPCTSTR lpDependencies, LPCTSTR lpServiceStartName, LPCTSTR lpPassword);
  BOOL                      DeleteService(                                       SC_HANDLE hService);
  BOOL                      EnumDependentServices(                               SC_HANDLE hService, ServiceState dwServiceState, LPENUM_SERVICE_STATUS lpServices, DWORD cbBufSize, LPDWORD pcbBytesNeeded, LPDWORD lpServicesReturned);
  BOOL                      EnumServicesStatusEx(                                SC_HANDLE hSCManager, SC_ENUM_TYPE InfoLevel, ServiceType dwServiceType, ServiceState dwServiceState, LPBYTE lpServices, DWORD cbBufSize, LPDWORD pcbBytesNeeded, LPDWORD lpServicesReturned, LPDWORD lpResumeHandle, LPCTSTR pszGroupName);
  BOOL                      GetServiceDisplayName(                               SC_HANDLE hSCManager, LPCTSTR lpServiceName, LPTSTR lpDisplayName, LPDWORD lpcchBuffer);
  BOOL                      GetServiceKeyName(                                   SC_HANDLE hSCManager, LPCTSTR lpDisplayName, LPTSTR lpServiceName, LPDWORD lpcchBuffer);
  BOOL                      NotifyBootConfigStatus(                              BOOL BootAcceptable);
  ERROR_CODE                NotifyServiceStatusChange(                           SC_HANDLE hService, ServiceNotifyMask dwNotifyMask, PSERVICE_NOTIFY pNotifyBuffer);
  SC_HANDLE                 OpenSCManager(                                       LPCTSTR lpMachineName, LPCTSTR lpDatabaseName, SCManagerAccess dwDesiredAccess);
  SC_HANDLE                 OpenService(                                         SC_HANDLE hSCManager, LPCTSTR lpServiceName, ServiceAccess dwDesiredAccess);
  BOOL                      QueryServiceConfig(                                  SC_HANDLE hService, LPQUERY_SERVICE_CONFIG lpServiceConfig, DWORD cbBufSize, LPDWORD pcbBytesNeeded);
  BOOL                      QueryServiceConfig2(                                 SC_HANDLE hService, ServiceInfoLevel dwInfoLevel, LPBYTE lpBuffer, DWORD cbBufSize, LPDWORD pcbBytesNeeded);
  BOOL                      QueryServiceStatus(                                  SC_HANDLE hService, LPSERVICE_STATUS lpServiceStatus);
  BOOL                      QueryServiceStatusEx(                                SC_HANDLE hService, SC_STATUS_TYPE InfoLevel, LPBYTE lpBuffer, DWORD cbBufSize, LPDWORD pcbBytesNeeded);
  BOOL                      StartService(                                        SC_HANDLE hService, DWORD dwNumServiceArgs, LPCTSTR* lpServiceArgVectors);
  BOOL                      EnumServicesStatus(                                  SC_HANDLE hSCManager, ServiceType dwServiceType, ServiceState dwServiceState, LPENUM_SERVICE_STATUS lpServices, DWORD cbBufSize, LPDWORD pcbBytesNeeded, LPDWORD lpServicesReturned, LPDWORD lpResumeHandle);
  SC_LOCK                   LockServiceDatabase(                                 SC_HANDLE hSCManager);
  BOOL                      QueryServiceLockStatus(                              SC_HANDLE hSCManager, LPQUERY_SERVICE_LOCK_STATUS lpLockStatus, DWORD cbBufSize, LPDWORD pcbBytesNeeded);
  BOOL                      UnlockServiceDatabase(                               SC_LOCK ScLock);
  BOOL                      GetCurrentHwProfile(                                 LPHW_PROFILE_INFO lpHwProfileInfo);
  BOOL                      GetUserName(                                         LPTSTR lpBuffer, LPDWORD lpnSize);
  BOOL                      IsTextUnicode(                                       VOID* lpv, int iSize, IsTextUnicodeFlags* lpiResult);
  BOOL                      CryptAcquireContext(                                 HCRYPTPROV* phProv, LPCTSTR pszContainer, LPCTSTR pszProvider, CryptProv dwProvType, CryptAcquireContextFlags dwFlags);
  BOOL                      CryptContextAddRef(                                  HCRYPTPROV hProv, DWORD* pdwReserved, DWORD dwFlags);
  BOOL                      CryptEnumProviders(                                  DWORD dwIndex, DWORD* pdwReserved, DWORD dwFlags, CryptProv* pdwProvType, LPTSTR pszProvName, DWORD* pcbProvName);
  BOOL                      CryptEnumProviderTypes(                              DWORD dwIndex, DWORD* pdwReserved, DWORD dwFlags, CryptProv* pdwProvType, LPTSTR pszTypeName, DWORD* pcbTypeName);
  BOOL                      CryptGetDefaultProvider(                             CryptProv dwProvType, DWORD* pdwReserved, DWORD dwFlags, LPTSTR pszProvName, DWORD* pcbProvName);
  BOOL                      CryptGetProvParam(                                   HCRYPTPROV hProv, CryptGetProvParam dwParam, BYTE* pbData, DWORD* pdwDataLen, DWORD dwFlags);
  BOOL                      CryptReleaseContext(                                 HCRYPTPROV hProv, DWORD dwFlags);
  BOOL                      CryptSetProvider(                                    LPCTSTR pszProvName, CryptProv dwProvType);
  BOOL                      CryptSetProviderEx(                                  LPCTSTR pszProvName, CryptProv dwProvType, DWORD* pdwReserved, DWORD dwFlags);
  BOOL                      CryptSetProvParam(                                   HCRYPTPROV hProv, CryptSetProvParam dwParam, BYTE* pbData, DWORD dwFlags);
  BOOL                      CryptDeriveKey(                                      HCRYPTPROV hProv, ALG_ID Algid, HCRYPTHASH hBaseData, DWORD dwFlags, HCRYPTKEY* phKey);
  BOOL                      CryptDestroyKey(                                     HCRYPTKEY hKey);
  BOOL                      CryptDuplicateKey(                                   HCRYPTKEY hKey, DWORD* pdwReserved, DWORD dwFlags, HCRYPTKEY* phKey);
  BOOL                      CryptExportKey(                                      HCRYPTKEY hKey, HCRYPTKEY hExpKey, CryptBlobType dwBlobType, CryptExportKeyFlags dwFlags, BYTE* pbData, DWORD* pdwDataLen);
  BOOL                      CryptGenKey(                                         HCRYPTPROV hProv, ALG_ID Algid, DWORD dwFlags, HCRYPTKEY* phKey);
  BOOL                      CryptGenRandom(                                      HCRYPTPROV hProv, DWORD dwLen, BYTE* pbBuffer);
  BOOL                      CryptGetKeyParam(                                    HCRYPTKEY hKey, CryptKeyParam dwParam, BYTE* pbData, DWORD* pdwDataLen, DWORD dwFlags);
  BOOL                      CryptGetUserKey(                                     HCRYPTPROV hProv, CryptKeySpec dwKeySpec, HCRYPTKEY* phUserKey);
  BOOL                      CryptImportKey(                                      HCRYPTPROV hProv, BYTE* pbData, DWORD dwDataLen, HCRYPTKEY hPubKey, CryptImportKeyFlags dwFlags, HCRYPTKEY* phKey);
  BOOL                      CryptSetKeyParam(                                    HCRYPTKEY hKey, CryptKeyParam dwParam, BYTE* pbData, DWORD dwFlags);
  BOOL                      CryptDecrypt(                                        HCRYPTKEY hKey, HCRYPTHASH hHash, BOOL Final, DWORD dwFlags, BYTE* pbData, DWORD* pdwDataLen);
  BOOL                      CryptEncrypt(                                        HCRYPTKEY hKey, HCRYPTHASH hHash, BOOL Final, DWORD dwFlags, BYTE* pbData, DWORD* pdwDataLen, DWORD dwBufLen);
  BOOL                      CryptCreateHash(                                     HCRYPTPROV hProv, ALG_ID Algid, HCRYPTKEY hKey, CryptCreateHashFlags dwFlags, HCRYPTHASH* phHash);
  BOOL                      CryptDestroyHash(                                    HCRYPTHASH hHash);
  BOOL                      CryptDuplicateHash(                                  HCRYPTHASH hHash, DWORD* pdwReserved, DWORD dwFlags, HCRYPTHASH* phHash);
  BOOL                      CryptGetHashParam(                                   HCRYPTHASH hHash, CryptHashParam dwParam, BYTE* pbData, DWORD* pdwDataLen, DWORD dwFlags);
  BOOL                      CryptHashData(                                       HCRYPTHASH hHash, BYTE* pbData, DWORD dwDataLen, CryptHashDataFlags dwFlags);
  BOOL                      CryptHashSessionKey(                                 HCRYPTHASH hHash, HCRYPTKEY hKey, DWORD dwFlags);
  BOOL                      CryptSetHashParam(                                   HCRYPTHASH hHash, CryptHashParam dwParam, BYTE* pbData, DWORD dwFlags);
  BOOL                      CryptSignHash(                                       HCRYPTHASH hHash, CryptKeySpec dwKeySpec, LPCTSTR sDescription, CryptSignFlags dwFlags, BYTE* pbSignature, DWORD* pdwSigLen);
  BOOL                      CryptVerifySignature(                                HCRYPTHASH hHash, BYTE* pbSignature, DWORD dwSigLen, HCRYPTKEY hPubKey, LPCTSTR sDescription, CryptSignFlags dwFlags);
  ERROR_CODE_ULONG          ControlTrace(                                        TRACEHANDLE SessionHandle, LPCTSTR SessionName, PEVENT_TRACE_PROPERTIES Properties, ULONG ControlCode);
  ERROR_CODE_ULONG          EnableTrace(                                         ULONG Enable, ULONG EnableFlag, ULONG EnableLevel, LPCGUID ControlGuid, TRACEHANDLE SessionHandle);
  ERROR_CODE_ULONG          EnableTraceEx(                                       LPCGUID ProviderId, LPCGUID SourceId, TRACEHANDLE TraceHandle, ULONG IsEnabled, UCHAR Level, ULONGLONG MatchAnyKeyword, ULONGLONG MatchAllKeyword, ULONG EnableProperty, PEVENT_FILTER_DESCRIPTOR EnableFilterDesc);
  ERROR_CODE_ULONG          EnableTraceEx2(                                      TRACEHANDLE TraceHandle, LPCGUID ProviderId, ULONG ControlCode, UCHAR Level, ULONGLONG MatchAnyKeyword, ULONGLONG MatchAllKeyword, ULONG Timeout, PENABLE_TRACE_PARAMETERS EnableParameters);
  ERROR_CODE_ULONG          EnumerateTraceGuids(                                 PTRACE_GUID_PROPERTIES* GuidPropertiesArray, ULONG PropertyArrayCount, PULONG GuidCount);
  ERROR_CODE_ULONG          EnumerateTraceGuidsEx(                               TRACE_QUERY_INFO_CLASS TraceQueryInfoClass, PVOID InBuffer, ULONG InBufferSize, PVOID OutBuffer, ULONG OutBufferSize, PULONG ReturnLength);
  ERROR_CODE_ULONG          FlushTrace(                                          TRACEHANDLE SessionHandle, LPCTSTR SessionName, PEVENT_TRACE_PROPERTIES Properties);
  ERROR_CODE_ULONG          QueryAllTraces(                                      PEVENT_TRACE_PROPERTIES* PropertyArray, ULONG PropertyArrayCount, PULONG SessionCount);
  ERROR_CODE_ULONG          QueryTrace(                                          TRACEHANDLE SessionHandle, LPCTSTR SessionName, PEVENT_TRACE_PROPERTIES Properties);
  ERROR_CODE_ULONG          StartTrace(                                          PTRACEHANDLE SessionHandle, LPCTSTR SessionName, PEVENT_TRACE_PROPERTIES Properties);
  ERROR_CODE_ULONG          StopTrace(                                           TRACEHANDLE SessionHandle, LPCTSTR SessionName, PEVENT_TRACE_PROPERTIES Properties);
  ERROR_CODE_ULONG          TraceSetInformation(                                 TRACEHANDLE SessionHandle, TRACE_INFO_CLASS InformationClass, PVOID TraceInformation, ULONG InformationLength);
  ERROR_CODE_ULONG          UpdateTrace(                                         TRACEHANDLE SessionHandle, LPCTSTR SessionName, PEVENT_TRACE_PROPERTIES Properties);
  ERROR_CODE_ULONG          CreateTraceInstanceId(                               HANDLE RegHandle, PEVENT_INSTANCE_INFO pInstInfo);
  ERROR_CODE_ULONG          GetTraceEnableFlags(                                 TRACEHANDLE SessionHandle);
  UCHAR                     GetTraceEnableLevel(                                 TRACEHANDLE SessionHandle);
  TRACEHANDLE               GetTraceLoggerHandle(                                PVOID Buffer);
  ERROR_CODE_ULONG          RegisterTraceGuids(                                  WMIDPREQUEST RequestAddress, PVOID RequestContext, LPCGUID ControlGuid, ULONG GuidCount, PTRACE_GUID_REGISTRATION TraceGuidReg, LPCTSTR MofImagePath, LPCTSTR MofResourceName, PTRACEHANDLE RegistrationHandle);
  ERROR_CODE_ULONG          TraceEvent(                                          TRACEHANDLE SessionHandle, PEVENT_TRACE_HEADER EventTrace);
  ERROR_CODE_ULONG          TraceEventInstance(                                  TRACEHANDLE SessionHandle, PEVENT_INSTANCE_HEADER EventTrace, PEVENT_INSTANCE_INFO pInstInfo, PEVENT_INSTANCE_INFO pParentInstInfo);
  ERROR_CODE_ULONG          TraceMessage(                                        TRACEHANDLE SessionHandle, TRACE_MESSAGE_FLAGS MessageFlags, LPGUID MessageGuid, USHORT MessageNumber);
  ERROR_CODE_ULONG          TraceMessageVa(                                      TRACEHANDLE SessionHandle, ULONG MessageFlags, LPGUID MessageGuid, USHORT MessageNumber, va_list MessageArgList);
  ERROR_CODE_ULONG          UnregisterTraceGuids(                                TRACEHANDLE RegistrationHandle);
  ERROR_CODE_ULONG          EventActivityIdControl(                              EventActivity ControlCode, LPGUID ActivityId);
  ERROR_CODE_ULONG          EventWriteTransfer(                                  REGHANDLE RegHandle, PCEVENT_DESCRIPTOR EventDescriptor, LPCGUID ActivityId, LPCGUID RelatedActivityId, ULONG UserDataCount, PEVENT_DATA_DESCRIPTOR UserData);
  BOOLEAN                   EventEnabled(                                        REGHANDLE RegHandle, PCEVENT_DESCRIPTOR EventDescriptor);
  BOOLEAN                   EventProviderEnabled(                                REGHANDLE RegHandle, UCHAR Level, ULONGLONG Keyword);
  ERROR_CODE_ULONG          EventRegister(                                       LPCGUID ProviderId, ENABLECALLBACK EnableCallback, PVOID CallbackContext, PREGHANDLE RegHandle);
  ERROR_CODE_ULONG          EventUnregister(                                     REGHANDLE RegHandle);
  ERROR_CODE_ULONG          EventWrite(                                          REGHANDLE RegHandle, PCEVENT_DESCRIPTOR EventDescriptor, ULONG UserDataCount, PEVENT_DATA_DESCRIPTOR UserData);
  ERROR_CODE_ULONG          EventWriteString(                                    REGHANDLE RegHandle, UCHAR Level, ULONGLONG Keyword, PCWSTR String);
  ERROR_CODE_ULONG          CloseTrace(                                          TRACEHANDLE TraceHandle);
  TRACEHANDLE               OpenTrace(                                           PEVENT_TRACE_LOGFILE Logfile);
  ERROR_CODE_ULONG          ProcessTrace(                                        PTRACEHANDLE HandleArray, ULONG HandleCount, LPFILETIME StartTime, LPFILETIME EndTime);
  ERROR_CODE_ULONG          RemoveTraceCallback(                                 LPCGUID pGuid);
  ERROR_CODE_ULONG          SetTraceCallback(                                    LPCGUID pGuid, PEVENT_CALLBACK EventCallback);
  ERROR_CODE_ULONG          EventAccessControl(                                  LPGUID Guid, ULONG Operation, PSID Sid, ULONG Rights, BOOLEAN AllowOrDeny);
  ERROR_CODE_ULONG          EventAccessQuery(                                    LPGUID Guid, PSECURITY_DESCRIPTOR Buffer, PULONG BufferSize);
  ERROR_CODE_ULONG          EventAccessRemove(                                   LPGUID Guid);
  BOOL                      AccessCheck(                                         PSECURITY_DESCRIPTOR pSecurityDescriptor, HANDLE ClientToken, DWORD DesiredAccess, PGENERIC_MAPPING GenericMapping, PPRIVILEGE_SET PrivilegeSet, LPDWORD PrivilegeSetLength, LPDWORD GrantedAccess, LPBOOL AccessStatus);
  BOOL                      AccessCheckByType(                                   PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID PrincipalSelfSid, HANDLE ClientToken, DWORD DesiredAccess, POBJECT_TYPE_LIST ObjectTypeList, DWORD ObjectTypeListLength, PGENERIC_MAPPING GenericMapping, PPRIVILEGE_SET PrivilegeSet, LPDWORD PrivilegeSetLength, LPDWORD GrantedAccess, LPBOOL AccessStatus);
  BOOL                      AccessCheckByTypeResultList(                         PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID PrincipalSelfSid, HANDLE ClientToken, DWORD DesiredAccess, POBJECT_TYPE_LIST ObjectTypeList, DWORD ObjectTypeListLength, PGENERIC_MAPPING GenericMapping, PPRIVILEGE_SET PrivilegeSet, LPDWORD PrivilegeSetLength, LPDWORD GrantedAccessList, LPDWORD AccessStatusList);
  BOOL                      AdjustTokenGroups(                                   HANDLE TokenHandle, BOOL ResetToDefault, PTOKEN_GROUPS NewState, DWORD BufferLength, PTOKEN_GROUPS PreviousState, PDWORD ReturnLength);
  BOOL                      AdjustTokenPrivileges(                               HANDLE TokenHandle, BOOL DisableAllPrivileges, PTOKEN_PRIVILEGES NewState, DWORD BufferLength, PTOKEN_PRIVILEGES PreviousState, PDWORD ReturnLength);
  BOOL                      AllocateAndInitializeSid(                            PSID_IDENTIFIER_AUTHORITY pIdentifierAuthority, BYTE nSubAuthorityCount, DWORD dwSubAuthority0, DWORD dwSubAuthority1, DWORD dwSubAuthority2, DWORD dwSubAuthority3, DWORD dwSubAuthority4, DWORD dwSubAuthority5, DWORD dwSubAuthority6, DWORD dwSubAuthority7, PSID* pSid);
  BOOL                      AllocateLocallyUniqueId(                             PLUID Luid);
  VOID                      BuildExplicitAccessWithName(                         PEXPLICIT_ACCESS pExplicitAccess, LPTSTR pTrusteeName, DWORD AccessPermissions, ACCESS_MODE AccessMode, AceFlags Inheritance);
  VOID                      BuildTrusteeWithName(                                PTRUSTEE pTrustee, LPTSTR pName);
  void                      BuildTrusteeWithObjectsAndName(                      PTRUSTEE pTrustee, POBJECTS_AND_NAME pObjName, SE_OBJECT_TYPE ObjectType, LPTSTR ObjectTypeName, LPTSTR InheritedObjectTypeName, LPTSTR Name);
  void                      BuildTrusteeWithObjectsAndSid(                       PTRUSTEE pTrustee, POBJECTS_AND_SID pObjSid, GUID* pObjectGuid, GUID* pInheritedObjectGuid, PSID pSid);
  VOID                      BuildTrusteeWithSid(                                 PTRUSTEE pTrustee, PSID pSid);
  BOOL                      CheckTokenMembership(                                HANDLE TokenHandle, PSID SidToCheck, PBOOL IsMember);
  BOOL                      ConvertSecurityDescriptorToStringSecurityDescriptor( PSECURITY_DESCRIPTOR SecurityDescriptor, SDDL_Revision RequestedStringSDRevision, SECURITY_INFORMATION SecurityInformation, LPTSTR* StringSecurityDescriptor, PULONG StringSecurityDescriptorLen);
  BOOL                      ConvertSidToStringSid(                               PSID Sid, LPTSTR* StringSid);
  BOOL                      ConvertStringSecurityDescriptorToSecurityDescriptor( LPCTSTR StringSecurityDescriptor, SDDL_Revision StringSDRevision, PSECURITY_DESCRIPTOR* SecurityDescriptor, PULONG SecurityDescriptorSize);
  BOOL                      ConvertStringSidToSid(                               LPCTSTR StringSid, PSID* Sid);
  BOOL                      CopySid(                                             DWORD nDestinationSidLength, PSID pDestinationSid, PSID pSourceSid);
  BOOL                      CreateRestrictedToken(                               HANDLE ExistingTokenHandle, CreateRestrictedTokenFlags Flags, DWORD DisableSidCount, PSID_AND_ATTRIBUTES SidsToDisable, DWORD DeletePrivilegeCount, PLUID_AND_ATTRIBUTES PrivilegesToDelete, DWORD RestrictedSidCount, PSID_AND_ATTRIBUTES SidsToRestrict, PHANDLE NewTokenHandle);
  BOOL                      CreateWellKnownSid(                                  WELL_KNOWN_SID_TYPE WellKnownSidType, PSID DomainSid, PSID pSid, DWORD* cbSid);
  BOOL                      DuplicateToken(                                      HANDLE ExistingTokenHandle, SECURITY_IMPERSONATION_LEVEL ImpersonationLevel, PHANDLE DuplicateTokenHandle);
  BOOL                      DuplicateTokenEx(                                    HANDLE hExistingToken, TOKEN_ACCESS_MASK_DWORD dwDesiredAccess, LPSECURITY_ATTRIBUTES lpTokenAttributes, SECURITY_IMPERSONATION_LEVEL ImpersonationLevel, TOKEN_TYPE TokenType, PHANDLE phNewToken);
  BOOL                      EqualDomainSid(                                      PSID pSid1, PSID pSid2, BOOL* pfEqual);
  BOOL                      EqualPrefixSid(                                      PSID pSid1, PSID pSid2);
  BOOL                      EqualSid(                                            PSID pSid1, PSID pSid2);
  PVOID                     FreeSid(                                             PSID pSid);
  ERROR_CODE                GetAuditedPermissionsFromAcl(                        PACL pacl, PTRUSTEE pTrustee, PACCESS_MASK pSuccessfulAuditedRights, PACCESS_MASK pFailedAuditRights);
  ERROR_CODE                GetEffectiveRightsFromAcl(                           PACL pacl, PTRUSTEE pTrustee, PACCESS_MASK pAccessRights);
  ERROR_CODE                GetExplicitEntriesFromAcl(                           PACL pacl, PULONG pcCountOfExplicitEntries, PEXPLICIT_ACCESS* pListOfExplicitEntries);
  DWORD                     GetLengthSid(                                        PSID pSid);
  ERROR_CODE                GetNamedSecurityInfo(                                LPTSTR pObjectName, SE_OBJECT_TYPE ObjectType, SECURITY_INFORMATION SecurityInfo, PSID* ppsidOwner, PSID* ppsidGroup, PACL* ppDacl, PACL* ppSacl, PSECURITY_DESCRIPTOR_RELATIVE* ppSecurityDescriptor);
  BOOL                      GetSecurityDescriptorControl(                        PSECURITY_DESCRIPTOR pSecurityDescriptor, PSECURITY_DESCRIPTOR_CONTROL pControl, SDDL_Revision* lpdwRevision);
  ERROR_CODE                GetSecurityInfo(                                     HANDLE handle, SE_OBJECT_TYPE ObjectType, SECURITY_INFORMATION SecurityInfo, PSID* ppsidOwner, PSID* ppsidGroup, PACL* ppDacl, PACL* ppSacl, PSECURITY_DESCRIPTOR* ppSecurityDescriptor);
  PSID_IDENTIFIER_AUTHORITY GetSidIdentifierAuthority(                           PSID pSid);
  DWORD                     GetSidLengthRequired(                                UCHAR nSubAuthorityCount);
  PDWORD                    GetSidSubAuthority(                                  PSID pSid, DWORD nSubAuthority);
  PUCHAR                    GetSidSubAuthorityCount(                             PSID pSid);
  BOOL                      GetTokenInformation(                                 HANDLE TokenHandle, TOKEN_INFORMATION_CLASS TokenInformationClass, LPVOID TokenInformation, DWORD TokenInformationLength, PDWORD ReturnLength);
  TRUSTEE_FORM              GetTrusteeForm(                                      PTRUSTEE pTrustee);
  LPTSTR                    GetTrusteeName(                                      PTRUSTEE pTrustee);
  TRUSTEE_TYPE              GetTrusteeType(                                      PTRUSTEE pTrustee);
  BOOL                      GetWindowsAccountDomainSid(                          PSID pSid, PSID ppDomainSid, DWORD* cbSid);
  BOOL                      InitializeSid(                                       PSID Sid, PSID_IDENTIFIER_AUTHORITY pIdentifierAuthority, BYTE nSubAuthorityCount);
  BOOL                      IsTokenRestricted(                                   HANDLE TokenHandle);
  BOOL                      IsValidSid(                                          PSID pSid);
  BOOL                      IsWellKnownSid(                                      PSID pSid, WELL_KNOWN_SID_TYPE WellKnownSidType);
  BOOL                      LookupAccountName(                                   LPCTSTR lpSystemName, LPCTSTR lpAccountName, PSID Sid, LPDWORD cbSid, LPTSTR ReferencedDomainName, LPDWORD cchReferencedDomainName, PSID_NAME_USE peUse);
  BOOL                      LookupAccountSid(                                    LPCTSTR lpSystemName, PSID lpSid, LPTSTR lpName, LPDWORD cchName, LPTSTR lpReferencedDomainName, LPDWORD cchReferencedDomainName, PSID_NAME_USE peUse);
  BOOL                      LookupPrivilegeDisplayName(                          LPCTSTR lpSystemName, LPCTSTR lpName, LPTSTR lpDisplayName, LPDWORD cchDisplayName, LPDWORD lpLanguageId);
  BOOL                      LookupPrivilegeName(                                 LPCTSTR lpSystemName, PLUID lpLuid, LPTSTR lpName, LPDWORD cchName);
  BOOL                      LookupPrivilegeValue(                                LPCTSTR lpSystemName, LPCTSTR lpName, PLUID lpLuid);
  BOOL                      OpenProcessToken(                                    ProcessHandle ProcessHandle, TOKEN_ACCESS_MASK_DWORD DesiredAccess, PHANDLE TokenHandle);
  BOOL                      OpenThreadToken(                                     ThreadHandle ThreadHandle, TOKEN_ACCESS_MASK_DWORD DesiredAccess, BOOL OpenAsSelf, PHANDLE TokenHandle);
  VOID                      QuerySecurityAccessMask(                             SECURITY_INFORMATION SecurityInformation, LPDWORD DesiredAccess);
  ERROR_CODE                SetEntriesInAcl(                                     ULONG cCountOfExplicitEntries, PEXPLICIT_ACCESS pListOfExplicitEntries, PACL OldAcl, PACL* NewAcl);
  ERROR_CODE                SetNamedSecurityInfo(                                LPTSTR pObjectName, SE_OBJECT_TYPE ObjectType, SECURITY_INFORMATION SecurityInfo, PSID psidOwner, PSID psidGroup, PACL pDacl, PACL pSacl);
  VOID                      SetSecurityAccessMask(                               SECURITY_INFORMATION SecurityInformation, LPDWORD DesiredAccess);
  BOOL                      SetSecurityDescriptorControl(                        PSECURITY_DESCRIPTOR pSecurityDescriptor, SECURITY_DESCRIPTOR_CONTROL ControlBitsOfInterest, SECURITY_DESCRIPTOR_CONTROL ControlBitsToSet);
  ERROR_CODE                SetSecurityInfo(                                     HANDLE handle, SE_OBJECT_TYPE ObjectType, SECURITY_INFORMATION SecurityInfo, PSID psidOwner, PSID psidGroup, PACL pDacl, PACL pSacl);
  BOOL                      SetThreadToken(                                      PHANDLE Thread, HANDLE Token);
  BOOL                      SetTokenInformation(                                 HANDLE TokenHandle, TOKEN_INFORMATION_CLASS TokenInformationClass, LPVOID TokenInformation, DWORD TokenInformationLength);
  ERROR_CODE                TreeResetNamedSecurityInfo(                          LPTSTR pObjectName, SE_OBJECT_TYPE ObjectType, SECURITY_INFORMATION SecurityInfo, PSID pOwner, PSID pGroup, PACL pDacl, PACL pSacl, BOOL KeepExplicit, FN_PROGRESS fnProgress, PROG_INVOKE_SETTING ProgressInvokeSetting, PVOID Args);
  ERROR_CODE                TreeSetNamedSecurityInfo(                            LPTSTR pObjectName, SE_OBJECT_TYPE ObjectType, SECURITY_INFORMATION SecurityInfo, PSID pOwner, PSID pGroup, PACL pDacl, PACL pSacl, TreeSecAction dwAction, FN_PROGRESS fnProgress, PROG_INVOKE_SETTING ProgressInvokeSetting, PVOID Args);
  BOOL                      AreAllAccessesGranted(                               DWORD GrantedAccess, DWORD DesiredAccess);
  BOOL                      AreAnyAccessesGranted(                               DWORD GrantedAccess, DWORD DesiredAccess);
  ERROR_CODE                BuildSecurityDescriptor(                             PTRUSTEE pOwner, PTRUSTEE pGroup, ULONG cCountOfAccessEntries, PEXPLICIT_ACCESS pListOfAccessEntries, ULONG cCountOfAuditEntries, PEXPLICIT_ACCESS pListOfAuditEntries, PSECURITY_DESCRIPTOR pOldSD, PULONG pSizeNewSD, PSECURITY_DESCRIPTOR* pNewSD);
  BOOL                      ConvertToAutoInheritPrivateObjectSecurity(           PSECURITY_DESCRIPTOR ParentDescriptor, PSECURITY_DESCRIPTOR CurrentSecurityDescriptor, PSECURITY_DESCRIPTOR* NewSecurityDescriptor, GUID* ObjectType, BOOLEAN IsDirectoryObject, PGENERIC_MAPPING GenericMapping);
  BOOL                      CreatePrivateObjectSecurity(                         PSECURITY_DESCRIPTOR ParentDescriptor, PSECURITY_DESCRIPTOR CreatorDescriptor, PSECURITY_DESCRIPTOR* NewDescriptor, BOOL IsDirectoryObject, HANDLE Token, PGENERIC_MAPPING GenericMapping);
  BOOL                      CreatePrivateObjectSecurityEx(                       PSECURITY_DESCRIPTOR ParentDescriptor, PSECURITY_DESCRIPTOR CreatorDescriptor, PSECURITY_DESCRIPTOR* NewDescriptor, GUID* ObjectType, BOOL IsContainerObject, SEF_Flags AutoInheritFlags, HANDLE Token, PGENERIC_MAPPING GenericMapping);
  BOOL                      CreatePrivateObjectSecurityWithMultipleInheritance(  PSECURITY_DESCRIPTOR ParentDescriptor, PSECURITY_DESCRIPTOR CreatorDescriptor, PSECURITY_DESCRIPTOR* NewDescriptor, GUID** ObjectTypes, ULONG GuidCount, BOOL IsContainerObject, SEF_Flags AutoInheritFlags, HANDLE Token, PGENERIC_MAPPING GenericMapping);
  BOOL                      DestroyPrivateObjectSecurity(                        PSECURITY_DESCRIPTOR* ObjectDescriptor);
  BOOL                      GetPrivateObjectSecurity(                            PSECURITY_DESCRIPTOR ObjectDescriptor, SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR ResultantDescriptor, DWORD DescriptorLength, PDWORD ReturnLength);
  BOOL                      ImpersonateAnonymousToken(                           ThreadHandle ThreadHandle);
  BOOL                      ImpersonateLoggedOnUser(                             HANDLE hToken);
  BOOL                      ImpersonateNamedPipeClient(                          HANDLE hNamedPipe);
  BOOL                      ImpersonateSelf(                                     SECURITY_IMPERSONATION_LEVEL ImpersonationLevel);
  ERROR_CODE                LookupSecurityDescriptorParts(                       PTRUSTEE* pOwner, PTRUSTEE* pGroup, PULONG cCountOfAccessEntries, PEXPLICIT_ACCESS* pListOfAccessEntries, PULONG cCountOfAuditEntries, PEXPLICIT_ACCESS* pListOfAuditEntries, PSECURITY_DESCRIPTOR pSD);
  VOID                      MapGenericMask(                                      PDWORD AccessMask, PGENERIC_MAPPING GenericMapping);
  BOOL                      ObjectCloseAuditAlarm(                               LPCTSTR SubsystemName, LPVOID HandleId, BOOL GenerateOnClose);
  BOOL                      ObjectDeleteAuditAlarm(                              LPCTSTR SubsystemName, LPVOID HandleId, BOOL GenerateOnClose);
  BOOL                      ObjectOpenAuditAlarm(                                LPCTSTR SubsystemName, LPVOID HandleId, LPTSTR ObjectTypeName, LPTSTR ObjectName, PSECURITY_DESCRIPTOR pSecurityDescriptor, HANDLE ClientToken, DWORD DesiredAccess, DWORD GrantedAccess, PPRIVILEGE_SET Privileges, BOOL ObjectCreation, BOOL AccessGranted, LPBOOL GenerateOnClose);
  BOOL                      ObjectPrivilegeAuditAlarm(                           LPCTSTR SubsystemName, LPVOID HandleId, HANDLE ClientToken, DWORD DesiredAccess, PPRIVILEGE_SET Privileges, BOOL AccessGranted);
  BOOL                      PrivilegeCheck(                                      HANDLE ClientToken, PPRIVILEGE_SET RequiredPrivileges, LPBOOL pfResult);
  BOOL                      PrivilegedServiceAuditAlarm(                         LPCTSTR SubsystemName, LPCTSTR ServiceName, HANDLE ClientToken, PPRIVILEGE_SET Privileges, BOOL AccessGranted);
  BOOL                      RevertToSelf(                                        );
  BOOL                      SetPrivateObjectSecurity(                            SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR ModificationDescriptor, PSECURITY_DESCRIPTOR* ObjectsSecurityDescriptor, PGENERIC_MAPPING GenericMapping, HANDLE Token);
  BOOL                      SetPrivateObjectSecurityEx(                          SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR ModificationDescriptor, PSECURITY_DESCRIPTOR* ObjectsSecurityDescriptor, SEF_Flags AutoInheritFlags, PGENERIC_MAPPING GenericMapping, HANDLE Token);
  ERROR_CODE                SetSecurityDescriptorRMControl(                      PSECURITY_DESCRIPTOR SecurityDescriptor, PUCHAR RMControl);
  BOOL                      AccessCheckAndAuditAlarm(                            LPCTSTR SubsystemName, LPVOID HandleId, LPTSTR ObjectTypeName, LPTSTR ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, DWORD DesiredAccess, PGENERIC_MAPPING GenericMapping, BOOL ObjectCreation, LPDWORD GrantedAccess, LPBOOL AccessStatus, LPBOOL pfGenerateOnClose);
  BOOL                      AccessCheckByTypeAndAuditAlarm(                      LPCTSTR SubsystemName, LPVOID HandleId, LPCTSTR ObjectTypeName, LPCTSTR ObjectName, PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID PrincipalSelfSid, DWORD DesiredAccess, AUDIT_EVENT_TYPE AuditType, DWORD Flags, POBJECT_TYPE_LIST ObjectTypeList, DWORD ObjectTypeListLength, PGENERIC_MAPPING GenericMapping, BOOL ObjectCreation, LPDWORD GrantedAccess, LPBOOL AccessStatus, LPBOOL pfGenerateOnClose);
  BOOL                      AccessCheckByTypeResultListAndAuditAlarm(            LPCTSTR SubsystemName, LPVOID HandleId, LPCTSTR ObjectTypeName, LPCTSTR ObjectName, PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID PrincipalSelfSid, DWORD DesiredAccess, AUDIT_EVENT_TYPE AuditType, DWORD Flags, POBJECT_TYPE_LIST ObjectTypeList, DWORD ObjectTypeListLength, PGENERIC_MAPPING GenericMapping, BOOL ObjectCreation, LPDWORD GrantedAccess, LPDWORD AccessStatusList, LPBOOL pfGenerateOnClose);
  BOOL                      AccessCheckByTypeResultListAndAuditAlarmByHandle(    LPCTSTR SubsystemName, LPVOID HandleId, HANDLE ClientToken, LPCTSTR ObjectTypeName, LPCTSTR ObjectName, PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID PrincipalSelfSid, DWORD DesiredAccess, AUDIT_EVENT_TYPE AuditType, DWORD Flags, POBJECT_TYPE_LIST ObjectTypeList, DWORD ObjectTypeListLength, PGENERIC_MAPPING GenericMapping, BOOL ObjectCreation, LPDWORD GrantedAccess, LPDWORD AccessStatusList, LPBOOL pfGenerateOnClose);
  BOOL                      AddAccessAllowedAce(                                 PACL pAcl, AclRevision dwAceRevision, DWORD AccessMask, PSID pSid);
  BOOL                      AddAccessAllowedAceEx(                               PACL pAcl, AclRevision dwAceRevision, AceFlags AceFlags, DWORD AccessMask, PSID pSid);
  BOOL                      AddAccessAllowedObjectAce(                           PACL pAcl, AclRevision dwAceRevision, DWORD AceFlags, DWORD AccessMask, GUID* ObjectTypeGuid, GUID* InheritedObjectTypeGuid, PSID pSid);
  BOOL                      AddAccessDeniedAce(                                  PACL pAcl, AclRevision dwAceRevision, DWORD AccessMask, PSID pSid);
  BOOL                      AddAccessDeniedAceEx(                                PACL pAcl, AclRevision dwAceRevision, DWORD AceFlags, DWORD AccessMask, PSID pSid);
  BOOL                      AddAccessDeniedObjectAce(                            PACL pAcl, AclRevision dwAceRevision, DWORD AceFlags, DWORD AccessMask, GUID* ObjectTypeGuid, GUID* InheritedObjectTypeGuid, PSID pSid);
  BOOL                      AddAce(                                              PACL pAcl, AclRevision dwAceRevision, DWORD dwStartingAceIndex, LPVOID pAceList, DWORD nAceListLength);
  BOOL                      AddAuditAccessAce(                                   PACL pAcl, AclRevision dwAceRevision, DWORD dwAccessMask, PSID pSid, BOOL bAuditSuccess, BOOL bAuditFailure);
  BOOL                      AddAuditAccessAceEx(                                 PACL pAcl, AclRevision dwAceRevision, DWORD AceFlags, DWORD dwAccessMask, PSID pSid, BOOL bAuditSuccess, BOOL bAuditFailure);
  BOOL                      AddAuditAccessObjectAce(                             PACL pAcl, AclRevision dwAceRevision, DWORD AceFlags, DWORD AccessMask, GUID* ObjectTypeGuid, GUID* InheritedObjectTypeGuid, PSID pSid, BOOL bAuditSuccess, BOOL bAuditFailure);
  BOOL                      AddMandatoryAce(                                     PACL pAcl, AclRevision dwAceRevision, AceFlags AceFlags, MandatoryPolicyFlags MandatoryPolicy, PSID pLabelSid);
  BOOL                      DeleteAce(                                           PACL pAcl, DWORD dwAceIndex);
  BOOL                      FindFirstFreeAce(                                    PACL pAcl, PACE* pAce);
  ERROR_CODE                FreeInheritedFromArray(                              PINHERITED_FROM pInheritArray, USHORT AceCnt, PFN_OBJECT_MGR_FUNCTS pfnArray);
  BOOL                      GetAce(                                              PACL pAcl, DWORD dwAceIndex, PACE* pAce);
  BOOL                      GetAclInformation(                                   PACL pAcl, LPVOID pAclInformation, DWORD nAclInformationLength, ACL_INFORMATION_CLASS dwAclInformationClass);
  BOOL                      GetFileSecurity(                                     LPCTSTR lpFileName, SECURITY_INFORMATION RequestedInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor, DWORD nLength, LPDWORD lpnLengthNeeded);
  ERROR_CODE                GetInheritanceSource(                                LPTSTR pObjectName, SE_OBJECT_TYPE ObjectType, SECURITY_INFORMATION SecurityInfo, BOOL Container, GUID** pObjectClassGuids, DWORD GuidCount, PACL pAcl, PFN_OBJECT_MGR_FUNCTS pfnArray, PGENERIC_MAPPING pGenericMapping, PINHERITED_FROM pInheritArray);
  BOOL                      GetKernelObjectSecurity(                             HANDLE Handle, SECURITY_INFORMATION RequestedInformation, PISECURITY_DESCRIPTOR_RELATIVE pSecurityDescriptor, DWORD nLength, LPDWORD lpnLengthNeeded);
  BOOL                      GetSecurityDescriptorDacl(                           PSECURITY_DESCRIPTOR pSecurityDescriptor, LPBOOL lpbDaclPresent, PACL* pDacl, LPBOOL lpbDaclDefaulted);
  BOOL                      GetSecurityDescriptorGroup(                          PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID* pGroup, LPBOOL lpbGroupDefaulted);
  DWORD                     GetSecurityDescriptorLength(                         PSECURITY_DESCRIPTOR pSecurityDescriptor);
  BOOL                      GetSecurityDescriptorOwner(                          PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID* pOwner, LPBOOL lpbOwnerDefaulted);
  BOOL                      GetSecurityDescriptorSacl(                           PSECURITY_DESCRIPTOR pSecurityDescriptor, LPBOOL lpbSaclPresent, PACL* pSacl, LPBOOL lpbSaclDefaulted);
  BOOL                      InitializeAcl(                                       PACL pAcl, DWORD nAclLength, AclRevision dwAclRevision);
  BOOL                      InitializeSecurityDescriptor(                        PSECURITY_DESCRIPTOR pSecurityDescriptor, SDRevision dwRevision);
  BOOL                      IsValidAcl(                                          PACL pAcl);
  BOOL                      IsValidSecurityDescriptor(                           PSECURITY_DESCRIPTOR pSecurityDescriptor);
  BOOL                      MakeAbsoluteSD(                                      PSECURITY_DESCRIPTOR_RELATIVE pSelfRelativeSD, PSECURITY_DESCRIPTOR pAbsoluteSD, LPDWORD lpdwAbsoluteSDSize, PACL pDacl, LPDWORD lpdwDaclSize, PACL pSacl, LPDWORD lpdwSaclSize, PSID pOwner, LPDWORD lpdwOwnerSize, PSID pPrimaryGroup, LPDWORD lpdwPrimaryGroupSize);
  BOOL                      MakeSelfRelativeSD(                                  PSECURITY_DESCRIPTOR pAbsoluteSD, PSECURITY_DESCRIPTOR pSelfRelativeSD, LPDWORD lpdwBufferLength);
  BOOL                      QueryServiceObjectSecurity(                          SC_HANDLE hService, SECURITY_INFORMATION dwSecurityInformation, PSECURITY_DESCRIPTOR lpSecurityDescriptor, DWORD cbBufSize, LPDWORD pcbBytesNeeded);
  REG_ERROR                 RegGetKeySecurity(                                   HKEY hKey, SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor, LPDWORD lpcbSecurityDescriptor);
  REG_ERROR                 RegSetKeySecurity(                                   HKEY hKey, SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor);
  BOOL                      SetAclInformation(                                   PACL pAcl, LPVOID pAclInformation, DWORD nAclInformationLength, ACL_INFORMATION_CLASS dwAclInformationClass);
  BOOL                      SetFileSecurity(                                     LPCTSTR lpFileName, SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor);
  BOOL                      SetKernelObjectSecurity(                             HANDLE Handle, SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR SecurityDescriptor);
  BOOL                      SetSecurityDescriptorDacl(                           PSECURITY_DESCRIPTOR pSecurityDescriptor, BOOL bDaclPresent, PACL pDacl, BOOL bDaclDefaulted);
  BOOL                      SetSecurityDescriptorGroup(                          PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID pGroup, BOOL bGroupDefaulted);
  BOOL                      SetSecurityDescriptorOwner(                          PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID pOwner, BOOL bOwnerDefaulted);
  BOOL                      SetSecurityDescriptorSacl(                           PSECURITY_DESCRIPTOR pSecurityDescriptor, BOOL bSaclPresent, PACL pSacl, BOOL bSaclDefaulted);
  BOOL                      SetServiceObjectSecurity(                            SC_HANDLE hService, SECURITY_INFORMATION dwSecurityInformation, PSECURITY_DESCRIPTOR lpSecurityDescriptor);
  BOOLEAN                   AuditComputeEffectivePolicyBySid(                    PSID pSid, GUID* pSubCategoryGuids, ULONG PolicyCount, PAUDIT_POLICY_INFORMATION* ppAuditPolicy);
  BOOLEAN                   AuditComputeEffectivePolicyByToken(                  HANDLE hTokenHandle, GUID* pSubCategoryGuids, ULONG PolicyCount, PAUDIT_POLICY_INFORMATION* ppAuditPolicy);
  BOOLEAN                   AuditEnumerateCategories(                            GUID** ppAuditCategoriesArray, PULONG pCountReturned);
  BOOLEAN                   AuditEnumeratePerUserPolicy(                         PPOLICY_AUDIT_SID_ARRAY* ppAuditSidArray);
  BOOLEAN                   AuditEnumerateSubCategories(                         GUID* pAuditCategoryGuid, BOOLEAN bRetrieveAllSubCategories, GUID** ppAuditSubCategoriesArray, PULONG pCountReturned);
  VOID                      AuditFree(                                           PVOID Buffer);
  BOOLEAN                   AuditLookupCategoryGuidFromCategoryId(               POLICY_AUDIT_EVENT_TYPE AuditCategoryId, GUID* pAuditCategoryGuid);
  BOOLEAN                   AuditLookupCategoryIdFromCategoryGuid(               GUID* pAuditCategoryGuid, PPOLICY_AUDIT_EVENT_TYPE pAuditCategoryId);
  BOOLEAN                   AuditLookupCategoryName(                             GUID* pAuditCategoryGuid, PTSTR* ppszCategoryName);
  BOOLEAN                   AuditLookupSubCategoryName(                          GUID* pAuditSubCategoryGuid, PTSTR* ppszSubCategoryName);
  BOOLEAN                   AuditQueryPerUserPolicy(                             PSID pSid, GUID* pSubCategoryGuids, ULONG PolicyCount, PAUDIT_POLICY_INFORMATION* ppAuditPolicy);
  BOOLEAN                   AuditQuerySystemPolicy(                              GUID* pSubCategoryGuids, ULONG PolicyCount, PAUDIT_POLICY_INFORMATION* ppAuditPolicy);
  BOOLEAN                   AuditSetPerUserPolicy(                               PSID pSid, PCAUDIT_POLICY_INFORMATION pAuditPolicy, ULONG PolicyCount);
  BOOLEAN                   AuditSetSystemPolicy(                                PCAUDIT_POLICY_INFORMATION pAuditPolicy, ULONG PolicyCount);
  BOOLEAN                   AuditQuerySecurity(                                  SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR* ppSecurityDescriptor);
  BOOLEAN                   AuditSetSecurity(                                    SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor);
  BOOL                      AddConditionalAce(                                   PACL pAcl, AclRevision dwAceRevision, AceFlags AceFlags, UCHAR AceType, DWORD AccessMask, PSID pSid, PWCHAR ConditionStr, DWORD* ReturnLength);
  BOOL                      LogonUser(                                           LPTSTR lpszUsername, LPTSTR lpszDomain, LPTSTR lpszPassword, LogonType dwLogonType, LogonProvider dwLogonProvider, PHANDLE phToken);
  BOOL                      LogonUserEx(                                         LPTSTR lpszUsername, LPTSTR lpszDomain, LPTSTR lpszPassword, LogonType dwLogonType, LogonProvider dwLogonProvider, PHANDLE phToken, PSID* ppLogonSid, PVOID* ppProfileBuffer, LPDWORD pdwProfileLength, PQUOTA_LIMITS pQuotaLimits);
  BOOL                      LogonUserExExW(                                      LPWSTR lpszUsername, LPWSTR lpszDomain, LPWSTR lpszPassword, LogonType dwLogonType, PTOKEN_GROUPS pTokenGroups, LogonProvider dwLogonProvider, PHANDLE phToken, PSID* ppLogonSid, PVOID* ppProfileBuffer, LPDWORD pdwProfileLength, PQUOTA_LIMITS pQuotaLimits);
  BOOL                      CredDelete(                                          LPCTSTR TargetName, DWORD Type, DWORD Flags);
  BOOL                      CredEnumerate(                                       LPCTSTR Filter, CredEnumerateFlags Flags, DWORD* Count, PCREDENTIAL** Credentials);
  BOOL                      CredFindBestCredential(                              LPCTSTR TargetName, DWORD Type, DWORD Flags, PCREDENTIAL* Credential);
  VOID                      CredFree(                                            PVOID Buffer);
  BOOL                      CredGetSessionTypes(                                 DWORD MaximumPersistCount, LPDWORD MaximumPersist);
  BOOL                      CredGetTargetInfo(                                   LPCTSTR TargetName, CredGetTargetInfoFlags Flags, PCREDENTIAL_TARGET_INFORMATION* TargetInfo);
  BOOL                      CredIsProtected(                                     LPTSTR pszProtectedCredentials, CRED_PROTECTION_TYPE* pProtectionType);
  BOOL                      CredProtect(                                         BOOL fAsSelf, LPTSTR pszCredentials, DWORD cchCredentials, LPTSTR pszProtectedCredentials, DWORD* pcchMaxChars, CRED_PROTECTION_TYPE* ProtectionType);
  BOOL                      CredMarshalCredential(                               CRED_MARSHAL_TYPE CredType, PVOID Credential, LPTSTR* MarshaledCredential);
  BOOL                      CredRead(                                            LPCTSTR TargetName, CredType Type, DWORD Flags, PCREDENTIAL* Credential);
  BOOL                      CredReadDomainCredentials(                           PCREDENTIAL_TARGET_INFORMATION TargetInfo, DWORD Flags, DWORD* Count, PCREDENTIAL** Credentials);
  BOOL                      CredRename(                                          LPCTSTR OldTargetName, LPCTSTR NewTargetName, DWORD Type, DWORD Flags);
  BOOL                      CredUnmarshalCredential(                             LPCTSTR MarshaledCredential, PCRED_MARSHAL_TYPE CredType, PVOID* Credential);
  BOOL                      CredUnprotect(                                       BOOL fAsSelf, LPTSTR pszProtectedCredentials, DWORD cchCredentials, LPTSTR pszCredentials, DWORD* pcchMaxChars);
  BOOL                      CredWrite(                                           PCREDENTIAL Credential, DWORD Flags);
  BOOL                      CredWriteDomainCredentials(                          PCREDENTIAL_TARGET_INFORMATION TargetInfo, PCREDENTIAL Credential, DWORD Flags);
  BOOL                      CredIsMarshaledCredential(                           LPTSTR MarshaledCredential);
  NTSTATUS                  LsaEnumerateAccountsWithUserRight(                   LSA_HANDLE PolicyHandle, PLSA_UNICODE_STRING UserRights, PVOID* EnumerationBuffer, PULONG CountReturned);
  NTSTATUS                  LsaEnumerateTrustedDomainsEx(                        LSA_HANDLE PolicyHandle, PLSA_ENUMERATION_HANDLE EnumerationContext, PVOID* Buffer, ULONG PreferredMaximumLength, PULONG CountReturned);
  NTSTATUS                  LsaLookupNames(                                      LSA_HANDLE PolicyHandle, ULONG Count, PLSA_UNICODE_STRING Names, PLSA_REFERENCED_DOMAIN_LIST* ReferencedDomains, PLSA_TRANSLATED_SID* Sids);
  NTSTATUS                  LsaLookupNames2(                                     LSA_HANDLE PolicyHandle, LSA_LOOKUP_FLAGS Flags, ULONG Count, PLSA_UNICODE_STRING Names, PLSA_REFERENCED_DOMAIN_LIST* ReferencedDomains, PLSA_TRANSLATED_SID2* Sids);
  NTSTATUS                  LsaLookupPrivilegeValue(                             LSA_HANDLE PolicyHandle, PUNICODE_STRING Name, PLUID Value);
  NTSTATUS                  LsaLookupSids(                                       LSA_HANDLE PolicyHandle, ULONG Count, PSID* Sids, PLSA_REFERENCED_DOMAIN_LIST* ReferencedDomains, PLSA_TRANSLATED_NAME* Names);
  NTSTATUS                  LsaAddAccountRights(                                 LSA_HANDLE PolicyHandle, PSID AccountSid, PLSA_UNICODE_STRING UserRights, ULONG CountOfRights);
  NTSTATUS                  LsaEnumerateAccountRights(                           LSA_HANDLE PolicyHandle, PSID AccountSid, PLSA_UNICODE_STRING* UserRights, PULONG CountOfRights);
  NTSTATUS                  LsaRemoveAccountRights(                              LSA_HANDLE PolicyHandle, PSID AccountSid, BOOLEAN AllRights, PLSA_UNICODE_STRING UserRights, ULONG CountOfRights);
  NTSTATUS                  LsaCreateTrustedDomainEx(                            LSA_HANDLE PolicyHandle, PTRUSTED_DOMAIN_INFORMATION_EX TrustedDomainInformation, PTRUSTED_DOMAIN_AUTH_INFORMATION AuthenticationInformation, ACCESS_MASK DesiredAccess, PLSA_HANDLE TrustedDomainHandle);
  NTSTATUS                  LsaDeleteTrustedDomain(                              LSA_HANDLE PolicyHandle, PSID TrustedDomainSid);
  NTSTATUS                  LsaEnumerateTrustedDomains(                          LSA_HANDLE PolicyHandle, PLSA_ENUMERATION_HANDLE EnumerationContext, PVOID* Buffer, ULONG PreferedMaximumLength, PULONG CountReturned);
  NTSTATUS                  LsaOpenTrustedDomainByName(                          LSA_HANDLE PolicyHandle, PLSA_UNICODE_STRING TrustedDomainName, ACCESS_MASK DesiredAccess, PLSA_HANDLE TrustedDomainHandle);
  NTSTATUS                  LsaQueryTrustedDomainInfo(                           LSA_HANDLE PolicyHandle, PSID TrustedDomainSid, TRUSTED_INFORMATION_CLASS InformationClass, PVOID* Buffer);
  NTSTATUS                  LsaQueryTrustedDomainInfoByName(                     LSA_HANDLE PolicyHandle, PLSA_UNICODE_STRING TrustedDomainName, TRUSTED_INFORMATION_CLASS InformationClass, PVOID* Buffer);
  NTSTATUS                  LsaSetTrustedDomainInfoByName(                       LSA_HANDLE PolicyHandle, PLSA_UNICODE_STRING TrustedDomainName, TRUSTED_INFORMATION_CLASS InformationClass, PVOID Buffer);
  NTSTATUS                  LsaSetTrustedDomainInformation(                      LSA_HANDLE PolicyHandle, PSID TrustedDomainSid, TRUSTED_INFORMATION_CLASS InformationClass, PVOID Buffer);
  NTSTATUS                  LsaRetrievePrivateData(                              LSA_HANDLE PolicyHandle, PLSA_UNICODE_STRING KeyName, PLSA_UNICODE_STRING* PrivateData);
  NTSTATUS                  LsaStorePrivateData(                                 LSA_HANDLE PolicyHandle, PLSA_UNICODE_STRING KeyName, PLSA_UNICODE_STRING PrivateData);
  NTSTATUS                  LsaClose(                                            LSA_HANDLE ObjectHandle);
  NTSTATUS                  LsaFreeMemory(                                       PVOID Buffer);
  ULONG                     LsaNtStatusToWinError(                               NTSTATUS Status);
  BOOL                      SaferCloseLevel(                                     SAFER_LEVEL_HANDLE hLevelHandle);
  BOOL                      SaferIdentifyLevel(                                  DWORD dwNumProperties, PSAFER_CODE_PROPERTIES pCodeProperties, SAFER_LEVEL_HANDLE* pLevelHandle, LPVOID lpReserved);
  BOOL                      SaferComputeTokenFromLevel(                          SAFER_LEVEL_HANDLE LevelHandle, HANDLE InAccessToken, PHANDLE OutAccessToken, DWORD dwFlags, LPVOID lpReserved);
  BOOL                      SaferCreateLevel(                                    SaferScopeId dwScopeId, DWORD dwLevelId, DWORD OpenFlags, SAFER_LEVEL_HANDLE* pLevelHandle, LPVOID lpReserved);
  BOOL                      SaferGetLevelInformation(                            SAFER_LEVEL_HANDLE LevelHandle, SAFER_OBJECT_INFO_CLASS dwInfoType, LPVOID lpQueryBuffer, DWORD dwInBufferSize, LPDWORD lpdwOutBufferSize);
  BOOL                      SaferGetPolicyInformation(                           SaferScopeId dwScopeId, SAFER_POLICY_INFO_CLASS SaferPolicyInfoClass, DWORD InfoBufferSize, PVOID InfoBuffer, PDWORD InfoBufferRetSize, LPVOID lpReserved);
  BOOL                      SaferiIsExecutableFileType(                          LPCWSTR szFullPath, BOOLEAN bFromShellExecute);
  BOOL                      SaferRecordEventLogEntry(                            SAFER_LEVEL_HANDLE hLevel, LPCWSTR szTargetPath, LPVOID lpReserved);
  VOID                      CloseThreadWaitChainSession(                         HWCT WctHandle);
  BOOL                      GetThreadWaitChain(                                  HWCT WctHandle, DWORD_PTR Context, DWORD Flags, DWORD ThreadId, LPDWORD NodeCount, PWAITCHAIN_NODE_INFO NodeInfoArray, LPBOOL IsCycle);
  HWCT                      OpenThreadWaitChainSession(                          DWORD Flags, PWAITCHAINCALLBACK callback);
  VOID                      RegisterWaitChainCOMCallback(                        PCOGETCALLSTATE CallStateCallback, PCOGETACTIVATIONSTATE ActivationStateCallback);
  NTSTATUS                  LsaOpenPolicy(                                       PLSA_UNICODE_STRING SystemName, PLSA_OBJECT_ATTRIBUTES ObjectAttributes, ACCESS_MASK DesiredAccess, PLSA_HANDLE PolicyHandle);
  NTSTATUS                  LsaQueryInformationPolicy(                           LSA_HANDLE PolicyHandle, POLICY_INFORMATION_CLASS InformationClass, PVOID* Buffer);
  NTSTATUS                  LsaSetInformationPolicy(                             LSA_HANDLE PolicyHandle, POLICY_INFORMATION_CLASS InformationClass, PVOID Buffer);
  NTSTATUS                  LsaQueryDomainInformationPolicy(                     LSA_HANDLE PolicyHandle, POLICY_DOMAIN_INFORMATION_CLASS InformationClass, PVOID* Buffer);
  NTSTATUS                  LsaQueryForestTrustInformation(                      LSA_HANDLE PolicyHandle, PLSA_UNICODE_STRING TrustedDomainName, PLSA_FOREST_TRUST_INFORMATION* ForestTrustInfo);
  NTSTATUS                  LsaSetDomainInformationPolicy(                       LSA_HANDLE PolicyHandle, POLICY_DOMAIN_INFORMATION_CLASS InformationClass, PVOID Buffer);
  NTSTATUS                  LsaSetForestTrustInformation(                        LSA_HANDLE PolicyHandle, PLSA_UNICODE_STRING TrustedDomainName, PLSA_FOREST_TRUST_INFORMATION ForestTrustInfo, BOOLEAN CheckOnly, PLSA_FOREST_TRUST_COLLISION_INFORMATION* CollisionInfo);
]]
ffi.load( 'Advapi32.dll' )

require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/security' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef HANDLE AUTHZ_CLIENT_CONTEXT_HANDLE; //Alias
  typedef AUTHZ_CLIENT_CONTEXT_HANDLE *PAUTHZ_CLIENT_CONTEXT_HANDLE; //Pointer
  typedef HANDLE AUTHZ_AUDIT_EVENT_HANDLE; //Alias
  typedef AUTHZ_AUDIT_EVENT_HANDLE *PAUTHZ_AUDIT_EVENT_HANDLE; //Pointer
  typedef HANDLE AUTHZ_ACCESS_CHECK_RESULTS_HANDLE; //Alias
  typedef AUTHZ_ACCESS_CHECK_RESULTS_HANDLE *PAUTHZ_ACCESS_CHECK_RESULTS_HANDLE; //Pointer
  typedef HANDLE AUTHZ_RESOURCE_MANAGER_HANDLE; //Alias
  typedef AUTHZ_RESOURCE_MANAGER_HANDLE *PAUTHZ_RESOURCE_MANAGER_HANDLE; //Pointer
  typedef LPVOID PFN_AUTHZ_DYNAMIC_ACCESS_CHECK; //Alias
  typedef LPVOID PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS; //Alias
  typedef LPVOID PFN_AUTHZ_FREE_DYNAMIC_GROUPS; //Alias
  typedef HANDLE AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE; //Alias
  typedef AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE *PAUTHZ_SECURITY_EVENT_PROVIDER_HANDLE; //Pointer
  typedef HANDLE AUTHZ_AUDIT_EVENT_TYPE_HANDLE; //Alias
  enum { _AUTHZ_SS_MAXSIZE = 128 };
  typedef UINT AUDIT_PARAM_TYPE; //Alias
  static const UINT APT_None = 1;
  static const UINT APT_String = 2;
  static const UINT APT_Ulong = 3;
  static const UINT APT_Pointer = 4;
  static const UINT APT_Sid = 5;
  static const UINT APT_LogonId = 6;
  static const UINT APT_ObjectTypeList = 7;
  static const UINT APT_Luid = 8;
  static const UINT APT_Guid = 9;
  static const UINT APT_Time = 10;
  static const UINT APT_Int64 = 11;
  static const UINT APT_IpAddress = 12;
  static const UINT APT_LogonIdWithSid = 13;
  typedef struct AUDIT_OBJECT_TYPE {
    GUID ObjectType;
    USHORT Flags;
    USHORT Level;
    ACCESS_MASK AccessMask;
  } AUDIT_OBJECT_TYPE;
  typedef struct AUDIT_OBJECT_TYPES {
    USHORT Count;
    USHORT Flags;
    AUDIT_OBJECT_TYPE* pObjectTypes;
  } AUDIT_OBJECT_TYPES;
  typedef struct AUDIT_IP_ADDRESS {
    BYTE pIpAddress[_AUTHZ_SS_MAXSIZE];
  } AUDIT_IP_ADDRESS;
  typedef union WINAPI_AUDIT_PARAM_u1 {
    ULONG_PTR Data0;
    PWSTR String;
    ULONG_PTR u;
    SID* psid;
    GUID* pguid;
    ULONG LogonId_LowPart;
    AUDIT_OBJECT_TYPES* pObjectTypes;
    AUDIT_IP_ADDRESS* pIpAddress;
  } WINAPI_AUDIT_PARAM_u1;
  typedef union WINAPI_AUDIT_PARAM_u2 {
    ULONG_PTR Data1;
    LONG LogonId_HighPart;
  } WINAPI_AUDIT_PARAM_u2;
  typedef struct AUDIT_PARAM {
    AUDIT_PARAM_TYPE Type;
    ULONG Length;
    DWORD Flags;
    WINAPI_AUDIT_PARAM_u1 ;
    WINAPI_AUDIT_PARAM_u2 ;
  } AUDIT_PARAM;
  typedef DWORD WINAPI_APF_TYPE; //Alias
  static const DWORD APF_AuditFailure = 0x00000000;
  static const DWORD APF_AuditSuccess = 0x00000001;
  typedef struct AUDIT_PARAMS {
    ULONG Length;
    WINAPI_APF_TYPE Flags;
    USHORT Count;
    AUDIT_PARAM* Parameters;
  } AUDIT_PARAMS;
  typedef AUDIT_PARAMS *PAUDIT_PARAMS; //Pointer
  typedef struct AUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE {
    ULONG64 Version;
    PWSTR pName;
  } AUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE;
  typedef AUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE *PAUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE; //Pointer
  typedef struct AUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE {
    PVOID pValue;
    ULONG ValueLength;
  } AUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE;
  typedef AUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE *PAUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE; //Pointer
  typedef union WINAPI_AUTHZ_SECURITY_ATTRIBUTE_V1_u {
    PLONG64 pInt64;
    PULONG64 pUint64;
    PWSTR* ppString;
    PAUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE pFqbn;
    PAUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE pOctetString;
  } WINAPI_AUTHZ_SECURITY_ATTRIBUTE_V1_u;
  typedef ULONG WINAPI_AUTHZ_SECURITY_ATTRIBUTE; //Alias
  typedef struct AUTHZ_SECURITY_ATTRIBUTE_V1 {
    PWSTR pName;
    USHORT ValueType;
    USHORT Reserved;
    WINAPI_AUTHZ_SECURITY_ATTRIBUTE Flags;
    ULONG ValueCount;
    WINAPI_AUTHZ_SECURITY_ATTRIBUTE_V1_u Values;
  } AUTHZ_SECURITY_ATTRIBUTE_V1;
  typedef AUTHZ_SECURITY_ATTRIBUTE_V1 *PAUTHZ_SECURITY_ATTRIBUTE_V1; //Pointer
  typedef union WINAPI_AUTHZ_SECURITY_ATTRIBUTES_INFORMATION_u {
    PAUTHZ_SECURITY_ATTRIBUTE_V1 pAttributeV1;
  } WINAPI_AUTHZ_SECURITY_ATTRIBUTES_INFORMATION_u;
  typedef struct AUTHZ_SECURITY_ATTRIBUTES_INFORMATION {
    USHORT Version;
    USHORT Reserved;
    ULONG AttributeCount;
    WINAPI_AUTHZ_SECURITY_ATTRIBUTES_INFORMATION_u Attribute;
  } AUTHZ_SECURITY_ATTRIBUTES_INFORMATION;
  typedef AUTHZ_SECURITY_ATTRIBUTES_INFORMATION *PAUTHZ_SECURITY_ATTRIBUTES_INFORMATION; //Pointer
  typedef struct AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET {
    PWSTR szObjectTypeName;
    DWORD dwOffset;
  } AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET;
  typedef DWORD WINAPI_AuthzRegistrationFlags; //Alias
  typedef struct AUTHZ_SOURCE_SCHEMA_REGISTRATION {
    WINAPI_AuthzRegistrationFlags dwFlags;
    PWSTR szEventSourceName;
    PWSTR szEventMessageFile;
    PWSTR szEventSourceXmlSchemaFile;
    PWSTR szEventAccessStringsFile;
    PWSTR szExecutableImagePath;
    GUID* pProviderGuid;
    DWORD dwObjectTypeNameCount;
    AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET ObjectTypeNames[ANYSIZE_ARRAY];
  } AUTHZ_SOURCE_SCHEMA_REGISTRATION;
  typedef AUTHZ_SOURCE_SCHEMA_REGISTRATION *PAUTHZ_SOURCE_SCHEMA_REGISTRATION; //Pointer
  typedef struct AUTHZ_ACCESS_REQUEST {
    ACCESS_MASK DesiredAccess;
    PSID PrincipalSelfSid;
    POBJECT_TYPE_LIST ObjectTypeList;
    DWORD ObjectTypeListLength;
    PVOID OptionalArguments;
  } AUTHZ_ACCESS_REQUEST;
  typedef AUTHZ_ACCESS_REQUEST *PAUTHZ_ACCESS_REQUEST; //Pointer
  typedef struct AUTHZ_ACCESS_REPLY {
    DWORD ResultListLength;
    PACCESS_MASK GrantedAccessMask;
    PDWORD SaclEvaluationResults;
    PDWORD Error;
  } AUTHZ_ACCESS_REPLY;
  typedef AUTHZ_ACCESS_REPLY *PAUTHZ_ACCESS_REPLY; //Pointer
  typedef UINT AUTHZ_CONTEXT_INFORMATION_CLASS; //Alias
  static const UINT AuthzContextInfoUserSid = 1;
  static const UINT AuthzContextInfoGroupsSids = 2;
  static const UINT AuthzContextInfoRestrictedSids = 3;
  static const UINT AuthzContextInfoPrivileges = 4;
  static const UINT AuthzContextInfoExpirationTime = 5;
  static const UINT AuthzContextInfoServerContext = 6;
  static const UINT AuthzContextInfoIdentifier = 7;
  static const UINT AuthzContextInfoSource = 8;
  static const UINT AuthzContextInfoAll = 9;
  static const UINT AuthzContextInfoAuthenticationId = 0;
  typedef DWORD WINAPI_AuthzInitRMFlags; //Alias
  typedef DWORD WINAPI_AuthzAccessCheckFlags; //Alias
  typedef DWORD WINAPI_AuthzInitContextFlags; //Alias
  typedef UINT AUTHZ_SECURITY_ATTRIBUTE_OPERATION; //Alias
  static const UINT AUTHZ_SECURITY_ATTRIBUTE_OPERATION_NONE = 0;
  static const UINT AUTHZ_SECURITY_ATTRIBUTE_OPERATION_REPLACE_ALL = 1;
  static const UINT AUTHZ_SECURITY_ATTRIBUTE_OPERATION_ADD = 2;
  static const UINT AUTHZ_SECURITY_ATTRIBUTE_OPERATION_DELETE = 3;
  static const UINT AUTHZ_SECURITY_ATTRIBUTE_OPERATION_REPLACE = 4;
  typedef AUTHZ_SECURITY_ATTRIBUTE_OPERATION *PAUTHZ_SECURITY_ATTRIBUTE_OPERATION; //Pointer
  typedef DWORD WINAPI_AUTHZ_INITOBJAUDITEVENT_FLAGS; //Alias
  BOOL AuthzAccessCheck(                       WINAPI_AuthzAccessCheckFlags flags, AUTHZ_CLIENT_CONTEXT_HANDLE AuthzClientContext, PAUTHZ_ACCESS_REQUEST pRequest, AUTHZ_AUDIT_EVENT_HANDLE AuditInfo, PSECURITY_DESCRIPTOR pSecurityDescriptor, PSECURITY_DESCRIPTOR* OptionalSecurityDescriptorArray, DWORD OptionalSecurityDescriptorCount, PAUTHZ_ACCESS_REPLY pReply, PAUTHZ_ACCESS_CHECK_RESULTS_HANDLE pAuthzHandle);
  BOOL AuthzAddSidsToContext(                  AUTHZ_CLIENT_CONTEXT_HANDLE OrigClientContext, PSID_AND_ATTRIBUTES Sids, DWORD SidCount, PSID_AND_ATTRIBUTES RestrictedSids, DWORD RestrictedSidCount, PAUTHZ_CLIENT_CONTEXT_HANDLE pNewClientContext);
  BOOL AuthzCachedAccessCheck(                 DWORD Flags, AUTHZ_ACCESS_CHECK_RESULTS_HANDLE AuthzHandle, PAUTHZ_ACCESS_REQUEST pRequest, AUTHZ_AUDIT_EVENT_HANDLE AuditInfo, PAUTHZ_ACCESS_REPLY pReply);
  BOOL AuthzEnumerateSecurityEventSources(     DWORD dwFlags, PAUTHZ_SOURCE_SCHEMA_REGISTRATION Buffer, PDWORD pdwCount, PDWORD pdwLength);
  BOOL AuthzFreeAuditEvent(                    AUTHZ_AUDIT_EVENT_HANDLE pAuditEventInfo);
  BOOL AuthzFreeContext(                       AUTHZ_CLIENT_CONTEXT_HANDLE AuthzClientContext);
  BOOL AuthzFreeHandle(                        AUTHZ_ACCESS_CHECK_RESULTS_HANDLE AuthzHandle);
  BOOL AuthzFreeResourceManager(               AUTHZ_RESOURCE_MANAGER_HANDLE AuthzResourceManager);
  BOOL AuthzGetInformationFromContext(         AUTHZ_CLIENT_CONTEXT_HANDLE hAuthzClientContext, AUTHZ_CONTEXT_INFORMATION_CLASS InfoClass, DWORD BufferSize, PDWORD pSizeRequired, PVOID Buffer);
  BOOL AuthzInitializeContextFromAuthzContext( DWORD flags, AUTHZ_CLIENT_CONTEXT_HANDLE AuthzHandle, PLARGE_INTEGER ExpirationTime, LUID Identifier, PVOID DynamicGroupArgs, PAUTHZ_CLIENT_CONTEXT_HANDLE phNewAuthzHandle);
  BOOL AuthzInitializeContextFromSid(          WINAPI_AuthzInitContextFlags Flags, PSID UserSid, AUTHZ_RESOURCE_MANAGER_HANDLE hAuthzResourceManager, PLARGE_INTEGER pExpirationTime, LUID Identifier, PVOID DynamicGroupArgs, PAUTHZ_CLIENT_CONTEXT_HANDLE pAuthzClientContext);
  BOOL AuthzInitializeContextFromToken(        DWORD Flags, HANDLE TokenHandle, AUTHZ_RESOURCE_MANAGER_HANDLE AuthzResourceManager, PLARGE_INTEGER pExpirationTime, LUID Identifier, PVOID DynamicGroupArgs, PAUTHZ_CLIENT_CONTEXT_HANDLE pAuthzClientContext);
  BOOL AuthzInitializeObjectAccessAuditEvent(  DWORD Flags, AUTHZ_AUDIT_EVENT_TYPE_HANDLE hAuditEventType, PWSTR szOperationType, PWSTR szObjectType, PWSTR szObjectName, PWSTR szAdditionalInfo, PAUTHZ_AUDIT_EVENT_HANDLE phAuditEvent, DWORD dwAdditionalParamCount);
  BOOL AuthzInitializeObjectAccessAuditEvent2( WINAPI_AUTHZ_INITOBJAUDITEVENT_FLAGS Flags, AUTHZ_AUDIT_EVENT_TYPE_HANDLE hAuditEventType, PWSTR szOperationType, PWSTR szObjectType, PWSTR szObjectName, PWSTR szAdditionalInfo, PWSTR szAdditionalInfo2, PAUTHZ_AUDIT_EVENT_HANDLE phAuditEvent, DWORD dwAdditionalParameterCount);
  BOOL AuthzInitializeResourceManager(         WINAPI_AuthzInitRMFlags flags, PFN_AUTHZ_DYNAMIC_ACCESS_CHECK pfnAccessCheck, PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS pfnComputeDynamicGroups, PFN_AUTHZ_FREE_DYNAMIC_GROUPS pfnFreeDynamicGroups, PCWSTR ResourceManagerName, PAUTHZ_RESOURCE_MANAGER_HANDLE pAuthzResourceManager);
  BOOL AuthzOpenObjectAudit(                   DWORD Flags, AUTHZ_CLIENT_CONTEXT_HANDLE hAuthzClientContext, PAUTHZ_ACCESS_REQUEST pRequest, AUTHZ_AUDIT_EVENT_HANDLE hAuditEvent, PSECURITY_DESCRIPTOR pSecurityDescriptor, PSECURITY_DESCRIPTOR* SecurityDescriptorArray, DWORD SecurityDescriptorCount, PAUTHZ_ACCESS_REPLY pReply);
  BOOL AuthzRegisterSecurityEventSource(       DWORD dwFlags, PCWSTR szEventSourceName, PAUTHZ_SECURITY_EVENT_PROVIDER_HANDLE phEventProvider);
  BOOL AuthzReportSecurityEvent(               WINAPI_APF_TYPE dwFlags, AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE hEventProvider, DWORD dwAuditId, PSID pUserSid, DWORD dwCount);
  BOOL AuthzReportSecurityEventFromParams(     DWORD dwFlags, AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE hEventProvider, DWORD dwAuditId, PSID pUserSid, PAUDIT_PARAMS pParams);
  BOOL AuthzInstallSecurityEventSource(        DWORD dwFlags, PAUTHZ_SOURCE_SCHEMA_REGISTRATION pRegistration);
  BOOL AuthzUnregisterSecurityEventSource(     DWORD dwFlags, PAUTHZ_SECURITY_EVENT_PROVIDER_HANDLE phEventProvider);
  BOOL AuthzModifySecurityAttributes(          AUTHZ_CLIENT_CONTEXT_HANDLE AuthzClientContext, PAUTHZ_SECURITY_ATTRIBUTE_OPERATION pOperations, PAUTHZ_SECURITY_ATTRIBUTES_INFORMATION pAttributes);
]]
return ffi.load( 'Authz.dll' )

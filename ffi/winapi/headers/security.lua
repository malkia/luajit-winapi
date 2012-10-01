require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/cryptography" )
local ffi = require( "ffi" )
ffi.cdef [[
  typedef LPVOID PSEC_WINNT_AUTH_IDENTITY_OPAQUE;
  typedef HANDLE SAFER_LEVEL_HANDLE;
  typedef DWORD WINAPI_AceFlags;
  typedef enum ACCESS_MODE {
    NOT_USED_ACCESS = 0,
    GRANT_ACCESS = 1,
    SET_ACCESS = 2,
    DENY_ACCESS = 3,
    REVOKE_ACCESS = 4,
    SET_AUDIT_SUCCESS = 5,
    SET_AUDIT_FAILURE = 6,
  } ACCESS_MODE;
  typedef enum MULTIPLE_TRUSTEE_OPERATION {
    NO_MULTIPLE_TRUSTEE = 0,
    TRUSTEE_IS_IMPERSONATE = 1,
  } MULTIPLE_TRUSTEE_OPERATION;
  typedef enum TRUSTEE_FORM {
    TRUSTEE_IS_SID = 0,
    TRUSTEE_IS_NAME = 1,
    TRUSTEE_BAD_FORM = 2,
    TRUSTEE_IS_OBJECTS_AND_SID = 3,
    TRUSTEE_IS_OBJECTS_AND_NAME = 4,
  } TRUSTEE_FORM;
  typedef enum TRUSTEE_TYPE {
    TRUSTEE_IS_UNKNOWN = 0,
    TRUSTEE_IS_USER = 1,
    TRUSTEE_IS_GROUP = 2,
    TRUSTEE_IS_DOMAIN = 3,
    TRUSTEE_IS_ALIAS = 4,
    TRUSTEE_IS_WELL_KNOWN_GROUP = 5,
    TRUSTEE_IS_DELETED = 6,
    TRUSTEE_IS_INVALID = 7,
    TRUSTEE_IS_COMPUTER = 8,
  } TRUSTEE_TYPE;
  typedef struct OBJECTS_AND_SID {
    DWORD ObjectsPresent,
    GUID ObjectTypeGuid,
    GUID InheritedObjectTypeGuid,
    SID* pSid,
  } OBJECTS_AND_SID;

  typedef OBJECTS_AND_SID POBJECTS_AND_SID;
  typedef enum SE_OBJECT_TYPE {
    SE_UNKNOWN_OBJECT_TYPE = 0,
    SE_FILE_OBJECT = 1,
    SE_SERVICE = 2,
    SE_PRINTER = 3,
    SE_REGISTRY_KEY = 4,
    SE_LMSHARE = 5,
    SE_KERNEL_OBJECT = 6,
    SE_WINDOW_OBJECT = 7,
    SE_DS_OBJECT = 8,
    SE_DS_OBJECT_ALL = 9,
    SE_PROVIDER_DEFINED_OBJECT = 10,
    SE_WMIGUID_OBJECT = 11,
    SE_REGISTRY_WOW64_32KEY = 12,
  } SE_OBJECT_TYPE;
  typedef struct OBJECTS_AND_NAME {
    DWORD ObjectsPresent,
    SE_OBJECT_TYPE ObjectType,
    LPTSTR ObjectTypeName,
    LPTSTR InheritedObjectTypeName,
    LPTSTR ptstrName,
  } OBJECTS_AND_NAME;

  typedef OBJECTS_AND_NAME POBJECTS_AND_NAME;
  typedef union WINAPI_TRUSTEE_u {
    LPTSTR ptstrName,
    SID* pSid,
    OBJECTS_AND_SID* pObjectsAndSid,
    OBJECTS_AND_NAME* pObjectsAndName,
  } WINAPI_TRUSTEE_u;

  typedef struct TRUSTEE {
    LPVOID pMultipleTrustee,
    MULTIPLE_TRUSTEE_OPERATION MultipleTrusteeOperation,
    TRUSTEE_FORM TrusteeForm,
    TRUSTEE_TYPE TrusteeType,
    WINAPI_TRUSTEE_u ,
  } TRUSTEE;

  typedef TRUSTEE PTRUSTEE;
  typedef struct EXPLICIT_ACCESS {
    ACCESS_MASK grfAccessPermissions,
    ACCESS_MODE grfAccessMode,
    WINAPI_AceFlags grfInheritance,
    TRUSTEE Trustee,
  } EXPLICIT_ACCESS;

  typedef EXPLICIT_ACCESS PEXPLICIT_ACCESS;
  typedef struct TOKEN_SOURCE {
    CHAR [TOKEN_SOURCE_LENGTH] SourceName,
    LUID SourceIdentifier,
  } TOKEN_SOURCE;

  typedef TOKEN_SOURCE PTOKEN_SOURCE;
  typedef DWORD WINAPI_SAFER_CRITERIA;
  typedef enum URLZONE {
    URLZONE_LOCAL_MACHINE = 0,
    URLZONE_INTRANET = 1,
    URLZONE_TRUSTED = 2,
    URLZONE_INTERNET = 3,
    URLZONE_UNTRUSTED = 4,
  } URLZONE;
  typedef struct SAFER_CODE_PROPERTIES {
    DWORD cbSize,
    WINAPI_SAFER_CRITERIA dwCheckFlags,
    LPCWSTR ImagePath,
    HANDLE hImageFileHandle,
    URLZONE UrlZoneId,
    BYTE [SAFER_MAX_HASH_SIZE] ImageHash,
    DWORD dwImageHashSize,
    LARGE_INTEGER ImageSize,
    ALG_ID HashAlgorithm,
    LPBYTE pByteBlock,
    HWND hWndParent,
    WINAPI_WTD_UI dwWVTUIChoice,
  } SAFER_CODE_PROPERTIES;

  typedef SAFER_CODE_PROPERTIES PSAFER_CODE_PROPERTIES;
  typedef struct SID_IDENTIFIER_AUTHORITY {
    BYTE [6] Value,
  } SID_IDENTIFIER_AUTHORITY;

  typedef SID_IDENTIFIER_AUTHORITY PSID_IDENTIFIER_AUTHORITY;
  typedef struct AUDIT_POLICY_INFORMATION {
    GUID AuditSubCategoryGuid,
    ULONG AuditingInformation,
    GUID AuditCategoryGuid,
  } AUDIT_POLICY_INFORMATION;

  typedef AUDIT_POLICY_INFORMATION PCAUDIT_POLICY_INFORMATION;
  typedef PCAUDIT_POLICY_INFORMATION PAUDIT_POLICY_INFORMATION*;
  typedef enum WINAPI_AceType {
    ACCESS_ALLOWED = 0x0,
    ACCESS_DENIED = 0x1,
    SYSTEM_AUDIT = 0x2,
    SYSTEM_ALARM = 0x3,
    ACCESS_ALLOWED_COMPOUND = 0x4,
    ACCESS_ALLOWED_OBJECT = 0x5,
    ACCESS_DENIED_OBJECT = 0x6,
    SYSTEM_AUDIT_OBJECT = 0x7,
    SYSTEM_ALARM_OBJECT = 0x8,
    ACCESS_ALLOWED_CALLBACK = 0x9,
    ACCESS_DENIED_CALLBACK = 0xA,
    ACCESS_ALLOWED_CALLBACK_OBJECT = 0xB,
    ACCESS_DENIED_CALLBACK_OBJECT = 0xC,
    SYSTEM_AUDIT_CALLBACK = 0xD,
    SYSTEM_ALARM_CALLBACK = 0xE,
    SYSTEM_AUDIT_CALLBACK_OBJECT = 0xF,
    SYSTEM_ALARM_CALLBACK_OBJECT = 0x10,
    SYSTEM_MANDATORY_LABEL = 0x11,
  } WINAPI_AceType;
  typedef BYTE WINAPI_AceFlags_BYTE;
  typedef struct ACE_HEADER {
    WINAPI_AceType AceType,
    WINAPI_AceFlags_BYTE AceFlags,
    WORD AceSize,
  } ACE_HEADER;

  typedef struct ACE {
    ACE_HEADER Header,
    ACCESS_MASK AccessMask,
  } ACE;

  typedef ACE PACE;
  typedef struct GENERIC_MAPPING {
    ACCESS_MASK GenericRead,
    ACCESS_MASK GenericWrite,
    ACCESS_MASK GenericExecute,
    ACCESS_MASK GenericAll,
  } GENERIC_MAPPING;

  typedef GENERIC_MAPPING PGENERIC_MAPPING;
  typedef struct LUID_AND_ATTRIBUTES {
    LUID Luid,
    DWORD Attributes,
  } LUID_AND_ATTRIBUTES;

  typedef LUID_AND_ATTRIBUTES PLUID_AND_ATTRIBUTES;
  typedef DWORD WINAPI_PRIVILEGE_SET;
  typedef struct PRIVILEGE_SET {
    DWORD PrivilegeCount,
    WINAPI_PRIVILEGE_SET Control,
    LUID_AND_ATTRIBUTES [ANYSIZE_ARRAY] Privilege,
  } PRIVILEGE_SET;

  typedef PRIVILEGE_SET PPRIVILEGE_SET;
  typedef struct TOKEN_PRIVILEGES {
    DWORD PrivilegeCount,
    LUID_AND_ATTRIBUTES [ANYSIZE_ARRAY] Privileges,
  } TOKEN_PRIVILEGES;

  typedef TOKEN_PRIVILEGES PTOKEN_PRIVILEGES;
  typedef struct ACL {
    BYTE AclRevision,
    BYTE Sbz1,
    WORD AclSize,
    WORD AceCount,
    WORD Sbz2,
  } ACL;

  typedef ACL PACL;
  typedef struct CREDENTIAL_ATTRIBUTE {
    LPTSTR Keyword,
    DWORD Flags,
    DWORD ValueSize,
    LPBYTE Value,
  } CREDENTIAL_ATTRIBUTE;

  typedef CREDENTIAL_ATTRIBUTE PCREDENTIAL_ATTRIBUTE;
  typedef struct CREDENTIAL {
    DWORD Flags,
    DWORD Type,
    LPTSTR TargetName,
    LPTSTR Comment,
    FILETIME LastWritten,
    DWORD CredentialBlobSize,
    LPBYTE CredentialBlob,
    DWORD Persist,
    DWORD AttributeCount,
    PCREDENTIAL_ATTRIBUTE Attributes,
    LPTSTR TargetAlias,
    LPTSTR UserName,
  } CREDENTIAL;

  typedef CREDENTIAL PCREDENTIAL;
  typedef struct CREDENTIAL_TARGET_INFORMATION {
    LPTSTR TargetName,
    LPTSTR NetbiosServerName,
    LPTSTR DnsServerName,
    LPTSTR NetbiosDomainName,
    LPTSTR DnsDomainName,
    LPTSTR DnsTreeName,
    LPTSTR PackageName,
    ULONG Flags,
    DWORD CredTypeCount,
    LPDWORD CredTypes,
  } CREDENTIAL_TARGET_INFORMATION;

  typedef CREDENTIAL_TARGET_INFORMATION PCREDENTIAL_TARGET_INFORMATION;
  typedef struct POLICY_AUDIT_SID_ARRAY {
    ULONG UsersCount,
    PSID* UserSidArray,
  } POLICY_AUDIT_SID_ARRAY;

  typedef POLICY_AUDIT_SID_ARRAY PPOLICY_AUDIT_SID_ARRAY;
  typedef struct QUOTA_LIMITS {
    SIZE_T PagedPoolLimit,
    SIZE_T NonPagedPoolLimit,
    SIZE_T MinimumWorkingSetSize,
    SIZE_T MaximumWorkingSetSize,
    SIZE_T PagefileLimit,
    LARGE_INTEGER TimeLimit,
  } QUOTA_LIMITS;

  typedef QUOTA_LIMITS PQUOTA_LIMITS;
  typedef struct SecHandle {
    ULONG_PTR dwLower,
    ULONG_PTR dwUpper,
  } SecHandle;

  typedef SecHandle PCtxtHandle;
  typedef WORD SECURITY_DESCRIPTOR_CONTROL;
  typedef SECURITY_DESCRIPTOR_CONTROL PSECURITY_DESCRIPTOR_CONTROL;
  typedef enum TOKEN_TYPE {
    TokenPrimary = 1,
    TokenImpersonation = 2,
  } TOKEN_TYPE;
  typedef enum TOKEN_INFORMATION_CLASS {
    TokenUser = 1,
    TokenGroups = 2,
    TokenPrivileges = 3,
    TokenOwner = 4,
    TokenPrimaryGroup = 5,
    TokenDefaultDacl = 6,
    TokenSource = 7,
    TokenType = 8,
    TokenImpersonationLevel = 9,
    TokenStatistics = 10,
    TokenRestrictedSids = 11,
    TokenSessionId = 12,
    TokenGroupsAndPrivileges = 13,
    TokenSessionReference = 14,
    TokenSandBoxInert = 15,
    TokenAuditPolicy = 16,
    TokenOrigin = 17,
    TokenElevationType = 18,
    TokenLinkedToken = 19,
    TokenElevation = 20,
    TokenHasRestrictions = 21,
    TokenAccessInformation = 22,
    TokenVirtualizationAllowed = 23,
    TokenVirtualizationEnabled = 24,
    TokenIntegrityLevel = 25,
    TokenUIAccess = 26,
    TokenMandatoryPolicy = 27,
    TokenLogonSid = 28,
    TokenIsAppContainer = 29,
    TokenCapabilities = 30,
    TokenAppContainerSid = 31,
    TokenAppContainerNumber = 32,
    TokenUserClaimAttributes = 33,
    TokenDeviceClaimAttributes = 34,
    TokenRestrictedUserClaimAttributes = 35,
    TokenRestrictedDeviceClaimAttributes = 36,
    TokenDeviceGroups = 37,
    TokenRestrictedDeviceGroups = 38,
    TokenSecurityAttributes = 39,
    TokenIsRestricted = 40,
  } TOKEN_INFORMATION_CLASS;
  typedef enum SECURITY_IMPERSONATION_LEVEL {
    SecurityAnonymous = 0,
    SecurityIdentification = 1,
    SecurityImpersonation = 2,
    SecurityDelegation = 3,
  } SECURITY_IMPERSONATION_LEVEL;
  typedef enum SECURITY_CONTEXT_TRACKING_MODE {
    SECURITY_DYNAMIC_TRACKING = 1,
    SECURITY_STATIC_TRACKING = 0,
  } SECURITY_CONTEXT_TRACKING_MODE;
  typedef struct SECURITY_QUALITY_OF_SERVICE {
    DWORD Length,
    SECURITY_IMPERSONATION_LEVEL ImpersonationLevel,
    SECURITY_CONTEXT_TRACKING_MODE ContextTrackingMode,
    BOOLEAN EffectiveOnly,
  } SECURITY_QUALITY_OF_SERVICE;

  typedef SECURITY_QUALITY_OF_SERVICE PSECURITY_QUALITY_OF_SERVICE;
  typedef enum ACL_INFORMATION_CLASS {
    AclRevisionInformation = 1,
    AclSizeInformation = 2,
  } ACL_INFORMATION_CLASS;
  typedef enum SAFER_POLICY_INFO_CLASS {
    SaferPolicyLevelList = 1,
    SaferPolicyEnableTransparentEnforcement = 2,
    SaferPolicyDefaultLevel = 3,
    SaferPolicyEvaluateUserScope = 4,
    SaferPolicyScopeFlags = 5,
    SaferPolicyDefaultLevelFlags = 6,
    SaferPolicyAuthenticodeEnabled = 7,
  } SAFER_POLICY_INFO_CLASS;
  typedef enum WELL_KNOWN_SID_TYPE {
    WinNullSid = 0,
    WinWorldSid = 1,
    WinLocalSid = 2,
    WinCreatorOwnerSid = 3,
    WinCreatorGroupSid = 4,
    WinCreatorOwnerServerSid = 5,
    WinCreatorGroupServerSid = 6,
    WinNtAuthoritySid = 7,
    WinDialupSid = 8,
    WinNetworkSid = 9,
    WinBatchSid = 10,
    WinInteractiveSid = 11,
    WinServiceSid = 12,
    WinAnonymousSid = 13,
    WinProxySid = 14,
    WinEnterpriseControllersSid = 15,
    WinSelfSid = 16,
    WinAuthenticatedUserSid = 17,
    WinRestrictedCodeSid = 18,
    WinTerminalServerSid = 19,
    WinRemoteLogonIdSid = 20,
    WinLogonIdsSid = 21,
    WinLocalSystemSid = 22,
    WinLocalServiceSid = 23,
    WinNetworkServiceSid = 24,
    WinBuiltinDomainSid = 25,
    WinBuiltinAdministratorsSid = 26,
    WinBuiltinUsersSid = 27,
    WinBuiltinGuestsSid = 28,
    WinBuiltinPowerUsersSid = 29,
    WinBuiltinAccountOperatorsSid = 30,
    WinBuiltinSystemOperatorsSid = 31,
    WinBuiltinPrintOperatorsSid = 32,
    WinBuiltinBackupOperatorsSid = 33,
    WinBuiltinReplicatorSid = 34,
    WinBuiltinPreWindows2000CompatibleAccessSid = 35,
    WinBuiltinRemoteDesktopUsersSid = 36,
    WinBuiltinNetworkConfigurationOperatorsSid = 37,
    WinAccountAdministratorSid = 38,
    WinAccountGuestSid = 39,
    WinAccountKrbtgtSid = 40,
    WinAccountDomainAdminsSid = 41,
    WinAccountDomainUsersSid = 42,
    WinAccountDomainGuestsSid = 43,
    WinAccountComputersSid = 44,
    WinAccountControllersSid = 45,
    WinAccountCertAdminsSid = 46,
    WinAccountSchemaAdminsSid = 47,
    WinAccountEnterpriseAdminsSid = 48,
    WinAccountPolicyAdminsSid = 49,
    WinAccountRasAndIasServersSid = 50,
    WinNTLMAuthenticationSid = 51,
    WinDigestAuthenticationSid = 52,
    WinSChannelAuthenticationSid = 53,
    WinThisOrganizationSid = 54,
    WinOtherOrganizationSid = 55,
    WinBuiltinIncomingForestTrustBuildersSid = 56,
    WinBuiltinPerfMonitoringUsersSid = 57,
    WinBuiltinPerfLoggingUsersSid = 58,
    WinBuiltinAuthorizationAccessSid = 59,
    WinBuiltinTerminalServerLicenseServersSid = 60,
    WinBuiltinDCOMUsersSid = 61,
    WinBuiltinIUsersSid = 62,
    WinIUserSid = 63,
    WinBuiltinCryptoOperatorsSid = 64,
    WinUntrustedLabelSid = 65,
    WinLowLabelSid = 66,
    WinMediumLabelSid = 67,
    WinHighLabelSid = 68,
    WinSystemLabelSid = 69,
    WinWriteRestrictedCodeSid = 70,
    WinCreatorOwnerRightsSid = 71,
    WinCacheablePrincipalsGroupSid = 72,
    WinNonCacheablePrincipalsGroupSid = 73,
    WinEnterpriseReadonlyControllersSid = 74,
    WinAccountReadonlyControllersSid = 75,
    WinBuiltinEventLogReadersGroup = 76,
    WinNewEnterpriseReadonlyControllersSid = 77,
    WinBuiltinCertSvcDComAccessGroup = 78,
    WinMediumPlusLabelSid = 79,
    WinLocalLogonSid = 80,
    WinConsoleLogonSid = 81,
    WinThisOrganizationCertificateSid = 82,
    WinApplicationPackageAuthoritySid = 83,
    WinBuiltinAnyPackageSid = 84,
    WinCapabilityInternetClientSid = 85,
    WinCapabilityInternetClientServerSid = 86,
    WinCapabilityPrivateNetworkClientServerSid = 87,
    WinCapabilityPicturesLibrarySid = 88,
    WinCapabilityVideosLibrarySid = 89,
    WinCapabilityMusicLibrarySid = 90,
    WinCapabilityDocumentsLibrarySid = 91,
    WinCapabilitySharedUserCertificatesSid = 92,
    WinCapabilityDefaultWindowsCredentialsSid = 93,
    WinCapabilityRemovableStorageSid = 94,
    WinBuiltinRDSRemoteAccessServersSid = 95,
    WinBuiltinRDSEndpointServersSid = 96,
    WinBuiltinRDSManagementServersSid = 97,
    WinUserModeDriversSid = 98,
    WinBuiltinHyperVAdminsSid = 99,
  } WELL_KNOWN_SID_TYPE;
  typedef enum SID_NAME_USE {
    SidTypeUser = 1,
    SidTypeGroup = 2,
    SidTypeDomain = 3,
    SidTypeAlias = 4,
    SidTypeWellKnownGroup = 5,
    SidTypeDeletedAccount = 6,
    SidTypeInvalid = 7,
    SidTypeUnknown = 8,
    SidTypeComputer = 9,
    SidTypeLabel = 10,
  } SID_NAME_USE;
  typedef SID_NAME_USE PSID_NAME_USE;
  typedef enum SAFER_OBJECT_INFO_CLASS {
    SaferObjectLevelId = 1,
    SaferObjectScopeId = 2,
    SaferObjectFriendlyName = 3,
    SaferObjectDescription = 4,
    SaferObjectBuiltin = 5,
    SaferObjectDisallowed = 6,
    SaferObjectDisableMaxPrivilege = 7,
    SaferObjectInvertDeletedPrivileges = 8,
    SaferObjectDeletedPrivileges = 9,
    SaferObjectDefaultOwner = 10,
    SaferObjectSidsToDisable = 11,
    SaferObjectRestrictedSidsInverted = 12,
    SaferObjectRestrictedSidsAdded = 13,
    SaferObjectAllIdentificationGuids = 14,
    SaferObjectSingleIdentification = 15,
    SaferObjectExtendedError = 16,
  } SAFER_OBJECT_INFO_CLASS;
  typedef enum CRED_PROTECTION_TYPE {
    CredUnprotected = 0,
    CredUserProtection = 1,
    CredTrustedProtection = 2,
  } CRED_PROTECTION_TYPE;
  typedef enum CRED_MARSHAL_TYPE {
    CertCredential = 1,
    UsernameTargetCredential = 2,
    BinaryBlobCredential = 3,
  } CRED_MARSHAL_TYPE;
  typedef CRED_MARSHAL_TYPE PCRED_MARSHAL_TYPE;
  typedef enum AUDIT_EVENT_TYPE {
    AuditEventObjectAccess = 0,
    AuditEventDirectoryServiceAccess = 1,
  } AUDIT_EVENT_TYPE;
  typedef enum POLICY_AUDIT_EVENT_TYPE {
    AuditCategorySystem = 0,
    AuditCategoryLogon = 1,
    AuditCategoryObjectAccess = 2,
    AuditCategoryPrivilegeUse = 3,
    AuditCategoryDetailedTracking = 4,
    AuditCategoryPolicyChange = 5,
    AuditCategoryAccountManagement = 6,
    AuditCategoryDirectoryServiceAccess = 7,
    AuditCategoryAccountLogon = 8,
  } POLICY_AUDIT_EVENT_TYPE;
  typedef POLICY_AUDIT_EVENT_TYPE PPOLICY_AUDIT_EVENT_TYPE;
  typedef enum SECURITY_STATUS {
    SEC_E_OK = 0x00000000,
    SEC_E_INSUFFICIENT_MEMORY = 0x80090300,
    SEC_E_INVALID_HANDLE = 0x80090301,
    SEC_E_UNSUPPORTED_FUNCTION = 0x80090302,
    SEC_E_TARGET_UNKNOWN = 0x80090303,
    SEC_E_INTERNAL_ERROR = 0x80090304,
    SEC_E_SECPKG_NOT_FOUND = 0x80090305,
    SEC_E_NOT_OWNER = 0x80090306,
    SEC_E_CANNOT_INSTALL = 0x80090307,
    SEC_E_INVALID_TOKEN = 0x80090308,
    SEC_E_CANNOT_PACK = 0x80090309,
    SEC_E_QOP_NOT_SUPPORTED = 0x8009030A,
    SEC_E_NO_IMPERSONATION = 0x8009030B,
    SEC_E_LOGON_DENIED = 0x8009030C,
    SEC_E_UNKNOWN_CREDENTIALS = 0x8009030D,
    SEC_E_NO_CREDENTIALS = 0x8009030E,
    SEC_E_MESSAGE_ALTERED = 0x8009030F,
    SEC_E_OUT_OF_SEQUENCE = 0x80090310,
    SEC_E_NO_AUTHENTICATING_AUTHORITY = 0x80090311,
    SEC_E_CONTEXT_EXPIRED = 0x80090317,
    SEC_E_INCOMPLETE_MESSAGE = 0x80090318,
    SEC_I_CONTINUE_NEEDED = 0x00090312,
    SEC_I_COMPLETE_NEEDED = 0x00090313,
    SEC_I_COMPLETE_AND_CONTINUE = 0x00090314,
    SEC_I_LOCAL_LOGON = 0x00090315,
    SEC_I_CONTEXT_EXPIRED = 0x00090317,
    SEC_I_INCOMPLETE_CREDENTIALS = 0x00090320,
    SEC_I_RENEGOTIATE = 0x00090321,
    SEC_I_NO_LSA_CONTEXT = 0x00090323,
    SEC_I_SIGNATURE_NEEDED = 0x0009035C,
    SEC_I_NO_RENEGOTIATION = 0x00090360,
  } SECURITY_STATUS;
  typedef struct OBJECT_TYPE_LIST {
    WORD Level,
    WORD Sbz,
    GUID* ObjectType,
  } OBJECT_TYPE_LIST;

  typedef OBJECT_TYPE_LIST POBJECT_TYPE_LIST;
  typedef struct SID_AND_ATTRIBUTES {
    PSID Sid,
    DWORD Attributes,
  } SID_AND_ATTRIBUTES;

  typedef SID_AND_ATTRIBUTES PSID_AND_ATTRIBUTES;
  typedef struct TOKEN_GROUPS {
    DWORD GroupCount,
    SID_AND_ATTRIBUTES [ANYSIZE_ARRAY] Groups,
  } TOKEN_GROUPS;

  typedef TOKEN_GROUPS PTOKEN_GROUPS;
  typedef struct SECURITY_DESCRIPTOR {
    BYTE Revision,
    BYTE Sbz1,
    SECURITY_DESCRIPTOR_CONTROL Control,
    PSID Owner,
    PSID Group,
    PACL Sacl,
    PACL Dacl,
  } SECURITY_DESCRIPTOR;

  typedef SECURITY_DESCRIPTOR PSECURITY_DESCRIPTOR;
  typedef struct SECURITY_ATTRIBUTES {
    DWORD nLength,
    PSECURITY_DESCRIPTOR lpSecurityDescriptor,
    BOOL bInheritHandle,
  } SECURITY_ATTRIBUTES;

  typedef SECURITY_ATTRIBUTES LPSECURITY_ATTRIBUTES;
  typedef SECURITY_ATTRIBUTES PSECURITY_ATTRIBUTES;
  typedef SECURITY_ATTRIBUTES LPSECURITY_ATTRIBUTES;
  typedef struct SECURITY_DESCRIPTOR_RELATIVE {
    BYTE Revision,
    BYTE Sbz1,
    SECURITY_DESCRIPTOR_CONTROL Control,
    DWORD Owner,
    DWORD Group,
    DWORD Sacl,
    DWORD Dacl,
  } SECURITY_DESCRIPTOR_RELATIVE;

  typedef SECURITY_DESCRIPTOR_RELATIVE PSECURITY_DESCRIPTOR_RELATIVE;
  typedef SECURITY_DESCRIPTOR_RELATIVE PISECURITY_DESCRIPTOR_RELATIVE;
]]

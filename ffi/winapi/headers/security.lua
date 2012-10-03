require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/cryptography' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PSEC_WINNT_AUTH_IDENTITY_OPAQUE; //Alias
  typedef HANDLE SAFER_LEVEL_HANDLE; //Alias
  enum { SAFER_MAX_HASH_SIZE = 64 };
  enum { TOKEN_SOURCE_LENGTH = 8 };
  typedef DWORD WINAPI_AceFlags; //Alias
  typedef UINT ACCESS_MODE; //Alias
  static const UINT NOT_USED_ACCESS = 0;
  static const UINT GRANT_ACCESS = 1;
  static const UINT SET_ACCESS = 2;
  static const UINT DENY_ACCESS = 3;
  static const UINT REVOKE_ACCESS = 4;
  static const UINT SET_AUDIT_SUCCESS = 5;
  static const UINT SET_AUDIT_FAILURE = 6;
  typedef UINT MULTIPLE_TRUSTEE_OPERATION; //Alias
  static const UINT NO_MULTIPLE_TRUSTEE = 0;
  static const UINT TRUSTEE_IS_IMPERSONATE = 1;
  typedef UINT TRUSTEE_FORM; //Alias
  static const UINT TRUSTEE_IS_SID = 0;
  static const UINT TRUSTEE_IS_NAME = 1;
  static const UINT TRUSTEE_BAD_FORM = 2;
  static const UINT TRUSTEE_IS_OBJECTS_AND_SID = 3;
  static const UINT TRUSTEE_IS_OBJECTS_AND_NAME = 4;
  typedef UINT TRUSTEE_TYPE; //Alias
  static const UINT TRUSTEE_IS_UNKNOWN = 0;
  static const UINT TRUSTEE_IS_USER = 1;
  static const UINT TRUSTEE_IS_GROUP = 2;
  static const UINT TRUSTEE_IS_DOMAIN = 3;
  static const UINT TRUSTEE_IS_ALIAS = 4;
  static const UINT TRUSTEE_IS_WELL_KNOWN_GROUP = 5;
  static const UINT TRUSTEE_IS_DELETED = 6;
  static const UINT TRUSTEE_IS_INVALID = 7;
  static const UINT TRUSTEE_IS_COMPUTER = 8;
  typedef struct OBJECTS_AND_SID {
    DWORD ObjectsPresent;
    GUID ObjectTypeGuid;
    GUID InheritedObjectTypeGuid;
    SID* pSid;
  } OBJECTS_AND_SID;
  typedef OBJECTS_AND_SID *POBJECTS_AND_SID; //Pointer
  typedef UINT SE_OBJECT_TYPE; //Alias
  static const UINT SE_UNKNOWN_OBJECT_TYPE = 0;
  static const UINT SE_FILE_OBJECT = 1;
  static const UINT SE_SERVICE = 2;
  static const UINT SE_PRINTER = 3;
  static const UINT SE_REGISTRY_KEY = 4;
  static const UINT SE_LMSHARE = 5;
  static const UINT SE_KERNEL_OBJECT = 6;
  static const UINT SE_WINDOW_OBJECT = 7;
  static const UINT SE_DS_OBJECT = 8;
  static const UINT SE_DS_OBJECT_ALL = 9;
  static const UINT SE_PROVIDER_DEFINED_OBJECT = 10;
  static const UINT SE_WMIGUID_OBJECT = 11;
  static const UINT SE_REGISTRY_WOW64_32KEY = 12;
  typedef struct OBJECTS_AND_NAME {
    DWORD ObjectsPresent;
    SE_OBJECT_TYPE ObjectType;
    LPTSTR ObjectTypeName;
    LPTSTR InheritedObjectTypeName;
    LPTSTR ptstrName;
  } OBJECTS_AND_NAME;
  typedef OBJECTS_AND_NAME *POBJECTS_AND_NAME; //Pointer
  typedef union WINAPI_TRUSTEE_u {
    LPTSTR ptstrName;
    SID* pSid;
    OBJECTS_AND_SID* pObjectsAndSid;
    OBJECTS_AND_NAME* pObjectsAndName;
  } WINAPI_TRUSTEE_u;
  typedef struct TRUSTEE {
    LPVOID pMultipleTrustee;
    MULTIPLE_TRUSTEE_OPERATION MultipleTrusteeOperation;
    TRUSTEE_FORM TrusteeForm;
    TRUSTEE_TYPE TrusteeType;
    WINAPI_TRUSTEE_u ;
  } TRUSTEE;
  typedef TRUSTEE *PTRUSTEE; //Pointer
  typedef struct EXPLICIT_ACCESS {
    ACCESS_MASK grfAccessPermissions;
    ACCESS_MODE grfAccessMode;
    WINAPI_AceFlags grfInheritance;
    TRUSTEE Trustee;
  } EXPLICIT_ACCESS;
  typedef EXPLICIT_ACCESS *PEXPLICIT_ACCESS; //Pointer
  typedef struct TOKEN_SOURCE {
    CHAR SourceName[TOKEN_SOURCE_LENGTH];
    LUID SourceIdentifier;
  } TOKEN_SOURCE;
  typedef TOKEN_SOURCE *PTOKEN_SOURCE; //Pointer
  typedef DWORD WINAPI_SAFER_CRITERIA; //Alias
  typedef DWORD URLZONE; //Alias
  static const DWORD URLZONE_LOCAL_MACHINE = 0;
  static const DWORD URLZONE_INTRANET = 1;
  static const DWORD URLZONE_TRUSTED = 2;
  static const DWORD URLZONE_INTERNET = 3;
  static const DWORD URLZONE_UNTRUSTED = 4;
# pragma pack( push, 8 )
  typedef struct SAFER_CODE_PROPERTIES {
    DWORD cbSize;
    WINAPI_SAFER_CRITERIA dwCheckFlags;
    LPCWSTR ImagePath;
    HANDLE hImageFileHandle;
    URLZONE UrlZoneId;
    BYTE ImageHash[SAFER_MAX_HASH_SIZE];
    DWORD dwImageHashSize;
    LARGE_INTEGER ImageSize;
    ALG_ID HashAlgorithm;
    LPBYTE pByteBlock;
    HWND hWndParent;
    WINAPI_WTD_UI dwWVTUIChoice;
  } SAFER_CODE_PROPERTIES;
# pragma pack( pop )
  typedef SAFER_CODE_PROPERTIES *PSAFER_CODE_PROPERTIES; //Pointer
  typedef struct SID_IDENTIFIER_AUTHORITY {
    BYTE Value[6];
  } SID_IDENTIFIER_AUTHORITY;
  typedef SID_IDENTIFIER_AUTHORITY *PSID_IDENTIFIER_AUTHORITY; //Pointer
  typedef struct AUDIT_POLICY_INFORMATION {
    GUID AuditSubCategoryGuid;
    ULONG AuditingInformation;
    GUID AuditCategoryGuid;
  } AUDIT_POLICY_INFORMATION;
  typedef AUDIT_POLICY_INFORMATION *PCAUDIT_POLICY_INFORMATION; //Pointer
  typedef BYTE WINAPI_AceType; //Alias
  static const BYTE ACCESS_ALLOWED = 0x0;
  static const BYTE ACCESS_DENIED = 0x1;
  static const BYTE SYSTEM_AUDIT = 0x2;
  static const BYTE SYSTEM_ALARM = 0x3;
  static const BYTE ACCESS_ALLOWED_COMPOUND = 0x4;
  static const BYTE ACCESS_ALLOWED_OBJECT = 0x5;
  static const BYTE ACCESS_DENIED_OBJECT = 0x6;
  static const BYTE SYSTEM_AUDIT_OBJECT = 0x7;
  static const BYTE SYSTEM_ALARM_OBJECT = 0x8;
  static const BYTE ACCESS_ALLOWED_CALLBACK = 0x9;
  static const BYTE ACCESS_DENIED_CALLBACK = 0xA;
  static const BYTE ACCESS_ALLOWED_CALLBACK_OBJECT = 0xB;
  static const BYTE ACCESS_DENIED_CALLBACK_OBJECT = 0xC;
  static const BYTE SYSTEM_AUDIT_CALLBACK = 0xD;
  static const BYTE SYSTEM_ALARM_CALLBACK = 0xE;
  static const BYTE SYSTEM_AUDIT_CALLBACK_OBJECT = 0xF;
  static const BYTE SYSTEM_ALARM_CALLBACK_OBJECT = 0x10;
  static const BYTE SYSTEM_MANDATORY_LABEL = 0x11;
  typedef BYTE WINAPI_AceFlags_BYTE; //Alias
  typedef struct ACE_HEADER {
    WINAPI_AceType AceType;
    WINAPI_AceFlags_BYTE AceFlags;
    WORD AceSize;
  } ACE_HEADER;
  typedef struct ACE {
    ACE_HEADER Header;
    ACCESS_MASK AccessMask;
  } ACE;
  typedef ACE *PACE; //Pointer
  typedef struct GENERIC_MAPPING {
    ACCESS_MASK GenericRead;
    ACCESS_MASK GenericWrite;
    ACCESS_MASK GenericExecute;
    ACCESS_MASK GenericAll;
  } GENERIC_MAPPING;
  typedef GENERIC_MAPPING *PGENERIC_MAPPING; //Pointer
# pragma pack( push, 4 )
  typedef struct LUID_AND_ATTRIBUTES {
    LUID Luid;
    DWORD Attributes;
  } LUID_AND_ATTRIBUTES;
# pragma pack( pop )
  typedef LUID_AND_ATTRIBUTES *PLUID_AND_ATTRIBUTES; //Pointer
  enum { ANYSIZE_ARRAY = 1 };
  typedef DWORD WINAPI_PRIVILEGE_SET; //Alias
  typedef struct PRIVILEGE_SET {
    DWORD PrivilegeCount;
    WINAPI_PRIVILEGE_SET Control;
    LUID_AND_ATTRIBUTES Privilege[ANYSIZE_ARRAY];
  } PRIVILEGE_SET;
  typedef PRIVILEGE_SET *PPRIVILEGE_SET; //Pointer
  typedef struct TOKEN_PRIVILEGES {
    DWORD PrivilegeCount;
    LUID_AND_ATTRIBUTES Privileges[ANYSIZE_ARRAY];
  } TOKEN_PRIVILEGES;
  typedef TOKEN_PRIVILEGES *PTOKEN_PRIVILEGES; //Pointer
  typedef struct ACL {
    BYTE AclRevision;
    BYTE Sbz1;
    WORD AclSize;
    WORD AceCount;
    WORD Sbz2;
  } ACL;
  typedef ACL *PACL; //Pointer
  typedef struct CREDENTIAL_ATTRIBUTE {
    LPTSTR Keyword;
    DWORD Flags;
    DWORD ValueSize;
    LPBYTE Value;
  } CREDENTIAL_ATTRIBUTE;
  typedef CREDENTIAL_ATTRIBUTE *PCREDENTIAL_ATTRIBUTE; //Pointer
  typedef struct CREDENTIAL {
    DWORD Flags;
    DWORD Type;
    LPTSTR TargetName;
    LPTSTR Comment;
    FILETIME LastWritten;
    DWORD CredentialBlobSize;
    LPBYTE CredentialBlob;
    DWORD Persist;
    DWORD AttributeCount;
    PCREDENTIAL_ATTRIBUTE Attributes;
    LPTSTR TargetAlias;
    LPTSTR UserName;
  } CREDENTIAL;
  typedef CREDENTIAL *PCREDENTIAL; //Pointer
  typedef struct CREDENTIAL_TARGET_INFORMATION {
    LPTSTR TargetName;
    LPTSTR NetbiosServerName;
    LPTSTR DnsServerName;
    LPTSTR NetbiosDomainName;
    LPTSTR DnsDomainName;
    LPTSTR DnsTreeName;
    LPTSTR PackageName;
    ULONG Flags;
    DWORD CredTypeCount;
    LPDWORD CredTypes;
  } CREDENTIAL_TARGET_INFORMATION;
  typedef CREDENTIAL_TARGET_INFORMATION *PCREDENTIAL_TARGET_INFORMATION; //Pointer
  typedef struct POLICY_AUDIT_SID_ARRAY {
    ULONG UsersCount;
    PSID* UserSidArray;
  } POLICY_AUDIT_SID_ARRAY;
  typedef POLICY_AUDIT_SID_ARRAY *PPOLICY_AUDIT_SID_ARRAY; //Pointer
  typedef struct QUOTA_LIMITS {
    SIZE_T PagedPoolLimit;
    SIZE_T NonPagedPoolLimit;
    SIZE_T MinimumWorkingSetSize;
    SIZE_T MaximumWorkingSetSize;
    SIZE_T PagefileLimit;
    LARGE_INTEGER TimeLimit;
  } QUOTA_LIMITS;
  typedef QUOTA_LIMITS *PQUOTA_LIMITS; //Pointer
  typedef struct SecHandle {
    ULONG_PTR dwLower;
    ULONG_PTR dwUpper;
  } SecHandle;
  typedef SecHandle *PCtxtHandle; //Pointer
  typedef WORD SECURITY_DESCRIPTOR_CONTROL; //Alias
  typedef SECURITY_DESCRIPTOR_CONTROL *PSECURITY_DESCRIPTOR_CONTROL; //Pointer
  typedef UINT TOKEN_TYPE; //Alias
  static const UINT TokenPrimary = 1;
  static const UINT TokenImpersonation = 2;
  typedef UINT TOKEN_INFORMATION_CLASS; //Alias
  static const UINT TokenUser = 1;
  static const UINT TokenGroups = 2;
  static const UINT TokenPrivileges = 3;
  static const UINT TokenOwner = 4;
  static const UINT TokenPrimaryGroup = 5;
  static const UINT TokenDefaultDacl = 6;
  static const UINT TokenSource = 7;
  static const UINT TokenType = 8;
  static const UINT TokenImpersonationLevel = 9;
  static const UINT TokenStatistics = 10;
  static const UINT TokenRestrictedSids = 11;
  static const UINT TokenSessionId = 12;
  static const UINT TokenGroupsAndPrivileges = 13;
  static const UINT TokenSessionReference = 14;
  static const UINT TokenSandBoxInert = 15;
  static const UINT TokenAuditPolicy = 16;
  static const UINT TokenOrigin = 17;
  static const UINT TokenElevationType = 18;
  static const UINT TokenLinkedToken = 19;
  static const UINT TokenElevation = 20;
  static const UINT TokenHasRestrictions = 21;
  static const UINT TokenAccessInformation = 22;
  static const UINT TokenVirtualizationAllowed = 23;
  static const UINT TokenVirtualizationEnabled = 24;
  static const UINT TokenIntegrityLevel = 25;
  static const UINT TokenUIAccess = 26;
  static const UINT TokenMandatoryPolicy = 27;
  static const UINT TokenLogonSid = 28;
  static const UINT TokenIsAppContainer = 29;
  static const UINT TokenCapabilities = 30;
  static const UINT TokenAppContainerSid = 31;
  static const UINT TokenAppContainerNumber = 32;
  static const UINT TokenUserClaimAttributes = 33;
  static const UINT TokenDeviceClaimAttributes = 34;
  static const UINT TokenRestrictedUserClaimAttributes = 35;
  static const UINT TokenRestrictedDeviceClaimAttributes = 36;
  static const UINT TokenDeviceGroups = 37;
  static const UINT TokenRestrictedDeviceGroups = 38;
  static const UINT TokenSecurityAttributes = 39;
  static const UINT TokenIsRestricted = 40;
  typedef UINT SECURITY_IMPERSONATION_LEVEL; //Alias
  static const UINT SecurityAnonymous = 0;
  static const UINT SecurityIdentification = 1;
  static const UINT SecurityImpersonation = 2;
  static const UINT SecurityDelegation = 3;
  typedef int8_t SECURITY_CONTEXT_TRACKING_MODE; //Integer
  static const int8_t SECURITY_DYNAMIC_TRACKING = 1;
  static const int8_t SECURITY_STATIC_TRACKING = 0;
  typedef struct SECURITY_QUALITY_OF_SERVICE {
    DWORD Length;
    SECURITY_IMPERSONATION_LEVEL ImpersonationLevel;
    SECURITY_CONTEXT_TRACKING_MODE ContextTrackingMode;
    BOOLEAN EffectiveOnly;
  } SECURITY_QUALITY_OF_SERVICE;
  typedef SECURITY_QUALITY_OF_SERVICE *PSECURITY_QUALITY_OF_SERVICE; //Pointer
  typedef UINT ACL_INFORMATION_CLASS; //Alias
  static const UINT AclRevisionInformation = 1;
  static const UINT AclSizeInformation = 2;
  typedef UINT SAFER_POLICY_INFO_CLASS; //Alias
  static const UINT SaferPolicyLevelList = 1;
  static const UINT SaferPolicyEnableTransparentEnforcement = 2;
  static const UINT SaferPolicyDefaultLevel = 3;
  static const UINT SaferPolicyEvaluateUserScope = 4;
  static const UINT SaferPolicyScopeFlags = 5;
  static const UINT SaferPolicyDefaultLevelFlags = 6;
  static const UINT SaferPolicyAuthenticodeEnabled = 7;
  typedef UINT WELL_KNOWN_SID_TYPE; //Alias
  static const UINT WinNullSid = 0;
  static const UINT WinWorldSid = 1;
  static const UINT WinLocalSid = 2;
  static const UINT WinCreatorOwnerSid = 3;
  static const UINT WinCreatorGroupSid = 4;
  static const UINT WinCreatorOwnerServerSid = 5;
  static const UINT WinCreatorGroupServerSid = 6;
  static const UINT WinNtAuthoritySid = 7;
  static const UINT WinDialupSid = 8;
  static const UINT WinNetworkSid = 9;
  static const UINT WinBatchSid = 10;
  static const UINT WinInteractiveSid = 11;
  static const UINT WinServiceSid = 12;
  static const UINT WinAnonymousSid = 13;
  static const UINT WinProxySid = 14;
  static const UINT WinEnterpriseControllersSid = 15;
  static const UINT WinSelfSid = 16;
  static const UINT WinAuthenticatedUserSid = 17;
  static const UINT WinRestrictedCodeSid = 18;
  static const UINT WinTerminalServerSid = 19;
  static const UINT WinRemoteLogonIdSid = 20;
  static const UINT WinLogonIdsSid = 21;
  static const UINT WinLocalSystemSid = 22;
  static const UINT WinLocalServiceSid = 23;
  static const UINT WinNetworkServiceSid = 24;
  static const UINT WinBuiltinDomainSid = 25;
  static const UINT WinBuiltinAdministratorsSid = 26;
  static const UINT WinBuiltinUsersSid = 27;
  static const UINT WinBuiltinGuestsSid = 28;
  static const UINT WinBuiltinPowerUsersSid = 29;
  static const UINT WinBuiltinAccountOperatorsSid = 30;
  static const UINT WinBuiltinSystemOperatorsSid = 31;
  static const UINT WinBuiltinPrintOperatorsSid = 32;
  static const UINT WinBuiltinBackupOperatorsSid = 33;
  static const UINT WinBuiltinReplicatorSid = 34;
  static const UINT WinBuiltinPreWindows2000CompatibleAccessSid = 35;
  static const UINT WinBuiltinRemoteDesktopUsersSid = 36;
  static const UINT WinBuiltinNetworkConfigurationOperatorsSid = 37;
  static const UINT WinAccountAdministratorSid = 38;
  static const UINT WinAccountGuestSid = 39;
  static const UINT WinAccountKrbtgtSid = 40;
  static const UINT WinAccountDomainAdminsSid = 41;
  static const UINT WinAccountDomainUsersSid = 42;
  static const UINT WinAccountDomainGuestsSid = 43;
  static const UINT WinAccountComputersSid = 44;
  static const UINT WinAccountControllersSid = 45;
  static const UINT WinAccountCertAdminsSid = 46;
  static const UINT WinAccountSchemaAdminsSid = 47;
  static const UINT WinAccountEnterpriseAdminsSid = 48;
  static const UINT WinAccountPolicyAdminsSid = 49;
  static const UINT WinAccountRasAndIasServersSid = 50;
  static const UINT WinNTLMAuthenticationSid = 51;
  static const UINT WinDigestAuthenticationSid = 52;
  static const UINT WinSChannelAuthenticationSid = 53;
  static const UINT WinThisOrganizationSid = 54;
  static const UINT WinOtherOrganizationSid = 55;
  static const UINT WinBuiltinIncomingForestTrustBuildersSid = 56;
  static const UINT WinBuiltinPerfMonitoringUsersSid = 57;
  static const UINT WinBuiltinPerfLoggingUsersSid = 58;
  static const UINT WinBuiltinAuthorizationAccessSid = 59;
  static const UINT WinBuiltinTerminalServerLicenseServersSid = 60;
  static const UINT WinBuiltinDCOMUsersSid = 61;
  static const UINT WinBuiltinIUsersSid = 62;
  static const UINT WinIUserSid = 63;
  static const UINT WinBuiltinCryptoOperatorsSid = 64;
  static const UINT WinUntrustedLabelSid = 65;
  static const UINT WinLowLabelSid = 66;
  static const UINT WinMediumLabelSid = 67;
  static const UINT WinHighLabelSid = 68;
  static const UINT WinSystemLabelSid = 69;
  static const UINT WinWriteRestrictedCodeSid = 70;
  static const UINT WinCreatorOwnerRightsSid = 71;
  static const UINT WinCacheablePrincipalsGroupSid = 72;
  static const UINT WinNonCacheablePrincipalsGroupSid = 73;
  static const UINT WinEnterpriseReadonlyControllersSid = 74;
  static const UINT WinAccountReadonlyControllersSid = 75;
  static const UINT WinBuiltinEventLogReadersGroup = 76;
  static const UINT WinNewEnterpriseReadonlyControllersSid = 77;
  static const UINT WinBuiltinCertSvcDComAccessGroup = 78;
  static const UINT WinMediumPlusLabelSid = 79;
  static const UINT WinLocalLogonSid = 80;
  static const UINT WinConsoleLogonSid = 81;
  static const UINT WinThisOrganizationCertificateSid = 82;
  static const UINT WinApplicationPackageAuthoritySid = 83;
  static const UINT WinBuiltinAnyPackageSid = 84;
  static const UINT WinCapabilityInternetClientSid = 85;
  static const UINT WinCapabilityInternetClientServerSid = 86;
  static const UINT WinCapabilityPrivateNetworkClientServerSid = 87;
  static const UINT WinCapabilityPicturesLibrarySid = 88;
  static const UINT WinCapabilityVideosLibrarySid = 89;
  static const UINT WinCapabilityMusicLibrarySid = 90;
  static const UINT WinCapabilityDocumentsLibrarySid = 91;
  static const UINT WinCapabilitySharedUserCertificatesSid = 92;
  static const UINT WinCapabilityDefaultWindowsCredentialsSid = 93;
  static const UINT WinCapabilityRemovableStorageSid = 94;
  static const UINT WinBuiltinRDSRemoteAccessServersSid = 95;
  static const UINT WinBuiltinRDSEndpointServersSid = 96;
  static const UINT WinBuiltinRDSManagementServersSid = 97;
  static const UINT WinUserModeDriversSid = 98;
  static const UINT WinBuiltinHyperVAdminsSid = 99;
  typedef UINT SID_NAME_USE; //Alias
  static const UINT SidTypeUser = 1;
  static const UINT SidTypeGroup = 2;
  static const UINT SidTypeDomain = 3;
  static const UINT SidTypeAlias = 4;
  static const UINT SidTypeWellKnownGroup = 5;
  static const UINT SidTypeDeletedAccount = 6;
  static const UINT SidTypeInvalid = 7;
  static const UINT SidTypeUnknown = 8;
  static const UINT SidTypeComputer = 9;
  static const UINT SidTypeLabel = 10;
  typedef SID_NAME_USE *PSID_NAME_USE; //Pointer
  typedef UINT SAFER_OBJECT_INFO_CLASS; //Alias
  static const UINT SaferObjectLevelId = 1;
  static const UINT SaferObjectScopeId = 2;
  static const UINT SaferObjectFriendlyName = 3;
  static const UINT SaferObjectDescription = 4;
  static const UINT SaferObjectBuiltin = 5;
  static const UINT SaferObjectDisallowed = 6;
  static const UINT SaferObjectDisableMaxPrivilege = 7;
  static const UINT SaferObjectInvertDeletedPrivileges = 8;
  static const UINT SaferObjectDeletedPrivileges = 9;
  static const UINT SaferObjectDefaultOwner = 10;
  static const UINT SaferObjectSidsToDisable = 11;
  static const UINT SaferObjectRestrictedSidsInverted = 12;
  static const UINT SaferObjectRestrictedSidsAdded = 13;
  static const UINT SaferObjectAllIdentificationGuids = 14;
  static const UINT SaferObjectSingleIdentification = 15;
  static const UINT SaferObjectExtendedError = 16;
  typedef UINT CRED_PROTECTION_TYPE; //Alias
  static const UINT CredUnprotected = 0;
  static const UINT CredUserProtection = 1;
  static const UINT CredTrustedProtection = 2;
  typedef UINT CRED_MARSHAL_TYPE; //Alias
  static const UINT CertCredential = 1;
  static const UINT UsernameTargetCredential = 2;
  static const UINT BinaryBlobCredential = 3;
  typedef CRED_MARSHAL_TYPE *PCRED_MARSHAL_TYPE; //Pointer
  typedef UINT AUDIT_EVENT_TYPE; //Alias
  static const UINT AuditEventObjectAccess = 0;
  static const UINT AuditEventDirectoryServiceAccess = 1;
  typedef UINT POLICY_AUDIT_EVENT_TYPE; //Alias
  static const UINT AuditCategorySystem = 0;
  static const UINT AuditCategoryLogon = 1;
  static const UINT AuditCategoryObjectAccess = 2;
  static const UINT AuditCategoryPrivilegeUse = 3;
  static const UINT AuditCategoryDetailedTracking = 4;
  static const UINT AuditCategoryPolicyChange = 5;
  static const UINT AuditCategoryAccountManagement = 6;
  static const UINT AuditCategoryDirectoryServiceAccess = 7;
  static const UINT AuditCategoryAccountLogon = 8;
  typedef POLICY_AUDIT_EVENT_TYPE *PPOLICY_AUDIT_EVENT_TYPE; //Pointer
  typedef LONG SECURITY_STATUS; //Alias
  static const LONG SEC_E_OK = 0x00000000;
  static const LONG SEC_E_INSUFFICIENT_MEMORY = 0x80090300;
  static const LONG SEC_E_INVALID_HANDLE = 0x80090301;
  static const LONG SEC_E_UNSUPPORTED_FUNCTION = 0x80090302;
  static const LONG SEC_E_TARGET_UNKNOWN = 0x80090303;
  static const LONG SEC_E_INTERNAL_ERROR = 0x80090304;
  static const LONG SEC_E_SECPKG_NOT_FOUND = 0x80090305;
  static const LONG SEC_E_NOT_OWNER = 0x80090306;
  static const LONG SEC_E_CANNOT_INSTALL = 0x80090307;
  static const LONG SEC_E_INVALID_TOKEN = 0x80090308;
  static const LONG SEC_E_CANNOT_PACK = 0x80090309;
  static const LONG SEC_E_QOP_NOT_SUPPORTED = 0x8009030A;
  static const LONG SEC_E_NO_IMPERSONATION = 0x8009030B;
  static const LONG SEC_E_LOGON_DENIED = 0x8009030C;
  static const LONG SEC_E_UNKNOWN_CREDENTIALS = 0x8009030D;
  static const LONG SEC_E_NO_CREDENTIALS = 0x8009030E;
  static const LONG SEC_E_MESSAGE_ALTERED = 0x8009030F;
  static const LONG SEC_E_OUT_OF_SEQUENCE = 0x80090310;
  static const LONG SEC_E_NO_AUTHENTICATING_AUTHORITY = 0x80090311;
  static const LONG SEC_E_CONTEXT_EXPIRED = 0x80090317;
  static const LONG SEC_E_INCOMPLETE_MESSAGE = 0x80090318;
  static const LONG SEC_I_CONTINUE_NEEDED = 0x00090312;
  static const LONG SEC_I_COMPLETE_NEEDED = 0x00090313;
  static const LONG SEC_I_COMPLETE_AND_CONTINUE = 0x00090314;
  static const LONG SEC_I_LOCAL_LOGON = 0x00090315;
  static const LONG SEC_I_CONTEXT_EXPIRED = 0x00090317;
  static const LONG SEC_I_INCOMPLETE_CREDENTIALS = 0x00090320;
  static const LONG SEC_I_RENEGOTIATE = 0x00090321;
  static const LONG SEC_I_NO_LSA_CONTEXT = 0x00090323;
  static const LONG SEC_I_SIGNATURE_NEEDED = 0x0009035C;
  static const LONG SEC_I_NO_RENEGOTIATION = 0x00090360;
  typedef struct OBJECT_TYPE_LIST {
    WORD Level;
    WORD Sbz;
    GUID* ObjectType;
  } OBJECT_TYPE_LIST;
  typedef OBJECT_TYPE_LIST *POBJECT_TYPE_LIST; //Pointer
  typedef struct SID_AND_ATTRIBUTES {
    PSID Sid;
    DWORD Attributes;
  } SID_AND_ATTRIBUTES;
  typedef SID_AND_ATTRIBUTES *PSID_AND_ATTRIBUTES; //Pointer
  typedef struct TOKEN_GROUPS {
    DWORD GroupCount;
    SID_AND_ATTRIBUTES Groups[ANYSIZE_ARRAY];
  } TOKEN_GROUPS;
  typedef TOKEN_GROUPS *PTOKEN_GROUPS; //Pointer
  typedef struct SECURITY_DESCRIPTOR {
    BYTE Revision;
    BYTE Sbz1;
    SECURITY_DESCRIPTOR_CONTROL Control;
    PSID Owner;
    PSID Group;
    PACL Sacl;
    PACL Dacl;
  } SECURITY_DESCRIPTOR;
  typedef SECURITY_DESCRIPTOR *PSECURITY_DESCRIPTOR; //Pointer
  typedef struct SECURITY_ATTRIBUTES {
    DWORD nLength;
    PSECURITY_DESCRIPTOR lpSecurityDescriptor;
    BOOL bInheritHandle;
  } SECURITY_ATTRIBUTES;
  typedef SECURITY_ATTRIBUTES *LPSECURITY_ATTRIBUTES; //Pointer
  typedef SECURITY_ATTRIBUTES *PSECURITY_ATTRIBUTES; //Pointer
  typedef SECURITY_ATTRIBUTES *WINAPI_LPSECURITY_ATTRIBUTES; //Pointer
  typedef struct SECURITY_DESCRIPTOR_RELATIVE {
    BYTE Revision;
    BYTE Sbz1;
    SECURITY_DESCRIPTOR_CONTROL Control;
    DWORD Owner;
    DWORD Group;
    DWORD Sacl;
    DWORD Dacl;
  } SECURITY_DESCRIPTOR_RELATIVE;
  typedef SECURITY_DESCRIPTOR_RELATIVE *PSECURITY_DESCRIPTOR_RELATIVE; //Pointer
  typedef SECURITY_DESCRIPTOR_RELATIVE *PISECURITY_DESCRIPTOR_RELATIVE; //Pointer
]]

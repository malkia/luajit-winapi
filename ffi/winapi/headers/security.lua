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
  static const ACCESS_MODE NOT_USED_ACCESS = 0;
  static const ACCESS_MODE GRANT_ACCESS = 1;
  static const ACCESS_MODE SET_ACCESS = 2;
  static const ACCESS_MODE DENY_ACCESS = 3;
  static const ACCESS_MODE REVOKE_ACCESS = 4;
  static const ACCESS_MODE SET_AUDIT_SUCCESS = 5;
  static const ACCESS_MODE SET_AUDIT_FAILURE = 6;
  typedef UINT MULTIPLE_TRUSTEE_OPERATION; //Alias
  static const MULTIPLE_TRUSTEE_OPERATION NO_MULTIPLE_TRUSTEE = 0;
  static const MULTIPLE_TRUSTEE_OPERATION TRUSTEE_IS_IMPERSONATE = 1;
  typedef UINT TRUSTEE_FORM; //Alias
  static const TRUSTEE_FORM TRUSTEE_IS_SID = 0;
  static const TRUSTEE_FORM TRUSTEE_IS_NAME = 1;
  static const TRUSTEE_FORM TRUSTEE_BAD_FORM = 2;
  static const TRUSTEE_FORM TRUSTEE_IS_OBJECTS_AND_SID = 3;
  static const TRUSTEE_FORM TRUSTEE_IS_OBJECTS_AND_NAME = 4;
  typedef UINT TRUSTEE_TYPE; //Alias
  static const TRUSTEE_TYPE TRUSTEE_IS_UNKNOWN = 0;
  static const TRUSTEE_TYPE TRUSTEE_IS_USER = 1;
  static const TRUSTEE_TYPE TRUSTEE_IS_GROUP = 2;
  static const TRUSTEE_TYPE TRUSTEE_IS_DOMAIN = 3;
  static const TRUSTEE_TYPE TRUSTEE_IS_ALIAS = 4;
  static const TRUSTEE_TYPE TRUSTEE_IS_WELL_KNOWN_GROUP = 5;
  static const TRUSTEE_TYPE TRUSTEE_IS_DELETED = 6;
  static const TRUSTEE_TYPE TRUSTEE_IS_INVALID = 7;
  static const TRUSTEE_TYPE TRUSTEE_IS_COMPUTER = 8;
  typedef struct OBJECTS_AND_SID {
    DWORD ObjectsPresent;
    GUID ObjectTypeGuid;
    GUID InheritedObjectTypeGuid;
    SID* pSid;
  } OBJECTS_AND_SID;
  typedef OBJECTS_AND_SID *POBJECTS_AND_SID; //Pointer
  typedef UINT SE_OBJECT_TYPE; //Alias
  static const SE_OBJECT_TYPE SE_UNKNOWN_OBJECT_TYPE = 0;
  static const SE_OBJECT_TYPE SE_FILE_OBJECT = 1;
  static const SE_OBJECT_TYPE SE_SERVICE = 2;
  static const SE_OBJECT_TYPE SE_PRINTER = 3;
  static const SE_OBJECT_TYPE SE_REGISTRY_KEY = 4;
  static const SE_OBJECT_TYPE SE_LMSHARE = 5;
  static const SE_OBJECT_TYPE SE_KERNEL_OBJECT = 6;
  static const SE_OBJECT_TYPE SE_WINDOW_OBJECT = 7;
  static const SE_OBJECT_TYPE SE_DS_OBJECT = 8;
  static const SE_OBJECT_TYPE SE_DS_OBJECT_ALL = 9;
  static const SE_OBJECT_TYPE SE_PROVIDER_DEFINED_OBJECT = 10;
  static const SE_OBJECT_TYPE SE_WMIGUID_OBJECT = 11;
  static const SE_OBJECT_TYPE SE_REGISTRY_WOW64_32KEY = 12;
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
  static const URLZONE URLZONE_LOCAL_MACHINE = 0;
  static const URLZONE URLZONE_INTRANET = 1;
  static const URLZONE URLZONE_TRUSTED = 2;
  static const URLZONE URLZONE_INTERNET = 3;
  static const URLZONE URLZONE_UNTRUSTED = 4;
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
  typedef PCAUDIT_POLICY_INFORMATION PAUDIT_POLICY_INFORMATION; //Pointer
  typedef BYTE WINAPI_AceType; //Alias
  static const WINAPI_AceType ACCESS_ALLOWED = 0x0;
  static const WINAPI_AceType ACCESS_DENIED = 0x1;
  static const WINAPI_AceType SYSTEM_AUDIT = 0x2;
  static const WINAPI_AceType SYSTEM_ALARM = 0x3;
  static const WINAPI_AceType ACCESS_ALLOWED_COMPOUND = 0x4;
  static const WINAPI_AceType ACCESS_ALLOWED_OBJECT = 0x5;
  static const WINAPI_AceType ACCESS_DENIED_OBJECT = 0x6;
  static const WINAPI_AceType SYSTEM_AUDIT_OBJECT = 0x7;
  static const WINAPI_AceType SYSTEM_ALARM_OBJECT = 0x8;
  static const WINAPI_AceType ACCESS_ALLOWED_CALLBACK = 0x9;
  static const WINAPI_AceType ACCESS_DENIED_CALLBACK = 0xA;
  static const WINAPI_AceType ACCESS_ALLOWED_CALLBACK_OBJECT = 0xB;
  static const WINAPI_AceType ACCESS_DENIED_CALLBACK_OBJECT = 0xC;
  static const WINAPI_AceType SYSTEM_AUDIT_CALLBACK = 0xD;
  static const WINAPI_AceType SYSTEM_ALARM_CALLBACK = 0xE;
  static const WINAPI_AceType SYSTEM_AUDIT_CALLBACK_OBJECT = 0xF;
  static const WINAPI_AceType SYSTEM_ALARM_CALLBACK_OBJECT = 0x10;
  static const WINAPI_AceType SYSTEM_MANDATORY_LABEL = 0x11;
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
  static const TOKEN_TYPE TokenPrimary = 1;
  static const TOKEN_TYPE TokenImpersonation = 2;
  typedef UINT TOKEN_INFORMATION_CLASS; //Alias
  static const TOKEN_INFORMATION_CLASS TokenUser = 1;
  static const TOKEN_INFORMATION_CLASS TokenGroups = 2;
  static const TOKEN_INFORMATION_CLASS TokenPrivileges = 3;
  static const TOKEN_INFORMATION_CLASS TokenOwner = 4;
  static const TOKEN_INFORMATION_CLASS TokenPrimaryGroup = 5;
  static const TOKEN_INFORMATION_CLASS TokenDefaultDacl = 6;
  static const TOKEN_INFORMATION_CLASS TokenSource = 7;
  static const TOKEN_INFORMATION_CLASS TokenType = 8;
  static const TOKEN_INFORMATION_CLASS TokenImpersonationLevel = 9;
  static const TOKEN_INFORMATION_CLASS TokenStatistics = 10;
  static const TOKEN_INFORMATION_CLASS TokenRestrictedSids = 11;
  static const TOKEN_INFORMATION_CLASS TokenSessionId = 12;
  static const TOKEN_INFORMATION_CLASS TokenGroupsAndPrivileges = 13;
  static const TOKEN_INFORMATION_CLASS TokenSessionReference = 14;
  static const TOKEN_INFORMATION_CLASS TokenSandBoxInert = 15;
  static const TOKEN_INFORMATION_CLASS TokenAuditPolicy = 16;
  static const TOKEN_INFORMATION_CLASS TokenOrigin = 17;
  static const TOKEN_INFORMATION_CLASS TokenElevationType = 18;
  static const TOKEN_INFORMATION_CLASS TokenLinkedToken = 19;
  static const TOKEN_INFORMATION_CLASS TokenElevation = 20;
  static const TOKEN_INFORMATION_CLASS TokenHasRestrictions = 21;
  static const TOKEN_INFORMATION_CLASS TokenAccessInformation = 22;
  static const TOKEN_INFORMATION_CLASS TokenVirtualizationAllowed = 23;
  static const TOKEN_INFORMATION_CLASS TokenVirtualizationEnabled = 24;
  static const TOKEN_INFORMATION_CLASS TokenIntegrityLevel = 25;
  static const TOKEN_INFORMATION_CLASS TokenUIAccess = 26;
  static const TOKEN_INFORMATION_CLASS TokenMandatoryPolicy = 27;
  static const TOKEN_INFORMATION_CLASS TokenLogonSid = 28;
  static const TOKEN_INFORMATION_CLASS TokenIsAppContainer = 29;
  static const TOKEN_INFORMATION_CLASS TokenCapabilities = 30;
  static const TOKEN_INFORMATION_CLASS TokenAppContainerSid = 31;
  static const TOKEN_INFORMATION_CLASS TokenAppContainerNumber = 32;
  static const TOKEN_INFORMATION_CLASS TokenUserClaimAttributes = 33;
  static const TOKEN_INFORMATION_CLASS TokenDeviceClaimAttributes = 34;
  static const TOKEN_INFORMATION_CLASS TokenRestrictedUserClaimAttributes = 35;
  static const TOKEN_INFORMATION_CLASS TokenRestrictedDeviceClaimAttributes = 36;
  static const TOKEN_INFORMATION_CLASS TokenDeviceGroups = 37;
  static const TOKEN_INFORMATION_CLASS TokenRestrictedDeviceGroups = 38;
  static const TOKEN_INFORMATION_CLASS TokenSecurityAttributes = 39;
  static const TOKEN_INFORMATION_CLASS TokenIsRestricted = 40;
  typedef UINT SECURITY_IMPERSONATION_LEVEL; //Alias
  static const SECURITY_IMPERSONATION_LEVEL SecurityAnonymous = 0;
  static const SECURITY_IMPERSONATION_LEVEL SecurityIdentification = 1;
  static const SECURITY_IMPERSONATION_LEVEL SecurityImpersonation = 2;
  static const SECURITY_IMPERSONATION_LEVEL SecurityDelegation = 3;
  typedef int8_t SECURITY_CONTEXT_TRACKING_MODE; //Integer
  static const SECURITY_CONTEXT_TRACKING_MODE SECURITY_DYNAMIC_TRACKING = 1;
  static const SECURITY_CONTEXT_TRACKING_MODE SECURITY_STATIC_TRACKING = 0;
  typedef struct SECURITY_QUALITY_OF_SERVICE {
    DWORD Length;
    SECURITY_IMPERSONATION_LEVEL ImpersonationLevel;
    SECURITY_CONTEXT_TRACKING_MODE ContextTrackingMode;
    BOOLEAN EffectiveOnly;
  } SECURITY_QUALITY_OF_SERVICE;
  typedef SECURITY_QUALITY_OF_SERVICE *PSECURITY_QUALITY_OF_SERVICE; //Pointer
  typedef UINT ACL_INFORMATION_CLASS; //Alias
  static const ACL_INFORMATION_CLASS AclRevisionInformation = 1;
  static const ACL_INFORMATION_CLASS AclSizeInformation = 2;
  typedef UINT SAFER_POLICY_INFO_CLASS; //Alias
  static const SAFER_POLICY_INFO_CLASS SaferPolicyLevelList = 1;
  static const SAFER_POLICY_INFO_CLASS SaferPolicyEnableTransparentEnforcement = 2;
  static const SAFER_POLICY_INFO_CLASS SaferPolicyDefaultLevel = 3;
  static const SAFER_POLICY_INFO_CLASS SaferPolicyEvaluateUserScope = 4;
  static const SAFER_POLICY_INFO_CLASS SaferPolicyScopeFlags = 5;
  static const SAFER_POLICY_INFO_CLASS SaferPolicyDefaultLevelFlags = 6;
  static const SAFER_POLICY_INFO_CLASS SaferPolicyAuthenticodeEnabled = 7;
  typedef UINT WELL_KNOWN_SID_TYPE; //Alias
  static const WELL_KNOWN_SID_TYPE WinNullSid = 0;
  static const WELL_KNOWN_SID_TYPE WinWorldSid = 1;
  static const WELL_KNOWN_SID_TYPE WinLocalSid = 2;
  static const WELL_KNOWN_SID_TYPE WinCreatorOwnerSid = 3;
  static const WELL_KNOWN_SID_TYPE WinCreatorGroupSid = 4;
  static const WELL_KNOWN_SID_TYPE WinCreatorOwnerServerSid = 5;
  static const WELL_KNOWN_SID_TYPE WinCreatorGroupServerSid = 6;
  static const WELL_KNOWN_SID_TYPE WinNtAuthoritySid = 7;
  static const WELL_KNOWN_SID_TYPE WinDialupSid = 8;
  static const WELL_KNOWN_SID_TYPE WinNetworkSid = 9;
  static const WELL_KNOWN_SID_TYPE WinBatchSid = 10;
  static const WELL_KNOWN_SID_TYPE WinInteractiveSid = 11;
  static const WELL_KNOWN_SID_TYPE WinServiceSid = 12;
  static const WELL_KNOWN_SID_TYPE WinAnonymousSid = 13;
  static const WELL_KNOWN_SID_TYPE WinProxySid = 14;
  static const WELL_KNOWN_SID_TYPE WinEnterpriseControllersSid = 15;
  static const WELL_KNOWN_SID_TYPE WinSelfSid = 16;
  static const WELL_KNOWN_SID_TYPE WinAuthenticatedUserSid = 17;
  static const WELL_KNOWN_SID_TYPE WinRestrictedCodeSid = 18;
  static const WELL_KNOWN_SID_TYPE WinTerminalServerSid = 19;
  static const WELL_KNOWN_SID_TYPE WinRemoteLogonIdSid = 20;
  static const WELL_KNOWN_SID_TYPE WinLogonIdsSid = 21;
  static const WELL_KNOWN_SID_TYPE WinLocalSystemSid = 22;
  static const WELL_KNOWN_SID_TYPE WinLocalServiceSid = 23;
  static const WELL_KNOWN_SID_TYPE WinNetworkServiceSid = 24;
  static const WELL_KNOWN_SID_TYPE WinBuiltinDomainSid = 25;
  static const WELL_KNOWN_SID_TYPE WinBuiltinAdministratorsSid = 26;
  static const WELL_KNOWN_SID_TYPE WinBuiltinUsersSid = 27;
  static const WELL_KNOWN_SID_TYPE WinBuiltinGuestsSid = 28;
  static const WELL_KNOWN_SID_TYPE WinBuiltinPowerUsersSid = 29;
  static const WELL_KNOWN_SID_TYPE WinBuiltinAccountOperatorsSid = 30;
  static const WELL_KNOWN_SID_TYPE WinBuiltinSystemOperatorsSid = 31;
  static const WELL_KNOWN_SID_TYPE WinBuiltinPrintOperatorsSid = 32;
  static const WELL_KNOWN_SID_TYPE WinBuiltinBackupOperatorsSid = 33;
  static const WELL_KNOWN_SID_TYPE WinBuiltinReplicatorSid = 34;
  static const WELL_KNOWN_SID_TYPE WinBuiltinPreWindows2000CompatibleAccessSid = 35;
  static const WELL_KNOWN_SID_TYPE WinBuiltinRemoteDesktopUsersSid = 36;
  static const WELL_KNOWN_SID_TYPE WinBuiltinNetworkConfigurationOperatorsSid = 37;
  static const WELL_KNOWN_SID_TYPE WinAccountAdministratorSid = 38;
  static const WELL_KNOWN_SID_TYPE WinAccountGuestSid = 39;
  static const WELL_KNOWN_SID_TYPE WinAccountKrbtgtSid = 40;
  static const WELL_KNOWN_SID_TYPE WinAccountDomainAdminsSid = 41;
  static const WELL_KNOWN_SID_TYPE WinAccountDomainUsersSid = 42;
  static const WELL_KNOWN_SID_TYPE WinAccountDomainGuestsSid = 43;
  static const WELL_KNOWN_SID_TYPE WinAccountComputersSid = 44;
  static const WELL_KNOWN_SID_TYPE WinAccountControllersSid = 45;
  static const WELL_KNOWN_SID_TYPE WinAccountCertAdminsSid = 46;
  static const WELL_KNOWN_SID_TYPE WinAccountSchemaAdminsSid = 47;
  static const WELL_KNOWN_SID_TYPE WinAccountEnterpriseAdminsSid = 48;
  static const WELL_KNOWN_SID_TYPE WinAccountPolicyAdminsSid = 49;
  static const WELL_KNOWN_SID_TYPE WinAccountRasAndIasServersSid = 50;
  static const WELL_KNOWN_SID_TYPE WinNTLMAuthenticationSid = 51;
  static const WELL_KNOWN_SID_TYPE WinDigestAuthenticationSid = 52;
  static const WELL_KNOWN_SID_TYPE WinSChannelAuthenticationSid = 53;
  static const WELL_KNOWN_SID_TYPE WinThisOrganizationSid = 54;
  static const WELL_KNOWN_SID_TYPE WinOtherOrganizationSid = 55;
  static const WELL_KNOWN_SID_TYPE WinBuiltinIncomingForestTrustBuildersSid = 56;
  static const WELL_KNOWN_SID_TYPE WinBuiltinPerfMonitoringUsersSid = 57;
  static const WELL_KNOWN_SID_TYPE WinBuiltinPerfLoggingUsersSid = 58;
  static const WELL_KNOWN_SID_TYPE WinBuiltinAuthorizationAccessSid = 59;
  static const WELL_KNOWN_SID_TYPE WinBuiltinTerminalServerLicenseServersSid = 60;
  static const WELL_KNOWN_SID_TYPE WinBuiltinDCOMUsersSid = 61;
  static const WELL_KNOWN_SID_TYPE WinBuiltinIUsersSid = 62;
  static const WELL_KNOWN_SID_TYPE WinIUserSid = 63;
  static const WELL_KNOWN_SID_TYPE WinBuiltinCryptoOperatorsSid = 64;
  static const WELL_KNOWN_SID_TYPE WinUntrustedLabelSid = 65;
  static const WELL_KNOWN_SID_TYPE WinLowLabelSid = 66;
  static const WELL_KNOWN_SID_TYPE WinMediumLabelSid = 67;
  static const WELL_KNOWN_SID_TYPE WinHighLabelSid = 68;
  static const WELL_KNOWN_SID_TYPE WinSystemLabelSid = 69;
  static const WELL_KNOWN_SID_TYPE WinWriteRestrictedCodeSid = 70;
  static const WELL_KNOWN_SID_TYPE WinCreatorOwnerRightsSid = 71;
  static const WELL_KNOWN_SID_TYPE WinCacheablePrincipalsGroupSid = 72;
  static const WELL_KNOWN_SID_TYPE WinNonCacheablePrincipalsGroupSid = 73;
  static const WELL_KNOWN_SID_TYPE WinEnterpriseReadonlyControllersSid = 74;
  static const WELL_KNOWN_SID_TYPE WinAccountReadonlyControllersSid = 75;
  static const WELL_KNOWN_SID_TYPE WinBuiltinEventLogReadersGroup = 76;
  static const WELL_KNOWN_SID_TYPE WinNewEnterpriseReadonlyControllersSid = 77;
  static const WELL_KNOWN_SID_TYPE WinBuiltinCertSvcDComAccessGroup = 78;
  static const WELL_KNOWN_SID_TYPE WinMediumPlusLabelSid = 79;
  static const WELL_KNOWN_SID_TYPE WinLocalLogonSid = 80;
  static const WELL_KNOWN_SID_TYPE WinConsoleLogonSid = 81;
  static const WELL_KNOWN_SID_TYPE WinThisOrganizationCertificateSid = 82;
  static const WELL_KNOWN_SID_TYPE WinApplicationPackageAuthoritySid = 83;
  static const WELL_KNOWN_SID_TYPE WinBuiltinAnyPackageSid = 84;
  static const WELL_KNOWN_SID_TYPE WinCapabilityInternetClientSid = 85;
  static const WELL_KNOWN_SID_TYPE WinCapabilityInternetClientServerSid = 86;
  static const WELL_KNOWN_SID_TYPE WinCapabilityPrivateNetworkClientServerSid = 87;
  static const WELL_KNOWN_SID_TYPE WinCapabilityPicturesLibrarySid = 88;
  static const WELL_KNOWN_SID_TYPE WinCapabilityVideosLibrarySid = 89;
  static const WELL_KNOWN_SID_TYPE WinCapabilityMusicLibrarySid = 90;
  static const WELL_KNOWN_SID_TYPE WinCapabilityDocumentsLibrarySid = 91;
  static const WELL_KNOWN_SID_TYPE WinCapabilitySharedUserCertificatesSid = 92;
  static const WELL_KNOWN_SID_TYPE WinCapabilityDefaultWindowsCredentialsSid = 93;
  static const WELL_KNOWN_SID_TYPE WinCapabilityRemovableStorageSid = 94;
  static const WELL_KNOWN_SID_TYPE WinBuiltinRDSRemoteAccessServersSid = 95;
  static const WELL_KNOWN_SID_TYPE WinBuiltinRDSEndpointServersSid = 96;
  static const WELL_KNOWN_SID_TYPE WinBuiltinRDSManagementServersSid = 97;
  static const WELL_KNOWN_SID_TYPE WinUserModeDriversSid = 98;
  static const WELL_KNOWN_SID_TYPE WinBuiltinHyperVAdminsSid = 99;
  typedef UINT SID_NAME_USE; //Alias
  static const SID_NAME_USE SidTypeUser = 1;
  static const SID_NAME_USE SidTypeGroup = 2;
  static const SID_NAME_USE SidTypeDomain = 3;
  static const SID_NAME_USE SidTypeAlias = 4;
  static const SID_NAME_USE SidTypeWellKnownGroup = 5;
  static const SID_NAME_USE SidTypeDeletedAccount = 6;
  static const SID_NAME_USE SidTypeInvalid = 7;
  static const SID_NAME_USE SidTypeUnknown = 8;
  static const SID_NAME_USE SidTypeComputer = 9;
  static const SID_NAME_USE SidTypeLabel = 10;
  typedef SID_NAME_USE *PSID_NAME_USE; //Pointer
  typedef UINT SAFER_OBJECT_INFO_CLASS; //Alias
  static const SAFER_OBJECT_INFO_CLASS SaferObjectLevelId = 1;
  static const SAFER_OBJECT_INFO_CLASS SaferObjectScopeId = 2;
  static const SAFER_OBJECT_INFO_CLASS SaferObjectFriendlyName = 3;
  static const SAFER_OBJECT_INFO_CLASS SaferObjectDescription = 4;
  static const SAFER_OBJECT_INFO_CLASS SaferObjectBuiltin = 5;
  static const SAFER_OBJECT_INFO_CLASS SaferObjectDisallowed = 6;
  static const SAFER_OBJECT_INFO_CLASS SaferObjectDisableMaxPrivilege = 7;
  static const SAFER_OBJECT_INFO_CLASS SaferObjectInvertDeletedPrivileges = 8;
  static const SAFER_OBJECT_INFO_CLASS SaferObjectDeletedPrivileges = 9;
  static const SAFER_OBJECT_INFO_CLASS SaferObjectDefaultOwner = 10;
  static const SAFER_OBJECT_INFO_CLASS SaferObjectSidsToDisable = 11;
  static const SAFER_OBJECT_INFO_CLASS SaferObjectRestrictedSidsInverted = 12;
  static const SAFER_OBJECT_INFO_CLASS SaferObjectRestrictedSidsAdded = 13;
  static const SAFER_OBJECT_INFO_CLASS SaferObjectAllIdentificationGuids = 14;
  static const SAFER_OBJECT_INFO_CLASS SaferObjectSingleIdentification = 15;
  static const SAFER_OBJECT_INFO_CLASS SaferObjectExtendedError = 16;
  typedef UINT CRED_PROTECTION_TYPE; //Alias
  static const CRED_PROTECTION_TYPE CredUnprotected = 0;
  static const CRED_PROTECTION_TYPE CredUserProtection = 1;
  static const CRED_PROTECTION_TYPE CredTrustedProtection = 2;
  typedef UINT CRED_MARSHAL_TYPE; //Alias
  static const CRED_MARSHAL_TYPE CertCredential = 1;
  static const CRED_MARSHAL_TYPE UsernameTargetCredential = 2;
  static const CRED_MARSHAL_TYPE BinaryBlobCredential = 3;
  typedef CRED_MARSHAL_TYPE *PCRED_MARSHAL_TYPE; //Pointer
  typedef UINT AUDIT_EVENT_TYPE; //Alias
  static const AUDIT_EVENT_TYPE AuditEventObjectAccess = 0;
  static const AUDIT_EVENT_TYPE AuditEventDirectoryServiceAccess = 1;
  typedef UINT POLICY_AUDIT_EVENT_TYPE; //Alias
  static const POLICY_AUDIT_EVENT_TYPE AuditCategorySystem = 0;
  static const POLICY_AUDIT_EVENT_TYPE AuditCategoryLogon = 1;
  static const POLICY_AUDIT_EVENT_TYPE AuditCategoryObjectAccess = 2;
  static const POLICY_AUDIT_EVENT_TYPE AuditCategoryPrivilegeUse = 3;
  static const POLICY_AUDIT_EVENT_TYPE AuditCategoryDetailedTracking = 4;
  static const POLICY_AUDIT_EVENT_TYPE AuditCategoryPolicyChange = 5;
  static const POLICY_AUDIT_EVENT_TYPE AuditCategoryAccountManagement = 6;
  static const POLICY_AUDIT_EVENT_TYPE AuditCategoryDirectoryServiceAccess = 7;
  static const POLICY_AUDIT_EVENT_TYPE AuditCategoryAccountLogon = 8;
  typedef POLICY_AUDIT_EVENT_TYPE *PPOLICY_AUDIT_EVENT_TYPE; //Pointer
  typedef LONG SECURITY_STATUS; //Alias
  static const SECURITY_STATUS SEC_E_OK = 0x00000000;
  static const SECURITY_STATUS SEC_E_INSUFFICIENT_MEMORY = 0x80090300;
  static const SECURITY_STATUS SEC_E_INVALID_HANDLE = 0x80090301;
  static const SECURITY_STATUS SEC_E_UNSUPPORTED_FUNCTION = 0x80090302;
  static const SECURITY_STATUS SEC_E_TARGET_UNKNOWN = 0x80090303;
  static const SECURITY_STATUS SEC_E_INTERNAL_ERROR = 0x80090304;
  static const SECURITY_STATUS SEC_E_SECPKG_NOT_FOUND = 0x80090305;
  static const SECURITY_STATUS SEC_E_NOT_OWNER = 0x80090306;
  static const SECURITY_STATUS SEC_E_CANNOT_INSTALL = 0x80090307;
  static const SECURITY_STATUS SEC_E_INVALID_TOKEN = 0x80090308;
  static const SECURITY_STATUS SEC_E_CANNOT_PACK = 0x80090309;
  static const SECURITY_STATUS SEC_E_QOP_NOT_SUPPORTED = 0x8009030A;
  static const SECURITY_STATUS SEC_E_NO_IMPERSONATION = 0x8009030B;
  static const SECURITY_STATUS SEC_E_LOGON_DENIED = 0x8009030C;
  static const SECURITY_STATUS SEC_E_UNKNOWN_CREDENTIALS = 0x8009030D;
  static const SECURITY_STATUS SEC_E_NO_CREDENTIALS = 0x8009030E;
  static const SECURITY_STATUS SEC_E_MESSAGE_ALTERED = 0x8009030F;
  static const SECURITY_STATUS SEC_E_OUT_OF_SEQUENCE = 0x80090310;
  static const SECURITY_STATUS SEC_E_NO_AUTHENTICATING_AUTHORITY = 0x80090311;
  static const SECURITY_STATUS SEC_E_CONTEXT_EXPIRED = 0x80090317;
  static const SECURITY_STATUS SEC_E_INCOMPLETE_MESSAGE = 0x80090318;
  static const SECURITY_STATUS SEC_I_CONTINUE_NEEDED = 0x00090312;
  static const SECURITY_STATUS SEC_I_COMPLETE_NEEDED = 0x00090313;
  static const SECURITY_STATUS SEC_I_COMPLETE_AND_CONTINUE = 0x00090314;
  static const SECURITY_STATUS SEC_I_LOCAL_LOGON = 0x00090315;
  static const SECURITY_STATUS SEC_I_CONTEXT_EXPIRED = 0x00090317;
  static const SECURITY_STATUS SEC_I_INCOMPLETE_CREDENTIALS = 0x00090320;
  static const SECURITY_STATUS SEC_I_RENEGOTIATE = 0x00090321;
  static const SECURITY_STATUS SEC_I_NO_LSA_CONTEXT = 0x00090323;
  static const SECURITY_STATUS SEC_I_SIGNATURE_NEEDED = 0x0009035C;
  static const SECURITY_STATUS SEC_I_NO_RENEGOTIATION = 0x00090360;
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
  typedef SECURITY_ATTRIBUTES *LPSECURITY_ATTRIBUTES; //Pointer
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

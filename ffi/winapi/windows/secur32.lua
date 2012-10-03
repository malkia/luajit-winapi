require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/security' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UNICODE_STRING SECURITY_STRING; //Alias
  typedef SECURITY_STRING *PSECURITY_STRING; //Pointer
  typedef STRING LSA_STRING; //Alias
  typedef LSA_STRING *PLSA_STRING; //Pointer
  typedef LARGE_INTEGER TimeStamp; //Alias
  typedef TimeStamp *PTimeStamp; //Pointer
  typedef LPVOID SEC_GET_KEY_FN; //Alias
  typedef LPVOID PSecurityFunctionTable; //Alias
  typedef DWORD SECURITY_LOGON_TYPE; //Alias
  static const DWORD UndefinedLogonType = 0;
  static const DWORD Interactive = 2;
  static const DWORD Network = 3;
  static const DWORD Batch = 4;
  static const DWORD Service = 5;
  static const DWORD Proxy = 6;
  static const DWORD Unlock = 7;
  static const DWORD NetworkCleartext = 8;
  static const DWORD NewCredentials = 9;
  static const DWORD RemoteInteractive = 10;
  static const DWORD CachedInteractive = 11;
  static const DWORD CachedRemoteInteractive = 12;
  static const DWORD CachedUnlock = 13;
  typedef struct LSA_LAST_INTER_LOGON_INFO {
    LARGE_INTEGER LastSuccessfulLogon;
    LARGE_INTEGER LastFailedLogon;
    ULONG FailedAttemptCountSinceLastSuccessfulLogon;
  } LSA_LAST_INTER_LOGON_INFO;
  typedef struct SECURITY_LOGON_SESSION_DATA {
    ULONG Size;
    LUID LogonId;
    LSA_UNICODE_STRING UserName;
    LSA_UNICODE_STRING LogonDomain;
    LSA_UNICODE_STRING AuthenticationPackage;
    SECURITY_LOGON_TYPE LogonType;
    ULONG Session;
    PSID Sid;
    LARGE_INTEGER LogonTime;
    LSA_UNICODE_STRING LogonServer;
    LSA_UNICODE_STRING DnsDomainName;
    LSA_UNICODE_STRING Upn;
    ULONG UserFlags;
    LSA_LAST_INTER_LOGON_INFO LastLogonInfo;
    LSA_UNICODE_STRING LogonScript;
    LSA_UNICODE_STRING ProfilePath;
    LSA_UNICODE_STRING HomeDirectory;
    LSA_UNICODE_STRING HomeDirectoryDrive;
    LARGE_INTEGER LogoffTime;
    LARGE_INTEGER KickOffTime;
    LARGE_INTEGER PasswordLastSet;
    LARGE_INTEGER PasswordCanChange;
    LARGE_INTEGER PasswordMustChange;
  } SECURITY_LOGON_SESSION_DATA;
  typedef SECURITY_LOGON_SESSION_DATA *PSECURITY_LOGON_SESSION_DATA; //Pointer
  typedef struct SecPkgInfo {
    unsigned long fCapabilities;
    unsigned short wVersion;
    unsigned short wRPCID;
    unsigned long cbMaxToken;
    SEC_TCHAR* Name;
    SEC_TCHAR* Comment;
  } SecPkgInfo;
  typedef SecPkgInfo *PSecPkgInfo; //Pointer
  typedef struct SecBuffer {
    unsigned long cbBuffer;
    unsigned long BufferType;
    void SEC_FAR* pvBuffer;
  } SecBuffer;
  typedef SecBuffer *PSecBuffer; //Pointer
  typedef SecHandle CredHandle; //Alias
  typedef CredHandle *PCredHandle; //Pointer
  typedef struct SecBufferDesc {
    unsigned long ulVersion;
    unsigned long cBuffers;
    PSecBuffer pBuffers;
  } SecBufferDesc;
  typedef SecBufferDesc *PSecBufferDesc; //Pointer
  typedef struct SECURITY_PACKAGE_OPTIONS {
    unsigned long Size;
    unsigned long Type;
    unsigned long Flags;
    unsigned long SignatureSize;
    void* Signature;
  } SECURITY_PACKAGE_OPTIONS;
  typedef SECURITY_PACKAGE_OPTIONS *PSECURITY_PACKAGE_OPTIONS; //Pointer
  typedef UINT EXTENDED_NAME_FORMAT; //Alias
  static const UINT NameUnknown = 0;
  static const UINT NameFullyQualifiedDN = 1;
  static const UINT NameSamCompatible = 2;
  static const UINT NameDisplay = 3;
  static const UINT NameUniqueId = 6;
  static const UINT NameCanonical = 7;
  static const UINT NameUserPrincipal = 8;
  static const UINT NameCanonicalEx = 9;
  static const UINT NameServicePrincipal = 10;
  static const UINT NameDnsDomain = 12;
  typedef UINT POLICY_NOTIFICATION_INFORMATION_CLASS; //Alias
  static const UINT PolicyNotifyAuditEventsInformation = 1;
  static const UINT PolicyNotifyAccountDomainInformation = 2;
  static const UINT PolicyNotifyServerRoleInformation = 3;
  static const UINT PolicyNotifyDnsDomainInformation = 4;
  static const UINT PolicyNotifyDomainEfsInformation = 5;
  static const UINT PolicyNotifyDomainKerberosTicketInformation = 6;
  static const UINT PolicyNotifyMachineAccountPasswordInformation = 7;
  typedef ULONG LSA_OPERATIONAL_MODE; //Alias
  typedef LSA_OPERATIONAL_MODE *PLSA_OPERATIONAL_MODE; //Pointer
  typedef DWORD WINAPI_SecCredentialUse; //Alias
  static const DWORD SECPKG_CRED_INBOUND = 0x00000001;
  static const DWORD SECPKG_CRED_OUTBOUND = 0x00000002;
  static const DWORD SECPKG_CRED_BOTH = 0x00000003;
  static const DWORD SECPKG_CRED_DEFAULT = 0x00000004;
  static const DWORD SECPKG_CRED_RESERVED = 0xF0000000;
  static const DWORD SECPKG_CRED_AUTOLOGON_RESTRICTED = 0x00000010;
  static const DWORD SECPKG_CRED_PROCESS_POLICY_ONLY = 0x00000020;
  typedef unsigned long WINAPI_InitializeSecurityContextRequestFlags; //Alias
  typedef ULONG WINAPI_InitializeSecurityContextRetFlags; //Alias
  typedef WINAPI_InitializeSecurityContextRetFlags *WINAPI_InitializeSecurityContextRetFlags_unsigned_long; //Pointer
  typedef unsigned long WINAPI_AcceptSecurityContextRequestFlags; //Alias
  typedef unsigned long WINAPI_AcceptSecurityContextRetFlags; //Alias
  typedef ULONG WINAPI_SecContextAttr; //Alias
  static const ULONG SECPKG_ATTR_SIZES = 0;
  static const ULONG SECPKG_ATTR_NAMES = 1;
  static const ULONG SECPKG_ATTR_LIFESPAN = 2;
  static const ULONG SECPKG_ATTR_DCE_INFO = 3;
  static const ULONG SECPKG_ATTR_STREAM_SIZES = 4;
  static const ULONG SECPKG_ATTR_KEY_INFO = 5;
  static const ULONG SECPKG_ATTR_AUTHORITY = 6;
  static const ULONG SECPKG_ATTR_PROTO_INFO = 7;
  static const ULONG SECPKG_ATTR_PASSWORD_EXPIRY = 8;
  static const ULONG SECPKG_ATTR_SESSION_KEY = 9;
  static const ULONG SECPKG_ATTR_PACKAGE_INFO = 10;
  static const ULONG SECPKG_ATTR_USER_FLAGS = 11;
  static const ULONG SECPKG_ATTR_NEGOTIATION_INFO = 12;
  static const ULONG SECPKG_ATTR_NATIVE_NAMES = 13;
  static const ULONG SECPKG_ATTR_FLAGS = 14;
  static const ULONG SECPKG_ATTR_USE_VALIDATED = 15;
  static const ULONG SECPKG_ATTR_CREDENTIAL_NAME = 16;
  static const ULONG SECPKG_ATTR_TARGET_INFORMATION = 17;
  static const ULONG SECPKG_ATTR_ACCESS_TOKEN = 18;
  static const ULONG SECPKG_ATTR_TARGET = 19;
  static const ULONG SECPKG_ATTR_AUTHENTICATION_ID = 20;
  static const ULONG SECPKG_ATTR_LOGOFF_TIME = 21;
  static const ULONG SECPKG_ATTR_NEGO_KEYS = 22;
  static const ULONG SECPKG_ATTR_PROMPTING_NEEDED = 24;
  static const ULONG SECPKG_ATTR_UNIQUE_BINDINGS = 25;
  static const ULONG SECPKG_ATTR_ENDPOINT_BINDINGS = 26;
  static const ULONG SECPKG_ATTR_CLIENT_SPECIFIED_TARGET = 27;
  static const ULONG SECPKG_ATTR_LAST_CLIENT_TOKEN_STATUS = 30;
  static const ULONG SECPKG_ATTR_NEGO_PKG_INFO = 31;
  static const ULONG SECPKG_ATTR_NEGO_STATUS = 32;
  static const ULONG SECPKG_ATTR_CONTEXT_DELETED = 33;
  static const ULONG SECPKG_ATTR_ISSUER_LIST = 0x50;
  static const ULONG SECPKG_ATTR_REMOTE_CRED = 0x51;
  static const ULONG SECPKG_ATTR_LOCAL_CRED = 0x52;
  static const ULONG SECPKG_ATTR_REMOTE_CERT_CONTEXT = 0x53;
  static const ULONG SECPKG_ATTR_LOCAL_CERT_CONTEXT = 0x54;
  static const ULONG SECPKG_ATTR_ROOT_STORE = 0x55;
  static const ULONG SECPKG_ATTR_SUPPORTED_ALGS = 0x56;
  static const ULONG SECPKG_ATTR_CIPHER_STRENGTHS = 0x57;
  static const ULONG SECPKG_ATTR_SUPPORTED_PROTOCOLS = 0x58;
  static const ULONG SECPKG_ATTR_ISSUER_LIST_EX = 0x59;
  static const ULONG SECPKG_ATTR_CONNECTION_INFO = 0x5a;
  static const ULONG SECPKG_ATTR_EAP_KEY_BLOCK = 0x5b;
  static const ULONG SECPKG_ATTR_MAPPED_CRED_ATTR = 0x5c;
  static const ULONG SECPKG_ATTR_SESSION_INFO = 0x5d;
  static const ULONG SECPKG_ATTR_APP_DATA = 0x5e;
  static const ULONG SECPKG_ATTR_REMOTE_CERTIFICATES = 0x5F;
  static const ULONG SECPKG_ATTR_CLIENT_CERT_POLICY = 0x60;
  static const ULONG SECPKG_ATTR_CC_POLICY_RESULT = 0x61;
  static const ULONG SECPKG_ATTR_USE_NCRYPT = 0x62;
  static const ULONG SECPKG_ATTR_LOCAL_CERT_INFO = 0x63;
  static const ULONG SECPKG_ATTR_CIPHER_INFO = 0x64;
  static const ULONG SECPKG_ATTR_EAP_PRF_INFO = 0x65;
  static const ULONG SECPKG_ATTR_SUPPORTED_SIGNATURES = 0x66;
  static const ULONG SECPKG_ATTR_SUBJECT_SECURITY_ATTRIBUTES = 128;
  BOOLEAN                GetComputerObjectName(                 EXTENDED_NAME_FORMAT NameFormat, LPTSTR lpNameBuffer, PULONG lpnSize);
  BOOLEAN                GetUserNameEx(                         EXTENDED_NAME_FORMAT NameFormat, LPTSTR lpNameBuffer, PULONG lpnSize);
  BOOLEAN                TranslateName(                         LPCTSTR lpAccountName, EXTENDED_NAME_FORMAT AccountNameFormat, EXTENDED_NAME_FORMAT DesiredNameFormat, LPTSTR lpTranslatedName, PULONG nSize);
  SECURITY_STATUS        EnumerateSecurityPackages(             PULONG pcPackages, PSecPkgInfo* ppPackageInfo);
  PSecurityFunctionTable InitSecurityInterface(                 );
  SECURITY_STATUS        QuerySecurityPackageInfo(              SEC_CHAR* pszPackageName, PSecPkgInfo* ppPackageInfo);
  SECURITY_STATUS        AcquireCredentialsHandle(              SEC_CHAR* pszPrincipal, SEC_CHAR* pszPackage, WINAPI_SecCredentialUse fCredentialUse, PLUID pvLogonID, PVOID pAuthData, SEC_GET_KEY_FN pGetKeyFn, PVOID pvGetKeyArgument, PCredHandle phCredential, PTimeStamp ptsExpiry);
  SECURITY_STATUS        ExportSecurityContext(                 PCtxtHandle phContext, Ulong fFlags, PSecBuffer pPackedContext, HANDLE* pToken);
  SECURITY_STATUS        FreeCredentialsHandle(                 PCredHandle phCredential);
  SECURITY_STATUS        ImportSecurityContext(                 PSECURITY_STRING pszPackage, PSecBuffer pPackedContext, HANDLE pToken, PCtxtHandle phContext);
  SECURITY_STATUS        QueryCredentialsAttributes(            PCredHandle phCredential, ULONG ulAttribute, PVOID pBuffer);
  SECURITY_STATUS        AcceptSecurityContext(                 PCredHandle phCredential, PCtxtHandle phContext, PSecBufferDesc pInput, WINAPI_AcceptSecurityContextRequestFlags fContextReq, ULONG TargetDataRep, PCtxtHandle phNewContext, PSecBufferDesc pOutput, WINAPI_AcceptSecurityContextRetFlags* pfContextAttr, PTimeStamp ptsTimeStamp);
  SECURITY_STATUS        ApplyControlToken(                     PCtxtHandle phContext, PSecBufferDesc pInput);
  SECURITY_STATUS        CompleteAuthToken(                     PCtxtHandle phContext, PSecBufferDesc pToken);
  SECURITY_STATUS        DeleteSecurityContext(                 PCtxtHandle phContext);
  SECURITY_STATUS        FreeContextBuffer(                     PVOID pvContextBuffer);
  SECURITY_STATUS        ImpersonateSecurityContext(            PCtxtHandle phContext);
  SECURITY_STATUS        InitializeSecurityContext(             PCredHandle phCredential, PCtxtHandle phContext, SEC_CHAR* pszTargetName, WINAPI_InitializeSecurityContextRequestFlags fContextReq, ULONG Reserved1, ULONG TargetDataRep, PSecBufferDesc pInput, ULONG Reserved2, PCtxtHandle phNewContext, PSecBufferDesc pOutput, WINAPI_InitializeSecurityContextRetFlags* pfContextAttr, PTimeStamp ptsExpiry);
  SECURITY_STATUS        QueryContextAttributes(                PCtxtHandle phContext, WINAPI_SecContextAttr ulAttribute, PVOID pBuffer);
  SECURITY_STATUS        QuerySecurityContextToken(             PCtxtHandle phContext, HANDLE* phToken);
  SECURITY_STATUS        SetContextAttributes(                  PCtxtHandle phContext, WINAPI_SecContextAttr ulAttribute, void* pBuffer, ULONG cbBuffer);
  SECURITY_STATUS        RevertSecurityContext(                 PCtxtHandle phContext);
  SECURITY_STATUS        DecryptMessage(                        PCtxtHandle phContext, PSecBufferDesc pMessage, ULONG MessageSeqNo, PULONG pfQOP);
  SECURITY_STATUS        EncryptMessage(                        PCtxtHandle phContext, ULONG fQOP, PSecBufferDesc pMessage, ULONG MessageSeqNo);
  SECURITY_STATUS        MakeSignature(                         PCtxtHandle phContext, ULONG fQOP, PSecBufferDesc pMessage, ULONG MessageSeqNo);
  SECURITY_STATUS        VerifySignature(                       PCtxtHandle phContext, PSecBufferDesc pMessage, ULONG MessageSeqNo, PULONG pfQOP);
  NTSTATUS               LsaCallAuthenticationPackage(          HANDLE LsaHandle, ULONG AuthenticationPackage, PVOID ProtocolSubmitBuffer, ULONG SubmitBufferLength, PVOID* ProtocolReturnBuffer, PULONG ReturnBufferLength, PNTSTATUS ProtocolStatus);
  NTSTATUS               LsaConnectUntrusted(                   PHANDLE LsaHandle);
  NTSTATUS               LsaDeregisterLogonProcess(             HANDLE LsaHandle);
  NTSTATUS               LsaEnumerateLogonSessions(             PULONG LogonSessionCount, PLUID* LogonSessionList);
  NTSTATUS               LsaFreeReturnBuffer(                   PVOID Buffer);
  NTSTATUS               LsaGetLogonSessionData(                PLUID LogonId, PSECURITY_LOGON_SESSION_DATA* ppLogonSessionData);
  NTSTATUS               LsaLogonUser(                          HANDLE LsaHandle, PLSA_STRING OriginName, SECURITY_LOGON_TYPE LogonType, ULONG AuthenticationPackage, PVOID AuthenticationInformation, ULONG AuthenticationInformationLength, PTOKEN_GROUPS LocalGroups, PTOKEN_SOURCE SourceContext, PVOID* ProfileBuffer, PULONG ProfileBufferLength, PLUID LogonId, PHANDLE Token, PQUOTA_LIMITS Quotas, PNTSTATUS SubStatus);
  NTSTATUS               LsaLookupAuthenticationPackage(        HANDLE LsaHandle, PLSA_STRING PackageName, PULONG AuthenticationPackage);
  NTSTATUS               LsaRegisterLogonProcess(               PLSA_STRING LogonProcessName, PHANDLE LsaHandle, PLSA_OPERATIONAL_MODE SecurityMode);
  SECURITY_STATUS        SaslAcceptSecurityContext(             PCredHandle phCredential, PCtxtHandle phContext, PSecBufferDesc pInput, WINAPI_AcceptSecurityContextRequestFlags fContextReq, unsigned long TargetDataRep, PCtxtHandle phNewContext, PSecBufferDesc pOutput, WINAPI_AcceptSecurityContextRetFlags* pfContextAttr, PTimeStamp ptsExpiry);
  SECURITY_STATUS        SaslEnumerateProfiles(                 LPTSTR* ProfileList, ULONG* ProfileCount);
  SECURITY_STATUS        SaslGetContextOption(                  PCtxtHandle ContextHandle, ULONG Option, PVOID Value, ULONG Size, PULONG Needed);
  SECURITY_STATUS        SaslGetProfilePackage(                 LPTSTR ProfileName, PSecPkgInfo* PackageInfo);
  SECURITY_STATUS        SaslIdentifyPackage(                   PSecBufferDesc pInput, PSecPkgInfo* PackageInfo);
  SECURITY_STATUS        SaslInitializeSecurityContext(         PCredHandle phCredential, PCtxtHandle phContext, LPTSTR pszTargetName, WINAPI_InitializeSecurityContextRequestFlags fContextReq, unsigned long Reserved1, unsigned long TargetDataRep, PSecBufferDesc pInput, unsigned long Reserved2, PCtxtHandle phNewContext, PSecBufferDesc pOutput, WINAPI_InitializeSecurityContextRetFlags_unsigned_long* pfContextAttr, PTimeStamp ptsExpiry);
  SECURITY_STATUS        SaslSetContextOption(                  PCtxtHandle ContextHandle, ULONG Option, PVOID Value, ULONG Size);
  SECURITY_STATUS        AddSecurityPackage(                    LPTSTR pszPackageName, PSECURITY_PACKAGE_OPTIONS pOptions);
  SECURITY_STATUS        ChangeAccountPassword(                 SEC_WCHAR* pszPackageName, SEC_WCHAR* pszDomainName, SEC_WCHAR* pszAccountName, SEC_WCHAR* pszOldPassword, SEC_WCHAR* pszNewPassword, BOOLEAN bImpersonating, unsigned long dwReserved, PSecBufferDesc pOutput);
  SECURITY_STATUS        DeleteSecurityPackage(                 LPTSTR pszPackageName);
  NTSTATUS               LsaRegisterPolicyChangeNotification(   POLICY_NOTIFICATION_INFORMATION_CLASS InformationClass, HANDLE NotificationEventHandle);
  NTSTATUS               LsaUnregisterPolicyChangeNotification( POLICY_NOTIFICATION_INFORMATION_CLASS InformationClass, HANDLE NotificationEventHandle);
]]
return ffi.load( 'Secur32.dll' )

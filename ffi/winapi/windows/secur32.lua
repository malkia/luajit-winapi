require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/security" )
local ffi = require( "ffi" )
ffi.cdef [[
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
return ffi.load( "Secur32.dll" )

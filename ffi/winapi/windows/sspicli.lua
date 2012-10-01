require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/security" )
local ffi = require( "ffi" )
ffi.cdef [[
  SECURITY_STATUS SspiCompareAuthIdentities(       PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthIdentity1, PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthIdentity2, PBOOLEAN SameSuppliedUser, PBOOLEAN SameSuppliedIdentity);
  SECURITY_STATUS SspiCopyAuthIdentity(            PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthData, PSEC_WINNT_AUTH_IDENTITY_OPAQUE* AuthDataCopy);
  SECURITY_STATUS SspiDecryptAuthIdentity(         PSEC_WINNT_AUTH_IDENTITY_OPAQUE EncryptedAuthData);
  SECURITY_STATUS SspiEncodeAuthIdentityAsStrings( PSEC_WINNT_AUTH_IDENTITY_OPAQUE pAuthIdentity, PCWSTR* ppszUserName, PCWSTR* ppszDomainName, PCWSTR* ppszPackedCredentialsString);
  SECURITY_STATUS SspiEncodeStringsAsAuthIdentity( PCWSTR pszUserName, PCWSTR pszDomainName, PCWSTR pszPackedCredentialsString, PSEC_WINNT_AUTH_IDENTITY_OPAQUE* ppAuthIdentity);
  SECURITY_STATUS SspiEncryptAuthIdentity(         PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthData);
  SECURITY_STATUS SspiExcludePackage(              PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthIdentity, PCWSTR pszPackageName, PSEC_WINNT_AUTH_IDENTITY_OPAQUE* ppNewAuthIdentity);
  SECURITY_STATUS SspiFreeAuthIdentity(            PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthData);
  SECURITY_STATUS SspiGetTargetHostName(           PCWSTR pszTargetName, PWSTR* pszHostName);
  BOOLEAN         SspiIsAuthIdentityEncrypted(     PSEC_WINNT_AUTH_IDENTITY_OPAQUE EncryptedAuthData);
  VOID            SspiLocalFree(                   PVOID DataBuffer);
  SECURITY_STATUS SspiMarshalAuthIdentity(         PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthIdentity, unsigned long* AuthIdentityLength, unsigned long* AuthIdentityByteArray);
  SECURITY_STATUS SspiPrepareForCredRead(          PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthIdentity, PCWSTR pszTargetName, PULONG pCredmanCredentialType, PCWSTR* ppszCredmanTargetName);
  SECURITY_STATUS SspiPrepareForCredWrite(         PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthIdentity, PCWSTR pszTargetName, PULONG pCredmanCredentialType, PCWSTR* ppszCredmanTargetName, PCWSTR* ppszCredmanUserName, PUCHAR* ppCredentialBlob, PULONG pCredentialBlobSize);
  SECURITY_STATUS SspiUnmarshalAuthIdentity(       unsigned long AuthIdentityLength, char* AuthIdentityByteArray, PSEC_WINNT_AUTH_IDENTITY_OPAQUE* ppAuthIdentity);
  SECURITY_STATUS SspiValidateAuthIdentity(        PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthData);
  SECURITY_STATUS SspiZeroAuthIdentity(            PSEC_WINNT_AUTH_IDENTITY_OPAQUE AuthData);
]]
return ffi.load( "SspiCli.dll" )

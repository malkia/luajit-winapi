require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/security" )
local ffi = require( "ffi" )
ffi.cdef [[
  WINAPI_ERROR_CODE CredUICmdLinePromptForCredentials( PCTSTR pszTargetName, PCtxtHandle Reserved, DWORD dwAuthError, PTSTR pszUserName, ULONG ulUserNameMaxChars, PTSTR pszPassword, ULONG ulPasswordMaxChars, PBOOL pfSave, WINAPI_CredUIFlags dwFlags);
  WINAPI_ERROR_CODE CredUIConfirmCredentials(          PCTSTR pszTargetName, BOOL bConfirm);
  WINAPI_ERROR_CODE CredUIParseUserName(               PCTSTR pszUserName, PTSTR pszUser, ULONG ulUserMaxChars, PTSTR pszDomain, ULONG ulDomainMaxChars);
  WINAPI_ERROR_CODE CredUIPromptForCredentials(        PCREDUI_INFO pUiInfo, PCTSTR pszTargetName, PCtxtHandle Reserved, DWORD dwAuthError, PCTSTR pszUserName, ULONG ulUserNameMaxChars, PCTSTR pszPassword, ULONG ulPasswordMaxChars, PBOOL pfSave, WINAPI_CredUIFlags dwFlags);
  WINAPI_ERROR_CODE CredUIPromptForWindowsCredentials( PCREDUI_INFO pUiInfo, DWORD dwAuthError, ULONG* pulAuthPackage, LPCVOID pvInAuthBuffer, ULONG ulInAuthBufferSize, LPVOID* ppvOutAuthBuffer, ULONG* pulOutAuthBufferSize, BOOL* pfSave, DWORD dwFlags);
  WINAPI_ERROR_CODE CredUIReadSSOCredW(                PCWSTR pszRealm, PWSTR* ppszUsername);
  WINAPI_ERROR_CODE CredUIStoreSSOCredW(               PCWSTR pszRealm, PCWSTR pszUsername, PCWSTR pszPassword, BOOL bPersist);
  BOOL              CredPackAuthenticationBuffer(      DWORD dwFlags, LPTSTR pszUserName, LPTSTR pszPassword, PBYTE pPackedCredentials, DWORD* pcbPackedCredentials);
  BOOL              CredUnPackAuthenticationBuffer(    DWORD dwFlags, PVOID pAuthBuffer, DWORD cbAuthBuffer, LPTSTR pszUserName, DWORD* pcchMaxUserName, LPTSTR pszDomainName, DWORD* pcchMaxDomainame, LPTSTR pszPassword, DWORD* pcchMaxPassword);
  SECURITY_STATUS   SspiGetCredUIContext(              HANDLE ContextHandle, GUID* CredType, LUID* LogonId, PSEC_WINNT_CREDUI_CONTEXT_VECTOR* CredUIContexts, HANDLE* TokenHandle);
  BOOLEAN           SspiIsPromptingNeeded(             unsigned long ErrorOrNtStatus);
  SECURITY_STATUS   SspiPromptForCredentials(          PCTSTR pszTargetName, PCREDUI_INFOW pUiInfo, DWORD dwAuthError, PCTSTR pszPackage, PSEC_WINNT_AUTH_IDENTITY_OPAQUE pInputAuthIdentity, PSEC_WINNT_AUTH_IDENTITY_OPAQUE* ppAuthIdentity, PBOOL pfSave, DWORD dwFlags);
  SECURITY_STATUS   SspiUnmarshalCredUIContext(        PUCHAR MarshaledCredUIContext, ULONG MarshaledCredUIContextLength, PSEC_WINNT_CREDUI_CONTEXT* CredUIContext);
  SECURITY_STATUS   SspiUpdateCredentials(             HANDLE ContextHandle, GUID* CredType, ULONG FlatCredUIContextLength, PUCHAR FlatCredUIContext);
]]
return ffi.load( "Credui.dll" )

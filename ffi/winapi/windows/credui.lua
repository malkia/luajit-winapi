require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/security' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef DWORD CredUIFlags; //Alias
  typedef struct CREDUI_INFO {
    DWORD cbSize;
    HWND hwndParent;
    PCTSTR pszMessageText;
    PCTSTR pszCaptionText;
    HBITMAP hbmBanner;
  } CREDUI_INFO;
  typedef CREDUI_INFO *PCREDUI_INFO; //Pointer
  typedef struct SEC_WINNT_CREDUI_CONTEXT_VECTOR {
    ULONG CredUIContextArrayOffset;
    USHORT CredUIContextCount;
  } SEC_WINNT_CREDUI_CONTEXT_VECTOR;
  typedef SEC_WINNT_CREDUI_CONTEXT_VECTOR *PSEC_WINNT_CREDUI_CONTEXT_VECTOR; //Pointer
  typedef struct CREDUI_INFOW {
    DWORD cbSize;
    HWND hwndParent;
    PCWSTR pszMessageText;
    PCWSTR pszCaptionText;
    HBITMAP hbmBanner;
  } CREDUI_INFOW;
  typedef CREDUI_INFOW *PCREDUI_INFOW; //Pointer
  typedef struct SEC_WINNT_CREDUI_CONTEXT {
    USHORT cbHeaderLength;
    HANDLE CredUIContextHandle;
    PCREDUI_INFOW UIInfo;
    ULONG dwAuthError;
    PSEC_WINNT_AUTH_IDENTITY_OPAQUE pInputAuthIdentity;
    PUNICODE_STRING TargetName;
  } SEC_WINNT_CREDUI_CONTEXT;
  typedef SEC_WINNT_CREDUI_CONTEXT *PSEC_WINNT_CREDUI_CONTEXT; //Pointer
  ERROR_CODE      CredUICmdLinePromptForCredentials( PCTSTR pszTargetName, PCtxtHandle Reserved, DWORD dwAuthError, PTSTR pszUserName, ULONG ulUserNameMaxChars, PTSTR pszPassword, ULONG ulPasswordMaxChars, PBOOL pfSave, CredUIFlags dwFlags);
  ERROR_CODE      CredUIConfirmCredentials(          PCTSTR pszTargetName, BOOL bConfirm);
  ERROR_CODE      CredUIParseUserName(               PCTSTR pszUserName, PTSTR pszUser, ULONG ulUserMaxChars, PTSTR pszDomain, ULONG ulDomainMaxChars);
  ERROR_CODE      CredUIPromptForCredentials(        PCREDUI_INFO pUiInfo, PCTSTR pszTargetName, PCtxtHandle Reserved, DWORD dwAuthError, PCTSTR pszUserName, ULONG ulUserNameMaxChars, PCTSTR pszPassword, ULONG ulPasswordMaxChars, PBOOL pfSave, CredUIFlags dwFlags);
  ERROR_CODE      CredUIPromptForWindowsCredentials( PCREDUI_INFO pUiInfo, DWORD dwAuthError, ULONG* pulAuthPackage, LPCVOID pvInAuthBuffer, ULONG ulInAuthBufferSize, LPVOID* ppvOutAuthBuffer, ULONG* pulOutAuthBufferSize, BOOL* pfSave, DWORD dwFlags);
  ERROR_CODE      CredUIReadSSOCredW(                PCWSTR pszRealm, PWSTR* ppszUsername);
  ERROR_CODE      CredUIStoreSSOCredW(               PCWSTR pszRealm, PCWSTR pszUsername, PCWSTR pszPassword, BOOL bPersist);
  BOOL            CredPackAuthenticationBuffer(      DWORD dwFlags, LPTSTR pszUserName, LPTSTR pszPassword, PBYTE pPackedCredentials, DWORD* pcbPackedCredentials);
  BOOL            CredUnPackAuthenticationBuffer(    DWORD dwFlags, PVOID pAuthBuffer, DWORD cbAuthBuffer, LPTSTR pszUserName, DWORD* pcchMaxUserName, LPTSTR pszDomainName, DWORD* pcchMaxDomainame, LPTSTR pszPassword, DWORD* pcchMaxPassword);
  SECURITY_STATUS SspiGetCredUIContext(              HANDLE ContextHandle, GUID* CredType, LUID* LogonId, PSEC_WINNT_CREDUI_CONTEXT_VECTOR* CredUIContexts, HANDLE* TokenHandle);
  BOOLEAN         SspiIsPromptingNeeded(             unsigned long ErrorOrNtStatus);
  SECURITY_STATUS SspiPromptForCredentials(          PCTSTR pszTargetName, PCREDUI_INFOW pUiInfo, DWORD dwAuthError, PCTSTR pszPackage, PSEC_WINNT_AUTH_IDENTITY_OPAQUE pInputAuthIdentity, PSEC_WINNT_AUTH_IDENTITY_OPAQUE* ppAuthIdentity, PBOOL pfSave, DWORD dwFlags);
  SECURITY_STATUS SspiUnmarshalCredUIContext(        PUCHAR MarshaledCredUIContext, ULONG MarshaledCredUIContextLength, PSEC_WINNT_CREDUI_CONTEXT* CredUIContext);
  SECURITY_STATUS SspiUpdateCredentials(             HANDLE ContextHandle, GUID* CredType, ULONG FlatCredUIContextLength, PUCHAR FlatCredUIContext);
]]
ffi.load( 'Credui.dll' )

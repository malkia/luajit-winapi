require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/cryptography' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HRESULT SignerFreeSignerContext(               SIGNER_CONTEXT* pSignerContext);
  HRESULT SignerSignEx(                          SPC_PE dwFlags, SIGNER_SUBJECT_INFO* pSubjectInfo, SIGNER_CERT* pSignerCert, SIGNER_SIGNATURE_INFO* pSignatureInfo, SIGNER_PROVIDER_INFO* pProviderInfo, LPCWSTR pwszHttpTimeStamp, PCRYPT_ATTRIBUTES psRequest, LPVOID pSipData, SIGNER_CONTEXT** ppSignerContext);
  HRESULT SignError(                             );
  HRESULT SignerSign(                            SIGNER_SUBJECT_INFO* pSubjectInfo, SIGNER_CERT* pSignerCert, SIGNER_SIGNATURE_INFO* pSignatureInfo, SIGNER_PROVIDER_INFO* pProviderInfo, LPCWSTR pwszHttpTimeStamp, PCRYPT_ATTRIBUTES psRequest, LPVOID pSipData);
  HRESULT SignerTimeStamp(                       SIGNER_SUBJECT_INFO* pSubjectInfo, LPCWSTR pwszHttpTimeStamp, PCRYPT_ATTRIBUTES psRequest, LPVOID pSipData);
  HRESULT SignerTimeStampEx2(                    DWORD dwFlags, SIGNER_SUBJECT_INFO* pSubjectInfo, LPCWSTR pwszHttpTimeStamp, ALG_ID dwAlgId, PCRYPT_ATTRIBUTES psRequest, LPVOID pSipData, SIGNER_CONTEXT** ppSignerContext);
  HRESULT SignerTimeStampEx(                     DWORD dwFlags, SIGNER_SUBJECT_INFO* pSubjectInfo, LPCWSTR pwszHttpTimeStamp, PCRYPT_ATTRIBUTES psRequest, LPVOID pSipData, SIGNER_CONTEXT** ppSignerContext);
  void    FreeCryptProvFromCertEx(               BOOL fAcquired, HCRYPTPROV_OR_NCRYPT_KEY_HANDLE hProv, DWORD dwKeySpec, LPWSTR pwszCapiProvider, DWORD dwProviderType, LPWSTR pwszTmpContainer);
  void    FreeCryptProvFromCert(                 BOOL fAcquired, HCRYPTPROV hProv, LPWSTR pwszCapiProvider, DWORD dwProviderType, LPWSTR pwszTmpContainer);
  BOOL    GetCryptProvFromCert(                  HWND hwnd, PCCERT_CONTEXT pCert, HCRYPTPROV* phCryptProv, DWORD* pdwKeySpec, BOOL* pfDidCryptAcquire, LPWSTR* ppwszTmpContainer, LPWSTR* ppwszProviderName, DWORD* pdwProviderType);
  void    PvkFreeCryptProv(                      HCRYPTPROV hProv, LPCWSTR pwszCapiProvider, DWORD dwProviderType, LPWSTR pwszTmpContainer);
  HRESULT PvkGetCryptProv(                       HWND hwnd, LPCWSTR pwszCaption, LPCWSTR pwszCapiProvider, DWORD dwProviderType, LPCWSTR pwszPvkFile, LPCWSTR pwszKeyContainerName, DWORD* pdwKeySpec, LPWSTR* ppwszTmpContainer, HCRYPTPROV* phCryptProv);
  BOOL    PvkPrivateKeyAcquireContextFromMemory( LPCWSTR pwszProvName, CryptProv dwProvType, BYTE* pbData, DWORD cbData, HWND hwndOwner, LPCWSTR pwszKeyName, DWORD* pdwKeySpec, HCRYPTPROV* phCryptProv, LPTSTR* ppwszTmpContainer);
  BOOL    PvkPrivateKeySave(                     HCRYPTPROV hCryptProv, HANDLE hFile, DWORD dwKeySpec, HWND hwndOwner, LPCWSTR pwszKeyName, DWORD dwFlags);
]]
ffi.load( 'Mssign32.dll' )

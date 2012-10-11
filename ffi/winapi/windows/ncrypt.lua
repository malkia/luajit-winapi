require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/cryptography' )
require( 'ffi/winapi/headers/security' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef ULONG_PTR NCRYPT_HANDLE; //Alias
  typedef ULONG_PTR NCRYPT_PROV_HANDLE; //Alias
  typedef ULONG_PTR NCRYPT_SECRET_HANDLE; //Alias
  typedef ULONG_PTR NCRYPT_HASH_HANDLE; //Alias
  typedef BCryptBufferDesc NCryptBufferDesc; //Alias
  typedef NCryptBufferDesc *PNCryptBufferDesc; //Pointer
  typedef WCHAR* WCHAR[NCRYPT_SSL_MAX_NAME_SIZE]; //Alias
  typedef struct NCryptAlgorithmName {
    LPWSTR pszName;
    DWORD dwClass;
    DWORD dwAlgOperations;
    DWORD dwFlags;
  } NCryptAlgorithmName;
  typedef struct NCryptKeyName {
    LPWSTR pszName;
    LPWSTR pszAlgid;
    DWORD dwLegacyKeySpec;
    DWORD dwFlags;
  } NCryptKeyName;
  typedef struct NCryptProviderName {
    LPWSTR pszName;
    LPWSTR pszComment;
  } NCryptProviderName;
  typedef DWORD WINAPI_SslContentType; //Alias
  static const WINAPI_SslContentType CT_CHANGE_CIPHER_SPEC = 20;
  static const WINAPI_SslContentType CT_ALERT = 21;
  static const WINAPI_SslContentType CT_HANDSHAKE = 22;
  static const WINAPI_SslContentType CT_APPLICATIONDATA = 23;
  SECURITY_STATUS NCryptCreatePersistedKey(           NCRYPT_PROV_HANDLE hProvider, NCRYPT_KEY_HANDLE* phKey, LPCWSTR pszAlgId, LPCWSTR pszKeyName, DWORD dwLegacyKeySpec, DWORD dwFlags);
  SECURITY_STATUS NCryptDecrypt(                      NCRYPT_KEY_HANDLE hKey, PBYTE pbInput, DWORD cbInput, VOID* pPaddingInfo, PBYTE pbOutput, DWORD cbOutput, DWORD* pcbResult, DWORD dwFlags);
  SECURITY_STATUS NCryptDeleteKey(                    NCRYPT_KEY_HANDLE hKey, DWORD dwFlags);
  SECURITY_STATUS NCryptDeriveKey(                    NCRYPT_SECRET_HANDLE hSharedSecret, LPCWSTR pwszKDF, NCryptBufferDesc* pParameterList, PBYTE pbDerivedKey, DWORD cbDerivedKey, DWORD* pcbResult, ULONG dwFlags);
  SECURITY_STATUS NCryptEncrypt(                      NCRYPT_KEY_HANDLE hKey, PBYTE pbInput, DWORD cbInput, VOID* pPaddingInfo, PBYTE pbOutput, DWORD cbOutput, DWORD* pcbResult, DWORD dwFlags);
  SECURITY_STATUS NCryptEnumAlgorithms(               NCRYPT_PROV_HANDLE hProvider, DWORD dwAlgOperations, DWORD* pdwAlgCount, NCryptAlgorithmName** ppAlgList, DWORD dwFlags);
  SECURITY_STATUS NCryptEnumKeys(                     NCRYPT_PROV_HANDLE hProvider, LPCWSTR pszScope, NCryptKeyName** ppKeyName, PVOID* ppEnumState, DWORD dwFlags);
  SECURITY_STATUS NCryptEnumStorageProviders(         DWORD* pdwProviderCount, NCryptProviderName** ppProviderList, DWORD dwFlags);
  SECURITY_STATUS NCryptExportKey(                    NCRYPT_KEY_HANDLE hKey, NCRYPT_KEY_HANDLE hExportKey, LPCWSTR pszBlobType, NCryptBufferDesc* pParameterList, PBYTE pbOutput, DWORD cbOutput, DWORD* pcbResult, DWORD dwFlags);
  SECURITY_STATUS NCryptFinalizeKey(                  NCRYPT_KEY_HANDLE hKey, DWORD dwFlags);
  SECURITY_STATUS NCryptFreeBuffer(                   PVOID pvInput);
  SECURITY_STATUS NCryptFreeObject(                   NCRYPT_HANDLE hObject);
  SECURITY_STATUS NCryptGetProperty(                  NCRYPT_HANDLE hObject, LPCWSTR pszProperty, PBYTE pbOutput, DWORD cbOutput, DWORD* pcbResult, DWORD dwFlags);
  SECURITY_STATUS NCryptImportKey(                    NCRYPT_PROV_HANDLE hProvider, NCRYPT_KEY_HANDLE hImportKey, LPCWSTR pszBlobType, NCryptBufferDesc* pParameterList, NCRYPT_KEY_HANDLE* phKey, PBYTE pbData, DWORD cbData, DWORD dwFlags);
  SECURITY_STATUS NCryptIsAlgSupported(               NCRYPT_PROV_HANDLE hProvider, LPCWSTR pszAlgId, DWORD dwFlags);
  BOOL            NCryptIsKeyHandle(                  NCRYPT_KEY_HANDLE hKey);
  SECURITY_STATUS NCryptNotifyChangeKey(              NCRYPT_PROV_HANDLE hProvider, HANDLE* phEvent, DWORD dwFlags);
  SECURITY_STATUS NCryptOpenKey(                      NCRYPT_PROV_HANDLE hProvider, NCRYPT_KEY_HANDLE* phKey, LPCWSTR pszKeyName, DWORD dwLegacyKeySpec, DWORD dwFlags);
  SECURITY_STATUS NCryptOpenStorageProvider(          NCRYPT_PROV_HANDLE* phProvider, LPCWSTR pszProviderName, DWORD dwFlags);
  SECURITY_STATUS NCryptSecretAgreement(              NCRYPT_KEY_HANDLE hPrivKey, NCRYPT_KEY_HANDLE hPubKey, NCRYPT_SECRET_HANDLE* phSecret, DWORD dwFlags);
  SECURITY_STATUS NCryptSetProperty(                  NCRYPT_HANDLE hObject, LPCWSTR pszProperty, PBYTE pbInput, DWORD cbInput, DWORD dwFlags);
  SECURITY_STATUS NCryptSignHash(                     NCRYPT_KEY_HANDLE hKey, VOID* pPaddingInfo, PBYTE pbHashValue, DWORD cbHashValue, PBYTE pbSignature, DWORD cbSignature, DWORD* pcbResult, DWORD dwFlags);
  SECURITY_STATUS NCryptTranslateHandle(              NCRYPT_PROV_HANDLE* phProvider, NCRYPT_KEY_HANDLE* phKey, HCRYPTPROV hLegacyProv, HCRYPTKEY hLegacyKey, DWORD dwLegacyKeySpec, DWORD dwFlags);
  SECURITY_STATUS NCryptVerifySignature(              NCRYPT_KEY_HANDLE hKey, VOID* pPaddingInfo, PBYTE pbHashValue, DWORD cbHashValue, PBYTE pbSignature, DWORD cbSignature, DWORD dwFlags);
  SECURITY_STATUS SslChangeNotify(                    HANDLE hEvent, DWORD dwFlags);
  SECURITY_STATUS SslComputeClientAuthHash(           NCRYPT_PROV_HANDLE hSslProvider, NCRYPT_KEY_HANDLE hMasterKey, NCRYPT_HASH_HANDLE hHandshakeHash, LPCWSTR pszAlgId, PBYTE pbOutput, DWORD cbOutput, DWORD* pcbResult, DWORD dwFlags);
  SECURITY_STATUS SslComputeEapKeyBlock(              NCRYPT_PROV_HANDLE hSslProvider, NCRYPT_KEY_HANDLE hMasterKey, PBYTE pbRandoms, DWORD cbRandoms, PBYTE pbOutput, DWORD cbOutput, DWORD* pcbResult, DWORD dwFlags);
  SECURITY_STATUS SslComputeFinishedHash(             NCRYPT_PROV_HANDLE hSslProvider, NCRYPT_KEY_HANDLE hMasterKey, NCRYPT_HASH_HANDLE hHandshakeHash, PBYTE pbOutput, DWORD cbOutput, DWORD dwFlags);
  SECURITY_STATUS SslCreateClientAuthHash(            NCRYPT_PROV_HANDLE hSslProvider, NCRYPT_HASH_HANDLE* phHandshakeHash, DWORD dwProtocol, DWORD dwCipherSuite, LPCWSTR pszHashAlgId, DWORD dwFlags);
  SECURITY_STATUS SslCreateEphemeralKey(              NCRYPT_PROV_HANDLE hSslProvider, NCRYPT_KEY_HANDLE* phEphemeralKey, DWORD dwProtocol, DWORD dwCipherSuite, DWORD dwKeyType, DWORD dwKeyBitLen, PBYTE pbParams, DWORD cbParams, DWORD dwFlags);
  SECURITY_STATUS SslCreateHandshakeHash(             NCRYPT_PROV_HANDLE hSslProvider, NCRYPT_HASH_HANDLE* phHandshakeHash, DWORD dwProtocol, DWORD dwCipherSuite, DWORD dwFlags);
  SECURITY_STATUS SslDecrementProviderReferenceCount( NCRYPT_PROV_HANDLE hSslProvider);
  SECURITY_STATUS SslDecryptPacket(                   NCRYPT_PROV_HANDLE hSslProvider, NCRYPT_KEY_HANDLE hKey, PBYTE pbInput, DWORD cbInput, PBYTE pbOutput, DWORD cbOutput, DWORD* pcbResult, ULONGLONG SequenceNumber, DWORD dwFlags);
  SECURITY_STATUS SslEncryptPacket(                   NCRYPT_PROV_HANDLE hSslProvider, NCRYPT_KEY_HANDLE hKey, PBYTE pbInput, DWORD cbInput, PBYTE pbOutput, DWORD cbOutput, DWORD* pcbResult, ULONGLONG SequenceNumber, WINAPI_SslContentType dwContentType, DWORD dwFlags);
  SECURITY_STATUS SslEnumCipherSuites(                NCRYPT_PROV_HANDLE hSslProvider, NCRYPT_KEY_HANDLE hPrivateKey, NCRYPT_SSL_CIPHER_SUITE** ppCipherSuite, PVOID* ppEnumState, DWORD dwFlags);
  SECURITY_STATUS SslEnumProtocolProviders(           DWORD* pdwProviderCount, NCryptProviderName** ppProviderList, DWORD dwFlags);
  SECURITY_STATUS SslExportKey(                       NCRYPT_PROV_HANDLE hSslProvider, NCRYPT_KEY_HANDLE hKey, LPCWSTR pszBlobType, PBYTE pbOutput, DWORD cbOutput, DWORD* pcbResult, DWORD dwFlags);
  SECURITY_STATUS SslFreeBuffer(                      PVOID pvInput);
  SECURITY_STATUS SslFreeObject(                      NCRYPT_HANDLE hObject, DWORD dwFlags);
  SECURITY_STATUS SslGenerateMasterKey(               NCRYPT_PROV_HANDLE hSslProvider, NCRYPT_KEY_HANDLE hPrivateKey, NCRYPT_KEY_HANDLE hPublicKey, NCRYPT_KEY_HANDLE* phMasterKey, DWORD dwProtocol, DWORD dwCipherSuite, PNCryptBufferDesc pParameterList, PBYTE pbOutput, DWORD cbOutput, DWORD* pcbResult, DWORD dwFlags);
  SECURITY_STATUS SslGenerateSessionKeys(             NCRYPT_PROV_HANDLE hSslProvider, NCRYPT_KEY_HANDLE hMasterKey, NCRYPT_KEY_HANDLE* phReadKey, NCRYPT_KEY_HANDLE* phWriteKey, PNCryptBufferDesc pParameterList, DWORD dwFlags);
  SECURITY_STATUS SslGetCipherSuitePRFHashAlgorithm(  NCRYPT_PROV_HANDLE hSslProvider, DWORD dwProtocol, DWORD dwCipherSuite, DWORD dwKeyType, WCHAR[NCRYPT_SSL_MAX_NAME_SIZE] szPRFHash, DWORD dwFlags);
  SECURITY_STATUS SslGetKeyProperty(                  NCRYPT_KEY_HANDLE hKey, LPCWSTR pszProperty, PBYTE ppbOutput, DWORD* pcbOutput, DWORD dwFlags);
  SECURITY_STATUS SslGetProviderProperty(             NCRYPT_PROV_HANDLE hSslProvider, LPCWSTR pszProperty, PBYTE ppbOutput, DWORD* pcbOutput, PVOID* ppEnumState, DWORD dwFlags);
  SECURITY_STATUS SslHashHandshake(                   NCRYPT_PROV_HANDLE hSslProvider, NCRYPT_HASH_HANDLE hHandshakeHash, PBYTE pbInput, DWORD cbInput, DWORD dwFlags);
  SECURITY_STATUS SslImportKey(                       NCRYPT_PROV_HANDLE hSslProvider, NCRYPT_KEY_HANDLE* phKey, LPCWSTR pszBlobType, PBYTE pbKeyBlob, DWORD cbKeyBlob, DWORD dwFlags);
  SECURITY_STATUS SslImportMasterKey(                 NCRYPT_PROV_HANDLE hSslProvider, NCRYPT_KEY_HANDLE hPrivateKey, NCRYPT_KEY_HANDLE* phMasterKey, DWORD dwProtocol, DWORD dwCipherSuite, PNCryptBufferDesc pParameterList, PBYTE pbEncryptedKey, DWORD cbEncryptedKey, DWORD dwFlags);
  SECURITY_STATUS SslIncrementProviderReferenceCount( NCRYPT_PROV_HANDLE hSslProvider);
  SECURITY_STATUS SslLookupCipherLengths(             NCRYPT_PROV_HANDLE hSslProvider, DWORD dwProtocol, DWORD dwCipherSuite, DWORD dwKeyType, NCRYPT_SSL_CIPHER_LENGTHS* pCipherLengths, DWORD cbCipherLengths, DWORD dwFlags);
  SECURITY_STATUS SslLookupCipherSuiteInfo(           NCRYPT_PROV_HANDLE hSslProvider, DWORD dwProtocol, DWORD dwCipherSuite, DWORD dwKeyType, NCRYPT_SSL_CIPHER_SUITE* pCipherSuite, DWORD dwFlags);
  SECURITY_STATUS SslOpenPrivateKey(                  NCRYPT_PROV_HANDLE hSslProvider, NCRYPT_KEY_HANDLE* phPrivateKey, PCCERT_CONTEXT pCertContext, DWORD dwFlags);
  SECURITY_STATUS SslOpenProvider(                    NCRYPT_PROV_HANDLE* phSslProvider, LPCWSTR pszProviderName, DWORD dwFlags);
  SECURITY_STATUS SslSignHash(                        NCRYPT_PROV_HANDLE hSslProvider, NCRYPT_KEY_HANDLE hPrivateKey, PBYTE pbHashValue, DWORD cbHashValue, PBYTE pbSignature, DWORD cbSignature, DWORD* pcbResult, DWORD dwFlags);
  SECURITY_STATUS SslVerifySignature(                 NCRYPT_PROV_HANDLE hSslProvider, NCRYPT_KEY_HANDLE hPublicKey, PBYTE pbHashValue, DWORD cbHashValue, PBYTE pbSignature, DWORD cbSignature, DWORD dwFlags);
]]
return ffi.load( 'NCrypt.dll' )

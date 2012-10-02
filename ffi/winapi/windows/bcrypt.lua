require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/cryptography' )
local ffi = require( 'ffi' )
ffi.cdef [[
  NTSTATUS BCryptAddContextFunction(                WINAPI_CryptConfigTable dwTable, LPCWSTR pszContext, WINAPI_CryptInterface dwInterface, LPCWSTR pszFunction, WINAPI_CryptPriority dwPosition);
  NTSTATUS BCryptConfigureContext(                  WINAPI_CryptConfigTable dwTable, LPCWSTR pszContext, PCRYPT_CONTEXT_CONFIG pConfig);
  NTSTATUS BCryptConfigureContextFunction(          WINAPI_CryptConfigTable dwTable, LPCWSTR pszContext, WINAPI_CryptInterface dwInterface, LPCWSTR pszFunction, PCRYPT_CONTEXT_FUNCTION_CONFIG pConfig);
  NTSTATUS BCryptCreateContext(                     WINAPI_CryptConfigTable dwTable, LPCWSTR pszContext, PCRYPT_CONTEXT_CONFIG pConfig);
  NTSTATUS BCryptDeleteContext(                     WINAPI_CryptConfigTable dwTable, LPCWSTR pszContext);
  NTSTATUS BCryptEnumAlgorithms(                    WINAPI_CryptOperation dwAlgOperations, ULONG* pAlgCount, BCRYPT_ALGORITHM_IDENTIFIER** ppAlgList, ULONG dwFlags);
  NTSTATUS BCryptEnumContextFunctionProviders(      WINAPI_CryptConfigTable dwTable, LPCWSTR pszContext, WINAPI_CryptInterface dwInterface, LPCWSTR pszFunction, ULONG* pcbBuffer, PCRYPT_CONTEXT_FUNCTION_PROVIDERS* ppBuffer);
  NTSTATUS BCryptEnumContextFunctions(              WINAPI_CryptConfigTable dwTable, LPCWSTR pszContext, WINAPI_CryptInterface dwInterface, ULONG* pcbBuffer, PCRYPT_CONTEXT_FUNCTIONS* ppBuffer);
  NTSTATUS BCryptEnumContexts(                      WINAPI_CryptConfigTable dwTable, ULONG* pcbBuffer, PCRYPT_CONTEXTS* ppBuffer);
  NTSTATUS BCryptEnumProviders(                     LPCWSTR pszAlgId, ULONG* pImplCount, BCRYPT_PROVIDER_NAME** ppImplList, ULONG dwFlags);
  NTSTATUS BCryptEnumRegisteredProviders(           ULONG* pcbBuffer, PCRYPT_PROVIDERS* ppBuffer);
  NTSTATUS BCryptGetFipsAlgorithmMode(              BOOLEAN* pfEnabled);
  NTSTATUS BCryptQueryContextConfiguration(         WINAPI_CryptConfigTable dwTable, LPCWSTR pszContext, ULONG* pcbBuffer, PCRYPT_CONTEXT_CONFIG* ppBuffer);
  NTSTATUS BCryptQueryContextFunctionConfiguration( WINAPI_CryptConfigTable dwTable, LPCWSTR pszContext, WINAPI_CryptInterface dwInterface, LPCWSTR pszFunction, ULONG* pcbBuffer, PCRYPT_CONTEXT_FUNCTION_CONFIG* ppBuffer);
  NTSTATUS BCryptQueryContextFunctionProperty(      WINAPI_CryptConfigTable dwTable, LPCWSTR pszContext, WINAPI_CryptInterface dwInterface, LPCWSTR pszFunction, LPCWSTR pszProperty, ULONG* pcbValue, PUCHAR* ppbValue);
  NTSTATUS BCryptQueryProviderRegistration(         LPCWSTR pszProvider, WINAPI_CryptMode dwMode, WINAPI_CryptInterface dwInterface, ULONG* pcbBuffer, PCRYPT_PROVIDER_REG* ppBuffer);
  NTSTATUS BCryptRegisterConfigChangeNotify(        HANDLE* phEvent);
  NTSTATUS BCryptRemoveContextFunction(             WINAPI_CryptConfigTable dwTable, LPCWSTR pszContext, WINAPI_CryptInterface dwInterface, LPCWSTR pszFunction);
  NTSTATUS BCryptResolveProviders(                  LPCWSTR pszContext, WINAPI_CryptInterface dwInterface, LPCWSTR pszFunction, LPCWSTR pszProvider, WINAPI_CryptMode dwMode, WINAPI_CryptEnumFlags dwFlags, ULONG* pcbBuffer, PCRYPT_PROVIDER_REFS* ppBuffer);
  NTSTATUS BCryptSetContextFunctionProperty(        WINAPI_CryptConfigTable dwTable, LPCWSTR pszContext, WINAPI_CryptInterface dwInterface, LPCWSTR pszFunction, LPCWSTR pszProperty, ULONG cbValue, PUCHAR pbValue);
  NTSTATUS BCryptUnregisterConfigChangeNotify(      HANDLE hEvent);
  NTSTATUS BCryptCloseAlgorithmProvider(            BCRYPT_ALG_HANDLE hAlgorithm, ULONG dwFlags);
  NTSTATUS BCryptCreateHash(                        BCRYPT_ALG_HANDLE hAlgorithm, BCRYPT_HASH_HANDLE* phHash, PUCHAR pbHashObject, ULONG cbHashObject, PUCHAR pbSecret, ULONG cbSecret, ULONG dwFlags);
  NTSTATUS BCryptDecrypt(                           BCRYPT_KEY_HANDLE hKey, PUCHAR pbInput, ULONG cbInput, VOID* pPaddingInfo, PUCHAR pbIV, ULONG cbIV, PUCHAR pbOutput, ULONG cbOutput, ULONG* pcbResult, ULONG dwFlags);
  NTSTATUS BCryptDeriveKey(                         BCRYPT_SECRET_HANDLE hSharedSecret, LPCWSTR pwszKDF, BCryptBufferDesc* pParameterList, PUCHAR pbDerivedKey, ULONG cbDerivedKey, ULONG* pcbResult, WINAPI_CryptDeriveKeyFlags dwFlags);
  NTSTATUS BCryptDestroyHash(                       BCRYPT_HASH_HANDLE hHash);
  NTSTATUS BCryptDestroyKey(                        BCRYPT_KEY_HANDLE hKey);
  NTSTATUS BCryptDestroySecret(                     BCRYPT_SECRET_HANDLE hSecret);
  NTSTATUS BCryptDuplicateHash(                     BCRYPT_HASH_HANDLE hHash, BCRYPT_HASH_HANDLE* phNewHash, PUCHAR pbHashObject, ULONG cbHashObject, ULONG dwFlags);
  NTSTATUS BCryptDuplicateKey(                      BCRYPT_KEY_HANDLE hKey, BCRYPT_KEY_HANDLE* phNewKey, PUCHAR pbKeyObject, ULONG cbKeyObject, ULONG dwFlags);
  NTSTATUS BCryptEncrypt(                           BCRYPT_KEY_HANDLE hKey, PUCHAR pbInput, ULONG cbInput, VOID* pPaddingInfo, PUCHAR pbIV, ULONG cbIV, PUCHAR pbOutput, ULONG cbOutput, ULONG* pcbResult, ULONG dwFlags);
  NTSTATUS BCryptExportKey(                         BCRYPT_KEY_HANDLE hKey, BCRYPT_KEY_HANDLE hExportKey, LPCWSTR pszBlobType, PUCHAR pbOutput, ULONG cbOutput, ULONG* pcbResult, ULONG dwFlags);
  NTSTATUS BCryptFinalizeKeyPair(                   BCRYPT_KEY_HANDLE hKey, ULONG dwFlags);
  NTSTATUS BCryptFinishHash(                        BCRYPT_HASH_HANDLE hHash, PUCHAR pbOutput, ULONG cbOutput, ULONG dwFlags);
  VOID     BCryptFreeBuffer(                        PVOID pvBuffer);
  NTSTATUS BCryptGenerateKeyPair(                   BCRYPT_ALG_HANDLE hAlgorithm, BCRYPT_KEY_HANDLE* phKey, ULONG dwLength, ULONG dwFlags);
  NTSTATUS BCryptGenerateSymmetricKey(              BCRYPT_ALG_HANDLE hAlgorithm, BCRYPT_KEY_HANDLE* phKey, PUCHAR pbKeyObject, ULONG cbKeyObject, PUCHAR pbSecret, ULONG cbSecret, ULONG dwFlags);
  NTSTATUS BCryptGenRandom(                         BCRYPT_ALG_HANDLE hAlgorithm, PUCHAR pbBuffer, ULONG cbBuffer, ULONG dwFlags);
  NTSTATUS BCryptGetProperty(                       BCRYPT_HANDLE hObject, LPCWSTR pszProperty, PUCHAR pbOutput, ULONG cbOutput, ULONG* pcbResult, ULONG dwFlags);
  NTSTATUS BCryptHashData(                          BCRYPT_HASH_HANDLE hHash, PUCHAR pbInput, ULONG cbInput, ULONG dwFlags);
  NTSTATUS BCryptImportKey(                         BCRYPT_ALG_HANDLE hAlgorithm, BCRYPT_KEY_HANDLE hImportKey, LPCWSTR pszBlobType, BCRYPT_KEY_HANDLE* phKey, PUCHAR pbKeyObject, ULONG cbKeyObject, PUCHAR pbInput, ULONG cbInput, ULONG dwFlags);
  NTSTATUS BCryptImportKeyPair(                     BCRYPT_ALG_HANDLE hAlgorithm, BCRYPT_KEY_HANDLE hImportKey, LPCWSTR pszBlobType, BCRYPT_KEY_HANDLE* phKey, PUCHAR pbInput, ULONG cbInput, ULONG dwFlags);
  NTSTATUS BCryptOpenAlgorithmProvider(             BCRYPT_ALG_HANDLE* phAlgorithm, LPCWSTR pszAlgId, LPCWSTR pszImplementation, WINAPI_BCryptOpenAlgorithmProviderFlags dwFlags);
  NTSTATUS BCryptSecretAgreement(                   BCRYPT_KEY_HANDLE hPrivKey, BCRYPT_KEY_HANDLE hPubKey, BCRYPT_SECRET_HANDLE* phSecret, ULONG dwFlags);
  NTSTATUS BCryptSetProperty(                       BCRYPT_HANDLE hObject, LPCWSTR pszProperty, PUCHAR pbInput, ULONG cbInput, ULONG dwFlags);
  NTSTATUS BCryptSignHash(                          BCRYPT_KEY_HANDLE hKey, VOID* pPaddingInfo, PBYTE pbInput, DWORD cbInput, PBYTE pbOutput, DWORD cbOutput, DWORD* pcbResult, ULONG dwFlags);
  NTSTATUS BCryptVerifySignature(                   BCRYPT_KEY_HANDLE hKey, VOID* pPaddingInfo, PUCHAR pbHash, ULONG cbHash, PUCHAR pbSignature, ULONG cbSignature, ULONG dwFlags);
  NTSTATUS BCryptDeriveKeyCapi(                     BCRYPT_HASH_HANDLE hHash, BCRYPT_ALG_HANDLE hTargetAlg, PUCHAR pbDerivedKey, ULONG cbDerivedKey, ULONG dwFlags);
  NTSTATUS BCryptDeriveKeyPBKDF2(                   BCRYPT_ALG_HANDLE hPrf, PUCHAR pbPassword, ULONG cbPassword, PUCHAR pbSalt, ULONG cbSalt, ULONGLONG cIterations, PUCHAR pbDerivedKey, ULONG cbDerivedKey, ULONG dwFlags);
]]
return ffi.load( 'Bcrypt.dll' )

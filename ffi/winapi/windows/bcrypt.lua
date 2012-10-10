require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/cryptography' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID BCRYPT_HANDLE; //Alias
  typedef LPVOID BCRYPT_ALG_HANDLE; //Alias
  typedef LPVOID BCRYPT_HASH_HANDLE; //Alias
  typedef LPVOID BCRYPT_SECRET_HANDLE; //Alias
  typedef struct CRYPT_CONTEXT_CONFIG {
    ULONG dwFlags;
    ULONG dwReserved;
  } CRYPT_CONTEXT_CONFIG;
  typedef CRYPT_CONTEXT_CONFIG *PCRYPT_CONTEXT_CONFIG; //Pointer
  typedef CRYPT_CONTEXT_CONFIG *PCRYPT_CONTEXT_FUNCTION_CONFIG; //Pointer
  typedef struct BCRYPT_ALGORITHM_IDENTIFIER {
    LPWSTR pszName;
    ULONG dwClass;
    ULONG dwFlags;
  } BCRYPT_ALGORITHM_IDENTIFIER;
  typedef struct CRYPT_CONTEXT_FUNCTION_PROVIDERS {
    ULONG cProviders;
    PWSTR* rgpszProviders;
  } CRYPT_CONTEXT_FUNCTION_PROVIDERS;
  typedef CRYPT_CONTEXT_FUNCTION_PROVIDERS *PCRYPT_CONTEXT_FUNCTION_PROVIDERS; //Pointer
  typedef struct CRYPT_CONTEXT_FUNCTIONS {
    ULONG cFunctions;
    PWSTR* rgpszFunctions;
  } CRYPT_CONTEXT_FUNCTIONS;
  typedef CRYPT_CONTEXT_FUNCTIONS *PCRYPT_CONTEXT_FUNCTIONS; //Pointer
  typedef struct CRYPT_CONTEXTS {
    ULONG cContexts;
    PWSTR* rgpszContexts;
  } CRYPT_CONTEXTS;
  typedef CRYPT_CONTEXTS *PCRYPT_CONTEXTS; //Pointer
  typedef struct BCRYPT_PROVIDER_NAME {
    LPWSTR pszProviderName;
  } BCRYPT_PROVIDER_NAME;
  typedef CRYPT_CONTEXT_FUNCTION_PROVIDERS CRYPT_PROVIDERS; //Alias
  typedef CRYPT_PROVIDERS *PCRYPT_PROVIDERS; //Pointer
  typedef struct CRYPT_INTERFACE_REG {
    ULONG dwInterface;
    ULONG dwFlags;
    ULONG cFunctions;
    PWSTR* rgpszFunctions;
  } CRYPT_INTERFACE_REG;
  typedef CRYPT_INTERFACE_REG *PCRYPT_INTERFACE_REG; //Pointer
  typedef struct CRYPT_IMAGE_REG {
    PWSTR pszImage;
    ULONG cInterfaces;
    PCRYPT_INTERFACE_REG* rgpInterfaces;
  } CRYPT_IMAGE_REG;
  typedef CRYPT_IMAGE_REG *PCRYPT_IMAGE_REG; //Pointer
  typedef struct CRYPT_PROVIDER_REG {
    ULONG cAliases;
    PWSTR* rgpszAliases;
    PCRYPT_IMAGE_REG pUM;
    PCRYPT_IMAGE_REG pKM;
  } CRYPT_PROVIDER_REG;
  typedef CRYPT_PROVIDER_REG *PCRYPT_PROVIDER_REG; //Pointer
  typedef struct CRYPT_PROPERTY_REF {
    PWSTR pszProperty;
    ULONG cbValue;
    PUCHAR pbValue;
  } CRYPT_PROPERTY_REF;
  typedef CRYPT_PROPERTY_REF *PCRYPT_PROPERTY_REF; //Pointer
  typedef struct CRYPT_IMAGE_REF {
    PWSTR pszImage;
    ULONG dwFlags;
  } CRYPT_IMAGE_REF;
  typedef CRYPT_IMAGE_REF *PCRYPT_IMAGE_REF; //Pointer
  typedef struct CRYPT_PROVIDER_REF {
    ULONG dwInterface;
    PWSTR pszFunction;
    PWSTR pszProvider;
    ULONG cProperties;
    PCRYPT_PROPERTY_REF* rgpProperties;
    PCRYPT_IMAGE_REF pUM;
    PCRYPT_IMAGE_REF pKM;
  } CRYPT_PROVIDER_REF;
  typedef CRYPT_PROVIDER_REF *PCRYPT_PROVIDER_REF; //Pointer
  typedef struct CRYPT_PROVIDER_REFS {
    ULONG cProviders;
    PCRYPT_PROVIDER_REF* rgpProviders;
  } CRYPT_PROVIDER_REFS;
  typedef CRYPT_PROVIDER_REFS *PCRYPT_PROVIDER_REFS; //Pointer
  typedef ULONG CryptConfigTable; //Alias
  static const CryptConfigTable CRYPT_LOCAL = 0x00000001;
  static const CryptConfigTable CRYPT_DOMAIN = 0x00000002;
  typedef ULONG CryptInterface; //Alias
  static const CryptInterface BCRYPT_CIPHER_INTERFACE = 0x00000001;
  static const CryptInterface BCRYPT_HASH_INTERFACE = 0x00000002;
  static const CryptInterface BCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE = 0x00000003;
  static const CryptInterface BCRYPT_SECRET_AGREEMENT_INTERFACE = 0x00000004;
  static const CryptInterface BCRYPT_SIGNATURE_INTERFACE = 0x00000005;
  static const CryptInterface BCRYPT_RNG_INTERFACE = 0x00000006;
  static const CryptInterface NCRYPT_KEY_STORAGE_INTERFACE = 0x00010001;
  static const CryptInterface NCRYPT_SCHANNEL_INTERFACE = 0x00010002;
  static const CryptInterface NCRYPT_SCHANNEL_SIGNATURE_INTERFACE = 0x00010003;
  typedef ULONG CryptPriority; //Alias
  static const CryptPriority CRYPT_PRIORITY_TOP = 0x00000000;
  static const CryptPriority CRYPT_PRIORITY_BOTTOM = 0xFFFFFFFF;
  typedef ULONG CryptOperation; //Alias
  typedef ULONG CryptMode; //Alias
  static const CryptMode CRYPT_UM = 0x00000001;
  static const CryptMode CRYPT_KM = 0x00000002;
  static const CryptMode CRYPT_MM = 0x00000003;
  static const CryptMode CRYPT_ANY = 0x00000004;
  typedef ULONG CryptEnumFlags; //Alias
  typedef ULONG CryptDeriveKeyFlags; //Alias
  typedef ULONG BCryptOpenAlgorithmProviderFlags; //Alias
  NTSTATUS BCryptAddContextFunction(                CryptConfigTable dwTable, LPCWSTR pszContext, CryptInterface dwInterface, LPCWSTR pszFunction, CryptPriority dwPosition);
  NTSTATUS BCryptConfigureContext(                  CryptConfigTable dwTable, LPCWSTR pszContext, PCRYPT_CONTEXT_CONFIG pConfig);
  NTSTATUS BCryptConfigureContextFunction(          CryptConfigTable dwTable, LPCWSTR pszContext, CryptInterface dwInterface, LPCWSTR pszFunction, PCRYPT_CONTEXT_FUNCTION_CONFIG pConfig);
  NTSTATUS BCryptCreateContext(                     CryptConfigTable dwTable, LPCWSTR pszContext, PCRYPT_CONTEXT_CONFIG pConfig);
  NTSTATUS BCryptDeleteContext(                     CryptConfigTable dwTable, LPCWSTR pszContext);
  NTSTATUS BCryptEnumAlgorithms(                    CryptOperation dwAlgOperations, ULONG* pAlgCount, BCRYPT_ALGORITHM_IDENTIFIER** ppAlgList, ULONG dwFlags);
  NTSTATUS BCryptEnumContextFunctionProviders(      CryptConfigTable dwTable, LPCWSTR pszContext, CryptInterface dwInterface, LPCWSTR pszFunction, ULONG* pcbBuffer, PCRYPT_CONTEXT_FUNCTION_PROVIDERS* ppBuffer);
  NTSTATUS BCryptEnumContextFunctions(              CryptConfigTable dwTable, LPCWSTR pszContext, CryptInterface dwInterface, ULONG* pcbBuffer, PCRYPT_CONTEXT_FUNCTIONS* ppBuffer);
  NTSTATUS BCryptEnumContexts(                      CryptConfigTable dwTable, ULONG* pcbBuffer, PCRYPT_CONTEXTS* ppBuffer);
  NTSTATUS BCryptEnumProviders(                     LPCWSTR pszAlgId, ULONG* pImplCount, BCRYPT_PROVIDER_NAME** ppImplList, ULONG dwFlags);
  NTSTATUS BCryptEnumRegisteredProviders(           ULONG* pcbBuffer, PCRYPT_PROVIDERS* ppBuffer);
  NTSTATUS BCryptGetFipsAlgorithmMode(              BOOLEAN* pfEnabled);
  NTSTATUS BCryptQueryContextConfiguration(         CryptConfigTable dwTable, LPCWSTR pszContext, ULONG* pcbBuffer, PCRYPT_CONTEXT_CONFIG* ppBuffer);
  NTSTATUS BCryptQueryContextFunctionConfiguration( CryptConfigTable dwTable, LPCWSTR pszContext, CryptInterface dwInterface, LPCWSTR pszFunction, ULONG* pcbBuffer, PCRYPT_CONTEXT_FUNCTION_CONFIG* ppBuffer);
  NTSTATUS BCryptQueryContextFunctionProperty(      CryptConfigTable dwTable, LPCWSTR pszContext, CryptInterface dwInterface, LPCWSTR pszFunction, LPCWSTR pszProperty, ULONG* pcbValue, PUCHAR* ppbValue);
  NTSTATUS BCryptQueryProviderRegistration(         LPCWSTR pszProvider, CryptMode dwMode, CryptInterface dwInterface, ULONG* pcbBuffer, PCRYPT_PROVIDER_REG* ppBuffer);
  NTSTATUS BCryptRegisterConfigChangeNotify(        HANDLE* phEvent);
  NTSTATUS BCryptRemoveContextFunction(             CryptConfigTable dwTable, LPCWSTR pszContext, CryptInterface dwInterface, LPCWSTR pszFunction);
  NTSTATUS BCryptResolveProviders(                  LPCWSTR pszContext, CryptInterface dwInterface, LPCWSTR pszFunction, LPCWSTR pszProvider, CryptMode dwMode, CryptEnumFlags dwFlags, ULONG* pcbBuffer, PCRYPT_PROVIDER_REFS* ppBuffer);
  NTSTATUS BCryptSetContextFunctionProperty(        CryptConfigTable dwTable, LPCWSTR pszContext, CryptInterface dwInterface, LPCWSTR pszFunction, LPCWSTR pszProperty, ULONG cbValue, PUCHAR pbValue);
  NTSTATUS BCryptUnregisterConfigChangeNotify(      HANDLE hEvent);
  NTSTATUS BCryptCloseAlgorithmProvider(            BCRYPT_ALG_HANDLE hAlgorithm, ULONG dwFlags);
  NTSTATUS BCryptCreateHash(                        BCRYPT_ALG_HANDLE hAlgorithm, BCRYPT_HASH_HANDLE* phHash, PUCHAR pbHashObject, ULONG cbHashObject, PUCHAR pbSecret, ULONG cbSecret, ULONG dwFlags);
  NTSTATUS BCryptDecrypt(                           BCRYPT_KEY_HANDLE hKey, PUCHAR pbInput, ULONG cbInput, VOID* pPaddingInfo, PUCHAR pbIV, ULONG cbIV, PUCHAR pbOutput, ULONG cbOutput, ULONG* pcbResult, ULONG dwFlags);
  NTSTATUS BCryptDeriveKey(                         BCRYPT_SECRET_HANDLE hSharedSecret, LPCWSTR pwszKDF, BCryptBufferDesc* pParameterList, PUCHAR pbDerivedKey, ULONG cbDerivedKey, ULONG* pcbResult, CryptDeriveKeyFlags dwFlags);
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
  NTSTATUS BCryptOpenAlgorithmProvider(             BCRYPT_ALG_HANDLE* phAlgorithm, LPCWSTR pszAlgId, LPCWSTR pszImplementation, BCryptOpenAlgorithmProviderFlags dwFlags);
  NTSTATUS BCryptSecretAgreement(                   BCRYPT_KEY_HANDLE hPrivKey, BCRYPT_KEY_HANDLE hPubKey, BCRYPT_SECRET_HANDLE* phSecret, ULONG dwFlags);
  NTSTATUS BCryptSetProperty(                       BCRYPT_HANDLE hObject, LPCWSTR pszProperty, PUCHAR pbInput, ULONG cbInput, ULONG dwFlags);
  NTSTATUS BCryptSignHash(                          BCRYPT_KEY_HANDLE hKey, VOID* pPaddingInfo, PBYTE pbInput, DWORD cbInput, PBYTE pbOutput, DWORD cbOutput, DWORD* pcbResult, ULONG dwFlags);
  NTSTATUS BCryptVerifySignature(                   BCRYPT_KEY_HANDLE hKey, VOID* pPaddingInfo, PUCHAR pbHash, ULONG cbHash, PUCHAR pbSignature, ULONG cbSignature, ULONG dwFlags);
  NTSTATUS BCryptDeriveKeyCapi(                     BCRYPT_HASH_HANDLE hHash, BCRYPT_ALG_HANDLE hTargetAlg, PUCHAR pbDerivedKey, ULONG cbDerivedKey, ULONG dwFlags);
  NTSTATUS BCryptDeriveKeyPBKDF2(                   BCRYPT_ALG_HANDLE hPrf, PUCHAR pbPassword, ULONG cbPassword, PUCHAR pbSalt, ULONG cbSalt, ULONGLONG cIterations, PUCHAR pbDerivedKey, ULONG cbDerivedKey, ULONG dwFlags);
]]
ffi.load( 'Bcrypt.dll' )

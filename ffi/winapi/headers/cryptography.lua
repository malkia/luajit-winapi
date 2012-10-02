require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef ULONG_PTR HCRYPTPROV; //Alias
  typedef ULONG_PTR HCRYPTHASH; //Alias
  typedef ULONG_PTR HCRYPTKEY; //Alias
  typedef void* HCERTSTORE; //Alias
  typedef PVOID BCRYPT_KEY_HANDLE; //Alias
  typedef ULONG_PTR HCRYPTPROV_OR_NCRYPT_KEY_HANDLE; //Alias
  typedef ULONG_PTR NCRYPT_KEY_HANDLE; //Alias
  typedef LPVOID PFN_PROVUI_CALL; //Alias
  typedef LPVOID PFN_CPD_MEM_ALLOC; //Alias
  typedef LPVOID PFN_CPD_MEM_FREE; //Alias
  typedef LPVOID PFN_CPD_ADD_STORE; //Alias
  typedef LPVOID PFN_CPD_ADD_SGNR; //Alias
  typedef LPVOID PFN_CPD_ADD_CERT; //Alias
  typedef LPVOID PFN_CPD_ADD_PRIVDATA; //Alias
  typedef LPVOID PFN_PROVIDER_INIT_CALL; //Alias
  typedef LPVOID PFN_PROVIDER_OBJTRUST_CALL; //Alias
  typedef LPVOID PFN_PROVIDER_SIGTRUST_CALL; //Alias
  typedef LPVOID PFN_PROVIDER_CERTTRUST_CALL; //Alias
  typedef LPVOID PFN_PROVIDER_FINALPOLICY_CALL; //Alias
  typedef LPVOID PFN_PROVIDER_CERTCHKPOLICY_CALL; //Alias
  typedef LPVOID PFN_PROVIDER_TESTFINALPOLICY_CALL; //Alias
  typedef LPVOID PFN_PROVIDER_CLEANUP_CALL; //Alias
  typedef LPVOID HCRYPTDEFAULTCONTEXT; //Alias
  typedef LPVOID PFN_CRYPT_ALLOC; //Alias
  typedef LPVOID PFN_CRYPT_FREE; //Alias
  typedef LPVOID PFN_CERT_ENUM_PHYSICAL_STORE; //Alias
  typedef LPVOID PFN_CERT_ENUM_SYSTEM_STORE; //Alias
  typedef LPVOID PFN_CERT_ENUM_SYSTEM_STORE_LOCATION; //Alias
  typedef ULONG_PTR HCRYPTPROV_LEGACY; //Alias
  typedef LPVOID PFN_CERT_CREATE_CONTEXT_SORT_FUNC; //Alias
  typedef LPVOID HCERT_SERVER_OCSP_RESPONSE; //Alias
  typedef LPVOID HCRYPTMSG; //Alias
  typedef HANDLE HCERTCHAINENGINE; //Alias
  typedef LPVOID *PFN_CMSG_STREAM_OUTPUT; //Pointer
  typedef LPVOID *PFN_CRYPT_GET_SIGNER_CERTIFICATE; //Pointer
  typedef LPVOID PCRYPT_RESOLVE_HCRYPTPROV_FUNC; //Alias
  typedef LPVOID PCRYPT_DECRYPT_PRIVATE_KEY_FUNC; //Alias
  typedef LPVOID PFN_CRYPT_ENUM_KEYID_PROP; //Alias
  typedef LPVOID PFN_CRYPT_ENUM_OID_FUNC; //Alias
  typedef LPVOID PFN_CRYPT_ENUM_OID_INFO; //Alias
  typedef LPVOID HCRYPTOIDFUNCADDR; //Alias
  typedef LPVOID HCRYPTOIDFUNCSET; //Alias
  typedef LPVOID PCRYPT_ENCRYPT_PRIVATE_KEY_FUNC; //Alias
  typedef LPVOID pCryptSIPGetSignedDataMsg; //Alias
  typedef LPVOID pCryptSIPPutSignedDataMsg; //Alias
  typedef LPVOID pCryptSIPCreateIndirectData; //Alias
  typedef LPVOID pCryptSIPVerifyIndirectData; //Alias
  typedef LPVOID pCryptSIPRemoveSignedDataMsg; //Alias
  typedef enum ALG_ID {
    CALG_MD2 = 0x00008001,
    CALG_MD4 = 0x00008002,
    CALG_MD5 = 0x00008003,
    CALG_SHA = 0x00008004,
    CALG_SHA1 = 0x00008004,
    CALG_MAC = 0x00008005,
    CALG_RSA_SIGN = 0x00002400,
    CALG_DSS_SIGN = 0x00002200,
    CALG_NO_SIGN = 0x00002000,
    CALG_RSA_KEYX = 0x0000a400,
    CALG_DES = 0x00006601,
    CALG_3DES_112 = 0x00006609,
    CALG_3DES = 0x00006603,
    CALG_DESX = 0x00006604,
    CALG_RC2 = 0x00006602,
    CALG_RC4 = 0x00006801,
    CALG_SEAL = 0x00006802,
    CALG_DH_SF = 0x0000aa01,
    CALG_DH_EPHEM = 0x0000aa02,
    CALG_AGREEDKEY_ANY = 0x0000aa03,
    CALG_KEA_KEYX = 0x0000aa04,
    CALG_HUGHES_MD5 = 0x0000a003,
    CALG_SKIPJACK = 0x0000660a,
    CALG_TEK = 0x0000660b,
    CALG_CYLINK_MEK = 0x0000660c,
    CALG_SSL3_SHAMD5 = 0x00008008,
    CALG_SSL3_MASTER = 0x00004c01,
    CALG_SCHANNEL_MASTER_HASH = 0x00004c02,
    CALG_SCHANNEL_MAC_KEY = 0x00004c03,
    CALG_SCHANNEL_ENC_KEY = 0x00004c07,
    CALG_PCT1_MASTER = 0x00004c04,
    CALG_SSL2_MASTER = 0x00004c05,
    CALG_TLS1_MASTER = 0x00004c06,
    CALG_RC5 = 0x0000660d,
    CALG_HMAC = 0x00008009,
    CALG_TLS1PRF = 0x0000800a,
    CALG_HASH_REPLACE_OWF = 0x0000800b,
    CALG_AES_128 = 0x0000660e,
    CALG_AES_192 = 0x0000660f,
    CALG_AES_256 = 0x00006610,
    CALG_AES = 0x00006611,
    CALG_SHA_256 = 0x0000800c,
    CALG_SHA_384 = 0x0000800d,
    CALG_SHA_512 = 0x0000800e,
    CALG_ECDH = 0x0000aa05,
    CALG_ECMQV = 0x0000a001,
    CALG_ECDSA = 0x00002203,
  } ALG_ID;
  typedef DWORD WINAPI_CryptAcquireContextFlags; //Alias
  typedef enum WINAPI_CryptProv {
    PROV_RSA_FULL = 1,
    PROV_RSA_SIG = 2,
    PROV_DSS = 3,
    PROV_FORTEZZA = 4,
    PROV_MS_EXCHANGE = 5,
    PROV_SSL = 6,
    PROV_STT_MER = 7,
    PROV_STT_ACQ = 8,
    PROV_STT_BRND = 9,
    PROV_STT_ROOT = 10,
    PROV_STT_ISS = 11,
    PROV_RSA_SCHANNEL = 12,
    PROV_DSS_DH = 13,
    PROV_EC_ECDSA_SIG = 14,
    PROV_EC_ECNRA_SIG = 15,
    PROV_EC_ECDSA_FULL = 16,
    PROV_EC_ECNRA_FULL = 17,
    PROV_DH_SCHANNEL = 18,
    PROV_SPYRUS_LYNKS = 20,
    PROV_RNG = 21,
    PROV_INTEL_SEC = 22,
    PROV_REPLACE_OWF = 23,
    PROV_RSA_AES = 24,
  } WINAPI_CryptProv;
  typedef enum WINAPI_CryptCreateHashFlags {
    CRYPT_SECRETDIGEST = 0x00000001,
  } WINAPI_CryptCreateHashFlags;
  typedef enum WINAPI_CryptHashDataFlags {
    CRYPT_USERDATA = 1,
  } WINAPI_CryptHashDataFlags;
  typedef enum WINAPI_CryptBlobType {
    SIMPLEBLOB = 0x1,
    PUBLICKEYBLOB = 0x6,
    PRIVATEKEYBLOB = 0x7,
    PLAINTEXTKEYBLOB = 0x8,
    OPAQUEKEYBLOB = 0x9,
    PUBLICKEYBLOBEX = 0xA,
    SYMMETRICWRAPKEYBLOB = 0xB,
    KEYSTATEBLOB = 0xC,
  } WINAPI_CryptBlobType;
  typedef DWORD WINAPI_CryptExportKeyFlags; //Alias
  typedef enum WINAPI_CryptKeyParam {
    KP_IV = 1,
    KP_SALT = 2,
    KP_PADDING = 3,
    KP_MODE = 4,
    KP_MODE_BITS = 5,
    KP_PERMISSIONS = 6,
    KP_ALGID = 7,
    KP_BLOCKLEN = 8,
    KP_KEYLEN = 9,
    KP_SALT_EX = 10,
    KP_P = 11,
    KP_G = 12,
    KP_Q = 13,
    KP_X = 14,
    KP_Y = 15,
    KP_RA = 16,
    KP_RB = 17,
    KP_INFO = 18,
    KP_EFFECTIVE_KEYLEN = 19,
    KP_SCHANNEL_ALG = 20,
    KP_CLIENT_RANDOM = 21,
    KP_SERVER_RANDOM = 22,
    KP_RP = 23,
    KP_PRECOMP_MD5 = 24,
    KP_PRECOMP_SHA = 25,
    KP_CERTIFICATE = 26,
    KP_CLEAR_KEY = 27,
    KP_PUB_EX_LEN = 28,
    KP_PUB_EX_VAL = 29,
    KP_KEYVAL = 30,
    KP_ADMIN_PIN = 31,
    KP_KEYEXCHANGE_PIN = 32,
    KP_SIGNATURE_PIN = 33,
    KP_PREHASH = 34,
    KP_ROUNDS = 35,
    KP_OAEP_PARAMS = 36,
    KP_CMS_KEY_INFO = 37,
    KP_CMS_DH_KEY_INFO = 38,
    KP_PUB_PARAMS = 39,
    KP_VERIFY_PARAMS = 40,
    KP_HIGHEST_VERSION = 41,
    KP_GET_USE_COUNT = 42,
  } WINAPI_CryptKeyParam;
  typedef DWORD WINAPI_CryptImportKeyFlags; //Alias
  typedef DWORD WINAPI_CryptSignFlags; //Alias
  typedef enum WINAPI_CryptKeySpec {
    AT_KEYEXCHANGE = 1,
    AT_SIGNATURE = 2,
  } WINAPI_CryptKeySpec;
  typedef enum WINAPI_CryptSetProvParam {
    PP_CLIENT_HWND = 1,
    PP_KEYSET_SEC_DESCR = 8,
    PP_CONTEXT_INFO = 11,
    PP_KEYEXCHANGE_KEYSIZE = 12,
    PP_SIGNATURE_KEYSIZE = 13,
    PP_KEYEXCHANGE_ALG = 14,
    PP_SIGNATURE_ALG = 15,
    PP_UI_PROMPT = 21,
    PP_DELETEKEY = 24,
    PP_SIGNATURE_PIN = 33,
    PP_USE_HARDWARE_RNG = 38,
    PP_USER_CERTSTORE = 42,
    PP_SMARTCARD_READER = 43,
    PP_PIN_PROMPT_STRING = 44,
    PP_SMARTCARD_GUID = 45,
    PP_ROOT_CERTSTORE = 46,
    PP_SECURE_KEYEXCHANGE_PIN = 47,
    PP_SECURE_SIGNATURE_PIN = 48,
  } WINAPI_CryptSetProvParam;
  typedef enum WINAPI_CryptGetProvParam {
    PP_ENUMALGS = 1,
    PP_ENUMCONTAINERS = 2,
    PP_IMPTYPE = 3,
    PP_NAME = 4,
    PP_VERSION = 5,
    PP_CONTAINER = 6,
    PP_CHANGE_PASSWORD = 7,
    PP_KEYSET_SEC_DESCR = 8,
    PP_CERTCHAIN = 9,
    PP_KEY_TYPE_SUBTYPE = 10,
    PP_PROVTYPE = 16,
    PP_KEYSTORAGE = 17,
    PP_APPLI_CERT = 18,
    PP_SYM_KEYSIZE = 19,
    PP_SESSION_KEYSIZE = 20,
    PP_UI_PROMPT = 21,
    PP_ENUMALGS_EX = 22,
    PP_ENUMMANDROOTS = 25,
    PP_ENUMELECTROOTS = 26,
    PP_KEYSET_TYPE = 27,
    PP_ADMIN_PIN = 31,
    PP_KEYEXCHANGE_PIN = 32,
    PP_SIGNATURE_PIN = 33,
    PP_SIG_KEYSIZE_INC = 34,
    PP_KEYX_KEYSIZE_INC = 35,
    PP_UNIQUE_CONTAINER = 36,
    PP_SGC_INFO = 37,
    PP_USE_HARDWARE_RNG = 38,
    PP_KEYSPEC = 39,
    PP_ENUMEX_SIGNING_PROT = 40,
    PP_CRYPT_COUNT_KEY_USE = 41,
    PP_USER_CERTSTORE = 42,
    PP_SMARTCARD_READER = 43,
    PP_SMARTCARD_GUID = 45,
    PP_ROOT_CERTSTORE = 46,
  } WINAPI_CryptGetProvParam;
  typedef enum WINAPI_CryptHashParam {
    HP_ALGID = 0x0001,
    HP_HASHVAL = 0x0002,
    HP_HASHSIZE = 0x0004,
    HP_HMAC_INFO = 0x0005,
    HP_TLS1PRF_LABEL = 0x0006,
    HP_TLS1PRF_SEED = 0x0007,
  } WINAPI_CryptHashParam;
  typedef struct DATA_BLOB {
    DWORD cbData,
    BYTE* pbData,
  } DATA_BLOB;
  typedef DATA_BLOB CRYPT_INTEGER_BLOB; //Alias
  typedef CRYPT_INTEGER_BLOB *PCRYPT_INTEGER_BLOB; //Pointer
  typedef DATA_BLOB CRYPT_DIGEST_BLOB; //Alias
  typedef DATA_BLOB CRYPT_DER_BLOB; //Alias
  typedef CRYPT_DER_BLOB *PCRYPT_DER_BLOB; //Pointer
  typedef DATA_BLOB CERT_NAME_BLOB; //Alias
  typedef CERT_NAME_BLOB *PCERT_NAME_BLOB; //Pointer
  typedef DATA_BLOB CRYPT_OBJID_BLOB; //Alias
  typedef DATA_BLOB *PCRYPT_ATTR_BLOB; //Pointer
  typedef DATA_BLOB CERT_RDN_VALUE_BLOB; //Alias
  typedef CERT_RDN_VALUE_BLOB *PCERT_RDN_VALUE_BLOB; //Pointer
  typedef DATA_BLOB CRYPT_HASH_BLOB; //Alias
  typedef CRYPT_HASH_BLOB *WINAPI_CRYPT_HASH_BLOB*; //Pointer
  typedef DATA_BLOB CRYPT_DATA_BLOB; //Alias
  typedef CRYPT_DATA_BLOB *PCRYPT_DATA_BLOB; //Pointer
  typedef PCRYPT_DATA_BLOB *CRYPT_DATA_BLOB*; //Pointer
  typedef DATA_BLOB CRYPT_ATTR_BLOB; //Alias
  typedef DATA_BLOB CERT_BLOB; //Alias
  typedef CERT_BLOB *PCERT_BLOB; //Pointer
  typedef DATA_BLOB CRL_BLOB; //Alias
  typedef CRL_BLOB *PCRL_BLOB; //Pointer
  typedef struct BCryptBuffer {
    ULONG cbBuffer,
    ULONG BufferType,
    PVOID pvBuffer,
  } BCryptBuffer;
  typedef BCryptBuffer *PBCryptBuffer; //Pointer
  typedef struct BCryptBufferDesc {
    ULONG ulVersion,
    ULONG cBuffers,
    PBCryptBuffer pBuffers,
  } BCryptBufferDesc;
  typedef struct CRYPT_ATTRIBUTE_TYPE_VALUE {
    LPSTR pszObjId,
    CRYPT_OBJID_BLOB Value,
  } CRYPT_ATTRIBUTE_TYPE_VALUE;
  typedef struct CRYPT_ALGORITHM_IDENTIFIER {
    LPSTR pszObjId,
    CRYPT_OBJID_BLOB Parameters,
  } CRYPT_ALGORITHM_IDENTIFIER;
  typedef CRYPT_ALGORITHM_IDENTIFIER *PCRYPT_ALGORITHM_IDENTIFIER; //Pointer
  typedef struct SIP_INDIRECT_DATA {
    CRYPT_ATTRIBUTE_TYPE_VALUE Data,
    CRYPT_ALGORITHM_IDENTIFIER DigestAlgorithm,
    CRYPT_HASH_BLOB Digest,
  } SIP_INDIRECT_DATA;
  typedef struct CERT_EXTENSION {
    LPSTR pszObjId,
    BOOL fCritical,
    CRYPT_OBJID_BLOB Value,
  } CERT_EXTENSION;
  typedef CERT_EXTENSION *PCERT_EXTENSION; //Pointer
  typedef CERT_EXTENSION *CERT_EXTENSION[]; //Pointer
  typedef struct CERT_EXTENSIONS {
    DWORD cExtension,
    PCERT_EXTENSION rgExtension,
  } CERT_EXTENSIONS;
  typedef CERT_EXTENSIONS *PCERT_EXTENSIONS; //Pointer
  typedef struct CRYPT_BIT_BLOB {
    DWORD cbData,
    BYTE* pbData,
    DWORD cUnusedBits,
  } CRYPT_BIT_BLOB;
  typedef struct CERT_PUBLIC_KEY_INFO {
    CRYPT_ALGORITHM_IDENTIFIER Algorithm,
    CRYPT_BIT_BLOB PublicKey,
  } CERT_PUBLIC_KEY_INFO;
  typedef CERT_PUBLIC_KEY_INFO *PCERT_PUBLIC_KEY_INFO; //Pointer
  typedef struct CERT_INFO {
    DWORD dwVersion,
    CRYPT_INTEGER_BLOB SerialNumber,
    CRYPT_ALGORITHM_IDENTIFIER SignatureAlgorithm,
    CERT_NAME_BLOB Issuer,
    FILETIME NotBefore,
    FILETIME NotAfter,
    CERT_NAME_BLOB Subject,
    CERT_PUBLIC_KEY_INFO SubjectPublicKeyInfo,
    CRYPT_BIT_BLOB IssuerUniqueId,
    CRYPT_BIT_BLOB SubjectUniqueId,
    DWORD cExtension,
    PCERT_EXTENSION rgExtension,
  } CERT_INFO;
  typedef CERT_INFO *PCERT_INFO; //Pointer
  typedef DWORD WINAPI_CertEncodingType; //Alias
  typedef struct CERT_CONTEXT {
    WINAPI_CertEncodingType dwCertEncodingType,
    BYTE* pbCertEncoded,
    DWORD cbCertEncoded,
    PCERT_INFO pCertInfo,
    HCERTSTORE hCertStore,
  } CERT_CONTEXT;
  typedef CERT_CONTEXT *PCCERT_CONTEXT; //Pointer
  typedef struct SIGNER_CONTEXT {
    DWORD cbSize,
    DWORD cbBlob,
    BYTE* pbBlob,
  } SIGNER_CONTEXT;
  typedef struct CRYPT_ATTRIBUTE {
    LPSTR pszObjId,
    DWORD cValue,
    PCRYPT_ATTR_BLOB rgValue,
  } CRYPT_ATTRIBUTE;
  typedef CRYPT_ATTRIBUTE *PCRYPT_ATTRIBUTE; //Pointer
  typedef CRYPT_ATTRIBUTE *CRYPT_ATTRIBUTE[]; //Pointer
  typedef struct CRYPT_ATTRIBUTES {
    DWORD cAttr,
    PCRYPT_ATTRIBUTE rgAttr,
  } CRYPT_ATTRIBUTES;
  typedef CRYPT_ATTRIBUTES *PCRYPT_ATTRIBUTES; //Pointer
  typedef struct CRYPTCATMEMBER {
    DWORD cbStruct,
    LPWSTR pwszReferenceTag,
    LPWSTR pwszFileName,
    GUID gSubjectType,
    DWORD fdwMemberFlags,
    SIP_INDIRECT_DATA* pIndirectData,
    DWORD dwCertVersion,
    DWORD dwReserved,
    HANDLE hReserved,
    CRYPT_ATTR_BLOB sEncodedIndirectData,
    CRYPT_ATTR_BLOB sEncodedMemberInfo,
  } CRYPTCATMEMBER;
  typedef struct CRYPT_PROVUI_DATA {
    DWORD cbStruct,
    DWORD dwFinalError,
    WCHAR* pYesButtonText,
    WCHAR* pNoButtonText,
    WCHAR* pMoreInfoButtonText,
    WCHAR* pAdvancedLinkText,
    WCHAR* pCopyActionText,
    WCHAR* pCopyActionTextNoTS,
    WCHAR* pCopyActionTextNotSigned,
  } CRYPT_PROVUI_DATA;
  typedef struct CRYPT_PROVUI_FUNCS {
    DWORD cbStruct,
    CRYPT_PROVUI_DATA* psUIData,
    PFN_PROVUI_CALL pfnOnMoreInfoClick,
    PFN_PROVUI_CALL pfnOnMoreInfoClickDefault,
    PFN_PROVUI_CALL pfnOnAdvancedClick,
    PFN_PROVUI_CALL pfnOnAdvancedClickDefault,
  } CRYPT_PROVUI_FUNCS;
  typedef struct CRYPT_PROVIDER_FUNCTIONS {
    DWORD cbStruct,
    PFN_CPD_MEM_ALLOC pfnAlloc,
    PFN_CPD_MEM_FREE pfnFree,
    PFN_CPD_ADD_STORE pfnAddStore2Chain,
    PFN_CPD_ADD_SGNR pfnAddSgnr2Chain,
    PFN_CPD_ADD_CERT pfnAddCert2Chain,
    PFN_CPD_ADD_PRIVDATA pfnAddPrivData2Chain,
    PFN_PROVIDER_INIT_CALL pfnInitialize,
    PFN_PROVIDER_OBJTRUST_CALL pfnObjectTrust,
    PFN_PROVIDER_SIGTRUST_CALL pfnSignatureTrust,
    PFN_PROVIDER_CERTTRUST_CALL pfnCertificateTrust,
    PFN_PROVIDER_FINALPOLICY_CALL pfnFinalPolicy,
    PFN_PROVIDER_CERTCHKPOLICY_CALL pfnCertCheckPolicy,
    PFN_PROVIDER_TESTFINALPOLICY_CALL pfnTestFinalPolicy,
    CRYPT_PROVUI_FUNCS* psUIpfns,
    PFN_PROVIDER_CLEANUP_CALL pfnCleanupPolicy,
  } CRYPT_PROVIDER_FUNCTIONS;
  typedef struct CRYPTCATCDF {
    DWORD cbStruct,
    HANDLE hFile,
    DWORD dwCurFilePos,
    DWORD dwLastMemberOffset,
    BOOL fEOF,
    LPWSTR pwszResultDir,
    HANDLE hCATStore,
  } CRYPTCATCDF;
  typedef DWORD WINAPI_CryptCatTypeAndAction; //Alias
  typedef struct CRYPTCATATTRIBUTE {
    DWORD cbStruct,
    LPWSTR pwszReferenceTag,
    WINAPI_CryptCatTypeAndAction dwAttrTypeAndAction,
    DWORD cbValue,
    BYTE* pbValue,
    DWORD dwReserved,
  } CRYPTCATATTRIBUTE;
  typedef struct CRYPT_TRUST_REG_ENTRY {
    DWORD cbStruct,
    WCHAR* pwszDLLName,
    WCHAR* pwszFunctionName,
  } CRYPT_TRUST_REG_ENTRY;
  typedef struct CRYPT_REGISTER_ACTIONID {
    DWORD cbStruct,
    CRYPT_TRUST_REG_ENTRY sInitProvider,
    CRYPT_TRUST_REG_ENTRY sObjectProvider,
    CRYPT_TRUST_REG_ENTRY sSignatureProvider,
    CRYPT_TRUST_REG_ENTRY sCertificateProvider,
    CRYPT_TRUST_REG_ENTRY sCertificatePolicyProvider,
    CRYPT_TRUST_REG_ENTRY sFinalPolicyProvider,
    CRYPT_TRUST_REG_ENTRY sTestPolicyProvider,
    CRYPT_TRUST_REG_ENTRY sCleanupProvider,
  } CRYPT_REGISTER_ACTIONID;
  typedef struct CRYPT_PROVIDER_PRIVDATA {
    DWORD cbStruct,
    GUID gProviderID,
    DWORD cbProvData,
    void* pvProvData,
  } CRYPT_PROVIDER_PRIVDATA;
  typedef DWORD WINAPI_CERT_CONFIDENCE; //Alias
  typedef struct CTL_USAGE {
    DWORD cUsageIdentifier,
    LPSTR* rgpszUsageIdentifier,
  } CTL_USAGE;
  typedef CTL_USAGE *PCTL_USAGE; //Pointer
  typedef struct CTL_ENTRY {
    CRYPT_DATA_BLOB SubjectIdentifier,
    DWORD cAttribute,
    PCRYPT_ATTRIBUTE rgAttribute,
  } CTL_ENTRY;
  typedef CTL_ENTRY *PCTL_ENTRY; //Pointer
  typedef struct CTL_INFO {
    DWORD dwVersion,
    CTL_USAGE SubjectUsage,
    CRYPT_DATA_BLOB ListIdentifier,
    CRYPT_INTEGER_BLOB SequenceNumber,
    FILETIME ThisUpdate,
    FILETIME NextUpdate,
    CRYPT_ALGORITHM_IDENTIFIER SubjectAlgorithm,
    DWORD cCTLEntry,
    PCTL_ENTRY rgCTLEntry,
    DWORD cExtension,
    PCERT_EXTENSION rgExtension,
  } CTL_INFO;
  typedef CTL_INFO *PCTL_INFO; //Pointer
  typedef struct CTL_CONTEXT {
    DWORD dwMsgAndCertEncodingType,
    BYTE* pbCtlEncoded,
    DWORD cbCtlEncoded,
    PCTL_INFO pCtlInfo,
    HCERTSTORE hCertStore,
    HCRYPTMSG hCryptMsg,
    BYTE* pbCtlContent,
    DWORD cbCtlContent,
  } CTL_CONTEXT;
  typedef CTL_CONTEXT *PCCTL_CONTEXT; //Pointer
  typedef DWORD WINAPI_CERT_TRUST_Error; //Alias
  typedef DWORD WINAPI_CERT_TRUST_Info; //Alias
  typedef struct CERT_TRUST_STATUS {
    WINAPI_CERT_TRUST_Error dwErrorStatus,
    WINAPI_CERT_TRUST_Info dwInfoStatus,
  } CERT_TRUST_STATUS;
  typedef struct CRL_ENTRY {
    CRYPT_INTEGER_BLOB SerialNumber,
    FILETIME RevocationDate,
    DWORD cExtension,
    PCERT_EXTENSION rgExtension,
  } CRL_ENTRY;
  typedef CRL_ENTRY *PCRL_ENTRY; //Pointer
  typedef struct CRL_INFO {
    DWORD dwVersion,
    CRYPT_ALGORITHM_IDENTIFIER SignatureAlgorithm,
    CERT_NAME_BLOB Issuer,
    FILETIME ThisUpdate,
    FILETIME NextUpdate,
    DWORD cCRLEntry,
    PCRL_ENTRY rgCRLEntry,
    DWORD cExtension,
    PCERT_EXTENSION rgExtension,
  } CRL_INFO;
  typedef CRL_INFO *PCRL_INFO; //Pointer
  typedef struct CRL_CONTEXT {
    DWORD dwCertEncodingType,
    BYTE* pbCrlEncoded,
    DWORD cbCrlEncoded,
    PCRL_INFO pCrlInfo,
    HCERTSTORE hCertStore,
  } CRL_CONTEXT;
  typedef CRL_CONTEXT *PCCRL_CONTEXT; //Pointer
  typedef struct CERT_REVOCATION_CRL_INFO {
    DWORD cbSize,
    PCCRL_CONTEXT pBaseCrlContext,
    PCCRL_CONTEXT pDeltaCrlContext,
    PCRL_ENTRY pCrlEntry,
    BOOL fDeltaCrlEntry,
  } CERT_REVOCATION_CRL_INFO;
  typedef CERT_REVOCATION_CRL_INFO *PCERT_REVOCATION_CRL_INFO; //Pointer
  typedef struct CERT_REVOCATION_INFO {
    DWORD cbSize,
    DWORD dwRevocationResult,
    LPCSTR pszRevocationOid,
    LPVOID pvOidSpecificInfo,
    BOOL fHasFreshnessTime,
    DWORD dwFreshnessTime,
    PCERT_REVOCATION_CRL_INFO pCrlInfo,
  } CERT_REVOCATION_INFO;
  typedef CERT_REVOCATION_INFO *PCERT_REVOCATION_INFO; //Pointer
  typedef CTL_USAGE CERT_ENHKEY_USAGE; //Alias
  typedef CERT_ENHKEY_USAGE *PCERT_ENHKEY_USAGE; //Pointer
  typedef struct CERT_CHAIN_ELEMENT {
    DWORD cbSize,
    PCCERT_CONTEXT pCertContext,
    CERT_TRUST_STATUS TrustStatus,
    PCERT_REVOCATION_INFO pRevocationInfo,
    PCERT_ENHKEY_USAGE pIssuanceUsage,
    PCERT_ENHKEY_USAGE pApplicationUsage,
    LPCWSTR pwszExtendedErrorInfo,
  } CERT_CHAIN_ELEMENT;
  typedef CERT_CHAIN_ELEMENT *PCERT_CHAIN_ELEMENT; //Pointer
  typedef struct CRYPT_PROVIDER_CERT {
    DWORD cbStruct,
    PCCERT_CONTEXT pCert,
    BOOL fCommercial,
    BOOL fTrustedRoot,
    BOOL fSelfSigned,
    BOOL fTestCert,
    DWORD dwRevokedReason,
    WINAPI_CERT_CONFIDENCE dwConfidence,
    DWORD dwError,
    CTL_CONTEXT* pTrustListContext,
    BOOL fTrustListSignerCert,
    PCCTL_CONTEXT pCtlContext,
    DWORD dwCtlError,
    BOOL fIsCyclic,
    PCERT_CHAIN_ELEMENT pChainElement,
  } CRYPT_PROVIDER_CERT;
  typedef struct CRYPT_DECODE_PARA {
    DWORD cbSize,
    PFN_CRYPT_ALLOC pfnAlloc,
    PFN_CRYPT_FREE pfnFree,
  } CRYPT_DECODE_PARA;
  typedef CRYPT_DECODE_PARA *PCRYPT_DECODE_PARA; //Pointer
  typedef struct CRYPT_ENCODE_PARA {
    DWORD cbSize,
    PFN_CRYPT_ALLOC pfnAlloc,
    PFN_CRYPT_FREE pfnFree,
  } CRYPT_ENCODE_PARA;
  typedef CRYPT_ENCODE_PARA *PCRYPT_ENCODE_PARA; //Pointer
  typedef enum WINAPI_CryptPromptFlags {
    CRYPTPROTECT_PROMPT_ON_UNPROTECT = 0x1,
    CRYPTPROTECT_PROMPT_ON_PROTECT = 0x2,
    CRYPTPROTECT_PROMPT_RESERVED = 0x04,
    CRYPTPROTECT_PROMPT_STRONG = 0x8,
    CRYPTPROTECT_PROMPT_REQUIRE_STRONG = 0x10,
  } WINAPI_CryptPromptFlags;
  typedef struct CRYPTPROTECT_PROMPTSTRUCT {
    DWORD cbSize,
    WINAPI_CryptPromptFlags dwPromptFlags,
    HWND hwndApp,
    LPCWSTR szPrompt,
  } CRYPTPROTECT_PROMPTSTRUCT;
  typedef struct CERT_PHYSICAL_STORE_INFO {
    DWORD cbSize,
    LPSTR pszOpenStoreProvider,
    DWORD dwOpenEncodingType,
    DWORD dwOpenFlags,
    CRYPT_DATA_BLOB OpenParameters,
    DWORD dwFlags,
    DWORD dwPriority,
  } CERT_PHYSICAL_STORE_INFO;
  typedef CERT_PHYSICAL_STORE_INFO *PCERT_PHYSICAL_STORE_INFO; //Pointer
  typedef struct CERT_SYSTEM_STORE_INFO {
    DWORD cbSize,
  } CERT_SYSTEM_STORE_INFO;
  typedef CERT_SYSTEM_STORE_INFO *PCERT_SYSTEM_STORE_INFO; //Pointer
  typedef struct CERT_CREATE_CONTEXT_PARA {
    DWORD cbSize,
    PFN_CRYPT_FREE pfnFree,
    void* pvFree,
    PFN_CERT_CREATE_CONTEXT_SORT_FUNC pfnSort,
    void* pvSort,
  } CERT_CREATE_CONTEXT_PARA;
  typedef CERT_CREATE_CONTEXT_PARA *PCERT_CREATE_CONTEXT_PARA; //Pointer
  typedef struct CERT_SERVER_OCSP_RESPONSE_CONTEXT {
    DWORD cbSize,
    BYTE* pbEncodedOcspResponse,
    DWORD cbEncodedOcspResponse,
  } CERT_SERVER_OCSP_RESPONSE_CONTEXT;
  typedef CERT_SERVER_OCSP_RESPONSE_CONTEXT *PCCERT_SERVER_OCSP_RESPONSE_CONTEXT; //Pointer
  typedef struct CRYPT_KEY_PROV_PARAM {
    DWORD dwParam,
    BYTE* pbData,
    DWORD cbData,
    DWORD dwFlags,
  } CRYPT_KEY_PROV_PARAM;
  typedef CRYPT_KEY_PROV_PARAM *PCRYPT_KEY_PROV_PARAM; //Pointer
  typedef struct CRYPT_KEY_PROV_INFO {
    LPWSTR pwszContainerName,
    LPWSTR pwszProvName,
    DWORD dwProvType,
    DWORD dwFlags,
    DWORD cProvParam,
    PCRYPT_KEY_PROV_PARAM rgProvParam,
    DWORD dwKeySpec,
  } CRYPT_KEY_PROV_INFO;
  typedef CRYPT_KEY_PROV_INFO *PCRYPT_KEY_PROV_INFO; //Pointer
  typedef enum WINAPI_USAGE_MATCH_TYPE {
    USAGE_MATCH_TYPE_AND = 0x00000000,
    USAGE_MATCH_TYPE_OR = 0x00000001,
  } WINAPI_USAGE_MATCH_TYPE;
  typedef struct CERT_USAGE_MATCH {
    WINAPI_USAGE_MATCH_TYPE dwType,
    CERT_ENHKEY_USAGE Usage,
  } CERT_USAGE_MATCH;
  typedef CERT_USAGE_MATCH *PCERT_USAGE_MATCH; //Pointer
  typedef struct CERT_CHAIN_PARA {
    DWORD cbSize,
    CERT_USAGE_MATCH RequestedUsage,
    CERT_USAGE_MATCH RequestedIssuancePolicy,
    DWORD dwUrlRetrievalTimeout,
    BOOL fCheckRevocationFreshnessTime,
    DWORD dwRevocationFreshnessTime,
    LPFILETIME pftCacheResync,
  } CERT_CHAIN_PARA;
  typedef CERT_CHAIN_PARA *PCERT_CHAIN_PARA; //Pointer
  typedef struct CERT_SELECT_CHAIN_PARA {
    HCERTCHAINENGINE hChainEngine,
    PFILETIME pTime,
    HCERTSTORE hAdditionalStore,
    PCERT_CHAIN_PARA pChainPara,
    DWORD dwFlags,
  } CERT_SELECT_CHAIN_PARA;
  typedef CERT_SELECT_CHAIN_PARA *PCCERT_SELECT_CHAIN_PARA; //Pointer
  typedef struct CERT_SELECT_CRITERIA {
    DWORD dwType,
    DWORD cPara,
    void** ppPara,
  } CERT_SELECT_CRITERIA;
  typedef CERT_SELECT_CRITERIA *PCCERT_SELECT_CRITERIA; //Pointer
  typedef struct CTL_VERIFY_USAGE_PARA {
    DWORD cbSize,
    CRYPT_DATA_BLOB ListIdentifier,
    DWORD cCtlStore,
    HCERTSTORE* rghCtlStore,
    DWORD cSignerStore,
    HCERTSTORE* rghSignerStore,
  } CTL_VERIFY_USAGE_PARA;
  typedef CTL_VERIFY_USAGE_PARA *PCTL_VERIFY_USAGE_PARA; //Pointer
  typedef struct CTL_VERIFY_USAGE_STATUS {
    DWORD cbSize,
    DWORD dwError,
    DWORD dwFlags,
    PCCTL_CONTEXT* ppCtl,
    DWORD dwCtlEntryIndex,
    PCCERT_CONTEXT* ppSigner,
    DWORD dwSignerIndex,
  } CTL_VERIFY_USAGE_STATUS;
  typedef CTL_VERIFY_USAGE_STATUS *PCTL_VERIFY_USAGE_STATUS; //Pointer
  typedef struct CERT_CHAIN_ENGINE_CONFIG {
    DWORD cbSize,
    HCERTSTORE hRestrictedRoot,
    HCERTSTORE hRestrictedTrust,
    HCERTSTORE hRestrictedOther,
    DWORD cAdditionalStore,
    HCERTSTORE* rghAdditionalStore,
    DWORD dwFlags,
    DWORD dwUrlRetrievalTimeout,
    DWORD MaximumCachedCertificates,
    DWORD CycleDetectionModulus,
    HCERTSTORE hExclusiveRoot,
    HCERTSTORE hExclusiveTrustedPeople,
  } CERT_CHAIN_ENGINE_CONFIG;
  typedef CERT_CHAIN_ENGINE_CONFIG *PCERT_CHAIN_ENGINE_CONFIG; //Pointer
  typedef struct CERT_CHAIN_POLICY_PARA {
    DWORD cbSize,
    DWORD dwFlags,
    void* pvExtraPolicyPara,
  } CERT_CHAIN_POLICY_PARA;
  typedef CERT_CHAIN_POLICY_PARA *PCERT_CHAIN_POLICY_PARA; //Pointer
  typedef struct CERT_CHAIN_POLICY_STATUS {
    DWORD cbSize,
    DWORD dwError,
    LONG lChainIndex,
    LONG lElementIndex,
    void* pvExtraPolicyStatus,
  } CERT_CHAIN_POLICY_STATUS;
  typedef CERT_CHAIN_POLICY_STATUS *PCERT_CHAIN_POLICY_STATUS; //Pointer
  typedef struct CMSG_STREAM_INFO {
    DWORD cbContent,
    PFN_CMSG_STREAM_OUTPUT pfnStreamOutput,
    void* pvArg,
  } CMSG_STREAM_INFO;
  typedef CMSG_STREAM_INFO *PCMSG_STREAM_INFO; //Pointer
  typedef struct CRYPT_DECRYPT_MESSAGE_PARA {
    DWORD cbSize,
    DWORD dwMsgAndCertEncodingType,
    DWORD cCertStore,
    HCERTSTORE* rghCertStore,
    DWORD dwFlags,
  } CRYPT_DECRYPT_MESSAGE_PARA;
  typedef CRYPT_DECRYPT_MESSAGE_PARA *PCRYPT_DECRYPT_MESSAGE_PARA; //Pointer
  typedef struct CRYPT_VERIFY_MESSAGE_PARA {
    DWORD cbSize,
    DWORD dwMsgAndCertEncodingType,
    HCRYPTPROV_LEGACY hCryptProv,
    PFN_CRYPT_GET_SIGNER_CERTIFICATE pfnGetSignerCertificate,
    void* pvGetArg,
  } CRYPT_VERIFY_MESSAGE_PARA;
  typedef CRYPT_VERIFY_MESSAGE_PARA *PCRYPT_VERIFY_MESSAGE_PARA; //Pointer
  typedef struct CRYPT_ENCRYPT_MESSAGE_PARA {
    DWORD cbSize,
    DWORD dwMsgEncodingType,
    HCRYPTPROV_LEGACY hCryptProv,
    CRYPT_ALGORITHM_IDENTIFIER ContentEncryptionAlgorithm,
    void* pvEncryptionAuxInfo,
    DWORD dwFlags,
    DWORD dwInnerContentType,
  } CRYPT_ENCRYPT_MESSAGE_PARA;
  typedef CRYPT_ENCRYPT_MESSAGE_PARA *PCRYPT_ENCRYPT_MESSAGE_PARA; //Pointer
  typedef struct CRYPT_HASH_MESSAGE_PARA {
    DWORD cbSize,
    DWORD dwMsgEncodingType,
    HCRYPTPROV_LEGACY hCryptProv,
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm,
    void* pvHashAuxInfo,
  } CRYPT_HASH_MESSAGE_PARA;
  typedef CRYPT_HASH_MESSAGE_PARA *PCRYPT_HASH_MESSAGE_PARA; //Pointer
  typedef struct CRYPT_SIGN_MESSAGE_PARA {
    DWORD cbSize,
    DWORD dwMsgEncodingType,
    PCCERT_CONTEXT pSigningCert,
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm,
    void* pvHashAuxInfo,
    DWORD cMsgCert,
    PCCERT_CONTEXT* rgpMsgCert,
    DWORD cMsgCrl,
    PCCRL_CONTEXT* rgpMsgCrl,
    DWORD cAuthAttr,
    PCRYPT_ATTRIBUTE rgAuthAttr,
    DWORD cUnauthAttr,
    PCRYPT_ATTRIBUTE rgUnauthAttr,
    DWORD dwFlags,
    DWORD dwInnerContentType,
    CRYPT_ALGORITHM_IDENTIFIER HashEncryptionAlgorithm,
    void* pvHashEncryptionAuxInfo,
  } CRYPT_SIGN_MESSAGE_PARA;
  typedef CRYPT_SIGN_MESSAGE_PARA *PCRYPT_SIGN_MESSAGE_PARA; //Pointer
  typedef struct CRYPT_KEY_VERIFY_MESSAGE_PARA {
    DWORD cbSize,
    DWORD dwMsgEncodingType,
    HCRYPTPROV_LEGACY hCryptProv,
  } CRYPT_KEY_VERIFY_MESSAGE_PARA;
  typedef CRYPT_KEY_VERIFY_MESSAGE_PARA *PCRYPT_KEY_VERIFY_MESSAGE_PARA; //Pointer
  typedef struct CERT_RDN_ATTR {
    LPSTR pszObjId,
    DWORD dwValueType,
    CERT_RDN_VALUE_BLOB Value,
  } CERT_RDN_ATTR;
  typedef CERT_RDN_ATTR *PCERT_RDN_ATTR; //Pointer
  typedef struct CERT_RDN {
    DWORD cRDNAttr,
    PCERT_RDN_ATTR rgRDNAttr,
  } CERT_RDN;
  typedef CERT_RDN *PCERT_RDN; //Pointer
  typedef struct CERT_NAME_INFO {
    DWORD cRDN,
    PCERT_RDN rgRDN,
  } CERT_NAME_INFO;
  typedef CERT_NAME_INFO *PCERT_NAME_INFO; //Pointer
  typedef struct CERT_REVOCATION_CHAIN_PARA {
    DWORD cbSize,
    HCERTCHAINENGINE hChainEngine,
    HCERTSTORE hAdditionalStore,
    DWORD dwChainFlags,
    DWORD dwUrlRetrievalTimeout,
    LPFILETIME pftCurrentTime,
    LPFILETIME pftCacheResync,
    DWORD cbMaxUrlRetrievalByteCount,
  } CERT_REVOCATION_CHAIN_PARA;
  typedef CERT_REVOCATION_CHAIN_PARA *PCERT_REVOCATION_CHAIN_PARA; //Pointer
  typedef struct CERT_REVOCATION_PARA {
    DWORD cbSize,
    PCCERT_CONTEXT pIssuerCert,
    DWORD cCertStore,
    HCERTSTORE* rgCertStore,
    HCERTSTORE hCrlStore,
    LPFILETIME pftTimeToUse,
    DWORD dwUrlRetrievalTimeout,
    BOOL fCheckFreshnessTime,
    DWORD dwFreshnessTime,
    LPFILETIME pftCurrentTime,
    PCERT_REVOCATION_CRL_INFO pCrlInfo,
    LPFILETIME pftCacheResync,
    PCERT_REVOCATION_CHAIN_PARA pChainPara,
  } CERT_REVOCATION_PARA;
  typedef CERT_REVOCATION_PARA *PCERT_REVOCATION_PARA; //Pointer
  typedef struct CERT_REVOCATION_STATUS {
    DWORD cbSize,
    DWORD dwIndex,
    DWORD dwError,
    DWORD dwReason,
    BOOL fHasFreshnessTime,
    DWORD dwFreshnessTime,
  } CERT_REVOCATION_STATUS;
  typedef CERT_REVOCATION_STATUS *PCERT_REVOCATION_STATUS; //Pointer
  typedef struct CRYPT_PKCS8_EXPORT_PARAMS {
    HCRYPTPROV hCryptProv,
    DWORD dwKeySpec,
    LPSTR pszPrivateKeyObjId,
    PCRYPT_ENCRYPT_PRIVATE_KEY_FUNC pEncryptPrivateKeyFunc,
    LPVOID pVoidEncryptFunc,
  } CRYPT_PKCS8_EXPORT_PARAMS;
  typedef struct SIP_ADD_NEWPROVIDER {
    DWORD cbStruct,
    GUID* pgSubject,
    WCHAR* pwszDLLFileName,
    WCHAR* pwszMagicNumber,
    WCHAR* pwszIsFunctionName,
    WCHAR* pwszGetFuncName,
    WCHAR* pwszPutFuncName,
    WCHAR* pwszCreateFuncName,
    WCHAR* pwszVerifyFuncName,
    WCHAR* pwszRemoveFuncName,
    WCHAR* pwszIsFunctionNameFmt2,
  } SIP_ADD_NEWPROVIDER;
  typedef struct SIP_DISPATCH_INFO {
    DWORD cbSize,
    HANDLE hSIP,
    pCryptSIPGetSignedDataMsg pfGet,
    pCryptSIPPutSignedDataMsg pfPut,
    pCryptSIPCreateIndirectData pfCreate,
    pCryptSIPVerifyIndirectData pfVerify,
    pCryptSIPRemoveSignedDataMsg pfRemove,
  } SIP_DISPATCH_INFO;
  typedef struct PUBLICKEYSTRUC {
    BYTE bType,
    BYTE bVersion,
    WORD reserved,
    ALG_ID aiKeyAlg,
  } PUBLICKEYSTRUC;
  typedef PUBLICKEYSTRUC *WINAPI_PUBLICKEYSTRUC*; //Pointer
  typedef struct CRYPT_OID_FUNC_ENTRY {
    LPCSTR pszOID,
    void* pvFuncAddr,
  } CRYPT_OID_FUNC_ENTRY;
  typedef CRYPT_OID_FUNC_ENTRY *CRYPT_OID_FUNC_ENTRY[]; //Pointer
  typedef struct CRYPT_PKCS8_IMPORT_PARAMS {
    CRYPT_DIGEST_BLOB PrivateKey,
    PCRYPT_RESOLVE_HCRYPTPROV_FUNC pResolvehCryptProvFunc,
    LPVOID pVoidResolveFunc,
    PCRYPT_DECRYPT_PRIVATE_KEY_FUNC pDecryptPrivateKeyFunc,
    LPVOID pVoidDecryptFunc,
  } CRYPT_PKCS8_IMPORT_PARAMS;
  typedef enum WINAPI_CertSelectFlags {
    CERT_SELECT_ALLOW_EXPIRED = 0x00000001,
    CERT_SELECT_TRUSTED_ROOT = 0x00000002,
    CERT_SELECT_DISALLOW_SELFSIGNED = 0x00000004,
    CERT_SELECT_HAS_PRIVATE_KEY = 0x00000008,
    CERT_SELECT_HAS_KEY_FOR_SIGNATURE = 0x00000010,
    CERT_SELECT_HAS_KEY_FOR_KEY_EXCHANGE = 0x00000020,
    CERT_SELECT_HARDWARE_ONLY = 0x00000040,
    CERT_SELECT_ALLOW_DUPLICATES = 0x00000080,
  } WINAPI_CertSelectFlags;
  typedef enum WINAPI_CertificateStoreContextType {
    CERT_STORE_CERTIFICATE_CONTEXT = 1,
    CERT_STORE_CRL_CONTEXT = 2,
    CERT_STORE_CTL_CONTEXT = 3,
  } WINAPI_CertificateStoreContextType;
  typedef DWORD WINAPI_CertCreateContextFlags; //Alias
  typedef DWORD WINAPI_CertCloseStoreFlags; //Alias
  typedef enum WINAPI_CertControlType {
    CERT_STORE_CTRL_RESYNC = 1,
    CERT_STORE_CTRL_NOTIFY_CHANGE = 2,
    CERT_STORE_CTRL_COMMIT = 3,
    CERT_STORE_CTRL_AUTO_RESYNC = 4,
    CERT_STORE_CTRL_CANCEL_NOTIFY = 5,
  } WINAPI_CertControlType;
  typedef enum WINAPI_CryptInstallOIDFlags {
    CRYPT_INSTALL_OID_FUNC_BEFORE_FLAG = 1,
  } WINAPI_CryptInstallOIDFlags;
  typedef enum WINAPI_CertStoreAddDisposition {
    CERT_STORE_ADD_NEW = 1,
    CERT_STORE_ADD_USE_EXISTING = 2,
    CERT_STORE_ADD_REPLACE_EXISTING = 3,
    CERT_STORE_ADD_ALWAYS = 4,
    CERT_STORE_ADD_REPLACE_EXISTING_INHERIT_PROPERTIES = 5,
    CERT_STORE_ADD_NEWER = 6,
    CERT_STORE_ADD_NEWER_INHERIT_PROPERTIES = 7,
  } WINAPI_CertStoreAddDisposition;
  typedef DWORD WINAPI_CertChainFlags; //Alias
  typedef enum WINAPI_CertPropId {
    CERT_KEY_PROV_HANDLE_PROP_ID = 1,
    CERT_KEY_PROV_INFO_PROP_ID = 2,
    CERT_SHA1_HASH_PROP_ID = 3,
    CERT_MD5_HASH_PROP_ID = 4,
    CERT_KEY_CONTEXT_PROP_ID = 5,
    CERT_KEY_SPEC_PROP_ID = 6,
    CERT_IE30_RESERVED_PROP_ID = 7,
    CERT_PUBKEY_HASH_RESERVED_PROP_ID = 8,
    CERT_ENHKEY_USAGE_PROP_ID = 9,
    CERT_NEXT_UPDATE_LOCATION_PROP_ID = 10,
    CERT_FRIENDLY_NAME_PROP_ID = 11,
    CERT_PVK_FILE_PROP_ID = 12,
    CERT_DESCRIPTION_PROP_ID = 13,
    CERT_ACCESS_STATE_PROP_ID = 14,
    CERT_SIGNATURE_HASH_PROP_ID = 15,
    CERT_SMART_CARD_DATA_PROP_ID = 16,
    CERT_EFS_PROP_ID = 17,
    CERT_FORTEZZA_DATA_PROP_ID = 18,
    CERT_ARCHIVED_PROP_ID = 19,
    CERT_KEY_IDENTIFIER_PROP_ID = 20,
    CERT_AUTO_ENROLL_PROP_ID = 21,
    CERT_PUBKEY_ALG_PARA_PROP_ID = 22,
    CERT_CROSS_CERT_DIST_POINTS_PROP_ID = 23,
    CERT_ISSUER_PUBLIC_KEY_MD5_HASH_PROP_ID = 24,
    CERT_SUBJECT_PUBLIC_KEY_MD5_HASH_PROP_ID = 25,
    CERT_ENROLLMENT_PROP_ID = 26,
    CERT_DATE_STAMP_PROP_ID = 27,
    CERT_ISSUER_SERIAL_NUMBER_MD5_HASH_PROP_ID = 28,
    CERT_SUBJECT_NAME_MD5_HASH_PROP_ID = 29,
    CERT_EXTENDED_ERROR_INFO_PROP_ID = 30,
    CERT_RENEWAL_PROP_ID = 64,
    CERT_ARCHIVED_KEY_HASH_PROP_ID = 65,
    CERT_AUTO_ENROLL_RETRY_PROP_ID = 66,
    CERT_AIA_URL_RETRIEVED_PROP_ID = 67,
    CERT_AUTHORITY_INFO_ACCESS_PROP_ID = 68,
    CERT_BACKED_UP_PROP_ID = 69,
    CERT_OCSP_RESPONSE_PROP_ID = 70,
    CERT_REQUEST_ORIGINATOR_PROP_ID = 71,
    CERT_SOURCE_LOCATION_PROP_ID = 72,
    CERT_SOURCE_URL_PROP_ID = 73,
    CERT_NEW_KEY_PROP_ID = 74,
    CERT_OCSP_CACHE_PREFIX_PROP_ID = 75,
    CERT_SMART_CARD_ROOT_INFO_PROP_ID = 76,
    CERT_NO_AUTO_EXPIRE_CHECK_PROP_ID = 77,
    CERT_NCRYPT_KEY_HANDLE_PROP_ID = 78,
    CERT_HCRYPTPROV_OR_NCRYPT_KEY_HANDLE_PROP_ID = 79,
    CERT_SUBJECT_INFO_ACCESS_PROP_ID = 80,
    CERT_CA_OCSP_AUTHORITY_INFO_ACCESS_PROP_ID = 81,
    CERT_CA_DISABLE_CRL_PROP_ID = 82,
    CERT_ROOT_PROGRAM_CERT_POLICIES_PROP_ID = 83,
    CERT_ROOT_PROGRAM_NAME_CONSTRAINTS_PROP_ID = 84,
    CERT_FIRST_RESERVED_PROP_ID = 85,
  } WINAPI_CertPropId;
  typedef DWORD WINAPI_CertSetPropertyFlags; //Alias
  typedef DWORD WINAPI_CryptEncodeObjectFlags; //Alias
  typedef DWORD WINAPI_CryptStringFlags; //Alias
  typedef DWORD WINAPI_CertStrType; //Alias
  typedef enum WINAPI_CertNameType {
    CERT_NAME_EMAIL_TYPE = 1,
    CERT_NAME_RDN_TYPE = 2,
    CERT_NAME_ATTR_TYPE = 3,
    CERT_NAME_SIMPLE_DISPLAY_TYPE = 4,
    CERT_NAME_FRIENDLY_DISPLAY_TYPE = 5,
    CERT_NAME_DNS_TYPE = 6,
    CERT_NAME_URL_TYPE = 7,
    CERT_NAME_UPN_TYPE = 8,
  } WINAPI_CertNameType;
  typedef DWORD WINAPI_CertNameFlags; //Alias
  typedef enum WINAPI_CryptObjectType {
    CERT_QUERY_OBJECT_FILE = 0x00000001,
    CERT_QUERY_OBJECT_BLOB = 0x00000002,
  } WINAPI_CryptObjectType;
  typedef DWORD WINAPI_CryptExpectedContentType; //Alias
  typedef DWORD WINAPI_CryptExpectedFormatType; //Alias
  typedef enum WINAPI_CryptFormatType {
    CERT_QUERY_FORMAT_BINARY = 1,
    CERT_QUERY_FORMAT_BASE64_ENCODED = 2,
    CERT_QUERY_FORMAT_ASN_ASCII_HEX_ENCODED = 3,
  } WINAPI_CryptFormatType;
  typedef enum WINAPI_CryptContentType {
    CERT_QUERY_CONTENT_CERT = 1,
    CERT_QUERY_CONTENT_CTL = 2,
    CERT_QUERY_CONTENT_CRL = 3,
    CERT_QUERY_CONTENT_SERIALIZED_STORE = 4,
    CERT_QUERY_CONTENT_SERIALIZED_CERT = 5,
    CERT_QUERY_CONTENT_SERIALIZED_CTL = 6,
    CERT_QUERY_CONTENT_SERIALIZED_CRL = 7,
    CERT_QUERY_CONTENT_PKCS7_SIGNED = 8,
    CERT_QUERY_CONTENT_PKCS7_UNSIGNED = 9,
    CERT_QUERY_CONTENT_PKCS7_SIGNED_EMBED = 10,
    CERT_QUERY_CONTENT_PKCS10 = 11,
    CERT_QUERY_CONTENT_PFX = 12,
    CERT_QUERY_CONTENT_CERT_PAIR = 13,
    CERT_QUERY_CONTENT_PFX_AND_LOAD = 14,
  } WINAPI_CryptContentType;
  typedef enum WINAPI_CryptSubjectType {
    CRYPT_VERIFY_CERT_SIGN_SUBJECT_BLOB = 1,
    CRYPT_VERIFY_CERT_SIGN_SUBJECT_CERT = 2,
    CRYPT_VERIFY_CERT_SIGN_SUBJECT_CRL = 3,
    CRYPT_VERIFY_CERT_SIGN_SUBJECT_OCSP_BASIC_SIGNED_RESPONSE = 4,
  } WINAPI_CryptSubjectType;
  typedef enum WINAPI_CryptIssuerType {
    CRYPT_VERIFY_CERT_SIGN_ISSUER_PUBKEY = 1,
    CRYPT_VERIFY_CERT_SIGN_ISSUER_CERT = 2,
    CRYPT_VERIFY_CERT_SIGN_ISSUER_CHAIN = 3,
    CRYPT_VERIFY_CERT_SIGN_ISSUER_NULL = 4,
  } WINAPI_CryptIssuerType;
  typedef DWORD WINAPI_CryptDecodeObjectFlags; //Alias
  typedef DWORD WINAPI_CertOpenStoreFlags; //Alias
  typedef DWORD WINAPI_CertFindFlags; //Alias
  typedef DWORD WINAPI_CryptProtectDataFlags; //Alias
  typedef DWORD WINAPI_CryptMsgOpenFlags; //Alias
  typedef enum WINAPI_CryptMsgType {
    CMSG_DATA = 1,
    CMSG_SIGNED = 2,
    CMSG_ENVELOPED = 3,
    CMSG_SIGNED_AND_ENVELOPED = 4,
    CMSG_HASHED = 5,
    CMSG_ENCRYPTED = 6,
  } WINAPI_CryptMsgType;
  typedef enum WINAPI_CryptMsgParamType {
    CMSG_TYPE_PARAM = 1,
    CMSG_CONTENT_PARAM = 2,
    CMSG_BARE_CONTENT_PARAM = 3,
    CMSG_INNER_CONTENT_TYPE_PARAM = 4,
    CMSG_SIGNER_COUNT_PARAM = 5,
    CMSG_SIGNER_INFO_PARAM = 6,
    CMSG_SIGNER_CERT_INFO_PARAM = 7,
    CMSG_SIGNER_HASH_ALGORITHM_PARAM = 8,
    CMSG_SIGNER_AUTH_ATTR_PARAM = 9,
    CMSG_SIGNER_UNAUTH_ATTR_PARAM = 10,
    CMSG_CERT_COUNT_PARAM = 11,
    CMSG_CERT_PARAM = 12,
    CMSG_CRL_COUNT_PARAM = 13,
    CMSG_CRL_PARAM = 14,
    CMSG_ENVELOPE_ALGORITHM_PARAM = 15,
    CMSG_RECIPIENT_COUNT_PARAM = 17,
    CMSG_RECIPIENT_INDEX_PARAM = 18,
    CMSG_RECIPIENT_INFO_PARAM = 19,
    CMSG_HASH_ALGORITHM_PARAM = 20,
    CMSG_HASH_DATA_PARAM = 21,
    CMSG_COMPUTED_HASH_PARAM = 22,
    CMSG_ENCRYPT_PARAM = 26,
    CMSG_ENCRYPTED_DIGEST = 27,
    CMSG_ENCODED_SIGNER = 28,
    CMSG_ENCODED_MESSAGE = 29,
    CMSG_VERSION_PARAM = 30,
    CMSG_ATTR_CERT_COUNT_PARAM = 31,
    CMSG_ATTR_CERT_PARAM = 32,
    CMSG_CMS_RECIPIENT_COUNT_PARAM = 33,
    CMSG_CMS_RECIPIENT_INDEX_PARAM = 34,
    CMSG_CMS_RECIPIENT_ENCRYPTED_KEY_INDEX_PARAM = 35,
    CMSG_CMS_RECIPIENT_INFO_PARAM = 36,
    CMSG_UNPROTECTED_ATTR_PARAM = 37,
    CMSG_SIGNER_CERT_ID_PARAM = 38,
    CMSG_CMS_SIGNER_INFO_PARAM = 39,
  } WINAPI_CryptMsgParamType;
  typedef enum WINAPI_CryptMsgControlType {
    CMSG_CTRL_VERIFY_SIGNATURE = 1,
    CMSG_CTRL_DECRYPT = 2,
    CMSG_CTRL_VERIFY_HASH = 5,
    CMSG_CTRL_ADD_SIGNER = 6,
    CMSG_CTRL_DEL_SIGNER = 7,
    CMSG_CTRL_ADD_SIGNER_UNAUTH_ATTR = 8,
    CMSG_CTRL_DEL_SIGNER_UNAUTH_ATTR = 9,
    CMSG_CTRL_ADD_CERT = 10,
    CMSG_CTRL_DEL_CERT = 11,
    CMSG_CTRL_ADD_CRL = 12,
    CMSG_CTRL_DEL_CRL = 13,
    CMSG_CTRL_ADD_ATTR_CERT = 14,
    CMSG_CTRL_DEL_ATTR_CERT = 15,
    CMSG_CTRL_KEY_TRANS_DECRYPT = 16,
    CMSG_CTRL_KEY_AGREE_DECRYPT = 17,
    CMSG_CTRL_MAIL_LIST_DECRYPT = 18,
    CMSG_CTRL_VERIFY_SIGNATURE_EX = 19,
    CMSG_CTRL_ADD_CMS_SIGNER_INFO = 20,
  } WINAPI_CryptMsgControlType;
  typedef enum WINAPI_CryptMsgControlFlags {
    CMSG_CRYPT_RELEASE_CONTEXT_FLAG = 0x00008000,
  } WINAPI_CryptMsgControlFlags;
  typedef enum WINAPI_CryptMsgSignerType {
    CMSG_VERIFY_SIGNER_PUBKEY = 1,
    CMSG_VERIFY_SIGNER_CERT = 2,
    CMSG_VERIFY_SIGNER_CHAIN = 3,
    CMSG_VERIFY_SIGNER_NULL = 4,
  } WINAPI_CryptMsgSignerType;
  typedef DWORD WINAPI_CertFindType; //Alias
  typedef enum WINAPI_CrlFindType {
    CRL_FIND_ANY = 0,
    CRL_FIND_ISSUED_BY = 1,
    CRL_FIND_EXISTING = 2,
    CRL_FIND_ISSUED_FOR = 3,
  } WINAPI_CrlFindType;
  typedef DWORD WINAPI_CrlFindIssuedByFlags; //Alias
  typedef DWORD WINAPI_CryptFindOidInfoKeyType; //Alias
  typedef DWORD WINAPI_CryptFindOidInfoGroudId; //Alias
  typedef DWORD WINAPI_CertSystemStoreFlags; //Alias
  typedef DWORD WINAPI_CertPhysicalStoreFlags; //Alias
  typedef DWORD WINAPI_CryptFormatStrType; //Alias
  typedef enum WINAPI_CryptGroupId {
    CRYPT_HASH_ALG_OID_GROUP_ID = 1,
    CRYPT_ENCRYPT_ALG_OID_GROUP_ID = 2,
    CRYPT_PUBKEY_ALG_OID_GROUP_ID = 3,
    CRYPT_SIGN_ALG_OID_GROUP_ID = 4,
    CRYPT_RDN_ATTR_OID_GROUP_ID = 5,
    CRYPT_EXT_OR_ATTR_OID_GROUP_ID = 6,
    CRYPT_ENHKEY_USAGE_OID_GROUP_ID = 7,
    CRYPT_POLICY_OID_GROUP_ID = 8,
    CRYPT_TEMPLATE_OID_GROUP_ID = 9,
  } WINAPI_CryptGroupId;
  typedef enum WINAPI_CryptProtectMemoryFlags {
    CRYPTPROTECTMEMORY_SAME_PROCESS = 0x00,
    CRYPTPROTECTMEMORY_CROSS_PROCESS = 0x01,
    CRYPTPROTECTMEMORY_SAME_LOGON = 0x02,
  } WINAPI_CryptProtectMemoryFlags;
  typedef union WINAPI_HcryptNcryptUnion {
    HCRYPTPROV hCryptProv,
    NCRYPT_KEY_HANDLE hNCryptKey,
  } WINAPI_HcryptNcryptUnion;
  typedef enum WINAPI_CERT_ID_Choice {
    CERT_ID_ISSUER_SERIAL_NUMBER = 1,
    CERT_ID_KEY_IDENTIFIER = 2,
    CERT_ID_SHA1_HASH = 3,
  } WINAPI_CERT_ID_Choice;
  typedef struct CERT_ISSUER_SERIAL_NUMBER {
    CERT_NAME_BLOB Issuer,
    CRYPT_INTEGER_BLOB SerialNumber,
  } CERT_ISSUER_SERIAL_NUMBER;
  typedef union WINAPI_CERT_ID_u {
    CERT_ISSUER_SERIAL_NUMBER IssuerSerialNumber,
    CRYPT_HASH_BLOB KeyId,
    CRYPT_HASH_BLOB HashId,
  } WINAPI_CERT_ID_u;
  typedef struct CERT_ID {
    WINAPI_CERT_ID_Choice dwIdChoice,
    WINAPI_CERT_ID_u ,
  } CERT_ID;
  typedef struct CMSG_SIGNER_ENCODE_INFO {
    DWORD cbSize,
    PCERT_INFO pCertInfo,
    WINAPI_HcryptNcryptUnion ,
    WINAPI_CryptKeySpec dwKeySpec,
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm,
    void* pvHashAuxInfo,
    DWORD cAuthAttr,
    PCRYPT_ATTRIBUTE rgAuthAttr,
    DWORD cUnauthAttr,
    PCRYPT_ATTRIBUTE rgUnauthAttr,
    CERT_ID SignerId,
    CRYPT_ALGORITHM_IDENTIFIER HashEncryptionAlgorithm,
    void* pvHashEncryptionAuxInfo,
  } CMSG_SIGNER_ENCODE_INFO;
  typedef CMSG_SIGNER_ENCODE_INFO *PCMSG_SIGNER_ENCODE_INFO; //Pointer
  typedef struct CMSG_SIGNED_ENCODE_INFO {
    DWORD cbSize,
    DWORD cSigners,
    PCMSG_SIGNER_ENCODE_INFO rgSigners,
    DWORD cCertEncoded,
    PCERT_BLOB rgCertEncoded,
    DWORD cCrlEncoded,
    PCRL_BLOB rgCrlEncoded,
    DWORD cAttrCertEncoded,
    PCERT_BLOB rgAttrCertEncoded,
  } CMSG_SIGNED_ENCODE_INFO;
  typedef CMSG_SIGNED_ENCODE_INFO *PCMSG_SIGNED_ENCODE_INFO; //Pointer
  typedef struct CRYPT_KEY_SIGN_MESSAGE_PARA {
    DWORD cbSize,
    DWORD dwMsgAndCertEncodingType,
    WINAPI_HcryptNcryptUnion ,
    DWORD dwKeySpec,
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm,
    void* pvHashAuxInfo,
    CRYPT_ALGORITHM_IDENTIFIER PubKeyAlgorithm,
  } CRYPT_KEY_SIGN_MESSAGE_PARA;
  typedef CRYPT_KEY_SIGN_MESSAGE_PARA *PCRYPT_KEY_SIGN_MESSAGE_PARA; //Pointer
  typedef union WINAPI_CRYPT_OID_INFO_u {
    DWORD dwValue,
    ALG_ID Algid,
    DWORD dwLength,
  } WINAPI_CRYPT_OID_INFO_u;
  typedef struct CRYPT_OID_INFO {
    DWORD cbSize,
    LPCSTR pszOID,
    LPCWSTR pwszName,
    DWORD dwGroupId,
    WINAPI_CRYPT_OID_INFO_u ,
    CRYPT_DATA_BLOB ExtraInfo,
    LPCWSTR pwszCNGAlgid,
    LPCWSTR pwszCNGExtraAlgid,
  } CRYPT_OID_INFO;
  typedef CRYPT_OID_INFO *PCCRYPT_OID_INFO; //Pointer
  typedef struct MS_ADDINFO_FLAT {
    DWORD cbStruct,
    SIP_INDIRECT_DATA* pIndirectData,
  } MS_ADDINFO_FLAT;
  typedef DWORD WINAPI_CRYPTCAT_OPEN; //Alias
  typedef struct CRYPTCATSTORE {
    DWORD cbStruct,
    DWORD dwPublicVersion,
    LPWSTR pwszP7File,
    HCRYPTPROV hProv,
    WINAPI_CertEncodingType dwEncodingType,
    WINAPI_CRYPTCAT_OPEN fdwStoreFlags,
    HANDLE hReserved,
    HANDLE hAttrs,
    HCRYPTMSG hCryptMsg,
    HANDLE hSorted,
  } CRYPTCATSTORE;
  typedef struct MS_ADDINFO_CATALOGMEMBER {
    DWORD cbStruct,
    CRYPTCATSTORE* pStore,
    CRYPTCATMEMBER* pMember,
  } MS_ADDINFO_CATALOGMEMBER;
  typedef struct MS_ADDINFO_BLOB {
    DWORD cbStruct,
    DWORD cbMemObject,
    BYTE* pbMemObject,
    DWORD cbMemSignedMsg,
    BYTE* pbMemSignedMsg,
  } MS_ADDINFO_BLOB;
  typedef union WINAPI_SIP_SUBJECTINFO_u {
    MS_ADDINFO_FLAT* psFlat,
    MS_ADDINFO_CATALOGMEMBER* psCatMember,
    MS_ADDINFO_BLOB* psBlob,
  } WINAPI_SIP_SUBJECTINFO_u;
  typedef DWORD WINAPI_SPC_PE; //Alias
  typedef enum WINAPI_SIP_SUBJECTINFO_Choice {
    MSSIP_ADDINFO_NONE = 0,
    MSSIP_ADDINFO_FLAT = 1,
    MSSIP_ADDINFO_CATMEMBER = 2,
    MSSIP_ADDINFO_BLOB = 3,
    MSSIP_ADDINFO_NONMSSIP = 500,
  } WINAPI_SIP_SUBJECTINFO_Choice;
  typedef struct SIP_SUBJECTINFO {
    DWORD cbSize,
    GUID* pgSubjectType,
    HANDLE hFile,
    LPCWSTR pwsFileName,
    LPCWSTR pwsDisplayName,
    DWORD dwReserved1,
    DWORD dwIntVersion,
    HCRYPTPROV hProv,
    CRYPT_ALGORITHM_IDENTIFIER DigestAlgorithm,
    WINAPI_SPC_PE dwFlags,
    WINAPI_CertEncodingType dwEncodingType,
    DWORD dwReserved2,
    DWORD fdwCAPISettings,
    DWORD fdwSecuritySettings,
    DWORD dwIndex,
    WINAPI_SIP_SUBJECTINFO_Choice dwUnionChoice,
    WINAPI_SIP_SUBJECTINFO_u ,
    LPVOID pClientData,
  } SIP_SUBJECTINFO;
  typedef enum WINAPI_CPD_CHOICE {
    CPD_CHOICE_SIP = 1,
  } WINAPI_CPD_CHOICE;
  typedef DWORD WINAPI_CPD_PROV_FLAGS; //Alias
  typedef enum WINAPI_CPD_UISTATE_MODE {
    CPD_UISTATE_MODE_PROMPT = 0x00000000,
    CPD_UISTATE_MODE_BLOCK = 0x00000001,
    CPD_UISTATE_MODE_ALLOW = 0x00000002,
    CPD_UISTATE_MODE_MASK = 0x00000003,
  } WINAPI_CPD_UISTATE_MODE;
  typedef struct PROVDATA_SIP {
    DWORD cbStruct,
    GUID gSubject,
    SIP_DISPATCH_INFO* pSip,
    SIP_DISPATCH_INFO* pCATSip,
    SIP_SUBJECTINFO* psSipSubjectInfo,
    SIP_SUBJECTINFO* psSipCATSubjectInfo,
    SIP_INDIRECT_DATA* psIndirectData,
  } PROVDATA_SIP;
  typedef enum WINAPI_WTD_UI {
    WTD_UI_ALL = 1,
    WTD_UI_NONE = 2,
    WTD_UI_NOBAD = 3,
    WTD_UI_NOGOOD = 4,
  } WINAPI_WTD_UI;
  typedef DWORD WINAPI_WTD_REVOKE; //Alias
  typedef enum WINAPI_WTD_CHOICE {
    WTD_CHOICE_FILE = 1,
    WTD_CHOICE_CATALOG = 2,
    WTD_CHOICE_BLOB = 3,
    WTD_CHOICE_SIGNER = 4,
    WTD_CHOICE_CERT = 5,
  } WINAPI_WTD_CHOICE;
  typedef struct WINTRUST_FILE_INFO {
    DWORD cbStruct,
    LPCWSTR pcwszFilePath,
    HANDLE hFile,
    GUID* pgKnownSubject,
  } WINTRUST_FILE_INFO;
  typedef struct WINTRUST_CATALOG_INFO {
    DWORD cbStruct,
    DWORD dwCatalogVersion,
    LPCWSTR pcwszCatalogFilePath,
    LPCWSTR pcwszMemberTag,
    LPCWSTR pcwszMemberFilePath,
    HANDLE hMemberFile,
    BYTE* pbCalculatedFileHash,
    DWORD cbCalculatedFileHash,
    PCCTL_CONTEXT pcCatalogContext,
  } WINTRUST_CATALOG_INFO;
  typedef struct WINTRUST_BLOB_INFO {
    DWORD cbStruct,
    GUID gSubject,
    LPCWSTR pcwszDisplayName,
    DWORD cbMemObject,
    BYTE* pbMemObject,
    DWORD cbMemSignedMsg,
    BYTE* pbMemSignedMsg,
  } WINTRUST_BLOB_INFO;
  typedef struct CMSG_SIGNER_INFO {
    DWORD dwVersion,
    CERT_NAME_BLOB Issuer,
    CRYPT_INTEGER_BLOB SerialNumber,
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm,
    CRYPT_ALGORITHM_IDENTIFIER HashEncryptionAlgorithm,
    CRYPT_DATA_BLOB EncryptedHash,
    CRYPT_ATTRIBUTES AuthAttrs,
    CRYPT_ATTRIBUTES UnauthAttrs,
  } CMSG_SIGNER_INFO;
  typedef struct WINTRUST_SGNR_INFO {
    DWORD cbStruct,
    LPCWSTR pcwszDisplayName,
    CMSG_SIGNER_INFO* psSignerInfo,
    DWORD chStores,
    HCERTSTORE* pahStores,
  } WINTRUST_SGNR_INFO;
  typedef DWORD WINAPI_WINTRUST_CERT_INFO_FLAGS; //Alias
  typedef struct WINTRUST_CERT_INFO {
    DWORD cbStruct,
    LPCWSTR pcwszDisplayName,
    CERT_CONTEXT* psCertContext,
    DWORD chStores,
    HCERTSTORE* pahStores,
    WINAPI_WINTRUST_CERT_INFO_FLAGS dwFlags,
    FILETIME* psftVerifyAsOf,
  } WINTRUST_CERT_INFO;
  typedef union WINAPI_WINTRUST_DATA_u {
    WINTRUST_FILE_INFO* pFile,
    WINTRUST_CATALOG_INFO* pCatalog,
    WINTRUST_BLOB_INFO* pBlob,
    WINTRUST_SGNR_INFO* pSgnr,
    WINTRUST_CERT_INFO* pCert,
  } WINAPI_WINTRUST_DATA_u;
  typedef enum WINAPI_WTD_STATEACTION {
    WTD_STATEACTION_IGNORE = 0x00000000,
    WTD_STATEACTION_VERIFY = 0x00000001,
    WTD_STATEACTION_CLOSE = 0x00000002,
    WTD_STATEACTION_AUTO_CACHE = 0x00000003,
    WTD_STATEACTION_AUTO_CACHE_FLUSH = 0x00000004,
  } WINAPI_WTD_STATEACTION;
  typedef DWORD WINAPI_WTD_PROV_FLAGS; //Alias
  typedef enum WINAPI_WTD_UICONTEXT {
    WTD_UICONTEXT_EXECUTE = 0,
    WTD_UICONTEXT_INSTALL = 1,
  } WINAPI_WTD_UICONTEXT;
  typedef struct WINTRUST_DATA {
    DWORD cbStruct,
    LPVOID pPolicyCallbackData,
    LPVOID pSIPClientData,
    WINAPI_WTD_UI dwUIChoice,
    WINAPI_WTD_REVOKE fdwRevocationChecks,
    WINAPI_WTD_CHOICE dwUnionChoice,
    WINAPI_WINTRUST_DATA_u ,
    WINAPI_WTD_STATEACTION dwStateAction,
    HANDLE hWVTStateData,
    WCHAR* pwszURLReference,
    WINAPI_WTD_PROV_FLAGS dwProvFlags,
    WINAPI_WTD_UICONTEXT dwUIContext,
  } WINTRUST_DATA;
  typedef struct CERT_TRUST_LIST_INFO {
    DWORD cbSize,
    PCTL_ENTRY pCtlEntry,
    PCCTL_CONTEXT pCtlContext,
  } CERT_TRUST_LIST_INFO;
  typedef CERT_TRUST_LIST_INFO *PCERT_TRUST_LIST_INFO; //Pointer
  typedef struct CERT_SIMPLE_CHAIN {
    DWORD cbSize,
    CERT_TRUST_STATUS TrustStatus,
    DWORD cElement,
    PCERT_CHAIN_ELEMENT* rgpElement,
    PCERT_TRUST_LIST_INFO pTrustListInfo,
    BOOL fHasRevocationFreshnessTime,
    DWORD dwRevocationFreshnessTime,
  } CERT_SIMPLE_CHAIN;
  typedef CERT_SIMPLE_CHAIN *PCERT_SIMPLE_CHAIN; //Pointer
  typedef struct CERT_CHAIN_CONTEXT {
    DWORD cbSize,
    CERT_TRUST_STATUS TrustStatus,
    DWORD cChain,
    PCERT_SIMPLE_CHAIN* rgpChain,
    DWORD cLowerQualityChainContext,
    LPVOID rgpLowerQualityChainContext,
    BOOL fHasRevocationFreshnessTime,
    DWORD dwRevocationFreshnessTime,
    DWORD dwCreateFlags,
    GUID ChainId,
  } CERT_CHAIN_CONTEXT;
  typedef CERT_CHAIN_CONTEXT *PCCERT_CHAIN_CONTEXT; //Pointer
  typedef enum WINAPI_SGNR_TYPE {
    SGNR_TYPE_TIMESTAMP = 0x00000010,
  } WINAPI_SGNR_TYPE;
  typedef struct CRYPT_PROVIDER_SGNR {
    DWORD cbStruct,
    FILETIME sftVerifyAsOf,
    DWORD csCertChain,
    CRYPT_PROVIDER_CERT* pasCertChain,
    WINAPI_SGNR_TYPE dwSignerType,
    CMSG_SIGNER_INFO* psSigner,
    DWORD dwError,
    DWORD csCounterSigners,
    LPVOID pasCounterSigners,
    PCCERT_CHAIN_CONTEXT pChainContext,
  } CRYPT_PROVIDER_SGNR;
  typedef struct CRYPT_PROVIDER_DATA {
    DWORD cbStruct,
    WINTRUST_DATA* pWintrustData,
    BOOL fOpenedFile,
    HWND hWndParent,
    GUID* pgActionID,
    HCRYPTPROV hProv,
    DWORD dwError,
    DWORD dwRegSecuritySettings,
    DWORD dwRegPolicySettings,
    CRYPT_PROVIDER_FUNCTIONS* psPfns,
    DWORD cdwTrustStepErrors,
    DWORD* padwTrustStepErrors,
    DWORD chStores,
    HCERTSTORE* pahStores,
    DWORD dwEncoding,
    HCRYPTMSG hMsg,
    DWORD csSigners,
    CRYPT_PROVIDER_SGNR* pasSigners,
    DWORD csProvPrivData,
    CRYPT_PROVIDER_PRIVDATA* pasProvPrivData,
    WINAPI_CPD_CHOICE dwSubjectChoice,
    PROVDATA_SIP* pPDSip,
    char* pszUsageOID,
    BOOL fRecallWithState,
    FILETIME sftSystemTime,
    char* pszCTLSignerUsageOID,
    WINAPI_CPD_PROV_FLAGS dwProvFlags,
    DWORD dwFinalError,
    PCERT_USAGE_MATCH pRequestUsage,
    DWORD dwTrustPubSettings,
    WINAPI_CPD_UISTATE_MODE dwUIStateFlags,
  } CRYPT_PROVIDER_DATA;
  typedef enum WINAPI_SIGNER_SIGNATURE_CHOICE {
    SIGNER_NO_ATTR = 0,
    SIGNER_AUTHCODE_ATTR = 1,
  } WINAPI_SIGNER_SIGNATURE_CHOICE;
  typedef struct SIGNER_ATTR_AUTHCODE {
    DWORD cbSize,
    BOOL fCommercial,
    BOOL fIndividual,
    LPCWSTR pwszName,
    LPCWSTR pwszInfo,
  } SIGNER_ATTR_AUTHCODE;
  typedef struct SIGNER_SIGNATURE_INFO {
    DWORD cbSize,
    ALG_ID algidHash,
    WINAPI_SIGNER_SIGNATURE_CHOICE dwAttrChoice,
    SIGNER_ATTR_AUTHCODE* pAttrAuthcode,
    PCRYPT_ATTRIBUTES psAuthenticated,
    PCRYPT_ATTRIBUTES psUnauthenticated,
  } SIGNER_SIGNATURE_INFO;
  typedef enum WINAPI_PVK_TYPE {
    PVK_TYPE_FILE_NAME = 1,
    PVK_TYPE_KEYCONTAINER = 2,
  } WINAPI_PVK_TYPE;
  typedef union WINAPI_SIGNER_PROVIDER_INFO_u {
    LPWSTR pwszPvkFileName,
    LPWSTR pwszKeyContainer,
  } WINAPI_SIGNER_PROVIDER_INFO_u;
  typedef struct SIGNER_PROVIDER_INFO {
    DWORD cbSize,
    LPCWSTR pwszProviderName,
    DWORD dwProviderType,
    DWORD dwKeySpec,
    WINAPI_PVK_TYPE dwPvkChoice,
    WINAPI_SIGNER_PROVIDER_INFO_u ,
  } SIGNER_PROVIDER_INFO;
  typedef enum WINAPI_SIGNER_SUBJECT {
    SIGNER_SUBJECT_FILE = 1,
    SIGNER_SUBJECT_BLOB = 2,
  } WINAPI_SIGNER_SUBJECT;
  typedef struct SIGNER_FILE_INFO {
    DWORD cbSize,
    LPCWSTR pwszFileName,
    HANDLE hFile,
  } SIGNER_FILE_INFO;
  typedef struct SIGNER_BLOB_INFO {
    DWORD cbSize,
    GUID* pGuidSubject,
    DWORD cbBlob,
    BYTE* pbBlob,
    LPCWSTR pwszDisplayName,
  } SIGNER_BLOB_INFO;
  typedef union WINAPI_SIGNER_SUBJECT_INFO_u {
    SIGNER_FILE_INFO* pSignerFileInfo,
    SIGNER_BLOB_INFO* pSignerBlobInfo,
  } WINAPI_SIGNER_SUBJECT_INFO_u;
  typedef struct SIGNER_SUBJECT_INFO {
    DWORD cbSize,
    DWORD* pdwIndex,
    WINAPI_SIGNER_SUBJECT dwSubjectChoice,
    WINAPI_SIGNER_SUBJECT_INFO_u ,
  } SIGNER_SUBJECT_INFO;
  typedef enum WINAPI_SIGNER_CERT_CHOICE {
    SIGNER_CERT_SPC_FILE = 1,
    SIGNER_CERT_STORE = 2,
    SIGNER_CERT_SPC_CHAIN = 3,
  } WINAPI_SIGNER_CERT_CHOICE;
  typedef DWORD WINAPI_SIGNER_CERT_POLICY; //Alias
  typedef struct SIGNER_CERT_STORE_INFO {
    DWORD cbSize,
    PCCERT_CONTEXT pSigningCert,
    WINAPI_SIGNER_CERT_POLICY dwCertPolicy,
    HCERTSTORE hCertStore,
  } SIGNER_CERT_STORE_INFO;
  typedef struct SIGNER_SPC_CHAIN_INFO {
    DWORD cbSize,
    LPCWSTR pwszSpcFile,
    WINAPI_SIGNER_CERT_POLICY dwCertPolicy,
    HCERTSTORE hCertStore,
  } SIGNER_SPC_CHAIN_INFO;
  typedef union WINAPI_SIGNER_CERT_u {
    LPCWSTR pwszSpcFile,
    SIGNER_CERT_STORE_INFO* pCertStoreInfo,
    SIGNER_SPC_CHAIN_INFO* pSpcChainInfo,
  } WINAPI_SIGNER_CERT_u;
  typedef struct SIGNER_CERT {
    DWORD cbSize,
    WINAPI_SIGNER_CERT_CHOICE dwCertChoice,
    WINAPI_SIGNER_CERT_u ,
    HWND hwnd,
  } SIGNER_CERT;
]]

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
  typedef unsigned int ALG_ID; //Alias
  static const ALG_ID CALG_MD2 = 0x00008001;
  static const ALG_ID CALG_MD4 = 0x00008002;
  static const ALG_ID CALG_MD5 = 0x00008003;
  static const ALG_ID CALG_SHA = 0x00008004;
  static const ALG_ID CALG_SHA1 = 0x00008004;
  static const ALG_ID CALG_MAC = 0x00008005;
  static const ALG_ID CALG_RSA_SIGN = 0x00002400;
  static const ALG_ID CALG_DSS_SIGN = 0x00002200;
  static const ALG_ID CALG_NO_SIGN = 0x00002000;
  static const ALG_ID CALG_RSA_KEYX = 0x0000a400;
  static const ALG_ID CALG_DES = 0x00006601;
  static const ALG_ID CALG_3DES_112 = 0x00006609;
  static const ALG_ID CALG_3DES = 0x00006603;
  static const ALG_ID CALG_DESX = 0x00006604;
  static const ALG_ID CALG_RC2 = 0x00006602;
  static const ALG_ID CALG_RC4 = 0x00006801;
  static const ALG_ID CALG_SEAL = 0x00006802;
  static const ALG_ID CALG_DH_SF = 0x0000aa01;
  static const ALG_ID CALG_DH_EPHEM = 0x0000aa02;
  static const ALG_ID CALG_AGREEDKEY_ANY = 0x0000aa03;
  static const ALG_ID CALG_KEA_KEYX = 0x0000aa04;
  static const ALG_ID CALG_HUGHES_MD5 = 0x0000a003;
  static const ALG_ID CALG_SKIPJACK = 0x0000660a;
  static const ALG_ID CALG_TEK = 0x0000660b;
  static const ALG_ID CALG_CYLINK_MEK = 0x0000660c;
  static const ALG_ID CALG_SSL3_SHAMD5 = 0x00008008;
  static const ALG_ID CALG_SSL3_MASTER = 0x00004c01;
  static const ALG_ID CALG_SCHANNEL_MASTER_HASH = 0x00004c02;
  static const ALG_ID CALG_SCHANNEL_MAC_KEY = 0x00004c03;
  static const ALG_ID CALG_SCHANNEL_ENC_KEY = 0x00004c07;
  static const ALG_ID CALG_PCT1_MASTER = 0x00004c04;
  static const ALG_ID CALG_SSL2_MASTER = 0x00004c05;
  static const ALG_ID CALG_TLS1_MASTER = 0x00004c06;
  static const ALG_ID CALG_RC5 = 0x0000660d;
  static const ALG_ID CALG_HMAC = 0x00008009;
  static const ALG_ID CALG_TLS1PRF = 0x0000800a;
  static const ALG_ID CALG_HASH_REPLACE_OWF = 0x0000800b;
  static const ALG_ID CALG_AES_128 = 0x0000660e;
  static const ALG_ID CALG_AES_192 = 0x0000660f;
  static const ALG_ID CALG_AES_256 = 0x00006610;
  static const ALG_ID CALG_AES = 0x00006611;
  static const ALG_ID CALG_SHA_256 = 0x0000800c;
  static const ALG_ID CALG_SHA_384 = 0x0000800d;
  static const ALG_ID CALG_SHA_512 = 0x0000800e;
  static const ALG_ID CALG_ECDH = 0x0000aa05;
  static const ALG_ID CALG_ECMQV = 0x0000a001;
  static const ALG_ID CALG_ECDSA = 0x00002203;
  typedef DWORD CryptAcquireContextFlags; //Alias
  typedef DWORD CryptProv; //Alias
  static const CryptProv PROV_RSA_FULL = 1;
  static const CryptProv PROV_RSA_SIG = 2;
  static const CryptProv PROV_DSS = 3;
  static const CryptProv PROV_FORTEZZA = 4;
  static const CryptProv PROV_MS_EXCHANGE = 5;
  static const CryptProv PROV_SSL = 6;
  static const CryptProv PROV_STT_MER = 7;
  static const CryptProv PROV_STT_ACQ = 8;
  static const CryptProv PROV_STT_BRND = 9;
  static const CryptProv PROV_STT_ROOT = 10;
  static const CryptProv PROV_STT_ISS = 11;
  static const CryptProv PROV_RSA_SCHANNEL = 12;
  static const CryptProv PROV_DSS_DH = 13;
  static const CryptProv PROV_EC_ECDSA_SIG = 14;
  static const CryptProv PROV_EC_ECNRA_SIG = 15;
  static const CryptProv PROV_EC_ECDSA_FULL = 16;
  static const CryptProv PROV_EC_ECNRA_FULL = 17;
  static const CryptProv PROV_DH_SCHANNEL = 18;
  static const CryptProv PROV_SPYRUS_LYNKS = 20;
  static const CryptProv PROV_RNG = 21;
  static const CryptProv PROV_INTEL_SEC = 22;
  static const CryptProv PROV_REPLACE_OWF = 23;
  static const CryptProv PROV_RSA_AES = 24;
  typedef DWORD CryptCreateHashFlags; //Alias
  static const CryptCreateHashFlags CRYPT_SECRETDIGEST = 0x00000001;
  typedef DWORD CryptHashDataFlags; //Alias
  static const CryptHashDataFlags CRYPT_USERDATA = 1;
  typedef DWORD CryptBlobType; //Alias
  static const CryptBlobType SIMPLEBLOB = 0x1;
  static const CryptBlobType PUBLICKEYBLOB = 0x6;
  static const CryptBlobType PRIVATEKEYBLOB = 0x7;
  static const CryptBlobType PLAINTEXTKEYBLOB = 0x8;
  static const CryptBlobType OPAQUEKEYBLOB = 0x9;
  static const CryptBlobType PUBLICKEYBLOBEX = 0xA;
  static const CryptBlobType SYMMETRICWRAPKEYBLOB = 0xB;
  static const CryptBlobType KEYSTATEBLOB = 0xC;
  typedef DWORD CryptExportKeyFlags; //Alias
  typedef DWORD CryptKeyParam; //Alias
  static const CryptKeyParam KP_IV = 1;
  static const CryptKeyParam KP_SALT = 2;
  static const CryptKeyParam KP_PADDING = 3;
  static const CryptKeyParam KP_MODE = 4;
  static const CryptKeyParam KP_MODE_BITS = 5;
  static const CryptKeyParam KP_PERMISSIONS = 6;
  static const CryptKeyParam KP_ALGID = 7;
  static const CryptKeyParam KP_BLOCKLEN = 8;
  static const CryptKeyParam KP_KEYLEN = 9;
  static const CryptKeyParam KP_SALT_EX = 10;
  static const CryptKeyParam KP_P = 11;
  static const CryptKeyParam KP_G = 12;
  static const CryptKeyParam KP_Q = 13;
  static const CryptKeyParam KP_X = 14;
  static const CryptKeyParam KP_Y = 15;
  static const CryptKeyParam KP_RA = 16;
  static const CryptKeyParam KP_RB = 17;
  static const CryptKeyParam KP_INFO = 18;
  static const CryptKeyParam KP_EFFECTIVE_KEYLEN = 19;
  static const CryptKeyParam KP_SCHANNEL_ALG = 20;
  static const CryptKeyParam KP_CLIENT_RANDOM = 21;
  static const CryptKeyParam KP_SERVER_RANDOM = 22;
  static const CryptKeyParam KP_RP = 23;
  static const CryptKeyParam KP_PRECOMP_MD5 = 24;
  static const CryptKeyParam KP_PRECOMP_SHA = 25;
  static const CryptKeyParam KP_CERTIFICATE = 26;
  static const CryptKeyParam KP_CLEAR_KEY = 27;
  static const CryptKeyParam KP_PUB_EX_LEN = 28;
  static const CryptKeyParam KP_PUB_EX_VAL = 29;
  static const CryptKeyParam KP_KEYVAL = 30;
  static const CryptKeyParam KP_ADMIN_PIN = 31;
  static const CryptKeyParam KP_KEYEXCHANGE_PIN = 32;
  static const CryptKeyParam KP_SIGNATURE_PIN = 33;
  static const CryptKeyParam KP_PREHASH = 34;
  static const CryptKeyParam KP_ROUNDS = 35;
  static const CryptKeyParam KP_OAEP_PARAMS = 36;
  static const CryptKeyParam KP_CMS_KEY_INFO = 37;
  static const CryptKeyParam KP_CMS_DH_KEY_INFO = 38;
  static const CryptKeyParam KP_PUB_PARAMS = 39;
  static const CryptKeyParam KP_VERIFY_PARAMS = 40;
  static const CryptKeyParam KP_HIGHEST_VERSION = 41;
  static const CryptKeyParam KP_GET_USE_COUNT = 42;
  typedef DWORD CryptImportKeyFlags; //Alias
  typedef DWORD CryptSignFlags; //Alias
  typedef DWORD CryptKeySpec; //Alias
  static const CryptKeySpec AT_KEYEXCHANGE = 1;
  static const CryptKeySpec AT_SIGNATURE = 2;
  typedef DWORD CryptSetProvParam; //Alias
  static const CryptSetProvParam PP_CLIENT_HWND = 1;
  static const CryptSetProvParam PP_KEYSET_SEC_DESCR = 8;
  static const CryptSetProvParam PP_CONTEXT_INFO = 11;
  static const CryptSetProvParam PP_KEYEXCHANGE_KEYSIZE = 12;
  static const CryptSetProvParam PP_SIGNATURE_KEYSIZE = 13;
  static const CryptSetProvParam PP_KEYEXCHANGE_ALG = 14;
  static const CryptSetProvParam PP_SIGNATURE_ALG = 15;
  static const CryptSetProvParam PP_UI_PROMPT = 21;
  static const CryptSetProvParam PP_DELETEKEY = 24;
  static const CryptSetProvParam PP_SIGNATURE_PIN = 33;
  static const CryptSetProvParam PP_USE_HARDWARE_RNG = 38;
  static const CryptSetProvParam PP_USER_CERTSTORE = 42;
  static const CryptSetProvParam PP_SMARTCARD_READER = 43;
  static const CryptSetProvParam PP_PIN_PROMPT_STRING = 44;
  static const CryptSetProvParam PP_SMARTCARD_GUID = 45;
  static const CryptSetProvParam PP_ROOT_CERTSTORE = 46;
  static const CryptSetProvParam PP_SECURE_KEYEXCHANGE_PIN = 47;
  static const CryptSetProvParam PP_SECURE_SIGNATURE_PIN = 48;
  typedef DWORD CryptGetProvParam; //Alias
  static const CryptGetProvParam PP_ENUMALGS = 1;
  static const CryptGetProvParam PP_ENUMCONTAINERS = 2;
  static const CryptGetProvParam PP_IMPTYPE = 3;
  static const CryptGetProvParam PP_NAME = 4;
  static const CryptGetProvParam PP_VERSION = 5;
  static const CryptGetProvParam PP_CONTAINER = 6;
  static const CryptGetProvParam PP_CHANGE_PASSWORD = 7;
  static const CryptGetProvParam PP_CERTCHAIN = 9;
  static const CryptGetProvParam PP_KEY_TYPE_SUBTYPE = 10;
  static const CryptGetProvParam PP_PROVTYPE = 16;
  static const CryptGetProvParam PP_KEYSTORAGE = 17;
  static const CryptGetProvParam PP_APPLI_CERT = 18;
  static const CryptGetProvParam PP_SYM_KEYSIZE = 19;
  static const CryptGetProvParam PP_SESSION_KEYSIZE = 20;
  static const CryptGetProvParam PP_ENUMALGS_EX = 22;
  static const CryptGetProvParam PP_ENUMMANDROOTS = 25;
  static const CryptGetProvParam PP_ENUMELECTROOTS = 26;
  static const CryptGetProvParam PP_KEYSET_TYPE = 27;
  static const CryptGetProvParam PP_ADMIN_PIN = 31;
  static const CryptGetProvParam PP_KEYEXCHANGE_PIN = 32;
  static const CryptGetProvParam PP_SIG_KEYSIZE_INC = 34;
  static const CryptGetProvParam PP_KEYX_KEYSIZE_INC = 35;
  static const CryptGetProvParam PP_UNIQUE_CONTAINER = 36;
  static const CryptGetProvParam PP_SGC_INFO = 37;
  static const CryptGetProvParam PP_KEYSPEC = 39;
  static const CryptGetProvParam PP_ENUMEX_SIGNING_PROT = 40;
  static const CryptGetProvParam PP_CRYPT_COUNT_KEY_USE = 41;
  typedef DWORD CryptHashParam; //Alias
  static const CryptHashParam HP_ALGID = 0x0001;
  static const CryptHashParam HP_HASHVAL = 0x0002;
  static const CryptHashParam HP_HASHSIZE = 0x0004;
  static const CryptHashParam HP_HMAC_INFO = 0x0005;
  static const CryptHashParam HP_TLS1PRF_LABEL = 0x0006;
  static const CryptHashParam HP_TLS1PRF_SEED = 0x0007;
  typedef struct DATA_BLOB {
    DWORD cbData;
    BYTE* pbData;
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
  typedef DATA_BLOB CRYPT_DATA_BLOB; //Alias
  typedef CRYPT_DATA_BLOB *PCRYPT_DATA_BLOB; //Pointer
  typedef DATA_BLOB CRYPT_ATTR_BLOB; //Alias
  typedef DATA_BLOB CERT_BLOB; //Alias
  typedef CERT_BLOB *PCERT_BLOB; //Pointer
  typedef DATA_BLOB CRL_BLOB; //Alias
  typedef CRL_BLOB *PCRL_BLOB; //Pointer
  typedef struct BCryptBuffer {
    ULONG cbBuffer;
    ULONG BufferType;
    PVOID pvBuffer;
  } BCryptBuffer;
  typedef BCryptBuffer *PBCryptBuffer; //Pointer
  typedef struct BCryptBufferDesc {
    ULONG ulVersion;
    ULONG cBuffers;
    PBCryptBuffer pBuffers;
  } BCryptBufferDesc;
  typedef struct CRYPT_ATTRIBUTE_TYPE_VALUE {
    LPSTR pszObjId;
    CRYPT_OBJID_BLOB Value;
  } CRYPT_ATTRIBUTE_TYPE_VALUE;
  typedef struct CRYPT_ALGORITHM_IDENTIFIER {
    LPSTR pszObjId;
    CRYPT_OBJID_BLOB Parameters;
  } CRYPT_ALGORITHM_IDENTIFIER;
  typedef CRYPT_ALGORITHM_IDENTIFIER *PCRYPT_ALGORITHM_IDENTIFIER; //Pointer
  typedef struct SIP_INDIRECT_DATA {
    CRYPT_ATTRIBUTE_TYPE_VALUE Data;
    CRYPT_ALGORITHM_IDENTIFIER DigestAlgorithm;
    CRYPT_HASH_BLOB Digest;
  } SIP_INDIRECT_DATA;
  typedef struct CERT_EXTENSION {
    LPSTR pszObjId;
    BOOL fCritical;
    CRYPT_OBJID_BLOB Value;
  } CERT_EXTENSION;
  typedef CERT_EXTENSION *PCERT_EXTENSION; //Pointer
  typedef CERT_EXTENSION *CERT_EXTENSION[]; //Pointer
  typedef struct CERT_EXTENSIONS {
    DWORD cExtension;
    PCERT_EXTENSION rgExtension;
  } CERT_EXTENSIONS;
  typedef CERT_EXTENSIONS *PCERT_EXTENSIONS; //Pointer
  typedef struct CRYPT_BIT_BLOB {
    DWORD cbData;
    BYTE* pbData;
    DWORD cUnusedBits;
  } CRYPT_BIT_BLOB;
  typedef struct CERT_PUBLIC_KEY_INFO {
    CRYPT_ALGORITHM_IDENTIFIER Algorithm;
    CRYPT_BIT_BLOB PublicKey;
  } CERT_PUBLIC_KEY_INFO;
  typedef CERT_PUBLIC_KEY_INFO *PCERT_PUBLIC_KEY_INFO; //Pointer
  typedef struct CERT_INFO {
    DWORD dwVersion;
    CRYPT_INTEGER_BLOB SerialNumber;
    CRYPT_ALGORITHM_IDENTIFIER SignatureAlgorithm;
    CERT_NAME_BLOB Issuer;
    FILETIME NotBefore;
    FILETIME NotAfter;
    CERT_NAME_BLOB Subject;
    CERT_PUBLIC_KEY_INFO SubjectPublicKeyInfo;
    CRYPT_BIT_BLOB IssuerUniqueId;
    CRYPT_BIT_BLOB SubjectUniqueId;
    DWORD cExtension;
    PCERT_EXTENSION rgExtension;
  } CERT_INFO;
  typedef CERT_INFO *PCERT_INFO; //Pointer
  typedef DWORD CertEncodingType; //Alias
  typedef struct CERT_CONTEXT {
    CertEncodingType dwCertEncodingType;
    BYTE* pbCertEncoded;
    DWORD cbCertEncoded;
    PCERT_INFO pCertInfo;
    HCERTSTORE hCertStore;
  } CERT_CONTEXT;
  typedef CERT_CONTEXT *PCCERT_CONTEXT; //Pointer
  typedef struct SIGNER_CONTEXT {
    DWORD cbSize;
    DWORD cbBlob;
    BYTE* pbBlob;
  } SIGNER_CONTEXT;
  typedef struct CRYPT_ATTRIBUTE {
    LPSTR pszObjId;
    DWORD cValue;
    PCRYPT_ATTR_BLOB rgValue;
  } CRYPT_ATTRIBUTE;
  typedef CRYPT_ATTRIBUTE *PCRYPT_ATTRIBUTE; //Pointer
  typedef CRYPT_ATTRIBUTE *CRYPT_ATTRIBUTE[]; //Pointer
  typedef struct CRYPT_ATTRIBUTES {
    DWORD cAttr;
    PCRYPT_ATTRIBUTE rgAttr;
  } CRYPT_ATTRIBUTES;
  typedef CRYPT_ATTRIBUTES *PCRYPT_ATTRIBUTES; //Pointer
# pragma pack( push, 8 )
  typedef struct CRYPTCATMEMBER {
    DWORD cbStruct;
    LPWSTR pwszReferenceTag;
    LPWSTR pwszFileName;
    GUID gSubjectType;
    DWORD fdwMemberFlags;
    SIP_INDIRECT_DATA* pIndirectData;
    DWORD dwCertVersion;
    DWORD dwReserved;
    HANDLE hReserved;
    CRYPT_ATTR_BLOB sEncodedIndirectData;
    CRYPT_ATTR_BLOB sEncodedMemberInfo;
  } CRYPTCATMEMBER;
# pragma pack( pop )
  typedef struct CRYPT_PROVUI_DATA {
    DWORD cbStruct;
    DWORD dwFinalError;
    WCHAR* pYesButtonText;
    WCHAR* pNoButtonText;
    WCHAR* pMoreInfoButtonText;
    WCHAR* pAdvancedLinkText;
    WCHAR* pCopyActionText;
    WCHAR* pCopyActionTextNoTS;
    WCHAR* pCopyActionTextNotSigned;
  } CRYPT_PROVUI_DATA;
  typedef struct CRYPT_PROVUI_FUNCS {
    DWORD cbStruct;
    CRYPT_PROVUI_DATA* psUIData;
    PFN_PROVUI_CALL pfnOnMoreInfoClick;
    PFN_PROVUI_CALL pfnOnMoreInfoClickDefault;
    PFN_PROVUI_CALL pfnOnAdvancedClick;
    PFN_PROVUI_CALL pfnOnAdvancedClickDefault;
  } CRYPT_PROVUI_FUNCS;
  typedef struct CRYPT_PROVIDER_FUNCTIONS {
    DWORD cbStruct;
    PFN_CPD_MEM_ALLOC pfnAlloc;
    PFN_CPD_MEM_FREE pfnFree;
    PFN_CPD_ADD_STORE pfnAddStore2Chain;
    PFN_CPD_ADD_SGNR pfnAddSgnr2Chain;
    PFN_CPD_ADD_CERT pfnAddCert2Chain;
    PFN_CPD_ADD_PRIVDATA pfnAddPrivData2Chain;
    PFN_PROVIDER_INIT_CALL pfnInitialize;
    PFN_PROVIDER_OBJTRUST_CALL pfnObjectTrust;
    PFN_PROVIDER_SIGTRUST_CALL pfnSignatureTrust;
    PFN_PROVIDER_CERTTRUST_CALL pfnCertificateTrust;
    PFN_PROVIDER_FINALPOLICY_CALL pfnFinalPolicy;
    PFN_PROVIDER_CERTCHKPOLICY_CALL pfnCertCheckPolicy;
    PFN_PROVIDER_TESTFINALPOLICY_CALL pfnTestFinalPolicy;
    CRYPT_PROVUI_FUNCS* psUIpfns;
    PFN_PROVIDER_CLEANUP_CALL pfnCleanupPolicy;
  } CRYPT_PROVIDER_FUNCTIONS;
# pragma pack( push, 8 )
  typedef struct CRYPTCATCDF {
    DWORD cbStruct;
    HANDLE hFile;
    DWORD dwCurFilePos;
    DWORD dwLastMemberOffset;
    BOOL fEOF;
    LPWSTR pwszResultDir;
    HANDLE hCATStore;
  } CRYPTCATCDF;
# pragma pack( pop )
  typedef DWORD CryptCatTypeAndAction; //Alias
# pragma pack( push, 8 )
  typedef struct CRYPTCATATTRIBUTE {
    DWORD cbStruct;
    LPWSTR pwszReferenceTag;
    CryptCatTypeAndAction dwAttrTypeAndAction;
    DWORD cbValue;
    BYTE* pbValue;
    DWORD dwReserved;
  } CRYPTCATATTRIBUTE;
# pragma pack( pop )
  typedef struct CRYPT_TRUST_REG_ENTRY {
    DWORD cbStruct;
    WCHAR* pwszDLLName;
    WCHAR* pwszFunctionName;
  } CRYPT_TRUST_REG_ENTRY;
  typedef struct CRYPT_REGISTER_ACTIONID {
    DWORD cbStruct;
    CRYPT_TRUST_REG_ENTRY sInitProvider;
    CRYPT_TRUST_REG_ENTRY sObjectProvider;
    CRYPT_TRUST_REG_ENTRY sSignatureProvider;
    CRYPT_TRUST_REG_ENTRY sCertificateProvider;
    CRYPT_TRUST_REG_ENTRY sCertificatePolicyProvider;
    CRYPT_TRUST_REG_ENTRY sFinalPolicyProvider;
    CRYPT_TRUST_REG_ENTRY sTestPolicyProvider;
    CRYPT_TRUST_REG_ENTRY sCleanupProvider;
  } CRYPT_REGISTER_ACTIONID;
  typedef struct CRYPT_PROVIDER_PRIVDATA {
    DWORD cbStruct;
    GUID gProviderID;
    DWORD cbProvData;
    void* pvProvData;
  } CRYPT_PROVIDER_PRIVDATA;
  typedef DWORD CERT_CONFIDENCE; //Alias
  typedef struct CTL_USAGE {
    DWORD cUsageIdentifier;
    LPSTR* rgpszUsageIdentifier;
  } CTL_USAGE;
  typedef CTL_USAGE *PCTL_USAGE; //Pointer
  typedef struct CTL_ENTRY {
    CRYPT_DATA_BLOB SubjectIdentifier;
    DWORD cAttribute;
    PCRYPT_ATTRIBUTE rgAttribute;
  } CTL_ENTRY;
  typedef CTL_ENTRY *PCTL_ENTRY; //Pointer
  typedef struct CTL_INFO {
    DWORD dwVersion;
    CTL_USAGE SubjectUsage;
    CRYPT_DATA_BLOB ListIdentifier;
    CRYPT_INTEGER_BLOB SequenceNumber;
    FILETIME ThisUpdate;
    FILETIME NextUpdate;
    CRYPT_ALGORITHM_IDENTIFIER SubjectAlgorithm;
    DWORD cCTLEntry;
    PCTL_ENTRY rgCTLEntry;
    DWORD cExtension;
    PCERT_EXTENSION rgExtension;
  } CTL_INFO;
  typedef CTL_INFO *PCTL_INFO; //Pointer
  typedef struct CTL_CONTEXT {
    DWORD dwMsgAndCertEncodingType;
    BYTE* pbCtlEncoded;
    DWORD cbCtlEncoded;
    PCTL_INFO pCtlInfo;
    HCERTSTORE hCertStore;
    HCRYPTMSG hCryptMsg;
    BYTE* pbCtlContent;
    DWORD cbCtlContent;
  } CTL_CONTEXT;
  typedef CTL_CONTEXT *PCCTL_CONTEXT; //Pointer
  typedef DWORD CERT_TRUST_Error; //Alias
  typedef DWORD CERT_TRUST_Info; //Alias
  typedef struct CERT_TRUST_STATUS {
    CERT_TRUST_Error dwErrorStatus;
    CERT_TRUST_Info dwInfoStatus;
  } CERT_TRUST_STATUS;
  typedef struct CRL_ENTRY {
    CRYPT_INTEGER_BLOB SerialNumber;
    FILETIME RevocationDate;
    DWORD cExtension;
    PCERT_EXTENSION rgExtension;
  } CRL_ENTRY;
  typedef CRL_ENTRY *PCRL_ENTRY; //Pointer
  typedef struct CRL_INFO {
    DWORD dwVersion;
    CRYPT_ALGORITHM_IDENTIFIER SignatureAlgorithm;
    CERT_NAME_BLOB Issuer;
    FILETIME ThisUpdate;
    FILETIME NextUpdate;
    DWORD cCRLEntry;
    PCRL_ENTRY rgCRLEntry;
    DWORD cExtension;
    PCERT_EXTENSION rgExtension;
  } CRL_INFO;
  typedef CRL_INFO *PCRL_INFO; //Pointer
  typedef struct CRL_CONTEXT {
    DWORD dwCertEncodingType;
    BYTE* pbCrlEncoded;
    DWORD cbCrlEncoded;
    PCRL_INFO pCrlInfo;
    HCERTSTORE hCertStore;
  } CRL_CONTEXT;
  typedef CRL_CONTEXT *PCCRL_CONTEXT; //Pointer
  typedef struct CERT_REVOCATION_CRL_INFO {
    DWORD cbSize;
    PCCRL_CONTEXT pBaseCrlContext;
    PCCRL_CONTEXT pDeltaCrlContext;
    PCRL_ENTRY pCrlEntry;
    BOOL fDeltaCrlEntry;
  } CERT_REVOCATION_CRL_INFO;
  typedef CERT_REVOCATION_CRL_INFO *PCERT_REVOCATION_CRL_INFO; //Pointer
  typedef struct CERT_REVOCATION_INFO {
    DWORD cbSize;
    DWORD dwRevocationResult;
    LPCSTR pszRevocationOid;
    LPVOID pvOidSpecificInfo;
    BOOL fHasFreshnessTime;
    DWORD dwFreshnessTime;
    PCERT_REVOCATION_CRL_INFO pCrlInfo;
  } CERT_REVOCATION_INFO;
  typedef CERT_REVOCATION_INFO *PCERT_REVOCATION_INFO; //Pointer
  typedef CTL_USAGE CERT_ENHKEY_USAGE; //Alias
  typedef CERT_ENHKEY_USAGE *PCERT_ENHKEY_USAGE; //Pointer
  typedef struct CERT_CHAIN_ELEMENT {
    DWORD cbSize;
    PCCERT_CONTEXT pCertContext;
    CERT_TRUST_STATUS TrustStatus;
    PCERT_REVOCATION_INFO pRevocationInfo;
    PCERT_ENHKEY_USAGE pIssuanceUsage;
    PCERT_ENHKEY_USAGE pApplicationUsage;
    LPCWSTR pwszExtendedErrorInfo;
  } CERT_CHAIN_ELEMENT;
  typedef CERT_CHAIN_ELEMENT *PCERT_CHAIN_ELEMENT; //Pointer
  typedef struct CRYPT_PROVIDER_CERT {
    DWORD cbStruct;
    PCCERT_CONTEXT pCert;
    BOOL fCommercial;
    BOOL fTrustedRoot;
    BOOL fSelfSigned;
    BOOL fTestCert;
    DWORD dwRevokedReason;
    CERT_CONFIDENCE dwConfidence;
    DWORD dwError;
    CTL_CONTEXT* pTrustListContext;
    BOOL fTrustListSignerCert;
    PCCTL_CONTEXT pCtlContext;
    DWORD dwCtlError;
    BOOL fIsCyclic;
    PCERT_CHAIN_ELEMENT pChainElement;
  } CRYPT_PROVIDER_CERT;
  typedef struct CRYPT_DECODE_PARA {
    DWORD cbSize;
    PFN_CRYPT_ALLOC pfnAlloc;
    PFN_CRYPT_FREE pfnFree;
  } CRYPT_DECODE_PARA;
  typedef CRYPT_DECODE_PARA *PCRYPT_DECODE_PARA; //Pointer
  typedef struct CRYPT_ENCODE_PARA {
    DWORD cbSize;
    PFN_CRYPT_ALLOC pfnAlloc;
    PFN_CRYPT_FREE pfnFree;
  } CRYPT_ENCODE_PARA;
  typedef CRYPT_ENCODE_PARA *PCRYPT_ENCODE_PARA; //Pointer
  typedef DWORD CryptPromptFlags; //Alias
  static const CryptPromptFlags CRYPTPROTECT_PROMPT_ON_UNPROTECT = 0x1;
  static const CryptPromptFlags CRYPTPROTECT_PROMPT_ON_PROTECT = 0x2;
  static const CryptPromptFlags CRYPTPROTECT_PROMPT_RESERVED = 0x04;
  static const CryptPromptFlags CRYPTPROTECT_PROMPT_STRONG = 0x8;
  static const CryptPromptFlags CRYPTPROTECT_PROMPT_REQUIRE_STRONG = 0x10;
  typedef struct CRYPTPROTECT_PROMPTSTRUCT {
    DWORD cbSize;
    CryptPromptFlags dwPromptFlags;
    HWND hwndApp;
    LPCWSTR szPrompt;
  } CRYPTPROTECT_PROMPTSTRUCT;
  typedef struct CERT_PHYSICAL_STORE_INFO {
    DWORD cbSize;
    LPSTR pszOpenStoreProvider;
    DWORD dwOpenEncodingType;
    DWORD dwOpenFlags;
    CRYPT_DATA_BLOB OpenParameters;
    DWORD dwFlags;
    DWORD dwPriority;
  } CERT_PHYSICAL_STORE_INFO;
  typedef CERT_PHYSICAL_STORE_INFO *PCERT_PHYSICAL_STORE_INFO; //Pointer
  typedef struct CERT_SYSTEM_STORE_INFO {
    DWORD cbSize;
  } CERT_SYSTEM_STORE_INFO;
  typedef CERT_SYSTEM_STORE_INFO *PCERT_SYSTEM_STORE_INFO; //Pointer
  typedef struct CERT_CREATE_CONTEXT_PARA {
    DWORD cbSize;
    PFN_CRYPT_FREE pfnFree;
    void* pvFree;
    PFN_CERT_CREATE_CONTEXT_SORT_FUNC pfnSort;
    void* pvSort;
  } CERT_CREATE_CONTEXT_PARA;
  typedef CERT_CREATE_CONTEXT_PARA *PCERT_CREATE_CONTEXT_PARA; //Pointer
  typedef struct CERT_SERVER_OCSP_RESPONSE_CONTEXT {
    DWORD cbSize;
    BYTE* pbEncodedOcspResponse;
    DWORD cbEncodedOcspResponse;
  } CERT_SERVER_OCSP_RESPONSE_CONTEXT;
  typedef CERT_SERVER_OCSP_RESPONSE_CONTEXT *PCCERT_SERVER_OCSP_RESPONSE_CONTEXT; //Pointer
  typedef struct CRYPT_KEY_PROV_PARAM {
    DWORD dwParam;
    BYTE* pbData;
    DWORD cbData;
    DWORD dwFlags;
  } CRYPT_KEY_PROV_PARAM;
  typedef CRYPT_KEY_PROV_PARAM *PCRYPT_KEY_PROV_PARAM; //Pointer
  typedef struct CRYPT_KEY_PROV_INFO {
    LPWSTR pwszContainerName;
    LPWSTR pwszProvName;
    DWORD dwProvType;
    DWORD dwFlags;
    DWORD cProvParam;
    PCRYPT_KEY_PROV_PARAM rgProvParam;
    DWORD dwKeySpec;
  } CRYPT_KEY_PROV_INFO;
  typedef CRYPT_KEY_PROV_INFO *PCRYPT_KEY_PROV_INFO; //Pointer
  typedef DWORD USAGE_MATCH_TYPE; //Alias
  static const USAGE_MATCH_TYPE USAGE_MATCH_TYPE_AND = 0x00000000;
  static const USAGE_MATCH_TYPE USAGE_MATCH_TYPE_OR = 0x00000001;
  typedef struct CERT_USAGE_MATCH {
    USAGE_MATCH_TYPE dwType;
    CERT_ENHKEY_USAGE Usage;
  } CERT_USAGE_MATCH;
  typedef CERT_USAGE_MATCH *PCERT_USAGE_MATCH; //Pointer
  typedef struct CERT_CHAIN_PARA {
    DWORD cbSize;
    CERT_USAGE_MATCH RequestedUsage;
    CERT_USAGE_MATCH RequestedIssuancePolicy;
    DWORD dwUrlRetrievalTimeout;
    BOOL fCheckRevocationFreshnessTime;
    DWORD dwRevocationFreshnessTime;
    LPFILETIME pftCacheResync;
  } CERT_CHAIN_PARA;
  typedef CERT_CHAIN_PARA *PCERT_CHAIN_PARA; //Pointer
  typedef struct CERT_SELECT_CHAIN_PARA {
    HCERTCHAINENGINE hChainEngine;
    PFILETIME pTime;
    HCERTSTORE hAdditionalStore;
    PCERT_CHAIN_PARA pChainPara;
    DWORD dwFlags;
  } CERT_SELECT_CHAIN_PARA;
  typedef CERT_SELECT_CHAIN_PARA *PCCERT_SELECT_CHAIN_PARA; //Pointer
  typedef struct CERT_SELECT_CRITERIA {
    DWORD dwType;
    DWORD cPara;
    void** ppPara;
  } CERT_SELECT_CRITERIA;
  typedef CERT_SELECT_CRITERIA *PCCERT_SELECT_CRITERIA; //Pointer
  typedef struct CTL_VERIFY_USAGE_PARA {
    DWORD cbSize;
    CRYPT_DATA_BLOB ListIdentifier;
    DWORD cCtlStore;
    HCERTSTORE* rghCtlStore;
    DWORD cSignerStore;
    HCERTSTORE* rghSignerStore;
  } CTL_VERIFY_USAGE_PARA;
  typedef CTL_VERIFY_USAGE_PARA *PCTL_VERIFY_USAGE_PARA; //Pointer
  typedef struct CTL_VERIFY_USAGE_STATUS {
    DWORD cbSize;
    DWORD dwError;
    DWORD dwFlags;
    PCCTL_CONTEXT* ppCtl;
    DWORD dwCtlEntryIndex;
    PCCERT_CONTEXT* ppSigner;
    DWORD dwSignerIndex;
  } CTL_VERIFY_USAGE_STATUS;
  typedef CTL_VERIFY_USAGE_STATUS *PCTL_VERIFY_USAGE_STATUS; //Pointer
  typedef struct CERT_CHAIN_ENGINE_CONFIG {
    DWORD cbSize;
    HCERTSTORE hRestrictedRoot;
    HCERTSTORE hRestrictedTrust;
    HCERTSTORE hRestrictedOther;
    DWORD cAdditionalStore;
    HCERTSTORE* rghAdditionalStore;
    DWORD dwFlags;
    DWORD dwUrlRetrievalTimeout;
    DWORD MaximumCachedCertificates;
    DWORD CycleDetectionModulus;
    HCERTSTORE hExclusiveRoot;
    HCERTSTORE hExclusiveTrustedPeople;
  } CERT_CHAIN_ENGINE_CONFIG;
  typedef CERT_CHAIN_ENGINE_CONFIG *PCERT_CHAIN_ENGINE_CONFIG; //Pointer
  typedef struct CERT_CHAIN_POLICY_PARA {
    DWORD cbSize;
    DWORD dwFlags;
    void* pvExtraPolicyPara;
  } CERT_CHAIN_POLICY_PARA;
  typedef CERT_CHAIN_POLICY_PARA *PCERT_CHAIN_POLICY_PARA; //Pointer
  typedef struct CERT_CHAIN_POLICY_STATUS {
    DWORD cbSize;
    DWORD dwError;
    LONG lChainIndex;
    LONG lElementIndex;
    void* pvExtraPolicyStatus;
  } CERT_CHAIN_POLICY_STATUS;
  typedef CERT_CHAIN_POLICY_STATUS *PCERT_CHAIN_POLICY_STATUS; //Pointer
  typedef struct CMSG_STREAM_INFO {
    DWORD cbContent;
    PFN_CMSG_STREAM_OUTPUT pfnStreamOutput;
    void* pvArg;
  } CMSG_STREAM_INFO;
  typedef CMSG_STREAM_INFO *PCMSG_STREAM_INFO; //Pointer
  typedef struct CRYPT_DECRYPT_MESSAGE_PARA {
    DWORD cbSize;
    DWORD dwMsgAndCertEncodingType;
    DWORD cCertStore;
    HCERTSTORE* rghCertStore;
    DWORD dwFlags;
  } CRYPT_DECRYPT_MESSAGE_PARA;
  typedef CRYPT_DECRYPT_MESSAGE_PARA *PCRYPT_DECRYPT_MESSAGE_PARA; //Pointer
  typedef struct CRYPT_VERIFY_MESSAGE_PARA {
    DWORD cbSize;
    DWORD dwMsgAndCertEncodingType;
    HCRYPTPROV_LEGACY hCryptProv;
    PFN_CRYPT_GET_SIGNER_CERTIFICATE pfnGetSignerCertificate;
    void* pvGetArg;
  } CRYPT_VERIFY_MESSAGE_PARA;
  typedef CRYPT_VERIFY_MESSAGE_PARA *PCRYPT_VERIFY_MESSAGE_PARA; //Pointer
  typedef struct CRYPT_ENCRYPT_MESSAGE_PARA {
    DWORD cbSize;
    DWORD dwMsgEncodingType;
    HCRYPTPROV_LEGACY hCryptProv;
    CRYPT_ALGORITHM_IDENTIFIER ContentEncryptionAlgorithm;
    void* pvEncryptionAuxInfo;
    DWORD dwFlags;
    DWORD dwInnerContentType;
  } CRYPT_ENCRYPT_MESSAGE_PARA;
  typedef CRYPT_ENCRYPT_MESSAGE_PARA *PCRYPT_ENCRYPT_MESSAGE_PARA; //Pointer
  typedef struct CRYPT_HASH_MESSAGE_PARA {
    DWORD cbSize;
    DWORD dwMsgEncodingType;
    HCRYPTPROV_LEGACY hCryptProv;
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    void* pvHashAuxInfo;
  } CRYPT_HASH_MESSAGE_PARA;
  typedef CRYPT_HASH_MESSAGE_PARA *PCRYPT_HASH_MESSAGE_PARA; //Pointer
  typedef struct CRYPT_SIGN_MESSAGE_PARA {
    DWORD cbSize;
    DWORD dwMsgEncodingType;
    PCCERT_CONTEXT pSigningCert;
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    void* pvHashAuxInfo;
    DWORD cMsgCert;
    PCCERT_CONTEXT* rgpMsgCert;
    DWORD cMsgCrl;
    PCCRL_CONTEXT* rgpMsgCrl;
    DWORD cAuthAttr;
    PCRYPT_ATTRIBUTE rgAuthAttr;
    DWORD cUnauthAttr;
    PCRYPT_ATTRIBUTE rgUnauthAttr;
    DWORD dwFlags;
    DWORD dwInnerContentType;
    CRYPT_ALGORITHM_IDENTIFIER HashEncryptionAlgorithm;
    void* pvHashEncryptionAuxInfo;
  } CRYPT_SIGN_MESSAGE_PARA;
  typedef CRYPT_SIGN_MESSAGE_PARA *PCRYPT_SIGN_MESSAGE_PARA; //Pointer
  typedef struct CRYPT_KEY_VERIFY_MESSAGE_PARA {
    DWORD cbSize;
    DWORD dwMsgEncodingType;
    HCRYPTPROV_LEGACY hCryptProv;
  } CRYPT_KEY_VERIFY_MESSAGE_PARA;
  typedef CRYPT_KEY_VERIFY_MESSAGE_PARA *PCRYPT_KEY_VERIFY_MESSAGE_PARA; //Pointer
  typedef struct CERT_RDN_ATTR {
    LPSTR pszObjId;
    DWORD dwValueType;
    CERT_RDN_VALUE_BLOB Value;
  } CERT_RDN_ATTR;
  typedef CERT_RDN_ATTR *PCERT_RDN_ATTR; //Pointer
  typedef struct CERT_RDN {
    DWORD cRDNAttr;
    PCERT_RDN_ATTR rgRDNAttr;
  } CERT_RDN;
  typedef CERT_RDN *PCERT_RDN; //Pointer
  typedef struct CERT_NAME_INFO {
    DWORD cRDN;
    PCERT_RDN rgRDN;
  } CERT_NAME_INFO;
  typedef CERT_NAME_INFO *PCERT_NAME_INFO; //Pointer
  typedef struct CERT_REVOCATION_CHAIN_PARA {
    DWORD cbSize;
    HCERTCHAINENGINE hChainEngine;
    HCERTSTORE hAdditionalStore;
    DWORD dwChainFlags;
    DWORD dwUrlRetrievalTimeout;
    LPFILETIME pftCurrentTime;
    LPFILETIME pftCacheResync;
    DWORD cbMaxUrlRetrievalByteCount;
  } CERT_REVOCATION_CHAIN_PARA;
  typedef CERT_REVOCATION_CHAIN_PARA *PCERT_REVOCATION_CHAIN_PARA; //Pointer
  typedef struct CERT_REVOCATION_PARA {
    DWORD cbSize;
    PCCERT_CONTEXT pIssuerCert;
    DWORD cCertStore;
    HCERTSTORE* rgCertStore;
    HCERTSTORE hCrlStore;
    LPFILETIME pftTimeToUse;
    DWORD dwUrlRetrievalTimeout;
    BOOL fCheckFreshnessTime;
    DWORD dwFreshnessTime;
    LPFILETIME pftCurrentTime;
    PCERT_REVOCATION_CRL_INFO pCrlInfo;
    LPFILETIME pftCacheResync;
    PCERT_REVOCATION_CHAIN_PARA pChainPara;
  } CERT_REVOCATION_PARA;
  typedef CERT_REVOCATION_PARA *PCERT_REVOCATION_PARA; //Pointer
  typedef struct CERT_REVOCATION_STATUS {
    DWORD cbSize;
    DWORD dwIndex;
    DWORD dwError;
    DWORD dwReason;
    BOOL fHasFreshnessTime;
    DWORD dwFreshnessTime;
  } CERT_REVOCATION_STATUS;
  typedef CERT_REVOCATION_STATUS *PCERT_REVOCATION_STATUS; //Pointer
  typedef struct CRYPT_PKCS8_EXPORT_PARAMS {
    HCRYPTPROV hCryptProv;
    DWORD dwKeySpec;
    LPSTR pszPrivateKeyObjId;
    PCRYPT_ENCRYPT_PRIVATE_KEY_FUNC pEncryptPrivateKeyFunc;
    LPVOID pVoidEncryptFunc;
  } CRYPT_PKCS8_EXPORT_PARAMS;
  typedef struct SIP_ADD_NEWPROVIDER {
    DWORD cbStruct;
    GUID* pgSubject;
    WCHAR* pwszDLLFileName;
    WCHAR* pwszMagicNumber;
    WCHAR* pwszIsFunctionName;
    WCHAR* pwszGetFuncName;
    WCHAR* pwszPutFuncName;
    WCHAR* pwszCreateFuncName;
    WCHAR* pwszVerifyFuncName;
    WCHAR* pwszRemoveFuncName;
    WCHAR* pwszIsFunctionNameFmt2;
  } SIP_ADD_NEWPROVIDER;
  typedef struct SIP_DISPATCH_INFO {
    DWORD cbSize;
    HANDLE hSIP;
    pCryptSIPGetSignedDataMsg pfGet;
    pCryptSIPPutSignedDataMsg pfPut;
    pCryptSIPCreateIndirectData pfCreate;
    pCryptSIPVerifyIndirectData pfVerify;
    pCryptSIPRemoveSignedDataMsg pfRemove;
  } SIP_DISPATCH_INFO;
  typedef struct PUBLICKEYSTRUC {
    BYTE bType;
    BYTE bVersion;
    WORD reserved;
    ALG_ID aiKeyAlg;
  } PUBLICKEYSTRUC;
  typedef struct CRYPT_OID_FUNC_ENTRY {
    LPCSTR pszOID;
    void* pvFuncAddr;
  } CRYPT_OID_FUNC_ENTRY;
  typedef CRYPT_OID_FUNC_ENTRY *CRYPT_OID_FUNC_ENTRY[]; //Pointer
  typedef struct CRYPT_PKCS8_IMPORT_PARAMS {
    CRYPT_DIGEST_BLOB PrivateKey;
    PCRYPT_RESOLVE_HCRYPTPROV_FUNC pResolvehCryptProvFunc;
    LPVOID pVoidResolveFunc;
    PCRYPT_DECRYPT_PRIVATE_KEY_FUNC pDecryptPrivateKeyFunc;
    LPVOID pVoidDecryptFunc;
  } CRYPT_PKCS8_IMPORT_PARAMS;
  typedef DWORD CertSelectFlags; //Alias
  static const CertSelectFlags CERT_SELECT_ALLOW_EXPIRED = 0x00000001;
  static const CertSelectFlags CERT_SELECT_TRUSTED_ROOT = 0x00000002;
  static const CertSelectFlags CERT_SELECT_DISALLOW_SELFSIGNED = 0x00000004;
  static const CertSelectFlags CERT_SELECT_HAS_PRIVATE_KEY = 0x00000008;
  static const CertSelectFlags CERT_SELECT_HAS_KEY_FOR_SIGNATURE = 0x00000010;
  static const CertSelectFlags CERT_SELECT_HAS_KEY_FOR_KEY_EXCHANGE = 0x00000020;
  static const CertSelectFlags CERT_SELECT_HARDWARE_ONLY = 0x00000040;
  static const CertSelectFlags CERT_SELECT_ALLOW_DUPLICATES = 0x00000080;
  typedef DWORD CertificateStoreContextType; //Alias
  static const CertificateStoreContextType CERT_STORE_CERTIFICATE_CONTEXT = 1;
  static const CertificateStoreContextType CERT_STORE_CRL_CONTEXT = 2;
  static const CertificateStoreContextType CERT_STORE_CTL_CONTEXT = 3;
  typedef DWORD CertCreateContextFlags; //Alias
  typedef DWORD CertCloseStoreFlags; //Alias
  typedef DWORD CertControlType; //Alias
  static const CertControlType CERT_STORE_CTRL_RESYNC = 1;
  static const CertControlType CERT_STORE_CTRL_NOTIFY_CHANGE = 2;
  static const CertControlType CERT_STORE_CTRL_COMMIT = 3;
  static const CertControlType CERT_STORE_CTRL_AUTO_RESYNC = 4;
  static const CertControlType CERT_STORE_CTRL_CANCEL_NOTIFY = 5;
  typedef DWORD CryptInstallOIDFlags; //Alias
  static const CryptInstallOIDFlags CRYPT_INSTALL_OID_FUNC_BEFORE_FLAG = 1;
  typedef DWORD CertStoreAddDisposition; //Alias
  static const CertStoreAddDisposition CERT_STORE_ADD_NEW = 1;
  static const CertStoreAddDisposition CERT_STORE_ADD_USE_EXISTING = 2;
  static const CertStoreAddDisposition CERT_STORE_ADD_REPLACE_EXISTING = 3;
  static const CertStoreAddDisposition CERT_STORE_ADD_ALWAYS = 4;
  static const CertStoreAddDisposition CERT_STORE_ADD_REPLACE_EXISTING_INHERIT_PROPERTIES = 5;
  static const CertStoreAddDisposition CERT_STORE_ADD_NEWER = 6;
  static const CertStoreAddDisposition CERT_STORE_ADD_NEWER_INHERIT_PROPERTIES = 7;
  typedef DWORD CertChainFlags; //Alias
  typedef DWORD CertPropId; //Alias
  static const CertPropId CERT_KEY_PROV_HANDLE_PROP_ID = 1;
  static const CertPropId CERT_KEY_PROV_INFO_PROP_ID = 2;
  static const CertPropId CERT_SHA1_HASH_PROP_ID = 3;
  static const CertPropId CERT_MD5_HASH_PROP_ID = 4;
  static const CertPropId CERT_KEY_CONTEXT_PROP_ID = 5;
  static const CertPropId CERT_KEY_SPEC_PROP_ID = 6;
  static const CertPropId CERT_IE30_RESERVED_PROP_ID = 7;
  static const CertPropId CERT_PUBKEY_HASH_RESERVED_PROP_ID = 8;
  static const CertPropId CERT_ENHKEY_USAGE_PROP_ID = 9;
  static const CertPropId CERT_NEXT_UPDATE_LOCATION_PROP_ID = 10;
  static const CertPropId CERT_FRIENDLY_NAME_PROP_ID = 11;
  static const CertPropId CERT_PVK_FILE_PROP_ID = 12;
  static const CertPropId CERT_DESCRIPTION_PROP_ID = 13;
  static const CertPropId CERT_ACCESS_STATE_PROP_ID = 14;
  static const CertPropId CERT_SIGNATURE_HASH_PROP_ID = 15;
  static const CertPropId CERT_SMART_CARD_DATA_PROP_ID = 16;
  static const CertPropId CERT_EFS_PROP_ID = 17;
  static const CertPropId CERT_FORTEZZA_DATA_PROP_ID = 18;
  static const CertPropId CERT_ARCHIVED_PROP_ID = 19;
  static const CertPropId CERT_KEY_IDENTIFIER_PROP_ID = 20;
  static const CertPropId CERT_AUTO_ENROLL_PROP_ID = 21;
  static const CertPropId CERT_PUBKEY_ALG_PARA_PROP_ID = 22;
  static const CertPropId CERT_CROSS_CERT_DIST_POINTS_PROP_ID = 23;
  static const CertPropId CERT_ISSUER_PUBLIC_KEY_MD5_HASH_PROP_ID = 24;
  static const CertPropId CERT_SUBJECT_PUBLIC_KEY_MD5_HASH_PROP_ID = 25;
  static const CertPropId CERT_ENROLLMENT_PROP_ID = 26;
  static const CertPropId CERT_DATE_STAMP_PROP_ID = 27;
  static const CertPropId CERT_ISSUER_SERIAL_NUMBER_MD5_HASH_PROP_ID = 28;
  static const CertPropId CERT_SUBJECT_NAME_MD5_HASH_PROP_ID = 29;
  static const CertPropId CERT_EXTENDED_ERROR_INFO_PROP_ID = 30;
  static const CertPropId CERT_RENEWAL_PROP_ID = 64;
  static const CertPropId CERT_ARCHIVED_KEY_HASH_PROP_ID = 65;
  static const CertPropId CERT_AUTO_ENROLL_RETRY_PROP_ID = 66;
  static const CertPropId CERT_AIA_URL_RETRIEVED_PROP_ID = 67;
  static const CertPropId CERT_AUTHORITY_INFO_ACCESS_PROP_ID = 68;
  static const CertPropId CERT_BACKED_UP_PROP_ID = 69;
  static const CertPropId CERT_OCSP_RESPONSE_PROP_ID = 70;
  static const CertPropId CERT_REQUEST_ORIGINATOR_PROP_ID = 71;
  static const CertPropId CERT_SOURCE_LOCATION_PROP_ID = 72;
  static const CertPropId CERT_SOURCE_URL_PROP_ID = 73;
  static const CertPropId CERT_NEW_KEY_PROP_ID = 74;
  static const CertPropId CERT_OCSP_CACHE_PREFIX_PROP_ID = 75;
  static const CertPropId CERT_SMART_CARD_ROOT_INFO_PROP_ID = 76;
  static const CertPropId CERT_NO_AUTO_EXPIRE_CHECK_PROP_ID = 77;
  static const CertPropId CERT_NCRYPT_KEY_HANDLE_PROP_ID = 78;
  static const CertPropId CERT_HCRYPTPROV_OR_NCRYPT_KEY_HANDLE_PROP_ID = 79;
  static const CertPropId CERT_SUBJECT_INFO_ACCESS_PROP_ID = 80;
  static const CertPropId CERT_CA_OCSP_AUTHORITY_INFO_ACCESS_PROP_ID = 81;
  static const CertPropId CERT_CA_DISABLE_CRL_PROP_ID = 82;
  static const CertPropId CERT_ROOT_PROGRAM_CERT_POLICIES_PROP_ID = 83;
  static const CertPropId CERT_ROOT_PROGRAM_NAME_CONSTRAINTS_PROP_ID = 84;
  static const CertPropId CERT_FIRST_RESERVED_PROP_ID = 85;
  typedef DWORD CertSetPropertyFlags; //Alias
  typedef DWORD CryptEncodeObjectFlags; //Alias
  typedef DWORD CryptStringFlags; //Alias
  typedef DWORD CertStrType; //Alias
  typedef DWORD CertNameType; //Alias
  static const CertNameType CERT_NAME_EMAIL_TYPE = 1;
  static const CertNameType CERT_NAME_RDN_TYPE = 2;
  static const CertNameType CERT_NAME_ATTR_TYPE = 3;
  static const CertNameType CERT_NAME_SIMPLE_DISPLAY_TYPE = 4;
  static const CertNameType CERT_NAME_FRIENDLY_DISPLAY_TYPE = 5;
  static const CertNameType CERT_NAME_DNS_TYPE = 6;
  static const CertNameType CERT_NAME_URL_TYPE = 7;
  static const CertNameType CERT_NAME_UPN_TYPE = 8;
  typedef DWORD CertNameFlags; //Alias
  typedef DWORD CryptObjectType; //Alias
  static const CryptObjectType CERT_QUERY_OBJECT_FILE = 0x00000001;
  static const CryptObjectType CERT_QUERY_OBJECT_BLOB = 0x00000002;
  typedef DWORD CryptExpectedContentType; //Alias
  typedef DWORD CryptExpectedFormatType; //Alias
  typedef DWORD CryptFormatType; //Alias
  static const CryptFormatType CERT_QUERY_FORMAT_BINARY = 1;
  static const CryptFormatType CERT_QUERY_FORMAT_BASE64_ENCODED = 2;
  static const CryptFormatType CERT_QUERY_FORMAT_ASN_ASCII_HEX_ENCODED = 3;
  typedef DWORD CryptContentType; //Alias
  static const CryptContentType CERT_QUERY_CONTENT_CERT = 1;
  static const CryptContentType CERT_QUERY_CONTENT_CTL = 2;
  static const CryptContentType CERT_QUERY_CONTENT_CRL = 3;
  static const CryptContentType CERT_QUERY_CONTENT_SERIALIZED_STORE = 4;
  static const CryptContentType CERT_QUERY_CONTENT_SERIALIZED_CERT = 5;
  static const CryptContentType CERT_QUERY_CONTENT_SERIALIZED_CTL = 6;
  static const CryptContentType CERT_QUERY_CONTENT_SERIALIZED_CRL = 7;
  static const CryptContentType CERT_QUERY_CONTENT_PKCS7_SIGNED = 8;
  static const CryptContentType CERT_QUERY_CONTENT_PKCS7_UNSIGNED = 9;
  static const CryptContentType CERT_QUERY_CONTENT_PKCS7_SIGNED_EMBED = 10;
  static const CryptContentType CERT_QUERY_CONTENT_PKCS10 = 11;
  static const CryptContentType CERT_QUERY_CONTENT_PFX = 12;
  static const CryptContentType CERT_QUERY_CONTENT_CERT_PAIR = 13;
  static const CryptContentType CERT_QUERY_CONTENT_PFX_AND_LOAD = 14;
  typedef DWORD CryptSubjectType; //Alias
  static const CryptSubjectType CRYPT_VERIFY_CERT_SIGN_SUBJECT_BLOB = 1;
  static const CryptSubjectType CRYPT_VERIFY_CERT_SIGN_SUBJECT_CERT = 2;
  static const CryptSubjectType CRYPT_VERIFY_CERT_SIGN_SUBJECT_CRL = 3;
  static const CryptSubjectType CRYPT_VERIFY_CERT_SIGN_SUBJECT_OCSP_BASIC_SIGNED_RESPONSE = 4;
  typedef DWORD CryptIssuerType; //Alias
  static const CryptIssuerType CRYPT_VERIFY_CERT_SIGN_ISSUER_PUBKEY = 1;
  static const CryptIssuerType CRYPT_VERIFY_CERT_SIGN_ISSUER_CERT = 2;
  static const CryptIssuerType CRYPT_VERIFY_CERT_SIGN_ISSUER_CHAIN = 3;
  static const CryptIssuerType CRYPT_VERIFY_CERT_SIGN_ISSUER_NULL = 4;
  typedef DWORD CryptDecodeObjectFlags; //Alias
  typedef DWORD CertOpenStoreFlags; //Alias
  typedef DWORD CertFindFlags; //Alias
  typedef DWORD CryptProtectDataFlags; //Alias
  typedef DWORD CryptMsgOpenFlags; //Alias
  typedef DWORD CryptMsgType; //Alias
  static const CryptMsgType CMSG_DATA = 1;
  static const CryptMsgType CMSG_SIGNED = 2;
  static const CryptMsgType CMSG_ENVELOPED = 3;
  static const CryptMsgType CMSG_SIGNED_AND_ENVELOPED = 4;
  static const CryptMsgType CMSG_HASHED = 5;
  static const CryptMsgType CMSG_ENCRYPTED = 6;
  typedef DWORD CryptMsgParamType; //Alias
  static const CryptMsgParamType CMSG_TYPE_PARAM = 1;
  static const CryptMsgParamType CMSG_CONTENT_PARAM = 2;
  static const CryptMsgParamType CMSG_BARE_CONTENT_PARAM = 3;
  static const CryptMsgParamType CMSG_INNER_CONTENT_TYPE_PARAM = 4;
  static const CryptMsgParamType CMSG_SIGNER_COUNT_PARAM = 5;
  static const CryptMsgParamType CMSG_SIGNER_INFO_PARAM = 6;
  static const CryptMsgParamType CMSG_SIGNER_CERT_INFO_PARAM = 7;
  static const CryptMsgParamType CMSG_SIGNER_HASH_ALGORITHM_PARAM = 8;
  static const CryptMsgParamType CMSG_SIGNER_AUTH_ATTR_PARAM = 9;
  static const CryptMsgParamType CMSG_SIGNER_UNAUTH_ATTR_PARAM = 10;
  static const CryptMsgParamType CMSG_CERT_COUNT_PARAM = 11;
  static const CryptMsgParamType CMSG_CERT_PARAM = 12;
  static const CryptMsgParamType CMSG_CRL_COUNT_PARAM = 13;
  static const CryptMsgParamType CMSG_CRL_PARAM = 14;
  static const CryptMsgParamType CMSG_ENVELOPE_ALGORITHM_PARAM = 15;
  static const CryptMsgParamType CMSG_RECIPIENT_COUNT_PARAM = 17;
  static const CryptMsgParamType CMSG_RECIPIENT_INDEX_PARAM = 18;
  static const CryptMsgParamType CMSG_RECIPIENT_INFO_PARAM = 19;
  static const CryptMsgParamType CMSG_HASH_ALGORITHM_PARAM = 20;
  static const CryptMsgParamType CMSG_HASH_DATA_PARAM = 21;
  static const CryptMsgParamType CMSG_COMPUTED_HASH_PARAM = 22;
  static const CryptMsgParamType CMSG_ENCRYPT_PARAM = 26;
  static const CryptMsgParamType CMSG_ENCRYPTED_DIGEST = 27;
  static const CryptMsgParamType CMSG_ENCODED_SIGNER = 28;
  static const CryptMsgParamType CMSG_ENCODED_MESSAGE = 29;
  static const CryptMsgParamType CMSG_VERSION_PARAM = 30;
  static const CryptMsgParamType CMSG_ATTR_CERT_COUNT_PARAM = 31;
  static const CryptMsgParamType CMSG_ATTR_CERT_PARAM = 32;
  static const CryptMsgParamType CMSG_CMS_RECIPIENT_COUNT_PARAM = 33;
  static const CryptMsgParamType CMSG_CMS_RECIPIENT_INDEX_PARAM = 34;
  static const CryptMsgParamType CMSG_CMS_RECIPIENT_ENCRYPTED_KEY_INDEX_PARAM = 35;
  static const CryptMsgParamType CMSG_CMS_RECIPIENT_INFO_PARAM = 36;
  static const CryptMsgParamType CMSG_UNPROTECTED_ATTR_PARAM = 37;
  static const CryptMsgParamType CMSG_SIGNER_CERT_ID_PARAM = 38;
  static const CryptMsgParamType CMSG_CMS_SIGNER_INFO_PARAM = 39;
  typedef DWORD CryptMsgControlType; //Alias
  static const CryptMsgControlType CMSG_CTRL_VERIFY_SIGNATURE = 1;
  static const CryptMsgControlType CMSG_CTRL_DECRYPT = 2;
  static const CryptMsgControlType CMSG_CTRL_VERIFY_HASH = 5;
  static const CryptMsgControlType CMSG_CTRL_ADD_SIGNER = 6;
  static const CryptMsgControlType CMSG_CTRL_DEL_SIGNER = 7;
  static const CryptMsgControlType CMSG_CTRL_ADD_SIGNER_UNAUTH_ATTR = 8;
  static const CryptMsgControlType CMSG_CTRL_DEL_SIGNER_UNAUTH_ATTR = 9;
  static const CryptMsgControlType CMSG_CTRL_ADD_CERT = 10;
  static const CryptMsgControlType CMSG_CTRL_DEL_CERT = 11;
  static const CryptMsgControlType CMSG_CTRL_ADD_CRL = 12;
  static const CryptMsgControlType CMSG_CTRL_DEL_CRL = 13;
  static const CryptMsgControlType CMSG_CTRL_ADD_ATTR_CERT = 14;
  static const CryptMsgControlType CMSG_CTRL_DEL_ATTR_CERT = 15;
  static const CryptMsgControlType CMSG_CTRL_KEY_TRANS_DECRYPT = 16;
  static const CryptMsgControlType CMSG_CTRL_KEY_AGREE_DECRYPT = 17;
  static const CryptMsgControlType CMSG_CTRL_MAIL_LIST_DECRYPT = 18;
  static const CryptMsgControlType CMSG_CTRL_VERIFY_SIGNATURE_EX = 19;
  static const CryptMsgControlType CMSG_CTRL_ADD_CMS_SIGNER_INFO = 20;
  typedef DWORD CryptMsgControlFlags; //Alias
  static const CryptMsgControlFlags CMSG_CRYPT_RELEASE_CONTEXT_FLAG = 0x00008000;
  typedef DWORD CryptMsgSignerType; //Alias
  static const CryptMsgSignerType CMSG_VERIFY_SIGNER_PUBKEY = 1;
  static const CryptMsgSignerType CMSG_VERIFY_SIGNER_CERT = 2;
  static const CryptMsgSignerType CMSG_VERIFY_SIGNER_CHAIN = 3;
  static const CryptMsgSignerType CMSG_VERIFY_SIGNER_NULL = 4;
  typedef DWORD CertFindType; //Alias
  typedef DWORD CrlFindType; //Alias
  static const CrlFindType CRL_FIND_ANY = 0;
  static const CrlFindType CRL_FIND_ISSUED_BY = 1;
  static const CrlFindType CRL_FIND_EXISTING = 2;
  static const CrlFindType CRL_FIND_ISSUED_FOR = 3;
  typedef DWORD CrlFindIssuedByFlags; //Alias
  typedef DWORD CryptFindOidInfoKeyType; //Alias
  typedef DWORD CryptFindOidInfoGroudId; //Alias
  typedef DWORD CertSystemStoreFlags; //Alias
  typedef DWORD CertPhysicalStoreFlags; //Alias
  typedef DWORD CryptFormatStrType; //Alias
  typedef DWORD CryptGroupId; //Alias
  static const CryptGroupId CRYPT_HASH_ALG_OID_GROUP_ID = 1;
  static const CryptGroupId CRYPT_ENCRYPT_ALG_OID_GROUP_ID = 2;
  static const CryptGroupId CRYPT_PUBKEY_ALG_OID_GROUP_ID = 3;
  static const CryptGroupId CRYPT_SIGN_ALG_OID_GROUP_ID = 4;
  static const CryptGroupId CRYPT_RDN_ATTR_OID_GROUP_ID = 5;
  static const CryptGroupId CRYPT_EXT_OR_ATTR_OID_GROUP_ID = 6;
  static const CryptGroupId CRYPT_ENHKEY_USAGE_OID_GROUP_ID = 7;
  static const CryptGroupId CRYPT_POLICY_OID_GROUP_ID = 8;
  static const CryptGroupId CRYPT_TEMPLATE_OID_GROUP_ID = 9;
  typedef DWORD CryptProtectMemoryFlags; //Alias
  static const CryptProtectMemoryFlags CRYPTPROTECTMEMORY_SAME_PROCESS = 0x00;
  static const CryptProtectMemoryFlags CRYPTPROTECTMEMORY_CROSS_PROCESS = 0x01;
  static const CryptProtectMemoryFlags CRYPTPROTECTMEMORY_SAME_LOGON = 0x02;
  typedef union HcryptNcryptUnion {
    HCRYPTPROV hCryptProv;
    NCRYPT_KEY_HANDLE hNCryptKey;
  } HcryptNcryptUnion;
  typedef DWORD CERT_ID_Choice; //Alias
  static const CERT_ID_Choice CERT_ID_ISSUER_SERIAL_NUMBER = 1;
  static const CERT_ID_Choice CERT_ID_KEY_IDENTIFIER = 2;
  static const CERT_ID_Choice CERT_ID_SHA1_HASH = 3;
  typedef struct CERT_ISSUER_SERIAL_NUMBER {
    CERT_NAME_BLOB Issuer;
    CRYPT_INTEGER_BLOB SerialNumber;
  } CERT_ISSUER_SERIAL_NUMBER;
  typedef union CERT_ID_u {
    CERT_ISSUER_SERIAL_NUMBER IssuerSerialNumber;
    CRYPT_HASH_BLOB KeyId;
    CRYPT_HASH_BLOB HashId;
  } CERT_ID_u;
  typedef struct CERT_ID {
    CERT_ID_Choice dwIdChoice;
    CERT_ID_u ;
  } CERT_ID;
  typedef struct CMSG_SIGNER_ENCODE_INFO {
    DWORD cbSize;
    PCERT_INFO pCertInfo;
    HcryptNcryptUnion ;
    CryptKeySpec dwKeySpec;
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    void* pvHashAuxInfo;
    DWORD cAuthAttr;
    PCRYPT_ATTRIBUTE rgAuthAttr;
    DWORD cUnauthAttr;
    PCRYPT_ATTRIBUTE rgUnauthAttr;
    CERT_ID SignerId;
    CRYPT_ALGORITHM_IDENTIFIER HashEncryptionAlgorithm;
    void* pvHashEncryptionAuxInfo;
  } CMSG_SIGNER_ENCODE_INFO;
  typedef CMSG_SIGNER_ENCODE_INFO *PCMSG_SIGNER_ENCODE_INFO; //Pointer
  typedef struct CMSG_SIGNED_ENCODE_INFO {
    DWORD cbSize;
    DWORD cSigners;
    PCMSG_SIGNER_ENCODE_INFO rgSigners;
    DWORD cCertEncoded;
    PCERT_BLOB rgCertEncoded;
    DWORD cCrlEncoded;
    PCRL_BLOB rgCrlEncoded;
    DWORD cAttrCertEncoded;
    PCERT_BLOB rgAttrCertEncoded;
  } CMSG_SIGNED_ENCODE_INFO;
  typedef CMSG_SIGNED_ENCODE_INFO *PCMSG_SIGNED_ENCODE_INFO; //Pointer
  typedef struct CRYPT_KEY_SIGN_MESSAGE_PARA {
    DWORD cbSize;
    DWORD dwMsgAndCertEncodingType;
    HcryptNcryptUnion ;
    DWORD dwKeySpec;
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    void* pvHashAuxInfo;
    CRYPT_ALGORITHM_IDENTIFIER PubKeyAlgorithm;
  } CRYPT_KEY_SIGN_MESSAGE_PARA;
  typedef CRYPT_KEY_SIGN_MESSAGE_PARA *PCRYPT_KEY_SIGN_MESSAGE_PARA; //Pointer
  typedef union CRYPT_OID_INFO_u {
    DWORD dwValue;
    ALG_ID Algid;
    DWORD dwLength;
  } CRYPT_OID_INFO_u;
  typedef struct CRYPT_OID_INFO {
    DWORD cbSize;
    LPCSTR pszOID;
    LPCWSTR pwszName;
    DWORD dwGroupId;
    CRYPT_OID_INFO_u ;
    CRYPT_DATA_BLOB ExtraInfo;
    LPCWSTR pwszCNGAlgid;
    LPCWSTR pwszCNGExtraAlgid;
  } CRYPT_OID_INFO;
  typedef CRYPT_OID_INFO *PCCRYPT_OID_INFO; //Pointer
  typedef struct MS_ADDINFO_FLAT {
    DWORD cbStruct;
    SIP_INDIRECT_DATA* pIndirectData;
  } MS_ADDINFO_FLAT;
  typedef DWORD CRYPTCAT_OPEN; //Alias
# pragma pack( push, 8 )
  typedef struct CRYPTCATSTORE {
    DWORD cbStruct;
    DWORD dwPublicVersion;
    LPWSTR pwszP7File;
    HCRYPTPROV hProv;
    CertEncodingType dwEncodingType;
    CRYPTCAT_OPEN fdwStoreFlags;
    HANDLE hReserved;
    HANDLE hAttrs;
    HCRYPTMSG hCryptMsg;
    HANDLE hSorted;
  } CRYPTCATSTORE;
# pragma pack( pop )
  typedef struct MS_ADDINFO_CATALOGMEMBER {
    DWORD cbStruct;
    CRYPTCATSTORE* pStore;
    CRYPTCATMEMBER* pMember;
  } MS_ADDINFO_CATALOGMEMBER;
  typedef struct MS_ADDINFO_BLOB {
    DWORD cbStruct;
    DWORD cbMemObject;
    BYTE* pbMemObject;
    DWORD cbMemSignedMsg;
    BYTE* pbMemSignedMsg;
  } MS_ADDINFO_BLOB;
  typedef union SIP_SUBJECTINFO_u {
    MS_ADDINFO_FLAT* psFlat;
    MS_ADDINFO_CATALOGMEMBER* psCatMember;
    MS_ADDINFO_BLOB* psBlob;
  } SIP_SUBJECTINFO_u;
  typedef DWORD SPC_PE; //Alias
  typedef DWORD SIP_SUBJECTINFO_Choice; //Alias
  static const SIP_SUBJECTINFO_Choice MSSIP_ADDINFO_NONE = 0;
  static const SIP_SUBJECTINFO_Choice MSSIP_ADDINFO_FLAT = 1;
  static const SIP_SUBJECTINFO_Choice MSSIP_ADDINFO_CATMEMBER = 2;
  static const SIP_SUBJECTINFO_Choice MSSIP_ADDINFO_BLOB = 3;
  static const SIP_SUBJECTINFO_Choice MSSIP_ADDINFO_NONMSSIP = 500;
  typedef struct SIP_SUBJECTINFO {
    DWORD cbSize;
    GUID* pgSubjectType;
    HANDLE hFile;
    LPCWSTR pwsFileName;
    LPCWSTR pwsDisplayName;
    DWORD dwReserved1;
    DWORD dwIntVersion;
    HCRYPTPROV hProv;
    CRYPT_ALGORITHM_IDENTIFIER DigestAlgorithm;
    SPC_PE dwFlags;
    CertEncodingType dwEncodingType;
    DWORD dwReserved2;
    DWORD fdwCAPISettings;
    DWORD fdwSecuritySettings;
    DWORD dwIndex;
    SIP_SUBJECTINFO_Choice dwUnionChoice;
    SIP_SUBJECTINFO_u ;
    LPVOID pClientData;
  } SIP_SUBJECTINFO;
  typedef DWORD CPD_CHOICE; //Alias
  static const CPD_CHOICE CPD_CHOICE_SIP = 1;
  typedef DWORD CPD_PROV_FLAGS; //Alias
  typedef DWORD CPD_UISTATE_MODE; //Alias
  static const CPD_UISTATE_MODE CPD_UISTATE_MODE_PROMPT = 0x00000000;
  static const CPD_UISTATE_MODE CPD_UISTATE_MODE_BLOCK = 0x00000001;
  static const CPD_UISTATE_MODE CPD_UISTATE_MODE_ALLOW = 0x00000002;
  static const CPD_UISTATE_MODE CPD_UISTATE_MODE_MASK = 0x00000003;
  typedef struct PROVDATA_SIP {
    DWORD cbStruct;
    GUID gSubject;
    SIP_DISPATCH_INFO* pSip;
    SIP_DISPATCH_INFO* pCATSip;
    SIP_SUBJECTINFO* psSipSubjectInfo;
    SIP_SUBJECTINFO* psSipCATSubjectInfo;
    SIP_INDIRECT_DATA* psIndirectData;
  } PROVDATA_SIP;
  typedef DWORD WTD_UI; //Alias
  static const WTD_UI WTD_UI_ALL = 1;
  static const WTD_UI WTD_UI_NONE = 2;
  static const WTD_UI WTD_UI_NOBAD = 3;
  static const WTD_UI WTD_UI_NOGOOD = 4;
  typedef DWORD WTD_REVOKE; //Alias
  typedef DWORD WTD_CHOICE; //Alias
  static const WTD_CHOICE WTD_CHOICE_FILE = 1;
  static const WTD_CHOICE WTD_CHOICE_CATALOG = 2;
  static const WTD_CHOICE WTD_CHOICE_BLOB = 3;
  static const WTD_CHOICE WTD_CHOICE_SIGNER = 4;
  static const WTD_CHOICE WTD_CHOICE_CERT = 5;
# pragma pack( push, 8 )
  typedef struct WINTRUST_FILE_INFO {
    DWORD cbStruct;
    LPCWSTR pcwszFilePath;
    HANDLE hFile;
    GUID* pgKnownSubject;
  } WINTRUST_FILE_INFO;
# pragma pack( pop )
# pragma pack( push, 8 )
  typedef struct WINTRUST_CATALOG_INFO {
    DWORD cbStruct;
    DWORD dwCatalogVersion;
    LPCWSTR pcwszCatalogFilePath;
    LPCWSTR pcwszMemberTag;
    LPCWSTR pcwszMemberFilePath;
    HANDLE hMemberFile;
    BYTE* pbCalculatedFileHash;
    DWORD cbCalculatedFileHash;
    PCCTL_CONTEXT pcCatalogContext;
  } WINTRUST_CATALOG_INFO;
# pragma pack( pop )
# pragma pack( push, 8 )
  typedef struct WINTRUST_BLOB_INFO {
    DWORD cbStruct;
    GUID gSubject;
    LPCWSTR pcwszDisplayName;
    DWORD cbMemObject;
    BYTE* pbMemObject;
    DWORD cbMemSignedMsg;
    BYTE* pbMemSignedMsg;
  } WINTRUST_BLOB_INFO;
# pragma pack( pop )
  typedef struct CMSG_SIGNER_INFO {
    DWORD dwVersion;
    CERT_NAME_BLOB Issuer;
    CRYPT_INTEGER_BLOB SerialNumber;
    CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
    CRYPT_ALGORITHM_IDENTIFIER HashEncryptionAlgorithm;
    CRYPT_DATA_BLOB EncryptedHash;
    CRYPT_ATTRIBUTES AuthAttrs;
    CRYPT_ATTRIBUTES UnauthAttrs;
  } CMSG_SIGNER_INFO;
# pragma pack( push, 8 )
  typedef struct WINTRUST_SGNR_INFO {
    DWORD cbStruct;
    LPCWSTR pcwszDisplayName;
    CMSG_SIGNER_INFO* psSignerInfo;
    DWORD chStores;
    HCERTSTORE* pahStores;
  } WINTRUST_SGNR_INFO;
# pragma pack( pop )
  typedef DWORD WINTRUST_CERT_INFO_FLAGS; //Alias
# pragma pack( push, 8 )
  typedef struct WINTRUST_CERT_INFO {
    DWORD cbStruct;
    LPCWSTR pcwszDisplayName;
    CERT_CONTEXT* psCertContext;
    DWORD chStores;
    HCERTSTORE* pahStores;
    WINTRUST_CERT_INFO_FLAGS dwFlags;
    FILETIME* psftVerifyAsOf;
  } WINTRUST_CERT_INFO;
# pragma pack( pop )
# pragma pack( push, 8 )
  typedef union WINTRUST_DATA_u {
    WINTRUST_FILE_INFO* pFile;
    WINTRUST_CATALOG_INFO* pCatalog;
    WINTRUST_BLOB_INFO* pBlob;
    WINTRUST_SGNR_INFO* pSgnr;
    WINTRUST_CERT_INFO* pCert;
  } WINTRUST_DATA_u;
# pragma pack( pop )
  typedef DWORD WTD_STATEACTION; //Alias
  static const WTD_STATEACTION WTD_STATEACTION_IGNORE = 0x00000000;
  static const WTD_STATEACTION WTD_STATEACTION_VERIFY = 0x00000001;
  static const WTD_STATEACTION WTD_STATEACTION_CLOSE = 0x00000002;
  static const WTD_STATEACTION WTD_STATEACTION_AUTO_CACHE = 0x00000003;
  static const WTD_STATEACTION WTD_STATEACTION_AUTO_CACHE_FLUSH = 0x00000004;
  typedef DWORD WTD_PROV_FLAGS; //Alias
  typedef DWORD WTD_UICONTEXT; //Alias
  static const WTD_UICONTEXT WTD_UICONTEXT_EXECUTE = 0;
  static const WTD_UICONTEXT WTD_UICONTEXT_INSTALL = 1;
# pragma pack( push, 8 )
  typedef struct WINTRUST_DATA {
    DWORD cbStruct;
    LPVOID pPolicyCallbackData;
    LPVOID pSIPClientData;
    WTD_UI dwUIChoice;
    WTD_REVOKE fdwRevocationChecks;
    WTD_CHOICE dwUnionChoice;
    WINTRUST_DATA_u ;
    WTD_STATEACTION dwStateAction;
    HANDLE hWVTStateData;
    WCHAR* pwszURLReference;
    WTD_PROV_FLAGS dwProvFlags;
    WTD_UICONTEXT dwUIContext;
  } WINTRUST_DATA;
# pragma pack( pop )
  typedef struct CERT_TRUST_LIST_INFO {
    DWORD cbSize;
    PCTL_ENTRY pCtlEntry;
    PCCTL_CONTEXT pCtlContext;
  } CERT_TRUST_LIST_INFO;
  typedef CERT_TRUST_LIST_INFO *PCERT_TRUST_LIST_INFO; //Pointer
  typedef struct CERT_SIMPLE_CHAIN {
    DWORD cbSize;
    CERT_TRUST_STATUS TrustStatus;
    DWORD cElement;
    PCERT_CHAIN_ELEMENT* rgpElement;
    PCERT_TRUST_LIST_INFO pTrustListInfo;
    BOOL fHasRevocationFreshnessTime;
    DWORD dwRevocationFreshnessTime;
  } CERT_SIMPLE_CHAIN;
  typedef CERT_SIMPLE_CHAIN *PCERT_SIMPLE_CHAIN; //Pointer
  typedef struct CERT_CHAIN_CONTEXT {
    DWORD cbSize;
    CERT_TRUST_STATUS TrustStatus;
    DWORD cChain;
    PCERT_SIMPLE_CHAIN* rgpChain;
    DWORD cLowerQualityChainContext;
    LPVOID rgpLowerQualityChainContext;
    BOOL fHasRevocationFreshnessTime;
    DWORD dwRevocationFreshnessTime;
    DWORD dwCreateFlags;
    GUID ChainId;
  } CERT_CHAIN_CONTEXT;
  typedef CERT_CHAIN_CONTEXT *PCCERT_CHAIN_CONTEXT; //Pointer
  typedef DWORD SGNR_TYPE; //Alias
  static const SGNR_TYPE SGNR_TYPE_TIMESTAMP = 0x00000010;
  typedef struct CRYPT_PROVIDER_SGNR {
    DWORD cbStruct;
    FILETIME sftVerifyAsOf;
    DWORD csCertChain;
    CRYPT_PROVIDER_CERT* pasCertChain;
    SGNR_TYPE dwSignerType;
    CMSG_SIGNER_INFO* psSigner;
    DWORD dwError;
    DWORD csCounterSigners;
    LPVOID pasCounterSigners;
    PCCERT_CHAIN_CONTEXT pChainContext;
  } CRYPT_PROVIDER_SGNR;
  typedef struct CRYPT_PROVIDER_DATA {
    DWORD cbStruct;
    WINTRUST_DATA* pWintrustData;
    BOOL fOpenedFile;
    HWND hWndParent;
    GUID* pgActionID;
    HCRYPTPROV hProv;
    DWORD dwError;
    DWORD dwRegSecuritySettings;
    DWORD dwRegPolicySettings;
    CRYPT_PROVIDER_FUNCTIONS* psPfns;
    DWORD cdwTrustStepErrors;
    DWORD* padwTrustStepErrors;
    DWORD chStores;
    HCERTSTORE* pahStores;
    DWORD dwEncoding;
    HCRYPTMSG hMsg;
    DWORD csSigners;
    CRYPT_PROVIDER_SGNR* pasSigners;
    DWORD csProvPrivData;
    CRYPT_PROVIDER_PRIVDATA* pasProvPrivData;
    CPD_CHOICE dwSubjectChoice;
    PROVDATA_SIP* pPDSip;
    char* pszUsageOID;
    BOOL fRecallWithState;
    FILETIME sftSystemTime;
    char* pszCTLSignerUsageOID;
    CPD_PROV_FLAGS dwProvFlags;
    DWORD dwFinalError;
    PCERT_USAGE_MATCH pRequestUsage;
    DWORD dwTrustPubSettings;
    CPD_UISTATE_MODE dwUIStateFlags;
  } CRYPT_PROVIDER_DATA;
  typedef DWORD SIGNER_SIGNATURE_CHOICE; //Alias
  static const SIGNER_SIGNATURE_CHOICE SIGNER_NO_ATTR = 0;
  static const SIGNER_SIGNATURE_CHOICE SIGNER_AUTHCODE_ATTR = 1;
  typedef struct SIGNER_ATTR_AUTHCODE {
    DWORD cbSize;
    BOOL fCommercial;
    BOOL fIndividual;
    LPCWSTR pwszName;
    LPCWSTR pwszInfo;
  } SIGNER_ATTR_AUTHCODE;
  typedef struct SIGNER_SIGNATURE_INFO {
    DWORD cbSize;
    ALG_ID algidHash;
    SIGNER_SIGNATURE_CHOICE dwAttrChoice;
    SIGNER_ATTR_AUTHCODE* pAttrAuthcode;
    PCRYPT_ATTRIBUTES psAuthenticated;
    PCRYPT_ATTRIBUTES psUnauthenticated;
  } SIGNER_SIGNATURE_INFO;
  typedef DWORD PVK_TYPE; //Alias
  static const PVK_TYPE PVK_TYPE_FILE_NAME = 1;
  static const PVK_TYPE PVK_TYPE_KEYCONTAINER = 2;
  typedef union SIGNER_PROVIDER_INFO_u {
    LPWSTR pwszPvkFileName;
    LPWSTR pwszKeyContainer;
  } SIGNER_PROVIDER_INFO_u;
  typedef struct SIGNER_PROVIDER_INFO {
    DWORD cbSize;
    LPCWSTR pwszProviderName;
    DWORD dwProviderType;
    DWORD dwKeySpec;
    PVK_TYPE dwPvkChoice;
    SIGNER_PROVIDER_INFO_u ;
  } SIGNER_PROVIDER_INFO;
  typedef DWORD SIGNER_SUBJECT; //Alias
  static const SIGNER_SUBJECT SIGNER_SUBJECT_FILE = 1;
  static const SIGNER_SUBJECT SIGNER_SUBJECT_BLOB = 2;
  typedef struct SIGNER_FILE_INFO {
    DWORD cbSize;
    LPCWSTR pwszFileName;
    HANDLE hFile;
  } SIGNER_FILE_INFO;
  typedef struct SIGNER_BLOB_INFO {
    DWORD cbSize;
    GUID* pGuidSubject;
    DWORD cbBlob;
    BYTE* pbBlob;
    LPCWSTR pwszDisplayName;
  } SIGNER_BLOB_INFO;
  typedef union SIGNER_SUBJECT_INFO_u {
    SIGNER_FILE_INFO* pSignerFileInfo;
    SIGNER_BLOB_INFO* pSignerBlobInfo;
  } SIGNER_SUBJECT_INFO_u;
  typedef struct SIGNER_SUBJECT_INFO {
    DWORD cbSize;
    DWORD* pdwIndex;
    SIGNER_SUBJECT dwSubjectChoice;
    SIGNER_SUBJECT_INFO_u ;
  } SIGNER_SUBJECT_INFO;
  typedef DWORD SIGNER_CERT_CHOICE; //Alias
  static const SIGNER_CERT_CHOICE SIGNER_CERT_SPC_FILE = 1;
  static const SIGNER_CERT_CHOICE SIGNER_CERT_STORE = 2;
  static const SIGNER_CERT_CHOICE SIGNER_CERT_SPC_CHAIN = 3;
  typedef DWORD SIGNER_CERT_POLICY; //Alias
  typedef struct SIGNER_CERT_STORE_INFO {
    DWORD cbSize;
    PCCERT_CONTEXT pSigningCert;
    SIGNER_CERT_POLICY dwCertPolicy;
    HCERTSTORE hCertStore;
  } SIGNER_CERT_STORE_INFO;
  typedef struct SIGNER_SPC_CHAIN_INFO {
    DWORD cbSize;
    LPCWSTR pwszSpcFile;
    SIGNER_CERT_POLICY dwCertPolicy;
    HCERTSTORE hCertStore;
  } SIGNER_SPC_CHAIN_INFO;
  typedef union SIGNER_CERT_u {
    LPCWSTR pwszSpcFile;
    SIGNER_CERT_STORE_INFO* pCertStoreInfo;
    SIGNER_SPC_CHAIN_INFO* pSpcChainInfo;
  } SIGNER_CERT_u;
  typedef struct SIGNER_CERT {
    DWORD cbSize;
    SIGNER_CERT_CHOICE dwCertChoice;
    SIGNER_CERT_u ;
    HWND hwnd;
  } SIGNER_CERT;
]]

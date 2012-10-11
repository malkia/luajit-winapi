require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/cryptography' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID HCRYPTXML; //Alias
  typedef LPVOID PFN_CRYPT_XML_DATA_PROVIDER_READ; //Alias
  typedef LPVOID PFN_CRYPT_XML_DATA_PROVIDER_CLOSE; //Alias
  typedef LPVOID PFN_CRYPT_XML_WRITE_CALLBACK; //Alias
  typedef LPVOID PFN_CRYPT_XML_CREATE_TRANSFORM; //Alias
  typedef struct CRYPT_XML_DATA_BLOB {
    ULONG cbData;
    BYTE* pbData;
  } CRYPT_XML_DATA_BLOB;
  typedef UINT CRYPT_XML_CHARSET; //Alias
  static const CRYPT_XML_CHARSET CRYPT_XML_CHARSET_AUTO = 0;
  static const CRYPT_XML_CHARSET CRYPT_XML_CHARSET_UTF8 = 1;
  static const CRYPT_XML_CHARSET CRYPT_XML_CHARSET_UTF16LE = 2;
  static const CRYPT_XML_CHARSET CRYPT_XML_CHARSET_UTF16BE = 3;
  typedef struct CRYPT_XML_BLOB {
    CRYPT_XML_CHARSET dwCharset;
    ULONG cbData;
    BYTE* pbData;
  } CRYPT_XML_BLOB;
  typedef CRYPT_XML_BLOB *PCRYPT_XML_BLOB; //Pointer
  typedef DWORD WINAPI_CRYPT_XML_KEY_VALUE_TYPE; //Alias
  static const WINAPI_CRYPT_XML_KEY_VALUE_TYPE CRYPT_XML_KEY_VALUE_TYPE_DSA = 0x00000001;
  static const WINAPI_CRYPT_XML_KEY_VALUE_TYPE CRYPT_XML_KEY_VALUE_TYPE_RSA = 0x00000002;
  static const WINAPI_CRYPT_XML_KEY_VALUE_TYPE CRYPT_XML_KEY_VALUE_TYPE_ECDSA = 0x00000003;
  static const WINAPI_CRYPT_XML_KEY_VALUE_TYPE CRYPT_XML_KEY_VALUE_TYPE_CUSTOM = 0x00000004;
  typedef struct CRYPT_XML_KEY_DSA_KEY_VALUE {
    CRYPT_XML_DATA_BLOB P;
    CRYPT_XML_DATA_BLOB Q;
    CRYPT_XML_DATA_BLOB G;
    CRYPT_XML_DATA_BLOB Y;
    CRYPT_XML_DATA_BLOB J;
    CRYPT_XML_DATA_BLOB Seed;
    CRYPT_XML_DATA_BLOB Counter;
  } CRYPT_XML_KEY_DSA_KEY_VALUE;
  typedef struct CRYPT_XML_KEY_RSA_KEY_VALUE {
    CRYPT_XML_DATA_BLOB Modulus;
    CRYPT_XML_DATA_BLOB Exponent;
  } CRYPT_XML_KEY_RSA_KEY_VALUE;
  typedef struct CRYPT_XML_KEY_ECDSA_KEY_VALUE {
    LPCWSTR wszNamedCurve;
    CRYPT_XML_DATA_BLOB X;
    CRYPT_XML_DATA_BLOB Y;
    CRYPT_XML_BLOB ExplicitPara;
  } CRYPT_XML_KEY_ECDSA_KEY_VALUE;
  typedef union WINAPI_CRYPT_XML_KEY_VALUE_u {
    CRYPT_XML_KEY_DSA_KEY_VALUE DSAKeyValue;
    CRYPT_XML_KEY_RSA_KEY_VALUE RSAKeyValue;
    CRYPT_XML_KEY_ECDSA_KEY_VALUE ECDSAKeyValue;
    CRYPT_XML_BLOB Custom;
  } WINAPI_CRYPT_XML_KEY_VALUE_u;
  typedef struct CRYPT_XML_KEY_VALUE {
    WINAPI_CRYPT_XML_KEY_VALUE_TYPE dwType;
    WINAPI_CRYPT_XML_KEY_VALUE_u ;
  } CRYPT_XML_KEY_VALUE;
  typedef DWORD WINAPI_CRYPT_XML_X509DATA_TYPE; //Alias
  static const WINAPI_CRYPT_XML_X509DATA_TYPE CRYPT_XML_X509DATA_TYPE_ISSUER_SERIAL = 0x00000001;
  static const WINAPI_CRYPT_XML_X509DATA_TYPE CRYPT_XML_X509DATA_TYPE_SKI = 0x00000002;
  static const WINAPI_CRYPT_XML_X509DATA_TYPE CRYPT_XML_X509DATA_TYPE_SUBJECT_NAME = 0x00000003;
  static const WINAPI_CRYPT_XML_X509DATA_TYPE CRYPT_XML_X509DATA_TYPE_CERTIFICATE = 0x00000004;
  static const WINAPI_CRYPT_XML_X509DATA_TYPE CRYPT_XML_X509DATA_TYPE_CRL = 0x00000005;
  static const WINAPI_CRYPT_XML_X509DATA_TYPE CRYPT_XML_X509DATA_TYPE_CUSTOM = 0x00000006;
  typedef struct CRYPT_XML_ISSUER_SERIAL {
    LPCWSTR wszIssuer;
    LPCWSTR wszSerial;
  } CRYPT_XML_ISSUER_SERIAL;
  typedef union WINAPI_CRYPT_XML_X509DATA_ITEM_u {
    CRYPT_XML_ISSUER_SERIAL IssuerSerial;
    CRYPT_XML_DATA_BLOB SKI;
    LPCWSTR wszSubjectName;
    CRYPT_XML_DATA_BLOB Certificate;
    CRYPT_XML_DATA_BLOB CRL;
    CRYPT_XML_BLOB Custom;
  } WINAPI_CRYPT_XML_X509DATA_ITEM_u;
  typedef struct CRYPT_XML_X509DATA_ITEM {
    WINAPI_CRYPT_XML_X509DATA_TYPE dwType;
    WINAPI_CRYPT_XML_X509DATA_ITEM_u ;
  } CRYPT_XML_X509DATA_ITEM;
  typedef struct CRYPT_XML_X509DATA {
    UINT cX509Data;
    CRYPT_XML_X509DATA_ITEM* rgX509Data;
  } CRYPT_XML_X509DATA;
  typedef DWORD WINAPI_CRYPT_XML_KEYINFO_TYPE; //Alias
  static const WINAPI_CRYPT_XML_KEYINFO_TYPE CRYPT_XML_KEYINFO_TYPE_KEYNAME = 0x00000001;
  static const WINAPI_CRYPT_XML_KEYINFO_TYPE CRYPT_XML_KEYINFO_TYPE_KEYVALUE = 0x00000002;
  static const WINAPI_CRYPT_XML_KEYINFO_TYPE CRYPT_XML_KEYINFO_TYPE_RETRIEVAL = 0x00000003;
  static const WINAPI_CRYPT_XML_KEYINFO_TYPE CRYPT_XML_KEYINFO_TYPE_X509DATA = 0x00000004;
  static const WINAPI_CRYPT_XML_KEYINFO_TYPE CRYPT_XML_KEYINFO_TYPE_CUSTOM = 0x00000005;
  typedef union WINAPI_CRYPT_XML_KEY_INFO_ITEM_u {
    LPCWSTR wszKeyName;
    CRYPT_XML_KEY_VALUE KeyValue;
    CRYPT_XML_BLOB RetrievalMethod;
    CRYPT_XML_X509DATA X509Data;
    CRYPT_XML_BLOB Custom;
  } WINAPI_CRYPT_XML_KEY_INFO_ITEM_u;
  typedef struct CRYPT_XML_KEY_INFO_ITEM {
    WINAPI_CRYPT_XML_KEYINFO_TYPE dwType;
    WINAPI_CRYPT_XML_KEY_INFO_ITEM_u ;
  } CRYPT_XML_KEY_INFO_ITEM;
  typedef struct CRYPT_XML_ALGORITHM {
    ULONG cbSize;
    LPCWSTR wszAlgorithm;
    CRYPT_XML_BLOB Encoded;
  } CRYPT_XML_ALGORITHM;
  typedef UINT CRYPT_XML_PROPERTY_ID; //Alias
  static const CRYPT_XML_PROPERTY_ID CRYPT_XML_PROPERTY_MAX_HEAP_SIZE = 1;
  static const CRYPT_XML_PROPERTY_ID CRYPT_XML_PROPERTY_SIGNATURE_LOCATION = 2;
  static const CRYPT_XML_PROPERTY_ID CRYPT_XML_PROPERTY_MAX_SIGNATURES = 3;
  static const CRYPT_XML_PROPERTY_ID CRYPT_XML_PROPERTY_DOC_DECLARATION = 4;
  static const CRYPT_XML_PROPERTY_ID CRYPT_XML_PROPERTY_XML_OUTPUT_CHARSET = 5;
  typedef struct CRYPT_XML_PROPERTY {
    CRYPT_XML_PROPERTY_ID dwPropId;
    void* pvValue;
    ULONG cbValue;
  } CRYPT_XML_PROPERTY;
  typedef struct CRYPT_XML_REFERENCE {
    ULONG cbSize;
    HCRYPTXML hReference;
    LPCWSTR wszId;
    LPCWSTR wszUri;
    LPCWSTR wszType;
    CRYPT_XML_ALGORITHM DigestMethod;
    CRYPT_DATA_BLOB DigestValue;
    ULONG cTransform;
    CRYPT_XML_ALGORITHM* rgTransform;
  } CRYPT_XML_REFERENCE;
  typedef CRYPT_XML_REFERENCE *PCRYPT_XML_REFERENCE; //Pointer
  typedef struct CRYPT_XML_REFERENCES {
    ULONG cReference;
    PCRYPT_XML_REFERENCE* rgpReference;
  } CRYPT_XML_REFERENCES;
  typedef struct CRYPT_XML_OBJECT {
    ULONG cbSize;
    HCRYPTXML hObject;
    LPCWSTR wszId;
    LPCWSTR wszMimeType;
    LPCWSTR wszEncoding;
    CRYPT_XML_REFERENCES Manifest;
    CRYPT_XML_BLOB Encoded;
  } CRYPT_XML_OBJECT;
  typedef CRYPT_XML_OBJECT *PCRYPT_XML_OBJECT; //Pointer
  typedef struct CRYPT_XML_DATA_PROVIDER {
    void* pvCallbackState;
    ULONG cbBufferSize;
    PFN_CRYPT_XML_DATA_PROVIDER_READ pfnRead;
    PFN_CRYPT_XML_DATA_PROVIDER_CLOSE pfnClose;
  } CRYPT_XML_DATA_PROVIDER;
  typedef struct CRYPT_XML_ALGORITHM_INFO {
    DWORD cbSize;
    WCHAR* wszAlgorithmURI;
    WCHAR* wszName;
    DWORD dwGroupId;
    WCHAR* wszCNGAlgid;
    WCHAR* wszCNGExtraAlgid;
    DWORD dwSignFlags;
    DWORD dwVerifyFlags;
    void* pvPaddingInfo;
    void* pvExtraInfo;
  } CRYPT_XML_ALGORITHM_INFO;
  typedef struct CRYPT_XML_TRANSFORM_INFO {
    ULONG cbSize;
    LPCWSTR wszAlgorithm;
    ULONG cbBufferSize;
    DWORD dwFlags;
    PFN_CRYPT_XML_CREATE_TRANSFORM pfnCreateTransform;
  } CRYPT_XML_TRANSFORM_INFO;
  typedef CRYPT_XML_TRANSFORM_INFO *PCRYPT_XML_TRANSFORM_INFO; //Pointer
  typedef struct CRYPT_XML_TRANSFORM_CHAIN_CONFIG {
    ULONG cbSize;
    ULONG cTransformInfo;
    PCRYPT_XML_TRANSFORM_INFO* rgpTransformInfo;
  } CRYPT_XML_TRANSFORM_CHAIN_CONFIG;
  typedef struct CRYPT_XML_SIGNED_INFO {
    ULONG cbSize;
    LPCWSTR wszId;
    CRYPT_XML_ALGORITHM Canonicalization;
    CRYPT_XML_ALGORITHM SignatureMethod;
    ULONG cReference;
    PCRYPT_XML_REFERENCE* rgpReference;
    CRYPT_XML_BLOB Encoded;
  } CRYPT_XML_SIGNED_INFO;
  typedef struct CRYPT_XML_KEY_INFO {
    ULONG cbSize;
    LPCWSTR wszId;
    UINT cKeyInfo;
    CRYPT_XML_KEY_INFO_ITEM* rgKeyInfo;
    BCRYPT_KEY_HANDLE hVerifyKey;
  } CRYPT_XML_KEY_INFO;
  typedef struct CRYPT_XML_SIGNATURE {
    ULONG cbSize;
    HCRYPTXML hSignature;
    LPCWSTR wszId;
    CRYPT_XML_SIGNED_INFO SignedInfo;
    CRYPT_DATA_BLOB SignatureValue;
    CRYPT_XML_KEY_INFO* pKeyInfo;
    ULONG cObject;
    PCRYPT_XML_OBJECT* rgpObject;
  } CRYPT_XML_SIGNATURE;
  typedef CRYPT_XML_SIGNATURE *PCRYPT_XML_SIGNATURE; //Pointer
  typedef struct CRYPT_XML_DOC_CTXT {
    ULONG cbSize;
    HCRYPTXML hDocCtxt;
    CRYPT_XML_TRANSFORM_CHAIN_CONFIG* pTransformsConfig;
    ULONG cSignature;
    PCRYPT_XML_SIGNATURE* rgpSignature;
  } CRYPT_XML_DOC_CTXT;
  typedef struct CRYPT_XML_STATUS {
    ULONG cbSize;
    DWORD dwErrorStatus;
    DWORD dwInfoStatus;
  } CRYPT_XML_STATUS;
  typedef UINT CRYPT_XML_KEYINFO_SPEC; //Alias
  static const CRYPT_XML_KEYINFO_SPEC CRYPT_XML_KEYINFO_SPEC_NONE = 0;
  static const CRYPT_XML_KEYINFO_SPEC CRYPT_XML_KEYINFO_SPEC_ENCODED = 1;
  static const CRYPT_XML_KEYINFO_SPEC CRYPT_XML_KEYINFO_SPEC_PARAM = 2;
  HRESULT CryptXmlCreateReference(  HCRYPTXML hCryptXml, DWORD dwFlags, LPCWSTR wszId, LPCWSTR wszURI, LPCWSTR wszType, CRYPT_XML_ALGORITHM* pDigestMethod, ULONG cTransform, CRYPT_XML_ALGORITHM* rgTransform, HCRYPTXML* phReference);
  HRESULT CryptXmlAddObject(        HCRYPTXML hSignatureOrObject, DWORD dwFlags, CRYPT_XML_PROPERTY* rgProperty, ULONG cProperty, PCRYPT_XML_BLOB pEncoded, CRYPT_XML_OBJECT** ppObject);
  HRESULT CryptXmlClose(            HCRYPTXML hCryptXml);
  HRESULT CryptXmlDigestReference(  HCRYPTXML hReference, DWORD dwFlags, CRYPT_XML_DATA_PROVIDER* pDataProviderIn);
  HRESULT CryptXmlEncode(           HCRYPTXML hCryptXml, CRYPT_XML_CHARSET dwCharset, CRYPT_XML_PROPERTY* rgProperty, ULONG cProperty, void* pvCallbackState, PFN_CRYPT_XML_WRITE_CALLBACK pfnWrite);
  HRESULT CryptXmlGetAlgorithmInfo( CRYPT_XML_ALGORITHM* pXmlAlgorithm, DWORD dwFlags, CRYPT_XML_ALGORITHM_INFO** ppAlgInfo);
  HRESULT CryptXmlGetDocContext(    HCRYPTXML hCryptXml, CRYPT_XML_DOC_CTXT** ppStruct);
  HRESULT CryptXmlGetReference(     HCRYPTXML HCRYPTXML, CRYPT_XML_REFERENCE** ppStruct);
  HRESULT CryptXmlGetSignature(     HCRYPTXML hCryptXml, CRYPT_XML_SIGNATURE** ppStruct);
  HRESULT CryptXmlGetStatus(        HCRYPTXML hCryptXml, CRYPT_XML_STATUS* pStatus);
  HRESULT CryptXmlGetTransforms(    CRYPT_XML_TRANSFORM_CHAIN_CONFIG** ppConfig);
  HRESULT CryptXmlImportPublicKey(  DWORD dwFlags, CRYPT_XML_KEY_VALUE* pKeyValue, BCRYPT_KEY_HANDLE* phKey);
  HRESULT CryptXmlOpenToEncode(     CRYPT_XML_TRANSFORM_CHAIN_CONFIG* pConfig, DWORD dwFlags, LPCWSTR wszId, CRYPT_XML_PROPERTY* rgProperty, ULONG cProperty, CRYPT_XML_BLOB* pEncoded, HCRYPTXML* phSignature);
  HRESULT CryptXmlOpenToDecode(     CRYPT_XML_TRANSFORM_CHAIN_CONFIG* pConfig, DWORD dwFlags, CRYPT_XML_PROPERTY* rgProperty, ULONG cProperty, CRYPT_XML_BLOB* pEncoded, HCRYPTXML phCryptXml);
  HRESULT CryptXmlSetHMACSecret(    HCRYPTXML hSignature, BYTE* pbSecret, ULONG cbSecret);
  HRESULT CryptXmlVerifySignature(  HCRYPTXML hSignature, BCRYPT_KEY_HANDLE hKey, DWORD dwFlags);
  HRESULT CryptXmlSign(             HCRYPTXML hSignature, HCRYPTPROV_OR_NCRYPT_KEY_HANDLE hKey, DWORD dwKeySpec, DWORD dwFlags, CRYPT_XML_KEYINFO_SPEC dwKeyInfoSpec, void* pvKeyInfoSpec, CRYPT_XML_ALGORITHM* pSignatureMethod, CRYPT_XML_ALGORITHM* pCanonicalization);
]]
return ffi.load( 'Cryptxml.dll' )

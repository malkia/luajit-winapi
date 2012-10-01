require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/cryptography" )
local ffi = require( "ffi" )
ffi.cdef [[
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
return ffi.load( "Cryptxml.dll" )

require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  BOOL CryptGetObjectUrl(        LPCSTR pszUrlOid, LPVOID pvPara, WINAPI_CryptGetObjectUrlFlags dwFlags, PCRYPT_URL_ARRAY pUrlArray, DWORD* pcbUrlArray, PCRYPT_URL_INFO pUrlInfo, DWORD* pcbUrlInfo, LPVOID pvReserved);
  BOOL CryptRetrieveObjectByUrl( LPCTSTR pszUrl, LPCSTR pszObjectOid, WINAPI_CryptRetrievalFlags dwRetrievalFlags, DWORD dwTimeout, LPVOID* ppvObject, HCRYPTASYNC hAsyncRetrieve, PCRYPT_CREDENTIALS pCredentials, LPVOID pvVerify, PCRYPT_RETRIEVE_AUX_INFO pAuxInfo);
]]
return ffi.load( 'Cryptnet.dll' )

require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef HANDLE HCRYPTASYNC; //Alias
  typedef struct CRYPT_URL_ARRAY {
    DWORD cUrl;
    LPWSTR* rgwszUrl;
  } CRYPT_URL_ARRAY;
  typedef CRYPT_URL_ARRAY *PCRYPT_URL_ARRAY; //Pointer
  typedef struct CRYPT_URL_INFO {
    DWORD cbSize;
    DWORD dwSyncDeltaTime;
    DWORD cGroup;
    DWORD* rgcGroupEntry;
  } CRYPT_URL_INFO;
  typedef CRYPT_URL_INFO *PCRYPT_URL_INFO; //Pointer
  typedef struct CRYPT_CREDENTIALS {
    DWORD cbSize;
    LPCSTR pszCredentialsOid;
    LPVOID pvCredentials;
  } CRYPT_CREDENTIALS;
  typedef CRYPT_CREDENTIALS *PCRYPT_CREDENTIALS; //Pointer
  typedef struct CRYPTNET_URL_CACHE_PRE_FETCH_INFO {
    DWORD cbSize;
    DWORD dwObjectType;
    DWORD dwError;
    DWORD dwReserved;
    FILETIME ThisUpdateTime;
    FILETIME NextUpdateTime;
    FILETIME PublishTime;
  } CRYPTNET_URL_CACHE_PRE_FETCH_INFO;
  typedef CRYPTNET_URL_CACHE_PRE_FETCH_INFO *PCRYPTNET_URL_CACHE_PRE_FETCH_INFO; //Pointer
  typedef struct CRYPTNET_URL_CACHE_FLUSH_INFO {
    DWORD cbSize;
    DWORD dwExemptSeconds;
    FILETIME ExpireTime;
  } CRYPTNET_URL_CACHE_FLUSH_INFO;
  typedef CRYPTNET_URL_CACHE_FLUSH_INFO *PCRYPTNET_URL_CACHE_FLUSH_INFO; //Pointer
  typedef struct CRYPTNET_URL_CACHE_RESPONSE_INFO {
    DWORD cbSize;
    WORD wResponseType;
    WORD wResponseFlags;
    FILETIME LastModifiedTime;
    DWORD dwMaxAge;
    LPCWSTR pwszETag;
    DWORD dwProxyId;
  } CRYPTNET_URL_CACHE_RESPONSE_INFO;
  typedef CRYPTNET_URL_CACHE_RESPONSE_INFO *PCRYPTNET_URL_CACHE_RESPONSE_INFO; //Pointer
  typedef struct CRYPT_RETRIEVE_AUX_INFO {
    DWORD cbSize;
    FILETIME* pLastSyncTime;
    DWORD dwMaxUrlRetrievalByteCount;
    PCRYPTNET_URL_CACHE_PRE_FETCH_INFO pPreFetchInfo;
    PCRYPTNET_URL_CACHE_FLUSH_INFO pFlushInfo;
    PCRYPTNET_URL_CACHE_RESPONSE_INFO* ppResponseInfo;
    LPWSTR pwszCacheFileNamePrefix;
    LPFILETIME pftCacheResync;
    BOOL fProxyCacheRetrieval;
    DWORD dwHttpStatusCode;
  } CRYPT_RETRIEVE_AUX_INFO;
  typedef CRYPT_RETRIEVE_AUX_INFO *PCRYPT_RETRIEVE_AUX_INFO; //Pointer
  typedef DWORD WINAPI_CryptRetrievalFlags; //Alias
  typedef DWORD WINAPI_CryptGetObjectUrlFlags; //Alias
  BOOL CryptGetObjectUrl(        LPCSTR pszUrlOid, LPVOID pvPara, WINAPI_CryptGetObjectUrlFlags dwFlags, PCRYPT_URL_ARRAY pUrlArray, DWORD* pcbUrlArray, PCRYPT_URL_INFO pUrlInfo, DWORD* pcbUrlInfo, LPVOID pvReserved);
  BOOL CryptRetrieveObjectByUrl( LPCTSTR pszUrl, LPCSTR pszObjectOid, WINAPI_CryptRetrievalFlags dwRetrievalFlags, DWORD dwTimeout, LPVOID* ppvObject, HCRYPTASYNC hAsyncRetrieve, PCRYPT_CREDENTIALS pCredentials, LPVOID pvVerify, PCRYPT_RETRIEVE_AUX_INFO pAuxInfo);
]]
return ffi.load( 'Cryptnet.dll' )

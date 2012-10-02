require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID HINTERNET; //Alias
  typedef LONGLONG GROUPID; //Alias
  typedef LPVOID WINHTTP_STATUS_CALLBACK; //Alias
  typedef LPVOID GOPHER_ATTRIBUTE_ENUMERATOR; //Alias
  typedef LPVOID INTERNET_STATUS_CALLBACK; //Alias
  typedef DWORD DWORD [GROUP_OWNER_STORAGE_SIZE]; //Array 4
  typedef TCHAR TCHAR [GROUPNAME_MAX_LENGTH]; //Array 120
  typedef TCHAR TCHAR [MAX_GOPHER_DISPLAY_TEXT + 1]; //Array 129
  typedef TCHAR TCHAR [MAX_GOPHER_LOCATOR_LENGTH + 1]; //Array 653
  typedef struct INTERNET_CACHE_ENTRY_INFO {
    DWORD dwStructSize;
    LPTSTR lpszSourceUrlName;
    LPTSTR lpszLocalFileName;
    DWORD CacheEntryType;
    DWORD dwUseCount;
    DWORD dwHitRate;
    DWORD dwSizeLow;
    DWORD dwSizeHigh;
    FILETIME LastModifiedTime;
    FILETIME ExpireTime;
    FILETIME LastAccessTime;
    FILETIME LastSyncTime;
    LPTSTR lpHeaderInfo;
    DWORD dwHeaderInfoSize;
    LPTSTR lpszFileExtension;
    DWORD dwExemptDelta;
  } INTERNET_CACHE_ENTRY_INFO;
  typedef INTERNET_CACHE_ENTRY_INFO *LPINTERNET_CACHE_ENTRY_INFO; //Pointer
  typedef DWORD WINAPI_CACHEGROUP_FLAG; //Alias
  typedef DWORD WINAPI_CACHEGROUP_TYPE; //Alias
  typedef struct INTERNET_CACHE_GROUP_INFO {
    DWORD dwGroupSize;
    WINAPI_CACHEGROUP_FLAG dwGroupFlags;
    WINAPI_CACHEGROUP_TYPE dwGroupType;
    DWORD dwDiskUsage;
    DWORD dwDiskQuota;
    DWORD dwOwnerStorage[GROUP_OWNER_STORAGE_SIZE];
    TCHAR szGroupName[GROUPNAME_MAX_LENGTH];
  } INTERNET_CACHE_GROUP_INFO;
  typedef INTERNET_CACHE_GROUP_INFO *LPINTERNET_CACHE_GROUP_INFO; //Pointer
  typedef DWORD WINAPI_GopherType; //Alias
  typedef struct GOPHER_FIND_DATA {
    TCHAR DisplayString[MAX_GOPHER_DISPLAY_TEXT + 1];
    WINAPI_GopherType GopherType;
    DWORD SizeLow;
    DWORD SizeHigh;
    FILETIME LastModificationTime;
    TCHAR Locator[MAX_GOPHER_LOCATOR_LENGTH + 1];
  } GOPHER_FIND_DATA;
  typedef GOPHER_FIND_DATA *LPGOPHER_FIND_DATA; //Pointer
  typedef enum WINAPI_ProxyAccessType {
    WINHTTP_ACCESS_TYPE_DEFAULT_PROXY = 0,
    WINHTTP_ACCESS_TYPE_NO_PROXY = 1,
    WINHTTP_ACCESS_TYPE_NAMED_PROXY = 3,
  } WINAPI_ProxyAccessType;
  typedef struct WINHTTP_PROXY_INFO {
    WINAPI_ProxyAccessType dwAccessType;
    LPWSTR lpszProxy;
    LPWSTR lpszProxyBypass;
  } WINHTTP_PROXY_INFO;
  typedef struct WINHTTP_CURRENT_USER_IE_PROXY_CONFIG {
    BOOL fAutoDetect;
    LPWSTR lpszAutoConfigUrl;
    LPWSTR lpszProxy;
    LPWSTR lpszProxyBypass;
  } WINHTTP_CURRENT_USER_IE_PROXY_CONFIG;
  typedef DWORD WINAPI_AutoProxyFlags; //Alias
  typedef DWORD WINAPI_AutoDetectFlags; //Alias
  typedef struct WINHTTP_AUTOPROXY_OPTIONS {
    WINAPI_AutoProxyFlags dwFlags;
    WINAPI_AutoDetectFlags dwAutoDetectFlags;
    LPCWSTR lpszAutoConfigUrl;
    LPVOID lpvReserved;
    DWORD dwReserved;
    BOOL fAutoLogonIfChallenged;
  } WINHTTP_AUTOPROXY_OPTIONS;
  typedef enum INTERNET_PORT {
    INTERNET_DEFAULT_FTP_PORT = 21,
    INTERNET_DEFAULT_GOPHER_PORT = 70,
    INTERNET_DEFAULT_HTTP_PORT = 80,
    INTERNET_DEFAULT_HTTPS_PORT = 443,
    INTERNET_DEFAULT_SOCKS_PORT = 1080,
    INTERNET_INVALID_PORT_NUMBER = 0,
  } INTERNET_PORT;
  typedef enum INTERNET_SCHEME {
    INTERNET_SCHEME_PARTIAL = -2,
    INTERNET_SCHEME_UNKNOWN = -1,
    INTERNET_SCHEME_DEFAULT = 0,
    INTERNET_SCHEME_FTP = 1,
    INTERNET_SCHEME_GOPHER = 2,
    INTERNET_SCHEME_HTTP = 3,
    INTERNET_SCHEME_HTTPS = 4,
    INTERNET_SCHEME_FILE = 5,
    INTERNET_SCHEME_NEWS = 6,
    INTERNET_SCHEME_MAILTO = 7,
    INTERNET_SCHEME_SOCKS = 8,
    INTERNET_SCHEME_JAVASCRIPT = 9,
    INTERNET_SCHEME_VBSCRIPT = 10,
    INTERNET_SCHEME_RES = 11,
  } INTERNET_SCHEME;
  typedef struct URL_COMPONENTS {
    DWORD dwStructSize;
    LPTSTR lpszScheme;
    DWORD dwSchemeLength;
    INTERNET_SCHEME nScheme;
    LPTSTR lpszHostName;
    DWORD dwHostNameLength;
    INTERNET_PORT nPort;
    LPTSTR lpszUserName;
    DWORD dwUserNameLength;
    LPTSTR lpszPassword;
    DWORD dwPasswordLength;
    LPTSTR lpszUrlPath;
    DWORD dwUrlPathLength;
    LPTSTR lpszExtraInfo;
    DWORD dwExtraInfoLength;
  } URL_COMPONENTS;
  typedef URL_COMPONENTS *LPURL_COMPONENTS; //Pointer
  typedef enum WINAPI_InternetSchemeWinHttp {
    INTERNET_SCHEME_HTTP = 1,
    INTERNET_SCHEME_HTTPS = 2,
  } WINAPI_InternetSchemeWinHttp;
  typedef struct URL_COMPONENTSW {
    DWORD dwStructSize;
    LPWSTR lpszScheme;
    DWORD dwSchemeLength;
    WINAPI_InternetSchemeWinHttp nScheme;
    LPWSTR lpszHostName;
    DWORD dwHostNameLength;
    INTERNET_PORT nPort;
    LPWSTR lpszUserName;
    DWORD dwUserNameLength;
    LPWSTR lpszPassword;
    DWORD dwPasswordLength;
    LPWSTR lpszUrlPath;
    DWORD dwUrlPathLength;
    LPWSTR lpszExtraInfo;
    DWORD dwExtraInfoLength;
  } URL_COMPONENTSW;
  typedef URL_COMPONENTSW *LPURL_COMPONENTSW; //Pointer
  typedef DWORD WINAPI_InternetCanonicalizeUrlFlags; //Alias
  typedef DWORD WINAPI_InternetCrackUrlFlags; //Alias
  typedef struct INTERNET_BUFFERS {
    DWORD dwStructSize;
    LPVOID Next;
    LPCTSTR lpcszHeader;
    DWORD dwHeadersLength;
    DWORD dwHeadersTotal;
    LPVOID lpvBuffer;
    DWORD dwBufferLength;
    DWORD dwBufferTotal;
    DWORD dwOffsetLow;
    DWORD dwOffsetHigh;
  } INTERNET_BUFFERS;
  typedef INTERNET_BUFFERS *LPINTERNET_BUFFERS; //Pointer
]]

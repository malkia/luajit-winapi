require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/internet' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef DWORD WINAPI_CallbackNotificationFlags; //Alias
  typedef DWORD WINAPI_HttpOpenAccessType; //Alias
//static const WINAPI_HttpOpenAccessType WINHTTP_ACCESS_TYPE_DEFAULT_PROXY = 0;
//static const WINAPI_HttpOpenAccessType WINHTTP_ACCESS_TYPE_NO_PROXY = 1;
//static const WINAPI_HttpOpenAccessType WINHTTP_ACCESS_TYPE_NAMED_PROXY = 3;
  typedef DWORD WINAPI_WinHttpOpenFlags; //Alias
  static const WINAPI_WinHttpOpenFlags WINHTTP_FLAG_ASYNC = 0x10000000;
  typedef DWORD WINAPI_WinHttpOpenRequestFlags; //Alias
  typedef DWORD WINAPI_WinHttpOption; //Alias
  static const WINAPI_WinHttpOption WINHTTP_OPTION_CALLBACK = 1;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_RESOLVE_TIMEOUT = 2;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_CONNECT_TIMEOUT = 3;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_CONNECT_RETRIES = 4;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_SEND_TIMEOUT = 5;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_RECEIVE_TIMEOUT = 6;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_RECEIVE_RESPONSE_TIMEOUT = 7;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_HANDLE_TYPE = 9;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_READ_BUFFER_SIZE = 12;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_WRITE_BUFFER_SIZE = 13;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_PARENT_HANDLE = 21;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_EXTENDED_ERROR = 24;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_SECURITY_FLAGS = 31;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_SECURITY_CERTIFICATE_STRUCT = 32;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_URL = 34;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_SECURITY_KEY_BITNESS = 36;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_PROXY = 38;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_USER_AGENT = 41;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_CONTEXT_VALUE = 45;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_CLIENT_CERT_CONTEXT = 47;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_REQUEST_PRIORITY = 58;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_HTTP_VERSION = 59;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_DISABLE_FEATURE = 63;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_CODEPAGE = 68;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_MAX_CONNS_PER_SERVER = 73;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_MAX_CONNS_PER_1_0_SERVER = 74;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_AUTOLOGON_POLICY = 77;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_SERVER_CERT_CONTEXT = 78;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_ENABLE_FEATURE = 79;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_WORKER_THREAD_COUNT = 80;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_PASSPORT_COBRANDING_TEXT = 81;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_PASSPORT_COBRANDING_URL = 82;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_CONFIGURE_PASSPORT_AUTH = 83;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_SECURE_PROTOCOLS = 84;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_ENABLETRACING = 85;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_PASSPORT_SIGN_OUT = 86;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_PASSPORT_RETURN_URL = 87;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_REDIRECT_POLICY = 88;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_MAX_HTTP_AUTOMATIC_REDIRECTS = 89;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_MAX_HTTP_STATUS_CONTINUE = 90;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_MAX_RESPONSE_HEADER_SIZE = 91;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_MAX_RESPONSE_DRAIN_SIZE = 92;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_CONNECTION_INFO = 93;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_CLIENT_CERT_ISSUER_LIST = 94;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_SPN = 96;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_GLOBAL_PROXY_CREDS = 97;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_GLOBAL_SERVER_CREDS = 98;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_UNLOAD_NOTIFY_EVENT = 99;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_REJECT_USERPWD_IN_URL = 100;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_USE_GLOBAL_SERVER_CREDENTIALS = 101;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_USERNAME = 0x1000;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_PASSWORD = 0x1001;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_PROXY_USERNAME = 0x1002;
  static const WINAPI_WinHttpOption WINHTTP_OPTION_PROXY_PASSWORD = 0x1003;
  typedef DWORD WINAPI_WinHttpAddReqFlag; //Alias
  typedef DWORD WINAPI_WinHttpQueryLevelFlags; //Alias
  BOOL                    WinHttpAddRequestHeaders(              HINTERNET hRequest, LPCWSTR pwszHeaders, DWORD dwHeadersLength, WINAPI_WinHttpAddReqFlag dwModifiers);
  BOOL                    WinHttpCheckPlatform(                  );
  BOOL                    WinHttpCloseHandle(                    HINTERNET hInternet);
  HINTERNET               WinHttpConnect(                        HINTERNET hSession, LPCWSTR pswzServerName, INTERNET_PORT nServerPort, DWORD dwReserved);
  BOOL                    WinHttpCrackUrl(                       LPCWSTR pwszUrl, DWORD dwUrlLength, WINAPI_InternetCrackUrlFlags dwFlags, LPURL_COMPONENTSW lpUrlComponents);
  BOOL                    WinHttpCreateUrl(                      LPURL_COMPONENTSW lpUrlComponents, WINAPI_InternetCrackUrlFlags dwFlags, LPWSTR pwszUrl, LPDWORD lpdwUrlLength);
  BOOL                    WinHttpDetectAutoProxyConfigUrl(       DWORD dwAutoDetectFlags, LPWSTR* ppwszAutoConfigUrl);
  BOOL                    WinHttpGetDefaultProxyConfiguration(   WINHTTP_PROXY_INFO* pProxyInfo);
  BOOL                    WinHttpGetIEProxyConfigForCurrentUser( WINHTTP_CURRENT_USER_IE_PROXY_CONFIG* pProxyConfig);
  BOOL                    WinHttpGetProxyForUrl(                 HINTERNET hSession, LPCWSTR lpcwszUrl, WINHTTP_AUTOPROXY_OPTIONS* pAutoProxyOptions, WINHTTP_PROXY_INFO* pProxyInfo);
  HINTERNET               WinHttpOpen(                           LPCWSTR pwszUserAgent, WINAPI_HttpOpenAccessType dwAccessType, LPCWSTR pwszProxyName, LPCWSTR pwszProxyBypass, WINAPI_WinHttpOpenFlags dwFlags);
  HINTERNET               WinHttpOpenRequest(                    HINTERNET hConnect, LPCWSTR pwszVerb, LPCWSTR pwszObjectName, LPCWSTR pwszVersion, LPCWSTR pwszReferrer, LPCWSTR* ppwszAcceptTypes, WINAPI_WinHttpOpenRequestFlags dwFlags);
  BOOL                    WinHttpQueryAuthSchemes(               HINTERNET hRequest, LPDWORD lpdwSupportedSchemes, LPDWORD lpdwFirstScheme, LPDWORD pdwAuthTarget);
  BOOL                    WinHttpQueryDataAvailable(             HINTERNET hRequest, LPDWORD lpdwNumberOfBytesAvailable);
  BOOL                    WinHttpReadData(                       HINTERNET hRequest, LPVOID lpBuffer, DWORD dwNumberOfBytesToRead, LPDWORD lpdwNumberOfBytesRead);
  BOOL                    WinHttpQueryHeaders(                   HINTERNET hRequest, WINAPI_WinHttpQueryLevelFlags dwInfoLevel, LPCWSTR pwszName, LPVOID lpBuffer, LPDWORD lpdwBufferLength, LPDWORD lpdwIndex);
  BOOL                    WinHttpQueryOption(                    HINTERNET hInternet, WINAPI_WinHttpOption dwOption, LPVOID lpBuffer, LPDWORD lpdwBufferLength);
  BOOL                    WinHttpReceiveResponse(                HINTERNET hRequest, LPVOID lpReserved);
  BOOL                    WinHttpSendRequest(                    HINTERNET hRequest, LPCWSTR pwszHeaders, DWORD dwHeadersLength, LPVOID lpOptional, DWORD dwOptionalLength, DWORD dwTotalLength, DWORD_PTR dwContext);
  BOOL                    WinHttpSetCredentials(                 HINTERNET hRequest, DWORD AuthTargets, DWORD AuthScheme, LPCWSTR pwszUserName, LPCWSTR pwszPassword, LPVOID pAuthParams);
  BOOL                    WinHttpSetDefaultProxyConfiguration(   WINHTTP_PROXY_INFO* pProxyInfo);
  BOOL                    WinHttpSetOption(                      HINTERNET hInternet, WINAPI_WinHttpOption dwOption, LPVOID lpBuffer, DWORD dwBufferLength);
  WINHTTP_STATUS_CALLBACK WinHttpSetStatusCallback(              HINTERNET hInternet, WINHTTP_STATUS_CALLBACK lpfnInternetCallback, WINAPI_CallbackNotificationFlags dwNotificationFlags, DWORD_PTR dwReserved);
  BOOL                    WinHttpSetTimeouts(                    HINTERNET hInternet, int dwResolveTimeout, int dwConnectTimeout, int dwSendTimeout, int dwReceiveTimeout);
  BOOL                    WinHttpTimeFromSystemTime(             SYSTEMTIME* pst, LPWSTR pwszTime);
  BOOL                    WinHttpTimeToSystemTime(               LPCWSTR pwszTime, SYSTEMTIME* pst);
  BOOL                    WinHttpWriteData(                      HINTERNET hRequest, LPCVOID lpBuffer, DWORD dwNumberOfBytesToWrite, LPDWORD lpdwNumberOfBytesWritten);
]]
return ffi.load( 'Winhttp.dll' )

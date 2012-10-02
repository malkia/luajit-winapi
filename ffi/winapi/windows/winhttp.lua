require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/internet' )
local ffi = require( 'ffi' )
ffi.cdef [[
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

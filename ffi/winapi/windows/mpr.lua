require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  void              WNetSetLastError(                 DWORD err, LPTSTR lpError, LPTSTR lpProvider);
  WINAPI_ERROR_CODE MultinetGetConnectionPerformance( LPNETRESOURCE lpNetResource, LPNETCONNECTINFOSTRUCT lpNetConnectInfoStruct);
  WINAPI_ERROR_CODE WNetAddConnection2(               LPNETRESOURCE lpNetResource, LPCTSTR lpPassword, LPCTSTR lpUsername, WINAPI_ConnectFlags dwFlags);
  WINAPI_ERROR_CODE WNetAddConnection3(               HWND hwndOwner, LPNETRESOURCE lpNetResource, LPTSTR lpPassword, LPTSTR lpUserName, WINAPI_ConnectFlags dwFlags);
  WINAPI_ERROR_CODE WNetCancelConnection(             LPCTSTR lpName, BOOL fForce);
  WINAPI_ERROR_CODE WNetCancelConnection2(            LPCTSTR lpName, WINAPI_ConnectFlags dwFlags, BOOL fForce);
  WINAPI_ERROR_CODE WNetCloseEnum(                    HANDLE hEnum);
  WINAPI_ERROR_CODE WNetConnectionDialog(             HWND hwnd, WINAPI_RESOURCETYPE dwType);
  WINAPI_ERROR_CODE WNetConnectionDialog1(            LPCONNECTDLGSTRUCT lpConnDlgStruct);
  WINAPI_ERROR_CODE WNetDisconnectDialog(             HWND hwnd, WINAPI_RESOURCETYPE dwType);
  WINAPI_ERROR_CODE WNetDisconnectDialog1(            LPDISCDLGSTRUCT lpConnDlgStruct);
  WINAPI_ERROR_CODE WNetEnumResource(                 HANDLE hEnum, LPDWORD lpcCount, LPNETRESOURCE lpBuffer, LPDWORD lpBufferSize);
  WINAPI_ERROR_CODE WNetGetConnection(                LPCTSTR lpLocalName, LPTSTR lpRemoteName, LPDWORD lpnLength);
  WINAPI_ERROR_CODE WNetGetLastError(                 LPDWORD lpError, LPTSTR lpErrorBuf, DWORD nErrorBufSize, LPTSTR lpNameBuf, DWORD nNameBufSize);
  WINAPI_ERROR_CODE WNetGetNetworkInformation(        LPCTSTR lpProvider, LPNETINFOSTRUCT lpNetInfoStruct);
  WINAPI_ERROR_CODE WNetGetProviderName(              DWORD dwNetType, LPTSTR lpProviderName, LPDWORD lpBufferSize);
  WINAPI_ERROR_CODE WNetGetResourceInformation(       LPNETRESOURCE lpNetResource, LPVOID lpBuffer, LPDWORD lpcbBuffer, LPTSTR* lplpSystem);
  WINAPI_ERROR_CODE WNetGetResourceParent(            LPNETRESOURCE lpNetResource, LPNETRESOURCE lpBuffer, LPDWORD lpcbBuffer);
  WINAPI_ERROR_CODE WNetGetUniversalName(             LPCTSTR lpLocalPath, WINAPI_UniversalInfoLevel dwInfoLevel, LPVOID lpBuffer, LPDWORD lpBufferSize);
  WINAPI_ERROR_CODE WNetGetUser(                      LPCTSTR lpName, LPTSTR lpUserName, LPDWORD lpnLength);
  WINAPI_ERROR_CODE WNetOpenEnum(                     WINAPI_ResourceScope dwScope, WINAPI_RESOURCETYPE dwType, WINAPI_RESOURCEUSAGE dwUsage, LPNETRESOURCE lpNetResource, LPHANDLE lphEnum);
  WINAPI_ERROR_CODE WNetRestoreConnectionW(           HWND hwndParent, LPCWSTR lpDevice, BOOL fUseUI);
  WINAPI_ERROR_CODE WNetUseConnection(                HWND hwndOwner, LPNETRESOURCE lpNetResource, LPCTSTR lpPassword, LPCTSTR lpUserID, WINAPI_ConnectFlags dwFlags, LPTSTR lpAccessName, LPDWORD lpBufferSize, LPDWORD lpResult);
  WINAPI_ERROR_CODE WNetAddConnection(                LPCTSTR lpRemoteName, LPCTSTR lpPassword, LPCTSTR lpLocalName);
]]
return ffi.load( 'Mpr.dll' )

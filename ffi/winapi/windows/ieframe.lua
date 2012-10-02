require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/registry' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HRESULT IECancelSaveFile(                HANDLE hState);
  BOOL    IECreateDirectory(               LPCWSTR lpPathName, LPSECURITY_ATTRIBUTES lpSecurityAttributes);
  HANDLE  IECreateFile(                    LPCWSTR lpFileName, DWORD dwDesiredAccess, DWORD dwShareMode, LPSECURITY_ATTRIBUTES lpSecurityAttributes, DWORD dwCreationDisposition, DWORD dwFlagsAndAttributes, HANDLE hTemplateFile);
  BOOL    IEDeleteFile(                    LPCWSTR lpFileName);
  HANDLE  IEFindFirstFile(                 LPCWSTR lpFileName, LPWIN32_FIND_DATA lpFindFileData);
  BOOL    IEGetFileAttributesEx(           LPCWSTR lpFileName, GET_FILEEX_INFO_LEVELS fInfoLevelId, LPVOID lpFileInformation);
  HRESULT IEGetProtectedModeCookie(        LPCWSTR lpszURL, LPCWSTR lpszCookieName, LPWSTR pszCookieData, DWORD* pcchCookieData, DWORD dwFlags);
  HRESULT IEGetWriteableFolderPath(        GUID clsidFolderID, LPWSTR* lppwstrPath);
  HRESULT IEGetWriteableHKCU(              HKEY* phKey);
  HRESULT IEIsProtectedModeProcess(        BOOL* pbResult);
  HRESULT IEIsProtectedModeURL(            LPCWSTR pszUrl);
  HRESULT IELaunchURL(                     LPCWSTR pszUrl, LPPROCESS_INFORMATION pProcInfo, LPIELAUNCHURLINFO lpInfo);
  BOOL    IEMoveFileEx(                    LPCWSTR lpExistingFileName, LPCWSTR lpNewFileName, DWORD dwFlags);
  HRESULT IERefreshElevationPolicy(        );
  HRESULT IERegCreateKeyEx(                LPCWSTR lpSubKey, DWORD reserved, LPWSTR lpClass, DWORD dwOptions, REGSAM samDesired, LPSECURITY_ATTRIBUTES lpSecurityAttributes, PHKEY phkResult, LPDWORD lpdwDisposition);
  HRESULT IERegisterWritableRegistryKey(   GUID guid, LPCWSTR lpSubkey, BOOL fSubkeyAllowed);
  HRESULT IERegisterWritableRegistryValue( GUID guid, LPCWSTR lpPath, LPCWSTR lpValueName, DWORD dwType, WINAPI_BYTE* lpData, DWORD cbMaxData);
  HRESULT IERegSetValueEx(                 LPCWSTR lpSubKey, LPCWSTR lpValueName, DWORD Reserved, DWORD dwType, WINAPI_BYTE* lpData, DWORD cbData);
  BOOL    IERemoveDirectory(               LPCWSTR lpPathName);
  HRESULT IESaveFile(                      HANDLE hState, LPWSTR lpwstrSourceFile);
  HRESULT IESetProtectedModeCookie(        LPCWSTR lpszURL, LPCWSTR lpszCookieName, LPWSTR pszCookieData, DWORD dwFlags);
  HRESULT IEShowSaveFileDialog(            HWND hwnd, LPWSTR lpwstrInitialFileName, LPWSTR lpwstrInitialDir, LPCWSTR lpwstrFilter, LPCWSTR lpwstrDefExt, DWORD dwFilterIndex, DWORD dwFlags, LPWSTR* lppwstrDestinationFilePath, HANDLE* phState);
  HRESULT IEUnregisterWritableRegistry(    GUID guid);
]]
return ffi.load( 'ieframe.dll' )

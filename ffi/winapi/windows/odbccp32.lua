require( 'ffi/winapi/headers/odbc' )
local ffi = require( 'ffi' )
ffi.cdef [[
  BOOL    SQLConfigDataSource(          HWND hwndParent, WINAPI_ODBC_DSN_REQUEST fRequest, LPCTSTR lpszDriver, LPCTSTR lpszAttributes);
  BOOL    SQLConfigDriver(              HWND hwndParent, WINAPI_ODBC_DRIVER_REQUEST fRequest, LPCTSTR lpszDriver, LPCTSTR lpszArgs, LPTSTR lpszMsg, WORD cbMsgMax, WORD* pcbMsgOut);
  BOOL    SQLCreateDataSource(          HWND hwnd, LPTSTR lpszDS);
  BOOL    SQLGetConfigMode(             WINAPI_ODBC_CONFIG_MODE* pwConfigMode);
  BOOL    SQLGetInstalledDrivers(       LPTSTR lpszBuf, WORD cbBufMax, WORD* pcbBufOut);
  int     SQLGetPrivateProfileString(   LPCTSTR lpszSection, LPCTSTR lpszEntry, LPCTSTR lpszDefault, LPCTSTR RetBuffer, INT cbRetBuffer, LPCTSTR lpszFilename);
  BOOL    SQLGetTranslator(             HWND hwndParent, LPTSTR lpszName, WORD cbNameMax, WORD* pcbNameOut, LPTSTR lpszPath, WORD cbPathMax, WORD* pcbPathOut, DWORD* pvOption);
  BOOL    SQLInstallDriverEx(           LPCTSTR lpszDriver, LPCTSTR lpszPathIn, LPTSTR lpszPathOut, WORD cbPathOutMax, WORD* pcbPathOut, WINAPI_ODBC_INSTALL_REQUEST fRequest, LPDWORD lpdwUsageCount);
  BOOL    SQLInstallDriverManager(      LPTSTR lpszPath, WORD cbPathMax, WORD* pcbPathOut);
  RETCODE SQLInstallerError(            WORD iError, WINAPI_ODBC_ERROR_CODE* pfErrorCode, LPTSTR lpszErrorMsg, WORD cbErrorMsgMax, WORD* pcbErrorMsg);
  BOOL    SQLInstallTranslator(         LPCTSTR lpszInfFile, LPCTSTR lpszTranslator, LPCTSTR lpszPathIn, LPTSTR lpszPathOut, WORD cbPathOutMax, WORD* pcbPathOut, WORD fRequest, LPDWORD lpdwUsageCount);
  BOOL    SQLInstallTranslatorEx(       LPCTSTR lpszTranslator, LPCTSTR lpszPathIn, LPTSTR lpszPathOut, WORD cbPathOutMax, WORD* pcbPathOut, WORD fRequest, LPDWORD lpdwUsageCount);
  BOOL    SQLManageDataSources(         HWND hwnd);
  RETCODE SQLPostInstallerError(        WINAPI_ODBC_ERROR_CODE fErrorCode, LPTSTR szErrorMsg);
  BOOL    SQLReadFileDSN(               LPCTSTR lpszFileName, LPCTSTR lpszAppName, LPCTSTR lpszKeyName, LPTSTR lpszString, WORD cbString, WORD* pcbString);
  BOOL    SQLRemoveDriver(              LPCTSTR lpszDriver, BOOL fRemoveDSN, LPDWORD lpdwUsageCount);
  BOOL    SQLRemoveDriverManager(       LPDWORD pdwUsageCount);
  BOOL    SQLRemoveDSNFromIni(          LPCTSTR lpszDSN);
  BOOL    SQLRemoveTranslator(          LPCTSTR lpszTranslator, LPDWORD lpdwUsageCount);
  BOOL    SQLSetConfigMode(             WINAPI_ODBC_CONFIG_MODE wConfigMode);
  BOOL    SQLValidDSN(                  LPCTSTR lpszDSN);
  BOOL    SQLWriteDSNToIni(             LPCTSTR lpszDSN, LPCTSTR lpszDriver);
  BOOL    SQLWriteFileDSN(              LPCTSTR lpszFileName, LPCTSTR lpszAppName, LPCTSTR lpszKeyName, LPCTSTR lpszString);
  BOOL    SQLWritePrivateProfileString( LPCTSTR lpszSection, LPCTSTR lpszEntry, LPCTSTR lpszString, LPCTSTR lpszFilename);
]]
ffi.load( 'ODBCCP32.DLL' )

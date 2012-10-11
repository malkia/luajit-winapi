require( 'ffi/winapi/headers/odbc' )
local ffi = require( 'ffi' )
ffi.cdef [[
  BOOL ConfigDriver(     HWND hwndParent, WINAPI_ODBC_DRIVER_REQUEST fRequest, LPCTSTR lpszDriver, LPCTSTR lpszArgs, LPTSTR lpszMsg, WORD cbMsgMax, WORD* pcbMsgOut);
  BOOL ConfigDSN(        HWND hwndParent, WINAPI_ODBC_DSN_REQUEST fRequest, LPCTSTR lpszDriver, LPCTSTR lpszAttributes);
  BOOL ConfigTranslator( HWND hwndParent, DWORD* pvOption);
]]
return ffi.load( 'SQLSRV32.DLL' )

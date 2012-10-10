require( 'ffi/winapi/headers/odbc' )
local ffi = require( 'ffi' )
ffi.cdef [[
  BOOL ConfigDriver(     HWND hwndParent, ODBC_DRIVER_REQUEST fRequest, LPCTSTR lpszDriver, LPCTSTR lpszArgs, LPTSTR lpszMsg, WORD cbMsgMax, WORD* pcbMsgOut);
  BOOL ConfigDSN(        HWND hwndParent, ODBC_DSN_REQUEST fRequest, LPCTSTR lpszDriver, LPCTSTR lpszAttributes);
  BOOL ConfigTranslator( HWND hwndParent, DWORD* pvOption);
]]
ffi.load( 'SQLSRV32.DLL' )

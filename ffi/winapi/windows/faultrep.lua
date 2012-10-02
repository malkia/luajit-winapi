require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HRESULT         WerReportHang(            HWND hwndHungWinow, PCWSTR wszHungApplicationName);
  BOOL            AddERExcludedApplication( LPCTSTR szApplication);
  EFaultRepRetVal ReportFault(              LPEXCEPTION_POINTERS pep, DWORD dwMode);
]]
return ffi.load( 'Faultrep.dll' )

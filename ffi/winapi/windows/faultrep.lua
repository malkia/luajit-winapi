require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UINT EFaultRepRetVal; //Alias
  static const UINT frrvOk = 0;
  static const UINT frrvOkManifest = 1;
  static const UINT frrvOkQueued = 2;
  static const UINT frrvErr = 3;
  static const UINT frrvErrNoDW = 4;
  static const UINT frrvErrTimeout = 5;
  static const UINT frrvLaunchDebugger = 6;
  static const UINT frrvOkHeadless = 7;
  static const UINT frrvErrAnotherInstance = 8;
  HRESULT         WerReportHang(            HWND hwndHungWinow, PCWSTR wszHungApplicationName);
  BOOL            AddERExcludedApplication( LPCTSTR szApplication);
  EFaultRepRetVal ReportFault(              LPEXCEPTION_POINTERS pep, DWORD dwMode);
]]
return ffi.load( 'Faultrep.dll' )

require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UINT EFaultRepRetVal; //Alias
  static const EFaultRepRetVal frrvOk = 0;
  static const EFaultRepRetVal frrvOkManifest = 1;
  static const EFaultRepRetVal frrvOkQueued = 2;
  static const EFaultRepRetVal frrvErr = 3;
  static const EFaultRepRetVal frrvErrNoDW = 4;
  static const EFaultRepRetVal frrvErrTimeout = 5;
  static const EFaultRepRetVal frrvLaunchDebugger = 6;
  static const EFaultRepRetVal frrvOkHeadless = 7;
  static const EFaultRepRetVal frrvErrAnotherInstance = 8;
  HRESULT         WerReportHang(            HWND hwndHungWinow, PCWSTR wszHungApplicationName);
  BOOL            AddERExcludedApplication( LPCTSTR szApplication);
  EFaultRepRetVal ReportFault(              LPEXCEPTION_POINTERS pep, DWORD dwMode);
]]
ffi.load( 'Faultrep.dll' )

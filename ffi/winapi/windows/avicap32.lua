require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  HWND capCreateCaptureWindow(  LPCTSTR lpszWindowName, DWORD dwStyle, int x, int y, int nWidth, int nHeight, HWND hWnd, int nID);
  BOOL capGetDriverDescription( WORD wDriverIndex, LPTSTR lpszName, INT cbName, LPTSTR lpszVer, INT cbVer);
]]
return ffi.load( "avicap32.dll" )

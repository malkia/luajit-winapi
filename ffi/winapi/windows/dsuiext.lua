require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/gdi' )
require( 'ffi/winapi/headers/shell' )
local ffi = require( 'ffi' )
ffi.cdef [[
  int     DsBrowseForContainer(   PDSBROWSEINFO pInfo);
  HRESULT DsGetFriendlyClassName( LPWSTR pszObjectClass, LPWSTR pszBuffer, INT cchBuffer);
  HICON   DsGetIcon(              DWORD dwFlags, LPWSTR pszObjectClass, INT cxImage, INT cyImage);
]]
return ffi.load( 'Dsuiext.dll' )

require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  STDAPI  CanShareFolderW(   LPCWSTR pszPath);
  HRESULT ShowShareFolderUI( HWND hwndParent, LPCWSTR pszPath);
]]
return ffi.load( 'Ntshrui.dll' )

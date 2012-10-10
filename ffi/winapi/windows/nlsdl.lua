require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  LCID DownlevelGetParentLocaleLCID( LCID Locale);
  int  DownlevelGetParentLocaleName( LCID Locale, LPWSTR lpName, int cchName);
  int  DownlevelLCIDToLocaleName(    LCID Locale, LPWSTR lpName, int cchName, DWORD dwFlags);
  LCID DownlevelLocaleNameToLCID(    LPWSTR lpName, DWORD dwFlags);
]]
ffi.load( 'Nlsdl.dll' )

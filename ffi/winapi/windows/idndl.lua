require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  int  DownlevelGetLocaleScripts( LPCWSTR lpLocaleName, LPWSTR lpScripts, int cchScripts);
  int  DownlevelGetStringScripts( DWORD dwFlags, LPCWSTR lpString, int cchString, LPWSTR lpScripts, int cchScripts);
  BOOL DownlevelVerifyScripts(    DWORD dwFlags, LPCWSTR lpLocaleScripts, int cchLocaleScripts, LPCWSTR lpTestScripts, int cchTestScripts);
]]
ffi.load( 'Idndl.dll' )

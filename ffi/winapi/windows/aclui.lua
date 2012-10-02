require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HPROPSHEETPAGE CreateSecurityPage(   LPSECURITYINFO psi);
  BOOL           EditSecurity(         HWND hwndOwner, LPSECURITYINFO psi);
  HRESULT        EditSecurityAdvanced( HWND hwndOwner, LPSECURITYINFO psi, SI_PAGE_TYPE uSIPage);
]]
return ffi.load( 'Aclui.dll' )

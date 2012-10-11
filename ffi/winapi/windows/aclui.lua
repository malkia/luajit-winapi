require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* ISecurityInformation; //Interface
  typedef ISecurityInformation* LPSECURITYINFO; //Alias
  typedef UINT SI_PAGE_TYPE; //Alias
  static const SI_PAGE_TYPE SI_PAGE_PERM = 0;
  static const SI_PAGE_TYPE SI_PAGE_ADVPERM = 1;
  static const SI_PAGE_TYPE SI_PAGE_AUDIT = 2;
  static const SI_PAGE_TYPE SI_PAGE_OWNER = 3;
  static const SI_PAGE_TYPE SI_PAGE_EFFECTIVE = 4;
  static const SI_PAGE_TYPE SI_PAGE_TAKEOWNERSHIP = 5;
  HPROPSHEETPAGE CreateSecurityPage(   LPSECURITYINFO psi);
  BOOL           EditSecurity(         HWND hwndOwner, LPSECURITYINFO psi);
  HRESULT        EditSecurityAdvanced( HWND hwndOwner, LPSECURITYINFO psi, SI_PAGE_TYPE uSIPage);
]]
return ffi.load( 'Aclui.dll' )

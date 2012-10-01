require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/registry" )
local ffi = require( "ffi" )
ffi.cdef [[
  UINT    EnumEnabledLayoutOrTip(        LPCWSTR pszUserSidString, LAYOUTORTIPPROFILE* pLayoutOrTipProfile, UINT uBufLength);
  UINT    EnumLayoutOrTipForSetup(       UINT uBufLength, LAYOUTORTIP* pLayoutOrTip, UINT uBufLength, DWORD dwFlags);
  BOOL    InstallLayoutOrTip(            LPCWSTR psz, WINAPI_IlotFlags dwFlags);
  BOOL    InstallLayoutOrTipUserReg(     LPCWSTR pszUserReg, LPCWSTR pszSystemReg, LPCWSTR pszSoftwareReg, LPCWSTR psz, WINAPI_IlotFlags dwFlags);
  HRESULT QueryLayoutOrTipString(        LPCWSTR psz, DWORD dwFlags);
  HRESULT QueryLayoutOrTipStringUserReg( LPCWSTR pszUserReg, LPCWSTR pszSystemReg, LPCWSTR pszSoftwareReg, LPCWSTR psz, DWORD dwFlags);
  BOOL    SaveDefaultUserInputSettings(  HWND hwndParent, HKEY hSourceRegKey);
  BOOL    SaveSystemAcctInputSettings(   HWND hwndParent, HKEY hSourceRegKey);
  BOOL    SetDefaultLayoutOrTip(         LPCWSTR psz, WINAPI_SdlotFlags dwFlags);
  BOOL    SetDefaultLayoutOrTipUserReg(  LPCWSTR pszUserReg, LPCWSTR pszSystemReg, LPCWSTR pszSoftwareReg, LPCWSTR psz, WINAPI_SdlotFlags dwFlags);
]]
return ffi.load( "input.dll" )

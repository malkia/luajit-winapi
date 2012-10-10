require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/registry' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef DWORD LOTP_TYPE; //Alias
  typedef struct LAYOUTORTIPPROFILE {
    LOTP_TYPE dwProfileType;
    LANGID langid;
    CLSID clsid;
    GUID guidProfile;
    GUID catid;
    DWORD dwSubstituteLayout;
    DWORD dwFlags;
    WCHAR szId[MAX_PATH];
  } LAYOUTORTIPPROFILE;
  typedef DWORD LAYOUTORTIP_Flags; //Alias
  typedef struct LAYOUTORTIP {
    LAYOUTORTIP_Flags dwFlags;
    WCHAR szId[MAX_PATH];
    WCHAR szName[MAX_PATH];
  } LAYOUTORTIP;
  typedef DWORD IlotFlags; //Alias
  typedef DWORD SdlotFlags; //Alias
  UINT    EnumEnabledLayoutOrTip(        LPCWSTR pszUserSidString, LAYOUTORTIPPROFILE* pLayoutOrTipProfile, UINT uBufLength);
  UINT    EnumLayoutOrTipForSetup(       UINT uBufLength, LAYOUTORTIP* pLayoutOrTip, UINT uBufLength, DWORD dwFlags);
  BOOL    InstallLayoutOrTip(            LPCWSTR psz, IlotFlags dwFlags);
  BOOL    InstallLayoutOrTipUserReg(     LPCWSTR pszUserReg, LPCWSTR pszSystemReg, LPCWSTR pszSoftwareReg, LPCWSTR psz, IlotFlags dwFlags);
  HRESULT QueryLayoutOrTipString(        LPCWSTR psz, DWORD dwFlags);
  HRESULT QueryLayoutOrTipStringUserReg( LPCWSTR pszUserReg, LPCWSTR pszSystemReg, LPCWSTR pszSoftwareReg, LPCWSTR psz, DWORD dwFlags);
  BOOL    SaveDefaultUserInputSettings(  HWND hwndParent, HKEY hSourceRegKey);
  BOOL    SaveSystemAcctInputSettings(   HWND hwndParent, HKEY hSourceRegKey);
  BOOL    SetDefaultLayoutOrTip(         LPCWSTR psz, SdlotFlags dwFlags);
  BOOL    SetDefaultLayoutOrTipUserReg(  LPCWSTR pszUserReg, LPCWSTR pszSystemReg, LPCWSTR pszSoftwareReg, LPCWSTR psz, SdlotFlags dwFlags);
]]
ffi.load( 'input.dll' )

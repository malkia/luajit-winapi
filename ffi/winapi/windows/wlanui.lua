require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef DWORD WlanVersion; //Alias
  static const WlanVersion WLAN_UI_API_VERSION = 1;
  typedef UINT WL_DISPLAY_PAGES; //Alias
  static const WL_DISPLAY_PAGES WLConnectionPage = 0;
  static const WL_DISPLAY_PAGES WLSecurityPage = 1;
  ERROR_CODE WlanUIEditProfile( WlanVersion dwClientVersion, LPCWSTR wstrProfileName, GUID* pInterfaceGuid, HWND hWnd, WL_DISPLAY_PAGES wlStartPage, PVOID pReserved, PWLAN_REASON_CODE pWlanReasonCode);
]]
ffi.load( 'Wlanui.dll' )

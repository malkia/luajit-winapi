require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  WINAPI_ERROR_CODE WlanUIEditProfile( WINAPI_WlanVersion dwClientVersion, LPCWSTR wstrProfileName, GUID* pInterfaceGuid, HWND hWnd, WL_DISPLAY_PAGES wlStartPage, PVOID pReserved, PWLAN_REASON_CODE pWlanReasonCode);
]]
return ffi.load( 'Wlanui.dll' )

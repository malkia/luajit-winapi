require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  LONG CdromDisableDigitalPlayback(   HDEVINFO DevInfo, PSP_DEVINFO_DATA DevInfoData);
  LONG CdromEnableDigitalPlayback(    HDEVINFO DevInfo, PSP_DEVINFO_DATA DevInfoData, BOOLEAN ForceUnknown);
  LONG CdromIsDigitalPlaybackEnabled( HDEVINFO DevInfo, PSP_DEVINFO_DATA DevInfoData, PBOOLEAN Enabled);
  BOOL CdromKnownGoodDigitalPlayback( HDEVINFO DevInfo, PSP_DEVINFO_DATA DevInfoData);
  BOOL DvdLauncher(                   HWND HWnd, CHAR DriveLetter);
]]
ffi.load( 'Storprop.dll' )

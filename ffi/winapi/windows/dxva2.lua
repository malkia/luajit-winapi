require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/gdi" )
local ffi = require( "ffi" )
ffi.cdef [[
  BOOL    DegaussMonitor(                                  HANDLE hMonitor);
  BOOL    GetMonitorBrightness(                            HANDLE hMonitor, LPDWORD pdwMinimumBrightness, LPDWORD pdwCurrentBrightness, LPDWORD pdwMaximumBrightness);
  BOOL    GetMonitorCapabilities(                          HANDLE hMonitor, LPDWORD pdwMonitorCapabilities, LPDWORD pdwSupportedColorTemperatures);
  BOOL    GetMonitorColorTemperature(                      HANDLE hMonitor, LPMC_COLOR_TEMPERATURE pctCurrentColorTemperature);
  BOOL    GetMonitorContrast(                              HANDLE hMonitor, LPDWORD pdwMinimumContrast, LPDWORD pdwCurrentContrast, LPDWORD pdwMaximumContrast);
  BOOL    GetMonitorDisplayAreaPosition(                   HANDLE hMonitor, MC_POSITION_TYPE ptPositionType, LPDWORD pdwMinimumPosition, LPDWORD pdwCurrentPosition, LPDWORD pdwMaximumPosition);
  BOOL    GetMonitorDisplayAreaSize(                       HANDLE hMonitor, MC_SIZE_TYPE stSizeType, LPDWORD pdwMinimumWidthOrHeight, LPDWORD pdwCurrentWidthOrHeight, LPDWORD pdwMaximumWidthOrHeight);
  BOOL    GetMonitorRedGreenOrBlueDrive(                   HANDLE hMonitor, MC_DRIVE_TYPE dtDriveType, LPDWORD pdwMinimumDrive, LPDWORD pdwCurrentDrive, LPDWORD pdwMaximumDrive);
  BOOL    GetMonitorRedGreenOrBlueGain(                    HANDLE hMonitor, MC_GAIN_TYPE gtGainType, LPDWORD pdwMinimumGain, LPDWORD pdwCurrentGain, LPDWORD pdwMaximumGain);
  BOOL    GetMonitorTechnologyType(                        HANDLE hMonitor, LPMC_DISPLAY_TECHNOLOGY_TYPE pdtyDisplayTechnologyType);
  BOOL    RestoreMonitorFactoryColorDefaults(              HANDLE hMonitor);
  BOOL    RestoreMonitorFactoryDefaults(                   HANDLE hMonitor);
  BOOL    SaveCurrentMonitorSettings(                      HANDLE hMonitor);
  BOOL    SetMonitorBrightness(                            HANDLE hMonitor, DWORD dwNewBrightness);
  BOOL    SetMonitorColorTemperature(                      HANDLE hMonitor, MC_COLOR_TEMPERATURE ctCurrentColorTemperature);
  BOOL    SetMonitorContrast(                              HANDLE hMonitor, DWORD dwNewContrast);
  BOOL    SetMonitorDisplayAreaPosition(                   HANDLE hMonitor, MC_POSITION_TYPE ptPositionType, DWORD dwNewPosition);
  BOOL    SetMonitorDisplayAreaSize(                       HANDLE hMonitor, MC_SIZE_TYPE stSizeType, DWORD dwNewDisplayAreaWidthOrHeight);
  BOOL    SetMonitorRedGreenOrBlueDrive(                   HANDLE hMonitor, MC_DRIVE_TYPE dtDriveType, DWORD dwNewDrive);
  BOOL    SetMonitorRedGreenOrBlueGain(                    HANDLE hMonitor, MC_GAIN_TYPE gtGainType, DWORD dwNewGain);
  BOOL    CapabilitiesRequestAndCapabilitiesReply(         HANDLE hMonitor, LPSTR pszASCIICapabilitiesString, DWORD dwCapabilitiesStringLengthInCharacters);
  BOOL    GetCapabilitiesStringLength(                     HANDLE hMonitor, LPDWORD pdwCapabilitiesStringLengthInCharacters);
  BOOL    GetTimingReport(                                 HANDLE hMonitor, LPMC_TIMING_REPORT pmtrMonitorTimingReport);
  BOOL    GetVCPFeatureAndVCPFeatureReply(                 HANDLE hMonitor, BYTE bVCPCode, LPMC_VCP_CODE_TYPE pvct, LPDWORD pdwCurrentValue, LPDWORD pdwMaximumValue);
  BOOL    SaveCurrentSettings(                             HANDLE hMonitor);
  BOOL    SetVCPFeature(                                   HANDLE hMonitor, BYTE bVCPCode, DWORD dwNewValue);
  BOOL    DestroyPhysicalMonitor(                          HANDLE hMonitor);
  BOOL    DestroyPhysicalMonitors(                         DWORD dwPhysicalMonitorArraySize, LPPHYSICAL_MONITOR pPhysicalMonitorArray);
  BOOL    GetNumberOfPhysicalMonitorsFromHMONITOR(         HMONITOR hMonitor, LPDWORD pdwNumberOfPhysicalMonitors);
  BOOL    GetNumberOfPhysicalMonitorsFromIDirect3DDevice9( IDirect3DDevice9* pDirect3DDevice9, LPDWORD pdwNumberOfPhysicalMonitors);
  BOOL    GetPhysicalMonitorsFromHMONITOR(                 HMONITOR hMonitor, DWORD dwPhysicalMonitorArraySize, LPPHYSICAL_MONITOR pPhysicalMonitorArray);
  BOOL    GetPhysicalMonitorsFromIDirect3DDevice9(         IDirect3DDevice9* pDirect3DDevice9, DWORD dwPhysicalMonitorArraySize, LPPHYSICAL_MONITOR pPhysicalMonitorArray);
  HRESULT DXVA2CreateDirect3DDeviceManager9(               UINT* pResetToken, IDirect3DDeviceManager9** ppDXVAManager);
  HRESULT DXVA2CreateVideoService(                         IDirect3DDevice9* pDD, REFIID riid, void** ppService);
  HRESULT DXVAHD_CreateDevice(                             IDirect3DDevice9Ex* pD3DDevice, DXVAHD_CONTENT_DESC* pContentDesc, DXVAHD_DEVICE_USAGE Usage, PDXVAHDSW_Plugin pPlugin, IDXVAHD_Device** ppDevice);
]]
return ffi.load( "dxva2.dll" )

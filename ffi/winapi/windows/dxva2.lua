require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/gdi' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IDirect3DDevice9; //Interface
  typedef void* IDirect3DDevice9Ex; //Interface
  typedef void* IDirect3DDeviceManager9; //Interface
  typedef void* IDXVAHD_Device; //Interface
  enum { PHYSICAL_MONITOR_DESCRIPTION_SIZE = 128 };
  typedef struct PHYSICAL_MONITOR {
    HANDLE hPhysicalMonitor;
    WCHAR szPhysicalMonitorDescription[PHYSICAL_MONITOR_DESCRIPTION_SIZE];
  } PHYSICAL_MONITOR;
  typedef PHYSICAL_MONITOR *LPPHYSICAL_MONITOR; //Pointer
  typedef UINT MC_COLOR_TEMPERATURE; //Alias
  static const MC_COLOR_TEMPERATURE MC_COLOR_TEMPERATURE_UNKNOWN = 0;
  static const MC_COLOR_TEMPERATURE MC_COLOR_TEMPERATURE_4000K = 1;
  static const MC_COLOR_TEMPERATURE MC_COLOR_TEMPERATURE_5000K = 2;
  static const MC_COLOR_TEMPERATURE MC_COLOR_TEMPERATURE_6500K = 3;
  static const MC_COLOR_TEMPERATURE MC_COLOR_TEMPERATURE_7500K = 4;
  static const MC_COLOR_TEMPERATURE MC_COLOR_TEMPERATURE_8200K = 5;
  static const MC_COLOR_TEMPERATURE MC_COLOR_TEMPERATURE_9300K = 6;
  static const MC_COLOR_TEMPERATURE MC_COLOR_TEMPERATURE_10000K = 7;
  static const MC_COLOR_TEMPERATURE MC_COLOR_TEMPERATURE_11500K = 8;
  typedef MC_COLOR_TEMPERATURE *LPMC_COLOR_TEMPERATURE; //Pointer
  typedef UINT MC_POSITION_TYPE; //Alias
  static const MC_POSITION_TYPE MC_HORIZONTAL_POSITION = 0;
  static const MC_POSITION_TYPE MC_VERTICAL_POSITION = 1;
  typedef UINT MC_SIZE_TYPE; //Alias
  static const MC_SIZE_TYPE MC_WIDTH = 0;
  static const MC_SIZE_TYPE MC_HEIGHT = 1;
  typedef UINT MC_DRIVE_TYPE; //Alias
  static const MC_DRIVE_TYPE MC_RED_DRIVE = 0;
  static const MC_DRIVE_TYPE MC_GREEN_DRIVE = 1;
  static const MC_DRIVE_TYPE MC_BLUE_DRIVE = 2;
  typedef UINT MC_GAIN_TYPE; //Alias
  static const MC_GAIN_TYPE MC_RED_GAIN = 0;
  static const MC_GAIN_TYPE MC_GREEN_GAIN = 1;
  static const MC_GAIN_TYPE MC_BLUE_GAIN = 2;
  typedef UINT MC_DISPLAY_TECHNOLOGY_TYPE; //Alias
  static const MC_DISPLAY_TECHNOLOGY_TYPE MC_SHADOW_MASK_CATHODE_RAY_TUBE = 0;
  static const MC_DISPLAY_TECHNOLOGY_TYPE MC_APERTURE_GRILL_CATHODE_RAY_TUBE = 1;
  static const MC_DISPLAY_TECHNOLOGY_TYPE MC_THIN_FILM_TRANSISTOR = 2;
  static const MC_DISPLAY_TECHNOLOGY_TYPE MC_LIQUID_CRYSTAL_ON_SILICON = 3;
  static const MC_DISPLAY_TECHNOLOGY_TYPE MC_PLASMA = 4;
  static const MC_DISPLAY_TECHNOLOGY_TYPE MC_ORGANIC_LIGHT_EMITTING_DIODE = 5;
  static const MC_DISPLAY_TECHNOLOGY_TYPE MC_ELECTROLUMINESCENT = 6;
  static const MC_DISPLAY_TECHNOLOGY_TYPE MC_MICROELECTROMECHANICAL = 7;
  static const MC_DISPLAY_TECHNOLOGY_TYPE MC_FIELD_EMISSION_DEVICE = 8;
  typedef MC_DISPLAY_TECHNOLOGY_TYPE *LPMC_DISPLAY_TECHNOLOGY_TYPE; //Pointer
  typedef UINT MC_VCP_CODE_TYPE; //Alias
  static const MC_VCP_CODE_TYPE MC_MOMENTARY = 0;
  static const MC_VCP_CODE_TYPE MC_SET_PARAMETER = 1;
  typedef MC_VCP_CODE_TYPE *LPMC_VCP_CODE_TYPE; //Pointer
# pragma pack( push, 1 )
  typedef struct MC_TIMING_REPORT {
    DWORD dwHorizontalFrequencyInHZ;
    DWORD dwVerticalFrequencyInHZ;
    BYTE bTimingStatusByte;
  } MC_TIMING_REPORT;
# pragma pack( pop )
  typedef MC_TIMING_REPORT *LPMC_TIMING_REPORT; //Pointer
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
return ffi.load( 'dxva2.dll' )

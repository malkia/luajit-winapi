require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/setup' )
local ffi = require( 'ffi' )
ffi.cdef [[
  BOOL InstallNewDevice(                  HWND hwndParent, LPGUID ClassGuid, PDWORD pReboot);
  BOOL DiInstallDevice(                   HWND hwndParent, HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, PSP_DRVINFO_DATA DriverInfoData, DWORD Flags, PBOOL NeedReboot);
  BOOL DiInstallDriver(                   HWND hwndParent, LPCTSTR FullInfPath, DWORD Flags, PBOOL NeedReboot);
  BOOL DiRollbackDriver(                  HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, HWND hwndParent, DWORD Flags, PBOOL NeedReboot);
  BOOL DiShowUpdateDevice(                HWND hwndParent, HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, DWORD Flags, PBOOL NeedReboot);
  BOOL DiUninstallDevice(                 HWND hwndParent, HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, DWORD Flags, PBOOL NeedReboot);
  BOOL UpdateDriverForPlugAndPlayDevices( HWND hwndParent, LPCTSTR HardwareId, LPCTSTR FullInfPath, DWORD InstallFlags, PBOOL bRebootRequired);
  BOOL InstallSelectedDriver(             HWND hwndParent, HDEVINFO DeviceInfoSet, LPCTSTR Reserved, BOOL Backup, PDWORD bReboot);
]]
return ffi.load( 'Newdev.dll' )

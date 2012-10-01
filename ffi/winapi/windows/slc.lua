require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  HRESULT SLGetGenuineInformation(              SLID* pAppId, PCWSTR pwszValueName, SLDATATYPE* peDataType, UINT* pcbValue, BYTE** ppbValue);
  HRESULT SLGetInstalledSAMLicenseApplications( UINT* pnReturnedAppIds, SLID** ppReturnedAppIds);
  HRESULT SLInstallSAMLicense(                  SLID* pApplicationId, UINT cbXmlLicenseData, BYTE* pbXmlLicenseData);
  HRESULT SLGetSAMLicense(                      SLID* pApplicationId, UINT* pcbXmlLicenseData, PBYTE* ppbXmlLicenseData);
  HRESULT SLGetWindowsInformation(              PCWSTR pwszValueName, SLDATATYPE* peDataType, UINT* pcbValue, PBYTE* ppbValue);
  HRESULT SLGetWindowsInformationDWORD(         PCWSTR pwszValueName, DWORD* pdwValue);
  HRESULT SLSetGenuineInformation(              SLID* pAppId, PCWSTR pwszValueName, SLDATATYPE eDataType, UINT cbValue, BYTE* pbValue);
  HRESULT SLUninstallSAMLicense(                SLID* pApplicationId);
]]
return ffi.load( "Slc.dll" )

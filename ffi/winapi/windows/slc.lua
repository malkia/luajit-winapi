require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UINT SLDATATYPE; //Alias
  static const UINT SL_DATA_NONE = 0;
  static const UINT SL_DATA_SZ = 1;
  static const UINT SL_DATA_DWORD = 4;
  static const UINT SL_DATA_BINARY = 3;
  static const UINT SL_DATA_MULTI_SZ = 7;
  static const UINT SL_DATA_SUM = 100;
  HRESULT SLGetGenuineInformation(              WINAPI_SLID* pAppId, PCWSTR pwszValueName, SLDATATYPE* peDataType, UINT* pcbValue, BYTE** ppbValue);
  HRESULT SLGetInstalledSAMLicenseApplications( UINT* pnReturnedAppIds, SLID** ppReturnedAppIds);
  HRESULT SLInstallSAMLicense(                  WINAPI_SLID* pApplicationId, UINT cbXmlLicenseData, WINAPI_BYTE* pbXmlLicenseData);
  HRESULT SLGetSAMLicense(                      WINAPI_SLID* pApplicationId, UINT* pcbXmlLicenseData, PBYTE* ppbXmlLicenseData);
  HRESULT SLGetWindowsInformation(              PCWSTR pwszValueName, SLDATATYPE* peDataType, UINT* pcbValue, PBYTE* ppbValue);
  HRESULT SLGetWindowsInformationDWORD(         PCWSTR pwszValueName, DWORD* pdwValue);
  HRESULT SLSetGenuineInformation(              WINAPI_SLID* pAppId, PCWSTR pwszValueName, SLDATATYPE eDataType, UINT cbValue, WINAPI_BYTE* pbValue);
  HRESULT SLUninstallSAMLicense(                WINAPI_SLID* pApplicationId);
]]
return ffi.load( 'Slc.dll' )

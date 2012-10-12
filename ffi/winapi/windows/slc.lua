require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UINT SLDATATYPE; //Alias
  static const SLDATATYPE SL_DATA_NONE = 0;
  static const SLDATATYPE SL_DATA_SZ = 1;
  static const SLDATATYPE SL_DATA_DWORD = 4;
  static const SLDATATYPE SL_DATA_BINARY = 3;
  static const SLDATATYPE SL_DATA_MULTI_SZ = 7;
  static const SLDATATYPE SL_DATA_SUM = 100;
  HRESULT SLGetGenuineInformation(              const SLID* pAppId, PCWSTR pwszValueName, SLDATATYPE* peDataType, UINT* pcbValue, BYTE** ppbValue);
  HRESULT SLGetInstalledSAMLicenseApplications( UINT* pnReturnedAppIds, SLID** ppReturnedAppIds);
  HRESULT SLInstallSAMLicense(                  const SLID* pApplicationId, UINT cbXmlLicenseData, const BYTE* pbXmlLicenseData);
  HRESULT SLGetSAMLicense(                      const SLID* pApplicationId, UINT* pcbXmlLicenseData, PBYTE* ppbXmlLicenseData);
  HRESULT SLGetWindowsInformation(              PCWSTR pwszValueName, SLDATATYPE* peDataType, UINT* pcbValue, PBYTE* ppbValue);
  HRESULT SLGetWindowsInformationDWORD(         PCWSTR pwszValueName, DWORD* pdwValue);
  HRESULT SLSetGenuineInformation(              const SLID* pAppId, PCWSTR pwszValueName, SLDATATYPE eDataType, UINT cbValue, const BYTE* pbValue);
  HRESULT SLUninstallSAMLicense(                const SLID* pApplicationId);
]]
return ffi.load( 'Slc.dll' )

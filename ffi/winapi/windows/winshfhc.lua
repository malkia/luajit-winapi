require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UINT FILE_RISK_LEVEL; //Alias
  static const UINT FRL_NO_OPINION = 0;
  static const UINT FRL_LOW = 1;
  static const UINT FRL_MODERATE = 2;
  static const UINT FRL_HIGH = 3;
  static const UINT FRL_BLOCK = 4;
  HRESULT EstimateFileRiskLevel( LPCWSTR pszFilePath, LPCWSTR pszExt, LPCWSTR pszHandler, FILE_RISK_LEVEL* pfrlEstimate);
]]
return ffi.load( 'winshfhc.dll' )

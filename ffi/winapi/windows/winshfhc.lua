require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UINT FILE_RISK_LEVEL; //Alias
  static const FILE_RISK_LEVEL FRL_NO_OPINION = 0;
  static const FILE_RISK_LEVEL FRL_LOW = 1;
  static const FILE_RISK_LEVEL FRL_MODERATE = 2;
  static const FILE_RISK_LEVEL FRL_HIGH = 3;
  static const FILE_RISK_LEVEL FRL_BLOCK = 4;
  HRESULT EstimateFileRiskLevel( LPCWSTR pszFilePath, LPCWSTR pszExt, LPCWSTR pszHandler, FILE_RISK_LEVEL* pfrlEstimate);
]]
return ffi.load( 'winshfhc.dll' )

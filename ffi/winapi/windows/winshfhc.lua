require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  HRESULT EstimateFileRiskLevel( LPCWSTR pszFilePath, LPCWSTR pszExt, LPCWSTR pszHandler, FILE_RISK_LEVEL* pfrlEstimate);
]]
return ffi.load( "winshfhc.dll" )

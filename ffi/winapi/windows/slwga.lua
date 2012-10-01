require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  HRESULT SLIsGenuineLocal( SLID* pAppId, SL_GENUINE_STATE* pGenuineState, SL_NONGENUINE_UI_OPTIONS* pUIOptions);
]]
return ffi.load( "Slwga.dll" )

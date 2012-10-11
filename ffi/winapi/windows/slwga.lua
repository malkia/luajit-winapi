require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UINT SL_GENUINE_STATE; //Alias
  static const SL_GENUINE_STATE SL_GEN_STATE_IS_GENUINE = 0;
  static const SL_GENUINE_STATE SL_GEN_STATE_INVALID_LICENSE = 1;
  static const SL_GENUINE_STATE SL_GEN_STATE_TAMPERED = 2;
  static const SL_GENUINE_STATE SL_GEN_STATE_LAST = 3;
  typedef struct SL_NONGENUINE_UI_OPTIONS {
    DWORD cbSize;
    SLID* pComponentId;
    HRESULT hResultUI;
  } SL_NONGENUINE_UI_OPTIONS;
  HRESULT SLIsGenuineLocal( SLID* pAppId, SL_GENUINE_STATE* pGenuineState, SL_NONGENUINE_UI_OPTIONS* pUIOptions);
]]
return ffi.load( 'Slwga.dll' )

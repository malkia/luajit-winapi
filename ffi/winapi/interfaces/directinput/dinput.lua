require( 'ffi/winapi/headers/dinput' )
local ffi = require( 'ffi' )
ffi.cdef [[
  DI_HRESULT DirectInputCreateA(  HINSTANCE hinst, DWORD dwVersion, LPDIRECTINPUTA* ppDI, LPUNKNOWN punkOuter);
  DI_HRESULT DirectInputCreateW(  HINSTANCE hinst, DWORD dwVersion, LPDIRECTINPUTW* ppDI, LPUNKNOWN punkOuter);
  DI_HRESULT DirectInputCreateEx( HINSTANCE hinst, DWORD dwVersion, REFIID riidltf, LPVOID* ppvOut, LPUNKNOWN punkOuter);
]]
ffi.load( 'Dinput.dll' )

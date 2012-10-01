require( "ffi/winapi/headers/dinput" )
local ffi = require( "ffi" )
ffi.cdef [[
  WINAPI_DI_HRESULT DirectInputCreateA(  HINSTANCE hinst, DWORD dwVersion, LPDIRECTINPUTA* ppDI, LPUNKNOWN punkOuter);
  WINAPI_DI_HRESULT DirectInputCreateW(  HINSTANCE hinst, DWORD dwVersion, LPDIRECTINPUTW* ppDI, LPUNKNOWN punkOuter);
  WINAPI_DI_HRESULT DirectInputCreateEx( HINSTANCE hinst, DWORD dwVersion, REFIID riidltf, LPVOID* ppvOut, LPUNKNOWN punkOuter);
]]
return ffi.load( "Dinput.dll" )

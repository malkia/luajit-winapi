require( 'ffi/winapi/headers/dinput' )
local ffi = require( 'ffi' )
ffi.cdef [[
  WINAPI_DI_HRESULT DirectInput8Create( HINSTANCE hinst, DWORD dwVersion, REFIID riidltf, LPVOID* ppvOut, LPUNKNOWN punkOuter);
]]
return ffi.load( 'Dinput8.dll' )

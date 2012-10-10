require( 'ffi/winapi/headers/dinput' )
local ffi = require( 'ffi' )
ffi.cdef [[
  DI_HRESULT DirectInput8Create( HINSTANCE hinst, DWORD dwVersion, REFIID riidltf, LPVOID* ppvOut, LPUNKNOWN punkOuter);
]]
ffi.load( 'Dinput8.dll' )

require( "ffi/winapi/headers/directx" )
local ffi = require( "ffi" )
ffi.cdef [[
  IDirect3D8* Direct3DCreate8( UINT SDKVersion);
]]
return ffi.load( "d3d8.dll" )

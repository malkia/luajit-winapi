require( "ffi/winapi/interfaces/directx/9/idirect3d9" )
local ffi = require( "ffi" )
ffi.cdef [[
  IDirect3D9* Direct3DCreate9( UINT SDKVersion);
]]
return ffi.load( "d3d9.dll" )

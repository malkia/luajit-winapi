require( 'ffi/winapi/interfaces/directx/11/id3d11device' )
require( 'ffi/winapi/interfaces/directx/11/id3d11devicecontext' )
require( 'ffi/winapi/interfaces/directx/dxgi/idxgiadapter' )
local ffi = require( 'ffi' )
ffi.cdef [[
  DXGI_HRESULT CreateDXGIFactory(  REFIID riid, void** ppFactory);
  DXGI_HRESULT CreateDXGIFactory1( REFIID riid, void** ppFactory);
]]
ffi.load( 'dxgi.dll' )

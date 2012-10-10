require( 'ffi/winapi/interfaces/directx/11/id3d11device' )
require( 'ffi/winapi/interfaces/directx/11/id3d11devicecontext' )
require( 'ffi/winapi/interfaces/directx/dxgi/idxgiadapter' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HRESULT D3D11CreateDevice(             IDXGIAdapter* pAdapter, D3D_DRIVER_TYPE DriverType, HMODULE Software, D3D11_CREATE_DEVICE_FLAG Flags, const D3D_FEATURE_LEVEL* pFeatureLevels, UINT FeatureLevels, UINT SDKVersion, ID3D11Device** ppDevice, D3D_FEATURE_LEVEL* pFeatureLevel, ID3D11DeviceContext** ppImmediateContext);
  HRESULT D3D11CreateDeviceAndSwapChain( IDXGIAdapter* pAdapter, D3D_DRIVER_TYPE DriverType, HMODULE Software, D3D11_CREATE_DEVICE_FLAG Flags, const D3D_FEATURE_LEVEL* pFeatureLevels, UINT FeatureLevels, UINT SDKVersion, const DXGI_SWAP_CHAIN_DESC* pSwapChainDesc, IDXGISwapChain** ppSwapChain, ID3D11Device** ppDevice, D3D_FEATURE_LEVEL* pFeatureLevel, ID3D11DeviceContext** ppImmediateContext);
]]
ffi.load( 'd3d11.dll' )

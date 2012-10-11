require( 'ffi/winapi/interfaces/directx/11/d3dx/d3dx11_43' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HRESULT D3DX11CreateScan(          ID3D11DeviceContext* pDeviceContext, UINT MaxElementScanSize, UINT MaxScanCount, ID3DX11Scan** ppScan);
  HRESULT D3DX11CreateSegmentedScan( ID3D11DeviceContext* pDeviceContext, UINT MaxElementScanSize, ID3DX11SegmentedScan** ppScan);
  HRESULT D3DX11CreateFFT(           ID3D11DeviceContext* pDeviceContext, const D3DX11_FFT_DESC* pDesc, D3DX11_FFT_CREATE_FLAG Flags, D3DX11_FFT_BUFFER_INFO* pBufferInfo, ID3DX11FFT** ppFFT);
  HRESULT D3DX11CreateFFT1DComplex(  ID3D11DeviceContext* pDeviceContext, UINT X, D3DX11_FFT_CREATE_FLAG Flags, D3DX11_FFT_BUFFER_INFO* pBufferInfo, ID3DX11FFT** ppFFT);
  HRESULT D3DX11CreateFFT1DReal(     ID3D11DeviceContext* pDeviceContext, UINT X, D3DX11_FFT_CREATE_FLAG Flags, D3DX11_FFT_BUFFER_INFO* pBufferInfo, ID3DX11FFT** ppFFT);
  HRESULT D3DX11CreateFFT2DComplex(  ID3D11DeviceContext* pDeviceContext, UINT X, UINT Y, D3DX11_FFT_CREATE_FLAG Flags, D3DX11_FFT_BUFFER_INFO* pBufferInfo, ID3DX11FFT** ppFFT);
  HRESULT D3DX11CreateFFT2DReal(     ID3D11DeviceContext* pDeviceContext, UINT X, UINT Y, D3DX11_FFT_CREATE_FLAG Flags, D3DX11_FFT_BUFFER_INFO* pBufferInfo, ID3DX11FFT** ppFFT);
  HRESULT D3DX11CreateFFT3DComplex(  ID3D11DeviceContext* pDeviceContext, UINT X, UINT Y, UINT Z, D3DX11_FFT_CREATE_FLAG Flags, D3DX11_FFT_BUFFER_INFO* pBufferInfo, ID3DX11FFT** ppFFT);
  HRESULT D3DX11CreateFFT3DReal(     ID3D11DeviceContext* pDeviceContext, UINT X, UINT Y, UINT Z, D3DX11_FFT_CREATE_FLAG Flags, D3DX11_FFT_BUFFER_INFO* pBufferInfo, ID3DX11FFT** ppFFT);
]]
return ffi.load( 'd3dcsx_43.dll' )

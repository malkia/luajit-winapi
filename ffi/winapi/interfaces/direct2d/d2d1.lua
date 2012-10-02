require( 'ffi/winapi/headers/directx' )
require( 'ffi/winapi/headers/dwrite' )
local ffi = require( 'ffi' )
ffi.cdef [[
  WINAPI_D2D_HRESULT D2D1CreateFactory(      D2D1_FACTORY_TYPE factoryType, REFIID riid, WINAPI_D2D1_FACTORY_OPTIONS* pFactoryOptions, void** ppIFactory);
  void               D2D1MakeRotateMatrix(   FLOAT angle, D2D1_POINT_2F center, D2D1_MATRIX_3X2_F* matrix);
  void               D2D1MakeSkewMatrix(     FLOAT angleX, FLOAT angleY, D2D1_POINT_2F center, D2D1_MATRIX_3X2_F* matrix);
  BOOL               D2D1IsMatrixInvertible( WINAPI_D2D1_MATRIX_3X2_F* matrix);
  BOOL               D2D1InvertMatrix(       D2D1_MATRIX_3X2_F* matrix);
]]
return ffi.load( 'd2d1.dll' )

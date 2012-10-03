require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/gdi' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef USHORT COLOR16; //Alias
  typedef struct TRIVERTEX {
    LONG x;
    LONG y;
    COLOR16 Red;
    COLOR16 Green;
    COLOR16 Blue;
    COLOR16 Alpha;
  } TRIVERTEX;
  typedef TRIVERTEX *PTRIVERTEX; //Pointer
  typedef ULONG WINAPI_GradientFillMode; //Alias
  static const ULONG GRADIENT_FILL_RECT_H = 0x00000000;
  static const ULONG GRADIENT_FILL_RECT_V = 0x00000001;
  static const ULONG GRADIENT_FILL_TRIANGLE = 0x00000002;
  BOOL AlphaBlend(     HDC hdcDest, int xoriginDest, int yoriginDest, int wDest, int hDest, HDC hdcSrc, int xoriginSrc, int yoriginSrc, int wSrc, int hSrc, BLENDFUNCTION ftn);
  BOOL GradientFill(   HDC hdc, PTRIVERTEX pVertex, ULONG nVertex, PVOID pMesh, ULONG nMesh, WINAPI_GradientFillMode ulMode);
  BOOL TransparentBlt( HDC hdcDest, int xoriginDest, int yoriginDest, int wDest, int hDest, HDC hdcSrc, int xoriginSrc, int yoriginSrc, int wSrc, int hSrc, UINT crTransparent);
]]
return ffi.load( 'Msimg32.dll' )

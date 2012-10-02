require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/gdi' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HGLRC wglCreateContext(          HDC hdc);
  HGLRC wglCreateLayerContext(     HDC hdc, int iLayerPlane);
  BOOL  wglCopyContext(            HGLRC hglrcSrc, HGLRC hglrcDst, UINT mask);
  BOOL  wglDeleteContext(          HGLRC hglrc);
  BOOL  wglDescribeLayerPlane(     HDC hdc, int iPixelFormat, int iLayerPlane, UINT nBytes, LPLAYERPLANEDESCRIPTOR plpd);
  HGLRC wglGetCurrentContext(      );
  HDC   wglGetCurrentDC(           );
  int   wglGetLayerPaletteEntries( HDC hdc, int iLayerPlane, int iStart, int cEntries, WINAPI_COLORREF* pcr);
  PROC  wglGetProcAddress(         LPCSTR lpszProc);
  BOOL  wglMakeCurrent(            HDC hdc, HGLRC hglrc);
  BOOL  wglRealizeLayerPalette(    HDC hdc, int iLayerPlane, BOOL bRealize);
  int   wglSetLayerPaletteEntries( HDC hdc, int iLayerPlane, int iStart, int cEntries, WINAPI_COLORREF* pcr);
  BOOL  wglShareLists(             HGLRC hglrc1, HGLRC hglrc2);
  BOOL  wglSwapLayerBuffers(       HDC hdc, UINT fuPlanes);
  BOOL  wglUseFontBitmaps(         HDC hdc, DWORD first, DWORD count, DWORD listBase);
  BOOL  wglUseFontOutlines(        HDC hdc, DWORD first, DWORD count, DWORD listBase, FLOAT deviation, FLOAT extrusion, int format, LPGLYPHMETRICSFLOAT lpgmf);
]]
return ffi.load( 'Opengl32.dll' )

require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/gdi" )
require( "ffi/winapi/headers/multimedia" )
local ffi = require( "ffi" )
ffi.cdef [[
  BOOL     DrawDibBegin(            HDRAWDIB hdd, HDC hdc, int dxDest, int dyDest, LPBITMAPINFOHEADER lpbi, int dxSrc, int dySrc, UINT wFlags);
  BOOL     DrawDibChangePalette(    HDRAWDIB hdd, int iStart, int iLen, LPPALETTEENTRY lppe);
  BOOL     DrawDibClose(            HDRAWDIB hdd);
  BOOL     DrawDibDraw(             HDRAWDIB hdd, HDC hdc, int xDst, int yDst, int dxDst, int dyDst, LPBITMAPINFOHEADER lpbi, LPVOID lpBits, int xSrc, int ySrc, int dxSrc, int dySrc, UINT wFlags);
  BOOL     DrawDibEnd(              HDRAWDIB hdd);
  LPVOID   DrawDibGetBuffer(        HDRAWDIB hdd, LPBITMAPINFOHEADER lpbi, DWORD dwSize, DWORD dwFlags);
  HPALETTE DrawDibGetPalette(       HDRAWDIB hdd);
  HDRAWDIB DrawDibOpen(             );
  BOOL     DrawDibProfileDisplay(   LPBITMAPINFOHEADER lpbi);
  UINT     DrawDibRealize(          HDRAWDIB hdd, HDC hdc, BOOL fBackground);
  BOOL     DrawDibSetPalette(       HDRAWDIB hdd, HPALETTE hpal);
  BOOL     DrawDibStart(            HDRAWDIB hdd, LONG rate);
  BOOL     DrawDibStop(             HDRAWDIB hdd);
  BOOL     DrawDibTime(             HDRAWDIB hdd, LPDRAWDIBTIME lpddtime);
  BOOL     GetOpenFileNamePreview(  LPOPENFILENAME lpofn);
  BOOL     GetSaveFileNamePreview(  LPOPENFILENAME lpofn);
  LRESULT  ICClose(                 HIC hic);
  DWORD    ICCompress(              HIC hic, DWORD dwFlags, LPBITMAPINFOHEADER lpbiOutput, LPVOID lpData, LPBITMAPINFOHEADER lpbiInput, LPVOID lpBits, LPDWORD lpckid, LPDWORD lpdwFlags, LONG lFrameNum, DWORD dwFrameSize, DWORD dwQuality, LPBITMAPINFOHEADER lpbiPrev, LPVOID lpPrev);
  BOOL     ICCompressorChoose(      HWND hwnd, UINT uiFlags, LPVOID pvIn, LPVOID lpData, PCOMPVARS pc, LPSTR lpszTitle);
  void     ICCompressorFree(        PCOMPVARS pc);
  DWORD    ICDecompress(            HIC hic, DWORD dwFlags, LPBITMAPINFOHEADER lpbiFormat, LPVOID lpData, LPBITMAPINFOHEADER lpbi, LPVOID lpBits);
  DWORD    ICDraw(                  HIC hic, DWORD dwFlags, LPVOID lpFormat, LPVOID lpData, DWORD cbData, LONG lTime);
  DWORD    ICDrawBegin(             HIC hic, DWORD dwFlags, HPALETTE hpal, HWND hwnd, HDC hdc, int xDst, int yDst, int dxDst, int dyDst, LPBITMAPINFOHEADER lpbi, int xSrc, int ySrc, int dxSrc, int dySrc, DWORD dwRate, DWORD dwScale);
  HIC      ICGetDisplayFormat(      HIC hic, LPBITMAPINFOHEADER lpbiIn, LPBITMAPINFOHEADER lpbiOut, int BitDepth, int dx, int dy);
  LRESULT  ICGetInfo(               HIC hic, ICINFO* lpicinfo, DWORD cb);
  HANDLE   ICImageCompress(         HIC hic, UINT uiFlags, LPBITMAPINFO lpbiIn, LPVOID lpBits, LPBITMAPINFO lpbiOut, LONG lQuality, LONG* plSize);
  HANDLE   ICImageDecompress(       HIC hic, UINT uiFlags, LPBITMAPINFO lpbiIn, LPVOID lpBits, LPBITMAPINFO lpbiOut);
  BOOL     ICInfo(                  DWORD fccType, DWORD fccHandler, ICINFO* lpicinfo);
  BOOL     ICInstall(               DWORD fccType, DWORD fccHandler, LPARAM lParam, LPSTR szDesc, UINT wFlags);
  HIC      ICLocate(                DWORD fccType, DWORD fccHandler, LPBITMAPINFOHEADER lpbiIn, LPBITMAPINFOHEADER lpbiOut, WINAPI_ICOpenFlags wFlags);
  HIC      ICOpen(                  DWORD fccType, DWORD fccHandler, WINAPI_ICOpenFlags wMode);
  HIC      ICOpenFunction(          DWORD fccType, DWORD fccHandler, WINAPI_ICOpenFlags wMode, FARPROC lpfnHandler);
  BOOL     ICRemove(                DWORD fccType, DWORD fccHandler, UINT wFlags);
  LRESULT  ICSendMessage(           HIC hic, WINAPI_ICMessage wMsg, DWORD dw1, DWORD dw2);
  LPVOID   ICSeqCompressFrame(      PCOMPVARS pc, UINT uiFlags, LPVOID lpBits, BOOL* pfKey, LONG* plSize);
  void     ICSeqCompressFrameEnd(   PCOMPVARS pc);
  BOOL     ICSeqCompressFrameStart( PCOMPVARS pc, LPBITMAPINFO lpbiIn);
  HWND     MCIWndCreate(            HWND hwndParent, HINSTANCE hInstance, DWORD dwStyle, LPCTSTR szFile);
  BOOL     MCIWndRegisterClass(     HINSTANCE hInstance);
  void     StretchDIB(              LPBITMAPINFOHEADER biDst, LPVOID lpvDst, int DstX, int DstY, int DstXE, int DstYE, LPBITMAPINFOHEADER biSrc, LPVOID lpvSrc, int SrcX, int SrcY, int SrcXE, int SrcYE);
]]
return ffi.load( "msvfw32.dll" )

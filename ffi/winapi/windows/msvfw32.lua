require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/gdi' )
require( 'ffi/winapi/headers/multimedia' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef HANDLE HIC; //Alias
  typedef HANDLE HDRAWDIB; //Alias
  typedef struct DRAWDIBTIME {
    LONG timeCount;
    LONG timeDraw;
    LONG timeDecompress;
    LONG timeDither;
    LONG timeStretch;
    LONG timeBlt;
    LONG timeSetDIBits;
  } DRAWDIBTIME;
  typedef DRAWDIBTIME *LPDRAWDIBTIME; //Pointer
  typedef struct COMPVARS {
    LONG cbSize;
    DWORD dwFlags;
    HIC hic;
    DWORD fccType;
    DWORD fccHandler;
    LPBITMAPINFO lpbiIn;
    LPBITMAPINFO lpbiOut;
    LPVOID lpBitsOut;
    LPVOID lpBitsPrev;
    LONG lFrame;
    LONG lKey;
    LONG lDataRate;
    LONG lQ;
    LONG lKeyCount;
    LPVOID lpState;
    LONG cbState;
  } COMPVARS;
  typedef COMPVARS *PCOMPVARS; //Pointer
  typedef DWORD VIDCF; //Alias
  typedef struct ICINFO {
    DWORD dwSize;
    FOURCC fccType;
    DWORD fccHandler;
    VIDCF dwFlags;
    DWORD dwVersion;
    DWORD dwVersionICM;
    WCHAR szName_16_;
    WCHAR szDescription_128_;
    WCHAR szDriver_128_;
  } ICINFO;
  typedef UINT ICOpenFlags; //Alias
  typedef UINT ICMessage; //Alias
  static const ICMessage ICM_COMPRESS_GET_FORMAT = 0x00004004;
  static const ICMessage ICM_COMPRESS_GET_SIZE = 0x00004005;
  static const ICMessage ICM_COMPRESS_QUERY = 0x00004006;
  static const ICMessage ICM_COMPRESS_BEGIN = 0x00004007;
  static const ICMessage ICM_COMPRESS = 0x00004008;
  static const ICMessage ICM_COMPRESS_END = 0x00004009;
  static const ICMessage ICM_DECOMPRESS_GET_FORMAT = 0x0000400a;
  static const ICMessage ICM_DECOMPRESS_QUERY = 0x0000400b;
  static const ICMessage ICM_DECOMPRESS_BEGIN = 0x0000400c;
  static const ICMessage ICM_DECOMPRESS = 0x0000400d;
  static const ICMessage ICM_DECOMPRESS_END = 0x0000400e;
  static const ICMessage ICM_DECOMPRESS_SET_PALETTE = 0x0000401d;
  static const ICMessage ICM_DECOMPRESS_GET_PALETTE = 0x0000401e;
  static const ICMessage ICM_DRAW_QUERY = 0x0000401f;
  static const ICMessage ICM_DRAW_BEGIN = 0x0000400f;
  static const ICMessage ICM_DRAW_GET_PALETTE = 0x00004010;
  static const ICMessage ICM_DRAW_UPDATE = 0x00004011;
  static const ICMessage ICM_DRAW_START = 0x00004012;
  static const ICMessage ICM_DRAW_STOP = 0x00004013;
  static const ICMessage ICM_DRAW_BITS = 0x00004014;
  static const ICMessage ICM_DRAW_END = 0x00004015;
  static const ICMessage ICM_DRAW_GETTIME = 0x00004020;
  static const ICMessage ICM_DRAW = 0x00004021;
  static const ICMessage ICM_DRAW_WINDOW = 0x00004022;
  static const ICMessage ICM_DRAW_SETTIME = 0x00004023;
  static const ICMessage ICM_DRAW_REALIZE = 0x00004024;
  static const ICMessage ICM_DRAW_FLUSH__ = 0x00004025;
  static const ICMessage ICM_DRAW_RENDERBUFFER = 0x00004026;
  static const ICMessage ICM_DRAW_START_PLAY = 0x00004027;
  static const ICMessage ICM_DRAW_STOP_PLAY = 0x00004028;
  static const ICMessage ICM_DRAW_SUGGESTFORMAT = 0x00004032;
  static const ICMessage ICM_DRAW_CHANGEPALETTE = 0x00004033;
  static const ICMessage ICM_DRAW_IDLE = 0x00004034;
  static const ICMessage ICM_GETBUFFERSWANTED = 0x00004029;
  static const ICMessage ICM_GETDEFAULTKEYFRAMERATE = 0x0000402a;
  static const ICMessage ICM_DECOMPRESSEX_BEGIN = 0x0000403c;
  static const ICMessage ICM_DECOMPRESSEX_QUERY = 0x0000403d;
  static const ICMessage ICM_DECOMPRESSEX = 0x0000403e;
  static const ICMessage ICM_DECOMPRESSEX_END = 0x0000403f;
  static const ICMessage ICM_COMPRESS_FRAMES_INFO = 0x00004046;
  static const ICMessage ICM_COMPRESS_FRAMES = 0x00004047;
  static const ICMessage ICM_SET_STATUS_PROC = 0x00004048;
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
  HIC      ICLocate(                DWORD fccType, DWORD fccHandler, LPBITMAPINFOHEADER lpbiIn, LPBITMAPINFOHEADER lpbiOut, ICOpenFlags wFlags);
  HIC      ICOpen(                  DWORD fccType, DWORD fccHandler, ICOpenFlags wMode);
  HIC      ICOpenFunction(          DWORD fccType, DWORD fccHandler, ICOpenFlags wMode, FARPROC lpfnHandler);
  BOOL     ICRemove(                DWORD fccType, DWORD fccHandler, UINT wFlags);
  LRESULT  ICSendMessage(           HIC hic, ICMessage wMsg, DWORD dw1, DWORD dw2);
  LPVOID   ICSeqCompressFrame(      PCOMPVARS pc, UINT uiFlags, LPVOID lpBits, BOOL* pfKey, LONG* plSize);
  void     ICSeqCompressFrameEnd(   PCOMPVARS pc);
  BOOL     ICSeqCompressFrameStart( PCOMPVARS pc, LPBITMAPINFO lpbiIn);
  HWND     MCIWndCreate(            HWND hwndParent, HINSTANCE hInstance, DWORD dwStyle, LPCTSTR szFile);
  BOOL     MCIWndRegisterClass(     HINSTANCE hInstance);
  void     StretchDIB(              LPBITMAPINFOHEADER biDst, LPVOID lpvDst, int DstX, int DstY, int DstXE, int DstYE, LPBITMAPINFOHEADER biSrc, LPVOID lpvSrc, int SrcX, int SrcY, int SrcXE, int SrcYE);
]]
ffi.load( 'msvfw32.dll' )

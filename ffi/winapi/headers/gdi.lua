require( 'ffi/winapi/headers/ole' )
require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef HANDLE HICON; //Alias
  typedef HANDLE HMENU; //Alias
  typedef HANDLE HDC; //Alias
  typedef HANDLE WINAPI_HDC; //Alias
  typedef HANDLE WINAPI_HDC; //Alias
  typedef HANDLE HPALETTE; //Alias
  typedef HICON HCURSOR; //Alias
  typedef HANDLE HMONITOR; //Alias
  typedef LPVOID HIMAGELIST; //Alias
  typedef HANDLE HRGN; //Alias
  typedef HANDLE HMETAFILE; //Alias
  typedef HANDLE HBRUSH; //Alias
  typedef HANDLE HFONT; //Alias
  typedef LPVOID LPCCHOOKPROC; //Alias
  typedef LPVOID LPCFHOOKPROC; //Alias
  typedef LPVOID LPPAGESETUPHOOK; //Alias
  typedef LPVOID LPPAGEPAINTHOOK; //Alias
  typedef LPVOID LPFRHOOKPROC; //Alias
  typedef LPVOID LPPRINTHOOKPROC; //Alias
  typedef LPVOID LPSETUPHOOKPROC; //Alias
  typedef LONGLONG REFERENCE_TIME; //Alias
  enum { LF_FACESIZE = 32 };
  typedef struct RGBQUAD {
    BYTE rgbBlue;
    BYTE rgbGreen;
    BYTE rgbRed;
    BYTE rgbReserved;
  } RGBQUAD;
  typedef DWORD WINAPI_RegionType; //Alias
  static const DWORD RDH_RECTANGLES = 1;
  typedef struct RGNDATAHEADER {
    DWORD dwSize;
    WINAPI_RegionType iType;
    DWORD nCount;
    DWORD nRgnSize;
    RECT rcBound;
  } RGNDATAHEADER;
  typedef struct RGNDATA {
    RGNDATAHEADER rdh;
    char Buffer;
  } RGNDATA;
  typedef RGNDATA *LPRGNDATA; //Pointer
  typedef DWORD COLORREF; //Alias
  static const DWORD CLR_INVALID = 0xFFFFFFFF;
  typedef struct SIZE {
    LONG cx;
    LONG cy;
  } SIZE;
  typedef SIZE* LPSIZE; //Alias
  typedef SIZE* PSIZE; //Alias
  typedef SIZE SIZEL; //Alias
  typedef SIZEL *LPSIZEL; //Pointer
  typedef DWORD WINAPI_ChooseColorFlags; //Alias
  typedef struct CHOOSECOLOR {
    DWORD lStructSize;
    HWND hwndOwner;
    HWND hInstance;
    COLORREF rgbResult;
    COLORREF* lpCustColors;
    WINAPI_ChooseColorFlags Flags;
    LPARAM lCustData;
    LPCCHOOKPROC lpfnHook;
    LPCTSTR lpTemplateName;
  } CHOOSECOLOR;
  typedef CHOOSECOLOR *LPCHOOSECOLOR; //Pointer
  typedef DWORD WINAPI_ChoooseFontFlags; //Alias
  typedef WORD WINAPI_FontType; //Alias
  typedef LONG WINAPI_FontWeight; //Alias
  static const LONG FW_DONTCARE = 0;
  static const LONG FW_THIN = 100;
  static const LONG FW_EXTRALIGHT = 200;
  static const LONG FW_LIGHT = 300;
  static const LONG FW_NORMAL = 400;
  static const LONG FW_MEDIUM = 500;
  static const LONG FW_SEMIBOLD = 600;
  static const LONG FW_BOLD = 700;
  static const LONG FW_EXTRABOLD = 800;
  static const LONG FW_HEAVY = 900;
  typedef BYTE WINAPI_FontCharset; //Alias
  static const BYTE ANSI_CHARSET = 0;
  static const BYTE DEFAULT_CHARSET = 1;
  static const BYTE SYMBOL_CHARSET = 2;
  static const BYTE SHIFTJIS_CHARSET = 128;
  static const BYTE HANGEUL_CHARSET = 129;
  static const BYTE HANGUL_CHARSET = 129;
  static const BYTE GB2312_CHARSET = 134;
  static const BYTE CHINESEBIG5_CHARSET = 136;
  static const BYTE OEM_CHARSET = 255;
  static const BYTE JOHAB_CHARSET = 130;
  static const BYTE HEBREW_CHARSET = 177;
  static const BYTE ARABIC_CHARSET = 178;
  static const BYTE GREEK_CHARSET = 161;
  static const BYTE TURKISH_CHARSET = 162;
  static const BYTE VIETNAMESE_CHARSET = 163;
  static const BYTE THAI_CHARSET = 222;
  static const BYTE EASTEUROPE_CHARSET = 238;
  static const BYTE RUSSIAN_CHARSET = 204;
  static const BYTE MAC_CHARSET = 77;
  static const BYTE BALTIC_CHARSET = 186;
  typedef BYTE WINAPI_FontOutputPrecision; //Alias
  static const BYTE OUT_DEFAULT_PRECIS = 0;
  static const BYTE OUT_STRING_PRECIS = 1;
  static const BYTE OUT_CHARACTER_PRECIS = 2;
  static const BYTE OUT_STROKE_PRECIS = 3;
  static const BYTE OUT_TT_PRECIS = 4;
  static const BYTE OUT_DEVICE_PRECIS = 5;
  static const BYTE OUT_RASTER_PRECIS = 6;
  static const BYTE OUT_TT_ONLY_PRECIS = 7;
  static const BYTE OUT_OUTLINE_PRECIS = 8;
  static const BYTE OUT_SCREEN_OUTLINE_PRECIS = 9;
  static const BYTE OUT_PS_ONLY_PRECIS = 10;
  typedef BYTE WINAPI_FontClipPrecision; //Alias
  static const BYTE CLIP_DEFAULT_PRECIS = 0;
  static const BYTE CLIP_CHARACTER_PRECIS = 1;
  static const BYTE CLIP_STROKE_PRECIS = 2;
  static const BYTE CLIP_MASK = 0xf;
  static const BYTE CLIP_LH_ANGLES = 0x10;
  static const BYTE CLIP_TT_ALWAYS = 0x20;
  static const BYTE CLIP_DFA_DISABLE = 0x40;
  static const BYTE CLIP_EMBEDDED = 0x80;
  typedef BYTE WINAPI_FontQuality; //Alias
  static const BYTE DEFAULT_QUALITY = 0;
  static const BYTE DRAFT_QUALITY = 1;
  static const BYTE PROOF_QUALITY = 2;
  static const BYTE NONANTIALIASED_QUALITY = 3;
  static const BYTE ANTIALIASED_QUALITY = 4;
  static const BYTE CLEARTYPE_QUALITY = 5;
  static const BYTE CLEARTYPE_NATURAL_QUALITY = 6;
  typedef BYTE WINAPI_FontPitchAndFamily; //Alias
  typedef struct LOGFONT {
    LONG lfHeight;
    LONG lfWidth;
    LONG lfEscapement;
    LONG lfOrientation;
    WINAPI_FontWeight lfWeight;
    BYTE lfItalic;
    BYTE lfUnderline;
    BYTE lfStrikeOut;
    WINAPI_FontCharset lfCharSet;
    WINAPI_FontOutputPrecision lfOutPrecision;
    WINAPI_FontClipPrecision lfClipPrecision;
    WINAPI_FontQuality lfQuality;
    WINAPI_FontPitchAndFamily lfPitchAndFamily;
    TCHAR lfFaceName[LF_FACESIZE];
  } LOGFONT;
  typedef LOGFONT *LPLOGFONT; //Pointer
  typedef struct LOGFONTW {
    LONG lfHeight;
    LONG lfWidth;
    LONG lfEscapement;
    LONG lfOrientation;
    WINAPI_FontWeight lfWeight;
    BYTE lfItalic;
    BYTE lfUnderline;
    BYTE lfStrikeOut;
    WINAPI_FontCharset lfCharSet;
    WINAPI_FontOutputPrecision lfOutPrecision;
    WINAPI_FontClipPrecision lfClipPrecision;
    WINAPI_FontQuality lfQuality;
    WINAPI_FontPitchAndFamily lfPitchAndFamily;
    WCHAR lfFaceName[LF_FACESIZE];
  } LOGFONTW;
  typedef struct CHOOSEFONT {
    DWORD lStructSize;
    HWND hwndOwner;
    HDC hDC;
    LPLOGFONT lpLogFont;
    INT iPointSize;
    WINAPI_ChoooseFontFlags Flags;
    COLORREF rgbColors;
    LPARAM lCustData;
    LPCFHOOKPROC lpfnHook;
    LPCTSTR lpTemplateName;
    HINSTANCE hInstance;
    LPTSTR lpszStyle;
    WINAPI_FontType nFontType;
    WORD ___MISSING_ALIGNMENT__;
    INT nSizeMin;
    INT nSizeMax;
  } CHOOSEFONT;
  typedef CHOOSEFONT *LPCHOOSEFONT; //Pointer
  typedef DWORD WINAPI_FindReplaceFlags; //Alias
  typedef struct FINDREPLACE {
    DWORD lStructSize;
    HWND hwndOwner;
    HINSTANCE hInstance;
    WINAPI_FindReplaceFlags Flags;
    LPTSTR lpstrFindWhat;
    LPTSTR lpstrReplaceWith;
    WORD wFindWhatLen;
    WORD wReplaceWithLen;
    LPARAM lCustData;
    LPFRHOOKPROC lpfnHook;
    LPCTSTR lpTemplateName;
  } FINDREPLACE;
  typedef FINDREPLACE *LPFINDREPLACE; //Pointer
  typedef DWORD WINAPI_OfnFlags; //Alias
  typedef DWORD WINAPI_OfnFlagsEx; //Alias
  typedef struct OPENFILENAME {
    DWORD lStructSize;
    HWND hwndOwner;
    HINSTANCE hInstance;
    LPCTSTR lpstrFilter;
    LPTSTR lpstrCustomFilter;
    DWORD nMaxCustFilter;
    DWORD nFilterIndex;
    LPTSTR lpstrFile;
    DWORD nMaxFile;
    LPTSTR lpstrFileTitle;
    DWORD nMaxFileTitle;
    LPCTSTR lpstrInitialDir;
    LPCTSTR lpstrTitle;
    WINAPI_OfnFlags Flags;
    WORD nFileOffset;
    WORD nFileExtension;
    LPCTSTR lpstrDefExt;
    LPARAM lCustData;
    LPVOID lpfnHook;
    LPCTSTR lpTemplateName;
    void* pvReserved;
    DWORD dwReserved;
    WINAPI_OfnFlagsEx FlagsEx;
  } OPENFILENAME;
  typedef OPENFILENAME *LPOPENFILENAME; //Pointer
  typedef DWORD WINAPI_PageSetupDialogFlags; //Alias
  typedef struct PAGESETUPDLG {
    DWORD lStructSize;
    HWND hwndOwner;
    HGLOBAL hDevMode;
    HGLOBAL hDevNames;
    WINAPI_PageSetupDialogFlags Flags;
    POINT ptPaperSize;
    RECT rtMinMargin;
    RECT rtMargin;
    HINSTANCE hInstance;
    LPARAM lCustData;
    LPPAGESETUPHOOK lpfnPageSetupHook;
    LPPAGEPAINTHOOK lpfnPagePaintHook;
    LPCTSTR lpPageSetupTemplateName;
    HGLOBAL hPageSetupTemplate;
  } PAGESETUPDLG;
  typedef PAGESETUPDLG *LPPAGESETUPDLG; //Pointer
  typedef DWORD WINAPI_PrintDlgFlags; //Alias
  typedef struct PRINTDLG {
    DWORD lStructSize;
    HWND hwndOwner;
    HGLOBAL hDevMode;
    HGLOBAL hDevNames;
    HDC hDC;
    WINAPI_PrintDlgFlags Flags;
    WORD nFromPage;
    WORD nToPage;
    WORD nMinPage;
    WORD nMaxPage;
    WORD nCopies;
    HINSTANCE hInstance;
    LPARAM lCustData;
    LPPRINTHOOKPROC lpfnPrintHook;
    LPSETUPHOOKPROC lpfnSetupHook;
    LPCTSTR lpPrintTemplateName;
    LPCTSTR lpSetupTemplateName;
    HGLOBAL hPrintTemplate;
    HGLOBAL hSetupTemplate;
  } PRINTDLG;
  typedef PRINTDLG *LPPRINTDLG; //Pointer
  typedef struct PRINTPAGERANGE {
    DWORD nFromPage;
    DWORD nToPage;
  } PRINTPAGERANGE;
  typedef PRINTPAGERANGE *LPPRINTPAGERANGE; //Pointer
  typedef struct PRINTDLGEX {
    DWORD lStructSize;
    HWND hwndOwner;
    HGLOBAL hDevMode;
    HGLOBAL hDevNames;
    HDC hDC;
    WINAPI_PrintDlgFlags Flags;
    DWORD Flags2;
    DWORD ExclusionFlags;
    DWORD nPageRanges;
    DWORD nMaxPageRanges;
    LPPRINTPAGERANGE lpPageRanges;
    DWORD nMinPage;
    DWORD nMaxPage;
    DWORD nCopies;
    HINSTANCE hInstance;
    LPCTSTR lpPrintTemplateName;
    LPUNKNOWN lpCallback;
    DWORD nPropertyPages;
    HPROPSHEETPAGE* lphPropertyPages;
    DWORD nStartPage;
    DWORD dwResultAction;
  } PRINTDLGEX;
  typedef PRINTDLGEX *LPPRINTDLGEX; //Pointer
  typedef struct DRAWTEXTPARAMS {
    UINT cbSize;
    int iTabLength;
    int iLeftMargin;
    int iRightMargin;
    UINT uiLengthDrawn;
  } DRAWTEXTPARAMS;
  typedef DRAWTEXTPARAMS *LPDRAWTEXTPARAMS; //Pointer
  typedef DWORD WINAPI_TRACKMOUSEEVENT_Flags; //Alias
  typedef struct TRACKMOUSEEVENT {
    DWORD cbSize;
    WINAPI_TRACKMOUSEEVENT_Flags dwFlags;
    HWND hwndTrack;
    DWORD dwHoverTime;
  } TRACKMOUSEEVENT;
  typedef TRACKMOUSEEVENT *LPTRACKMOUSEEVENT; //Pointer
  typedef UINT WINAPI_SCROLLINFO_Flags; //Alias
  typedef struct SCROLLINFO {
    UINT cbSize;
    WINAPI_SCROLLINFO_Flags fMask;
    int nMin;
    int nMax;
    UINT nPage;
    int nPos;
    int nTrackPos;
  } SCROLLINFO;
  typedef SCROLLINFO *LPSCROLLINFO; //Pointer
  typedef SCROLLINFO *LPCSCROLLINFO; //Pointer
  typedef struct MARGINS {
    int cxLeftWidth;
    int cxRightWidth;
    int cyTopHeight;
    int cyBottomHeight;
  } MARGINS;
  typedef struct BLENDFUNCTION {
    BYTE BlendOp;
    BYTE BlendFlags;
    BYTE SourceConstantAlpha;
    BYTE AlphaFormat;
  } BLENDFUNCTION;
  typedef struct BITMAPINFOHEADER {
    DWORD biSize;
    LONG biWidth;
    LONG biHeight;
    WORD biPlanes;
    WORD biBitCount;
    DWORD biCompression;
    DWORD biSizeImage;
    LONG biXPelsPerMeter;
    LONG biYPelsPerMeter;
    DWORD biClrUsed;
    DWORD biClrImportant;
  } BITMAPINFOHEADER;
  typedef BITMAPINFOHEADER *LPBITMAPINFOHEADER; //Pointer
  typedef struct BITMAPINFO {
    BITMAPINFOHEADER bmiHeader;
    RGBQUAD bmiColors[1];
  } BITMAPINFO;
  typedef BITMAPINFO *LPBITMAPINFO; //Pointer
  typedef BYTE WINAPI_TEXTMETRIC_Pitch; //Alias
# pragma pack( push, 4 )
  typedef struct TEXTMETRIC {
    LONG tmHeight;
    LONG tmAscent;
    LONG tmDescent;
    LONG tmInternalLeading;
    LONG tmExternalLeading;
    LONG tmAveCharWidth;
    LONG tmMaxCharWidth;
    LONG tmWeight;
    LONG tmOverhang;
    LONG tmDigitizedAspectX;
    LONG tmDigitizedAspectY;
    TCHAR tmFirstChar;
    TCHAR tmLastChar;
    TCHAR tmDefaultChar;
    TCHAR tmBreakChar;
    BYTE tmItalic;
    BYTE tmUnderlined;
    BYTE tmStruckOut;
    WINAPI_TEXTMETRIC_Pitch tmPitchAndFamily;
    WINAPI_FontCharset tmCharSet;
  } TEXTMETRIC;
# pragma pack( pop )
  typedef TEXTMETRIC *LPTEXTMETRIC; //Pointer
  typedef DWORD WINAPI_MONITORINFO_Flags; //Alias
  typedef struct VIDEOINFOHEADER {
    RECT rcSource;
    RECT rcTarget;
    DWORD dwBitRate;
    DWORD dwBitErrorRate;
    REFERENCE_TIME AvgTimePerFrame;
    BITMAPINFOHEADER bmiHeader;
  } VIDEOINFOHEADER;
  typedef DWORD WINAPI_AMINTERLACE_FLAGS; //Alias
  typedef DWORD WINAPI_AMCOPYPROTECT_FLAGS; //Alias
  typedef DWORD WINAPI_AMCONTROL_FLAGS; //Alias
  typedef struct VIDEOINFOHEADER2 {
    RECT rcSource;
    RECT rcTarget;
    DWORD dwBitRate;
    DWORD dwBitErrorRate;
    REFERENCE_TIME AvgTimePerFrame;
    WINAPI_AMINTERLACE_FLAGS dwInterlaceFlags;
    WINAPI_AMCOPYPROTECT_FLAGS dwCopyProtectFlags;
    DWORD dwPictAspectRatioX;
    DWORD dwPictAspectRatioY;
    WINAPI_AMCONTROL_FLAGS dwControlFlags;
    DWORD dwReserved2;
    BITMAPINFOHEADER bmiHeader;
  } VIDEOINFOHEADER2;
  typedef UINT PixelFormat; //Alias
  static const UINT PixelFormat4bppIndexed = 0x30402;
  static const UINT PixelFormat8bppIndexed = 0x30803;
  static const UINT PixelFormat16bppGrayScale = 0x101004;
  static const UINT PixelFormat16bppRGB555 = 0x21005;
  static const UINT PixelFormat16bppRGB565 = 0x21006;
  static const UINT PixelFormat16bppARGB1555 = 0x61007;
  static const UINT PixelFormat24bppRGB = 0x21808;
  static const UINT PixelFormat32bppRGB = 0x22009;
  static const UINT PixelFormat32bppARGB = 0x26200a;
  static const UINT PixelFormat32bppPARGB = 0xe200b;
  static const UINT PixelFormat48bppRGB = 0x10300c;
  static const UINT PixelFormat64bppARGB = 0x34400d;
  static const UINT PixelFormat64bppPARGB = 0x1c400e;
  static const UINT PixelFormat32bppCMYK = 0x200f;
  typedef UINT InterpolationMode; //Alias
  static const UINT InterpolationModeInvalid = -1;
  static const UINT InterpolationModeDefault = 0;
  static const UINT InterpolationModeLowQuality = 1;
  static const UINT InterpolationModeHighQuality = 2;
  static const UINT InterpolationModeBilinear = 3;
  static const UINT InterpolationModeBicubic = 4;
  static const UINT InterpolationModeNearestNeighbor = 5;
  static const UINT InterpolationModeHighQualityBilinear = 6;
  static const UINT InterpolationModeHighQualityBicubic = 7;
  typedef ULONG EncoderParameterValueType; //Alias
  static const ULONG EncoderParameterValueTypeByte = 1;
  static const ULONG EncoderParameterValueTypeASCII = 2;
  static const ULONG EncoderParameterValueTypeShort = 3;
  static const ULONG EncoderParameterValueTypeLong = 4;
  static const ULONG EncoderParameterValueTypeRational = 5;
  static const ULONG EncoderParameterValueTypeLongRange = 6;
  static const ULONG EncoderParameterValueTypeUndefined = 7;
  static const ULONG EncoderParameterValueTypeRationalRange = 8;
  static const ULONG EncoderParameterValueTypePointer = 9;
  typedef struct EncoderParameter {
    GUID Guid;
    ULONG NumberOfValues;
    EncoderParameterValueType Type;
    VOID* Value;
  } EncoderParameter;
  typedef struct EncoderParameters {
    UINT Count;
    EncoderParameter Parameter[1];
  } EncoderParameters;
  typedef struct ABC {
    int abcA;
    UINT abcB;
    int abcC;
  } ABC;
  typedef ABC *LPABC; //Pointer
]]

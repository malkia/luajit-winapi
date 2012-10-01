require( "ffi/winapi/headers/ole" )
require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  typedef HANDLE HICON;
  typedef HANDLE HMENU;
  typedef HANDLE HDC;
  typedef HANDLE CONST HDC;
  typedef HANDLE HDC;
  typedef HANDLE HPALETTE;
  typedef HICON HCURSOR;
  typedef HANDLE HMONITOR;
  typedef LPVOID HIMAGELIST;
  typedef HANDLE HRGN;
  typedef HANDLE HMETAFILE;
  typedef HANDLE HBRUSH;
  typedef HANDLE HFONT;
  typedef LPVOID LPCCHOOKPROC;
  typedef LPVOID LPCFHOOKPROC;
  typedef LPVOID LPPAGESETUPHOOK;
  typedef LPVOID LPPAGEPAINTHOOK;
  typedef LPVOID LPFRHOOKPROC;
  typedef LPVOID LPPRINTHOOKPROC;
  typedef LPVOID LPSETUPHOOKPROC;
  typedef LONGLONG REFERENCE_TIME;
  typedef REFERENCE_TIME* REFERENCE_TIME*;
  typedef struct RGBQUAD {
    BYTE rgbBlue,
    BYTE rgbGreen,
    BYTE rgbRed,
    BYTE rgbReserved,
  } RGBQUAD;

  typedef enum WINAPI_RegionType {
    RDH_RECTANGLES = 1,
  } WINAPI_RegionType;
  typedef struct RGNDATAHEADER {
    DWORD dwSize,
    WINAPI_RegionType iType,
    DWORD nCount,
    DWORD nRgnSize,
    RECT rcBound,
  } RGNDATAHEADER;

  typedef struct RGNDATA {
    RGNDATAHEADER rdh,
    char Buffer,
  } RGNDATA;

  typedef RGNDATA CONST RGNDATA*;
  typedef RGNDATA LPRGNDATA;
  typedef enum COLORREF {
    CLR_INVALID = 0xFFFFFFFF,
  } COLORREF;
  typedef COLORREF* COLORREF*;
  typedef struct SIZE {
    LONG cx,
    LONG cy,
  } SIZE;

  typedef SIZE* LPSIZE;
  typedef SIZE* SIZE*;
  typedef SIZE* PSIZE;
  typedef SIZE SIZEL;
  typedef SIZEL LPSIZEL;
  typedef DWORD WINAPI_ChooseColorFlags;
  typedef struct CHOOSECOLOR {
    DWORD lStructSize,
    HWND hwndOwner,
    HWND hInstance,
    COLORREF rgbResult,
    COLORREF* lpCustColors,
    WINAPI_ChooseColorFlags Flags,
    LPARAM lCustData,
    LPCCHOOKPROC lpfnHook,
    LPCTSTR lpTemplateName,
  } CHOOSECOLOR;

  typedef CHOOSECOLOR LPCHOOSECOLOR;
  typedef DWORD WINAPI_ChoooseFontFlags;
  typedef WORD WINAPI_FontType;
  typedef enum WINAPI_FontWeight {
    FW_DONTCARE = 0,
    FW_THIN = 100,
    FW_EXTRALIGHT = 200,
    FW_LIGHT = 300,
    FW_NORMAL = 400,
    FW_MEDIUM = 500,
    FW_SEMIBOLD = 600,
    FW_BOLD = 700,
    FW_EXTRABOLD = 800,
    FW_HEAVY = 900,
  } WINAPI_FontWeight;
  typedef enum WINAPI_FontCharset {
    ANSI_CHARSET = 0,
    DEFAULT_CHARSET = 1,
    SYMBOL_CHARSET = 2,
    SHIFTJIS_CHARSET = 128,
    HANGEUL_CHARSET = 129,
    HANGUL_CHARSET = 129,
    GB2312_CHARSET = 134,
    CHINESEBIG5_CHARSET = 136,
    OEM_CHARSET = 255,
    JOHAB_CHARSET = 130,
    HEBREW_CHARSET = 177,
    ARABIC_CHARSET = 178,
    GREEK_CHARSET = 161,
    TURKISH_CHARSET = 162,
    VIETNAMESE_CHARSET = 163,
    THAI_CHARSET = 222,
    EASTEUROPE_CHARSET = 238,
    RUSSIAN_CHARSET = 204,
    MAC_CHARSET = 77,
    BALTIC_CHARSET = 186,
  } WINAPI_FontCharset;
  typedef enum WINAPI_FontOutputPrecision {
    OUT_DEFAULT_PRECIS = 0,
    OUT_STRING_PRECIS = 1,
    OUT_CHARACTER_PRECIS = 2,
    OUT_STROKE_PRECIS = 3,
    OUT_TT_PRECIS = 4,
    OUT_DEVICE_PRECIS = 5,
    OUT_RASTER_PRECIS = 6,
    OUT_TT_ONLY_PRECIS = 7,
    OUT_OUTLINE_PRECIS = 8,
    OUT_SCREEN_OUTLINE_PRECIS = 9,
    OUT_PS_ONLY_PRECIS = 10,
  } WINAPI_FontOutputPrecision;
  typedef enum WINAPI_FontClipPrecision {
    CLIP_DEFAULT_PRECIS = 0,
    CLIP_CHARACTER_PRECIS = 1,
    CLIP_STROKE_PRECIS = 2,
    CLIP_MASK = 0xf,
    CLIP_LH_ANGLES = 0x10,
    CLIP_TT_ALWAYS = 0x20,
    CLIP_DFA_DISABLE = 0x40,
    CLIP_EMBEDDED = 0x80,
  } WINAPI_FontClipPrecision;
  typedef enum WINAPI_FontQuality {
    DEFAULT_QUALITY = 0,
    DRAFT_QUALITY = 1,
    PROOF_QUALITY = 2,
    NONANTIALIASED_QUALITY = 3,
    ANTIALIASED_QUALITY = 4,
    CLEARTYPE_QUALITY = 5,
    CLEARTYPE_NATURAL_QUALITY = 6,
  } WINAPI_FontQuality;
  typedef BYTE WINAPI_FontPitchAndFamily;
  typedef struct LOGFONT {
    LONG lfHeight,
    LONG lfWidth,
    LONG lfEscapement,
    LONG lfOrientation,
    WINAPI_FontWeight lfWeight,
    BYTE lfItalic,
    BYTE lfUnderline,
    BYTE lfStrikeOut,
    WINAPI_FontCharset lfCharSet,
    WINAPI_FontOutputPrecision lfOutPrecision,
    WINAPI_FontClipPrecision lfClipPrecision,
    WINAPI_FontQuality lfQuality,
    WINAPI_FontPitchAndFamily lfPitchAndFamily,
    TCHAR [LF_FACESIZE] lfFaceName,
  } LOGFONT;

  typedef LOGFONT LPLOGFONT;
  typedef struct LOGFONTW {
    LONG lfHeight,
    LONG lfWidth,
    LONG lfEscapement,
    LONG lfOrientation,
    WINAPI_FontWeight lfWeight,
    BYTE lfItalic,
    BYTE lfUnderline,
    BYTE lfStrikeOut,
    WINAPI_FontCharset lfCharSet,
    WINAPI_FontOutputPrecision lfOutPrecision,
    WINAPI_FontClipPrecision lfClipPrecision,
    WINAPI_FontQuality lfQuality,
    WINAPI_FontPitchAndFamily lfPitchAndFamily,
    WCHAR [LF_FACESIZE] lfFaceName,
  } LOGFONTW;

  typedef struct CHOOSEFONT {
    DWORD lStructSize,
    HWND hwndOwner,
    HDC hDC,
    LPLOGFONT lpLogFont,
    INT iPointSize,
    WINAPI_ChoooseFontFlags Flags,
    COLORREF rgbColors,
    LPARAM lCustData,
    LPCFHOOKPROC lpfnHook,
    LPCTSTR lpTemplateName,
    HINSTANCE hInstance,
    LPTSTR lpszStyle,
    WINAPI_FontType nFontType,
    WORD ___MISSING_ALIGNMENT__,
    INT nSizeMin,
    INT nSizeMax,
  } CHOOSEFONT;

  typedef CHOOSEFONT LPCHOOSEFONT;
  typedef DWORD WINAPI_FindReplaceFlags;
  typedef struct FINDREPLACE {
    DWORD lStructSize,
    HWND hwndOwner,
    HINSTANCE hInstance,
    WINAPI_FindReplaceFlags Flags,
    LPTSTR lpstrFindWhat,
    LPTSTR lpstrReplaceWith,
    WORD wFindWhatLen,
    WORD wReplaceWithLen,
    LPARAM lCustData,
    LPFRHOOKPROC lpfnHook,
    LPCTSTR lpTemplateName,
  } FINDREPLACE;

  typedef FINDREPLACE LPFINDREPLACE;
  typedef DWORD WINAPI_OfnFlags;
  typedef DWORD WINAPI_OfnFlagsEx;
  typedef struct OPENFILENAME {
    DWORD lStructSize,
    HWND hwndOwner,
    HINSTANCE hInstance,
    LPCTSTR lpstrFilter,
    LPTSTR lpstrCustomFilter,
    DWORD nMaxCustFilter,
    DWORD nFilterIndex,
    LPTSTR lpstrFile,
    DWORD nMaxFile,
    LPTSTR lpstrFileTitle,
    DWORD nMaxFileTitle,
    LPCTSTR lpstrInitialDir,
    LPCTSTR lpstrTitle,
    WINAPI_OfnFlags Flags,
    WORD nFileOffset,
    WORD nFileExtension,
    LPCTSTR lpstrDefExt,
    LPARAM lCustData,
    LPVOID lpfnHook,
    LPCTSTR lpTemplateName,
    void* pvReserved,
    DWORD dwReserved,
    WINAPI_OfnFlagsEx FlagsEx,
  } OPENFILENAME;

  typedef OPENFILENAME LPOPENFILENAME;
  typedef DWORD WINAPI_PageSetupDialogFlags;
  typedef struct PAGESETUPDLG {
    DWORD lStructSize,
    HWND hwndOwner,
    HGLOBAL hDevMode,
    HGLOBAL hDevNames,
    WINAPI_PageSetupDialogFlags Flags,
    POINT ptPaperSize,
    RECT rtMinMargin,
    RECT rtMargin,
    HINSTANCE hInstance,
    LPARAM lCustData,
    LPPAGESETUPHOOK lpfnPageSetupHook,
    LPPAGEPAINTHOOK lpfnPagePaintHook,
    LPCTSTR lpPageSetupTemplateName,
    HGLOBAL hPageSetupTemplate,
  } PAGESETUPDLG;

  typedef PAGESETUPDLG LPPAGESETUPDLG;
  typedef DWORD WINAPI_PrintDlgFlags;
  typedef struct PRINTDLG {
    DWORD lStructSize,
    HWND hwndOwner,
    HGLOBAL hDevMode,
    HGLOBAL hDevNames,
    HDC hDC,
    WINAPI_PrintDlgFlags Flags,
    WORD nFromPage,
    WORD nToPage,
    WORD nMinPage,
    WORD nMaxPage,
    WORD nCopies,
    HINSTANCE hInstance,
    LPARAM lCustData,
    LPPRINTHOOKPROC lpfnPrintHook,
    LPSETUPHOOKPROC lpfnSetupHook,
    LPCTSTR lpPrintTemplateName,
    LPCTSTR lpSetupTemplateName,
    HGLOBAL hPrintTemplate,
    HGLOBAL hSetupTemplate,
  } PRINTDLG;

  typedef PRINTDLG LPPRINTDLG;
  typedef struct PRINTPAGERANGE {
    DWORD nFromPage,
    DWORD nToPage,
  } PRINTPAGERANGE;

  typedef PRINTPAGERANGE LPPRINTPAGERANGE;
  typedef struct PRINTDLGEX {
    DWORD lStructSize,
    HWND hwndOwner,
    HGLOBAL hDevMode,
    HGLOBAL hDevNames,
    HDC hDC,
    WINAPI_PrintDlgFlags Flags,
    DWORD Flags2,
    DWORD ExclusionFlags,
    DWORD nPageRanges,
    DWORD nMaxPageRanges,
    LPPRINTPAGERANGE lpPageRanges,
    DWORD nMinPage,
    DWORD nMaxPage,
    DWORD nCopies,
    HINSTANCE hInstance,
    LPCTSTR lpPrintTemplateName,
    LPUNKNOWN lpCallback,
    DWORD nPropertyPages,
    HPROPSHEETPAGE* lphPropertyPages,
    DWORD nStartPage,
    DWORD dwResultAction,
  } PRINTDLGEX;

  typedef PRINTDLGEX LPPRINTDLGEX;
  typedef struct DRAWTEXTPARAMS {
    UINT cbSize,
    int iTabLength,
    int iLeftMargin,
    int iRightMargin,
    UINT uiLengthDrawn,
  } DRAWTEXTPARAMS;

  typedef DRAWTEXTPARAMS LPDRAWTEXTPARAMS;
  typedef DWORD WINAPI_TRACKMOUSEEVENT_Flags;
  typedef struct TRACKMOUSEEVENT {
    DWORD cbSize,
    WINAPI_TRACKMOUSEEVENT_Flags dwFlags,
    HWND hwndTrack,
    DWORD dwHoverTime,
  } TRACKMOUSEEVENT;

  typedef TRACKMOUSEEVENT LPTRACKMOUSEEVENT;
  typedef UINT WINAPI_SCROLLINFO_Flags;
  typedef struct SCROLLINFO {
    UINT cbSize,
    WINAPI_SCROLLINFO_Flags fMask,
    int nMin,
    int nMax,
    UINT nPage,
    int nPos,
    int nTrackPos,
  } SCROLLINFO;

  typedef SCROLLINFO LPSCROLLINFO;
  typedef SCROLLINFO LPCSCROLLINFO;
  typedef struct MARGINS {
    int cxLeftWidth,
    int cxRightWidth,
    int cyTopHeight,
    int cyBottomHeight,
  } MARGINS;

  typedef struct BLENDFUNCTION {
    BYTE BlendOp,
    BYTE BlendFlags,
    BYTE SourceConstantAlpha,
    BYTE AlphaFormat,
  } BLENDFUNCTION;

  typedef struct BITMAPINFOHEADER {
    DWORD biSize,
    LONG biWidth,
    LONG biHeight,
    WORD biPlanes,
    WORD biBitCount,
    DWORD biCompression,
    DWORD biSizeImage,
    LONG biXPelsPerMeter,
    LONG biYPelsPerMeter,
    DWORD biClrUsed,
    DWORD biClrImportant,
  } BITMAPINFOHEADER;

  typedef BITMAPINFOHEADER LPBITMAPINFOHEADER;
  typedef struct BITMAPINFO {
    BITMAPINFOHEADER bmiHeader,
    RGBQUAD [1] bmiColors,
  } BITMAPINFO;

  typedef BITMAPINFO LPBITMAPINFO;
  typedef BYTE WINAPI_TEXTMETRIC_Pitch;
  typedef struct TEXTMETRIC {
    LONG tmHeight,
    LONG tmAscent,
    LONG tmDescent,
    LONG tmInternalLeading,
    LONG tmExternalLeading,
    LONG tmAveCharWidth,
    LONG tmMaxCharWidth,
    LONG tmWeight,
    LONG tmOverhang,
    LONG tmDigitizedAspectX,
    LONG tmDigitizedAspectY,
    TCHAR tmFirstChar,
    TCHAR tmLastChar,
    TCHAR tmDefaultChar,
    TCHAR tmBreakChar,
    BYTE tmItalic,
    BYTE tmUnderlined,
    BYTE tmStruckOut,
    WINAPI_TEXTMETRIC_Pitch tmPitchAndFamily,
    WINAPI_FontCharset tmCharSet,
  } TEXTMETRIC;

  typedef TEXTMETRIC LPTEXTMETRIC;
  typedef DWORD WINAPI_MONITORINFO_Flags;
  typedef struct VIDEOINFOHEADER {
    RECT rcSource,
    RECT rcTarget,
    DWORD dwBitRate,
    DWORD dwBitErrorRate,
    REFERENCE_TIME AvgTimePerFrame,
    BITMAPINFOHEADER bmiHeader,
  } VIDEOINFOHEADER;

  typedef DWORD WINAPI_AMINTERLACE_FLAGS;
  typedef DWORD WINAPI_AMCOPYPROTECT_FLAGS;
  typedef DWORD WINAPI_AMCONTROL_FLAGS;
  typedef struct VIDEOINFOHEADER2 {
    RECT rcSource,
    RECT rcTarget,
    DWORD dwBitRate,
    DWORD dwBitErrorRate,
    REFERENCE_TIME AvgTimePerFrame,
    WINAPI_AMINTERLACE_FLAGS dwInterlaceFlags,
    WINAPI_AMCOPYPROTECT_FLAGS dwCopyProtectFlags,
    DWORD dwPictAspectRatioX,
    DWORD dwPictAspectRatioY,
    WINAPI_AMCONTROL_FLAGS dwControlFlags,
    DWORD dwReserved2,
    BITMAPINFOHEADER bmiHeader,
  } VIDEOINFOHEADER2;

  typedef enum PixelFormat {
    PixelFormat4bppIndexed = 0x30402,
    PixelFormat8bppIndexed = 0x30803,
    PixelFormat16bppGrayScale = 0x101004,
    PixelFormat16bppRGB555 = 0x21005,
    PixelFormat16bppRGB565 = 0x21006,
    PixelFormat16bppARGB1555 = 0x61007,
    PixelFormat24bppRGB = 0x21808,
    PixelFormat32bppRGB = 0x22009,
    PixelFormat32bppARGB = 0x26200a,
    PixelFormat32bppPARGB = 0xe200b,
    PixelFormat48bppRGB = 0x10300c,
    PixelFormat64bppARGB = 0x34400d,
    PixelFormat64bppPARGB = 0x1c400e,
    PixelFormat32bppCMYK = 0x200f,
  } PixelFormat;
  typedef enum InterpolationMode {
    InterpolationModeInvalid = _1,
    InterpolationModeDefault = 0,
    InterpolationModeLowQuality = 1,
    InterpolationModeHighQuality = 2,
    InterpolationModeBilinear = 3,
    InterpolationModeBicubic = 4,
    InterpolationModeNearestNeighbor = 5,
    InterpolationModeHighQualityBilinear = 6,
    InterpolationModeHighQualityBicubic = 7,
  } InterpolationMode;
  typedef enum EncoderParameterValueType {
    EncoderParameterValueTypeByte = 1,
    EncoderParameterValueTypeASCII = 2,
    EncoderParameterValueTypeShort = 3,
    EncoderParameterValueTypeLong = 4,
    EncoderParameterValueTypeRational = 5,
    EncoderParameterValueTypeLongRange = 6,
    EncoderParameterValueTypeUndefined = 7,
    EncoderParameterValueTypeRationalRange = 8,
    EncoderParameterValueTypePointer = 9,
  } EncoderParameterValueType;
  typedef struct EncoderParameter {
    GUID Guid,
    ULONG NumberOfValues,
    EncoderParameterValueType Type,
    VOID* Value,
  } EncoderParameter;

  typedef struct EncoderParameters {
    UINT Count,
    EncoderParameter [1] Parameter,
  } EncoderParameters;

  typedef struct ABC {
    int abcA,
    UINT abcB,
    int abcC,
  } ABC;

  typedef ABC LPABC;
]]

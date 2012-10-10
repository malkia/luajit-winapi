require( 'ffi/winapi/headers/ole' )
require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef HANDLE HICON; //Alias
  typedef HANDLE HMENU; //Alias
  typedef HANDLE HDC; //Alias
  typedef HANDLE HDC; //Alias
  typedef HANDLE HDC; //Alias
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
  typedef DWORD RegionType; //Alias
  static const RegionType RDH_RECTANGLES = 1;
  typedef struct RGNDATAHEADER {
    DWORD dwSize;
    RegionType iType;
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
  static const COLORREF CLR_INVALID = 0xFFFFFFFF;
  typedef struct SIZE {
    LONG cx;
    LONG cy;
  } SIZE;
  typedef SIZE* LPSIZE; //Alias
  typedef SIZE* PSIZE; //Alias
  typedef SIZE SIZEL; //Alias
  typedef SIZEL *LPSIZEL; //Pointer
  typedef DWORD ChooseColorFlags; //Alias
  typedef struct CHOOSECOLOR {
    DWORD lStructSize;
    HWND hwndOwner;
    HWND hInstance;
    COLORREF rgbResult;
    COLORREF* lpCustColors;
    ChooseColorFlags Flags;
    LPARAM lCustData;
    LPCCHOOKPROC lpfnHook;
    LPCTSTR lpTemplateName;
  } CHOOSECOLOR;
  typedef CHOOSECOLOR *LPCHOOSECOLOR; //Pointer
  typedef DWORD ChoooseFontFlags; //Alias
  typedef WORD FontType; //Alias
  typedef LONG FontWeight; //Alias
  static const FontWeight FW_DONTCARE = 0;
  static const FontWeight FW_THIN = 100;
  static const FontWeight FW_EXTRALIGHT = 200;
  static const FontWeight FW_LIGHT = 300;
  static const FontWeight FW_NORMAL = 400;
  static const FontWeight FW_MEDIUM = 500;
  static const FontWeight FW_SEMIBOLD = 600;
  static const FontWeight FW_BOLD = 700;
  static const FontWeight FW_EXTRABOLD = 800;
  static const FontWeight FW_HEAVY = 900;
  typedef BYTE FontCharset; //Alias
  static const FontCharset ANSI_CHARSET = 0;
  static const FontCharset DEFAULT_CHARSET = 1;
  static const FontCharset SYMBOL_CHARSET = 2;
  static const FontCharset SHIFTJIS_CHARSET = 128;
  static const FontCharset HANGEUL_CHARSET = 129;
  static const FontCharset HANGUL_CHARSET = 129;
  static const FontCharset GB2312_CHARSET = 134;
  static const FontCharset CHINESEBIG5_CHARSET = 136;
  static const FontCharset OEM_CHARSET = 255;
  static const FontCharset JOHAB_CHARSET = 130;
  static const FontCharset HEBREW_CHARSET = 177;
  static const FontCharset ARABIC_CHARSET = 178;
  static const FontCharset GREEK_CHARSET = 161;
  static const FontCharset TURKISH_CHARSET = 162;
  static const FontCharset VIETNAMESE_CHARSET = 163;
  static const FontCharset THAI_CHARSET = 222;
  static const FontCharset EASTEUROPE_CHARSET = 238;
  static const FontCharset RUSSIAN_CHARSET = 204;
  static const FontCharset MAC_CHARSET = 77;
  static const FontCharset BALTIC_CHARSET = 186;
  typedef BYTE FontOutputPrecision; //Alias
  static const FontOutputPrecision OUT_DEFAULT_PRECIS = 0;
  static const FontOutputPrecision OUT_STRING_PRECIS = 1;
  static const FontOutputPrecision OUT_CHARACTER_PRECIS = 2;
  static const FontOutputPrecision OUT_STROKE_PRECIS = 3;
  static const FontOutputPrecision OUT_TT_PRECIS = 4;
  static const FontOutputPrecision OUT_DEVICE_PRECIS = 5;
  static const FontOutputPrecision OUT_RASTER_PRECIS = 6;
  static const FontOutputPrecision OUT_TT_ONLY_PRECIS = 7;
  static const FontOutputPrecision OUT_OUTLINE_PRECIS = 8;
  static const FontOutputPrecision OUT_SCREEN_OUTLINE_PRECIS = 9;
  static const FontOutputPrecision OUT_PS_ONLY_PRECIS = 10;
  typedef BYTE FontClipPrecision; //Alias
  static const FontClipPrecision CLIP_DEFAULT_PRECIS = 0;
  static const FontClipPrecision CLIP_CHARACTER_PRECIS = 1;
  static const FontClipPrecision CLIP_STROKE_PRECIS = 2;
  static const FontClipPrecision CLIP_MASK = 0xf;
  static const FontClipPrecision CLIP_LH_ANGLES = 0x10;
  static const FontClipPrecision CLIP_TT_ALWAYS = 0x20;
  static const FontClipPrecision CLIP_DFA_DISABLE = 0x40;
  static const FontClipPrecision CLIP_EMBEDDED = 0x80;
  typedef BYTE FontQuality; //Alias
  static const FontQuality DEFAULT_QUALITY = 0;
  static const FontQuality DRAFT_QUALITY = 1;
  static const FontQuality PROOF_QUALITY = 2;
  static const FontQuality NONANTIALIASED_QUALITY = 3;
  static const FontQuality ANTIALIASED_QUALITY = 4;
  static const FontQuality CLEARTYPE_QUALITY = 5;
  static const FontQuality CLEARTYPE_NATURAL_QUALITY = 6;
  typedef BYTE FontPitchAndFamily; //Alias
  typedef struct LOGFONT {
    LONG lfHeight;
    LONG lfWidth;
    LONG lfEscapement;
    LONG lfOrientation;
    FontWeight lfWeight;
    BYTE lfItalic;
    BYTE lfUnderline;
    BYTE lfStrikeOut;
    FontCharset lfCharSet;
    FontOutputPrecision lfOutPrecision;
    FontClipPrecision lfClipPrecision;
    FontQuality lfQuality;
    FontPitchAndFamily lfPitchAndFamily;
    TCHAR lfFaceName_LF_FACESIZE_;
  } LOGFONT;
  typedef LOGFONT *LPLOGFONT; //Pointer
  typedef struct LOGFONTW {
    LONG lfHeight;
    LONG lfWidth;
    LONG lfEscapement;
    LONG lfOrientation;
    FontWeight lfWeight;
    BYTE lfItalic;
    BYTE lfUnderline;
    BYTE lfStrikeOut;
    FontCharset lfCharSet;
    FontOutputPrecision lfOutPrecision;
    FontClipPrecision lfClipPrecision;
    FontQuality lfQuality;
    FontPitchAndFamily lfPitchAndFamily;
    WCHAR lfFaceName_LF_FACESIZE_;
  } LOGFONTW;
  typedef struct CHOOSEFONT {
    DWORD lStructSize;
    HWND hwndOwner;
    HDC hDC;
    LPLOGFONT lpLogFont;
    INT iPointSize;
    ChoooseFontFlags Flags;
    COLORREF rgbColors;
    LPARAM lCustData;
    LPCFHOOKPROC lpfnHook;
    LPCTSTR lpTemplateName;
    HINSTANCE hInstance;
    LPTSTR lpszStyle;
    FontType nFontType;
    WORD ___MISSING_ALIGNMENT__;
    INT nSizeMin;
    INT nSizeMax;
  } CHOOSEFONT;
  typedef CHOOSEFONT *LPCHOOSEFONT; //Pointer
  typedef DWORD FindReplaceFlags; //Alias
  typedef struct FINDREPLACE {
    DWORD lStructSize;
    HWND hwndOwner;
    HINSTANCE hInstance;
    FindReplaceFlags Flags;
    LPTSTR lpstrFindWhat;
    LPTSTR lpstrReplaceWith;
    WORD wFindWhatLen;
    WORD wReplaceWithLen;
    LPARAM lCustData;
    LPFRHOOKPROC lpfnHook;
    LPCTSTR lpTemplateName;
  } FINDREPLACE;
  typedef FINDREPLACE *LPFINDREPLACE; //Pointer
  typedef DWORD OfnFlags; //Alias
  typedef DWORD OfnFlagsEx; //Alias
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
    OfnFlags Flags;
    WORD nFileOffset;
    WORD nFileExtension;
    LPCTSTR lpstrDefExt;
    LPARAM lCustData;
    LPVOID lpfnHook;
    LPCTSTR lpTemplateName;
    void* pvReserved;
    DWORD dwReserved;
    OfnFlagsEx FlagsEx;
  } OPENFILENAME;
  typedef OPENFILENAME *LPOPENFILENAME; //Pointer
  typedef DWORD PageSetupDialogFlags; //Alias
  typedef struct PAGESETUPDLG {
    DWORD lStructSize;
    HWND hwndOwner;
    HGLOBAL hDevMode;
    HGLOBAL hDevNames;
    PageSetupDialogFlags Flags;
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
  typedef DWORD PrintDlgFlags; //Alias
  typedef struct PRINTDLG {
    DWORD lStructSize;
    HWND hwndOwner;
    HGLOBAL hDevMode;
    HGLOBAL hDevNames;
    HDC hDC;
    PrintDlgFlags Flags;
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
    PrintDlgFlags Flags;
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
  typedef DWORD TRACKMOUSEEVENT_Flags; //Alias
  typedef struct TRACKMOUSEEVENT {
    DWORD cbSize;
    TRACKMOUSEEVENT_Flags dwFlags;
    HWND hwndTrack;
    DWORD dwHoverTime;
  } TRACKMOUSEEVENT;
  typedef TRACKMOUSEEVENT *LPTRACKMOUSEEVENT; //Pointer
  typedef UINT SCROLLINFO_Flags; //Alias
  typedef struct SCROLLINFO {
    UINT cbSize;
    SCROLLINFO_Flags fMask;
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
    RGBQUAD bmiColors_1_;
  } BITMAPINFO;
  typedef BITMAPINFO *LPBITMAPINFO; //Pointer
  typedef BYTE TEXTMETRIC_Pitch; //Alias
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
    TEXTMETRIC_Pitch tmPitchAndFamily;
    FontCharset tmCharSet;
  } TEXTMETRIC;
# pragma pack( pop )
  typedef TEXTMETRIC *LPTEXTMETRIC; //Pointer
  typedef DWORD MONITORINFO_Flags; //Alias
  typedef struct VIDEOINFOHEADER {
    RECT rcSource;
    RECT rcTarget;
    DWORD dwBitRate;
    DWORD dwBitErrorRate;
    REFERENCE_TIME AvgTimePerFrame;
    BITMAPINFOHEADER bmiHeader;
  } VIDEOINFOHEADER;
  typedef DWORD AMINTERLACE_FLAGS; //Alias
  typedef DWORD AMCOPYPROTECT_FLAGS; //Alias
  typedef DWORD AMCONTROL_FLAGS; //Alias
  typedef struct VIDEOINFOHEADER2 {
    RECT rcSource;
    RECT rcTarget;
    DWORD dwBitRate;
    DWORD dwBitErrorRate;
    REFERENCE_TIME AvgTimePerFrame;
    AMINTERLACE_FLAGS dwInterlaceFlags;
    AMCOPYPROTECT_FLAGS dwCopyProtectFlags;
    DWORD dwPictAspectRatioX;
    DWORD dwPictAspectRatioY;
    AMCONTROL_FLAGS dwControlFlags;
    DWORD dwReserved2;
    BITMAPINFOHEADER bmiHeader;
  } VIDEOINFOHEADER2;
  typedef UINT PixelFormat; //Alias
  static const PixelFormat PixelFormat4bppIndexed = 0x30402;
  static const PixelFormat PixelFormat8bppIndexed = 0x30803;
  static const PixelFormat PixelFormat16bppGrayScale = 0x101004;
  static const PixelFormat PixelFormat16bppRGB555 = 0x21005;
  static const PixelFormat PixelFormat16bppRGB565 = 0x21006;
  static const PixelFormat PixelFormat16bppARGB1555 = 0x61007;
  static const PixelFormat PixelFormat24bppRGB = 0x21808;
  static const PixelFormat PixelFormat32bppRGB = 0x22009;
  static const PixelFormat PixelFormat32bppARGB = 0x26200a;
  static const PixelFormat PixelFormat32bppPARGB = 0xe200b;
  static const PixelFormat PixelFormat48bppRGB = 0x10300c;
  static const PixelFormat PixelFormat64bppARGB = 0x34400d;
  static const PixelFormat PixelFormat64bppPARGB = 0x1c400e;
  static const PixelFormat PixelFormat32bppCMYK = 0x200f;
  typedef UINT InterpolationMode; //Alias
  static const InterpolationMode InterpolationModeInvalid = -1;
  static const InterpolationMode InterpolationModeDefault = 0;
  static const InterpolationMode InterpolationModeLowQuality = 1;
  static const InterpolationMode InterpolationModeHighQuality = 2;
  static const InterpolationMode InterpolationModeBilinear = 3;
  static const InterpolationMode InterpolationModeBicubic = 4;
  static const InterpolationMode InterpolationModeNearestNeighbor = 5;
  static const InterpolationMode InterpolationModeHighQualityBilinear = 6;
  static const InterpolationMode InterpolationModeHighQualityBicubic = 7;
  typedef ULONG EncoderParameterValueType; //Alias
  static const EncoderParameterValueType EncoderParameterValueTypeByte = 1;
  static const EncoderParameterValueType EncoderParameterValueTypeASCII = 2;
  static const EncoderParameterValueType EncoderParameterValueTypeShort = 3;
  static const EncoderParameterValueType EncoderParameterValueTypeLong = 4;
  static const EncoderParameterValueType EncoderParameterValueTypeRational = 5;
  static const EncoderParameterValueType EncoderParameterValueTypeLongRange = 6;
  static const EncoderParameterValueType EncoderParameterValueTypeUndefined = 7;
  static const EncoderParameterValueType EncoderParameterValueTypeRationalRange = 8;
  static const EncoderParameterValueType EncoderParameterValueTypePointer = 9;
  typedef struct EncoderParameter {
    GUID Guid;
    ULONG NumberOfValues;
    EncoderParameterValueType Type;
    VOID* Value;
  } EncoderParameter;
  typedef struct EncoderParameters {
    UINT Count;
    EncoderParameter Parameter_1_;
  } EncoderParameters;
  typedef struct ABC {
    int abcA;
    UINT abcB;
    int abcC;
  } ABC;
  typedef ABC *LPABC; //Pointer
]]

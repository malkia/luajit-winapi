require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/shell' )
require( 'ffi/winapi/headers/gdi' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef HANDLE HANIMATIONBUFFER; //Alias
  typedef HANDLE HPAINTBUFFER; //Alias
  typedef LPVOID DTT_CALLBACK_PROC; //Alias
  typedef DWORD WINAPI_BPPF_Flags; //Alias
  typedef struct BP_PAINTPARAMS {
    DWORD cbSize;
    WINAPI_BPPF_Flags dwFlags;
    RECT* prcExclude;
    BLENDFUNCTION* pBlendFunction;
  } BP_PAINTPARAMS;
  typedef UINT BP_ANIMATIONSTYLE; //Alias
  static const BP_ANIMATIONSTYLE BPAS_NONE = 0;
  static const BP_ANIMATIONSTYLE BPAS_LINEAR = 1;
  static const BP_ANIMATIONSTYLE BPAS_CUBIC = 2;
  static const BP_ANIMATIONSTYLE BPAS_SINE = 3;
  typedef struct BP_ANIMATIONPARAMS {
    DWORD cbSize;
    DWORD dwFlags;
    BP_ANIMATIONSTYLE style;
    DWORD dwDuration;
  } BP_ANIMATIONPARAMS;
  typedef DWORD WINAPI_DTBG_Flags; //Alias
  typedef struct DTBGOPTS {
    DWORD dwSize;
    WINAPI_DTBG_Flags dwFlags;
    RECT rcClip;
  } DTBGOPTS;
  typedef DWORD WINAPI_DTT_Flags; //Alias
  typedef int TEXTSHADOWTYPE; //Alias
  static const TEXTSHADOWTYPE TST_NONE = 0;
  static const TEXTSHADOWTYPE TST_SINGLE = 1;
  static const TEXTSHADOWTYPE TST_CONTINUOUS = 2;
  typedef struct DTTOPTS {
    DWORD dwSize;
    WINAPI_DTT_Flags dwFlags;
    COLORREF crText;
    COLORREF crBorder;
    COLORREF crShadow;
    TEXTSHADOWTYPE iTextShadowType;
    POINT ptShadowOffset;
    int iBorderSize;
    int iFontPropId;
    int iColorPropId;
    int iStateId;
    BOOL fApplyOverlay;
    int iGlowSize;
    DTT_CALLBACK_PROC pfnDrawTextCallback;
    LPARAM lParam;
  } DTTOPTS;
  typedef UINT THEMESIZE; //Alias
  static const THEMESIZE TS_MIN = 0;
  static const THEMESIZE TS_TRUE = 1;
  static const THEMESIZE TS_DRAW = 2;
  typedef UINT PROPERTYORIGIN; //Alias
  static const PROPERTYORIGIN PO_STATE = 0;
  static const PROPERTYORIGIN PO_PART = 1;
  static const PROPERTYORIGIN PO_CLASS = 2;
  static const PROPERTYORIGIN PO_GLOBAL = 3;
  static const PROPERTYORIGIN PO_NOTFOUND = 4;
  typedef DWORD WINAPI_EnableThemeDialogTextureFlags; //Alias
  typedef DWORD WINAPI_HitTestThemeBackgroundOptions; //Alias
  typedef WORD WINAPI_HitTestReturnCode; //Alias
  static const WINAPI_HitTestReturnCode HTERROR = -2;
  static const WINAPI_HitTestReturnCode HTTRANSPARENT = -1;
  static const WINAPI_HitTestReturnCode HTNOWHERE = 0;
  static const WINAPI_HitTestReturnCode HTCLIENT = 1;
  static const WINAPI_HitTestReturnCode HTCAPTION = 2;
  static const WINAPI_HitTestReturnCode HTSYSMENU = 3;
  static const WINAPI_HitTestReturnCode HTGROWBOX = 4;
  static const WINAPI_HitTestReturnCode HTMENU = 5;
  static const WINAPI_HitTestReturnCode HTHSCROLL = 6;
  static const WINAPI_HitTestReturnCode HTVSCROLL = 7;
  static const WINAPI_HitTestReturnCode HTMINBUTTON = 8;
  static const WINAPI_HitTestReturnCode HTMAXBUTTON = 9;
  static const WINAPI_HitTestReturnCode HTLEFT = 10;
  static const WINAPI_HitTestReturnCode HTRIGHT = 11;
  static const WINAPI_HitTestReturnCode HTTOP = 12;
  static const WINAPI_HitTestReturnCode HTTOPLEFT = 13;
  static const WINAPI_HitTestReturnCode HTTOPRIGHT = 14;
  static const WINAPI_HitTestReturnCode HTBOTTOM = 15;
  static const WINAPI_HitTestReturnCode HTBOTTOMLEFT = 16;
  static const WINAPI_HitTestReturnCode HTBOTTOMRIGHT = 17;
  static const WINAPI_HitTestReturnCode HTBORDER = 18;
  static const WINAPI_HitTestReturnCode HTOBJECT = 19;
  static const WINAPI_HitTestReturnCode HTCLOSE = 20;
  static const WINAPI_HitTestReturnCode HTHELP = 21;
  typedef DWORD WINAPI_DrawThemeParentBackgroundFlags; //Alias
  typedef DWORD BP_BUFFERFORMAT; //Alias
  static const BP_BUFFERFORMAT BPBF_COMPATIBLEBITMAP = 0;
  static const BP_BUFFERFORMAT BPBF_DIB = 1;
  static const BP_BUFFERFORMAT BPBF_TOPDOWNDIB = 2;
  static const BP_BUFFERFORMAT BPBF_TOPDOWNMONODIB = 3;
  typedef DWORD WINDOWTHEMEATTRIBUTETYPE; //Alias
  static const WINDOWTHEMEATTRIBUTETYPE WTA_NONCLIENT = 1;
  HANIMATIONBUFFER BeginBufferedAnimation(                HWND hwnd, HDC hdcTarget, const RECT* rcTarget, BP_BUFFERFORMAT dwFormat, BP_PAINTPARAMS* pPaintParams, BP_ANIMATIONPARAMS* pAnimationParams, HDC* phdcFrom, HDC* phdcTo);
  HPAINTBUFFER     BeginBufferedPaint(                    HDC hdcTarget, const RECT* prcTarget, BP_BUFFERFORMAT dwFormat, BP_PAINTPARAMS* pPaintParams, HDC* phdc);
  HRESULT          BufferedPaintClear(                    HPAINTBUFFER hBufferedPaint, const RECT* prc);
  HRESULT          BufferedPaintInit(                     );
  BOOL             BufferedPaintRenderAnimation(          HWND hwnd, HDC hdcTarget);
  HRESULT          BufferedPaintSetAlpha(                 HPAINTBUFFER hBufferedPaint, const RECT* prc, BYTE alpha);
  HRESULT          BufferedPaintStopAllAnimations(        HWND hwnd);
  HRESULT          BufferedPaintUnInit(                   );
  HRESULT          CloseThemeData(                        HTHEME hTheme);
  HRESULT          DrawThemeBackground(                   HTHEME hTheme, HDC hdc, int iPartId, int iStateId, const RECT* pRect, const RECT* pClipRect);
  HRESULT          DrawThemeBackgroundEx(                 HTHEME hTheme, HDC hdc, int iPartId, int iStateId, const RECT* pRect, const DTBGOPTS* pOptions);
  HRESULT          DrawThemeEdge(                         HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCRECT pDestRect, WINAPI_BorderEdge uEdge, WINAPI_BorderFlag uFlags, LPRECT pContentRect);
  HRESULT          DrawThemeIcon(                         HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCRECT pRect, HIMAGELIST himl, int iImageIndex);
  HRESULT          DrawThemeParentBackground(             HWND hwnd, HDC hdc, const RECT* prc);
  HRESULT          DrawThemeParentBackgroundEx(           HWND hwnd, HDC hdc, WINAPI_DrawThemeParentBackgroundFlags dwFlags, const RECT* prc);
  HRESULT          DrawThemeText(                         HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCWSTR pszText, int iCharCount, WINAPI_DrawTextFlags dwTextFlags, DWORD dwTextFlags2, LPCRECT pRect);
  HRESULT          DrawThemeTextEx(                       HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCWSTR pszText, int iCharCount, WINAPI_DrawTextFlags dwFlags, LPRECT pRect, const DTTOPTS* pOptions);
  HRESULT          EnableThemeDialogTexture(              HWND hwnd, WINAPI_EnableThemeDialogTextureFlags dwFlags);
  HRESULT          EnableTheming(                         BOOL fEnable);
  HRESULT          EndBufferedAnimation(                  HANIMATIONBUFFER hbpAnimation, BOOL fUpdateTarget);
  HRESULT          EndBufferedPaint(                      HPAINTBUFFER hBufferedPaint, BOOL fUpdateTarget);
  HRESULT          GetBufferedPaintBits(                  HPAINTBUFFER hBufferedPaint, RGBQUAD** ppbBuffer, int* pcxRow);
  HDC              GetBufferedPaintDC(                    HPAINTBUFFER hBufferedPaint);
  HDC              GetBufferedPaintTargetDC(              HPAINTBUFFER hBufferedPaint);
  HRESULT          GetBufferedPaintTargetRect(            HPAINTBUFFER hBufferedPaint, RECT* prc);
  HRESULT          GetCurrentThemeName(                   LPWSTR pszThemeFileName, int dwMaxNameChars, LPWSTR pszColorBuff, int cchMaxColorChars, LPWSTR pszSizeBuff, int cchMaxSizeChars);
  DWORD            GetThemeAppProperties(                 );
  HRESULT          GetThemeBackgroundContentRect(         HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCRECT pBoundingRect, LPRECT pContentRect);
  HRESULT          GetThemeBackgroundExtent(              HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCRECT pContentRect, LPRECT pExtentRect);
  HRESULT          GetThemeBackgroundRegion(              HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCRECT pRect, HRGN* pRegion);
  HRESULT          GetThemeBitmap(                        HTHEME hTheme, int iPartId, int iStateId, int iPropId, ULONG dwFlags, HBITMAP* phBitmap);
  HRESULT          GetThemeBool(                          HTHEME hTheme, int iPartId, int iStateId, int iPropId, BOOL* pfVal);
  HRESULT          GetThemeColor(                         HTHEME hTheme, int iPartId, int iStateId, int iPropId, COLORREF* pColor);
  HRESULT          GetThemeDocumentationProperty(         LPCWSTR pszThemeName, LPCWSTR pszPropertyName, LPWSTR pszValueBuff, int cchMaxValChars);
  HRESULT          GetThemeEnumValue(                     HTHEME hTheme, int iPartId, int iStateId, int iPropId, int* piVal);
  HRESULT          GetThemeFilename(                      HTHEME hTheme, int iPartId, int iStateId, int iPropId, LPWSTR pszThemeFilename, int cchMaxBuffChars);
  HRESULT          GetThemeFont(                          HTHEME hTheme, HDC hdc, int iPartId, int iStateId, int iPropId, LOGFONTW* pFont);
  HRESULT          GetThemeInt(                           HTHEME hTheme, int iPartId, int iStateId, int iPropId, int* piVal);
  HRESULT          GetThemeIntList(                       HTHEME hTheme, int iPartId, int iStateId, int iPropId, INTLIST* pIntList);
  HRESULT          GetThemeMargins(                       HTHEME hTheme, HDC hdc, int iPartId, int iStateId, int iPropId, LPRECT prc, MARGINS* pMargins);
  HRESULT          GetThemeMetric(                        HTHEME hTheme, HDC hdc, int iPartId, int iStateId, int iPropId, int* piVal);
  HRESULT          GetThemePartSize(                      HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCRECT prc, THEMESIZE eSize, SIZE* psz);
  HRESULT          GetThemePosition(                      HTHEME hTheme, int iPartId, int iStateId, int iPropId, POINT* pPoint);
  HRESULT          GetThemePropertyOrigin(                HTHEME hTheme, int iPartId, int iStateId, int iPropId, PROPERTYORIGIN* pOrigin);
  HRESULT          GetThemeRect(                          HTHEME hTheme, int iPartId, int iStateId, int iPropId, LPRECT pRect);
  HRESULT          GetThemeStream(                        HTHEME hTheme, int iPartId, int iStateId, int iPropId, VOID** ppvStream, DWORD* pcbStream, HINSTANCE hInst);
  HRESULT          GetThemeString(                        HTHEME hTheme, int iPartId, int iStateId, int iPropId, LPWSTR pszBuff, int cchMaxBuffChars);
  BOOL             GetThemeSysBool(                       HTHEME hTheme, int iBoolID);
  COLORREF         GetThemeSysColor(                      HTHEME hTheme, WINAPI_SysColorIndex iColorID);
  HBRUSH           GetThemeSysColorBrush(                 HTHEME hTheme, int iColorID);
  HRESULT          GetThemeSysFont(                       HTHEME hTheme, int iFontID, LOGFONTW* plf);
  HRESULT          GetThemeSysInt(                        HTHEME hTheme, int iIntID, int* piValue);
  int              GetThemeSysSize(                       HTHEME hTheme, int iSizeID);
  HRESULT          GetThemeSysString(                     HTHEME hTheme, int iStringID, LPWSTR pszStringBuff, int cchMaxStringChars);
  HRESULT          GetThemeTextExtent(                    HTHEME hTheme, HDC hdc, int iPartId, int iStateId, LPCWSTR pszText, int iCharCount, WINAPI_DrawTextFlags dwTextFlags, LPCRECT pBoundingRect, LPRECT pExtentRect);
  HRESULT          GetThemeTextMetrics(                   HTHEME hTheme, HDC hdc, int iPartId, int iStateId, TEXTMETRIC* ptm);
  HRESULT          GetThemeTransitionDuration(            HTHEME hTheme, int iPartId, int iStateIdFrom, int iStateIdTo, int iPropId, DWORD* pdwDuration);
  HTHEME           GetWindowTheme(                        HWND hWnd);
  HRESULT          HitTestThemeBackground(                HTHEME hTheme, HDC hdc, int iPartId, int iStateId, WINAPI_HitTestThemeBackgroundOptions dwOptions, LPCRECT pRect, HRGN hrgn, POINT ptTest, WINAPI_HitTestReturnCode* pwHitTestCode);
  BOOL             IsAppThemed(                           );
  BOOL             IsCompositionActive(                   );
  BOOL             IsThemeActive(                         );
  BOOL             IsThemeBackgroundPartiallyTransparent( HTHEME hTheme, int iPartId, int iStateId);
  BOOL             IsThemeDialogTextureEnabled(           HWND hwnd);
  BOOL             IsThemePartDefined(                    HTHEME hTheme, int iPartId, int iStateId);
  HTHEME           OpenThemeData(                         HWND hwnd, LPCWSTR pszClassList);
  HTHEME           OpenThemeDataEx(                       HWND hwnd, LPCWSTR pszClassIdList, DWORD dwFlags);
  void             SetThemeAppProperties(                 DWORD dwFlags);
  HRESULT          SetWindowTheme(                        HWND hwnd, LPCWSTR pszSubAppName, LPCWSTR pszSubIdList);
  HRESULT          SetWindowThemeAttribute(               HWND hwnd, WINDOWTHEMEATTRIBUTETYPE eAttribute, PVOID pvAttribute, DWORD cbAttribute);
  BOOL             BeginPanningFeedback(                  HWND hwnd);
  BOOL             EndPanningFeedback(                    HWND hwnd, BOOL fAnimateBack);
  BOOL             UpdatePanningFeedback(                 HWND hwnd, LONG lTotalOverpanOffsetX, LONG lTotalOverpanOffsetY, BOOL fInInertia);
]]
return ffi.load( 'UxTheme.dll' )

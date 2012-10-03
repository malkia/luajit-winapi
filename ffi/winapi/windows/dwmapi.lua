require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/gdi' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef ULONGLONG DWM_FRAME_COUNT; //Alias
  typedef ULONGLONG QPC_TIME; //Alias
  typedef HANDLE HTHUMBNAIL; //Alias
  typedef HTHUMBNAIL *PHTHUMBNAIL; //Pointer
  typedef DWORD WINAPI_DWM_BLURBEHIND_Flags; //Alias
# pragma pack( push, 1 )
  typedef struct DWM_BLURBEHIND {
    WINAPI_DWM_BLURBEHIND_Flags dwFlags;
    BOOL fEnable;
    HRGN hRgnBlur;
    BOOL fTransitionOnMaximized;
  } DWM_BLURBEHIND;
# pragma pack( pop )
# pragma pack( push, 1 )
  typedef struct UNSIGNED_RATIO {
    UINT32 uiNumerator;
    UINT32 uiDenominator;
  } UNSIGNED_RATIO;
# pragma pack( pop )
# pragma pack( push, 1 )
  typedef struct DWM_TIMING_INFO {
    UINT32 cbSize;
    UNSIGNED_RATIO rateRefresh;
    QPC_TIME qpcRefreshPeriod;
    UNSIGNED_RATIO rateCompose;
    QPC_TIME qpcVBlank;
    DWM_FRAME_COUNT cRefresh;
    UINT cDXRefresh;
    QPC_TIME qpcCompose;
    DWM_FRAME_COUNT cFrame;
    UINT cDXPresent;
    DWM_FRAME_COUNT cRefreshFrame;
    DWM_FRAME_COUNT cFrameSubmitted;
    UINT cDXPresentSubmitted;
    DWM_FRAME_COUNT cFrameConfirmed;
    UINT cDXPresentConfirmed;
    DWM_FRAME_COUNT cRefreshConfirmed;
    UINT cDXRefreshConfirmed;
    DWM_FRAME_COUNT cFramesLate;
    UINT cFramesOutstanding;
    DWM_FRAME_COUNT cFrameDisplayed;
    QPC_TIME qpcFrameDisplayed;
    DWM_FRAME_COUNT cRefreshFrameDisplayed;
    DWM_FRAME_COUNT cFrameComplete;
    QPC_TIME qpcFrameComplete;
    DWM_FRAME_COUNT cFramePending;
    QPC_TIME qpcFramePending;
    DWM_FRAME_COUNT cFramesDisplayed;
    DWM_FRAME_COUNT cFramesComplete;
    DWM_FRAME_COUNT cFramesPending;
    DWM_FRAME_COUNT cFramesAvailable;
    DWM_FRAME_COUNT cFramesDropped;
    DWM_FRAME_COUNT cFramesMissed;
    DWM_FRAME_COUNT cRefreshNextDisplayed;
    DWM_FRAME_COUNT cRefreshNextPresented;
    DWM_FRAME_COUNT cRefreshesDisplayed;
    DWM_FRAME_COUNT cRefreshesPresented;
    DWM_FRAME_COUNT cRefreshStarted;
    ULONGLONG cPixelsReceived;
    ULONGLONG cPixelsDrawn;
    DWM_FRAME_COUNT cBuffersEmpty;
  } DWM_TIMING_INFO;
# pragma pack( pop )
# pragma pack( push, 1 )
  typedef struct MilMatrix3x2D {
    DOUBLE S_11;
    DOUBLE S_12;
    DOUBLE S_21;
    DOUBLE S_22;
    DOUBLE DX;
    DOUBLE DY;
  } MilMatrix3x2D;
# pragma pack( pop )
  typedef UINT DWM_SOURCE_FRAME_SAMPLING; //Alias
  static const UINT DWM_SOURCE_FRAME_SAMPLING_POINT = 0;
  static const UINT DWM_SOURCE_FRAME_SAMPLING_COVERAGE = 1;
# pragma pack( push, 1 )
  typedef struct DWM_PRESENT_PARAMETERS {
    UINT32 cbSize;
    BOOL fQueue;
    DWM_FRAME_COUNT cRefreshStart;
    UINT cBuffer;
    BOOL fUseSourceRate;
    UNSIGNED_RATIO rateSource;
    UINT cRefreshesPerFrame;
    DWM_SOURCE_FRAME_SAMPLING eSampling;
  } DWM_PRESENT_PARAMETERS;
# pragma pack( pop )
  typedef DWORD WINAPI_DWM_TNP; //Alias
# pragma pack( push, 1 )
  typedef struct DWM_THUMBNAIL_PROPERTIES {
    WINAPI_DWM_TNP dwFlags;
    RECT rcDestination;
    RECT rcSource;
    BYTE opacity;
    BOOL fVisible;
    BOOL fSourceClientAreaOnly;
  } DWM_THUMBNAIL_PROPERTIES;
# pragma pack( pop )
  HRESULT DwmAttachMilContent(               HWND hwnd);
  BOOL    DwmDefWindowProc(                  HWND hwnd, WINAPI_WinMsg msg, WPARAM wParam, LPARAM lParam, LRESULT* plResult);
  HRESULT DwmDetachMilContent(               HWND hwnd);
  HRESULT DwmEnableBlurBehindWindow(         HWND hWnd, WINAPI_DWM_BLURBEHIND* pBlurBehind);
  HRESULT DwmEnableComposition(              UINT uCompositionAction);
  HRESULT DwmEnableMMCSS(                    BOOL fEnableMMCSS);
  HRESULT DwmExtendFrameIntoClientArea(      HWND hWnd, WINAPI_MARGINS* pMarInset);
  HRESULT DwmFlush(                          );
  HRESULT DwmGetColorizationColor(           DWORD* pcrColorization, BOOL* pfOpaqueBlend);
  HRESULT DwmGetCompositionTimingInfo(       HWND hwnd, DWM_TIMING_INFO* pTimingInfo);
  HRESULT DwmGetGraphicsStreamClient(        UINT uIndex, UUID* pClientUuid);
  HRESULT DwmGetGraphicsStreamTransformHint( UINT uIndex, MilMatrix3x2D* pTransform);
  HRESULT DwmGetTransportAttributes(         BOOL* pfIsRemoting, BOOL* pfIsConnected, DWORD* pDwGeneration);
  HRESULT DwmGetWindowAttribute(             HWND hwnd, WINAPI_DwmWindowAttr dwAttribute, PVOID pvAttribute, DWORD cbAttribute);
  HRESULT DwmInvalidateIconicBitmaps(        HWND hwnd);
  HRESULT DwmIsCompositionEnabled(           BOOL* pfEnabled);
  HRESULT DwmModifyPreviousDxFrameDuration(  HWND hwnd, INT cRefreshes, BOOL fRelative);
  HRESULT DwmQueryThumbnailSourceSize(       HTHUMBNAIL hThumbnail, PSIZE pSize);
  HRESULT DwmSetDxFrameDuration(             HWND hwnd, INT cRefreshes);
  HRESULT DwmSetIconicLivePreviewBitmap(     HWND hwnd, HBITMAP hbmp, POINT* pptClient, DWORD dwSITFlags);
  HRESULT DwmSetIconicThumbnail(             HWND hwnd, HBITMAP hbmp, DWORD dwSITFlags);
  HRESULT DwmSetPresentParameters(           HWND hwnd, DWM_PRESENT_PARAMETERS* pPresentParams);
  HRESULT DwmSetWindowAttribute(             HWND hwnd, WINAPI_DwmWindowAttr dwAttribute, LPCVOID pvAttribute, DWORD cbAttribute);
  HRESULT DwmUnregisterThumbnail(            HTHUMBNAIL hThumbnailId);
  HRESULT DwmRegisterThumbnail(              HWND hwndDestination, HWND* hwndSource, PHTHUMBNAIL phThumbnailId);
  HRESULT DwmUpdateThumbnailProperties(      HTHUMBNAIL hThumbnailId, WINAPI_DWM_THUMBNAIL_PROPERTIES* ptnProperties);
]]
return ffi.load( 'dwmapi.dll' )

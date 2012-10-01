require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/gdi" )
local ffi = require( "ffi" )
ffi.cdef [[
  HRESULT DwmAttachMilContent(               HWND hwnd);
  BOOL    DwmDefWindowProc(                  HWND hwnd, WINAPI_WinMsg msg, WPARAM wParam, LPARAM lParam, LRESULT* plResult);
  HRESULT DwmDetachMilContent(               HWND hwnd);
  HRESULT DwmEnableBlurBehindWindow(         HWND hWnd, DWM_BLURBEHIND* pBlurBehind);
  HRESULT DwmEnableComposition(              UINT uCompositionAction);
  HRESULT DwmEnableMMCSS(                    BOOL fEnableMMCSS);
  HRESULT DwmExtendFrameIntoClientArea(      HWND hWnd, MARGINS* pMarInset);
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
  HRESULT DwmUpdateThumbnailProperties(      HTHUMBNAIL hThumbnailId, DWM_THUMBNAIL_PROPERTIES* ptnProperties);
]]
return ffi.load( "dwmapi.dll" )

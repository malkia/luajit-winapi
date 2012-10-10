require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/gdi' )
require( 'ffi/winapi/headers/registry' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID HDPA; //Alias
  typedef HDPA HDPA; //Alias
  typedef LPVOID SUBCLASSPROC; //Alias
  typedef LPVOID PFNDPAENUMCALLBACK; //Alias
  typedef LPVOID PFNDPASTREAM; //Alias
  typedef LPVOID PFNDPACOMPARE; //Alias
  typedef LPVOID PFNDPAMERGE; //Alias
  typedef LPVOID HDSA; //Alias
  typedef LPVOID PFNDSAENUMCALLBACK; //Alias
  typedef LPVOID PFNDAENUMCALLBACK; //Alias
  typedef LPVOID PFNDACOMPARE; //Alias
  typedef LPVOID PFTASKDIALOGCALLBACK; //Alias
  typedef LPVOID PFNREADERSCROLL; //Alias
  typedef LPVOID PFNREADERTRANSLATEDISPATCH; //Alias
]]
if ffi.arch == 'x86' then ffi.cdef[[
  typedef struct TBBUTTON {
    int iBitmap;
    int idCommand;
    BYTE fsState;
    BYTE fsStyle;
    BYTE bReserved_2_;
    DWORD_PTR dwData;
    INT_PTR iString;
  } TBBUTTON;
]]
end
ffi.cdef[[
]]
if ffi.arch == 'x64' then ffi.cdef[[
  typedef struct TBBUTTON {
    int iBitmap;
    int idCommand;
    BYTE fsState;
    BYTE fsStyle;
    BYTE bReserved_6_;
    DWORD_PTR dwData;
    INT_PTR iString;
  } TBBUTTON;
]]
end
ffi.cdef[[
  typedef TBBUTTON *LPCTBBUTTON; //Pointer
  typedef DWORD ReaderModeFlag; //Alias
  typedef struct READERMODEINFO {
    UINT cbSize;
    HWND hwnd;
    ReaderModeFlag fFlags;
    LPRECT prc;
    PFNREADERSCROLL pfnScroll;
    PFNREADERTRANSLATEDISPATCH pfnTranslatedDispatch;
    LPARAM lParam;
  } READERMODEINFO;
  typedef READERMODEINFO *PREADERMODEINFO; //Pointer
  typedef UINT TASKDIALOG_COMMON_BUTTON_FLAGS; //Alias
  typedef UINT ILD_Flags; //Alias
  typedef UINT ILC_Flags; //Alias
  typedef UINT WSB_Prop; //Alias
  static const WSB_Prop WSB_PROP_CYVSCROLL = 0x00000001;
  static const WSB_Prop WSB_PROP_CXHSCROLL = 0x00000002;
  static const WSB_Prop WSB_PROP_CYHSCROLL = 0x00000004;
  static const WSB_Prop WSB_PROP_CXVSCROLL = 0x00000008;
  static const WSB_Prop WSB_PROP_CXHTHUMB = 0x00000010;
  static const WSB_Prop WSB_PROP_CYVTHUMB = 0x00000020;
  static const WSB_Prop WSB_PROP_VBKGCOLOR = 0x00000040;
  static const WSB_Prop WSB_PROP_HBKGCOLOR = 0x00000080;
  static const WSB_Prop WSB_PROP_VSTYLE = 0x00000100;
  static const WSB_Prop WSB_PROP_HSTYLE = 0x00000200;
  static const WSB_Prop WSB_PROP_WINSTYLE = 0x00000400;
  static const WSB_Prop WSB_PROP_PALETTE = 0x00000800;
  static const WSB_Prop WSB_PROP_MASK = 0x00000FFF;
  typedef DWORD ILP_Flags; //Alias
  static const ILP_Flags ILP_NORMAL = 0;
  static const ILP_Flags ILP_DOWNLEVEL = 1;
  typedef DWORD TBStyle; //Alias
  typedef DWORD UDStyle; //Alias
  typedef UINT MruFlags; //Alias
  typedef LPVOID MRUCMPPROC; //Alias
  typedef struct MRUINFO {
    DWORD cbSize;
    UINT uMax;
    MruFlags fFlags;
    HKEY hKey;
    LPCWSTR lpszSubKey;
    MRUCMPPROC lpfnCompare;
  } MRUINFO;
  typedef MRUINFO *LPMRUINFO; //Pointer
  typedef struct COLORMAP {
    COLORREF from;
    COLORREF to;
  } COLORMAP;
  typedef COLORMAP *LPCOLORMAP; //Pointer
  typedef DWORD IccFlags; //Alias
  typedef struct INITCOMMONCONTROLSEX {
    DWORD dwSize;
    IccFlags dwICC;
  } INITCOMMONCONTROLSEX;
  typedef INITCOMMONCONTROLSEX *LPINITCOMMONCONTROLSEX; //Pointer
  typedef struct IMAGELISTDRAWPARAMS {
    DWORD cbSize;
    HIMAGELIST himl;
    int i;
    HDC hdcDst;
    int x;
    int y;
    int cx;
    int cy;
    int xBitmap;
    int yBitmap;
    COLORREF rgbBk;
    COLORREF rgbFg;
    UINT fStyle;
    DWORD dwRop;
    DWORD fState;
    DWORD Frame;
    COLORREF crEffect;
  } IMAGELISTDRAWPARAMS;
  typedef struct IMAGEINFO {
    HBITMAP hbmImage;
    HBITMAP hbmMask;
    int Unused1;
    int Unused2;
    RECT rcImage;
  } IMAGEINFO;
  typedef UINT TASKDIALOG_FLAGS; //Alias
# pragma pack( push, 1 )
  typedef struct TASKDIALOG_BUTTON {
    int nButtonID;
    PCWSTR pszButtonText;
  } TASKDIALOG_BUTTON;
# pragma pack( pop )
  typedef union TASKDIALOGCONFIG_u1 {
    HICON hMainIcon;
    PCWSTR pszMainIcon;
  } TASKDIALOGCONFIG_u1;
  typedef union TASKDIALOGCONFIG_u2 {
    HICON hFooterIcon;
    PCWSTR pszFooterIcon;
  } TASKDIALOGCONFIG_u2;
# pragma pack( push, 1 )
  typedef struct TASKDIALOGCONFIG {
    UINT cbSize;
    HWND hwndParent;
    HINSTANCE hInstance;
    TASKDIALOG_FLAGS dwFlags;
    TASKDIALOG_COMMON_BUTTON_FLAGS dwCommonButtons;
    PCWSTR pszWindowTitle;
    TASKDIALOGCONFIG_u1 ;
    PCWSTR pszMainInstruction;
    PCWSTR pszContent;
    UINT cButtons;
    TASKDIALOG_BUTTON* pButtons;
    int nDefaultButton;
    UINT cRadioButtons;
    TASKDIALOG_BUTTON* pRadioButtons;
    int nDefaultRadioButton;
    PCWSTR pszVerificationText;
    PCWSTR pszExpandedInformation;
    PCWSTR pszExpandedControlText;
    PCWSTR pszCollapsedControlText;
    TASKDIALOGCONFIG_u2 ;
    PCWSTR pszFooter;
    PFTASKDIALOGCALLBACK pfCallback;
    LONG_PTR lpCallbackData;
    UINT cxWidth;
  } TASKDIALOGCONFIG;
# pragma pack( pop )
  BOOL           _TrackMouseEvent(             LPTRACKMOUSEEVENT lpEventTrack);
  int            AddMRUStringW(                HANDLE hMRU, LPCTSTR szString);
  int            CreateMRUListW(               LPMRUINFO lpmi);
  LRESULT        DefSubclassProc(              HWND hWnd, WinMsg uMsg, WPARAM WPARAM, LPARAM LPARAM);
  int            EnumMRUListW(                 HANDLE hMRU, int nItem, void* lpData, UINT uLen);
  int            FreeMRUList(                  HANDLE hMRU);
  BOOL           GetWindowSubclass(            HWND hWnd, SUBCLASSPROC pfnSubclass, UINT_PTR uIdSubclass, DWORD_PTR* pdwRefData);
  BOOL           RemoveWindowSubclass(         HWND hWnd, SUBCLASSPROC pfnSubclass, UINT_PTR uIdSubclass);
  BOOL           SetWindowSubclass(            HWND hWnd, SUBCLASSPROC pfnSubclass, UINT_PTR uIdSubclass, DWORD_PTR dwRefData);
  HBITMAP        CreateMappedBitmap(           HINSTANCE hInstance, INT_PTR idBitmap, UINT wFlags, LPCOLORMAP lpColorMap, int iNumMaps);
  HWND           CreateToolbarEx(              HWND hwnd, TBStyle ws, UINT wID, int nBitmaps, HINSTANCE hBMInst, UINT_PTR wBMID, LPCTBBUTTON lpButtons, int iNumButtons, int dxButton, int dyButton, int dxBitmap, int dyBitmap, UINT uStructSize);
  HPROPSHEETPAGE CreatePropertySheetPage(      LPCPROPSHEETPAGE lppsp);
  BOOL           DestroyPropertySheetPage(     HPROPSHEETPAGE hPSPage);
  INT_PTR        PropertySheet(                LPCPROPSHEETHEADER lppsph);
  HWND           CreateStatusWindow(           LONG style, LPCTSTR lpszText, HWND hwndParent, UINT wID);
  void           DrawStatusText(               HDC hdc, LPCRECT lprc, LPCTSTR pszText, UINT uFlags);
  void           MenuHelp(                     WinMsg uMsg, WPARAM wParam, LPARAM lParam, HMENU hMainMenu, HINSTANCE hInst, HWND hwndStatus, LPUINT lpwIDs);
  HWND           CreateUpDownControl(          UDStyle dwStyle, int x, int y, int cx, int cy, HWND hParent, int nID, HINSTANCE hInst, HWND hBuddy, int nUpper, int nLower, int nPos);
  void           DoReaderMode(                 PREADERMODEINFO prmi);
  HDPA           DPA_Clone(                    HDPA hdpaSource, HDPA hdpaNew);
  HDPA           DPA_Create(                   int cpGrow);
  HDPA           DPA_CreateEx(                 int cpGrow, HANDLE hheap);
  BOOL           DPA_DeleteAllPtrs(            HDPA pdpa);
  void*          DPA_DeletePtr(                HDPA pdpa, int index);
  BOOL           DPA_Destroy(                  HDPA pdpa);
  void           DPA_DestroyCallback(          HDPA pdpa, PFNDPAENUMCALLBACK pfnCB, void* pData);
  void           DPA_EnumCallback(             HDPA pdpa, PFNDPAENUMCALLBACK pfnCB, void* pData);
  void*          DPA_GetPtr(                   HDPA pdpa, int index);
  int            DPA_GetPtrIndex(              HDPA hdpa, void* pvoid);
  ULONGLONG      DPA_GetSize(                  HDPA pdpa);
  BOOL           DPA_Grow(                     HDPA hdpa, int cp);
  int            DPA_InsertPtr(                HDPA pdpa, int index, void* p);
  HRESULT        DPA_LoadStream(               HDPA* ppdpa, PFNDPASTREAM pfn, IStream* pstm, void* pvInstData);
  BOOL           DPA_Merge(                    HDPA hdpaDest, HDPA hdpaSrc, DWORD dwFlags, PFNDPACOMPARE pfnCompare, PFNDPAMERGE pfnMerge, LPARAM lParam);
  HRESULT        DPA_SaveStream(               HDPA pdpa, PFNDPASTREAM pfn, IStream* pstm, void* pvInstData);
  int            DPA_Search(                   HDPA pdpa, void* pFind, int iStart, PFNDPACOMPARE pfnCmp, LPARAM lParam, UINT options);
  BOOL           DPA_SetPtr(                   HDPA pdpa, int index, void* p);
  BOOL           DPA_Sort(                     HDPA pdpa, PFNDPACOMPARE pfnCmp, LPARAM lParam);
  int            DrawShadowText(               HDC hdc, LPCWSTR pszText, UINT cch, RECT* pRect, DWORD dwFlags, COLORREF crText, COLORREF crShadow, int ixOffset, int iyOffset);
  int            DrawTextExPrivWrap(           HDC hdc, LPTSTR lpchText, int cchText, LPRECT lprc, UINT dwDTFormat, LPDRAWTEXTPARAMS lpDTParams);
  int            DrawTextWrap(                 HDC hdc, LPCTSTR lpString, int nCount, LPRECT lpRect, UINT uFormat, LPDRAWTEXTPARAMS lpDTParams);
  HDSA           DSA_Clone(                    HDSA hdsa);
  HDSA           DSA_Create(                   int cbItem, int cbItemGrow);
  BOOL           DSA_DeleteAllItems(           HDSA hdsa);
  BOOL           DSA_DeleteItem(               HDSA hdsa, int nPosition);
  BOOL           DSA_Destroy(                  HDSA pdsa);
  void           DSA_DestroyCallback(          HDSA pdsa, PFNDSAENUMCALLBACK pfnCB, void* pData);
  void           DSA_EnumCallback(             HDSA hdsa, PFNDAENUMCALLBACK* pfnCB, void* pData);
  BOOL           DSA_GetItem(                  HDSA pdsa, int index, void* pitem);
  void*          DSA_GetItemPtr(               HDSA pdsa, int index);
  ULONGLONG      DSA_GetSize(                  HDSA hdsa);
  int            DSA_InsertItem(               HDSA pdsa, int index, void* pItem);
  BOOL           DSA_SetItem(                  HDSA hdsa, int index, void* pItem);
  BOOL           DSA_Sort(                     HDSA pdsa, PFNDACOMPARE pfnCompare, LPARAM lParam);
  BOOL           ExtTextOutWrap(               HDC hdc, int X, int Y, UINT uOptions, RECT* lprc, LPCTSTR lpString, UINT cbCount, INT* lpDx);
  void           GetEffectiveClientRect(       HWND hWnd, LPRECT lprc, INT* lpInfo);
  LANGID         GetMUILanguage(               );
  BOOL           GetTextExtentPoint32Wrap(     HDC hdc, LPCTSTR lpString, UINT cbCount, LPSIZE lpSize);
  void           InitCommonControls(           );
  BOOL           InitCommonControlsEx(         LPINITCOMMONCONTROLSEX lpInitCtrls);
  VOID           InitMUILanguage(              LANGID uiLang);
  HRESULT        LoadIconMetric(               HINSTANCE hinst, PCWSTR pszName, int lims, HICON* phico);
  HRESULT        LoadIconWithScaleDown(        HINSTANCE hinst, PCWSTR pszName, int cx, int cy, HICON* phico);
  BOOL           MirrorIcon(                   HICON* phIconSmall, HICON* phIconLarge);
  BOOL           ShowHideMenuCtl(              HWND hWnd, UINT_PTR uFlags, LPINT lpInfo);
  int            Str_GetPtr(                   LPCTSTR pszSource, LPCSTR pszDest, int cchDest);
  BOOL           Str_SetPtr(                   LPTSTR* ppszCurrent, LPCTSTR pszNew);
  void           DrawInsert(                   HWND handParent, HWND hLB, int nItem);
  int            LBItemFromPt(                 HWND hLB, POINT pt, BOOL bAutoScroll);
  BOOL           MakeDragList(                 HWND hLB);
  BOOL           FlatSB_EnableScrollBar(       HWND hwnd, int wSBflags, UINT wArrows);
  BOOL           FlatSB_GetScrollInfo(         HWND hwnd, SBType fnBar, LPSCROLLINFO lpsi);
  int            FlatSB_GetScrollPos(          HWND hwnd, SBType code);
  BOOL           FlatSB_GetScrollProp(         HWND hwnd, WSB_Prop index, LPINT pValue);
  BOOL           FlatSB_GetScrollPropPtr(      HWND hwnd, WSB_Prop index, LPINT pValue);
  BOOL           FlatSB_GetScrollRange(        HWND hwnd, int code, LPINT lpMinPos, LPINT lpMaxPos);
  int            FlatSB_SetScrollInfo(         HWND hwnd, SBType fnBar, LPSCROLLINFO lpsi, BOOL fRedraw);
  int            FlatSB_SetScrollPos(          HWND hwnd, int code, int nPos, BOOL fRedraw);
  BOOL           FlatSB_SetScrollProp(         HWND hwnd, WSB_Prop index, INT_PTR newValue, BOOL fRedraw);
  int            FlatSB_SetScrollRange(        HWND hwnd, int code, int nMinPos, int nMaxPos, BOOL fRedraw);
  BOOL           FlatSB_ShowScrollBar(         HWND hwnd, int code, BOOL fShow);
  BOOL           InitializeFlatSB(             HWND hwnd);
  HRESULT        UninitializeFlatSB(           HWND hwnd);
  HRESULT        HIMAGELIST_QueryInterface(    HIMAGELIST himl, REFIID riid, void** ppv);
  int            ImageList_Add(                HIMAGELIST himl, HBITMAP hbmImage, HBITMAP hbmMask);
  int            ImageList_AddMasked(          HIMAGELIST himl, HBITMAP hbmImage, COLORREF crMask);
  BOOL           ImageList_BeginDrag(          HIMAGELIST himlTrack, int iTrack, int dxHotspot, int dyHotspot);
  HRESULT        ImageList_CoCreateInstance(   REFCLSID rclsid, IUnknown* punkOuter, REFIID riid, void** ppv);
  BOOL           ImageList_Copy(               HIMAGELIST himlDst, int iDst, HIMAGELIST himlSrc, int iSrc, UINT uFlags);
  HIMAGELIST     ImageList_Create(             int cx, int cy, ILC_Flags flags, int cInitial, int cGrow);
  BOOL           ImageList_Destroy(            HIMAGELIST himl);
  BOOL           ImageList_DragEnter(          HWND hwndLock, int x, int y);
  BOOL           ImageList_DragLeave(          HWND hwndLock);
  BOOL           ImageList_DragMove(           int x, int y);
  BOOL           ImageList_DragShowNolock(     BOOL fShow);
  BOOL           ImageList_Draw(               HIMAGELIST himl, int i, HDC hdcDst, int x, int y, ILD_Flags fStyle);
  BOOL           ImageList_DrawEx(             HIMAGELIST himl, int i, HDC hdcDst, int x, int y, int dx, int dy, COLORREF rgbBk, COLORREF rgbFg, ILD_Flags fStyle);
  BOOL           ImageList_DrawIndirect(       IMAGELISTDRAWPARAMS* pimldp);
  HIMAGELIST     ImageList_Duplicate(          HIMAGELIST himl);
  VOID           ImageList_EndDrag(            );
  COLORREF       ImageList_GetBkColor(         HIMAGELIST himl);
  HIMAGELIST     ImageList_GetDragImage(       POINT* ppt, POINT* pptHotspot);
  HICON          ImageList_GetIcon(            HIMAGELIST himl, int i, ILD_Flags flags);
  BOOL           ImageList_GetIconSize(        HIMAGELIST himl, int* cx, int* cy);
  int            ImageList_GetImageCount(      HIMAGELIST himl);
  BOOL           ImageList_GetImageInfo(       HIMAGELIST himl, int i, IMAGEINFO* pImageInfo);
  HIMAGELIST     ImageList_LoadImage(          HINSTANCE hi, LPCTSTR lpbmp, int cx, int cGrow, COLORREF crMask, ImageType uType, LRFlags uFlags);
  HIMAGELIST     ImageList_Merge(              HIMAGELIST himl1, int i1, HIMAGELIST himl2, int i2, int dx, int dy);
  HIMAGELIST     ImageList_Read(               LPSTREAM pstm);
  HRESULT        ImageList_ReadEx(             ILP_Flags dwFlags, LPSTREAM pstm, REFIID riid, void** ppv);
  BOOL           ImageList_Remove(             HIMAGELIST himl, int i);
  BOOL           ImageList_Replace(            HIMAGELIST himl, int i, HBITMAP hbmImage, HBITMAP hbmMask);
  int            ImageList_ReplaceIcon(        HIMAGELIST himl, int i, HICON hicon);
  COLORREF       ImageList_SetBkColor(         HIMAGELIST himl, COLORREF clrBk);
  int            ImageList_SetColorTable(      HIMAGELIST himl, int start, int len, RGBQUAD* prgb);
  BOOL           ImageList_SetDragCursorImage( HIMAGELIST himlDrag, int iDrag, int dxHotspot, int dyHotspot);
  BOOL           ImageList_SetIconSize(        HIMAGELIST himl, int cx, int cy);
  BOOL           ImageList_SetImageCount(      HIMAGELIST himl, UINT uNewCount);
  BOOL           ImageList_SetOverlayImage(    HIMAGELIST himl, int iImage, int iOverlay);
  BOOL           ImageList_Write(              HIMAGELIST himl, LPSTREAM pstm);
  HRESULT        ImageList_WriteEx(            HIMAGELIST himl, ILP_Flags dwFlags, LPSTREAM pstm);
  HRESULT        TaskDialog(                   HWND hWndParent, HINSTANCE hInstance, PCWSTR pszWindowTitle, PCWSTR pszMainInstruction, PCWSTR pszContent, TASKDIALOG_COMMON_BUTTON_FLAGS dwCommonButtons, PCWSTR pszIcon, int* pnButton);
  HRESULT        TaskDialogIndirect(           TASKDIALOGCONFIG* pTaskConfig, int* pnButton, int* pnRadioButton, BOOL* pfVerificationFlagChecked);
]]
ffi.load( 'comctl32.dll' )

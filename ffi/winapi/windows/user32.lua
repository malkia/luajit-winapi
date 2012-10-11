require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/shell' )
require( 'ffi/winapi/headers/gdi' )
require( 'ffi/winapi/headers/security' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PMENUBARINFO; //Alias
  typedef LPVOID DLGPROC; //Alias
  typedef LPVOID WNDPROC; //Alias
  typedef LPVOID MSGBOXCALLBACK; //Alias
  typedef HANDLE HDESK; //Alias
  typedef LPVOID SENDASYNCPROC; //Alias
  typedef LPVOID WNDENUMPROC; //Alias
  typedef PVOID HDEVNOTIFY; //Alias
  typedef HANDLE HCONV; //Alias
  typedef HANDLE HDDEDATA; //Alias
  typedef HANDLE HSZ; //Alias
  typedef HANDLE HCONVLIST; //Alias
  typedef LPVOID PFNCALLBACK; //Alias
  typedef HANDLE HHOOK; //Alias
  typedef LPVOID HOOKPROC; //Alias
  typedef LPVOID MONITORENUMPROC; //Alias
  typedef LPVOID DRAWSTATEPROC; //Alias
  typedef LPVOID GRAYSTRINGPROC; //Alias
  typedef PVOID HPOWERNOTIFY; //Alias
  typedef HANDLE HRAWINPUT; //Alias
  typedef LPVOID TIMERPROC; //Alias
  typedef LPVOID PROPENUMPROC; //Alias
  typedef LPVOID PROPENUMPROCEX; //Alias
  typedef LPVOID WINSTAENUMPROC; //Alias
  typedef LPVOID DESKTOPENUMPROC; //Alias
  typedef LPVOID WINEVENTPROC; //Alias
  typedef HANDLE HWINSTA; //Alias
  typedef HANDLE HWINEVENTHOOK; //Alias
  typedef HANDLE HTOUCHINPUT; //Alias
  typedef HANDLE HGESTUREINFO; //Alias
  enum { CCHILDREN_TITLEBAR_plus_1 = 6 };
  enum { CCHILDREN_SCROLLBAR_plus_1 = 6 };
  typedef struct TITLEBARINFO {
    DWORD cbSize;
    RECT rcTitleBar;
    DWORD rgstate[CCHILDREN_TITLEBAR_plus_1];
  } TITLEBARINFO;
  typedef TITLEBARINFO *PTITLEBARINFO; //Pointer
  typedef DWORD DISPLAY_DEVICE_STATE; //Alias
  typedef struct DISPLAY_DEVICE {
    DWORD cb;
    TCHAR DeviceName[32];
    TCHAR DeviceString[128];
    DISPLAY_DEVICE_STATE StateFlags;
    TCHAR DeviceID[128];
    TCHAR DeviceKey[128];
  } DISPLAY_DEVICE;
  typedef DISPLAY_DEVICE *PDISPLAY_DEVICE; //Pointer
  typedef struct ICONINFOEX {
    DWORD cbSize;
    BOOL fIcon;
    DWORD xHotspot;
    DWORD yHotspot;
    HBITMAP hbmMask;
    HBITMAP hbmColor;
    WORD wResID;
    TCHAR szModName[MAX_PATH];
    TCHAR szResName[MAX_PATH];
  } ICONINFOEX;
  typedef ICONINFOEX *PICONINFOEX; //Pointer
  typedef struct PAINTSTRUCT {
    HDC hdc;
    BOOL fErase;
    RECT rcPaint;
    BOOL fRestore;
    BOOL fIncUpdate;
    BYTE rgbReserved[32];
  } PAINTSTRUCT;
  typedef PAINTSTRUCT *LPPAINTSTRUCT; //Pointer
  typedef struct SCROLLBARINFO {
    DWORD cbSize;
    RECT rcScrollBar;
    int dxyLineButton;
    int xyThumbTop;
    int xyThumbBottom;
    int reserved;
    DWORD rgstate[CCHILDREN_SCROLLBAR_plus_1];
  } SCROLLBARINFO;
  typedef SCROLLBARINFO *PSCROLLBARINFO; //Pointer
  typedef DWORD MOUSEINPUT_Data; //Alias
  typedef DWORD MOUSEEVENTF; //Alias
  typedef struct MOUSEINPUT {
    LONG dx;
    LONG dy;
    MOUSEINPUT_Data mouseData;
    MOUSEEVENTF dwFlags;
    DWORD time;
    ULONG_PTR dwExtraInfo;
  } MOUSEINPUT;
  typedef DWORD KEYEVENTF; //Alias
  typedef struct KEYBDINPUT {
    VirtKeyCode wVk;
    WORD wScan;
    KEYEVENTF dwFlags;
    DWORD time;
    ULONG_PTR dwExtraInfo;
  } KEYBDINPUT;
  typedef struct HARDWAREINPUT {
    DWORD uMsg;
    WORD wParamL;
    WORD wParamH;
  } HARDWAREINPUT;
  typedef union INPUT_u {
    MOUSEINPUT mi;
    KEYBDINPUT ki;
    HARDWAREINPUT hi;
  } INPUT_u;
  typedef DWORD INPUT_Type; //Alias
  static const INPUT_Type INPUT_MOUSE = 0;
  static const INPUT_Type INPUT_KEYBOARD = 1;
  static const INPUT_Type INPUT_HARDWARE = 2;
  typedef struct INPUT {
    INPUT_Type type;
    INPUT_u ;
  } INPUT;
  typedef INPUT *LPINPUT; //Pointer
  typedef DWORD WindowStyle; //Alias
  typedef DWORD WindowExStyle; //Alias
  typedef DWORD DialogStyle; //Alias
# pragma pack( push, 2 )
  typedef struct DLGTEMPLATE {
    DialogStyle style;
    WindowExStyle dwExtendedStyle;
    WORD cdit;
    short x;
    short y;
    short cx;
    short cy;
  } DLGTEMPLATE;
# pragma pack( pop )
  typedef DLGTEMPLATE *LPCDLGTEMPLATE; //Pointer
  typedef struct MSGBOXPARAMS {
    UINT cbSize;
    HWND hwndOwner;
    HINSTANCE hInstance;
    LPCTSTR lpszText;
    LPCTSTR lpszCaption;
    DWORD dwStyle;
    LPCTSTR lpszIcon;
    DWORD_PTR dwContextHelpId;
    MSGBOXCALLBACK lpfnMsgBoxCallback;
    DWORD dwLanguageId;
  } MSGBOXPARAMS;
  typedef MSGBOXPARAMS *LPMSGBOXPARAMS; //Pointer
  typedef struct BSMINFO {
    UINT cbSize;
    HDESK hdesk;
    HWND hwnd;
    LUID luid;
  } BSMINFO;
  typedef BSMINFO *PBSMINFO; //Pointer
  typedef struct CHANGEFILTERSTRUCT {
    DWORD cbSize;
    DWORD ExtStatus;
  } CHANGEFILTERSTRUCT;
  typedef CHANGEFILTERSTRUCT *PCHANGEFILTERSTRUCT; //Pointer
  typedef struct ALTTABINFO {
    DWORD cbSize;
    int cItems;
    int cColumns;
    int cRows;
    int iColFocus;
    int iRowFocus;
    int cxItem;
    int cyItem;
    POINT ptStart;
  } ALTTABINFO;
  typedef ALTTABINFO *PALTTABINFO; //Pointer
  typedef DWORD GUITHREADINFO_Flags; //Alias
  typedef struct GUITHREADINFO {
    DWORD cbSize;
    GUITHREADINFO_Flags flags;
    HWND hwndActive;
    HWND hwndFocus;
    HWND hwndCapture;
    HWND hwndMenuOwner;
    HWND hwndMoveSize;
    HWND hwndCaret;
    RECT rcCaret;
  } GUITHREADINFO;
  typedef GUITHREADINFO *LPGUITHREADINFO; //Pointer
  typedef struct WINDOWINFO {
    DWORD cbSize;
    RECT rcWindow;
    RECT rcClient;
    WindowStyle dwStyle;
    WindowExStyle dwExStyle;
    DWORD dwWindowStatus;
    UINT cxWindowBorders;
    UINT cyWindowBorders;
    ATOM atomWindowType;
    WORD wCreatorVersion;
  } WINDOWINFO;
  typedef WINDOWINFO *PWINDOWINFO; //Pointer
  typedef UINT WPF_Flags; //Alias
  typedef struct WINDOWPLACEMENT {
    UINT length;
    WPF_Flags flags;
    UINT showCmd;
    POINT ptMinPosition;
    POINT ptMaxPosition;
    RECT rcNormalPosition;
  } WINDOWPLACEMENT;
  typedef struct UPDATELAYEREDWINDOWINFO {
    DWORD cbSize;
    HDC hdcDst;
    POINT* pptDst;
    SIZE* psize;
    HDC hdcSrc;
    POINT* pptSrc;
    COLORREF crKey;
    BLENDFUNCTION* pblend;
    DWORD dwFlags;
    RECT* prcDirty;
  } UPDATELAYEREDWINDOWINFO;
  typedef struct COMBOBOXINFO {
    DWORD cbSize;
    RECT rcItem;
    RECT rcButton;
    DWORD stateButton;
    HWND hwndCombo;
    HWND hwndItem;
    HWND hwndList;
  } COMBOBOXINFO;
  typedef COMBOBOXINFO *PCOMBOBOXINFO; //Pointer
  typedef DWORD CursorFlags; //Alias
  typedef struct CURSORINFO {
    DWORD cbSize;
    CursorFlags flags;
    HCURSOR hCursor;
    POINT ptScreenPos;
  } CURSORINFO;
  typedef CURSORINFO *PCURSORINFO; //Pointer
  typedef struct CONVCONTEXT {
    UINT cb;
    UINT wFlags;
    UINT wCountryID;
    int iCodePage;
    DWORD dwLangID;
    DWORD dwSecurity;
    SECURITY_QUALITY_OF_SERVICE qos;
  } CONVCONTEXT;
  typedef CONVCONTEXT *PCONVCONTEXT; //Pointer
  typedef UINT CONVINFO_XTYP; //Alias
  static const CONVINFO_XTYP XTYP_ERROR = 0x8002;
  static const CONVINFO_XTYP XTYP_ADVDATA = 0x4010;
  static const CONVINFO_XTYP XTYP_ADVREQ = 0x2022;
  static const CONVINFO_XTYP XTYP_ADVSTART = 0x1030;
  static const CONVINFO_XTYP XTYP_ADVSTOP = 0x8040;
  static const CONVINFO_XTYP XTYP_EXECUTE = 0x4050;
  static const CONVINFO_XTYP XTYP_CONNECT = 0x1062;
  static const CONVINFO_XTYP XTYP_MONITOR = 0x80F2;
  static const CONVINFO_XTYP XTYP_CONNECT_CONFIRM = 0x8072;
  static const CONVINFO_XTYP XTYP_XACT_COMPLETE = 0x8080;
  static const CONVINFO_XTYP XTYP_POKE = 0x4090;
  static const CONVINFO_XTYP XTYP_REGISTER = 0x80A2;
  static const CONVINFO_XTYP XTYP_REQUEST = 0x20B0;
  static const CONVINFO_XTYP XTYP_DISCONNECT = 0x80C2;
  static const CONVINFO_XTYP XTYP_UNREGISTER = 0x80D2;
  static const CONVINFO_XTYP XTYP_WILDCONNECT = 0x20E2;
  typedef UINT CONVINFO_STATUS; //Alias
  static const CONVINFO_STATUS ST_CONNECTED = 0x0001;
  static const CONVINFO_STATUS ST_ADVISE = 0x0002;
  static const CONVINFO_STATUS ST_ISLOCAL = 0x0004;
  static const CONVINFO_STATUS ST_BLOCKED = 0x0008;
  static const CONVINFO_STATUS ST_CLIENT = 0x0010;
  static const CONVINFO_STATUS ST_TERMINATED = 0x0020;
  static const CONVINFO_STATUS ST_INLIST = 0x0040;
  static const CONVINFO_STATUS ST_BLOCKNEXT = 0x0080;
  static const CONVINFO_STATUS ST_ISSELF = 0x0100;
  typedef UINT CONVINFO_STATE; //Alias
  static const CONVINFO_STATE XST_NULL = 0;
  static const CONVINFO_STATE XST_INCOMPLETE = 1;
  static const CONVINFO_STATE XST_CONNECTED = 2;
  static const CONVINFO_STATE XST_INIT1 = 3;
  static const CONVINFO_STATE XST_INIT2 = 4;
  static const CONVINFO_STATE XST_REQSENT = 5;
  static const CONVINFO_STATE XST_DATARCVD = 6;
  static const CONVINFO_STATE XST_POKESENT = 7;
  static const CONVINFO_STATE XST_POKEACKRCVD = 8;
  static const CONVINFO_STATE XST_EXECSENT = 9;
  static const CONVINFO_STATE XST_EXECACKRCVD = 10;
  static const CONVINFO_STATE XST_ADVSENT = 11;
  static const CONVINFO_STATE XST_UNADVSENT = 12;
  static const CONVINFO_STATE XST_ADVACKRCVD = 13;
  static const CONVINFO_STATE XST_UNADVACKRCVD = 14;
  static const CONVINFO_STATE XST_ADVDATASENT = 15;
  static const CONVINFO_STATE XST_ADVDATAACKRCVD = 16;
  typedef struct CONVINFO {
    DWORD cb;
    DWORD_PTR hUser;
    HCONV hConvPartner;
    HSZ hszSvcPartner;
    HSZ hszServiceReq;
    HSZ hszTopic;
    HSZ hszItem;
    UINT wFmt;
    CONVINFO_XTYP wType;
    CONVINFO_STATUS wStatus;
    CONVINFO_STATE wConvst;
    UINT wLastError;
    HCONVLIST hConvList;
    CONVCONTEXT ConvCtxt;
    HWND hwnd;
    HWND hwndPartner;
  } CONVINFO;
  typedef CONVINFO *PCONVINFO; //Pointer
  typedef DWORD FLASHWINFO_Flags; //Alias
  typedef struct FLASHWINFO {
    UINT cbSize;
    HWND hwnd;
    FLASHWINFO_Flags dwFlags;
    UINT uCount;
    DWORD dwTimeout;
  } FLASHWINFO;
  typedef FLASHWINFO *PFLASHWINFO; //Pointer
  typedef struct ICONINFO {
    BOOL fIcon;
    DWORD xHotspot;
    DWORD yHotspot;
    HBITMAP hbmMask;
    HBITMAP hbmColor;
  } ICONINFO;
  typedef ICONINFO *PICONINFO; //Pointer
  typedef BYTE ACCEL_Flags; //Alias
  typedef struct ACCEL {
    ACCEL_Flags fVirt;
    VirtKeyCode key;
    WORD cmd;
  } ACCEL;
  typedef ACCEL *LPACCEL; //Pointer
  typedef struct LASTINPUTINFO {
    UINT cbSize;
    DWORD dwTime;
  } LASTINPUTINFO;
  typedef LASTINPUTINFO *PLASTINPUTINFO; //Pointer
  typedef DWORD MENUINFO_Mask; //Alias
  typedef DWORD MENUINFO_Style; //Alias
  typedef struct MENUINFO {
    DWORD cbSize;
    MENUINFO_Mask fMask;
    MENUINFO_Style dwStyle;
    UINT cyMax;
    HBRUSH hbrBack;
    DWORD dwContextHelpID;
    ULONG_PTR dwMenuData;
  } MENUINFO;
  typedef MENUINFO *LPCMENUINFO; //Pointer
  typedef UINT MENUITEMINFO_MASK; //Alias
  typedef UINT MENUITEM_TYPE; //Alias
  typedef UINT MENUITEM_STATE; //Alias
  typedef HBITMAP HBMMENU; //Alias
  typedef struct MENUITEMINFO {
    UINT cbSize;
    MENUITEMINFO_MASK fMask;
    MENUITEM_TYPE fType;
    MENUITEM_STATE fState;
    UINT wID;
    HMENU hSubMenu;
    HBITMAP hbmpChecked;
    HBITMAP hbmpUnchecked;
    ULONG_PTR dwItemData;
    LPTSTR dwTypeData;
    UINT cch;
    HBMMENU hbmpItem;
  } MENUITEMINFO;
  typedef MENUITEMINFO *LPMENUITEMINFO; //Pointer
  typedef MENUITEMINFO *LPCMENUITEMINFO; //Pointer
  typedef struct TPMPARAMS {
    UINT cbSize;
    RECT rcExclude;
  } TPMPARAMS;
  typedef TPMPARAMS *LPTPMPARAMS; //Pointer
  typedef struct MOUSEMOVEPOINT {
    int x;
    int y;
    DWORD time;
    ULONG_PTR dwExtraInfo;
  } MOUSEMOVEPOINT;
  typedef MOUSEMOVEPOINT *LPMOUSEMOVEPOINT; //Pointer
  typedef struct MONITORINFO {
    DWORD cbSize;
    RECT rcMonitor;
    RECT rcWork;
    MONITORINFO_Flags dwFlags;
  } MONITORINFO;
  typedef MONITORINFO *LPMONITORINFO; //Pointer
  typedef DWORD RAWINPUTDEVICE_Flags; //Alias
  typedef struct RAWINPUTDEVICE {
    USHORT usUsagePage;
    USHORT usUsage;
    RAWINPUTDEVICE_Flags dwFlags;
    HWND hwndTarget;
  } RAWINPUTDEVICE;
  typedef RAWINPUTDEVICE *PRAWINPUTDEVICE; //Pointer
  typedef RAWINPUTDEVICE *PCRAWINPUTDEVICE; //Pointer
  typedef DWORD RIM_TYPE; //Alias
  static const RIM_TYPE RIM_TYPEMOUSE = 0;
  static const RIM_TYPE RIM_TYPEKEYBOARD = 1;
  static const RIM_TYPE RIM_TYPEHID = 2;
  typedef struct RAWINPUTDEVICELIST {
    HANDLE hDevice;
    RIM_TYPE dwType;
  } RAWINPUTDEVICELIST;
  typedef RAWINPUTDEVICELIST *PRAWINPUTDEVICELIST; //Pointer
  typedef UINT ClassStyle; //Alias
  typedef struct WNDCLASS {
    ClassStyle style;
    WNDPROC lpfnWndProc;
    int cbClsExtra;
    int cbWndExtra;
    HINSTANCE hInstance;
    HICON hIcon;
    HCURSOR hCursor;
    HBRUSH hbrBackground;
    LPCTSTR lpszMenuName;
    LPCTSTR lpszClassName;
  } WNDCLASS;
  typedef WNDCLASS *LPWNDCLASS; //Pointer
  typedef struct WNDCLASSEX {
    UINT cbSize;
    ClassStyle style;
    WNDPROC lpfnWndProc;
    int cbClsExtra;
    int cbWndExtra;
    HINSTANCE hInstance;
    HICON hIcon;
    HCURSOR hCursor;
    HBRUSH hbrBackground;
    LPCTSTR lpszMenuName;
    LPCTSTR lpszClassName;
    HICON hIconSm;
  } WNDCLASSEX;
  typedef WNDCLASSEX *LPWNDCLASSEX; //Pointer
  typedef UINT ExitWindowsExFlags; //Alias
  static const ExitWindowsExFlags EWX_LOGOFF = 0;
  static const ExitWindowsExFlags EWX_POWEROFF = 0x00000008;
  static const ExitWindowsExFlags EWX_REBOOT = 0x00000002;
  static const ExitWindowsExFlags EWX_RESTARTAPPS = 0x00000040;
  static const ExitWindowsExFlags EWX_SHUTDOWN = 0x00000001;
  typedef DWORD ExitWindowsExReason; //Alias
  static const ExitWindowsExReason EWX_FORCE = 0x00000004;
  static const ExitWindowsExReason EWX_FORCEIFHUNG = 0x00000010;
  typedef int WindowLongIndex; //Alias
  static const WindowLongIndex GWL_WNDPROC = -4;
  static const WindowLongIndex GWL_HINSTANCE = -6;
  static const WindowLongIndex GWL_HWNDPARENT = -8;
  static const WindowLongIndex GWL_ID = -12;
  static const WindowLongIndex GWL_STYLE = -16;
  static const WindowLongIndex GWL_EXSTYLE = -20;
  static const WindowLongIndex GWL_USERDATA = -21;
  static const WindowLongIndex DWL_MSGRESULT = 0;
  static const WindowLongIndex DWL_DLGPROC = 4;
  static const WindowLongIndex DWL_USER = 8;
  typedef int ClassLongIndex; //Alias
  static const ClassLongIndex GCL_MENUNAME = -8;
  static const ClassLongIndex GCL_HBRBACKGROUND = -10;
  static const ClassLongIndex GCL_HCURSOR = -12;
  static const ClassLongIndex GCL_HICON = -14;
  static const ClassLongIndex GCL_HMODULE = -16;
  static const ClassLongIndex GCL_CBWNDEXTRA = -18;
  static const ClassLongIndex GCL_CBCLSEXTRA = -20;
  static const ClassLongIndex GCL_WNDPROC = -24;
  static const ClassLongIndex GCL_STYLE = -26;
  static const ClassLongIndex GCW_ATOM = -32;
  static const ClassLongIndex GCL_HICONSM = -34;
  typedef int SystemMetricIndex; //Alias
  static const SystemMetricIndex SM_CXSCREEN = 0;
  static const SystemMetricIndex SM_CYSCREEN = 1;
  static const SystemMetricIndex SM_CXVSCROLL = 2;
  static const SystemMetricIndex SM_CYHSCROLL = 3;
  static const SystemMetricIndex SM_CYCAPTION = 4;
  static const SystemMetricIndex SM_CXBORDER = 5;
  static const SystemMetricIndex SM_CYBORDER = 6;
  static const SystemMetricIndex SM_CXDLGFRAME = 7;
  static const SystemMetricIndex SM_CYDLGFRAME = 8;
  static const SystemMetricIndex SM_CYVTHUMB = 9;
  static const SystemMetricIndex SM_CXHTHUMB = 10;
  static const SystemMetricIndex SM_CXICON = 11;
  static const SystemMetricIndex SM_CYICON = 12;
  static const SystemMetricIndex SM_CXCURSOR = 13;
  static const SystemMetricIndex SM_CYCURSOR = 14;
  static const SystemMetricIndex SM_CYMENU = 15;
  static const SystemMetricIndex SM_CXFULLSCREEN = 16;
  static const SystemMetricIndex SM_CYFULLSCREEN = 17;
  static const SystemMetricIndex SM_CYKANJIWINDOW = 18;
  static const SystemMetricIndex SM_MOUSEPRESENT = 19;
  static const SystemMetricIndex SM_CYVSCROLL = 20;
  static const SystemMetricIndex SM_CXHSCROLL = 21;
  static const SystemMetricIndex SM_DEBUG = 22;
  static const SystemMetricIndex SM_SWAPBUTTON = 23;
  static const SystemMetricIndex SM_RESERVED1 = 24;
  static const SystemMetricIndex SM_RESERVED2 = 25;
  static const SystemMetricIndex SM_RESERVED3 = 26;
  static const SystemMetricIndex SM_RESERVED4 = 27;
  static const SystemMetricIndex SM_CXMIN = 28;
  static const SystemMetricIndex SM_CYMIN = 29;
  static const SystemMetricIndex SM_CXSIZE = 30;
  static const SystemMetricIndex SM_CYSIZE = 31;
  static const SystemMetricIndex SM_CXFRAME = 32;
  static const SystemMetricIndex SM_CYFRAME = 33;
  static const SystemMetricIndex SM_CXMINTRACK = 34;
  static const SystemMetricIndex SM_CYMINTRACK = 35;
  static const SystemMetricIndex SM_CXDOUBLECLK = 36;
  static const SystemMetricIndex SM_CYDOUBLECLK = 37;
  static const SystemMetricIndex SM_CXICONSPACING = 38;
  static const SystemMetricIndex SM_CYICONSPACING = 39;
  static const SystemMetricIndex SM_MENUDROPALIGNMENT = 40;
  static const SystemMetricIndex SM_PENWINDOWS = 41;
  static const SystemMetricIndex SM_DBCSENABLED = 42;
  static const SystemMetricIndex SM_CMOUSEBUTTONS = 43;
  static const SystemMetricIndex SM_SECURE = 44;
  static const SystemMetricIndex SM_CXEDGE = 45;
  static const SystemMetricIndex SM_CYEDGE = 46;
  static const SystemMetricIndex SM_CXMINSPACING = 47;
  static const SystemMetricIndex SM_CYMINSPACING = 48;
  static const SystemMetricIndex SM_CXSMICON = 49;
  static const SystemMetricIndex SM_CYSMICON = 50;
  static const SystemMetricIndex SM_CYSMCAPTION = 51;
  static const SystemMetricIndex SM_CXSMSIZE = 52;
  static const SystemMetricIndex SM_CYSMSIZE = 53;
  static const SystemMetricIndex SM_CXMENUSIZE = 54;
  static const SystemMetricIndex SM_CYMENUSIZE = 55;
  static const SystemMetricIndex SM_ARRANGE = 56;
  static const SystemMetricIndex SM_CXMINIMIZED = 57;
  static const SystemMetricIndex SM_CYMINIMIZED = 58;
  static const SystemMetricIndex SM_CXMAXTRACK = 59;
  static const SystemMetricIndex SM_CYMAXTRACK = 60;
  static const SystemMetricIndex SM_CXMAXIMIZED = 61;
  static const SystemMetricIndex SM_CYMAXIMIZED = 62;
  static const SystemMetricIndex SM_NETWORK = 63;
  static const SystemMetricIndex SM_CLEANBOOT = 67;
  static const SystemMetricIndex SM_CXDRAG = 68;
  static const SystemMetricIndex SM_CYDRAG = 69;
  static const SystemMetricIndex SM_SHOWSOUNDS = 70;
  static const SystemMetricIndex SM_CXMENUCHECK = 71;
  static const SystemMetricIndex SM_CYMENUCHECK = 72;
  static const SystemMetricIndex SM_SLOWMACHINE = 73;
  static const SystemMetricIndex SM_MIDEASTENABLED = 74;
  static const SystemMetricIndex SM_MOUSEWHEELPRESENT = 75;
  static const SystemMetricIndex SM_XVIRTUALSCREEN = 76;
  static const SystemMetricIndex SM_YVIRTUALSCREEN = 77;
  static const SystemMetricIndex SM_CXVIRTUALSCREEN = 78;
  static const SystemMetricIndex SM_CYVIRTUALSCREEN = 79;
  static const SystemMetricIndex SM_CMONITORS = 80;
  static const SystemMetricIndex SM_SAMEDISPLAYFORMAT = 81;
  static const SystemMetricIndex SM_IMMENABLED = 82;
  static const SystemMetricIndex SM_CXFOCUSBORDER = 83;
  static const SystemMetricIndex SM_CYFOCUSBORDER = 84;
  static const SystemMetricIndex SM_TABLETPC = 86;
  static const SystemMetricIndex SM_MEDIACENTER = 87;
  static const SystemMetricIndex SM_STARTER = 88;
  static const SystemMetricIndex SM_SERVERR2 = 89;
  static const SystemMetricIndex SM_MOUSEHORIZONTALWHEELPRESENT = 91;
  static const SystemMetricIndex SM_CXPADDEDBORDER = 92;
  typedef UINT PeekMessageFlag; //Alias
  typedef DWORD QueueStatusFlag; //Alias
  typedef DWORD WindowMessageFilterEnum; //Alias
  static const WindowMessageFilterEnum MSGFLT_ADD = 1;
  static const WindowMessageFilterEnum MSGFLT_REMOVE = 2;
  typedef int UserObjectInformationEnum; //Alias
  static const UserObjectInformationEnum UOI_FLAGS = 1;
  static const UserObjectInformationEnum UOI_NAME = 2;
  static const UserObjectInformationEnum UOI_TYPE = 3;
  static const UserObjectInformationEnum UOI_USER_SID = 4;
  static const UserObjectInformationEnum UOI_HEAPSIZE = 5;
  static const UserObjectInformationEnum UOI_IO = 6;
  typedef UINT GetAncestorEnum; //Alias
  static const GetAncestorEnum GA_PARENT = 1;
  static const GetAncestorEnum GA_ROOT = 2;
  static const GetAncestorEnum GA_ROOTOWNER = 3;
  typedef UINT GetWindowEnum; //Alias
  static const GetWindowEnum GW_HWNDFIRST = 0;
  static const GetWindowEnum GW_HWNDLAST = 1;
  static const GetWindowEnum GW_HWNDNEXT = 2;
  static const GetWindowEnum GW_HWNDPREV = 3;
  static const GetWindowEnum GW_OWNER = 4;
  static const GetWindowEnum GW_CHILD = 5;
  static const GetWindowEnum GW_ENABLEDPOPUP = 6;
  typedef DWORD DCExFlags; //Alias
  typedef DWORD EnumDisplayDevicesFlags; //Alias
  typedef UINT WinEventFlags; //Alias
  typedef UINT RedrawWindowFlags; //Alias
  typedef DWORD AnimateWindowFlags; //Alias
  typedef UINT SetWindowPosFlags; //Alias
  typedef UINT SendMessageTimeoutFlags; //Alias
  typedef UINT DrawIconFlags; //Alias
  typedef LONG ObjectIdEnum; //Alias
  static const ObjectIdEnum OBJID_WINDOW = 0x00000000;
  static const ObjectIdEnum OBJID_SYSMENU = 0xFFFFFFFF;
  static const ObjectIdEnum OBJID_TITLEBAR = 0xFFFFFFFE;
  static const ObjectIdEnum OBJID_MENU = 0xFFFFFFFD;
  static const ObjectIdEnum OBJID_CLIENT = 0xFFFFFFFC;
  static const ObjectIdEnum OBJID_VSCROLL = 0xFFFFFFFB;
  static const ObjectIdEnum OBJID_HSCROLL = 0xFFFFFFFA;
  static const ObjectIdEnum OBJID_SIZEGRIP = 0xFFFFFFF9;
  static const ObjectIdEnum OBJID_CARET = 0xFFFFFFF8;
  static const ObjectIdEnum OBJID_CURSOR = 0xFFFFFFF7;
  static const ObjectIdEnum OBJID_ALERT = 0xFFFFFFF6;
  static const ObjectIdEnum OBJID_SOUND = 0xFFFFFFF5;
  static const ObjectIdEnum OBJID_QUERYCLASSNAMEIDX = 0xFFFFFFF4;
  static const ObjectIdEnum OBJID_NATIVEOM = 0xFFFFFFF0;
  typedef UINT DrawStateFlags; //Alias
  typedef UINT MenuCommandPosFlag; //Alias
  static const MenuCommandPosFlag MF_BYCOMMAND = 0x00000000;
  static const MenuCommandPosFlag MF_BYPOSITION = 0x00000400;
  typedef UINT InsertMenuFlags; //Alias
  typedef UINT EnableMenuItemFlag; //Alias
  typedef int EnableMenuItemResult; //Alias
  static const EnableMenuItemResult MF_ENABLED = 0x00000000;
  static const EnableMenuItemResult MF_GRAYED = 0x00000001;
  static const EnableMenuItemResult MF_DISABLED = 0x00000002;
  typedef UINT CheckMenuItemFlag; //Alias
  typedef UINT ClipboardFormat; //Alias
  static const ClipboardFormat CF_TEXT = 1;
  static const ClipboardFormat CF_BITMAP = 2;
  static const ClipboardFormat CF_METAFILEPICT = 3;
  static const ClipboardFormat CF_SYLK = 4;
  static const ClipboardFormat CF_DIF = 5;
  static const ClipboardFormat CF_TIFF = 6;
  static const ClipboardFormat CF_OEMTEXT = 7;
  static const ClipboardFormat CF_DIB = 8;
  static const ClipboardFormat CF_PALETTE = 9;
  static const ClipboardFormat CF_PENDATA = 10;
  static const ClipboardFormat CF_RIFF = 11;
  static const ClipboardFormat CF_WAVE = 12;
  static const ClipboardFormat CF_UNICODETEXT = 13;
  static const ClipboardFormat CF_ENHMETAFILE = 14;
  static const ClipboardFormat CF_HDROP = 15;
  static const ClipboardFormat CF_LOCALE = 16;
  static const ClipboardFormat CF_DIBV5 = 17;
  static const ClipboardFormat CF_OWNERDISPLAY = 0x0080;
  static const ClipboardFormat CF_DSPTEXT = 0x0081;
  static const ClipboardFormat CF_DSPBITMAP = 0x0082;
  static const ClipboardFormat CF_DSPMETAFILEPICT = 0x0083;
  static const ClipboardFormat CF_DSPENHMETAFILE = 0x008E;
  typedef HWND HwndInsertAfterEnum; //Alias
  typedef int WindowsHook; //Alias
  static const WindowsHook WH_MSGFILTER = -1;
  static const WindowsHook WH_JOURNALRECORD = 0;
  static const WindowsHook WH_JOURNALPLAYBACK = 1;
  static const WindowsHook WH_KEYBOARD = 2;
  static const WindowsHook WH_GETMESSAGE = 3;
  static const WindowsHook WH_CALLWNDPROC = 4;
  static const WindowsHook WH_CBT = 5;
  static const WindowsHook WH_SYSMSGFILTER = 6;
  static const WindowsHook WH_MOUSE = 7;
  static const WindowsHook WH_HARDWARE = 8;
  static const WindowsHook WH_DEBUG = 9;
  static const WindowsHook WH_SHELL = 10;
  static const WindowsHook WH_FOREGROUNDIDLE = 11;
  static const WindowsHook WH_CALLWNDPROCRET = 12;
  static const WindowsHook WH_KEYBOARD_LL = 13;
  static const WindowsHook WH_MOUSE_LL = 14;
  typedef DWORD MsgWaitForMultipleObjectsFlags; //Alias
  typedef HKL KeyboardLayoutHandle; //Alias
  static const KeyboardLayoutHandle HKL_PREV = 0;
  static const KeyboardLayoutHandle HKL_NEXT = 1;
  typedef UINT KeyboardLayoutFlags; //Alias
  typedef DWORD MonitorFlags; //Alias
  typedef UINT ScrollWindowFlags; //Alias
  typedef DWORD EnumDisplaySettingsEnum; //Alias
  static const EnumDisplaySettingsEnum ENUM_CURRENT_SETTINGS = -1;
  static const EnumDisplaySettingsEnum ENUM_REGISTRY_SETTINGS = -2;
  typedef UINT ButtonState; //Alias
  static const ButtonState BST_UNCHECKED = 0x0000;
  static const ButtonState BST_CHECKED = 0x0001;
  static const ButtonState BST_INDETERMINATE = 0x0002;
  static const ButtonState BST_PUSHED = 0x0004;
  static const ButtonState BST_FOCUS = 0x0008;
  typedef DWORD LayeredWindowAttribute; //Alias
  typedef DWORD UpdateLayeredWindowFlags; //Alias
  typedef UINT MapVirtualKeyType; //Alias
  static const MapVirtualKeyType MAPVK_VK_TO_VSC = 0;
  static const MapVirtualKeyType MAPVK_VSC_TO_VK = 1;
  static const MapVirtualKeyType MAPVK_VK_TO_CHAR = 2;
  static const MapVirtualKeyType MAPVK_VSC_TO_VK_EX = 3;
  static const MapVirtualKeyType MAPVK_VK_TO_VSC_EX = 4;
  typedef DWORD DesktopFlags; //Alias
  static const DesktopFlags DF_ALLOWOTHERACCOUNTHOOK = 0x0001;
  typedef ACCESS_MASK DESKTOP_ACCESS_MASK; //Alias
  typedef DWORD WindowStationAccessRights; //Alias
  typedef DWORD CreateWindowStationFlags; //Alias
  static const CreateWindowStationFlags CWF_CREATE_ONLY = 0x00000001;
  typedef UINT LockSetForegroundWindowCode; //Alias
  static const LockSetForegroundWindowCode LSFW_LOCK = 1;
  static const LockSetForegroundWindowCode LSFW_UNLOCK = 2;
  typedef DWORD DeviceNotificationFlags; //Alias
  typedef UINT TrackPopupMenuFlags; //Alias
  typedef UINT GetMenuDefaultItemFlags; //Alias
  typedef LPCTSTR LoadImageString_LPCTSTR; //Alias
  static const LoadImageString_LPCTSTR OBM_CLOSE = 32754;
  static const LoadImageString_LPCTSTR OBM_UPARROW = 32753;
  static const LoadImageString_LPCTSTR OBM_DNARROW = 32752;
  static const LoadImageString_LPCTSTR OBM_RGARROW = 32751;
  static const LoadImageString_LPCTSTR OBM_LFARROW = 32750;
  static const LoadImageString_LPCTSTR OBM_REDUCE = 32749;
  static const LoadImageString_LPCTSTR OBM_ZOOM = 32748;
  static const LoadImageString_LPCTSTR OBM_RESTORE = 32747;
  static const LoadImageString_LPCTSTR OBM_REDUCED = 32746;
  static const LoadImageString_LPCTSTR OBM_ZOOMD = 32745;
  static const LoadImageString_LPCTSTR OBM_RESTORED = 32744;
  static const LoadImageString_LPCTSTR OBM_UPARROWD = 32743;
  static const LoadImageString_LPCTSTR OBM_DNARROWD = 32742;
  static const LoadImageString_LPCTSTR OBM_RGARROWD = 32741;
  static const LoadImageString_LPCTSTR OBM_LFARROWD = 32740;
  static const LoadImageString_LPCTSTR OBM_MNARROW = 32739;
  static const LoadImageString_LPCTSTR OBM_COMBO = 32738;
  static const LoadImageString_LPCTSTR OBM_UPARROWI = 32737;
  static const LoadImageString_LPCTSTR OBM_DNARROWI = 32736;
  static const LoadImageString_LPCTSTR OBM_RGARROWI = 32735;
  static const LoadImageString_LPCTSTR OBM_LFARROWI = 32734;
  static const LoadImageString_LPCTSTR OBM_OLD_CLOSE = 32767;
  static const LoadImageString_LPCTSTR OBM_SIZE = 32766;
  static const LoadImageString_LPCTSTR OBM_OLD_UPARROW = 32765;
  static const LoadImageString_LPCTSTR OBM_OLD_DNARROW = 32764;
  static const LoadImageString_LPCTSTR OBM_OLD_RGARROW = 32763;
  static const LoadImageString_LPCTSTR OBM_OLD_LFARROW = 32762;
  static const LoadImageString_LPCTSTR OBM_BTSIZE = 32761;
  static const LoadImageString_LPCTSTR OBM_CHECK = 32760;
  static const LoadImageString_LPCTSTR OBM_CHECKBOXES = 32759;
  static const LoadImageString_LPCTSTR OBM_BTNCORNERS = 32758;
  static const LoadImageString_LPCTSTR OBM_OLD_REDUCE = 32757;
  static const LoadImageString_LPCTSTR OBM_OLD_ZOOM = 32756;
  static const LoadImageString_LPCTSTR OBM_OLD_RESTORE = 32755;
  static const LoadImageString_LPCTSTR OCR_NORMAL = 32512;
  static const LoadImageString_LPCTSTR OCR_IBEAM = 32513;
  static const LoadImageString_LPCTSTR OCR_WAIT = 32514;
  static const LoadImageString_LPCTSTR OCR_CROSS = 32515;
  static const LoadImageString_LPCTSTR OCR_UP = 32516;
  static const LoadImageString_LPCTSTR OCR_SIZE = 32640;
  static const LoadImageString_LPCTSTR OCR_ICON = 32641;
  static const LoadImageString_LPCTSTR OCR_SIZENWSE = 32642;
  static const LoadImageString_LPCTSTR OCR_SIZENESW = 32643;
  static const LoadImageString_LPCTSTR OCR_SIZEWE = 32644;
  static const LoadImageString_LPCTSTR OCR_SIZENS = 32645;
  static const LoadImageString_LPCTSTR OCR_SIZEALL = 32646;
  static const LoadImageString_LPCTSTR OCR_ICOCUR = 32647;
  static const LoadImageString_LPCTSTR OCR_NO = 32648;
  static const LoadImageString_LPCTSTR OCR_HAND = 32649;
  static const LoadImageString_LPCTSTR OCR_APPSTARTING = 32650;
  static const LoadImageString_LPCTSTR OIC_SAMPLE = 32512;
  static const LoadImageString_LPCTSTR OIC_ERROR = 32513;
  static const LoadImageString_LPCTSTR OIC_QUES = 32514;
  static const LoadImageString_LPCTSTR OIC_WARNING = 32515;
  static const LoadImageString_LPCTSTR OIC_INFORMATION = 32516;
  static const LoadImageString_LPCTSTR OIC_WINLOGO = 32517;
  static const LoadImageString_LPCTSTR OIC_SHIELD = 32518;
  typedef LPCTSTR LoadBitmapString_LPCTSTR; //Alias
  typedef LPCTSTR LoadCursorString_LPCTSTR; //Alias
  static const LoadCursorString_LPCTSTR IDC_ARROW = 32512;
  static const LoadCursorString_LPCTSTR IDC_IBEAM = 32513;
  static const LoadCursorString_LPCTSTR IDC_WAIT = 32514;
  static const LoadCursorString_LPCTSTR IDC_CROSS = 32515;
  static const LoadCursorString_LPCTSTR IDC_UPARROW = 32516;
  static const LoadCursorString_LPCTSTR IDC_SIZE = 32640;
  static const LoadCursorString_LPCTSTR IDC_ICON = 32641;
  static const LoadCursorString_LPCTSTR IDC_SIZENWSE = 32642;
  static const LoadCursorString_LPCTSTR IDC_SIZENESW = 32643;
  static const LoadCursorString_LPCTSTR IDC_SIZEWE = 32644;
  static const LoadCursorString_LPCTSTR IDC_SIZENS = 32645;
  static const LoadCursorString_LPCTSTR IDC_SIZEALL = 32646;
  static const LoadCursorString_LPCTSTR IDC_NO = 32648;
  static const LoadCursorString_LPCTSTR IDC_HAND = 32649;
  static const LoadCursorString_LPCTSTR IDC_APPSTARTING = 32650;
  static const LoadCursorString_LPCTSTR IDC_HELP = 32651;
  typedef LPCTSTR LoadIconString_LPCTSTR; //Alias
  static const LoadIconString_LPCTSTR IDI_APPLICATION = 32512;
  static const LoadIconString_LPCTSTR IDI_ERROR = 32513;
  static const LoadIconString_LPCTSTR IDI_QUESTION = 32514;
  static const LoadIconString_LPCTSTR IDI_WARNING = 32515;
  static const LoadIconString_LPCTSTR IDI_INFORMATION = 32516;
  static const LoadIconString_LPCTSTR IDI_WINLOGO = 32517;
  static const LoadIconString_LPCTSTR IDI_SHIELD = 32518;
  typedef DWORD CursorId; //Alias
  typedef int WindowRegion; //Alias
  static const WindowRegion ERROR = 0;
  static const WindowRegion NULLREGION = 1;
  static const WindowRegion SIMPLEREGION = 2;
  static const WindowRegion COMPLEXREGION = 3;
  typedef DWORD TOUCHINPUT_Flags; //Alias
  typedef DWORD TOUCHINPUT_Mask; //Alias
  typedef struct TOUCHINPUT {
    LONG x;
    LONG y;
    HANDLE hSource;
    DWORD dwID;
    TOUCHINPUT_Flags dwFlags;
    TOUCHINPUT_Mask dwMask;
    DWORD dwTime;
    ULONG_PTR dwExtraInfo;
    DWORD cxContact;
    DWORD cyContact;
  } TOUCHINPUT;
  typedef TOUCHINPUT *PTOUCHINPUT; //Pointer
  typedef DWORD GestureId; //Alias
  typedef struct GESTURECONFIG {
    GestureId dwID;
    DWORD dwWant;
    DWORD dwBlock;
  } GESTURECONFIG;
  typedef GESTURECONFIG *PGESTURECONFIG; //Pointer
  typedef struct POINTS {
    SHORT x;
    SHORT y;
  } POINTS;
  typedef DWORD GESTUREINFO_Flags; //Alias
  typedef struct GESTUREINFO {
    UINT cbSize;
    GESTUREINFO_Flags dwFlags;
    DWORD dwID;
    HWND hwndTarget;
    POINTS ptsLocation;
    DWORD dwInstanceID;
    DWORD dwSequenceID;
    ULONGLONG ullArguments;
    UINT cbExtraArgs;
  } GESTUREINFO;
  typedef GESTUREINFO *PGESTUREINFO; //Pointer
  typedef struct RAWINPUTHEADER {
    RIM_TYPE dwType;
    DWORD dwSize;
    HANDLE hDevice;
    WPARAM wParam;
  } RAWINPUTHEADER;
  typedef USHORT RAWMOUSE_STATE; //Alias
  typedef struct RAWMOUSE_u_s {
    RAWMOUSE_STATE usButtonFlags;
    USHORT usButtonData;
  } RAWMOUSE_u_s;
  typedef union RAWMOUSE_u {
    ULONG ulButtons;
    RAWMOUSE_u_s ;
  } RAWMOUSE_u;
  typedef USHORT RAWMOUSE_FLAGS; //Alias
  typedef struct RAWMOUSE {
    RAWMOUSE_FLAGS usFlags;
    RAWMOUSE_u ;
    ULONG ulRawButtons;
    LONG lLastX;
    LONG lLastY;
    ULONG ulExtraInformation;
  } RAWMOUSE;
  typedef USHORT RAWKEYBOARD_FLAGS; //Alias
  typedef struct RAWKEYBOARD {
    USHORT MakeCode;
    RAWKEYBOARD_FLAGS Flags;
    USHORT Reserved;
    VirtKeyCode VKey;
    WinMsg Message;
    ULONG ExtraInformation;
  } RAWKEYBOARD;
  typedef struct RAWHID {
    DWORD dwSizeHid;
    DWORD dwCount;
    BYTE bRawData[1];
  } RAWHID;
  typedef union RAWINPUT_u {
    RAWMOUSE mouse;
    RAWKEYBOARD keyboard;
    RAWHID hid;
  } RAWINPUT_u;
  typedef struct RAWINPUT {
    RAWINPUTHEADER header;
    RAWINPUT_u data;
  } RAWINPUT;
  typedef RAWINPUT *PRAWINPUT; //Pointer
  typedef int CreateWindow_CW; //Alias
  static const CreateWindow_CW CW_USEDEFAULT = 0x80000000;
  typedef struct WINCOMPATTRDATA {
    DwmWindowAttr attribute;
    PVOID pData;
    ULONG dataSize;
  } WINCOMPATTRDATA;
  HWND                 CreateDialogIndirectParam(          HINSTANCE hInstance, LPCDLGTEMPLATE lpTemplate, HWND hWndParent, DLGPROC lpDialogFunc, LPARAM lParamInit);
  HWND                 CreateDialogParam(                  HINSTANCE hInstance, LPCTSTR lpTemplateName, HWND hWndParent, DLGPROC lpDialogFunc, LPARAM lParamInit);
  LRESULT              DefDlgProc(                         HWND hDlg, WinMsg Msg, WPARAM wParam, LPARAM lParam);
  INT_PTR              DialogBoxIndirectParam(             HINSTANCE hInstance, LPCDLGTEMPLATE hDialogTemplate, HWND hWndParent, DLGPROC lpDialogFunc, LPARAM dwInitParam);
  INT_PTR              DialogBoxParam(                     HINSTANCE hInstance, LPCTSTR lpTemplateName, HWND hWndParent, DLGPROC lpDialogFunc, LPARAM dwInitParam);
  BOOL                 EndDialog(                          HWND hDlg, INT_PTR nResult);
  LONG                 GetDialogBaseUnits(                 );
  int                  GetDlgCtrlID(                       HWND hwndCtl);
  HWND                 GetDlgItem(                         HWND hDlg, int nIDDlgItem);
  UINT                 GetDlgItemInt(                      HWND hDlg, int nIDDlgItem, BOOL* lpTranslated, BOOL bSigned);
  UINT                 GetDlgItemText(                     HWND hDlg, int nIDDlgItem, LPTSTR lpString, int nMaxCount);
  HWND                 GetNextDlgGroupItem(                HWND hDlg, HWND hCtl, BOOL bPrevious);
  HWND                 GetNextDlgTabItem(                  HWND hDlg, HWND hCtl, BOOL bPrevious);
  BOOL                 IsDialogMessage(                    HWND hDlg, LPMSG lpMsg);
  BOOL                 MapDialogRect(                      HWND hDlg, LPRECT lpRect);
  MessageBoxResult     MessageBox(                         HWND hWnd, LPCTSTR lpText, LPCTSTR lpCaption, MessageBoxType uType);
  MessageBoxResult     MessageBoxEx(                       HWND hWnd, LPCTSTR lpText, LPCTSTR lpCaption, MessageBoxType uType, WORD wLanguageId);
  int                  MessageBoxIndirect(                 LPMSGBOXPARAMS lpMsgBoxParams);
  MessageBoxResult     MessageBoxTimeout(                  HWND hWnd, LPCTSTR lpText, LPCTSTR lpCaption, MessageBoxType uType, WORD wLanguageId, WaitTimeout dwMilliseconds);
  LRESULT              SendDlgItemMessage(                 HWND hDlg, int nIDDlgItem, WinMsg Msg, WPARAM wParam, LPARAM lParam);
  BOOL                 SetDlgItemInt(                      HWND hDlg, int nIDDlgItem, UINT uValue, BOOL bSigned);
  BOOL                 SetDlgItemText(                     HWND hDlg, int nIDDlgItem, LPCTSTR lpString);
  long                 BroadcastSystemMessage(             DWORD dwFlags, LPDWORD lpdwRecipients, UINT uiMessage, WPARAM wParam, LPARAM lParam);
  long                 BroadcastSystemMessageEx(           DWORD dwFlags, LPDWORD lpdwRecipients, UINT uiMessage, WPARAM wParam, LPARAM lParam, PBSMINFO pBSMInfo);
  LRESULT              DispatchMessage(                    MSG* lpmsg);
  BOOL                 GetInputState(                      );
  BOOL                 GetMessage(                         LPMSG lpMsg, HWND hWnd, UINT wMsgFilterMin, UINT wMsgFilterMax);
  LPARAM               GetMessageExtraInfo(                );
  DWORD                GetMessagePos(                      );
  LONG                 GetMessageTime(                     );
  DWORD                GetQueueStatus(                     QueueStatusFlag flags);
  BOOL                 InSendMessage(                      );
  DWORD                InSendMessageEx(                    LPVOID lpReserved);
  BOOL                 PeekMessage(                        LPMSG lpMsg, HWND hWnd, UINT wMsgFilterMin, UINT wMsgFilterMax, PeekMessageFlag wRemoveMsg);
  BOOL                 PostMessage(                        HWND hWnd, WinMsg Msg, WPARAM wParam, LPARAM lParam);
  VOID                 PostQuitMessage(                    int nExitCode);
  BOOL                 PostThreadMessage(                  DWORD idThread, WinMsg Msg, WPARAM wParam, LPARAM lParam);
  UINT                 RegisterWindowMessage(              LPCTSTR lpString);
  BOOL                 ReplyMessage(                       LRESULT lResult);
  LRESULT              SendMessage(                        HWND hWnd, WinMsg Msg, WPARAM wParam, LPARAM lParam);
  BOOL                 SendMessageCallback(                HWND hWnd, WinMsg Msg, WPARAM wParam, LPARAM lParam, SENDASYNCPROC lpCallBack, ULONG_PTR dwData);
  LRESULT              SendMessageTimeout(                 HWND hWnd, WinMsg Msg, WPARAM wParam, LPARAM lParam, SendMessageTimeoutFlags fuFlags, UINT uTimeout, PDWORD_PTR lpdwResult);
  BOOL                 SendNotifyMessage(                  HWND hWnd, WinMsg Msg, WPARAM wParam, LPARAM lParam);
  LPARAM               SetMessageExtraInfo(                LPARAM lParam);
  BOOL                 TranslateMessage(                   MSG* lpMsg);
  BOOL                 WaitMessage(                        );
  DWORD                GetGuiResources(                    ProcessHandle hProcess, DWORD uiFlags);
  BOOL                 AttachThreadInput(                  DWORD idAttach, DWORD idAttachTo, BOOL fAttach);
  DWORD                WaitForInputIdle(                   ProcessHandle hProcess, WaitTimeout dwMilliseconds);
  BOOL                 IsWow64Message(                     );
  BOOL                 UserHandleGrantAccess(              HANDLE hUserHandle, HANDLE hJob, BOOL bGrant);
  BOOL                 AdjustWindowRect(                   LPRECT lpRect, WindowStyle dwStyle, BOOL bMenu);
  BOOL                 AdjustWindowRectEx(                 LPRECT lpRect, WindowStyle dwStyle, BOOL bMenu, WindowExStyle dwExStyle);
  VOID                 AllowActivateDetachQueuesSetFocus(  );
  BOOL                 AllowSetForegroundWindow(           DWORD dwProcessId);
  BOOL                 AnimateWindow(                      HWND hwnd, DWORD dwTime, AnimateWindowFlags dwFlags);
  BOOL                 AnyPopup(                           );
  UINT                 ArrangeIconicWindows(               HWND hWnd);
  HDWP                 BeginDeferWindowPos(                int nNumWindows);
  BOOL                 BringWindowToTop(                   HWND hWnd);
  BOOL                 CalculatePopupWindowPosition(       POINT* anchorPoint, SIZE* windowSize, TrackPopupMenuFlags flags, RECT* excludeRect, RECT* popupWindowPosition);
  WORD                 CascadeWindows(                     HWND hwndParent, UINT wHow, RECT* lpRect, UINT cKids, HWND* lpKids);
  BOOL                 ChangeWindowMessageFilter(          UINT message, WindowMessageFilterEnum dwFlag);
  BOOL                 ChangeWindowMessageFilterEx(        HWND hWnd, UINT message, DWORD action, PCHANGEFILTERSTRUCT pChangeFilterStruct);
  HWND                 ChildWindowFromPoint(               HWND hWndParent, POINT Point);
  HWND                 ChildWindowFromPointEx(             HWND hwndParent, POINT pt, UINT uFlags);
  BOOL                 CloseWindow(                        HWND hWnd);
  HWND                 CreateWindow(                       LPCTSTR lpClassName, LPCTSTR lpWindowName, DWORD dwStyle, CreateWindow_CW x, CreateWindow_CW y, CreateWindow_CW nWidth, CreateWindow_CW nHeight, HWND hWndParent, HMENU hMenu, HINSTANCE hInstance, LPVOID lpParam);
  HWND                 CreateWindowEx(                     WindowExStyle dwExStyle, LPCTSTR lpClassName, LPCTSTR lpWindowName, WindowStyle dwStyle, CreateWindow_CW x, CreateWindow_CW y, CreateWindow_CW nWidth, CreateWindow_CW nHeight, HWND hWndParent, HMENU hMenu, HINSTANCE hInstance, LPVOID lpParam);
  HDWP                 DeferWindowPos(                     HDWP hWinPosInfo, HWND hWnd, HwndInsertAfterEnum hWndInsertAfter, int x, int y, int cx, int cy, SetWindowPosFlags uFlags);
  BOOL                 DeregisterShellHookWindow(          HWND hWnd);
  BOOL                 DestroyWindow(                      HWND hWnd);
  BOOL                 EndDeferWindowPos(                  HDWP hWinPosInfo);
  BOOL                 EndTask(                            HWND hWnd, BOOL fShutDown, BOOL fForce);
  BOOL                 EnumChildWindows(                   HWND hWndParent, WNDENUMPROC lpEnumFunc, LPARAM lParam);
  BOOL                 EnumThreadWindows(                  DWORD dwThreadId, WNDENUMPROC lpfn, LPARAM lParam);
  BOOL                 EnumWindows(                        WNDENUMPROC lpEnumFunc, LPARAM lParam);
  HWND                 FindWindow(                         LPCTSTR lpClassName, LPCTSTR lpWindowName);
  HWND                 FindWindowEx(                       HWND hwndParent, HWND hwndChildAfter, LPCTSTR lpszClass, LPCTSTR lpszWindow);
  BOOL                 GetAltTabInfo(                      HWND hwnd, int iItem, PALTTABINFO pati, LPTSTR pszItemText, UINT cchItemText);
  HWND                 GetAncestor(                        HWND hwnd, GetAncestorEnum gaFlags);
  BOOL                 GetClientRect(                      HWND hWnd, LPRECT lpRect);
  HWND                 GetDesktopWindow(                   );
  HWND                 GetForegroundWindow(                );
  BOOL                 GetGUIThreadInfo(                   DWORD idThread, LPGUITHREADINFO lpgui);
  HWND                 GetLastActivePopup(                 HWND hWnd);
  BOOL                 GetLayeredWindowAttributes(         HWND hwnd, COLORREF* pcrKey, BYTE* pbAlpha, LayeredWindowAttribute* pdwFlags);
  HWND                 GetParent(                          HWND hWnd);
  BOOL                 GetProcessDefaultLayout(            DWORD* pdwDefaultLayout);
  HWND                 GetShellWindow(                     );
  BOOL                 GetTitleBarInfo(                    HWND hwnd, PTITLEBARINFO pti);
  HWND                 GetTopWindow(                       HWND hWnd);
  HWND                 GetWindow(                          HWND hWnd, GetWindowEnum uCmd);
  BOOL                 GetWindowDisplayAffinity(           HWND hWnd, DWORD* dwAffinity);
  BOOL                 GetWindowInfo(                      HWND hwnd, PWINDOWINFO pwi);
  UINT                 GetWindowModuleFileName(            HWND hwnd, LPTSTR lpszFileName, UINT cchFileNameMax);
  BOOL                 GetWindowPlacement(                 HWND hWnd, WINDOWPLACEMENT* lpwndpl);
  BOOL                 GetWindowRect(                      HWND hWnd, LPRECT lpRect);
  int                  GetWindowText(                      HWND hWnd, LPTSTR lpString, int nMaxCount);
  int                  GetWindowTextLength(                HWND hWnd);
  DWORD                GetWindowThreadProcessId(           HWND hWnd, LPDWORD lpdwProcessId);
  int                  InternalGetWindowText(              HWND hWnd, LPWSTR lpString, int nMaxCount);
  BOOL                 IsChild(                            HWND hWndParent, HWND hWnd);
  BOOL                 IsGUIThread(                        BOOL bConvert);
  BOOL                 IsHungAppWindow(                    HWND hWnd);
  BOOL                 IsIconic(                           HWND hWnd);
  BOOL                 IsProcessDPIAware(                  );
  BOOL                 IsWindow(                           HWND hWnd);
  BOOL                 IsWindowUnicode(                    HWND hWnd);
  BOOL                 IsWindowVisible(                    HWND hWnd);
  BOOL                 IsZoomed(                           HWND hWnd);
  BOOL                 LockSetForegroundWindow(            LockSetForegroundWindowCode uLockCode);
  void                 LogicalToPhysicalPoint(             HWND hWnd, LPPOINT lpPoint);
  BOOL                 MoveWindow(                         HWND hWnd, int X, int Y, int nWidth, int nHeight, BOOL bRepaint);
  BOOL                 OpenIcon(                           HWND hWnd);
  void                 PhysicalToLogicalPoint(             HWND hWnd, LPPOINT lpPoint);
  HWND                 RealChildWindowFromPoint(           HWND hwndParent, POINT ptParentClientCoords);
  UINT                 RealGetWindowClass(                 HWND hwnd, LPTSTR pszType, UINT cchType);
  BOOL                 RegisterShellHookWindow(            HWND hWnd);
  BOOL                 SetForegroundWindow(                HWND hWnd);
  BOOL                 SetLayeredWindowAttributes(         HWND hwnd, COLORREF crKey, BYTE bAlpha, LayeredWindowAttribute dwFlags);
  HWND                 SetParent(                          HWND hWndChild, HWND hWndNewParent);
  BOOL                 SetProcessDefaultLayout(            DWORD dwDefaultLayout);
  BOOL                 SetProcessDPIAware(                 );
  BOOL                 SetWindowDisplayAffinity(           HWND hWnd, DWORD dwAffinity);
  BOOL                 SetWindowPlacement(                 HWND hWnd, WINDOWPLACEMENT* lpwndpl);
  BOOL                 SetWindowPos(                       HWND hWnd, HwndInsertAfterEnum hWndInsertAfter, int X, int Y, int cx, int cy, SetWindowPosFlags uFlags);
  BOOL                 SetWindowText(                      HWND hWnd, LPCTSTR lpString);
  BOOL                 ShowOwnedPopups(                    HWND hWnd, BOOL fShow);
  BOOL                 ShowWindow(                         HWND hWnd, ShowWindowCmd nCmdShow);
  BOOL                 ShowWindowAsync(                    HWND hWnd, int nCmdShow);
  BOOL                 SoundSentry(                        );
  VOID                 SwitchToThisWindow(                 HWND hWnd, BOOL fAltTab);
  WORD                 TileWindows(                        HWND hwndParent, UINT wHow, RECT* lpRect, UINT cKids, HWND* lpKids);
  BOOL                 UpdateLayeredWindow(                HWND hwnd, HDC hdcDst, POINT* pptDst, SIZE* psize, HDC hdcSrc, POINT* pptSrc, COLORREF crKey, BLENDFUNCTION* pblend, UpdateLayeredWindowFlags dwFlags);
  BOOL                 UpdateLayeredWindowIndirect(        HWND hwnd, UPDATELAYEREDWINDOWINFO* pULWInfo);
  HWND                 WindowFromPhysicalPoint(            POINT Point);
  HWND                 WindowFromPoint(                    POINT Point);
  BOOL                 ExitWindowsEx(                      ExitWindowsExFlags uFlags, ExitWindowsExReason dwReason);
  BOOL                 LockWorkStation(                    );
  BOOL                 ShutdownBlockReasonCreate(          HWND hWnd, LPCWSTR pwszReason);
  BOOL                 ShutdownBlockReasonDestroy(         HWND hWnd);
  BOOL                 ShutdownBlockReasonQuery(           HWND hWnd, LPWSTR pwszBuff, DWORD* pcchBuff);
  HBITMAP              LoadBitmap(                         HINSTANCE hInstance, LoadBitmapString_LPCTSTR lpBitmapName);
  HBRUSH               GetSysColorBrush(                   SysColorIndex nIndex);
  BOOL                 CheckDlgButton(                     HWND hDlg, int nIDButton, ButtonState uCheck);
  BOOL                 CheckRadioButton(                   HWND hDlg, int nIDFirstButton, int nIDLastButton, int nIDCheckButton);
  UINT                 IsDlgButtonChecked(                 HWND hDlg, int nIDButton);
  BOOL                 CreateCaret(                        HWND hWnd, HBITMAP hBitmap, int nWidth, int nHeight);
  BOOL                 DestroyCaret(                       );
  UINT                 GetCaretBlinkTime(                  );
  BOOL                 GetCaretPos(                        LPPOINT lpPoint);
  BOOL                 HideCaret(                          HWND hWnd);
  BOOL                 SetCaretBlinkTime(                  UINT uMSeconds);
  BOOL                 SetCaretPos(                        int X, int Y);
  BOOL                 ShowCaret(                          HWND hWnd);
  BOOL                 AddClipboardFormatListener(         HWND hwnd);
  BOOL                 ChangeClipboardChain(               HWND hWndRemove, HWND hWndNewNext);
  BOOL                 CloseClipboard(                     );
  int                  CountClipboardFormats(              );
  BOOL                 EmptyClipboard(                     );
  UINT                 EnumClipboardFormats(               UINT format);
  HANDLE               GetClipboardData(                   ClipboardFormat uFormat);
  int                  GetClipboardFormatName(             UINT format, LPTSTR lpszFormatName, int cchMaxCount);
  HWND                 GetClipboardOwner(                  );
  DWORD                GetClipboardSequenceNumber(         );
  HWND                 GetClipboardViewer(                 );
  HWND                 GetOpenClipboardWindow(             );
  int                  GetPriorityClipboardFormat(         UINT* paFormatPriorityList, int cFormats);
  BOOL                 GetUpdatedClipboardFormats(         PUINT lpuiFormats, UINT cFormats, PUINT pcFormatsOut);
  BOOL                 IsClipboardFormatAvailable(         ClipboardFormat format);
  BOOL                 OpenClipboard(                      HWND hWndNewOwner);
  UINT                 RegisterClipboardFormat(            LPCTSTR lpszFormat);
  BOOL                 RemoveClipboardFormatListener(      HWND hwnd);
  HANDLE               SetClipboardData(                   ClipboardFormat uFormat, HANDLE hMem);
  HWND                 SetClipboardViewer(                 HWND hWndNewViewer);
  int                  DlgDirListComboBox(                 HWND hDlg, LPTSTR lpPathSpec, int nIDComboBox, int nIDStaticPath, UINT uFiletype);
  BOOL                 DlgDirSelectComboBoxEx(             HWND hDlg, LPTSTR lpString, int nCount, int nIDComboBox);
  BOOL                 GetComboBoxInfo(                    HWND hwndCombo, PCOMBOBOXINFO pcbi);
  BOOL                 ClientToScreen(                     HWND hWnd, LPPOINT lpPoint);
  int                  MapWindowPoints(                    HWND hWndFrom, HWND hWndTo, LPPOINT lpPoints, UINT cPoints);
  BOOL                 ScreenToClient(                     HWND hWnd, LPPOINT lpPoint);
  BOOL                 ClipCursor(                         RECT* lpRect);
  HCURSOR              CopyCursor(                         HCURSOR pcur);
  HCURSOR              CreateCursor(                       HINSTANCE hInst, int xHotSpot, int yHotSpot, int nWidth, int nHeight, VOID* pvANDPlane, VOID* pvXORPlane);
  BOOL                 DestroyCursor(                      HCURSOR hCursor);
  BOOL                 GetClipCursor(                      LPRECT lpRect);
  HCURSOR              GetCursor(                          );
  BOOL                 GetCursorInfo(                      PCURSORINFO pci);
  BOOL                 GetCursorPos(                       LPPOINT lpPoint);
  BOOL                 GetPhysicalCursorPos(               LPPOINT lpPoint);
  HCURSOR              LoadCursor(                         HINSTANCE hInstance, LoadCursorString_LPCTSTR lpCursorName);
  HCURSOR              LoadCursorFromFile(                 LPCTSTR lpFileName);
  HCURSOR              SetCursor(                          HCURSOR hCursor);
  BOOL                 SetCursorPos(                       int X, int Y);
  BOOL                 SetPhysicalCursorPos(               int X, int Y);
  BOOL                 SetSystemCursor(                    HCURSOR hcur, CursorId id);
  int                  ShowCursor(                         BOOL bShow);
  LONG                 ChangeDisplaySettings(              DEVMODE* lpDevMode, DWORD dwflags);
  LONG                 ChangeDisplaySettingsEx(            LPCTSTR lpszDeviceName, DEVMODE* lpDevMode, HWND hwnd, DWORD dwflags, LPVOID lParam);
  BOOL                 EnumDisplayDevices(                 LPCTSTR lpDevice, DWORD iDevNum, PDISPLAY_DEVICE lpDisplayDevice, EnumDisplayDevicesFlags dwFlags);
  BOOL                 EnumDisplaySettings(                LPCTSTR lpszDeviceName, EnumDisplaySettingsEnum iModeNum, DEVMODE* lpDevMode);
  BOOL                 EnumDisplaySettingsEx(              LPCTSTR lpszDeviceName, DWORD iModeNum, DEVMODE* lpDevMode, DWORD dwFlags);
  HDC                  GetDC(                              HWND hWnd);
  HDC                  GetDCEx(                            HWND hWnd, HRGN hrgnClip, DCExFlags flags);
  int                  ReleaseDC(                          HWND hWnd, HDC hDC);
  HDEVNOTIFY           RegisterDeviceNotification(         HANDLE hRecipient, LPVOID NotificationFilter, DeviceNotificationFlags Flags);
  BOOL                 UnregisterDeviceNotification(       HDEVNOTIFY Handle);
  BOOL                 DdeSetQualityOfService(             HWND hwndClient, SECURITY_QUALITY_OF_SERVICE* pqosNew, PSECURITY_QUALITY_OF_SERVICE pqosPrev);
  BOOL                 FreeDDElParam(                      UINT msg, LPARAM lParam);
  BOOL                 ImpersonateDdeClientWindow(         HWND hWndClient, HWND hWndServer);
  LPARAM               PackDDElParam(                      UINT msg, UINT_PTR uiLo, UINT_PTR uiHi);
  LPARAM               ReuseDDElParam(                     LPARAM lParam, UINT msgIn, UINT msgOut, UINT_PTR uiLo, UINT_PTR uiHi);
  BOOL                 UnpackDDElParam(                    UINT msg, LPARAM lParam, PUINT_PTR puiLo, PUINT_PTR puiHi);
  BOOL                 DdeAbandonTransaction(              DWORD idInst, HCONV hConv, DWORD idTransaction);
  LPBYTE               DdeAccessData(                      HDDEDATA hData, LPDWORD pcbDataSize);
  HDDEDATA             DdeAddData(                         HDDEDATA hData, LPBYTE pSrc, DWORD cb, DWORD cbOff);
  HDDEDATA             DdeClientTransaction(               LPBYTE pData, DWORD cbData, HCONV hConv, HSZ hszItem, UINT wFmt, UINT wType, DWORD dwTimeout, LPDWORD pdwResult);
  int                  DdeCmpStringHandles(                HSZ hsz1, HSZ hsz2);
  HCONV                DdeConnect(                         DWORD idInst, HSZ hszService, HSZ hszTopic, PCONVCONTEXT pCC);
  HCONVLIST            DdeConnectList(                     DWORD idInst, HSZ hszService, HSZ hszTopic, HCONVLIST hConvList, PCONVCONTEXT pCC);
  HDDEDATA             DdeCreateDataHandle(                DWORD idInst, LPBYTE pSrc, DWORD cb, DWORD cbOff, HSZ hszItem, UINT wFmt, UINT afCmd);
  HSZ                  DdeCreateStringHandle(              DWORD idInst, LPTSTR psz, int iCodePage);
  BOOL                 DdeDisconnect(                      HCONV hConv);
  BOOL                 DdeDisconnectList(                  HCONVLIST hConvList);
  BOOL                 DdeEnableCallback(                  DWORD idInst, HCONV hConv, UINT wCmd);
  BOOL                 DdeFreeDataHandle(                  HDDEDATA hData);
  BOOL                 DdeFreeStringHandle(                DWORD idInst, HSZ hsz);
  DWORD                DdeGetData(                         HDDEDATA hData, LPBYTE pDst, DWORD cbMax, DWORD cbOff);
  UINT                 DdeGetLastError(                    DWORD idInst);
  BOOL                 DdeImpersonateClient(               HCONV hConv);
  UINT                 DdeInitialize(                      LPDWORD pidInst, PFNCALLBACK pfnCallback, DWORD afCmd, DWORD ulRes);
  BOOL                 DdeKeepStringHandle(                DWORD idInst, HSZ hsz);
  HDDEDATA             DdeNameService(                     DWORD idInst, UINT hsz1, UINT hsz2, UINT afCmd);
  BOOL                 DdePostAdvise(                      DWORD idInst, HSZ hszTopic, HSZ hszItem);
  UINT                 DdeQueryConvInfo(                   HCONV hConv, DWORD idTransaction, PCONVINFO pConvInfo);
  HCONV                DdeQueryNextServer(                 HCONVLIST hConvList, HCONV hConvPrev);
  DWORD                DdeQueryString(                     DWORD idInst, HSZ hsz, LPTSTR psz, DWORD cchMax, int iCodePage);
  HCONV                DdeReconnect(                       HCONV hConv);
  BOOL                 DdeSetUserHandle(                   HCONV hConv, DWORD id, DWORD_PTR hUser);
  BOOL                 DdeUnaccessData(                    HDDEDATA hData);
  BOOL                 DdeUninitialize(                    DWORD idInst);
  BOOL                 FlashWindow(                        HWND hWnd, BOOL bInvert);
  BOOL                 FlashWindowEx(                      PFLASHWINFO pfwi);
  BOOL                 MessageBeep(                        UINT uType);
  void                 SetLastErrorEx(                     ERROR_CODE dwErrCode, SET_LAST_ERROR_EX_TYPE dwType);
  int                  FillRect(                           HDC hDC, RECT* lprc, HBRUSH hbr);
  int                  FrameRect(                          HDC hDC, RECT* lprc, HBRUSH hbr);
  BOOL                 InvertRect(                         HDC hDC, RECT* lprc);
  int                  DrawText(                           HDC hDC, LPCTSTR lpchText, int nCount, LPRECT lpRect, DrawTextFlags uFormat);
  int                  DrawTextEx(                         HDC hdc, LPTSTR lpchText, int cchText, LPRECT lprc, DrawTextFlags dwDTFormat, LPDRAWTEXTPARAMS lpDTParams);
  DWORD                GetTabbedTextExtent(                HDC hDC, LPCTSTR lpString, int nCount, int nTabPositions, LPINT lpnTabStopPositions);
  LONG                 TabbedTextOut(                      HDC hDC, int X, int Y, LPCTSTR lpString, int nCount, int nTabPositions, LPINT lpnTabStopPositions, int nTabOrigin);
  BOOL                 CallMsgFilter(                      LPMSG lpMsg, int nCode);
  LRESULT              CallNextHookEx(                     HHOOK hhk, int nCode, WPARAM wParam, LPARAM lParam);
  HHOOK                SetWindowsHookEx(                   WindowsHook idHook, HOOKPROC lpfn, HINSTANCE hMod, DWORD dwThreadId);
  BOOL                 UnhookWindowsHookEx(                HHOOK hhk);
  HICON                CopyIcon(                           HICON hIcon);
  HICON                CreateIcon(                         HINSTANCE hInstance, int nWidth, int nHeight, BYTE cPlanes, BYTE cBitsPixel, BYTE* lpbANDbits, BYTE* lpbXORbits);
  HICON                CreateIconFromResource(             PBYTE presbits, DWORD dwResSize, BOOL fIcon, DWORD dwVer);
  HICON                CreateIconFromResourceEx(           PBYTE pbIconBits, DWORD cbIconBits, BOOL fIcon, DWORD dwVersion, int cxDesired, int cyDesired, UINT uFlags);
  HICON                CreateIconIndirect(                 PICONINFO piconinfo);
  BOOL                 DestroyIcon(                        HICON hIcon);
  BOOL                 DrawIcon(                           HDC hDC, int X, int Y, HICON hIcon);
  BOOL                 DrawIconEx(                         HDC hdc, int xLeft, int yTop, HICON hIcon, int cxWidth, int cyWidth, UINT istepIfAniCur, HBRUSH hbrFlickerFreeDraw, DrawIconFlags diFlags);
  BOOL                 GetIconInfo(                        HICON hIcon, PICONINFO piconinfo);
  BOOL                 GetIconInfoEx(                      HICON hIcon, PICONINFOEX piconinfoex);
  HICON                LoadIcon(                           HINSTANCE hInstance, LoadIconString_LPCTSTR lpIconName);
  int                  LookupIconIdFromDirectory(          PBYTE presbits, BOOL fIcon);
  int                  LookupIconIdFromDirectoryEx(        PBYTE presbits, BOOL fIcon, int cxDesired, int cyDesired, LRFlags Flags);
  UINT                 PrivateExtractIcons(                LPCTSTR lpszFile, int nIconIndex, int cxIcon, int cyIcon, HICON* phicon, UINT* piconid, UINT nIcons, LRFlags flags);
  int                  CopyAcceleratorTable(               HACCEL hAccelSrc, LPACCEL lpAccelDst, int cAccelEntries);
  HACCEL               CreateAcceleratorTable(             LPACCEL lpaccl, int cEntries);
  BOOL                 DestroyAcceleratorTable(            HACCEL hAccel);
  HACCEL               LoadAccelerators(                   HINSTANCE hInstance, LPCTSTR lpTableName);
  int                  TranslateAccelerator(               HWND hWnd, HACCEL hAccTable, LPMSG lpMsg);
  HKL                  ActivateKeyboardLayout(             KeyboardLayoutHandle hkl, KeyboardLayoutFlags Flags);
  BOOL                 BlockInput(                         BOOL fBlockIt);
  BOOL                 EnableWindow(                       HWND hWnd, BOOL bEnable);
  HWND                 GetActiveWindow(                    );
  SHORT                GetAsyncKeyState(                   VirtKeyCode vKey);
  HWND                 GetFocus(                           );
  UINT                 GetKBCodePage(                      );
  HKL                  GetKeyboardLayout(                  DWORD idThread);
  UINT                 GetKeyboardLayoutList(              int nBuff, HKL* lpList);
  BOOL                 GetKeyboardLayoutName(              LPTSTR pwszKLID);
  BOOL                 GetKeyboardState(                   PBYTE lpKeyState);
  int                  GetKeyNameText(                     LONG lParam, LPTSTR lpString, int nSize);
  SHORT                GetKeyState(                        VirtKeyCode nVirtKey);
  BOOL                 GetLastInputInfo(                   PLASTINPUTINFO plii);
  BOOL                 IsWindowEnabled(                    HWND hWnd);
  VOID                 keybd_event(                        BYTE bVk, BYTE bScan, DWORD dwFlags, ULONG_PTR dwExtraInfo);
  HKL                  LoadKeyboardLayout(                 LPCTSTR pwszKLID, KeyboardLayoutFlags Flags);
  UINT                 MapVirtualKey(                      UINT uCode, MapVirtualKeyType uMapType);
  UINT                 MapVirtualKeyEx(                    UINT uCode, MapVirtualKeyType uMapType, HKL dwhkl);
  DWORD                OemKeyScan(                         WORD wOemChar);
  BOOL                 RegisterHotKey(                     HWND hWnd, int id, UINT fsModifiers, UINT vk);
  UINT                 SendInput(                          UINT nInputs, LPINPUT pInputs, int cbSize);
  HWND                 SetActiveWindow(                    HWND hWnd);
  HWND                 SetFocus(                           HWND hWnd);
  BOOL                 SetKeyboardState(                   LPBYTE lpKeyState);
  int                  ToAscii(                            UINT uVirtKey, UINT uScanCode, PBYTE lpKeyState, LPWORD lpChar, UINT uFlags);
  int                  ToAsciiEx(                          UINT uVirtKey, UINT uScanCode, PBYTE lpKeyState, LPWORD lpChar, UINT uFlags, HKL dwhkl);
  int                  ToUnicode(                          UINT wVirtKey, UINT wScanCode, PBYTE lpKeyState, LPWSTR pwszBuff, int cchBuff, UINT wFlags);
  int                  ToUnicodeEx(                        UINT wVirtKey, UINT wScanCode, PBYTE lpKeyState, LPWSTR pwszBuff, int cchBuff, UINT wFlags, HKL dwhkl);
  BOOL                 UnloadKeyboardLayout(               HKL hkl);
  BOOL                 UnregisterHotKey(                   HWND hWnd, int id);
  SHORT                VkKeyScan(                          TCHAR ch);
  SHORT                VkKeyScanEx(                        TCHAR ch, HKL dwhkl);
  int                  DlgDirList(                         HWND hDlg, LPTSTR lpPathSpec, int nIDListBox, int nIDStaticPath, UINT uFileType);
  BOOL                 DlgDirSelectEx(                     HWND hDlg, LPTSTR lpString, int nCount, int nIDListBox);
  DWORD                GetListBoxInfo(                     HWND hwnd);
  BOOL                 AppendMenu(                         HMENU hMenu, UINT uFlags, UINT_PTR uIDNewItem, LPCTSTR lpNewItem);
  DWORD                CheckMenuItem(                      HMENU hmenu, UINT uIDCheckItem, CheckMenuItemFlag uCheck);
  BOOL                 CheckMenuRadioItem(                 HMENU hmenu, UINT idFirst, UINT idLast, UINT idCheck, MenuCommandPosFlag uFlags);
  HMENU                CreateMenu(                         );
  HMENU                CreatePopupMenu(                    );
  BOOL                 DeleteMenu(                         HMENU hMenu, UINT uPosition, MenuCommandPosFlag uFlags);
  BOOL                 DestroyMenu(                        HMENU hMenu);
  BOOL                 DrawMenuBar(                        HWND hWnd);
  EnableMenuItemResult EnableMenuItem(                     HMENU hMenu, UINT uIDEnableItem, EnableMenuItemFlag uEnable);
  BOOL                 EndMenu(                            );
  HMENU                GetMenu(                            HWND hWnd);
  BOOL                 GetMenuBarInfo(                     HWND hwnd, ObjectIdEnum idObject, LONG idItem, PMENUBARINFO pmbi);
  LONG                 GetMenuCheckMarkDimensions(         );
  UINT                 GetMenuDefaultItem(                 HMENU hMenu, UINT fByPos, GetMenuDefaultItemFlags gmdiFlags);
  BOOL                 GetMenuInfo(                        HMENU hmenu, LPCMENUINFO lpcmi);
  int                  GetMenuItemCount(                   HMENU hMenu);
  UINT                 GetMenuItemID(                      HMENU hMenu, int nPos);
  BOOL                 GetMenuItemInfo(                    HMENU hMenu, UINT uItem, BOOL fByPosition, LPMENUITEMINFO lpmii);
  BOOL                 GetMenuItemRect(                    HWND hWnd, HMENU hMenu, UINT uItem, LPRECT lprcItem);
  UINT                 GetMenuState(                       HMENU hMenu, UINT uId, MenuCommandPosFlag uFlags);
  int                  GetMenuString(                      HMENU hMenu, UINT uIDItem, LPTSTR lpString, int nMaxCount, UINT uFlag);
  HMENU                GetSubMenu(                         HMENU hMenu, int nPos);
  HMENU                GetSystemMenu(                      HWND hWnd, BOOL bRevert);
  BOOL                 HiliteMenuItem(                     HWND hwnd, HMENU hmenu, UINT uItemHilite, UINT uHilite);
  BOOL                 InsertMenu(                         HMENU hMenu, UINT uPosition, InsertMenuFlags uFlags, UINT_PTR uIDNewItem, LPCTSTR lpNewItem);
  BOOL                 InsertMenuItem(                     HMENU hMenu, UINT uItem, BOOL fByPosition, LPCMENUITEMINFO lpmii);
  BOOL                 IsMenu(                             HMENU hMenu);
  HMENU                LoadMenu(                           HINSTANCE hInstance, LPCTSTR lpMenuName);
  HMENU                LoadMenuIndirect(                   MENUTEMPLATE* lpMenuTemplate);
  int                  MenuItemFromPoint(                  HWND hWnd, HMENU hMenu, POINT ptScreen);
  BOOL                 ModifyMenu(                         HMENU hMnu, UINT uPosition, UINT uFlags, UINT_PTR uIDNewItem, LPCTSTR lpNewItem);
  BOOL                 RemoveMenu(                         HMENU hMenu, UINT uPosition, MenuCommandPosFlag uFlags);
  BOOL                 SetMenu(                            HWND hWnd, HMENU hMenu);
  BOOL                 SetMenuDefaultItem(                 HMENU hMenu, UINT uItem, UINT fByPos);
  BOOL                 SetMenuInfo(                        HMENU hmenu, LPCMENUINFO lpcmi);
  BOOL                 SetMenuItemBitmaps(                 HMENU hMenu, UINT uPosition, UINT uFlags, HBITMAP hBitmapUnchecked, HBITMAP hBitmapChecked);
  BOOL                 SetMenuItemInfo(                    HMENU hMenu, UINT uItem, BOOL fByPosition, LPMENUITEMINFO lpmii);
  BOOL                 TrackPopupMenu(                     HMENU hMenu, TrackPopupMenuFlags uFlags, int x, int y, int nReserved, HWND hWnd, RECT* prcRect);
  BOOL                 TrackPopupMenuEx(                   HMENU hmenu, TrackPopupMenuFlags fuFlags, int x, int y, HWND hwnd, LPTPMPARAMS lptpm);
  BOOL                 DragDetect(                         HWND hwnd, POINT pt);
  HWND                 GetCapture(                         );
  UINT                 GetDoubleClickTime(                 );
  int                  GetMouseMovePointsEx(               UINT cbSize, LPMOUSEMOVEPOINT lppt, LPMOUSEMOVEPOINT lpptBuf, int nBufPoints, DWORD resolution);
  VOID                 mouse_event(                        DWORD dwFlags, DWORD dx, DWORD dy, DWORD dwData, ULONG_PTR dwExtraInfo);
  BOOL                 ReleaseCapture(                     );
  HWND                 SetCapture(                         HWND hWnd);
  BOOL                 SetDoubleClickTime(                 UINT uInterval);
  BOOL                 SwapMouseButton(                    BOOL fSwap);
  BOOL                 TrackMouseEvent(                    LPTRACKMOUSEEVENT lpEventTrack);
  BOOL                 EnumDisplayMonitors(                HDC hdc, LPCRECT lprcClip, MONITORENUMPROC lpfnEnum, LPARAM dwData);
  BOOL                 GetMonitorInfo(                     HMONITOR hMonitor, LPMONITORINFO lpmi);
  HMONITOR             MonitorFromPoint(                   POINT pt, MonitorFlags dwFlags);
  HMONITOR             MonitorFromRect(                    LPCRECT lprc, MonitorFlags dwFlags);
  HMONITOR             MonitorFromWindow(                  HWND hwnd, MonitorFlags dwFlags);
  HWND                 CreateMDIWindow(                    LPCTSTR lpClassName, LPCTSTR lpWindowName, DWORD dwStyle, int X, int Y, int nWidth, int nHeight, HWND hWndParent, HINSTANCE hInstance, LPARAM lParam);
  LRESULT              DefFrameProc(                       HWND hWnd, HWND hWndMDIClient, UINT uMsg, WPARAM wParam, LPARAM lParam);
  LRESULT              DefMDIChildProc(                    HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam);
  BOOL                 TranslateMDISysAccel(               HWND hWndClient, LPMSG lpMsg);
  HDC                  BeginPaint(                         HWND hwnd, LPPAINTSTRUCT lpPaint);
  BOOL                 DrawAnimatedRects(                  HWND hwnd, int idAni, RECT* lprcFrom, RECT* lprcTo);
  BOOL                 DrawCaption(                        HWND hwnd, HDC hdc, LPCRECT lprc, UINT uFlags);
  BOOL                 DrawEdge(                           HDC hdc, LPRECT qrc, BorderEdge edge, BorderFlag grfFlags);
  BOOL                 DrawFocusRect(                      HDC hDC, RECT* lprc);
  BOOL                 DrawFrameControl(                   HDC hdc, LPRECT lprc, UINT uType, UINT uState);
  BOOL                 DrawState(                          HDC hdc, HBRUSH hbr, DRAWSTATEPROC lpOutputFunc, LPARAM lData, WPARAM wData, int x, int y, int cx, int cy, DrawStateFlags fuFlags);
  BOOL                 EndPaint(                           HWND hWnd, PAINTSTRUCT* lpPaint);
  WindowRegion         ExcludeUpdateRgn(                   HDC hDC, HWND hWnd);
  BOOL                 GetUpdateRect(                      HWND hWnd, LPRECT lpRect, BOOL bErase);
  WindowRegion         GetUpdateRgn(                       HWND hWnd, HRGN hRgn, BOOL bErase);
  HDC                  GetWindowDC(                        HWND hWnd);
  WindowRegion         GetWindowRgn(                       HWND hWnd, HRGN hRgn);
  WindowRegion         GetWindowRgnBox(                    HWND hWnd, LPRECT lprc);
  BOOL                 GrayString(                         HDC hDC, HBRUSH hBrush, GRAYSTRINGPROC lpOutputFunc, LPARAM lpData, int nCount, int X, int Y, int nWidth, int nHeight);
  BOOL                 InvalidateRect(                     HWND hWnd, RECT* lpRect, BOOL bErase);
  BOOL                 InvalidateRgn(                      HWND hWnd, HRGN hRgn, BOOL bErase);
  BOOL                 LockWindowUpdate(                   HWND hWndLock);
  BOOL                 PaintDesktop(                       HDC hdc);
  BOOL                 RedrawWindow(                       HWND hWnd, RECT* lprcUpdate, HRGN hrgnUpdate, RedrawWindowFlags flags);
  int                  SetWindowRgn(                       HWND hWnd, HRGN hRgn, BOOL bRedraw);
  BOOL                 UpdateWindow(                       HWND hWnd);
  BOOL                 ValidateRect(                       HWND hWnd, RECT* lpRect);
  BOOL                 ValidateRgn(                        HWND hWnd, HRGN hRgn);
  HWND                 WindowFromDC(                       HDC hDC);
  HPOWERNOTIFY         RegisterPowerSettingNotification(   HANDLE hRecipient, LPCGUID PowerSettingGuid, DeviceNotificationFlags Flags);
  BOOL                 UnregisterPowerSettingNotification( HPOWERNOTIFY Handle);
  BOOL                 PrintWindow(                        HWND hwnd, HDC hdcBlt, UINT nFlags);
  LRESULT              DefRawInputProc(                    PRAWINPUT* paRawInput, INT nInput, UINT cbSizeHeader);
  UINT                 GetRawInputBuffer(                  PRAWINPUT pData, PUINT pcbSize, UINT cbSizeHeader);
  UINT                 GetRawInputData(                    HRAWINPUT hRawInput, UINT uiCommand, LPVOID pData, PUINT pcbSize, UINT cbSizeHeader);
  UINT                 GetRawInputDeviceInfo(              HANDLE hDevice, UINT uiCommand, LPVOID pData, PUINT pcbSize);
  UINT                 GetRawInputDeviceList(              PRAWINPUTDEVICELIST pRawInputDeviceList, PUINT puiNumDevices, UINT cbSize);
  UINT                 GetRegisteredRawInputDevices(       PRAWINPUTDEVICE pRawInputDevices, PUINT puiNumDevices, UINT cbSize);
  BOOL                 RegisterRawInputDevices(            PCRAWINPUTDEVICE pRawInputDevices, UINT uiNumDevices, UINT cbSize);
  BOOL                 CopyRect(                           LPRECT lprcDst, RECT* lprcSrc);
  BOOL                 EqualRect(                          RECT* lprc1, RECT* lprc2);
  BOOL                 InflateRect(                        LPRECT lprc, int dx, int dy);
  BOOL                 IntersectRect(                      LPRECT lprcDst, RECT* lprcSrc1, RECT* lprcSrc2);
  BOOL                 IsRectEmpty(                        RECT* lprc);
  BOOL                 OffsetRect(                         LPRECT lprc, int dx, int dy);
  BOOL                 PtInRect(                           RECT* lprc, POINT pt);
  BOOL                 SetRect(                            LPRECT lprc, int xLeft, int yTop, int xRight, int yBottom);
  BOOL                 SetRectEmpty(                       LPRECT lprc);
  BOOL                 SubtractRect(                       LPRECT lprcDst, RECT* lprcSrc1, RECT* lprcSrc2);
  BOOL                 UnionRect(                          LPRECT lprcDst, RECT* lprcSrc1, RECT* lprcSrc2);
  HANDLE               CopyImage(                          HANDLE hImage, ImageType uType, int cxDesired, int cyDesired, LRFlags fuFlags);
  HANDLE               LoadImage(                          HINSTANCE hinst, LoadImageString_LPCTSTR lpszName, ImageType uType, int cxDesired, int cyDesired, LRFlags fuLoad);
  BOOL                 EnableScrollBar(                    HWND hWnd, UINT wSBflags, UINT wArrows);
  BOOL                 GetScrollBarInfo(                   HWND hwnd, ObjectIdEnum idObject, PSCROLLBARINFO psbi);
  BOOL                 GetScrollInfo(                      HWND hwnd, SBType fnBar, LPSCROLLINFO lpsi);
  int                  GetScrollPos(                       HWND hWnd, SBType nBar);
  BOOL                 GetScrollRange(                     HWND hWnd, SBType nBar, LPINT lpMinPos, LPINT lpMaxPos);
  BOOL                 ScrollDC(                           HDC hDC, int dx, int dy, RECT* lprcScroll, RECT* lprcClip, HRGN hrgnUpdate, LPRECT lprcUpdate);
  BOOL                 ScrollWindow(                       HWND hWnd, int XAmount, int YAmount, RECT* lpRect, RECT* lpClipRect);
  int                  ScrollWindowEx(                     HWND hWnd, int dx, int dy, RECT* prcScroll, RECT* prcClip, HRGN hrgnUpdate, LPRECT prcUpdate, ScrollWindowFlags flags);
  int                  SetScrollInfo(                      HWND hwnd, SBType fnBar, LPCSCROLLINFO lpsi, BOOL fRedraw);
  int                  SetScrollPos(                       HWND hWnd, SBType nBar, int nPos, BOOL bRedraw);
  BOOL                 SetScrollRange(                     HWND hWnd, SBType nBar, int nMinPos, int nMaxPos, BOOL bRedraw);
  BOOL                 ShowScrollBar(                      HWND hWnd, SBType wBar, BOOL bShow);
  LPTSTR               CharLower(                          LPTSTR lpsz);
  DWORD                CharLowerBuff(                      LPTSTR lpsz, DWORD cchLength);
  LPTSTR               CharNext(                           LPCTSTR lpsz);
  LPSTR                CharNextExA(                        CodePageEnum CodePage, LPCSTR lpCurrentChar, DWORD dwFlags);
  LPTSTR               CharPrev(                           LPCTSTR lpszStart, LPCTSTR lpszCurrent);
  LPSTR                CharPrevExA(                        CodePageEnum CodePage, LPCSTR lpStart, LPCSTR lpCurrentChar, DWORD dwFlags);
  BOOL                 CharToOem(                          LPCTSTR lpszSrc, LPSTR lpszDst);
  BOOL                 CharToOemBuff(                      LPCTSTR lpszSrc, LPSTR lpszDst, DWORD cchDstLength);
  LPTSTR               CharUpper(                          LPTSTR lpsz);
  DWORD                CharUpperBuff(                      LPTSTR lpsz, DWORD cchLength);
  BOOL                 IsCharAlpha(                        TCHAR ch);
  BOOL                 IsCharAlphaNumeric(                 TCHAR ch);
  BOOL                 IsCharLower(                        TCHAR ch);
  BOOL                 IsCharUpper(                        TCHAR ch);
  int                  LoadString(                         HINSTANCE hInstance, UINT uID, LPTSTR lpBuffer, int nBufferMax);
  BOOL                 OemToChar(                          LPCSTR lpszSrc, LPTSTR lpszDst);
  BOOL                 OemToCharBuff(                      LPCTSTR lpszSrc, LPTSTR lpszDst, DWORD cchDstLength);
  int                  wsprintf(                           LPTSTR lpOut, LPCTSTR lpFmt);
  int                  wvsprintf(                          LPTSTR lpOutput, LPCTSTR lpFmt, va_list arglist);
  WAIT_RESULT          MsgWaitForMultipleObjects(          DWORD nCount, HANDLE* pHandles, BOOL bWaitAll, WaitTimeout dwMilliseconds, QueueStatusFlag dwWakeMask);
  WAIT_RESULT          MsgWaitForMultipleObjectsEx(        DWORD nCount, HANDLE* pHandles, WaitTimeout dwMilliseconds, QueueStatusFlag dwWakeMask, MsgWaitForMultipleObjectsFlags dwFlags);
  int                  GetKeyboardType(                    int nTypeFlag);
  DWORD                GetSysColor(                        SysColorIndex nIndex);
  int                  GetSystemMetrics(                   SystemMetricIndex nIndex);
  BOOL                 SetSysColors(                       int cElements, INT* lpaElements, COLORREF* lpaRgbValues);
  BOOL                 SystemParametersInfo(               SystemParametersInfoEnum uiAction, UINT uiParam, PVOID pvParam, SystemParametersInfoFlags fWinIni);
  BOOL                 KillTimer(                          HWND hWnd, UINT_PTR uIDEvent);
  UINT_PTR             SetTimer(                           HWND hWnd, UINT_PTR nIDEvent, UINT uElapse, TIMERPROC lpTimerFunc);
  BOOL                 GetClassInfo(                       HINSTANCE hInstance, LPCTSTR lpClassName, LPWNDCLASS lpWndClass);
  BOOL                 GetClassInfoEx(                     HINSTANCE hinst, LPCTSTR lpszClass, LPWNDCLASSEX lpwcx);
  DWORD                GetClassLong(                       HWND hWnd, ClassLongIndex nIndex);
  int                  GetClassName(                       HWND hWnd, LPTSTR lpClassName, int nMaxCount);
  WORD                 GetClassWord(                       HWND hWnd, ClassLongIndex nIndex);
  LONG                 GetWindowLong(                      HWND hWnd, WindowLongIndex nIndex);
  ATOM                 RegisterClass(                      WNDCLASS* lpWndClass);
  ATOM                 RegisterClassEx(                    WNDCLASSEX* lpwcx);
  DWORD                SetClassLong(                       HWND hWnd, ClassLongIndex nIndex, LONG dwNewLong);
  WORD                 SetClassWord(                       HWND hWnd, ClassLongIndex nIndex, WORD wNewWord);
  LONG                 SetWindowLong(                      HWND hWnd, WindowLongIndex nIndex, LONG dwNewLong);
  BOOL                 UnregisterClass(                    LPCTSTR lpClassName, HINSTANCE hInstance);
  LRESULT              CallWindowProc(                     WNDPROC lpPrevWndFunc, HWND hWnd, WinMsg Msg, WPARAM wParam, LPARAM lParam);
  LRESULT              DefWindowProc(                      HWND hWnd, WinMsg Msg, WPARAM wParam, LPARAM lParam);
  int                  EnumProps(                          HWND hWnd, PROPENUMPROC lpEnumFunc);
  int                  EnumPropsEx(                        HWND hWnd, PROPENUMPROCEX lpEnumFunc, LPARAM lParam);
  HANDLE               GetProp(                            HWND hWnd, LPCTSTR lpString);
  HANDLE               RemoveProp(                         HWND hWnd, LPCTSTR lpString);
  BOOL                 SetProp(                            HWND hWnd, LPCTSTR lpString, HANDLE hData);
  BOOL                 CloseWindowStation(                 HWINSTA hWinSta);
  HWINSTA              CreateWindowStation(                LPCTSTR lpwinsta, CreateWindowStationFlags dwFlags, WindowStationAccessRights dwDesiredAccess, LPSECURITY_ATTRIBUTES lpsa);
  BOOL                 EnumWindowStations(                 WINSTAENUMPROC lpEnumFunc, LPARAM lParam);
  HWINSTA              GetProcessWindowStation(            );
  BOOL                 GetUserObjectInformation(           HANDLE hObj, UserObjectInformationEnum nIndex, PVOID pvInfo, DWORD nLength, LPDWORD lpnLengthNeeded);
  HWINSTA              OpenWindowStation(                  LPTSTR lpszWinSta, BOOL fInherit, WindowStationAccessRights dwDesiredAccess);
  BOOL                 SetProcessWindowStation(            HWINSTA hWinSta);
  BOOL                 CloseDesktop(                       HDESK hDesktop);
  HDESK                CreateDesktop(                      LPCTSTR lpszDesktop, LPCTSTR lpszDevice, LPDEVMODE pDevmode, DesktopFlags dwFlags, DESKTOP_ACCESS_MASK dwDesiredAccess, LPSECURITY_ATTRIBUTES lpsa);
  HDESK                CreateDesktopEx(                    LPCTSTR lpszDesktop, LPCTSTR lpszDevice, LPDEVMODE pDevmode, DesktopFlags dwFlags, DESKTOP_ACCESS_MASK dwDesiredAccess, LPSECURITY_ATTRIBUTES lpsa, ULONG ulHeapSize, PVOID pvoid);
  BOOL                 EnumDesktops(                       HWINSTA hwinsta, DESKTOPENUMPROC lpEnumFunc, LPARAM lParam);
  BOOL                 EnumDesktopWindows(                 HDESK hDesktop, WNDENUMPROC lpfn, LPARAM lParam);
  HDESK                GetThreadDesktop(                   DWORD dwThreadId);
  HDESK                OpenDesktop(                        LPTSTR lpszDesktop, DesktopFlags dwFlags, BOOL fInherit, DESKTOP_ACCESS_MASK dwDesiredAccess);
  HDESK                OpenInputDesktop(                   DesktopFlags dwFlags, BOOL fInherit, DESKTOP_ACCESS_MASK dwDesiredAccess);
  BOOL                 SetThreadDesktop(                   HDESK hDesktop);
  BOOL                 SetUserObjectInformation(           HANDLE hObj, UserObjectInformationEnum nIndex, PVOID pvInfo, DWORD nLength);
  BOOL                 SwitchDesktop(                      HDESK hDesktop);
  DWORD                GetMenuContextHelpId(               HMENU hmenu);
  DWORD                GetWindowContextHelpId(             HWND hwnd);
  BOOL                 SetMenuContextHelpId(               HMENU hmenu, DWORD dwContextHelpId);
  BOOL                 SetWindowContextHelpId(             HWND hwnd, DWORD dwContextHelpId);
  BOOL                 WinHelp(                            HWND hWndMain, LPCTSTR lpszHelp, UINT uCommand, ULONG_PTR dwData);
  BOOL                 GetUserObjectSecurity(              HANDLE hObj, PSECURITY_INFORMATION pSIRequested, PSECURITY_DESCRIPTOR pSD, DWORD nLength, LPDWORD lpnLengthNeeded);
  BOOL                 SetUserObjectSecurity(              HANDLE hObj, PSECURITY_INFORMATION pSIRequested, PSECURITY_DESCRIPTOR pSID);
  HWINEVENTHOOK        SetWinEventHook(                    UINT eventMin, UINT eventMax, HMODULE hmodWinEventProc, WINEVENTPROC lpfnWinEventProc, DWORD idProcess, DWORD idThread, WinEventFlags dwflags);
  BOOL                 UnhookWinEvent(                     HWINEVENTHOOK hWinEventHook);
  BOOL                 IsWinEventHookInstalled(            DWORD event);
  void                 NotifyWinEvent(                     DWORD event, HWND hwnd, ObjectIdEnum idObject, LONG idChild);
  BOOL                 CloseTouchInputHandle(              HTOUCHINPUT hTouchInput);
  BOOL                 GetTouchInputInfo(                  HTOUCHINPUT hTouchInput, UINT cInputs, PTOUCHINPUT pInputs, int cbSize);
  BOOL                 IsTouchWindow(                      HWND hWnd, PULONG pulFlags);
  BOOL                 RegisterTouchWindow(                HWND hWnd, ULONG ulFlags);
  BOOL                 UnregisterTouchWindow(              HWND hWnd);
  BOOL                 CloseGestureInfoHandle(             HGESTUREINFO hGestureInfo);
  BOOL                 GetGestureExtraArgs(                HGESTUREINFO hGestureInfo, UINT cbExtraArgs, PBYTE pExtraArgs);
  BOOL                 GetGestureInfo(                     HGESTUREINFO hGestureInfo, PGESTUREINFO pGestureInfo);
  BOOL                 GetGestureConfig(                   HWND hwnd, DWORD dwReserved, DWORD dwFlags, PUINT pcIDs, PGESTURECONFIG pGestureConfig, UINT cbSize);
  BOOL                 SetGestureConfig(                   HWND hwnd, DWORD dwReserved, UINT cIDs, PGESTURECONFIG pGestureConfig, UINT cbSize);
  BOOL                 DesktopHasWatermarkText(            );
  HWND                 FrostCrashedWindow(                 HWND hwndToReplace, HWND hwndErrorReportOwnerWnd);
  HWND                 GetSendMessageReceiver(             DWORD threadId);
  BOOL                 GetWindowCompositionAttribute(      HWND hwnd, WINCOMPATTRDATA* pAttrData);
  HWND                 GhostWindowFromHungWindow(          HWND hwndGhost);
  HWND                 HungWindowFromGhostWindow(          HWND hwndGhost);
  BOOL                 IsSETEnabled(                       );
  BOOL                 IsServerSideWindow(                 HWND hwnd);
  BOOL                 IsThreadDesktopComposited(          );
  BOOL                 IsWindowInDestroy(                  HWND hwnd);
  LPCWSTR              MB_GetString(                       int strId);
  BOOL                 NtUserSetChildWindowNoActivate(     HWND hwndChild);
  BOOL                 QuerySendMessage(                   MSG* pMsg);
  BOOL                 SetWindowCompositionAttribute(      HWND hwnd, WINCOMPATTRDATA* pAttrData);
]]
ffi.load( 'User32.dll' )

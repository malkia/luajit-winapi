require( 'ffi/winapi/headers/common' )
require( 'ffi/winapi/headers/ntstatus' )
require( 'ffi/winapi/internal/internal' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef HMODULE HINSTANCE; //Alias
  typedef UINT_PTR WPARAM; //Alias
  typedef LONG_PTR LPARAM; //Alias
  typedef LONG_PTR LRESULT; //Alias
  typedef WORD LANGID; //Alias
  typedef WCHAR* BSTR; //Alias
//typedef BSTR BSTR; //Alias
  typedef PVOID HDEVINFO; //Alias
  typedef LPVOID PIO_APC_ROUTINE; //Alias
  typedef LPVOID FARPROC; //Alias
//typedef LPVOID SID*; //Alias
  typedef PVOID PSID; //Alias
  typedef LPVOID PVECTORED_EXCEPTION_HANDLER; //Alias
  typedef WORD ATOM; //Alias
  typedef LPVOID PSLIST_ENTRY; //Alias
  typedef ULONG_PTR KAFFINITY; //Alias
  typedef VOID STDAPI_VOID; //Alias
  enum { OFS_MAXPATHNAME = 128 };
  enum { CCHDEVICENAME = 32 };
  enum { CCHFORMNAME = 32 };
  enum { RAS_MaxEntryName_plus_1 = 257 };
  enum { EXCEPTION_MAXIMUM_PARAMETERS = 15 };
  typedef ULONG_PTR SCARDCONTEXT; //Alias
  typedef SCARDCONTEXT *LPSCARDCONTEXT; //Pointer
  typedef ULONG_PTR SCARDHANDLE; //Alias
  typedef SCARDHANDLE *LPSCARDHANDLE; //Pointer
  typedef void* IAddrBook; //Interface
  typedef IAddrBook* LPADRBOOK; //Alias
//typedef LPVOID ALLOCATEBUFFER*; //Alias
//typedef LPVOID FREEBUFFER*; //Alias
  typedef DWORD WLAN_REASON_CODE; //Alias
  typedef WLAN_REASON_CODE *PWLAN_REASON_CODE; //Pointer
  typedef void* IUnknown; //Interface
  typedef IUnknown* LPUNKNOWN; //Alias
//typedef IUnknown* IUnknown*; //Alias
  typedef DWORD LCID; //Alias
  static const LCID LOCALE_SYSTEM_DEFAULT = 0x0800;
  static const LCID LOCALE_USER_DEFAULT = 0x0400;
  static const LCID LOCALE_CUSTOM_DEFAULT = 0x0c00;
  static const LCID LOCALE_CUSTOM_UNSPECIFIED = 0x1000;
  static const LCID LOCALE_CUSTOM_UI_DEFAULT = 0x1400;
  static const LCID LOCALE_NEUTRAL = 0x0000;
  static const LCID LOCALE_INVARIANT = 0x007f;
  typedef LCID *PLCID; //Pointer
  typedef struct LIST_ENTRY {
    LPVOID Flink;
    LPVOID Blink;
  } LIST_ENTRY;
  typedef LIST_ENTRY *PLIST_ENTRY; //Pointer
  typedef LPVOID PSLIST_HEADER; //Alias
  typedef LPVOID PCONTEXT; //Alias
//typedef PCONTEXT CONTEXT*; //Alias
  typedef struct POINT {
    LONG x;
    LONG y;
  } POINT;
//typedef POINT POINT; //Alias
//typedef POINT* POINT*; //Alias
//typedef POINT* POINT*; //Alias
  typedef POINT* LPPOINT; //Alias
  typedef POINT POINTL; //Alias
  typedef short WINAPI_DMORIENT; //Alias
  static const WINAPI_DMORIENT DMORIENT_PORTRAIT = 1;
  static const WINAPI_DMORIENT DMORIENT_LANDSCAPE = 2;
  typedef short WINAPI_DMPAPER; //Alias
  static const WINAPI_DMPAPER DMPAPER_LETTER = 1;
  static const WINAPI_DMPAPER DMPAPER_LETTERSMALL = 2;
  static const WINAPI_DMPAPER DMPAPER_TABLOID = 3;
  static const WINAPI_DMPAPER DMPAPER_LEDGER = 4;
  static const WINAPI_DMPAPER DMPAPER_LEGAL = 5;
  static const WINAPI_DMPAPER DMPAPER_STATEMENT = 6;
  static const WINAPI_DMPAPER DMPAPER_EXECUTIVE = 7;
  static const WINAPI_DMPAPER DMPAPER_A3 = 8;
  static const WINAPI_DMPAPER DMPAPER_A4 = 9;
  static const WINAPI_DMPAPER DMPAPER_A4SMALL = 10;
  static const WINAPI_DMPAPER DMPAPER_A5 = 11;
  static const WINAPI_DMPAPER DMPAPER_B4 = 12;
  static const WINAPI_DMPAPER DMPAPER_B5 = 13;
  static const WINAPI_DMPAPER DMPAPER_FOLIO = 14;
  static const WINAPI_DMPAPER DMPAPER_QUARTO = 15;
  static const WINAPI_DMPAPER DMPAPER_10X14 = 16;
  static const WINAPI_DMPAPER DMPAPER_11X17 = 17;
  static const WINAPI_DMPAPER DMPAPER_NOTE = 18;
  static const WINAPI_DMPAPER DMPAPER_ENV_9 = 19;
  static const WINAPI_DMPAPER DMPAPER_ENV_10 = 20;
  static const WINAPI_DMPAPER DMPAPER_ENV_11 = 21;
  static const WINAPI_DMPAPER DMPAPER_ENV_12 = 22;
  static const WINAPI_DMPAPER DMPAPER_ENV_14 = 23;
  static const WINAPI_DMPAPER DMPAPER_CSHEET = 24;
  static const WINAPI_DMPAPER DMPAPER_DSHEET = 25;
  static const WINAPI_DMPAPER DMPAPER_ESHEET = 26;
  static const WINAPI_DMPAPER DMPAPER_ENV_DL = 27;
  static const WINAPI_DMPAPER DMPAPER_ENV_C5 = 28;
  static const WINAPI_DMPAPER DMPAPER_ENV_C3 = 29;
  static const WINAPI_DMPAPER DMPAPER_ENV_C4 = 30;
  static const WINAPI_DMPAPER DMPAPER_ENV_C6 = 31;
  static const WINAPI_DMPAPER DMPAPER_ENV_C65 = 32;
  static const WINAPI_DMPAPER DMPAPER_ENV_B4 = 33;
  static const WINAPI_DMPAPER DMPAPER_ENV_B5 = 34;
  static const WINAPI_DMPAPER DMPAPER_ENV_B6 = 35;
  static const WINAPI_DMPAPER DMPAPER_ENV_ITALY = 36;
  static const WINAPI_DMPAPER DMPAPER_ENV_MONARCH = 37;
  static const WINAPI_DMPAPER DMPAPER_ENV_PERSONAL = 38;
  static const WINAPI_DMPAPER DMPAPER_FANFOLD_US = 39;
  static const WINAPI_DMPAPER DMPAPER_FANFOLD_STD_GERMAN = 40;
  static const WINAPI_DMPAPER DMPAPER_FANFOLD_LGL_GERMAN = 41;
  static const WINAPI_DMPAPER DMPAPER_ISO_B4 = 42;
  static const WINAPI_DMPAPER DMPAPER_JAPANESE_POSTCARD = 43;
  static const WINAPI_DMPAPER DMPAPER_9X11 = 44;
  static const WINAPI_DMPAPER DMPAPER_10X11 = 45;
  static const WINAPI_DMPAPER DMPAPER_15X11 = 46;
  static const WINAPI_DMPAPER DMPAPER_ENV_INVITE = 47;
  static const WINAPI_DMPAPER DMPAPER_RESERVED_48 = 48;
  static const WINAPI_DMPAPER DMPAPER_RESERVED_49 = 49;
  static const WINAPI_DMPAPER DMPAPER_LETTER_EXTRA = 50;
  static const WINAPI_DMPAPER DMPAPER_LEGAL_EXTRA = 51;
  static const WINAPI_DMPAPER DMPAPER_TABLOID_EXTRA = 52;
  static const WINAPI_DMPAPER DMPAPER_A4_EXTRA = 53;
  static const WINAPI_DMPAPER DMPAPER_LETTER_TRANSVERSE = 54;
  static const WINAPI_DMPAPER DMPAPER_A4_TRANSVERSE = 55;
  static const WINAPI_DMPAPER DMPAPER_LETTER_EXTRA_TRANSVERSE = 56;
  static const WINAPI_DMPAPER DMPAPER_A_PLUS = 57;
  static const WINAPI_DMPAPER DMPAPER_B_PLUS = 58;
  static const WINAPI_DMPAPER DMPAPER_LETTER_PLUS = 59;
  static const WINAPI_DMPAPER DMPAPER_A4_PLUS = 60;
  static const WINAPI_DMPAPER DMPAPER_A5_TRANSVERSE = 61;
  static const WINAPI_DMPAPER DMPAPER_B5_TRANSVERSE = 62;
  static const WINAPI_DMPAPER DMPAPER_A3_EXTRA = 63;
  static const WINAPI_DMPAPER DMPAPER_A5_EXTRA = 64;
  static const WINAPI_DMPAPER DMPAPER_B5_EXTRA = 65;
  static const WINAPI_DMPAPER DMPAPER_A2 = 66;
  static const WINAPI_DMPAPER DMPAPER_A3_TRANSVERSE = 67;
  static const WINAPI_DMPAPER DMPAPER_A3_EXTRA_TRANSVERSE = 68;
  static const WINAPI_DMPAPER DMPAPER_DBL_JAPANESE_POSTCARD = 69;
  static const WINAPI_DMPAPER DMPAPER_A6 = 70;
  static const WINAPI_DMPAPER DMPAPER_JENV_KAKU2 = 71;
  static const WINAPI_DMPAPER DMPAPER_JENV_KAKU3 = 72;
  static const WINAPI_DMPAPER DMPAPER_JENV_CHOU3 = 73;
  static const WINAPI_DMPAPER DMPAPER_JENV_CHOU4 = 74;
  static const WINAPI_DMPAPER DMPAPER_LETTER_ROTATED = 75;
  static const WINAPI_DMPAPER DMPAPER_A3_ROTATED = 76;
  static const WINAPI_DMPAPER DMPAPER_A4_ROTATED = 77;
  static const WINAPI_DMPAPER DMPAPER_A5_ROTATED = 78;
  static const WINAPI_DMPAPER DMPAPER_B4_JIS_ROTATED = 79;
  static const WINAPI_DMPAPER DMPAPER_B5_JIS_ROTATED = 80;
  static const WINAPI_DMPAPER DMPAPER_JAPANESE_POSTCARD_ROTATED = 81;
  static const WINAPI_DMPAPER DMPAPER_DBL_JAPANESE_POSTCARD_ROTATED = 82;
  static const WINAPI_DMPAPER DMPAPER_A6_ROTATED = 83;
  static const WINAPI_DMPAPER DMPAPER_JENV_KAKU2_ROTATED = 84;
  static const WINAPI_DMPAPER DMPAPER_JENV_KAKU3_ROTATED = 85;
  static const WINAPI_DMPAPER DMPAPER_JENV_CHOU3_ROTATED = 86;
  static const WINAPI_DMPAPER DMPAPER_JENV_CHOU4_ROTATED = 87;
  static const WINAPI_DMPAPER DMPAPER_B6_JIS = 88;
  static const WINAPI_DMPAPER DMPAPER_B6_JIS_ROTATED = 89;
  static const WINAPI_DMPAPER DMPAPER_12X11 = 90;
  static const WINAPI_DMPAPER DMPAPER_JENV_YOU4 = 91;
  static const WINAPI_DMPAPER DMPAPER_JENV_YOU4_ROTATED = 92;
  static const WINAPI_DMPAPER DMPAPER_P16K = 93;
  static const WINAPI_DMPAPER DMPAPER_P32K = 94;
  static const WINAPI_DMPAPER DMPAPER_P32KBIG = 95;
  static const WINAPI_DMPAPER DMPAPER_PENV_1 = 96;
  static const WINAPI_DMPAPER DMPAPER_PENV_2 = 97;
  static const WINAPI_DMPAPER DMPAPER_PENV_3 = 98;
  static const WINAPI_DMPAPER DMPAPER_PENV_4 = 99;
  static const WINAPI_DMPAPER DMPAPER_PENV_5 = 100;
  static const WINAPI_DMPAPER DMPAPER_PENV_6 = 101;
  static const WINAPI_DMPAPER DMPAPER_PENV_7 = 102;
  static const WINAPI_DMPAPER DMPAPER_PENV_8 = 103;
  static const WINAPI_DMPAPER DMPAPER_PENV_9 = 104;
  static const WINAPI_DMPAPER DMPAPER_PENV_10 = 105;
  static const WINAPI_DMPAPER DMPAPER_P16K_ROTATED = 106;
  static const WINAPI_DMPAPER DMPAPER_P32K_ROTATED = 107;
  static const WINAPI_DMPAPER DMPAPER_P32KBIG_ROTATED = 108;
  static const WINAPI_DMPAPER DMPAPER_PENV_1_ROTATED = 109;
  static const WINAPI_DMPAPER DMPAPER_PENV_2_ROTATED = 110;
  static const WINAPI_DMPAPER DMPAPER_PENV_3_ROTATED = 111;
  static const WINAPI_DMPAPER DMPAPER_PENV_4_ROTATED = 112;
  static const WINAPI_DMPAPER DMPAPER_PENV_5_ROTATED = 113;
  static const WINAPI_DMPAPER DMPAPER_PENV_6_ROTATED = 114;
  static const WINAPI_DMPAPER DMPAPER_PENV_7_ROTATED = 115;
  static const WINAPI_DMPAPER DMPAPER_PENV_8_ROTATED = 116;
  static const WINAPI_DMPAPER DMPAPER_PENV_9_ROTATED = 117;
  static const WINAPI_DMPAPER DMPAPER_PENV_10_ROTATED = 118;
  typedef short WINAPI_DMBIN; //Alias
  static const WINAPI_DMBIN DMBIN_UPPER = 1;
  static const WINAPI_DMBIN DMBIN_LOWER = 2;
  static const WINAPI_DMBIN DMBIN_MIDDLE = 3;
  static const WINAPI_DMBIN DMBIN_MANUAL = 4;
  static const WINAPI_DMBIN DMBIN_ENVELOPE = 5;
  static const WINAPI_DMBIN DMBIN_ENVMANUAL = 6;
  static const WINAPI_DMBIN DMBIN_AUTO = 7;
  static const WINAPI_DMBIN DMBIN_TRACTOR = 8;
  static const WINAPI_DMBIN DMBIN_SMALLFMT = 9;
  static const WINAPI_DMBIN DMBIN_LARGEFMT = 10;
  static const WINAPI_DMBIN DMBIN_LARGECAPACITY = 11;
  static const WINAPI_DMBIN DMBIN_CASSETTE = 14;
  static const WINAPI_DMBIN DMBIN_FORMSOURCE = 15;
  typedef short WINAPI_DMRES; //Alias
  static const WINAPI_DMRES DMRES_DRAFT = -1;
  static const WINAPI_DMRES DMRES_LOW = -2;
  static const WINAPI_DMRES DMRES_MEDIUM = -3;
  static const WINAPI_DMRES DMRES_HIGH = -4;
  typedef struct WINAPI_DEVMODE_u1_s1 {
    WINAPI_DMORIENT dmOrientation;
    WINAPI_DMPAPER dmPaperSize;
    short dmPaperLength;
    short dmPaperWidth;
    short dmScale;
    short dmCopies;
    WINAPI_DMBIN dmDefaultSource;
    WINAPI_DMRES dmPrintQuality;
  } WINAPI_DEVMODE_u1_s1;
  typedef DWORD WINAPI_DMDO; //Alias
  static const WINAPI_DMDO DMDO_DEFAULT = 0;
  static const WINAPI_DMDO DMDO_90 = 1;
  static const WINAPI_DMDO DMDO_180 = 2;
  static const WINAPI_DMDO DMDO_270 = 3;
  typedef DWORD WINAPI_DMDFO; //Alias
  static const WINAPI_DMDFO DMDFO_DEFAULT = 0;
  static const WINAPI_DMDFO DMDFO_STRETCH = 1;
  static const WINAPI_DMDFO DMDFO_CENTER = 2;
  typedef struct WINAPI_DEVMODE_u1_s2 {
    POINTL dmPosition;
    WINAPI_DMDO dmDisplayOrientation;
    WINAPI_DMDFO dmDisplayFixedOutput;
  } WINAPI_DEVMODE_u1_s2;
  typedef union WINAPI_DEVMODE_u1 {
    WINAPI_DEVMODE_u1_s1 ;
    WINAPI_DEVMODE_u1_s2 ;
  } WINAPI_DEVMODE_u1;
  typedef DWORD WINAPI_DMDISPLAYFLAGS; //Alias
  typedef DWORD WINAPI_DMNUP; //Alias
  static const WINAPI_DMNUP DMNUP_SYSTEM = 1;
  static const WINAPI_DMNUP DMNUP_ONEUP = 2;
  typedef union WINAPI_DEVMODE_u2 {
    WINAPI_DMDISPLAYFLAGS dmDisplayFlags;
    WINAPI_DMNUP dmNup;
  } WINAPI_DEVMODE_u2;
  typedef DWORD WINAPI_DM_Fields; //Alias
  typedef short WINAPI_DMCOLOR; //Alias
  static const WINAPI_DMCOLOR DMCOLOR_MONOCHROME = 1;
  static const WINAPI_DMCOLOR DMCOLOR_COLOR = 2;
  typedef short WINAPI_DMDUP; //Alias
  static const WINAPI_DMDUP DMDUP_SIMPLEX = 1;
  static const WINAPI_DMDUP DMDUP_VERTICAL = 2;
  static const WINAPI_DMDUP DMDUP_HORIZONTAL = 3;
  typedef short WINAPI_DMTT; //Alias
  static const WINAPI_DMTT DMTT_BITMAP = 1;
  static const WINAPI_DMTT DMTT_DOWNLOAD = 2;
  static const WINAPI_DMTT DMTT_SUBDEV = 3;
  static const WINAPI_DMTT DMTT_DOWNLOAD_OUTLINE = 4;
  typedef short WINAPI_DMCOLLATE; //Alias
  static const WINAPI_DMCOLLATE DMCOLLATE_FALSE = 0;
  static const WINAPI_DMCOLLATE DMCOLLATE_TRUE = 1;
  typedef DWORD WINAPI_DMICMMETHOD; //Alias
  static const WINAPI_DMICMMETHOD DMICMMETHOD_NONE = 1;
  static const WINAPI_DMICMMETHOD DMICMMETHOD_SYSTEM = 2;
  static const WINAPI_DMICMMETHOD DMICMMETHOD_DRIVER = 3;
  static const WINAPI_DMICMMETHOD DMICMMETHOD_DEVICE = 4;
  typedef DWORD WINAPI_DMICM; //Alias
  static const WINAPI_DMICM DMICM_SATURATE = 1;
  static const WINAPI_DMICM DMICM_CONTRAST = 2;
  static const WINAPI_DMICM DMICM_COLORIMETRIC = 3;
  static const WINAPI_DMICM DMICM_ABS_COLORIMETRIC = 4;
  typedef DWORD WINAPI_DMMEDIA; //Alias
  static const WINAPI_DMMEDIA DMMEDIA_STANDARD = 1;
  static const WINAPI_DMMEDIA DMMEDIA_TRANSPARENCY = 2;
  static const WINAPI_DMMEDIA DMMEDIA_GLOSSY = 3;
  typedef DWORD WINAPI_DMDITHER; //Alias
  static const WINAPI_DMDITHER DMDITHER_NONE = 1;
  static const WINAPI_DMDITHER DMDITHER_COARSE = 2;
  static const WINAPI_DMDITHER DMDITHER_FINE = 3;
  static const WINAPI_DMDITHER DMDITHER_LINEART = 4;
  static const WINAPI_DMDITHER DMDITHER_ERRORDIFFUSION = 5;
  static const WINAPI_DMDITHER DMDITHER_RESERVED6 = 6;
  static const WINAPI_DMDITHER DMDITHER_RESERVED7 = 7;
  static const WINAPI_DMDITHER DMDITHER_RESERVED8 = 8;
  static const WINAPI_DMDITHER DMDITHER_RESERVED9 = 9;
  static const WINAPI_DMDITHER DMDITHER_GRAYSCALE = 10;
  typedef struct DEVMODE {
    TCHAR dmDeviceName[CCHDEVICENAME];
    WORD dmSpecVersion;
    WORD dmDriverVersion;
    WORD dmSize;
    WORD dmDriverExtra;
    WINAPI_DM_Fields dmFields;
    WINAPI_DEVMODE_u1 ;
    WINAPI_DMCOLOR dmColor;
    WINAPI_DMDUP dmDuplex;
    short dmYResolution;
    WINAPI_DMTT dmTTOption;
    WINAPI_DMCOLLATE dmCollate;
    TCHAR dmFormName[CCHFORMNAME];
    WORD dmLogPixels;
    DWORD dmBitsPerPel;
    DWORD dmPelsWidth;
    DWORD dmPelsHeight;
    WINAPI_DEVMODE_u2 ;
    DWORD dmDisplayFrequency;
    WINAPI_DMICMMETHOD dmICMMethod;
    WINAPI_DMICM dmICMIntent;
    WINAPI_DMMEDIA dmMediaType;
    WINAPI_DMDITHER dmDitherType;
    DWORD dmReserved1;
    DWORD dmReserved2;
    DWORD dmPanningWidth;
    DWORD dmPanningHeight;
  } DEVMODE;
  typedef DEVMODE *LPDEVMODE; //Pointer
  typedef DEVMODE *PDEVMODE; //Pointer
  typedef UINT_PTR HANDLE; //Alias
  static const HANDLE NULL = 0;
  typedef HANDLE *PHANDLE; //Pointer
  typedef HANDLE *LPHANDLE; //Pointer
  typedef HANDLE WINAPI_FILE_HANDLE; //Alias
  typedef HANDLE HACCEL; //Alias
  typedef HANDLE HRSRC; //Alias
  typedef HANDLE HWND; //Alias
  typedef HANDLE HGLOBAL; //Alias
  typedef HANDLE HKL; //Alias
  typedef HANDLE HBITMAP; //Alias
  typedef HANDLE HENHMETAFILE; //Alias
  typedef HANDLE WINAPI_ProcessHandle; //Alias
  static const WINAPI_ProcessHandle GetCurrentProcess = -1;
  typedef HANDLE WINAPI_ThreadHandle; //Alias
  static const WINAPI_ThreadHandle GetCurrentThread = -2;
  typedef int32_t HRESULT; //Integer
  static const HRESULT S_OK = 0;
  static const HRESULT S_FALSE = 1;
  static const HRESULT E_ABORT = 0x80004004;
  static const HRESULT E_ACCESSDENIED = 0x80070005;
  static const HRESULT E_FAIL = 0x80004005;
  static const HRESULT E_HANDLE = 0x80070006;
  static const HRESULT E_INVALIDARG = 0x80070057;
  static const HRESULT E_NOINTERFACE = 0x80004002;
  static const HRESULT E_NOTIMPL = 0x80004001;
  static const HRESULT E_OUTOFMEMORY = 0x8007000E;
  static const HRESULT E_POINTER = 0x80004003;
  static const HRESULT E_UNEXPECTED = 0x8000FFFF;
  static const HRESULT CO_E_NOTINITIALIZED = 0x800401F0;
  typedef HRESULT STDAPI; //Alias
  typedef HRESULT SCODE; //Alias
  typedef struct WINAPI_LARGE_INTEGER_s {
    DWORD LowPart;
    LONG HighPart;
  } WINAPI_LARGE_INTEGER_s;
  typedef union LARGE_INTEGER {
    WINAPI_LARGE_INTEGER_s u;
    LONGLONG QuadPart;
  } LARGE_INTEGER;
  typedef LARGE_INTEGER *PLARGE_INTEGER; //Pointer
//typedef PLARGE_INTEGER LARGE_INTEGER*; //Alias
//typedef LARGE_INTEGER* LARGE_INTEGER*; //Alias
  typedef struct WINAPI_ULARGE_INTEGER_s {
    DWORD LowPart;
    LONG HighPart;
  } WINAPI_ULARGE_INTEGER_s;
  typedef union ULARGE_INTEGER {
    WINAPI_ULARGE_INTEGER_s u;
    ULONGLONG QuadPart;
  } ULARGE_INTEGER;
  typedef ULARGE_INTEGER *PULARGE_INTEGER; //Pointer
  typedef struct FILETIME {
    DWORD dwLowDateTime;
    DWORD dwHighDateTime;
  } FILETIME;
  typedef FILETIME* PFILETIME; //Alias
  typedef FILETIME* LPFILETIME; //Alias
//typedef FILETIME* FILETIME*; //Alias
//typedef FILETIME* FILETIME*; //Alias
  typedef struct GUID { DWORD Data1; WORD Data2, Data3; BYTE Data4[8]; } GUID;
  typedef GUID* PGUID; //Alias
//typedef GUID* GUID*; //Alias
  typedef GUID* LPCGUID; //Alias
//typedef GUID* GUID*; //Alias
  typedef GUID *LPGUID; //Pointer
//typedef LPGUID LPGUID; //Alias
  typedef GUID* REFGUID; //Alias
  typedef GUID CLSID; //Alias
  typedef CLSID* LPCLSID; //Alias
//typedef CLSID* CLSID*; //Alias
  typedef CLSID *REFCLSID; //Pointer
  typedef GUID UUID; //Alias
//typedef UUID* UUID*; //Alias
  typedef GUID IID; //Alias
//typedef IID* IID*; //Alias
  typedef IID *REFIID; //Pointer
  typedef IID *LPIID; //Pointer
  typedef struct LUID {
    DWORD LowPart;
    LONG HighPart;
  } LUID;
  typedef LUID* PLUID; //Alias
  typedef GUID SLID; //Alias
  typedef DWORD ACCESS_MASK; //Alias
  typedef ACCESS_MASK *PACCESS_MASK; //Pointer
  typedef ACCESS_MASK WINAPI_THREAD_ACCESS_MASK; //Alias
  typedef ACCESS_MASK WINAPI_PROCESS_ACCESS_MASK; //Alias
  typedef ACCESS_MASK WINAPI_FILE_ACCESS_MASK; //Alias
  typedef UINT SECURITY_INFORMATION; //Alias
  typedef SECURITY_INFORMATION *PSECURITY_INFORMATION; //Pointer
  typedef struct SYSTEMTIME {
    WORD wYear;
    WORD wMonth;
    WORD wDayOfWeek;
    WORD wDay;
    WORD wHour;
    WORD wMinute;
    WORD wSecond;
    WORD wMilliseconds;
  } SYSTEMTIME;
//typedef SYSTEMTIME SYSTEMTIME; //Alias
//typedef SYSTEMTIME* SYSTEMTIME*; //Alias
  typedef SYSTEMTIME* PSYSTEMTIME; //Alias
  typedef PSYSTEMTIME LPSYSTEMTIME; //Alias
  typedef UINT JOBOBJECTINFOCLASS; //Alias
  static const JOBOBJECTINFOCLASS JobObjectBasicAccountingInformation = 1;
  static const JOBOBJECTINFOCLASS JobObjectBasicLimitInformation = 2;
  static const JOBOBJECTINFOCLASS JobObjectBasicProcessIdList = 3;
  static const JOBOBJECTINFOCLASS JobObjectBasicUIRestrictions = 4;
  static const JOBOBJECTINFOCLASS JobObjectSecurityLimitInformation = 5;
  static const JOBOBJECTINFOCLASS JobObjectEndOfJobTimeInformation = 6;
  static const JOBOBJECTINFOCLASS JobObjectAssociateCompletionPortInformation = 7;
  static const JOBOBJECTINFOCLASS JobObjectBasicAndIoAccountingInformation = 8;
  static const JOBOBJECTINFOCLASS JobObjectExtendedLimitInformation = 9;
  static const JOBOBJECTINFOCLASS JobObjectJobSetInformation = 10;
  static const JOBOBJECTINFOCLASS JobObjectGroupInformation = 11;
  static const JOBOBJECTINFOCLASS JobObjectNotificationLimitInformation = 12;
  static const JOBOBJECTINFOCLASS JobObjectLimitViolationInformation = 13;
  static const JOBOBJECTINFOCLASS JobObjectGroupInformationEx = 14;
  static const JOBOBJECTINFOCLASS JobObjectCpuRateControlInformation = 15;
  static const JOBOBJECTINFOCLASS JobObjectCompletionFilter = 16;
  static const JOBOBJECTINFOCLASS JobObjectCompletionCounter = 17;
  static const JOBOBJECTINFOCLASS JobObjectFreezeInformation = 18;
  static const JOBOBJECTINFOCLASS JobObjectExtendedAccountingInformation = 19;
  static const JOBOBJECTINFOCLASS JobObjectWakeInformation = 20;
  static const JOBOBJECTINFOCLASS JobObjectIdleAwareInformation = 21;
  static const JOBOBJECTINFOCLASS JobObjectSchedulingRankBiasInformation = 22;
  static const JOBOBJECTINFOCLASS JobObjectTimerVirtualizationInformation = 23;
  static const JOBOBJECTINFOCLASS JobObjectCycleTimeNotification = 24;
  static const JOBOBJECTINFOCLASS JobObjectReserved1Information = 18;
  static const JOBOBJECTINFOCLASS JobObjectReserved2Information = 19;
  static const JOBOBJECTINFOCLASS JobObjectReserved3Information = 20;
  static const JOBOBJECTINFOCLASS JobObjectReserved4Information = 21;
  static const JOBOBJECTINFOCLASS JobObjectReserved5Information = 22;
  static const JOBOBJECTINFOCLASS JobObjectReserved6Information = 23;
  static const JOBOBJECTINFOCLASS JobObjectReserved7Information = 24;
  typedef UINT PROCESSINFOCLASS; //Alias
  static const PROCESSINFOCLASS ProcessBasicInformation = 0;
  static const PROCESSINFOCLASS ProcessQuotaLimits = 1;
  static const PROCESSINFOCLASS ProcessIoCounters = 2;
  static const PROCESSINFOCLASS ProcessVmCounters = 3;
  static const PROCESSINFOCLASS ProcessTimes = 4;
  static const PROCESSINFOCLASS ProcessBasePriority = 5;
  static const PROCESSINFOCLASS ProcessRaisePriority = 6;
  static const PROCESSINFOCLASS ProcessDebugPort = 7;
  static const PROCESSINFOCLASS ProcessExceptionPort = 8;
  static const PROCESSINFOCLASS ProcessAccessToken = 9;
  static const PROCESSINFOCLASS ProcessLdtInformation = 10;
  static const PROCESSINFOCLASS ProcessLdtSize = 11;
  static const PROCESSINFOCLASS ProcessDefaultHardErrorMode = 12;
  static const PROCESSINFOCLASS ProcessIoPortHandlers = 13;
  static const PROCESSINFOCLASS ProcessPooledUsageAndLimits = 14;
  static const PROCESSINFOCLASS ProcessWorkingSetWatch = 15;
  static const PROCESSINFOCLASS ProcessUserModeIOPL = 16;
  static const PROCESSINFOCLASS ProcessEnableAlignmentFaultFixup = 17;
  static const PROCESSINFOCLASS ProcessPriorityClass = 18;
  static const PROCESSINFOCLASS ProcessWx86Information = 19;
  static const PROCESSINFOCLASS ProcessHandleCount = 20;
  static const PROCESSINFOCLASS ProcessAffinityMask = 21;
  static const PROCESSINFOCLASS ProcessPriorityBoost = 22;
  static const PROCESSINFOCLASS ProcessDeviceMap = 23;
  static const PROCESSINFOCLASS ProcessSessionInformation = 24;
  static const PROCESSINFOCLASS ProcessForegroundInformation = 25;
  static const PROCESSINFOCLASS ProcessWow64Information = 26;
  static const PROCESSINFOCLASS ProcessImageFileName = 27;
  static const PROCESSINFOCLASS ProcessLUIDDeviceMapsEnabled = 28;
  static const PROCESSINFOCLASS ProcessBreakOnTermination = 29;
  static const PROCESSINFOCLASS ProcessDebugObjectHandle = 30;
  static const PROCESSINFOCLASS ProcessDebugFlags = 31;
  static const PROCESSINFOCLASS ProcessHandleTracing = 32;
  static const PROCESSINFOCLASS ProcessIoPriority = 33;
  static const PROCESSINFOCLASS ProcessExecuteFlags = 34;
  static const PROCESSINFOCLASS ProcessTlsInformation = 35;
  static const PROCESSINFOCLASS ProcessCookie = 36;
  static const PROCESSINFOCLASS ProcessImageInformation = 37;
  static const PROCESSINFOCLASS ProcessCycleTime = 38;
  static const PROCESSINFOCLASS ProcessPagePriority = 39;
  static const PROCESSINFOCLASS ProcessInstrumentationCallback = 40;
  static const PROCESSINFOCLASS ProcessThreadStackAllocation = 41;
  static const PROCESSINFOCLASS ProcessWorkingSetWatchEx = 42;
  static const PROCESSINFOCLASS ProcessImageFileNameWin32 = 43;
  static const PROCESSINFOCLASS ProcessImageFileMapping = 44;
  static const PROCESSINFOCLASS ProcessAffinityUpdateMode = 45;
  static const PROCESSINFOCLASS ProcessMemoryAllocationMode = 46;
  static const PROCESSINFOCLASS ProcessGroupInformation = 47;
  static const PROCESSINFOCLASS ProcessTokenVirtualizationEnabled = 48;
  static const PROCESSINFOCLASS ProcessConsoleHostProcess = 49;
  static const PROCESSINFOCLASS ProcessWindowInformation = 50;
  static const PROCESSINFOCLASS ProcessHandleInformation = 51;
  static const PROCESSINFOCLASS ProcessMitigationPolicy = 52;
  static const PROCESSINFOCLASS ProcessDynamicFunctionTableInformation = 53;
  static const PROCESSINFOCLASS ProcessHandleCheckingMode = 54;
  static const PROCESSINFOCLASS ProcessKeepAliveCount = 55;
  static const PROCESSINFOCLASS ProcessRevokeFileHandles = 56;
  typedef UINT THREADINFOCLASS; //Alias
  static const THREADINFOCLASS ThreadBasicInformation = 0;
  static const THREADINFOCLASS ThreadTimes = 1;
  static const THREADINFOCLASS ThreadPriority = 2;
  static const THREADINFOCLASS ThreadBasePriority = 3;
  static const THREADINFOCLASS ThreadAffinityMask = 4;
  static const THREADINFOCLASS ThreadImpersonationToken = 5;
  static const THREADINFOCLASS ThreadDescriptorTableEntry = 6;
  static const THREADINFOCLASS ThreadEnableAlignmentFaultFixup = 7;
  static const THREADINFOCLASS ThreadEventPair_Reusable = 8;
  static const THREADINFOCLASS ThreadQuerySetWin32StartAddress = 9;
  static const THREADINFOCLASS ThreadZeroTlsCell = 10;
  static const THREADINFOCLASS ThreadPerformanceCount = 11;
  static const THREADINFOCLASS ThreadAmILastThread = 12;
  static const THREADINFOCLASS ThreadIdealProcessor = 13;
  static const THREADINFOCLASS ThreadPriorityBoost = 14;
  static const THREADINFOCLASS ThreadSetTlsArrayAddress = 15;
  static const THREADINFOCLASS ThreadIsIoPending = 16;
  static const THREADINFOCLASS ThreadHideFromDebugger = 17;
  static const THREADINFOCLASS ThreadBreakOnTermination = 18;
  static const THREADINFOCLASS ThreadSwitchLegacyState = 19;
  static const THREADINFOCLASS ThreadIsTerminated = 20;
  static const THREADINFOCLASS ThreadLastSystemCall = 21;
  static const THREADINFOCLASS ThreadIoPriority = 22;
  static const THREADINFOCLASS ThreadCycleTime = 23;
  static const THREADINFOCLASS ThreadPagePriority = 24;
  static const THREADINFOCLASS ThreadActualBasePriority = 25;
  static const THREADINFOCLASS ThreadTebInformation = 26;
  static const THREADINFOCLASS ThreadCSwitchMon = 27;
  static const THREADINFOCLASS ThreadCSwitchPmu = 28;
  static const THREADINFOCLASS ThreadWow64Context = 29;
  static const THREADINFOCLASS ThreadGroupInformation = 30;
  static const THREADINFOCLASS ThreadUmsInformation = 31;
  static const THREADINFOCLASS ThreadCounterProfiling = 32;
  static const THREADINFOCLASS ThreadIdealProcessorEx = 33;
  static const THREADINFOCLASS ThreadCpuAccountingInformation = 34;
  static const THREADINFOCLASS ThreadSwitchStackCheck = 35;
  typedef UINT GET_FILEEX_INFO_LEVELS; //Alias
  static const GET_FILEEX_INFO_LEVELS GetFileExInfoStandard = 0;
  typedef struct UNICODE_STRING {
    USHORT Length;
    USHORT MaximumLength;
    PWSTR Buffer;
  } UNICODE_STRING;
  typedef UNICODE_STRING *PUNICODE_STRING; //Pointer
  typedef UNICODE_STRING *PCUNICODE_STRING; //Pointer
  typedef struct STRING {
    USHORT Length;
    USHORT MaximumLength;
    PCHAR Buffer;
  } STRING;
  typedef STRING *PSTRING; //Pointer
  typedef STRING ANSI_STRING; //Alias
  typedef ANSI_STRING *PANSI_STRING; //Pointer
  typedef ANSI_STRING *PCANSI_STRING; //Pointer
  typedef STRING OEM_STRING; //Alias
  typedef OEM_STRING *POEM_STRING; //Pointer
  typedef OEM_STRING *PCOEM_STRING; //Pointer
  typedef UINT WINAPI_WinMsg; //Alias
  static const WINAPI_WinMsg WM_CREATE = 0x0001;
  static const WINAPI_WinMsg WM_DESTROY = 0x0002;
  static const WINAPI_WinMsg WM_MOVE = 0x0003;
  static const WINAPI_WinMsg WM_SIZE = 0x0005;
  static const WINAPI_WinMsg WM_ACTIVATE = 0x0006;
  static const WINAPI_WinMsg WM_SETFOCUS = 0x0007;
  static const WINAPI_WinMsg WM_KILLFOCUS = 0x0008;
  static const WINAPI_WinMsg WM_ENABLE = 0x000A;
  static const WINAPI_WinMsg WM_SETREDRAW = 0x000B;
  static const WINAPI_WinMsg WM_SETTEXT = 0x000C;
  static const WINAPI_WinMsg WM_GETTEXT = 0x000D;
  static const WINAPI_WinMsg WM_GETTEXTLENGTH = 0x000E;
  static const WINAPI_WinMsg WM_PAINT = 0x000F;
  static const WINAPI_WinMsg WM_CLOSE = 0x0010;
  static const WINAPI_WinMsg WM_QUERYENDSESSION = 0x0011;
  static const WINAPI_WinMsg WM_QUERYOPEN = 0x0013;
  static const WINAPI_WinMsg WM_ENDSESSION = 0x0016;
  static const WINAPI_WinMsg WM_QUIT = 0x0012;
  static const WINAPI_WinMsg WM_ERASEBKGND = 0x0014;
  static const WINAPI_WinMsg WM_SYSCOLORCHANGE = 0x0015;
  static const WINAPI_WinMsg WM_SHOWWINDOW = 0x0018;
  static const WINAPI_WinMsg WM_SETTINGCHANGE = 0x001A;
  static const WINAPI_WinMsg WM_DEVMODECHANGE = 0x001B;
  static const WINAPI_WinMsg WM_ACTIVATEAPP = 0x001C;
  static const WINAPI_WinMsg WM_FONTCHANGE = 0x001D;
  static const WINAPI_WinMsg WM_TIMECHANGE = 0x001E;
  static const WINAPI_WinMsg WM_CANCELMODE = 0x001F;
  static const WINAPI_WinMsg WM_SETCURSOR = 0x0020;
  static const WINAPI_WinMsg WM_MOUSEACTIVATE = 0x0021;
  static const WINAPI_WinMsg WM_CHILDACTIVATE = 0x0022;
  static const WINAPI_WinMsg WM_QUEUESYNC = 0x0023;
  static const WINAPI_WinMsg WM_GETMINMAXINFO = 0x0024;
  static const WINAPI_WinMsg WM_PAINTICON = 0x0026;
  static const WINAPI_WinMsg WM_ICONERASEBKGND = 0x0027;
  static const WINAPI_WinMsg WM_NEXTDLGCTL = 0x0028;
  static const WINAPI_WinMsg WM_SPOOLERSTATUS = 0x002A;
  static const WINAPI_WinMsg WM_DRAWITEM = 0x002B;
  static const WINAPI_WinMsg WM_MEASUREITEM = 0x002C;
  static const WINAPI_WinMsg WM_DELETEITEM = 0x002D;
  static const WINAPI_WinMsg WM_VKEYTOITEM = 0x002E;
  static const WINAPI_WinMsg WM_CHARTOITEM = 0x002F;
  static const WINAPI_WinMsg WM_SETFONT = 0x0030;
  static const WINAPI_WinMsg WM_GETFONT = 0x0031;
  static const WINAPI_WinMsg WM_SETHOTKEY = 0x0032;
  static const WINAPI_WinMsg WM_GETHOTKEY = 0x0033;
  static const WINAPI_WinMsg WM_QUERYDRAGICON = 0x0037;
  static const WINAPI_WinMsg WM_COMPAREITEM = 0x0039;
  static const WINAPI_WinMsg WM_GETOBJECT = 0x003D;
  static const WINAPI_WinMsg WM_COMPACTING = 0x0041;
  static const WINAPI_WinMsg WM_COMMNOTIFY = 0x0044;
  static const WINAPI_WinMsg WM_WINDOWPOSCHANGING = 0x0046;
  static const WINAPI_WinMsg WM_WINDOWPOSCHANGED = 0x0047;
  static const WINAPI_WinMsg WM_POWER = 0x0048;
  static const WINAPI_WinMsg WM_COPYDATA = 0x004A;
  static const WINAPI_WinMsg WM_CANCELJOURNAL = 0x004B;
  static const WINAPI_WinMsg WM_NOTIFY = 0x004E;
  static const WINAPI_WinMsg WM_INPUTLANGCHANGEREQUEST = 0x0050;
  static const WINAPI_WinMsg WM_INPUTLANGCHANGE = 0x0051;
  static const WINAPI_WinMsg WM_TCARD = 0x0052;
  static const WINAPI_WinMsg WM_HELP = 0x0053;
  static const WINAPI_WinMsg WM_USERCHANGED = 0x0054;
  static const WINAPI_WinMsg WM_NOTIFYFORMAT = 0x0055;
  static const WINAPI_WinMsg WM_CONTEXTMENU = 0x007B;
  static const WINAPI_WinMsg WM_STYLECHANGING = 0x007C;
  static const WINAPI_WinMsg WM_STYLECHANGED = 0x007D;
  static const WINAPI_WinMsg WM_DISPLAYCHANGE = 0x007E;
  static const WINAPI_WinMsg WM_GETICON = 0x007F;
  static const WINAPI_WinMsg WM_SETICON = 0x0080;
  static const WINAPI_WinMsg WM_NCCREATE = 0x0081;
  static const WINAPI_WinMsg WM_NCDESTROY = 0x0082;
  static const WINAPI_WinMsg WM_NCCALCSIZE = 0x0083;
  static const WINAPI_WinMsg WM_NCHITTEST = 0x0084;
  static const WINAPI_WinMsg WM_NCPAINT = 0x0085;
  static const WINAPI_WinMsg WM_NCACTIVATE = 0x0086;
  static const WINAPI_WinMsg WM_GETDLGCODE = 0x0087;
  static const WINAPI_WinMsg WM_SYNCPAINT = 0x0088;
  static const WINAPI_WinMsg WM_NCMOUSEMOVE = 0x00A0;
  static const WINAPI_WinMsg WM_NCLBUTTONDOWN = 0x00A1;
  static const WINAPI_WinMsg WM_NCLBUTTONUP = 0x00A2;
  static const WINAPI_WinMsg WM_NCLBUTTONDBLCLK = 0x00A3;
  static const WINAPI_WinMsg WM_NCRBUTTONDOWN = 0x00A4;
  static const WINAPI_WinMsg WM_NCRBUTTONUP = 0x00A5;
  static const WINAPI_WinMsg WM_NCRBUTTONDBLCLK = 0x00A6;
  static const WINAPI_WinMsg WM_NCMBUTTONDOWN = 0x00A7;
  static const WINAPI_WinMsg WM_NCMBUTTONUP = 0x00A8;
  static const WINAPI_WinMsg WM_NCMBUTTONDBLCLK = 0x00A9;
  static const WINAPI_WinMsg WM_NCXBUTTONDOWN = 0x00AB;
  static const WINAPI_WinMsg WM_NCXBUTTONUP = 0x00AC;
  static const WINAPI_WinMsg WM_NCXBUTTONDBLCLK = 0x00AD;
  static const WINAPI_WinMsg WM_INPUT_DEVICE_CHANGE = 0x00FE;
  static const WINAPI_WinMsg WM_INPUT = 0x00FF;
  static const WINAPI_WinMsg WM_KEYDOWN = 0x0100;
  static const WINAPI_WinMsg WM_KEYUP = 0x0101;
  static const WINAPI_WinMsg WM_CHAR = 0x0102;
  static const WINAPI_WinMsg WM_DEADCHAR = 0x0103;
  static const WINAPI_WinMsg WM_SYSKEYDOWN = 0x0104;
  static const WINAPI_WinMsg WM_SYSKEYUP = 0x0105;
  static const WINAPI_WinMsg WM_SYSCHAR = 0x0106;
  static const WINAPI_WinMsg WM_SYSDEADCHAR = 0x0107;
  static const WINAPI_WinMsg WM_UNICHAR = 0x0109;
  static const WINAPI_WinMsg WM_IME_STARTCOMPOSITION = 0x010D;
  static const WINAPI_WinMsg WM_IME_ENDCOMPOSITION = 0x010E;
  static const WINAPI_WinMsg WM_IME_COMPOSITION = 0x010F;
  static const WINAPI_WinMsg WM_IME_KEYLAST = 0x010F;
  static const WINAPI_WinMsg WM_INITDIALOG = 0x0110;
  static const WINAPI_WinMsg WM_COMMAND = 0x0111;
  static const WINAPI_WinMsg WM_SYSCOMMAND = 0x0112;
  static const WINAPI_WinMsg WM_TIMER = 0x0113;
  static const WINAPI_WinMsg WM_HSCROLL = 0x0114;
  static const WINAPI_WinMsg WM_VSCROLL = 0x0115;
  static const WINAPI_WinMsg WM_INITMENU = 0x0116;
  static const WINAPI_WinMsg WM_INITMENUPOPUP = 0x0117;
  static const WINAPI_WinMsg WM_MENUSELECT = 0x011F;
  static const WINAPI_WinMsg WM_MENUCHAR = 0x0120;
  static const WINAPI_WinMsg WM_ENTERIDLE = 0x0121;
  static const WINAPI_WinMsg WM_MENURBUTTONUP = 0x0122;
  static const WINAPI_WinMsg WM_MENUDRAG = 0x0123;
  static const WINAPI_WinMsg WM_MENUGETOBJECT = 0x0124;
  static const WINAPI_WinMsg WM_UNINITMENUPOPUP = 0x0125;
  static const WINAPI_WinMsg WM_MENUCOMMAND = 0x0126;
  static const WINAPI_WinMsg WM_CHANGEUISTATE = 0x0127;
  static const WINAPI_WinMsg WM_UPDATEUISTATE = 0x0128;
  static const WINAPI_WinMsg WM_QUERYUISTATE = 0x0129;
  static const WINAPI_WinMsg WM_CTLCOLORMSGBOX = 0x0132;
  static const WINAPI_WinMsg WM_CTLCOLOREDIT = 0x0133;
  static const WINAPI_WinMsg WM_CTLCOLORLISTBOX = 0x0134;
  static const WINAPI_WinMsg WM_CTLCOLORBTN = 0x0135;
  static const WINAPI_WinMsg WM_CTLCOLORDLG = 0x0136;
  static const WINAPI_WinMsg WM_CTLCOLORSCROLLBAR = 0x0137;
  static const WINAPI_WinMsg WM_CTLCOLORSTATIC = 0x0138;
  static const WINAPI_WinMsg MN_GETHMENU = 0x01E1;
  static const WINAPI_WinMsg WM_MOUSEMOVE = 0x0200;
  static const WINAPI_WinMsg WM_LBUTTONDOWN = 0x0201;
  static const WINAPI_WinMsg WM_LBUTTONUP = 0x0202;
  static const WINAPI_WinMsg WM_LBUTTONDBLCLK = 0x0203;
  static const WINAPI_WinMsg WM_RBUTTONDOWN = 0x0204;
  static const WINAPI_WinMsg WM_RBUTTONUP = 0x0205;
  static const WINAPI_WinMsg WM_RBUTTONDBLCLK = 0x0206;
  static const WINAPI_WinMsg WM_MBUTTONDOWN = 0x0207;
  static const WINAPI_WinMsg WM_MBUTTONUP = 0x0208;
  static const WINAPI_WinMsg WM_MBUTTONDBLCLK = 0x0209;
  static const WINAPI_WinMsg WM_MOUSEWHEEL = 0x020A;
  static const WINAPI_WinMsg WM_XBUTTONDOWN = 0x020B;
  static const WINAPI_WinMsg WM_XBUTTONUP = 0x020C;
  static const WINAPI_WinMsg WM_XBUTTONDBLCLK = 0x020D;
  static const WINAPI_WinMsg WM_MOUSEHWHEEL = 0x020E;
  static const WINAPI_WinMsg WM_PARENTNOTIFY = 0x0210;
  static const WINAPI_WinMsg WM_ENTERMENULOOP = 0x0211;
  static const WINAPI_WinMsg WM_EXITMENULOOP = 0x0212;
  static const WINAPI_WinMsg WM_NEXTMENU = 0x0213;
  static const WINAPI_WinMsg WM_SIZING = 0x0214;
  static const WINAPI_WinMsg WM_CAPTURECHANGED = 0x0215;
  static const WINAPI_WinMsg WM_MOVING = 0x0216;
  static const WINAPI_WinMsg WM_POWERBROADCAST = 0x0218;
  static const WINAPI_WinMsg WM_DEVICECHANGE = 0x0219;
  static const WINAPI_WinMsg WM_MDICREATE = 0x0220;
  static const WINAPI_WinMsg WM_MDIDESTROY = 0x0221;
  static const WINAPI_WinMsg WM_MDIACTIVATE = 0x0222;
  static const WINAPI_WinMsg WM_MDIRESTORE = 0x0223;
  static const WINAPI_WinMsg WM_MDINEXT = 0x0224;
  static const WINAPI_WinMsg WM_MDIMAXIMIZE = 0x0225;
  static const WINAPI_WinMsg WM_MDITILE = 0x0226;
  static const WINAPI_WinMsg WM_MDICASCADE = 0x0227;
  static const WINAPI_WinMsg WM_MDIICONARRANGE = 0x0228;
  static const WINAPI_WinMsg WM_MDIGETACTIVE = 0x0229;
  static const WINAPI_WinMsg WM_MDISETMENU = 0x0230;
  static const WINAPI_WinMsg WM_ENTERSIZEMOVE = 0x0231;
  static const WINAPI_WinMsg WM_EXITSIZEMOVE = 0x0232;
  static const WINAPI_WinMsg WM_DROPFILES = 0x0233;
  static const WINAPI_WinMsg WM_MDIREFRESHMENU = 0x0234;
  static const WINAPI_WinMsg WM_IME_SETCONTEXT = 0x0281;
  static const WINAPI_WinMsg WM_IME_NOTIFY = 0x0282;
  static const WINAPI_WinMsg WM_IME_CONTROL = 0x0283;
  static const WINAPI_WinMsg WM_IME_COMPOSITIONFULL = 0x0284;
  static const WINAPI_WinMsg WM_IME_SELECT = 0x0285;
  static const WINAPI_WinMsg WM_IME_CHAR = 0x0286;
  static const WINAPI_WinMsg WM_IME_REQUEST = 0x0288;
  static const WINAPI_WinMsg WM_IME_KEYDOWN = 0x0290;
  static const WINAPI_WinMsg WM_IME_KEYUP = 0x0291;
  static const WINAPI_WinMsg WM_MOUSEHOVER = 0x02A1;
  static const WINAPI_WinMsg WM_MOUSELEAVE = 0x02A3;
  static const WINAPI_WinMsg WM_NCMOUSEHOVER = 0x02A0;
  static const WINAPI_WinMsg WM_NCMOUSELEAVE = 0x02A2;
  static const WINAPI_WinMsg WM_WTSSESSION_CHANGE = 0x02B1;
  static const WINAPI_WinMsg WM_TABLET_ADDED = 0x02c8;
  static const WINAPI_WinMsg WM_TABLET_DELETED = 0x02c9;
  static const WINAPI_WinMsg WM_TABLET_FLICK = 0x02cb;
  static const WINAPI_WinMsg WM_TABLET_QUERYSYSTEMGESTURESTATUS = 0x02cc;
  static const WINAPI_WinMsg WM_CUT = 0x0300;
  static const WINAPI_WinMsg WM_COPY = 0x0301;
  static const WINAPI_WinMsg WM_PASTE = 0x0302;
  static const WINAPI_WinMsg WM_CLEAR = 0x0303;
  static const WINAPI_WinMsg WM_UNDO = 0x0304;
  static const WINAPI_WinMsg WM_RENDERFORMAT = 0x0305;
  static const WINAPI_WinMsg WM_RENDERALLFORMATS = 0x0306;
  static const WINAPI_WinMsg WM_DESTROYCLIPBOARD = 0x0307;
  static const WINAPI_WinMsg WM_DRAWCLIPBOARD = 0x0308;
  static const WINAPI_WinMsg WM_PAINTCLIPBOARD = 0x0309;
  static const WINAPI_WinMsg WM_VSCROLLCLIPBOARD = 0x030A;
  static const WINAPI_WinMsg WM_SIZECLIPBOARD = 0x030B;
  static const WINAPI_WinMsg WM_ASKCBFORMATNAME = 0x030C;
  static const WINAPI_WinMsg WM_CHANGECBCHAIN = 0x030D;
  static const WINAPI_WinMsg WM_HSCROLLCLIPBOARD = 0x030E;
  static const WINAPI_WinMsg WM_QUERYNEWPALETTE = 0x030F;
  static const WINAPI_WinMsg WM_PALETTEISCHANGING = 0x0310;
  static const WINAPI_WinMsg WM_PALETTECHANGED = 0x0311;
  static const WINAPI_WinMsg WM_HOTKEY = 0x0312;
  static const WINAPI_WinMsg WM_PRINT = 0x0317;
  static const WINAPI_WinMsg WM_PRINTCLIENT = 0x0318;
  static const WINAPI_WinMsg WM_APPCOMMAND = 0x0319;
  static const WINAPI_WinMsg WM_THEMECHANGED = 0x031A;
  static const WINAPI_WinMsg WM_CLIPBOARDUPDATE = 0x031D;
  static const WINAPI_WinMsg WM_DWMCOMPOSITIONCHANGED = 0x031E;
  static const WINAPI_WinMsg WM_DWMNCRENDERINGCHANGED = 0x031F;
  static const WINAPI_WinMsg WM_DWMCOLORIZATIONCOLORCHANGED = 0x0320;
  static const WINAPI_WinMsg WM_DWMWINDOWMAXIMIZEDCHANGE = 0x0321;
  static const WINAPI_WinMsg WM_GETTITLEBARINFOEX = 0x033F;
  static const WINAPI_WinMsg WM_USER = 0x0400;
  static const WINAPI_WinMsg EM_GETSEL = 0x00B0;
  static const WINAPI_WinMsg EM_SETSEL = 0x00B1;
  static const WINAPI_WinMsg EM_GETRECT = 0x00B2;
  static const WINAPI_WinMsg EM_SETRECT = 0x00B3;
  static const WINAPI_WinMsg EM_SETRECTNP = 0x00B4;
  static const WINAPI_WinMsg EM_SCROLL = 0x00B5;
  static const WINAPI_WinMsg EM_LINESCROLL = 0x00B6;
  static const WINAPI_WinMsg EM_SCROLLCARET = 0x00B7;
  static const WINAPI_WinMsg EM_GETMODIFY = 0x00B8;
  static const WINAPI_WinMsg EM_SETMODIFY = 0x00B9;
  static const WINAPI_WinMsg EM_GETLINECOUNT = 0x00BA;
  static const WINAPI_WinMsg EM_LINEINDEX = 0x00BB;
  static const WINAPI_WinMsg EM_SETHANDLE = 0x00BC;
  static const WINAPI_WinMsg EM_GETHANDLE = 0x00BD;
  static const WINAPI_WinMsg EM_GETTHUMB = 0x00BE;
  static const WINAPI_WinMsg EM_LINELENGTH = 0x00C1;
  static const WINAPI_WinMsg EM_REPLACESEL = 0x00C2;
  static const WINAPI_WinMsg EM_GETLINE = 0x00C4;
  static const WINAPI_WinMsg EM_LIMITTEXT = 0x00C5;
  static const WINAPI_WinMsg EM_CANUNDO = 0x00C6;
  static const WINAPI_WinMsg EM_UNDO = 0x00C7;
  static const WINAPI_WinMsg EM_FMTLINES = 0x00C8;
  static const WINAPI_WinMsg EM_LINEFROMCHAR = 0x00C9;
  static const WINAPI_WinMsg EM_SETTABSTOPS = 0x00CB;
  static const WINAPI_WinMsg EM_SETPASSWORDCHAR = 0x00CC;
  static const WINAPI_WinMsg EM_EMPTYUNDOBUFFER = 0x00CD;
  static const WINAPI_WinMsg EM_GETFIRSTVISIBLELINE = 0x00CE;
  static const WINAPI_WinMsg EM_SETREADONLY = 0x00CF;
  static const WINAPI_WinMsg EM_SETWORDBREAKPROC = 0x00D0;
  static const WINAPI_WinMsg EM_GETWORDBREAKPROC = 0x00D1;
  static const WINAPI_WinMsg EM_GETPASSWORDCHAR = 0x00D2;
  static const WINAPI_WinMsg EM_SETMARGINS = 0x00D3;
  static const WINAPI_WinMsg EM_GETMARGINS = 0x00D4;
  static const WINAPI_WinMsg EM_SETLIMITTEXT = 0x00C5;
  static const WINAPI_WinMsg EM_GETLIMITTEXT = 0x00D5;
  static const WINAPI_WinMsg EM_POSFROMCHAR = 0x00D6;
  static const WINAPI_WinMsg EM_CHARFROMPOS = 0x00D7;
  static const WINAPI_WinMsg EM_SETIMESTATUS = 0x00D8;
  static const WINAPI_WinMsg EM_GETIMESTATUS = 0x00D9;
  static const WINAPI_WinMsg BM_GETCHECK = 0x00F0;
  static const WINAPI_WinMsg BM_SETCHECK = 0x00F1;
  static const WINAPI_WinMsg BM_GETSTATE = 0x00F2;
  static const WINAPI_WinMsg BM_SETSTATE = 0x00F3;
  static const WINAPI_WinMsg BM_SETSTYLE = 0x00F4;
  static const WINAPI_WinMsg BM_CLICK = 0x00F5;
  static const WINAPI_WinMsg BM_GETIMAGE = 0x00F6;
  static const WINAPI_WinMsg BM_SETIMAGE = 0x00F7;
  static const WINAPI_WinMsg BM_SETDONTCLICK = 0x00F8;
  typedef struct MSG {
    HWND hwnd;
    WINAPI_WinMsg message;
    WPARAM wParam;
    LPARAM lParam;
    DWORD time;
    POINT pt;
  } MSG;
//typedef MSG* MSG*; //Alias
  typedef MSG* LPMSG; //Alias
  typedef UINT WINAPI_ImageType; //Alias
  static const WINAPI_ImageType IMAGE_BITMAP = 0;
  static const WINAPI_ImageType IMAGE_ICON = 1;
  static const WINAPI_ImageType IMAGE_CURSOR = 2;
  static const WINAPI_ImageType IMAGE_ENHMETAFILE = 3;
  typedef UINT WINAPI_LRFlags; //Alias
  typedef int WINAPI_SBType; //Alias
  static const WINAPI_SBType SB_HORZ = 0;
  static const WINAPI_SBType SB_VERT = 1;
  static const WINAPI_SBType SB_CTL = 2;
  static const WINAPI_SBType SB_BOTH = 3;
  typedef UINT WINAPI_IsTextUnicodeFlags; //Alias
  typedef DWORD WINAPI_WaitTimeout; //Alias
  static const WINAPI_WaitTimeout INFINITE = 0xFFFFFFFF;
  typedef UINT WINAPI_BorderFlag; //Alias
  typedef int WINAPI_SysColorIndex; //Alias
  static const WINAPI_SysColorIndex COLOR_SCROLLBAR = 0;
  static const WINAPI_SysColorIndex COLOR_BACKGROUND = 1;
  static const WINAPI_SysColorIndex COLOR_ACTIVECAPTION = 2;
  static const WINAPI_SysColorIndex COLOR_INACTIVECAPTION = 3;
  static const WINAPI_SysColorIndex COLOR_MENU = 4;
  static const WINAPI_SysColorIndex COLOR_WINDOW = 5;
  static const WINAPI_SysColorIndex COLOR_WINDOWFRAME = 6;
  static const WINAPI_SysColorIndex COLOR_MENUTEXT = 7;
  static const WINAPI_SysColorIndex COLOR_WINDOWTEXT = 8;
  static const WINAPI_SysColorIndex COLOR_CAPTIONTEXT = 9;
  static const WINAPI_SysColorIndex COLOR_ACTIVEBORDER = 10;
  static const WINAPI_SysColorIndex COLOR_INACTIVEBORDER = 11;
  static const WINAPI_SysColorIndex COLOR_APPWORKSPACE = 12;
  static const WINAPI_SysColorIndex COLOR_HIGHLIGHT = 13;
  static const WINAPI_SysColorIndex COLOR_HIGHLIGHTTEXT = 14;
  static const WINAPI_SysColorIndex COLOR_BTNFACE = 15;
  static const WINAPI_SysColorIndex COLOR_BTNSHADOW = 16;
  static const WINAPI_SysColorIndex COLOR_GRAYTEXT = 17;
  static const WINAPI_SysColorIndex COLOR_BTNTEXT = 18;
  static const WINAPI_SysColorIndex COLOR_INACTIVECAPTIONTEXT = 19;
  static const WINAPI_SysColorIndex COLOR_BTNHIGHLIGHT = 20;
  static const WINAPI_SysColorIndex COLOR_3DDKSHADOW = 21;
  static const WINAPI_SysColorIndex COLOR_3DLIGHT = 22;
  static const WINAPI_SysColorIndex COLOR_INFOTEXT = 23;
  static const WINAPI_SysColorIndex COLOR_INFOBK = 24;
  static const WINAPI_SysColorIndex COLOR_HOTLIGHT = 26;
  static const WINAPI_SysColorIndex COLOR_GRADIENTACTIVECAPTION = 27;
  static const WINAPI_SysColorIndex COLOR_GRADIENTINACTIVECAPTION = 28;
  static const WINAPI_SysColorIndex COLOR_MENUHILIGHT = 29;
  static const WINAPI_SysColorIndex COLOR_MENUBAR = 30;
  typedef UINT WINAPI_BorderEdge; //Alias
  typedef DWORD WINAPI_DrawTextFlags; //Alias
  typedef struct RECT {
    LONG left;
    LONG top;
    LONG right;
    LONG bottom;
  } RECT;
  typedef RECT *LPRECT; //Pointer
//typedef LPRECT LPRECT; //Alias
//typedef LPRECT RECT*; //Alias
  typedef LPRECT LPCRECT; //Alias
//typedef LPRECT RECT*; //Alias
//typedef LPRECT RECT*; //Alias
  typedef RECT RECTL; //Alias
  typedef RECTL *LPCRECTL; //Pointer
  typedef UINT WINAPI_CodePageEnum; //Alias
  static const WINAPI_CodePageEnum CP_ACP = 0;
  static const WINAPI_CodePageEnum CP_OEMCP = 1;
  static const WINAPI_CodePageEnum CP_MACCP = 2;
  static const WINAPI_CodePageEnum CP_THREAD_ACP = 3;
  static const WINAPI_CodePageEnum CP_SYMBOL = 42;
  static const WINAPI_CodePageEnum MS_DOS_Latin_US = 437;
  static const WINAPI_CodePageEnum Thai = 874;
  static const WINAPI_CodePageEnum Japanese_Shift_JIS = 932;
  static const WINAPI_CodePageEnum Chinese_Simplified = 936;
  static const WINAPI_CodePageEnum Korean = 949;
  static const WINAPI_CodePageEnum Chinese_Traditional = 950;
  static const WINAPI_CodePageEnum Unicode_UTF_16_LE = 1200;
  static const WINAPI_CodePageEnum Unicode_UTF_16_BE = 1201;
  static const WINAPI_CodePageEnum Central_European = 1250;
  static const WINAPI_CodePageEnum Cyrillic = 1251;
  static const WINAPI_CodePageEnum Western_European = 1252;
  static const WINAPI_CodePageEnum Greek = 1253;
  static const WINAPI_CodePageEnum Turkish = 1254;
  static const WINAPI_CodePageEnum Hebrew = 1255;
  static const WINAPI_CodePageEnum Arabic = 1256;
  static const WINAPI_CodePageEnum Baltic = 1257;
  static const WINAPI_CodePageEnum Vietnamese = 1258;
  static const WINAPI_CodePageEnum CP_UTF7 = 65000;
  static const WINAPI_CodePageEnum CP_UTF8 = 65001;
  typedef DWORD WINAPI_EXCEPTION_FLAGS; //Alias
//static const WINAPI_EXCEPTION_FLAGS EXCEPTION_NONCONTINUABLE_EXCEPTION = 0x1;
  typedef struct EXCEPTION_RECORD {
    WINAPI_ExceptionCode ExceptionCode;
    DWORD ExceptionFlags;
    LPVOID ExceptionRecord;
    PVOID ExceptionAddress;
    DWORD NumberParameters;
    ULONG_PTR ExceptionInformation[EXCEPTION_MAXIMUM_PARAMETERS];
  } EXCEPTION_RECORD;
  typedef EXCEPTION_RECORD *PEXCEPTION_RECORD; //Pointer
  typedef struct EXCEPTION_POINTERS {
    PEXCEPTION_RECORD ExceptionRecord;
    PCONTEXT ContextRecord;
  } EXCEPTION_POINTERS;
  typedef EXCEPTION_POINTERS *PEXCEPTION_POINTERS; //Pointer
  typedef EXCEPTION_POINTERS *LPEXCEPTION_POINTERS; //Pointer
  typedef struct SP_DEVINFO_DATA {
    DWORD cbSize;
    GUID ClassGuid;
    DWORD DevInst;
    ULONG_PTR Reserved;
  } SP_DEVINFO_DATA;
  typedef SP_DEVINFO_DATA *PSP_DEVINFO_DATA; //Pointer
  typedef struct PROCESS_INFORMATION {
    HANDLE hProcess;
    HANDLE hThread;
    DWORD dwProcessId;
    DWORD dwThreadId;
  } PROCESS_INFORMATION;
  typedef PROCESS_INFORMATION *LPPROCESS_INFORMATION; //Pointer
  typedef int WINAPI_ShowWindowCmd; //Alias
  static const WINAPI_ShowWindowCmd SW_HIDE = 0;
  static const WINAPI_ShowWindowCmd SW_SHOWNORMAL = 1;
  static const WINAPI_ShowWindowCmd SW_NORMAL = 1;
  static const WINAPI_ShowWindowCmd SW_SHOWMINIMIZED = 2;
  static const WINAPI_ShowWindowCmd SW_SHOWMAXIMIZED = 3;
  static const WINAPI_ShowWindowCmd SW_MAXIMIZE = 3;
  static const WINAPI_ShowWindowCmd SW_SHOWNOACTIVATE = 4;
  static const WINAPI_ShowWindowCmd SW_SHOW = 5;
  static const WINAPI_ShowWindowCmd SW_MINIMIZE = 6;
  static const WINAPI_ShowWindowCmd SW_SHOWMINNOACTIVE = 7;
  static const WINAPI_ShowWindowCmd SW_SHOWNA = 8;
  static const WINAPI_ShowWindowCmd SW_RESTORE = 9;
  static const WINAPI_ShowWindowCmd SW_SHOWDEFAULT = 10;
  static const WINAPI_ShowWindowCmd SW_FORCEMINIMIZE = 11;
  typedef WORD WINAPI_STARTUPINFO_ShowWindow; //Alias
//static const WINAPI_STARTUPINFO_ShowWindow SW_HIDE = 0;
//static const WINAPI_STARTUPINFO_ShowWindow SW_SHOWNORMAL = 1;
//static const WINAPI_STARTUPINFO_ShowWindow SW_NORMAL = 1;
//static const WINAPI_STARTUPINFO_ShowWindow SW_SHOWMINIMIZED = 2;
//static const WINAPI_STARTUPINFO_ShowWindow SW_SHOWMAXIMIZED = 3;
//static const WINAPI_STARTUPINFO_ShowWindow SW_MAXIMIZE = 3;
//static const WINAPI_STARTUPINFO_ShowWindow SW_SHOWNOACTIVATE = 4;
//static const WINAPI_STARTUPINFO_ShowWindow SW_SHOW = 5;
//static const WINAPI_STARTUPINFO_ShowWindow SW_MINIMIZE = 6;
//static const WINAPI_STARTUPINFO_ShowWindow SW_SHOWMINNOACTIVE = 7;
//static const WINAPI_STARTUPINFO_ShowWindow SW_SHOWNA = 8;
//static const WINAPI_STARTUPINFO_ShowWindow SW_RESTORE = 9;
//static const WINAPI_STARTUPINFO_ShowWindow SW_SHOWDEFAULT = 10;
//static const WINAPI_STARTUPINFO_ShowWindow SW_FORCEMINIMIZE = 11;
  typedef DWORD WINAPI_STARTUPINFO_Flags; //Alias
  typedef struct STARTUPINFO {
    DWORD cb;
    LPTSTR lpReserved;
    LPTSTR lpDesktop;
    LPTSTR lpTitle;
    DWORD dwX;
    DWORD dwY;
    DWORD dwXSize;
    DWORD dwYSize;
    DWORD dwXCountChars;
    DWORD dwYCountChars;
    DWORD dwFillAttribute;
    WINAPI_STARTUPINFO_Flags dwFlags;
    WINAPI_STARTUPINFO_ShowWindow wShowWindow;
    WORD cbReserved2;
    LPBYTE lpReserved2;
    HANDLE hStdInput;
    HANDLE hStdOutput;
    HANDLE hStdError;
  } STARTUPINFO;
  typedef STARTUPINFO *LPSTARTUPINFO; //Pointer
  typedef struct STARTUPINFOW {
    DWORD cb;
    LPWSTR lpReserved;
    LPWSTR lpDesktop;
    LPWSTR lpTitle;
    DWORD dwX;
    DWORD dwY;
    DWORD dwXSize;
    DWORD dwYSize;
    DWORD dwXCountChars;
    DWORD dwYCountChars;
    DWORD dwFillAttribute;
    WINAPI_STARTUPINFO_Flags dwFlags;
    WINAPI_STARTUPINFO_ShowWindow wShowWindow;
    WORD cbReserved2;
    LPBYTE lpReserved2;
    HANDLE hStdInput;
    HANDLE hStdOutput;
    HANDLE hStdError;
  } STARTUPINFOW;
  typedef STARTUPINFOW *LPSTARTUPINFOW; //Pointer
  typedef union FILE_SEGMENT_ELEMENT {
    PVOID64 Buffer;
    ULONGLONG Alignment;
  } FILE_SEGMENT_ELEMENT;
  typedef FILE_SEGMENT_ELEMENT *FILE_SEGMENT_ELEMENT[]; //Pointer
  typedef struct WINAPI_OVERLAPPED_u_s {
    DWORD Offset;
    DWORD OffsetHigh;
  } WINAPI_OVERLAPPED_u_s;
  typedef union WINAPI_OVERLAPPED_u {
    WINAPI_OVERLAPPED_u_s ;
    PVOID Pointer;
  } WINAPI_OVERLAPPED_u;
  typedef struct OVERLAPPED {
    ULONG_PTR Internal;
    ULONG_PTR InternalHigh;
    WINAPI_OVERLAPPED_u ;
    HANDLE hEvent;
  } OVERLAPPED;
  typedef OVERLAPPED *LPOVERLAPPED; //Pointer
  typedef DWORD WINAPI_ReparsePoint; //Alias
  static const WINAPI_ReparsePoint IO_REPARSE_TAG_MOUNT_POINT = 0xA0000003;
  static const WINAPI_ReparsePoint IO_REPARSE_TAG_HSM = 0xC0000004;
  static const WINAPI_ReparsePoint IO_REPARSE_TAG_HSM2 = 0x80000006;
  static const WINAPI_ReparsePoint IO_REPARSE_TAG_SIS = 0x80000007;
  static const WINAPI_ReparsePoint IO_REPARSE_TAG_WIM = 0x80000008;
  static const WINAPI_ReparsePoint IO_REPARSE_TAG_CSV = 0x80000009;
  static const WINAPI_ReparsePoint IO_REPARSE_TAG_DFS = 0x8000000A;
  static const WINAPI_ReparsePoint IO_REPARSE_TAG_SYMLINK = 0xA000000C;
  static const WINAPI_ReparsePoint IO_REPARSE_TAG_DFSR = 0x80000012;
  typedef DWORD WINAPI_FileAttributes; //Alias
  typedef struct WIN32_FIND_DATA {
    WINAPI_FileAttributes dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    DWORD nFileSizeHigh;
    DWORD nFileSizeLow;
    WINAPI_ReparsePoint dwReserved0;
    DWORD dwReserved1;
    TCHAR cFileName[MAX_PATH];
    TCHAR cAlternateFileName[14];
  } WIN32_FIND_DATA;
  typedef WIN32_FIND_DATA *LPWIN32_FIND_DATA; //Pointer
  typedef struct WIN32_FIND_DATAA {
    WINAPI_FileAttributes dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    DWORD nFileSizeHigh;
    DWORD nFileSizeLow;
    WINAPI_ReparsePoint dwReserved0;
    DWORD dwReserved1;
    CHAR cFileName[MAX_PATH];
    CHAR cAlternateFileName[14];
  } WIN32_FIND_DATAA;
  typedef struct WIN32_FIND_DATAW {
    WINAPI_FileAttributes dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    DWORD nFileSizeHigh;
    DWORD nFileSizeLow;
    WINAPI_ReparsePoint dwReserved0;
    DWORD dwReserved1;
    WCHAR cFileName[MAX_PATH];
    WCHAR cAlternateFileName[14];
  } WIN32_FIND_DATAW;
  typedef struct TIME_ZONE_INFORMATION {
    LONG Bias;
    WCHAR StandardName[32];
    SYSTEMTIME StandardDate;
    LONG StandardBias;
    WCHAR DaylightName[32];
    SYSTEMTIME DaylightDate;
    LONG DaylightBias;
  } TIME_ZONE_INFORMATION;
  typedef TIME_ZONE_INFORMATION *LPTIME_ZONE_INFORMATION; //Pointer
  typedef struct OFSTRUCT {
    BYTE cBytes;
    BYTE fFixedDisk;
    WORD nErrCode;
    WORD Reserved1;
    WORD Reserved2;
    CHAR szPathName[OFS_MAXPATHNAME];
  } OFSTRUCT;
  typedef OFSTRUCT *LPOFSTRUCT; //Pointer
  typedef WORD WINAPI_PROCESSOR_ARCHITECTURE; //Alias
  static const WINAPI_PROCESSOR_ARCHITECTURE PROCESSOR_ARCHITECTURE_INTEL = 0;
  static const WINAPI_PROCESSOR_ARCHITECTURE PROCESSOR_ARCHITECTURE_IA64 = 6;
  static const WINAPI_PROCESSOR_ARCHITECTURE PROCESSOR_ARCHITECTURE_AMD64 = 9;
  static const WINAPI_PROCESSOR_ARCHITECTURE PROCESSOR_ARCHITECTURE_UNKNOWN = 0xFFFF;
  typedef DWORD MINIDUMP_TYPE; //Alias
  typedef DWORD THREAD_WRITE_FLAGS; //Alias
  typedef DWORD MODULE_WRITE_FLAGS; //Alias
  typedef WORD WINAPI_VirtKeyCode; //Alias
  static const WINAPI_VirtKeyCode VK_LBUTTON = 0x01;
  static const WINAPI_VirtKeyCode VK_RBUTTON = 0x02;
  static const WINAPI_VirtKeyCode VK_CANCEL = 0x03;
  static const WINAPI_VirtKeyCode VK_MBUTTON = 0x04;
  static const WINAPI_VirtKeyCode VK_XBUTTON1 = 0x05;
  static const WINAPI_VirtKeyCode VK_XBUTTON2 = 0x06;
  static const WINAPI_VirtKeyCode VK_BACK = 0x08;
  static const WINAPI_VirtKeyCode VK_TAB = 0x09;
  static const WINAPI_VirtKeyCode VK_CLEAR = 0x0C;
  static const WINAPI_VirtKeyCode VK_RETURN = 0x0D;
  static const WINAPI_VirtKeyCode VK_SHIFT = 0x10;
  static const WINAPI_VirtKeyCode VK_CONTROL = 0x11;
  static const WINAPI_VirtKeyCode VK_MENU = 0x12;
  static const WINAPI_VirtKeyCode VK_PAUSE = 0x13;
  static const WINAPI_VirtKeyCode VK_CAPITAL = 0x14;
  static const WINAPI_VirtKeyCode VK_KANA = 0x15;
  static const WINAPI_VirtKeyCode VK_JUNJA = 0x17;
  static const WINAPI_VirtKeyCode VK_FINAL = 0x18;
  static const WINAPI_VirtKeyCode VK_KANJI = 0x19;
  static const WINAPI_VirtKeyCode VK_ESCAPE = 0x1B;
  static const WINAPI_VirtKeyCode VK_CONVERT = 0x1C;
  static const WINAPI_VirtKeyCode VK_NONCONVERT = 0x1D;
  static const WINAPI_VirtKeyCode VK_ACCEPT = 0x1E;
  static const WINAPI_VirtKeyCode VK_MODECHANGE = 0x1F;
  static const WINAPI_VirtKeyCode VK_SPACE = 0x20;
  static const WINAPI_VirtKeyCode VK_PRIOR = 0x21;
  static const WINAPI_VirtKeyCode VK_NEXT = 0x22;
  static const WINAPI_VirtKeyCode VK_END = 0x23;
  static const WINAPI_VirtKeyCode VK_HOME = 0x24;
  static const WINAPI_VirtKeyCode VK_LEFT = 0x25;
  static const WINAPI_VirtKeyCode VK_UP = 0x26;
  static const WINAPI_VirtKeyCode VK_RIGHT = 0x27;
  static const WINAPI_VirtKeyCode VK_DOWN = 0x28;
  static const WINAPI_VirtKeyCode VK_SELECT = 0x29;
  static const WINAPI_VirtKeyCode VK_PRINT = 0x2A;
  static const WINAPI_VirtKeyCode VK_EXECUTE = 0x2B;
  static const WINAPI_VirtKeyCode VK_SNAPSHOT = 0x2C;
  static const WINAPI_VirtKeyCode VK_INSERT = 0x2D;
  static const WINAPI_VirtKeyCode VK_DELETE = 0x2E;
  static const WINAPI_VirtKeyCode VK_HELP = 0x2F;
  static const WINAPI_VirtKeyCode VK_LWIN = 0x5B;
  static const WINAPI_VirtKeyCode VK_RWIN = 0x5C;
  static const WINAPI_VirtKeyCode VK_APPS = 0x5D;
  static const WINAPI_VirtKeyCode VK_SLEEP = 0x5F;
  static const WINAPI_VirtKeyCode VK_NUMPAD0 = 0x60;
  static const WINAPI_VirtKeyCode VK_NUMPAD1 = 0x61;
  static const WINAPI_VirtKeyCode VK_NUMPAD2 = 0x62;
  static const WINAPI_VirtKeyCode VK_NUMPAD3 = 0x63;
  static const WINAPI_VirtKeyCode VK_NUMPAD4 = 0x64;
  static const WINAPI_VirtKeyCode VK_NUMPAD5 = 0x65;
  static const WINAPI_VirtKeyCode VK_NUMPAD6 = 0x66;
  static const WINAPI_VirtKeyCode VK_NUMPAD7 = 0x67;
  static const WINAPI_VirtKeyCode VK_NUMPAD8 = 0x68;
  static const WINAPI_VirtKeyCode VK_NUMPAD9 = 0x69;
  static const WINAPI_VirtKeyCode VK_MULTIPLY = 0x6A;
  static const WINAPI_VirtKeyCode VK_ADD = 0x6B;
  static const WINAPI_VirtKeyCode VK_SEPARATOR = 0x6C;
  static const WINAPI_VirtKeyCode VK_SUBTRACT = 0x6D;
  static const WINAPI_VirtKeyCode VK_DECIMAL = 0x6E;
  static const WINAPI_VirtKeyCode VK_DIVIDE = 0x6F;
  static const WINAPI_VirtKeyCode VK_F1 = 0x70;
  static const WINAPI_VirtKeyCode VK_F2 = 0x71;
  static const WINAPI_VirtKeyCode VK_F3 = 0x72;
  static const WINAPI_VirtKeyCode VK_F4 = 0x73;
  static const WINAPI_VirtKeyCode VK_F5 = 0x74;
  static const WINAPI_VirtKeyCode VK_F6 = 0x75;
  static const WINAPI_VirtKeyCode VK_F7 = 0x76;
  static const WINAPI_VirtKeyCode VK_F8 = 0x77;
  static const WINAPI_VirtKeyCode VK_F9 = 0x78;
  static const WINAPI_VirtKeyCode VK_F10 = 0x79;
  static const WINAPI_VirtKeyCode VK_F11 = 0x7A;
  static const WINAPI_VirtKeyCode VK_F12 = 0x7B;
  static const WINAPI_VirtKeyCode VK_F13 = 0x7C;
  static const WINAPI_VirtKeyCode VK_F14 = 0x7D;
  static const WINAPI_VirtKeyCode VK_F15 = 0x7E;
  static const WINAPI_VirtKeyCode VK_F16 = 0x7F;
  static const WINAPI_VirtKeyCode VK_F17 = 0x80;
  static const WINAPI_VirtKeyCode VK_F18 = 0x81;
  static const WINAPI_VirtKeyCode VK_F19 = 0x82;
  static const WINAPI_VirtKeyCode VK_F20 = 0x83;
  static const WINAPI_VirtKeyCode VK_F21 = 0x84;
  static const WINAPI_VirtKeyCode VK_F22 = 0x85;
  static const WINAPI_VirtKeyCode VK_F23 = 0x86;
  static const WINAPI_VirtKeyCode VK_F24 = 0x87;
  static const WINAPI_VirtKeyCode VK_NUMLOCK = 0x90;
  static const WINAPI_VirtKeyCode VK_SCROLL = 0x91;
  static const WINAPI_VirtKeyCode VK_OEM_NEC_EQUAL = 0x92;
  static const WINAPI_VirtKeyCode VK_LSHIFT = 0xA0;
  static const WINAPI_VirtKeyCode VK_RSHIFT = 0xA1;
  static const WINAPI_VirtKeyCode VK_LCONTROL = 0xA2;
  static const WINAPI_VirtKeyCode VK_RCONTROL = 0xA3;
  static const WINAPI_VirtKeyCode VK_LMENU = 0xA4;
  static const WINAPI_VirtKeyCode VK_RMENU = 0xA5;
  static const WINAPI_VirtKeyCode VK_BROWSER_BACK = 0xA6;
  static const WINAPI_VirtKeyCode VK_BROWSER_FORWARD = 0xA7;
  static const WINAPI_VirtKeyCode VK_BROWSER_REFRESH = 0xA8;
  static const WINAPI_VirtKeyCode VK_BROWSER_STOP = 0xA9;
  static const WINAPI_VirtKeyCode VK_BROWSER_SEARCH = 0xAA;
  static const WINAPI_VirtKeyCode VK_BROWSER_FAVORITES = 0xAB;
  static const WINAPI_VirtKeyCode VK_BROWSER_HOME = 0xAC;
  static const WINAPI_VirtKeyCode VK_VOLUME_MUTE = 0xAD;
  static const WINAPI_VirtKeyCode VK_VOLUME_DOWN = 0xAE;
  static const WINAPI_VirtKeyCode VK_VOLUME_UP = 0xAF;
  static const WINAPI_VirtKeyCode VK_MEDIA_NEXT_TRACK = 0xB0;
  static const WINAPI_VirtKeyCode VK_MEDIA_PREV_TRACK = 0xB1;
  static const WINAPI_VirtKeyCode VK_MEDIA_STOP = 0xB2;
  static const WINAPI_VirtKeyCode VK_MEDIA_PLAY_PAUSE = 0xB3;
  static const WINAPI_VirtKeyCode VK_LAUNCH_MAIL = 0xB4;
  static const WINAPI_VirtKeyCode VK_LAUNCH_MEDIA_SELECT = 0xB5;
  static const WINAPI_VirtKeyCode VK_LAUNCH_APP1 = 0xB6;
  static const WINAPI_VirtKeyCode VK_LAUNCH_APP2 = 0xB7;
  static const WINAPI_VirtKeyCode VK_OEM_1 = 0xBA;
  static const WINAPI_VirtKeyCode VK_OEM_PLUS = 0xBB;
  static const WINAPI_VirtKeyCode VK_OEM_COMMA = 0xBC;
  static const WINAPI_VirtKeyCode VK_OEM_MINUS = 0xBD;
  static const WINAPI_VirtKeyCode VK_OEM_PERIOD = 0xBE;
  static const WINAPI_VirtKeyCode VK_OEM_2 = 0xBF;
  static const WINAPI_VirtKeyCode VK_OEM_3 = 0xC0;
  static const WINAPI_VirtKeyCode VK_OEM_4 = 0xDB;
  static const WINAPI_VirtKeyCode VK_OEM_5 = 0xDC;
  static const WINAPI_VirtKeyCode VK_OEM_6 = 0xDD;
  static const WINAPI_VirtKeyCode VK_OEM_7 = 0xDE;
  static const WINAPI_VirtKeyCode VK_OEM_8 = 0xDF;
  static const WINAPI_VirtKeyCode VK_OEM_AX = 0xE1;
  static const WINAPI_VirtKeyCode VK_OEM_102 = 0xE2;
  static const WINAPI_VirtKeyCode VK_ICO_HELP = 0xE3;
  static const WINAPI_VirtKeyCode VK_ICO_00 = 0xE4;
  static const WINAPI_VirtKeyCode VK_PROCESSKEY = 0xE5;
  static const WINAPI_VirtKeyCode VK_ICO_CLEAR = 0xE6;
  static const WINAPI_VirtKeyCode VK_PACKET = 0xE7;
  static const WINAPI_VirtKeyCode VK_OEM_RESET = 0xE9;
  static const WINAPI_VirtKeyCode VK_OEM_JUMP = 0xEA;
  static const WINAPI_VirtKeyCode VK_OEM_PA1 = 0xEB;
  static const WINAPI_VirtKeyCode VK_OEM_PA2 = 0xEC;
  static const WINAPI_VirtKeyCode VK_OEM_PA3 = 0xED;
  static const WINAPI_VirtKeyCode VK_OEM_WSCTRL = 0xEE;
  static const WINAPI_VirtKeyCode VK_OEM_CUSEL = 0xEF;
  static const WINAPI_VirtKeyCode VK_OEM_ATTN = 0xF0;
  static const WINAPI_VirtKeyCode VK_OEM_FINISH = 0xF1;
  static const WINAPI_VirtKeyCode VK_OEM_COPY = 0xF2;
  static const WINAPI_VirtKeyCode VK_OEM_AUTO = 0xF3;
  static const WINAPI_VirtKeyCode VK_OEM_ENLW = 0xF4;
  static const WINAPI_VirtKeyCode VK_OEM_BACKTAB = 0xF5;
  static const WINAPI_VirtKeyCode VK_ATTN = 0xF6;
  static const WINAPI_VirtKeyCode VK_CRSEL = 0xF7;
  static const WINAPI_VirtKeyCode VK_EXSEL = 0xF8;
  static const WINAPI_VirtKeyCode VK_EREOF = 0xF9;
  static const WINAPI_VirtKeyCode VK_PLAY = 0xFA;
  static const WINAPI_VirtKeyCode VK_ZOOM = 0xFB;
  static const WINAPI_VirtKeyCode VK_NONAME = 0xFC;
  static const WINAPI_VirtKeyCode VK_PA1 = 0xFD;
  static const WINAPI_VirtKeyCode VK_OEM_CLEAR = 0xFE;
  typedef DWORD WINAPI_VER_PLATFORM; //Alias
  static const WINAPI_VER_PLATFORM VER_PLATFORM_WIN32s = 0;
  static const WINAPI_VER_PLATFORM VER_PLATFORM_WIN32_WINDOWS = 1;
  static const WINAPI_VER_PLATFORM VER_PLATFORM_WIN32_NT = 2;
  typedef struct OSVERSIONINFO {
    DWORD dwOSVersionInfoSize;
    DWORD dwMajorVersion;
    DWORD dwMinorVersion;
    DWORD dwBuildNumber;
    WINAPI_VER_PLATFORM dwPlatformId;
    TCHAR szCSDVersion[128];
  } OSVERSIONINFO;
  typedef OSVERSIONINFO *LPOSVERSIONINFO; //Pointer
  typedef struct RTL_OSVERSIONINFOW {
    DWORD dwOSVersionInfoSize;
    DWORD dwMajorVersion;
    DWORD dwMinorVersion;
    DWORD dwBuildNumber;
    WINAPI_VER_PLATFORM dwPlatformId;
    WCHAR szCSDVersion[128];
  } RTL_OSVERSIONINFOW;
  typedef RTL_OSVERSIONINFOW *PRTL_OSVERSIONINFOW; //Pointer
  typedef WORD WINAPI_VER_SUITE; //Alias
  typedef BYTE WINAPI_VER_PRODUCT; //Alias
  static const WINAPI_VER_PRODUCT VER_NT_WORKSTATION = 0x0000001;
  static const WINAPI_VER_PRODUCT VER_NT_DOMAIN_CONTROLLER = 0x0000002;
  static const WINAPI_VER_PRODUCT VER_NT_SERVER = 0x0000003;
  typedef struct OSVERSIONINFOEX {
    DWORD dwOSVersionInfoSize;
    DWORD dwMajorVersion;
    DWORD dwMinorVersion;
    DWORD dwBuildNumber;
    DWORD dwPlatformId;
    TCHAR szCSDVersion[128];
    WORD wServicePackMajor;
    WORD wServicePackMinor;
    WINAPI_VER_SUITE wSuiteMask;
    WINAPI_VER_PRODUCT wProductType;
    BYTE wReserved;
  } OSVERSIONINFOEX;
  typedef OSVERSIONINFOEX *LPOSVERSIONINFOEX; //Pointer
  typedef struct RTL_OSVERSIONINFOEXW {
    DWORD dwOSVersionInfoSize;
    DWORD dwMajorVersion;
    DWORD dwMinorVersion;
    DWORD dwBuildNumber;
    DWORD dwPlatformId;
    WCHAR szCSDVersion[128];
    WORD wServicePackMajor;
    WORD wServicePackMinor;
    WINAPI_VER_SUITE wSuiteMask;
    WINAPI_VER_PRODUCT wProductType;
    BYTE wReserved;
  } RTL_OSVERSIONINFOEXW;
  typedef RTL_OSVERSIONINFOEXW *PRTL_OSVERSIONINFOEXW; //Pointer
  typedef ULONG SymTagEnum; //Alias
  static const SymTagEnum SymTagNull = 0;
  static const SymTagEnum SymTagExe = 1;
  static const SymTagEnum SymTagCompiland = 2;
  static const SymTagEnum SymTagCompilandDetails = 3;
  static const SymTagEnum SymTagCompilandEnv = 4;
  static const SymTagEnum SymTagFunction = 5;
  static const SymTagEnum SymTagBlock = 6;
  static const SymTagEnum SymTagData = 7;
  static const SymTagEnum SymTagAnnotation = 8;
  static const SymTagEnum SymTagLabel = 9;
  static const SymTagEnum SymTagPublicSymbol = 10;
  static const SymTagEnum SymTagUDT = 11;
//static const SymTagEnum SymTagEnum = 12;
  static const SymTagEnum SymTagFunctionType = 13;
  static const SymTagEnum SymTagPointerType = 14;
  static const SymTagEnum SymTagArrayType = 15;
  static const SymTagEnum SymTagBaseType = 16;
  static const SymTagEnum SymTagTypedef = 17;
  static const SymTagEnum SymTagBaseClass = 18;
  static const SymTagEnum SymTagFriend = 19;
  static const SymTagEnum SymTagFunctionArgType = 20;
  static const SymTagEnum SymTagFuncDebugStart = 21;
  static const SymTagEnum SymTagFuncDebugEnd = 22;
  static const SymTagEnum SymTagUsingNamespace = 23;
  static const SymTagEnum SymTagVTableShape = 24;
  static const SymTagEnum SymTagVTable = 25;
  static const SymTagEnum SymTagCustom = 26;
  static const SymTagEnum SymTagThunk = 27;
  static const SymTagEnum SymTagCustomType = 28;
  static const SymTagEnum SymTagManagedType = 29;
  static const SymTagEnum SymTagDimension = 30;
  typedef SymTagEnum WINAPI_SymTagEnum_ULONG; //Alias
  typedef struct IMAGE_DATA_DIRECTORY {
    DWORD VirtualAddress;
    DWORD Size;
  } IMAGE_DATA_DIRECTORY;
  enum { IMAGE_NUMBEROF_DIRECTORY_ENTRIES = 16 };
  typedef WORD WINAPI_IMAGE_OPTIONAL_MAGIC; //Alias
  static const WINAPI_IMAGE_OPTIONAL_MAGIC IMAGE_NT_OPTIONAL_HDR32_MAGIC = 0x10b;
  static const WINAPI_IMAGE_OPTIONAL_MAGIC IMAGE_NT_OPTIONAL_HDR64_MAGIC = 0x20b;
  static const WINAPI_IMAGE_OPTIONAL_MAGIC IMAGE_ROM_OPTIONAL_HDR_MAGIC = 0x107;
  typedef WORD WINAPI_IMAGE_SUBSYSTEM; //Alias
  static const WINAPI_IMAGE_SUBSYSTEM IMAGE_SUBSYSTEM_UNKNOWN = 0;
  static const WINAPI_IMAGE_SUBSYSTEM IMAGE_SUBSYSTEM_NATIVE = 1;
  static const WINAPI_IMAGE_SUBSYSTEM IMAGE_SUBSYSTEM_WINDOWS_GUI = 2;
  static const WINAPI_IMAGE_SUBSYSTEM IMAGE_SUBSYSTEM_WINDOWS_CUI = 3;
  static const WINAPI_IMAGE_SUBSYSTEM IMAGE_SUBSYSTEM_OS2_CUI = 5;
  static const WINAPI_IMAGE_SUBSYSTEM IMAGE_SUBSYSTEM_POSIX_CUI = 7;
  static const WINAPI_IMAGE_SUBSYSTEM IMAGE_SUBSYSTEM_NATIVE_WINDOWS = 8;
  static const WINAPI_IMAGE_SUBSYSTEM IMAGE_SUBSYSTEM_WINDOWS_CE_GUI = 9;
  static const WINAPI_IMAGE_SUBSYSTEM IMAGE_SUBSYSTEM_EFI_APPLICATION = 10;
  static const WINAPI_IMAGE_SUBSYSTEM IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER = 11;
  static const WINAPI_IMAGE_SUBSYSTEM IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER = 12;
  static const WINAPI_IMAGE_SUBSYSTEM IMAGE_SUBSYSTEM_EFI_ROM = 13;
  static const WINAPI_IMAGE_SUBSYSTEM IMAGE_SUBSYSTEM_XBOX = 14;
  static const WINAPI_IMAGE_SUBSYSTEM IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION = 16;
  typedef WORD WINAPI_IMAGE_DLLCHARACTERISTICS; //Alias
  typedef WORD WINAPI_IMAGE_FILE_MACHINE; //Alias
  static const WINAPI_IMAGE_FILE_MACHINE IMAGE_FILE_MACHINE_UNKNOWN = 0;
  static const WINAPI_IMAGE_FILE_MACHINE IMAGE_FILE_MACHINE_I386 = 0x014c;
  static const WINAPI_IMAGE_FILE_MACHINE IMAGE_FILE_MACHINE_IA64 = 0x0200;
  static const WINAPI_IMAGE_FILE_MACHINE IMAGE_FILE_MACHINE_AMD64 = 0x8664;
  typedef WORD WINAPI_IMAGE_FILE_CHARACTERISTICS; //Alias
  typedef struct IMAGE_FILE_HEADER {
    WINAPI_IMAGE_FILE_MACHINE Machine;
    WORD NumberOfSections;
    DWORD TimeDateStamp;
    DWORD PointerToSymbolTable;
    DWORD NumberOfSymbols;
    WORD SizeOfOptionalHeader;
    WINAPI_IMAGE_FILE_CHARACTERISTICS Characteristics;
  } IMAGE_FILE_HEADER;
]]
if ffi.arch == 'x86' then ffi.cdef[[
  typedef struct IMAGE_OPTIONAL_HEADER {
    WINAPI_IMAGE_OPTIONAL_MAGIC Magic;
    BYTE MajorLinkerVersion;
    BYTE MinorLinkerVersion;
    DWORD SizeOfCode;
    DWORD SizeOfInitializedData;
    DWORD SizeOfUninitializedData;
    DWORD AddressOfEntryPoint;
    DWORD BaseOfCode;
    DWORD BaseOfData;
    DWORD ImageBase;
    DWORD SectionAlignment;
    DWORD FileAlignment;
    WORD MajorOperatingSystemVersion;
    WORD MinorOperatingSystemVersion;
    WORD MajorImageVersion;
    WORD MinorImageVersion;
    WORD MajorSubsystemVersion;
    WORD MinorSubsystemVersion;
    DWORD Win32VersionValue;
    DWORD SizeOfImage;
    DWORD SizeOfHeaders;
    DWORD CheckSum;
    WINAPI_IMAGE_SUBSYSTEM Subsystem;
    WINAPI_IMAGE_DLLCHARACTERISTICS DllCharacteristics;
    DWORD SizeOfStackReserve;
    DWORD SizeOfStackCommit;
    DWORD SizeOfHeapReserve;
    DWORD SizeOfHeapCommit;
    DWORD LoaderFlags;
    DWORD NumberOfRvaAndSizes;
    IMAGE_DATA_DIRECTORY DataDirectory[IMAGE_NUMBEROF_DIRECTORY_ENTRIES];
  } IMAGE_OPTIONAL_HEADER;
]]
end
ffi.cdef[[
  typedef struct IMAGE_OPTIONAL_HEADER64 {
    WINAPI_IMAGE_OPTIONAL_MAGIC Magic;
    BYTE MajorLinkerVersion;
    BYTE MinorLinkerVersion;
    DWORD SizeOfCode;
    DWORD SizeOfInitializedData;
    DWORD SizeOfUninitializedData;
    DWORD AddressOfEntryPoint;
    DWORD BaseOfCode;
    ULONGLONG ImageBase;
    DWORD SectionAlignment;
    DWORD FileAlignment;
    WORD MajorOperatingSystemVersion;
    WORD MinorOperatingSystemVersion;
    WORD MajorImageVersion;
    WORD MinorImageVersion;
    WORD MajorSubsystemVersion;
    WORD MinorSubsystemVersion;
    DWORD Win32VersionValue;
    DWORD SizeOfImage;
    DWORD SizeOfHeaders;
    DWORD CheckSum;
    WINAPI_IMAGE_SUBSYSTEM Subsystem;
    WINAPI_IMAGE_DLLCHARACTERISTICS DllCharacteristics;
    ULONGLONG SizeOfStackReserve;
    ULONGLONG SizeOfStackCommit;
    ULONGLONG SizeOfHeapReserve;
    ULONGLONG SizeOfHeapCommit;
    DWORD LoaderFlags;
    DWORD NumberOfRvaAndSizes;
    IMAGE_DATA_DIRECTORY DataDirectory[IMAGE_NUMBEROF_DIRECTORY_ENTRIES];
  } IMAGE_OPTIONAL_HEADER64;
]]
if ffi.arch == 'x64' then ffi.cdef[[
  typedef IMAGE_OPTIONAL_HEADER64 IMAGE_OPTIONAL_HEADER; //Alias
]]
end
ffi.cdef[[
  typedef struct IMAGE_NT_HEADERS {
    DWORD Signature;
    IMAGE_FILE_HEADER FileHeader;
    IMAGE_OPTIONAL_HEADER OptionalHeader;
  } IMAGE_NT_HEADERS;
  typedef IMAGE_NT_HEADERS *PIMAGE_NT_HEADERS; //Pointer
  typedef struct NUMBERFMT {
    UINT NumDigits;
    UINT LeadingZero;
    UINT Grouping;
    LPTSTR lpDecimalSep;
    LPTSTR lpThousandSep;
    UINT NegativeOrder;
  } NUMBERFMT;
  typedef DWORD WINAPI_DwmWindowAttr; //Alias
  static const WINAPI_DwmWindowAttr DWMWA_NCRENDERING_ENABLED = 1;
  static const WINAPI_DwmWindowAttr DWMWA_NCRENDERING_POLICY = 2;
  static const WINAPI_DwmWindowAttr DWMWA_TRANSITIONS_FORCEDISABLED = 3;
  static const WINAPI_DwmWindowAttr DWMWA_ALLOW_NCPAINT = 4;
  static const WINAPI_DwmWindowAttr DWMWA_CAPTION_BUTTON_BOUNDS = 5;
  static const WINAPI_DwmWindowAttr DWMWA_NONCLIENT_RTL_LAYOUT = 6;
  static const WINAPI_DwmWindowAttr DWMWA_FORCE_ICONIC_REPRESENTATION = 7;
  static const WINAPI_DwmWindowAttr DWMWA_FLIP3D_POLICY = 8;
  static const WINAPI_DwmWindowAttr DWMWA_EXTENDED_FRAME_BOUNDS = 9;
  static const WINAPI_DwmWindowAttr DWMWA_HAS_ICONIC_BITMAP = 10;
  static const WINAPI_DwmWindowAttr DWMWA_DISALLOW_PEEK = 11;
  static const WINAPI_DwmWindowAttr DWMWA_EXCLUDED_FROM_PEEK = 12;
  typedef DWORD WINAPI_FILE_NOTIFY_CHANGE_FLAGS; //Alias
  typedef int WINAPI_SEEK_TYPE; //Alias
  static const WINAPI_SEEK_TYPE SEEK_CUR = 1;
  static const WINAPI_SEEK_TYPE SEEK_END = 2;
  static const WINAPI_SEEK_TYPE SEEK_SET = 0;
  typedef DWORD WINAPI_LocaleMappingFlags; //Alias
  typedef DWORD WINAPI_ACTCTX_FLAG; //Alias
  typedef struct ACTCTX {
    ULONG cbSize;
    WINAPI_ACTCTX_FLAG dwFlags;
    LPCTSTR lpSource;
    WINAPI_PROCESSOR_ARCHITECTURE wProcessorArchitecture;
    LANGID wLangId;
    LPCTSTR lpAssemblyDirectory;
    LPCTSTR lpResourceName;
    LPCTSTR lpApplicationName;
    HMODULE hModule;
  } ACTCTX;
  typedef ACTCTX *PACTCTX; //Pointer
  typedef DWORD WINAPI_HEAP_FLAGS; //Alias
  typedef WINAPI_HEAP_FLAGS WINAPI_HEAP_FLAGS_ULONG; //Alias
  typedef ULONG WINAPI_IMAGE_FILE_CHARACTERISTICS_ULONG; //Alias
  typedef DWORD WINAPI_FIND_ACTCTX_SECTION_FLAGS; //Alias
  typedef ULONG WINAPI_ACTIVATION_CONTEXT_SECTION; //Alias
  static const WINAPI_ACTIVATION_CONTEXT_SECTION ACTIVATION_CONTEXT_SECTION_ASSEMBLY_INFORMATION = 1;
  static const WINAPI_ACTIVATION_CONTEXT_SECTION ACTIVATION_CONTEXT_SECTION_DLL_REDIRECTION = 2;
  static const WINAPI_ACTIVATION_CONTEXT_SECTION ACTIVATION_CONTEXT_SECTION_WINDOW_CLASS_REDIRECTION = 3;
  static const WINAPI_ACTIVATION_CONTEXT_SECTION ACTIVATION_CONTEXT_SECTION_COM_SERVER_REDIRECTION = 4;
  static const WINAPI_ACTIVATION_CONTEXT_SECTION ACTIVATION_CONTEXT_SECTION_COM_INTERFACE_REDIRECTION = 5;
  static const WINAPI_ACTIVATION_CONTEXT_SECTION ACTIVATION_CONTEXT_SECTION_COM_TYPE_LIBRARY_REDIRECTION = 6;
  static const WINAPI_ACTIVATION_CONTEXT_SECTION ACTIVATION_CONTEXT_SECTION_COM_PROGID_REDIRECTION = 7;
  static const WINAPI_ACTIVATION_CONTEXT_SECTION ACTIVATION_CONTEXT_SECTION_GLOBAL_OBJECT_RENAME_TABLE = 8;
  static const WINAPI_ACTIVATION_CONTEXT_SECTION ACTIVATION_CONTEXT_SECTION_CLR_SURROGATES = 9;
  static const WINAPI_ACTIVATION_CONTEXT_SECTION ACTIVATION_CONTEXT_SECTION_APPLICATION_SETTINGS = 10;
  typedef DWORD WINAPI_WAIT_RESULT; //Alias
  static const WINAPI_WAIT_RESULT WAIT_OBJECT_0 = 0x00000000;
  static const WINAPI_WAIT_RESULT WAIT_OBJECT_1 = 0x00000001;
  static const WINAPI_WAIT_RESULT WAIT_OBJECT_2 = 0x00000002;
  static const WINAPI_WAIT_RESULT WAIT_OBJECT_3 = 0x00000003;
  static const WINAPI_WAIT_RESULT WAIT_OBJECT_4 = 0x00000004;
  static const WINAPI_WAIT_RESULT WAIT_OBJECT_5 = 0x00000005;
  static const WINAPI_WAIT_RESULT WAIT_ABANDONED_0 = 0x00000080;
  static const WINAPI_WAIT_RESULT WAIT_ABANDONED_1 = 0x00000081;
  static const WINAPI_WAIT_RESULT WAIT_ABANDONED_2 = 0x00000082;
  static const WINAPI_WAIT_RESULT WAIT_ABANDONED_3 = 0x00000083;
  static const WINAPI_WAIT_RESULT WAIT_ABANDONED_4 = 0x00000084;
  static const WINAPI_WAIT_RESULT WAIT_ABANDONED_5 = 0x00000085;
  static const WINAPI_WAIT_RESULT WAIT_IO_COMPLETION = 0x000000C0;
//static const WINAPI_WAIT_RESULT WAIT_TIMEOUT = 258;
  static const WINAPI_WAIT_RESULT WAIT_FAILED = 0xFFFFFFFF;
  typedef struct PROCESSOR_NUMBER {
    WORD Group;
    BYTE Number;
    BYTE Reserved;
  } PROCESSOR_NUMBER;
  typedef PROCESSOR_NUMBER *PPROCESSOR_NUMBER; //Pointer
]]

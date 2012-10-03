require( 'ffi/winapi/headers/common' )
require( 'ffi/winapi/headers/ntstatus' )
require( 'ffi/winapi/internal/internal' )
local ffi = require( 'ffi' )
ffi.cdef [[
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
]]
if ffi.arch == 'x64' then ffi.cdef[[
  typedef IMAGE_OPTIONAL_HEADER64 IMAGE_OPTIONAL_HEADER; //Alias
]]
end
ffi.cdef[[
  typedef HMODULE HINSTANCE; //Alias
  typedef UINT_PTR WPARAM; //Alias
  typedef LONG_PTR LPARAM; //Alias
  typedef LONG_PTR LRESULT; //Alias
  typedef WORD LANGID; //Alias
  typedef WCHAR* BSTR; //Alias
  typedef BSTR WINAPI_BSTR; //Alias
  typedef PVOID HDEVINFO; //Alias
  typedef LPVOID PIO_APC_ROUTINE; //Alias
  typedef LPVOID FARPROC; //Alias
  typedef PVOID PSID; //Alias
  typedef LPVOID PVECTORED_EXCEPTION_HANDLER; //Alias
  typedef WORD ATOM; //Alias
  typedef LPVOID PSLIST_ENTRY; //Alias
  typedef ULONG_PTR KAFFINITY; //Alias
  typedef VOID STDAPI_(VOID); //Alias
  enum { OFS_MAXPATHNAME = 128 };
  enum { CCHDEVICENAME = 32 };
  enum { CCHFORMNAME = 32 };
  enum { RAS_MaxEntryName = 257 };
  enum { EXCEPTION_MAXIMUM_PARAMETERS = 15 };
  typedef ULONG_PTR SCARDCONTEXT; //Alias
  typedef SCARDCONTEXT *LPSCARDCONTEXT; //Pointer
  typedef ULONG_PTR SCARDHANDLE; //Alias
  typedef SCARDHANDLE *LPSCARDHANDLE; //Pointer
  typedef void* IAddrBook; //Interface
  typedef IAddrBook* LPADRBOOK; //Alias
  typedef DWORD WLAN_REASON_CODE; //Alias
  typedef WLAN_REASON_CODE *PWLAN_REASON_CODE; //Pointer
  typedef void* IUnknown; //Interface
  typedef IUnknown* LPUNKNOWN; //Alias
  typedef DWORD LCID; //Alias
  static const DWORD LOCALE_SYSTEM_DEFAULT = 0x0800;
  static const DWORD LOCALE_USER_DEFAULT = 0x0400;
  static const DWORD LOCALE_CUSTOM_DEFAULT = 0x0c00;
  static const DWORD LOCALE_CUSTOM_UNSPECIFIED = 0x1000;
  static const DWORD LOCALE_CUSTOM_UI_DEFAULT = 0x1400;
  static const DWORD LOCALE_NEUTRAL = 0x0000;
  static const DWORD LOCALE_INVARIANT = 0x007f;
  typedef LCID *PLCID; //Pointer
  typedef struct LIST_ENTRY {
    LPVOID Flink;
    LPVOID Blink;
  } LIST_ENTRY;
  typedef LIST_ENTRY *PLIST_ENTRY; //Pointer
  typedef LPVOID PSLIST_HEADER; //Alias
  typedef LPVOID PCONTEXT; //Alias
  typedef struct POINT {
    LONG x;
    LONG y;
  } POINT;
  typedef POINT WINAPI_POINT; //Alias
  typedef POINT* LPPOINT; //Alias
  typedef POINT POINTL; //Alias
  typedef short WINAPI_DMORIENT; //Alias
  static const short DMORIENT_PORTRAIT = 1;
  static const short DMORIENT_LANDSCAPE = 2;
  typedef short WINAPI_DMPAPER; //Alias
  static const short DMPAPER_LETTER = 1;
  static const short DMPAPER_LETTERSMALL = 2;
  static const short DMPAPER_TABLOID = 3;
  static const short DMPAPER_LEDGER = 4;
  static const short DMPAPER_LEGAL = 5;
  static const short DMPAPER_STATEMENT = 6;
  static const short DMPAPER_EXECUTIVE = 7;
  static const short DMPAPER_A3 = 8;
  static const short DMPAPER_A4 = 9;
  static const short DMPAPER_A4SMALL = 10;
  static const short DMPAPER_A5 = 11;
  static const short DMPAPER_B4 = 12;
  static const short DMPAPER_B5 = 13;
  static const short DMPAPER_FOLIO = 14;
  static const short DMPAPER_QUARTO = 15;
  static const short DMPAPER_10X14 = 16;
  static const short DMPAPER_11X17 = 17;
  static const short DMPAPER_NOTE = 18;
  static const short DMPAPER_ENV_9 = 19;
  static const short DMPAPER_ENV_10 = 20;
  static const short DMPAPER_ENV_11 = 21;
  static const short DMPAPER_ENV_12 = 22;
  static const short DMPAPER_ENV_14 = 23;
  static const short DMPAPER_CSHEET = 24;
  static const short DMPAPER_DSHEET = 25;
  static const short DMPAPER_ESHEET = 26;
  static const short DMPAPER_ENV_DL = 27;
  static const short DMPAPER_ENV_C5 = 28;
  static const short DMPAPER_ENV_C3 = 29;
  static const short DMPAPER_ENV_C4 = 30;
  static const short DMPAPER_ENV_C6 = 31;
  static const short DMPAPER_ENV_C65 = 32;
  static const short DMPAPER_ENV_B4 = 33;
  static const short DMPAPER_ENV_B5 = 34;
  static const short DMPAPER_ENV_B6 = 35;
  static const short DMPAPER_ENV_ITALY = 36;
  static const short DMPAPER_ENV_MONARCH = 37;
  static const short DMPAPER_ENV_PERSONAL = 38;
  static const short DMPAPER_FANFOLD_US = 39;
  static const short DMPAPER_FANFOLD_STD_GERMAN = 40;
  static const short DMPAPER_FANFOLD_LGL_GERMAN = 41;
  static const short DMPAPER_ISO_B4 = 42;
  static const short DMPAPER_JAPANESE_POSTCARD = 43;
  static const short DMPAPER_9X11 = 44;
  static const short DMPAPER_10X11 = 45;
  static const short DMPAPER_15X11 = 46;
  static const short DMPAPER_ENV_INVITE = 47;
  static const short DMPAPER_RESERVED_48 = 48;
  static const short DMPAPER_RESERVED_49 = 49;
  static const short DMPAPER_LETTER_EXTRA = 50;
  static const short DMPAPER_LEGAL_EXTRA = 51;
  static const short DMPAPER_TABLOID_EXTRA = 52;
  static const short DMPAPER_A4_EXTRA = 53;
  static const short DMPAPER_LETTER_TRANSVERSE = 54;
  static const short DMPAPER_A4_TRANSVERSE = 55;
  static const short DMPAPER_LETTER_EXTRA_TRANSVERSE = 56;
  static const short DMPAPER_A_PLUS = 57;
  static const short DMPAPER_B_PLUS = 58;
  static const short DMPAPER_LETTER_PLUS = 59;
  static const short DMPAPER_A4_PLUS = 60;
  static const short DMPAPER_A5_TRANSVERSE = 61;
  static const short DMPAPER_B5_TRANSVERSE = 62;
  static const short DMPAPER_A3_EXTRA = 63;
  static const short DMPAPER_A5_EXTRA = 64;
  static const short DMPAPER_B5_EXTRA = 65;
  static const short DMPAPER_A2 = 66;
  static const short DMPAPER_A3_TRANSVERSE = 67;
  static const short DMPAPER_A3_EXTRA_TRANSVERSE = 68;
  static const short DMPAPER_DBL_JAPANESE_POSTCARD = 69;
  static const short DMPAPER_A6 = 70;
  static const short DMPAPER_JENV_KAKU2 = 71;
  static const short DMPAPER_JENV_KAKU3 = 72;
  static const short DMPAPER_JENV_CHOU3 = 73;
  static const short DMPAPER_JENV_CHOU4 = 74;
  static const short DMPAPER_LETTER_ROTATED = 75;
  static const short DMPAPER_A3_ROTATED = 76;
  static const short DMPAPER_A4_ROTATED = 77;
  static const short DMPAPER_A5_ROTATED = 78;
  static const short DMPAPER_B4_JIS_ROTATED = 79;
  static const short DMPAPER_B5_JIS_ROTATED = 80;
  static const short DMPAPER_JAPANESE_POSTCARD_ROTATED = 81;
  static const short DMPAPER_DBL_JAPANESE_POSTCARD_ROTATED = 82;
  static const short DMPAPER_A6_ROTATED = 83;
  static const short DMPAPER_JENV_KAKU2_ROTATED = 84;
  static const short DMPAPER_JENV_KAKU3_ROTATED = 85;
  static const short DMPAPER_JENV_CHOU3_ROTATED = 86;
  static const short DMPAPER_JENV_CHOU4_ROTATED = 87;
  static const short DMPAPER_B6_JIS = 88;
  static const short DMPAPER_B6_JIS_ROTATED = 89;
  static const short DMPAPER_12X11 = 90;
  static const short DMPAPER_JENV_YOU4 = 91;
  static const short DMPAPER_JENV_YOU4_ROTATED = 92;
  static const short DMPAPER_P16K = 93;
  static const short DMPAPER_P32K = 94;
  static const short DMPAPER_P32KBIG = 95;
  static const short DMPAPER_PENV_1 = 96;
  static const short DMPAPER_PENV_2 = 97;
  static const short DMPAPER_PENV_3 = 98;
  static const short DMPAPER_PENV_4 = 99;
  static const short DMPAPER_PENV_5 = 100;
  static const short DMPAPER_PENV_6 = 101;
  static const short DMPAPER_PENV_7 = 102;
  static const short DMPAPER_PENV_8 = 103;
  static const short DMPAPER_PENV_9 = 104;
  static const short DMPAPER_PENV_10 = 105;
  static const short DMPAPER_P16K_ROTATED = 106;
  static const short DMPAPER_P32K_ROTATED = 107;
  static const short DMPAPER_P32KBIG_ROTATED = 108;
  static const short DMPAPER_PENV_1_ROTATED = 109;
  static const short DMPAPER_PENV_2_ROTATED = 110;
  static const short DMPAPER_PENV_3_ROTATED = 111;
  static const short DMPAPER_PENV_4_ROTATED = 112;
  static const short DMPAPER_PENV_5_ROTATED = 113;
  static const short DMPAPER_PENV_6_ROTATED = 114;
  static const short DMPAPER_PENV_7_ROTATED = 115;
  static const short DMPAPER_PENV_8_ROTATED = 116;
  static const short DMPAPER_PENV_9_ROTATED = 117;
  static const short DMPAPER_PENV_10_ROTATED = 118;
  typedef short WINAPI_DMBIN; //Alias
  static const short DMBIN_UPPER = 1;
  static const short DMBIN_LOWER = 2;
  static const short DMBIN_MIDDLE = 3;
  static const short DMBIN_MANUAL = 4;
  static const short DMBIN_ENVELOPE = 5;
  static const short DMBIN_ENVMANUAL = 6;
  static const short DMBIN_AUTO = 7;
  static const short DMBIN_TRACTOR = 8;
  static const short DMBIN_SMALLFMT = 9;
  static const short DMBIN_LARGEFMT = 10;
  static const short DMBIN_LARGECAPACITY = 11;
  static const short DMBIN_CASSETTE = 14;
  static const short DMBIN_FORMSOURCE = 15;
  typedef short WINAPI_DMRES; //Alias
  static const short DMRES_DRAFT = -1;
  static const short DMRES_LOW = -2;
  static const short DMRES_MEDIUM = -3;
  static const short DMRES_HIGH = -4;
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
  static const DWORD DMDO_DEFAULT = 0;
  static const DWORD DMDO_90 = 1;
  static const DWORD DMDO_180 = 2;
  static const DWORD DMDO_270 = 3;
  typedef DWORD WINAPI_DMDFO; //Alias
  static const DWORD DMDFO_DEFAULT = 0;
  static const DWORD DMDFO_STRETCH = 1;
  static const DWORD DMDFO_CENTER = 2;
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
  static const DWORD DMNUP_SYSTEM = 1;
  static const DWORD DMNUP_ONEUP = 2;
  typedef union WINAPI_DEVMODE_u2 {
    WINAPI_DMDISPLAYFLAGS dmDisplayFlags;
    WINAPI_DMNUP dmNup;
  } WINAPI_DEVMODE_u2;
  typedef DWORD WINAPI_DM_Fields; //Alias
  typedef short WINAPI_DMCOLOR; //Alias
  static const short DMCOLOR_MONOCHROME = 1;
  static const short DMCOLOR_COLOR = 2;
  typedef short WINAPI_DMDUP; //Alias
  static const short DMDUP_SIMPLEX = 1;
  static const short DMDUP_VERTICAL = 2;
  static const short DMDUP_HORIZONTAL = 3;
  typedef short WINAPI_DMTT; //Alias
  static const short DMTT_BITMAP = 1;
  static const short DMTT_DOWNLOAD = 2;
  static const short DMTT_SUBDEV = 3;
  static const short DMTT_DOWNLOAD_OUTLINE = 4;
  typedef short WINAPI_DMCOLLATE; //Alias
  static const short DMCOLLATE_FALSE = 0;
  static const short DMCOLLATE_TRUE = 1;
  typedef DWORD WINAPI_DMICMMETHOD; //Alias
  static const DWORD DMICMMETHOD_NONE = 1;
  static const DWORD DMICMMETHOD_SYSTEM = 2;
  static const DWORD DMICMMETHOD_DRIVER = 3;
  static const DWORD DMICMMETHOD_DEVICE = 4;
  typedef DWORD WINAPI_DMICM; //Alias
  static const DWORD DMICM_SATURATE = 1;
  static const DWORD DMICM_CONTRAST = 2;
  static const DWORD DMICM_COLORIMETRIC = 3;
  static const DWORD DMICM_ABS_COLORIMETRIC = 4;
  typedef DWORD WINAPI_DMMEDIA; //Alias
  static const DWORD DMMEDIA_STANDARD = 1;
  static const DWORD DMMEDIA_TRANSPARENCY = 2;
  static const DWORD DMMEDIA_GLOSSY = 3;
  typedef DWORD WINAPI_DMDITHER; //Alias
  static const DWORD DMDITHER_NONE = 1;
  static const DWORD DMDITHER_COARSE = 2;
  static const DWORD DMDITHER_FINE = 3;
  static const DWORD DMDITHER_LINEART = 4;
  static const DWORD DMDITHER_ERRORDIFFUSION = 5;
  static const DWORD DMDITHER_RESERVED6 = 6;
  static const DWORD DMDITHER_RESERVED7 = 7;
  static const DWORD DMDITHER_RESERVED8 = 8;
  static const DWORD DMDITHER_RESERVED9 = 9;
  static const DWORD DMDITHER_GRAYSCALE = 10;
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
  static const UINT_PTR NULL = 0;
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
  static const HANDLE GetCurrentProcess() = -1;
  typedef HANDLE WINAPI_ThreadHandle; //Alias
  static const HANDLE GetCurrentThread() = -2;
  typedef int32_t HRESULT; //Integer
  static const int32_t S_OK = 0;
  static const int32_t S_FALSE = 1;
  static const int32_t E_ABORT = 0x80004004;
  static const int32_t E_ACCESSDENIED = 0x80070005;
  static const int32_t E_FAIL = 0x80004005;
  static const int32_t E_HANDLE = 0x80070006;
  static const int32_t E_INVALIDARG = 0x80070057;
  static const int32_t E_NOINTERFACE = 0x80004002;
  static const int32_t E_NOTIMPL = 0x80004001;
  static const int32_t E_OUTOFMEMORY = 0x8007000E;
  static const int32_t E_POINTER = 0x80004003;
  static const int32_t E_UNEXPECTED = 0x8000FFFF;
  static const int32_t CO_E_NOTINITIALIZED = 0x800401F0;
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
  typedef struct GUID { DWORD Data1; WORD Data2, Data3; BYTE Data4[8]; } GUID;
  typedef GUID* PGUID; //Alias
  typedef GUID* LPCGUID; //Alias
  typedef GUID *LPGUID; //Pointer
  typedef LPGUID WINAPI_LPGUID; //Alias
  typedef GUID* REFGUID; //Alias
  typedef GUID CLSID; //Alias
  typedef CLSID* LPCLSID; //Alias
  typedef CLSID *REFCLSID; //Pointer
  typedef GUID UUID; //Alias
  typedef GUID IID; //Alias
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
  typedef SYSTEMTIME WINAPI_SYSTEMTIME; //Alias
  typedef SYSTEMTIME* PSYSTEMTIME; //Alias
  typedef PSYSTEMTIME LPSYSTEMTIME; //Alias
  typedef UINT JOBOBJECTINFOCLASS; //Alias
  static const UINT JobObjectBasicAccountingInformation = 1;
  static const UINT JobObjectBasicLimitInformation = 2;
  static const UINT JobObjectBasicProcessIdList = 3;
  static const UINT JobObjectBasicUIRestrictions = 4;
  static const UINT JobObjectSecurityLimitInformation = 5;
  static const UINT JobObjectEndOfJobTimeInformation = 6;
  static const UINT JobObjectAssociateCompletionPortInformation = 7;
  static const UINT JobObjectBasicAndIoAccountingInformation = 8;
  static const UINT JobObjectExtendedLimitInformation = 9;
  static const UINT JobObjectJobSetInformation = 10;
  static const UINT JobObjectGroupInformation = 11;
  static const UINT JobObjectNotificationLimitInformation = 12;
  static const UINT JobObjectLimitViolationInformation = 13;
  static const UINT JobObjectGroupInformationEx = 14;
  static const UINT JobObjectCpuRateControlInformation = 15;
  static const UINT JobObjectCompletionFilter = 16;
  static const UINT JobObjectCompletionCounter = 17;
  static const UINT JobObjectFreezeInformation = 18;
  static const UINT JobObjectExtendedAccountingInformation = 19;
  static const UINT JobObjectWakeInformation = 20;
  static const UINT JobObjectIdleAwareInformation = 21;
  static const UINT JobObjectSchedulingRankBiasInformation = 22;
  static const UINT JobObjectTimerVirtualizationInformation = 23;
  static const UINT JobObjectCycleTimeNotification = 24;
  static const UINT JobObjectReserved1Information = 18;
  static const UINT JobObjectReserved2Information = 19;
  static const UINT JobObjectReserved3Information = 20;
  static const UINT JobObjectReserved4Information = 21;
  static const UINT JobObjectReserved5Information = 22;
  static const UINT JobObjectReserved6Information = 23;
  static const UINT JobObjectReserved7Information = 24;
  typedef UINT PROCESSINFOCLASS; //Alias
  static const UINT ProcessBasicInformation = 0;
  static const UINT ProcessQuotaLimits = 1;
  static const UINT ProcessIoCounters = 2;
  static const UINT ProcessVmCounters = 3;
  static const UINT ProcessTimes = 4;
  static const UINT ProcessBasePriority = 5;
  static const UINT ProcessRaisePriority = 6;
  static const UINT ProcessDebugPort = 7;
  static const UINT ProcessExceptionPort = 8;
  static const UINT ProcessAccessToken = 9;
  static const UINT ProcessLdtInformation = 10;
  static const UINT ProcessLdtSize = 11;
  static const UINT ProcessDefaultHardErrorMode = 12;
  static const UINT ProcessIoPortHandlers = 13;
  static const UINT ProcessPooledUsageAndLimits = 14;
  static const UINT ProcessWorkingSetWatch = 15;
  static const UINT ProcessUserModeIOPL = 16;
  static const UINT ProcessEnableAlignmentFaultFixup = 17;
  static const UINT ProcessPriorityClass = 18;
  static const UINT ProcessWx86Information = 19;
  static const UINT ProcessHandleCount = 20;
  static const UINT ProcessAffinityMask = 21;
  static const UINT ProcessPriorityBoost = 22;
  static const UINT ProcessDeviceMap = 23;
  static const UINT ProcessSessionInformation = 24;
  static const UINT ProcessForegroundInformation = 25;
  static const UINT ProcessWow64Information = 26;
  static const UINT ProcessImageFileName = 27;
  static const UINT ProcessLUIDDeviceMapsEnabled = 28;
  static const UINT ProcessBreakOnTermination = 29;
  static const UINT ProcessDebugObjectHandle = 30;
  static const UINT ProcessDebugFlags = 31;
  static const UINT ProcessHandleTracing = 32;
  static const UINT ProcessIoPriority = 33;
  static const UINT ProcessExecuteFlags = 34;
  static const UINT ProcessTlsInformation = 35;
  static const UINT ProcessCookie = 36;
  static const UINT ProcessImageInformation = 37;
  static const UINT ProcessCycleTime = 38;
  static const UINT ProcessPagePriority = 39;
  static const UINT ProcessInstrumentationCallback = 40;
  static const UINT ProcessThreadStackAllocation = 41;
  static const UINT ProcessWorkingSetWatchEx = 42;
  static const UINT ProcessImageFileNameWin32 = 43;
  static const UINT ProcessImageFileMapping = 44;
  static const UINT ProcessAffinityUpdateMode = 45;
  static const UINT ProcessMemoryAllocationMode = 46;
  static const UINT ProcessGroupInformation = 47;
  static const UINT ProcessTokenVirtualizationEnabled = 48;
  static const UINT ProcessConsoleHostProcess = 49;
  static const UINT ProcessWindowInformation = 50;
  static const UINT ProcessHandleInformation = 51;
  static const UINT ProcessMitigationPolicy = 52;
  static const UINT ProcessDynamicFunctionTableInformation = 53;
  static const UINT ProcessHandleCheckingMode = 54;
  static const UINT ProcessKeepAliveCount = 55;
  static const UINT ProcessRevokeFileHandles = 56;
  typedef UINT THREADINFOCLASS; //Alias
  static const UINT ThreadBasicInformation = 0;
  static const UINT ThreadTimes = 1;
  static const UINT ThreadPriority = 2;
  static const UINT ThreadBasePriority = 3;
  static const UINT ThreadAffinityMask = 4;
  static const UINT ThreadImpersonationToken = 5;
  static const UINT ThreadDescriptorTableEntry = 6;
  static const UINT ThreadEnableAlignmentFaultFixup = 7;
  static const UINT ThreadEventPair_Reusable = 8;
  static const UINT ThreadQuerySetWin32StartAddress = 9;
  static const UINT ThreadZeroTlsCell = 10;
  static const UINT ThreadPerformanceCount = 11;
  static const UINT ThreadAmILastThread = 12;
  static const UINT ThreadIdealProcessor = 13;
  static const UINT ThreadPriorityBoost = 14;
  static const UINT ThreadSetTlsArrayAddress = 15;
  static const UINT ThreadIsIoPending = 16;
  static const UINT ThreadHideFromDebugger = 17;
  static const UINT ThreadBreakOnTermination = 18;
  static const UINT ThreadSwitchLegacyState = 19;
  static const UINT ThreadIsTerminated = 20;
  static const UINT ThreadLastSystemCall = 21;
  static const UINT ThreadIoPriority = 22;
  static const UINT ThreadCycleTime = 23;
  static const UINT ThreadPagePriority = 24;
  static const UINT ThreadActualBasePriority = 25;
  static const UINT ThreadTebInformation = 26;
  static const UINT ThreadCSwitchMon = 27;
  static const UINT ThreadCSwitchPmu = 28;
  static const UINT ThreadWow64Context = 29;
  static const UINT ThreadGroupInformation = 30;
  static const UINT ThreadUmsInformation = 31;
  static const UINT ThreadCounterProfiling = 32;
  static const UINT ThreadIdealProcessorEx = 33;
  static const UINT ThreadCpuAccountingInformation = 34;
  static const UINT ThreadSwitchStackCheck = 35;
  typedef UINT GET_FILEEX_INFO_LEVELS; //Alias
  static const UINT GetFileExInfoStandard = 0;
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
  static const UINT WM_CREATE = 0x0001;
  static const UINT WM_DESTROY = 0x0002;
  static const UINT WM_MOVE = 0x0003;
  static const UINT WM_SIZE = 0x0005;
  static const UINT WM_ACTIVATE = 0x0006;
  static const UINT WM_SETFOCUS = 0x0007;
  static const UINT WM_KILLFOCUS = 0x0008;
  static const UINT WM_ENABLE = 0x000A;
  static const UINT WM_SETREDRAW = 0x000B;
  static const UINT WM_SETTEXT = 0x000C;
  static const UINT WM_GETTEXT = 0x000D;
  static const UINT WM_GETTEXTLENGTH = 0x000E;
  static const UINT WM_PAINT = 0x000F;
  static const UINT WM_CLOSE = 0x0010;
  static const UINT WM_QUERYENDSESSION = 0x0011;
  static const UINT WM_QUERYOPEN = 0x0013;
  static const UINT WM_ENDSESSION = 0x0016;
  static const UINT WM_QUIT = 0x0012;
  static const UINT WM_ERASEBKGND = 0x0014;
  static const UINT WM_SYSCOLORCHANGE = 0x0015;
  static const UINT WM_SHOWWINDOW = 0x0018;
  static const UINT WM_SETTINGCHANGE = 0x001A;
  static const UINT WM_DEVMODECHANGE = 0x001B;
  static const UINT WM_ACTIVATEAPP = 0x001C;
  static const UINT WM_FONTCHANGE = 0x001D;
  static const UINT WM_TIMECHANGE = 0x001E;
  static const UINT WM_CANCELMODE = 0x001F;
  static const UINT WM_SETCURSOR = 0x0020;
  static const UINT WM_MOUSEACTIVATE = 0x0021;
  static const UINT WM_CHILDACTIVATE = 0x0022;
  static const UINT WM_QUEUESYNC = 0x0023;
  static const UINT WM_GETMINMAXINFO = 0x0024;
  static const UINT WM_PAINTICON = 0x0026;
  static const UINT WM_ICONERASEBKGND = 0x0027;
  static const UINT WM_NEXTDLGCTL = 0x0028;
  static const UINT WM_SPOOLERSTATUS = 0x002A;
  static const UINT WM_DRAWITEM = 0x002B;
  static const UINT WM_MEASUREITEM = 0x002C;
  static const UINT WM_DELETEITEM = 0x002D;
  static const UINT WM_VKEYTOITEM = 0x002E;
  static const UINT WM_CHARTOITEM = 0x002F;
  static const UINT WM_SETFONT = 0x0030;
  static const UINT WM_GETFONT = 0x0031;
  static const UINT WM_SETHOTKEY = 0x0032;
  static const UINT WM_GETHOTKEY = 0x0033;
  static const UINT WM_QUERYDRAGICON = 0x0037;
  static const UINT WM_COMPAREITEM = 0x0039;
  static const UINT WM_GETOBJECT = 0x003D;
  static const UINT WM_COMPACTING = 0x0041;
  static const UINT WM_COMMNOTIFY = 0x0044;
  static const UINT WM_WINDOWPOSCHANGING = 0x0046;
  static const UINT WM_WINDOWPOSCHANGED = 0x0047;
  static const UINT WM_POWER = 0x0048;
  static const UINT WM_COPYDATA = 0x004A;
  static const UINT WM_CANCELJOURNAL = 0x004B;
  static const UINT WM_NOTIFY = 0x004E;
  static const UINT WM_INPUTLANGCHANGEREQUEST = 0x0050;
  static const UINT WM_INPUTLANGCHANGE = 0x0051;
  static const UINT WM_TCARD = 0x0052;
  static const UINT WM_HELP = 0x0053;
  static const UINT WM_USERCHANGED = 0x0054;
  static const UINT WM_NOTIFYFORMAT = 0x0055;
  static const UINT WM_CONTEXTMENU = 0x007B;
  static const UINT WM_STYLECHANGING = 0x007C;
  static const UINT WM_STYLECHANGED = 0x007D;
  static const UINT WM_DISPLAYCHANGE = 0x007E;
  static const UINT WM_GETICON = 0x007F;
  static const UINT WM_SETICON = 0x0080;
  static const UINT WM_NCCREATE = 0x0081;
  static const UINT WM_NCDESTROY = 0x0082;
  static const UINT WM_NCCALCSIZE = 0x0083;
  static const UINT WM_NCHITTEST = 0x0084;
  static const UINT WM_NCPAINT = 0x0085;
  static const UINT WM_NCACTIVATE = 0x0086;
  static const UINT WM_GETDLGCODE = 0x0087;
  static const UINT WM_SYNCPAINT = 0x0088;
  static const UINT WM_NCMOUSEMOVE = 0x00A0;
  static const UINT WM_NCLBUTTONDOWN = 0x00A1;
  static const UINT WM_NCLBUTTONUP = 0x00A2;
  static const UINT WM_NCLBUTTONDBLCLK = 0x00A3;
  static const UINT WM_NCRBUTTONDOWN = 0x00A4;
  static const UINT WM_NCRBUTTONUP = 0x00A5;
  static const UINT WM_NCRBUTTONDBLCLK = 0x00A6;
  static const UINT WM_NCMBUTTONDOWN = 0x00A7;
  static const UINT WM_NCMBUTTONUP = 0x00A8;
  static const UINT WM_NCMBUTTONDBLCLK = 0x00A9;
  static const UINT WM_NCXBUTTONDOWN = 0x00AB;
  static const UINT WM_NCXBUTTONUP = 0x00AC;
  static const UINT WM_NCXBUTTONDBLCLK = 0x00AD;
  static const UINT WM_INPUT_DEVICE_CHANGE = 0x00FE;
  static const UINT WM_INPUT = 0x00FF;
  static const UINT WM_KEYDOWN = 0x0100;
  static const UINT WM_KEYUP = 0x0101;
  static const UINT WM_CHAR = 0x0102;
  static const UINT WM_DEADCHAR = 0x0103;
  static const UINT WM_SYSKEYDOWN = 0x0104;
  static const UINT WM_SYSKEYUP = 0x0105;
  static const UINT WM_SYSCHAR = 0x0106;
  static const UINT WM_SYSDEADCHAR = 0x0107;
  static const UINT WM_UNICHAR = 0x0109;
  static const UINT WM_IME_STARTCOMPOSITION = 0x010D;
  static const UINT WM_IME_ENDCOMPOSITION = 0x010E;
  static const UINT WM_IME_COMPOSITION = 0x010F;
  static const UINT WM_IME_KEYLAST = 0x010F;
  static const UINT WM_INITDIALOG = 0x0110;
  static const UINT WM_COMMAND = 0x0111;
  static const UINT WM_SYSCOMMAND = 0x0112;
  static const UINT WM_TIMER = 0x0113;
  static const UINT WM_HSCROLL = 0x0114;
  static const UINT WM_VSCROLL = 0x0115;
  static const UINT WM_INITMENU = 0x0116;
  static const UINT WM_INITMENUPOPUP = 0x0117;
  static const UINT WM_MENUSELECT = 0x011F;
  static const UINT WM_MENUCHAR = 0x0120;
  static const UINT WM_ENTERIDLE = 0x0121;
  static const UINT WM_MENURBUTTONUP = 0x0122;
  static const UINT WM_MENUDRAG = 0x0123;
  static const UINT WM_MENUGETOBJECT = 0x0124;
  static const UINT WM_UNINITMENUPOPUP = 0x0125;
  static const UINT WM_MENUCOMMAND = 0x0126;
  static const UINT WM_CHANGEUISTATE = 0x0127;
  static const UINT WM_UPDATEUISTATE = 0x0128;
  static const UINT WM_QUERYUISTATE = 0x0129;
  static const UINT WM_CTLCOLORMSGBOX = 0x0132;
  static const UINT WM_CTLCOLOREDIT = 0x0133;
  static const UINT WM_CTLCOLORLISTBOX = 0x0134;
  static const UINT WM_CTLCOLORBTN = 0x0135;
  static const UINT WM_CTLCOLORDLG = 0x0136;
  static const UINT WM_CTLCOLORSCROLLBAR = 0x0137;
  static const UINT WM_CTLCOLORSTATIC = 0x0138;
  static const UINT MN_GETHMENU = 0x01E1;
  static const UINT WM_MOUSEMOVE = 0x0200;
  static const UINT WM_LBUTTONDOWN = 0x0201;
  static const UINT WM_LBUTTONUP = 0x0202;
  static const UINT WM_LBUTTONDBLCLK = 0x0203;
  static const UINT WM_RBUTTONDOWN = 0x0204;
  static const UINT WM_RBUTTONUP = 0x0205;
  static const UINT WM_RBUTTONDBLCLK = 0x0206;
  static const UINT WM_MBUTTONDOWN = 0x0207;
  static const UINT WM_MBUTTONUP = 0x0208;
  static const UINT WM_MBUTTONDBLCLK = 0x0209;
  static const UINT WM_MOUSEWHEEL = 0x020A;
  static const UINT WM_XBUTTONDOWN = 0x020B;
  static const UINT WM_XBUTTONUP = 0x020C;
  static const UINT WM_XBUTTONDBLCLK = 0x020D;
  static const UINT WM_MOUSEHWHEEL = 0x020E;
  static const UINT WM_PARENTNOTIFY = 0x0210;
  static const UINT WM_ENTERMENULOOP = 0x0211;
  static const UINT WM_EXITMENULOOP = 0x0212;
  static const UINT WM_NEXTMENU = 0x0213;
  static const UINT WM_SIZING = 0x0214;
  static const UINT WM_CAPTURECHANGED = 0x0215;
  static const UINT WM_MOVING = 0x0216;
  static const UINT WM_POWERBROADCAST = 0x0218;
  static const UINT WM_DEVICECHANGE = 0x0219;
  static const UINT WM_MDICREATE = 0x0220;
  static const UINT WM_MDIDESTROY = 0x0221;
  static const UINT WM_MDIACTIVATE = 0x0222;
  static const UINT WM_MDIRESTORE = 0x0223;
  static const UINT WM_MDINEXT = 0x0224;
  static const UINT WM_MDIMAXIMIZE = 0x0225;
  static const UINT WM_MDITILE = 0x0226;
  static const UINT WM_MDICASCADE = 0x0227;
  static const UINT WM_MDIICONARRANGE = 0x0228;
  static const UINT WM_MDIGETACTIVE = 0x0229;
  static const UINT WM_MDISETMENU = 0x0230;
  static const UINT WM_ENTERSIZEMOVE = 0x0231;
  static const UINT WM_EXITSIZEMOVE = 0x0232;
  static const UINT WM_DROPFILES = 0x0233;
  static const UINT WM_MDIREFRESHMENU = 0x0234;
  static const UINT WM_IME_SETCONTEXT = 0x0281;
  static const UINT WM_IME_NOTIFY = 0x0282;
  static const UINT WM_IME_CONTROL = 0x0283;
  static const UINT WM_IME_COMPOSITIONFULL = 0x0284;
  static const UINT WM_IME_SELECT = 0x0285;
  static const UINT WM_IME_CHAR = 0x0286;
  static const UINT WM_IME_REQUEST = 0x0288;
  static const UINT WM_IME_KEYDOWN = 0x0290;
  static const UINT WM_IME_KEYUP = 0x0291;
  static const UINT WM_MOUSEHOVER = 0x02A1;
  static const UINT WM_MOUSELEAVE = 0x02A3;
  static const UINT WM_NCMOUSEHOVER = 0x02A0;
  static const UINT WM_NCMOUSELEAVE = 0x02A2;
  static const UINT WM_WTSSESSION_CHANGE = 0x02B1;
  static const UINT WM_TABLET_ADDED = 0x02c8;
  static const UINT WM_TABLET_DELETED = 0x02c9;
  static const UINT WM_TABLET_FLICK = 0x02cb;
  static const UINT WM_TABLET_QUERYSYSTEMGESTURESTATUS = 0x02cc;
  static const UINT WM_CUT = 0x0300;
  static const UINT WM_COPY = 0x0301;
  static const UINT WM_PASTE = 0x0302;
  static const UINT WM_CLEAR = 0x0303;
  static const UINT WM_UNDO = 0x0304;
  static const UINT WM_RENDERFORMAT = 0x0305;
  static const UINT WM_RENDERALLFORMATS = 0x0306;
  static const UINT WM_DESTROYCLIPBOARD = 0x0307;
  static const UINT WM_DRAWCLIPBOARD = 0x0308;
  static const UINT WM_PAINTCLIPBOARD = 0x0309;
  static const UINT WM_VSCROLLCLIPBOARD = 0x030A;
  static const UINT WM_SIZECLIPBOARD = 0x030B;
  static const UINT WM_ASKCBFORMATNAME = 0x030C;
  static const UINT WM_CHANGECBCHAIN = 0x030D;
  static const UINT WM_HSCROLLCLIPBOARD = 0x030E;
  static const UINT WM_QUERYNEWPALETTE = 0x030F;
  static const UINT WM_PALETTEISCHANGING = 0x0310;
  static const UINT WM_PALETTECHANGED = 0x0311;
  static const UINT WM_HOTKEY = 0x0312;
  static const UINT WM_PRINT = 0x0317;
  static const UINT WM_PRINTCLIENT = 0x0318;
  static const UINT WM_APPCOMMAND = 0x0319;
  static const UINT WM_THEMECHANGED = 0x031A;
  static const UINT WM_CLIPBOARDUPDATE = 0x031D;
  static const UINT WM_DWMCOMPOSITIONCHANGED = 0x031E;
  static const UINT WM_DWMNCRENDERINGCHANGED = 0x031F;
  static const UINT WM_DWMCOLORIZATIONCOLORCHANGED = 0x0320;
  static const UINT WM_DWMWINDOWMAXIMIZEDCHANGE = 0x0321;
  static const UINT WM_GETTITLEBARINFOEX = 0x033F;
  static const UINT WM_USER = 0x0400;
  static const UINT EM_GETSEL = 0x00B0;
  static const UINT EM_SETSEL = 0x00B1;
  static const UINT EM_GETRECT = 0x00B2;
  static const UINT EM_SETRECT = 0x00B3;
  static const UINT EM_SETRECTNP = 0x00B4;
  static const UINT EM_SCROLL = 0x00B5;
  static const UINT EM_LINESCROLL = 0x00B6;
  static const UINT EM_SCROLLCARET = 0x00B7;
  static const UINT EM_GETMODIFY = 0x00B8;
  static const UINT EM_SETMODIFY = 0x00B9;
  static const UINT EM_GETLINECOUNT = 0x00BA;
  static const UINT EM_LINEINDEX = 0x00BB;
  static const UINT EM_SETHANDLE = 0x00BC;
  static const UINT EM_GETHANDLE = 0x00BD;
  static const UINT EM_GETTHUMB = 0x00BE;
  static const UINT EM_LINELENGTH = 0x00C1;
  static const UINT EM_REPLACESEL = 0x00C2;
  static const UINT EM_GETLINE = 0x00C4;
  static const UINT EM_LIMITTEXT = 0x00C5;
  static const UINT EM_CANUNDO = 0x00C6;
  static const UINT EM_UNDO = 0x00C7;
  static const UINT EM_FMTLINES = 0x00C8;
  static const UINT EM_LINEFROMCHAR = 0x00C9;
  static const UINT EM_SETTABSTOPS = 0x00CB;
  static const UINT EM_SETPASSWORDCHAR = 0x00CC;
  static const UINT EM_EMPTYUNDOBUFFER = 0x00CD;
  static const UINT EM_GETFIRSTVISIBLELINE = 0x00CE;
  static const UINT EM_SETREADONLY = 0x00CF;
  static const UINT EM_SETWORDBREAKPROC = 0x00D0;
  static const UINT EM_GETWORDBREAKPROC = 0x00D1;
  static const UINT EM_GETPASSWORDCHAR = 0x00D2;
  static const UINT EM_SETMARGINS = 0x00D3;
  static const UINT EM_GETMARGINS = 0x00D4;
  static const UINT EM_SETLIMITTEXT = 0x00C5;
  static const UINT EM_GETLIMITTEXT = 0x00D5;
  static const UINT EM_POSFROMCHAR = 0x00D6;
  static const UINT EM_CHARFROMPOS = 0x00D7;
  static const UINT EM_SETIMESTATUS = 0x00D8;
  static const UINT EM_GETIMESTATUS = 0x00D9;
  static const UINT BM_GETCHECK = 0x00F0;
  static const UINT BM_SETCHECK = 0x00F1;
  static const UINT BM_GETSTATE = 0x00F2;
  static const UINT BM_SETSTATE = 0x00F3;
  static const UINT BM_SETSTYLE = 0x00F4;
  static const UINT BM_CLICK = 0x00F5;
  static const UINT BM_GETIMAGE = 0x00F6;
  static const UINT BM_SETIMAGE = 0x00F7;
  static const UINT BM_SETDONTCLICK = 0x00F8;
  typedef struct MSG {
    HWND hwnd;
    WINAPI_WinMsg message;
    WPARAM wParam;
    LPARAM lParam;
    DWORD time;
    POINT pt;
  } MSG;
  typedef MSG* LPMSG; //Alias
  typedef UINT WINAPI_ImageType; //Alias
  static const UINT IMAGE_BITMAP = 0;
  static const UINT IMAGE_ICON = 1;
  static const UINT IMAGE_CURSOR = 2;
  static const UINT IMAGE_ENHMETAFILE = 3;
  typedef UINT WINAPI_LRFlags; //Alias
  typedef int WINAPI_SBType; //Alias
  static const int SB_HORZ = 0;
  static const int SB_VERT = 1;
  static const int SB_CTL = 2;
  static const int SB_BOTH = 3;
  typedef UINT WINAPI_IsTextUnicodeFlags; //Alias
  typedef DWORD WINAPI_WaitTimeout; //Alias
  static const DWORD INFINITE = 0xFFFFFFFF;
  typedef UINT WINAPI_BorderFlag; //Alias
  typedef int WINAPI_SysColorIndex; //Alias
  static const int COLOR_SCROLLBAR = 0;
  static const int COLOR_BACKGROUND = 1;
  static const int COLOR_ACTIVECAPTION = 2;
  static const int COLOR_INACTIVECAPTION = 3;
  static const int COLOR_MENU = 4;
  static const int COLOR_WINDOW = 5;
  static const int COLOR_WINDOWFRAME = 6;
  static const int COLOR_MENUTEXT = 7;
  static const int COLOR_WINDOWTEXT = 8;
  static const int COLOR_CAPTIONTEXT = 9;
  static const int COLOR_ACTIVEBORDER = 10;
  static const int COLOR_INACTIVEBORDER = 11;
  static const int COLOR_APPWORKSPACE = 12;
  static const int COLOR_HIGHLIGHT = 13;
  static const int COLOR_HIGHLIGHTTEXT = 14;
  static const int COLOR_BTNFACE = 15;
  static const int COLOR_BTNSHADOW = 16;
  static const int COLOR_GRAYTEXT = 17;
  static const int COLOR_BTNTEXT = 18;
  static const int COLOR_INACTIVECAPTIONTEXT = 19;
  static const int COLOR_BTNHIGHLIGHT = 20;
  static const int COLOR_3DDKSHADOW = 21;
  static const int COLOR_3DLIGHT = 22;
  static const int COLOR_INFOTEXT = 23;
  static const int COLOR_INFOBK = 24;
  static const int COLOR_HOTLIGHT = 26;
  static const int COLOR_GRADIENTACTIVECAPTION = 27;
  static const int COLOR_GRADIENTINACTIVECAPTION = 28;
  static const int COLOR_MENUHILIGHT = 29;
  static const int COLOR_MENUBAR = 30;
  typedef UINT WINAPI_BorderEdge; //Alias
  typedef DWORD WINAPI_DrawTextFlags; //Alias
  typedef struct RECT {
    LONG left;
    LONG top;
    LONG right;
    LONG bottom;
  } RECT;
  typedef RECT *LPRECT; //Pointer
  typedef LPRECT WINAPI_LPRECT; //Alias
  typedef LPRECT LPCRECT; //Alias
  typedef RECT RECTL; //Alias
  typedef RECTL *LPCRECTL; //Pointer
  typedef UINT WINAPI_CodePageEnum; //Alias
  static const UINT CP_ACP = 0;
  static const UINT CP_OEMCP = 1;
  static const UINT CP_MACCP = 2;
  static const UINT CP_THREAD_ACP = 3;
  static const UINT CP_SYMBOL = 42;
  static const UINT WINAPI_MS_DOS_Latin_US = 437;
  static const UINT Thai = 874;
  static const UINT WINAPI_Japanese_(Shift_JIS) = 932;
  static const UINT WINAPI_Chinese_Simplified = 936;
  static const UINT Korean = 949;
  static const UINT WINAPI_Chinese_Traditional = 950;
  static const UINT WINAPI_Unicode UTF_16 LE = 1200;
  static const UINT WINAPI_Unicode UTF_16 BE = 1201;
  static const UINT WINAPI_Central_European = 1250;
  static const UINT Cyrillic = 1251;
  static const UINT WINAPI_Western_European = 1252;
  static const UINT Greek = 1253;
  static const UINT Turkish = 1254;
  static const UINT Hebrew = 1255;
  static const UINT Arabic = 1256;
  static const UINT Baltic = 1257;
  static const UINT Vietnamese = 1258;
  static const UINT CP_UTF7 = 65000;
  static const UINT CP_UTF8 = 65001;
  typedef DWORD WINAPI_EXCEPTION_FLAGS; //Alias
  static const DWORD EXCEPTION_NONCONTINUABLE_EXCEPTION = 0x1;
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
  static const int SW_HIDE = 0;
  static const int SW_SHOWNORMAL = 1;
  static const int SW_NORMAL = 1;
  static const int SW_SHOWMINIMIZED = 2;
  static const int SW_SHOWMAXIMIZED = 3;
  static const int SW_MAXIMIZE = 3;
  static const int SW_SHOWNOACTIVATE = 4;
  static const int SW_SHOW = 5;
  static const int SW_MINIMIZE = 6;
  static const int SW_SHOWMINNOACTIVE = 7;
  static const int SW_SHOWNA = 8;
  static const int SW_RESTORE = 9;
  static const int SW_SHOWDEFAULT = 10;
  static const int SW_FORCEMINIMIZE = 11;
  typedef WORD WINAPI_STARTUPINFO_ShowWindow; //Alias
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
  static const DWORD IO_REPARSE_TAG_MOUNT_POINT = 0xA0000003;
  static const DWORD IO_REPARSE_TAG_HSM = 0xC0000004;
  static const DWORD IO_REPARSE_TAG_HSM2 = 0x80000006;
  static const DWORD IO_REPARSE_TAG_SIS = 0x80000007;
  static const DWORD IO_REPARSE_TAG_WIM = 0x80000008;
  static const DWORD IO_REPARSE_TAG_CSV = 0x80000009;
  static const DWORD IO_REPARSE_TAG_DFS = 0x8000000A;
  static const DWORD IO_REPARSE_TAG_SYMLINK = 0xA000000C;
  static const DWORD IO_REPARSE_TAG_DFSR = 0x80000012;
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
  static const WORD PROCESSOR_ARCHITECTURE_INTEL = 0;
  static const WORD PROCESSOR_ARCHITECTURE_IA64 = 6;
  static const WORD PROCESSOR_ARCHITECTURE_AMD64 = 9;
  static const WORD PROCESSOR_ARCHITECTURE_UNKNOWN = 0xFFFF;
  typedef DWORD MINIDUMP_TYPE; //Alias
  typedef DWORD THREAD_WRITE_FLAGS; //Alias
  typedef DWORD MODULE_WRITE_FLAGS; //Alias
  typedef WORD WINAPI_VirtKeyCode; //Alias
  static const WORD VK_LBUTTON = 0x01;
  static const WORD VK_RBUTTON = 0x02;
  static const WORD VK_CANCEL = 0x03;
  static const WORD VK_MBUTTON = 0x04;
  static const WORD VK_XBUTTON1 = 0x05;
  static const WORD VK_XBUTTON2 = 0x06;
  static const WORD VK_BACK = 0x08;
  static const WORD VK_TAB = 0x09;
  static const WORD VK_CLEAR = 0x0C;
  static const WORD VK_RETURN = 0x0D;
  static const WORD VK_SHIFT = 0x10;
  static const WORD VK_CONTROL = 0x11;
  static const WORD VK_MENU = 0x12;
  static const WORD VK_PAUSE = 0x13;
  static const WORD VK_CAPITAL = 0x14;
  static const WORD VK_KANA = 0x15;
  static const WORD VK_JUNJA = 0x17;
  static const WORD VK_FINAL = 0x18;
  static const WORD VK_KANJI = 0x19;
  static const WORD VK_ESCAPE = 0x1B;
  static const WORD VK_CONVERT = 0x1C;
  static const WORD VK_NONCONVERT = 0x1D;
  static const WORD VK_ACCEPT = 0x1E;
  static const WORD VK_MODECHANGE = 0x1F;
  static const WORD VK_SPACE = 0x20;
  static const WORD VK_PRIOR = 0x21;
  static const WORD VK_NEXT = 0x22;
  static const WORD VK_END = 0x23;
  static const WORD VK_HOME = 0x24;
  static const WORD VK_LEFT = 0x25;
  static const WORD VK_UP = 0x26;
  static const WORD VK_RIGHT = 0x27;
  static const WORD VK_DOWN = 0x28;
  static const WORD VK_SELECT = 0x29;
  static const WORD VK_PRINT = 0x2A;
  static const WORD VK_EXECUTE = 0x2B;
  static const WORD VK_SNAPSHOT = 0x2C;
  static const WORD VK_INSERT = 0x2D;
  static const WORD VK_DELETE = 0x2E;
  static const WORD VK_HELP = 0x2F;
  static const WORD VK_LWIN = 0x5B;
  static const WORD VK_RWIN = 0x5C;
  static const WORD VK_APPS = 0x5D;
  static const WORD VK_SLEEP = 0x5F;
  static const WORD VK_NUMPAD0 = 0x60;
  static const WORD VK_NUMPAD1 = 0x61;
  static const WORD VK_NUMPAD2 = 0x62;
  static const WORD VK_NUMPAD3 = 0x63;
  static const WORD VK_NUMPAD4 = 0x64;
  static const WORD VK_NUMPAD5 = 0x65;
  static const WORD VK_NUMPAD6 = 0x66;
  static const WORD VK_NUMPAD7 = 0x67;
  static const WORD VK_NUMPAD8 = 0x68;
  static const WORD VK_NUMPAD9 = 0x69;
  static const WORD VK_MULTIPLY = 0x6A;
  static const WORD VK_ADD = 0x6B;
  static const WORD VK_SEPARATOR = 0x6C;
  static const WORD VK_SUBTRACT = 0x6D;
  static const WORD VK_DECIMAL = 0x6E;
  static const WORD VK_DIVIDE = 0x6F;
  static const WORD VK_F1 = 0x70;
  static const WORD VK_F2 = 0x71;
  static const WORD VK_F3 = 0x72;
  static const WORD VK_F4 = 0x73;
  static const WORD VK_F5 = 0x74;
  static const WORD VK_F6 = 0x75;
  static const WORD VK_F7 = 0x76;
  static const WORD VK_F8 = 0x77;
  static const WORD VK_F9 = 0x78;
  static const WORD VK_F10 = 0x79;
  static const WORD VK_F11 = 0x7A;
  static const WORD VK_F12 = 0x7B;
  static const WORD VK_F13 = 0x7C;
  static const WORD VK_F14 = 0x7D;
  static const WORD VK_F15 = 0x7E;
  static const WORD VK_F16 = 0x7F;
  static const WORD VK_F17 = 0x80;
  static const WORD VK_F18 = 0x81;
  static const WORD VK_F19 = 0x82;
  static const WORD VK_F20 = 0x83;
  static const WORD VK_F21 = 0x84;
  static const WORD VK_F22 = 0x85;
  static const WORD VK_F23 = 0x86;
  static const WORD VK_F24 = 0x87;
  static const WORD VK_NUMLOCK = 0x90;
  static const WORD VK_SCROLL = 0x91;
  static const WORD VK_OEM_NEC_EQUAL = 0x92;
  static const WORD VK_LSHIFT = 0xA0;
  static const WORD VK_RSHIFT = 0xA1;
  static const WORD VK_LCONTROL = 0xA2;
  static const WORD VK_RCONTROL = 0xA3;
  static const WORD VK_LMENU = 0xA4;
  static const WORD VK_RMENU = 0xA5;
  static const WORD VK_BROWSER_BACK = 0xA6;
  static const WORD VK_BROWSER_FORWARD = 0xA7;
  static const WORD VK_BROWSER_REFRESH = 0xA8;
  static const WORD VK_BROWSER_STOP = 0xA9;
  static const WORD VK_BROWSER_SEARCH = 0xAA;
  static const WORD VK_BROWSER_FAVORITES = 0xAB;
  static const WORD VK_BROWSER_HOME = 0xAC;
  static const WORD VK_VOLUME_MUTE = 0xAD;
  static const WORD VK_VOLUME_DOWN = 0xAE;
  static const WORD VK_VOLUME_UP = 0xAF;
  static const WORD VK_MEDIA_NEXT_TRACK = 0xB0;
  static const WORD VK_MEDIA_PREV_TRACK = 0xB1;
  static const WORD VK_MEDIA_STOP = 0xB2;
  static const WORD VK_MEDIA_PLAY_PAUSE = 0xB3;
  static const WORD VK_LAUNCH_MAIL = 0xB4;
  static const WORD VK_LAUNCH_MEDIA_SELECT = 0xB5;
  static const WORD VK_LAUNCH_APP1 = 0xB6;
  static const WORD VK_LAUNCH_APP2 = 0xB7;
  static const WORD VK_OEM_1 = 0xBA;
  static const WORD VK_OEM_PLUS = 0xBB;
  static const WORD VK_OEM_COMMA = 0xBC;
  static const WORD VK_OEM_MINUS = 0xBD;
  static const WORD VK_OEM_PERIOD = 0xBE;
  static const WORD VK_OEM_2 = 0xBF;
  static const WORD VK_OEM_3 = 0xC0;
  static const WORD VK_OEM_4 = 0xDB;
  static const WORD VK_OEM_5 = 0xDC;
  static const WORD VK_OEM_6 = 0xDD;
  static const WORD VK_OEM_7 = 0xDE;
  static const WORD VK_OEM_8 = 0xDF;
  static const WORD VK_OEM_AX = 0xE1;
  static const WORD VK_OEM_102 = 0xE2;
  static const WORD VK_ICO_HELP = 0xE3;
  static const WORD VK_ICO_00 = 0xE4;
  static const WORD VK_PROCESSKEY = 0xE5;
  static const WORD VK_ICO_CLEAR = 0xE6;
  static const WORD VK_PACKET = 0xE7;
  static const WORD VK_OEM_RESET = 0xE9;
  static const WORD VK_OEM_JUMP = 0xEA;
  static const WORD VK_OEM_PA1 = 0xEB;
  static const WORD VK_OEM_PA2 = 0xEC;
  static const WORD VK_OEM_PA3 = 0xED;
  static const WORD VK_OEM_WSCTRL = 0xEE;
  static const WORD VK_OEM_CUSEL = 0xEF;
  static const WORD VK_OEM_ATTN = 0xF0;
  static const WORD VK_OEM_FINISH = 0xF1;
  static const WORD VK_OEM_COPY = 0xF2;
  static const WORD VK_OEM_AUTO = 0xF3;
  static const WORD VK_OEM_ENLW = 0xF4;
  static const WORD VK_OEM_BACKTAB = 0xF5;
  static const WORD VK_ATTN = 0xF6;
  static const WORD VK_CRSEL = 0xF7;
  static const WORD VK_EXSEL = 0xF8;
  static const WORD VK_EREOF = 0xF9;
  static const WORD VK_PLAY = 0xFA;
  static const WORD VK_ZOOM = 0xFB;
  static const WORD VK_NONAME = 0xFC;
  static const WORD VK_PA1 = 0xFD;
  static const WORD VK_OEM_CLEAR = 0xFE;
  typedef DWORD WINAPI_VER_PLATFORM; //Alias
  static const DWORD VER_PLATFORM_WIN32s = 0;
  static const DWORD VER_PLATFORM_WIN32_WINDOWS = 1;
  static const DWORD VER_PLATFORM_WIN32_NT = 2;
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
  static const BYTE VER_NT_WORKSTATION = 0x0000001;
  static const BYTE VER_NT_DOMAIN_CONTROLLER = 0x0000002;
  static const BYTE VER_NT_SERVER = 0x0000003;
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
  static const ULONG SymTagNull = 0;
  static const ULONG SymTagExe = 1;
  static const ULONG SymTagCompiland = 2;
  static const ULONG SymTagCompilandDetails = 3;
  static const ULONG SymTagCompilandEnv = 4;
  static const ULONG SymTagFunction = 5;
  static const ULONG SymTagBlock = 6;
  static const ULONG SymTagData = 7;
  static const ULONG SymTagAnnotation = 8;
  static const ULONG SymTagLabel = 9;
  static const ULONG SymTagPublicSymbol = 10;
  static const ULONG SymTagUDT = 11;
  static const ULONG SymTagEnum = 12;
  static const ULONG SymTagFunctionType = 13;
  static const ULONG SymTagPointerType = 14;
  static const ULONG SymTagArrayType = 15;
  static const ULONG SymTagBaseType = 16;
  static const ULONG SymTagTypedef = 17;
  static const ULONG SymTagBaseClass = 18;
  static const ULONG SymTagFriend = 19;
  static const ULONG SymTagFunctionArgType = 20;
  static const ULONG SymTagFuncDebugStart = 21;
  static const ULONG SymTagFuncDebugEnd = 22;
  static const ULONG SymTagUsingNamespace = 23;
  static const ULONG SymTagVTableShape = 24;
  static const ULONG SymTagVTable = 25;
  static const ULONG SymTagCustom = 26;
  static const ULONG SymTagThunk = 27;
  static const ULONG SymTagCustomType = 28;
  static const ULONG SymTagManagedType = 29;
  static const ULONG SymTagDimension = 30;
  typedef SymTagEnum WINAPI_SymTagEnum_ULONG; //Alias
  typedef struct IMAGE_DATA_DIRECTORY {
    DWORD VirtualAddress;
    DWORD Size;
  } IMAGE_DATA_DIRECTORY;
  enum { IMAGE_NUMBEROF_DIRECTORY_ENTRIES = 16 };
  typedef WORD WINAPI_IMAGE_OPTIONAL_MAGIC; //Alias
  static const WORD IMAGE_NT_OPTIONAL_HDR32_MAGIC = 0x10b;
  static const WORD IMAGE_NT_OPTIONAL_HDR64_MAGIC = 0x20b;
  static const WORD IMAGE_ROM_OPTIONAL_HDR_MAGIC = 0x107;
  typedef WORD WINAPI_IMAGE_SUBSYSTEM; //Alias
  static const WORD IMAGE_SUBSYSTEM_UNKNOWN = 0;
  static const WORD IMAGE_SUBSYSTEM_NATIVE = 1;
  static const WORD IMAGE_SUBSYSTEM_WINDOWS_GUI = 2;
  static const WORD IMAGE_SUBSYSTEM_WINDOWS_CUI = 3;
  static const WORD IMAGE_SUBSYSTEM_OS2_CUI = 5;
  static const WORD IMAGE_SUBSYSTEM_POSIX_CUI = 7;
  static const WORD IMAGE_SUBSYSTEM_NATIVE_WINDOWS = 8;
  static const WORD IMAGE_SUBSYSTEM_WINDOWS_CE_GUI = 9;
  static const WORD IMAGE_SUBSYSTEM_EFI_APPLICATION = 10;
  static const WORD IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER = 11;
  static const WORD IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER = 12;
  static const WORD IMAGE_SUBSYSTEM_EFI_ROM = 13;
  static const WORD IMAGE_SUBSYSTEM_XBOX = 14;
  static const WORD IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION = 16;
  typedef WORD WINAPI_IMAGE_DLLCHARACTERISTICS; //Alias
  typedef WORD WINAPI_IMAGE_FILE_MACHINE; //Alias
  static const WORD IMAGE_FILE_MACHINE_UNKNOWN = 0;
  static const WORD IMAGE_FILE_MACHINE_I386 = 0x014c;
  static const WORD IMAGE_FILE_MACHINE_IA64 = 0x0200;
  static const WORD IMAGE_FILE_MACHINE_AMD64 = 0x8664;
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
  static const DWORD DWMWA_NCRENDERING_ENABLED = 1;
  static const DWORD DWMWA_NCRENDERING_POLICY = 2;
  static const DWORD DWMWA_TRANSITIONS_FORCEDISABLED = 3;
  static const DWORD DWMWA_ALLOW_NCPAINT = 4;
  static const DWORD DWMWA_CAPTION_BUTTON_BOUNDS = 5;
  static const DWORD DWMWA_NONCLIENT_RTL_LAYOUT = 6;
  static const DWORD DWMWA_FORCE_ICONIC_REPRESENTATION = 7;
  static const DWORD DWMWA_FLIP3D_POLICY = 8;
  static const DWORD DWMWA_EXTENDED_FRAME_BOUNDS = 9;
  static const DWORD DWMWA_HAS_ICONIC_BITMAP = 10;
  static const DWORD DWMWA_DISALLOW_PEEK = 11;
  static const DWORD DWMWA_EXCLUDED_FROM_PEEK = 12;
  typedef DWORD WINAPI_FILE_NOTIFY_CHANGE_FLAGS; //Alias
  typedef int WINAPI_SEEK_TYPE; //Alias
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
  static const ULONG ACTIVATION_CONTEXT_SECTION_ASSEMBLY_INFORMATION = 1;
  static const ULONG ACTIVATION_CONTEXT_SECTION_DLL_REDIRECTION = 2;
  static const ULONG ACTIVATION_CONTEXT_SECTION_WINDOW_CLASS_REDIRECTION = 3;
  static const ULONG ACTIVATION_CONTEXT_SECTION_COM_SERVER_REDIRECTION = 4;
  static const ULONG ACTIVATION_CONTEXT_SECTION_COM_INTERFACE_REDIRECTION = 5;
  static const ULONG ACTIVATION_CONTEXT_SECTION_COM_TYPE_LIBRARY_REDIRECTION = 6;
  static const ULONG ACTIVATION_CONTEXT_SECTION_COM_PROGID_REDIRECTION = 7;
  static const ULONG ACTIVATION_CONTEXT_SECTION_GLOBAL_OBJECT_RENAME_TABLE = 8;
  static const ULONG ACTIVATION_CONTEXT_SECTION_CLR_SURROGATES = 9;
  static const ULONG ACTIVATION_CONTEXT_SECTION_APPLICATION_SETTINGS = 10;
  typedef DWORD WINAPI_WAIT_RESULT; //Alias
  static const DWORD WAIT_OBJECT_0 = 0x00000000;
  static const DWORD WAIT_OBJECT_1 = 0x00000001;
  static const DWORD WAIT_OBJECT_2 = 0x00000002;
  static const DWORD WAIT_OBJECT_3 = 0x00000003;
  static const DWORD WAIT_OBJECT_4 = 0x00000004;
  static const DWORD WAIT_OBJECT_5 = 0x00000005;
  static const DWORD WAIT_ABANDONED_0 = 0x00000080;
  static const DWORD WAIT_ABANDONED_1 = 0x00000081;
  static const DWORD WAIT_ABANDONED_2 = 0x00000082;
  static const DWORD WAIT_ABANDONED_3 = 0x00000083;
  static const DWORD WAIT_ABANDONED_4 = 0x00000084;
  static const DWORD WAIT_ABANDONED_5 = 0x00000085;
  static const DWORD WAIT_IO_COMPLETION = 0x000000C0;
  static const DWORD WAIT_TIMEOUT = 258;
  static const DWORD WAIT_FAILED = 0xFFFFFFFF;
  typedef struct PROCESSOR_NUMBER {
    WORD Group;
    BYTE Number;
    BYTE Reserved;
  } PROCESSOR_NUMBER;
  typedef PROCESSOR_NUMBER *PPROCESSOR_NUMBER; //Pointer
]]

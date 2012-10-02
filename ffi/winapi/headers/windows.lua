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
  typedef BSTR WINAPI_BSTR; //Alias
  typedef PVOID HDEVINFO; //Alias
  typedef LPVOID PIO_APC_ROUTINE; //Alias
  typedef LPVOID FARPROC; //Alias
  typedef LPVOID SID*; //Alias
  typedef PVOID PSID; //Alias
  typedef LPVOID PVECTORED_EXCEPTION_HANDLER; //Alias
  typedef WORD ATOM; //Alias
  typedef LPVOID PSLIST_ENTRY; //Alias
  typedef ULONG_PTR KAFFINITY; //Alias
  typedef VOID STDAPI_(VOID); //Alias
  typedef WCHAR WCHAR [32]; //Array 32
  typedef CHAR CHAR [OFS_MAXPATHNAME]; //Array 128
  typedef TCHAR TCHAR [CCHDEVICENAME]; //Array 32
  typedef TCHAR TCHAR [CCHFORMNAME]; //Array 32
  typedef TCHAR TCHAR [RAS_MaxEntryName + 1]; //Array 257
  typedef ULONG_PTR ULONG_PTR [EXCEPTION_MAXIMUM_PARAMETERS]; //Array 15
  typedef ULONG_PTR SCARDCONTEXT; //Alias
  typedef SCARDCONTEXT *LPSCARDCONTEXT; //Pointer
  typedef ULONG_PTR SCARDHANDLE; //Alias
  typedef SCARDHANDLE *LPSCARDHANDLE; //Pointer
  typedef IAddrBook* LPADRBOOK; //Alias
  typedef LPVOID ALLOCATEBUFFER*; //Alias
  typedef LPVOID FREEBUFFER*; //Alias
  typedef DWORD WLAN_REASON_CODE; //Alias
  typedef WLAN_REASON_CODE *PWLAN_REASON_CODE; //Pointer
  typedef IUnknown* LPUNKNOWN; //Alias
  typedef IUnknown* WINAPI_IUnknown*; //Alias
  typedef enum LCID {
    LOCALE_SYSTEM_DEFAULT = 0x0800,
    LOCALE_USER_DEFAULT = 0x0400,
    LOCALE_CUSTOM_DEFAULT = 0x0c00,
    LOCALE_CUSTOM_UNSPECIFIED = 0x1000,
    LOCALE_CUSTOM_UI_DEFAULT = 0x1400,
    LOCALE_NEUTRAL = 0x0000,
    LOCALE_INVARIANT = 0x007f,
  } LCID;
  typedef LCID *PLCID; //Pointer
  typedef struct LIST_ENTRY {
    LPVOID Flink,
    LPVOID Blink,
  } LIST_ENTRY;
  typedef LIST_ENTRY *PLIST_ENTRY; //Pointer
  typedef LPVOID PSLIST_HEADER; //Alias
  typedef LPVOID PCONTEXT; //Alias
  typedef PCONTEXT WINAPI_CONTEXT*; //Alias
  typedef struct POINT {
    LONG x,
    LONG y,
  } POINT;
  typedef POINT WINAPI_POINT; //Alias
  typedef POINT* WINAPI_POINT*; //Alias
  typedef POINT* WINAPI_POINT*; //Alias
  typedef POINT* LPPOINT; //Alias
  typedef POINT POINTL; //Alias
  typedef enum WINAPI_DMORIENT {
    DMORIENT_PORTRAIT = 1,
    DMORIENT_LANDSCAPE = 2,
  } WINAPI_DMORIENT;
  typedef enum WINAPI_DMPAPER {
    DMPAPER_LETTER = 1,
    DMPAPER_LETTERSMALL = 2,
    DMPAPER_TABLOID = 3,
    DMPAPER_LEDGER = 4,
    DMPAPER_LEGAL = 5,
    DMPAPER_STATEMENT = 6,
    DMPAPER_EXECUTIVE = 7,
    DMPAPER_A3 = 8,
    DMPAPER_A4 = 9,
    DMPAPER_A4SMALL = 10,
    DMPAPER_A5 = 11,
    DMPAPER_B4 = 12,
    DMPAPER_B5 = 13,
    DMPAPER_FOLIO = 14,
    DMPAPER_QUARTO = 15,
    DMPAPER_10X14 = 16,
    DMPAPER_11X17 = 17,
    DMPAPER_NOTE = 18,
    DMPAPER_ENV_9 = 19,
    DMPAPER_ENV_10 = 20,
    DMPAPER_ENV_11 = 21,
    DMPAPER_ENV_12 = 22,
    DMPAPER_ENV_14 = 23,
    DMPAPER_CSHEET = 24,
    DMPAPER_DSHEET = 25,
    DMPAPER_ESHEET = 26,
    DMPAPER_ENV_DL = 27,
    DMPAPER_ENV_C5 = 28,
    DMPAPER_ENV_C3 = 29,
    DMPAPER_ENV_C4 = 30,
    DMPAPER_ENV_C6 = 31,
    DMPAPER_ENV_C65 = 32,
    DMPAPER_ENV_B4 = 33,
    DMPAPER_ENV_B5 = 34,
    DMPAPER_ENV_B6 = 35,
    DMPAPER_ENV_ITALY = 36,
    DMPAPER_ENV_MONARCH = 37,
    DMPAPER_ENV_PERSONAL = 38,
    DMPAPER_FANFOLD_US = 39,
    DMPAPER_FANFOLD_STD_GERMAN = 40,
    DMPAPER_FANFOLD_LGL_GERMAN = 41,
    DMPAPER_ISO_B4 = 42,
    DMPAPER_JAPANESE_POSTCARD = 43,
    DMPAPER_9X11 = 44,
    DMPAPER_10X11 = 45,
    DMPAPER_15X11 = 46,
    DMPAPER_ENV_INVITE = 47,
    DMPAPER_RESERVED_48 = 48,
    DMPAPER_RESERVED_49 = 49,
    DMPAPER_LETTER_EXTRA = 50,
    DMPAPER_LEGAL_EXTRA = 51,
    DMPAPER_TABLOID_EXTRA = 52,
    DMPAPER_A4_EXTRA = 53,
    DMPAPER_LETTER_TRANSVERSE = 54,
    DMPAPER_A4_TRANSVERSE = 55,
    DMPAPER_LETTER_EXTRA_TRANSVERSE = 56,
    DMPAPER_A_PLUS = 57,
    DMPAPER_B_PLUS = 58,
    DMPAPER_LETTER_PLUS = 59,
    DMPAPER_A4_PLUS = 60,
    DMPAPER_A5_TRANSVERSE = 61,
    DMPAPER_B5_TRANSVERSE = 62,
    DMPAPER_A3_EXTRA = 63,
    DMPAPER_A5_EXTRA = 64,
    DMPAPER_B5_EXTRA = 65,
    DMPAPER_A2 = 66,
    DMPAPER_A3_TRANSVERSE = 67,
    DMPAPER_A3_EXTRA_TRANSVERSE = 68,
    DMPAPER_DBL_JAPANESE_POSTCARD = 69,
    DMPAPER_A6 = 70,
    DMPAPER_JENV_KAKU2 = 71,
    DMPAPER_JENV_KAKU3 = 72,
    DMPAPER_JENV_CHOU3 = 73,
    DMPAPER_JENV_CHOU4 = 74,
    DMPAPER_LETTER_ROTATED = 75,
    DMPAPER_A3_ROTATED = 76,
    DMPAPER_A4_ROTATED = 77,
    DMPAPER_A5_ROTATED = 78,
    DMPAPER_B4_JIS_ROTATED = 79,
    DMPAPER_B5_JIS_ROTATED = 80,
    DMPAPER_JAPANESE_POSTCARD_ROTATED = 81,
    DMPAPER_DBL_JAPANESE_POSTCARD_ROTATED = 82,
    DMPAPER_A6_ROTATED = 83,
    DMPAPER_JENV_KAKU2_ROTATED = 84,
    DMPAPER_JENV_KAKU3_ROTATED = 85,
    DMPAPER_JENV_CHOU3_ROTATED = 86,
    DMPAPER_JENV_CHOU4_ROTATED = 87,
    DMPAPER_B6_JIS = 88,
    DMPAPER_B6_JIS_ROTATED = 89,
    DMPAPER_12X11 = 90,
    DMPAPER_JENV_YOU4 = 91,
    DMPAPER_JENV_YOU4_ROTATED = 92,
    DMPAPER_P16K = 93,
    DMPAPER_P32K = 94,
    DMPAPER_P32KBIG = 95,
    DMPAPER_PENV_1 = 96,
    DMPAPER_PENV_2 = 97,
    DMPAPER_PENV_3 = 98,
    DMPAPER_PENV_4 = 99,
    DMPAPER_PENV_5 = 100,
    DMPAPER_PENV_6 = 101,
    DMPAPER_PENV_7 = 102,
    DMPAPER_PENV_8 = 103,
    DMPAPER_PENV_9 = 104,
    DMPAPER_PENV_10 = 105,
    DMPAPER_P16K_ROTATED = 106,
    DMPAPER_P32K_ROTATED = 107,
    DMPAPER_P32KBIG_ROTATED = 108,
    DMPAPER_PENV_1_ROTATED = 109,
    DMPAPER_PENV_2_ROTATED = 110,
    DMPAPER_PENV_3_ROTATED = 111,
    DMPAPER_PENV_4_ROTATED = 112,
    DMPAPER_PENV_5_ROTATED = 113,
    DMPAPER_PENV_6_ROTATED = 114,
    DMPAPER_PENV_7_ROTATED = 115,
    DMPAPER_PENV_8_ROTATED = 116,
    DMPAPER_PENV_9_ROTATED = 117,
    DMPAPER_PENV_10_ROTATED = 118,
  } WINAPI_DMPAPER;
  typedef enum WINAPI_DMBIN {
    DMBIN_UPPER = 1,
    DMBIN_LOWER = 2,
    DMBIN_MIDDLE = 3,
    DMBIN_MANUAL = 4,
    DMBIN_ENVELOPE = 5,
    DMBIN_ENVMANUAL = 6,
    DMBIN_AUTO = 7,
    DMBIN_TRACTOR = 8,
    DMBIN_SMALLFMT = 9,
    DMBIN_LARGEFMT = 10,
    DMBIN_LARGECAPACITY = 11,
    DMBIN_CASSETTE = 14,
    DMBIN_FORMSOURCE = 15,
  } WINAPI_DMBIN;
  typedef enum WINAPI_DMRES {
    DMRES_DRAFT = WINAPI__1,
    DMRES_LOW = WINAPI__2,
    DMRES_MEDIUM = WINAPI__3,
    DMRES_HIGH = WINAPI__4,
  } WINAPI_DMRES;
  typedef struct WINAPI_DEVMODE_u1_s1 {
    WINAPI_DMORIENT dmOrientation,
    WINAPI_DMPAPER dmPaperSize,
    short dmPaperLength,
    short dmPaperWidth,
    short dmScale,
    short dmCopies,
    WINAPI_DMBIN dmDefaultSource,
    WINAPI_DMRES dmPrintQuality,
  } WINAPI_DEVMODE_u1_s1;
  typedef enum WINAPI_DMDO {
    DMDO_DEFAULT = 0,
    DMDO_90 = 1,
    DMDO_180 = 2,
    DMDO_270 = 3,
  } WINAPI_DMDO;
  typedef enum WINAPI_DMDFO {
    DMDFO_DEFAULT = 0,
    DMDFO_STRETCH = 1,
    DMDFO_CENTER = 2,
  } WINAPI_DMDFO;
  typedef struct WINAPI_DEVMODE_u1_s2 {
    POINTL dmPosition,
    WINAPI_DMDO dmDisplayOrientation,
    WINAPI_DMDFO dmDisplayFixedOutput,
  } WINAPI_DEVMODE_u1_s2;
  typedef union WINAPI_DEVMODE_u1 {
    WINAPI_DEVMODE_u1_s1 ,
    WINAPI_DEVMODE_u1_s2 ,
  } WINAPI_DEVMODE_u1;
  typedef DWORD WINAPI_DMDISPLAYFLAGS; //Alias
  typedef enum WINAPI_DMNUP {
    DMNUP_SYSTEM = 1,
    DMNUP_ONEUP = 2,
  } WINAPI_DMNUP;
  typedef union WINAPI_DEVMODE_u2 {
    WINAPI_DMDISPLAYFLAGS dmDisplayFlags,
    WINAPI_DMNUP dmNup,
  } WINAPI_DEVMODE_u2;
  typedef DWORD WINAPI_DM_Fields; //Alias
  typedef enum WINAPI_DMCOLOR {
    DMCOLOR_MONOCHROME = 1,
    DMCOLOR_COLOR = 2,
  } WINAPI_DMCOLOR;
  typedef enum WINAPI_DMDUP {
    DMDUP_SIMPLEX = 1,
    DMDUP_VERTICAL = 2,
    DMDUP_HORIZONTAL = 3,
  } WINAPI_DMDUP;
  typedef enum WINAPI_DMTT {
    DMTT_BITMAP = 1,
    DMTT_DOWNLOAD = 2,
    DMTT_SUBDEV = 3,
    DMTT_DOWNLOAD_OUTLINE = 4,
  } WINAPI_DMTT;
  typedef enum WINAPI_DMCOLLATE {
    DMCOLLATE_FALSE = 0,
    DMCOLLATE_TRUE = 1,
  } WINAPI_DMCOLLATE;
  typedef enum WINAPI_DMICMMETHOD {
    DMICMMETHOD_NONE = 1,
    DMICMMETHOD_SYSTEM = 2,
    DMICMMETHOD_DRIVER = 3,
    DMICMMETHOD_DEVICE = 4,
  } WINAPI_DMICMMETHOD;
  typedef enum WINAPI_DMICM {
    DMICM_SATURATE = 1,
    DMICM_CONTRAST = 2,
    DMICM_COLORIMETRIC = 3,
    DMICM_ABS_COLORIMETRIC = 4,
  } WINAPI_DMICM;
  typedef enum WINAPI_DMMEDIA {
    DMMEDIA_STANDARD = 1,
    DMMEDIA_TRANSPARENCY = 2,
    DMMEDIA_GLOSSY = 3,
  } WINAPI_DMMEDIA;
  typedef enum WINAPI_DMDITHER {
    DMDITHER_NONE = 1,
    DMDITHER_COARSE = 2,
    DMDITHER_FINE = 3,
    DMDITHER_LINEART = 4,
    DMDITHER_ERRORDIFFUSION = 5,
    DMDITHER_RESERVED6 = 6,
    DMDITHER_RESERVED7 = 7,
    DMDITHER_RESERVED8 = 8,
    DMDITHER_RESERVED9 = 9,
    DMDITHER_GRAYSCALE = 10,
  } WINAPI_DMDITHER;
  typedef struct DEVMODE {
    TCHAR [CCHDEVICENAME] dmDeviceName,
    WORD dmSpecVersion,
    WORD dmDriverVersion,
    WORD dmSize,
    WORD dmDriverExtra,
    WINAPI_DM_Fields dmFields,
    WINAPI_DEVMODE_u1 ,
    WINAPI_DMCOLOR dmColor,
    WINAPI_DMDUP dmDuplex,
    short dmYResolution,
    WINAPI_DMTT dmTTOption,
    WINAPI_DMCOLLATE dmCollate,
    TCHAR [CCHFORMNAME] dmFormName,
    WORD dmLogPixels,
    DWORD dmBitsPerPel,
    DWORD dmPelsWidth,
    DWORD dmPelsHeight,
    WINAPI_DEVMODE_u2 ,
    DWORD dmDisplayFrequency,
    WINAPI_DMICMMETHOD dmICMMethod,
    WINAPI_DMICM dmICMIntent,
    WINAPI_DMMEDIA dmMediaType,
    WINAPI_DMDITHER dmDitherType,
    DWORD dmReserved1,
    DWORD dmReserved2,
    DWORD dmPanningWidth,
    DWORD dmPanningHeight,
  } DEVMODE;
  typedef DEVMODE *WINAPI_DEVMODE*; //Pointer
  typedef DEVMODE *LPDEVMODE; //Pointer
  typedef DEVMODE *PDEVMODE; //Pointer
  typedef enum HANDLE {
    NULL = 0,
  } HANDLE;
  typedef HANDLE *PHANDLE; //Pointer
  typedef HANDLE *LPHANDLE; //Pointer
  typedef HANDLE *WINAPI_HANDLE*; //Pointer
  typedef HANDLE WINAPI_FILE_HANDLE; //Alias
  typedef HANDLE HACCEL; //Alias
  typedef HANDLE HRSRC; //Alias
  typedef HANDLE HWND; //Alias
  typedef HWND *WINAPI_HWND*; //Pointer
  typedef HANDLE HGLOBAL; //Alias
  typedef HANDLE HKL; //Alias
  typedef HANDLE HBITMAP; //Alias
  typedef HANDLE HENHMETAFILE; //Alias
  typedef enum WINAPI_ProcessHandle {
    GetCurrentProcess() = WINAPI__1,
  } WINAPI_ProcessHandle;
  typedef enum WINAPI_ThreadHandle {
    GetCurrentThread() = WINAPI__2,
  } WINAPI_ThreadHandle;
  typedef enum HRESULT {
    S_OK = 0,
    S_FALSE = 1,
    E_ABORT = 0x80004004,
    E_ACCESSDENIED = 0x80070005,
    E_FAIL = 0x80004005,
    E_HANDLE = 0x80070006,
    E_INVALIDARG = 0x80070057,
    E_NOINTERFACE = 0x80004002,
    E_NOTIMPL = 0x80004001,
    E_OUTOFMEMORY = 0x8007000E,
    E_POINTER = 0x80004003,
    E_UNEXPECTED = 0x8000FFFF,
    CO_E_NOTINITIALIZED = 0x800401F0,
  } HRESULT;
  typedef HRESULT STDAPI; //Alias
  typedef HRESULT SCODE; //Alias
  typedef struct WINAPI_LARGE_INTEGER_s {
    DWORD LowPart,
    LONG HighPart,
  } WINAPI_LARGE_INTEGER_s;
  typedef union LARGE_INTEGER {
    WINAPI_LARGE_INTEGER_s u,
    LONGLONG QuadPart,
  } LARGE_INTEGER;
  typedef LARGE_INTEGER *PLARGE_INTEGER; //Pointer
  typedef PLARGE_INTEGER LARGE_INTEGER*; //Alias
  typedef LARGE_INTEGER* WINAPI_LARGE_INTEGER*; //Alias
  typedef struct WINAPI_ULARGE_INTEGER_s {
    DWORD LowPart,
    LONG HighPart,
  } WINAPI_ULARGE_INTEGER_s;
  typedef union ULARGE_INTEGER {
    WINAPI_ULARGE_INTEGER_s u,
    ULONGLONG QuadPart,
  } ULARGE_INTEGER;
  typedef ULARGE_INTEGER *PULARGE_INTEGER; //Pointer
  typedef struct FILETIME {
    DWORD dwLowDateTime,
    DWORD dwHighDateTime,
  } FILETIME;
  typedef FILETIME* PFILETIME; //Alias
  typedef FILETIME* LPFILETIME; //Alias
  typedef FILETIME* WINAPI_FILETIME*; //Alias
  typedef FILETIME* FILETIME const*; //Alias
  typedef GUID* PGUID; //Alias
  typedef GUID* WINAPI_GUID*; //Alias
  typedef GUID* LPCGUID; //Alias
  typedef GUID* WINAPI_GUID*; //Alias
  typedef GUID *LPGUID; //Pointer
  typedef LPGUID WINAPI_LPGUID; //Alias
  typedef GUID* REFGUID; //Alias
  typedef GUID CLSID; //Alias
  typedef CLSID* LPCLSID; //Alias
  typedef CLSID* WINAPI_CLSID*; //Alias
  typedef CLSID *REFCLSID; //Pointer
  typedef GUID UUID; //Alias
  typedef UUID* WINAPI_UUID*; //Alias
  typedef GUID IID; //Alias
  typedef IID* WINAPI_IID*; //Alias
  typedef IID *REFIID; //Pointer
  typedef IID *LPIID; //Pointer
  typedef struct LUID {
    DWORD LowPart,
    LONG HighPart,
  } LUID;
  typedef LUID* PLUID; //Alias
  typedef GUID SLID; //Alias
  typedef SLID *WINAPI_SLID*; //Pointer
  typedef SLID *WINAPI_SLID*; //Pointer
  typedef DWORD ACCESS_MASK; //Alias
  typedef ACCESS_MASK *PACCESS_MASK; //Pointer
  typedef ACCESS_MASK WINAPI_THREAD_ACCESS_MASK; //Alias
  typedef ACCESS_MASK WINAPI_PROCESS_ACCESS_MASK; //Alias
  typedef ACCESS_MASK WINAPI_FILE_ACCESS_MASK; //Alias
  typedef UINT SECURITY_INFORMATION; //Alias
  typedef SECURITY_INFORMATION *PSECURITY_INFORMATION; //Pointer
  typedef struct SYSTEMTIME {
    WORD wYear,
    WORD wMonth,
    WORD wDayOfWeek,
    WORD wDay,
    WORD wHour,
    WORD wMinute,
    WORD wSecond,
    WORD wMilliseconds,
  } SYSTEMTIME;
  typedef SYSTEMTIME WINAPI_SYSTEMTIME; //Alias
  typedef SYSTEMTIME* WINAPI_SYSTEMTIME*; //Alias
  typedef SYSTEMTIME* PSYSTEMTIME; //Alias
  typedef PSYSTEMTIME LPSYSTEMTIME; //Alias
  typedef enum JOBOBJECTINFOCLASS {
    JobObjectBasicAccountingInformation = 1,
    JobObjectBasicLimitInformation = 2,
    JobObjectBasicProcessIdList = 3,
    JobObjectBasicUIRestrictions = 4,
    JobObjectSecurityLimitInformation = 5,
    JobObjectEndOfJobTimeInformation = 6,
    JobObjectAssociateCompletionPortInformation = 7,
    JobObjectBasicAndIoAccountingInformation = 8,
    JobObjectExtendedLimitInformation = 9,
    JobObjectJobSetInformation = 10,
    JobObjectGroupInformation = 11,
    JobObjectNotificationLimitInformation = 12,
    JobObjectLimitViolationInformation = 13,
    JobObjectGroupInformationEx = 14,
    JobObjectCpuRateControlInformation = 15,
    JobObjectCompletionFilter = 16,
    JobObjectCompletionCounter = 17,
    JobObjectFreezeInformation = 18,
    JobObjectExtendedAccountingInformation = 19,
    JobObjectWakeInformation = 20,
    JobObjectIdleAwareInformation = 21,
    JobObjectSchedulingRankBiasInformation = 22,
    JobObjectTimerVirtualizationInformation = 23,
    JobObjectCycleTimeNotification = 24,
    JobObjectReserved1Information = 18,
    JobObjectReserved2Information = 19,
    JobObjectReserved3Information = 20,
    JobObjectReserved4Information = 21,
    JobObjectReserved5Information = 22,
    JobObjectReserved6Information = 23,
    JobObjectReserved7Information = 24,
  } JOBOBJECTINFOCLASS;
  typedef enum PROCESSINFOCLASS {
    ProcessBasicInformation = 0,
    ProcessQuotaLimits = 1,
    ProcessIoCounters = 2,
    ProcessVmCounters = 3,
    ProcessTimes = 4,
    ProcessBasePriority = 5,
    ProcessRaisePriority = 6,
    ProcessDebugPort = 7,
    ProcessExceptionPort = 8,
    ProcessAccessToken = 9,
    ProcessLdtInformation = 10,
    ProcessLdtSize = 11,
    ProcessDefaultHardErrorMode = 12,
    ProcessIoPortHandlers = 13,
    ProcessPooledUsageAndLimits = 14,
    ProcessWorkingSetWatch = 15,
    ProcessUserModeIOPL = 16,
    ProcessEnableAlignmentFaultFixup = 17,
    ProcessPriorityClass = 18,
    ProcessWx86Information = 19,
    ProcessHandleCount = 20,
    ProcessAffinityMask = 21,
    ProcessPriorityBoost = 22,
    ProcessDeviceMap = 23,
    ProcessSessionInformation = 24,
    ProcessForegroundInformation = 25,
    ProcessWow64Information = 26,
    ProcessImageFileName = 27,
    ProcessLUIDDeviceMapsEnabled = 28,
    ProcessBreakOnTermination = 29,
    ProcessDebugObjectHandle = 30,
    ProcessDebugFlags = 31,
    ProcessHandleTracing = 32,
    ProcessIoPriority = 33,
    ProcessExecuteFlags = 34,
    ProcessTlsInformation = 35,
    ProcessCookie = 36,
    ProcessImageInformation = 37,
    ProcessCycleTime = 38,
    ProcessPagePriority = 39,
    ProcessInstrumentationCallback = 40,
    ProcessThreadStackAllocation = 41,
    ProcessWorkingSetWatchEx = 42,
    ProcessImageFileNameWin32 = 43,
    ProcessImageFileMapping = 44,
    ProcessAffinityUpdateMode = 45,
    ProcessMemoryAllocationMode = 46,
    ProcessGroupInformation = 47,
    ProcessTokenVirtualizationEnabled = 48,
    ProcessConsoleHostProcess = 49,
    ProcessWindowInformation = 50,
    ProcessHandleInformation = 51,
    ProcessMitigationPolicy = 52,
    ProcessDynamicFunctionTableInformation = 53,
    ProcessHandleCheckingMode = 54,
    ProcessKeepAliveCount = 55,
    ProcessRevokeFileHandles = 56,
  } PROCESSINFOCLASS;
  typedef enum THREADINFOCLASS {
    ThreadBasicInformation = 0,
    ThreadTimes = 1,
    ThreadPriority = 2,
    ThreadBasePriority = 3,
    ThreadAffinityMask = 4,
    ThreadImpersonationToken = 5,
    ThreadDescriptorTableEntry = 6,
    ThreadEnableAlignmentFaultFixup = 7,
    ThreadEventPair_Reusable = 8,
    ThreadQuerySetWin32StartAddress = 9,
    ThreadZeroTlsCell = 10,
    ThreadPerformanceCount = 11,
    ThreadAmILastThread = 12,
    ThreadIdealProcessor = 13,
    ThreadPriorityBoost = 14,
    ThreadSetTlsArrayAddress = 15,
    ThreadIsIoPending = 16,
    ThreadHideFromDebugger = 17,
    ThreadBreakOnTermination = 18,
    ThreadSwitchLegacyState = 19,
    ThreadIsTerminated = 20,
    ThreadLastSystemCall = 21,
    ThreadIoPriority = 22,
    ThreadCycleTime = 23,
    ThreadPagePriority = 24,
    ThreadActualBasePriority = 25,
    ThreadTebInformation = 26,
    ThreadCSwitchMon = 27,
    ThreadCSwitchPmu = 28,
    ThreadWow64Context = 29,
    ThreadGroupInformation = 30,
    ThreadUmsInformation = 31,
    ThreadCounterProfiling = 32,
    ThreadIdealProcessorEx = 33,
    ThreadCpuAccountingInformation = 34,
    ThreadSwitchStackCheck = 35,
  } THREADINFOCLASS;
  typedef enum GET_FILEEX_INFO_LEVELS {
    GetFileExInfoStandard = 0,
  } GET_FILEEX_INFO_LEVELS;
  typedef struct UNICODE_STRING {
    USHORT Length,
    USHORT MaximumLength,
    PWSTR Buffer,
  } UNICODE_STRING;
  typedef UNICODE_STRING *PUNICODE_STRING; //Pointer
  typedef UNICODE_STRING *PCUNICODE_STRING; //Pointer
  typedef UNICODE_STRING *WINAPI_UNICODE_STRING*; //Pointer
  typedef struct STRING {
    USHORT Length,
    USHORT MaximumLength,
    PCHAR Buffer,
  } STRING;
  typedef STRING *PSTRING; //Pointer
  typedef STRING *WINAPI_STRING*; //Pointer
  typedef STRING ANSI_STRING; //Alias
  typedef ANSI_STRING *PANSI_STRING; //Pointer
  typedef ANSI_STRING *PCANSI_STRING; //Pointer
  typedef STRING OEM_STRING; //Alias
  typedef OEM_STRING *POEM_STRING; //Pointer
  typedef OEM_STRING *PCOEM_STRING; //Pointer
  typedef enum WINAPI_WinMsg {
    WM_CREATE = 0x0001,
    WM_DESTROY = 0x0002,
    WM_MOVE = 0x0003,
    WM_SIZE = 0x0005,
    WM_ACTIVATE = 0x0006,
    WM_SETFOCUS = 0x0007,
    WM_KILLFOCUS = 0x0008,
    WM_ENABLE = 0x000A,
    WM_SETREDRAW = 0x000B,
    WM_SETTEXT = 0x000C,
    WM_GETTEXT = 0x000D,
    WM_GETTEXTLENGTH = 0x000E,
    WM_PAINT = 0x000F,
    WM_CLOSE = 0x0010,
    WM_QUERYENDSESSION = 0x0011,
    WM_QUERYOPEN = 0x0013,
    WM_ENDSESSION = 0x0016,
    WM_QUIT = 0x0012,
    WM_ERASEBKGND = 0x0014,
    WM_SYSCOLORCHANGE = 0x0015,
    WM_SHOWWINDOW = 0x0018,
    WM_SETTINGCHANGE = 0x001A,
    WM_DEVMODECHANGE = 0x001B,
    WM_ACTIVATEAPP = 0x001C,
    WM_FONTCHANGE = 0x001D,
    WM_TIMECHANGE = 0x001E,
    WM_CANCELMODE = 0x001F,
    WM_SETCURSOR = 0x0020,
    WM_MOUSEACTIVATE = 0x0021,
    WM_CHILDACTIVATE = 0x0022,
    WM_QUEUESYNC = 0x0023,
    WM_GETMINMAXINFO = 0x0024,
    WM_PAINTICON = 0x0026,
    WM_ICONERASEBKGND = 0x0027,
    WM_NEXTDLGCTL = 0x0028,
    WM_SPOOLERSTATUS = 0x002A,
    WM_DRAWITEM = 0x002B,
    WM_MEASUREITEM = 0x002C,
    WM_DELETEITEM = 0x002D,
    WM_VKEYTOITEM = 0x002E,
    WM_CHARTOITEM = 0x002F,
    WM_SETFONT = 0x0030,
    WM_GETFONT = 0x0031,
    WM_SETHOTKEY = 0x0032,
    WM_GETHOTKEY = 0x0033,
    WM_QUERYDRAGICON = 0x0037,
    WM_COMPAREITEM = 0x0039,
    WM_GETOBJECT = 0x003D,
    WM_COMPACTING = 0x0041,
    WM_COMMNOTIFY = 0x0044,
    WM_WINDOWPOSCHANGING = 0x0046,
    WM_WINDOWPOSCHANGED = 0x0047,
    WM_POWER = 0x0048,
    WM_COPYDATA = 0x004A,
    WM_CANCELJOURNAL = 0x004B,
    WM_NOTIFY = 0x004E,
    WM_INPUTLANGCHANGEREQUEST = 0x0050,
    WM_INPUTLANGCHANGE = 0x0051,
    WM_TCARD = 0x0052,
    WM_HELP = 0x0053,
    WM_USERCHANGED = 0x0054,
    WM_NOTIFYFORMAT = 0x0055,
    WM_CONTEXTMENU = 0x007B,
    WM_STYLECHANGING = 0x007C,
    WM_STYLECHANGED = 0x007D,
    WM_DISPLAYCHANGE = 0x007E,
    WM_GETICON = 0x007F,
    WM_SETICON = 0x0080,
    WM_NCCREATE = 0x0081,
    WM_NCDESTROY = 0x0082,
    WM_NCCALCSIZE = 0x0083,
    WM_NCHITTEST = 0x0084,
    WM_NCPAINT = 0x0085,
    WM_NCACTIVATE = 0x0086,
    WM_GETDLGCODE = 0x0087,
    WM_SYNCPAINT = 0x0088,
    WM_NCMOUSEMOVE = 0x00A0,
    WM_NCLBUTTONDOWN = 0x00A1,
    WM_NCLBUTTONUP = 0x00A2,
    WM_NCLBUTTONDBLCLK = 0x00A3,
    WM_NCRBUTTONDOWN = 0x00A4,
    WM_NCRBUTTONUP = 0x00A5,
    WM_NCRBUTTONDBLCLK = 0x00A6,
    WM_NCMBUTTONDOWN = 0x00A7,
    WM_NCMBUTTONUP = 0x00A8,
    WM_NCMBUTTONDBLCLK = 0x00A9,
    WM_NCXBUTTONDOWN = 0x00AB,
    WM_NCXBUTTONUP = 0x00AC,
    WM_NCXBUTTONDBLCLK = 0x00AD,
    WM_INPUT_DEVICE_CHANGE = 0x00FE,
    WM_INPUT = 0x00FF,
    WM_KEYDOWN = 0x0100,
    WM_KEYUP = 0x0101,
    WM_CHAR = 0x0102,
    WM_DEADCHAR = 0x0103,
    WM_SYSKEYDOWN = 0x0104,
    WM_SYSKEYUP = 0x0105,
    WM_SYSCHAR = 0x0106,
    WM_SYSDEADCHAR = 0x0107,
    WM_UNICHAR = 0x0109,
    WM_IME_STARTCOMPOSITION = 0x010D,
    WM_IME_ENDCOMPOSITION = 0x010E,
    WM_IME_COMPOSITION = 0x010F,
    WM_IME_KEYLAST = 0x010F,
    WM_INITDIALOG = 0x0110,
    WM_COMMAND = 0x0111,
    WM_SYSCOMMAND = 0x0112,
    WM_TIMER = 0x0113,
    WM_HSCROLL = 0x0114,
    WM_VSCROLL = 0x0115,
    WM_INITMENU = 0x0116,
    WM_INITMENUPOPUP = 0x0117,
    WM_MENUSELECT = 0x011F,
    WM_MENUCHAR = 0x0120,
    WM_ENTERIDLE = 0x0121,
    WM_MENURBUTTONUP = 0x0122,
    WM_MENUDRAG = 0x0123,
    WM_MENUGETOBJECT = 0x0124,
    WM_UNINITMENUPOPUP = 0x0125,
    WM_MENUCOMMAND = 0x0126,
    WM_CHANGEUISTATE = 0x0127,
    WM_UPDATEUISTATE = 0x0128,
    WM_QUERYUISTATE = 0x0129,
    WM_CTLCOLORMSGBOX = 0x0132,
    WM_CTLCOLOREDIT = 0x0133,
    WM_CTLCOLORLISTBOX = 0x0134,
    WM_CTLCOLORBTN = 0x0135,
    WM_CTLCOLORDLG = 0x0136,
    WM_CTLCOLORSCROLLBAR = 0x0137,
    WM_CTLCOLORSTATIC = 0x0138,
    MN_GETHMENU = 0x01E1,
    WM_MOUSEMOVE = 0x0200,
    WM_LBUTTONDOWN = 0x0201,
    WM_LBUTTONUP = 0x0202,
    WM_LBUTTONDBLCLK = 0x0203,
    WM_RBUTTONDOWN = 0x0204,
    WM_RBUTTONUP = 0x0205,
    WM_RBUTTONDBLCLK = 0x0206,
    WM_MBUTTONDOWN = 0x0207,
    WM_MBUTTONUP = 0x0208,
    WM_MBUTTONDBLCLK = 0x0209,
    WM_MOUSEWHEEL = 0x020A,
    WM_XBUTTONDOWN = 0x020B,
    WM_XBUTTONUP = 0x020C,
    WM_XBUTTONDBLCLK = 0x020D,
    WM_MOUSEHWHEEL = 0x020E,
    WM_PARENTNOTIFY = 0x0210,
    WM_ENTERMENULOOP = 0x0211,
    WM_EXITMENULOOP = 0x0212,
    WM_NEXTMENU = 0x0213,
    WM_SIZING = 0x0214,
    WM_CAPTURECHANGED = 0x0215,
    WM_MOVING = 0x0216,
    WM_POWERBROADCAST = 0x0218,
    WM_DEVICECHANGE = 0x0219,
    WM_MDICREATE = 0x0220,
    WM_MDIDESTROY = 0x0221,
    WM_MDIACTIVATE = 0x0222,
    WM_MDIRESTORE = 0x0223,
    WM_MDINEXT = 0x0224,
    WM_MDIMAXIMIZE = 0x0225,
    WM_MDITILE = 0x0226,
    WM_MDICASCADE = 0x0227,
    WM_MDIICONARRANGE = 0x0228,
    WM_MDIGETACTIVE = 0x0229,
    WM_MDISETMENU = 0x0230,
    WM_ENTERSIZEMOVE = 0x0231,
    WM_EXITSIZEMOVE = 0x0232,
    WM_DROPFILES = 0x0233,
    WM_MDIREFRESHMENU = 0x0234,
    WM_IME_SETCONTEXT = 0x0281,
    WM_IME_NOTIFY = 0x0282,
    WM_IME_CONTROL = 0x0283,
    WM_IME_COMPOSITIONFULL = 0x0284,
    WM_IME_SELECT = 0x0285,
    WM_IME_CHAR = 0x0286,
    WM_IME_REQUEST = 0x0288,
    WM_IME_KEYDOWN = 0x0290,
    WM_IME_KEYUP = 0x0291,
    WM_MOUSEHOVER = 0x02A1,
    WM_MOUSELEAVE = 0x02A3,
    WM_NCMOUSEHOVER = 0x02A0,
    WM_NCMOUSELEAVE = 0x02A2,
    WM_WTSSESSION_CHANGE = 0x02B1,
    WM_TABLET_ADDED = 0x02c8,
    WM_TABLET_DELETED = 0x02c9,
    WM_TABLET_FLICK = 0x02cb,
    WM_TABLET_QUERYSYSTEMGESTURESTATUS = 0x02cc,
    WM_CUT = 0x0300,
    WM_COPY = 0x0301,
    WM_PASTE = 0x0302,
    WM_CLEAR = 0x0303,
    WM_UNDO = 0x0304,
    WM_RENDERFORMAT = 0x0305,
    WM_RENDERALLFORMATS = 0x0306,
    WM_DESTROYCLIPBOARD = 0x0307,
    WM_DRAWCLIPBOARD = 0x0308,
    WM_PAINTCLIPBOARD = 0x0309,
    WM_VSCROLLCLIPBOARD = 0x030A,
    WM_SIZECLIPBOARD = 0x030B,
    WM_ASKCBFORMATNAME = 0x030C,
    WM_CHANGECBCHAIN = 0x030D,
    WM_HSCROLLCLIPBOARD = 0x030E,
    WM_QUERYNEWPALETTE = 0x030F,
    WM_PALETTEISCHANGING = 0x0310,
    WM_PALETTECHANGED = 0x0311,
    WM_HOTKEY = 0x0312,
    WM_PRINT = 0x0317,
    WM_PRINTCLIENT = 0x0318,
    WM_APPCOMMAND = 0x0319,
    WM_THEMECHANGED = 0x031A,
    WM_CLIPBOARDUPDATE = 0x031D,
    WM_DWMCOMPOSITIONCHANGED = 0x031E,
    WM_DWMNCRENDERINGCHANGED = 0x031F,
    WM_DWMCOLORIZATIONCOLORCHANGED = 0x0320,
    WM_DWMWINDOWMAXIMIZEDCHANGE = 0x0321,
    WM_GETTITLEBARINFOEX = 0x033F,
    WM_USER = 0x0400,
    EM_GETSEL = 0x00B0,
    EM_SETSEL = 0x00B1,
    EM_GETRECT = 0x00B2,
    EM_SETRECT = 0x00B3,
    EM_SETRECTNP = 0x00B4,
    EM_SCROLL = 0x00B5,
    EM_LINESCROLL = 0x00B6,
    EM_SCROLLCARET = 0x00B7,
    EM_GETMODIFY = 0x00B8,
    EM_SETMODIFY = 0x00B9,
    EM_GETLINECOUNT = 0x00BA,
    EM_LINEINDEX = 0x00BB,
    EM_SETHANDLE = 0x00BC,
    EM_GETHANDLE = 0x00BD,
    EM_GETTHUMB = 0x00BE,
    EM_LINELENGTH = 0x00C1,
    EM_REPLACESEL = 0x00C2,
    EM_GETLINE = 0x00C4,
    EM_LIMITTEXT = 0x00C5,
    EM_CANUNDO = 0x00C6,
    EM_UNDO = 0x00C7,
    EM_FMTLINES = 0x00C8,
    EM_LINEFROMCHAR = 0x00C9,
    EM_SETTABSTOPS = 0x00CB,
    EM_SETPASSWORDCHAR = 0x00CC,
    EM_EMPTYUNDOBUFFER = 0x00CD,
    EM_GETFIRSTVISIBLELINE = 0x00CE,
    EM_SETREADONLY = 0x00CF,
    EM_SETWORDBREAKPROC = 0x00D0,
    EM_GETWORDBREAKPROC = 0x00D1,
    EM_GETPASSWORDCHAR = 0x00D2,
    EM_SETMARGINS = 0x00D3,
    EM_GETMARGINS = 0x00D4,
    EM_SETLIMITTEXT = 0x00C5,
    EM_GETLIMITTEXT = 0x00D5,
    EM_POSFROMCHAR = 0x00D6,
    EM_CHARFROMPOS = 0x00D7,
    EM_SETIMESTATUS = 0x00D8,
    EM_GETIMESTATUS = 0x00D9,
    BM_GETCHECK = 0x00F0,
    BM_SETCHECK = 0x00F1,
    BM_GETSTATE = 0x00F2,
    BM_SETSTATE = 0x00F3,
    BM_SETSTYLE = 0x00F4,
    BM_CLICK = 0x00F5,
    BM_GETIMAGE = 0x00F6,
    BM_SETIMAGE = 0x00F7,
    BM_SETDONTCLICK = 0x00F8,
  } WINAPI_WinMsg;
  typedef struct MSG {
    HWND hwnd,
    WINAPI_WinMsg message,
    WPARAM wParam,
    LPARAM lParam,
    DWORD time,
    POINT pt,
  } MSG;
  typedef MSG* WINAPI_MSG*; //Alias
  typedef MSG* LPMSG; //Alias
  typedef enum WINAPI_ImageType {
    IMAGE_BITMAP = 0,
    IMAGE_ICON = 1,
    IMAGE_CURSOR = 2,
    IMAGE_ENHMETAFILE = 3,
  } WINAPI_ImageType;
  typedef UINT WINAPI_LRFlags; //Alias
  typedef enum WINAPI_SBType {
    SB_HORZ = 0,
    SB_VERT = 1,
    SB_CTL = 2,
    SB_BOTH = 3,
  } WINAPI_SBType;
  typedef UINT WINAPI_IsTextUnicodeFlags; //Alias
  typedef enum WINAPI_WaitTimeout {
    INFINITE = 0xFFFFFFFF,
  } WINAPI_WaitTimeout;
  typedef UINT WINAPI_BorderFlag; //Alias
  typedef enum WINAPI_SysColorIndex {
    COLOR_SCROLLBAR = 0,
    COLOR_BACKGROUND = 1,
    COLOR_ACTIVECAPTION = 2,
    COLOR_INACTIVECAPTION = 3,
    COLOR_MENU = 4,
    COLOR_WINDOW = 5,
    COLOR_WINDOWFRAME = 6,
    COLOR_MENUTEXT = 7,
    COLOR_WINDOWTEXT = 8,
    COLOR_CAPTIONTEXT = 9,
    COLOR_ACTIVEBORDER = 10,
    COLOR_INACTIVEBORDER = 11,
    COLOR_APPWORKSPACE = 12,
    COLOR_HIGHLIGHT = 13,
    COLOR_HIGHLIGHTTEXT = 14,
    COLOR_BTNFACE = 15,
    COLOR_BTNSHADOW = 16,
    COLOR_GRAYTEXT = 17,
    COLOR_BTNTEXT = 18,
    COLOR_INACTIVECAPTIONTEXT = 19,
    COLOR_BTNHIGHLIGHT = 20,
    COLOR_3DDKSHADOW = 21,
    COLOR_3DLIGHT = 22,
    COLOR_INFOTEXT = 23,
    COLOR_INFOBK = 24,
    COLOR_HOTLIGHT = 26,
    COLOR_GRADIENTACTIVECAPTION = 27,
    COLOR_GRADIENTINACTIVECAPTION = 28,
    COLOR_MENUHILIGHT = 29,
    COLOR_MENUBAR = 30,
  } WINAPI_SysColorIndex;
  typedef UINT WINAPI_BorderEdge; //Alias
  typedef DWORD WINAPI_DrawTextFlags; //Alias
  typedef struct RECT {
    LONG left,
    LONG top,
    LONG right,
    LONG bottom,
  } RECT;
  typedef RECT *LPRECT; //Pointer
  typedef LPRECT WINAPI_LPRECT; //Alias
  typedef LPRECT RECT*; //Alias
  typedef LPRECT LPCRECT; //Alias
  typedef LPRECT WINAPI_RECT*; //Alias
  typedef LPRECT WINAPI_RECT*; //Alias
  typedef RECT RECTL; //Alias
  typedef RECTL *LPCRECTL; //Pointer
  typedef enum WINAPI_CodePageEnum {
    CP_ACP = 0,
    CP_OEMCP = 1,
    CP_MACCP = 2,
    CP_THREAD_ACP = 3,
    CP_SYMBOL = 42,
    WINAPI_MS_DOS_Latin_US = 437,
    Thai = 874,
    WINAPI_Japanese_(Shift_JIS) = 932,
    WINAPI_Chinese_Simplified = 936,
    Korean = 949,
    WINAPI_Chinese_Traditional = 950,
    WINAPI_Unicode UTF_16 LE = 1200,
    WINAPI_Unicode UTF_16 BE = 1201,
    WINAPI_Central_European = 1250,
    Cyrillic = 1251,
    WINAPI_Western_European = 1252,
    Greek = 1253,
    Turkish = 1254,
    Hebrew = 1255,
    Arabic = 1256,
    Baltic = 1257,
    Vietnamese = 1258,
    CP_UTF7 = 65000,
    CP_UTF8 = 65001,
  } WINAPI_CodePageEnum;
  typedef enum WINAPI_EXCEPTION_FLAGS {
    EXCEPTION_NONCONTINUABLE_EXCEPTION = 0x1,
  } WINAPI_EXCEPTION_FLAGS;
  typedef struct EXCEPTION_RECORD {
    WINAPI_ExceptionCode ExceptionCode,
    DWORD ExceptionFlags,
    LPVOID ExceptionRecord,
    PVOID ExceptionAddress,
    DWORD NumberParameters,
    ULONG_PTR [EXCEPTION_MAXIMUM_PARAMETERS] ExceptionInformation,
  } EXCEPTION_RECORD;
  typedef EXCEPTION_RECORD *PEXCEPTION_RECORD; //Pointer
  typedef struct EXCEPTION_POINTERS {
    PEXCEPTION_RECORD ExceptionRecord,
    PCONTEXT ContextRecord,
  } EXCEPTION_POINTERS;
  typedef EXCEPTION_POINTERS *PEXCEPTION_POINTERS; //Pointer
  typedef EXCEPTION_POINTERS *LPEXCEPTION_POINTERS; //Pointer
  typedef struct SP_DEVINFO_DATA {
    DWORD cbSize,
    GUID ClassGuid,
    DWORD DevInst,
    ULONG_PTR Reserved,
  } SP_DEVINFO_DATA;
  typedef SP_DEVINFO_DATA *PSP_DEVINFO_DATA; //Pointer
  typedef struct PROCESS_INFORMATION {
    HANDLE hProcess,
    HANDLE hThread,
    DWORD dwProcessId,
    DWORD dwThreadId,
  } PROCESS_INFORMATION;
  typedef PROCESS_INFORMATION *LPPROCESS_INFORMATION; //Pointer
  typedef enum WINAPI_ShowWindowCmd {
    SW_HIDE = 0,
    SW_SHOWNORMAL = 1,
    SW_NORMAL = 1,
    SW_SHOWMINIMIZED = 2,
    SW_SHOWMAXIMIZED = 3,
    SW_MAXIMIZE = 3,
    SW_SHOWNOACTIVATE = 4,
    SW_SHOW = 5,
    SW_MINIMIZE = 6,
    SW_SHOWMINNOACTIVE = 7,
    SW_SHOWNA = 8,
    SW_RESTORE = 9,
    SW_SHOWDEFAULT = 10,
    SW_FORCEMINIMIZE = 11,
  } WINAPI_ShowWindowCmd;
  typedef enum WINAPI_STARTUPINFO_ShowWindow {
    SW_HIDE = 0,
    SW_SHOWNORMAL = 1,
    SW_NORMAL = 1,
    SW_SHOWMINIMIZED = 2,
    SW_SHOWMAXIMIZED = 3,
    SW_MAXIMIZE = 3,
    SW_SHOWNOACTIVATE = 4,
    SW_SHOW = 5,
    SW_MINIMIZE = 6,
    SW_SHOWMINNOACTIVE = 7,
    SW_SHOWNA = 8,
    SW_RESTORE = 9,
    SW_SHOWDEFAULT = 10,
    SW_FORCEMINIMIZE = 11,
  } WINAPI_STARTUPINFO_ShowWindow;
  typedef DWORD WINAPI_STARTUPINFO_Flags; //Alias
  typedef struct STARTUPINFO {
    DWORD cb,
    LPTSTR lpReserved,
    LPTSTR lpDesktop,
    LPTSTR lpTitle,
    DWORD dwX,
    DWORD dwY,
    DWORD dwXSize,
    DWORD dwYSize,
    DWORD dwXCountChars,
    DWORD dwYCountChars,
    DWORD dwFillAttribute,
    WINAPI_STARTUPINFO_Flags dwFlags,
    WINAPI_STARTUPINFO_ShowWindow wShowWindow,
    WORD cbReserved2,
    LPBYTE lpReserved2,
    HANDLE hStdInput,
    HANDLE hStdOutput,
    HANDLE hStdError,
  } STARTUPINFO;
  typedef STARTUPINFO *LPSTARTUPINFO; //Pointer
  typedef struct STARTUPINFOW {
    DWORD cb,
    LPWSTR lpReserved,
    LPWSTR lpDesktop,
    LPWSTR lpTitle,
    DWORD dwX,
    DWORD dwY,
    DWORD dwXSize,
    DWORD dwYSize,
    DWORD dwXCountChars,
    DWORD dwYCountChars,
    DWORD dwFillAttribute,
    WINAPI_STARTUPINFO_Flags dwFlags,
    WINAPI_STARTUPINFO_ShowWindow wShowWindow,
    WORD cbReserved2,
    LPBYTE lpReserved2,
    HANDLE hStdInput,
    HANDLE hStdOutput,
    HANDLE hStdError,
  } STARTUPINFOW;
  typedef STARTUPINFOW *LPSTARTUPINFOW; //Pointer
  typedef union FILE_SEGMENT_ELEMENT {
    PVOID64 Buffer,
    ULONGLONG Alignment,
  } FILE_SEGMENT_ELEMENT;
  typedef FILE_SEGMENT_ELEMENT *FILE_SEGMENT_ELEMENT[]; //Pointer
  typedef struct WINAPI_OVERLAPPED_u_s {
    DWORD Offset,
    DWORD OffsetHigh,
  } WINAPI_OVERLAPPED_u_s;
  typedef union WINAPI_OVERLAPPED_u {
    WINAPI_OVERLAPPED_u_s ,
    PVOID Pointer,
  } WINAPI_OVERLAPPED_u;
  typedef struct OVERLAPPED {
    ULONG_PTR Internal,
    ULONG_PTR InternalHigh,
    WINAPI_OVERLAPPED_u ,
    HANDLE hEvent,
  } OVERLAPPED;
  typedef OVERLAPPED *LPOVERLAPPED; //Pointer
  typedef enum WINAPI_ReparsePoint {
    IO_REPARSE_TAG_MOUNT_POINT = 0xA0000003,
    IO_REPARSE_TAG_HSM = 0xC0000004,
    IO_REPARSE_TAG_HSM2 = 0x80000006,
    IO_REPARSE_TAG_SIS = 0x80000007,
    IO_REPARSE_TAG_WIM = 0x80000008,
    IO_REPARSE_TAG_CSV = 0x80000009,
    IO_REPARSE_TAG_DFS = 0x8000000A,
    IO_REPARSE_TAG_SYMLINK = 0xA000000C,
    IO_REPARSE_TAG_DFSR = 0x80000012,
  } WINAPI_ReparsePoint;
  typedef DWORD WINAPI_FileAttributes; //Alias
  typedef struct WIN32_FIND_DATA {
    WINAPI_FileAttributes dwFileAttributes,
    FILETIME ftCreationTime,
    FILETIME ftLastAccessTime,
    FILETIME ftLastWriteTime,
    DWORD nFileSizeHigh,
    DWORD nFileSizeLow,
    WINAPI_ReparsePoint dwReserved0,
    DWORD dwReserved1,
    TCHAR [MAX_PATH] cFileName,
    TCHAR [14] cAlternateFileName,
  } WIN32_FIND_DATA;
  typedef WIN32_FIND_DATA *LPWIN32_FIND_DATA; //Pointer
  typedef struct WIN32_FIND_DATAA {
    WINAPI_FileAttributes dwFileAttributes,
    FILETIME ftCreationTime,
    FILETIME ftLastAccessTime,
    FILETIME ftLastWriteTime,
    DWORD nFileSizeHigh,
    DWORD nFileSizeLow,
    WINAPI_ReparsePoint dwReserved0,
    DWORD dwReserved1,
    CHAR [MAX_PATH] cFileName,
    CHAR [14] cAlternateFileName,
  } WIN32_FIND_DATAA;
  typedef struct WIN32_FIND_DATAW {
    WINAPI_FileAttributes dwFileAttributes,
    FILETIME ftCreationTime,
    FILETIME ftLastAccessTime,
    FILETIME ftLastWriteTime,
    DWORD nFileSizeHigh,
    DWORD nFileSizeLow,
    WINAPI_ReparsePoint dwReserved0,
    DWORD dwReserved1,
    WCHAR [MAX_PATH] cFileName,
    WCHAR [14] cAlternateFileName,
  } WIN32_FIND_DATAW;
  typedef WIN32_FIND_DATAW *WINAPI_WIN32_FIND_DATAW*; //Pointer
  typedef struct TIME_ZONE_INFORMATION {
    LONG Bias,
    WCHAR [32] StandardName,
    SYSTEMTIME StandardDate,
    LONG StandardBias,
    WCHAR [32] DaylightName,
    SYSTEMTIME DaylightDate,
    LONG DaylightBias,
  } TIME_ZONE_INFORMATION;
  typedef TIME_ZONE_INFORMATION *LPTIME_ZONE_INFORMATION; //Pointer
  typedef TIME_ZONE_INFORMATION *WINAPI_TIME_ZONE_INFORMATION*; //Pointer
  typedef struct OFSTRUCT {
    BYTE cBytes,
    BYTE fFixedDisk,
    WORD nErrCode,
    WORD Reserved1,
    WORD Reserved2,
    CHAR [OFS_MAXPATHNAME] szPathName,
  } OFSTRUCT;
  typedef OFSTRUCT *LPOFSTRUCT; //Pointer
  typedef enum WINAPI_PROCESSOR_ARCHITECTURE {
    PROCESSOR_ARCHITECTURE_INTEL = 0,
    PROCESSOR_ARCHITECTURE_IA64 = 6,
    PROCESSOR_ARCHITECTURE_AMD64 = 9,
    PROCESSOR_ARCHITECTURE_UNKNOWN = 0xFFFF,
  } WINAPI_PROCESSOR_ARCHITECTURE;
  typedef DWORD MINIDUMP_TYPE; //Alias
  typedef DWORD THREAD_WRITE_FLAGS; //Alias
  typedef DWORD MODULE_WRITE_FLAGS; //Alias
  typedef enum WINAPI_VirtKeyCode {
    VK_LBUTTON = 0x01,
    VK_RBUTTON = 0x02,
    VK_CANCEL = 0x03,
    VK_MBUTTON = 0x04,
    VK_XBUTTON1 = 0x05,
    VK_XBUTTON2 = 0x06,
    VK_BACK = 0x08,
    VK_TAB = 0x09,
    VK_CLEAR = 0x0C,
    VK_RETURN = 0x0D,
    VK_SHIFT = 0x10,
    VK_CONTROL = 0x11,
    VK_MENU = 0x12,
    VK_PAUSE = 0x13,
    VK_CAPITAL = 0x14,
    VK_KANA = 0x15,
    VK_JUNJA = 0x17,
    VK_FINAL = 0x18,
    VK_KANJI = 0x19,
    VK_ESCAPE = 0x1B,
    VK_CONVERT = 0x1C,
    VK_NONCONVERT = 0x1D,
    VK_ACCEPT = 0x1E,
    VK_MODECHANGE = 0x1F,
    VK_SPACE = 0x20,
    VK_PRIOR = 0x21,
    VK_NEXT = 0x22,
    VK_END = 0x23,
    VK_HOME = 0x24,
    VK_LEFT = 0x25,
    VK_UP = 0x26,
    VK_RIGHT = 0x27,
    VK_DOWN = 0x28,
    VK_SELECT = 0x29,
    VK_PRINT = 0x2A,
    VK_EXECUTE = 0x2B,
    VK_SNAPSHOT = 0x2C,
    VK_INSERT = 0x2D,
    VK_DELETE = 0x2E,
    VK_HELP = 0x2F,
    VK_LWIN = 0x5B,
    VK_RWIN = 0x5C,
    VK_APPS = 0x5D,
    VK_SLEEP = 0x5F,
    VK_NUMPAD0 = 0x60,
    VK_NUMPAD1 = 0x61,
    VK_NUMPAD2 = 0x62,
    VK_NUMPAD3 = 0x63,
    VK_NUMPAD4 = 0x64,
    VK_NUMPAD5 = 0x65,
    VK_NUMPAD6 = 0x66,
    VK_NUMPAD7 = 0x67,
    VK_NUMPAD8 = 0x68,
    VK_NUMPAD9 = 0x69,
    VK_MULTIPLY = 0x6A,
    VK_ADD = 0x6B,
    VK_SEPARATOR = 0x6C,
    VK_SUBTRACT = 0x6D,
    VK_DECIMAL = 0x6E,
    VK_DIVIDE = 0x6F,
    VK_F1 = 0x70,
    VK_F2 = 0x71,
    VK_F3 = 0x72,
    VK_F4 = 0x73,
    VK_F5 = 0x74,
    VK_F6 = 0x75,
    VK_F7 = 0x76,
    VK_F8 = 0x77,
    VK_F9 = 0x78,
    VK_F10 = 0x79,
    VK_F11 = 0x7A,
    VK_F12 = 0x7B,
    VK_F13 = 0x7C,
    VK_F14 = 0x7D,
    VK_F15 = 0x7E,
    VK_F16 = 0x7F,
    VK_F17 = 0x80,
    VK_F18 = 0x81,
    VK_F19 = 0x82,
    VK_F20 = 0x83,
    VK_F21 = 0x84,
    VK_F22 = 0x85,
    VK_F23 = 0x86,
    VK_F24 = 0x87,
    VK_NUMLOCK = 0x90,
    VK_SCROLL = 0x91,
    VK_OEM_NEC_EQUAL = 0x92,
    VK_LSHIFT = 0xA0,
    VK_RSHIFT = 0xA1,
    VK_LCONTROL = 0xA2,
    VK_RCONTROL = 0xA3,
    VK_LMENU = 0xA4,
    VK_RMENU = 0xA5,
    VK_BROWSER_BACK = 0xA6,
    VK_BROWSER_FORWARD = 0xA7,
    VK_BROWSER_REFRESH = 0xA8,
    VK_BROWSER_STOP = 0xA9,
    VK_BROWSER_SEARCH = 0xAA,
    VK_BROWSER_FAVORITES = 0xAB,
    VK_BROWSER_HOME = 0xAC,
    VK_VOLUME_MUTE = 0xAD,
    VK_VOLUME_DOWN = 0xAE,
    VK_VOLUME_UP = 0xAF,
    VK_MEDIA_NEXT_TRACK = 0xB0,
    VK_MEDIA_PREV_TRACK = 0xB1,
    VK_MEDIA_STOP = 0xB2,
    VK_MEDIA_PLAY_PAUSE = 0xB3,
    VK_LAUNCH_MAIL = 0xB4,
    VK_LAUNCH_MEDIA_SELECT = 0xB5,
    VK_LAUNCH_APP1 = 0xB6,
    VK_LAUNCH_APP2 = 0xB7,
    VK_OEM_1 = 0xBA,
    VK_OEM_PLUS = 0xBB,
    VK_OEM_COMMA = 0xBC,
    VK_OEM_MINUS = 0xBD,
    VK_OEM_PERIOD = 0xBE,
    VK_OEM_2 = 0xBF,
    VK_OEM_3 = 0xC0,
    VK_OEM_4 = 0xDB,
    VK_OEM_5 = 0xDC,
    VK_OEM_6 = 0xDD,
    VK_OEM_7 = 0xDE,
    VK_OEM_8 = 0xDF,
    VK_OEM_AX = 0xE1,
    VK_OEM_102 = 0xE2,
    VK_ICO_HELP = 0xE3,
    VK_ICO_00 = 0xE4,
    VK_PROCESSKEY = 0xE5,
    VK_ICO_CLEAR = 0xE6,
    VK_PACKET = 0xE7,
    VK_OEM_RESET = 0xE9,
    VK_OEM_JUMP = 0xEA,
    VK_OEM_PA1 = 0xEB,
    VK_OEM_PA2 = 0xEC,
    VK_OEM_PA3 = 0xED,
    VK_OEM_WSCTRL = 0xEE,
    VK_OEM_CUSEL = 0xEF,
    VK_OEM_ATTN = 0xF0,
    VK_OEM_FINISH = 0xF1,
    VK_OEM_COPY = 0xF2,
    VK_OEM_AUTO = 0xF3,
    VK_OEM_ENLW = 0xF4,
    VK_OEM_BACKTAB = 0xF5,
    VK_ATTN = 0xF6,
    VK_CRSEL = 0xF7,
    VK_EXSEL = 0xF8,
    VK_EREOF = 0xF9,
    VK_PLAY = 0xFA,
    VK_ZOOM = 0xFB,
    VK_NONAME = 0xFC,
    VK_PA1 = 0xFD,
    VK_OEM_CLEAR = 0xFE,
  } WINAPI_VirtKeyCode;
  typedef enum WINAPI_VER_PLATFORM {
    VER_PLATFORM_WIN32s = 0,
    VER_PLATFORM_WIN32_WINDOWS = 1,
    VER_PLATFORM_WIN32_NT = 2,
  } WINAPI_VER_PLATFORM;
  typedef struct OSVERSIONINFO {
    DWORD dwOSVersionInfoSize,
    DWORD dwMajorVersion,
    DWORD dwMinorVersion,
    DWORD dwBuildNumber,
    WINAPI_VER_PLATFORM dwPlatformId,
    TCHAR [128] szCSDVersion,
  } OSVERSIONINFO;
  typedef OSVERSIONINFO *LPOSVERSIONINFO; //Pointer
  typedef struct RTL_OSVERSIONINFOW {
    DWORD dwOSVersionInfoSize,
    DWORD dwMajorVersion,
    DWORD dwMinorVersion,
    DWORD dwBuildNumber,
    WINAPI_VER_PLATFORM dwPlatformId,
    WCHAR [128] szCSDVersion,
  } RTL_OSVERSIONINFOW;
  typedef RTL_OSVERSIONINFOW *PRTL_OSVERSIONINFOW; //Pointer
  typedef WORD WINAPI_VER_SUITE; //Alias
  typedef enum WINAPI_VER_PRODUCT {
    VER_NT_WORKSTATION = 0x0000001,
    VER_NT_DOMAIN_CONTROLLER = 0x0000002,
    VER_NT_SERVER = 0x0000003,
  } WINAPI_VER_PRODUCT;
  typedef struct OSVERSIONINFOEX {
    DWORD dwOSVersionInfoSize,
    DWORD dwMajorVersion,
    DWORD dwMinorVersion,
    DWORD dwBuildNumber,
    DWORD dwPlatformId,
    TCHAR [128] szCSDVersion,
    WORD wServicePackMajor,
    WORD wServicePackMinor,
    WINAPI_VER_SUITE wSuiteMask,
    WINAPI_VER_PRODUCT wProductType,
    BYTE wReserved,
  } OSVERSIONINFOEX;
  typedef OSVERSIONINFOEX *LPOSVERSIONINFOEX; //Pointer
  typedef struct RTL_OSVERSIONINFOEXW {
    DWORD dwOSVersionInfoSize,
    DWORD dwMajorVersion,
    DWORD dwMinorVersion,
    DWORD dwBuildNumber,
    DWORD dwPlatformId,
    WCHAR [128] szCSDVersion,
    WORD wServicePackMajor,
    WORD wServicePackMinor,
    WINAPI_VER_SUITE wSuiteMask,
    WINAPI_VER_PRODUCT wProductType,
    BYTE wReserved,
  } RTL_OSVERSIONINFOEXW;
  typedef RTL_OSVERSIONINFOEXW *PRTL_OSVERSIONINFOEXW; //Pointer
  typedef enum SymTagEnum {
    SymTagNull = 0,
    SymTagExe = 1,
    SymTagCompiland = 2,
    SymTagCompilandDetails = 3,
    SymTagCompilandEnv = 4,
    SymTagFunction = 5,
    SymTagBlock = 6,
    SymTagData = 7,
    SymTagAnnotation = 8,
    SymTagLabel = 9,
    SymTagPublicSymbol = 10,
    SymTagUDT = 11,
    SymTagEnum = 12,
    SymTagFunctionType = 13,
    SymTagPointerType = 14,
    SymTagArrayType = 15,
    SymTagBaseType = 16,
    SymTagTypedef = 17,
    SymTagBaseClass = 18,
    SymTagFriend = 19,
    SymTagFunctionArgType = 20,
    SymTagFuncDebugStart = 21,
    SymTagFuncDebugEnd = 22,
    SymTagUsingNamespace = 23,
    SymTagVTableShape = 24,
    SymTagVTable = 25,
    SymTagCustom = 26,
    SymTagThunk = 27,
    SymTagCustomType = 28,
    SymTagManagedType = 29,
    SymTagDimension = 30,
  } SymTagEnum;
  typedef SymTagEnum WINAPI_SymTagEnum_ULONG; //Alias
  typedef struct IMAGE_DATA_DIRECTORY {
    DWORD VirtualAddress,
    DWORD Size,
  } IMAGE_DATA_DIRECTORY;
  typedef IMAGE_DATA_DIRECTORY IMAGE_DATA_DIRECTORY [IMAGE_NUMBEROF_DIRECTORY_ENTRIES]; //Array 16
  typedef enum WINAPI_IMAGE_OPTIONAL_MAGIC {
    IMAGE_NT_OPTIONAL_HDR32_MAGIC = 0x10b,
    IMAGE_NT_OPTIONAL_HDR64_MAGIC = 0x20b,
    IMAGE_ROM_OPTIONAL_HDR_MAGIC = 0x107,
  } WINAPI_IMAGE_OPTIONAL_MAGIC;
  typedef enum WINAPI_IMAGE_SUBSYSTEM {
    IMAGE_SUBSYSTEM_UNKNOWN = 0,
    IMAGE_SUBSYSTEM_NATIVE = 1,
    IMAGE_SUBSYSTEM_WINDOWS_GUI = 2,
    IMAGE_SUBSYSTEM_WINDOWS_CUI = 3,
    IMAGE_SUBSYSTEM_OS2_CUI = 5,
    IMAGE_SUBSYSTEM_POSIX_CUI = 7,
    IMAGE_SUBSYSTEM_NATIVE_WINDOWS = 8,
    IMAGE_SUBSYSTEM_WINDOWS_CE_GUI = 9,
    IMAGE_SUBSYSTEM_EFI_APPLICATION = 10,
    IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER = 11,
    IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER = 12,
    IMAGE_SUBSYSTEM_EFI_ROM = 13,
    IMAGE_SUBSYSTEM_XBOX = 14,
    IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION = 16,
  } WINAPI_IMAGE_SUBSYSTEM;
  typedef WORD WINAPI_IMAGE_DLLCHARACTERISTICS; //Alias
  typedef enum WINAPI_IMAGE_FILE_MACHINE {
    IMAGE_FILE_MACHINE_UNKNOWN = 0,
    IMAGE_FILE_MACHINE_I386 = 0x014c,
    IMAGE_FILE_MACHINE_IA64 = 0x0200,
    IMAGE_FILE_MACHINE_AMD64 = 0x8664,
  } WINAPI_IMAGE_FILE_MACHINE;
  typedef WORD WINAPI_IMAGE_FILE_CHARACTERISTICS; //Alias
  typedef struct IMAGE_FILE_HEADER {
    WINAPI_IMAGE_FILE_MACHINE Machine,
    WORD NumberOfSections,
    DWORD TimeDateStamp,
    DWORD PointerToSymbolTable,
    DWORD NumberOfSymbols,
    WORD SizeOfOptionalHeader,
    WINAPI_IMAGE_FILE_CHARACTERISTICS Characteristics,
  } IMAGE_FILE_HEADER;
  typedef struct IMAGE_OPTIONAL_HEADER64 {
    WINAPI_IMAGE_OPTIONAL_MAGIC Magic,
    BYTE MajorLinkerVersion,
    BYTE MinorLinkerVersion,
    DWORD SizeOfCode,
    DWORD SizeOfInitializedData,
    DWORD SizeOfUninitializedData,
    DWORD AddressOfEntryPoint,
    DWORD BaseOfCode,
    ULONGLONG ImageBase,
    DWORD SectionAlignment,
    DWORD FileAlignment,
    WORD MajorOperatingSystemVersion,
    WORD MinorOperatingSystemVersion,
    WORD MajorImageVersion,
    WORD MinorImageVersion,
    WORD MajorSubsystemVersion,
    WORD MinorSubsystemVersion,
    DWORD Win32VersionValue,
    DWORD SizeOfImage,
    DWORD SizeOfHeaders,
    DWORD CheckSum,
    WINAPI_IMAGE_SUBSYSTEM Subsystem,
    WINAPI_IMAGE_DLLCHARACTERISTICS DllCharacteristics,
    ULONGLONG SizeOfStackReserve,
    ULONGLONG SizeOfStackCommit,
    ULONGLONG SizeOfHeapReserve,
    ULONGLONG SizeOfHeapCommit,
    DWORD LoaderFlags,
    DWORD NumberOfRvaAndSizes,
    IMAGE_DATA_DIRECTORY [IMAGE_NUMBEROF_DIRECTORY_ENTRIES] DataDirectory,
  } IMAGE_OPTIONAL_HEADER64;
  typedef struct IMAGE_NT_HEADERS {
    DWORD Signature,
    IMAGE_FILE_HEADER FileHeader,
    IMAGE_OPTIONAL_HEADER OptionalHeader,
  } IMAGE_NT_HEADERS;
  typedef IMAGE_NT_HEADERS *PIMAGE_NT_HEADERS; //Pointer
  typedef struct NUMBERFMT {
    UINT NumDigits,
    UINT LeadingZero,
    UINT Grouping,
    LPTSTR lpDecimalSep,
    LPTSTR lpThousandSep,
    UINT NegativeOrder,
  } NUMBERFMT;
  typedef NUMBERFMT *WINAPI_NUMBERFMT*; //Pointer
  typedef enum WINAPI_DwmWindowAttr {
    DWMWA_NCRENDERING_ENABLED = 1,
    DWMWA_NCRENDERING_POLICY = 2,
    DWMWA_TRANSITIONS_FORCEDISABLED = 3,
    DWMWA_ALLOW_NCPAINT = 4,
    DWMWA_CAPTION_BUTTON_BOUNDS = 5,
    DWMWA_NONCLIENT_RTL_LAYOUT = 6,
    DWMWA_FORCE_ICONIC_REPRESENTATION = 7,
    DWMWA_FLIP3D_POLICY = 8,
    DWMWA_EXTENDED_FRAME_BOUNDS = 9,
    DWMWA_HAS_ICONIC_BITMAP = 10,
    DWMWA_DISALLOW_PEEK = 11,
    DWMWA_EXCLUDED_FROM_PEEK = 12,
  } WINAPI_DwmWindowAttr;
  typedef DWORD WINAPI_FILE_NOTIFY_CHANGE_FLAGS; //Alias
  typedef enum WINAPI_SEEK_TYPE {
    SEEK_CUR = 1,
    SEEK_END = 2,
    SEEK_SET = 0,
  } WINAPI_SEEK_TYPE;
  typedef DWORD WINAPI_LocaleMappingFlags; //Alias
  typedef DWORD WINAPI_ACTCTX_FLAG; //Alias
  typedef struct ACTCTX {
    ULONG cbSize,
    WINAPI_ACTCTX_FLAG dwFlags,
    LPCTSTR lpSource,
    WINAPI_PROCESSOR_ARCHITECTURE wProcessorArchitecture,
    LANGID wLangId,
    LPCTSTR lpAssemblyDirectory,
    LPCTSTR lpResourceName,
    LPCTSTR lpApplicationName,
    HMODULE hModule,
  } ACTCTX;
  typedef ACTCTX *PACTCTX; //Pointer
  typedef DWORD WINAPI_HEAP_FLAGS; //Alias
  typedef WINAPI_HEAP_FLAGS WINAPI_HEAP_FLAGS_ULONG; //Alias
  typedef ULONG WINAPI_IMAGE_FILE_CHARACTERISTICS_ULONG; //Alias
  typedef DWORD WINAPI_FIND_ACTCTX_SECTION_FLAGS; //Alias
  typedef enum WINAPI_ACTIVATION_CONTEXT_SECTION {
    ACTIVATION_CONTEXT_SECTION_ASSEMBLY_INFORMATION = 1,
    ACTIVATION_CONTEXT_SECTION_DLL_REDIRECTION = 2,
    ACTIVATION_CONTEXT_SECTION_WINDOW_CLASS_REDIRECTION = 3,
    ACTIVATION_CONTEXT_SECTION_COM_SERVER_REDIRECTION = 4,
    ACTIVATION_CONTEXT_SECTION_COM_INTERFACE_REDIRECTION = 5,
    ACTIVATION_CONTEXT_SECTION_COM_TYPE_LIBRARY_REDIRECTION = 6,
    ACTIVATION_CONTEXT_SECTION_COM_PROGID_REDIRECTION = 7,
    ACTIVATION_CONTEXT_SECTION_GLOBAL_OBJECT_RENAME_TABLE = 8,
    ACTIVATION_CONTEXT_SECTION_CLR_SURROGATES = 9,
    ACTIVATION_CONTEXT_SECTION_APPLICATION_SETTINGS = 10,
  } WINAPI_ACTIVATION_CONTEXT_SECTION;
  typedef enum WINAPI_WAIT_RESULT {
    WAIT_OBJECT_0 = 0x00000000,
    WAIT_OBJECT_1 = 0x00000001,
    WAIT_OBJECT_2 = 0x00000002,
    WAIT_OBJECT_3 = 0x00000003,
    WAIT_OBJECT_4 = 0x00000004,
    WAIT_OBJECT_5 = 0x00000005,
    WAIT_ABANDONED_0 = 0x00000080,
    WAIT_ABANDONED_1 = 0x00000081,
    WAIT_ABANDONED_2 = 0x00000082,
    WAIT_ABANDONED_3 = 0x00000083,
    WAIT_ABANDONED_4 = 0x00000084,
    WAIT_ABANDONED_5 = 0x00000085,
    WAIT_IO_COMPLETION = 0x000000C0,
    WAIT_TIMEOUT = 258,
    WAIT_FAILED = 0xFFFFFFFF,
  } WINAPI_WAIT_RESULT;
  typedef struct PROCESSOR_NUMBER {
    WORD Group,
    BYTE Number,
    BYTE Reserved,
  } PROCESSOR_NUMBER;
  typedef PROCESSOR_NUMBER *PPROCESSOR_NUMBER; //Pointer
]]

require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef HANDLE HREPORT; //Alias
  enum { WER_MAX_PREFERRED_MODULES_BUFFER = 256 };
  typedef DWORD WINAPI_WER_DUMP_MASK; //Alias
  typedef struct WER_DUMP_CUSTOM_OPTIONS {
    DWORD dwSize;
    WINAPI_WER_DUMP_MASK dwMask;
    MINIDUMP_TYPE dwDumpFlags;
    BOOL bOnlyThisThread;
    THREAD_WRITE_FLAGS dwExceptionThreadFlags;
    THREAD_WRITE_FLAGS dwOtherThreadFlags;
    THREAD_WRITE_FLAGS dwExceptionThreadExFlags;
    THREAD_WRITE_FLAGS dwOtherThreadExFlags;
    MODULE_WRITE_FLAGS dwPreferredModuleFlags;
    MODULE_WRITE_FLAGS dwOtherModuleFlags;
    WCHAR wzPreferredModuleList[WER_MAX_PREFERRED_MODULES_BUFFER];
  } WER_DUMP_CUSTOM_OPTIONS;
  typedef WER_DUMP_CUSTOM_OPTIONS *PWER_DUMP_CUSTOM_OPTIONS; //Pointer
  typedef struct WER_REPORT_INFORMATION {
    DWORD dwSize;
    HANDLE hProcess;
    WCHAR wzConsentKey[64];
    WCHAR wzFriendlyEventName[128];
    WCHAR wzApplicationName[128];
    WCHAR wzApplicationPath[MAX_PATH];
    WCHAR wzDescription[512];
    HWND hwndParent;
  } WER_REPORT_INFORMATION;
  typedef WER_REPORT_INFORMATION *PWER_REPORT_INFORMATION; //Pointer
  typedef struct WER_EXCEPTION_INFORMATION {
    PEXCEPTION_POINTERS pExceptionPointers;
    BOOL bClientPointers;
  } WER_EXCEPTION_INFORMATION;
  typedef WER_EXCEPTION_INFORMATION *PWER_EXCEPTION_INFORMATION; //Pointer
  typedef UINT WER_DUMP_TYPE; //Alias
  static const UINT WerDumpTypeMicroDump = 1;
  static const UINT WerDumpTypeMiniDump = 2;
  static const UINT WerDumpTypeHeapDump = 3;
  static const UINT WerDumpTypeMax = 4;
  typedef UINT WER_FILE_TYPE; //Alias
  static const UINT WerFileTypeMicrodump = 1;
  static const UINT WerFileTypeMinidump = 2;
  static const UINT WerFileTypeHeapdump = 3;
  static const UINT WerFileTypeUserDocument = 4;
  static const UINT WerFileTypeOther = 5;
  typedef UINT WER_REPORT_TYPE; //Alias
  static const UINT WerReportNonCritical = 0;
  static const UINT WerReportCritical = 1;
  static const UINT WerReportApplicationCrash = 2;
  static const UINT WerReportApplicationHang = 3;
  static const UINT WerReportKernel = 4;
  typedef UINT WER_REPORT_UI; //Alias
  static const UINT WerUIAdditionalDataDlgHeader = 1;
  static const UINT WerUIIconFilePath = 2;
  static const UINT WerUIConsentDlgHeader = 3;
  static const UINT WerUIConsentDlgBody = 4;
  static const UINT WerUIOnlineSolutionCheckText = 5;
  static const UINT WerUIOfflineSolutionCheckText = 6;
  static const UINT WerUICloseText = 7;
  static const UINT WerUICloseDlgHeader = 8;
  static const UINT WerUICloseDlgBody = 9;
  static const UINT WerUICloseDlgButtonText = 10;
  typedef UINT WER_CONSENT; //Alias
  static const UINT WerConsentNotAsked = 1;
  static const UINT WerConsentApproved = 2;
  static const UINT WerConsentDenied = 3;
  typedef UINT WER_SUBMIT_RESULT; //Alias
  static const UINT WerReportQueued = 1;
  static const UINT WerReportUploaded = 2;
  static const UINT WerReportDebug = 3;
  static const UINT WerReportFailed = 4;
  static const UINT WerDisabled = 5;
  static const UINT WerReportCancelled = 6;
  static const UINT WerDisabledQueue = 7;
  static const UINT WerReportAsync = 8;
  typedef WER_SUBMIT_RESULT *PWER_SUBMIT_RESULT; //Pointer
  HRESULT WerAddExcludedApplication(    PCWSTR pwzExeName, BOOL bAllUsers);
  HRESULT WerRemoveExcludedApplication( PCWSTR pwzExeName, BOOL bAllUsers);
  HRESULT WerReportAddDump(             HREPORT hReportHandle, WINAPI_ProcessHandle hProcess, WINAPI_ThreadHandle hThread, WER_DUMP_TYPE dumpType, PWER_EXCEPTION_INFORMATION pExceptionParam, PWER_DUMP_CUSTOM_OPTIONS pDumpCustomOptions, DWORD dwFlags);
  HRESULT WerReportAddFile(             HREPORT hReportHandle, PCWSTR pwzPath, WER_FILE_TYPE repFileType, DWORD dwFileFlags);
  HRESULT WerReportCloseHandle(         HREPORT hReportHandle);
  HRESULT WerReportCreate(              PCWSTR pwzEventType, WER_REPORT_TYPE repType, PWER_REPORT_INFORMATION pReportInformation, HREPORT* phReportHandle);
  HRESULT WerReportSetParameter(        HREPORT hReportHandle, DWORD dwparamID, PCWSTR pwzName, PCWSTR pwzValue);
  HRESULT WerReportSetUIOption(         HREPORT hReportHandle, WER_REPORT_UI repUITypeID, PCWSTR pwzValue);
  HRESULT WerReportSubmit(              HREPORT hReportHandle, WER_CONSENT consent, DWORD dwFlags, PWER_SUBMIT_RESULT pSubmitResult);
]]
return ffi.load( 'Wer.dll' )

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
  static const WER_DUMP_TYPE WerDumpTypeMicroDump = 1;
  static const WER_DUMP_TYPE WerDumpTypeMiniDump = 2;
  static const WER_DUMP_TYPE WerDumpTypeHeapDump = 3;
  static const WER_DUMP_TYPE WerDumpTypeMax = 4;
  typedef UINT WER_FILE_TYPE; //Alias
  static const WER_FILE_TYPE WerFileTypeMicrodump = 1;
  static const WER_FILE_TYPE WerFileTypeMinidump = 2;
  static const WER_FILE_TYPE WerFileTypeHeapdump = 3;
  static const WER_FILE_TYPE WerFileTypeUserDocument = 4;
  static const WER_FILE_TYPE WerFileTypeOther = 5;
  typedef UINT WER_REPORT_TYPE; //Alias
  static const WER_REPORT_TYPE WerReportNonCritical = 0;
  static const WER_REPORT_TYPE WerReportCritical = 1;
  static const WER_REPORT_TYPE WerReportApplicationCrash = 2;
  static const WER_REPORT_TYPE WerReportApplicationHang = 3;
  static const WER_REPORT_TYPE WerReportKernel = 4;
  typedef UINT WER_REPORT_UI; //Alias
  static const WER_REPORT_UI WerUIAdditionalDataDlgHeader = 1;
  static const WER_REPORT_UI WerUIIconFilePath = 2;
  static const WER_REPORT_UI WerUIConsentDlgHeader = 3;
  static const WER_REPORT_UI WerUIConsentDlgBody = 4;
  static const WER_REPORT_UI WerUIOnlineSolutionCheckText = 5;
  static const WER_REPORT_UI WerUIOfflineSolutionCheckText = 6;
  static const WER_REPORT_UI WerUICloseText = 7;
  static const WER_REPORT_UI WerUICloseDlgHeader = 8;
  static const WER_REPORT_UI WerUICloseDlgBody = 9;
  static const WER_REPORT_UI WerUICloseDlgButtonText = 10;
  typedef UINT WER_CONSENT; //Alias
  static const WER_CONSENT WerConsentNotAsked = 1;
  static const WER_CONSENT WerConsentApproved = 2;
  static const WER_CONSENT WerConsentDenied = 3;
  typedef UINT WER_SUBMIT_RESULT; //Alias
  static const WER_SUBMIT_RESULT WerReportQueued = 1;
  static const WER_SUBMIT_RESULT WerReportUploaded = 2;
  static const WER_SUBMIT_RESULT WerReportDebug = 3;
  static const WER_SUBMIT_RESULT WerReportFailed = 4;
  static const WER_SUBMIT_RESULT WerDisabled = 5;
  static const WER_SUBMIT_RESULT WerReportCancelled = 6;
  static const WER_SUBMIT_RESULT WerDisabledQueue = 7;
  static const WER_SUBMIT_RESULT WerReportAsync = 8;
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

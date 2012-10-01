require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
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
return ffi.load( "Wer.dll" )

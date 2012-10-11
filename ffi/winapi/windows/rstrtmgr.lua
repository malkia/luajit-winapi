require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID RM_WRITE_STATUS_CALLBACK; //Alias
  typedef struct RM_UNIQUE_PROCESS {
    DWORD dwProcessId;
    FILETIME ProcessStartTime;
  } RM_UNIQUE_PROCESS;
  typedef UINT RM_FILTER_ACTION; //Alias
  static const RM_FILTER_ACTION RmInvalidFilterAction = 0;
  static const RM_FILTER_ACTION RmNoRestart = 1;
  static const RM_FILTER_ACTION RmNoShutdown = 2;
  DWORD RmAddFilter(         DWORD dwSessionHandle, LPCWSTR strFilename, RM_UNIQUE_PROCESS* Application, LPCWSTR strShortServiceName, RM_FILTER_ACTION ActionType);
  DWORD RmStartSession(      DWORD* pSessionHandle, DWORD dwSessionFlags);
  DWORD RmJoinSession(       DWORD* pSessionHandle);
  DWORD RmEndSession(        DWORD dwSessionHandle);
  DWORD RmRegisterResources( DWORD dwSessionHandle, UINT nFiles, UINT nApplications, UINT nServices);
  DWORD RmGetList(           DWORD dwSessionHandle, UINT* pnProcInfoNeeded, UINT* pnProcInfo, LPDWORD lpdwRebootReasons);
  DWORD RmGetFilterList(     DWORD dwSessionHandle, PBYTE pbFilterBuf, DWORD cbFilterBuf, LPDWORD cbFilterBufNeeded);
  DWORD RmShutdown(          DWORD dwSessionHandle, ULONG lActionFlags, RM_WRITE_STATUS_CALLBACK fnStatus);
  DWORD RmRemoveFilter(      DWORD dwSessionHandle, LPCWSTR strFilename, RM_UNIQUE_PROCESS* Application, LPCWSTR strShortServiceName);
  DWORD RmRestart(           DWORD dwSessionHandle, DWORD dwRestartFlags, RM_WRITE_STATUS_CALLBACK fnStatus);
  DWORD RmCancelCurrentTask( DWORD dwSessionHandle);
]]
return ffi.load( 'Rstrtmgr.dll' )

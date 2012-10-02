require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
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

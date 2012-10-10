require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/processes' )
local ffi = require( 'ffi' )
ffi.cdef [[
  BOOL  EmptyWorkingSet(             ProcessHandle hProcess);
  BOOL  EnumDeviceDrivers(           LPVOID* lpImageBase, DWORD cb, LPDWORD lpcbNeeded);
  BOOL  EnumPageFiles(               PENUM_PAGE_CALLBACK pCallbackRoutine, LPVOID lpContext);
  BOOL  EnumProcesses(               DWORD* pProcessIds, DWORD cb, DWORD* pBytesReturned);
  BOOL  EnumProcessModules(          ProcessHandle hProcess, HMODULE* lphModule, DWORD cb, LPDWORD lpcbNeeded);
  BOOL  EnumProcessModulesEx(        ProcessHandle hProcess, HMODULE* lphModule, DWORD cb, LPDWORD lpcbNeeded, DWORD dwFilterFlag);
  DWORD GetDeviceDriverBaseName(     LPVOID ImageBase, LPTSTR lpBaseName, DWORD nSize);
  DWORD GetDeviceDriverFileName(     LPVOID ImageBase, LPTSTR lpFilename, DWORD nSize);
  DWORD GetMappedFileName(           ProcessHandle hProcess, LPVOID lpv, LPTSTR lpFilename, DWORD nSize);
  DWORD GetModuleBaseName(           ProcessHandle hProcess, HMODULE hModule, LPTSTR lpBaseName, DWORD nSize);
  DWORD GetModuleFileNameEx(         ProcessHandle hProcess, HMODULE hModule, LPTSTR lpFilename, DWORD nSize);
  BOOL  GetModuleInformation(        ProcessHandle hProcess, HMODULE hModule, LPMODULEINFO lpmodinfo, DWORD cb);
  BOOL  GetPerformanceInfo(          PPERFORMANCE_INFORMATION pPerformanceInformation, DWORD cb);
  DWORD GetProcessImageFileName(     ProcessHandle hProcess, LPTSTR lpImageFileName, DWORD nSize);
  BOOL  GetProcessMemoryInfo(        HANDLE Process, PPROCESS_MEMORY_COUNTERS ppsmemCounters, DWORD cb);
  BOOL  GetWsChanges(                ProcessHandle hProcess, PPSAPI_WS_WATCH_INFORMATION lpWatchInfo, DWORD cb);
  BOOL  GetWsChangesEx(              ProcessHandle hProcess, PPSAPI_WS_WATCH_INFORMATION_EX lpWatchInfoEx, DWORD cb);
  BOOL  InitializeProcessForWsWatch( ProcessHandle hProcess);
  BOOL  QueryWorkingSet(             ProcessHandle hProcess, PVOID pv, DWORD cb);
  BOOL  QueryWorkingSetEx(           ProcessHandle hProcess, PVOID pv, DWORD cb);
]]
ffi.load( 'Psapi.dll' )

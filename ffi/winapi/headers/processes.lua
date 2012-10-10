require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PENUM_PAGE_CALLBACK; //Alias
  typedef struct MODULEINFO {
    LPVOID lpBaseOfDll;
    DWORD SizeOfImage;
    LPVOID EntryPoint;
  } MODULEINFO;
  typedef MODULEINFO *LPMODULEINFO; //Pointer
  typedef struct PERFORMANCE_INFORMATION {
    DWORD cb;
    SIZE_T CommitTotal;
    SIZE_T CommitLimit;
    SIZE_T CommitPeak;
    SIZE_T PhysicalTotal;
    SIZE_T PhysicalAvailable;
    SIZE_T SystemCache;
    SIZE_T KernelTotal;
    SIZE_T KernelPaged;
    SIZE_T KernelNonpaged;
    SIZE_T PageSize;
    DWORD HandleCount;
    DWORD ProcessCount;
    DWORD ThreadCount;
  } PERFORMANCE_INFORMATION;
  typedef PERFORMANCE_INFORMATION *PPERFORMANCE_INFORMATION; //Pointer
  typedef struct PROCESS_MEMORY_COUNTERS {
    DWORD cb;
    DWORD PageFaultCount;
    SIZE_T PeakWorkingSetSize;
    SIZE_T WorkingSetSize;
    SIZE_T QuotaPeakPagedPoolUsage;
    SIZE_T QuotaPagedPoolUsage;
    SIZE_T QuotaPeakNonPagedPoolUsage;
    SIZE_T QuotaNonPagedPoolUsage;
    SIZE_T PagefileUsage;
    SIZE_T PeakPagefileUsage;
  } PROCESS_MEMORY_COUNTERS;
  typedef PROCESS_MEMORY_COUNTERS *PPROCESS_MEMORY_COUNTERS; //Pointer
  typedef struct PSAPI_WS_WATCH_INFORMATION {
    LPVOID FaultingPc;
    LPVOID FaultingVa;
  } PSAPI_WS_WATCH_INFORMATION;
  typedef PSAPI_WS_WATCH_INFORMATION *PPSAPI_WS_WATCH_INFORMATION; //Pointer
  typedef struct PSAPI_WS_WATCH_INFORMATION_EX {
    PSAPI_WS_WATCH_INFORMATION BasicInfo;
    ULONG_PTR FaultingThreadId;
    ULONG_PTR Flags;
  } PSAPI_WS_WATCH_INFORMATION_EX;
  typedef PSAPI_WS_WATCH_INFORMATION_EX *PPSAPI_WS_WATCH_INFORMATION_EX; //Pointer
  typedef DWORD CreateProcessFlags; //Alias
]]

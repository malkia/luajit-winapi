require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  typedef DWORD WINAPI_DiDriverType;
  typedef struct SP_DRVINFO_DATA {
    DWORD cbSize,
    WINAPI_DiDriverType DriverType,
    ULONG_PTR Reserved,
    TCHAR [LINE_LEN] Description,
    TCHAR [LINE_LEN] MfgName,
    TCHAR [LINE_LEN] ProviderName,
    FILETIME DriverDate,
    DWORDLONG DriverVersion,
  } SP_DRVINFO_DATA;

  typedef SP_DRVINFO_DATA PSP_DRVINFO_DATA;
]]

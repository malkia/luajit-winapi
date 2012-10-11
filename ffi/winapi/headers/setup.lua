require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  enum { LINE_LEN = 256 };
  typedef DWORD DiDriverType; //Alias
  typedef struct SP_DRVINFO_DATA {
    DWORD cbSize;
    DiDriverType DriverType;
    ULONG_PTR Reserved;
    TCHAR Description[LINE_LEN];
    TCHAR MfgName[LINE_LEN];
    TCHAR ProviderName[LINE_LEN];
    FILETIME DriverDate;
    DWORDLONG DriverVersion;
  } SP_DRVINFO_DATA;
  typedef SP_DRVINFO_DATA *PSP_DRVINFO_DATA; //Pointer
]]

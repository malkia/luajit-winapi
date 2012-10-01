require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  typedef enum HKEY {
    HKEY_CLASSES_ROOT = _2147483648,
    HKEY_CURRENT_USER = _2147483647,
    HKEY_LOCAL_MACHINE = _2147483646,
    HKEY_USERS = _2147483645,
    HKEY_PERFORMANCE_DATA = _2147483644,
    HKEY_PERFORMANCE_TEXT = _2147483568,
    HKEY_PERFORMANCE_NLSTEXT = _2147483552,
    HKEY_CURRENT_CONFIG = _2147483643,
    HKEY_DYN_DATA = _2147483642,
  } HKEY;
  typedef HKEY* PHKEY;
  typedef HKEY* HKEY*;
  typedef DWORD REGSAM;
  typedef enum WINAPI_RegType {
    REG_NONE = 0,
    REG_SZ = 1,
    REG_EXPAND_SZ = 2,
    REG_BINARY = 3,
    REG_DWORD = 4,
    REG_DWORD_BIG_ENDIAN = 5,
    REG_LINK = 6,
    REG_MULTI_SZ = 7,
    REG_RESOURCE_LIST = 8,
    REG_FULL_RESOURCE_DESCRIPTOR = 9,
    REG_RESOURCE_REQUIREMENTS_LIST = 10,
    REG_QWORD = 11,
  } WINAPI_RegType;
  typedef WINAPI_RegType WINAPI_RegType_ULONG;
  typedef WINAPI_RegType_ULONG WINAPI_RegType_PULONG;
  typedef DWORD WINAPI_RegOptions;
  typedef DWORD WINAPI_RegDisposition;
  typedef WINAPI_RegDisposition WINAPI_RegDisposition_ULONG;
  typedef WINAPI_RegDisposition_ULONG WINAPI_RegDisposition_PULONG;
  typedef DWORD WINAPI_RegMuiFlags;
  typedef DWORD WINAPI_RegNotifyFlags;
]]

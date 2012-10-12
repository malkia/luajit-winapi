require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef HANDLE HKEY; //Alias
  static const HKEY HKEY_CLASSES_ROOT = -2147483648;
  static const HKEY HKEY_CURRENT_USER = -2147483647;
  static const HKEY HKEY_LOCAL_MACHINE = -2147483646;
  static const HKEY HKEY_USERS = -2147483645;
  static const HKEY HKEY_PERFORMANCE_DATA = -2147483644;
  static const HKEY HKEY_PERFORMANCE_TEXT = -2147483568;
  static const HKEY HKEY_PERFORMANCE_NLSTEXT = -2147483552;
  static const HKEY HKEY_CURRENT_CONFIG = -2147483643;
  static const HKEY HKEY_DYN_DATA = -2147483642;
  typedef HKEY* PHKEY; //Alias
//typedef HKEY* HKEY*; //Alias
  typedef DWORD REGSAM; //Alias
  typedef DWORD WINAPI_RegType; //Alias
  static const WINAPI_RegType REG_NONE = 0;
  static const WINAPI_RegType REG_SZ = 1;
  static const WINAPI_RegType REG_EXPAND_SZ = 2;
  static const WINAPI_RegType REG_BINARY = 3;
  static const WINAPI_RegType REG_DWORD = 4;
  static const WINAPI_RegType REG_DWORD_BIG_ENDIAN = 5;
  static const WINAPI_RegType REG_LINK = 6;
  static const WINAPI_RegType REG_MULTI_SZ = 7;
  static const WINAPI_RegType REG_RESOURCE_LIST = 8;
  static const WINAPI_RegType REG_FULL_RESOURCE_DESCRIPTOR = 9;
  static const WINAPI_RegType REG_RESOURCE_REQUIREMENTS_LIST = 10;
  static const WINAPI_RegType REG_QWORD = 11;
  typedef WINAPI_RegType WINAPI_RegType_ULONG; //Alias
  typedef WINAPI_RegType_ULONG *WINAPI_RegType_PULONG; //Pointer
  typedef DWORD WINAPI_RegOptions; //Alias
  typedef DWORD WINAPI_RegDisposition; //Alias
  typedef WINAPI_RegDisposition WINAPI_RegDisposition_ULONG; //Alias
  typedef WINAPI_RegDisposition_ULONG *WINAPI_RegDisposition_PULONG; //Pointer
  typedef DWORD WINAPI_RegMuiFlags; //Alias
  typedef DWORD WINAPI_RegNotifyFlags; //Alias
]]

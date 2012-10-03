require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef short RETCODE; //Alias
  typedef WORD WINAPI_ODBC_DSN_REQUEST; //Alias
  static const WORD ODBC_ADD_DSN = 1;
  static const WORD ODBC_CONFIG_DSN = 2;
  static const WORD ODBC_REMOVE_DSN = 3;
  static const WORD ODBC_ADD_SYS_DSN = 4;
  static const WORD ODBC_CONFIG_SYS_DSN = 5;
  static const WORD ODBC_REMOVE_SYS_DSN = 6;
  static const WORD ODBC_REMOVE_DEFAULT_DSN = 7;
  typedef WORD WINAPI_ODBC_DRIVER_REQUEST; //Alias
  static const WORD ODBC_INSTALL_DRIVER = 1;
  static const WORD ODBC_REMOVE_DRIVER = 2;
  static const WORD ODBC_CONFIG_DRIVER = 3;
  typedef WORD WINAPI_ODBC_INSTALL_REQUEST; //Alias
  static const WORD ODBC_INSTALL_INQUIRY = 1;
  static const WORD ODBC_INSTALL_COMPLETE = 2;
  typedef USHORT WINAPI_ODBC_CONFIG_MODE; //Alias
  static const USHORT ODBC_BOTH_DSN = 0;
  static const USHORT ODBC_USER_DSN = 1;
  static const USHORT ODBC_SYSTEM_DSN = 2;
  typedef DWORD WINAPI_ODBC_ERROR_CODE; //Alias
  static const DWORD ODBC_ERROR_GENERAL_ERR = 1;
  static const DWORD ODBC_ERROR_INVALID_BUFF_LEN = 2;
  static const DWORD ODBC_ERROR_INVALID_HWND = 3;
  static const DWORD ODBC_ERROR_INVALID_STR = 4;
  static const DWORD ODBC_ERROR_INVALID_REQUEST_TYPE = 5;
  static const DWORD ODBC_ERROR_COMPONENT_NOT_FOUND = 6;
  static const DWORD ODBC_ERROR_INVALID_NAME = 7;
  static const DWORD ODBC_ERROR_INVALID_KEYWORD_VALUE = 8;
  static const DWORD ODBC_ERROR_INVALID_DSN = 9;
  static const DWORD ODBC_ERROR_INVALID_INF = 10;
  static const DWORD ODBC_ERROR_REQUEST_FAILED = 11;
  static const DWORD ODBC_ERROR_INVALID_PATH = 12;
  static const DWORD ODBC_ERROR_LOAD_LIB_FAILED = 13;
  static const DWORD ODBC_ERROR_INVALID_PARAM_SEQUENCE = 14;
  static const DWORD ODBC_ERROR_INVALID_LOG_FILE = 15;
  static const DWORD ODBC_ERROR_USER_CANCELED = 16;
  static const DWORD ODBC_ERROR_USAGE_UPDATE_FAILED = 17;
  static const DWORD ODBC_ERROR_CREATE_DSN_FAILED = 18;
  static const DWORD ODBC_ERROR_WRITING_SYSINFO_FAILED = 19;
  static const DWORD ODBC_ERROR_REMOVE_DSN_FAILED = 20;
  static const DWORD ODBC_ERROR_OUT_OF_MEM = 21;
  static const DWORD ODBC_ERROR_OUTPUT_STRING_TRUNCATED = 22;
  static const DWORD ODBC_ERROR_NOTRANINFO = 23;
]]

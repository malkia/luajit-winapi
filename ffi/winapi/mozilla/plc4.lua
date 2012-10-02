require( 'ffi/winapi/mozilla/nspr' )
local ffi = require( 'ffi' )
ffi.cdef [[
  PRUint32 PL_strlen(  WINAPI_char* str);
  char*    PL_strcpy(  char* dest, WINAPI_char* src);
  char*    PL_strdup(  WINAPI_char* s);
  void     PL_strfree( char* s);
]]
return ffi.load( 'plc4.dll' )

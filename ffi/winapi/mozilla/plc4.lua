require( 'ffi/winapi/mozilla/nspr' )
local ffi = require( 'ffi' )
ffi.cdef [[
  PRUint32 PL_strlen(  char* str);
  char*    PL_strcpy(  char* dest, char* src);
  char*    PL_strdup(  char* s);
  void     PL_strfree( char* s);
]]
ffi.load( 'plc4.dll' )

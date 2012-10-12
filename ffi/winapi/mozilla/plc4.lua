require( 'ffi/winapi/mozilla/nspr' )
local ffi = require( 'ffi' )
ffi.cdef [[
  PRUint32 PL_strlen(  const char* str);
  char*    PL_strcpy(  char* dest, const char* src);
  char*    PL_strdup(  const char* s);
  void     PL_strfree( char* s);
]]
return ffi.load( 'plc4.dll' )

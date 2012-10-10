require( 'ffi/winapi/mozilla/nspr' )
local ffi = require( 'ffi' )
ffi.cdef [[
  SECStatus NSS_Init(          char* configdir);
  SECStatus NSS_InitReadWrite( char* configdir);
  SECStatus NSS_NoDB_Init(     char* reserved);
  SECStatus NSS_Shutdown(      );
]]
ffi.load( 'nss3.dll' )

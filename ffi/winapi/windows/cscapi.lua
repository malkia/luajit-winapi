require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  NTSTATUS   CscSearchApiGetInterface( ULONG Version, ULONG Cookie, CCscSearchApiInterface** Interface);
  ERROR_CODE OfflineFilesEnable(       BOOL bEnable, BOOL* pbRebootRequired);
  ERROR_CODE OfflineFilesQueryStatus(  BOOL* pbActive, BOOL* pbEnabled);
]]
ffi.load( 'cscapi.dll' )

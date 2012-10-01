require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  NTSTATUS          CscSearchApiGetInterface( ULONG Version, ULONG Cookie, CCscSearchApiInterface** Interface);
  WINAPI_ERROR_CODE OfflineFilesEnable(       BOOL bEnable, BOOL* pbRebootRequired);
  WINAPI_ERROR_CODE OfflineFilesQueryStatus(  BOOL* pbActive, BOOL* pbEnabled);
]]
return ffi.load( "cscapi.dll" )

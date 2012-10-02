require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  NTSTATUS SfcGetFiles( PPROTECT_FILE_ENTRY* ProtFileData, PULONG FileCount);
]]
return ffi.load( 'Sfcfiles.dll' )

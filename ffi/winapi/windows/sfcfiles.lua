require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef struct PPROTECT_FILE_ENTRY {
    PWSTR SourceFileName;
    PWSTR FileName;
    PWSTR InfName;
  } PPROTECT_FILE_ENTRY;
  NTSTATUS SfcGetFiles( PPROTECT_FILE_ENTRY* ProtFileData, PULONG FileCount);
]]
ffi.load( 'Sfcfiles.dll' )

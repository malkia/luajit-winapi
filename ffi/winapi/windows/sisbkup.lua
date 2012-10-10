require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  BOOL SisCreateBackupStructure(  PWCHAR volumeRoot, PVOID* sisBackupStructure, PWCHAR* commonStoreRootPathname, PULONG countOfCommonStoreFilesToBackUp, PWCHAR** commonStoreFilesToBackUp);
  BOOL SisCreateRestoreStructure( PWCHAR volumeRoot, PVOID* sisRestoreStructure, PWCHAR* commonStoreRootPathname, PULONG countOfCommonStoreFilesToRestore, PWCHAR** commonStoreFilesToRestore);
  BOOL SisCSFilesToBackupForLink( PVOID sisBackupStructure, PVOID reparseData, ULONG reparseDataSize, PVOID thisFileContext, PVOID* matchingFileContext, PULONG countOfCommonStoreFilesToBackUp, PWCHAR** commonStoreFilesToBackUp);
  void SisFreeAllocatedMemory(    PVOID allocatedSpace);
  BOOL SisFreeBackupStructure(    PVOID sisBackupStructure);
  BOOL SisFreeRestoreStructure(   PVOID sisRestoreStructure);
  BOOL SisRestoredLink(           PVOID sisRestoreStructure, PWCHAR restoredFileName, PVOID reparseData, ULONG reparseDataSize, PULONG countOfCommonStoreFilesToRestore, PWCHAR** commonStoreFilesToRestore);
]]
ffi.load( 'Sisbkup.dll' )

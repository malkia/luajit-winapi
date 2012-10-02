require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/registry' )
require( 'ffi/winapi/windows/srclient' )
local ffi = require( 'ffi' )
ffi.cdef [[
  BOOL  SfcIsFileProtected(        HANDLE RpcHandle, LPCWSTR ProtFileName);
  BOOL  SfcIsKeyProtected(         HKEY hKey, LPCWSTR lpSubKey, REGSAM samDesired);
  BOOL  SfcGetNextProtectedFile(   HANDLE RpcHandle, PPROTECTED_FILE_DATA ProtFileData);
  DWORD SfcTerminateWatcherThread( );
  DWORD SfcFileException(          DWORD dwUnknown0, LPCSTR lpwszFile, DWORD dwUnknown1);
  BOOL  SfpVerifyFile(             LPCSTR lpszFileName, LPSTR lpszError, DWORD dwErrSize);
  DWORD SRRemoveRestorePoint(      DWORD dwRPNum);
  BOOL  SRSetRestorePointA(        PRESTOREPOINTINFOA pRestorePtSpec, PSTATEMGRSTATUS pSMgrStatus);
  BOOL  SRSetRestorePointW(        PRESTOREPOINTINFOW pRestorePtSpec, PSTATEMGRSTATUS pSMgrStatus);
]]
return ffi.load( 'sfc.dll' )

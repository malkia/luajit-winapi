require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  BOOL  GetFileVersionInfo(        LPCTSTR lptstrFilename, DWORD dwHandle, DWORD dwLen, LPVOID lpData);
  BOOL  GetFileVersionInfoExW(     DWORD dwFlags, LPCWSTR lptstrFilename, DWORD dwHandle, DWORD dwLen, LPVOID lpData);
  DWORD GetFileVersionInfoSize(    LPCTSTR lptstrFilename, LPDWORD lpdwHandle);
  DWORD GetFileVersionInfoSizeExW( DWORD dwFlags, LPCTSTR lptstrFilename, LPDWORD lpdwHandle);
  DWORD VerFindFile(               DWORD dwFlags, LPCTSTR szFileName, LPCTSTR szWinDir, LPCTSTR szAppDir, LPCSTR szCurDir, PUINT lpuCurDirLen, LPTSTR szDestDir, PUINT lpuDestDirLen);
  DWORD VerInstallFile(            DWORD uFlags, LPCTSTR szSrcFileName, LPCTSTR szDestFileName, LPCTSTR szSrcDir, LPCTSTR szDestDir, LPCTSTR szCurDir, LPTSTR szTmpFile, PUINT lpuTmpFileLen);
  BOOL  VerQueryValue(             LPCVOID pBlock, LPCTSTR lpSubBlock, LPVOID* lplpBuffer, PUINT puLen);
]]
ffi.load( 'version.dll' )

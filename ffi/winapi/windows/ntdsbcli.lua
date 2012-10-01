require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  HRESULT DsBackupClose(                 HBC hbc);
  HRESULT DsBackupEnd(                   HBC hbc);
  void    DsBackupFree(                  PVOID pvBuffer);
  HRESULT DsBackupGetBackupLogs(         HBC hbc, LPTSTR* pszBackupLogFiles, LPDWORD pcbSize);
  HRESULT DsBackupGetDatabaseNames(      HBC hbc, LPTSTR* pszAttachmentInfo, LPDWORD pcbSize);
  HRESULT DsBackupOpenFile(              HBC hbc, LPCTSTR szAttachmentName, DWORD cbReadHintSize, LARGE_INTEGER* pliFileSize);
  HRESULT DsBackupPrepare(               LPCTSTR szBackupServer, ULONG grbit, WINAPI_NtdsBackupType btBackupType, PVOID* ppvExpiryToken, LPDWORD pcbExpiryTokenSize, HBC* phbc);
  HRESULT DsBackupRead(                  HBC hbc, PVOID pvBuffer, DWORD cbBuffer, PDWORD pcbRead);
  HRESULT DsBackupTruncateLogs(          HBC hbc);
  HRESULT DsIsNTDSOnline(                LPCTSTR szServerName, BOOL* pfNTDSOnline);
  HRESULT DsRestoreEnd(                  HBC hbc);
  HRESULT DsRestoreGetDatabaseLocations( HBC hbc, LPWSTR* pszDatabaseLocationList, LPDWORD pcbSize);
  HRESULT DsRestorePrepare(              LPCWSTR szServerName, WINAPI_NtdsRestoreType rtFlag, PVOID pvExpiryToken, DWORD cbExpiryTokenSize, HBC* phbc);
  HRESULT DsRestoreRegister(             HBC hbc, LPCTSTR szCheckPointFilePath, LPCTSTR szLogPath, LONG crstmap, LPCTSTR szBackupLogPath, ULONG genLow, ULONG genHigh);
  HRESULT DsRestoreRegisterComplete(     HBC hbc, HRESULT hrRestoreState);
  HRESULT DsSetAuthIdentity(             LPCTSTR szUserName, LPCTSTR szDomainName, LPCTSTR szPassword);
  HRESULT DsSetCurrentBackupLog(         LPCWSTR szServerName, DWORD dwCurrentLog);
]]
return ffi.load( "Ntdsbcli.dll" )

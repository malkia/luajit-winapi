require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HRESULT CertSrvBackupClose(                  HCSBC hbc);
  HRESULT CertSrvBackupEnd(                    HCSBC hbc);
  void    CertSrvBackupFree(                   VOID* pv);
  HRESULT CertSrvBackupGetBackupLogsW(         HCSBC hbc, WCHAR** ppwszzBackupLogFiles, DWORD* pcbSize);
  HRESULT CertSrvBackupGetDatabaseNamesW(      HCSBC hbc, WCHAR** ppwszzAttachmentInformation, DWORD* pcbSize);
  HRESULT CertSrvBackupGetDynamicFileListW(    HCSBC hbc, WCHAR** ppwszzFileList, DWORD* pcbSize);
  HRESULT CertSrvBackupOpenFileW(              HCSBC hbc, WINAPI_WCHAR* pwszAttachmentName, DWORD cbReadHintSize, LARGE_INTEGER* pliFileSize);
  HRESULT CertSrvBackupPrepareW(               WINAPI_WCHAR* pwszServerName, ULONG grbitJet, ULONG dwBackupFlags, HCSBC* phbc);
  HRESULT CertSrvBackupRead(                   HCSBC hbc, VOID* pvBuffer, DWORD cbBuffer, DWORD* pcbRead);
  HRESULT CertSrvBackupTruncateLogs(           HCSBC hbc);
  HRESULT CertSrvIsServerOnlineW(              WINAPI_WCHAR* pwszServerName, BOOL* pfServerOnline);
  HRESULT CertSrvRestoreEnd(                   HCSBC hbc);
  HRESULT CertSrvRestoreGetDatabaseLocationsW( HCSBC hbc, WCHAR** ppwszzDatabaseLocationList, DWORD* pcbSize);
  HRESULT CertSrvRestorePrepareW(              WINAPI_WCHAR* pwszServerName, ULONG dwRestoreFlags, HCSBC* phbc);
  HRESULT CertSrvRestoreRegisterW(             HCSBC hbc, WINAPI_WCHAR* pwszCheckPointFilePath, WINAPI_WCHAR* pwszLogPath, CSEDB_RSTMAP rgrstmap, LONG crstmap, WINAPI_WCHAR* pwszBackupLogPath, ULONG genLow, ULONG genHigh);
  HRESULT CertSrvRestoreRegisterComplete(      HCSBC hbc, HRESULT hrRestoreState);
  HRESULT CertSrvRestoreRegisterThroughFile(   HCSBC hbc, WINAPI_WCHAR* pwszCheckPointFilePath, WINAPI_WCHAR* pwszLogPath, CSEDB_RSTMAP rgrstmap, LONG crstmap, WINAPI_WCHAR* pwszBackupLogPath, ULONG genLow, ULONG genHigh);
  HRESULT CertSrvServerControlW(               WINAPI_WCHAR* pwszServerName, DWORD dwControlFlags, DWORD* pcbOut, BYTE** ppbOut);
]]
return ffi.load( 'Certadm.dll' )

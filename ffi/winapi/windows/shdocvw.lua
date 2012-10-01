require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  void    ShellDDEInit(             BOOL init);
  DWORD   SoftwareUpdateMessageBox( HWND hWnd, LPCWSTR pszDistUnit, DWORD dwFlags, LPSOFTDISTINFO psdi);
  HRESULT DoPrivacyDlg(             HWND hwndParent, LPCWSTR pszUrl, IEnumPrivacyRecords* pPrivacyEnum, BOOL fReportAllSites);
  BOOL    ImportPrivacySettings(    LPCWSTR szFilename, BOOL* pfParsePrivacyPreferences, BOOL* pfParsePerSiteRules);
]]
return ffi.load( "Shdocvw.dll" )

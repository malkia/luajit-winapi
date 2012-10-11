require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IEnumPrivacyRecords; //Interface
  typedef DWORD WINAPI_SOFTDIST_Flags; //Alias
  typedef DWORD WINAPI_SOFTDIST_AdState; //Alias
  typedef struct SOFTDISTINFO {
    ULONG cbSize;
    WINAPI_SOFTDIST_Flags dwFlags;
    WINAPI_SOFTDIST_AdState dwAdState;
    LPWSTR szTitle;
    LPWSTR szAbstract;
    LPWSTR szHREF;
    DWORD dwInstalledVersionMS;
    DWORD dwInstalledVersionLS;
    DWORD dwUpdateVersionMS;
    DWORD dwUpdateVersionLS;
    DWORD dwAdvertisedVersionMS;
    DWORD dwAdvertisedVersionLS;
    DWORD dwReserved;
  } SOFTDISTINFO;
  typedef SOFTDISTINFO *LPSOFTDISTINFO; //Pointer
  void    ShellDDEInit(             BOOL init);
  DWORD   SoftwareUpdateMessageBox( HWND hWnd, LPCWSTR pszDistUnit, DWORD dwFlags, LPSOFTDISTINFO psdi);
  HRESULT DoPrivacyDlg(             HWND hwndParent, LPCWSTR pszUrl, IEnumPrivacyRecords* pPrivacyEnum, BOOL fReportAllSites);
  BOOL    ImportPrivacySettings(    LPCWSTR szFilename, BOOL* pfParsePrivacyPreferences, BOOL* pfParsePerSiteRules);
]]
return ffi.load( 'Shdocvw.dll' )

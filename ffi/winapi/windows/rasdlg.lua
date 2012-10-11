require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID RASPBDLGFUNC; //Alias
  typedef DWORD WINAPI_RASDDFLAG; //Alias
# pragma pack( push, 4 )
  typedef struct RASENTRYDLG {
    DWORD dwSize;
    HWND hwndOwner;
    WINAPI_RASDDFLAG dwFlags;
    LONG xDlg;
    LONG yDlg;
    TCHAR szEntry[RAS_MaxEntryName_plus_1];
    DWORD dwError;
    ULONG_PTR reserved;
    ULONG_PTR reserved2;
  } RASENTRYDLG;
# pragma pack( pop )
  typedef RASENTRYDLG *LPRASENTRYDLG; //Pointer
  typedef DWORD WINAPI_RASMDFLAG; //Alias
  typedef DWORD WINAPI_RASMDPAGE; //Alias
  static const WINAPI_RASMDPAGE RASMDPAGE_Status = 0;
  static const WINAPI_RASMDPAGE RASMDPAGE_Summary = 1;
  static const WINAPI_RASMDPAGE RASMDPAGE_Preferences = 2;
# pragma pack( push, 4 )
  typedef struct RASMONITORDLG {
    DWORD dwSize;
    HWND hwndOwner;
    WINAPI_RASMDFLAG dwFlags;
    WINAPI_RASMDPAGE dwStartPage;
    LONG xDlg;
    LONG yDlg;
    DWORD dwError;
    ULONG_PTR reserved;
    ULONG_PTR reserved2;
  } RASMONITORDLG;
# pragma pack( pop )
  typedef RASMONITORDLG *LPRASMONITORDLG; //Pointer
# pragma pack( push, 4 )
  typedef struct RASDIALDLG {
    DWORD dwSize;
    HWND hwndOwner;
    DWORD dwFlags;
    LONG xDlg;
    LONG yDlg;
    DWORD dwSubEntry;
    DWORD dwError;
    ULONG_PTR reserved;
    ULONG_PTR reserved2;
  } RASDIALDLG;
# pragma pack( pop )
  typedef RASDIALDLG *LPRASDIALDLG; //Pointer
# pragma pack( push, 4 )
  typedef struct RASPBDLG {
    DWORD dwSize;
    HWND hwndOwner;
    DWORD dwFlags;
    LONG xDlg;
    LONG yDlg;
    ULONG_PTR dwCallbackId;
    RASPBDLGFUNC pCallback;
    DWORD dwError;
    ULONG_PTR reserved;
    ULONG_PTR reserved2;
  } RASPBDLG;
# pragma pack( pop )
  typedef RASPBDLG *LPRASPBDLG; //Pointer
  BOOL RasDialDlg(      LPTSTR lpszPhonebook, LPTSTR lpszEntry, LPTSTR lpszPhoneNumber, LPRASDIALDLG lpInfo);
  BOOL RasEntryDlg(     LPTSTR lpszPhonebook, LPTSTR lpszEntry, LPRASENTRYDLG lpInfo);
  BOOL RasMonitorDlg(   LPTSTR lpszDeviceName, LPRASMONITORDLG lpInfo);
  BOOL RasPhonebookDlg( LPTSTR lpszPhonebook, LPTSTR lpszEntry, LPRASPBDLG lpInfo);
]]
return ffi.load( 'Rasdlg.dll' )

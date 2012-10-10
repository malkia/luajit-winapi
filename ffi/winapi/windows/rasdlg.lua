require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID RASPBDLGFUNC; //Alias
  typedef DWORD RASDDFLAG; //Alias
# pragma pack( push, 4 )
  typedef struct RASENTRYDLG {
    DWORD dwSize;
    HWND hwndOwner;
    RASDDFLAG dwFlags;
    LONG xDlg;
    LONG yDlg;
    TCHAR szEntry[RAS_MaxEntryName_plus_1];
    DWORD dwError;
    ULONG_PTR reserved;
    ULONG_PTR reserved2;
  } RASENTRYDLG;
# pragma pack( pop )
  typedef RASENTRYDLG *LPRASENTRYDLG; //Pointer
  typedef DWORD RASMDFLAG; //Alias
  typedef DWORD RASMDPAGE; //Alias
  static const RASMDPAGE RASMDPAGE_Status = 0;
  static const RASMDPAGE RASMDPAGE_Summary = 1;
  static const RASMDPAGE RASMDPAGE_Preferences = 2;
# pragma pack( push, 4 )
  typedef struct RASMONITORDLG {
    DWORD dwSize;
    HWND hwndOwner;
    RASMDFLAG dwFlags;
    RASMDPAGE dwStartPage;
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
ffi.load( 'Rasdlg.dll' )

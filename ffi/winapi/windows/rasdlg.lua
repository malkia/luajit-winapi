require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  BOOL RasDialDlg(      LPTSTR lpszPhonebook, LPTSTR lpszEntry, LPTSTR lpszPhoneNumber, LPRASDIALDLG lpInfo);
  BOOL RasEntryDlg(     LPTSTR lpszPhonebook, LPTSTR lpszEntry, LPRASENTRYDLG lpInfo);
  BOOL RasMonitorDlg(   LPTSTR lpszDeviceName, LPRASMONITORDLG lpInfo);
  BOOL RasPhonebookDlg( LPTSTR lpszPhonebook, LPTSTR lpszEntry, LPRASPBDLG lpInfo);
]]
return ffi.load( "Rasdlg.dll" )

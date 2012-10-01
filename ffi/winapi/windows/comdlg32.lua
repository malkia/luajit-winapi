require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/gdi" )
local ffi = require( "ffi" )
ffi.cdef [[
  BOOL    ChooseColor(          LPCHOOSECOLOR lpcc);
  BOOL    ChooseFont(           LPCHOOSEFONT lpcf);
  DWORD   CommDlgExtendedError( );
  HWND    FindText(             LPFINDREPLACE lpfr);
  short   GetFileTitle(         LPCTSTR lpszFile, LPTSTR lpszTitle, WORD cbBuf);
  BOOL    GetOpenFileName(      LPOPENFILENAME lpofn);
  BOOL    GetSaveFileName(      LPOPENFILENAME lpofn);
  BOOL    PageSetupDlg(         LPPAGESETUPDLG lppsd);
  BOOL    PrintDlg(             LPPRINTDLG lppd);
  HRESULT PrintDlgEx(           LPPRINTDLGEX lppd);
  HWND    ReplaceText(          LPFINDREPLACE lpfr);
]]
return ffi.load( "comdlg32.dll" )

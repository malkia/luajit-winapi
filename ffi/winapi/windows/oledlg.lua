require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/ole" )
require( "ffi/winapi/headers/gdi" )
local ffi = require( "ffi" )
ffi.cdef [[
  BOOL OleUIAddVerbMenu(            LPOLEOBJECT lpOleObj, LPCTSTR lpszShortType, HMENU hMenu, UINT uPos, UINT uIDVerbMin, UINT uIDVerbMax, BOOL bAddConvert, UINT idConvert, HMENU* lphMenu);
  UINT OleUIBusy(                   LPOLEUIBUSY lpBZ);
  BOOL OleUICanConvertOrActivateAs( REFCLSID rClsid, BOOL fIsLinkedObject, WORD wFormat);
  UINT OleUIChangeIcon(             LPOLEUICHANGEICON lpCI);
  UINT OleUIChangeSource(           LPOLEUICHANGESOURCE lpCS);
  UINT OleUIConvert(                LPOLEUICONVERT lpCV);
  UINT OleUIEditLinks(              LPOLEUIEDITLINKS lpEL);
  UINT OleUIInsertObject(           LPOLEUIINSERTOBJECT lpIO);
  UINT OleUIObjectProperties(       LPOLEUIOBJECTPROPS lpOF);
  UINT OleUIPasteSpecial(           LPOLEUIPASTESPECIAL lpPS);
  int  OleUIPromptUser(             int nTemplate, HWND hwndParent);
  BOOL OleUIUpdateLinks(            LPOLEUILINKCONTAINER lpOleUILinkCntr, HWND hwndParent, LPTSTR lpszTitle, int cLinks);
]]
return ffi.load( "OleDlg.dll" )

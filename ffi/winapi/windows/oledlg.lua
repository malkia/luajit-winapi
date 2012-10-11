require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
require( 'ffi/winapi/headers/gdi' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID LPFNOLEUIHOOK; //Alias
  typedef LPVOID LPOLEUILINKCONTAINER; //Alias
  typedef LPVOID LPOLEUIOBJINFO; //Alias
  typedef LPVOID LPOLEUILINKINFO; //Alias
  typedef DWORD ChangeIconFlag; //Alias
  typedef struct OLEUICHANGEICON {
    DWORD cbStruct;
    ChangeIconFlag dwFlags;
    HWND hWndOwner;
    LPCTSTR lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    LPCTSTR lpszTemplate;
    HRSRC hResource;
    HGLOBAL hMetaPict;
    CLSID clsid;
    TCHAR szIconExe[MAX_PATH];
    int cchIconExe;
  } OLEUICHANGEICON;
  typedef OLEUICHANGEICON *LPOLEUICHANGEICON; //Pointer
  typedef DWORD PasteSpecialFlag; //Alias
  typedef DWORD OLEUIPASTEFLAG; //Alias
  typedef struct OLEUIPASTEENTRY {
    FORMATETC fmtetc;
    LPCTSTR lpstrFormatName;
    LPCTSTR lpstrResultText;
    OLEUIPASTEFLAG dwFlags;
    DWORD dwScratchSpace;
  } OLEUIPASTEENTRY;
  typedef OLEUIPASTEENTRY *LPOLEUIPASTEENTRY; //Pointer
  typedef struct OLEUIPASTESPECIAL {
    DWORD cbStruct;
    PasteSpecialFlag dwFlags;
    HWND hWndOwner;
    LPCTSTR lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    LPCTSTR lpszTemplate;
    HRSRC hResource;
    LPDATAOBJECT lpSrcDataObj;
    LPOLEUIPASTEENTRY arrPasteEntries;
    int cPasteEntries;
    UINT* arrLinkTypes;
    int cLinkTypes;
    UINT cClsidExclude;
    LPCLSID lpClsidExclude;
    int nSelectedIndex;
    BOOL fLink;
    HGLOBAL hMetaPict;
    SIZEL sizel;
  } OLEUIPASTESPECIAL;
  typedef OLEUIPASTESPECIAL *LPOLEUIPASTESPECIAL; //Pointer
  typedef DWORD ObjectPropFlags; //Alias
  typedef struct OLEUIGNRLPROPS {
    DWORD cbStruct;
    DWORD dwFlags;
    DWORD dwReserved1[2];
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    DWORD dwReserved2[3];
    LPVOID lpOP;
  } OLEUIGNRLPROPS;
  typedef OLEUIGNRLPROPS *LPOLEUIGNRLPROPS; //Pointer
  typedef DWORD ViewPropsFlags; //Alias
  typedef struct OLEUIVIEWPROPS {
    DWORD cbStruct;
    ViewPropsFlags dwFlags;
    DWORD dwReserved1[2];
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    DWORD dwReserved2[3];
    LPVOID lpOP;
    int nScaleMin;
    int nScaleMax;
  } OLEUIVIEWPROPS;
  typedef OLEUIVIEWPROPS *LPOLEUIVIEWPROPS; //Pointer
  typedef struct OLEUILINKPROPS {
    DWORD cbStruct;
    DWORD dwFlags;
    DWORD dwReserved1[2];
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    DWORD dwReserved2[3];
    LPVOID lpOP;
  } OLEUILINKPROPS;
  typedef OLEUILINKPROPS *LPOLEUILINKPROPS; //Pointer
  typedef struct OLEUIOBJECTPROPS {
    DWORD cbStruct;
    ObjectPropFlags dwFlags;
    LPPROPSHEETHEADER lpPS;
    DWORD dwObject;
    LPOLEUIOBJINFO lpObjInfo;
    DWORD dwLink;
    LPOLEUILINKINFO lpLinkInfo;
    LPOLEUIGNRLPROPS lpGP;
    LPOLEUIVIEWPROPS lpVP;
    LPOLEUILINKPROPS lpLP;
  } OLEUIOBJECTPROPS;
  typedef OLEUIOBJECTPROPS *LPOLEUIOBJECTPROPS; //Pointer
  typedef DWORD ChangeSourceFlags; //Alias
  typedef struct OLEUICHANGESOURCE {
    DWORD cbStruct;
    ChangeSourceFlags dwFlags;
    HWND hWndOwner;
    LPCTSTR lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    LPCTSTR lpszTemplate;
    HRSRC hResource;
    OPENFILENAME* lpOFN;
    DWORD dwReserved1[4];
    LPOLEUILINKCONTAINER lpOleUILinkContainer;
    DWORD dwLink;
    LPTSTR lpszDisplayName;
    ULONG nFileLength;
    LPTSTR lpszFrom;
    LPSTR lpszTo;
  } OLEUICHANGESOURCE;
  typedef OLEUICHANGESOURCE *LPOLEUICHANGESOURCE; //Pointer
  typedef struct OLEUIBUSY {
    DWORD cbStruct;
    DWORD dwFlags;
    HWND hWndOwner;
    LPCTSTR lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    LPCTSTR lpszTemplate;
    HRSRC hResource;
    HTASK hTask;
    HWND* lphWndDialog;
  } OLEUIBUSY;
  typedef OLEUIBUSY *LPOLEUIBUSY; //Pointer
  typedef struct OLEUICONVERT {
    DWORD cbStruct;
    DWORD dwFlags;
    HWND hWndOwner;
    LPCTSTR lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    LPCTSTR lpszTemplate;
    HRSRC hResource;
    CLSID clsid;
    CLSID clsidConvertDefault;
    CLSID clsidActivateDefault;
    CLSID clsidNew;
    DWORD dvAspect;
    WORD wFormat;
    BOOL fIsLinkedObject;
    HGLOBAL hMetaPict;
    LPTSTR lpszUserType;
    BOOL fObjectsIconChanged;
    LPTSTR lpszDefLabel;
    UINT cClsidExclude;
    LPCLSID lpClsidExclude;
  } OLEUICONVERT;
  typedef OLEUICONVERT *LPOLEUICONVERT; //Pointer
  typedef struct OLEUIEDITLINKS {
    DWORD cbStruct;
    DWORD dwFlags;
    HWND hWndOwner;
    LPCTSTR lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    LPCTSTR lpszTemplate;
    HRSRC hResource;
    LPOLEUILINKCONTAINER lpOleUILinkContainer;
  } OLEUIEDITLINKS;
  typedef OLEUIEDITLINKS *LPOLEUIEDITLINKS; //Pointer
  typedef struct OLEUIINSERTOBJECT {
    DWORD cbStruct;
    DWORD dwFlags;
    HWND hWndOwner;
    LPCTSTR lpszCaption;
    LPFNOLEUIHOOK lpfnHook;
    LPARAM lCustData;
    HINSTANCE hInstance;
    LPCTSTR lpszTemplate;
    HRSRC hResource;
    CLSID clsid;
    LPTSTR lpszFile;
    UINT cchFile;
    UINT cClsidExclude;
    LPCLSID lpClsidExclude;
    IID iid;
    DWORD oleRender;
    LPFORMATETC lpFormatEtc;
    LPOLECLIENTSITE lpIOleClientSite;
    LPSTORAGE lpIStorage;
    LPVOID* ppvObj;
    SCODE sc;
    HGLOBAL hMetaPict;
  } OLEUIINSERTOBJECT;
  typedef OLEUIINSERTOBJECT *LPOLEUIINSERTOBJECT; //Pointer
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
ffi.load( 'OleDlg.dll' )

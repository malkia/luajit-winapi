require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/shell' )
require( 'ffi/winapi/headers/gdi' )
require( 'ffi/winapi/headers/registry' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UINT RESTRICTIONS; //Alias
  typedef LPVOID LPSHELLSTATE; //Alias
  typedef LPVOID LPSHELLFLAGSTATE; //Alias
  typedef void* IShellFolder; //Interface
  typedef void* IContextMenu; //Interface
  typedef void* IDataObject; //Interface
  typedef void* IEnumAssocHandlers; //Interface
  typedef void* IShellItem; //Interface
  typedef void* IFileOperation; //Interface
  typedef void* IShellView; //Interface
  typedef void* IShellItemArray; //Interface
  typedef void* IShellBrowser; //Interface
  typedef void* IFileOperationProgressSink; //Interface
  typedef void* IShellTaskScheduler; //Interface
  typedef void* IDropSource; //Interface
  typedef void* IContextMenuCB; //Interface
  typedef void* IShellFolderViewCB; //Interface
  typedef LPVOID FARPROC16; //Alias
  typedef LPVOID LPFNDFMCALLBACK; //Alias
  typedef HANDLE HDROP; //Alias
  typedef HANDLE HPSXA; //Alias
  typedef LPVOID LPFNADDPROPSHEETPAGE; //Alias
  typedef LPVOID LPFNVIEWCALLBACK; //Alias
  typedef LPVOID PFNASYNCICONTASKBALLBACK; //Alias
  typedef PROPVARIANT *PROPVARIANT[]; //Pointer
  enum { NUM_POINTS = 3 };
  typedef struct AUTO_SCROLL_DATA {
    int iNextSample;
    DWORD dwLastScroll;
    BOOL bFull;
    POINT pts_NUM_POINTS_;
    DWORD dwTimes_NUM_POINTS_;
  } AUTO_SCROLL_DATA;
  typedef UINT BROWSEINFO_FLAG; //Alias
# pragma pack( push, 8 )
  typedef struct BROWSEINFO {
    HWND hwndOwner;
    PCIDLIST_ABSOLUTE pidlRoot;
    LPTSTR pszDisplayName;
    LPCTSTR lpszTitle;
    BROWSEINFO_FLAG ulFlags;
    BFFCALLBACK lpfn;
    LPARAM lParam;
    int iImage;
  } BROWSEINFO;
# pragma pack( pop )
  typedef BROWSEINFO *LPBROWSEINFO; //Pointer
  typedef union NOTIFYICONDATA_u {
    UINT uTimeout;
    UINT uVersion;
  } NOTIFYICONDATA_u;
  typedef UINT NOTIFYICON_FLAG; //Alias
  typedef DWORD NOTIFYICON_STATE; //Alias
  typedef DWORD NOTIFYICON_INFO_FLAG; //Alias
  typedef struct NOTIFYICONDATA {
    DWORD cbSize;
    HWND hWnd;
    UINT uID;
    NOTIFYICON_FLAG uFlags;
    UINT uCallbackMessage;
    HICON hIcon;
    TCHAR szTip_128_;
    NOTIFYICON_STATE dwState;
    NOTIFYICON_STATE dwStateMask;
    TCHAR szInfo_256_;
    NOTIFYICONDATA_u ;
    TCHAR szInfoTitle_64_;
    NOTIFYICON_INFO_FLAG dwInfoFlags;
    GUID guidItem;
    HICON hBalloonIcon;
  } NOTIFYICONDATA;
  typedef NOTIFYICONDATA *PNOTIFYICONDATA; //Pointer
  typedef struct SHFILEINFO {
    HICON hIcon;
    int iIcon;
    SFGAOF dwAttributes;
    TCHAR szDisplayName_MAX_PATH_;
    TCHAR szTypeName_80_;
  } SHFILEINFO;
  typedef DWORD SHFOLDERCUSTOMSETTINGS_MASK; //Alias
# pragma pack( push, 8 )
  typedef struct SHFOLDERCUSTOMSETTINGS {
    DWORD dwSize;
    SHFOLDERCUSTOMSETTINGS_MASK dwMask;
    SHELLVIEWID* pvid;
    LPWSTR pszWebViewTemplate;
    DWORD cchWebViewTemplate;
    LPWSTR pszWebViewTemplateVersion;
    LPWSTR pszInfoTip;
    DWORD cchInfoTip;
    CLSID* pclsid;
    DWORD dwFlags;
    LPWSTR pszIconFile;
    DWORD cchIconFile;
    int iIconIndex;
    LPWSTR pszLogo;
    DWORD cchLogo;
  } SHFOLDERCUSTOMSETTINGS;
# pragma pack( pop )
  typedef SHFOLDERCUSTOMSETTINGS *LPSHFOLDERCUSTOMSETTINGS; //Pointer
  typedef struct SHSTOCKICONINFO {
    DWORD cbSize;
    HICON hIcon;
    int iSysImageIndex;
    int iIcon;
    WCHAR szPath_MAX_PATH_;
  } SHSTOCKICONINFO;
  typedef UINT OPEN_AS_INFO_FLAGS; //Alias
# pragma pack( push, 8 )
  typedef struct OPENASINFO {
    LPCWSTR pcszFile;
    LPCWSTR pcszClass;
    OPEN_AS_INFO_FLAGS oaifInFlags;
  } OPENASINFO;
# pragma pack( pop )
  typedef UINT ASSOCCLASS; //Alias
  static const ASSOCCLASS ASSOCCLASS_SHELL_KEY = 0;
  static const ASSOCCLASS ASSOCCLASS_PROGID_KEY = 1;
  static const ASSOCCLASS ASSOCCLASS_PROGID_STR = 2;
  static const ASSOCCLASS ASSOCCLASS_CLSID_KEY = 3;
  static const ASSOCCLASS ASSOCCLASS_CLSID_STR = 4;
  static const ASSOCCLASS ASSOCCLASS_APP_KEY = 5;
  static const ASSOCCLASS ASSOCCLASS_APP_STR = 6;
  static const ASSOCCLASS ASSOCCLASS_SYSTEM_STR = 7;
  static const ASSOCCLASS ASSOCCLASS_FOLDER = 8;
  static const ASSOCCLASS ASSOCCLASS_STAR = 9;
  typedef struct ASSOCIATIONELEMENT {
    ASSOCCLASS ac;
    HKEY hkClass;
    PCWSTR pszClass;
  } ASSOCIATIONELEMENT;
# pragma pack( push, 1 )
  typedef struct SHChangeNotifyEntry {
    PCIDLIST_ABSOLUTE pidl;
    BOOL fRecursive;
  } SHChangeNotifyEntry;
# pragma pack( pop )
  typedef struct APPBARDATA {
    DWORD cbSize;
    HWND hWnd;
    UINT uCallbackMessage;
    UINT uEdge;
    RECT rc;
    LPARAM lParam;
  } APPBARDATA;
  typedef APPBARDATA *PAPPBARDATA; //Pointer
  typedef struct DEFCONTEXTMENU {
    HWND hwnd;
    IContextMenuCB* pcmcb;
    PCIDLIST_ABSOLUTE pidlFolder;
    IShellFolder* psf;
    UINT cidl;
    PCUITEMID_CHILD_ARRAY apidl;
    IUnknown* punkAssociationInfo;
    UINT cKeys;
    HKEY* aKeys;
  } DEFCONTEXTMENU;
  typedef struct SHCREATEPROCESSINFOW {
    DWORD cbSize;
    ULONG fMask;
    HWND hwnd;
    LPCWSTR pszFile;
    LPCWSTR pszParameters;
    LPCWSTR pszCurrentDirectory;
    HANDLE hUserToken;
    LPSECURITY_ATTRIBUTES lpProcessAttributes;
    LPSECURITY_ATTRIBUTES lpThreadAttributes;
    BOOL bInheritHandles;
    DWORD dwCreationFlags;
    LPSTARTUPINFOW lpStartupInfo;
    LPPROCESS_INFORMATION lpProcessInformation;
  } SHCREATEPROCESSINFOW;
  typedef SHCREATEPROCESSINFOW *PSHCREATEPROCESSINFOW; //Pointer
  typedef struct CSFV {
    UINT cbSize;
    IShellFolder* pshf;
    IShellView* psvOuter;
    PCIDLIST_ABSOLUTE pidl;
    LONG lEvents;
    LPFNVIEWCALLBACK pfnCallback;
    FOLDERVIEWMODE fvm;
  } CSFV;
  typedef CSFV *LPCSFV; //Pointer
  typedef struct SFV_CREATE {
    UINT cbSize;
    IShellFolder* pshf;
    IShellView* psvOuter;
    IShellFolderViewCB* psfvcb;
  } SFV_CREATE;
  typedef struct NOTIFYICONIDENTIFIER {
    DWORD cbSize;
    HWND hWnd;
    UINT uID;
    GUID guidItem;
  } NOTIFYICONIDENTIFIER;
  typedef struct SHFILEOPSTRUCT {
    HWND hwnd;
    UINT wFunc;
    LPCTSTR pFrom;
    LPCTSTR pTo;
    FILEOP_FLAGS fFlags;
    BOOL fAnyOperationsAborted;
    LPVOID hNameMappings;
    LPCTSTR lpszProgressTitle;
  } SHFILEOPSTRUCT;
  typedef SHFILEOPSTRUCT *LPSHFILEOPSTRUCT; //Pointer
  typedef struct SHQUERYRBINFO {
    DWORD cbSize;
    DWORDLONG i64Size;
    DWORDLONG i64NumItems;
  } SHQUERYRBINFO;
  typedef SHQUERYRBINFO *LPSHQUERYRBINFO; //Pointer
  typedef int SHGetDataFromIDListFormats; //Alias
  static const SHGetDataFromIDListFormats SHGDFIL_FINDDATA = 1;
  static const SHGetDataFromIDListFormats SHGDFIL_NETRESOURCE = 2;
  static const SHGetDataFromIDListFormats SHGDFIL_DESCRIPTIONID = 3;
  typedef DWORD KNOWN_FOLDER_FLAG; //Alias
  typedef DWORD SHGetFolderPathFlags; //Alias
  static const SHGetFolderPathFlags SHGFP_TYPE_CURRENT = 0;
  static const SHGetFolderPathFlags SHGFP_TYPE_DEFAULT = 1;
  typedef ULONG ShellChangeNotifyEvent; //Alias
  typedef UINT ShellChangeNotifyFlag; //Alias
  typedef UINT ASSOC_FILTER; //Alias
  static const ASSOC_FILTER ASSOC_FILTER_NONE = 0;
  static const ASSOC_FILTER ASSOC_FILTER_RECOMMENDED = 0x1;
  typedef UINT SCNRT_STATUS; //Alias
  static const SCNRT_STATUS SCNRT_ENABLE = 0;
  static const SCNRT_STATUS SCNRT_DISABLE = 1;
  typedef DWORD DATAOBJ_GET_ITEM_FLAGS; //Alias
  typedef UINT GPFIDL_FLAGS; //Alias
  typedef UINT SHSTOCKICONID; //Alias
  static const SHSTOCKICONID SIID_DOCNOASSOC = 0;
  static const SHSTOCKICONID SIID_DOCASSOC = 1;
  static const SHSTOCKICONID SIID_APPLICATION = 2;
  static const SHSTOCKICONID SIID_FOLDER = 3;
  static const SHSTOCKICONID SIID_FOLDEROPEN = 4;
  static const SHSTOCKICONID SIID_DRIVE525 = 5;
  static const SHSTOCKICONID SIID_DRIVE35 = 6;
  static const SHSTOCKICONID SIID_DRIVEREMOVE = 7;
  static const SHSTOCKICONID SIID_DRIVEFIXED = 8;
  static const SHSTOCKICONID SIID_DRIVENET = 9;
  static const SHSTOCKICONID SIID_DRIVENETDISABLED = 10;
  static const SHSTOCKICONID SIID_DRIVECD = 11;
  static const SHSTOCKICONID SIID_DRIVERAM = 12;
  static const SHSTOCKICONID SIID_WORLD = 13;
  static const SHSTOCKICONID SIID_SERVER = 15;
  static const SHSTOCKICONID SIID_PRINTER = 16;
  static const SHSTOCKICONID SIID_MYNETWORK = 17;
  static const SHSTOCKICONID SIID_FIND = 22;
  static const SHSTOCKICONID SIID_HELP = 23;
  static const SHSTOCKICONID SIID_SHARE = 28;
  static const SHSTOCKICONID SIID_LINK = 29;
  static const SHSTOCKICONID SIID_SLOWFILE = 30;
  static const SHSTOCKICONID SIID_RECYCLER = 31;
  static const SHSTOCKICONID SIID_RECYCLERFULL = 32;
  static const SHSTOCKICONID SIID_MEDIACDAUDIO = 40;
  static const SHSTOCKICONID SIID_LOCK = 47;
  static const SHSTOCKICONID SIID_AUTOLIST = 49;
  static const SHSTOCKICONID SIID_PRINTERNET = 50;
  static const SHSTOCKICONID SIID_SERVERSHARE = 51;
  static const SHSTOCKICONID SIID_PRINTERFAX = 52;
  static const SHSTOCKICONID SIID_PRINTERFAXNET = 53;
  static const SHSTOCKICONID SIID_PRINTERFILE = 54;
  static const SHSTOCKICONID SIID_STACK = 55;
  static const SHSTOCKICONID SIID_MEDIASVCD = 56;
  static const SHSTOCKICONID SIID_STUFFEDFOLDER = 57;
  static const SHSTOCKICONID SIID_DRIVEUNKNOWN = 58;
  static const SHSTOCKICONID SIID_DRIVEDVD = 59;
  static const SHSTOCKICONID SIID_MEDIADVD = 60;
  static const SHSTOCKICONID SIID_MEDIADVDRAM = 61;
  static const SHSTOCKICONID SIID_MEDIADVDRW = 62;
  static const SHSTOCKICONID SIID_MEDIADVDR = 63;
  static const SHSTOCKICONID SIID_MEDIADVDROM = 64;
  static const SHSTOCKICONID SIID_MEDIACDAUDIOPLUS = 65;
  static const SHSTOCKICONID SIID_MEDIACDRW = 66;
  static const SHSTOCKICONID SIID_MEDIACDR = 67;
  static const SHSTOCKICONID SIID_MEDIACDBURN = 68;
  static const SHSTOCKICONID SIID_MEDIABLANKCD = 69;
  static const SHSTOCKICONID SIID_MEDIACDROM = 70;
  static const SHSTOCKICONID SIID_AUDIOFILES = 71;
  static const SHSTOCKICONID SIID_IMAGEFILES = 72;
  static const SHSTOCKICONID SIID_VIDEOFILES = 73;
  static const SHSTOCKICONID SIID_MIXEDFILES = 74;
  static const SHSTOCKICONID SIID_FOLDERBACK = 75;
  static const SHSTOCKICONID SIID_FOLDERFRONT = 76;
  static const SHSTOCKICONID SIID_SHIELD = 77;
  static const SHSTOCKICONID SIID_WARNING = 78;
  static const SHSTOCKICONID SIID_INFO = 79;
  static const SHSTOCKICONID SIID_ERROR = 80;
  static const SHSTOCKICONID SIID_KEY = 81;
  static const SHSTOCKICONID SIID_SOFTWARE = 82;
  static const SHSTOCKICONID SIID_RENAME = 83;
  static const SHSTOCKICONID SIID_DELETE = 84;
  static const SHSTOCKICONID SIID_MEDIAAUDIODVD = 85;
  static const SHSTOCKICONID SIID_MEDIAMOVIEDVD = 86;
  static const SHSTOCKICONID SIID_MEDIAENHANCEDCD = 87;
  static const SHSTOCKICONID SIID_MEDIAENHANCEDDVD = 88;
  static const SHSTOCKICONID SIID_MEDIAHDDVD = 89;
  static const SHSTOCKICONID SIID_MEDIABLURAY = 90;
  static const SHSTOCKICONID SIID_MEDIAVCD = 91;
  static const SHSTOCKICONID SIID_MEDIADVDPLUSR = 92;
  static const SHSTOCKICONID SIID_MEDIADVDPLUSRW = 93;
  static const SHSTOCKICONID SIID_DESKTOPPC = 94;
  static const SHSTOCKICONID SIID_MOBILEPC = 95;
  static const SHSTOCKICONID SIID_USERS = 96;
  static const SHSTOCKICONID SIID_MEDIASMARTMEDIA = 97;
  static const SHSTOCKICONID SIID_MEDIACOMPACTFLASH = 98;
  static const SHSTOCKICONID SIID_DEVICECELLPHONE = 99;
  static const SHSTOCKICONID SIID_DEVICECAMERA = 100;
  static const SHSTOCKICONID SIID_DEVICEVIDEOCAMERA = 101;
  static const SHSTOCKICONID SIID_DEVICEAUDIOPLAYER = 102;
  static const SHSTOCKICONID SIID_NETWORKCONNECT = 103;
  static const SHSTOCKICONID SIID_INTERNET = 104;
  static const SHSTOCKICONID SIID_ZIPFILE = 105;
  static const SHSTOCKICONID SIID_SETTINGS = 106;
  static const SHSTOCKICONID SIID_MAX_ICONS = 107;
  typedef UINT QUERY_USER_NOTIFICATION_STATE; //Alias
  static const QUERY_USER_NOTIFICATION_STATE QUNS_NOT_PRESENT = 1;
  static const QUERY_USER_NOTIFICATION_STATE QUNS_BUSY = 2;
  static const QUERY_USER_NOTIFICATION_STATE QUNS_RUNNING_D3D_FULL_SCREEN = 3;
  static const QUERY_USER_NOTIFICATION_STATE QUNS_PRESENTATION_MODE = 4;
  static const QUERY_USER_NOTIFICATION_STATE QUNS_ACCEPTS_NOTIFICATIONS = 5;
  typedef UINT LIBRARYMANAGEDIALOGOPTIONS; //Alias
  static const LIBRARYMANAGEDIALOGOPTIONS LMD_DEFAULT = 0x00000000;
  static const LIBRARYMANAGEDIALOGOPTIONS LMD_ALLOWUNINDEXABLENETWORKLOCATIONS = 0x00000001;
  typedef UINT RunFileDlgFlags; //Alias
  typedef DWORD NUMBERFMT_FLAGS; //Alias
  typedef DWORD SGUPP_FLAGS; //Alias
  typedef DWORD SECL_FLAGS; //Alias
  typedef struct CLASSPIDL {
    HWND hwnd;
    HANDLE hData;
    HICON hPrinterIcon;
  } CLASSPIDL;
  typedef DWORD SSF_FLAGS; //Alias
  HICON             DuplicateIcon(                               HINSTANCE hInst, HICON hIcon);
  HICON             ExtractAssociatedIcon(                       HINSTANCE hInst, LPTSTR lpIconPath, LPWORD lpiIcon);
  HICON             ExtractIcon(                                 HINSTANCE hInst, LPCTSTR lpszExeFileName, UINT nIconIndex);
  UINT              ExtractIconEx(                               LPCTSTR lpszFile, int nIconIndex, HICON* phiconLarge, HICON* phiconSmall, UINT nIcons);
  HRESULT           AssocCreateForClasses(                       ASSOCIATIONELEMENT* rgClasses, ULONG cClasses, REFIID riid, void** ppv);
  HRESULT           AssocGetDetailsOfPropKey(                    IShellFolder* psf, PCUITEMID_CHILD pidl, PROPERTYKEY* pkey, VARIANT* pv, BOOL* pfFoundPropKey);
  int               CallCPLEntry16(                              HINSTANCE hInst, FARPROC16 lpfnEntry, HWND hwndCPL, UINT msg, LPARAM lParam1, LPARAM lParam2);
  HRESULT           CDefFolderMenu_Create2(                      PCIDLIST_ABSOLUTE pidlFolder, HWND hwnd, UINT cidl, PCUITEMID_CHILD_ARRAY* apidl, IShellFolder* psf, LPFNDFMCALLBACK lpfn, UINT nKeys, HKEY* ahkeys, IContextMenu** ppcm);
  HRESULT           CIDLData_CreateFromIDArray(                  PCIDLIST_ABSOLUTE pidlFolder, UINT cidl, PCUIDLIST_RELATIVE_ARRAY apidl, IDataObject** ppdtobj);
  LPWSTR*           CommandLineToArgvW(                          LPCWSTR lpCmdLine, int* pNumArgs);
  BOOL              DAD_AutoScroll(                              HWND hwnd, AUTO_SCROLL_DATA* pad, POINT* pptNow);
  BOOL              DAD_DragEnterEx(                             HWND hwndTarget, POINT ptStart);
  BOOL              DAD_DragLeave(                               );
  BOOL              DAD_DragMove(                                POINT pt);
  BOOL              DAD_SetDragImage(                            HIMAGELIST him, POINT* pptOffset);
  BOOL              DAD_ShowDragImage(                           BOOL fShow);
  DWORD             DoEnvironmentSubst(                          LPTSTR pszString, UINT cchString);
  VOID              DragAcceptFiles(                             HWND hWnd, BOOL fAccept);
  VOID              DragFinish(                                  HDROP hDrop);
  UINT              DragQueryFile(                               HDROP hDrop, UINT iFile, LPTSTR lpszFile, UINT cch);
  BOOL              DragQueryPoint(                              HDROP hDrop, LPPOINT lppt);
  int               DriveType(                                   int iDrive);
  HICON             ExtractAssociatedIconEx(                     HINSTANCE hInst, LPTSTR lpIconPath, LPWORD lpiIconIndex, LPWORD lpiIconId);
  BOOL              FileIconInit(                                BOOL fRestoreCache);
  HINSTANCE         FindExecutable(                              LPCTSTR lpFile, LPCTSTR lpDirectory, LPTSTR lpResult);
  HRESULT           GetCurrentProcessExplicitAppUserModelID(     PWSTR* AppID);
  BOOL              GetFileNameFromBrowse(                       HWND hwnd, LPWSTR pszFilePath, UINT cchFilePath, LPCWSTR pszWorkingDir, LPCWSTR pszDefExt, LPCWSTR pszFilters, LPCWSTR szTitle);
  BOOL              GUIDFromString(                              LPCTSTR psz, LPGUID pguid);
  PIDLIST_RELATIVE  ILAppendID(                                  PIDLIST_RELATIVE pidl, LPSHITEMID pmkid, BOOL fAppend);
  PIDLIST_RELATIVE  ILClone(                                     PCUIDLIST_RELATIVE pidl);
  PITEMID_CHILD     ILCloneFirst(                                PCUIDLIST_RELATIVE pidl);
  PIDLIST_ABSOLUTE  ILCombine(                                   PCIDLIST_ABSOLUTE pidl1, PCUIDLIST_RELATIVE pidl2);
  PIDLIST_ABSOLUTE  ILCreateFromPath(                            LPCWSTR pszPath);
  PIDLIST_ABSOLUTE  ILCreateFromPath(                            LPCSTR pszPath);
  PUIDLIST_RELATIVE ILFindChild(                                 PCIDLIST_ABSOLUTE pidlParent, PCIDLIST_ABSOLUTE pidlChild);
  PUITEMID_CHILD    ILFindLastID(                                PCUIDLIST_RELATIVE pidl);
  void              ILFree(                                      PIDLIST_RELATIVE pidl);
  PUIDLIST_RELATIVE ILGetNext(                                   PCUIDLIST_RELATIVE pidl);
  UINT              ILGetSize(                                   PCUIDLIST_RELATIVE pidl);
  BOOL              ILIsEqual(                                   PCIDLIST_ABSOLUTE pidl1, PCIDLIST_ABSOLUTE pidl2);
  BOOL              ILIsParent(                                  PCIDLIST_ABSOLUTE pidl1, PCIDLIST_ABSOLUTE pidl2, BOOL fImmediate);
  HRESULT           ILLoadFromStream(                            IStream* pstm, PIDLIST_RELATIVE* pidl);
  BOOL              ILRemoveLastID(                              PUIDLIST_RELATIVE pidl);
  HRESULT           ILSaveToStream(                              IStream* pstm, PCUIDLIST_RELATIVE pidl);
  BOOL              InitNetworkAddressControl(                   );
  int               IsNetDrive(                                  int iDrive);
  BOOL              IsUserAnAdmin(                               );
  BOOL              LinkWindow_RegisterClass(                    );
  BOOL              LinkWindow_UnregisterClass(                  );
  BOOL              NTSHChangeNotifyDeregister(                  ULONG ulID);
  void              SHChangeNotify(                              ShellChangeNotifyEvent wEventId, ShellChangeNotifyFlag uFlags, LPCVOID dwItem1, LPCVOID dwItem2);
  ULONG             NTSHChangeNotifyRegister(                    HWND hwnd, int fSources, LONG fEvents, UINT wMsg, int cEntries, SHChangeNotifyEntry* pfsne);
  IStream*          OpenRegStream(                               HKEY hkey, LPCWSTR pszSubkey, LPCWSTR pszValue, STGM_FLAGS grfMode);
  bool              ParseField(                                  LPCTSTR* szData, int n, LPTSTR* szBuf, int iBufLen);
  int               PathCleanupSpec(                             LPCWSTR pszDir, LPWSTR pszSpec);
  void              PathGetShortPath(                            LPWSTR pszLongPath);
  int               PathIsExe(                                   LPCWSTR szfile);
  BOOL              PathIsSlow(                                  LPCTSTR pszFile, DWORD dwFileAttr);
  BOOL              PathMakeUniqueName(                          LPWSTR pszUniqueName, UINT cchMax, LPCWSTR pszTemplate, LPCWSTR pszLongPlate, LPCWSTR pszDir);
  LONG              PathProcessCommand(                          LPCWSTR lpSrc, LPWSTR lpDest, int iDestMax, DWORD dwFlags);
  BOOL              PathResolve(                                 LPWSTR pszPath, LPCWSTR* dirs, UINT fFlags);
  BOOL              PathYetAnotherMakeUniqueName(                LPWSTR pszUniqueName, LPCWSTR pszPath, LPCWSTR pszShort, LPCWSTR pszFileSpec);
  int               PickIconDlg(                                 HWND hwnd, LPWSTR pszIconPath, UINT cchIconPath, int* piIconIndex);
  BOOL              ReadCabinetState(                            CABINETSTATE* pcs, int cLength);
  int               RealDriveType(                               int iDrive, BOOL fOKToHitNet);
  int               RestartDialog(                               HWND hParent, LPCWSTR pszPrompt, DWORD dwFlags);
  int               RestartDialogEx(                             HWND hParent, LPCWSTR pszPrompt, DWORD dwFlags, HWND dwReasonCode);
  HRESULT           SetCurrentProcessExplicitAppUserModelID(     PCWSTR AppID);
  int               SHAddFromPropSheetExtArray(                  HPSXA hpsxa, LPFNADDPROPSHEETPAGE lpfnAddPage, LPARAM lParam);
  void              SHAddToRecentDocs(                           UINT uFlags, LPCVOID pv);
  LPVOID            SHAlloc(                                     SIZE_T cb);
  UINT_PTR          SHAppBarMessage(                             DWORD dwMessage, PAPPBARDATA pData);
  HRESULT           SHAssocEnumHandlers(                         LPCWSTR pszExtra, ASSOC_FILTER afFilter, IEnumAssocHandlers** ppEnumHandler);
  HRESULT           SHAssocEnumHandlersForProtocolByApplication( PCWSTR protocol, REFIID riid, void** enumHandlers);
  HRESULT           SHBindToFolderIDListParent(                  IShellFolder* psfRoot, PCUIDLIST_RELATIVE pidl, REFIID riid, void** ppv, PCUITEMID_CHILD* ppidlLast);
  HRESULT           SHBindToObject(                              IShellFolder* psf, PCUIDLIST_RELATIVE pidl, IBindCtx* pbc, REFIID riid, void** ppv);
  HRESULT           SHBindToParent(                              PCIDLIST_ABSOLUTE pidl, REFIID riid, VOID** ppv, PCUITEMID_CHILD* ppidlLast);
  PIDLIST_ABSOLUTE  SHBrowseForFolder(                           LPBROWSEINFO lpbi);
  HANDLE            SHChangeNotification_Lock(                   HANDLE hChange, DWORD dwProcId, PIDLIST_ABSOLUTE** pppidl, LONG* plEvent);
  BOOL              SHChangeNotification_Unlock(                 HANDLE hLock);
  BOOL              SHChangeNotifyDeregister(                    ULONG ulID);
  ULONG             SHChangeNotifyRegister(                      HWND hwnd, int fSources, LONG fEvents, UINT wMsg, int cEntries, SHChangeNotifyEntry* pshcne);
  void              SHChangeNotifyRegisterThread(                SCNRT_STATUS status);
  PIDLIST_ABSOLUTE  SHCloneSpecialIDList(                        HWND hwndOwner, CSIDL csidl, BOOL fCreate);
  HRESULT           SHCLSIDFromString(                           LPCWSTR psz, CLSID* pclsid);
  HRESULT           SHCoCreateInstance(                          LPCWSTR pszCLSID, CLSID* pclsid, IUnknown* pUnkOuter, REFIID riid, void** ppv);
  HRESULT           SHCreateAssociationRegistration(             REFIID riid, void** ppv);
  HRESULT           SHCreateDataObject(                          PCIDLIST_ABSOLUTE pidlFolder, UINT cidl, PCUITEMID_CHILD_ARRAY apidl, IDataObject* pdtInner, REFIID riid, void** ppv);
  HRESULT           SHCreateDefaultContextMenu(                  DEFCONTEXTMENU* pdcm, REFIID riid, void** ppv);
  HRESULT           SHCreateDefaultExtractIcon(                  REFIID riid, void** ppv);
  HRESULT           SHCreateDefaultPropertiesOp(                 IShellItem* psi, IFileOperation** ppFileOp);
  int               SHCreateDirectory(                           HWND hwnd, LPCWSTR pszPath);
  int               SHCreateDirectoryEx(                         HWND hwnd, LPCTSTR pszPath, SECURITY_ATTRIBUTES* psa);
  HRESULT           SHCreateFileExtractIconW(                    LPCWSTR pszFile, DWORD dwFileAttributes, REFIID riid, void** ppv);
  HRESULT           SHCreateItemFromParsingName(                 PCWSTR pszPath, IBindCtx* pbc, REFIID riid, void** ppv);
  HRESULT           SHCreateItemFromRelativeName(                IShellItem* psiParent, PCWSTR pszName, IBindCtx* pbc, REFIID riid, void** ppv);
  HRESULT           SHCreateItemInKnownFolder(                   REFKNOWNFOLDERID kfid, KNOWN_FOLDER_FLAG dwKFFlags, PCWSTR pszItem, REFIID riid, void** ppv);
  BOOL              SHCreateProcessAsUserW(                      PSHCREATEPROCESSINFOW pscpi);
  HPSXA             SHCreatePropSheetExtArray(                   HKEY hkey, LPCWSTR pszSubkey, UINT max_iface);
  HRESULT           SHCreateQueryCancelAutoPlayMoniker(          IMoniker** ppmoniker);
  HRESULT           SHCreateShellFolderViewEx(                   LPCSFV pcsfv, IShellView** ppsv);
  HRESULT           SHCreateShellFolderView(                     SFV_CREATE* pcsfv, IShellView** ppsv);
  HRESULT           SHCreateShellItem(                           PCIDLIST_ABSOLUTE pidlParent, IShellFolder* psfParent, PCUITEMID_CHILD pidl, IShellItem** ppsi);
  HRESULT           SHCreateItemWithParent(                      PCIDLIST_ABSOLUTE pidlParent, IShellFolder* psfParent, PCUITEMID_CHILD pidl, REFIID riid, void** ppvItem);
  HRESULT           SHCreateItemFromIDList(                      PCIDLIST_ABSOLUTE pidl, REFIID riid, void** ppv);
  HRESULT           SHCreateShellItemArray(                      PCIDLIST_ABSOLUTE pidlParent, IShellFolder* psf, UINT cidl, PCUITEMID_CHILD_ARRAY ppidl, IShellItemArray** ppsiItemArray);
  HRESULT           SHCreateShellItemArrayFromDataObject(        IDataObject* pdo, REFIID riid, void** ppv);
  HRESULT           SHCreateShellItemArrayFromIDLists(           UINT cidl, PCIDLIST_ABSOLUTE_ARRAY rgpidl, IShellItemArray** ppsiItemArray);
  HRESULT           SHCreateShellItemArrayFromShellItem(         IShellItem* psi, REFIID riid, void** ppv);
  HRESULT           SHCreateStdEnumFmtEtc(                       UINT cfmt, IEnumFORMATETC** ppenumFormatEtc);
  HRESULT           SHDefExtractIcon(                            LPCTSTR pszIconFile, int iIndex, UINT uFlags, HICON* phiconLarge, HICON* phiconSmall, UINT nIconSize);
  void              SHDestroyPropSheetExtArray(                  HPSXA hpsxa);
  HRESULT           SHDoDragDrop(                                HWND hwnd, IDataObject* pdtobj, IDropSource* pdsrc, DWORD dwEffect, DWORD* pdwEffect);
  int               Shell_GetCachedImageIndex(                   LPCWSTR pwszIconPath, int iIconIndex, UINT uIconFlags);
  int               Shell_GetCachedImageIndex(                   LPCTSTR pszIconPath, int iIconIndex, UINT uIconFlags);
  BOOL              Shell_GetImageLists(                         HIMAGELIST* phiml, HIMAGELIST* phimlSmall);
  UINT              Shell_MergeMenus(                            HMENU hmDst, HMENU hmSrc, UINT uInsert, UINT uIDAdjust, UINT uIDAdjustMax, ULONG uFlags);
  BOOL              Shell_NotifyIcon(                            DWORD dwMessage, PNOTIFYICONDATA lpdata);
  HRESULT           Shell_NotifyIconGetRect(                     NOTIFYICONIDENTIFIER* identifier, RECT* iconLocation);
  int               ShellAbout(                                  HWND hWnd, LPCTSTR szApp, LPCTSTR szOtherStuff, HICON hIcon);
  BOOL              ShellExecuteEx(                              LPSHELLEXECUTEINFO lpExecInfo);
  HRESULT           SHEmptyRecycleBin(                           HWND hwnd, LPCTSTR pszRootPath, DWORD dwFlags);
  HRESULT           SHEnumerateUnreadMailAccountsW(              HKEY hKeyUser, DWORD dwIndex, LPWSTR pszMailAddress, int cchMailAddress);
  HRESULT           SHEvaluateSystemCommandTemplate(             PCWSTR pszCmdTemplate, PWSTR* ppszApplication, PWSTR* ppszCommandLine, PWSTR* ppszParameters);
  HINSTANCE         ShellExecute(                                HWND hwnd, LPCTSTR lpOperation, LPCTSTR lpFile, LPCTSTR lpParameters, LPCTSTR lpDirectory, ShowWindowCmd nShowCmd);
  UINT              SHExtractIconsW(                             LPCWSTR pszFileName, int nIconIndex, int cxIcon, int cyIcon, HICON* phIcon, UINT* pIconId, UINT nIcons, LRFlags flags);
  IContextMenu*     SHFind_InitMenuPopup(                        HMENU hmenu, HWND hwnd, UINT idCmdFirst, UINT idCmdLast);
  BOOL              SHFindFiles(                                 PCIDLIST_ABSOLUTE pidlFolder, PCIDLIST_ABSOLUTE pidlSaveFile);
  HRESULT           SHFlushClipboard(                            );
  void              SHFlushSFCache(                              );
  DWORD             SHFormatDrive(                               HWND hwnd, UINT drive, UINT fmtID, UINT options);
  void              SHFree(                                      void* pv);
  void              SHFreeNameMappings(                          HANDLE hNameMappings);
  int               SHFileOperation(                             LPSHFILEOPSTRUCT lpFileOp);
  HRESULT           SHGetAttributesFromDataObject(               IDataObject* pdo, DWORD dwAttributeMask, DWORD* pdwAttributes, UINT* pcItems);
  HRESULT           SHGetDataFromIDList(                         IShellFolder* psf, PCUITEMID_CHILD pidl, SHGetDataFromIDListFormats nFormat, PVOID pv, int cb);
  HRESULT           SHGetDesktopFolder(                          IShellFolder** ppshf);
  BOOL              SHGetDiskFreeSpace(                          LPCTSTR pszVolume, ULARGE_INTEGER* pqwFreeCaller, ULARGE_INTEGER* pqwTot, ULARGE_INTEGER* pqwFree);
  BOOL              SHGetDiskFreeSpaceEx(                        LPCTSTR pszVolume, ULARGE_INTEGER* pqwFreeCaller, ULARGE_INTEGER* pqwTot, ULARGE_INTEGER* pqwFree);
  HRESULT           SHGetDriveMedia(                             LPCWSTR pszDrive, DWORD* pdwMediaContent);
  DWORD_PTR         SHGetFileInfo(                               LPCTSTR pszPath, DWORD dwFileAttributes, SHFILEINFO* psfi, UINT cbFileInfo, UINT uFlags);
  HRESULT           SHGetFolderLocation(                         HWND hwndOwner, CSIDL nFolder, HANDLE hToken, DWORD dwReserved, PIDLIST_ABSOLUTE* ppidl);
  HRESULT           SHGetFolderPath(                             HWND hwndOwner, int nFolder, HANDLE hToken, SHGetFolderPathFlags dwFlags, LPTSTR pszPath);
  HRESULT           SHGetFolderPathAndSubDir(                    HWND hwnd, CSIDL csidl, HANDLE hToken, SHGetFolderPathFlags dwFlags, LPCTSTR pszSubDir, LPTSTR pszPath);
  int               SHGetIconOverlayIndex(                       LPCTSTR pszIconPath, int iIconIndex);
  HRESULT           SHGetIDListFromObject(                       IUnknown* punk, PIDLIST_ABSOLUTE* ppidl);
  HRESULT           SHGetImageList(                              int iImageList, REFIID riid, void** ppv);
  HRESULT           SHGetInstanceExplorer(                       IUnknown** ppunk);
  HRESULT           SHGetItemFromDataObject(                     IDataObject* pdtobj, DATAOBJ_GET_ITEM_FLAGS dwFlags, REFIID riid, void** ppv);
  HRESULT           SHGetItemFromObject(                         IUnknown* punk, REFIID riid, void** ppv);
  HRESULT           SHGetKnownFolderIDList(                      REFKNOWNFOLDERID rfid, KNOWN_FOLDER_FLAG dwFlags, HANDLE hToken, PIDLIST_ABSOLUTE* ppidl);
  HRESULT           SHGetKnownFolderItem(                        REFKNOWNFOLDERID rfid, KNOWN_FOLDER_FLAG dwFlags, HANDLE hToken, REFIID riid, void** ppv);
  HRESULT           SHGetKnownFolderPath(                        REFKNOWNFOLDERID rfid, DWORD dwFlags, HANDLE hToken, PWSTR* ppszPath);
  HRESULT           SHGetLocalizedName(                          LPCWSTR pszPath, LPWSTR pszResModule, UINT cch, int* pidsRes);
  HRESULT           SHGetMalloc(                                 LPMALLOC* ppMalloc);
  HRESULT           SHGetNameFromIDList(                         PCIDLIST_ABSOLUTE pidl, SIGDN sigdnName, PWSTR* ppszName);
  HRESULT           SHGetNameFromPropertyKey(                    REFPROPERTYKEY propkey, PWSTR* ppszCanonicalName);
  BOOL              SHGetNewLinkInfo(                            LPCTSTR pszLinkTo, LPCTSTR pszDir, LPTSTR pszName, BOOL* pfMustCopy, UINT uFlags);
  BOOL              SHGetPathFromIDListEx(                       PCIDLIST_ABSOLUTE pidl, PWSTR pszPath, DWORD cchPath, GPFIDL_FLAGS uOpts);
  BOOL              SHGetPathFromIDList(                         PCIDLIST_ABSOLUTE pidl, LPTSTR pszPath);
  HRESULT           SHGetRealIDL(                                IShellFolder* psf, PCUITEMID_CHILD pidlSimple, PITEMID_CHILD* ppidlReal);
  HRESULT           SHGetSetFolderCustomSettings(                LPSHFOLDERCUSTOMSETTINGS pfcs, LPCTSTR pszPath, DWORD dwReadWrite);
  void              SHGetSetSettings(                            LPSHELLSTATE lpss, SSF_FLAGS dwMask, BOOL bSet);
  void              SHGetSettings(                               LPSHELLFLAGSTATE lpsfs, SSF_FLAGS dwMask);
  HINSTANCE         SHGetShellStyleHInstance(                    );
  HRESULT           SHGetSpecialFolderLocation(                  HWND hwndOwner, CSIDL nFolder, PIDLIST_ABSOLUTE* ppidl);
  BOOL              SHGetSpecialFolderPath(                      HWND hwndOwner, LPWSTR lpwszPath, CSIDL csidl, BOOL fCreate);
  BOOL              SHGetSpecialFolderPath(                      HWND hwndOwner, LPTSTR lpszPath, CSIDL csidl, BOOL fCreate);
  HRESULT           SHGetStockIconInfo(                          SHSTOCKICONID siid, UINT uFlags, SHSTOCKICONINFO* psii);
  HRESULT           SHGetTemporaryPropertyForItem(               IShellItem* psi, REFPROPERTYKEY pk, PROPVARIANT* ppropvarInk);
  HRESULT           SHGetUnreadMailCountW(                       HKEY hKeyUser, LPCWSTR pszMailAddress, DWORD* pdwCount, FILETIME* pFileTime, LPCWSTR pszShellExecuteCommand, int cchShellExecuteCommand);
  int               SHHandleUpdateImage(                         PCIDLIST_ABSOLUTE pidlExtra);
  HRESULT           SHILCreateFromPath(                          LPCWSTR pszPath, PIDLIST_ABSOLUTE* ppidl, DWORD* rgflnOut);
  BOOL              SHInvokePrinterCommand(                      HWND hwnd, UINT uAction, LPCTSTR lpBuf1, LPCTSTR lpBuf2, BOOL fModal);
  HRESULT           SHIsFileAvailableOffline(                    LPCWSTR pszPath, LPDWORD pdwStatus);
  HRESULT           SHLimitInputEdit(                            HWND hwndEdit, IShellFolder* psf);
  HRESULT           SHLoadInProc(                                REFCLSID rclsid);
  HRESULT           SHLoadNonloadedIconOverlayIdentifiers(       );
  HRESULT           SHLoadOLE(                                   LPARAM lParam);
  HRESULT           SHLocalStrDup(                               LPCWSTR psz, LPWSTR* ppsz);
  HRESULT           SHMapIDListToImageListIndexAsync(            IShellTaskScheduler* pts, IShellFolder* psf, LPCITEMIDLIST pidl, GIL_INPUT_FLAGS flags, PFNASYNCICONTASKBALLBACK pfn, void* pvData, void* pvHint, int* piIndex, int* piIndexSel);
  int               SHMapPIDLToSystemImageListIndex(             IShellFolder* psf, PCUITEMID_CHILD pidl, int* piIndex);
  HRESULT           SHMultiFileProperties(                       IDataObject* pdtobj, DWORD dwFlags);
  BOOL              SHObjectProperties(                          HWND hwnd, DWORD shopObjectType, PCWSTR pszObjectName, PCWSTR pszPropertyPage);
  HRESULT           SHOpenFolderAndSelectItems(                  PCIDLIST_ABSOLUTE pidlFolder, UINT cidl, PCUITEMID_CHILD_ARRAY* apidl, DWORD dwFlags);
  BOOL              SHOpenPropSheetW(                            LPCWSTR pszCaption, UINT ckeys, CLSID* pclsidDef, IDataObject* pdtobj, IShellBrowser* psb, LPCWSTR pStartPage);
  HRESULT           SHOpenWithDialog(                            HWND hwndParent, OPENASINFO* poainfo);
  HRESULT           SHParseDisplayName(                          LPCWSTR pszName, IBindCtx* pbc, PIDLIST_ABSOLUTE* ppidl, SFGAOF sfgaoIn, SFGAOF* psfgaoOut);
  HRESULT           SHPathPrepareForWrite(                       HWND hwnd, IUnknown* punkEnableModless, LPCTSTR pszPath, DWORD dwFlags);
  HRESULT           SHQueryRecycleBin(                           LPCTSTR pszRootPath, LPSHQUERYRBINFO pSHQueryRBInfo);
  HRESULT           SHQueryUserNotificationState(                QUERY_USER_NOTIFICATION_STATE* pquns);
  HRESULT           SHRemoveLocalizedName(                       LPCWSTR pszPath);
  UINT              SHReplaceFromPropSheetExtArray(              HPSXA hpsxa, UINT uPageID, LPFNADDPROPSHEETPAGE lpfnReplaceWith, LPARAM lParam);
  HRESULT           SHResolveLibrary(                            IShellItem* psiLibrary);
  DWORD             SHRestricted(                                RESTRICTIONS rest);
  BOOL              SHRunControlPanel(                           LPCWSTR lpcszCmdLine, HWND hwndMsgParent);
  HRESULT           SHSetDefaultProperties(                      HWND hwnd, IShellItem* psi, DWORD dwFileOpFlags, IFileOperationProgressSink* pfops);
  HRESULT           SHSetFolderPath(                             CSIDL csidl, HANDLE hToken, DWORD dwFlags, LPCTSTR pszPath);
  void              SHSetInstanceExplorer(                       IUnknown* punk);
  HRESULT           SHSetKnownFolderPath(                        REFKNOWNFOLDERID rfid, DWORD dwFlags, HANDLE hToken, PCWSTR pszPath);
  HRESULT           SHSetLocalizedName(                          LPCWSTR pszPath, LPCWSTR pszResModule, int idsRes);
  HRESULT           SHSetTemporaryPropertyForItem(               IShellItem* psi, REFPROPERTYKEY propkey, REFPROPVARIANT propvar);
  HRESULT           SHSetUnreadMailCountW(                       LPCWSTR pszMailAddress, DWORD dwCount, LPCWSTR pszShellExecuteCommand);
  LRESULT           SHShellFolderView_Message(                   HWND hwnd, UINT uMsg, LPARAM lparam);
  HRESULT           SHShowManageLibraryUI(                       IShellItem* psiLibrary, HWND hwndOwner, LPCWSTR pszTitle, LPCWSTR pszInstruction, LIBRARYMANAGEDIALOGOPTIONS lmdOptions);
  PIDLIST_ABSOLUTE  SHSimpleIDListFromPath(                      LPCWSTR pszPath);
  HRESULT           SHStartNetConnectionDialogW(                 HWND hwnd, LPCWSTR pszRemoteName, DWORD dwType);
  BOOL              SHTestTokenMembership(                       HANDLE hToken, ULONG ulRID);
  void              SHUpdateImage(                               LPCTSTR pszHashItem, int iIndex, UINT uFlags, int iImageIndex);
  BOOL              SHValidateUNC(                               HWND hwndOwner, LPWSTR pszFile, UINT fConnect);
  BOOL              SignalFileOpen(                              PCIDLIST_ABSOLUTE pidl);
  HRESULT           StgMakeUniqueName(                           IStorage* pstgParent, PCWSTR pszFileSpec, STGM_FLAGS grfMode, REFIID riid, void** ppv);
  BOOL              Win32DeleteFile(                             LPCTSTR pszFileName);
  HINSTANCE         WOWShellExecute(                             HWND hwnd, LPCTSTR lpOperation, LPCTSTR lpFile, LPCTSTR lpParameters, LPCTSTR lpDirectory, ShowWindowCmd nShowCmd, void* lpfnCBWinExec);
  BOOL              WriteCabinetState(                           CABINETSTATE* pcs);
  VOID              RunFileDlg(                                  HWND hwndOwner, HICON hIcon, LPCWSTR lpszDirectory, LPCWSTR lpszTitle, LPCWSTR lpszDescription, RunFileDlgFlags uFlags);
  BOOL              StrRetToStrN(                                LPTSTR pszOut, UINT cchOut, LPSTRRET pStrRet, LPCITEMIDLIST pidl);
  int               PifMgr_CloseProperties(                      HANDLE hProps, UINT flOpt);
  HANDLE            PifMgr_OpenProperties(                       LPCWSTR pszApp, LPCWSTR lpszPIF, UINT hInf, UINT flOpt);
  int               PifMgr_GetProperties(                        HANDLE hProps, LPCSTR pszGroup, VOID* lpProps, int cbProps, UINT flOpt);
  int               PifMgr_SetProperties(                        HANDLE hProps, LPCSTR pszGroup, VOID* lpProps, int cbProps, UINT flOpt);
  HRESULT           SHAddDefaultPropertiesByExt(                 PCWSTR pszExt, IPropertyStore* pPropStore);
  HRESULT           SHGetPropertyStoreForWindow(                 HWND hwnd, REFIID riid, void** ppv);
  HRESULT           SHGetPropertyStoreFromIDList(                PCIDLIST_ABSOLUTE pidl, GETPROPERTYSTOREFLAGS flags, REFIID riid, void** ppv);
  HRESULT           SHGetPropertyStoreFromParsingName(           PCWSTR pszPath, IBindCtx* pbc, GETPROPERTYSTOREFLAGS flags, REFIID riid, void** ppv);
  HRESULT           SHPropStgCreate(                             IPropertySetStorage* psstg, REFFMTID fmtid, CLSID* pclsid, DWORD grfFlags, STGM_FLAGS grfMode, DWORD dwDisposition, IPropertyStorage** ppstg, UINT* puCodePage);
  HRESULT           SHPropStgReadMultiple(                       IPropertyStorage* pps, CodePageEnum uCodePage, ULONG cpspec, PROPSPEC[] rgpspec, PROPVARIANT[] rgvar);
  HRESULT           SHPropStgWriteMultiple(                      IPropertyStorage* pps, UINT* uCodePage, ULONG cpspec, PROPID propidNameFirst);
  LPWSTR            AddCommasExportW(                            DWORD value, LPWSTR pwszBuf);
  void              AppCompat_RunDLLW(                           HWND unusedHwnd, HINSTANCE unusedHinstance, LPWSTR commandLine, int unusedInt);
  HRESULT           CheckStagingArea(                            );
  HRESULT           CreateAutoListParser(                        REFIID riid, PVOID* ppv);
  HRESULT           CreateInfoTipFromItem(                       IShellFolder2* psf, ITEMIDLIST* pidl, LPCWSTR pText, REFIID riid, PVOID* ppv);
  HRESULT           CreateInfoTipFromItem2(                      IShellFolder2* psf, ITEMIDLIST* pidl, PROPERTYKEY* pPropKey, LPCWSTR pText, REFIID riid, PVOID* ppv);
  void              DisconnectWindowDialog(                      HWND hwndUnused);
  HRESULT           GetAppPathFromLink(                          IShellItem* pItem, LPWSTR pwszPathBuffer, DWORD dwBufferLen);
  BOOL              GetSqmableFileName(                          LPCWSTR pwszFileName, LPWSTR pwszSqmName, UINT sqmNameBufLen);
  int               Int64ToString(                               INT64 number, LPWSTR pwszBuf, UINT bufLen, BOOL useNumberFormat, NUMBERFMT* pFormatInfo, NUMBERFMT_FLAGS dwFlags);
  BOOL              IsElevationRequired(                         LPCWSTR lpwszExeFile);
  BOOL              IsSearchEnabled(                             );
  int               LargeIntegerToString(                        LARGE_INTEGER* pNumber, LPWSTR pwszBuf, UINT bufLen, BOOL useNumberFormat, NUMBERFMT* pFormatInfo, NUMBERFMT_FLAGS dwFlags);
  HRESULT           PathGetPathDisplayName(                      LPCWSTR pwszPath, LPWSTR pwszDisplayName, DWORD displayNameLen);
  BOOL              PathIsTemporary(                             LPCTSTR pszFile);
  void              Printer_AddPrinterPropPages(                 LPCWSTR printer, PROPSHEETHEADER* pPropHeader);
  void              Printer_LoadIconsW(                          LPCWSTR printerName, HICON* phLargeIcon, HICON* phSmallIcon);
  BOOL              Printers_RegisterWindowW(                    LPCWSTR pwszPrinter, DWORD pidlType, BOOL* pWinCreated, HWND* phwnd);
  void              Printers_UnregisterWindow(                   CLASSPIDL* pClassPidl, HWND hwnd);
  HRESULT           RefreshBrowserLayout(                        IShellItem* pItem);
  int               RunAsNewUser_RunDLLW(                        HWND hWnd, HINSTANCE hIinstance, LPCWSTR lpszFileMapName, ShowWindowCmd nCmdShow);
  HRESULT           SHGetUserDisplayName(                        LPWSTR pwszName, UINT pBufLen);
  HRESULT           SHGetUserPicturePathEx(                      LPCWSTR pwszUserOrPicName, SGUPP_FLAGS sguppFlags, LPCWSTR pwszDesiredSrcExt, LPWSTR pwszPicPath, UINT picPathLen, LPWSTR pwszSrcPath, UINT srcLen);
  void              SHHelpShortcuts_RunDLL(                      HWND hwndParent, HINSTANCE unusedHinstance, LPCTSTR commandLine, int unusedInt);
  HRESULT           SHResolveUserNames(                          LPCWSTR pwszSids, LPWSTR pwszNames, UINT nameLen);
  void              SHSettingsChanged(                           WPARAM wParam, LPCWSTR lParam);
  BOOL              SHShouldShowWizards(                         IUnknown* pUnk);
  BOOL              SHTestTokenPrivilegeW(                       HANDLE hToken, LPCWSTR pwszPrivilege);
  HRESULT           ShellExecCmdLine(                            HWND hwnd, LPCWSTR pwszCommand, LPCWSTR pwszStartDir, ShowWindowCmd nShow, LPVOID pUnused, SECL_FLAGS dwSeclFlags);
  LPWSTR            ShortSizeFormatExportW(                      DWORD value, LPWSTR pwszBuf);
]]
ffi.load( 'Shell32.dll' )

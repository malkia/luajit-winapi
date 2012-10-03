require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/gdi' )
require( 'ffi/winapi/headers/registry' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* DFConstraint; //Interface
  typedef void* DFConstraint; //Interface
  typedef void* DShellFolderViewEvents; //Interface
  typedef void* Folder; //Interface
  typedef void* Folder2; //Interface
  typedef void* Folder3; //Interface
  typedef void* FolderItem; //Interface
  typedef void* FolderItem2; //Interface
  typedef void* FolderItems; //Interface
  typedef void* FolderItems2; //Interface
  typedef void* FolderItems3; //Interface
  typedef void* FolderItemVerb; //Interface
  typedef void* FolderItemVerbs; //Interface
  typedef void* IAccessibleObject; //Interface
  typedef void* IACList; //Interface
  typedef void* IACList2; //Interface
  typedef void* IActionProgress; //Interface
  typedef void* IActionProgressDialog; //Interface
  typedef void* IActiveDesktop; //Interface
  typedef void* IActiveDesktopP; //Interface
  typedef void* IADesktopP2; //Interface
  typedef void* IApplicationAssociationRegistration; //Interface
  typedef void* IApplicationAssociationRegistrationUI; //Interface
  typedef void* IApplicationDestinations; //Interface
  typedef void* IApplicationDocumentLists; //Interface
  typedef void* IAssocHandler; //Interface
  typedef void* IAssocHandlerInvoker; //Interface
  typedef void* IAsyncOperation; //Interface
  typedef void* IAttachmentExecute; //Interface
  typedef void* IAutoComplete; //Interface
  typedef void* IAutoComplete2; //Interface
  typedef void* IAutoCompleteDropDown; //Interface
  typedef void* IBandHost; //Interface
  typedef void* IBandSite; //Interface
  typedef void* IBanneredBar; //Interface
  typedef void* IBrowserFrameOptions; //Interface
  typedef void* ICategorizer; //Interface
  typedef void* ICategoryProvider; //Interface
  typedef void* ICDBurn; //Interface
  typedef void* ICDBurnExt; //Interface
  typedef void* IColumnManager; //Interface
  typedef void* IColumnProvider; //Interface
  typedef void* ICommDlgBrowser; //Interface
  typedef void* ICommDlgBrowser2; //Interface
  typedef void* ICommDlgBrowser3; //Interface
  typedef void* IComputerInfoChangeNotify; //Interface
  typedef void* IContextMenu; //Interface
  typedef void* IContextMenu2; //Interface
  typedef void* IContextMenu3; //Interface
  typedef void* IContextMenuCB; //Interface
  typedef void* IContextMenuSite; //Interface
  typedef void* IControlMarkup; //Interface
  typedef void* ICopyHookA; //Interface
  typedef void* ICopyHookW; //Interface
  typedef void* ICreateObject; //Interface
  typedef void* ICurrentItem; //Interface
  typedef void* ICurrentWorkingDirectory; //Interface
  typedef void* ICustomDestinationList; //Interface
  typedef void* IDefaultExtractIconInit; //Interface
  typedef void* IDefViewFrame; //Interface
  typedef void* IDelayedPropertyStoreFactory; //Interface
  typedef void* IDelegateFolder; //Interface
  typedef void* IDelegateItem; //Interface
  typedef void* IDeskBand; //Interface
  typedef void* IDeskBand2; //Interface
  typedef void* IDeskBandInfo; //Interface
  typedef void* IDeskBar; //Interface
  typedef void* IDeskBarClient; //Interface
  typedef void* IDesktopGadget; //Interface
  typedef void* IDestinationStreamFactory; //Interface
  typedef void* IDisplayItem; //Interface
  typedef void* IDockingWindow; //Interface
  typedef void* IDockingWindowFrame; //Interface
  typedef void* IDockingWindowSite; //Interface
  typedef void* IDocViewSite; //Interface
  typedef void* IDragSourceHelper; //Interface
  typedef void* IDragSourceHelper2; //Interface
  typedef void* IDropTargetHelper; //Interface
  typedef void* IDynamicHWHandler; //Interface
  typedef void* IEmptyVolumeCache; //Interface
  typedef void* IEmptyVolumeCache2; //Interface
  typedef void* IEmptyVolumeCacheCallBack; //Interface
  typedef void* IEnumACString; //Interface
  typedef void* IEnumAssocHandlers; //Interface
  typedef void* IEnumerableView; //Interface
  typedef void* IEnumExplorerCommand; //Interface
  typedef void* IEnumExtraSearch; //Interface
  typedef void* IEnumFullIDList; //Interface
  typedef void* IEnumIDList; //Interface
  typedef void* IEnumObjects; //Interface
  typedef void* IEnumReadyCallback; //Interface
  typedef void* IEnumResources; //Interface
  typedef void* IEnumShellImageStore; //Interface
  typedef void* IEnumShellItems; //Interface
  typedef void* IExecuteCommand; //Interface
  typedef void* IExplorerBrowser; //Interface
  typedef void* IExplorerBrowserEvents; //Interface
  typedef void* IExplorerCommand; //Interface
  typedef void* IExplorerCommandProvider; //Interface
  typedef void* IExplorerCommandState; //Interface
  typedef void* IExplorerPaneVisibility; //Interface
  typedef void* IExtractIconA; //Interface
  typedef void* IExtractIconW; //Interface
  typedef void* IExtractImage; //Interface
  typedef void* IExtractImage2; //Interface
  typedef void* IFileDialog; //Interface
  typedef void* IFileDialog2; //Interface
  typedef void* IFileDialogControlEvents; //Interface
  typedef void* IFileDialogCustomize; //Interface
  typedef void* IFileDialogEvents; //Interface
  typedef void* IFileIsInUse; //Interface
  typedef void* IFileOpenDialog; //Interface
  typedef void* IFileOperation; //Interface
  typedef void* IFileOperationProgressSink; //Interface
  typedef void* IFileSaveDialog; //Interface
  typedef void* IFileSearchBand; //Interface
  typedef void* IFileSystemBindData; //Interface
  typedef void* IFileSystemBindData2; //Interface
  typedef void* IFileViewerSite; //Interface
  typedef void* IFolderBandPriv; //Interface
  typedef void* IFolderFilter; //Interface
  typedef void* IFolderFilterSite; //Interface
  typedef void* IFolderView; //Interface
  typedef void* IFolderView2; //Interface
  typedef void* IFolderViewHost; //Interface
  typedef void* IFolderViewOC; //Interface
  typedef void* IFolderViewOptions; //Interface
  typedef void* IFolderViewSettings; //Interface
  typedef void* IHomeGroup; //Interface
  typedef void* IHWEventHandler; //Interface
  typedef void* IHWEventHandler2; //Interface
  typedef void* IIdentityName; //Interface
  typedef void* IImageRecompress; //Interface
  typedef void* IInitializeCommand; //Interface
  typedef void* IInitializeNetworkFolder; //Interface
  typedef void* IInitializeObject; //Interface
  typedef void* IInitializeWithBindCtx; //Interface
  typedef void* IInitializeWithFile; //Interface
  typedef void* IInitializeWithItem; //Interface
  typedef void* IInitializeWithPropertyStore; //Interface
  typedef void* IInitializeWithStream; //Interface
  typedef void* IInputObject; //Interface
  typedef void* IInputObject2; //Interface
  typedef void* IInputObjectSite; //Interface
  typedef void* IInsertItem; //Interface
  typedef void* IIOCancelInformation; //Interface
  typedef void* IItemNameLimits; //Interface
  typedef void* IKnownFolder; //Interface
  typedef void* IKnownFolderManager; //Interface
  typedef void* IMarkupCallback; //Interface
  typedef void* IMenuBand; //Interface
  typedef void* IMenuPopup; //Interface
  typedef void* IModalWindow; //Interface
  typedef void* INamedPropertyBag; //Interface
  typedef void* INamedPropertyStore; //Interface
  typedef void* INameSpaceTreeAccessible; //Interface
  typedef void* INameSpaceTreeControl; //Interface
  typedef void* INameSpaceTreeControl2; //Interface
  typedef void* INameSpaceTreeControlCustomDraw; //Interface
  typedef void* INameSpaceTreeControlDropHandler; //Interface
  typedef void* INameSpaceTreeControlEvents; //Interface
  typedef void* INameSpaceTreeControlFolderCapabilities; //Interface
  typedef void* INamespaceWalk; //Interface
  typedef void* INamespaceWalkCB; //Interface
  typedef void* INamespaceWalkCB2; //Interface
  typedef void* INewMenuClient; //Interface
  typedef void* INewShortcutHookA; //Interface
  typedef void* INewShortcutHookW; //Interface
  typedef void* INewWDEvents; //Interface
  typedef void* INewWindowManager; //Interface
  typedef void* IObjectArray; //Interface
  typedef void* IObjectCollection; //Interface
  typedef void* IObjectProvider; //Interface
  typedef void* IObjectWithAppUserModelID; //Interface
  typedef void* IObjectWithBackReferences; //Interface
  typedef void* IObjectWithCancelEvent; //Interface
  typedef void* IObjectWithFolderEnumMode; //Interface
  typedef void* IObjectWithProgID; //Interface
  typedef void* IObjectWithPropertyKey; //Interface
  typedef void* IObjectWithSelection; //Interface
  typedef void* IObjMgr; //Interface
  typedef void* IOpenControlPanel; //Interface
  typedef void* IOpenSearchSource; //Interface
  typedef void* IOperationsProgressDialog; //Interface
  typedef void* IParentAndItem; //Interface
  typedef void* IParseAndCreateItem; //Interface
  typedef void* IPersistFolder; //Interface
  typedef void* IPersistFolder2; //Interface
  typedef void* IPersistFolder3; //Interface
  typedef void* IPersistIDList; //Interface
  typedef void* IPersistSerializedPropStorage; //Interface
  typedef void* IPersistSerializedPropStorage2; //Interface
  typedef void* IPreviewHandler; //Interface
  typedef void* IPreviewHandlerFrame; //Interface
  typedef void* IPreviewHandlerVisuals; //Interface
  typedef void* IPreviewItem; //Interface
  typedef void* IPreviousVersionsInfo; //Interface
  typedef void* IProfferService; //Interface
  typedef void* IProgressDialog; //Interface
  typedef void* IPropertySystemChangeNotify; //Interface
  typedef void* IPublishingWizard; //Interface
  typedef void* IQueryAssociations; //Interface
  typedef void* IQueryCancelAutoPlay; //Interface
  typedef void* IQueryCodePage; //Interface
  typedef void* IQueryContinue; //Interface
  typedef void* IQueryInfo; //Interface
  typedef void* IRegTreeItem; //Interface
  typedef void* IRelatedItem; //Interface
  typedef void* IRemoteComputer; //Interface
  typedef void* IResolveShellLink; //Interface
  typedef void* IResultsFolder; //Interface
  typedef void* IRunnableTask; //Interface
  typedef void* ISearchBoxInfo; //Interface
  typedef void* ISearchContext; //Interface
  typedef void* ISearchFolderItemFactory; //Interface
  typedef void* ISharedBitmap; //Interface
  typedef void* ISharingConfigurationManager; //Interface
  typedef void* IShellBrowser; //Interface
  typedef void* IShellChangeNotify; //Interface
  typedef void* IShellDetails; //Interface
  typedef void* IShellDispatch; //Interface
  typedef void* IShellDispatch2; //Interface
  typedef void* IShellDispatch3; //Interface
  typedef void* IShellDispatch4; //Interface
  typedef void* IShellDispatch5; //Interface
  typedef void* IShellExecuteHookA; //Interface
  typedef void* IShellExecuteHookW; //Interface
  typedef void* IShellExtInit; //Interface
  typedef void* IShellFolder; //Interface
  typedef void* IShellFolder2; //Interface
  typedef void* IShellFolderBand; //Interface
  typedef void* IShellFolderView; //Interface
  typedef void* IShellFolderViewCB; //Interface
  typedef void* IShellFolderViewDual; //Interface
  typedef void* IShellFolderViewDual2; //Interface
  typedef void* IShellFolderViewDual3; //Interface
  typedef void* IShellIcon; //Interface
  typedef void* IShellIconOverlay; //Interface
  typedef void* IShellIconOverlayIdentifier; //Interface
  typedef void* IShellIconOverlayManager; //Interface
  typedef void* IShellImageData; //Interface
  typedef void* IShellImageDataAbort; //Interface
  typedef void* IShellImageDataFactory; //Interface
  typedef void* IShellImageStore; //Interface
  typedef void* IShellItem; //Interface
  typedef void* IShellItem2; //Interface
  typedef void* IShellItemArray; //Interface
  typedef void* IShellItemFilter; //Interface
  typedef void* IShellItemImageFactory; //Interface
  typedef void* IShellItemResources; //Interface
  typedef void* IShellLibrary; //Interface
  typedef void* IShellLinkA; //Interface
  typedef void* IShellLinkDataList; //Interface
  typedef void* IShellLinkDual; //Interface
  typedef void* IShellLinkDual2; //Interface
  typedef void* IShellLinkW; //Interface
  typedef void* IShellMenu; //Interface
  typedef void* IShellMenuCallback; //Interface
  typedef void* IShellPropSheetExt; //Interface
  typedef void* IShellRunDll; //Interface
  typedef void* IShellTaskScheduler; //Interface
  typedef void* IShellView; //Interface
  typedef void* IShellView2; //Interface
  typedef void* IShellView3; //Interface
  typedef void* IStartMenuPinnedList; //Interface
  typedef void* IStreamAsync; //Interface
  typedef void* IStreamUnbufferedInfo; //Interface
  typedef void* ITaskbarList; //Interface
  typedef void* ITaskbarList2; //Interface
  typedef void* ITaskbarList3; //Interface
  typedef void* ITaskbarList4; //Interface
  typedef void* IThumbnailCache; //Interface
  typedef void* IThumbnailCapture; //Interface
  typedef void* IThumbnailHandlerFactory; //Interface
  typedef void* IThumbnailProvider; //Interface
  typedef void* ITranscodeImage; //Interface
  typedef void* ITransferAdviseSink; //Interface
  typedef void* ITransferDestination; //Interface
  typedef void* ITransferMediumItem; //Interface
  typedef void* ITransferSource; //Interface
  typedef void* ITrayDeskBand; //Interface
  typedef void* IUpdateIDList; //Interface
  typedef void* IURLSearchHook; //Interface
  typedef void* IURLSearchHook2; //Interface
  typedef void* IUserAccountChangeCallback; //Interface
  typedef void* IUserNotification; //Interface
  typedef void* IUserNotification2; //Interface
  typedef void* IUserNotificationCallback; //Interface
  typedef void* IUseToBrowseItem; //Interface
  typedef void* IViewStateIdentityItem; //Interface
  typedef void* IVisualProperties; //Interface
  typedef void* IWebWizardExtension; //Interface
  typedef void* IWebWizardHost; //Interface
  typedef void* IWizardExtension; //Interface
  typedef void* IWizardSite; //Interface
  typedef void* IObjectArray; //Interface
  typedef void* IEnumGUID; //Interface
  typedef void* IPropertyChangeArray; //Interface
  typedef void* IXMLDOMDocument; //Interface
  typedef void* ICondition; //Interface
  typedef void* IPropertyDescriptionList; //Interface
  typedef void* IPropertyStore; //Interface
  typedef HANDLE HDWP; //Alias
  typedef GUID SHELLVIEWID; //Alias
  typedef GUID KNOWNFOLDERID; //Alias
  typedef KNOWNFOLDERID *REFKNOWNFOLDERID; //Pointer
  typedef GUID TASKOWNERID; //Alias
  typedef TASKOWNERID *REFTASKOWNERID; //Pointer
  typedef GUID FOLDERTYPEID; //Alias
  typedef FOLDERTYPEID *REFFOLDERTYPEID; //Pointer
  typedef GUID EXPLORERPANE; //Alias
  typedef EXPLORERPANE *REFEXPLORERPANE; //Pointer
  typedef HRESULT DEPRECATED_HRESULT; //Alias
  typedef LPARAM LPFNSVADDPROPSHEETPAGE; //Alias
  typedef LPARAM LPTBBUTTONSB; //Alias
  typedef HANDLE HTHEME; //Alias
  typedef PROPERTYKEY SHCOLUMNID; //Alias
  typedef SHCOLUMNID *LPCSHCOLUMNID; //Pointer
  typedef LPVOID BFFCALLBACK; //Alias
  typedef double DATE; //Alias
  typedef BYTE Image; //Alias
  typedef struct PREVIEWHANDLERFRAMEINFO {
    HACCEL haccel;
    UINT cAccelEntries;
  } PREVIEWHANDLERFRAMEINFO;
# pragma pack( push, 1 )
  typedef struct SHITEMID {
    USHORT cb;
    BYTE abID[1];
  } SHITEMID;
# pragma pack( pop )
  typedef SHITEMID *LPSHITEMID; //Pointer
# pragma pack( push, 1 )
  typedef struct ITEMIDLIST {
    SHITEMID mkid;
  } ITEMIDLIST;
# pragma pack( pop )
  typedef ITEMIDLIST *LPITEMIDLIST; //Pointer
  typedef ITEMIDLIST *LPCITEMIDLIST; //Pointer
  typedef ITEMIDLIST *PIDLIST_ABSOLUTE; //Pointer
  typedef ITEMIDLIST *PCIDLIST_ABSOLUTE; //Pointer
  typedef ITEMIDLIST *PIDLIST_RELATIVE; //Pointer
  typedef ITEMIDLIST *PUIDLIST_RELATIVE; //Pointer
  typedef ITEMIDLIST *PCUIDLIST_RELATIVE; //Pointer
  typedef ITEMIDLIST *PUITEMID_CHILD; //Pointer
  typedef ITEMIDLIST *PITEMID_CHILD; //Pointer
  typedef ITEMIDLIST *PCUITEMID_CHILD; //Pointer
  typedef PCUITEMID_CHILD *PCUITEMID_CHILD_ARRAY; //Pointer
  typedef PCUIDLIST_RELATIVE *PCUIDLIST_RELATIVE_ARRAY; //Pointer
  typedef PCIDLIST_ABSOLUTE *PCIDLIST_ABSOLUTE_ARRAY; //Pointer
  typedef UINT STRRET_TYPE; //Alias
# pragma pack( push, 8 )
  typedef union WINAPI_STRRET_u {
    LPWSTR pOleStr;
    UINT uOffset;
    char cStr[260];
  } WINAPI_STRRET_u;
# pragma pack( pop )
# pragma pack( push, 8 )
  typedef struct STRRET {
    STRRET_TYPE uType;
    WINAPI_STRRET_u ;
  } STRRET;
# pragma pack( pop )
  typedef STRRET *LPSTRRET; //Pointer
  typedef UINT WINAPI_SHELLDETAILS_fmt; //Alias
  typedef struct SHELLDETAILS {
    WINAPI_SHELLDETAILS_fmt fmt;
    int cxChar;
    STRRET str;
  } SHELLDETAILS;
  typedef UINT WINAPI_CSIDL; //Alias
# pragma pack( push, 8 )
  typedef struct PERSIST_FOLDER_TARGET_INFO {
    PIDLIST_ABSOLUTE pidlTargetFolder;
    WCHAR szTargetParsingName[260];
    WCHAR szNetworkProvider[260];
    WINAPI_FileAttributes dwAttributes;
    WINAPI_CSIDL csidl;
  } PERSIST_FOLDER_TARGET_INFO;
# pragma pack( pop )
  typedef struct SHELL_ITEM_RESOURCE {
    GUID guidType;
    WCHAR szName[260];
  } SHELL_ITEM_RESOURCE;
  typedef DWORD CM_MASK; //Alias
  typedef DWORD CM_STATE; //Alias
  typedef UINT CM_SET_WIDTH_VALUE; //Alias
  static const UINT CM_WIDTH_USEDEFAULT = -1;
  static const UINT CM_WIDTH_AUTOSIZE = -2;
  typedef struct CM_COLUMNINFO {
    DWORD cbSize;
    CM_MASK dwMask;
    CM_STATE dwState;
    UINT uWidth;
    CM_SET_WIDTH_VALUE uDefaultWidth;
    UINT uIdealWidth;
    WCHAR wszName[80];
  } CM_COLUMNINFO;
  typedef UINT CATEGORYINFO_FLAGS; //Alias
  typedef struct CATEGORY_INFO {
    CATEGORYINFO_FLAGS cif;
    WCHAR wszName[260];
  } CATEGORY_INFO;
  typedef DWORD WINAPI_DBIM; //Alias
  typedef DWORD WINAPI_DBIMF; //Alias
# pragma pack( push, 8 )
  typedef struct DESKBANDINFO {
    WINAPI_DBIM dwMask;
    POINTL ptMinSize;
    POINTL ptMaxSize;
    POINTL ptIntegral;
    POINTL ptActual;
    WCHAR wszTitle[256];
    WINAPI_DBIMF dwModeFlags;
    COLORREF crBkgnd;
  } DESKBANDINFO;
# pragma pack( pop )
  typedef struct EXTRASEARCH {
    GUID guidSearch;
    WCHAR wszFriendlyName[80];
    WCHAR wszUrl[2084];
  } EXTRASEARCH;
  typedef DWORD THUMBBUTTONFLAGS; //Alias
  typedef DWORD THUMBBUTTONMASK; //Alias
# pragma pack( push, 8 )
  typedef struct THUMBBUTTON {
    THUMBBUTTONMASK dwMask;
    UINT iId;
    UINT iBitmap;
    HICON hIcon;
    WCHAR szTip[260];
    THUMBBUTTONFLAGS dwFlags;
  } THUMBBUTTON;
# pragma pack( pop )
  typedef THUMBBUTTON *LPTHUMBBUTTON; //Pointer
  typedef DWORD NSTCITEMSTATE; //Alias
  typedef struct NSTCCUSTOMDRAW {
    IShellItem* psi;
    UINT uItemState;
    NSTCITEMSTATE nstcis;
    LPCWSTR pszText;
    int iImage;
    HIMAGELIST himl;
    int iLevel;
    int iIndent;
  } NSTCCUSTOMDRAW;
  typedef UINT FOLDERVIEWMODE; //Alias
  static const UINT FVM_AUTO = -1;
  static const UINT FVM_FIRST = 1;
  static const UINT FVM_ICON = 1;
  static const UINT FVM_SMALLICON = 2;
  static const UINT FVM_LIST = 3;
  static const UINT FVM_DETAILS = 4;
  static const UINT FVM_THUMBNAIL = 5;
  static const UINT FVM_TILE = 6;
  static const UINT FVM_THUMBSTRIP = 7;
  static const UINT FVM_CONTENT = 8;
  typedef UINT FOLDERFLAGS; //Alias
  typedef struct FOLDERSETTINGS {
    FOLDERVIEWMODE ViewMode;
    FOLDERFLAGS fFlags;
  } FOLDERSETTINGS;
  typedef FOLDERSETTINGS *LPFOLDERSETTINGS; //Pointer
  typedef FOLDERSETTINGS *LPCFOLDERSETTINGS; //Pointer
  typedef struct SV2CVW2_PARAMS {
    DWORD cbSize;
    IShellView* psvPrev;
    LPCFOLDERSETTINGS pfs;
    IShellBrowser* psbOwner;
    RECT* prcView;
    WINAPI_SHELLVIEWID* pvid;
    HWND hwndView;
  } SV2CVW2_PARAMS;
  typedef SV2CVW2_PARAMS *LPSV2CVW2_PARAMS; //Pointer
  typedef UINT KF_CATEGORY; //Alias
  static const UINT KF_CATEGORY_VIRTUAL = 1;
  static const UINT KF_CATEGORY_FIXED = 2;
  static const UINT KF_CATEGORY_COMMON = 3;
  static const UINT KF_CATEGORY_PERUSER = 4;
  typedef DWORD KF_DEFINITION_FLAGS; //Alias
  typedef struct KNOWNFOLDER_DEFINITION {
    KF_CATEGORY category;
    LPWSTR pszName;
    LPWSTR pszDescription;
    KNOWNFOLDERID fidParent;
    LPWSTR pszRelativePath;
    LPWSTR pszParsingName;
    LPWSTR pszTooltip;
    LPWSTR pszLocalizedName;
    LPWSTR pszIcon;
    LPWSTR pszSecurity;
    DWORD dwAttributes;
    KF_DEFINITION_FLAGS kfdFlags;
    FOLDERTYPEID ftidType;
  } KNOWNFOLDER_DEFINITION;
  typedef int SORTDIRECTION; //Alias
  static const int SORT_DESCENDING = -1;
  static const int SORT_ASCENDING = 1;
  typedef struct SORTCOLUMN {
    PROPERTYKEY propkey;
    SORTDIRECTION direction;
  } SORTCOLUMN;
# pragma pack( push, 8 )
  typedef struct BANDSITEINFO {
    DWORD dwMask;
    DWORD dwState;
    DWORD dwStyle;
  } BANDSITEINFO;
# pragma pack( pop )
  typedef DWORD WINAPI_CMIC_Mask; //Alias
# pragma pack( push, 8 )
  typedef struct CMINVOKECOMMANDINFO {
    DWORD cbSize;
    WINAPI_CMIC_Mask fMask;
    HWND hwnd;
    LPCSTR lpVerb;
    LPCSTR lpParameters;
    LPCSTR lpDirectory;
    WINAPI_ShowWindowCmd nShow;
    DWORD dwHotKey;
    HANDLE hIcon;
  } CMINVOKECOMMANDINFO;
# pragma pack( pop )
# pragma pack( push, 8 )
  typedef struct SHDRAGIMAGE {
    SIZE sizeDragImage;
    POINT ptOffset;
    HBITMAP hbmpDragImage;
    COLORREF crColorKey;
  } SHDRAGIMAGE;
# pragma pack( pop )
  typedef SHDRAGIMAGE *LPSHDRAGIMAGE; //Pointer
  typedef DWORD WINAPI_SMDATA_Mask; //Alias
# pragma pack( push, 8 )
  typedef struct SMDATA {
    WINAPI_SMDATA_Mask dwMask;
    DWORD dwFlags;
    HMENU hmenu;
    HWND hwnd;
    UINT uId;
    UINT uIdParent;
    UINT uIdAncestor;
    IUnknown* punk;
    PIDLIST_ABSOLUTE pidlFolder;
    PUITEMID_CHILD pidlItem;
    IShellFolder* psf;
    void* pvUserData;
  } SMDATA;
# pragma pack( pop )
  typedef SMDATA *LPSMDATA; //Pointer
  typedef struct COMDLG_FILTERSPEC {
    LPCWSTR pszName;
    LPCWSTR pszSpec;
  } COMDLG_FILTERSPEC;
  typedef UINT FDAP; //Alias
  static const UINT FDAP_BOTTOM = 0;
  static const UINT FDAP_TOP = 1;
  typedef DWORD SHCOLSTATEF; //Alias
  typedef UINT FVTEXTTYPE; //Alias
  static const UINT FVST_EMPTYTEXT = 0;
  typedef UINT SPACTION; //Alias
  static const UINT SPACTION_NONE = 0;
  static const UINT SPACTION_MOVING = 1;
  static const UINT SPACTION_COPYING = 2;
  static const UINT SPACTION_RECYCLING = 3;
  static const UINT SPACTION_APPLYINGATTRIBS = 4;
  static const UINT SPACTION_DOWNLOADING = 5;
  static const UINT SPACTION_SEARCHING_INTERNET = 6;
  static const UINT SPACTION_CALCULATING = 7;
  static const UINT SPACTION_UPLOADING = 8;
  static const UINT SPACTION_SEARCHING_FILES = 9;
  static const UINT SPACTION_DELETING = 10;
  static const UINT SPACTION_RENAMING = 11;
  static const UINT SPACTION_FORMATTING = 12;
  static const UINT SPACTION_COPY_MOVING = 13;
  typedef UINT SPBEGINF; //Alias
  typedef UINT SPINITF; //Alias
  typedef UINT ASSOCIATIONTYPE; //Alias
  static const UINT AT_FILEEXTENSION = 0;
  static const UINT AT_URLPROTOCOL = 1;
  static const UINT AT_STARTMENUCLIENT = 2;
  static const UINT AT_MIMETYPE = 3;
  typedef UINT APPDOCLISTTYPE; //Alias
  static const UINT ADLT_RECENT = 0;
  static const UINT ADLT_FREQUENT = 1;
  typedef UINT ATTACHMENT_PROMPT; //Alias
  static const UINT ATTACHMENT_PROMPT_NONE = 0;
  static const UINT ATTACHMENT_PROMPT_SAVE = 0x1;
  static const UINT ATTACHMENT_PROMPT_EXEC = 0x2;
  static const UINT ATTACHMENT_PROMPT_EXEC_OR_SAVE = 0x3;
  typedef UINT SPTEXT; //Alias
  static const UINT SPTEXT_ACTIONDESCRIPTION = 1;
  static const UINT SPTEXT_ACTIONDETAIL = 2;
  typedef UINT ASSOCIATIONLEVEL; //Alias
  static const UINT AL_MACHINE = 0;
  static const UINT AL_EFFECTIVE = 1;
  static const UINT AL_USER = 2;
  typedef UINT ATTACHMENT_ACTION; //Alias
  static const UINT ATTACHMENT_ACTION_CANCEL = 0;
  static const UINT ATTACHMENT_ACTION_SAVE = 0x1;
  static const UINT ATTACHMENT_ACTION_EXEC = 0x2;
  typedef UINT BROWSERFRAMEOPTIONS; //Alias
  typedef UINT CDBE_ACTIONS; //Alias
  typedef UINT CATSORT_FLAGS; //Alias
  typedef UINT CM_ENUM_FLAGS; //Alias
  typedef UINT KNOWNDESTCATEGORY; //Alias
  static const UINT KDC_FREQUENT = 1;
  static const UINT KDC_RECENT = 2;
  typedef UINT EXPCMDSTATE; //Alias
  typedef UINT FILEOPENDIALOGOPTIONS; //Alias
  typedef UINT FDE_OVERWRITE_RESPONSE; //Alias
  static const UINT FDEOR_DEFAULT = 0;
  static const UINT FDEOR_ACCEPT = 1;
  static const UINT FDEOR_REFUSE = 2;
  typedef UINT CDCONTROLSTATEF; //Alias
  typedef UINT FDE_SHAREVIOLATION_RESPONSE; //Alias
  static const UINT FDESVR_DEFAULT = 0;
  static const UINT FDESVR_ACCEPT = 1;
  static const UINT FDESVR_REFUSE = 2;
  typedef UINT FILE_USAGE_TYPE; //Alias
  static const UINT FUT_PLAYING = 0;
  static const UINT FUT_EDITING = 1;
  static const UINT FUT_GENERIC = 2;
  typedef UINT EXPLORERPANESTATE; //Alias
  typedef UINT FOLDERVIEWOPTIONS; //Alias
  typedef UINT FOLDERLOGICALVIEWMODE; //Alias
  static const UINT FLVM_UNSPECIFIED = -1;
  static const UINT FLVM_FIRST = 1;
  static const UINT FLVM_DETAILS = 1;
  static const UINT FLVM_TILES = 2;
  static const UINT FLVM_ICONS = 3;
  static const UINT FLVM_LIST = 4;
  static const UINT FLVM_CONTENT = 5;
  typedef UINT NSTCSTYLE; //Alias
  typedef UINT NSTCSTYLE2; //Alias
  typedef UINT PDOPSTATUS; //Alias
  static const UINT PDOPS_RUNNING = 1;
  static const UINT PDOPS_PAUSED = 2;
  static const UINT PDOPS_CANCELLED = 3;
  static const UINT PDOPS_STOPPED = 4;
  static const UINT PDOPS_ERRORS = 5;
  typedef DWORD PDMODE; //Alias
  typedef UINT NSTCEHITTEST; //Alias
  typedef UINT NSTCFOLDERCAPABILITIES; //Alias
  typedef UINT NMCII_FLAGS; //Alias
  typedef UINT FOLDER_ENUM_MODE; //Alias
  static const UINT FEM_VIEWRESULT = 0;
  static const UINT FEM_NAVIGATION = 1;
  typedef UINT TRANSFER_ADVISE_STATE; //Alias
  typedef UINT NSTCECLICKTYPE; //Alias
  static const UINT NSTCECT_LBUTTON = 0x1;
  static const UINT NSTCECT_MBUTTON = 0x2;
  static const UINT NSTCECT_RBUTTON = 0x3;
  static const UINT NSTCECT_DBLCLICK = 0x4;
  typedef UINT TRANSFER_SOURCE_FLAGS; //Alias
  typedef UINT TBPFLAG; //Alias
  typedef UINT LIBRARYFOLDERFILTER; //Alias
  static const UINT LFF_FORCEFILESYSTEM = 1;
  static const UINT LFF_STORAGEITEMS = 2;
  static const UINT LFF_ALLITEMS = 3;
  typedef UINT SIATTRIBFLAGS; //Alias
  typedef UINT VPWATERMARKFLAGS; //Alias
  static const UINT VPWF_DEFAULT = 0;
  static const UINT VPWF_ALPHABLEND = 0x1;
  typedef UINT VPCOLORFLAGS; //Alias
  static const UINT VPCF_TEXT = 1;
  static const UINT VPCF_BACKGROUND = 2;
  static const UINT VPCF_SORTCOLUMN = 3;
  static const UINT VPCF_SUBTEXT = 4;
  static const UINT VPCF_TEXTBACKGROUND = 5;
  typedef UINT STPFLAG; //Alias
  typedef UINT EXPPS; //Alias
  static const UINT EXPPS_FILETYPES = 0x1;
  typedef UINT DEFAULTSAVEFOLDERTYPE; //Alias
  static const UINT DSFT_DETECT = 1;
  static const UINT DSFT_PRIVATE = 2;
  static const UINT DSFT_PUBLIC = 3;
  typedef UINT LIBRARYOPTIONFLAGS; //Alias
  static const UINT LOF_DEFAULT = 0;
  static const UINT LOF_PINNEDTONAVPANE = 0x1;
  typedef UINT LIBRARYSAVEFLAGS; //Alias
  typedef UINT SIGDN; //Alias
  static const UINT SIGDN_NORMALDISPLAY = 0;
  static const UINT SIGDN_PARENTRELATIVEPARSING = 0x80018001;
  static const UINT SIGDN_DESKTOPABSOLUTEPARSING = 0x80028000;
  static const UINT SIGDN_PARENTRELATIVEEDITING = 0x80031001;
  static const UINT SIGDN_DESKTOPABSOLUTEEDITING = 0x8004c000;
  static const UINT SIGDN_FILESYSPATH = 0x80058000;
  static const UINT SIGDN_URL = 0x80068000;
  static const UINT SIGDN_PARENTRELATIVEFORADDRESSBAR = 0x8007c001;
  static const UINT SIGDN_PARENTRELATIVE = 0x80080001;
  typedef DWORD SFGAOF; //Alias
  typedef DWORD SICHINTF; //Alias
  typedef UINT SHCONTF; //Alias
  typedef UINT SHGDNF; //Alias
  typedef UINT DEF_SHARE_ID; //Alias
  static const UINT DEFSHAREID_USERS = 1;
  static const UINT DEFSHAREID_PUBLIC = 2;
  typedef UINT SHARE_ROLE; //Alias
  static const UINT SHARE_ROLE_INVALID = -1;
  static const UINT SHARE_ROLE_READER = 0;
  static const UINT SHARE_ROLE_CONTRIBUTOR = 1;
  static const UINT SHARE_ROLE_CO_OWNER = 2;
  static const UINT SHARE_ROLE_OWNER = 3;
  static const UINT SHARE_ROLE_CUSTOM = 4;
  static const UINT SHARE_ROLE_MIXED = 5;
  typedef UINT PROPERTYUI_NAME_FLAGS; //Alias
  static const UINT PUIFNF_DEFAULT = 0;
  static const UINT PUIFNF_MNEMONIC = 0x1;
  typedef UINT PROPERTYUI_FLAGS; //Alias
  typedef UINT PROPERTYUI_FORMAT_FLAGS; //Alias
  typedef UINT HOMEGROUPSHARINGCHOICES; //Alias
  typedef UINT EXPCMDFLAGS; //Alias
  typedef UINT EXPLORER_BROWSER_FILL_FLAGS; //Alias
  typedef UINT KF_REDIRECTION_CAPABILITIES; //Alias
  typedef UINT NSTCROOTSTYLE; //Alias
  typedef UINT CPVIEW; //Alias
  static const UINT CPVIEW_CLASSIC = 0;
  static const UINT CPVIEW_CATEGORY = 1;
  typedef UINT OPPROGDLGF; //Alias
  typedef UINT FFFP_MODE; //Alias
  static const UINT FFFP_EXACTMATCH = 0;
  static const UINT FFFP_NEARESTPARENTMATCH = 1;
  typedef UINT NSTCGNI; //Alias
  static const UINT NSTCGNI_NEXT = 0;
  static const UINT NSTCGNI_NEXTVISIBLE = 1;
  static const UINT NSTCGNI_PREV = 2;
  static const UINT NSTCGNI_PREVVISIBLE = 3;
  static const UINT NSTCGNI_PARENT = 4;
  static const UINT NSTCGNI_CHILD = 5;
  static const UINT NSTCGNI_FIRSTVISIBLE = 6;
  static const UINT NSTCGNI_LASTVISIBLE = 7;
  typedef UINT KF_REDIRECT_FLAGS; //Alias
  typedef UINT NMCSAEI_FLAGS; //Alias
  static const UINT NMCSAEI_SELECT = 0;
  static const UINT NMCSAEI_EDIT = 0x1;
  typedef UINT SIIGBF; //Alias
  typedef UINT MP_POPUPFLAGS; //Alias
  typedef UINT SVSIF; //Alias
  typedef DWORD SV3CVW3_FLAGS; //Alias
  typedef UINT EXPLORER_BROWSER_OPTIONS; //Alias
  typedef UINT PERCEIVED; //Alias
  static const UINT PERCEIVED_TYPE_FIRST = -3;
  static const UINT PERCEIVED_TYPE_CUSTOM = -3;
  static const UINT PERCEIVED_TYPE_UNSPECIFIED = -2;
  static const UINT PERCEIVED_TYPE_FOLDER = -1;
  static const UINT PERCEIVED_TYPE_UNKNOWN = 0;
  static const UINT PERCEIVED_TYPE_TEXT = 1;
  static const UINT PERCEIVED_TYPE_IMAGE = 2;
  static const UINT PERCEIVED_TYPE_AUDIO = 3;
  static const UINT PERCEIVED_TYPE_VIDEO = 4;
  static const UINT PERCEIVED_TYPE_COMPRESSED = 5;
  static const UINT PERCEIVED_TYPE_DOCUMENT = 6;
  static const UINT PERCEIVED_TYPE_SYSTEM = 7;
  static const UINT PERCEIVED_TYPE_APPLICATION = 8;
  static const UINT PERCEIVED_TYPE_GAMEMEDIA = 9;
  static const UINT PERCEIVED_TYPE_CONTACTS = 10;
  typedef DWORD PERCEIVEDFLAG; //Alias
  typedef WORD FILEOP_FLAGS; //Alias
  typedef UINT WINAPI_GIL_INPUT_FLAGS; //Alias
  typedef UINT WINAPI_GIL_OUTPUT_FLAGS; //Alias
  typedef UINT WINAPI_MessageBoxType; //Alias
  typedef int WINAPI_MessageBoxResult; //Alias
  static const int IDOK = 1;
  static const int IDCANCEL = 2;
  static const int IDABORT = 3;
  static const int IDRETRY = 4;
  static const int IDIGNORE = 5;
  static const int IDYES = 6;
  static const int IDNO = 7;
  static const int IDTRYAGAIN = 10;
  static const int IDCONTINUE = 11;
  typedef union WINAPI_SHELLEXECUTEINFO_u {
    HANDLE hIcon;
    HANDLE hMonitor;
  } WINAPI_SHELLEXECUTEINFO_u;
  typedef ULONG WINAPI_SEE_MASK; //Alias
  typedef UINT_PTR WINAPI_SEE_HINSTANCE; //Alias
  static const UINT_PTR SE_ERR_FNF = 2;
  static const UINT_PTR SE_ERR_PNF = 3;
  static const UINT_PTR SE_ERR_ACCESSDENIED = 5;
  static const UINT_PTR SE_ERR_OOM = 8;
  static const UINT_PTR SE_ERR_DLLNOTFOUND = 32;
  static const UINT_PTR SE_ERR_SHARE = 26;
  static const UINT_PTR SE_ERR_ASSOCINCOMPLETE = 27;
  static const UINT_PTR SE_ERR_DDETIMEOUT = 28;
  static const UINT_PTR SE_ERR_DDEFAIL = 29;
  static const UINT_PTR SE_ERR_DDEBUSY = 30;
  static const UINT_PTR SE_ERR_NOASSOC = 31;
  typedef struct SHELLEXECUTEINFO {
    DWORD cbSize;
    WINAPI_SEE_MASK fMask;
    HWND hwnd;
    LPCTSTR lpVerb;
    LPCTSTR lpFile;
    LPCTSTR lpParameters;
    LPCTSTR lpDirectory;
    WINAPI_ShowWindowCmd nShow;
    WINAPI_SEE_HINSTANCE hInstApp;
    void* lpIDList;
    LPCTSTR lpClass;
    HKEY hkeyClass;
    DWORD dwHotKey;
    WINAPI_SHELLEXECUTEINFO_u ;
    HANDLE hProcess;
  } SHELLEXECUTEINFO;
  typedef SHELLEXECUTEINFO *LPSHELLEXECUTEINFO; //Pointer
  typedef DWORD ASSOCF; //Alias
  static const DWORD ASSOCF_INIT_NOREMAPCLSID = 0x00000001;
  static const DWORD ASSOCF_INIT_BYEXENAME = 0x00000002;
  static const DWORD ASSOCF_INIT_DEFAULTTOSTAR = 0x00000004;
  static const DWORD ASSOCF_INIT_DEFAULTTOFOLDER = 0x00000008;
  static const DWORD ASSOCF_NOUSERSETTINGS = 0x00000010;
  static const DWORD ASSOCF_NOTRUNCATE = 0x00000020;
  static const DWORD ASSOCF_VERIFY = 0x00000040;
  static const DWORD ASSOCF_REMAPRUNDLL = 0x00000080;
  static const DWORD ASSOCF_NOFIXUPS = 0x00000100;
  static const DWORD ASSOCF_IGNOREBASECLASS = 0x00000200;
  static const DWORD ASSOCF_INIT_IGNOREUNKNOWN = 0x00000400;
  typedef UINT ASSOCSTR; //Alias
  static const UINT ASSOCSTR_COMMAND = 1;
  static const UINT ASSOCSTR_EXECUTABLE = 2;
  static const UINT ASSOCSTR_FRIENDLYDOCNAME = 3;
  static const UINT ASSOCSTR_FRIENDLYAPPNAME = 4;
  static const UINT ASSOCSTR_NOOPEN = 5;
  static const UINT ASSOCSTR_SHELLNEWVALUE = 6;
  static const UINT ASSOCSTR_DDECOMMAND = 7;
  static const UINT ASSOCSTR_DDEIFEXEC = 8;
  static const UINT ASSOCSTR_DDEAPPLICATION = 9;
  static const UINT ASSOCSTR_DDETOPIC = 10;
  static const UINT ASSOCSTR_INFOTIP = 11;
  static const UINT ASSOCSTR_QUICKTIP = 12;
  static const UINT ASSOCSTR_TILEINFO = 13;
  static const UINT ASSOCSTR_CONTENTTYPE = 14;
  static const UINT ASSOCSTR_DEFAULTICON = 15;
  static const UINT ASSOCSTR_SHELLEXTENSION = 16;
  static const UINT ASSOCSTR_DROPTARGET = 17;
  static const UINT ASSOCSTR_DELEGATEEXECUTE = 18;
  static const UINT ASSOCSTR_MAX = 19;
  typedef UINT ASSOCKEY; //Alias
  static const UINT ASSOCKEY_SHELLEXECCLASS = 1;
  static const UINT ASSOCKEY_APP = 2;
  static const UINT ASSOCKEY_CLASS = 3;
  static const UINT ASSOCKEY_BASECLASS = 4;
  typedef UINT ASSOCDATA; //Alias
  static const UINT ASSOCDATA_MSIDESCRIPTOR = 1;
  static const UINT ASSOCDATA_NOACTIVATEHANDLER = 2;
  static const UINT ASSOCDATA_QUERYCLASSSTORE = 3;
  static const UINT ASSOCDATA_HASPERUSERASSOC = 4;
  static const UINT ASSOCDATA_EDITFLAGS = 5;
  static const UINT ASSOCDATA_VALUE = 6;
  typedef UINT ASSOCENUM; //Alias
  static const UINT ASSOCENUM_NONE = 0;
  typedef struct APPCATEGORYINFO {
    LCID Locale;
    LPWSTR pszDescription;
    GUID AppCategoryId;
  } APPCATEGORYINFO;
  typedef struct APPCATEGORYINFOLIST {
    DWORD cCategory;
    APPCATEGORYINFO* pCategoryInfo;
  } APPCATEGORYINFOLIST;
  typedef UINT WTS_ALPHATYPE; //Alias
  static const UINT WTSAT_UNKNOWN = 0;
  static const UINT WTSAT_RGB = 1;
  static const UINT WTSAT_ARGB = 2;
  typedef DWORD WTS_FLAGS; //Alias
  typedef struct WTS_THUMBNAILID {
    BYTE rgbKey[16];
  } WTS_THUMBNAILID;
  typedef DWORD WTS_CACHEFLAGS; //Alias
  typedef ULONG WINAPI_PROPSPEC_KIND; //Alias
  static const ULONG PRSPEC_LPWSTR = 0;
  static const ULONG PRSPEC_PROPID = 1;
  typedef union WINAPI_PROPSPEC_u {
    PROPID propid;
    LPOLESTR lpwstr;
  } WINAPI_PROPSPEC_u;
  typedef struct PROPSPEC {
    WINAPI_PROPSPEC_KIND ulKind;
    WINAPI_PROPSPEC_u ;
  } PROPSPEC;
  typedef PROPSPEC *PROPSPEC const[]; //Pointer
  typedef UINT WINAPI_SystemParametersInfoEnum; //Alias
  static const UINT SPI_GETBEEP = 0x0001;
  static const UINT SPI_SETBEEP = 0x0002;
  static const UINT SPI_GETMOUSE = 0x0003;
  static const UINT SPI_SETMOUSE = 0x0004;
  static const UINT SPI_GETBORDER = 0x0005;
  static const UINT SPI_SETBORDER = 0x0006;
  static const UINT SPI_GETKEYBOARDSPEED = 0x000A;
  static const UINT SPI_SETKEYBOARDSPEED = 0x000B;
  static const UINT SPI_LANGDRIVER = 0x000C;
  static const UINT SPI_ICONHORIZONTALSPACING = 0x000D;
  static const UINT SPI_GETSCREENSAVETIMEOUT = 0x000E;
  static const UINT SPI_SETSCREENSAVETIMEOUT = 0x000F;
  static const UINT SPI_GETSCREENSAVEACTIVE = 0x0010;
  static const UINT SPI_SETSCREENSAVEACTIVE = 0x0011;
  static const UINT SPI_GETGRIDGRANULARITY = 0x0012;
  static const UINT SPI_SETGRIDGRANULARITY = 0x0013;
  static const UINT SPI_SETDESKWALLPAPER = 0x0014;
  static const UINT SPI_SETDESKPATTERN = 0x0015;
  static const UINT SPI_GETKEYBOARDDELAY = 0x0016;
  static const UINT SPI_SETKEYBOARDDELAY = 0x0017;
  static const UINT SPI_ICONVERTICALSPACING = 0x0018;
  static const UINT SPI_GETICONTITLEWRAP = 0x0019;
  static const UINT SPI_SETICONTITLEWRAP = 0x001A;
  static const UINT SPI_GETMENUDROPALIGNMENT = 0x001B;
  static const UINT SPI_SETMENUDROPALIGNMENT = 0x001C;
  static const UINT SPI_SETDOUBLECLKWIDTH = 0x001D;
  static const UINT SPI_SETDOUBLECLKHEIGHT = 0x001E;
  static const UINT SPI_GETICONTITLELOGFONT = 0x001F;
  static const UINT SPI_SETDOUBLECLICKTIME = 0x0020;
  static const UINT SPI_SETMOUSEBUTTONSWAP = 0x0021;
  static const UINT SPI_SETICONTITLELOGFONT = 0x0022;
  static const UINT SPI_GETFASTTASKSWITCH = 0x0023;
  static const UINT SPI_SETFASTTASKSWITCH = 0x0024;
  static const UINT SPI_SETDRAGFULLWINDOWS = 0x0025;
  static const UINT SPI_GETDRAGFULLWINDOWS = 0x0026;
  static const UINT SPI_GETNONCLIENTMETRICS = 0x0029;
  static const UINT SPI_SETNONCLIENTMETRICS = 0x002A;
  static const UINT SPI_GETMINIMIZEDMETRICS = 0x002B;
  static const UINT SPI_SETMINIMIZEDMETRICS = 0x002C;
  static const UINT SPI_GETICONMETRICS = 0x002D;
  static const UINT SPI_SETICONMETRICS = 0x002E;
  static const UINT SPI_SETWORKAREA = 0x002F;
  static const UINT SPI_GETWORKAREA = 0x0030;
  static const UINT SPI_SETPENWINDOWS = 0x0031;
  static const UINT SPI_GETHIGHCONTRAST = 0x0042;
  static const UINT SPI_SETHIGHCONTRAST = 0x0043;
  static const UINT SPI_GETKEYBOARDPREF = 0x0044;
  static const UINT SPI_SETKEYBOARDPREF = 0x0045;
  static const UINT SPI_GETSCREENREADER = 0x0046;
  static const UINT SPI_SETSCREENREADER = 0x0047;
  static const UINT SPI_GETANIMATION = 0x0048;
  static const UINT SPI_SETANIMATION = 0x0049;
  static const UINT SPI_GETFONTSMOOTHING = 0x004A;
  static const UINT SPI_SETFONTSMOOTHING = 0x004B;
  static const UINT SPI_SETDRAGWIDTH = 0x004C;
  static const UINT SPI_SETDRAGHEIGHT = 0x004D;
  static const UINT SPI_SETHANDHELD = 0x004E;
  static const UINT SPI_GETLOWPOWERTIMEOUT = 0x004F;
  static const UINT SPI_GETPOWEROFFTIMEOUT = 0x0050;
  static const UINT SPI_SETLOWPOWERTIMEOUT = 0x0051;
  static const UINT SPI_SETPOWEROFFTIMEOUT = 0x0052;
  static const UINT SPI_GETLOWPOWERACTIVE = 0x0053;
  static const UINT SPI_GETPOWEROFFACTIVE = 0x0054;
  static const UINT SPI_SETLOWPOWERACTIVE = 0x0055;
  static const UINT SPI_SETPOWEROFFACTIVE = 0x0056;
  static const UINT SPI_SETCURSORS = 0x0057;
  static const UINT SPI_SETICONS = 0x0058;
  static const UINT SPI_GETDEFAULTINPUTLANG = 0x0059;
  static const UINT SPI_SETDEFAULTINPUTLANG = 0x005A;
  static const UINT SPI_SETLANGTOGGLE = 0x005B;
  static const UINT SPI_GETWINDOWSEXTENSION = 0x005C;
  static const UINT SPI_SETMOUSETRAILS = 0x005D;
  static const UINT SPI_GETMOUSETRAILS = 0x005E;
  static const UINT SPI_SETSCREENSAVERRUNNING = 0x0061;
  static const UINT SPI_GETFILTERKEYS = 0x0032;
  static const UINT SPI_SETFILTERKEYS = 0x0033;
  static const UINT SPI_GETTOGGLEKEYS = 0x0034;
  static const UINT SPI_SETTOGGLEKEYS = 0x0035;
  static const UINT SPI_GETMOUSEKEYS = 0x0036;
  static const UINT SPI_SETMOUSEKEYS = 0x0037;
  static const UINT SPI_GETSHOWSOUNDS = 0x0038;
  static const UINT SPI_SETSHOWSOUNDS = 0x0039;
  static const UINT SPI_GETSTICKYKEYS = 0x003A;
  static const UINT SPI_SETSTICKYKEYS = 0x003B;
  static const UINT SPI_GETACCESSTIMEOUT = 0x003C;
  static const UINT SPI_SETACCESSTIMEOUT = 0x003D;
  static const UINT SPI_GETSERIALKEYS = 0x003E;
  static const UINT SPI_SETSERIALKEYS = 0x003F;
  static const UINT SPI_GETSOUNDSENTRY = 0x0040;
  static const UINT SPI_SETSOUNDSENTRY = 0x0041;
  static const UINT SPI_GETSNAPTODEFBUTTON = 0x005F;
  static const UINT SPI_SETSNAPTODEFBUTTON = 0x0060;
  static const UINT SPI_GETMOUSEHOVERWIDTH = 0x0062;
  static const UINT SPI_SETMOUSEHOVERWIDTH = 0x0063;
  static const UINT SPI_GETMOUSEHOVERHEIGHT = 0x0064;
  static const UINT SPI_SETMOUSEHOVERHEIGHT = 0x0065;
  static const UINT SPI_GETMOUSEHOVERTIME = 0x0066;
  static const UINT SPI_SETMOUSEHOVERTIME = 0x0067;
  static const UINT SPI_GETWHEELSCROLLLINES = 0x0068;
  static const UINT SPI_SETWHEELSCROLLLINES = 0x0069;
  static const UINT SPI_GETMENUSHOWDELAY = 0x006A;
  static const UINT SPI_SETMENUSHOWDELAY = 0x006B;
  static const UINT SPI_GETWHEELSCROLLCHARS = 0x006C;
  static const UINT SPI_SETWHEELSCROLLCHARS = 0x006D;
  static const UINT SPI_GETSHOWIMEUI = 0x006E;
  static const UINT SPI_SETSHOWIMEUI = 0x006F;
  static const UINT SPI_GETMOUSESPEED = 0x0070;
  static const UINT SPI_SETMOUSESPEED = 0x0071;
  static const UINT SPI_GETSCREENSAVERRUNNING = 0x0072;
  static const UINT SPI_GETDESKWALLPAPER = 0x0073;
  static const UINT SPI_GETAUDIODESCRIPTION = 0x0074;
  static const UINT SPI_SETAUDIODESCRIPTION = 0x0075;
  static const UINT SPI_GETSCREENSAVESECURE = 0x0076;
  static const UINT SPI_SETSCREENSAVESECURE = 0x0077;
  static const UINT SPI_GETACTIVEWINDOWTRACKING = 0x1000;
  static const UINT SPI_SETACTIVEWINDOWTRACKING = 0x1001;
  static const UINT SPI_GETMENUANIMATION = 0x1002;
  static const UINT SPI_SETMENUANIMATION = 0x1003;
  static const UINT SPI_GETCOMBOBOXANIMATION = 0x1004;
  static const UINT SPI_SETCOMBOBOXANIMATION = 0x1005;
  static const UINT SPI_GETLISTBOXSMOOTHSCROLLING = 0x1006;
  static const UINT SPI_SETLISTBOXSMOOTHSCROLLING = 0x1007;
  static const UINT SPI_GETGRADIENTCAPTIONS = 0x1008;
  static const UINT SPI_SETGRADIENTCAPTIONS = 0x1009;
  static const UINT SPI_GETKEYBOARDCUES = 0x100A;
  static const UINT SPI_SETKEYBOARDCUES = 0x100B;
  static const UINT SPI_GETACTIVEWNDTRKZORDER = 0x100C;
  static const UINT SPI_SETACTIVEWNDTRKZORDER = 0x100D;
  static const UINT SPI_GETHOTTRACKING = 0x100E;
  static const UINT SPI_SETHOTTRACKING = 0x100F;
  static const UINT SPI_GETMENUFADE = 0x1012;
  static const UINT SPI_SETMENUFADE = 0x1013;
  static const UINT SPI_GETSELECTIONFADE = 0x1014;
  static const UINT SPI_SETSELECTIONFADE = 0x1015;
  static const UINT SPI_GETTOOLTIPANIMATION = 0x1016;
  static const UINT SPI_SETTOOLTIPANIMATION = 0x1017;
  static const UINT SPI_GETTOOLTIPFADE = 0x1018;
  static const UINT SPI_SETTOOLTIPFADE = 0x1019;
  static const UINT SPI_GETCURSORSHADOW = 0x101A;
  static const UINT SPI_SETCURSORSHADOW = 0x101B;
  static const UINT SPI_GETMOUSESONAR = 0x101C;
  static const UINT SPI_SETMOUSESONAR = 0x101D;
  static const UINT SPI_GETMOUSECLICKLOCK = 0x101E;
  static const UINT SPI_SETMOUSECLICKLOCK = 0x101F;
  static const UINT SPI_GETMOUSEVANISH = 0x1020;
  static const UINT SPI_SETMOUSEVANISH = 0x1021;
  static const UINT SPI_GETFLATMENU = 0x1022;
  static const UINT SPI_SETFLATMENU = 0x1023;
  static const UINT SPI_GETDROPSHADOW = 0x1024;
  static const UINT SPI_SETDROPSHADOW = 0x1025;
  static const UINT SPI_GETBLOCKSENDINPUTRESETS = 0x1026;
  static const UINT SPI_SETBLOCKSENDINPUTRESETS = 0x1027;
  static const UINT SPI_GETUIEFFECTS = 0x103E;
  static const UINT SPI_SETUIEFFECTS = 0x103F;
  static const UINT SPI_GETDISABLEOVERLAPPEDCONTENT = 0x1040;
  static const UINT SPI_SETDISABLEOVERLAPPEDCONTENT = 0x1041;
  static const UINT SPI_GETCLIENTAREAANIMATION = 0x1042;
  static const UINT SPI_SETCLIENTAREAANIMATION = 0x1043;
  static const UINT SPI_GETCLEARTYPE = 0x1048;
  static const UINT SPI_SETCLEARTYPE = 0x1049;
  static const UINT SPI_GETSPEECHRECOGNITION = 0x104A;
  static const UINT SPI_SETSPEECHRECOGNITION = 0x104B;
  static const UINT SPI_GETFOREGROUNDLOCKTIMEOUT = 0x2000;
  static const UINT SPI_SETFOREGROUNDLOCKTIMEOUT = 0x2001;
  static const UINT SPI_GETACTIVEWNDTRKTIMEOUT = 0x2002;
  static const UINT SPI_SETACTIVEWNDTRKTIMEOUT = 0x2003;
  static const UINT SPI_GETFOREGROUNDFLASHCOUNT = 0x2004;
  static const UINT SPI_SETFOREGROUNDFLASHCOUNT = 0x2005;
  static const UINT SPI_GETCARETWIDTH = 0x2006;
  static const UINT SPI_SETCARETWIDTH = 0x2007;
  static const UINT SPI_GETMOUSECLICKLOCKTIME = 0x2008;
  static const UINT SPI_SETMOUSECLICKLOCKTIME = 0x2009;
  static const UINT SPI_GETFONTSMOOTHINGTYPE = 0x200A;
  static const UINT SPI_SETFONTSMOOTHINGTYPE = 0x200B;
  static const UINT SPI_GETFONTSMOOTHINGCONTRAST = 0x200C;
  static const UINT SPI_SETFONTSMOOTHINGCONTRAST = 0x200D;
  static const UINT SPI_GETFOCUSBORDERWIDTH = 0x200E;
  static const UINT SPI_SETFOCUSBORDERWIDTH = 0x200F;
  static const UINT SPI_GETFOCUSBORDERHEIGHT = 0x2010;
  static const UINT SPI_SETFOCUSBORDERHEIGHT = 0x2011;
  static const UINT SPI_GETFONTSMOOTHINGORIENTATION = 0x2012;
  static const UINT SPI_SETFONTSMOOTHINGORIENTATION = 0x2013;
  static const UINT SPI_GETMINIMUMHITRADIUS = 0x2014;
  static const UINT SPI_SETMINIMUMHITRADIUS = 0x2015;
  static const UINT SPI_GETMESSAGEDURATION = 0x2016;
  static const UINT SPI_SETMESSAGEDURATION = 0x2017;
  typedef UINT WINAPI_SystemParametersInfoFlags; //Alias
]]

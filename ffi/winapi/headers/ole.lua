require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID LPCPROPSHEETPAGE; //Alias
  typedef LPVOID LPCPROPSHEETHEADER; //Alias
  typedef LPVOID LPPROPSHEETHEADER; //Alias
  typedef void* IUnknown; //Interface
  typedef void* IStream; //Interface
  typedef void* IPropertySetStorage; //Interface
  typedef void* AsyncIAdviseSink; //Interface
  typedef void* AsyncIAdviseSink2; //Interface
  typedef void* AsyncIMultiQI; //Interface
  typedef void* AsyncIPipeByte; //Interface
  typedef void* AsyncIPipeDouble; //Interface
  typedef void* AsyncIPipeLong; //Interface
  typedef void* IAddrExclusionControl; //Interface
  typedef void* IAddrTrackingControl; //Interface
  typedef void* IAdviseSink; //Interface
  typedef void* IAdviseSink2; //Interface
  typedef void* IAsyncManager; //Interface
  typedef void* IAsyncRpcChannelBuffer; //Interface
  typedef void* IBindCtx; //Interface
  typedef void* IBlockingLock; //Interface
  typedef void* ICallFactory; //Interface
  typedef void* ICancelMethodCalls; //Interface
  typedef void* IChannelHook; //Interface
  typedef void* IClassActivator; //Interface
  typedef void* IClientSecurity; //Interface
  typedef void* IComThreadingInfo; //Interface
  typedef void* IContext; //Interface
  typedef void* IContinue; //Interface
  typedef void* IDataAdviseHolder; //Interface
  typedef void* IDataObject; //Interface
  typedef void* IDirectWriterLock; //Interface
  typedef void* IDropSource; //Interface
  typedef void* IDropSourceNotify; //Interface
  typedef void* IDropTarget; //Interface
  typedef void* IDummyHICONIncluder; //Interface
  typedef void* IEnumContextProps; //Interface
  typedef void* IEnumFORMATETC; //Interface
  typedef void* IEnumMoniker; //Interface
  typedef void* IEnumOLEVERB; //Interface
  typedef void* IEnumSTATDATA; //Interface
  typedef void* IEnumSTATSTG; //Interface
  typedef void* IEnumString; //Interface
  typedef void* IEnumUnknown; //Interface
  typedef void* IExternalConnection; //Interface
  typedef void* IFillLockBytes; //Interface
  typedef void* IForegroundTransfer; //Interface
  typedef void* IGlobalInterfaceTable; //Interface
  typedef void* IGlobalOptions; //Interface
  typedef void* IInitializeSpy; //Interface
  typedef void* IInternalUnknown; //Interface
  typedef void* ILayoutStorage; //Interface
  typedef void* ILockBytes; //Interface
  typedef void* IMalloc; //Interface
  typedef void* IMallocSpy; //Interface
  typedef void* IMarshal; //Interface
  typedef void* IMarshal2; //Interface
  typedef void* IMessageFilter; //Interface
  typedef void* IMoniker; //Interface
  typedef void* IMultiQI; //Interface
  typedef void* IObjContext; //Interface
  typedef void* IOleAdviseHolder; //Interface
  typedef void* IOleCache; //Interface
  typedef void* IOleCache2; //Interface
  typedef void* IOleCacheControl; //Interface
  typedef void* IOleClientSite; //Interface
  typedef void* IOleContainer; //Interface
  typedef void* IOleInPlaceActiveObject; //Interface
  typedef void* IOleInPlaceFrame; //Interface
  typedef void* IOleInPlaceObject; //Interface
  typedef void* IOleInPlaceSite; //Interface
  typedef void* IOleInPlaceUIWindow; //Interface
  typedef void* IOleItemContainer; //Interface
  typedef void* IOleLink; //Interface
  typedef void* IOleObject; //Interface
  typedef void* IOleWindow; //Interface
  typedef void* IOplockStorage; //Interface
  typedef void* IParseDisplayName; //Interface
  typedef void* IPersist; //Interface
  typedef void* IPersistFile; //Interface
  typedef void* IPersistStorage; //Interface
  typedef void* IPersistStream; //Interface
  typedef void* IPipeByte; //Interface
  typedef void* IPipeDouble; //Interface
  typedef void* IPipeLong; //Interface
  typedef void* IProcessInitControl; //Interface
  typedef void* IProcessLock; //Interface
  typedef void* IProgressNotify; //Interface
  typedef void* IPSFactoryBuffer; //Interface
  typedef void* IReleaseMarshalBuffers; //Interface
  typedef void* IRootStorage; //Interface
  typedef void* IROTData; //Interface
  typedef void* IRpcChannelBuffer; //Interface
  typedef void* IRpcChannelBuffer2; //Interface
  typedef void* IRpcChannelBuffer3; //Interface
  typedef void* IRpcHelper; //Interface
  typedef void* IRpcOptions; //Interface
  typedef void* IRpcProxyBuffer; //Interface
  typedef void* IRpcStubBuffer; //Interface
  typedef void* IRpcSyntaxNegotiate; //Interface
  typedef void* IRunnableObject; //Interface
  typedef void* IRunningObjectTable; //Interface
  typedef void* ISequentialStream; //Interface
  typedef void* IServerSecurity; //Interface
  typedef void* IStdMarshalInfo; //Interface
  typedef void* IStorage; //Interface
  typedef void* IStream; //Interface
  typedef void* ISurrogate; //Interface
  typedef void* ISurrogateService; //Interface
  typedef void* ISynchronize; //Interface
  typedef void* ISynchronizeContainer; //Interface
  typedef void* ISynchronizeEvent; //Interface
  typedef void* ISynchronizeHandle; //Interface
  typedef void* ISynchronizeMutex; //Interface
  typedef void* IThumbnailExtractor; //Interface
  typedef void* ITimeAndNoticeControl; //Interface
  typedef void* IUrlMon; //Interface
  typedef void* IViewObject; //Interface
  typedef void* IViewObject2; //Interface
  typedef void* IWaitMultiple; //Interface
  typedef void* IContinueCallback; //Interface
  typedef void* IEnumOleDocumentViews; //Interface
  typedef void* IOleCommandTarget; //Interface
  typedef void* IOleDocument; //Interface
  typedef void* IOleDocumentSite; //Interface
  typedef void* IOleDocumentView; //Interface
  typedef void* IPrint; //Interface
  typedef void* IProtectedModeMenuServices; //Interface
  typedef void* IProtectFocus; //Interface
  typedef void* IZoomEvents; //Interface
  typedef void* IPropertyStorage; //Interface
  typedef void* IClassFactory; //Interface
  typedef void* IRecordInfo; //Interface
  typedef void* IDispatch; //Interface
  typedef IDispatch* LPDISPATCH; //Alias
  typedef STDAPI WINOLEAPI; //Alias
  typedef LPVOID HPROPSHEETPAGE; //Alias
  typedef LPCWSTR LPCOLESTR; //Alias
  typedef LPCWSTR LPOLESTR; //Alias
  typedef LPOLESTR WINAPI_LPOLESTR; //Alias
  typedef WCHAR OLECHAR; //Alias
  typedef ULONG PROPID; //Alias
  typedef IOleObject* LPOLEOBJECT; //Alias
  typedef IMalloc* LPMALLOC; //Alias
  typedef GUID FMTID; //Alias
  typedef FMTID *REFFMTID; //Pointer
  typedef WORD CLIPFORMAT; //Alias
  typedef IBindCtx* LPBC; //Alias
  typedef IBindCtx* LPBINDCTX; //Alias
  typedef IClassFactory* LPCLASSFACTORY; //Alias
  typedef IStorage* LPSTORAGE; //Alias
  typedef IOleClientSite* LPOLECLIENTSITE; //Alias
  typedef IMoniker* LPMONIKER; //Alias
  typedef IStream* LPSTREAM; //Alias
  typedef IDataObject* LPDATAOBJECT; //Alias
  typedef DWORD CPFLAGS; //Alias
  typedef LPOLESTR* SNB; //Alias
  typedef HANDLE HTASK; //Alias
  typedef LPCRECT LPCBORDERWIDTHS; //Alias
  typedef HGLOBAL HOLEMENU; //Alias
  typedef unsigned long RPCOLEDATAREP; //Alias
  typedef HANDLE HMETAFILEPICT; //Alias
  typedef short VARIANT_BOOL; //Alias
  static const short VARIANT_TRUE = -1;
  static const short VARIANT_FALSE = 0;
  typedef DWORD MSHLFLAGS; //Alias
  static const DWORD MSHLFLAGS_NORMAL = 0;
  static const DWORD MSHLFLAGS_TABLESTRONG = 1;
  static const DWORD MSHLFLAGS_TABLEWEAK = 2;
  static const DWORD MSHLFLAGS_NOPING = 4;
  static const DWORD MSHLFLAGS_RESERVED1 = 8;
  static const DWORD MSHLFLAGS_RESERVED2 = 16;
  static const DWORD MSHLFLAGS_RESERVED3 = 32;
  static const DWORD MSHLFLAGS_RESERVED4 = 64;
  typedef struct DVTARGETDEVICE {
    DWORD tdSize;
    WORD tdDriverNameOffset;
    WORD tdDeviceNameOffset;
    WORD tdPortNameOffset;
    WORD tdExtDevmodeOffset;
    BYTE tdData[1];
  } DVTARGETDEVICE;
  typedef struct SERIALIZEDPROPERTYVALUE {
    DWORD dwType;
    BYTE rgb[1];
  } SERIALIZEDPROPERTYVALUE;
  typedef struct RPCOLEMESSAGE {
    void* reserved1;
    RPCOLEDATAREP dataRepresentation;
    void* Buffer;
    ULONG cbBuffer;
    ULONG iMethod;
    void* reserved2[5];
    ULONG rpcFlags;
  } RPCOLEMESSAGE;
  typedef struct OLEMENUGROUPWIDTHS {
    LONG width[6];
  } OLEMENUGROUPWIDTHS;
  typedef OLEMENUGROUPWIDTHS *LPOLEMENUGROUPWIDTHS; //Pointer
  typedef BYTE WINAPI_PALETTEENTRY_Flags; //Alias
  typedef struct PALETTEENTRY {
    BYTE peRed;
    BYTE peGreen;
    BYTE peBlue;
    WINAPI_PALETTEENTRY_Flags peFlags;
  } PALETTEENTRY;
  typedef PALETTEENTRY *LPPALETTEENTRY; //Pointer
  typedef struct LOGPALETTE {
    WORD palVersion;
    WORD palNumEntries;
    PALETTEENTRY palPalEntry[1];
  } LOGPALETTE;
  typedef unsigned short VARTYPE; //Alias
  typedef struct WINAPI_BRECORD {
    PVOID* pvRecord;
    IRecordInfo* pRecInfo;
  } WINAPI_BRECORD;
  typedef union WINAPI_VARIANT_s_u {
    LONG lVal;
    WINAPI_BRECORD ;
  } WINAPI_VARIANT_s_u;
  typedef struct WINAPI_VARIANT_s {
    VARTYPE vt;
    WORD wReserved1;
    WORD wReserved2;
    WORD wReserved3;
    WINAPI_VARIANT_s_u ;
  } WINAPI_VARIANT_s;
  typedef union VARIANT {
    WINAPI_VARIANT_s ;
    ULONGLONG WINAPI_Other values are currently unsupported;
  } VARIANT;
  typedef VARIANT *LPVARIANT; //Pointer
  typedef VARIANT VARIANTARG; //Alias
  typedef VARIANT PROPVARIANT; //Alias
  typedef PROPVARIANT* REFPROPVARIANT; //Alias
  typedef DWORD TYMED; //Alias
  static const DWORD TYMED_HGLOBAL = 1;
  static const DWORD TYMED_FILE = 2;
  static const DWORD TYMED_ISTREAM = 4;
  static const DWORD TYMED_ISTORAGE = 8;
  static const DWORD TYMED_GDI = 16;
  static const DWORD TYMED_MFPICT = 32;
  static const DWORD TYMED_ENHMF = 64;
  static const DWORD TYMED_NULL = 0;
  typedef DWORD DVASPECT; //Alias
  typedef struct FORMATETC {
    CLIPFORMAT cfFormat;
    DVTARGETDEVICE* ptd;
    DVASPECT dwAspect;
    LONG lindex;
    TYMED tymed;
  } FORMATETC;
  typedef FORMATETC *LPFORMATETC; //Pointer
  typedef UINT GETPROPERTYSTOREFLAGS; //Alias
  typedef struct PROPERTYKEY {
    GUID fmtid;
    DWORD pid;
  } PROPERTYKEY;
  typedef PROPERTYKEY *REFPROPERTYKEY; //Pointer
  typedef PROPERTYKEY WINAPI_PROPERTYKEY; //Alias
  typedef struct CSPLATFORM {
    DWORD dwPlatformId;
    DWORD dwVersionHi;
    DWORD dwVersionLo;
    DWORD dwProcessorArch;
  } CSPLATFORM;
  typedef struct QUERYCONTEXT {
    DWORD dwContext;
    CSPLATFORM Platform;
    LCID Locale;
    DWORD dwVersionHi;
    DWORD dwVersionLo;
  } QUERYCONTEXT;
  typedef struct MULTI_QI {
    WINAPI_IID* pIID;
    IUnknown* pItf;
    HRESULT hr;
  } MULTI_QI;
  typedef DWORD WINAPI_STGM_FLAGS; //Alias
  typedef UINT THDTYPE; //Alias
  static const UINT THDTYPE_BLOCKMESSAGES = 0;
  static const UINT THDTYPE_PROCESSMESSAGES = 1;
  typedef UINT GLOBALOPT_PROPERTIES; //Alias
  static const UINT COMGLB_EXCEPTION_HANDLING = 1;
  static const UINT COMGLB_APPID = 2;
  static const UINT COMGLB_RPC_THREADPOOL_SETTING = 3;
  typedef UINT RPCOPT_PROPERTIES; //Alias
  static const UINT COMBND_RPCTIMEOUT = 0x1;
  static const UINT COMBND_SERVER_LOCALITY = 0x2;
  typedef UINT ApplicationType; //Alias
  static const UINT ServerApplication = 0;
  static const UINT LibraryApplication = 1;
  typedef UINT ShutdownType; //Alias
  static const UINT IdleShutdown = 0;
  static const UINT ForcedShutdown = 1;
  typedef DWORD LOCKTYPE; //Alias
  typedef DWORD ADVF; //Alias
  typedef UINT APTTYPE; //Alias
  static const UINT APTTYPE_CURRENT = -1;
  static const UINT APTTYPE_STA = 0;
  static const UINT APTTYPE_MTA = 1;
  static const UINT APTTYPE_NA = 2;
  static const UINT APTTYPE_MAINSTA = 3;
  typedef UINT APTTYPEQUALIFIER; //Alias
  static const UINT APTTYPEQUALIFIER_NONE = 0;
  static const UINT APTTYPEQUALIFIER_IMPLICIT_MTA = 1;
  static const UINT APTTYPEQUALIFIER_NA_ON_MTA = 2;
  static const UINT APTTYPEQUALIFIER_NA_ON_STA = 3;
  static const UINT APTTYPEQUALIFIER_NA_ON_IMPLICIT_MTA = 4;
  static const UINT APTTYPEQUALIFIER_NA_ON_MAINSTA = 5;
  typedef LONG DISPID; //Alias
  static const LONG DISPID_UNKNOWN = -1;
  static const LONG DISPID_VALUE = 0;
  static const LONG DISPID_PROPERTYPUT = -3;
  static const LONG DISPID_NEWENUM = -4;
  static const LONG DISPID_EVALUATE = -5;
  static const LONG DISPID_CONSTRUCTOR = -6;
  static const LONG DISPID_DESTRUCTOR = -7;
  static const LONG DISPID_COLLECT = -8;
  static const LONG DISPID_AUTOSIZE = -500;
  static const LONG DISPID_BACKCOLOR = -501;
  static const LONG DISPID_BACKSTYLE = -502;
  static const LONG DISPID_BORDERCOLOR = -503;
  static const LONG DISPID_BORDERSTYLE = -504;
  static const LONG DISPID_BORDERWIDTH = -505;
  static const LONG DISPID_DRAWMODE = -507;
  static const LONG DISPID_DRAWSTYLE = -508;
  static const LONG DISPID_DRAWWIDTH = -509;
  static const LONG DISPID_FILLCOLOR = -510;
  static const LONG DISPID_FILLSTYLE = -511;
  static const LONG DISPID_FONT = -512;
  static const LONG DISPID_FORECOLOR = -513;
  static const LONG DISPID_ENABLED = -514;
  static const LONG DISPID_HWND = -515;
  static const LONG DISPID_TABSTOP = -516;
  static const LONG DISPID_TEXT = -517;
  static const LONG DISPID_CAPTION = -518;
  static const LONG DISPID_BORDERVISIBLE = -519;
  static const LONG DISPID_APPEARANCE = -520;
  static const LONG DISPID_MOUSEPOINTER = -521;
  static const LONG DISPID_MOUSEICON = -522;
  static const LONG DISPID_PICTURE = -523;
  static const LONG DISPID_VALID = -524;
  static const LONG DISPID_READYSTATE = -525;
  static const LONG DISPID_LISTINDEX = -526;
  static const LONG DISPID_SELECTED = -527;
  static const LONG DISPID_LIST = -528;
  static const LONG DISPID_COLUMN = -529;
  static const LONG DISPID_LISTCOUNT = -531;
  static const LONG DISPID_MULTISELECT = -532;
  static const LONG DISPID_MAXLENGTH = -533;
  static const LONG DISPID_PASSWORDCHAR = -534;
  static const LONG DISPID_SCROLLBARS = -535;
  static const LONG DISPID_WORDWRAP = -536;
  static const LONG DISPID_MULTILINE = -537;
  static const LONG DISPID_NUMBEROFROWS = -538;
  static const LONG DISPID_NUMBEROFCOLUMNS = -539;
  static const LONG DISPID_DISPLAYSTYLE = -540;
  static const LONG DISPID_GROUPNAME = -541;
  static const LONG DISPID_IMEMODE = -542;
  static const LONG DISPID_ACCELERATOR = -543;
  static const LONG DISPID_ENTERKEYBEHAVIOR = -544;
  static const LONG DISPID_TABKEYBEHAVIOR = -545;
  static const LONG DISPID_SELTEXT = -546;
  static const LONG DISPID_SELSTART = -547;
  static const LONG DISPID_SELLENGTH = -548;
  static const LONG DISPID_REFRESH = -550;
  static const LONG DISPID_DOCLICK = -551;
  static const LONG DISPID_ABOUTBOX = -552;
  static const LONG DISPID_ADDITEM = -553;
  static const LONG DISPID_CLEAR = -554;
  static const LONG DISPID_REMOVEITEM = -555;
  static const LONG DISPID_CLICK = -600;
  static const LONG DISPID_DBLCLICK = -601;
  static const LONG DISPID_KEYDOWN = -602;
  static const LONG DISPID_KEYPRESS = -603;
  static const LONG DISPID_KEYUP = -604;
  static const LONG DISPID_MOUSEDOWN = -605;
  static const LONG DISPID_MOUSEMOVE = -606;
  static const LONG DISPID_MOUSEUP = -607;
  static const LONG DISPID_ERROREVENT = -608;
  static const LONG DISPID_READYSTATECHANGE = -609;
  static const LONG DISPID_CLICK_VALUE = -610;
  static const LONG DISPID_RIGHTTOLEFT = -611;
  static const LONG DISPID_TOPTOBOTTOM = -612;
  static const LONG DISPID_THIS = -613;
  static const LONG DISPID_AMBIENT_BACKCOLOR = -701;
  static const LONG DISPID_AMBIENT_DISPLAYNAME = -702;
  static const LONG DISPID_AMBIENT_FONT = -703;
  static const LONG DISPID_AMBIENT_FORECOLOR = -704;
  static const LONG DISPID_AMBIENT_LOCALEID = -705;
  static const LONG DISPID_AMBIENT_MESSAGEREFLECT = -706;
  static const LONG DISPID_AMBIENT_SCALEUNITS = -707;
  static const LONG DISPID_AMBIENT_TEXTALIGN = -708;
  static const LONG DISPID_AMBIENT_USERMODE = -709;
  static const LONG DISPID_AMBIENT_UIDEAD = -710;
  static const LONG DISPID_AMBIENT_SHOWGRABHANDLES = -711;
  static const LONG DISPID_AMBIENT_SHOWHATCHING = -712;
  static const LONG DISPID_AMBIENT_DISPLAYASDEFAULT = -713;
  static const LONG DISPID_AMBIENT_SUPPORTSMNEMONICS = -714;
  static const LONG DISPID_AMBIENT_AUTOCLIP = -715;
  static const LONG DISPID_AMBIENT_APPEARANCE = -716;
  static const LONG DISPID_AMBIENT_CODEPAGE = -725;
  static const LONG DISPID_AMBIENT_PALETTE = -726;
  static const LONG DISPID_AMBIENT_CHARSET = -727;
  static const LONG DISPID_AMBIENT_TRANSFERPRIORITY = -728;
  static const LONG DISPID_AMBIENT_RIGHTTOLEFT = -732;
  static const LONG DISPID_AMBIENT_TOPTOBOTTOM = -733;
  static const LONG DISPID_Name = -800;
  static const LONG DISPID_Delete = -801;
  static const LONG DISPID_Object = -802;
  static const LONG DISPID_Parent = -803;
  typedef struct BIND_OPTS {
    DWORD cbStruct;
    DWORD grfFlags;
    DWORD grfMode;
    DWORD dwTickCountDeadline;
  } BIND_OPTS;
  typedef struct STATSTG {
    LPOLESTR pwcsName;
    DWORD type;
    ULARGE_INTEGER cbSize;
    FILETIME mtime;
    FILETIME ctime;
    FILETIME atime;
    DWORD grfMode;
    DWORD grfLocksSupported;
    CLSID clsid;
    DWORD grfStateBits;
    DWORD reserved;
  } STATSTG;
  typedef struct INTERFACEINFO {
    IUnknown* pUnk;
    IID iid;
    WORD wMethod;
  } INTERFACEINFO;
  typedef INTERFACEINFO *LPINTERFACEINFO; //Pointer
  typedef struct OLEINPLACEFRAMEINFO {
    UINT cb;
    BOOL fMDIApp;
    HWND hwndFrame;
    HACCEL haccel;
    UINT cAccelEntries;
  } OLEINPLACEFRAMEINFO;
  typedef OLEINPLACEFRAMEINFO *LPOLEINPLACEFRAMEINFO; //Pointer
  typedef struct OLEVERB {
    LONG lVerb;
    LPOLESTR lpszVerbName;
    DWORD fuFlags;
    DWORD grfAttribs;
  } OLEVERB;
  typedef OLEVERB *LPOLEVERB; //Pointer
  typedef struct STATDATA {
    FORMATETC formatetc;
    DWORD advf;
    IAdviseSink* pAdvSink;
    DWORD dwConnection;
  } STATDATA;
  typedef struct ContextProperty {
    GUID policyId;
    CPFLAGS flags;
    IUnknown* pUnk;
  } ContextProperty;
  typedef struct StorageLayout {
    DWORD LayoutType;
    OLECHAR* pwcsElementName;
    LARGE_INTEGER cOffset;
    LARGE_INTEGER cBytes;
  } StorageLayout;
  typedef DWORD OLECMDF; //Alias
  typedef UINT PROPBAG2_TYPE; //Alias
  static const UINT PROPBAG2_TYPE_UNDEFINED = 0;
  static const UINT PROPBAG2_TYPE_DATA = 1;
  static const UINT PROPBAG2_TYPE_URL = 2;
  static const UINT PROPBAG2_TYPE_OBJECT = 3;
  static const UINT PROPBAG2_TYPE_STREAM = 4;
  static const UINT PROPBAG2_TYPE_STORAGE = 5;
  static const UINT PROPBAG2_TYPE_MONIKER = 6;
  typedef struct PROPBAG2 {
    PROPBAG2_TYPE dwType;
    VARTYPE vt;
    CLIPFORMAT cfType;
    DWORD dwHint;
    LPOLESTR pstrName;
    CLSID clsid;
  } PROPBAG2;
  typedef DWORD WINAPI_CLSCTX; //Alias
  typedef struct WINAPI_uCLSSPEC_u_s1 {
    LPOLESTR pPackageName;
    GUID PolicyId;
  } WINAPI_uCLSSPEC_u_s1;
  typedef struct WINAPI_uCLSSPEC_u_s2 {
    GUID ObjectId;
    GUID PolicyId;
  } WINAPI_uCLSSPEC_u_s2;
  typedef union WINAPI_uCLSSPEC_u {
    CLSID clsid;
    LPOLESTR pFileExt;
    LPOLESTR pMimeType;
    LPOLESTR pProgId;
    LPOLESTR pFileName;
    WINAPI_uCLSSPEC_u_s1 ByName;
    WINAPI_uCLSSPEC_u_s2 ByObjectId;
  } WINAPI_uCLSSPEC_u;
  typedef DWORD TYSPEC; //Alias
  static const DWORD TYSPEC_CLSID = 0;
  static const DWORD TYSPEC_FILEEXT = 1;
  static const DWORD TYSPEC_MIMETYPE = 2;
  static const DWORD TYSPEC_FILENAME = 3;
  static const DWORD TYSPEC_PROGID = 4;
  static const DWORD TYSPEC_PACKAGENAME = 5;
  static const DWORD TYSPEC_OBJECTID = 6;
  typedef struct uCLSSPEC {
    TYSPEC tyspec;
    WINAPI_uCLSSPEC_u tagged_union;
  } uCLSSPEC;
  typedef union WINAPI_STGMEDIUM_u {
    HBITMAP hBitmap;
    HMETAFILEPICT hMetaFilePict;
    HENHMETAFILE hEnhMetaFile;
    HGLOBAL hGlobal;
    LPOLESTR lpszFileName;
    IStream* pstm;
    IStorage* pstg;
  } WINAPI_STGMEDIUM_u;
  typedef struct STGMEDIUM {
    TYMED tymed;
    WINAPI_STGMEDIUM_u u;
    IUnknown* pUnkForRelease;
  } STGMEDIUM;
  typedef STGMEDIUM *LPSTGMEDIUM; //Pointer
  typedef DWORD WINAPI_COINIT_FLAG; //Alias
  typedef USHORT WINAPI_FADF_FLAGS; //Alias
  typedef struct SAFEARRAYBOUND {
    ULONG cElements;
    LONG lLbound;
  } SAFEARRAYBOUND;
  typedef struct SAFEARRAY {
    USHORT cDims;
    WINAPI_FADF_FLAGS fFeatures;
    ULONG cbElements;
    ULONG cLocks;
    PVOID pvData;
    SAFEARRAYBOUND rgsabound[1];
  } SAFEARRAY;
  typedef SAFEARRAY *LPSAFEARRAY; //Pointer
  typedef struct CUSTDATAITEM {
    GUID guid;
    VARIANTARG varValue;
  } CUSTDATAITEM;
  typedef CUSTDATAITEM *LPCUSTDATAITEM; //Pointer
  typedef struct CUSTDATA {
    DWORD cCustData;
    LPCUSTDATAITEM prgCustData;
  } CUSTDATA;
  typedef CUSTDATA *LPCUSTDATA; //Pointer
  typedef WORD WINAPI_InvokeFlags; //Alias
  typedef UINT CALLCONV; //Alias
  static const UINT CC_FASTCALL = 0;
  static const UINT CC_CDECL = 1;
  static const UINT CC_PASCAL = 2;
  static const UINT CC_MACPASCAL = 3;
  static const UINT CC_STDCALL = 4;
  static const UINT CC_FPFASTCALL = 5;
  static const UINT CC_SYSCALL = 6;
  static const UINT CC_MPWCDECL = 7;
  static const UINT CC_MPWPASCAL = 8;
  typedef DWORD STATFLAG; //Alias
  static const DWORD STATFLAG_DEFAULT = 0;
  static const DWORD STATFLAG_NONAME = 1;
  static const DWORD STATFLAG_NOOPEN = 2;
  typedef DWORD STGC; //Alias
]]

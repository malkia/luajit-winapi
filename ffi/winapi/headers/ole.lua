require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID LPCPROPSHEETPAGE; //Alias
  typedef LPVOID PROPSHEETHEADER*; //Alias
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
  typedef OLECHAR* WINAPI_OLECHAR*; //Alias
  typedef ULONG PROPID; //Alias
  typedef IOleObject* LPOLEOBJECT; //Alias
  typedef IMalloc* LPMALLOC; //Alias
  typedef GUID FMTID; //Alias
  typedef FMTID *WINAPI_FMTID*; //Pointer
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
  typedef IStorage* struct IStorage*; //Alias
  typedef DWORD CPFLAGS; //Alias
  typedef LPOLESTR* SNB; //Alias
  typedef LPVOID ALLOCATEMORE*; //Alias
  typedef HANDLE HTASK; //Alias
  typedef LPCRECT LPCBORDERWIDTHS; //Alias
  typedef HGLOBAL HOLEMENU; //Alias
  typedef unsigned long RPCOLEDATAREP; //Alias
  typedef HANDLE HMETAFILEPICT; //Alias
  typedef void* void* [5]; //Array 5
  typedef LONG LONG [6]; //Array 6
  typedef enum VARIANT_BOOL {
    VARIANT_TRUE = -1,
    VARIANT_FALSE = 0,
  } VARIANT_BOOL;
  typedef enum MSHLFLAGS {
    MSHLFLAGS_NORMAL = 0,
    MSHLFLAGS_TABLESTRONG = 1,
    MSHLFLAGS_TABLEWEAK = 2,
    MSHLFLAGS_NOPING = 4,
    MSHLFLAGS_RESERVED1 = 8,
    MSHLFLAGS_RESERVED2 = 16,
    MSHLFLAGS_RESERVED3 = 32,
    MSHLFLAGS_RESERVED4 = 64,
  } MSHLFLAGS;
  typedef struct DVTARGETDEVICE {
    DWORD tdSize;
    WORD tdDriverNameOffset;
    WORD tdDeviceNameOffset;
    WORD tdPortNameOffset;
    WORD tdExtDevmodeOffset;
    BYTE tdData[1];
  } DVTARGETDEVICE;
  typedef DVTARGETDEVICE *WINAPI_DVTARGETDEVICE*; //Pointer
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
  typedef PALETTEENTRY *WINAPI_PALETTEENTRY*; //Pointer
  typedef PALETTEENTRY *WINAPI_PALETTEENTRY*; //Pointer
  typedef PALETTEENTRY PALETTEENTRY [1]; //Array 1
  typedef struct LOGPALETTE {
    WORD palVersion;
    WORD palNumEntries;
    PALETTEENTRY palPalEntry[1];
  } LOGPALETTE;
  typedef LOGPALETTE* *WINAPI_LOGPALETTE*; //Pointer
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
  typedef VARIANT *WINAPI_VARIANT*; //Pointer
  typedef VARIANT *LPVARIANT; //Pointer
  typedef VARIANT VARIANTARG; //Alias
  typedef VARIANTARG *WINAPI_VARIANTARG*; //Pointer
  typedef VARIANT PROPVARIANT; //Alias
  typedef PROPVARIANT* WINAPI_PROPVARIANT*; //Alias
  typedef PROPVARIANT* REFPROPVARIANT; //Alias
  typedef enum TYMED {
    TYMED_HGLOBAL = 1,
    TYMED_FILE = 2,
    TYMED_ISTREAM = 4,
    TYMED_ISTORAGE = 8,
    TYMED_GDI = 16,
    TYMED_MFPICT = 32,
    TYMED_ENHMF = 64,
    TYMED_NULL = 0,
  } TYMED;
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
  typedef enum THDTYPE {
    THDTYPE_BLOCKMESSAGES = 0,
    THDTYPE_PROCESSMESSAGES = 1,
  } THDTYPE;
  typedef enum GLOBALOPT_PROPERTIES {
    COMGLB_EXCEPTION_HANDLING = 1,
    COMGLB_APPID = 2,
    COMGLB_RPC_THREADPOOL_SETTING = 3,
  } GLOBALOPT_PROPERTIES;
  typedef enum RPCOPT_PROPERTIES {
    COMBND_RPCTIMEOUT = 0x1,
    COMBND_SERVER_LOCALITY = 0x2,
  } RPCOPT_PROPERTIES;
  typedef enum ApplicationType {
    ServerApplication = 0,
    LibraryApplication = 1,
  } ApplicationType;
  typedef enum ShutdownType {
    IdleShutdown = 0,
    ForcedShutdown = 1,
  } ShutdownType;
  typedef DWORD LOCKTYPE; //Alias
  typedef DWORD ADVF; //Alias
  typedef enum APTTYPE {
    APTTYPE_CURRENT = -1,
    APTTYPE_STA = 0,
    APTTYPE_MTA = 1,
    APTTYPE_NA = 2,
    APTTYPE_MAINSTA = 3,
  } APTTYPE;
  typedef enum APTTYPEQUALIFIER {
    APTTYPEQUALIFIER_NONE = 0,
    APTTYPEQUALIFIER_IMPLICIT_MTA = 1,
    APTTYPEQUALIFIER_NA_ON_MTA = 2,
    APTTYPEQUALIFIER_NA_ON_STA = 3,
    APTTYPEQUALIFIER_NA_ON_IMPLICIT_MTA = 4,
    APTTYPEQUALIFIER_NA_ON_MAINSTA = 5,
  } APTTYPEQUALIFIER;
  typedef enum DISPID {
    DISPID_UNKNOWN = -1,
    DISPID_VALUE = 0,
    DISPID_PROPERTYPUT = -3,
    DISPID_NEWENUM = -4,
    DISPID_EVALUATE = -5,
    DISPID_CONSTRUCTOR = -6,
    DISPID_DESTRUCTOR = -7,
    DISPID_COLLECT = -8,
    DISPID_AUTOSIZE = -500,
    DISPID_BACKCOLOR = -501,
    DISPID_BACKSTYLE = -502,
    DISPID_BORDERCOLOR = -503,
    DISPID_BORDERSTYLE = -504,
    DISPID_BORDERWIDTH = -505,
    DISPID_DRAWMODE = -507,
    DISPID_DRAWSTYLE = -508,
    DISPID_DRAWWIDTH = -509,
    DISPID_FILLCOLOR = -510,
    DISPID_FILLSTYLE = -511,
    DISPID_FONT = -512,
    DISPID_FORECOLOR = -513,
    DISPID_ENABLED = -514,
    DISPID_HWND = -515,
    DISPID_TABSTOP = -516,
    DISPID_TEXT = -517,
    DISPID_CAPTION = -518,
    DISPID_BORDERVISIBLE = -519,
    DISPID_APPEARANCE = -520,
    DISPID_MOUSEPOINTER = -521,
    DISPID_MOUSEICON = -522,
    DISPID_PICTURE = -523,
    DISPID_VALID = -524,
    DISPID_READYSTATE = -525,
    DISPID_LISTINDEX = -526,
    DISPID_SELECTED = -527,
    DISPID_LIST = -528,
    DISPID_COLUMN = -529,
    DISPID_LISTCOUNT = -531,
    DISPID_MULTISELECT = -532,
    DISPID_MAXLENGTH = -533,
    DISPID_PASSWORDCHAR = -534,
    DISPID_SCROLLBARS = -535,
    DISPID_WORDWRAP = -536,
    DISPID_MULTILINE = -537,
    DISPID_NUMBEROFROWS = -538,
    DISPID_NUMBEROFCOLUMNS = -539,
    DISPID_DISPLAYSTYLE = -540,
    DISPID_GROUPNAME = -541,
    DISPID_IMEMODE = -542,
    DISPID_ACCELERATOR = -543,
    DISPID_ENTERKEYBEHAVIOR = -544,
    DISPID_TABKEYBEHAVIOR = -545,
    DISPID_SELTEXT = -546,
    DISPID_SELSTART = -547,
    DISPID_SELLENGTH = -548,
    DISPID_REFRESH = -550,
    DISPID_DOCLICK = -551,
    DISPID_ABOUTBOX = -552,
    DISPID_ADDITEM = -553,
    DISPID_CLEAR = -554,
    DISPID_REMOVEITEM = -555,
    DISPID_CLICK = -600,
    DISPID_DBLCLICK = -601,
    DISPID_KEYDOWN = -602,
    DISPID_KEYPRESS = -603,
    DISPID_KEYUP = -604,
    DISPID_MOUSEDOWN = -605,
    DISPID_MOUSEMOVE = -606,
    DISPID_MOUSEUP = -607,
    DISPID_ERROREVENT = -608,
    DISPID_READYSTATECHANGE = -609,
    DISPID_CLICK_VALUE = -610,
    DISPID_RIGHTTOLEFT = -611,
    DISPID_TOPTOBOTTOM = -612,
    DISPID_THIS = -613,
    DISPID_AMBIENT_BACKCOLOR = -701,
    DISPID_AMBIENT_DISPLAYNAME = -702,
    DISPID_AMBIENT_FONT = -703,
    DISPID_AMBIENT_FORECOLOR = -704,
    DISPID_AMBIENT_LOCALEID = -705,
    DISPID_AMBIENT_MESSAGEREFLECT = -706,
    DISPID_AMBIENT_SCALEUNITS = -707,
    DISPID_AMBIENT_TEXTALIGN = -708,
    DISPID_AMBIENT_USERMODE = -709,
    DISPID_AMBIENT_UIDEAD = -710,
    DISPID_AMBIENT_SHOWGRABHANDLES = -711,
    DISPID_AMBIENT_SHOWHATCHING = -712,
    DISPID_AMBIENT_DISPLAYASDEFAULT = -713,
    DISPID_AMBIENT_SUPPORTSMNEMONICS = -714,
    DISPID_AMBIENT_AUTOCLIP = -715,
    DISPID_AMBIENT_APPEARANCE = -716,
    DISPID_AMBIENT_CODEPAGE = -725,
    DISPID_AMBIENT_PALETTE = -726,
    DISPID_AMBIENT_CHARSET = -727,
    DISPID_AMBIENT_TRANSFERPRIORITY = -728,
    DISPID_AMBIENT_RIGHTTOLEFT = -732,
    DISPID_AMBIENT_TOPTOBOTTOM = -733,
    DISPID_Name = -800,
    DISPID_Delete = -801,
    DISPID_Object = -802,
    DISPID_Parent = -803,
  } DISPID;
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
  typedef enum PROPBAG2_TYPE {
    PROPBAG2_TYPE_UNDEFINED = 0,
    PROPBAG2_TYPE_DATA = 1,
    PROPBAG2_TYPE_URL = 2,
    PROPBAG2_TYPE_OBJECT = 3,
    PROPBAG2_TYPE_STREAM = 4,
    PROPBAG2_TYPE_STORAGE = 5,
    PROPBAG2_TYPE_MONIKER = 6,
  } PROPBAG2_TYPE;
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
  typedef enum TYSPEC {
    TYSPEC_CLSID = 0,
    TYSPEC_FILEEXT = 1,
    TYSPEC_MIMETYPE = 2,
    TYSPEC_FILENAME = 3,
    TYSPEC_PROGID = 4,
    TYSPEC_PACKAGENAME = 5,
    TYSPEC_OBJECTID = 6,
  } TYSPEC;
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
  typedef STGMEDIUM *WINAPI_STGMEDIUM*; //Pointer
  typedef STGMEDIUM *LPSTGMEDIUM; //Pointer
  typedef DWORD WINAPI_COINIT_FLAG; //Alias
  typedef USHORT WINAPI_FADF_FLAGS; //Alias
  typedef struct SAFEARRAYBOUND {
    ULONG cElements;
    LONG lLbound;
  } SAFEARRAYBOUND;
  typedef SAFEARRAYBOUND SAFEARRAYBOUND [1]; //Array 1
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
  typedef enum CALLCONV {
    CC_FASTCALL = 0,
    CC_CDECL = 1,
    CC_PASCAL = 2,
    CC_MACPASCAL = 3,
    CC_STDCALL = 4,
    CC_FPFASTCALL = 5,
    CC_SYSCALL = 6,
    CC_MPWCDECL = 7,
    CC_MPWPASCAL = 8,
  } CALLCONV;
  typedef enum STATFLAG {
    STATFLAG_DEFAULT = 0,
    STATFLAG_NONAME = 1,
    STATFLAG_NOOPEN = 2,
  } STATFLAG;
  typedef DWORD STGC; //Alias
]]

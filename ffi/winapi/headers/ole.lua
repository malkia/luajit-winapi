require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID LPCPROPSHEETPAGE; //Alias
  typedef LPVOID PROPSHEETHEADER*; //Alias
  typedef LPVOID LPCPROPSHEETHEADER; //Alias
  typedef LPVOID LPPROPSHEETHEADER; //Alias
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
    VARIANT_TRUE = WINAPI__1,
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
    DWORD tdSize,
    WORD tdDriverNameOffset,
    WORD tdDeviceNameOffset,
    WORD tdPortNameOffset,
    WORD tdExtDevmodeOffset,
    BYTE [1] tdData,
  } DVTARGETDEVICE;
  typedef DVTARGETDEVICE *WINAPI_DVTARGETDEVICE*; //Pointer
  typedef struct SERIALIZEDPROPERTYVALUE {
    DWORD dwType,
    BYTE [1] rgb,
  } SERIALIZEDPROPERTYVALUE;
  typedef struct RPCOLEMESSAGE {
    void* reserved1,
    RPCOLEDATAREP dataRepresentation,
    void* Buffer,
    ULONG cbBuffer,
    ULONG iMethod,
    void* [5] reserved2,
    ULONG rpcFlags,
  } RPCOLEMESSAGE;
  typedef struct OLEMENUGROUPWIDTHS {
    LONG [6] width,
  } OLEMENUGROUPWIDTHS;
  typedef OLEMENUGROUPWIDTHS *LPOLEMENUGROUPWIDTHS; //Pointer
  typedef BYTE WINAPI_PALETTEENTRY_Flags; //Alias
  typedef struct PALETTEENTRY {
    BYTE peRed,
    BYTE peGreen,
    BYTE peBlue,
    WINAPI_PALETTEENTRY_Flags peFlags,
  } PALETTEENTRY;
  typedef PALETTEENTRY *LPPALETTEENTRY; //Pointer
  typedef PALETTEENTRY *WINAPI_PALETTEENTRY*; //Pointer
  typedef PALETTEENTRY *WINAPI_PALETTEENTRY*; //Pointer
  typedef PALETTEENTRY PALETTEENTRY [1]; //Array 1
  typedef struct LOGPALETTE {
    WORD palVersion,
    WORD palNumEntries,
    PALETTEENTRY [1] palPalEntry,
  } LOGPALETTE;
  typedef LOGPALETTE* *WINAPI_LOGPALETTE*; //Pointer
  typedef unsigned short VARTYPE; //Alias
  typedef struct WINAPI_BRECORD {
    PVOID* pvRecord,
    IRecordInfo* pRecInfo,
  } WINAPI_BRECORD;
  typedef union WINAPI_VARIANT_s_u {
    LONG lVal,
    WINAPI_BRECORD ,
  } WINAPI_VARIANT_s_u;
  typedef struct WINAPI_VARIANT_s {
    VARTYPE vt,
    WORD wReserved1,
    WORD wReserved2,
    WORD wReserved3,
    WINAPI_VARIANT_s_u ,
  } WINAPI_VARIANT_s;
  typedef union VARIANT {
    WINAPI_VARIANT_s ,
    ULONGLONG WINAPI_Other values are currently unsupported,
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
    CLIPFORMAT cfFormat,
    DVTARGETDEVICE* ptd,
    DVASPECT dwAspect,
    LONG lindex,
    TYMED tymed,
  } FORMATETC;
  typedef FORMATETC *LPFORMATETC; //Pointer
  typedef UINT GETPROPERTYSTOREFLAGS; //Alias
  typedef struct PROPERTYKEY {
    GUID fmtid,
    DWORD pid,
  } PROPERTYKEY;
  typedef PROPERTYKEY *REFPROPERTYKEY; //Pointer
  typedef PROPERTYKEY WINAPI_PROPERTYKEY; //Alias
  typedef struct CSPLATFORM {
    DWORD dwPlatformId,
    DWORD dwVersionHi,
    DWORD dwVersionLo,
    DWORD dwProcessorArch,
  } CSPLATFORM;
  typedef struct QUERYCONTEXT {
    DWORD dwContext,
    CSPLATFORM Platform,
    LCID Locale,
    DWORD dwVersionHi,
    DWORD dwVersionLo,
  } QUERYCONTEXT;
  typedef struct MULTI_QI {
    WINAPI_IID* pIID,
    IUnknown* pItf,
    HRESULT hr,
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
    APTTYPE_CURRENT = WINAPI__1,
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
    DISPID_UNKNOWN = WINAPI__1,
    DISPID_VALUE = 0,
    DISPID_PROPERTYPUT = WINAPI__3,
    DISPID_NEWENUM = WINAPI__4,
    DISPID_EVALUATE = WINAPI__5,
    DISPID_CONSTRUCTOR = WINAPI__6,
    DISPID_DESTRUCTOR = WINAPI__7,
    DISPID_COLLECT = WINAPI__8,
    DISPID_AUTOSIZE = WINAPI__500,
    DISPID_BACKCOLOR = WINAPI__501,
    DISPID_BACKSTYLE = WINAPI__502,
    DISPID_BORDERCOLOR = WINAPI__503,
    DISPID_BORDERSTYLE = WINAPI__504,
    DISPID_BORDERWIDTH = WINAPI__505,
    DISPID_DRAWMODE = WINAPI__507,
    DISPID_DRAWSTYLE = WINAPI__508,
    DISPID_DRAWWIDTH = WINAPI__509,
    DISPID_FILLCOLOR = WINAPI__510,
    DISPID_FILLSTYLE = WINAPI__511,
    DISPID_FONT = WINAPI__512,
    DISPID_FORECOLOR = WINAPI__513,
    DISPID_ENABLED = WINAPI__514,
    DISPID_HWND = WINAPI__515,
    DISPID_TABSTOP = WINAPI__516,
    DISPID_TEXT = WINAPI__517,
    DISPID_CAPTION = WINAPI__518,
    DISPID_BORDERVISIBLE = WINAPI__519,
    DISPID_APPEARANCE = WINAPI__520,
    DISPID_MOUSEPOINTER = WINAPI__521,
    DISPID_MOUSEICON = WINAPI__522,
    DISPID_PICTURE = WINAPI__523,
    DISPID_VALID = WINAPI__524,
    DISPID_READYSTATE = WINAPI__525,
    DISPID_LISTINDEX = WINAPI__526,
    DISPID_SELECTED = WINAPI__527,
    DISPID_LIST = WINAPI__528,
    DISPID_COLUMN = WINAPI__529,
    DISPID_LISTCOUNT = WINAPI__531,
    DISPID_MULTISELECT = WINAPI__532,
    DISPID_MAXLENGTH = WINAPI__533,
    DISPID_PASSWORDCHAR = WINAPI__534,
    DISPID_SCROLLBARS = WINAPI__535,
    DISPID_WORDWRAP = WINAPI__536,
    DISPID_MULTILINE = WINAPI__537,
    DISPID_NUMBEROFROWS = WINAPI__538,
    DISPID_NUMBEROFCOLUMNS = WINAPI__539,
    DISPID_DISPLAYSTYLE = WINAPI__540,
    DISPID_GROUPNAME = WINAPI__541,
    DISPID_IMEMODE = WINAPI__542,
    DISPID_ACCELERATOR = WINAPI__543,
    DISPID_ENTERKEYBEHAVIOR = WINAPI__544,
    DISPID_TABKEYBEHAVIOR = WINAPI__545,
    DISPID_SELTEXT = WINAPI__546,
    DISPID_SELSTART = WINAPI__547,
    DISPID_SELLENGTH = WINAPI__548,
    DISPID_REFRESH = WINAPI__550,
    DISPID_DOCLICK = WINAPI__551,
    DISPID_ABOUTBOX = WINAPI__552,
    DISPID_ADDITEM = WINAPI__553,
    DISPID_CLEAR = WINAPI__554,
    DISPID_REMOVEITEM = WINAPI__555,
    DISPID_CLICK = WINAPI__600,
    DISPID_DBLCLICK = WINAPI__601,
    DISPID_KEYDOWN = WINAPI__602,
    DISPID_KEYPRESS = WINAPI__603,
    DISPID_KEYUP = WINAPI__604,
    DISPID_MOUSEDOWN = WINAPI__605,
    DISPID_MOUSEMOVE = WINAPI__606,
    DISPID_MOUSEUP = WINAPI__607,
    DISPID_ERROREVENT = WINAPI__608,
    DISPID_READYSTATECHANGE = WINAPI__609,
    DISPID_CLICK_VALUE = WINAPI__610,
    DISPID_RIGHTTOLEFT = WINAPI__611,
    DISPID_TOPTOBOTTOM = WINAPI__612,
    DISPID_THIS = WINAPI__613,
    DISPID_AMBIENT_BACKCOLOR = WINAPI__701,
    DISPID_AMBIENT_DISPLAYNAME = WINAPI__702,
    DISPID_AMBIENT_FONT = WINAPI__703,
    DISPID_AMBIENT_FORECOLOR = WINAPI__704,
    DISPID_AMBIENT_LOCALEID = WINAPI__705,
    DISPID_AMBIENT_MESSAGEREFLECT = WINAPI__706,
    DISPID_AMBIENT_SCALEUNITS = WINAPI__707,
    DISPID_AMBIENT_TEXTALIGN = WINAPI__708,
    DISPID_AMBIENT_USERMODE = WINAPI__709,
    DISPID_AMBIENT_UIDEAD = WINAPI__710,
    DISPID_AMBIENT_SHOWGRABHANDLES = WINAPI__711,
    DISPID_AMBIENT_SHOWHATCHING = WINAPI__712,
    DISPID_AMBIENT_DISPLAYASDEFAULT = WINAPI__713,
    DISPID_AMBIENT_SUPPORTSMNEMONICS = WINAPI__714,
    DISPID_AMBIENT_AUTOCLIP = WINAPI__715,
    DISPID_AMBIENT_APPEARANCE = WINAPI__716,
    DISPID_AMBIENT_CODEPAGE = WINAPI__725,
    DISPID_AMBIENT_PALETTE = WINAPI__726,
    DISPID_AMBIENT_CHARSET = WINAPI__727,
    DISPID_AMBIENT_TRANSFERPRIORITY = WINAPI__728,
    DISPID_AMBIENT_RIGHTTOLEFT = WINAPI__732,
    DISPID_AMBIENT_TOPTOBOTTOM = WINAPI__733,
    DISPID_Name = WINAPI__800,
    DISPID_Delete = WINAPI__801,
    DISPID_Object = WINAPI__802,
    DISPID_Parent = WINAPI__803,
  } DISPID;
  typedef struct BIND_OPTS {
    DWORD cbStruct,
    DWORD grfFlags,
    DWORD grfMode,
    DWORD dwTickCountDeadline,
  } BIND_OPTS;
  typedef struct STATSTG {
    LPOLESTR pwcsName,
    DWORD type,
    ULARGE_INTEGER cbSize,
    FILETIME mtime,
    FILETIME ctime,
    FILETIME atime,
    DWORD grfMode,
    DWORD grfLocksSupported,
    CLSID clsid,
    DWORD grfStateBits,
    DWORD reserved,
  } STATSTG;
  typedef struct INTERFACEINFO {
    IUnknown* pUnk,
    IID iid,
    WORD wMethod,
  } INTERFACEINFO;
  typedef INTERFACEINFO *LPINTERFACEINFO; //Pointer
  typedef struct OLEINPLACEFRAMEINFO {
    UINT cb,
    BOOL fMDIApp,
    HWND hwndFrame,
    HACCEL haccel,
    UINT cAccelEntries,
  } OLEINPLACEFRAMEINFO;
  typedef OLEINPLACEFRAMEINFO *LPOLEINPLACEFRAMEINFO; //Pointer
  typedef struct OLEVERB {
    LONG lVerb,
    LPOLESTR lpszVerbName,
    DWORD fuFlags,
    DWORD grfAttribs,
  } OLEVERB;
  typedef OLEVERB *LPOLEVERB; //Pointer
  typedef struct STATDATA {
    FORMATETC formatetc,
    DWORD advf,
    IAdviseSink* pAdvSink,
    DWORD dwConnection,
  } STATDATA;
  typedef struct ContextProperty {
    GUID policyId,
    CPFLAGS flags,
    IUnknown* pUnk,
  } ContextProperty;
  typedef struct StorageLayout {
    DWORD LayoutType,
    OLECHAR* pwcsElementName,
    LARGE_INTEGER cOffset,
    LARGE_INTEGER cBytes,
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
    PROPBAG2_TYPE dwType,
    VARTYPE vt,
    CLIPFORMAT cfType,
    DWORD dwHint,
    LPOLESTR pstrName,
    CLSID clsid,
  } PROPBAG2;
  typedef DWORD WINAPI_CLSCTX; //Alias
  typedef struct WINAPI_uCLSSPEC_u_s1 {
    LPOLESTR pPackageName,
    GUID PolicyId,
  } WINAPI_uCLSSPEC_u_s1;
  typedef struct WINAPI_uCLSSPEC_u_s2 {
    GUID ObjectId,
    GUID PolicyId,
  } WINAPI_uCLSSPEC_u_s2;
  typedef union WINAPI_uCLSSPEC_u {
    CLSID clsid,
    LPOLESTR pFileExt,
    LPOLESTR pMimeType,
    LPOLESTR pProgId,
    LPOLESTR pFileName,
    WINAPI_uCLSSPEC_u_s1 ByName,
    WINAPI_uCLSSPEC_u_s2 ByObjectId,
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
    TYSPEC tyspec,
    WINAPI_uCLSSPEC_u tagged_union,
  } uCLSSPEC;
  typedef union WINAPI_STGMEDIUM_u {
    HBITMAP hBitmap,
    HMETAFILEPICT hMetaFilePict,
    HENHMETAFILE hEnhMetaFile,
    HGLOBAL hGlobal,
    LPOLESTR lpszFileName,
    IStream* pstm,
    IStorage* pstg,
  } WINAPI_STGMEDIUM_u;
  typedef struct STGMEDIUM {
    TYMED tymed,
    WINAPI_STGMEDIUM_u u,
    IUnknown* pUnkForRelease,
  } STGMEDIUM;
  typedef STGMEDIUM *WINAPI_STGMEDIUM*; //Pointer
  typedef STGMEDIUM *LPSTGMEDIUM; //Pointer
  typedef DWORD WINAPI_COINIT_FLAG; //Alias
  typedef USHORT WINAPI_FADF_FLAGS; //Alias
  typedef struct SAFEARRAYBOUND {
    ULONG cElements,
    LONG lLbound,
  } SAFEARRAYBOUND;
  typedef SAFEARRAYBOUND SAFEARRAYBOUND [1]; //Array 1
  typedef struct SAFEARRAY {
    USHORT cDims,
    WINAPI_FADF_FLAGS fFeatures,
    ULONG cbElements,
    ULONG cLocks,
    PVOID pvData,
    SAFEARRAYBOUND [1] rgsabound,
  } SAFEARRAY;
  typedef SAFEARRAY *LPSAFEARRAY; //Pointer
  typedef struct CUSTDATAITEM {
    GUID guid,
    VARIANTARG varValue,
  } CUSTDATAITEM;
  typedef CUSTDATAITEM *LPCUSTDATAITEM; //Pointer
  typedef struct CUSTDATA {
    DWORD cCustData,
    LPCUSTDATAITEM prgCustData,
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

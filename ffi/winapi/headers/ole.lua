require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  typedef LPVOID LPCPROPSHEETPAGE;
  typedef LPVOID PROPSHEETHEADER*;
  typedef LPVOID LPCPROPSHEETHEADER;
  typedef LPVOID LPPROPSHEETHEADER;
  typedef IDispatch* LPDISPATCH;
  typedef STDAPI WINOLEAPI;
  typedef LPVOID HPROPSHEETPAGE;
  typedef LPCWSTR LPCOLESTR;
  typedef LPCWSTR LPOLESTR;
  typedef LPOLESTR LPOLESTR;
  typedef WCHAR OLECHAR;
  typedef OLECHAR* OLECHAR*;
  typedef ULONG PROPID;
  typedef IOleObject* LPOLEOBJECT;
  typedef IMalloc* LPMALLOC;
  typedef GUID FMTID;
  typedef FMTID REFFMTID;
  typedef WORD CLIPFORMAT;
  typedef IBindCtx* LPBC;
  typedef IBindCtx* LPBINDCTX;
  typedef IClassFactory* LPCLASSFACTORY;
  typedef IStorage* LPSTORAGE;
  typedef IOleClientSite* LPOLECLIENTSITE;
  typedef IMoniker* LPMONIKER;
  typedef IStream* LPSTREAM;
  typedef IDataObject* LPDATAOBJECT;
  typedef IStorage* struct IStorage*;
  typedef DWORD CPFLAGS;
  typedef LPOLESTR* SNB;
  typedef LPVOID ALLOCATEMORE*;
  typedef HANDLE HTASK;
  typedef LPCRECT LPCBORDERWIDTHS;
  typedef HGLOBAL HOLEMENU;
  typedef unsigned long RPCOLEDATAREP;
  typedef HANDLE HMETAFILEPICT;
  typedef enum VARIANT_BOOL {
    VARIANT_TRUE = _1,
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

  typedef OLEMENUGROUPWIDTHS LPOLEMENUGROUPWIDTHS;
  typedef BYTE WINAPI_PALETTEENTRY_Flags;
  typedef struct PALETTEENTRY {
    BYTE peRed,
    BYTE peGreen,
    BYTE peBlue,
    WINAPI_PALETTEENTRY_Flags peFlags,
  } PALETTEENTRY;

  typedef PALETTEENTRY LPPALETTEENTRY;
  typedef PALETTEENTRY CONST PALETTEENTRY*;
  typedef struct LOGPALETTE {
    WORD palVersion,
    WORD palNumEntries,
    PALETTEENTRY [1] palPalEntry,
  } LOGPALETTE;

  typedef LOGPALETTE* LOGPALETTE*;
  typedef unsigned short VARTYPE;
  typedef struct WINAPI_BRECORD {
    PVOID* pvRecord,
    IRecordInfo* pRecInfo,
  } WINAPI_BRECORD;

  typedef union WINAPI_VARIANT_s_u {
    nil lVal,
    nil ,
  } WINAPI_VARIANT_s_u;

  typedef struct WINAPI_VARIANT_s {
    VARTYPE vt,
    WORD wReserved1,
    WORD wReserved2,
    WORD wReserved3,
    WINAPI_VARIANT_s_u ,
  } WINAPI_VARIANT_s;

  typedef union VARIANT {
    nil ,
    nil WINAPI_Other values are currently unsupported,
  } VARIANT;

  typedef VARIANT LPVARIANT;
  typedef VARIANT VARIANTARG;
  typedef VARIANT PROPVARIANT;
  typedef PROPVARIANT* PROPVARIANT*;
  typedef PROPVARIANT* REFPROPVARIANT;
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
  typedef DWORD DVASPECT;
  typedef struct FORMATETC {
    CLIPFORMAT cfFormat,
    DVTARGETDEVICE* ptd,
    DVASPECT dwAspect,
    LONG lindex,
    TYMED tymed,
  } FORMATETC;

  typedef FORMATETC LPFORMATETC;
  typedef UINT GETPROPERTYSTOREFLAGS;
  typedef struct PROPERTYKEY {
    GUID fmtid,
    DWORD pid,
  } PROPERTYKEY;

  typedef PROPERTYKEY REFPROPERTYKEY;
  typedef PROPERTYKEY PROPERTYKEY;
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
    IID* pIID,
    IUnknown* pItf,
    HRESULT hr,
  } MULTI_QI;

  typedef DWORD WINAPI_STGM_FLAGS;
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
  typedef DWORD LOCKTYPE;
  typedef DWORD ADVF;
  typedef enum APTTYPE {
    APTTYPE_CURRENT = _1,
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
    DISPID_UNKNOWN = _1,
    DISPID_VALUE = 0,
    DISPID_PROPERTYPUT = _3,
    DISPID_NEWENUM = _4,
    DISPID_EVALUATE = _5,
    DISPID_CONSTRUCTOR = _6,
    DISPID_DESTRUCTOR = _7,
    DISPID_COLLECT = _8,
    DISPID_AUTOSIZE = _500,
    DISPID_BACKCOLOR = _501,
    DISPID_BACKSTYLE = _502,
    DISPID_BORDERCOLOR = _503,
    DISPID_BORDERSTYLE = _504,
    DISPID_BORDERWIDTH = _505,
    DISPID_DRAWMODE = _507,
    DISPID_DRAWSTYLE = _508,
    DISPID_DRAWWIDTH = _509,
    DISPID_FILLCOLOR = _510,
    DISPID_FILLSTYLE = _511,
    DISPID_FONT = _512,
    DISPID_FORECOLOR = _513,
    DISPID_ENABLED = _514,
    DISPID_HWND = _515,
    DISPID_TABSTOP = _516,
    DISPID_TEXT = _517,
    DISPID_CAPTION = _518,
    DISPID_BORDERVISIBLE = _519,
    DISPID_APPEARANCE = _520,
    DISPID_MOUSEPOINTER = _521,
    DISPID_MOUSEICON = _522,
    DISPID_PICTURE = _523,
    DISPID_VALID = _524,
    DISPID_READYSTATE = _525,
    DISPID_LISTINDEX = _526,
    DISPID_SELECTED = _527,
    DISPID_LIST = _528,
    DISPID_COLUMN = _529,
    DISPID_LISTCOUNT = _531,
    DISPID_MULTISELECT = _532,
    DISPID_MAXLENGTH = _533,
    DISPID_PASSWORDCHAR = _534,
    DISPID_SCROLLBARS = _535,
    DISPID_WORDWRAP = _536,
    DISPID_MULTILINE = _537,
    DISPID_NUMBEROFROWS = _538,
    DISPID_NUMBEROFCOLUMNS = _539,
    DISPID_DISPLAYSTYLE = _540,
    DISPID_GROUPNAME = _541,
    DISPID_IMEMODE = _542,
    DISPID_ACCELERATOR = _543,
    DISPID_ENTERKEYBEHAVIOR = _544,
    DISPID_TABKEYBEHAVIOR = _545,
    DISPID_SELTEXT = _546,
    DISPID_SELSTART = _547,
    DISPID_SELLENGTH = _548,
    DISPID_REFRESH = _550,
    DISPID_DOCLICK = _551,
    DISPID_ABOUTBOX = _552,
    DISPID_ADDITEM = _553,
    DISPID_CLEAR = _554,
    DISPID_REMOVEITEM = _555,
    DISPID_CLICK = _600,
    DISPID_DBLCLICK = _601,
    DISPID_KEYDOWN = _602,
    DISPID_KEYPRESS = _603,
    DISPID_KEYUP = _604,
    DISPID_MOUSEDOWN = _605,
    DISPID_MOUSEMOVE = _606,
    DISPID_MOUSEUP = _607,
    DISPID_ERROREVENT = _608,
    DISPID_READYSTATECHANGE = _609,
    DISPID_CLICK_VALUE = _610,
    DISPID_RIGHTTOLEFT = _611,
    DISPID_TOPTOBOTTOM = _612,
    DISPID_THIS = _613,
    DISPID_AMBIENT_BACKCOLOR = _701,
    DISPID_AMBIENT_DISPLAYNAME = _702,
    DISPID_AMBIENT_FONT = _703,
    DISPID_AMBIENT_FORECOLOR = _704,
    DISPID_AMBIENT_LOCALEID = _705,
    DISPID_AMBIENT_MESSAGEREFLECT = _706,
    DISPID_AMBIENT_SCALEUNITS = _707,
    DISPID_AMBIENT_TEXTALIGN = _708,
    DISPID_AMBIENT_USERMODE = _709,
    DISPID_AMBIENT_UIDEAD = _710,
    DISPID_AMBIENT_SHOWGRABHANDLES = _711,
    DISPID_AMBIENT_SHOWHATCHING = _712,
    DISPID_AMBIENT_DISPLAYASDEFAULT = _713,
    DISPID_AMBIENT_SUPPORTSMNEMONICS = _714,
    DISPID_AMBIENT_AUTOCLIP = _715,
    DISPID_AMBIENT_APPEARANCE = _716,
    DISPID_AMBIENT_CODEPAGE = _725,
    DISPID_AMBIENT_PALETTE = _726,
    DISPID_AMBIENT_CHARSET = _727,
    DISPID_AMBIENT_TRANSFERPRIORITY = _728,
    DISPID_AMBIENT_RIGHTTOLEFT = _732,
    DISPID_AMBIENT_TOPTOBOTTOM = _733,
    DISPID_Name = _800,
    DISPID_Delete = _801,
    DISPID_Object = _802,
    DISPID_Parent = _803,
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

  typedef INTERFACEINFO LPINTERFACEINFO;
  typedef struct OLEINPLACEFRAMEINFO {
    UINT cb,
    BOOL fMDIApp,
    HWND hwndFrame,
    HACCEL haccel,
    UINT cAccelEntries,
  } OLEINPLACEFRAMEINFO;

  typedef OLEINPLACEFRAMEINFO LPOLEINPLACEFRAMEINFO;
  typedef struct OLEVERB {
    LONG lVerb,
    LPOLESTR lpszVerbName,
    DWORD fuFlags,
    DWORD grfAttribs,
  } OLEVERB;

  typedef OLEVERB LPOLEVERB;
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

  typedef DWORD OLECMDF;
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

  typedef DWORD WINAPI_CLSCTX;
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

  typedef STGMEDIUM LPSTGMEDIUM;
  typedef DWORD WINAPI_COINIT_FLAG;
  typedef USHORT WINAPI_FADF_FLAGS;
  typedef struct SAFEARRAYBOUND {
    ULONG cElements,
    LONG lLbound,
  } SAFEARRAYBOUND;

  typedef struct SAFEARRAY {
    USHORT cDims,
    WINAPI_FADF_FLAGS fFeatures,
    ULONG cbElements,
    ULONG cLocks,
    PVOID pvData,
    SAFEARRAYBOUND [1] rgsabound,
  } SAFEARRAY;

  typedef SAFEARRAY LPSAFEARRAY;
  typedef struct CUSTDATAITEM {
    GUID guid,
    VARIANTARG varValue,
  } CUSTDATAITEM;

  typedef CUSTDATAITEM LPCUSTDATAITEM;
  typedef struct CUSTDATA {
    DWORD cCustData,
    LPCUSTDATAITEM prgCustData,
  } CUSTDATA;

  typedef CUSTDATA LPCUSTDATA;
  typedef WORD WINAPI_InvokeFlags;
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
  typedef DWORD STGC;
]]

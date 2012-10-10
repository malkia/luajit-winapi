require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID LPDTCTL; //Alias
  typedef LPVOID LPSPropValue; //Alias
  typedef LPVOID LPNOTIFICATION; //Alias
  typedef LPVOID LPSRestriction; //Alias
  typedef void* IABContainer; //Interface
  typedef void* IABLogon; //Interface
  typedef void* IABProvider; //Interface
  typedef void* IAddrBook; //Interface
  typedef void* IAttach; //Interface
  typedef void* IDistList; //Interface
  typedef void* IMailUser; //Interface
  typedef void* IMAPIAdviseSink; //Interface
  typedef void* IMAPIContainer; //Interface
  typedef void* IMAPIControl; //Interface
  typedef void* IMAPIFolder; //Interface
  typedef void* IMAPIForm; //Interface
  typedef void* IMAPIFormAdviseSink; //Interface
  typedef void* IMAPIFormContainer; //Interface
  typedef void* IMAPIFormFactory; //Interface
  typedef void* IMAPIFormInfo; //Interface
  typedef void* IMAPIFormMgr; //Interface
  typedef void* IMAPIMessageSite; //Interface
  typedef void* IMAPIProgress; //Interface
  typedef void* IMAPIProp; //Interface
  typedef void* IMAPISession; //Interface
  typedef void* IMAPIStatus; //Interface
  typedef void* IMAPISupport; //Interface
  typedef void* IMAPITable; //Interface
  typedef void* IMAPIViewAdviseSink; //Interface
  typedef void* IMAPIViewContext; //Interface
  typedef void* IMessage; //Interface
  typedef void* IMsgServiceAdmin; //Interface
  typedef void* IMsgStore; //Interface
  typedef void* IMSLogon; //Interface
  typedef void* IMSProvider; //Interface
  typedef void* IPersistMessage; //Interface
  typedef void* IProfAdmin; //Interface
  typedef void* IProfSect; //Interface
  typedef void* IPropData; //Interface
  typedef void* IProviderAdmin; //Interface
  typedef void* ISpoolerHook; //Interface
  typedef void* ITableData; //Interface
  typedef void* ITnef; //Interface
  typedef void* IWABExtInit; //Interface
  typedef void* IWABObject; //Interface
  typedef void* IXPLogon; //Interface
  typedef void* IXPProvider; //Interface
  typedef void* IWABObject; //Interface
  typedef IWABObject* LPWABOBJECT; //Alias
  typedef IMAPIProgress* LPMAPIPROGRESS; //Alias
  typedef IMAPITable* LPMAPITABLE; //Alias
  typedef IMAPIStatus* LPMAPISTATUS; //Alias
  typedef IAttach* LPATTACH; //Alias
  typedef IMAPISupport* LPMAPISUP; //Alias
  typedef IMAPIFolder *LPMAPIFOLDER; //Pointer
  typedef IMAPIViewContext* LPMAPIVIEWCONTEXT; //Alias
  typedef IMAPIViewAdviseSink* LPMAPIVIEWADVISESINK; //Alias
  typedef IPersistMessage* LPPERSISTMESSAGE; //Alias
  typedef IABLogon* LPABLOGON; //Alias
  typedef IMAPIFormInfo* *LPMAPIFORMINFO; //Pointer
  typedef IMAPIMessageSite* LPMAPIMESSAGESITE; //Alias
  typedef IMAPIFormAdviseSink* LPMAPIFORMADVISESINK; //Alias
  typedef IProfSect* LPPROFSECT; //Alias
  typedef IMsgStore* LPMDB; //Alias
  typedef IMsgServiceAdmin* LPSERVICEADMIN; //Alias
  typedef IProviderAdmin* LPPROVIDERADMIN; //Alias
  typedef IMSLogon* LPMSLOGON; //Alias
  typedef IMailUser* LPMAILUSER; //Alias
  typedef IMAPIProp* LPMAPIPROP; //Alias
  typedef IMAPISession* LPMAPISESSION; //Alias
  typedef IMAPIAdviseSink* LPMAPIADVISESINK; //Alias
  typedef IMessage* LPMESSAGE; //Alias
  typedef LPVOID LPFNABSDI; //Alias
  typedef LPVOID LPFNDISMISS; //Alias
  typedef LPVOID LPFNBUTTON; //Alias
  typedef LPVOID LPALLOCATEBUFFER; //Alias
  typedef LPVOID FTG; //Alias
  typedef LPVOID LPMSGSESS; //Alias
  typedef IID* LPCIID; //Alias
  typedef LPVOID PFNIDLE; //Alias
  typedef LPVOID LPALLOCATEMORE; //Alias
  typedef LPVOID LPNOTIFCALLBACK; //Alias
  typedef LPVOID LPFREEBUFFER; //Alias
  typedef ULONG *LPULONG; //Pointer
  enum { MAPI_DIM = 1 };
  typedef GUID MAPIUID; //Alias
  typedef MAPIUID *LPMAPIUID; //Pointer
  typedef ULONG MapiUnicodeFlag; //Alias
  typedef ULONG FlagList_FLAGS; //Alias
  typedef struct FlagList {
    ULONG cFlags;
    FlagList_FLAGS ulFlag[MAPI_DIM];
  } FlagList;
  typedef FlagList *LPFlagList; //Pointer
  typedef BYTE ENTRYID_FLAGS; //Alias
  typedef struct ENTRYID {
    ENTRYID_FLAGS abFlags[4];
    BYTE ab[MAPI_DIM];
  } ENTRYID;
  typedef ENTRYID *LPENTRYID; //Pointer
  typedef struct SMessageClassArray {
    ULONG cValues;
    LPCSTR aMessageClass[MAPI_DIM];
  } SMessageClassArray;
  typedef SMessageClassArray *LPSMESSAGECLASSARRAY; //Pointer
  typedef ULONG MAPINAMEID_CHOICE; //Alias
  static const MAPINAMEID_CHOICE MNID_ID = 0;
  static const MAPINAMEID_CHOICE MNID_STRING = 1;
  typedef union MAPINAMEID_u {
    LONG lID;
    LPWSTR lpwstrName;
  } MAPINAMEID_u;
  typedef struct MAPINAMEID {
    LPGUID lpguid;
    MAPINAMEID_CHOICE ulKind;
    MAPINAMEID_u Kind;
  } MAPINAMEID;
  typedef MAPINAMEID *LPMAPINAMEID; //Pointer
  typedef struct SMAPIFormPropEnumVal {
    LPTSTR pszDisplayName;
    ULONG nVal;
  } SMAPIFormPropEnumVal;
  typedef SMAPIFormPropEnumVal *LPMAPIFORMPROPENUMVAL; //Pointer
  typedef struct SMAPIFormProp_u_s {
    MAPINAMEID nmidIdx;
    ULONG cfpevAvailable;
    LPMAPIFORMPROPENUMVAL pfpevAvailable;
  } SMAPIFormProp_u_s;
  typedef union SMAPIFormProp_u {
    SMAPIFormProp_u_s s1;
  } SMAPIFormProp_u;
  typedef ULONG FORMPROPSPECIALTYPE; //Alias
  static const FORMPROPSPECIALTYPE FPST_VANILLA = 0;
  static const FORMPROPSPECIALTYPE FPST_ENUM_PROP = 1;
  typedef struct SMAPIFormProp {
    MapiUnicodeFlag ulFlags;
    ULONG nPropType;
    MAPINAMEID nmid;
    LPTSTR pszDisplayName;
    FORMPROPSPECIALTYPE nSpecialType;
    SMAPIFormProp_u u;
  } SMAPIFormProp;
  typedef struct SMAPIFormPropArray {
    ULONG cProps;
    ULONG ulPad;
    SMAPIFormProp aFormProp[MAPI_DIM];
  } SMAPIFormPropArray;
  typedef SMAPIFormPropArray *LPMAPIFORMPROPARRAY; //Pointer
  typedef struct SMAPIFormInfoArray {
    ULONG cForms;
    LPMAPIFORMINFO aFormInfo[MAPI_DIM];
  } SMAPIFormInfoArray;
  typedef SMAPIFormInfoArray *LPSMAPIFORMINFOARRAY; //Pointer
  typedef struct SMAPIVerb {
    LONG lVerb;
    LPTSTR szVerbname;
    DWORD fuFlags;
    DWORD grfAttribs;
    MapiUnicodeFlag ulFlags;
  } SMAPIVerb;
  typedef struct SMAPIVerbArray {
    ULONG cMAPIVerb;
    SMAPIVerb aMAPIVerb[MAPI_DIM];
  } SMAPIVerbArray;
  typedef SMAPIVerbArray *LPMAPIVERBARRAY; //Pointer
  typedef struct NOTIFKEY {
    ULONG cb;
    BYTE ab[MAPI_DIM];
  } NOTIFKEY;
  typedef NOTIFKEY *LPNOTIFKEY; //Pointer
  typedef struct SPropTagArray {
    ULONG cValues;
    ULONG aulPropTag[MAPI_DIM];
  } SPropTagArray;
  typedef SPropTagArray *LPSPropTagArray; //Pointer
  typedef struct SRow {
    ULONG ulAdrEntryPad;
    ULONG cValues;
    LPSPropValue lpProps;
  } SRow;
  typedef SRow *LPSRow; //Pointer
  typedef struct SRowSet {
    ULONG cRows;
    SRow aRow[MAPI_DIM];
  } SRowSet;
  typedef SRowSet *LPSRowSet; //Pointer
  typedef ULONG TABLE_SORT; //Alias
  typedef struct SSortOrder {
    ULONG ulPropTag;
    TABLE_SORT ulOrder;
  } SSortOrder;
  typedef struct SSortOrderSet {
    ULONG cSorts;
    ULONG cCategories;
    ULONG cExpanded;
    SSortOrder aSort[MAPI_DIM];
  } SSortOrderSet;
  typedef SSortOrderSet *LPSSortOrderSet; //Pointer
  typedef struct ADRENTRY {
    ULONG ulReserved1;
    ULONG cValues;
    LPSPropValue rgPropVals;
  } ADRENTRY;
  typedef ADRENTRY *LPADRENTRY; //Pointer
  typedef struct ADRLIST {
    ULONG cEntries;
    ADRENTRY aEntries[MAPI_DIM];
  } ADRLIST;
  typedef ADRLIST *LPADRLIST; //Pointer
  typedef ULONG PROPATTR_FLAGS; //Alias
  typedef struct SPropAttrArray {
    ULONG cValues;
    PROPATTR_FLAGS aPropAttr[MAPI_DIM];
  } SPropAttrArray;
  typedef SPropAttrArray *LPSPropAttrArray; //Pointer
  typedef union DTPAGE_u {
    LPTSTR lpszComponent;
    ULONG ulItemID;
  } DTPAGE_u;
  typedef struct DTPAGE {
    ULONG cctl;
    LPTSTR lpszResourceName;
    DTPAGE_u ;
    LPDTCTL lpctl;
  } DTPAGE;
  typedef DTPAGE *LPDTPAGE; //Pointer
  typedef struct SPropProblem {
    ULONG ulIndex;
    ULONG ulPropTag;
    SCODE scode;
  } SPropProblem;
  typedef struct SPropProblemArray {
    ULONG cProblem;
    SPropProblem aProblem[MAPI_DIM];
  } SPropProblemArray;
  typedef struct STnefProblem {
    ULONG ulComponent;
    ULONG ulAttribute;
    ULONG ulPropTag;
    SCODE scode;
  } STnefProblem;
  typedef struct STnefProblemArray {
    ULONG cProblem;
    STnefProblem aProblem[MAPI_DIM];
  } STnefProblemArray;
  typedef UINT METHODS; //Alias
  typedef ULONG MapiObjType; //Alias
  static const MapiObjType MAPI_STORE = 0x00000001;
  static const MapiObjType MAPI_ADDRBOOK = 0x00000002;
  static const MapiObjType MAPI_FOLDER = 0x00000003;
  static const MapiObjType MAPI_ABCONT = 0x00000004;
  static const MapiObjType MAPI_MESSAGE = 0x00000005;
  static const MapiObjType MAPI_MAILUSER = 0x00000006;
  static const MapiObjType MAPI_ATTACH = 0x00000007;
  static const MapiObjType MAPI_DISTLIST = 0x00000008;
  static const MapiObjType MAPI_PROFSECT = 0x00000009;
  static const MapiObjType MAPI_STATUS = 0x0000000A;
  static const MapiObjType MAPI_SESSION = 0x0000000B;
  static const MapiObjType MAPI_FORMINFO = 0x0000000C;
  typedef ULONG FLAGS; //Alias
  typedef ULONG MapiTableType; //Alias
  static const MapiTableType TBLTYPE_SNAPSHOT = 0;
  static const MapiTableType TBLTYPE_KEYSET = 1;
  static const MapiTableType TBLTYPE_DYNAMIC = 2;
  typedef ULONG MapiTableStatus; //Alias
  static const MapiTableStatus TBLSTAT_COMPLETE = 0;
  static const MapiTableStatus TBLSTAT_QCHANGED = 7;
  static const MapiTableStatus TBLSTAT_SORTING = 9;
  static const MapiTableStatus TBLSTAT_SORT_ERROR = 10;
  static const MapiTableStatus TBLSTAT_SETTING_COLS = 11;
  static const MapiTableStatus TBLSTAT_SETCOL_ERROR = 13;
  static const MapiTableStatus TBLSTAT_RESTRICTING = 14;
  static const MapiTableStatus TBLSTAT_RESTRICT_ERROR = 15;
  typedef ULONG ADRPARM_Flags; //Alias
  typedef struct ADRPARM {
    ULONG cbABContEntryID;
    LPENTRYID lpABContEntryID;
    ADRPARM_Flags ulFlags;
    LPVOID lpReserved;
    ULONG ulHelpContext;
    LPTSTR lpszHelpFileName;
    LPFNABSDI lpfnABSDI;
    LPFNDISMISS lpfnDismiss;
    LPVOID lpvDismissContext;
    LPTSTR lpszCaption;
    LPTSTR lpszNewEntryTitle;
    LPTSTR lpszDestWellsTitle;
    ULONG cDestFields;
    ULONG nDestFieldFocus;
    LPTSTR* lppszDestTitles;
    ULONG* lpulDestComps;
    LPSRestriction lpContRestriction;
    LPSRestriction lpHierRestriction;
  } ADRPARM;
  typedef ADRPARM *LPADRPARM; //Pointer
  typedef struct FORMPRINTSETUP {
    MapiUnicodeFlag ulFlags;
    HGLOBAL hDevMode;
    HGLOBAL hDevNames;
    ULONG ulFirstPageNumber;
    ULONG fPrintAttachments;
  } FORMPRINTSETUP;
  typedef FORMPRINTSETUP *LPFORMPRINTSETUP; //Pointer
  typedef ULONG WABEXTDISPLAY_Flags; //Alias
  typedef struct WABEXTDISPLAY {
    ULONG cbSize;
    LPWABOBJECT lpWABObject;
    LPADRBOOK lpAdrBook;
    LPMAPIPROP lpPropObj;
    BOOL fReadOnly;
    BOOL fDataChanged;
    WABEXTDISPLAY_Flags ulFlags;
    LPVOID lpv;
    LPTSTR lpsz;
  } WABEXTDISPLAY;
  typedef WABEXTDISPLAY *LPWABEXTDISPLAY; //Pointer
  typedef struct OPTIONDATA {
    ULONG ulFlags;
    LPGUID lpRecipGUID;
    LPTSTR lpszAdrType;
    LPTSTR lpszDLLName;
    ULONG ulOrdinal;
    ULONG cbOptionsData;
    LPBYTE lpbOptionsData;
    ULONG cOptionsProps;
    LPSPropValue lpOptionsProps;
  } OPTIONDATA;
  typedef struct SBinary {
    ULONG cb;
    LPBYTE lpb;
  } SBinary;
  typedef ULONG HFRMREG; //Alias
  static const HFRMREG HFRMREG_DEFAULT = 0;
  static const HFRMREG HFRMREG_LOCAL = 1;
  static const HFRMREG HFRMREG_PERSONAL = 2;
  static const HFRMREG HFRMREG_FOLDER = 3;
  typedef ULONG BOOKMARK; //Alias
  static const BOOKMARK BOOKMARK_BEGINNING = 0;
  static const BOOKMARK BOOKMARK_CURRENT = 1;
  static const BOOKMARK BOOKMARK_END = 2;
  typedef struct SBinaryArray {
    ULONG cValues;
    SBinary* lpbin;
  } SBinaryArray;
  typedef SBinaryArray *LPENTRYLIST; //Pointer
  typedef struct MAPIERROR {
    ULONG ulVersion;
    LPTSTR lpszError;
    LPTSTR lpszComponent;
    ULONG ulLowLevelError;
    ULONG ulContext;
  } MAPIERROR;
  typedef MAPIERROR *LPMAPIERROR; //Pointer
  typedef ULONG MapiInitVersion; //Alias
  typedef ULONG MapiInitFlags; //Alias
  typedef struct MAPIINIT_0 {
    MapiInitVersion ulVersion;
    MapiInitFlags ulFlags;
  } MAPIINIT_0;
  typedef MAPIINIT_0 *LPMAPIINIT_0; //Pointer
]]

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
//typedef ITnef** LPITNEF*; //Alias
//typedef IXPProvider** LPXPPROVIDER*; //Alias
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
//typedef IXPLogon** LPXPLOGON*; //Alias
  typedef IMAPIProp* LPMAPIPROP; //Alias
  typedef IMAPISession* LPMAPISESSION; //Alias
//typedef IABProvider* LPABPROVIDER*; //Alias
//typedef IPropData* LPPROPDATA*; //Alias
//typedef ITableData** LPTABLEDATA*; //Alias
//typedef IStorage* LPSTORAGE*; //Alias
  typedef IMAPIAdviseSink* LPMAPIADVISESINK; //Alias
//typedef IProfAdmin** LPPROFADMIN*; //Alias
//typedef IMAPIFormMgr** LPMAPIFORMMGR*; //Alias
//typedef IMAPIFormContainer** LPMAPIFORMCONTAINER*; //Alias
//typedef IMSProvider** LPMSPROVIDER*; //Alias
  typedef IMessage* LPMESSAGE; //Alias
  typedef LPVOID LPFNABSDI; //Alias
  typedef LPVOID LPFNDISMISS; //Alias
  typedef LPVOID LPFNBUTTON; //Alias
//typedef LPVOID CALLERRELEASE*; //Alias
  typedef LPVOID LPALLOCATEBUFFER; //Alias
  typedef LPVOID FTG; //Alias
  typedef LPVOID LPMSGSESS; //Alias
  typedef IID* LPCIID; //Alias
  typedef LPVOID PFNIDLE; //Alias
  typedef LPVOID LPALLOCATEMORE; //Alias
  typedef LPVOID LPNOTIFCALLBACK; //Alias
  typedef LPVOID LPFREEBUFFER; //Alias
  typedef ULONG *LPULONG; //Pointer
//typedef LPVOID MSGCALLRELEASE*; //Alias
  enum { MAPI_DIM = 1 };
  typedef GUID MAPIUID; //Alias
  typedef MAPIUID *LPMAPIUID; //Pointer
  typedef ULONG WINAPI_MapiUnicodeFlag; //Alias
  typedef ULONG WINAPI_FlagList_FLAGS; //Alias
  typedef struct FlagList {
    ULONG cFlags;
    WINAPI_FlagList_FLAGS ulFlag[MAPI_DIM];
  } FlagList;
  typedef FlagList *LPFlagList; //Pointer
  typedef BYTE WINAPI_ENTRYID_FLAGS; //Alias
  typedef struct ENTRYID {
    WINAPI_ENTRYID_FLAGS abFlags[4];
    BYTE ab[MAPI_DIM];
  } ENTRYID;
  typedef ENTRYID *LPENTRYID; //Pointer
  typedef struct SMessageClassArray {
    ULONG cValues;
    LPCSTR aMessageClass[MAPI_DIM];
  } SMessageClassArray;
  typedef SMessageClassArray *LPSMESSAGECLASSARRAY; //Pointer
  typedef ULONG WINAPI_MAPINAMEID_CHOICE; //Alias
  static const WINAPI_MAPINAMEID_CHOICE MNID_ID = 0;
  static const WINAPI_MAPINAMEID_CHOICE MNID_STRING = 1;
  typedef union WINAPI_MAPINAMEID_u {
    LONG lID;
    LPWSTR lpwstrName;
  } WINAPI_MAPINAMEID_u;
  typedef struct MAPINAMEID {
    LPGUID lpguid;
    WINAPI_MAPINAMEID_CHOICE ulKind;
    WINAPI_MAPINAMEID_u Kind;
  } MAPINAMEID;
  typedef MAPINAMEID *LPMAPINAMEID; //Pointer
  typedef struct SMAPIFormPropEnumVal {
    LPTSTR pszDisplayName;
    ULONG nVal;
  } SMAPIFormPropEnumVal;
  typedef SMAPIFormPropEnumVal *LPMAPIFORMPROPENUMVAL; //Pointer
  typedef struct WINAPI_SMAPIFormProp_u_s {
    MAPINAMEID nmidIdx;
    ULONG cfpevAvailable;
    LPMAPIFORMPROPENUMVAL pfpevAvailable;
  } WINAPI_SMAPIFormProp_u_s;
  typedef union WINAPI_SMAPIFormProp_u {
    WINAPI_SMAPIFormProp_u_s s1;
  } WINAPI_SMAPIFormProp_u;
  typedef ULONG FORMPROPSPECIALTYPE; //Alias
  static const FORMPROPSPECIALTYPE FPST_VANILLA = 0;
  static const FORMPROPSPECIALTYPE FPST_ENUM_PROP = 1;
  typedef struct SMAPIFormProp {
    WINAPI_MapiUnicodeFlag ulFlags;
    ULONG nPropType;
    MAPINAMEID nmid;
    LPTSTR pszDisplayName;
    FORMPROPSPECIALTYPE nSpecialType;
    WINAPI_SMAPIFormProp_u u;
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
    WINAPI_MapiUnicodeFlag ulFlags;
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
  typedef ULONG WINAPI_TABLE_SORT; //Alias
  typedef struct SSortOrder {
    ULONG ulPropTag;
    WINAPI_TABLE_SORT ulOrder;
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
  typedef ULONG WINAPI_PROPATTR_FLAGS; //Alias
  typedef struct SPropAttrArray {
    ULONG cValues;
    WINAPI_PROPATTR_FLAGS aPropAttr[MAPI_DIM];
  } SPropAttrArray;
  typedef SPropAttrArray *LPSPropAttrArray; //Pointer
  typedef union WINAPI_DTPAGE_u {
    LPTSTR lpszComponent;
    ULONG ulItemID;
  } WINAPI_DTPAGE_u;
  typedef struct DTPAGE {
    ULONG cctl;
    LPTSTR lpszResourceName;
    WINAPI_DTPAGE_u ;
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
  typedef SPropProblemArray *LPSPropProblemArray*; //Pointer
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
  typedef STnefProblemArray *LPSTnefProblemArray*; //Pointer
  typedef UINT METHODS; //Alias
  typedef ULONG WINAPI_MapiObjType; //Alias
  static const WINAPI_MapiObjType MAPI_STORE = 0x00000001;
  static const WINAPI_MapiObjType MAPI_ADDRBOOK = 0x00000002;
  static const WINAPI_MapiObjType MAPI_FOLDER = 0x00000003;
  static const WINAPI_MapiObjType MAPI_ABCONT = 0x00000004;
  static const WINAPI_MapiObjType MAPI_MESSAGE = 0x00000005;
  static const WINAPI_MapiObjType MAPI_MAILUSER = 0x00000006;
  static const WINAPI_MapiObjType MAPI_ATTACH = 0x00000007;
  static const WINAPI_MapiObjType MAPI_DISTLIST = 0x00000008;
  static const WINAPI_MapiObjType MAPI_PROFSECT = 0x00000009;
  static const WINAPI_MapiObjType MAPI_STATUS = 0x0000000A;
  static const WINAPI_MapiObjType MAPI_SESSION = 0x0000000B;
  static const WINAPI_MapiObjType MAPI_FORMINFO = 0x0000000C;
  typedef ULONG FLAGS; //Alias
  typedef ULONG WINAPI_MapiTableType; //Alias
  static const WINAPI_MapiTableType TBLTYPE_SNAPSHOT = 0;
  static const WINAPI_MapiTableType TBLTYPE_KEYSET = 1;
  static const WINAPI_MapiTableType TBLTYPE_DYNAMIC = 2;
  typedef ULONG WINAPI_MapiTableStatus; //Alias
  static const WINAPI_MapiTableStatus TBLSTAT_COMPLETE = 0;
  static const WINAPI_MapiTableStatus TBLSTAT_QCHANGED = 7;
  static const WINAPI_MapiTableStatus TBLSTAT_SORTING = 9;
  static const WINAPI_MapiTableStatus TBLSTAT_SORT_ERROR = 10;
  static const WINAPI_MapiTableStatus TBLSTAT_SETTING_COLS = 11;
  static const WINAPI_MapiTableStatus TBLSTAT_SETCOL_ERROR = 13;
  static const WINAPI_MapiTableStatus TBLSTAT_RESTRICTING = 14;
  static const WINAPI_MapiTableStatus TBLSTAT_RESTRICT_ERROR = 15;
  typedef ULONG WINAPI_ADRPARM_Flags; //Alias
  typedef struct ADRPARM {
    ULONG cbABContEntryID;
    LPENTRYID lpABContEntryID;
    WINAPI_ADRPARM_Flags ulFlags;
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
    WINAPI_MapiUnicodeFlag ulFlags;
    HGLOBAL hDevMode;
    HGLOBAL hDevNames;
    ULONG ulFirstPageNumber;
    ULONG fPrintAttachments;
  } FORMPRINTSETUP;
  typedef FORMPRINTSETUP *LPFORMPRINTSETUP; //Pointer
  typedef ULONG WINAPI_WABEXTDISPLAY_Flags; //Alias
  typedef struct WABEXTDISPLAY {
    ULONG cbSize;
    LPWABOBJECT lpWABObject;
    LPADRBOOK lpAdrBook;
    LPMAPIPROP lpPropObj;
    BOOL fReadOnly;
    BOOL fDataChanged;
    WINAPI_WABEXTDISPLAY_Flags ulFlags;
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
  typedef OPTIONDATA *LPOPTIONDATA*; //Pointer
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
  typedef ULONG WINAPI_MapiInitVersion; //Alias
  typedef ULONG WINAPI_MapiInitFlags; //Alias
  typedef struct MAPIINIT_0 {
    WINAPI_MapiInitVersion ulVersion;
    WINAPI_MapiInitFlags ulFlags;
  } MAPIINIT_0;
  typedef MAPIINIT_0 *LPMAPIINIT_0; //Pointer
]]

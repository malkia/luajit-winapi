require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  typedef LPVOID LPDTCTL;
  typedef LPVOID LPSPropValue;
  typedef LPVOID LPNOTIFICATION;
  typedef LPVOID LPSRestriction;
  typedef ITnef** LPITNEF*;
  typedef IXPProvider** LPXPPROVIDER*;
  typedef IWABObject* LPWABOBJECT;
  typedef IMAPIProgress* LPMAPIPROGRESS;
  typedef IMAPITable* LPMAPITABLE;
  typedef IMAPIStatus* LPMAPISTATUS;
  typedef IAttach* LPATTACH;
  typedef IMAPISupport* LPMAPISUP;
  typedef IMAPIFolder LPMAPIFOLDER;
  typedef IMAPIViewContext* LPMAPIVIEWCONTEXT;
  typedef IMAPIViewAdviseSink* LPMAPIVIEWADVISESINK;
  typedef IPersistMessage* LPPERSISTMESSAGE;
  typedef IABLogon* LPABLOGON;
  typedef IMAPIFormInfo* LPMAPIFORMINFO;
  typedef IMAPIMessageSite* LPMAPIMESSAGESITE;
  typedef IMAPIFormAdviseSink* LPMAPIFORMADVISESINK;
  typedef IProfSect* LPPROFSECT;
  typedef IMsgStore* LPMDB;
  typedef IMsgServiceAdmin* LPSERVICEADMIN;
  typedef IProviderAdmin* LPPROVIDERADMIN;
  typedef IMSLogon* LPMSLOGON;
  typedef IMailUser* LPMAILUSER;
  typedef IXPLogon** LPXPLOGON*;
  typedef IMAPIProp* LPMAPIPROP;
  typedef IMAPISession* LPMAPISESSION;
  typedef IABProvider* LPABPROVIDER*;
  typedef IPropData* LPPROPDATA*;
  typedef ITableData** LPTABLEDATA*;
  typedef IStorage* LPSTORAGE*;
  typedef IMAPIAdviseSink* LPMAPIADVISESINK;
  typedef IProfAdmin** LPPROFADMIN*;
  typedef IMAPIFormMgr** LPMAPIFORMMGR*;
  typedef IMAPIFormContainer** LPMAPIFORMCONTAINER*;
  typedef IMSProvider** LPMSPROVIDER*;
  typedef IMessage* LPMESSAGE;
  typedef LPVOID LPFNABSDI;
  typedef LPVOID LPFNDISMISS;
  typedef LPVOID LPFNBUTTON;
  typedef LPVOID CALLERRELEASE*;
  typedef LPVOID LPALLOCATEBUFFER;
  typedef LPVOID FTG;
  typedef LPVOID LPMSGSESS;
  typedef IID* LPCIID;
  typedef LPVOID PFNIDLE;
  typedef LPVOID LPALLOCATEMORE;
  typedef LPVOID LPNOTIFCALLBACK;
  typedef LPVOID LPFREEBUFFER;
  typedef ULONG LPULONG;
  typedef LPVOID MSGCALLRELEASE*;
  typedef GUID MAPIUID;
  typedef MAPIUID LPMAPIUID;
  typedef ULONG WINAPI_MapiUnicodeFlag;
  typedef ULONG WINAPI_FlagList_FLAGS;
  typedef struct FlagList {
    ULONG cFlags,
    WINAPI_FlagList_FLAGS [MAPI_DIM] ulFlag,
  } FlagList;

  typedef FlagList LPFlagList;
  typedef BYTE WINAPI_ENTRYID_FLAGS;
  typedef struct ENTRYID {
    WINAPI_ENTRYID_FLAGS [4] abFlags,
    BYTE [MAPI_DIM] ab,
  } ENTRYID;

  typedef ENTRYID LPENTRYID;
  typedef struct SMessageClassArray {
    ULONG cValues,
    LPCSTR [MAPI_DIM] aMessageClass,
  } SMessageClassArray;

  typedef SMessageClassArray LPSMESSAGECLASSARRAY;
  typedef enum WINAPI_MAPINAMEID_CHOICE {
    MNID_ID = 0,
    MNID_STRING = 1,
  } WINAPI_MAPINAMEID_CHOICE;
  typedef union WINAPI_MAPINAMEID_u {
    LONG lID,
    LPWSTR lpwstrName,
  } WINAPI_MAPINAMEID_u;

  typedef struct MAPINAMEID {
    LPGUID lpguid,
    WINAPI_MAPINAMEID_CHOICE ulKind,
    WINAPI_MAPINAMEID_u Kind,
  } MAPINAMEID;

  typedef MAPINAMEID LPMAPINAMEID;
  typedef struct SMAPIFormPropEnumVal {
    LPTSTR pszDisplayName,
    ULONG nVal,
  } SMAPIFormPropEnumVal;

  typedef SMAPIFormPropEnumVal LPMAPIFORMPROPENUMVAL;
  typedef struct WINAPI_SMAPIFormProp_u_s {
    MAPINAMEID nmidIdx,
    ULONG cfpevAvailable,
    LPMAPIFORMPROPENUMVAL pfpevAvailable,
  } WINAPI_SMAPIFormProp_u_s;

  typedef union WINAPI_SMAPIFormProp_u {
    WINAPI_SMAPIFormProp_u_s s1,
  } WINAPI_SMAPIFormProp_u;

  typedef enum FORMPROPSPECIALTYPE {
    FPST_VANILLA = 0,
    FPST_ENUM_PROP = 1,
  } FORMPROPSPECIALTYPE;
  typedef struct SMAPIFormProp {
    WINAPI_MapiUnicodeFlag ulFlags,
    ULONG nPropType,
    MAPINAMEID nmid,
    LPTSTR pszDisplayName,
    FORMPROPSPECIALTYPE nSpecialType,
    WINAPI_SMAPIFormProp_u u,
  } SMAPIFormProp;

  typedef struct SMAPIFormPropArray {
    ULONG cProps,
    ULONG ulPad,
    SMAPIFormProp [MAPI_DIM] aFormProp,
  } SMAPIFormPropArray;

  typedef SMAPIFormPropArray LPMAPIFORMPROPARRAY;
  typedef struct SMAPIFormInfoArray {
    ULONG cForms,
    LPMAPIFORMINFO [MAPI_DIM] aFormInfo,
  } SMAPIFormInfoArray;

  typedef SMAPIFormInfoArray LPSMAPIFORMINFOARRAY;
  typedef struct SMAPIVerb {
    LONG lVerb,
    LPTSTR szVerbname,
    DWORD fuFlags,
    DWORD grfAttribs,
    WINAPI_MapiUnicodeFlag ulFlags,
  } SMAPIVerb;

  typedef struct SMAPIVerbArray {
    ULONG cMAPIVerb,
    SMAPIVerb [MAPI_DIM] aMAPIVerb,
  } SMAPIVerbArray;

  typedef SMAPIVerbArray LPMAPIVERBARRAY;
  typedef struct NOTIFKEY {
    ULONG cb,
    BYTE [MAPI_DIM] ab,
  } NOTIFKEY;

  typedef NOTIFKEY LPNOTIFKEY;
  typedef struct SPropTagArray {
    ULONG cValues,
    ULONG [MAPI_DIM] aulPropTag,
  } SPropTagArray;

  typedef SPropTagArray LPSPropTagArray;
  typedef struct SRow {
    ULONG ulAdrEntryPad,
    ULONG cValues,
    LPSPropValue lpProps,
  } SRow;

  typedef SRow LPSRow;
  typedef struct SRowSet {
    ULONG cRows,
    SRow [MAPI_DIM] aRow,
  } SRowSet;

  typedef SRowSet LPSRowSet;
  typedef ULONG WINAPI_TABLE_SORT;
  typedef struct SSortOrder {
    ULONG ulPropTag,
    WINAPI_TABLE_SORT ulOrder,
  } SSortOrder;

  typedef struct SSortOrderSet {
    ULONG cSorts,
    ULONG cCategories,
    ULONG cExpanded,
    SSortOrder [MAPI_DIM] aSort,
  } SSortOrderSet;

  typedef SSortOrderSet LPSSortOrderSet;
  typedef struct ADRENTRY {
    ULONG ulReserved1,
    ULONG cValues,
    LPSPropValue rgPropVals,
  } ADRENTRY;

  typedef ADRENTRY LPADRENTRY;
  typedef struct ADRLIST {
    ULONG cEntries,
    ADRENTRY [MAPI_DIM] aEntries,
  } ADRLIST;

  typedef ADRLIST LPADRLIST;
  typedef ULONG WINAPI_PROPATTR_FLAGS;
  typedef struct SPropAttrArray {
    ULONG cValues,
    WINAPI_PROPATTR_FLAGS [MAPI_DIM] aPropAttr,
  } SPropAttrArray;

  typedef SPropAttrArray LPSPropAttrArray;
  typedef union WINAPI_DTPAGE_u {
    LPTSTR lpszComponent,
    ULONG ulItemID,
  } WINAPI_DTPAGE_u;

  typedef struct DTPAGE {
    ULONG cctl,
    LPTSTR lpszResourceName,
    WINAPI_DTPAGE_u ,
    LPDTCTL lpctl,
  } DTPAGE;

  typedef DTPAGE LPDTPAGE;
  typedef struct SPropProblem {
    ULONG ulIndex,
    ULONG ulPropTag,
    SCODE scode,
  } SPropProblem;

  typedef struct SPropProblemArray {
    ULONG cProblem,
    SPropProblem [MAPI_DIM] aProblem,
  } SPropProblemArray;

  typedef SPropProblemArray LPSPropProblemArray*;
  typedef struct STnefProblem {
    ULONG ulComponent,
    ULONG ulAttribute,
    ULONG ulPropTag,
    SCODE scode,
  } STnefProblem;

  typedef struct STnefProblemArray {
    ULONG cProblem,
    STnefProblem [MAPI_DIM] aProblem,
  } STnefProblemArray;

  typedef STnefProblemArray LPSTnefProblemArray*;
  typedef UINT METHODS;
  typedef enum WINAPI_MapiObjType {
    MAPI_STORE = 0x00000001,
    MAPI_ADDRBOOK = 0x00000002,
    MAPI_FOLDER = 0x00000003,
    MAPI_ABCONT = 0x00000004,
    MAPI_MESSAGE = 0x00000005,
    MAPI_MAILUSER = 0x00000006,
    MAPI_ATTACH = 0x00000007,
    MAPI_DISTLIST = 0x00000008,
    MAPI_PROFSECT = 0x00000009,
    MAPI_STATUS = 0x0000000A,
    MAPI_SESSION = 0x0000000B,
    MAPI_FORMINFO = 0x0000000C,
  } WINAPI_MapiObjType;
  typedef ULONG FLAGS;
  typedef enum WINAPI_MapiTableType {
    TBLTYPE_SNAPSHOT = 0,
    TBLTYPE_KEYSET = 1,
    TBLTYPE_DYNAMIC = 2,
  } WINAPI_MapiTableType;
  typedef enum WINAPI_MapiTableStatus {
    TBLSTAT_COMPLETE = 0,
    TBLSTAT_QCHANGED = 7,
    TBLSTAT_SORTING = 9,
    TBLSTAT_SORT_ERROR = 10,
    TBLSTAT_SETTING_COLS = 11,
    TBLSTAT_SETCOL_ERROR = 13,
    TBLSTAT_RESTRICTING = 14,
    TBLSTAT_RESTRICT_ERROR = 15,
  } WINAPI_MapiTableStatus;
  typedef ULONG WINAPI_ADRPARM_Flags;
  typedef struct ADRPARM {
    ULONG cbABContEntryID,
    LPENTRYID lpABContEntryID,
    WINAPI_ADRPARM_Flags ulFlags,
    LPVOID lpReserved,
    ULONG ulHelpContext,
    LPTSTR lpszHelpFileName,
    LPFNABSDI lpfnABSDI,
    LPFNDISMISS lpfnDismiss,
    LPVOID lpvDismissContext,
    LPTSTR lpszCaption,
    LPTSTR lpszNewEntryTitle,
    LPTSTR lpszDestWellsTitle,
    ULONG cDestFields,
    ULONG nDestFieldFocus,
    LPTSTR* lppszDestTitles,
    ULONG* lpulDestComps,
    LPSRestriction lpContRestriction,
    LPSRestriction lpHierRestriction,
  } ADRPARM;

  typedef ADRPARM LPADRPARM;
  typedef struct FORMPRINTSETUP {
    WINAPI_MapiUnicodeFlag ulFlags,
    HGLOBAL hDevMode,
    HGLOBAL hDevNames,
    ULONG ulFirstPageNumber,
    ULONG fPrintAttachments,
  } FORMPRINTSETUP;

  typedef FORMPRINTSETUP LPFORMPRINTSETUP;
  typedef ULONG WINAPI_WABEXTDISPLAY_Flags;
  typedef struct WABEXTDISPLAY {
    ULONG cbSize,
    LPWABOBJECT lpWABObject,
    LPADRBOOK lpAdrBook,
    LPMAPIPROP lpPropObj,
    BOOL fReadOnly,
    BOOL fDataChanged,
    WINAPI_WABEXTDISPLAY_Flags ulFlags,
    LPVOID lpv,
    LPTSTR lpsz,
  } WABEXTDISPLAY;

  typedef WABEXTDISPLAY LPWABEXTDISPLAY;
  typedef struct OPTIONDATA {
    ULONG ulFlags,
    LPGUID lpRecipGUID,
    LPTSTR lpszAdrType,
    LPTSTR lpszDLLName,
    ULONG ulOrdinal,
    ULONG cbOptionsData,
    LPBYTE lpbOptionsData,
    ULONG cOptionsProps,
    LPSPropValue lpOptionsProps,
  } OPTIONDATA;

  typedef OPTIONDATA LPOPTIONDATA*;
  typedef struct SBinary {
    ULONG cb,
    LPBYTE lpb,
  } SBinary;

  typedef enum HFRMREG {
    HFRMREG_DEFAULT = 0,
    HFRMREG_LOCAL = 1,
    HFRMREG_PERSONAL = 2,
    HFRMREG_FOLDER = 3,
  } HFRMREG;
  typedef enum BOOKMARK {
    BOOKMARK_BEGINNING = 0,
    BOOKMARK_CURRENT = 1,
    BOOKMARK_END = 2,
  } BOOKMARK;
  typedef struct SBinaryArray {
    ULONG cValues,
    SBinary* lpbin,
  } SBinaryArray;

  typedef SBinaryArray LPENTRYLIST;
  typedef struct MAPIERROR {
    ULONG ulVersion,
    LPTSTR lpszError,
    LPTSTR lpszComponent,
    ULONG ulLowLevelError,
    ULONG ulContext,
  } MAPIERROR;

  typedef MAPIERROR LPMAPIERROR;
  typedef ULONG WINAPI_MapiInitVersion;
  typedef ULONG WINAPI_MapiInitFlags;
  typedef struct MAPIINIT_0 {
    WINAPI_MapiInitVersion ulVersion,
    WINAPI_MapiInitFlags ulFlags,
  } MAPIINIT_0;

  typedef MAPIINIT_0 LPMAPIINIT_0;
]]

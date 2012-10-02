require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID LPDTCTL; //Alias
  typedef LPVOID LPSPropValue; //Alias
  typedef LPVOID LPNOTIFICATION; //Alias
  typedef LPVOID LPSRestriction; //Alias
  typedef ITnef** LPITNEF*; //Alias
  typedef IXPProvider** LPXPPROVIDER*; //Alias
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
  typedef IXPLogon** LPXPLOGON*; //Alias
  typedef IMAPIProp* LPMAPIPROP; //Alias
  typedef IMAPISession* LPMAPISESSION; //Alias
  typedef IABProvider* LPABPROVIDER*; //Alias
  typedef IPropData* LPPROPDATA*; //Alias
  typedef ITableData** LPTABLEDATA*; //Alias
  typedef IStorage* LPSTORAGE*; //Alias
  typedef IMAPIAdviseSink* LPMAPIADVISESINK; //Alias
  typedef IProfAdmin** LPPROFADMIN*; //Alias
  typedef IMAPIFormMgr** LPMAPIFORMMGR*; //Alias
  typedef IMAPIFormContainer** LPMAPIFORMCONTAINER*; //Alias
  typedef IMSProvider** LPMSPROVIDER*; //Alias
  typedef IMessage* LPMESSAGE; //Alias
  typedef LPVOID LPFNABSDI; //Alias
  typedef LPVOID LPFNDISMISS; //Alias
  typedef LPVOID LPFNBUTTON; //Alias
  typedef LPVOID CALLERRELEASE*; //Alias
  typedef LPVOID LPALLOCATEBUFFER; //Alias
  typedef LPVOID FTG; //Alias
  typedef LPVOID LPMSGSESS; //Alias
  typedef IID* LPCIID; //Alias
  typedef LPVOID PFNIDLE; //Alias
  typedef LPVOID LPALLOCATEMORE; //Alias
  typedef LPVOID LPNOTIFCALLBACK; //Alias
  typedef LPVOID LPFREEBUFFER; //Alias
  typedef ULONG *LPULONG; //Pointer
  typedef LPVOID MSGCALLRELEASE*; //Alias
  typedef ULONG ULONG [MAPI_DIM]; //Array 1
  typedef BYTE BYTE [MAPI_DIM]; //Array 1
  typedef LPMAPIFORMINFO LPMAPIFORMINFO [MAPI_DIM]; //Array 1
  typedef LPCSTR LPCSTR [MAPI_DIM]; //Array 1
  typedef GUID MAPIUID; //Alias
  typedef MAPIUID *LPMAPIUID; //Pointer
  typedef ULONG WINAPI_MapiUnicodeFlag; //Alias
  typedef ULONG WINAPI_FlagList_FLAGS; //Alias
  typedef WINAPI_FlagList_FLAGS WINAPI_FlagList_FLAGS [MAPI_DIM]; //Array 1
  typedef struct FlagList {
    ULONG cFlags,
    WINAPI_FlagList_FLAGS [MAPI_DIM] ulFlag,
  } FlagList;
  typedef FlagList *LPFlagList; //Pointer
  typedef BYTE WINAPI_ENTRYID_FLAGS; //Alias
  typedef WINAPI_ENTRYID_FLAGS WINAPI_ENTRYID_FLAGS [4]; //Array 4
  typedef struct ENTRYID {
    WINAPI_ENTRYID_FLAGS [4] abFlags,
    BYTE [MAPI_DIM] ab,
  } ENTRYID;
  typedef ENTRYID *LPENTRYID; //Pointer
  typedef struct SMessageClassArray {
    ULONG cValues,
    LPCSTR [MAPI_DIM] aMessageClass,
  } SMessageClassArray;
  typedef SMessageClassArray *LPSMESSAGECLASSARRAY; //Pointer
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
  typedef MAPINAMEID *LPMAPINAMEID; //Pointer
  typedef struct SMAPIFormPropEnumVal {
    LPTSTR pszDisplayName,
    ULONG nVal,
  } SMAPIFormPropEnumVal;
  typedef SMAPIFormPropEnumVal *LPMAPIFORMPROPENUMVAL; //Pointer
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
  typedef SMAPIFormProp SMAPIFormProp [MAPI_DIM]; //Array 1
  typedef struct SMAPIFormPropArray {
    ULONG cProps,
    ULONG ulPad,
    SMAPIFormProp [MAPI_DIM] aFormProp,
  } SMAPIFormPropArray;
  typedef SMAPIFormPropArray *LPMAPIFORMPROPARRAY; //Pointer
  typedef struct SMAPIFormInfoArray {
    ULONG cForms,
    LPMAPIFORMINFO [MAPI_DIM] aFormInfo,
  } SMAPIFormInfoArray;
  typedef SMAPIFormInfoArray *LPSMAPIFORMINFOARRAY; //Pointer
  typedef struct SMAPIVerb {
    LONG lVerb,
    LPTSTR szVerbname,
    DWORD fuFlags,
    DWORD grfAttribs,
    WINAPI_MapiUnicodeFlag ulFlags,
  } SMAPIVerb;
  typedef SMAPIVerb SMAPIVerb [MAPI_DIM]; //Array 1
  typedef struct SMAPIVerbArray {
    ULONG cMAPIVerb,
    SMAPIVerb [MAPI_DIM] aMAPIVerb,
  } SMAPIVerbArray;
  typedef SMAPIVerbArray *LPMAPIVERBARRAY; //Pointer
  typedef struct NOTIFKEY {
    ULONG cb,
    BYTE [MAPI_DIM] ab,
  } NOTIFKEY;
  typedef NOTIFKEY *LPNOTIFKEY; //Pointer
  typedef struct SPropTagArray {
    ULONG cValues,
    ULONG [MAPI_DIM] aulPropTag,
  } SPropTagArray;
  typedef SPropTagArray *LPSPropTagArray; //Pointer
  typedef struct SRow {
    ULONG ulAdrEntryPad,
    ULONG cValues,
    LPSPropValue lpProps,
  } SRow;
  typedef SRow *LPSRow; //Pointer
  typedef SRow SRow [MAPI_DIM]; //Array 1
  typedef struct SRowSet {
    ULONG cRows,
    SRow [MAPI_DIM] aRow,
  } SRowSet;
  typedef SRowSet *LPSRowSet; //Pointer
  typedef ULONG WINAPI_TABLE_SORT; //Alias
  typedef struct SSortOrder {
    ULONG ulPropTag,
    WINAPI_TABLE_SORT ulOrder,
  } SSortOrder;
  typedef SSortOrder SSortOrder [MAPI_DIM]; //Array 1
  typedef struct SSortOrderSet {
    ULONG cSorts,
    ULONG cCategories,
    ULONG cExpanded,
    SSortOrder [MAPI_DIM] aSort,
  } SSortOrderSet;
  typedef SSortOrderSet *LPSSortOrderSet; //Pointer
  typedef struct ADRENTRY {
    ULONG ulReserved1,
    ULONG cValues,
    LPSPropValue rgPropVals,
  } ADRENTRY;
  typedef ADRENTRY *LPADRENTRY; //Pointer
  typedef ADRENTRY ADRENTRY [MAPI_DIM]; //Array 1
  typedef struct ADRLIST {
    ULONG cEntries,
    ADRENTRY [MAPI_DIM] aEntries,
  } ADRLIST;
  typedef ADRLIST *LPADRLIST; //Pointer
  typedef ULONG WINAPI_PROPATTR_FLAGS; //Alias
  typedef WINAPI_PROPATTR_FLAGS WINAPI_PROPATTR_FLAGS [MAPI_DIM]; //Array 1
  typedef struct SPropAttrArray {
    ULONG cValues,
    WINAPI_PROPATTR_FLAGS [MAPI_DIM] aPropAttr,
  } SPropAttrArray;
  typedef SPropAttrArray *LPSPropAttrArray; //Pointer
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
  typedef DTPAGE *LPDTPAGE; //Pointer
  typedef struct SPropProblem {
    ULONG ulIndex,
    ULONG ulPropTag,
    SCODE scode,
  } SPropProblem;
  typedef SPropProblem SPropProblem [MAPI_DIM]; //Array 1
  typedef struct SPropProblemArray {
    ULONG cProblem,
    SPropProblem [MAPI_DIM] aProblem,
  } SPropProblemArray;
  typedef SPropProblemArray *LPSPropProblemArray*; //Pointer
  typedef struct STnefProblem {
    ULONG ulComponent,
    ULONG ulAttribute,
    ULONG ulPropTag,
    SCODE scode,
  } STnefProblem;
  typedef STnefProblem STnefProblem [MAPI_DIM]; //Array 1
  typedef struct STnefProblemArray {
    ULONG cProblem,
    STnefProblem [MAPI_DIM] aProblem,
  } STnefProblemArray;
  typedef STnefProblemArray *LPSTnefProblemArray*; //Pointer
  typedef UINT METHODS; //Alias
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
  typedef ULONG FLAGS; //Alias
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
  typedef ULONG WINAPI_ADRPARM_Flags; //Alias
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
  typedef ADRPARM *LPADRPARM; //Pointer
  typedef struct FORMPRINTSETUP {
    WINAPI_MapiUnicodeFlag ulFlags,
    HGLOBAL hDevMode,
    HGLOBAL hDevNames,
    ULONG ulFirstPageNumber,
    ULONG fPrintAttachments,
  } FORMPRINTSETUP;
  typedef FORMPRINTSETUP *LPFORMPRINTSETUP; //Pointer
  typedef ULONG WINAPI_WABEXTDISPLAY_Flags; //Alias
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
  typedef WABEXTDISPLAY *LPWABEXTDISPLAY; //Pointer
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
  typedef OPTIONDATA *LPOPTIONDATA*; //Pointer
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
  typedef SBinaryArray *LPENTRYLIST; //Pointer
  typedef struct MAPIERROR {
    ULONG ulVersion,
    LPTSTR lpszError,
    LPTSTR lpszComponent,
    ULONG ulLowLevelError,
    ULONG ulContext,
  } MAPIERROR;
  typedef MAPIERROR *LPMAPIERROR; //Pointer
  typedef ULONG WINAPI_MapiInitVersion; //Alias
  typedef ULONG WINAPI_MapiInitFlags; //Alias
  typedef struct MAPIINIT_0 {
    WINAPI_MapiInitVersion ulVersion,
    WINAPI_MapiInitFlags ulFlags,
  } MAPIINIT_0;
  typedef MAPIINIT_0 *LPMAPIINIT_0; //Pointer
]]

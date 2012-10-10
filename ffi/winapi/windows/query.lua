require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* ICommand; //Interface
  typedef WORD DBCOMMANDOP; //Alias
  typedef DWORD DBKIND; //Alias
  static const DBKIND DBKIND_GUID_NAME = 0;
  static const DBKIND DBKIND_GUID_PROPID = 1;
  static const DBKIND DBKIND_NAME = 2;
  static const DBKIND DBKIND_PGUID_NAME = 3;
  static const DBKIND DBKIND_PGUID_PROPID = 4;
  static const DBKIND DBKIND_PROPID = 5;
  static const DBKIND DBKIND_GUID = 6;
  typedef union DBID_u1 {
    GUID guid;
    GUID* pguid;
  } DBID_u1;
  typedef union DBID_u2 {
    LPOLESTR pwszName;
    ULONG ulPropid;
  } DBID_u2;
  typedef struct DBID {
    DBID_u1 uGuid;
    DBKIND eKind;
    DBID_u2 uName;
  } DBID;
  typedef struct CIPROPERTYDEF {
    LPWSTR wcsFriendlyName;
    DWORD dbType;
    DBID dbCol;
  } CIPROPERTYDEF;
# pragma pack( push, 4 )
  typedef struct CI_STATE {
    DWORD cbStruct;
    DWORD cWordList;
    DWORD cPersistentIndex;
    DWORD cQueries;
    DWORD cDocuments;
    DWORD cFreshTest;
    DWORD dwMergeProgress;
    DWORD eState;
    DWORD cFilteredDocuments;
    DWORD cTotalDocuments;
    DWORD cPendingScans;
    DWORD dwIndexSize;
    DWORD cUniqueKeys;
    DWORD cSecQDocuments;
    DWORD dwPropCacheSize;
  } CI_STATE;
# pragma pack( pop )
  STDAPI CIState(                 WCHAR* pwcsCat, WCHAR* pwcsMachine, CI_STATE* pCiState);
  STDAPI LocateCatalogs(          TCHAR* pwszScope, ULONG iBmk, TCHAR* pwszMachine, ULONG* pcMachine, TCHAR* pwszCat, ULONG* pcCat);
  STDAPI SetCatalogState(         WCHAR* pwcsCat, WCHAR* pwcsMachine, DWORD dwNewState, DWORD* pdwOldState);
  STDAPI CICreateCommand(         IUnknown** ppICommand, IUnknown* pUnkOuter, REFIID riid, WCHAR* pwcsCatalog, WCHAR* pwcsMachine);
  STDAPI CIMakeICommand(          ICommand** ppCommand, ULONG cScope, DWORD* aDepths, WCHAR** awcsScope, WCHAR** awcsCatalogs, WCHAR** awcsMachine);
  STDAPI CIBuildQueryNode(        WCHAR* wcsProperty, DBCOMMANDOP dbOperator, PROPVARIANT* pvarPropertyValue, DBCOMMANDTREE** ppTree, ULONG cProperties, CIPROPERTYDEF* pProperty, LCID LocaleID);
  STDAPI CIBuildQueryTree(        DBCOMMANDTREE* pExistingTree, ULONG cSiblings, DBCOMMANDTREE** ppSibsToCombine, DBCOMMANDTREE** ppTree);
  STDAPI CIRestrictionToFullTree( DBCOMMANDTREE* pTree, WCHAR* pwszColumns, WCHAR* pwszSortColumns, WCHAR* pwszGroupings, DBCOMMANDTREE** ppTree, ULONG cProperties, CIPROPERTYDEF* pProperties, LCID LocaleID);
  STDAPI CITextToFullTree(        WCHAR* pwszRestriction, WCHAR* pwszColumns, WCHAR* pwszSortColumns, WCHAR* pwszGroupings, DBCOMMANDTREE** ppTree, ULONG cProperties, CIPROPERTYDEF* pProperties, LCID LocaleID);
  STDAPI CITextToFullTreeEx(      WCHAR* pwszRestriction, ULONG ulDialect, WCHAR* pwszColumns, WCHAR* pwszSortColumns, WCHAR* pwszGroupings, DBCOMMANDTREE** ppTree, ULONG cProperties, CIPROPERTYDEF* pProperties, LCID LocaleID);
  STDAPI CITextToSelectTree(      WCHAR* pwszRestriction, DBCOMMANDTREE** ppTree, ULONG cProperties, CIPROPERTYDEF* pProperties, LCID LocaleID);
  STDAPI CITextToSelectTreeEx(    WCHAR* pwszRestriction, ULONG ulDialect, DBCOMMANDTREE** ppTree, ULONG cProperties, CIPROPERTYDEF* pProperties, LCID LocaleID);
  STDAPI LoadIFilter(             WCHAR* pwcsPath, IUnknown* pUnkOuter, void** ppIUnk);
  STDAPI BindIFilterFromStorage(  IStorage* pStg, IUnknown* pUnkOuter, void** ppIUnk);
  STDAPI BindIFilterFromStream(   IStream* pStm, IUnknown* pUnkOuter, void** ppIUnk);
]]
ffi.load( 'query.dll' )

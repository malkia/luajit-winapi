require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* ICommand; //Interface
  typedef WORD DBCOMMANDOP; //Alias
  typedef DWORD DBKIND; //Alias
  static const DWORD DBKIND_GUID_NAME = 0;
  static const DWORD DBKIND_GUID_PROPID = 1;
  static const DWORD DBKIND_NAME = 2;
  static const DWORD DBKIND_PGUID_NAME = 3;
  static const DWORD DBKIND_PGUID_PROPID = 4;
  static const DWORD DBKIND_PROPID = 5;
  static const DWORD DBKIND_GUID = 6;
  typedef union WINAPI_DBID_u1 {
    GUID guid;
    GUID* pguid;
  } WINAPI_DBID_u1;
  typedef union WINAPI_DBID_u2 {
    LPOLESTR pwszName;
    ULONG ulPropid;
  } WINAPI_DBID_u2;
  typedef struct DBID {
    WINAPI_DBID_u1 uGuid;
    DBKIND eKind;
    WINAPI_DBID_u2 uName;
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
  STDAPI CIState(                 WCHAR const* pwcsCat, WCHAR const* pwcsMachine, CI_STATE* pCiState);
  STDAPI LocateCatalogs(          TCHAR const* pwszScope, ULONG iBmk, TCHAR* pwszMachine, ULONG* pcMachine, TCHAR* pwszCat, ULONG* pcCat);
  STDAPI SetCatalogState(         WCHAR const* pwcsCat, WCHAR const* pwcsMachine, DWORD dwNewState, DWORD* pdwOldState);
  STDAPI CICreateCommand(         IUnknown** ppICommand, IUnknown* pUnkOuter, REFIID riid, WCHAR const* pwcsCatalog, WCHAR const* pwcsMachine);
  STDAPI CIMakeICommand(          ICommand** ppCommand, ULONG cScope, DWORD const* aDepths, WCHAR const* const* awcsScope, WCHAR const* const* awcsCatalogs, WCHAR const* const* awcsMachine);
  STDAPI CIBuildQueryNode(        WCHAR const* wcsProperty, DBCOMMANDOP dbOperator, PROPVARIANT const* pvarPropertyValue, DBCOMMANDTREE** ppTree, ULONG cProperties, CIPROPERTYDEF const* pProperty, LCID LocaleID);
  STDAPI CIBuildQueryTree(        DBCOMMANDTREE const* pExistingTree, ULONG cSiblings, DBCOMMANDTREE const* const* ppSibsToCombine, DBCOMMANDTREE** ppTree);
  STDAPI CIRestrictionToFullTree( DBCOMMANDTREE const* pTree, WCHAR const* pwszColumns, WCHAR const* pwszSortColumns, WCHAR const* pwszGroupings, DBCOMMANDTREE** ppTree, ULONG cProperties, CIPROPERTYDEF* pProperties, LCID LocaleID);
  STDAPI CITextToFullTree(        WCHAR const* pwszRestriction, WCHAR const* pwszColumns, WCHAR const* pwszSortColumns, WCHAR const* pwszGroupings, DBCOMMANDTREE** ppTree, ULONG cProperties, CIPROPERTYDEF* pProperties, LCID LocaleID);
  STDAPI CITextToFullTreeEx(      WCHAR const* pwszRestriction, ULONG ulDialect, WCHAR const* pwszColumns, WCHAR const* pwszSortColumns, WCHAR const* pwszGroupings, DBCOMMANDTREE** ppTree, ULONG cProperties, CIPROPERTYDEF* pProperties, LCID LocaleID);
  STDAPI CITextToSelectTree(      WCHAR const* pwszRestriction, DBCOMMANDTREE** ppTree, ULONG cProperties, CIPROPERTYDEF* pProperties, LCID LocaleID);
  STDAPI CITextToSelectTreeEx(    WCHAR const* pwszRestriction, ULONG ulDialect, DBCOMMANDTREE** ppTree, ULONG cProperties, CIPROPERTYDEF* pProperties, LCID LocaleID);
  STDAPI LoadIFilter(             WCHAR const* pwcsPath, IUnknown* pUnkOuter, void** ppIUnk);
  STDAPI BindIFilterFromStorage(  IStorage* pStg, IUnknown* pUnkOuter, void** ppIUnk);
  STDAPI BindIFilterFromStream(   IStream* pStm, IUnknown* pUnkOuter, void** ppIUnk);
]]
return ffi.load( 'query.dll' )

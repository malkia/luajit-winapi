require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
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

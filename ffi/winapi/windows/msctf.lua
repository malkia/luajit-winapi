require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/ole" )
local ffi = require( "ffi" )
ffi.cdef [[
  HRESULT SetInputScope(                      HWND hwnd, InputScope inputscope);
  HRESULT SetInputScopes(                     HWND hwnd, InputScope* pInputScopes, UINT cInputScopes, WCHAR** ppszPhraseList, UINT cPhrases, WCHAR* pszRegExp, WCHAR* pszSRGS);
  HRESULT SetInputScopes2(                    HWND hwnd, InputScope* pInputScopes, UINT cInputScopes, IEnumString* pEnumString, WCHAR* pszRegExp, WCHAR* pszSRGS);
  void    SetInputScopeXML(                   );
  HRESULT TF_CreateCategoryMgr(               ITfCategoryMgr** ppcat);
  HRESULT TF_CreateDisplayAttributeMgr(       ITfDisplayAttributeMgr** ppdam);
  HRESULT TF_CreateInputProcessorProfiles(    ITfInputProcessorProfiles** ppipr);
  HRESULT TF_CreateLangBarItemMgr(            ITfLangBarItemMgr** pplbim);
  HRESULT TF_CreateLangBarMgr(                ITfLangBarMgr** pppbm);
  HRESULT TF_CreateThreadMgr(                 ITfThreadMgr** pptim);
  HRESULT TF_GetThreadMgr(                    ITfThreadMgr** pptim);
  HRESULT TF_InvalidAssemblyListCacheIfExist( );
  BOOL    MsimtfIsWindowFiltered(             HWND hwnd);
]]
return ffi.load( "msctf.dll" )

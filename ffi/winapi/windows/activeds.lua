require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IADsContainer; //Interface
  typedef void* IEnumVARIANT; //Interface
  HRESULT ADsBuildEnumerator(  IADsContainer* pADsContainer, IEnumVARIANT** ppEnumVariant);
  HRESULT ADsBuildVarArrayInt( LPDWORD lpdwObjectTypes, DWORD dwObjectTypes, VARIANT* pVar);
  HRESULT ADsBuildVarArrayStr( LPWSTR* lppPathNames, DWORD dwPathNames, VARIANT* pVar);
  HRESULT ADsEncodeBinaryData( PBYTE pbSrcData, DWORD dwSrcLen, LPWSTR* ppszDestData);
  HRESULT ADsEnumerateNext(    IEnumVARIANT* pEnumVariant, ULONG cElements, VARIANT* pvar, ULONG* pcElementsFetched);
  HRESULT ADsFreeEnumerator(   IEnumVARIANT* pEnumVariant);
  HRESULT ADsGetLastError(     LPDWORD lpError, LPWSTR lpErrorBuf, DWORD dwErrorBufLen, LPWSTR lpNameBuf, DWORD dwNameBufLen);
  HRESULT ADsGetObject(        LPWSTR lpszPathName, REFIID riid, VOID** ppObject);
  HRESULT ADsOpenObject(       LPWSTR lpszPathName, LPWSTR lpszUserName, LPWSTR lpszPassword, DWORD dwReserved, REFIID riid, VOID** ppObject);
  VOID    ADsSetLastError(     DWORD dwErr, LPWSTR pszError, LPWSTR pszProvider);
  LPVOID  AllocADsMem(         DWORD cb);
  LPWSTR  AllocADsStr(         LPWSTR pStr);
  BOOL    FreeADsMem(          LPVOID pMem);
  BOOL    FreeADsStr(          LPWSTR pStr);
  LPVOID  ReallocADsMem(       LPVOID pOldMem, DWORD cbOld, DWORD cbNew);
  BOOL    ReallocADsStr(       LPWSTR* ppStr, LPWSTR pStr);
]]
ffi.load( 'Activeds.dll' )

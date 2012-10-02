require( 'ffi/winapi/headers/ddraw' )
local ffi = require( 'ffi' )
ffi.cdef [[
  WINAPI_DD_HRESULT DirectDrawCreate(        GUID* lpGUID, LPDIRECTDRAW* lplpDD, IUnknown* pUnkOuter);
  WINAPI_DD_HRESULT DirectDrawCreateClipper( DWORD dwFlags, LPDIRECTDRAWCLIPPER* lplpDDClipper, IUnknown* pUnkOuter);
  WINAPI_DD_HRESULT DirectDrawCreateEx(      GUID* lpGUID, LPVOID* lplpDD, REFIID iid, IUnknown* pUnkOuter);
  WINAPI_DD_HRESULT DirectDrawEnumerate(     LPDDENUMCALLBACK lpCallback, LPVOID lpContext);
  WINAPI_DD_HRESULT DirectDrawEnumerateEx(   LPDDENUMCALLBACKEX lpCallback, LPVOID lpContext, WINAPI_DDENUM_FLAGS dwFlags);
]]
return ffi.load( 'ddraw.dll' )

require( 'ffi/winapi/headers/ddraw' )
local ffi = require( 'ffi' )
ffi.cdef [[
  DD_HRESULT DirectDrawCreate(        GUID* lpGUID, LPDIRECTDRAW* lplpDD, IUnknown* pUnkOuter);
  DD_HRESULT DirectDrawCreateClipper( DWORD dwFlags, LPDIRECTDRAWCLIPPER* lplpDDClipper, IUnknown* pUnkOuter);
  DD_HRESULT DirectDrawCreateEx(      GUID* lpGUID, LPVOID* lplpDD, REFIID iid, IUnknown* pUnkOuter);
  DD_HRESULT DirectDrawEnumerate(     LPDDENUMCALLBACK lpCallback, LPVOID lpContext);
  DD_HRESULT DirectDrawEnumerateEx(   LPDDENUMCALLBACKEX lpCallback, LPVOID lpContext, DDENUM_FLAGS dwFlags);
]]
ffi.load( 'ddraw.dll' )

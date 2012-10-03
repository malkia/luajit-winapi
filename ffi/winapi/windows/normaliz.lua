require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID NORM_FORM; //Alias
  typedef DWORD WINAPI_IdnFlags; //Alias
  int  IdnToAscii(           WINAPI_IdnFlags dwFlags, LPCWSTR lpUnicodeCharStr, int cchUnicodeChar, LPWSTR lpASCIICharStr, int cchASCIIChar);
  int  IdnToNameprepUnicode( WINAPI_IdnFlags dwFlags, LPCWSTR lpUnicodeCharStr, int cchUnicodeChar, LPWSTR lpNameprepCharStr, int cchNameprepChar);
  int  IdnToUnicode(         WINAPI_IdnFlags dwFlags, LPCWSTR lpASCIICharStr, int cchASCIIChar, LPWSTR lpUnicodeCharStr, int cchUnicodeChar);
  BOOL IsNormalizedString(   NORM_FORM NormForm, LPCWSTR lpString, int cwLength);
  int  NormalizeString(      NORM_FORM NormForm, LPCWSTR lpSrcString, int cwSrcLength, LPWSTR lpDstString, int cwDstLength);
]]
return ffi.load( 'Normaliz.dll' )

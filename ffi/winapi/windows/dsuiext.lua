require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/gdi' )
require( 'ffi/winapi/headers/shell' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef struct DSBROWSEINFO {
    DWORD cbStruct;
    HWND hwndOwner;
    LPCTSTR pszCaption;
    LPCTSTR pszTitle;
    LPCWSTR pszRoot;
    LPWSTR pszPath;
    ULONG cchPath;
    DWORD dwFlags;
    BFFCALLBACK pfnCallback;
    LPARAM lParam;
    DWORD dwReturnFormat;
    LPCWSTR pUserName;
    LPCWSTR pPassword;
    LPWSTR pszObjectClass;
    ULONG cchObjectClass;
  } DSBROWSEINFO;
  typedef DSBROWSEINFO *PDSBROWSEINFO; //Pointer
  int     DsBrowseForContainer(   PDSBROWSEINFO pInfo);
  HRESULT DsGetFriendlyClassName( LPWSTR pszObjectClass, LPWSTR pszBuffer, INT cchBuffer);
  HICON   DsGetIcon(              DWORD dwFlags, LPWSTR pszObjectClass, INT cxImage, INT cyImage);
]]
return ffi.load( 'Dsuiext.dll' )

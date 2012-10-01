require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  BOOL    InetIsOffline(         DWORD dwFlags);
  HRESULT MIMEAssociationDialog( HWND hwndParent, DWORD dwInFlags, LPCTSTR pcszFile, LPCTSTR pcszMIMEContentType, LPTSTR pszAppBuf, UINT ucAppBufLen);
  HRESULT TranslateURL(          LPCSTR pcszURL, DWORD dwInFlags, LPSTR* ppszTranslatedURL);
  HRESULT URLAssociationDialog(  HWND hwndParent, DWORD dwInFlags, LPCTSTR pcszFile, LPCTSTR pcszURL, LPTSTR pszAppBuf, UINT ucAppBufLen);
]]
return ffi.load( "url.dll" )

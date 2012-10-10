require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HRESULT RatingAccessDeniedDialog(  HWND hDlg, LPCTSTR pszUsername, LPCTSTR pszContentDescription, VOID* pRatingDetails);
  HRESULT RatingAccessDeniedDialog2( HWND hDlg, LPCSTR pszUsername, VOID* pRatingDetails);
  HRESULT RatingCheckUserAccess(     LPCTSTR pszUsername, LPCTSTR pszURL, LPCTSTR pszRatingInfo, LPBYTE pData, DWORD cbData, VOID** ppRatingDetails);
  HRESULT RatingEnable(              HWND hwndParent, LPCSTR pszUsername, BOOL fEnable);
  HRESULT RatingEnabledQuery(        );
  HRESULT RatingFreeDetails(         VOID* pRatingDetails);
  HRESULT RatingObtainCancel(        HANDLE hRatingObtainQuery);
  HRESULT RatingObtainQuery(         LPCTSTR pszTargetUrl, DWORD dwUserData, DWORD dwUserData, HRESULT hr, LPCTSTR pszRating, HANDLE* phRatingObtainQuery);
  HRESULT RatingSetupUI(             HWND hDlg, LPCSTR pszUsername);
]]
ffi.load( 'msrating.dll' )

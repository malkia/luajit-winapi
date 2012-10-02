require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
require( 'ffi/winapi/headers/gdi' )
local ffi = require( 'ffi' )
ffi.cdef [[
  STDAPI  AccessibleChildren(         IAccessible* paccContainer, LONG iChildStart, LONG cChildren, VARIANT* rgvarChildren, LONG* pcObtained);
  STDAPI  AccessibleObjectFromEvent(  HWND hwnd, DWORD dwObjectID, DWORD dwChildID, IAccessible** ppacc, VARIANT* pvarChild);
  STDAPI  AccessibleObjectFromPoint(  POINT ptScreen, IAccessible** ppacc, VARIANT* pvarChild);
  STDAPI  AccessibleObjectFromWindow( HWND hwnd, DWORD dwObjectID, REFIID riid, void** ppvObject);
  void    GetOleaccVersionInfo(       DWORD* pdwVer, DWORD* pdwBuild);
  HANDLE  GetProcessHandleFromHwnd(   HWND hwnd);
  UINT    GetRoleText(                DWORD dwRole, LPTSTR lpszRole, UINT cchRoleMax);
  UINT    GetStateText(               DWORD dwStateBit, LPTSTR lpszStateBit, UINT cchStateBitMax);
  STDAPI  WindowFromAccessibleObject( IAccessible* pacc, HWND* phwnd);
  STDAPI  CreateStdAccessibleObject(  HWND hwnd, LONG idObject, REFIID riidInterface, void** ppvObject);
  STDAPI  CreateStdAccessibleProxy(   HWND hwnd, LPCTSTR pszClassName, LONG idObject, REFIID riidInterface, void** ppvObject);
  LRESULT LresultFromObject(          REFIID riid, WPARAM wParam, LPUNKNOWN pAcc);
  STDAPI  ObjectFromLresult(          LRESULT lResult, REFIID riid, WPARAM wParam, void** ppvObject);
]]
return ffi.load( 'Oleacc.dll' )

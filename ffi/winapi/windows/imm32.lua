require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/gdi" )
local ffi = require( "ffi" )
ffi.cdef [[
  HIMC    ImmAssociateContext(        HWND hWnd, HIMC hIMC);
  BOOL    ImmAssociateContextEx(      HWND hWnd, HIMC hIMC, DWORD dwFlags);
  BOOL    ImmConfigureIME(            HKL hKL, HWND hWnd, DWORD dwMode, LPVOID lpData);
  HIMC    ImmCreateContext(           );
  BOOL    ImmDestroyContext(          HIMC hIMC);
  BOOL    ImmDisableIME(              DWORD idThread);
  BOOL    ImmDisableTextFrameService( DWORD idThread);
  BOOL    ImmEnumInputContext(        DWORD idThread, IMCENUMPROC lpfn, LPARAM lParam);
  UINT    ImmEnumRegisterWord(        HKL hKL, REGISTERWORDENUMPROC lpfnEnumProc, LPCTSTR lpszReading, DWORD dwStyle, LPCTSTR lpszRegister, LPVOID lpData);
  LRESULT ImmEscape(                  HKL hKL, HIMC hIMC, UINT uEscape, LPVOID lpData);
  DWORD   ImmGetCandidateList(        HIMC hIMC, DWORD dwIndex, LPCANDIDATELIST lpCandList, DWORD dwBufLen);
  DWORD   ImmGetCandidateListCount(   HIMC hIMC, LPDWORD lpdwListCount);
  BOOL    ImmGetCandidateWindow(      HIMC hIMC, DWORD dwIndex, LPCANDIDATEFORM lpCandidate);
  BOOL    ImmGetCompositionFont(      HIMC hIMC, LPLOGFONT lplf);
  LONG    ImmGetCompositionString(    HIMC hIMC, DWORD dwIndex, LPVOID lpBuf, DWORD dwBufLen);
  BOOL    ImmGetCompositionWindow(    HIMC hIMC, LPCOMPOSITIONFORM lpCompForm);
  HIMC    ImmGetContext(              HWND hWnd);
  DWORD   ImmGetConversionList(       HKL hKL, HIMC hIMC, LPCTSTR lpSrc, LPCANDIDATELIST lpDst, DWORD dwBufLen, UINT uFlag);
  BOOL    ImmGetConversionStatus(     HIMC hIMC, LPDWORD lpfdwConversion, LPDWORD lpfdwSentence);
  HWND    ImmGetDefaultIMEWnd(        HWND hWnd);
  UINT    ImmGetDescription(          HKL hKL, LPTSTR lpszDescription, UINT uBufLen);
  DWORD   ImmGetGuideLine(            HIMC hIMC, DWORD dwIndex, LPTSTR lpBuf, DWORD dwBufLen);
  UINT    ImmGetIMEFileName(          HKL hKL, LPTSTR lpszFileName, UINT uBufLen);
  DWORD   ImmGetImeMenuItems(         HIMC hIMC, DWORD dwFlags, DWORD dwType, LPIMEMENUITEMINFO lpImeParentMenu, LPIMEMENUITEMINFO lpImeMenu, DWORD dwSize);
  BOOL    ImmGetOpenStatus(           HIMC hIMC);
  DWORD   ImmGetProperty(             HKL hKL, WINAPI_ImmGetPropertyIndex fdwIndex);
  UINT    ImmGetRegisterWordStyle(    HKL hKL, UINT nItem, LPSTYLEBUF lpStyleBuf);
  BOOL    ImmGetStatusWindowPos(      HIMC hIMC, LPPOINT lpptPos);
  UINT    ImmGetVirtualKey(           HWND hWnd);
  HKL     ImmInstallIME(              LPCTSTR lpszIMEFileName, LPCTSTR lpszLayoutText);
  BOOL    ImmIsIME(                   HKL hKL);
  BOOL    ImmIsUIMessage(             HWND hWndIME, UINT msg, WPARAM wParam, LPARAM lParam);
  BOOL    ImmNotifyIME(               HIMC hIMC, WINAPI_ImmNotifyAction dwAction, WINAPI_CompositionString dwIndex, DWORD dwValue);
  BOOL    ImmRegisterWord(            HKL hKL, LPCTSTR lpszReading, DWORD dwStyle, LPCTSTR lpszRegister);
  BOOL    ImmReleaseContext(          HWND hWnd, HIMC hIMC);
  LRESULT ImmRequestMessage(          HIMC hIMC, WPARAM wParam, LPARAM lParam);
  BOOL    ImmSetCandidateWindow(      HIMC hIMC, LPCANDIDATEFORM lpCandidate);
  BOOL    ImmSetCompositionFont(      HIMC hIMC, LPLOGFONT lplf);
  BOOL    ImmSetCompositionString(    HIMC hIMC, DWORD dwIndex, LPVOID lpComp, DWORD dwCompLen, LPVOID lpRead, DWORD dwReadLen);
  BOOL    ImmSetCompositionWindow(    HIMC hIMC, LPCOMPOSITIONFORM lpCompForm);
  BOOL    ImmSetConversionStatus(     HIMC hIMC, DWORD fdwConversion, DWORD fdwSentence);
  BOOL    ImmSetOpenStatus(           HIMC hIMC, BOOL fOpen);
  BOOL    ImmSetStatusWindowPos(      HIMC hIMC, LPPOINT lpptPos);
  BOOL    ImmSimulateHotKey(          HWND hWnd, DWORD dwHotKeyID);
  BOOL    ImmUnregisterWord(          HKL hKL, LPCTSTR lpszReading, DWORD dwStyle, LPCTSTR lpszUnregister);
]]
return ffi.load( "Imm32.dll" )

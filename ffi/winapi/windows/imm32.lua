require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/gdi' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef HANDLE HIMC; //Alias
  typedef LPVOID IMCENUMPROC; //Alias
  typedef LPVOID REGISTERWORDENUMPROC; //Alias
  enum { IMEMENUITEM_STRING_SIZE = 80 };
  enum { STYLE_DESCRIPTION_SIZE = 32 };
  typedef struct STYLEBUF {
    DWORD dwStyle;
    TCHAR szDescription[STYLE_DESCRIPTION_SIZE];
  } STYLEBUF;
  typedef STYLEBUF *LPSTYLEBUF; //Pointer
  typedef UINT IMFT; //Alias
  typedef UINT IMFS; //Alias
  typedef struct IMEMENUITEMINFO {
    UINT cbSize;
    IMFT fType;
    IMFS fState;
    UINT wID;
    HBITMAP hbmpChecked;
    HBITMAP hbmpUnchecked;
    DWORD dwItemData;
    TCHAR szString[IMEMENUITEM_STRING_SIZE];
    HBITMAP hbmpItem;
  } IMEMENUITEMINFO;
  typedef IMEMENUITEMINFO *LPIMEMENUITEMINFO; //Pointer
  typedef DWORD IME_CAND; //Alias
  static const IME_CAND IME_CAND_UNKNOWN = 0x0000;
  static const IME_CAND IME_CAND_READ = 0x0001;
  static const IME_CAND IME_CAND_CODE = 0x0002;
  static const IME_CAND IME_CAND_MEANING = 0x0003;
  static const IME_CAND IME_CAND_RADICAL = 0x0004;
  static const IME_CAND IME_CAND_STROKE = 0x0005;
  typedef struct CANDIDATELIST {
    DWORD dwSize;
    IME_CAND dwStyle;
    DWORD dwCount;
    DWORD dwSelection;
    DWORD dwPageStart;
    DWORD dwPageSize;
    DWORD dwOffset[1];
  } CANDIDATELIST;
  typedef CANDIDATELIST *LPCANDIDATELIST; //Pointer
  typedef struct CANDIDATEFORM {
    DWORD dwIndex;
    DWORD dwStyle;
    POINT ptCurrentPos;
    RECT rcArea;
  } CANDIDATEFORM;
  typedef CANDIDATEFORM *LPCANDIDATEFORM; //Pointer
  typedef struct COMPOSITIONFORM {
    DWORD dwStyle;
    POINT ptCurrentPos;
    RECT rcArea;
  } COMPOSITIONFORM;
  typedef COMPOSITIONFORM *LPCOMPOSITIONFORM; //Pointer
  typedef DWORD ImmNotifyAction; //Alias
  static const ImmNotifyAction NI_OPENCANDIDATE = 0x0010;
  static const ImmNotifyAction NI_CLOSECANDIDATE = 0x0011;
  static const ImmNotifyAction NI_SELECTCANDIDATESTR = 0x0012;
  static const ImmNotifyAction NI_CHANGECANDIDATELIST = 0x0013;
  static const ImmNotifyAction NI_FINALIZECONVERSIONRESULT = 0x0014;
  static const ImmNotifyAction NI_COMPOSITIONSTR = 0x0015;
  static const ImmNotifyAction NI_SETCANDIDATE_PAGESTART = 0x0016;
  static const ImmNotifyAction NI_SETCANDIDATE_PAGESIZE = 0x0017;
  static const ImmNotifyAction NI_IMEMENUSELECTED = 0x0018;
  typedef DWORD CompositionString; //Alias
  static const CompositionString CPS_COMPLETE = 0x0001;
  static const CompositionString CPS_CONVERT = 0x0002;
  static const CompositionString CPS_REVERT = 0x0003;
  static const CompositionString CPS_CANCEL = 0x0004;
  typedef DWORD ImmGetPropertyIndex; //Alias
  static const ImmGetPropertyIndex IGP_GETIMEVERSION = -4;
  static const ImmGetPropertyIndex IGP_PROPERTY = 0x00000004;
  static const ImmGetPropertyIndex IGP_CONVERSION = 0x00000008;
  static const ImmGetPropertyIndex IGP_SENTENCE = 0x0000000c;
  static const ImmGetPropertyIndex IGP_UI = 0x00000010;
  static const ImmGetPropertyIndex IGP_SETCOMPSTR = 0x00000014;
  static const ImmGetPropertyIndex IGP_SELECT = 0x00000018;
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
  DWORD   ImmGetProperty(             HKL hKL, ImmGetPropertyIndex fdwIndex);
  UINT    ImmGetRegisterWordStyle(    HKL hKL, UINT nItem, LPSTYLEBUF lpStyleBuf);
  BOOL    ImmGetStatusWindowPos(      HIMC hIMC, LPPOINT lpptPos);
  UINT    ImmGetVirtualKey(           HWND hWnd);
  HKL     ImmInstallIME(              LPCTSTR lpszIMEFileName, LPCTSTR lpszLayoutText);
  BOOL    ImmIsIME(                   HKL hKL);
  BOOL    ImmIsUIMessage(             HWND hWndIME, UINT msg, WPARAM wParam, LPARAM lParam);
  BOOL    ImmNotifyIME(               HIMC hIMC, ImmNotifyAction dwAction, CompositionString dwIndex, DWORD dwValue);
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
ffi.load( 'Imm32.dll' )

require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID LPOCNCHKPROC; //Alias
  typedef LPVOID LPOCNCONNPROC; //Alias
  typedef LPVOID LPOCNDSCPROC; //Alias
  typedef DWORD SC_DLG_FLAGS; //Alias
  typedef struct OPENCARDNAME {
    DWORD dwStructSize;
    HWND hwndOwner;
    SCARDCONTEXT hSCardContext;
    LPTSTR lpstrGroupNames;
    DWORD nMaxGroupNames;
    LPTSTR lpstrCardNames;
    DWORD nMaxCardNames;
    LPCGUID rgguidInterfaces;
    DWORD cguidInterfaces;
    LPTSTR lpstrRdr;
    DWORD nMaxRdr;
    LPTSTR lpstrCard;
    DWORD nMaxCard;
    LPCTSTR lpstrTitle;
    SC_DLG_FLAGS dwFlags;
    LPVOID pvUserData;
    DWORD dwShareMode;
    DWORD dwPreferredProtocols;
    DWORD dwActiveProtocol;
    LPOCNCONNPROC lpfnConnect;
    LPOCNCHKPROC lpfnCheck;
    LPOCNDSCPROC lpfnDisconnect;
    SCARDHANDLE hCardHandle;
  } OPENCARDNAME;
  typedef OPENCARDNAME *LPOPENCARDNAME; //Pointer
  typedef struct OPENCARD_SEARCH_CRITERIA {
    DWORD dwStructSize;
    LPTSTR lpstrGroupNames;
    DWORD nMaxGroupNames;
    LPCGUID rgguidInterfaces;
    DWORD cguidInterfaces;
    LPTSTR lpstrCardNames;
    DWORD nMaxCardNames;
    LPOCNCHKPROC lpfnCheck;
    LPOCNCONNPROC lpfnConnect;
    LPOCNDSCPROC lpfnDisconnect;
    LPVOID pvUserData;
    DWORD dwShareMode;
    DWORD dwPreferredProtocols;
  } OPENCARD_SEARCH_CRITERIA;
  typedef OPENCARD_SEARCH_CRITERIA *POPENCARD_SEARCH_CRITERIA; //Pointer
  typedef struct OPENCARDNAME_EX {
    DWORD dwStructSize;
    SCARDCONTEXT hSCardContext;
    HWND hwndOwner;
    SC_DLG_FLAGS dwFlags;
    LPCTSTR lpstrTitle;
    LPCTSTR lpstrSearchDesc;
    HICON hIcon;
    POPENCARD_SEARCH_CRITERIA pOpenCardSearchCriteria;
    LPOCNCONNPROC lpfnConnect;
    LPVOID pvUserData;
    DWORD dwShareMode;
    DWORD dwPreferredProtocols;
    LPTSTR lpstrRdr;
    DWORD nMaxRdr;
    LPTSTR lpstrCard;
    DWORD nMaxCard;
    DWORD dwActiveProtocol;
    SCARDHANDLE hCardHandle;
  } OPENCARDNAME_EX;
  typedef OPENCARDNAME_EX *LPOPENCARDNAME_EX; //Pointer
  LONG GetOpenCardName(      LPOPENCARDNAME pDlgStruc);
  LONG SCardUIDlgSelectCard( LPOPENCARDNAME_EX pDlgStruc);
]]
ffi.load( 'Scarddlg.dll' )

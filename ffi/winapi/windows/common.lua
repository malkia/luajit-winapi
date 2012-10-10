require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IOrpcDebugNotify; //Interface
  typedef DWORD DLLMAIN_REASON; //Alias
  static const DLLMAIN_REASON DLL_PROCESS_ATTACH = 1;
  static const DLLMAIN_REASON DLL_THREAD_ATTACH = 2;
  static const DLLMAIN_REASON DLL_THREAD_DETACH = 3;
  static const DLLMAIN_REASON DLL_PROCESS_DETACH = 0;
  typedef struct ORPC_INIT_ARGS {
    IOrpcDebugNotify* lpIntfOrpcDebug;
    void* pvPSN;
    DWORD* dwReserved1;
    DWORD* dwReserved2;
  } ORPC_INIT_ARGS;
  typedef ORPC_INIT_ARGS *LPORPC_INIT_ARGS; //Pointer
  typedef DWORD DLLVER_PLATFORM; //Alias
  static const DLLVER_PLATFORM DLLVER_PLATFORM_WINDOWS = 0x00000001;
  static const DLLVER_PLATFORM DLLVER_PLATFORM_NT = 0x00000002;
  typedef struct DLLVERSIONINFO {
    DWORD cbSize;
    DWORD dwMajorVersion;
    DWORD dwMinorVersion;
    DWORD dwBuildNumber;
    DLLVER_PLATFORM dwPlatformID;
  } DLLVERSIONINFO;
  typedef UINT CPL_MSG; //Alias
  static const CPL_MSG CPL_INIT = 1;
  static const CPL_MSG CPL_GETCOUNT = 2;
  static const CPL_MSG CPL_INQUIRE = 3;
  static const CPL_MSG CPL_SELECT = 4;
  static const CPL_MSG CPL_DBLCLK = 5;
  static const CPL_MSG CPL_STOP = 6;
  static const CPL_MSG CPL_EXIT = 7;
  static const CPL_MSG CPL_NEWINQUIRE = 8;
  static const CPL_MSG CPL_STARTWPARMSA = 9;
  static const CPL_MSG CPL_STARTWPARMSW = 10;
  static const CPL_MSG CPL_SETUP = 200;
  BOOL    DllMain(               HINSTANCE hinstDLL, DLLMAIN_REASON fdwReason, LPVOID lpvReserved);
  HRESULT DllGetClassObject(     REFCLSID rclsid, REFIID riid, LPVOID* ppv);
  HRESULT DllCanUnloadNow(       );
  HRESULT DllRegisterServer(     );
  HRESULT DllUnregisterServer(   );
  BOOL    DllDebugObjectRPCHook( BOOL fTrace, LPORPC_INIT_ARGS lpOrpcInitArgs);
  LONG    CPlApplet(             HWND hwndCPl, CPL_MSG uMsg, LPARAM lParam1, LPARAM lParam2);
  HRESULT DllGetVersion(         DLLVERSIONINFO* pdvi);
  HRESULT DllInstall(            BOOL bInstall, PCWSTR pszCmdLine);
]]
ffi.load( '*' )

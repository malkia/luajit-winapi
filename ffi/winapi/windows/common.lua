require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IOrpcDebugNotify; //Interface
  typedef DWORD WINAPI_DLLMAIN_REASON; //Alias
  static const WINAPI_DLLMAIN_REASON DLL_PROCESS_ATTACH = 1;
  static const WINAPI_DLLMAIN_REASON DLL_THREAD_ATTACH = 2;
  static const WINAPI_DLLMAIN_REASON DLL_THREAD_DETACH = 3;
  static const WINAPI_DLLMAIN_REASON DLL_PROCESS_DETACH = 0;
  typedef struct ORPC_INIT_ARGS {
    IOrpcDebugNotify* lpIntfOrpcDebug;
    void* pvPSN;
    DWORD* dwReserved1;
    DWORD* dwReserved2;
  } ORPC_INIT_ARGS;
  typedef ORPC_INIT_ARGS *LPORPC_INIT_ARGS; //Pointer
  typedef DWORD WINAPI_DLLVER_PLATFORM; //Alias
  static const WINAPI_DLLVER_PLATFORM DLLVER_PLATFORM_WINDOWS = 0x00000001;
  static const WINAPI_DLLVER_PLATFORM DLLVER_PLATFORM_NT = 0x00000002;
  typedef struct DLLVERSIONINFO {
    DWORD cbSize;
    DWORD dwMajorVersion;
    DWORD dwMinorVersion;
    DWORD dwBuildNumber;
    WINAPI_DLLVER_PLATFORM dwPlatformID;
  } DLLVERSIONINFO;
  typedef UINT WINAPI_CPL_MSG; //Alias
  static const WINAPI_CPL_MSG CPL_INIT = 1;
  static const WINAPI_CPL_MSG CPL_GETCOUNT = 2;
  static const WINAPI_CPL_MSG CPL_INQUIRE = 3;
  static const WINAPI_CPL_MSG CPL_SELECT = 4;
  static const WINAPI_CPL_MSG CPL_DBLCLK = 5;
  static const WINAPI_CPL_MSG CPL_STOP = 6;
  static const WINAPI_CPL_MSG CPL_EXIT = 7;
  static const WINAPI_CPL_MSG CPL_NEWINQUIRE = 8;
  static const WINAPI_CPL_MSG CPL_STARTWPARMSA = 9;
  static const WINAPI_CPL_MSG CPL_STARTWPARMSW = 10;
  static const WINAPI_CPL_MSG CPL_SETUP = 200;
  BOOL    DllMain(               HINSTANCE hinstDLL, WINAPI_DLLMAIN_REASON fdwReason, LPVOID lpvReserved);
  HRESULT DllGetClassObject(     REFCLSID rclsid, REFIID riid, LPVOID* ppv);
  HRESULT DllCanUnloadNow(       );
  HRESULT DllRegisterServer(     );
  HRESULT DllUnregisterServer(   );
  BOOL    DllDebugObjectRPCHook( BOOL fTrace, LPORPC_INIT_ARGS lpOrpcInitArgs);
  LONG    CPlApplet(             HWND hwndCPl, WINAPI_CPL_MSG uMsg, LPARAM lParam1, LPARAM lParam2);
  HRESULT DllGetVersion(         DLLVERSIONINFO* pdvi);
  HRESULT DllInstall(            BOOL bInstall, PCWSTR pszCmdLine);
]]
return ffi.load( '*' )

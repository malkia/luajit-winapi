require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
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
return ffi.load( "*" )

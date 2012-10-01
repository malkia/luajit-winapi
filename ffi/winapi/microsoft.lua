require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  HRESULT CorLaunchApplication(              HOST_TYPE dwClickOnceHost, LPCWSTR pwzAppFullName, DWORD dwManifestPaths, LPCWSTR* ppwzManifestPaths, DWORD dwActivationData, LPCWSTR* ppwzActivationData, LPPROCESS_INFORMATION lpProcessInformation);
  STDAPI  GetCLRIdentityManager(             REFIID riid, IUnknown** ppManager);
  STDAPI  CompareAssemblyIdentity(           LPCWSTR pwzAssemblyIdentity1, BOOL fUnified1, LPCWSTR pwzAssemblyIdentity2, BOOL fUnified2, BOOL* pfEquivalent, AssemblyComparisonResult* pResult);
  STDAPI  CompareAssemblyIdentityWithConfig( LPCWSTR pwzAssemblyIdentity1, BOOL fUnified1, LPCWSTR pwzAssemblyIdentity2, BOOL fUnified2, AssemblyConfig* pAssemblyConfig, BOOL* pfEquivalent, AssemblyComparisonResult* pResult);
  HRESULT CreateAssemblyCache(               IAssemblyCache** ppAsmCache, DWORD dwReserved);
  HRESULT CreateAssemblyEnum(                IAssemblyEnum** pEnum, IUnknown* pUnkReserved, IAssemblyName* pName, DWORD dwFlags, LPVOID pvReserved);
  HRESULT CreateAssemblyNameObject(          LPASSEMBLYNAME* ppAssemblyNameObj, LPCWSTR szAssemblyName, DWORD dwFlags, LPVOID pvReserved);
  HRESULT CreateHistoryReader(               LPCWSTR wzFilePath, IHistoryReader** ppHistoryReader);
  HRESULT CreateInstallReferenceEnum(        IInstallReferenceEnum** ppRefEnum, IAssemblyName* pName, DWORD dwFlags, LPVOID pvReserved);
  HRESULT GetAppIdAuthority(                 IAppIdAuthority** ppIAppIdAuthority);
  HRESULT GetCachePath(                      ASM_CACHE_FLAGS dwCacheFlags, LPWSTR pwzCachePath, PDWORD pcchPath);
  HRESULT GetHistoryFileDirectory(           LPWSTR wzDir, LPCWSTR* pdwsize);
  HRESULT GetAssemblyIdentityFromFile(       LPCWSTR pwzFilePath, REFIID riid, IUnknown** ppIdentity);
  HRESULT GetIdentityAuthority(              IIdentityAuthority** ppIIdentityAuthority);
  HRESULT PreBindAssemblyEx(                 IApplicationContext* pAppCtx, IAssemblyName* pName, IAssembly* pAsmParent, LPCWSTR pwzRuntimeVersion, IAssemblyName** ppNamePostPolicy, LPVOID pvReserved);
]]
return ffi.load( "mscorwks.dll" )

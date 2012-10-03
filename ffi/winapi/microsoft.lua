require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UINT HOST_TYPE; //Alias
  static const UINT HOST_TYPE_DEFAULT = 0;
  static const UINT HOST_TYPE_APPLAUNCH = 0x1;
  static const UINT HOST_TYPE_CORFLAG = 0x2;
  typedef UINT AssemblyComparisonResult; //Alias
  static const UINT ACR_Unknown = 0;
  static const UINT ACR_EquivalentFullMatch = 1;
  static const UINT ACR_EquivalentWeakNamed = 2;
  static const UINT ACR_EquivalentFXUnified = 3;
  static const UINT ACR_EquivalentUnified = 4;
  static const UINT ACR_NonEquivalentVersion = 5;
  static const UINT ACR_NonEquivalent = 6;
  static const UINT ACR_EquivalentPartialMatch = 7;
  static const UINT ACR_EquivalentPartialWeakNamed = 8;
  static const UINT ACR_EquivalentPartialUnified = 9;
  static const UINT ACR_EquivalentPartialFXUnified = 10;
  static const UINT ACR_NonEquivalentPartialVersion = 11;
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
return ffi.load( 'mscorwks.dll' )

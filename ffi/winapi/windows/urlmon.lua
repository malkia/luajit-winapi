require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/shell" )
require( "ffi/winapi/headers/ole" )
local ffi = require( "ffi" )
ffi.cdef [[
  HRESULT CreateFormatEnumerator(                  UINT cfmtetc, FORMATETC* rgfmtetc, IEnumFORMATETC** ppenumfmtetc);
  HRESULT CoInternetCreateSecurityManager(         IServiceProvider* pSP, IInternetSecurityManager** ppSM, DWORD dwReserved);
  HRESULT CoInternetCreateZoneManager(             IServiceProvider* pSP, IInternetZoneManager** ppZM, DWORD dwReserved);
  HRESULT CoInternetGetSecurityUrl(                LPCWSTR pwzUrl, LPWSTR* ppwzSecUrl, PSUACTION psuAction, DWORD dwReserved);
  HRESULT CoInternetGetSecurityUrlEx(              IUri* pUri, IUri** ppSecUri, PSUACTION psuAction, DWORD_PTR dwReserved);
  HRESULT CoInternetIsFeatureEnabled(              INTERNETFEATURELIST FeatureEntry, WINAPI_GetFeatureFlag dwFlags);
  STDAPI  CoInternetIsFeatureEnabledForIUri(       INTERNETFEATURELIST FeatureEntry, WINAPI_GetFeatureFlag dwFlags, IUri* pIUri, IInternetSecurityManagerEx2* pSecMgr);
  HRESULT CoInternetIsFeatureEnabledForUrl(        INTERNETFEATURELIST FeatureEntry, WINAPI_GetFeatureFlag dwFlags, LPCWSTR szURL, IInternetSecurityManager* pSecMgr);
  HRESULT CoInternetIsFeatureZoneElevationEnabled( LPCWSTR szFromURL, LPCWSTR szToURL, IInternetSecurityManager* pSecMgr, DWORD dwFlags);
  HRESULT CoInternetSetFeatureEnabled(             INTERNETFEATURELIST FeatureEntry, DWORD dwFlags, BOOL fEnable);
  HRESULT AsyncInstallDistributionUnit(            LPCWSTR szDistUnit, LPCWSTR szTYPE, LPCWSTR szExt, DWORD dwFileVersionMS, DWORD dwFileVersionLS, LPCWSTR szURL, IBindCtx* pbc, LPVOID pvReserved, DWORD flags);
  HRESULT CoGetClassObjectFromURL(                 REFCLSID rclsid, LPCWSTR szCodeURL, DWORD dwFileVersionMS, DWORD dwFileVersionLS, LPCWSTR szContentType, LPBINDCTX pBindCtx, DWORD dwClsContext, LPVOID pvReserved, REFIID riid, VOID** ppv);
  HRESULT CoInternetCombineIUri(                   IUri* pBaseUri, IUri* pRelativeUri, WINAPI_UrlFlags dwCombineFlags, IUri** ppCombinedUri, DWORD_PTR dwReserved);
  HRESULT CoInternetCombineUrl(                    LPCWSTR pwzBaseUrl, LPCWSTR pwzRelativeUrl, WINAPI_UrlFlags dwCombineFlags, LPWSTR pwzResult, DWORD cchResult, DWORD* pcchResult, DWORD dwReserved);
  HRESULT CoInternetCombineUrlEx(                  IUri* pBaseUri, LPCWSTR pwzRelativeUrl, WINAPI_UrlFlags dwCombineFlags, IUri** ppCombinedUri, DWORD_PTR dwReserved);
  HRESULT CoInternetCompareUrl(                    LPCWSTR pwzUrl1, LPCWSTR pwzUrl2, DWORD dwCompareFlags);
  STDAPI  CoInternetParseIUri(                     IUri* pIUri, PARSEACTION ParseAction, DWORD dwFlags, LPWSTR pwzResult, DWORD cchResult, DWORD* pcchResult, DWORD_PTR dwReserved);
  STDAPI  CoInternetParseUrl(                      LPCWSTR pwzUrl, PARSEACTION ParseAction, DWORD dwFlags, LPWSTR pszResult, DWORD cchResult, DWORD* pcchResult, DWORD dwReserved);
  HRESULT CoInternetQueryInfo(                     LPCWSTR pwzUrl, QUERYOPTION QueryOption, DWORD dwQueryFlags, LPVOID pvBuffer, DWORD cbBuffer, DWORD* pcbBuffer, DWORD dwReserved);
  HRESULT CompareSecurityIds(                      BYTE* pbSecurityId1, DWORD dwLen1, BYTE* pbSecurityId2, DWORD dwLen2, DWORD dwReserved);
  HRESULT CopyBindInfo(                            BINDINFO* pcbiSrc, BINDINFO* pcbiDest);
  HRESULT CopyStgMedium(                           STGMEDIUM* pcstgmedSrc, STGMEDIUM* pstgmedDest);
  HRESULT CreateAsyncBindCtx(                      DWORD dwReserved, IBindStatusCallback* pbsc, IEnumFORMATETC* penumfmtetc, IBindCtx** ppbc);
  HRESULT CreateAsyncBindCtxEx(                    IBindCtx* pbc, DWORD dwOptions, IBindStatusCallback* pBSCb, IEnumFORMATETC* pEnum, IBindCtx** ppBC, DWORD reserved);
  STDAPI  CreateIUriBuilder(                       IUri* pIUri, DWORD dwFlags, DWORD_PTR dwReserved, IUriBuilder** ppIUriBuilder);
  STDAPI  CreateUri(                               LPCWSTR pwzURI, WINAPI_CreateUriFlags dwFlags, DWORD_PTR dwReserved, IUri** ppURI);
  HRESULT CreateUriFromMultiByteString(            LPCSTR pszANSIInputUri, WINAPI_UriEncodingFlags dwEncodingFlags, DWORD dwCodePage, WINAPI_CreateUriFlags dwCreateFlags, DWORD_PTR dwReserved, IUri** ppURI);
  STDAPI  CreateUriWithFragment(                   LPCWSTR pwzURI, LPCWSTR pwzFragment, WINAPI_CreateUriFlags dwFlags, DWORD_PTR dwReserved, IUri** ppURI);
  HRESULT CreateURLMoniker(                        IMoniker* pMkCtx, LPCWSTR szURL, IMoniker** ppmk);
  HRESULT CreateURLMonikerEx(                      IMoniker* pMkCtx, LPCWSTR szURL, IMoniker** ppmk, DWORD dwFlags);
  HRESULT CreateURLMonikerEx2(                     IMoniker* pMkCtx, IUri* pUri, IMoniker** ppmk, DWORD dwFlags);
  HRESULT FaultInIEFeature(                        HWND hWnd, uCLSSPEC* pClassSpec, QUERYCONTEXT* pQuery, DWORD dwFlags);
  HRESULT FindMediaType(                           LPCSTR rgszTypes, CLIPFORMAT* rgcfTypes);
  HRESULT FindMediaTypeClass(                      LPBC pbc, LPCSTR szType, CLSID* pclsID, DWORD dwReserved);
  HRESULT FindMimeFromData(                        LPBC pBC, LPCWSTR pwzUrl, LPVOID pBuffer, DWORD cbSize, LPCWSTR pwzMimeProposed, DWORD dwMimeFlags, LPWSTR* ppwzMimeOut, DWORD dwReserved);
  HRESULT GetClassFileOrMime(                      LPBC pBC, LPCWSTR szFilename, LPVOID pBuffer, DWORD cbSize, LPCWSTR szMime, DWORD dwReserved, CLSID* pclsid);
  HRESULT GetComponentIDFromCLSSPEC(               uCLSSPEC* pClassSpec, LPSTR* ppszComponentID);
  HRESULT IEInstallScope(                          LPDWORD* pdwScope);
  HRESULT IsAsyncMoniker(                          IMoniker* pmk);
  HRESULT IsValidURL(                              LPBC pBC, LPCWSTR szURL, DWORD dwReserved);
  HRESULT MkParseDisplayNameEx(                    IBindCtx* pbc, LPWSTR szDisplayName, ULONG* pcchEaten, IMoniker** ppmk);
  HRESULT ObtainUserAgentString(                   DWORD dwOption, LPCSTR* pcszUAOut, DWORD* cbSize);
  HRESULT RegisterBindStatusCallback(              IBindCtx* pbc, IBindStatusCallback* pbsc, IBindStatusCallback** ppbscPrevious, DWORD dwReserved);
  HRESULT RegisterFormatEnumerator(                LPBC pBC, IEnumFORMATETC* pEFetc, DWORD reserved);
  HRESULT RegisterMediaTypeClass(                  LPBC pbc, UINT ctypes, LPCSTR* rgszTypes, CLSID* rgclsID, DWORD dwReserved);
  HRESULT RegisterMediaTypes(                      UINT ctypes, LPCSTR* rgszTypes, CLIPFORMAT* rgcfTypes);
  void    ReleaseBindInfo(                         BINDINFO* pbindinfo);
  HRESULT RevokeBindStatusCallback(                IBindCtx* pbc, IBindStatusCallback* pbsc);
  HRESULT RevokeFormatEnumerator(                  LPBC pbc, IEnumFORMATETC* pEFetc);
  HRESULT URLDownloadToCacheFile(                  LPUNKNOWN lpUnkcaller, LPCSTR szURL, LPTSTR szFileName, DWORD cchFileName, DWORD dwReserved, IBindStatusCallback* pBSC);
  HRESULT URLDownloadToFile(                       LPUNKNOWN pCaller, LPCTSTR szURL, LPCTSTR szFileName, DWORD dwReserved, LPBINDSTATUSCALLBACK lpfnCB);
  HRESULT UrlMkGetSessionOption(                   WINAPI_UrlMkSessionOption dwOption, LPVOID pBuffer, DWORD dwBufferLength, DWORD* pdwBufferLengthOut, DWORD dwReserved);
  HRESULT UrlMkSetSessionOption(                   WINAPI_UrlMkSessionOption dwOption, LPVOID pBuffer, DWORD dwBufferLength, DWORD dwReserved);
  HRESULT URLOpenBlockingStream(                   LPUNKNOWN pCaller, LPCSTR szURL, LPSTREAM* ppStream, DWORD dwReserved, LPBINDSTATUSCALLBACK lpfnCB);
  HRESULT URLOpenPullStream(                       LPUNKNOWN pCaller, LPCSTR szURL, DWORD dwReserved, LPBINDSTATUSCALLBACK lpfnCB);
  HRESULT URLOpenStream(                           LPUNKNOWN pCaller, LPCSTR szURL, DWORD dwReserved, LPBINDSTATUSCALLBACK lpfnCB);
  HRESULT CompatFlagsFromClsid(                    CLSID* pclsid, LPDWORD pdwCompatFlags, LPDWORD pdwMiscStatusFlags);
]]
return ffi.load( "urlmon.dll" )

require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/shell' )
require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IUri; //Interface
  typedef void* IUriBuilder; //Interface
  typedef void* IInternetZoneManager; //Interface
  typedef void* IInternetSecurityManager; //Interface
  typedef void* IInternetSecurityManagerEx2; //Interface
  typedef void* IBindStatusCallback; //Interface
  typedef void* IServiceProvider; //Interface
  typedef IBindStatusCallback* LPBINDSTATUSCALLBACK; //Alias
  typedef DWORD BINDINFOF; //Alias
  typedef DWORD BINDVERB; //Alias
  static const BINDVERB BINDVERB_GET = 0;
  static const BINDVERB BINDVERB_POST = 0x1;
  static const BINDVERB BINDVERB_PUT = 0x2;
  static const BINDVERB BINDVERB_CUSTOM = 0x3;
  static const BINDVERB BINDVERB_RESERVED1 = 0x4;
  typedef DWORD BINDINFO_OPTIONS; //Alias
  typedef struct BINDINFO {
    ULONG cbSize;
    LPWSTR szExtraInfo;
    STGMEDIUM stgmedData;
    BINDINFOF grfBindInfoF;
    BINDVERB dwBindVerb;
    LPWSTR szCustomVerb;
    DWORD cbstgmedData;
    DWORD dwOptions;
    BINDINFO_OPTIONS dwOptionsFlags;
    CodePageEnum dwCodePage;
    SECURITY_ATTRIBUTES securityAttributes;
    IID iid;
    IUnknown* pUnk;
    DWORD dwReserved;
  } BINDINFO;
  typedef DWORD CreateUriFlags; //Alias
  typedef DWORD UriEncodingFlags; //Alias
  typedef UINT INTERNETFEATURELIST; //Alias
  static const INTERNETFEATURELIST FEATURE_OBJECT_CACHING = 0;
  static const INTERNETFEATURELIST FEATURE_ZONE_ELEVATION = 1;
  static const INTERNETFEATURELIST FEATURE_MIME_HANDLING = 2;
  static const INTERNETFEATURELIST FEATURE_MIME_SNIFFING = 3;
  static const INTERNETFEATURELIST FEATURE_WINDOW_RESTRICTIONS = 4;
  static const INTERNETFEATURELIST FEATURE_WEBOC_POPUPMANAGEMENT = 5;
  static const INTERNETFEATURELIST FEATURE_BEHAVIORS = 6;
  static const INTERNETFEATURELIST FEATURE_DISABLE_MK_PROTOCOL = 7;
  static const INTERNETFEATURELIST FEATURE_LOCALMACHINE_LOCKDOWN = 8;
  static const INTERNETFEATURELIST FEATURE_SECURITYBAND = 9;
  static const INTERNETFEATURELIST FEATURE_RESTRICT_ACTIVEXINSTALL = 10;
  static const INTERNETFEATURELIST FEATURE_VALIDATE_NAVIGATE_URL = 11;
  static const INTERNETFEATURELIST FEATURE_RESTRICT_FILEDOWNLOAD = 12;
  static const INTERNETFEATURELIST FEATURE_ADDON_MANAGEMENT = 13;
  static const INTERNETFEATURELIST FEATURE_PROTOCOL_LOCKDOWN = 14;
  static const INTERNETFEATURELIST FEATURE_HTTP_USERNAME_PASSWORD_DISABLE = 15;
  static const INTERNETFEATURELIST FEATURE_SAFE_BINDTOOBJECT = 16;
  static const INTERNETFEATURELIST FEATURE_UNC_SAVEDFILECHECK = 17;
  static const INTERNETFEATURELIST FEATURE_GET_URL_DOM_FILEPATH_UNENCODED = 18;
  static const INTERNETFEATURELIST FEATURE_TABBED_BROWSING = 19;
  static const INTERNETFEATURELIST FEATURE_SSLUX = 20;
  static const INTERNETFEATURELIST FEATURE_DISABLE_NAVIGATION_SOUNDS = 21;
  static const INTERNETFEATURELIST FEATURE_DISABLE_LEGACY_COMPRESSION = 22;
  static const INTERNETFEATURELIST FEATURE_FORCE_ADDR_AND_STATUS = 23;
  static const INTERNETFEATURELIST FEATURE_XMLHTTP = 24;
  static const INTERNETFEATURELIST FEATURE_DISABLE_TELNET_PROTOCOL = 25;
  static const INTERNETFEATURELIST FEATURE_FEEDS = 26;
  static const INTERNETFEATURELIST FEATURE_BLOCK_INPUT_PROMPTS = 27;
  typedef DWORD GetFeatureFlag; //Alias
  typedef DWORD UrlFlags; //Alias
  typedef UINT QUERYOPTION; //Alias
  static const QUERYOPTION QUERY_EXPIRATION_DATE = 1;
  static const QUERYOPTION QUERY_TIME_OF_LAST_CHANGE = 2;
  static const QUERYOPTION QUERY_CONTENT_ENCODING = 3;
  static const QUERYOPTION QUERY_CONTENT_TYPE = 4;
  static const QUERYOPTION QUERY_REFRESH = 5;
  static const QUERYOPTION QUERY_RECOMBINE = 6;
  static const QUERYOPTION QUERY_CAN_NAVIGATE = 7;
  static const QUERYOPTION QUERY_USES_NETWORK = 8;
  static const QUERYOPTION QUERY_IS_CACHED = 9;
  static const QUERYOPTION QUERY_IS_INSTALLEDENTRY = 10;
  static const QUERYOPTION QUERY_IS_CACHED_OR_MAPPED = 11;
  static const QUERYOPTION QUERY_USES_CACHE = 12;
  static const QUERYOPTION QUERY_IS_SECURE = 13;
  static const QUERYOPTION QUERY_IS_SAFE = 14;
  static const QUERYOPTION QUERY_USES_HISTORYFOLDER = 15;
  static const QUERYOPTION QUERY_IS_CACHED_AND_USABLE_OFFLINE = 16;
  typedef UINT PSUACTION; //Alias
  static const PSUACTION PSU_DEFAULT = 1;
  static const PSUACTION PSU_SECURITY_URL_ONLY = 2;
  typedef UINT PARSEACTION; //Alias
  static const PARSEACTION PARSE_CANONICALIZE = 1;
  static const PARSEACTION PARSE_FRIENDLY = 2;
  static const PARSEACTION PARSE_SECURITY_URL = 3;
  static const PARSEACTION PARSE_ROOTDOCUMENT = 4;
  static const PARSEACTION PARSE_DOCUMENT = 5;
  static const PARSEACTION PARSE_ANCHOR = 6;
  static const PARSEACTION PARSE_ENCODE = 7;
  static const PARSEACTION PARSE_DECODE = 8;
  static const PARSEACTION PARSE_PATH_FROM_URL = 9;
  static const PARSEACTION PARSE_URL_FROM_PATH = 10;
  static const PARSEACTION PARSE_MIME = 11;
  static const PARSEACTION PARSE_SERVER = 12;
  static const PARSEACTION PARSE_SCHEMA = 13;
  static const PARSEACTION PARSE_SITE = 14;
  static const PARSEACTION PARSE_DOMAIN = 15;
  static const PARSEACTION PARSE_LOCATION = 16;
  static const PARSEACTION PARSE_SECURITY_DOMAIN = 17;
  static const PARSEACTION PARSE_ESCAPE = 18;
  static const PARSEACTION PARSE_UNESCAPE = 19;
  typedef DWORD UrlMkSessionOption; //Alias
  static const UrlMkSessionOption URLMON_OPTION_USERAGENT = 0x10000001;
  static const UrlMkSessionOption URLMON_OPTION_USERAGENT_REFRESH = 0x10000002;
  static const UrlMkSessionOption URLMON_OPTION_URL_ENCODING = 0x10000004;
  static const UrlMkSessionOption URLMON_OPTION_USE_BINDSTRINGCREDS = 0x10000008;
  static const UrlMkSessionOption URLMON_OPTION_USE_BROWSERAPPSDOCUMENTS = 0x10000010;
  HRESULT CreateFormatEnumerator(                  UINT cfmtetc, FORMATETC* rgfmtetc, IEnumFORMATETC** ppenumfmtetc);
  HRESULT CoInternetCreateSecurityManager(         IServiceProvider* pSP, IInternetSecurityManager** ppSM, DWORD dwReserved);
  HRESULT CoInternetCreateZoneManager(             IServiceProvider* pSP, IInternetZoneManager** ppZM, DWORD dwReserved);
  HRESULT CoInternetGetSecurityUrl(                LPCWSTR pwzUrl, LPWSTR* ppwzSecUrl, PSUACTION psuAction, DWORD dwReserved);
  HRESULT CoInternetGetSecurityUrlEx(              IUri* pUri, IUri** ppSecUri, PSUACTION psuAction, DWORD_PTR dwReserved);
  HRESULT CoInternetIsFeatureEnabled(              INTERNETFEATURELIST FeatureEntry, GetFeatureFlag dwFlags);
  STDAPI  CoInternetIsFeatureEnabledForIUri(       INTERNETFEATURELIST FeatureEntry, GetFeatureFlag dwFlags, IUri* pIUri, IInternetSecurityManagerEx2* pSecMgr);
  HRESULT CoInternetIsFeatureEnabledForUrl(        INTERNETFEATURELIST FeatureEntry, GetFeatureFlag dwFlags, LPCWSTR szURL, IInternetSecurityManager* pSecMgr);
  HRESULT CoInternetIsFeatureZoneElevationEnabled( LPCWSTR szFromURL, LPCWSTR szToURL, IInternetSecurityManager* pSecMgr, DWORD dwFlags);
  HRESULT CoInternetSetFeatureEnabled(             INTERNETFEATURELIST FeatureEntry, DWORD dwFlags, BOOL fEnable);
  HRESULT AsyncInstallDistributionUnit(            LPCWSTR szDistUnit, LPCWSTR szTYPE, LPCWSTR szExt, DWORD dwFileVersionMS, DWORD dwFileVersionLS, LPCWSTR szURL, IBindCtx* pbc, LPVOID pvReserved, DWORD flags);
  HRESULT CoGetClassObjectFromURL(                 REFCLSID rclsid, LPCWSTR szCodeURL, DWORD dwFileVersionMS, DWORD dwFileVersionLS, LPCWSTR szContentType, LPBINDCTX pBindCtx, DWORD dwClsContext, LPVOID pvReserved, REFIID riid, VOID** ppv);
  HRESULT CoInternetCombineIUri(                   IUri* pBaseUri, IUri* pRelativeUri, UrlFlags dwCombineFlags, IUri** ppCombinedUri, DWORD_PTR dwReserved);
  HRESULT CoInternetCombineUrl(                    LPCWSTR pwzBaseUrl, LPCWSTR pwzRelativeUrl, UrlFlags dwCombineFlags, LPWSTR pwzResult, DWORD cchResult, DWORD* pcchResult, DWORD dwReserved);
  HRESULT CoInternetCombineUrlEx(                  IUri* pBaseUri, LPCWSTR pwzRelativeUrl, UrlFlags dwCombineFlags, IUri** ppCombinedUri, DWORD_PTR dwReserved);
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
  STDAPI  CreateUri(                               LPCWSTR pwzURI, CreateUriFlags dwFlags, DWORD_PTR dwReserved, IUri** ppURI);
  HRESULT CreateUriFromMultiByteString(            LPCSTR pszANSIInputUri, UriEncodingFlags dwEncodingFlags, DWORD dwCodePage, CreateUriFlags dwCreateFlags, DWORD_PTR dwReserved, IUri** ppURI);
  STDAPI  CreateUriWithFragment(                   LPCWSTR pwzURI, LPCWSTR pwzFragment, CreateUriFlags dwFlags, DWORD_PTR dwReserved, IUri** ppURI);
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
  HRESULT UrlMkGetSessionOption(                   UrlMkSessionOption dwOption, LPVOID pBuffer, DWORD dwBufferLength, DWORD* pdwBufferLengthOut, DWORD dwReserved);
  HRESULT UrlMkSetSessionOption(                   UrlMkSessionOption dwOption, LPVOID pBuffer, DWORD dwBufferLength, DWORD dwReserved);
  HRESULT URLOpenBlockingStream(                   LPUNKNOWN pCaller, LPCSTR szURL, LPSTREAM* ppStream, DWORD dwReserved, LPBINDSTATUSCALLBACK lpfnCB);
  HRESULT URLOpenPullStream(                       LPUNKNOWN pCaller, LPCSTR szURL, DWORD dwReserved, LPBINDSTATUSCALLBACK lpfnCB);
  HRESULT URLOpenStream(                           LPUNKNOWN pCaller, LPCSTR szURL, DWORD dwReserved, LPBINDSTATUSCALLBACK lpfnCB);
  HRESULT CompatFlagsFromClsid(                    CLSID* pclsid, LPDWORD pdwCompatFlags, LPDWORD pdwMiscStatusFlags);
]]
ffi.load( 'urlmon.dll' )

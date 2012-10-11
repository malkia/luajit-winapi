require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
require( 'ffi/winapi/headers/rpc' )
require( 'ffi/winapi/headers/gdi' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef IPersistStorage* LPPERSISTSTORAGE; //Alias
  typedef IPersistStream* LPPERSISTSTREAM; //Alias
  typedef IOleInPlaceFrame* LPOLEINPLACEFRAME; //Alias
  typedef IOleInPlaceActiveObject* LPOLEINPLACEACTIVEOBJECT; //Alias
  typedef IDropTarget* LPDROPTARGET; //Alias
  typedef IDataAdviseHolder* LPDATAADVISEHOLDER; //Alias
  typedef IOleAdviseHolder* LPOLEADVISEHOLDER; //Alias
  typedef IDropSource* LPDROPSOURCE; //Alias
  typedef IInitializeSpy* LPINITIALIZESPY; //Alias
  typedef IMallocSpy* LPMALLOCSPY; //Alias
  typedef IMessageFilter* LPMESSAGEFILTER; //Alias
  typedef ISurrogate* LPSURROGATE; //Alias
  typedef IRunningObjectTable* LPRUNNINGOBJECTTABLE; //Alias
  typedef IMarshal* LPMARSHAL; //Alias
  typedef LPVOID LPOLESTREAM; //Alias
  typedef struct STGOPTIONS {
    USHORT usVersion;
    USHORT reserved;
    ULONG ulSectorSize;
    WCHAR* pwcsTemplateFile;
  } STGOPTIONS;
  typedef struct COAUTHIDENTITY {
    USHORT* User;
    ULONG UserLength;
    USHORT* Domain;
    ULONG DomainLength;
    USHORT* Password;
    ULONG PasswordLength;
    ULONG Flags;
  } COAUTHIDENTITY;
  typedef struct COAUTHINFO {
    DWORD dwAuthnSvc;
    DWORD dwAuthzSvc;
    LPWSTR pwszServerPrincName;
    DWORD dwAuthnLevel;
    DWORD dwImpersonationLevel;
    COAUTHIDENTITY* pAuthIdentityData;
    DWORD dwCapabilities;
  } COAUTHINFO;
  typedef struct COSERVERINFO {
    DWORD dwReserved1;
    LPWSTR pwszName;
    COAUTHINFO* pAuthInfo;
    DWORD dwReserved2;
  } COSERVERINFO;
  typedef struct SOLE_AUTHENTICATION_SERVICE {
    DWORD dwAuthnSvc;
    DWORD dwAuthzSvc;
    OLECHAR* pPrincipalName;
    HRESULT hr;
  } SOLE_AUTHENTICATION_SERVICE;
  typedef DWORD EOLE_AUTHENTICATION_CAPABILITIES; //Alias
  typedef DWORD REGCLS; //Alias
  typedef DWORD STGFMT; //Alias
  static const STGFMT STGFMT_STORAGE = 0;
  static const STGFMT STGFMT_NATIVE = 1;
  static const STGFMT STGFMT_FILE = 3;
  static const STGFMT STGFMT_ANY = 4;
  static const STGFMT STGFMT_DOCFILE = 5;
  HRESULT                  BindMoniker(                           LPMONIKER pmk, DWORD grfOpt, REFIID iidResult, LPVOID* ppvResult);
  HRESULT                  CLSIDFromProgID(                       LPCOLESTR lpszProgID, LPCLSID lpclsid);
  HRESULT                  CLSIDFromProgIDEx(                     LPCOLESTR lpszProgID, LPCLSID lpclsid);
  HRESULT                  CLSIDFromString(                       LPCOLESTR lpsz, LPCLSID pclsid);
  ULONG                    CoAddRefServerProcess(                 );
  HRESULT                  CoAllowSetForegroundWindow(            IUnknown* pUnk, LPVOID lpvReserved);
  HRESULT                  CoCancelCall(                          DWORD dwThreadId, ULONG ulTimeout);
  HRESULT                  CoCopyProxy(                           IUnknown* pProxy, IUnknown** ppCopy);
  HRESULT                  CoCreateFreeThreadedMarshaler(         LPUNKNOWN punkOuter, LPUNKNOWN* ppunkMarshal);
  HRESULT                  CoCreateGuid(                          GUID* pguid);
  HRESULT                  CoCreateInstance(                      REFCLSID rclsid, LPUNKNOWN pUnkOuter, WINAPI_CLSCTX dwClsContext, REFIID riid, LPVOID* ppv);
  HRESULT                  CoCreateInstanceEx(                    REFCLSID rclsid, IUnknown* punkOuter, WINAPI_CLSCTX dwClsCtx, COSERVERINFO* pServerInfo, DWORD dwCount, MULTI_QI* pResults);
  HRESULT                  CoDisableCallCancellation(             LPVOID pReserved);
  HRESULT                  CoDisconnectContext(                   DWORD dwTimeout);
  HRESULT                  CoDisconnectObject(                    LPUNKNOWN pUnk, DWORD dwReserved);
  BOOL                     CoDosDateTimeToFileTime(               WORD nDosDate, WORD nDosTime, FILETIME* lpFileTime);
  HRESULT                  CoEnableCallCancellation(              LPVOID pReserved);
  HRESULT                  CoFileTimeNow(                         FILETIME* lpFileTime);
  BOOL                     CoFileTimeToDosDateTime(               FILETIME* lpFileTime, LPWORD lpDosDate, LPWORD lpDosTime);
  void                     CoFreeAllLibraries(                    );
  void                     CoFreeLibrary(                         HINSTANCE hInst);
  void                     CoFreeUnusedLibraries(                 );
  void                     CoFreeUnusedLibrariesEx(               DWORD dwUnloadDelay, DWORD dwReserved);
  HRESULT                  CoGetApartmentType(                    APTTYPE* pAptType, APTTYPEQUALIFIER* pAptQualifier);
  HRESULT                  CoGetCallContext(                      REFIID riid, void** ppInterface);
  HRESULT                  CoGetCallerTID(                        LPDWORD lpdwTID);
  HRESULT                  CoGetCancelObject(                     DWORD dwThreadId, REFIID iid, void** ppUnk);
  HRESULT                  CoGetClassObject(                      REFCLSID rclsid, WINAPI_CLSCTX dwClsContext, COSERVERINFO* pServerInfo, REFIID riid, LPVOID* ppv);
  HRESULT                  CoGetContextToken(                     ULONG_PTR* pToken);
  HRESULT                  CoGetCurrentLogicalThreadId(           GUID* pguid);
  DWORD                    CoGetCurrentProcess(                   );
  HRESULT                  CoGetInstanceFromFile(                 COSERVERINFO* pServerInfo, CLSID* pClsid, IUnknown* punkOuter, WINAPI_CLSCTX dwClsCtx, DWORD grfMode, OLECHAR* pwszName, DWORD dwCount, MULTI_QI* pResults);
  HRESULT                  CoGetInstanceFromIStorage(             COSERVERINFO* pServerInfo, CLSID* pClsid, IUnknown* punkOuter, WINAPI_CLSCTX dwClsCtx, struct IStorage* pstg, DWORD dwCount, MULTI_QI* pResults);
  HRESULT                  CoGetInterceptor(                      REFIID iidIntercepted, IUnknown* punkOuter, REFIID iid, void** ppv);
  HRESULT                  CoGetInterfaceAndReleaseStream(        LPSTREAM pStm, REFIID iid, LPVOID* ppv);
  HRESULT                  CoGetMalloc(                           DWORD dwMemContext, LPMALLOC* ppMalloc);
  HRESULT                  CoGetMarshalSizeMax(                   ULONG* pulSize, REFIID riid, LPUNKNOWN pUnk, DWORD dwDestContext, LPVOID pvDestContext, MSHLFLAGS mshlflags);
  HRESULT                  CoGetObject(                           LPCWSTR pszName, BIND_OPTS* pBindOptions, REFIID riid, void** ppv);
  HRESULT                  CoGetObjectContext(                    REFIID riid, LPVOID* ppv);
  HRESULT                  CoGetPSClsid(                          REFIID riid, CLSID* pClsid);
  HRESULT                  CoGetStandardMarshal(                  REFIID riid, LPUNKNOWN pUnk, DWORD dwDestContext, LPVOID pvDestContext, MSHLFLAGS mshlflags, LPMARSHAL* ppMarshal);
  HRESULT                  CoGetStdMarshalEx(                     LPUNKNOWN pUnkOuter, DWORD smexflags, LPUNKNOWN* ppUnkInner);
  HRESULT                  CoGetTreatAsClass(                     REFCLSID clsidOld, LPCLSID pClsidNew);
  HRESULT                  CoImpersonateClient(                   );
  HRESULT                  CoInitialize(                          LPVOID pvReserved);
  HRESULT                  CoInitializeEx(                        LPVOID pvReserved, WINAPI_COINIT_FLAG dwCoInit);
  HRESULT                  CoInitializeSecurity(                  PSECURITY_DESCRIPTOR pSecDesc, LONG cAuthSvc, SOLE_AUTHENTICATION_SERVICE* asAuthSvc, void* pReserved1, WINAPI_RPC_C_AUTHN_LEVEL dwAuthnLevel, WINAPI_RPC_C_IMP_LEVEL dwImpLevel, void* pAuthList, EOLE_AUTHENTICATION_CAPABILITIES dwCapabilities, void* pReserved3);
  HRESULT                  CoInstall(                             IBindCtx* pbc, DWORD dwFlags, uCLSSPEC* pClassSpec, QUERYCONTEXT* pQuery, LPWSTR pszCodeBase);
  HRESULT                  CoInvalidateRemoteMachineBindings(     LPOLESTR pszMachineName);
  BOOL                     CoIsHandlerConnected(                  LPUNKNOWN pUnk);
  BOOL                     CoIsOle1Class(                         REFCLSID rclsid);
  HINSTANCE                CoLoadLibrary(                         LPOLESTR lpszLibName, BOOL bAutoFree);
  HRESULT                  CoLockObjectExternal(                  LPUNKNOWN pUnk, BOOL fLock, BOOL fLastUnlockReleases);
  HRESULT                  CoMarshalHresult(                      LPSTREAM pstm, HRESULT hresult);
  HRESULT                  CoMarshalInterface(                    LPSTREAM pStm, REFIID riid, LPUNKNOWN pUnk, DWORD dwDestContext, LPVOID pvDestContext, MSHLFLAGS mshlflags);
  HRESULT                  CoMarshalInterThreadInterfaceInStream( REFIID riid, LPUNKNOWN pUnk, LPSTREAM* ppStm);
  HRESULT                  CoQueryAuthenticationServices(         DWORD* pcAuthSvc, SOLE_AUTHENTICATION_SERVICE** asAuthSvc);
  HRESULT                  CoQueryClientBlanket(                  DWORD* pAuthnSvc, DWORD* pAuthzSvc, OLECHAR** pServerPrincName, DWORD* pAuthnLevel, DWORD* pImpLevel, RPC_AUTHZ_HANDLE* pPrivs, DWORD* pCapabilities);
  HRESULT                  CoQueryProxyBlanket(                   IUnknown* pProxy, DWORD* pwAuthnSvc, DWORD* pAuthzSvc, OLECHAR** pServerPrincName, DWORD* pAuthnLevel, DWORD* pImpLevel, RPC_AUTH_IDENTITY_HANDLE* pAuthInfo, DWORD* pCapabilites);
  HRESULT                  CoRegisterClassObject(                 REFCLSID rclsid, LPUNKNOWN pUnk, WINAPI_CLSCTX dwClsContext, REGCLS flags, LPDWORD lpdwRegister);
  HRESULT                  CoRegisterInitializeSpy(               LPINITIALIZESPY pSpy, ULARGE_INTEGER* puliCookie);
  HRESULT                  CoRegisterMallocSpy(                   LPMALLOCSPY pMallocSpy);
  HRESULT                  CoRegisterMessageFilter(               LPMESSAGEFILTER lpMessageFilter, LPMESSAGEFILTER* lplpMessageFilter);
  HRESULT                  CoRegisterPSClsid(                     REFIID riid, REFCLSID rclsid);
  HRESULT                  CoRegisterSurrogate(                   LPSURROGATE pSurrogate);
  HRESULT                  CoReleaseMarshalData(                  LPSTREAM pStm);
  ULONG                    CoReleaseServerProcess(                );
  HRESULT                  CoResumeClassObjects(                  );
  HRESULT                  CoRevertToSelf(                        );
  HRESULT                  CoRevokeClassObject(                   DWORD dwRegister);
  HRESULT                  CoRevokeInitializeSpy(                 ULARGE_INTEGER uliCookie);
  HRESULT                  CoRevokeMallocSpy(                     );
  HRESULT                  CoSetCancelObject(                     IUnknown* pUnk);
  HRESULT                  CoSetProxyBlanket(                     IUnknown* pProxy, WINAPI_RPC_C_AUTHN_SVC dwAuthnSvc, WINAPI_RPC_C_AUTHZ dwAuthzSvc, OLECHAR* pServerPrincName, WINAPI_RPC_C_AUTHN_LEVEL dwAuthnLevel, WINAPI_RPC_C_IMP_LEVEL dwImpLevel, RPC_AUTH_IDENTITY_HANDLE pAuthInfo, EOLE_AUTHENTICATION_CAPABILITIES dwCapabilities);
  HRESULT                  CoSuspendClassObjects(                 );
  HRESULT                  CoSwitchCallContext(                   IUnknown* pNewObject, IUnknown** ppOldObject);
  LPVOID                   CoTaskMemAlloc(                        SIZE_T cb);
  void                     CoTaskMemFree(                         LPVOID pv);
  LPVOID                   CoTaskMemRealloc(                      LPVOID pv, SIZE_T cb);
  HRESULT                  CoTestCancel(                          );
  HRESULT                  CoTreatAsClass(                        REFCLSID clsidOld, REFCLSID clsidNew);
  void                     CoUninitialize(                        );
  HRESULT                  CoUnmarshalHresult(                    LPSTREAM pstm, HRESULT* phresult);
  HRESULT                  CoUnmarshalInterface(                  LPSTREAM pStm, REFIID riid, LPVOID* ppv);
  HRESULT                  CoWaitForMultipleHandles(              DWORD dwFlags, DWORD dwTimeout, ULONG cHandles, LPHANDLE pHandles, LPDWORD lpdwindex);
  HRESULT                  CreateAntiMoniker(                     LPMONIKER* ppmk);
  HRESULT                  CreateBindCtx(                         DWORD reserved, LPBC* ppbc);
  HRESULT                  CreateClassMoniker(                    REFCLSID rclsid, LPMONIKER* ppmk);
  HRESULT                  CreateFileMoniker(                     LPCOLESTR lpszPathName, LPMONIKER* ppmk);
  HRESULT                  CreateGenericComposite(                LPMONIKER pmkFirst, LPMONIKER pmkRest, LPMONIKER* ppmkComposite);
  HRESULT                  CreateItemMoniker(                     LPCOLESTR lpszDelim, LPCOLESTR lpszItem, LPMONIKER* ppmk);
  HRESULT                  CreateObjrefMoniker(                   LPUNKNOWN punk, LPMONIKER* ppmk);
  HRESULT                  CreatePointerMoniker(                  LPUNKNOWN punk, LPMONIKER* ppmk);
  HRESULT                  GetClassFile(                          LPCOLESTR szFilename, CLSID* pclsid);
  HRESULT                  GetRunningObjectTable(                 DWORD reserved, LPRUNNINGOBJECTTABLE* pprot);
  HRESULT                  IIDFromString(                         LPCOLESTR lpsz, LPIID lpiid);
  BOOL                     IsAccelerator(                         HACCEL hAccel, int cAccelEntries, LPMSG lpMsg, WORD* lpwCmd);
  BOOL                     IsEqualGUID(                           REFGUID rguid1, REFGUID rguid2);
  HRESULT                  MkParseDisplayName(                    LPBC pbc, LPCOLESTR szUserName, ULONG* pchEaten, LPMONIKER* ppmk);
  HRESULT                  MonikerCommonPrefixWith(               LPMONIKER pmkThis, LPMONIKER pmkOther, LPMONIKER* ppmkCommon);
  HRESULT                  MonikerRelativePathTo(                 LPMONIKER pmkSrc, LPMONIKER pmkDest, LPMONIKER* ppmkRelPath, BOOL dwReserved);
  HRESULT                  OleDoAutoConvert(                      LPSTORAGE pStg, LPCLSID pClsidNew);
  HRESULT                  OleGetAutoConvert(                     REFCLSID clsidOld, LPCLSID pClsidNew);
  HGLOBAL                  OleGetIconOfClass(                     REFCLSID rclsid, LPOLESTR lpszLabel, BOOL fUseTypeAsLabel);
  HGLOBAL                  OleGetIconOfFile(                      LPOLESTR lpszPath, BOOL fUseFileAsLabel);
  HRESULT                  OleRegGetMiscStatus(                   REFCLSID clsid, DVASPECT dwAspect, DWORD* pdwStatus);
  HRESULT                  OleRegGetUserType(                     REFCLSID clsid, DWORD dwFormOfType, LPOLESTR* pszUserType);
  HRESULT                  OleSetAutoConvert(                     REFCLSID clsidOld, REFCLSID clsidNew);
  HRESULT                  ProgIDFromCLSID(                       REFCLSID clsid, LPOLESTR* lplpszProgID);
  HRESULT                  StringFromCLSID(                       REFCLSID rclsid, LPOLESTR* lplpsz);
  int                      StringFromGUID2(                       REFGUID rguid, LPOLESTR lpsz, int cchMax);
  HRESULT                  StringFromIID(                         REFIID rclsid, LPOLESTR* lplpsz);
  HRESULT                  CreateDataAdviseHolder(                LPDATAADVISEHOLDER* ppDAHolder);
  HRESULT                  CreateDataCache(                       LPUNKNOWN pUnkOuter, REFCLSID rclsid, REFIID iid, LPVOID* ppv);
  HRESULT                  CreateOleAdviseHolder(                 LPOLEADVISEHOLDER* ppOAHolder);
  HRESULT                  DoDragDrop(                            LPDATAOBJECT pDataObj, LPDROPSOURCE pDropSource, DWORD dwOKEffects, LPDWORD pdwEffect);
  HRESULT                  OleCreateDefaultHandler(               REFCLSID clsid, LPUNKNOWN pUnkOuter, REFIID riid, LPVOID* lplpObj);
  HRESULT                  OleCreateEmbeddingHelper(              REFCLSID clsid, LPUNKNOWN pUnkOuter, DWORD flags, LPCLASSFACTORY pCF, REFIID riid, LPVOID* lplpObj);
  HRESULT                  OleCreateEx(                           REFCLSID rclsid, REFIID riid, DWORD dwFlags, DWORD renderopt, ULONG cFormats, DWORD* rgAdvf, LPFORMATETC rgFormatEtc, IAdviseSink* lpAdviseSink, DWORD* rgdwConnection, LPOLECLIENTSITE pClientSite, LPSTORAGE pStg, LPVOID* ppvObj);
  HRESULT                  OleCreateFromData(                     LPDATAOBJECT pSrcDataObj, REFIID riid, DWORD renderopt, LPFORMATETC pFormatEtc, LPOLECLIENTSITE pClientSite, LPSTORAGE pStg, LPVOID* ppvObj);
  HRESULT                  OleCreateFromDataEx(                   LPDATAOBJECT pSrcDataObj, REFIID riid, DWORD dwFlags, DWORD renderopt, ULONG cFormats, DWORD* rgAdvf, LPFORMATETC rgFormatEtc, IAdviseSink* lpAdviseSink, DWORD* rgdwConnection, LPOLECLIENTSITE pClientSite, LPSTORAGE pStg, LPVOID* ppvObj);
  HRESULT                  OleCreateFromFile(                     REFCLSID rclsid, LPCOLESTR lpszFileName, REFIID riid, DWORD renderopt, LPFORMATETC lpFormatEtc, LPOLECLIENTSITE pClientSite, LPSTORAGE pStg, LPVOID* ppvObj);
  HRESULT                  OleCreateFromFileEx(                   REFCLSID rclsid, LPCOLESTR lpszFileName, REFIID riid, DWORD dwFlags, DWORD renderopt, ULONG cFormats, DWORD* rgAdvf, LPFORMATETC rgFormatEtc, IAdviseSink* lpAdviseSink, DWORD* rgdwConnection, LPOLECLIENTSITE pClientSite, LPSTORAGE pStg, LPVOID* ppvObj);
  HRESULT                  OleCreateLink(                         LPMONIKER pmkLinkSrc, REFIID riid, DWORD renderopt, LPFORMATETC lpFormatEtc, LPOLECLIENTSITE pClientSite, LPSTORAGE pStg, LPVOID* ppvObj);
  HRESULT                  OleCreateLinkEx(                       LPMONIKER pmkLinkSrc, REFIID riid, DWORD dwFlags, DWORD renderopt, ULONG cFormats, DWORD* rgAdvf, LPFORMATETC rgFormatEtc, IAdviseSink* lpAdviseSink, DWORD* rgdwConnection, LPOLECLIENTSITE pClientSite, LPSTORAGE pStg, LPVOID* ppvObj);
  HRESULT                  OleCreateLinkFromData(                 LPDATAOBJECT pSrcDataObj, REFIID riid, DWORD renderopt, LPFORMATETC pFormatEtc, LPOLECLIENTSITE pClientSite, LPSTORAGE pStg, LPVOID* ppvObj);
  HRESULT                  OleCreateLinkFromDataEx(               LPDATAOBJECT pSrcDataObj, REFIID riid, DWORD dwFlags, DWORD renderopt, ULONG cFormats, DWORD* rgAdvf, LPFORMATETC rgFormatEtc, IAdviseSink* lpAdviseSink, DWORD* rgdwConnection, LPOLECLIENTSITE pClientSite, LPSTORAGE pStg, LPVOID* ppvObj);
  HRESULT                  OleCreateLinkToFile(                   LPCOLESTR lpszFileName, REFIID riid, DWORD renderopt, LPFORMATETC lpFormatEtc, LPOLECLIENTSITE pClientSite, LPSTORAGE pStg, LPVOID* ppvObj);
  HRESULT                  OleCreateLinkToFileEx(                 LPCOLESTR lpszFileName, REFIID riid, DWORD dwFlags, DWORD renderopt, ULONG cFormats, DWORD* rgAdvf, LPFORMATETC rgFormatEtc, IAdviseSink* lpAdviseSink, DWORD* rgdwConnection, LPOLECLIENTSITE pClientSite, LPSTORAGE pStg, LPVOID* ppvObj);
  HOLEMENU                 OleCreateMenuDescriptor(               HMENU hmenuCombined, LPOLEMENUGROUPWIDTHS lpMenuWidths);
  HRESULT                  OleCreateStaticFromData(               LPDATAOBJECT pSrcDataObj, REFIID iid, DWORD renderopt, LPFORMATETC pFormatEtc, LPOLECLIENTSITE pClientSite, LPSTORAGE pStg, LPVOID* ppvObj);
  VOID                     OleDestroyMenuDescriptor(              HOLEMENU holemenu);
  HRESULT                  OleDraw(                               LPUNKNOWN pUnknown, DVASPECT dwAspect, HDC hdcDraw, LPCRECT lprcBounds);
  HANDLE                   OleDuplicateData(                      HANDLE hSrc, CLIPFORMAT cfFormat, UINT uiFlags);
  HRESULT                  OleFlushClipboard(                     );
  HRESULT                  OleGetClipboard(                       LPDATAOBJECT* ppDataObj);
  HRESULT                  OleInitialize(                         LPVOID pvReserved);
  HRESULT                  OleIsCurrentClipboard(                 LPDATAOBJECT pDataObj);
  BOOL                     OleIsRunning(                          LPOLEOBJECT pObject);
  HRESULT                  OleLoadFromStream(                     LPSTREAM pStm, REFIID iidInterface, LPVOID* ppvObj);
  HRESULT                  OleLockRunning(                        LPUNKNOWN pUnknown, BOOL fLock, BOOL fLastUnlockCloses);
  HGLOBAL                  OleMetafilePictFromIconAndLabel(       HICON hIcon, LPOLESTR lpszLabel, LPOLESTR lpszSourceFile, UINT iIconIndex);
  HRESULT                  OleNoteObjectVisible(                  LPUNKNOWN pUnknown, BOOL fVisible);
  HRESULT                  OleQueryCreateFromData(                LPDATAOBJECT pSrcDataObject);
  HRESULT                  OleQueryLinkFromData(                  LPDATAOBJECT pSrcDataObject);
  HRESULT                  OleRegEnumFormatEtc(                   REFCLSID clsid, DWORD dwDirection, LPENUMFORMATETC* ppenum);
  HRESULT                  OleRegEnumVerbs(                       REFCLSID clsid, LPENUMOLEVERB* ppenum);
  HRESULT                  OleRun(                                LPUNKNOWN pUnknown);
  HRESULT                  OleSave(                               LPPERSISTSTORAGE pPS, LPSTORAGE pStg, BOOL fSameAsLoad);
  HRESULT                  OleSaveToStream(                       LPPERSISTSTREAM pPStm, LPSTREAM pStm);
  HRESULT                  OleSetClipboard(                       LPDATAOBJECT pDataObj);
  HRESULT                  OleSetContainedObject(                 LPUNKNOWN pUnknown, BOOL fContained);
  HRESULT                  OleSetMenuDescriptor(                  HOLEMENU holemenu, HWND hwndFrame, HWND hwndActiveObject, LPOLEINPLACEFRAME lpFrame, LPOLEINPLACEACTIVEOBJECT lpActiveObj);
  HRESULT                  OleTranslateAccelerator(               LPOLEINPLACEFRAME lpFrame, LPOLEINPLACEFRAMEINFO lpFrameInfo, LPMSG lpmsg);
  void                     OleUninitialize(                       );
  HRESULT                  RegisterDragDrop(                      HWND hwnd, LPDROPTARGET pDropTarget);
  void                     ReleaseStgMedium(                      LPSTGMEDIUM pMedium);
  HRESULT                  RevokeDragDrop(                        HWND hwnd);
  WINOLEAPI                CreateILockBytesOnHGlobal(             HGLOBAL hGlobal, BOOL fDeleteOnRelease, ILockBytes** ppLkbyt);
  WINOLEAPI                CreateStreamOnHGlobal(                 HGLOBAL hGlobal, BOOL fDeleteOnRelease, LPSTREAM* ppstm);
  HRESULT                  FmtIdToPropStgName(                    FMTID* pfmtid, LPOLESTR oszName);
  WINOLEAPI                FreePropVariantArray(                  ULONG cVariants, PROPVARIANT* rgvars);
  WINOLEAPI                GetConvertStg(                         IStorage* pStg);
  WINOLEAPI                GetHGlobalFromILockBytes(              ILockBytes* pLkbyt, HGLOBAL* phglobal);
  WINOLEAPI                GetHGlobalFromStream(                  IStream* pstm, HGLOBAL* phglobal);
  WINOLEAPI                OleConvertIStorageToOLESTREAM(         IStorage* pStg, LPOLESTREAM lpolestream);
  WINOLEAPI                OleConvertIStorageToOLESTREAMEx(       IStorage* pStg, CLIPFORMAT cfFormat, LONG lWidth, LONG lHeight, DWORD dwSize, LPSTGMEDIUM pmedium, LPOLESTREAM lpolestm);
  WINOLEAPI                OleConvertOLESTREAMToIStorage(         LPOLESTREAM lpolestream, IStorage* pstg, DVTARGETDEVICE* ptd);
  WINOLEAPI                OleConvertOLESTREAMToIStorageEx(       LPOLESTREAM lpolestm, IStorage* pstg, CLIPFORMAT* pcfFormat, LONG* plWidth, LONG* plHeight, DWORD* pdwSize, LPSTGMEDIUM pmedium);
  HRESULT                  PropStgNameToFmtId(                    LPOLESTR oszName, FMTID* pfmtid);
  WINOLEAPI                PropVariantClear(                      PROPVARIANT* pvar);
  WINOLEAPI                PropVariantCopy(                       PROPVARIANT* pvarDest, PROPVARIANT* pvarSrc);
  WINOLEAPI                ReadClassStg(                          IStorage* pStg, CLSID* pclsid);
  WINOLEAPI                ReadClassStm(                          IStream* pStm, CLSID* pclsid);
  WINOLEAPI                ReadFmtUserTypeStg(                    IStorage* pStg, CLIPFORMAT* pcf, LPWSTR* lplpszUserType);
  BOOLEAN                  StgConvertPropertyToVariant(           SERIALIZEDPROPERTYVALUE* prop, USHORT CodePage, PROPVARIANT* pvar, IMemoryAllocator* pma);
  WINOLEAPI                SetConvertStg(                         IStorage* pStg, BOOL fConvert);
  SERIALIZEDPROPERTYVALUE* StgConvertVariantToProperty(           PROPVARIANT* pvar, USHORT CodePage, SERIALIZEDPROPERTYVALUE* pprop, ULONG* pcb, PROPID pid, BOOLEAN fReserved, ULONG* pcIndirect);
  HRESULT                  StgCreateDocfile(                      WCHAR* pwcsName, WINAPI_STGM_FLAGS grfMode, DWORD reserved, IStorage** ppstgOpen);
  WINOLEAPI                StgCreateDocfileOnILockBytes(          ILockBytes* plkbyt, WINAPI_STGM_FLAGS grfMode, DWORD reserved, IStorage** ppstgOpen);
  HRESULT                  StgCreatePropSetStg(                   IStorage* pStorage, DWORD dwReserved, IPropertySetStorage** ppPropSetStg);
  HRESULT                  StgCreatePropStg(                      IUnknown* pUnk, REFFMTID fmtid, CLSID* pclsid, DWORD grfFlags, DWORD dwReserved, IPropertyStorage** ppPropStg);
  WINOLEAPI                StgCreateStorageEx(                    WCHAR* pwcsName, WINAPI_STGM_FLAGS grfMode, STGFMT stgfmt, DWORD grfAttrs, STGOPTIONS* pStgOptions, PSECURITY_DESCRIPTOR* pSecurityDescriptor, REFIID riid, void** ppObjectOpen);
  WINOLEAPI                StgGetIFillLockBytesOnFile(            OLECHAR* pwcsName, IFillLockBytes** ppflb);
  WINOLEAPI                StgGetIFillLockBytesOnILockBytes(      ILockBytes* pilb, IFillLockBytes** ppflb);
  WINOLEAPI                StgIsStorageFile(                      WCHAR* pwcsName);
  WINOLEAPI                StgIsStorageILockBytes(                ILockBytes* plkbyt);
  WINOLEAPI                StgOpenAsyncDocfileOnIFillLockBytes(   IFillLockBytes* ppflb, DWORD grfmode, DWORD asyncFlags, IStorage** ppstgOpen);
  HRESULT                  StgOpenPropStg(                        IUnknown* pUnk, REFFMTID fmtid, DWORD grfFlags, DWORD dwReserved, IPropertyStorage** ppPropStg);
  HRESULT                  StgOpenStorage(                        WCHAR* pwcsName, IStorage* pstgPriority, WINAPI_STGM_FLAGS grfMode, SNB snbExclude, DWORD reserved, IStorage** ppstgOpen);
  HRESULT                  StgOpenStorageEx(                      WCHAR* pwcsName, WINAPI_STGM_FLAGS grfMode, STGFMT stgfmt, DWORD grfAttrs, STGOPTIONS* pStgOptions, void* reserved2, REFIID riid, void** ppObjectOpen);
  WINOLEAPI                StgOpenStorageOnILockBytes(            ILockBytes* plkbyt, IStorage* pStgPriority, DWORD grfMode, SNB snbExclude, DWORD reserved, IStorage** ppstgOpen);
  ULONG                    StgPropertyLengthAsVariant(            SERIALIZEDPROPERTYVALUE* pProp, ULONG cbProp, USHORT CodePage, BYTE bReserved);
  WINOLEAPI                StgSetTimes(                           WCHAR* lpszName, FILETIME* pctime, FILETIME* patime, FILETIME* pmtime);
  WINOLEAPI                WriteClassStg(                         IStorage* pStg, REFCLSID rclsid);
  WINOLEAPI                WriteClassStm(                         IStream* pStm, REFCLSID rclsid);
  WINOLEAPI                WriteFmtUserTypeStg(                   IStorage* pStg, CLIPFORMAT cf, LPWSTR* lpszUserType);
]]
ffi.load( 'Ole32.dll' )

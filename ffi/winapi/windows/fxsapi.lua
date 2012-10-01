require( "ffi/winapi/headers/fax" )
local ffi = require( "ffi" )
ffi.cdef [[
  BOOL FaxOpenPort(                  HANDLE FaxHandle, DWORD DeviceId, DWORD Flags, LPHANDLE FaxPortHandle);
  BOOL FaxGetConfiguration(          HANDLE FaxHandle, PFAX_CONFIGURATION* FaxConfig);
  BOOL FaxSetConfiguration(          HANDLE FaxHandle, FAX_CONFIGURATION* FaxConfig);
  BOOL FaxSetGlobalRoutingInfo(      HANDLE FaxHandle, FAX_GLOBAL_ROUTING_INFO* RoutingInfo);
  BOOL FaxSetLoggingCategories(      HANDLE FaxHandle, FAX_LOG_CATEGORY* Categories, DWORD NumberCategories);
  BOOL FaxGetDeviceStatus(           HANDLE FaxPortHandle, PFAX_DEVICE_STATUS* DeviceStatus);
  BOOL FaxGetPort(                   HANDLE FaxPortHandle, PFAX_PORT_INFO* PortInfo);
  BOOL FaxSetPort(                   HANDLE FaxPortHandle, FAX_PORT_INFO* PortInfo);
  BOOL FaxSendDocumentForBroadcast(  HANDLE FaxHandle, LPCTSTR FileName, LPDWORD FaxJobId, PFAX_RECIPIENT_CALLBACK FaxRecipientCallback, LPVOID Context);
  BOOL FaxPrintCoverPage(            FAX_CONTEXT_INFO* FaxContextInfo, FAX_COVERPAGE_INFO* CoverPageInfo);
  BOOL FaxStartPrintJob(             LPCTSTR PrinterName, FAX_PRINT_INFO* PrintInfo, LPDWORD FaxJobId, PFAX_CONTEXT_INFO FaxContextInfo);
  BOOL FaxAbort(                     HANDLE FaxHandle, DWORD JobId);
  BOOL FaxEnumJobs(                  HANDLE FaxHandle, PFAX_JOB_ENTRY* JobEntry, LPDWORD JobsReturned);
  BOOL FaxGetJob(                    HANDLE FaxHandle, DWORD JobId, PFAX_JOB_ENTRY* JobEntry);
  BOOL FaxSetJob(                    HANDLE FaxHandle, DWORD JobId, DWORD Command, FAX_JOB_ENTRY* JobEntry);
  BOOL FaxAccessCheck(               HANDLE FaxHandle, DWORD AccessMask);
  BOOL FaxCompleteJobParams(         PFAX_JOB_PARAM* JobParams, PFAX_COVERPAGE_INFO* CoverpageInfo);
  void FaxFreeBuffer(                LPVOID Buffer);
  BOOL FaxRegisterRoutingExtensionW( HANDLE FaxHandle, LPCWSTR ExtensionName, LPCWSTR FriendlyName, LPCWSTR ImageName, PFAX_ROUTING_INSTALLATION_CALLBACK CallBack, LPVOID Context);
  BOOL FaxRegisterServiceProviderW(  LPCWSTR DeviceProvider, LPCWSTR FriendlyName, LPCWSTR ImageName, LPCWSTR TspName);
  BOOL FaxClose(                     HANDLE FaxHandle);
  BOOL FaxConnectFaxServer(          LPCTSTR MachineName, LPHANDLE FaxHandle);
  BOOL FaxEnableRoutingMethod(       HANDLE FaxPortHandle, LPCTSTR RoutingGuid, BOOL Enabled);
  BOOL FaxEnumGlobalRoutingInfo(     HANDLE FaxHandle, PFAX_GLOBAL_ROUTING_INFO* RoutingInfo, LPDWORD MethodsReturned);
  BOOL FaxEnumPorts(                 HANDLE FaxHandle, PFAX_PORT_INFO* PortInfo, LPDWORD PortsReturned);
  BOOL FaxEnumRoutingMethods(        HANDLE FaxPortHandle, PFAX_ROUTING_METHOD* RoutingMethod, LPDWORD MethodsReturned);
  BOOL FaxGetLoggingCategories(      HANDLE FaxHandle, PFAX_LOG_CATEGORY* Categories, LPDWORD NumberCategories);
  BOOL FaxGetPageData(               HANDLE FaxHandle, DWORD JobId, LPBYTE* Buffer, LPDWORD BufferSize, LPDWORD ImageWidth, LPDWORD ImageHeight);
  BOOL FaxGetRoutingInfo(            HANDLE FaxPortHandle, LPCTSTR RoutingGuid, LPBYTE* RoutingInfoBuffer, LPDWORD RoutingInfoBufferSize);
  BOOL FaxInitializeEventQueue(      HANDLE FaxHandle, HANDLE CompletionPort, ULONG_PTR CompletionKey, HWND hWnd, UINT MessageStart);
  BOOL FaxSendDocument(              HANDLE FaxHandle, LPCTSTR FileName, PFAX_JOB_PARAM JobParams, FAX_COVERPAGE_INFO* CoverpageInfo, LPDWORD FaxJobId);
  BOOL FaxSetRoutingInfo(            HANDLE FaxPortHandle, LPCTSTR RoutingGuid, BYTE* RoutingInfoBuffer, DWORD RoutingInfoBufferSize);
]]
return ffi.load( "FxsApi.dll" )

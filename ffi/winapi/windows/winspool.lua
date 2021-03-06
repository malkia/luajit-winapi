require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/registry' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IPrintAsyncNotifyCallback; //Interface
  typedef void* IPrintAsyncNotifyChannel; //Interface
  typedef LPVOID PCORE_PRINTER_DRIVER; //Alias
  typedef WORD WINAPI_PrinterNotifyType; //Alias
  typedef struct WINAPI_PRINTER_NOTIFY_INFO_DATA_u_s {
    DWORD cbBuf;
    LPVOID pBuf;
  } WINAPI_PRINTER_NOTIFY_INFO_DATA_u_s;
  typedef union WINAPI_PRINTER_NOTIFY_INFO_DATA_u {
    DWORD adwData[2];
    WINAPI_PRINTER_NOTIFY_INFO_DATA_u_s Data;
  } WINAPI_PRINTER_NOTIFY_INFO_DATA_u;
  typedef struct PRINTER_NOTIFY_INFO_DATA {
    WINAPI_PrinterNotifyType Type;
    WORD Field;
    DWORD Reserved;
    DWORD Id;
    WINAPI_PRINTER_NOTIFY_INFO_DATA_u NotifyData;
  } PRINTER_NOTIFY_INFO_DATA;
  typedef DWORD WINAPI_PRINTER_NOTIFY_INFO_FLAGS; //Alias
  typedef struct PRINTER_NOTIFY_INFO {
    DWORD Version;
    WINAPI_PRINTER_NOTIFY_INFO_FLAGS Flags;
    DWORD Count;
    PRINTER_NOTIFY_INFO_DATA aData[1];
  } PRINTER_NOTIFY_INFO;
  typedef PRINTER_NOTIFY_INFO *PPRINTER_NOTIFY_INFO; //Pointer
  typedef DWORD PRINTER_OPTION_FLAGS; //Alias
  typedef struct PRINTER_OPTIONS {
    UINT cbSize;
    PRINTER_OPTION_FLAGS dwFlags;
  } PRINTER_OPTIONS;
  typedef PRINTER_OPTIONS *PPRINTER_OPTIONS; //Pointer
  typedef ACCESS_MASK WINAPI_PRINTER_ACCESS_MASK; //Alias
  typedef struct PRINTER_DEFAULTS {
    LPTSTR pDatatype;
    LPDEVMODE pDevMode;
    WINAPI_PRINTER_ACCESS_MASK DesiredAccess;
  } PRINTER_DEFAULTS;
  typedef PRINTER_DEFAULTS *LPPRINTER_DEFAULTS; //Pointer
  typedef WORD WINAPI_DeviceCapability; //Alias
  static const WINAPI_DeviceCapability DC_FIELDS = 1;
  static const WINAPI_DeviceCapability DC_PAPERS = 2;
  static const WINAPI_DeviceCapability DC_PAPERSIZE = 3;
  static const WINAPI_DeviceCapability DC_MINEXTENT = 4;
  static const WINAPI_DeviceCapability DC_MAXEXTENT = 5;
  static const WINAPI_DeviceCapability DC_BINS = 6;
  static const WINAPI_DeviceCapability DC_DUPLEX = 7;
  static const WINAPI_DeviceCapability DC_SIZE = 8;
  static const WINAPI_DeviceCapability DC_EXTRA = 9;
  static const WINAPI_DeviceCapability DC_VERSION = 10;
  static const WINAPI_DeviceCapability DC_DRIVER = 11;
  static const WINAPI_DeviceCapability DC_BINNAMES = 12;
  static const WINAPI_DeviceCapability DC_ENUMRESOLUTIONS = 13;
  static const WINAPI_DeviceCapability DC_FILEDEPENDENCIES = 14;
  static const WINAPI_DeviceCapability DC_TRUETYPE = 15;
  static const WINAPI_DeviceCapability DC_PAPERNAMES = 16;
  static const WINAPI_DeviceCapability DC_ORIENTATION = 17;
  static const WINAPI_DeviceCapability DC_COPIES = 18;
  static const WINAPI_DeviceCapability DC_BINADJUST = 19;
  static const WINAPI_DeviceCapability DC_EMF_COMPLIANT = 20;
  static const WINAPI_DeviceCapability DC_DATATYPE_PRODUCED = 21;
  static const WINAPI_DeviceCapability DC_COLLATE = 22;
  static const WINAPI_DeviceCapability DC_MANUFACTURER = 23;
  static const WINAPI_DeviceCapability DC_MODEL = 24;
  static const WINAPI_DeviceCapability DC_PERSONALITY = 25;
  static const WINAPI_DeviceCapability DC_PRINTRATE = 26;
  static const WINAPI_DeviceCapability DC_PRINTRATEUNIT = 27;
  static const WINAPI_DeviceCapability DC_PRINTERMEM = 28;
  static const WINAPI_DeviceCapability DC_MEDIAREADY = 29;
  static const WINAPI_DeviceCapability DC_STAPLE = 30;
  static const WINAPI_DeviceCapability DC_PRINTRATEPPM = 31;
  static const WINAPI_DeviceCapability DC_COLORDEVICE = 32;
  static const WINAPI_DeviceCapability DC_NUP = 33;
  static const WINAPI_DeviceCapability DC_MEDIATYPENAMES = 34;
  static const WINAPI_DeviceCapability DC_MEDIATYPES = 35;
  typedef DWORD WINAPI_EnumPrintersFlags; //Alias
  typedef DWORD WINAPI_DocumentMode; //Alias
  typedef DWORD WINAPI_PrinterChangeFlags; //Alias
  typedef DWORD WINAPI_JobControl; //Alias
  static const WINAPI_JobControl JOB_CONTROL_PAUSE = 1;
  static const WINAPI_JobControl JOB_CONTROL_RESUME = 2;
  static const WINAPI_JobControl JOB_CONTROL_CANCEL = 3;
  static const WINAPI_JobControl JOB_CONTROL_RESTART = 4;
  static const WINAPI_JobControl JOB_CONTROL_DELETE = 5;
  static const WINAPI_JobControl JOB_CONTROL_SENT_TO_PRINTER = 6;
  static const WINAPI_JobControl JOB_CONTROL_LAST_PAGE_EJECTED = 7;
  static const WINAPI_JobControl JOB_CONTROL_RETAIN = 8;
  static const WINAPI_JobControl JOB_CONTROL_RELEASE = 9;
  typedef DWORD WINAPI_PrinterControl; //Alias
  static const WINAPI_PrinterControl PRINTER_CONTROL_PAUSE = 1;
  static const WINAPI_PrinterControl PRINTER_CONTROL_RESUME = 2;
  static const WINAPI_PrinterControl PRINTER_CONTROL_PURGE = 3;
  static const WINAPI_PrinterControl PRINTER_CONTROL_SET_STATUS = 4;
  typedef UINT EPrintXPSJobOperation; //Alias
  static const EPrintXPSJobOperation kJobProduction = 1;
  static const EPrintXPSJobOperation kJobConsumption = 2;
  typedef UINT EPrintXPSJobProgress; //Alias
  static const EPrintXPSJobProgress kAddingDocumentSequence = 0;
  static const EPrintXPSJobProgress kDocumentSequenceAdded = 1;
  static const EPrintXPSJobProgress kAddingFixedDocument = 2;
  static const EPrintXPSJobProgress kFixedDocumentAdded = 3;
  static const EPrintXPSJobProgress kAddingFixedPage = 4;
  static const EPrintXPSJobProgress kFixedPageAdded = 5;
  static const EPrintXPSJobProgress kResourceAdded = 6;
  static const EPrintXPSJobProgress kFontAdded = 7;
  static const EPrintXPSJobProgress kImageAdded = 8;
  static const EPrintXPSJobProgress kXpsDocumentCommitted = 9;
  typedef UINT PrintAsyncNotifyUserFilter; //Alias
  static const PrintAsyncNotifyUserFilter kPerUser = 0;
  static const PrintAsyncNotifyUserFilter kAllUsers = 1;
  typedef UINT PrintAsyncNotifyConversationStyle; //Alias
  static const PrintAsyncNotifyConversationStyle kBiDirectional = 0;
  static const PrintAsyncNotifyConversationStyle kUniDirectional = 1;
  typedef struct PRINTER_NOTIFY_OPTIONS_TYPE {
    WINAPI_PrinterNotifyType Type;
    WORD Reserved0;
    DWORD Reserved1;
    DWORD Reserved2;
    DWORD Count;
    PWORD pFields;
  } PRINTER_NOTIFY_OPTIONS_TYPE;
  typedef PRINTER_NOTIFY_OPTIONS_TYPE *PPRINTER_NOTIFY_OPTIONS_TYPE; //Pointer
  typedef DWORD WINAPI_PrinterNotifyFlags; //Alias
  typedef struct PRINTER_NOTIFY_OPTIONS {
    DWORD Version;
    WINAPI_PrinterNotifyFlags Flags;
    DWORD Count;
    PPRINTER_NOTIFY_OPTIONS_TYPE pTypes;
  } PRINTER_NOTIFY_OPTIONS;
  typedef PRINTER_NOTIFY_OPTIONS *PPRINTER_NOTIFY_OPTIONS; //Pointer
  BOOL              AddJob(                               HANDLE hPrinter, DWORD Level, LPBYTE pData, DWORD cbBuf, LPDWORD pcbNeeded);
  BOOL              AddMonitor(                           LPTSTR pName, DWORD Level, LPBYTE pMonitors);
  HANDLE            AddPrinter(                           LPTSTR* pName, DWORD Level, LPBYTE pPrinter);
  BOOL              AddPrinterConnection(                 LPTSTR pName);
  BOOL              AddPrinterConnection2(                HWND hWnd, LPCTSTR pszName, DWORD dwLevel, PVOID pConnectionInfo);
  BOOL              AddPrinterDriver(                     LPTSTR pName, DWORD Level, LPBYTE pDriverInfo);
  BOOL              AddPrinterDriverEx(                   LPTSTR pName, DWORD Level, LPBYTE pDriverInfo, DWORD dwFileCopyFlags);
  BOOL              AddPrintProcessor(                    LPTSTR pName, LPTSTR pEnvironment, LPTSTR pPathName, LPTSTR pPrintProcessorName);
  BOOL              AddPrintProvidor(                     LPTSTR pName, DWORD Level, LPBYTE pProviderInfo);
  BOOL              ConfigurePort(                        LPTSTR pName, HWND hWnd, LPTSTR pPortName);
  BOOL              DeleteForm(                           HANDLE hPrinter, LPTSTR pFormName);
  BOOL              DeleteMonitor(                        LPTSTR pName, LPTSTR pEnvironment, LPTSTR pMonitorName);
  BOOL              DeletePort(                           LPTSTR pName, HWND hWnd, LPTSTR pPortName);
  BOOL              DeletePrinterConnection(              LPTSTR pName);
  WINAPI_ERROR_CODE DeletePrinterData(                    HANDLE hPrinter, LPTSTR pValueName);
  WINAPI_ERROR_CODE DeletePrinterDataEx(                  HANDLE hPrinter, LPCTSTR pKeyName, LPCTSTR pValueName);
  BOOL              DeletePrinterDriver(                  LPTSTR pName, LPTSTR pEnvironment, LPTSTR pDriverName);
  BOOL              DeletePrinterDriverEx(                LPTSTR pName, LPTSTR pEnvironment, LPTSTR pDriverName, DWORD dwDeleteFlag, DWORD dwVersionFlag);
  WINAPI_ERROR_CODE DeletePrinterKey(                     HANDLE hPrinter, LPCTSTR pKeyName);
  BOOL              DeletePrintProcessor(                 LPTSTR pName, LPTSTR pEnvironment, LPTSTR pPrintProcessorName);
  BOOL              DeletePrintProvidor(                  LPTSTR pName, LPTSTR pEnvironment, LPTSTR pPrintProviderName);
  BOOL              EnumForms(                            HANDLE hPrinter, DWORD Level, LPBYTE pForm, DWORD cbBuf, LPDWORD pcbNeeded, LPDWORD pcReturned);
  BOOL              EnumJobs(                             HANDLE hPrinter, DWORD FirstJob, DWORD NoJobs, DWORD Level, LPBYTE pJob, DWORD cbBuf, LPDWORD pcbNeeded, LPDWORD pcReturned);
  BOOL              EnumMonitors(                         LPTSTR pName, DWORD Level, LPBYTE pMonitors, DWORD cbBuf, LPDWORD pcbNeeded, LPDWORD pcReturned);
  BOOL              EnumPorts(                            LPTSTR pName, DWORD Level, LPBYTE pPorts, DWORD cbBuf, LPDWORD pcbNeeded, LPDWORD pcReturned);
  WINAPI_ERROR_CODE EnumPrinterData(                      HANDLE hPrinter, DWORD dwIndex, LPTSTR pValueName, DWORD cbValueName, LPDWORD pcbValueName, LPDWORD pType, LPBYTE pData, DWORD cbData, LPDWORD pcbData);
  WINAPI_ERROR_CODE EnumPrinterDataEx(                    HANDLE hPrinter, LPCTSTR pKeyName, LPBYTE pEnumValues, DWORD cbEnumValues, LPDWORD pcbEnumValues, LPDWORD pnEnumValues);
  BOOL              EnumPrinterDrivers(                   LPTSTR pName, LPTSTR pEnvironment, DWORD Level, LPBYTE pDriverInfo, DWORD cbBuf, LPDWORD pcbNeeded, LPDWORD pcReturned);
  WINAPI_ERROR_CODE EnumPrinterKey(                       HANDLE hPrinter, LPCTSTR pKeyName, LPTSTR pSubkey, DWORD cbSubkey, LPDWORD pcbSubkey);
  BOOL              EnumPrinters(                         WINAPI_EnumPrintersFlags Flags, LPTSTR Name, DWORD Level, LPBYTE pPrinterEnum, DWORD cbBuf, LPDWORD pcbNeeded, LPDWORD pcReturned);
  BOOL              EnumPrintProcessorDatatypes(          LPTSTR pName, LPTSTR pPrintProcessorName, DWORD Level, LPBYTE pDatatypes, DWORD cbBuf, LPDWORD pcbNeeded, LPDWORD pcReturned);
  BOOL              EnumPrintProcessors(                  LPTSTR pName, LPTSTR pEnvironment, DWORD Level, LPBYTE pPrintProcessorInfo, DWORD cbBuf, LPDWORD pcbNeeded, LPDWORD pcReturned);
  BOOL              FlushPrinter(                         HANDLE hPrinter, LPVOID pBuf, DWORD cbBuf, LPDWORD pcWritten, DWORD cSleep);
  BOOL              GetForm(                              HANDLE hPrinter, LPTSTR pFormName, DWORD Level, LPBYTE pForm, DWORD cbBuf, LPDWORD pcbNeeded);
  BOOL              GetJob(                               HANDLE hPrinter, DWORD JobId, DWORD Level, LPBYTE pJob, DWORD cbBuf, LPDWORD pcbNeeded);
  BOOL              GetPrinter(                           HANDLE hPrinter, DWORD Level, LPBYTE pPrinter, DWORD cbBuf, LPDWORD pcbNeeded);
  WINAPI_ERROR_CODE GetPrinterData(                       HANDLE hPrinter, LPTSTR pValueName, WINAPI_RegType* pType, LPBYTE pData, DWORD nSize, LPDWORD pcbNeeded);
  WINAPI_ERROR_CODE GetPrinterDataEx(                     HANDLE hPrinter, LPCTSTR pKeyName, LPCTSTR pValueName, WINAPI_RegType* pType, LPBYTE pData, DWORD nSize, LPDWORD pcbNeeded);
  BOOL              GetPrinterDriver(                     HANDLE hPrinter, LPTSTR pEnvironment, DWORD Level, LPBYTE pDriverInfo, DWORD cbBuf, LPDWORD pcbNeeded);
  BOOL              GetPrinterDriverDirectory(            LPTSTR pName, LPTSTR pEnvironment, DWORD Level, LPWSTR pDriverDirectory, DWORD cbBuf, LPDWORD pcbNeeded);
  BOOL              GetPrintProcessorDirectory(           LPTSTR pName, LPTSTR pEnvironment, DWORD Level, LPBYTE pPrintProcessorInfo, DWORD cbBuf, LPDWORD pcbNeeded);
  BOOL              OpenPrinter(                          LPTSTR pPrinterName, LPHANDLE phPrinter, LPPRINTER_DEFAULTS pDefault);
  BOOL              ResetPrinter(                         HANDLE hPrinter, LPPRINTER_DEFAULTS pDefault);
  DWORD             StartDocPrinter(                      HANDLE hPrinter, DWORD Level, LPBYTE pDocInfo);
  BOOL              SetForm(                              HANDLE hPrinter, LPTSTR pFormName, DWORD Level, LPTSTR pForm);
  BOOL              SetJob(                               HANDLE hPrinter, DWORD JobId, DWORD Level, LPBYTE pJob, WINAPI_JobControl Command);
  BOOL              SetPort(                              LPTSTR pName, LPTSTR pPortName, DWORD dwLevel, LPBYTE pPortInfo);
  BOOL              SetPrinter(                           HANDLE hPrinter, DWORD Level, LPBYTE pPrinter, WINAPI_PrinterControl Command);
  WINAPI_ERROR_CODE SetPrinterData(                       HANDLE hPrinter, LPTSTR pValueName, WINAPI_RegType Type, LPBYTE pData, DWORD cbData);
  WINAPI_ERROR_CODE SetPrinterDataEx(                     HANDLE hPrinter, LPCTSTR pKeyName, LPCTSTR pValueName, WINAPI_RegType Type, LPBYTE pData, DWORD cbData);
  DWORD             DeviceCapabilities(                   LPCTSTR pDevice, LPCTSTR pPort, WINAPI_DeviceCapability fwCapability, LPTSTR pOutput, const DEVMODE* pDevMode);
  HRESULT           CorePrinterDriverInstalled(           LPCTSTR pszServer, LPCTSTR pszEnvironment, GUID CoreDriverGUID, FILETIME ftDriverDate, DWORDLONG dwlDriverVersion, BOOL* pbDriverInstalled);
  HRESULT           DeletePrinterDriverPackage(           LPCTSTR pszServer, LPCTSTR pszInfPath, LPCTSTR pszEnvironment);
  HRESULT           GetCorePrinterDrivers(                LPCTSTR pszServer, LPCTSTR pszEnvironment, LPCTSTR pszzCoreDriverDependencies, DWORD cCorePrinterDrivers, PCORE_PRINTER_DRIVER pCorePrinterDrivers);
  HRESULT           GetPrinterDriverPackagePath(          LPCTSTR pszServer, LPCTSTR pszEnvironment, LPCTSTR pszLanguage, LPCTSTR pszPackageID, LPTSTR pszDriverPackageCab, DWORD cchDriverPackageCab, LPDWORD pcchRequiredSize);
  HRESULT           InstallPrinterDriverFromPackage(      LPCTSTR pszServer, LPCTSTR pszInfPath, LPCTSTR pszDriverName, LPCTSTR pszEnvironment, DWORD dwFlags);
  HRESULT           UploadPrinterDriverPackage(           LPCTSTR pszServer, LPCTSTR pszInfPath, LPCTSTR pszEnvironment, DWORD dwFlags, HWND hwnd, LPTSTR pszDestInfPath, PULONG pcchDestInfPath);
  BOOL              AbortPrinter(                         HANDLE hPrinter);
  BOOL              AddForm(                              HANDLE hPrinter, DWORD Level, LPBYTE pForm);
  BOOL              AddPort(                              LPTSTR pName, HWND hWnd, LPTSTR pMonitorName);
  LONG              AdvancedDocumentProperties(           HWND hWnd, HANDLE hPrinter, LPTSTR pDeviceName, PDEVMODE pDevModeOutput, PDEVMODE pDevModeInput);
  BOOL              ClosePrinter(                         HANDLE hPrinter);
  HANDLE            ConnectToPrinterDlg(                  HWND hwnd, DWORD Flags);
  HRESULT           CreatePrintAsyncNotifyChannel(        LPCWSTR pName, PrintAsyncNotificationType* pSchema, PrintAsyncNotifyUserFilter filter, PrintAsyncNotifyConversationStyle directionality, IPrintAsyncNotifyCallback* pCallback, IPrintAsyncNotifyChannel** ppChannel);
  BOOL              DeletePrinter(                        HANDLE hPrinter);
  LONG              DocumentProperties(                   HWND hWnd, HANDLE hPrinter, LPTSTR pDeviceName, PDEVMODE pDevModeOutput, PDEVMODE pDevModeInput, WINAPI_DocumentMode fMode);
  BOOL              EndDocPrinter(                        HANDLE hPrinter);
  BOOL              EndPagePrinter(                       HANDLE hPrinter);
  BOOL              FindClosePrinterChangeNotification(   HANDLE hChange);
  HANDLE            FindFirstPrinterChangeNotification(   HANDLE hPrinter, WINAPI_PrinterChangeFlags fdwFilter, DWORD fdwOptions, PPRINTER_NOTIFY_OPTIONS pPrinterNotifyOptions);
  BOOL              FindNextPrinterChangeNotification(    HANDLE hChange, WINAPI_PrinterChangeFlags* pdwChange, PPRINTER_NOTIFY_OPTIONS pPrinterNotifyOptions, LPVOID* ppPrinterNotifyInfo);
  BOOL              FreePrinterNotifyInfo(                PPRINTER_NOTIFY_INFO pPrinterNotifyInfo);
  BOOL              GetDefaultPrinter(                    LPTSTR pszBuffer, LPDWORD pcchBuffer);
  BOOL              GetPrinterDriver2(                    HWND hWnd, HANDLE hPrinter, LPTSTR pEnvironment, DWORD Level, LPBYTE pDriverInfo, DWORD cbBuf, LPDWORD pcbNeeded);
  BOOL              OpenPrinter2(                         LPCTSTR pPrinterName, LPHANDLE phPrinter, LPPRINTER_DEFAULTS pDefault, PPRINTER_OPTIONS pOptions);
  BOOL              PrinterProperties(                    HWND hWnd, HANDLE hPrinter);
  BOOL              ReadPrinter(                          HANDLE hPrinter, LPVOID pBuf, DWORD cbBuf, LPDWORD pNoBytesRead);
  HRESULT           RegisterForPrintAsyncNotifications(   LPCWSTR pName, PrintAsyncNotificationType* pSchema, PrintAsyncNotifyUserFilter filter, PrintAsyncNotifyConversationStyle directionality, IPrintAsyncNotifyCallback* pCallback, HANDLE* pRegistrationHandler);
  HRESULT           ReportJobProcessingProgress(          HANDLE printerHandle, ULONG jobId, EPrintXPSJobOperation jobOperation, EPrintXPSJobProgress jobProgress);
  BOOL              ScheduleJob(                          HANDLE hPrinter, DWORD dwJobID);
  BOOL              SetDefaultPrinter(                    LPCTSTR pszPrinter);
  BOOL              StartPagePrinter(                     HANDLE hPrinter);
  HRESULT           UnRegisterForPrintAsyncNotifications( HANDLE hRegistrationHandler);
  BOOL              WritePrinter(                         HANDLE hPrinter, LPVOID pBuf, DWORD cbBuf, LPDWORD pcWritten);
]]
return ffi.load( 'Winspool.drv' )

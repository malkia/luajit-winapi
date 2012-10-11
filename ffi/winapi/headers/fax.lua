require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PFAX_RECIPIENT_CALLBACK; //Alias
  typedef LPVOID PFAX_ROUTING_INSTALLATION_CALLBACK; //Alias
  typedef DWORD HCALL; //Alias
  enum { MAX_COMPUTERNAME_LENGTH_plus_1 = 16 };
  typedef struct FAX_CONTEXT_INFO {
    DWORD SizeOfStruct;
    HDC hDC;
    TCHAR ServerName[MAX_COMPUTERNAME_LENGTH_plus_1];
  } FAX_CONTEXT_INFO;
  typedef FAX_CONTEXT_INFO *PFAX_CONTEXT_INFO; //Pointer
  typedef struct FAX_JOB_PARAM {
    DWORD SizeOfStruct;
    LPCTSTR RecipientNumber;
    LPCTSTR RecipientName;
    LPCTSTR Tsid;
    LPCTSTR SenderName;
    LPCTSTR SenderCompany;
    LPCTSTR SenderDept;
    LPCTSTR BillingCode;
    DWORD ScheduleAction;
    SYSTEMTIME ScheduleTime;
    DWORD DeliveryReportType;
    LPCTSTR DeliveryReportAddress;
    LPCTSTR DocumentName;
    HCALL CallHandle;
    DWORD_PTR Reserved[3];
  } FAX_JOB_PARAM;
  typedef FAX_JOB_PARAM *PFAX_JOB_PARAM; //Pointer
  typedef struct FAX_TIME {
    WORD Hour;
    WORD Minute;
  } FAX_TIME;
  typedef struct FAX_CONFIGURATION {
    DWORD SizeOfStruct;
    DWORD Retries;
    DWORD RetryDelay;
    DWORD DirtyDays;
    BOOL Branding;
    BOOL UseDeviceTsid;
    BOOL ServerCp;
    BOOL PauseServerQueue;
    FAX_TIME StartCheapTime;
    FAX_TIME StopCheapTime;
    BOOL ArchiveOutgoingFaxes;
    LPCTSTR ArchiveDirectory;
    LPCTSTR Reserved;
  } FAX_CONFIGURATION;
  typedef FAX_CONFIGURATION *PFAX_CONFIGURATION; //Pointer
  typedef struct FAX_GLOBAL_ROUTING_INFO {
    DWORD SizeOfStruct;
    DWORD Priority;
    LPCTSTR Guid;
    LPCTSTR FriendlyName;
    LPCTSTR FunctionName;
    LPCTSTR ExtensionImageName;
    LPCTSTR ExtensionFriendlyName;
  } FAX_GLOBAL_ROUTING_INFO;
  typedef FAX_GLOBAL_ROUTING_INFO *PFAX_GLOBAL_ROUTING_INFO; //Pointer
  typedef DWORD FaxLogCategory; //Alias
  static const FaxLogCategory FAXLOG_CATEGORY_INIT = 0;
  static const FaxLogCategory FAXLOG_CATEGORY_OUTBOUND = 1;
  static const FaxLogCategory FAXLOG_CATEGORY_INBOUND = 2;
  static const FaxLogCategory FAXLOG_CATEGORY_UNKNOWN = 3;
  typedef DWORD FaxLogLevel; //Alias
  static const FaxLogLevel FAXLOG_LEVEL_NONE = 0;
  static const FaxLogLevel FAXLOG_LEVEL_MIN = 1;
  static const FaxLogLevel FAXLOG_LEVEL_MED = 2;
  static const FaxLogLevel FAXLOG_LEVEL_MAX = 3;
  typedef struct FAX_LOG_CATEGORY {
    LPCTSTR Name;
    FaxLogCategory Category;
    FaxLogLevel Level;
  } FAX_LOG_CATEGORY;
  typedef FAX_LOG_CATEGORY *PFAX_LOG_CATEGORY; //Pointer
  typedef struct FAX_DEVICE_STATUS {
    DWORD SizeOfStruct;
    LPCTSTR CallerId;
    LPCTSTR Csid;
    DWORD CurrentPage;
    DWORD DeviceId;
    LPCTSTR DeviceName;
    LPCTSTR DocumentName;
    DWORD JobType;
    LPCTSTR PhoneNumber;
    LPCTSTR RoutingString;
    LPCTSTR SenderName;
    LPCTSTR RecipientName;
    DWORD Size;
    FILETIME StartTime;
    DWORD Status;
    LPCTSTR StatusString;
    FILETIME SubmittedTime;
    DWORD TotalPages;
    LPCTSTR Tsid;
    LPCTSTR UserName;
  } FAX_DEVICE_STATUS;
  typedef FAX_DEVICE_STATUS *PFAX_DEVICE_STATUS; //Pointer
  typedef struct FAX_PORT_INFO {
    DWORD SizeOfStruct;
    DWORD DeviceId;
    DWORD State;
    DWORD Flags;
    DWORD Rings;
    DWORD Priority;
    LPCTSTR DeviceName;
    LPCTSTR Tsid;
    LPCTSTR Csid;
  } FAX_PORT_INFO;
  typedef FAX_PORT_INFO *PFAX_PORT_INFO; //Pointer
  typedef struct FAX_COVERPAGE_INFO {
    DWORD SizeOfStruct;
    LPCTSTR CoverPageName;
    BOOL UseServerCoverPage;
    LPCTSTR RecName;
    LPCTSTR RecFaxNumber;
    LPCTSTR RecCompany;
    LPCTSTR RecStreetAddress;
    LPCTSTR RecCity;
    LPCTSTR RecState;
    LPCTSTR RecZip;
    LPCTSTR RecCountry;
    LPCTSTR RecTitle;
    LPCTSTR RecDepartment;
    LPCTSTR RecOfficeLocation;
    LPCTSTR RecHomePhone;
    LPCTSTR RecOfficePhone;
    LPCTSTR SdrName;
    LPCTSTR SdrFaxNumber;
    LPCTSTR SdrCompany;
    LPCTSTR SdrAddress;
    LPCTSTR SdrTitle;
    LPCTSTR SdrDepartment;
    LPCTSTR SdrOfficeLocation;
    LPCTSTR SdrHomePhone;
    LPCTSTR SdrOfficePhone;
    LPCTSTR Note;
    LPCTSTR Subject;
    SYSTEMTIME TimeSent;
    DWORD PageCount;
  } FAX_COVERPAGE_INFO;
  typedef FAX_COVERPAGE_INFO *PFAX_COVERPAGE_INFO; //Pointer
  typedef struct FAX_PRINT_INFO {
    DWORD SizeOfStruct;
    LPCTSTR DocName;
    LPCTSTR RecipientName;
    LPCTSTR RecipientNumber;
    LPCTSTR SenderName;
    LPCTSTR SenderCompany;
    LPCTSTR SenderDept;
    LPCTSTR SenderBillingCode;
    LPCTSTR Reserved;
    LPCTSTR DrEmailAddress;
    LPCTSTR OutputFileName;
  } FAX_PRINT_INFO;
  typedef struct FAX_JOB_ENTRY {
    DWORD SizeOfStruct;
    DWORD JobId;
    LPCTSTR UserName;
    DWORD JobType;
    DWORD QueueStatus;
    DWORD Status;
    DWORD Size;
    DWORD PageCount;
    LPCTSTR RecipientNumber;
    LPCTSTR RecipientName;
    LPCTSTR Tsid;
    LPCTSTR SenderName;
    LPCTSTR SenderCompany;
    LPCTSTR SenderDept;
    LPCTSTR BillingCode;
    DWORD ScheduleAction;
    SYSTEMTIME ScheduleTime;
    DWORD DeliveryReportType;
    LPCTSTR DeliveryReportAddress;
    LPCTSTR DocumentName;
  } FAX_JOB_ENTRY;
  typedef FAX_JOB_ENTRY *PFAX_JOB_ENTRY; //Pointer
  typedef struct FAX_ROUTING_METHOD {
    DWORD SizeOfStruct;
    DWORD DeviceId;
    BOOL Enabled;
    LPCTSTR DeviceName;
    LPCTSTR Guid;
    LPCTSTR FriendlyName;
    LPCTSTR FunctionName;
    LPCTSTR ExtensionImageName;
    LPCTSTR ExtensionFriendlyName;
  } FAX_ROUTING_METHOD;
  typedef FAX_ROUTING_METHOD *PFAX_ROUTING_METHOD; //Pointer
]]

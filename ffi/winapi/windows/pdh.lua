require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PPDH_BROWSE_DLG_CONFIG; //Alias
  typedef HANDLE PDH_HQUERY; //Alias
  typedef HANDLE PDH_HCOUNTER; //Alias
  typedef HANDLE PDH_HLOG; //Alias
  typedef DWORD volatile DWORD; //Alias
  typedef DWORD WINAPI_PDH_LOG_TYPE; //Alias
  static const DWORD PDH_LOG_TYPE_UNDEFINED = 0;
  static const DWORD PDH_LOG_TYPE_CSV = 1;
  static const DWORD PDH_LOG_TYPE_TSV = 2;
  static const DWORD PDH_LOG_TYPE_TRACE_KERNEL = 4;
  static const DWORD PDH_LOG_TYPE_TRACE_GENERIC = 5;
  static const DWORD PDH_LOG_TYPE_PERFMON = 6;
  static const DWORD PDH_LOG_TYPE_SQL = 7;
  static const DWORD PDH_LOG_TYPE_BINARY = 8;
  typedef struct WINAPI_PDH_COUNTER_INFO_u_s {
    LPTSTR szMachineName;
    LPTSTR szObjectName;
    LPTSTR szInstanceName;
    LPTSTR szParentInstance;
    DWORD dwInstanceIndex;
    LPTSTR szCounterName;
  } WINAPI_PDH_COUNTER_INFO_u_s;
  typedef struct PDH_DATA_ITEM_PATH_ELEMENTS {
    LPTSTR szMachineName;
    GUID ObjectGUID;
    DWORD dwItemId;
    LPTSTR szInstanceName;
  } PDH_DATA_ITEM_PATH_ELEMENTS;
  typedef struct PDH_COUNTER_PATH_ELEMENTS {
    LPTSTR szMachineName;
    LPTSTR szObjectName;
    LPTSTR szInstanceName;
    LPTSTR szParentInstance;
    DWORD dwInstanceIndex;
    LPTSTR szCounterName;
  } PDH_COUNTER_PATH_ELEMENTS;
  typedef union WINAPI_PDH_COUNTER_INFO_u {
    PDH_DATA_ITEM_PATH_ELEMENTS DataItemPath;
    PDH_COUNTER_PATH_ELEMENTS CounterPath;
    WINAPI_PDH_COUNTER_INFO_u_s ;
  } WINAPI_PDH_COUNTER_INFO_u;
  typedef struct PDH_COUNTER_INFO {
    DWORD dwLength;
    DWORD dwType;
    DWORD CVersion;
    DWORD CStatus;
    LONG lScale;
    LONG lDefaultScale;
    DWORD_PTR dwUserData;
    DWORD_PTR dwQueryUserData;
    LPTSTR szFullPath;
    WINAPI_PDH_COUNTER_INFO_u ;
    LPTSTR szExplainText;
    DWORD DataBuffer[1];
  } PDH_COUNTER_INFO;
  typedef PDH_COUNTER_INFO *PPDH_COUNTER_INFO; //Pointer
  typedef union WINAPI_PDH_FMT_COUNTERVALUE_u {
    LONG longValue;
    double doubleValue;
    LONGLONG largeValue;
    LPCSTR AnsiStringValue;
    LPCWSTR WideStringValue;
  } WINAPI_PDH_FMT_COUNTERVALUE_u;
  typedef struct PDH_FMT_COUNTERVALUE {
    DWORD CStatus;
    WINAPI_PDH_FMT_COUNTERVALUE_u ;
  } PDH_FMT_COUNTERVALUE;
  typedef PDH_FMT_COUNTERVALUE *PPDH_FMT_COUNTERVALUE; //Pointer
  typedef struct PDH_FMT_COUNTERVALUE_ITEM {
    LPTSTR szName;
    PDH_FMT_COUNTERVALUE FmtValue;
  } PDH_FMT_COUNTERVALUE_ITEM;
  typedef PDH_FMT_COUNTERVALUE_ITEM *PPDH_FMT_COUNTERVALUE_ITEM; //Pointer
  typedef struct PDH_STATISTICS {
    DWORD dwFormat;
    DWORD count;
    PDH_FMT_COUNTERVALUE min;
    PDH_FMT_COUNTERVALUE max;
    PDH_FMT_COUNTERVALUE mean;
  } PDH_STATISTICS;
  typedef PDH_STATISTICS *PPDH_STATISTICS; //Pointer
  typedef struct PDH_RAW_COUNTER {
    volatile DWORD CStatus;
    FILETIME TimeStamp;
    LONGLONG FirstValue;
    LONGLONG SecondValue;
    DWORD MultiCount;
  } PDH_RAW_COUNTER;
  typedef PDH_RAW_COUNTER *PPDH_RAW_COUNTER; //Pointer
  typedef struct PDH_RAW_COUNTER_ITEM {
    LPTSTR szName;
    PDH_RAW_COUNTER RawValue;
  } PDH_RAW_COUNTER_ITEM;
  typedef PDH_RAW_COUNTER_ITEM *PPDH_RAW_COUNTER_ITEM; //Pointer
  typedef struct PDH_RAW_LOG_RECORD {
    DWORD dwStructureSize;
    WINAPI_PDH_LOG_TYPE dwRecordType;
    DWORD dwItems;
    UCHAR RawBytes[1];
  } PDH_RAW_LOG_RECORD;
  typedef PDH_RAW_LOG_RECORD *PPDH_RAW_LOG_RECORD; //Pointer
  typedef struct PDH_TIME_INFO {
    LONGLONG StartTime;
    LONGLONG EndTime;
    DWORD SampleCount;
  } PDH_TIME_INFO;
  typedef PDH_TIME_INFO *PPDH_TIME_INFO; //Pointer
  typedef LONG PDH_STATUS; //Alias
  static const LONG PDH_CSTATUS_VALID_DATA = 0x00000000;
  static const LONG PDH_CSTATUS_NEW_DATA = 0x00000001;
  static const LONG PDH_CSTATUS_NO_MACHINE = 0x800007D0;
  static const LONG PDH_CSTATUS_NO_INSTANCE = 0x800007D1;
  static const LONG PDH_MORE_DATA = 0x800007D2;
  static const LONG PDH_CSTATUS_ITEM_NOT_VALIDATED = 0x800007D3;
  static const LONG PDH_RETRY = 0x800007D4;
  static const LONG PDH_NO_DATA = 0x800007D5;
  static const LONG PDH_CALC_NEGATIVE_DENOMINATOR = 0x800007D6;
  static const LONG PDH_CALC_NEGATIVE_TIMEBASE = 0x800007D7;
  static const LONG PDH_CALC_NEGATIVE_VALUE = 0x800007D8;
  static const LONG PDH_DIALOG_CANCELLED = 0x800007D9;
  static const LONG PDH_END_OF_LOG_FILE = 0x800007DA;
  static const LONG PDH_ASYNC_QUERY_TIMEOUT = 0x800007DB;
  static const LONG PDH_CANNOT_SET_DEFAULT_REALTIME_DATASOURCE = 0x800007DC;
  static const LONG PDH_UNABLE_MAP_NAME_FILES = 0x80000BD5;
  static const LONG PDH_PLA_VALIDATION_WARNING = 0x80000BF3;
  static const LONG PDH_CSTATUS_NO_OBJECT = 0xC0000BB8;
  static const LONG PDH_CSTATUS_NO_COUNTER = 0xC0000BB9;
  static const LONG PDH_CSTATUS_INVALID_DATA = 0xC0000BBA;
  static const LONG PDH_MEMORY_ALLOCATION_FAILURE = 0xC0000BBB;
  static const LONG PDH_INVALID_HANDLE = 0xC0000BBC;
  static const LONG PDH_INVALID_ARGUMENT = 0xC0000BBD;
  static const LONG PDH_FUNCTION_NOT_FOUND = 0xC0000BBE;
  static const LONG PDH_CSTATUS_NO_COUNTERNAME = 0xC0000BBF;
  static const LONG PDH_CSTATUS_BAD_COUNTERNAME = 0xC0000BC0;
  static const LONG PDH_INVALID_BUFFER = 0xC0000BC1;
  static const LONG PDH_INSUFFICIENT_BUFFER = 0xC0000BC2;
  static const LONG PDH_CANNOT_CONNECT_MACHINE = 0xC0000BC3;
  static const LONG PDH_INVALID_PATH = 0xC0000BC4;
  static const LONG PDH_INVALID_INSTANCE = 0xC0000BC5;
  static const LONG PDH_INVALID_DATA = 0xC0000BC6;
  static const LONG PDH_NO_DIALOG_DATA = 0xC0000BC7;
  static const LONG PDH_CANNOT_READ_NAME_STRINGS = 0xC0000BC8;
  static const LONG PDH_LOG_FILE_CREATE_ERROR = 0xC0000BC9;
  static const LONG PDH_LOG_FILE_OPEN_ERROR = 0xC0000BCA;
  static const LONG PDH_LOG_TYPE_NOT_FOUND = 0xC0000BCB;
  static const LONG PDH_NO_MORE_DATA = 0xC0000BCC;
  static const LONG PDH_ENTRY_NOT_IN_LOG_FILE = 0xC0000BCD;
  static const LONG PDH_DATA_SOURCE_IS_LOG_FILE = 0xC0000BCE;
  static const LONG PDH_DATA_SOURCE_IS_REAL_TIME = 0xC0000BCF;
  static const LONG PDH_UNABLE_READ_LOG_HEADER = 0xC0000BD0;
  static const LONG PDH_FILE_NOT_FOUND = 0xC0000BD1;
  static const LONG PDH_FILE_ALREADY_EXISTS = 0xC0000BD2;
  static const LONG PDH_NOT_IMPLEMENTED = 0xC0000BD3;
  static const LONG PDH_STRING_NOT_FOUND = 0xC0000BD4;
  static const LONG PDH_UNKNOWN_LOG_FORMAT = 0xC0000BD6;
  static const LONG PDH_UNKNOWN_LOGSVC_COMMAND = 0xC0000BD7;
  static const LONG PDH_LOGSVC_QUERY_NOT_FOUND = 0xC0000BD8;
  static const LONG PDH_LOGSVC_NOT_OPENED = 0xC0000BD9;
  static const LONG PDH_WBEM_ERROR = 0xC0000BDA;
  static const LONG PDH_ACCESS_DENIED = 0xC0000BDB;
  static const LONG PDH_LOG_FILE_TOO_SMALL = 0xC0000BDC;
  static const LONG PDH_INVALID_DATASOURCE = 0xC0000BDD;
  static const LONG PDH_INVALID_SQLDB = 0xC0000BDE;
  static const LONG PDH_NO_COUNTERS = 0xC0000BDF;
  static const LONG PDH_SQL_ALLOC_FAILED = 0xC0000BE0;
  static const LONG PDH_SQL_ALLOCCON_FAILED = 0xC0000BE1;
  static const LONG PDH_SQL_EXEC_DIRECT_FAILED = 0xC0000BE2;
  static const LONG PDH_SQL_FETCH_FAILED = 0xC0000BE3;
  static const LONG PDH_SQL_ROWCOUNT_FAILED = 0xC0000BE4;
  static const LONG PDH_SQL_MORE_RESULTS_FAILED = 0xC0000BE5;
  static const LONG PDH_SQL_CONNECT_FAILED = 0xC0000BE6;
  static const LONG PDH_SQL_BIND_FAILED = 0xC0000BE7;
  static const LONG PDH_CANNOT_CONNECT_WMI_SERVER = 0xC0000BE8;
  static const LONG PDH_PLA_COLLECTION_ALREADY_RUNNING = 0xC0000BE9;
  static const LONG PDH_PLA_ERROR_SCHEDULE_OVERLAP = 0xC0000BEA;
  static const LONG PDH_PLA_COLLECTION_NOT_FOUND = 0xC0000BEB;
  static const LONG PDH_PLA_ERROR_SCHEDULE_ELAPSED = 0xC0000BEC;
  static const LONG PDH_PLA_ERROR_NOSTART = 0xC0000BED;
  static const LONG PDH_PLA_ERROR_ALREADY_EXISTS = 0xC0000BEE;
  static const LONG PDH_PLA_ERROR_TYPE_MISMATCH = 0xC0000BEF;
  static const LONG PDH_PLA_ERROR_FILEPATH = 0xC0000BF0;
  static const LONG PDH_PLA_SERVICE_ERROR = 0xC0000BF1;
  static const LONG PDH_PLA_VALIDATION_ERROR = 0xC0000BF2;
  static const LONG PDH_PLA_ERROR_NAME_TOO_LONG = 0xC0000BF4;
  static const LONG PDH_INVALID_SQL_LOG_FORMAT = 0xC0000BF5;
  static const LONG PDH_COUNTER_ALREADY_IN_QUERY = 0xC0000BF6;
  static const LONG PDH_BINARY_LOG_CORRUPT = 0xC0000BF7;
  static const LONG PDH_LOG_SAMPLE_TOO_SMALL = 0xC0000BF8;
  static const LONG PDH_OS_LATER_VERSION = 0xC0000BF9;
  static const LONG PDH_OS_EARLIER_VERSION = 0xC0000BFA;
  static const LONG PDH_INCORRECT_APPEND_TIME = 0xC0000BFB;
  static const LONG PDH_UNMATCHED_APPEND_COUNTER = 0xC0000BFC;
  static const LONG PDH_SQL_ALTER_DETAIL_FAILED = 0xC0000BFD;
  static const LONG PDH_QUERY_PERF_DATA_TIMEOUT = 0xC0000BFE;
  typedef DWORD WINAPI_PdhFormatFlags; //Alias
  typedef DWORD WINAPI_PerfDetailLevel; //Alias
  static const DWORD PERF_DETAIL_NOVICE = 100;
  static const DWORD PERF_DETAIL_ADVANCED = 200;
  static const DWORD PERF_DETAIL_EXPERT = 300;
  static const DWORD PERF_DETAIL_WIZARD = 400;
  typedef DWORD WINAPI_PdhExpandFlags; //Alias
  typedef DWORD WINAPI_PdhPathFlags; //Alias
  typedef DWORD WINAPI_PdhOpenLogFlags; //Alias
  PDH_STATUS PdhAddCounter(                   PDH_HQUERY hQuery, LPCTSTR szFullCounterPath, DWORD_PTR dwUserData, PDH_HCOUNTER* phCounter);
  PDH_STATUS PdhAddEnglishCounter(            PDH_HQUERY hQuery, LPCTSTR szFullCounterPath, DWORD_PTR dwUserData, PDH_HCOUNTER* phCounter);
  PDH_STATUS PdhBindInputDataSource(          PDH_HLOG* phDataSource, LPCTSTR szLogFileNameList);
  PDH_STATUS PdhBrowseCounters(               PPDH_BROWSE_DLG_CONFIG pBrowseDlgData);
  PDH_STATUS PdhBrowseCountersH(              PPDH_BROWSE_DLG_CONFIG pBrowseDlgData);
  PDH_STATUS PdhCalculateCounterFromRawValue( PDH_HCOUNTER hCounter, WINAPI_PdhFormatFlags dwFormat, PPDH_RAW_COUNTER rawValue1, PPDH_RAW_COUNTER rawValue2, PPDH_FMT_COUNTERVALUE fmtValue);
  PDH_STATUS PdhCloseLog(                     PDH_HLOG hLog, DWORD dwFlags);
  PDH_STATUS PdhCloseQuery(                   PDH_HQUERY hQuery);
  PDH_STATUS PdhCollectQueryData(             PDH_HQUERY hQuery);
  PDH_STATUS PdhCollectQueryDataEx(           PDH_HQUERY hQuery, DWORD dwIntervalTime, HANDLE hNewDataEvent);
  PDH_STATUS PdhCollectQueryDataWithTime(     PDH_HQUERY hQuery, LONGLONG* pllTimeStamp);
  PDH_STATUS PdhComputeCounterStatistics(     PDH_HCOUNTER hCounter, WINAPI_PdhFormatFlags dwFormat, DWORD dwFirstEntry, DWORD dwNumEntries, PPDH_RAW_COUNTER lpRawValueArray, PPDH_STATISTICS data);
  PDH_STATUS PdhConnectMachine(               LPCTSTR szMachineName);
  PDH_STATUS PdhEnumLogSetNames(              LPCTSTR szDataSource, LPTSTR mszLogSetNameList, LPDWORD pcchBufferLength);
  PDH_STATUS PdhEnumMachines(                 LPCTSTR szDataSource, LPTSTR mszMachineNameList, LPDWORD pcchBufferLength);
  PDH_STATUS PdhEnumMachinesH(                PDH_HLOG hDataSource, LPTSTR mszMachineNameList, LPDWORD pcchBufferLength);
  PDH_STATUS PdhEnumObjectItems(              LPCTSTR szDataSource, LPCTSTR szMachineName, LPCTSTR szObjectName, LPTSTR mszCounterList, LPDWORD pcchCounterListLength, LPTSTR mszInstanceList, LPDWORD pcchInstanceListLength, WINAPI_PerfDetailLevel dwDetailLevel, DWORD dwFlags);
  PDH_STATUS PdhEnumObjectItemsH(             PDH_HLOG hDataSource, LPCTSTR szMachineName, LPCTSTR szObjectName, LPTSTR mszCounterList, LPDWORD pcchCounterListLength, LPTSTR mszInstanceList, LPDWORD pcchInstanceListLength, WINAPI_PerfDetailLevel dwDetailLevel, DWORD dwFlags);
  PDH_STATUS PdhEnumObjects(                  LPCTSTR szDataSource, LPCTSTR szMachineName, LPTSTR mszObjectList, LPDWORD pcchBufferLength, WINAPI_PerfDetailLevel dwDetailLevel, BOOL bRefresh);
  PDH_STATUS PdhEnumObjectsH(                 PDH_HLOG hDataSource, LPCTSTR szMachineName, LPTSTR mszObjectList, LPDWORD pcchBufferLength, WINAPI_PerfDetailLevel dwDetailLevel, BOOL bRefresh);
  PDH_STATUS PdhExpandCounterPath(            LPCTSTR szWildCardPath, LPTSTR mszExpandedPathList, LPDWORD pcchPathListLength);
  PDH_STATUS PdhExpandWildCardPath(           LPCTSTR szDataSource, LPCTSTR szWildCardPath, LPTSTR mszExpandedPathList, LPDWORD pcchPathListLength, WINAPI_PdhExpandFlags dwFlags);
  PDH_STATUS PdhExpandWildCardPathH(          PDH_HLOG hDataSource, LPCTSTR szWildCardPath, LPTSTR mszExpandedPathList, LPDWORD pcchPathListLength, WINAPI_PdhExpandFlags dwFlags);
  PDH_STATUS PdhFormatFromRawValue(           DWORD dwCounterType, WINAPI_PdhFormatFlags dwFormat, LONGLONG* pTimeBase, PPDH_RAW_COUNTER rawValue1, PPDH_RAW_COUNTER rawValue2, PPDH_FMT_COUNTERVALUE fmtValue);
  PDH_STATUS PdhGetCounterInfo(               PDH_HCOUNTER hCounter, BOOLEAN bRetrieveExplainText, LPDWORD pdwBufferSize, PPDH_COUNTER_INFO lpBuffer);
  PDH_STATUS PdhGetCounterTimeBase(           PDH_HCOUNTER hCounter, LONGLONG* pTimeBase);
  PDH_STATUS PdhGetDataSourceTimeRange(       LPCTSTR szDataSource, LPDWORD pdwNumEntries, PPDH_TIME_INFO pInfo, LPDWORD pdwBufferSize);
  PDH_STATUS PdhGetDataSourceTimeRangeH(      PDH_HLOG hDataSource, LPDWORD pdwNumEntries, PPDH_TIME_INFO pInfo, LPDWORD pdwBufferSize);
  PDH_STATUS PdhGetDefaultPerfCounter(        LPCTSTR szDataSource, LPCTSTR szMachineName, LPCTSTR szObjectName, LPTSTR szDefaultCounterName, LPDWORD pcchBufferSize);
  PDH_STATUS PdhGetDefaultPerfCounterH(       PDH_HLOG hDataSource, LPCTSTR szMachineName, LPCTSTR szObjectName, LPTSTR szDefaultCounterName, LPDWORD pcchBufferSize);
  PDH_STATUS PdhGetDefaultPerfObject(         LPCTSTR szDataSource, LPCTSTR szMachineName, LPTSTR szDefaultObjectName, LPDWORD pcchBufferSize);
  PDH_STATUS PdhGetDefaultPerfObjectH(        PDH_HLOG hDataSource, LPCTSTR szMachineName, LPTSTR szDefaultObjectName, LPDWORD pcchBufferSize);
  PDH_STATUS PdhGetDllVersion(                LPDWORD lpdwVersion);
  PDH_STATUS PdhGetFormattedCounterArray(     PDH_HCOUNTER hCounter, WINAPI_PdhFormatFlags dwFormat, LPDWORD lpdwBufferSize, LPDWORD lpdwBufferCount, PPDH_FMT_COUNTERVALUE_ITEM ItemBuffer);
  PDH_STATUS PdhGetFormattedCounterValue(     PDH_HCOUNTER hCounter, WINAPI_PdhFormatFlags dwFormat, LPDWORD lpdwType, PPDH_FMT_COUNTERVALUE pValue);
  PDH_STATUS PdhGetLogFileSize(               PDH_HLOG hLog, LONGLONG* llSize);
  PDH_STATUS PdhGetRawCounterArray(           PDH_HCOUNTER hCounter, LPDWORD lpdwBufferSize, LPDWORD lpdwItemCount, PPDH_RAW_COUNTER_ITEM ItemBuffer);
  PDH_STATUS PdhGetRawCounterValue(           PDH_HCOUNTER hCounter, LPDWORD lpdwType, PPDH_RAW_COUNTER pValue);
  BOOL       PdhIsRealTimeQuery(              PDH_HQUERY hQuery);
  PDH_STATUS PdhLookupPerfIndexByName(        LPCTSTR szMachineName, LPCTSTR szNameBuffer, LPDWORD pdwIndex);
  PDH_STATUS PdhLookupPerfNameByIndex(        LPCTSTR szMachineName, DWORD dwNameIndex, LPTSTR szNameBuffer, LPDWORD pcchNameBufferSize);
  PDH_STATUS PdhMakeCounterPath(              PDH_COUNTER_PATH_ELEMENTS* pCounterPathElements, LPTSTR szFullPathBuffer, LPDWORD pcchBufferSize, WINAPI_PdhPathFlags dwFlags);
  PDH_STATUS PdhOpenLog(                      LPCTSTR szLogFileName, WINAPI_PdhOpenLogFlags dwAccessFlags, WINAPI_PDH_LOG_TYPE* lpdwLogType, PDH_HQUERY hQuery, DWORD dwMaxSize, LPCTSTR szUserCaption, PDH_HLOG* phLog);
  PDH_STATUS PdhOpenQuery(                    LPCTSTR szDataSource, DWORD_PTR dwUserData, PDH_HQUERY* phQuery);
  PDH_STATUS PdhOpenQueryH(                   PDH_HLOG hDataSource, DWORD_PTR dwUserData, PDH_HQUERY* phQuery);
  PDH_STATUS PdhParseCounterPath(             LPCTSTR szFullPathBuffer, PDH_COUNTER_PATH_ELEMENTS* pCounterPathElements, LPDWORD pdwBufferSize, DWORD dwFlags);
  PDH_STATUS PdhParseInstanceName(            LPCTSTR szInstanceString, LPTSTR szInstanceName, LPDWORD pcchInstanceNameLength, LPTSTR szParentName, LPDWORD pcchParentNameLength, LPDWORD lpIndex);
  PDH_STATUS PdhReadRawLogRecord(             PDH_HLOG hLog, FILETIME ftRecord, PPDH_RAW_LOG_RECORD pRawLogRecord, LPDWORD pdwBufferLength);
  PDH_STATUS PdhRemoveCounter(                PDH_HCOUNTER hCounter);
  PDH_STATUS PdhSelectDataSource(             HWND hWndOwner, DWORD dwFlags, LPTSTR szDataSource, LPDWORD pcchBufferLength);
  PDH_STATUS PdhSetCounterScaleFactor(        PDH_HCOUNTER hCounter, LONG lFactor);
  PDH_STATUS PdhSetDefaultRealTimeDataSource( DWORD dwDataSourceId);
  PDH_STATUS PdhSetQueryTimeRange(            PDH_HQUERY hQuery, PPDH_TIME_INFO pInfo);
  PDH_STATUS PdhUpdateLog(                    PDH_HLOG hLog, LPCTSTR szUserString);
  PDH_STATUS PdhUpdateLogFileCatalog(         PDH_HLOG hLog);
  PDH_STATUS PdhValidatePath(                 LPCTSTR szFullCounterPath);
  PDH_STATUS PdhValidatePathEx(               PDH_HLOG hDataSource, LPCTSTR szFullPathBuffer);
]]
return ffi.load( 'Pdh.dll' )

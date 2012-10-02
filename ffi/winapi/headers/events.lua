require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PEVENT_CALLBACK; //Alias
  typedef LPVOID PEVENT_TRACE_BUFFER_CALLBACK; //Alias
  typedef LPVOID PEVENT_RECORD_CALLBACK; //Alias
  typedef struct WINAPI_WNODE_HEADER_u1_s {
    ULONG Version;
    ULONG Linkage;
  } WINAPI_WNODE_HEADER_u1_s;
  typedef union WINAPI_WNODE_HEADER_u1 {
    ULONG64 HistoricalContext;
    WINAPI_WNODE_HEADER_u1_s ;
  } WINAPI_WNODE_HEADER_u1;
  typedef union WINAPI_WNODE_HEADER_u2 {
    ULONG CountLost;
    HANDLE KernelHandle;
    LARGE_INTEGER TimeStamp;
  } WINAPI_WNODE_HEADER_u2;
  typedef ULONG WINAPI_WNODE_HEADER_Flags; //Alias
  typedef struct WNODE_HEADER {
    ULONG BufferSize;
    ULONG ProviderId;
    WINAPI_WNODE_HEADER_u1 ;
    WINAPI_WNODE_HEADER_u2 ;
    GUID Guid;
    ULONG ClientContext;
    WINAPI_WNODE_HEADER_Flags Flags;
  } WNODE_HEADER;
  typedef ULONG WINAPI_EventLogFileMode; //Alias
  typedef ULONG WINAPI_EventEnableFlags; //Alias
  typedef struct EVENT_TRACE_PROPERTIES {
    WNODE_HEADER Wnode;
    ULONG BufferSize;
    ULONG MinimumBuffers;
    ULONG MaximumBuffers;
    ULONG MaximumFileSize;
    WINAPI_EventLogFileMode LogFileMode;
    ULONG FlushTimer;
    WINAPI_EventEnableFlags EnableFlags;
    LONG AgeLimit;
    ULONG NumberOfBuffers;
    ULONG FreeBuffers;
    ULONG EventsLost;
    ULONG BuffersWritten;
    ULONG LogBuffersLost;
    ULONG RealTimeBuffersLost;
    HANDLE LoggerThreadId;
    ULONG LogFileNameOffset;
    ULONG LoggerNameOffset;
  } EVENT_TRACE_PROPERTIES;
  typedef EVENT_TRACE_PROPERTIES *PEVENT_TRACE_PROPERTIES; //Pointer
  typedef struct WINAPI_EVENT_TRACE_HEADER_u1_s {
    UCHAR HeaderType;
    UCHAR MarkerFlags;
  } WINAPI_EVENT_TRACE_HEADER_u1_s;
  typedef union WINAPI_EVENT_TRACE_HEADER_u1 {
    USHORT FieldTypeFlags;
    WINAPI_EVENT_TRACE_HEADER_u1_s ;
  } WINAPI_EVENT_TRACE_HEADER_u1;
  typedef enum WINAPI_EVENT_TRACE_TYPE {
    EVENT_TRACE_TYPE_INFO = 0x00,
    EVENT_TRACE_TYPE_START = 0x01,
    EVENT_TRACE_TYPE_END = 0x02,
    EVENT_TRACE_TYPE_STOP = 0x02,
    EVENT_TRACE_TYPE_DC_START = 0x03,
    EVENT_TRACE_TYPE_DC_END = 0x04,
    EVENT_TRACE_TYPE_EXTENSION = 0x05,
    EVENT_TRACE_TYPE_REPLY = 0x06,
    EVENT_TRACE_TYPE_DEQUEUE = 0x07,
    EVENT_TRACE_TYPE_RESUME = 0x07,
    EVENT_TRACE_TYPE_CHECKPOINT = 0x08,
    EVENT_TRACE_TYPE_SUSPEND = 0x08,
    EVENT_TRACE_TYPE_WINEVT_SEND = 0x09,
    EVENT_TRACE_TYPE_WINEVT_RECEIVE = 0XF0,
  } WINAPI_EVENT_TRACE_TYPE;
  typedef enum WINAPI_TRACE_LEVEL {
    TRACE_LEVEL_NONE = 0,
    TRACE_LEVEL_FATAL = 1,
    TRACE_LEVEL_ERROR = 2,
    TRACE_LEVEL_WARNING = 3,
    TRACE_LEVEL_INFORMATION = 4,
    TRACE_LEVEL_VERBOSE = 5,
    TRACE_LEVEL_RESERVED6 = 6,
    TRACE_LEVEL_RESERVED7 = 7,
    TRACE_LEVEL_RESERVED8 = 8,
    TRACE_LEVEL_RESERVED9 = 9,
  } WINAPI_TRACE_LEVEL;
  typedef struct WINAPI_EVENT_TRACE_HEADER_u2_s {
    WINAPI_EVENT_TRACE_TYPE Type;
    WINAPI_TRACE_LEVEL Level;
    USHORT Version;
  } WINAPI_EVENT_TRACE_HEADER_u2_s;
  typedef union WINAPI_EVENT_TRACE_HEADER_u2 {
    ULONG Version;
    WINAPI_EVENT_TRACE_HEADER_u2_s Class;
  } WINAPI_EVENT_TRACE_HEADER_u2;
  typedef union WINAPI_EVENT_TRACE_HEADER_u3 {
    GUID Guid;
    ULONGLONG GuidPtr;
  } WINAPI_EVENT_TRACE_HEADER_u3;
  typedef struct WINAPI_EVENT_TRACE_HEADER_u4_s1 {
    ULONG KernelTime;
    ULONG UserTime;
  } WINAPI_EVENT_TRACE_HEADER_u4_s1;
  typedef struct WINAPI_EVENT_TRACE_HEADER_u4_s2 {
    ULONG ClientContext;
    WINAPI_WNODE_HEADER_Flags Flags;
  } WINAPI_EVENT_TRACE_HEADER_u4_s2;
  typedef union WINAPI_EVENT_TRACE_HEADER_u4 {
    WINAPI_EVENT_TRACE_HEADER_u4_s1 ;
    ULONG64 ProcessorTime;
    WINAPI_EVENT_TRACE_HEADER_u4_s2 ;
  } WINAPI_EVENT_TRACE_HEADER_u4;
  typedef struct EVENT_TRACE_HEADER {
    USHORT Size;
    WINAPI_EVENT_TRACE_HEADER_u1 ;
    WINAPI_EVENT_TRACE_HEADER_u2 ;
    ULONG ThreadId;
    ULONG ProcessId;
    LARGE_INTEGER TimeStamp;
    WINAPI_EVENT_TRACE_HEADER_u3 ;
    WINAPI_EVENT_TRACE_HEADER_u4 ;
  } EVENT_TRACE_HEADER;
  typedef EVENT_TRACE_HEADER *PEVENT_TRACE_HEADER; //Pointer
  typedef struct WINAPI_EVENT_INSTANCE_HEADER_u1_s {
    ULONG EventId;
    WINAPI_WNODE_HEADER_Flags Flags;
  } WINAPI_EVENT_INSTANCE_HEADER_u1_s;
  typedef union WINAPI_EVENT_INSTANCE_HEADER_u {
    WINAPI_EVENT_TRACE_HEADER_u4_s1 ;
    ULONG64 ProcessorTime;
    WINAPI_EVENT_INSTANCE_HEADER_u1_s ;
  } WINAPI_EVENT_INSTANCE_HEADER_u;
  typedef struct EVENT_INSTANCE_HEADER {
    USHORT Size;
    WINAPI_EVENT_TRACE_HEADER_u1 ;
    WINAPI_EVENT_TRACE_HEADER_u2 ;
    ULONG ThreadId;
    ULONG ProcessId;
    LARGE_INTEGER TimeStamp;
    ULONGLONG RegHandle;
    ULONG InstanceId;
    ULONG ParentInstanceId;
    WINAPI_EVENT_INSTANCE_HEADER_u ;
    ULONGLONG ParentRegHandle;
  } EVENT_INSTANCE_HEADER;
  typedef EVENT_INSTANCE_HEADER *PEVENT_INSTANCE_HEADER; //Pointer
  typedef ULONG WINAPI_ProcessTraceMode; //Alias
  typedef union WINAPI_EVENT_TRACE_LOGFILE_u1 {
    WINAPI_EventLogFileMode LogFileMode;
    WINAPI_ProcessTraceMode ProcessTraceMode;
  } WINAPI_EVENT_TRACE_LOGFILE_u1;
  typedef union WINAPI_EVENT_TRACE_LOGFILE_u2 {
    PEVENT_CALLBACK EventCallback;
    PEVENT_RECORD_CALLBACK EventRecordCallback;
  } WINAPI_EVENT_TRACE_LOGFILE_u2;
  typedef struct ETW_BUFFER_CONTEXT {
    UCHAR ProcessorNumber;
    UCHAR Alignment;
    USHORT LoggerId;
  } ETW_BUFFER_CONTEXT;
  typedef union WINAPI_EVENT_TRACE_u {
    ULONG ClientContext;
    ETW_BUFFER_CONTEXT BufferContext;
  } WINAPI_EVENT_TRACE_u;
  typedef struct EVENT_TRACE {
    EVENT_TRACE_HEADER Header;
    ULONG InstanceId;
    ULONG ParentInstanceId;
    GUID ParentGuid;
    PVOID MofData;
    ULONG MofLength;
    WINAPI_EVENT_TRACE_u ;
  } EVENT_TRACE;
  typedef struct WINAPI_TRACE_LOGFILE_HEADER_u1_s {
    UCHAR MajorVersion;
    UCHAR MinorVersion;
    UCHAR SubVersion;
    UCHAR SubMinorVersion;
  } WINAPI_TRACE_LOGFILE_HEADER_u1_s;
  typedef union WINAPI_TRACE_LOGFILE_HEADER_u1 {
    ULONG Version;
    WINAPI_TRACE_LOGFILE_HEADER_u1_s VersionDetail;
  } WINAPI_TRACE_LOGFILE_HEADER_u1;
  typedef struct WINAPI_TRACE_LOGFILE_HEADER_u2_s {
    ULONG StartBuffers;
    ULONG PointerSize;
    ULONG EventsLost;
    ULONG CpuSpeedInMHz;
  } WINAPI_TRACE_LOGFILE_HEADER_u2_s;
  typedef union WINAPI_TRACE_LOGFILE_HEADER_u2 {
    GUID LogInstanceGuid;
    WINAPI_TRACE_LOGFILE_HEADER_u2_s ;
  } WINAPI_TRACE_LOGFILE_HEADER_u2;
  typedef struct TRACE_LOGFILE_HEADER {
    ULONG BufferSize;
    WINAPI_TRACE_LOGFILE_HEADER_u1 ;
    ULONG ProviderVersion;
    ULONG NumberOfProcessors;
    LARGE_INTEGER EndTime;
    ULONG TimerResolution;
    ULONG MaximumFileSize;
    WINAPI_EventLogFileMode LogFileMode;
    ULONG BuffersWritten;
    WINAPI_TRACE_LOGFILE_HEADER_u2 ;
    LPWSTR LoggerName;
    LPWSTR LogFileName;
    TIME_ZONE_INFORMATION TimeZone;
    LARGE_INTEGER BootTime;
    LARGE_INTEGER PerfFreq;
    LARGE_INTEGER StartTime;
    ULONG ReservedFlags;
    ULONG BuffersLost;
  } TRACE_LOGFILE_HEADER;
  typedef struct EVENT_TRACE_LOGFILE {
    LPTSTR LogFileName;
    LPTSTR LoggerName;
    LONGLONG CurrentTime;
    ULONG BuffersRead;
    WINAPI_EVENT_TRACE_LOGFILE_u1 ;
    EVENT_TRACE CurrentEvent;
    TRACE_LOGFILE_HEADER LogfileHeader;
    PEVENT_TRACE_BUFFER_CALLBACK BufferCallback;
    ULONG BufferSize;
    ULONG Filled;
    ULONG EventsLost;
    WINAPI_EVENT_TRACE_LOGFILE_u2 ;
    ULONG IsKernelTrace;
    PVOID Context;
  } EVENT_TRACE_LOGFILE;
  typedef EVENT_TRACE_LOGFILE *PEVENT_TRACE_LOGFILE; //Pointer
  typedef struct EVENT_INSTANCE_INFO {
    HANDLE RegHandle;
    ULONG InstanceId;
  } EVENT_INSTANCE_INFO;
  typedef EVENT_INSTANCE_INFO *PEVENT_INSTANCE_INFO; //Pointer
  typedef struct EVENT_DESCRIPTOR {
    USHORT Id;
    UCHAR Version;
    UCHAR Channel;
    UCHAR Level;
    UCHAR Opcode;
    USHORT Task;
    ULONGLONG Keyword;
  } EVENT_DESCRIPTOR;
  typedef EVENT_DESCRIPTOR *PCEVENT_DESCRIPTOR; //Pointer
  typedef struct EVENT_DATA_DESCRIPTOR {
    ULONGLONG Ptr;
    ULONG Size;
    ULONG Reserved;
  } EVENT_DATA_DESCRIPTOR;
  typedef EVENT_DATA_DESCRIPTOR *PEVENT_DATA_DESCRIPTOR; //Pointer
  typedef enum WINAPI_EventLogType {
    EVENTLOG_SUCCESS = 0x0000,
    EVENTLOG_ERROR_TYPE = 0x0001,
    EVENTLOG_WARNING_TYPE = 0x0002,
    EVENTLOG_INFORMATION_TYPE = 0x0004,
    EVENTLOG_AUDIT_SUCCESS = 0x0008,
    EVENTLOG_AUDIT_FAILURE = 0x0010,
  } WINAPI_EventLogType;
  typedef enum WINAPI_EventActivity {
    EVENT_ACTIVITY_CTRL_GET_ID = 1,
    EVENT_ACTIVITY_CTRL_SET_ID = 2,
    EVENT_ACTIVITY_CTRL_CREATE_ID = 3,
    EVENT_ACTIVITY_CTRL_GET_SET_ID = 4,
    EVENT_ACTIVITY_CTRL_CREATE_SET_ID = 5,
  } WINAPI_EventActivity;
]]

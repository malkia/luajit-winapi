require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PEVENT_CALLBACK; //Alias
  typedef LPVOID PEVENT_TRACE_BUFFER_CALLBACK; //Alias
  typedef LPVOID PEVENT_RECORD_CALLBACK; //Alias
  typedef struct WNODE_HEADER_u1_s {
    ULONG Version;
    ULONG Linkage;
  } WNODE_HEADER_u1_s;
  typedef union WNODE_HEADER_u1 {
    ULONG64 HistoricalContext;
    WNODE_HEADER_u1_s ;
  } WNODE_HEADER_u1;
  typedef union WNODE_HEADER_u2 {
    ULONG CountLost;
    HANDLE KernelHandle;
    LARGE_INTEGER TimeStamp;
  } WNODE_HEADER_u2;
  typedef ULONG WNODE_HEADER_Flags; //Alias
  typedef struct WNODE_HEADER {
    ULONG BufferSize;
    ULONG ProviderId;
    WNODE_HEADER_u1 ;
    WNODE_HEADER_u2 ;
    GUID Guid;
    ULONG ClientContext;
    WNODE_HEADER_Flags Flags;
  } WNODE_HEADER;
  typedef ULONG EventLogFileMode; //Alias
  typedef ULONG EventEnableFlags; //Alias
  typedef struct EVENT_TRACE_PROPERTIES {
    WNODE_HEADER Wnode;
    ULONG BufferSize;
    ULONG MinimumBuffers;
    ULONG MaximumBuffers;
    ULONG MaximumFileSize;
    EventLogFileMode LogFileMode;
    ULONG FlushTimer;
    EventEnableFlags EnableFlags;
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
  typedef struct EVENT_TRACE_HEADER_u1_s {
    UCHAR HeaderType;
    UCHAR MarkerFlags;
  } EVENT_TRACE_HEADER_u1_s;
  typedef union EVENT_TRACE_HEADER_u1 {
    USHORT FieldTypeFlags;
    EVENT_TRACE_HEADER_u1_s ;
  } EVENT_TRACE_HEADER_u1;
  typedef UCHAR EVENT_TRACE_TYPE; //Alias
  static const EVENT_TRACE_TYPE EVENT_TRACE_TYPE_INFO = 0x00;
  static const EVENT_TRACE_TYPE EVENT_TRACE_TYPE_START = 0x01;
  static const EVENT_TRACE_TYPE EVENT_TRACE_TYPE_END = 0x02;
  static const EVENT_TRACE_TYPE EVENT_TRACE_TYPE_STOP = 0x02;
  static const EVENT_TRACE_TYPE EVENT_TRACE_TYPE_DC_START = 0x03;
  static const EVENT_TRACE_TYPE EVENT_TRACE_TYPE_DC_END = 0x04;
  static const EVENT_TRACE_TYPE EVENT_TRACE_TYPE_EXTENSION = 0x05;
  static const EVENT_TRACE_TYPE EVENT_TRACE_TYPE_REPLY = 0x06;
  static const EVENT_TRACE_TYPE EVENT_TRACE_TYPE_DEQUEUE = 0x07;
  static const EVENT_TRACE_TYPE EVENT_TRACE_TYPE_RESUME = 0x07;
  static const EVENT_TRACE_TYPE EVENT_TRACE_TYPE_CHECKPOINT = 0x08;
  static const EVENT_TRACE_TYPE EVENT_TRACE_TYPE_SUSPEND = 0x08;
  static const EVENT_TRACE_TYPE EVENT_TRACE_TYPE_WINEVT_SEND = 0x09;
  static const EVENT_TRACE_TYPE EVENT_TRACE_TYPE_WINEVT_RECEIVE = 0XF0;
  typedef UCHAR TRACE_LEVEL; //Alias
  static const TRACE_LEVEL TRACE_LEVEL_NONE = 0;
  static const TRACE_LEVEL TRACE_LEVEL_FATAL = 1;
  static const TRACE_LEVEL TRACE_LEVEL_ERROR = 2;
  static const TRACE_LEVEL TRACE_LEVEL_WARNING = 3;
  static const TRACE_LEVEL TRACE_LEVEL_INFORMATION = 4;
  static const TRACE_LEVEL TRACE_LEVEL_VERBOSE = 5;
  static const TRACE_LEVEL TRACE_LEVEL_RESERVED6 = 6;
  static const TRACE_LEVEL TRACE_LEVEL_RESERVED7 = 7;
  static const TRACE_LEVEL TRACE_LEVEL_RESERVED8 = 8;
  static const TRACE_LEVEL TRACE_LEVEL_RESERVED9 = 9;
  typedef struct EVENT_TRACE_HEADER_u2_s {
    EVENT_TRACE_TYPE Type;
    TRACE_LEVEL Level;
    USHORT Version;
  } EVENT_TRACE_HEADER_u2_s;
  typedef union EVENT_TRACE_HEADER_u2 {
    ULONG Version;
    EVENT_TRACE_HEADER_u2_s Class;
  } EVENT_TRACE_HEADER_u2;
  typedef union EVENT_TRACE_HEADER_u3 {
    GUID Guid;
    ULONGLONG GuidPtr;
  } EVENT_TRACE_HEADER_u3;
  typedef struct EVENT_TRACE_HEADER_u4_s1 {
    ULONG KernelTime;
    ULONG UserTime;
  } EVENT_TRACE_HEADER_u4_s1;
  typedef struct EVENT_TRACE_HEADER_u4_s2 {
    ULONG ClientContext;
    WNODE_HEADER_Flags Flags;
  } EVENT_TRACE_HEADER_u4_s2;
  typedef union EVENT_TRACE_HEADER_u4 {
    EVENT_TRACE_HEADER_u4_s1 ;
    ULONG64 ProcessorTime;
    EVENT_TRACE_HEADER_u4_s2 ;
  } EVENT_TRACE_HEADER_u4;
  typedef struct EVENT_TRACE_HEADER {
    USHORT Size;
    EVENT_TRACE_HEADER_u1 ;
    EVENT_TRACE_HEADER_u2 ;
    ULONG ThreadId;
    ULONG ProcessId;
    LARGE_INTEGER TimeStamp;
    EVENT_TRACE_HEADER_u3 ;
    EVENT_TRACE_HEADER_u4 ;
  } EVENT_TRACE_HEADER;
  typedef EVENT_TRACE_HEADER *PEVENT_TRACE_HEADER; //Pointer
  typedef struct EVENT_INSTANCE_HEADER_u1_s {
    ULONG EventId;
    WNODE_HEADER_Flags Flags;
  } EVENT_INSTANCE_HEADER_u1_s;
  typedef union EVENT_INSTANCE_HEADER_u {
    EVENT_TRACE_HEADER_u4_s1 ;
    ULONG64 ProcessorTime;
    EVENT_INSTANCE_HEADER_u1_s ;
  } EVENT_INSTANCE_HEADER_u;
  typedef struct EVENT_INSTANCE_HEADER {
    USHORT Size;
    EVENT_TRACE_HEADER_u1 ;
    EVENT_TRACE_HEADER_u2 ;
    ULONG ThreadId;
    ULONG ProcessId;
    LARGE_INTEGER TimeStamp;
    ULONGLONG RegHandle;
    ULONG InstanceId;
    ULONG ParentInstanceId;
    EVENT_INSTANCE_HEADER_u ;
    ULONGLONG ParentRegHandle;
  } EVENT_INSTANCE_HEADER;
  typedef EVENT_INSTANCE_HEADER *PEVENT_INSTANCE_HEADER; //Pointer
  typedef ULONG ProcessTraceMode; //Alias
  typedef union EVENT_TRACE_LOGFILE_u1 {
    EventLogFileMode LogFileMode;
    ProcessTraceMode ProcessTraceMode;
  } EVENT_TRACE_LOGFILE_u1;
  typedef union EVENT_TRACE_LOGFILE_u2 {
    PEVENT_CALLBACK EventCallback;
    PEVENT_RECORD_CALLBACK EventRecordCallback;
  } EVENT_TRACE_LOGFILE_u2;
  typedef struct ETW_BUFFER_CONTEXT {
    UCHAR ProcessorNumber;
    UCHAR Alignment;
    USHORT LoggerId;
  } ETW_BUFFER_CONTEXT;
  typedef union EVENT_TRACE_u {
    ULONG ClientContext;
    ETW_BUFFER_CONTEXT BufferContext;
  } EVENT_TRACE_u;
  typedef struct EVENT_TRACE {
    EVENT_TRACE_HEADER Header;
    ULONG InstanceId;
    ULONG ParentInstanceId;
    GUID ParentGuid;
    PVOID MofData;
    ULONG MofLength;
    EVENT_TRACE_u ;
  } EVENT_TRACE;
  typedef struct TRACE_LOGFILE_HEADER_u1_s {
    UCHAR MajorVersion;
    UCHAR MinorVersion;
    UCHAR SubVersion;
    UCHAR SubMinorVersion;
  } TRACE_LOGFILE_HEADER_u1_s;
  typedef union TRACE_LOGFILE_HEADER_u1 {
    ULONG Version;
    TRACE_LOGFILE_HEADER_u1_s VersionDetail;
  } TRACE_LOGFILE_HEADER_u1;
  typedef struct TRACE_LOGFILE_HEADER_u2_s {
    ULONG StartBuffers;
    ULONG PointerSize;
    ULONG EventsLost;
    ULONG CpuSpeedInMHz;
  } TRACE_LOGFILE_HEADER_u2_s;
  typedef union TRACE_LOGFILE_HEADER_u2 {
    GUID LogInstanceGuid;
    TRACE_LOGFILE_HEADER_u2_s ;
  } TRACE_LOGFILE_HEADER_u2;
  typedef struct TRACE_LOGFILE_HEADER {
    ULONG BufferSize;
    TRACE_LOGFILE_HEADER_u1 ;
    ULONG ProviderVersion;
    ULONG NumberOfProcessors;
    LARGE_INTEGER EndTime;
    ULONG TimerResolution;
    ULONG MaximumFileSize;
    EventLogFileMode LogFileMode;
    ULONG BuffersWritten;
    TRACE_LOGFILE_HEADER_u2 ;
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
    EVENT_TRACE_LOGFILE_u1 ;
    EVENT_TRACE CurrentEvent;
    TRACE_LOGFILE_HEADER LogfileHeader;
    PEVENT_TRACE_BUFFER_CALLBACK BufferCallback;
    ULONG BufferSize;
    ULONG Filled;
    ULONG EventsLost;
    EVENT_TRACE_LOGFILE_u2 ;
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
  typedef WORD EventLogType; //Alias
  static const EventLogType EVENTLOG_SUCCESS = 0x0000;
  static const EventLogType EVENTLOG_ERROR_TYPE = 0x0001;
  static const EventLogType EVENTLOG_WARNING_TYPE = 0x0002;
  static const EventLogType EVENTLOG_INFORMATION_TYPE = 0x0004;
  static const EventLogType EVENTLOG_AUDIT_SUCCESS = 0x0008;
  static const EventLogType EVENTLOG_AUDIT_FAILURE = 0x0010;
  typedef ULONG EventActivity; //Alias
  static const EventActivity EVENT_ACTIVITY_CTRL_GET_ID = 1;
  static const EventActivity EVENT_ACTIVITY_CTRL_SET_ID = 2;
  static const EventActivity EVENT_ACTIVITY_CTRL_CREATE_ID = 3;
  static const EventActivity EVENT_ACTIVITY_CTRL_GET_SET_ID = 4;
  static const EventActivity EVENT_ACTIVITY_CTRL_CREATE_SET_ID = 5;
]]

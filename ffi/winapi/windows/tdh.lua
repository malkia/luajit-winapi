require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PEVENT_HEADER_EXTENDED_DATA_ITEM; //Alias
  typedef struct TRACE_PROVIDER_INFO {
    GUID ProviderGuid;
    ULONG SchemaSource;
    ULONG ProviderNameOffset;
  } TRACE_PROVIDER_INFO;
  typedef struct PROVIDER_ENUMERATION_INFO {
    ULONG NumberOfProviders;
    ULONG Reserved;
    TRACE_PROVIDER_INFO TraceProviderInfoArray[ANYSIZE_ARRAY];
  } PROVIDER_ENUMERATION_INFO;
  typedef PROVIDER_ENUMERATION_INFO *PPROVIDER_ENUMERATION_INFO; //Pointer
  typedef UINT DECODING_SOURCE; //Alias
  static const UINT DecodingSourceXMLFile = 0;
  static const UINT DecodingSourceWbem = 1;
  static const UINT DecodingSourceWPP = 2;
  typedef UINT TEMPLATE_FLAGS; //Alias
  typedef USHORT TDH_IN_TYPE; //Alias
  static const USHORT TDH_INTYPE_NULL = 0;
  static const USHORT TDH_INTYPE_UNICODESTRING = 1;
  static const USHORT TDH_INTYPE_ANSISTRING = 2;
  static const USHORT TDH_INTYPE_INT8 = 3;
  static const USHORT TDH_INTYPE_UINT8 = 4;
  static const USHORT TDH_INTYPE_INT16 = 5;
  static const USHORT TDH_INTYPE_UINT16 = 6;
  static const USHORT TDH_INTYPE_INT32 = 7;
  static const USHORT TDH_INTYPE_UINT32 = 8;
  static const USHORT TDH_INTYPE_INT64 = 9;
  static const USHORT TDH_INTYPE_UINT64 = 10;
  static const USHORT TDH_INTYPE_FLOAT = 11;
  static const USHORT TDH_INTYPE_DOUBLE = 12;
  static const USHORT TDH_INTYPE_BOOLEAN = 13;
  static const USHORT TDH_INTYPE_BINARY = 14;
  static const USHORT TDH_INTYPE_GUID = 15;
  static const USHORT TDH_INTYPE_POINTER = 16;
  static const USHORT TDH_INTYPE_FILETIME = 17;
  static const USHORT TDH_INTYPE_SYSTEMTIME = 18;
  static const USHORT TDH_INTYPE_SID = 19;
  static const USHORT TDH_INTYPE_HEXINT32 = 20;
  static const USHORT TDH_INTYPE_HEXINT64 = 21;
  static const USHORT TDH_INTYPE_COUNTEDSTRING = 300;
  static const USHORT TDH_INTYPE_COUNTEDANSISTRING = 301;
  static const USHORT TDH_INTYPE_REVERSEDCOUNTEDSTRING = 302;
  static const USHORT TDH_INTYPE_REVERSEDCOUNTEDANSISTRING = 303;
  static const USHORT TDH_INTYPE_NONNULLTERMINATEDSTRING = 304;
  static const USHORT TDH_INTYPE_NONNULLTERMINATEDANSISTRING = 305;
  static const USHORT TDH_INTYPE_UNICODECHAR = 306;
  static const USHORT TDH_INTYPE_ANSICHAR = 307;
  static const USHORT TDH_INTYPE_SIZET = 308;
  static const USHORT TDH_INTYPE_HEXDUMP = 309;
  static const USHORT TDH_INTYPE_WBEMSID = 310;
  typedef USHORT TDH_OUT_TYPE; //Alias
  static const USHORT TDH_OUTTYPE_NULL = 0;
  static const USHORT TDH_OUTTYPE_STRING = 1;
  static const USHORT TDH_OUTTYPE_DATETIME = 2;
  static const USHORT TDH_OUTTYPE_BYTE = 3;
  static const USHORT TDH_OUTTYPE_UNSIGNEDBYTE = 4;
  static const USHORT TDH_OUTTYPE_SHORT = 5;
  static const USHORT TDH_OUTTYPE_UNSIGNEDSHORT = 6;
  static const USHORT TDH_OUTTYPE_INT = 7;
  static const USHORT TDH_OUTTYPE_UNSIGNEDINT = 8;
  static const USHORT TDH_OUTTYPE_LONG = 9;
  static const USHORT TDH_OUTTYPE_UNSIGNEDLONG = 10;
  static const USHORT TDH_OUTTYPE_FLOAT = 11;
  static const USHORT TDH_OUTTYPE_DOUBLE = 12;
  static const USHORT TDH_OUTTYPE_BOOLEAN = 13;
  static const USHORT TDH_OUTTYPE_GUID = 14;
  static const USHORT TDH_OUTTYPE_HEXBINARY = 15;
  static const USHORT TDH_OUTTYPE_HEXINT8 = 16;
  static const USHORT TDH_OUTTYPE_HEXINT16 = 17;
  static const USHORT TDH_OUTTYPE_HEXINT32 = 18;
  static const USHORT TDH_OUTTYPE_HEXINT64 = 19;
  static const USHORT TDH_OUTTYPE_PID = 20;
  static const USHORT TDH_OUTTYPE_TID = 21;
  static const USHORT TDH_OUTTYPE_PORT = 22;
  static const USHORT TDH_OUTTYPE_IPV4 = 23;
  static const USHORT TDH_OUTTYPE_IPV6 = 24;
  static const USHORT TDH_OUTTYPE_SOCKETADDRESS = 25;
  static const USHORT TDH_OUTTYPE_CIMDATETIME = 26;
  static const USHORT TDH_OUTTYPE_ETWTIME = 27;
  static const USHORT TDH_OUTTYPE_XML = 28;
  static const USHORT TDH_OUTTYPE_ERRORCODE = 29;
  static const USHORT TDH_OUTTYPE_WIN32ERROR = 30;
  static const USHORT TDH_OUTTYPE_NTSTATUS = 31;
  static const USHORT TDH_OUTTYPE_HRESULT = 32;
  static const USHORT TDH_OUTTYPE_CULTURE_INSENSITIVE_DATETIME = 33;
  static const USHORT TDH_OUTTYPE_REDUCEDSTRING = 300;
  static const USHORT TDH_OUTTYPE_NOPRINT = 301;
  typedef UINT PROPERTY_FLAGS; //Alias
  typedef struct WINAPI_EVENT_PROPERTY_INFO_u1_s1 {
    TDH_IN_TYPE InType;
    TDH_OUT_TYPE OutType;
    ULONG MapNameOffset;
  } WINAPI_EVENT_PROPERTY_INFO_u1_s1;
  typedef struct WINAPI_EVENT_PROPERTY_INFO_u1_s2 {
    USHORT StructStartIndex;
    USHORT NumOfStructMembers;
    ULONG padding;
  } WINAPI_EVENT_PROPERTY_INFO_u1_s2;
  typedef union WINAPI_EVENT_PROPERTY_INFO_u1 {
    WINAPI_EVENT_PROPERTY_INFO_u1_s1 nonStructType;
    WINAPI_EVENT_PROPERTY_INFO_u1_s2 structType;
  } WINAPI_EVENT_PROPERTY_INFO_u1;
  typedef union WINAPI_EVENT_PROPERTY_INFO_u2 {
    USHORT count;
    USHORT countPropertyIndex;
  } WINAPI_EVENT_PROPERTY_INFO_u2;
  typedef union WINAPI_EVENT_PROPERTY_INFO_u3 {
    USHORT length;
    USHORT lengthPropertyIndex;
  } WINAPI_EVENT_PROPERTY_INFO_u3;
  typedef struct EVENT_PROPERTY_INFO {
    PROPERTY_FLAGS Flags;
    ULONG NameOffset;
    WINAPI_EVENT_PROPERTY_INFO_u1 ;
    WINAPI_EVENT_PROPERTY_INFO_u2 ;
    WINAPI_EVENT_PROPERTY_INFO_u3 ;
    ULONG Reserved;
  } EVENT_PROPERTY_INFO;
  typedef struct PROVIDER_FILTER_INFO {
    UCHAR Id;
    UCHAR Version;
    ULONG MessageOffset;
    ULONG Reserved;
    ULONG PropertyCount;
    EVENT_PROPERTY_INFO EventPropertyInfoArray[ANYSIZE_ARRAY];
  } PROVIDER_FILTER_INFO;
  typedef PROVIDER_FILTER_INFO *PPROVIDER_FILTER_INFO; //Pointer
  typedef struct TRACE_EVENT_INFO {
    GUID ProviderGuid;
    GUID EventGuid;
    EVENT_DESCRIPTOR EventDescriptor;
    DECODING_SOURCE DecodingSource;
    ULONG ProviderNameOffset;
    ULONG LevelNameOffset;
    ULONG ChannelNameOffset;
    ULONG KeywordsNameOffset;
    ULONG TaskNameOffset;
    ULONG OpcodeNameOffset;
    ULONG EventMessageOffset;
    ULONG ProviderMessageOffset;
    ULONG BinaryXMLOffset;
    ULONG BinaryXMLSize;
    ULONG ActivityIDNameOffset;
    ULONG RelatedActivityIDNameOffset;
    ULONG PropertyCount;
    ULONG TopLevelPropertyCount;
    TEMPLATE_FLAGS Flags;
    EVENT_PROPERTY_INFO EventPropertyInfoArray[ANYSIZE_ARRAY];
  } TRACE_EVENT_INFO;
  typedef TRACE_EVENT_INFO *PTRACE_EVENT_INFO; //Pointer
  typedef UINT MAP_VALUETYPE; //Alias
  static const UINT EVENTMAP_ENTRY_VALUETYPE_ULONG = 0;
  static const UINT EVENTMAP_ENTRY_VALUETYPE_STRING = 1;
  typedef UINT MAP_FLAGS; //Alias
  typedef union WINAPI_EVENT_MAP_ENTRY_u {
    ULONG Value;
    ULONG InputOffset;
  } WINAPI_EVENT_MAP_ENTRY_u;
  typedef struct EVENT_MAP_ENTRY {
    ULONG OutputOffset;
    WINAPI_EVENT_MAP_ENTRY_u ;
  } EVENT_MAP_ENTRY;
  typedef union WINAPI_EVENT_MAP_INFO_u {
    MAP_VALUETYPE MapEntryValueType;
    ULONG FormatStringOffset;
  } WINAPI_EVENT_MAP_INFO_u;
  typedef struct EVENT_MAP_INFO {
    ULONG NameOffset;
    MAP_FLAGS Flag;
    ULONG EntryCount;
    WINAPI_EVENT_MAP_INFO_u ;
    EVENT_MAP_ENTRY MapEntryArray[ANYSIZE_ARRAY];
  } EVENT_MAP_INFO;
  typedef EVENT_MAP_INFO *PEVENT_MAP_INFO; //Pointer
  typedef UINT EVENT_FIELD_TYPE; //Alias
  static const UINT EventKeywordInformation = 0;
  static const UINT EventLevelInformation = 1;
  static const UINT EventChannelInformation = 2;
  static const UINT EventTaskInformation = 3;
  static const UINT EventOpcodeInformation = 4;
  typedef struct PROVIDER_FIELD_INFO {
    ULONG NameOffset;
    ULONG DescriptionOffset;
    ULONGLONG Value;
  } PROVIDER_FIELD_INFO;
  typedef struct PROVIDER_FIELD_INFOARRAY {
    ULONG NumberOfElements;
    EVENT_FIELD_TYPE FieldType;
    PROVIDER_FIELD_INFO FieldInfoArray[ANYSIZE_ARRAY];
  } PROVIDER_FIELD_INFOARRAY;
  typedef PROVIDER_FIELD_INFOARRAY *PPROVIDER_FIELD_INFOARRAY; //Pointer
  typedef UINT TDH_CONTEXT_TYPE; //Alias
  static const UINT TDH_CONTEXT_WPP_TMFFILE = 0;
  static const UINT TDH_CONTEXT_WPP_TMFSEARCHPATH = 1;
  static const UINT TDH_CONTEXT_WPP_GMT = 2;
  static const UINT TDH_CONTEXT_POINTERSIZE = 3;
  typedef struct TDH_CONTEXT {
    ULONGLONG ParameterValue;
    TDH_CONTEXT_TYPE ParameterType;
    ULONG ParameterSize;
  } TDH_CONTEXT;
  typedef TDH_CONTEXT *PTDH_CONTEXT; //Pointer
  typedef struct PROPERTY_DATA_DESCRIPTOR {
    ULONGLONG PropertyName;
    ULONG ArrayIndex;
    ULONG Reserved;
  } PROPERTY_DATA_DESCRIPTOR;
  typedef PROPERTY_DATA_DESCRIPTOR *PPROPERTY_DATA_DESCRIPTOR; //Pointer
  typedef struct WINAPI_EVENT_HEADER_u_s {
    ULONG KernelTime;
    ULONG UserTime;
  } WINAPI_EVENT_HEADER_u_s;
  typedef union WINAPI_EVENT_HEADER_u {
    WINAPI_EVENT_HEADER_u_s ;
    ULONG64 ProcessorTime;
  } WINAPI_EVENT_HEADER_u;
  typedef USHORT WINAPI_EVENT_HEADER_FLAG; //Alias
  typedef USHORT WINAPI_EVENT_HEADER_PROPERTY; //Alias
  typedef struct EVENT_HEADER {
    USHORT Size;
    USHORT HeaderType;
    WINAPI_EVENT_HEADER_FLAG Flags;
    WINAPI_EVENT_HEADER_PROPERTY EventProperty;
    ULONG ThreadId;
    ULONG ProcessId;
    LARGE_INTEGER TimeStamp;
    GUID ProviderId;
    EVENT_DESCRIPTOR EventDescriptor;
    WINAPI_EVENT_HEADER_u ;
    GUID ActivityId;
  } EVENT_HEADER;
  typedef struct EVENT_RECORD {
    EVENT_HEADER EventHeader;
    ETW_BUFFER_CONTEXT BufferContext;
    USHORT ExtendedDataCount;
    USHORT UserDataLength;
    PEVENT_HEADER_EXTENDED_DATA_ITEM ExtendedData;
    PVOID UserData;
    PVOID UserContext;
  } EVENT_RECORD;
  typedef EVENT_RECORD *PEVENT_RECORD; //Pointer
  ULONG TdhEnumerateProviderFieldInformation( LPGUID pGuid, EVENT_FIELD_TYPE EventFieldType, PPROVIDER_FIELD_INFOARRAY pBuffer, ULONG* pBufferSize);
  ULONG TdhEnumerateProviderFilters(          LPGUID pGuid, ULONG TdhContextCount, PTDH_CONTEXT pTdhContext, ULONG* FilterCount, PPROVIDER_FILTER_INFO* pBuffer, ULONG* pBufferSize);
  ULONG TdhEnumerateProviders(                PPROVIDER_ENUMERATION_INFO pBuffer, ULONG* pBufferSize);
  ULONG TdhFormatProperty(                    PTRACE_EVENT_INFO EventInfo, PEVENT_MAP_INFO MapInfo, ULONG PointerSize, USHORT PropertyInType, USHORT PropertyOutType, USHORT PropertyLength, USHORT UserDataLength, PBYTE UserData, PULONG BufferSize, PWCHAR Buffer, PUSHORT UserDataConsumed);
  ULONG TdhGetEventInformation(               PEVENT_RECORD pEvent, ULONG TdhContextCount, PTDH_CONTEXT pTdhContext, PTRACE_EVENT_INFO pBuffer, ULONG* pBufferSize);
  ULONG TdhGetEventMapInformation(            PEVENT_RECORD pEvent, LPWSTR pMapName, PEVENT_MAP_INFO pBuffer, ULONG* pBufferSize);
  ULONG TdhGetPropertySize(                   PEVENT_RECORD pEvent, ULONG TdhContextCount, PTDH_CONTEXT pTdhContext, ULONG PropertyDataCount, PPROPERTY_DATA_DESCRIPTOR pPropertyData, ULONG* pPropertySize);
  ULONG TdhGetProperty(                       PEVENT_RECORD pEvent, ULONG TdhContextCount, PTDH_CONTEXT pTdhContext, ULONG PropertyDataCount, PPROPERTY_DATA_DESCRIPTOR pPropertyData, ULONG BufferSize, PBYTE pBuffer);
  ULONG TdhLoadManifest(                      PWSTR Manifest);
  ULONG TdhQueryProviderFieldInformation(     LPGUID pGuid, ULONGLONG EventFieldValue, EVENT_FIELD_TYPE EventFieldType, PPROVIDER_FIELD_INFOARRAY pBuffer, ULONG* pBufferSize);
  ULONG TdhUnloadManifest(                    PWSTR Manifest);
]]
return ffi.load( 'Tdh.dll' )

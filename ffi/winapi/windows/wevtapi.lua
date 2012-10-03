require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PEVT_VARIANT; //Alias
  typedef HANDLE EVT_HANDLE; //Alias
  typedef LPVOID EVT_SUBSCRIBE_CALLBACK; //Alias
  typedef HANDLE EVT_OBJECT_ARRAY_PROPERTY_HANDLE; //Alias
  typedef UINT EVT_CHANNEL_CONFIG_PROPERTY_ID; //Alias
  static const UINT EvtChannelConfigEnabled = 0;
  static const UINT EvtChannelConfigIsolation = 1;
  static const UINT EvtChannelConfigType = 2;
  static const UINT EvtChannelConfigOwningPublisher = 3;
  static const UINT EvtChannelConfigClassicEventlog = 4;
  static const UINT EvtChannelConfigAccess = 5;
  static const UINT EvtChannelLoggingConfigRetention = 6;
  static const UINT EvtChannelLoggingConfigAutoBackup = 7;
  static const UINT EvtChannelLoggingConfigMaxSize = 8;
  static const UINT EvtChannelLoggingConfigLogFilePath = 9;
  static const UINT EvtChannelPublishingConfigLevel = 10;
  static const UINT EvtChannelPublishingConfigKeywords = 11;
  static const UINT EvtChannelPublishingConfigControlGuid = 12;
  static const UINT EvtChannelPublishingConfigBufferSize = 13;
  static const UINT EvtChannelPublishingConfigMinBuffers = 14;
  static const UINT EvtChannelPublishingConfigMaxBuffers = 15;
  static const UINT EvtChannelPublishingConfigLatency = 16;
  static const UINT EvtChannelPublishingConfigClockType = 17;
  static const UINT EvtChannelPublishingConfigSidType = 18;
  static const UINT EvtChannelPublisherList = 19;
  static const UINT EvtChannelPublishingConfigFileMax = 20;
  typedef UINT EVT_PUBLISHER_METADATA_PROPERTY_ID; //Alias
  static const UINT EvtPublisherMetadataPublisherGuid = 0;
  static const UINT EvtPublisherMetadataResourceFilePath = 1;
  static const UINT EvtPublisherMetadataParameterFilePath = 2;
  static const UINT EvtPublisherMetadataMessageFilePath = 3;
  static const UINT EvtPublisherMetadataHelpLink = 4;
  static const UINT EvtPublisherMetadataPublisherMessageID = 5;
  static const UINT EvtPublisherMetadataChannelReferences = 6;
  static const UINT EvtPublisherMetadataChannelReferencePath = 7;
  static const UINT EvtPublisherMetadataChannelReferenceIndex = 8;
  static const UINT EvtPublisherMetadataChannelReferenceID = 9;
  static const UINT EvtPublisherMetadataChannelReferenceFlags = 10;
  static const UINT EvtPublisherMetadataChannelReferenceMessageID = 11;
  static const UINT EvtPublisherMetadataLevels = 12;
  static const UINT EvtPublisherMetadataLevelName = 13;
  static const UINT EvtPublisherMetadataLevelValue = 14;
  static const UINT EvtPublisherMetadataLevelMessageID = 15;
  static const UINT EvtPublisherMetadataTasks = 16;
  static const UINT EvtPublisherMetadataTaskName = 17;
  static const UINT EvtPublisherMetadataTaskEventGuid = 18;
  static const UINT EvtPublisherMetadataTaskValue = 19;
  static const UINT EvtPublisherMetadataTaskMessageID = 20;
  static const UINT EvtPublisherMetadataOpcodes = 21;
  static const UINT EvtPublisherMetadataOpcodeName = 22;
  static const UINT EvtPublisherMetadataOpcodeValue = 23;
  static const UINT EvtPublisherMetadataOpcodeMessageID = 24;
  static const UINT EvtPublisherMetadataKeywords = 25;
  static const UINT EvtPublisherMetadataKeywordName = 26;
  static const UINT EvtPublisherMetadataKeywordValue = 27;
  static const UINT EvtPublisherMetadataKeywordMessageID = 28;
  typedef DWORD WINAPI_EvtFormatMessageFlags; //Alias
  static const DWORD EvtFormatMessageEvent = 1;
  static const DWORD EvtFormatMessageLevel = 2;
  static const DWORD EvtFormatMessageTask = 3;
  static const DWORD EvtFormatMessageOpcode = 4;
  static const DWORD EvtFormatMessageKeyword = 5;
  static const DWORD EvtFormatMessageChannel = 6;
  static const DWORD EvtFormatMessageProvider = 7;
  static const DWORD EvtFormatMessageId = 8;
  static const DWORD EvtFormatMessageXml = 9;
  typedef DWORD WINAPI_EvtOpenFlags; //Alias
  typedef UINT EVT_LOG_PROPERTY_ID; //Alias
  static const UINT EvtLogCreationTime = 0;
  static const UINT EvtLogLastAccessTime = 1;
  static const UINT EvtLogLastWriteTime = 2;
  static const UINT EvtLogFileSize = 3;
  static const UINT EvtLogAttributes = 4;
  static const UINT EvtLogNumberOfLogRecords = 5;
  static const UINT EvtLogOldestRecordNumber = 6;
  static const UINT EvtLogFull = 7;
  typedef DWORD WINAPI_EvtRenderFlags; //Alias
  static const DWORD EvtRenderEventValues = 0;
  static const DWORD EvtRenderEventXml = 1;
  static const DWORD EvtRenderBookmark = 2;
  typedef DWORD WINAPI_EvtQueryFlags; //Alias
  typedef DWORD WINAPI_EvtRenderContextFlags; //Alias
  static const DWORD EvtRenderContextValues = 0;
  static const DWORD EvtRenderContextSystem = 1;
  static const DWORD EvtRenderContextUser = 2;
  typedef UINT EVT_QUERY_PROPERTY_ID; //Alias
  static const UINT EvtQueryNames = 0;
  static const UINT EvtQueryStatuses = 1;
  typedef DWORD WINAPI_EvtSubscribeFlags; //Alias
  typedef UINT EVT_EVENT_PROPERTY_ID; //Alias
  static const UINT EvtEventQueryIDs = 0;
  static const UINT EvtEventPath = 1;
  typedef DWORD WINAPI_EvtSeekFlags; //Alias
  typedef DWORD WINAPI_EvtExportLogFlags; //Alias
  typedef UINT EVT_LOGIN_CLASS; //Alias
  static const UINT EvtRpcLogin = 1;
  typedef UINT EVT_EVENT_METADATA_PROPERTY_ID; //Alias
  static const UINT EventMetadataEventID = 0;
  static const UINT EventMetadataEventVersion = 1;
  static const UINT EventMetadataEventChannel = 2;
  static const UINT EventMetadataEventLevel = 3;
  static const UINT EventMetadataEventOpcode = 4;
  static const UINT EventMetadataEventTask = 5;
  static const UINT EventMetadataEventKeyword = 6;
  static const UINT EventMetadataEventMessageID = 7;
  static const UINT EventMetadataEventTemplate = 8;
  EVT_HANDLE EvtOpenSession(                  EVT_LOGIN_CLASS LoginClass, PVOID Login, DWORD Timeout, DWORD Flags);
  BOOL       EvtClose(                        EVT_HANDLE Object);
  BOOL       EvtGetExtendedStatus(            DWORD BufferSize, LPWSTR Buffer, PDWORD BufferUsed);
  BOOL       EvtGetQueryInfo(                 EVT_HANDLE QueryOrSubscription, EVT_QUERY_PROPERTY_ID PropertyId, DWORD PropertyValueBufferSize, PEVT_VARIANT PropertyValueBuffer, PDWORD PropertyValueBufferUsed);
  EVT_HANDLE EvtQuery(                        EVT_HANDLE Session, LPCWSTR Path, LPCWSTR Query, WINAPI_EvtQueryFlags Flags);
  BOOL       EvtNext(                         EVT_HANDLE ResultSet, DWORD EventArraySize, EVT_HANDLE* EventArray, WINAPI_WaitTimeout Timeout, DWORD Flags, PDWORD Returned);
  BOOL       EvtSeek(                         EVT_HANDLE ResultSet, LONGLONG Position, EVT_HANDLE Bookmark, DWORD Timeout, WINAPI_EvtSeekFlags Flags);
  EVT_HANDLE EvtSubscribe(                    EVT_HANDLE Session, HANDLE SignalEvent, LPCWSTR ChannelPath, LPCWSTR Query, EVT_HANDLE Bookmark, PVOID context, EVT_SUBSCRIBE_CALLBACK Callback, WINAPI_EvtSubscribeFlags Flags);
  EVT_HANDLE EvtCreateBookmark(               LPCWSTR BookmarkXml);
  BOOL       EvtUpdateBookmark(               EVT_HANDLE Bookmark, EVT_HANDLE Event);
  BOOL       EvtGetEventInfo(                 EVT_HANDLE Event, EVT_EVENT_PROPERTY_ID PropertyId, DWORD PropertyValueBufferSize, PEVT_VARIANT PropertyValueBuffer, PDWORD PropertyValueBufferUsed);
  EVT_HANDLE EvtCreateRenderContext(          DWORD ValuePathsCount, LPCWSTR* ValuePaths, WINAPI_EvtRenderContextFlags Flags);
  BOOL       EvtRender(                       EVT_HANDLE Context, EVT_HANDLE Fragment, WINAPI_EvtRenderFlags Flags, DWORD BufferSize, PVOID Buffer, PDWORD BufferUsed, PDWORD PropertyCount);
  BOOL       EvtFormatMessage(                EVT_HANDLE PublisherMetadata, EVT_HANDLE Event, DWORD MessageId, DWORD ValueCount, PEVT_VARIANT Values, WINAPI_EvtFormatMessageFlags Flags, DWORD BufferSize, LPWSTR Buffer, PDWORD BufferUsed);
  EVT_HANDLE EvtOpenLog(                      EVT_HANDLE Session, LPCWSTR Path, WINAPI_EvtOpenFlags Flags);
  BOOL       EvtGetLogInfo(                   EVT_HANDLE Log, EVT_LOG_PROPERTY_ID PropertyId, DWORD PropertyValueBufferSize, PEVT_VARIANT PropertyValueBuffer, PDWORD PropertyValueBufferUsed);
  BOOL       EvtClearLog(                     EVT_HANDLE Session, LPCWSTR ChannelPath, LPCWSTR TargetFilePath, DWORD Flags);
  BOOL       EvtExportLog(                    EVT_HANDLE Session, LPCWSTR Path, LPCWSTR Query, LPCWSTR TargetFilePath, WINAPI_EvtExportLogFlags Flags);
  BOOL       EvtArchiveExportedLog(           EVT_HANDLE Session, LPCWSTR LogFilePath, LCID Locale, DWORD Flags);
  EVT_HANDLE EvtOpenChannelEnum(              EVT_HANDLE Session, DWORD Flags);
  BOOL       EvtNextChannelPath(              EVT_HANDLE ChannelEnum, DWORD ChannelPathBufferSize, LPWSTR ChannelPathBuffer, PDWORD ChannelPathBufferUsed);
  EVT_HANDLE EvtOpenChannelConfig(            EVT_HANDLE Session, LPCWSTR ChannelPath, DWORD Flags);
  BOOL       EvtSaveChannelConfig(            EVT_HANDLE ChannelConfig, DWORD Flags);
  BOOL       EvtSetChannelConfigProperty(     EVT_HANDLE ChannelConfig, EVT_CHANNEL_CONFIG_PROPERTY_ID PropertyId, DWORD Flags, PEVT_VARIANT PropertyValue);
  BOOL       EvtGetChannelConfigProperty(     EVT_HANDLE ChannelConfig, EVT_CHANNEL_CONFIG_PROPERTY_ID PropertyId, DWORD Flags, DWORD PropertyValueBufferSize, PEVT_VARIANT PropertyValueBuffer, PDWORD PropertyValueBufferUsed);
  BOOL       EvtNextPublisherId(              EVT_HANDLE PublisherEnum, DWORD PublisherIdBufferSize, LPWSTR PublisherIdBuffer, PDWORD PublisherIdBufferUsed);
  EVT_HANDLE EvtOpenPublisherEnum(            EVT_HANDLE Session, DWORD Flags);
  EVT_HANDLE EvtOpenPublisherMetadata(        EVT_HANDLE Session, LPCWSTR PublisherIdentity, LPCWSTR LogFilePath, LCID Locale, DWORD Flags);
  BOOL       EvtGetPublisherMetadataProperty( EVT_HANDLE PublisherMetadata, EVT_PUBLISHER_METADATA_PROPERTY_ID PropertyId, DWORD Flags, DWORD PublisherMetadataPropertyBufferSize, PEVT_VARIANT PublisherMetadataPropertyBuffer, PDWORD PublisherMetadataPropertyBufferUsed);
  EVT_HANDLE EvtOpenEventMetadataEnum(        EVT_HANDLE PublisherMetadata, DWORD Flags);
  EVT_HANDLE EvtNextEventMetadata(            EVT_HANDLE EventMetadataEnum, DWORD Flags);
  BOOL       EvtGetEventMetadataProperty(     EVT_HANDLE EventMetadata, EVT_EVENT_METADATA_PROPERTY_ID PropertyId, DWORD Flags, DWORD EventMetadataPropertyBufferSize, PEVT_VARIANT EventMetadataPropertyBuffer, PDWORD EventMetadataPropertyBufferUsed);
  BOOL       EvtGetObjectArraySize(           EVT_OBJECT_ARRAY_PROPERTY_HANDLE ObjectArray, PDWORD ObjectArraySize);
  BOOL       EvtGetObjectArrayProperty(       EVT_OBJECT_ARRAY_PROPERTY_HANDLE ObjectArray, DWORD PropertyId, DWORD ArrayIndex, DWORD Flags, DWORD PropertyValueBufferSize, PEVT_VARIANT PropertyValueBuffer, PDWORD PropertyValueBufferUsed);
]]
return ffi.load( 'Wevtapi.dll' )

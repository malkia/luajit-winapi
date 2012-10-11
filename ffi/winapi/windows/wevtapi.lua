require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PEVT_VARIANT; //Alias
  typedef HANDLE EVT_HANDLE; //Alias
  typedef LPVOID EVT_SUBSCRIBE_CALLBACK; //Alias
  typedef HANDLE EVT_OBJECT_ARRAY_PROPERTY_HANDLE; //Alias
  typedef UINT EVT_CHANNEL_CONFIG_PROPERTY_ID; //Alias
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelConfigEnabled = 0;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelConfigIsolation = 1;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelConfigType = 2;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelConfigOwningPublisher = 3;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelConfigClassicEventlog = 4;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelConfigAccess = 5;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelLoggingConfigRetention = 6;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelLoggingConfigAutoBackup = 7;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelLoggingConfigMaxSize = 8;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelLoggingConfigLogFilePath = 9;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelPublishingConfigLevel = 10;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelPublishingConfigKeywords = 11;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelPublishingConfigControlGuid = 12;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelPublishingConfigBufferSize = 13;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelPublishingConfigMinBuffers = 14;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelPublishingConfigMaxBuffers = 15;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelPublishingConfigLatency = 16;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelPublishingConfigClockType = 17;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelPublishingConfigSidType = 18;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelPublisherList = 19;
  static const EVT_CHANNEL_CONFIG_PROPERTY_ID EvtChannelPublishingConfigFileMax = 20;
  typedef UINT EVT_PUBLISHER_METADATA_PROPERTY_ID; //Alias
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataPublisherGuid = 0;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataResourceFilePath = 1;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataParameterFilePath = 2;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataMessageFilePath = 3;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataHelpLink = 4;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataPublisherMessageID = 5;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataChannelReferences = 6;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataChannelReferencePath = 7;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataChannelReferenceIndex = 8;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataChannelReferenceID = 9;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataChannelReferenceFlags = 10;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataChannelReferenceMessageID = 11;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataLevels = 12;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataLevelName = 13;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataLevelValue = 14;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataLevelMessageID = 15;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataTasks = 16;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataTaskName = 17;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataTaskEventGuid = 18;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataTaskValue = 19;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataTaskMessageID = 20;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataOpcodes = 21;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataOpcodeName = 22;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataOpcodeValue = 23;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataOpcodeMessageID = 24;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataKeywords = 25;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataKeywordName = 26;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataKeywordValue = 27;
  static const EVT_PUBLISHER_METADATA_PROPERTY_ID EvtPublisherMetadataKeywordMessageID = 28;
  typedef DWORD WINAPI_EvtFormatMessageFlags; //Alias
  static const WINAPI_EvtFormatMessageFlags EvtFormatMessageEvent = 1;
  static const WINAPI_EvtFormatMessageFlags EvtFormatMessageLevel = 2;
  static const WINAPI_EvtFormatMessageFlags EvtFormatMessageTask = 3;
  static const WINAPI_EvtFormatMessageFlags EvtFormatMessageOpcode = 4;
  static const WINAPI_EvtFormatMessageFlags EvtFormatMessageKeyword = 5;
  static const WINAPI_EvtFormatMessageFlags EvtFormatMessageChannel = 6;
  static const WINAPI_EvtFormatMessageFlags EvtFormatMessageProvider = 7;
  static const WINAPI_EvtFormatMessageFlags EvtFormatMessageId = 8;
  static const WINAPI_EvtFormatMessageFlags EvtFormatMessageXml = 9;
  typedef DWORD WINAPI_EvtOpenFlags; //Alias
  typedef UINT EVT_LOG_PROPERTY_ID; //Alias
  static const EVT_LOG_PROPERTY_ID EvtLogCreationTime = 0;
  static const EVT_LOG_PROPERTY_ID EvtLogLastAccessTime = 1;
  static const EVT_LOG_PROPERTY_ID EvtLogLastWriteTime = 2;
  static const EVT_LOG_PROPERTY_ID EvtLogFileSize = 3;
  static const EVT_LOG_PROPERTY_ID EvtLogAttributes = 4;
  static const EVT_LOG_PROPERTY_ID EvtLogNumberOfLogRecords = 5;
  static const EVT_LOG_PROPERTY_ID EvtLogOldestRecordNumber = 6;
  static const EVT_LOG_PROPERTY_ID EvtLogFull = 7;
  typedef DWORD WINAPI_EvtRenderFlags; //Alias
  static const WINAPI_EvtRenderFlags EvtRenderEventValues = 0;
  static const WINAPI_EvtRenderFlags EvtRenderEventXml = 1;
  static const WINAPI_EvtRenderFlags EvtRenderBookmark = 2;
  typedef DWORD WINAPI_EvtQueryFlags; //Alias
  typedef DWORD WINAPI_EvtRenderContextFlags; //Alias
  static const WINAPI_EvtRenderContextFlags EvtRenderContextValues = 0;
  static const WINAPI_EvtRenderContextFlags EvtRenderContextSystem = 1;
  static const WINAPI_EvtRenderContextFlags EvtRenderContextUser = 2;
  typedef UINT EVT_QUERY_PROPERTY_ID; //Alias
  static const EVT_QUERY_PROPERTY_ID EvtQueryNames = 0;
  static const EVT_QUERY_PROPERTY_ID EvtQueryStatuses = 1;
  typedef DWORD WINAPI_EvtSubscribeFlags; //Alias
  typedef UINT EVT_EVENT_PROPERTY_ID; //Alias
  static const EVT_EVENT_PROPERTY_ID EvtEventQueryIDs = 0;
  static const EVT_EVENT_PROPERTY_ID EvtEventPath = 1;
  typedef DWORD WINAPI_EvtSeekFlags; //Alias
  typedef DWORD WINAPI_EvtExportLogFlags; //Alias
  typedef UINT EVT_LOGIN_CLASS; //Alias
  static const EVT_LOGIN_CLASS EvtRpcLogin = 1;
  typedef UINT EVT_EVENT_METADATA_PROPERTY_ID; //Alias
  static const EVT_EVENT_METADATA_PROPERTY_ID EventMetadataEventID = 0;
  static const EVT_EVENT_METADATA_PROPERTY_ID EventMetadataEventVersion = 1;
  static const EVT_EVENT_METADATA_PROPERTY_ID EventMetadataEventChannel = 2;
  static const EVT_EVENT_METADATA_PROPERTY_ID EventMetadataEventLevel = 3;
  static const EVT_EVENT_METADATA_PROPERTY_ID EventMetadataEventOpcode = 4;
  static const EVT_EVENT_METADATA_PROPERTY_ID EventMetadataEventTask = 5;
  static const EVT_EVENT_METADATA_PROPERTY_ID EventMetadataEventKeyword = 6;
  static const EVT_EVENT_METADATA_PROPERTY_ID EventMetadataEventMessageID = 7;
  static const EVT_EVENT_METADATA_PROPERTY_ID EventMetadataEventTemplate = 8;
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

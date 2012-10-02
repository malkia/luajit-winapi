require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
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

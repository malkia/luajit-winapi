require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/sockets" )
require( "ffi/winapi/headers/cryptography" )
local ffi = require( "ffi" )
ffi.cdef [[
  ULONG HttpCreateHttpHandle(           PHANDLE pReqQueueHandle, ULONG Reserved);
  ULONG HttpInitialize(                 HTTPAPI_VERSION Version, WINAPI_HttpInitializeFlags Flags, PVOID pReserved);
  ULONG HttpTerminate(                  WINAPI_HttpInitializeFlags Flags, PVOID pReserved);
  ULONG HttpAddFragmentToCache(         HANDLE ReqQueueHandle, PCWSTR pUrlPrefix, PHTTP_DATA_CHUNK pDataChunk, PHTTP_CACHE_POLICY pCachePolicy, LPOVERLAPPED pOverlapped);
  ULONG HttpFlushResponseCache(         HANDLE ReqQueueHandle, PCWSTR pUrlPrefix, ULONG Flags, LPOVERLAPPED pOverlapped);
  ULONG HttpReadFragmentFromCache(      HANDLE ReqQueueHandle, PCWSTR pUrlPrefix, PHTTP_BYTE_RANGE pByteRange, PVOID pBuffer, ULONG BufferLength, PULONG pBytesRead, LPOVERLAPPED pOverlapped);
  ULONG HttpDeleteServiceConfiguration( HANDLE ServiceHandle, HTTP_SERVICE_CONFIG_ID ConfigId, PVOID pConfigInformation, ULONG ConfigInformationLength, LPOVERLAPPED pOverlapped);
  ULONG HttpQueryServiceConfiguration(  HANDLE ServiceHandle, HTTP_SERVICE_CONFIG_ID ConfigId, PVOID pInputConfigInfo, ULONG InputConfigInfoLength, PVOID pOutputConfigInfo, ULONG OutputConfigInfoLength, PULONG pReturnLength, LPOVERLAPPED pOverlapped);
  ULONG HttpSetServiceConfiguration(    HANDLE ServiceHandle, HTTP_SERVICE_CONFIG_ID ConfigId, PVOID pConfigInformation, ULONG ConfigInformationLength, LPOVERLAPPED pOverlapped);
  ULONG HttpReceiveHttpRequest(         HANDLE ReqQueueHandle, HTTP_REQUEST_ID RequestId, ULONG Flags, PHTTP_REQUEST pRequestBuffer, ULONG RequestBufferLength, PULONG pBytesReceived, LPOVERLAPPED pOverlapped);
  ULONG HttpReceiveRequestEntityBody(   HANDLE ReqQueueHandle, HTTP_REQUEST_ID RequestId, ULONG Flags, PVOID pBuffer, ULONG BufferLength, PULONG pBytesReceived, LPOVERLAPPED pOverlapped);
  ULONG HttpSendHttpResponse(           HANDLE ReqQueueHandle, HTTP_REQUEST_ID RequestId, ULONG Flags, PHTTP_RESPONSE pHttpResponse, PHTTP_CACHE_POLICY pCachePolicy, PULONG pBytesSent, PVOID pReserved2, ULONG Reserved3, LPOVERLAPPED pOverlapped, PHTTP_LOG_DATA pLogData);
  ULONG HttpSendResponseEntityBody(     HANDLE ReqQueueHandle, HTTP_REQUEST_ID RequestId, ULONG Flags, USHORT EntityChunkCount, PHTTP_DATA_CHUNK pEntityChunks, PULONG pBytesSent, PVOID pReserved1, ULONG Reserved2, LPOVERLAPPED pOverlapped, PHTTP_LOG_DATA pLogData);
  ULONG HttpWaitForDisconnect(          HANDLE ReqQueueHandle, HTTP_CONNECTION_ID ConnectionId, LPOVERLAPPED pOverlapped);
  ULONG HttpReceiveClientCertificate(   HANDLE ReqQueueHandle, HTTP_CONNECTION_ID ConnectionId, ULONG Flags, PHTTP_SSL_CLIENT_CERT_INFO pSslClientCertInfo, ULONG SslClientCertInfoSize, PULONG pBytesReceived, LPOVERLAPPED pOverlapped);
  ULONG HttpAddUrl(                     HANDLE ReqQueueHandle, PCWSTR pFullyQualifiedUrl, PVOID pReserved);
  ULONG HttpRemoveUrl(                  HANDLE ReqQueueHandle, PCWSTR pFullyQualifiedUrl);
  ULONG HttpCloseServerSession(         HTTP_SERVER_SESSION_ID ServerSessionId);
  ULONG HttpCreateServerSession(        HTTPAPI_VERSION Version, PHTTP_SERVER_SESSION_ID pServerSessionId, ULONG Reserved);
  ULONG HttpQueryServerSessionProperty( HTTP_SERVER_SESSION_ID ServerSessionId, HTTP_SERVER_PROPERTY Property, PVOID pPropertyInformation, ULONG PropertyInformationLength, PULONG pReturnLength);
  ULONG HttpSetServerSessionProperty(   HTTP_SERVER_SESSION_ID ServerSessionId, HTTP_SERVER_PROPERTY Property, PVOID pPropertyInformation, ULONG PropertyInformationLength);
  ULONG HttpAddUrlToUrlGroup(           HTTP_URL_GROUP_ID UrlGroupId, PCWSTR pFullyQualifiedUrl, HTTP_URL_CONTEXT UrlContext, ULONG Reserved);
  ULONG HttpCreateUrlGroup(             HTTP_SERVER_SESSION_ID ServerSessionId, PHTTP_URL_GROUP_ID pUrlGroupId, ULONG Reserved);
  ULONG HttpCloseUrlGroup(              HTTP_URL_GROUP_ID UrlGroupId);
  ULONG HttpQueryUrlGroupProperty(      HTTP_URL_GROUP_ID UrlGroupId, HTTP_SERVER_PROPERTY Property, PVOID pPropertyInformation, ULONG PropertyInformationLength, PULONG pReturnLength);
  ULONG HttpRemoveUrlFromUrlGroup(      HTTP_URL_GROUP_ID UrlGroupId, PCWSTR pFullyQualifiedUrl, ULONG Flags);
  ULONG HttpSetUrlGroupProperty(        HTTP_URL_GROUP_ID UrlGroupId, HTTP_SERVER_PROPERTY Property, PVOID pPropertyInformation, ULONG PropertyInformationLength);
  ULONG HttpCloseRequestQueue(          HANDLE ReqQueueHandle);
  ULONG HttpCreateRequestQueue(         HTTPAPI_VERSION Version, PCWSTR pName, PSECURITY_ATTRIBUTES pSecurityAttributes, ULONG Flags, PHANDLE pReqQueueHandle);
  ULONG HttpSetRequestQueueProperty(    HANDLE Handle, HTTP_SERVER_PROPERTY Property, PVOID pPropertyInformation, ULONG PropertyInformationLength, ULONG Reserved, PVOID pReserved);
  ULONG HttpWaitForDemandStart(         HANDLE ReqQueueHandle, LPOVERLAPPED pOverlapped);
]]
return ffi.load( "Httpapi.dll" )

require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/sockets' )
require( 'ffi/winapi/headers/cryptography' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UINT HTTPAPI_VERSION; //Alias
  typedef ULONGLONG HTTP_OPAQUE_ID; //Alias
  typedef HTTP_OPAQUE_ID HTTP_REQUEST_ID; //Alias
  typedef HTTP_OPAQUE_ID HTTP_CONNECTION_ID; //Alias
  typedef HTTP_OPAQUE_ID HTTP_RAW_CONNECTION_ID; //Alias
  typedef HTTP_OPAQUE_ID HTTP_SERVER_SESSION_ID; //Alias
  typedef HTTP_SERVER_SESSION_ID *PHTTP_SERVER_SESSION_ID; //Pointer
  typedef HTTP_OPAQUE_ID HTTP_URL_GROUP_ID; //Alias
  typedef HTTP_URL_GROUP_ID *PHTTP_URL_GROUP_ID; //Pointer
  typedef ULONGLONG HTTP_URL_CONTEXT; //Alias
  typedef struct HTTP_BYTE_RANGE {
    ULARGE_INTEGER StartingOffset;
    ULARGE_INTEGER Length;
  } HTTP_BYTE_RANGE;
  typedef HTTP_BYTE_RANGE *PHTTP_BYTE_RANGE; //Pointer
  typedef UINT HTTP_DATA_CHUNK_TYPE; //Alias
  static const UINT HttpDataChunkFromMemory = 0;
  static const UINT HttpDataChunkFromFileHandle = 1;
  static const UINT HttpDataChunkFromFragmentCache = 2;
  static const UINT HttpDataChunkFromFragmentCacheEx = 3;
  typedef struct WINAPI_HTTP_DATA_CHUNK_u_s1 {
    PVOID pBuffer;
    ULONG BufferLength;
  } WINAPI_HTTP_DATA_CHUNK_u_s1;
  typedef struct WINAPI_HTTP_DATA_CHUNK_u_s2 {
    HTTP_BYTE_RANGE ByteRange;
    HANDLE FileHandle;
  } WINAPI_HTTP_DATA_CHUNK_u_s2;
  typedef struct WINAPI_HTTP_DATA_CHUNK_u_s3 {
    USHORT FragmentNameLength;
    PCWSTR pFragmentName;
  } WINAPI_HTTP_DATA_CHUNK_u_s3;
  typedef struct WINAPI_HTTP_DATA_CHUNK_u_s4 {
    HTTP_BYTE_RANGE ByteRange;
    PCWSTR pFragmentName;
  } WINAPI_HTTP_DATA_CHUNK_u_s4;
  typedef union WINAPI_HTTP_DATA_CHUNK_u {
    WINAPI_HTTP_DATA_CHUNK_u_s1 FromMemory;
    WINAPI_HTTP_DATA_CHUNK_u_s2 FromFileHandle;
    WINAPI_HTTP_DATA_CHUNK_u_s3 FromFragmentCache;
    WINAPI_HTTP_DATA_CHUNK_u_s4 FromFragmentCacheEx;
  } WINAPI_HTTP_DATA_CHUNK_u;
  typedef struct HTTP_DATA_CHUNK {
    HTTP_DATA_CHUNK_TYPE DataChunkType;
    WINAPI_HTTP_DATA_CHUNK_u ;
  } HTTP_DATA_CHUNK;
  typedef HTTP_DATA_CHUNK *PHTTP_DATA_CHUNK; //Pointer
  typedef UINT HTTP_CACHE_POLICY_TYPE; //Alias
  static const UINT HttpCachePolicyNocache = 0;
  static const UINT HttpCachePolicyUserInvalidates = 1;
  static const UINT HttpCachePolicyTimeToLive = 2;
  typedef struct HTTP_CACHE_POLICY {
    HTTP_CACHE_POLICY_TYPE Policy;
    ULONG SecondsToLive;
  } HTTP_CACHE_POLICY;
  typedef HTTP_CACHE_POLICY *PHTTP_CACHE_POLICY; //Pointer
  typedef UINT HTTP_LOG_DATA_TYPE; //Alias
  static const UINT HttpLogDataTypeFields = 0;
  typedef struct HTTP_LOG_DATA {
    HTTP_LOG_DATA_TYPE Type;
  } HTTP_LOG_DATA;
  typedef HTTP_LOG_DATA *PHTTP_LOG_DATA; //Pointer
  typedef UINT HTTP_SERVICE_CONFIG_ID; //Alias
  static const UINT HttpServiceConfigIPListenList = 0;
  static const UINT HttpServiceConfigSSLCertInfo = 1;
  static const UINT HttpServiceConfigUrlAclInfo = 2;
  static const UINT HttpServiceConfigTimeout = 3;
  static const UINT HttpServiceConfigMax = 4;
  typedef UINT HTTP_SERVER_PROPERTY; //Alias
  static const UINT HttpServerAuthenticationProperty = 0;
  static const UINT HttpServerLoggingProperty = 1;
  static const UINT HttpServerQosProperty = 2;
  static const UINT HttpServerTimeoutsProperty = 3;
  static const UINT HttpServerQueueLengthProperty = 4;
  static const UINT HttpServerStateProperty = 5;
  static const UINT HttpServer503VerbosityProperty = 6;
  static const UINT HttpServerBindingProperty = 7;
  static const UINT HttpServerExtendedAuthenticationProperty = 8;
  static const UINT HttpServerListenEndpointProperty = 9;
  typedef ULONG WINAPI_HttpInitializeFlags; //Alias
  typedef ULONG WINAPI_HTTP_REQUEST_FLAG; //Alias
  typedef struct HTTP_VERSION {
    USHORT MajorVersion;
    USHORT MinorVersion;
  } HTTP_VERSION;
  typedef UINT HTTP_VERB; //Alias
  static const UINT HttpVerbUnparsed = 0;
  static const UINT HttpVerbUnknown = 1;
  static const UINT HttpVerbInvalid = 2;
  static const UINT HttpVerbOPTIONS = 3;
  static const UINT HttpVerbGET = 4;
  static const UINT HttpVerbHEAD = 5;
  static const UINT HttpVerbPOST = 6;
  static const UINT HttpVerbPUT = 7;
  static const UINT HttpVerbDELETE = 8;
  static const UINT HttpVerbTRACE = 9;
  static const UINT HttpVerbCONNECT = 10;
  static const UINT HttpVerbTRACK = 11;
  static const UINT HttpVerbMOVE = 12;
  static const UINT HttpVerbCOPY = 13;
  static const UINT HttpVerbPROPFIND = 14;
  static const UINT HttpVerbPROPPATCH = 15;
  static const UINT HttpVerbMKCOL = 16;
  static const UINT HttpVerbLOCK = 17;
  static const UINT HttpVerbUNLOCK = 18;
  static const UINT HttpVerbSEARCH = 19;
  typedef struct HTTP_COOKED_URL {
    USHORT FullUrlLength;
    USHORT HostLength;
    USHORT AbsPathLength;
    USHORT QueryStringLength;
    PCWSTR pFullUrl;
    PCWSTR pHost;
    PCWSTR pAbsPath;
    PCWSTR pQueryString;
  } HTTP_COOKED_URL;
  typedef struct HTTP_TRANSPORT_ADDRESS {
    PSOCKADDR pRemoteAddress;
    PSOCKADDR pLocalAddress;
  } HTTP_TRANSPORT_ADDRESS;
  typedef struct HTTP_UNKNOWN_HEADER {
    USHORT NameLength;
    USHORT RawValueLength;
    PCSTR pName;
    PCSTR pRawValue;
  } HTTP_UNKNOWN_HEADER;
  typedef HTTP_UNKNOWN_HEADER *PHTTP_UNKNOWN_HEADER; //Pointer
  typedef struct HTTP_KNOWN_HEADER {
    USHORT RawValueLength;
    PCSTR pRawValue;
  } HTTP_KNOWN_HEADER;
  enum { HttpHeaderRequestMaximum = 41 };
  enum { HttpHeaderResponseMaximum = 30 };
  typedef struct HTTP_REQUEST_HEADERS {
    USHORT UnknownHeaderCount;
    PHTTP_UNKNOWN_HEADER pUnknownHeaders;
    USHORT TrailerCount;
    PHTTP_UNKNOWN_HEADER pTrailers;
    HTTP_KNOWN_HEADER KnownHeaders[HttpHeaderRequestMaximum];
  } HTTP_REQUEST_HEADERS;
  typedef struct HTTP_SSL_CLIENT_CERT_INFO {
    WINAPI_CERT_TRUST_Error CertFlags;
    ULONG CertEncodedSize;
    PUCHAR pCertEncoded;
    HANDLE Token;
    BOOLEAN CertDeniedByMapper;
  } HTTP_SSL_CLIENT_CERT_INFO;
  typedef HTTP_SSL_CLIENT_CERT_INFO *PHTTP_SSL_CLIENT_CERT_INFO; //Pointer
  typedef struct HTTP_SSL_INFO {
    USHORT ServerCertKeySize;
    USHORT ConnectionKeySize;
    ULONG ServerCertIssuerSize;
    ULONG ServerCertSubjectSize;
    PCSTR pServerCertIssuer;
    PCSTR pServerCertSubject;
    PHTTP_SSL_CLIENT_CERT_INFO pClientCertInfo;
    ULONG SslClientCertNegotiated;
  } HTTP_SSL_INFO;
  typedef HTTP_SSL_INFO *PHTTP_SSL_INFO; //Pointer
  typedef struct HTTP_REQUEST_V1 {
    WINAPI_HTTP_REQUEST_FLAG Flags;
    HTTP_CONNECTION_ID ConnectionId;
    HTTP_REQUEST_ID RequestId;
    HTTP_URL_CONTEXT UrlContext;
    HTTP_VERSION Version;
    HTTP_VERB Verb;
    USHORT UnknownVerbLength;
    USHORT RawUrlLength;
    PCSTR pUnknownVerb;
    PCSTR pRawUrl;
    HTTP_COOKED_URL CookedUrl;
    HTTP_TRANSPORT_ADDRESS Address;
    HTTP_REQUEST_HEADERS Headers;
    ULONGLONG BytesReceived;
    USHORT EntityChunkCount;
    PHTTP_DATA_CHUNK pEntityChunks;
    HTTP_RAW_CONNECTION_ID RawConnectionId;
    PHTTP_SSL_INFO pSslInfo;
  } HTTP_REQUEST_V1;
  typedef UINT HTTP_REQUEST_INFO_TYPE; //Alias
  static const UINT HttpRequestInfoTypeAuth = 0;
  static const UINT HttpRequestInfoTypeChannelBind = 1;
  typedef struct HTTP_REQUEST_INFO {
    HTTP_REQUEST_INFO_TYPE InfoType;
    ULONG InfoLength;
    PVOID pInfo;
  } HTTP_REQUEST_INFO;
  typedef HTTP_REQUEST_INFO *PHTTP_REQUEST_INFO; //Pointer
  typedef struct HTTP_REQUEST {
    HTTP_REQUEST_V1 ;
    USHORT RequestInfoCount;
    PHTTP_REQUEST_INFO pRequestInfo;
  } HTTP_REQUEST;
  typedef HTTP_REQUEST *PHTTP_REQUEST; //Pointer
  typedef ULONG WINAPI_HTTP_RESPONSE_FLAG; //Alias
  typedef struct HTTP_RESPONSE_HEADERS {
    USHORT UnknownHeaderCount;
    PHTTP_UNKNOWN_HEADER pUnknownHeaders;
    USHORT TrailerCount;
    PHTTP_UNKNOWN_HEADER pTrailers;
    HTTP_KNOWN_HEADER KnownHeaders[HttpHeaderResponseMaximum];
  } HTTP_RESPONSE_HEADERS;
  typedef struct HTTP_RESPONSE_V1 {
    WINAPI_HTTP_RESPONSE_FLAG Flags;
    HTTP_VERSION Version;
    USHORT StatusCode;
    USHORT ReasonLength;
    PCSTR pReason;
    HTTP_RESPONSE_HEADERS Headers;
    USHORT EntityChunkCount;
    PHTTP_DATA_CHUNK pEntityChunks;
  } HTTP_RESPONSE_V1;
  typedef UINT HTTP_RESPONSE_INFO_TYPE; //Alias
  static const UINT HttpResponseInfoTypeMultipleKnownHeaders = 0;
  static const UINT HttpResponseInfoTypeAuthenticationProperty = 1;
  static const UINT HttpResponseInfoTypeQoSProperty = 2;
  static const UINT HttpResponseInfoTypeChannelBind = 3;
  typedef struct HTTP_RESPONSE_INFO {
    HTTP_RESPONSE_INFO_TYPE Type;
    ULONG Length;
    PVOID pInfo;
  } HTTP_RESPONSE_INFO;
  typedef HTTP_RESPONSE_INFO *PHTTP_RESPONSE_INFO; //Pointer
  typedef struct HTTP_RESPONSE {
    HTTP_RESPONSE_V1 ;
    USHORT ResponseInfoCount;
    PHTTP_RESPONSE_INFO pResponseInfo;
  } HTTP_RESPONSE;
  typedef HTTP_RESPONSE *PHTTP_RESPONSE; //Pointer
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
return ffi.load( 'Httpapi.dll' )

require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* RPC_BINDING_HANDLE; //Alias
  typedef LPTSTR RPC_TSTR; //Alias
  typedef void* RPC_IF_HANDLE; //Alias
  typedef void* RPC_NS_HANDLE; //Alias
  typedef void* RPC_AUTHZ_HANDLE; //Alias
  typedef void* RPC_AUTH_IDENTITY_HANDLE; //Alias
  typedef void* RPC_EP_INQ_HANDLE; //Alias
  typedef LPVOID RPC_CLIENT_ALLOC*; //Alias
  typedef LPVOID RPC_CLIENT_FREE*; //Alias
  typedef LPVOID RPC_MGMT_AUTHORIZATION_FN; //Alias
  typedef LPVOID RPC_OBJECT_INQ_FN; //Alias
  typedef void* RPC_MGR_EPV*; //Alias
  typedef LPVOID RPC_AUTH_KEY_RETRIEVAL_FN; //Alias
  typedef LPVOID RPC_IF_CALLBACK_FN*; //Alias
  typedef void* RPC_SS_THREAD_HANDLE; //Alias
  typedef LPVOID PFN_RPCNOTIFICATION_ROUTINE; //Alias
  typedef UUID* UUID* [1]; //Array 1
  typedef RPC_TSTR RPC_TSTR [1]; //Array 1
  typedef LONG_PTR LONG_PTR [4]; //Array 4
  typedef unsigned long unsigned long [1]; //Array 1
  typedef RPC_BINDING_HANDLE RPC_BINDING_HANDLE [1]; //Array 1
  typedef struct RPC_PROTSEQ_VECTOR {
    unsigned int Count,
    RPC_TSTR [1] Protseq,
  } RPC_PROTSEQ_VECTOR;
  typedef union WINAPI_RPC_BINDING_HANDLE_TEMPLATE_V1_u {
    RPC_TSTR Reserved,
  } WINAPI_RPC_BINDING_HANDLE_TEMPLATE_V1_u;
  typedef unsigned long WINAPI_RPC_BHT; //Alias
  typedef struct RPC_BINDING_HANDLE_TEMPLATE_V1 {
    unsigned long Version,
    WINAPI_RPC_BHT Flags,
    unsigned long ProtocolSequence,
    RPC_TSTR NetworkAddress,
    RPC_TSTR StringEndpoint,
    WINAPI_RPC_BINDING_HANDLE_TEMPLATE_V1_u u1,
    UUID ObjectUuid,
  } RPC_BINDING_HANDLE_TEMPLATE_V1;
  typedef unsigned long WINAPI_RPC_C_QOS_CAPABILITIES; //Alias
  typedef enum WINAPI_RPC_C_QOS_IDENTITY {
    RPC_C_QOS_IDENTITY_STATIC = 0,
    RPC_C_QOS_IDENTITY_DYNAMIC = 1,
  } WINAPI_RPC_C_QOS_IDENTITY;
  typedef enum WINAPI_RPC_C_IMP_LEVEL {
    RPC_C_IMP_LEVEL_DEFAULT = 0,
    RPC_C_IMP_LEVEL_ANONYMOUS = 1,
    RPC_C_IMP_LEVEL_IDENTIFY = 2,
    RPC_C_IMP_LEVEL_IMPERSONATE = 3,
    RPC_C_IMP_LEVEL_DELEGATE = 4,
  } WINAPI_RPC_C_IMP_LEVEL;
  typedef struct RPC_SECURITY_QOS {
    unsigned long Version,
    WINAPI_RPC_C_QOS_CAPABILITIES Capabilities,
    WINAPI_RPC_C_QOS_IDENTITY IdentityTracking,
    WINAPI_RPC_C_IMP_LEVEL ImpersonationType,
  } RPC_SECURITY_QOS;
  typedef enum WINAPI_RPC_C_AUTHN_LEVEL {
    RPC_C_AUTHN_LEVEL_DEFAULT = 0,
    RPC_C_AUTHN_LEVEL_NONE = 1,
    RPC_C_AUTHN_LEVEL_CONNECT = 2,
    RPC_C_AUTHN_LEVEL_CALL = 3,
    RPC_C_AUTHN_LEVEL_PKT = 4,
    RPC_C_AUTHN_LEVEL_PKT_INTEGRITY = 5,
    RPC_C_AUTHN_LEVEL_PKT_PRIVACY = 6,
  } WINAPI_RPC_C_AUTHN_LEVEL;
  typedef enum WINAPI_RPC_C_AUTHN_SVC {
    RPC_C_AUTHN_NONE = 0,
    RPC_C_AUTHN_DCE_PRIVATE = 1,
    RPC_C_AUTHN_DCE_PUBLIC = 2,
    RPC_C_AUTHN_DEC_PUBLIC = 4,
    RPC_C_AUTHN_GSS_NEGOTIATE = 9,
    RPC_C_AUTHN_WINNT = 10,
    RPC_C_AUTHN_GSS_SCHANNEL = 14,
    RPC_C_AUTHN_GSS_KERBEROS = 16,
    RPC_C_AUTHN_DPA = 17,
    RPC_C_AUTHN_MSN = 18,
    RPC_C_AUTHN_DIGEST = 21,
    RPC_C_AUTHN_MQ = 100,
    RPC_C_AUTHN_DEFAULT = 0xFFFFFFFF,
  } WINAPI_RPC_C_AUTHN_SVC;
  typedef unsigned long WINAPI_SEC_WINNT_AUTH_IDENTITY; //Alias
  typedef struct SEC_WINNT_AUTH_IDENTITY {
    RPC_TSTR User,
    unsigned long UserLength,
    RPC_TSTR Domain,
    unsigned long DomainLength,
    RPC_TSTR Password,
    long PasswordLength,
    WINAPI_SEC_WINNT_AUTH_IDENTITY Flags,
  } SEC_WINNT_AUTH_IDENTITY;
  typedef struct RPC_BINDING_HANDLE_SECURITY_V1 {
    unsigned long Version,
    RPC_TSTR ServerPrincName,
    WINAPI_RPC_C_AUTHN_LEVEL AuthnLevel,
    WINAPI_RPC_C_AUTHN_SVC AuthnSvc,
    SEC_WINNT_AUTH_IDENTITY* AuthIdentity,
    RPC_SECURITY_QOS* SecurityQos,
  } RPC_BINDING_HANDLE_SECURITY_V1;
  typedef unsigned long WINAPI_RPC_BHO; //Alias
  typedef struct RPC_BINDING_HANDLE_OPTIONS_V1 {
    unsigned long Version,
    WINAPI_RPC_BHO Flags,
    unsigned long ComTimeout,
    unsigned long CallTimeout,
  } RPC_BINDING_HANDLE_OPTIONS_V1;
  typedef struct RPC_BINDING_VECTOR {
    unsigned long Count,
    RPC_BINDING_HANDLE [1] BindingH,
  } RPC_BINDING_VECTOR;
  typedef struct RPC_IF_ID {
    UUID Uuid,
    unsigned short VersMajor,
    unsigned short VersMinor,
  } RPC_IF_ID;
  typedef RPC_IF_ID* RPC_IF_ID* [1]; //Array 1
  typedef struct RPC_IF_ID_VECTOR {
    unsigned long Count,
    RPC_IF_ID* [1] IfId,
  } RPC_IF_ID_VECTOR;
  typedef struct RPC_STATS_VECTOR {
    unsigned int Count,
    unsigned long [1] Stats,
  } RPC_STATS_VECTOR;
  typedef struct UUID_VECTOR {
    unsigned long Count,
    UUID* [1] Uuid,
  } UUID_VECTOR;
  typedef struct RPC_VERSION {
    unsigned short MajorVersion,
    unsigned short MinorVersion,
  } RPC_VERSION;
  typedef struct RPC_SYNTAX_IDENTIFIER {
    GUID SyntaxGUID,
    RPC_VERSION SyntaxVersion,
  } RPC_SYNTAX_IDENTIFIER;
  typedef RPC_SYNTAX_IDENTIFIER *PRPC_SYNTAX_IDENTIFIER; //Pointer
  typedef unsigned long WINAPI_RPC_POLICY_EndPoint; //Alias
  typedef unsigned long WINAPI_RPC_POLICY_Nic; //Alias
  typedef struct RPC_POLICY {
    unsigned int Length,
    WINAPI_RPC_POLICY_EndPoint EndpointFlags,
    WINAPI_RPC_POLICY_Nic NICFlags,
  } RPC_POLICY;
  typedef RPC_POLICY *PRPC_POLICY; //Pointer
  typedef struct RPC_ERROR_ENUM_HANDLE {
    ULONG Signature,
    void* CurrentPos,
    void* Head,
  } RPC_ERROR_ENUM_HANDLE;
  typedef enum RPC_NOTIFICATIONS {
    RpcNotificationCallNone = 0,
    RpcNotificationClientDisconnect = 1,
    RpcNotificationCallCancel = 2,
  } RPC_NOTIFICATIONS;
  typedef WINAPI_RPC_C_AUTHN_LEVEL WINAPI_RPC_C_AUTHN_LEVEL_unsigned_int; //Alias
  typedef enum WINAPI_RPC_C_AUTHZ {
    RPC_C_AUTHZ_NONE = 0,
    RPC_C_AUTHZ_NAME = 1,
    RPC_C_AUTHZ_DCE = 2,
    RPC_C_AUTHZ_DEFAULT = 0xffffffff,
  } WINAPI_RPC_C_AUTHZ;
  typedef enum RPC_STATUS {
    RPC_S_OK = 0,
    RPC_S_INVALID_ARG = 87,
    RPC_S_OUT_OF_MEMORY = 14,
    RPC_S_OUT_OF_THREADS = 164,
    RPC_S_BUFFER_TOO_SMALL = 122,
    RPC_S_INVALID_SECURITY_DESC = 1338,
    RPC_S_ACCESS_DENIED = 5,
    RPC_S_SERVER_OUT_OF_MEMORY = 1130,
    RPC_S_ASYNC_CALL_PENDING = 997,
    RPC_S_UNKNOWN_PRINCIPAL = 1332,
    RPC_S_TIMEOUT = 1460,
    RPC_S_NOT_ENOUGH_QUOTA = 1816,
  } RPC_STATUS;
  typedef enum ExtendedErrorParamTypes {
    eeptAnsiString = 1,
    eeptUnicodeString = 2,
    eeptLongVal = 3,
    eeptShortVal = 4,
    eeptPointerVal = 5,
    eeptNone = 6,
    eeptBinary = 7,
  } ExtendedErrorParamTypes;
  typedef struct BinaryParam {
    void* Buffer,
    short Size,
  } BinaryParam;
  typedef union WINAPI_RPC_EE_INFO_PARAM_u {
    LPSTR AnsiString,
    LPWSTR UnicodeString,
    long LVal,
    short SVal,
    ULONGLONG PVal,
    BinaryParam BVal,
  } WINAPI_RPC_EE_INFO_PARAM_u;
  typedef struct RPC_EE_INFO_PARAM {
    ExtendedErrorParamTypes ParameterType,
    WINAPI_RPC_EE_INFO_PARAM_u u,
  } RPC_EE_INFO_PARAM;
  typedef RPC_EE_INFO_PARAM RPC_EE_INFO_PARAM [MaxNumberOfEEInfoParams]; //Array 4
  typedef union WINAPI_RPC_EXTENDED_ERROR_INFO_u {
    SYSTEMTIME SystemTime,
    FILETIME FileTime,
  } WINAPI_RPC_EXTENDED_ERROR_INFO_u;
  typedef USHORT WINAPI_RPC_EE_FLAGS; //Alias
  typedef struct RPC_EXTENDED_ERROR_INFO {
    ULONG Version,
    LPWSTR ComputerName,
    ULONG ProcessID,
    WINAPI_RPC_EXTENDED_ERROR_INFO_u u,
    ULONG GeneratingComponent,
    ULONG Status,
    USHORT DetectionLocation,
    WINAPI_RPC_EE_FLAGS Flags,
    int NumberOfParameters,
    RPC_EE_INFO_PARAM [MaxNumberOfEEInfoParams] Parameters,
  } RPC_EXTENDED_ERROR_INFO;
  typedef struct WINAPI_RPC_ASYNC_NOTIFICATION_INFO_s1 {
    PFN_RPCNOTIFICATION_ROUTINE NotificationRoutine,
    HANDLE hThread,
  } WINAPI_RPC_ASYNC_NOTIFICATION_INFO_s1;
  typedef struct WINAPI_RPC_ASYNC_NOTIFICATION_INFO_s2 {
    HANDLE hIOPort,
    DWORD dwNumberOfBytesTransferred,
    DWORD_PTR dwCompletionKey,
    LPOVERLAPPED lpOverlapped,
  } WINAPI_RPC_ASYNC_NOTIFICATION_INFO_s2;
  typedef struct WINAPI_RPC_ASYNC_NOTIFICATION_INFO_s3 {
    HWND hWnd,
    WINAPI_WinMsg Msg,
  } WINAPI_RPC_ASYNC_NOTIFICATION_INFO_s3;
  typedef union RPC_ASYNC_NOTIFICATION_INFO {
    WINAPI_RPC_ASYNC_NOTIFICATION_INFO_s1 APC,
    WINAPI_RPC_ASYNC_NOTIFICATION_INFO_s2 IOC,
    WINAPI_RPC_ASYNC_NOTIFICATION_INFO_s3 HWND,
    HANDLE hEvent,
    PFN_RPCNOTIFICATION_ROUTINE NotificationRoutine,
  } RPC_ASYNC_NOTIFICATION_INFO;
  typedef unsigned long WINAPI_RPC_ASYNC_STATE_FLAGS; //Alias
  typedef enum RPC_ASYNC_EVENT {
    RpcCallComplete = 0,
    RpcSendComplete = 1,
    RpcReceiveComplete = 2,
    RpcClientDisconnect = 3,
    RpcClientCancel = 4,
  } RPC_ASYNC_EVENT;
  typedef enum RPC_NOTIFICATION_TYPES {
    RpcNotificationTypeNone = 0,
    RpcNotificationTypeEvent = 1,
    RpcNotificationTypeApc = 2,
    RpcNotificationTypeIoc = 3,
    RpcNotificationTypeHwnd = 4,
    RpcNotificationTypeCallback = 5,
  } RPC_NOTIFICATION_TYPES;
  typedef struct RPC_ASYNC_STATE {
    unsigned int Size,
    unsigned long Signature,
    long Lock,
    WINAPI_RPC_ASYNC_STATE_FLAGS Flags,
    void* StubInfo,
    void* UserInfo,
    void* RuntimeInfo,
    RPC_ASYNC_EVENT Event,
    RPC_NOTIFICATION_TYPES NotificationType,
    RPC_ASYNC_NOTIFICATION_INFO u,
    LONG_PTR [4] Reserved,
  } RPC_ASYNC_STATE;
  typedef RPC_ASYNC_STATE *PRPC_ASYNC_STATE; //Pointer
]]

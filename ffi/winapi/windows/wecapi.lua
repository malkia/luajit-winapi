require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef HANDLE EC_HANDLE; //Alias
  typedef HANDLE EC_OBJECT_ARRAY_PROPERTY_HANDLE; //Alias
  typedef UINT EC_SUBSCRIPTION_PROPERTY_ID; //Alias
  static const UINT EcSubscriptionEnabled = 0;
  static const UINT EcSubscriptionEventSources = 1;
  static const UINT EcSubscriptionEventSourceAddress = 2;
  static const UINT EcSubscriptionEventSourceEnabled = 3;
  static const UINT EcSubscriptionEventSourceUserName = 4;
  static const UINT EcSubscriptionEventSourcePassword = 5;
  static const UINT EcSubscriptionDescription = 6;
  static const UINT EcSubscriptionURI = 7;
  static const UINT EcSubscriptionConfigurationMode = 8;
  static const UINT EcSubscriptionExpires = 9;
  static const UINT EcSubscriptionQuery = 10;
  static const UINT EcSubscriptionTransportName = 11;
  static const UINT EcSubscriptionTransportPort = 12;
  static const UINT EcSubscriptionDeliveryMode = 13;
  static const UINT EcSubscriptionDeliveryMaxItems = 14;
  static const UINT EcSubscriptionDeliveryMaxLatencyTime = 15;
  static const UINT EcSubscriptionHeartbeatInterval = 16;
  static const UINT EcSubscriptionLocale = 17;
  static const UINT EcSubscriptionContentFormat = 18;
  static const UINT EcSubscriptionLogFile = 19;
  static const UINT EcSubscriptionPublisherName = 20;
  static const UINT EcSubscriptionCredentialsType = 21;
  static const UINT EcSubscriptionCommonUserName = 22;
  static const UINT EcSubscriptionCommonPassword = 23;
  static const UINT EcSubscriptionHostName = 24;
  static const UINT EcSubscriptionReadExistingEvents = 25;
  static const UINT EcSubscriptionDialect = 26;
  typedef UINT EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID; //Alias
  static const UINT EcSubscriptionRunTimeStatusActive = 0;
  static const UINT EcSubscriptionRunTimeStatusLastError = 1;
  static const UINT EcSubscriptionRunTimeStatusLastErrorMessage = 2;
  static const UINT EcSubscriptionRunTimeStatusLastErrorTime = 3;
  static const UINT EcSubscriptionRunTimeStatusNextRetryTime = 4;
  static const UINT EcSubscriptionRunTimeStatusInfoIdEND = 5;
  typedef union WINAPI_EC_VARIANT_u {
    BOOL BooleanVal;
    UINT32 UInt32Val;
    ULONGLONG DateTimeVal;
    LPCWSTR StringVal;
    PBYTE BinaryVal;
    BOOL* BooleanArr;
    INT32* Int32Arr;
    LPWSTR* StringArr;
    EC_OBJECT_ARRAY_PROPERTY_HANDLE PropertyHandleVal;
  } WINAPI_EC_VARIANT_u;
  typedef DWORD EC_VARIANT_TYPE; //Alias
  typedef struct EC_VARIANT {
    WINAPI_EC_VARIANT_u ;
    DWORD Count;
    EC_VARIANT_TYPE Type;
  } EC_VARIANT;
  typedef EC_VARIANT *PEC_VARIANT; //Pointer
  BOOL      EcClose(                        EC_HANDLE Object);
  BOOL      EcDeleteSubscription(           LPCWSTR SubscriptionName, DWORD Flags);
  BOOL      EcEnumNextSubscription(         EC_HANDLE SubscriptionEnum, DWORD SubscriptionNameBufferSize, LPWSTR SubscriptionNameBuffer, PDWORD SubscriptionNameBufferUsed);
  BOOL      EcGetObjectArrayProperty(       EC_OBJECT_ARRAY_PROPERTY_HANDLE ObjectArray, EC_SUBSCRIPTION_PROPERTY_ID PropertyId, DWORD ArrayIndex, DWORD Flags, DWORD PropertyValueBufferSize, PEC_VARIANT PropertyValueBuffer, PDWORD PropertyValueBufferUsed);
  BOOL      EcGetObjectArraySize(           EC_OBJECT_ARRAY_PROPERTY_HANDLE ObjectArray, PDWORD ObjectArraySize);
  BOOL      EcGetSubscriptionProperty(      EC_HANDLE Subscription, EC_SUBSCRIPTION_PROPERTY_ID PropertyId, DWORD Flags, DWORD PropertyValueBufferSize, PEC_VARIANT PropertyValueBuffer, PDWORD PropertyValueBufferUsed);
  BOOL      EcGetSubscriptionRunTimeStatus( LPCWSTR SubscriptionName, EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID StatusInfoId, LPCWSTR EventSourceName, DWORD Flags, DWORD StatusValueBufferSize, PEC_VARIANT StatusValueBuffer, PDWORD StatusValueBufferUsed);
  BOOL      EcInsertObjectArrayElement(     EC_OBJECT_ARRAY_PROPERTY_HANDLE ObjectArray, DWORD ArrayIndex);
  EC_HANDLE EcOpenSubscriptionEnum(         DWORD Flags);
  EC_HANDLE EcOpenSubscription(             LPCWSTR SubscriptionName, DWORD AccessMask, DWORD Flags);
  BOOL      EcSaveSubscription(             EC_HANDLE Subscription, DWORD Flags);
  BOOL      EcSetObjectArrayProperty(       EC_OBJECT_ARRAY_PROPERTY_HANDLE ObjectArray, EC_SUBSCRIPTION_PROPERTY_ID PropertyId, DWORD ArrayIndex, DWORD Flags, PEC_VARIANT PropertyValue);
  BOOL      EcSetSubscriptionProperty(      EC_HANDLE Subscription, EC_SUBSCRIPTION_PROPERTY_ID PropertyId, DWORD Flags, PEC_VARIANT PropertyValue);
  BOOL      EcRemoveObjectArrayElement(     EC_OBJECT_ARRAY_PROPERTY_HANDLE ObjectArray, DWORD ArrayIndex);
  BOOL      EcRetrySubscription(            LPCWSTR SubscriptionName, LPCWSTR EventSourceName, DWORD Flags);
]]
return ffi.load( 'Wecapi.dll' )

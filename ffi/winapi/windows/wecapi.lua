require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef HANDLE EC_HANDLE; //Alias
  typedef HANDLE EC_OBJECT_ARRAY_PROPERTY_HANDLE; //Alias
  typedef UINT EC_SUBSCRIPTION_PROPERTY_ID; //Alias
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionEnabled = 0;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionEventSources = 1;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionEventSourceAddress = 2;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionEventSourceEnabled = 3;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionEventSourceUserName = 4;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionEventSourcePassword = 5;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionDescription = 6;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionURI = 7;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionConfigurationMode = 8;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionExpires = 9;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionQuery = 10;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionTransportName = 11;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionTransportPort = 12;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionDeliveryMode = 13;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionDeliveryMaxItems = 14;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionDeliveryMaxLatencyTime = 15;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionHeartbeatInterval = 16;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionLocale = 17;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionContentFormat = 18;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionLogFile = 19;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionPublisherName = 20;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionCredentialsType = 21;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionCommonUserName = 22;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionCommonPassword = 23;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionHostName = 24;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionReadExistingEvents = 25;
  static const EC_SUBSCRIPTION_PROPERTY_ID EcSubscriptionDialect = 26;
  typedef UINT EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID; //Alias
  static const EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID EcSubscriptionRunTimeStatusActive = 0;
  static const EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID EcSubscriptionRunTimeStatusLastError = 1;
  static const EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID EcSubscriptionRunTimeStatusLastErrorMessage = 2;
  static const EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID EcSubscriptionRunTimeStatusLastErrorTime = 3;
  static const EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID EcSubscriptionRunTimeStatusNextRetryTime = 4;
  static const EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID EcSubscriptionRunTimeStatusInfoIdEND = 5;
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

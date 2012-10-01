require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
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
return ffi.load( "Wecapi.dll" )

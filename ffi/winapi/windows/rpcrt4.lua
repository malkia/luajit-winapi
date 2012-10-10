require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/cryptography' )
require( 'ffi/winapi/headers/rpc' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID handle_t; //Alias
  typedef LPVOID MIDL_ES_READ; //Alias
  typedef LPVOID MIDL_ES_ALLOC; //Alias
  typedef LPVOID MIDL_ES_WRITE; //Alias
  typedef BOOL BOOL_int; //Alias
  typedef struct NDR_USER_MARSHAL_INFO_LEVEL1 {
    void* Buffer;
    unsigned long BufferSize;
    void* pfnAllocate;
    void* pfnFree;
    IRpcChannelBuffer* pRpcChannelBuffer;
    ULONG_PTR Reserved[5];
  } NDR_USER_MARSHAL_INFO_LEVEL1;
  typedef union NDR_USER_MARSHAL_INFO_u {
    NDR_USER_MARSHAL_INFO_LEVEL1 Level1;
  } NDR_USER_MARSHAL_INFO_u;
  typedef struct NDR_USER_MARSHAL_INFO {
    unsigned long InformationLevel;
    NDR_USER_MARSHAL_INFO_u ;
  } NDR_USER_MARSHAL_INFO;
  typedef unsigned long BindingOptions; //Alias
  static const BindingOptions RPC_C_OPT_BINDING_NONCAUSAL = 9;
  static const BindingOptions RPC_C_OPT_MAX_OPTIONS = 17;
  static const BindingOptions RPC_C_DONT_FAIL = 4;
  static const BindingOptions RPC_C_OPT_SESSION_ID = 6;
  static const BindingOptions RPC_C_OPT_COOKIE_AUTH = 7;
  static const BindingOptions RPC_C_OPT_RESOURCE_TYPE_UUID = 8;
  static const BindingOptions RPC_C_OPT_DONT_LINGER = 13;
  static const BindingOptions RPC_C_OPT_UNIQUE_BINDING = 11;
  typedef unsigned int InterfaceRegistrationFlags; //Alias
  typedef UINT MIDL_ES_CODE; //Alias
  static const MIDL_ES_CODE MES_ENCODE = 0;
  static const MIDL_ES_CODE MES_DECODE = 1;
  static const MIDL_ES_CODE MES_ENCODE_NDR64 = 2;
  typedef unsigned long MIDL_ES_HANDLE_STYLE; //Alias
  static const MIDL_ES_HANDLE_STYLE MES_INCREMENTAL_HANDLE = 0;
  static const MIDL_ES_HANDLE_STYLE MES_FIXED_BUFFER_HANDLE = 1;
  static const MIDL_ES_HANDLE_STYLE MES_DYNAMIC_BUFFER_HANDLE = 2;
  RPC_STATUS           DceErrorInqText(                     unsigned long StatusToConvert, RPC_TSTR ErrorText);
  RPC_STATUS           MesBufferHandleReset(                handle_t Handle, MIDL_ES_HANDLE_STYLE HandleStyle, MIDL_ES_CODE OpCode, char** ppBuffer, unsigned long BufferSize, unsigned long* pEncodedSize);
  RPC_STATUS           MesDecodeBufferHandleCreate(         LPVOID_char* Buffer, unsigned long BufferSize, handle_t* pHandle);
  RPC_STATUS           MesDecodeIncrementalHandleCreate(    void* UserState, MIDL_ES_READ ReadFn, handle_t* pHandle);
  RPC_STATUS           MesEncodeDynBufferHandleCreate(      char** ppBuffer, unsigned long* pEncodedSize, handle_t* pHandle);
  RPC_STATUS           MesEncodeFixedBufferHandleCreate(    LPVOID_char* Buffer, unsigned long BufferSize, unsigned long* pEncodedSize, handle_t* pHandle);
  RPC_STATUS           MesEncodeIncrementalHandleCreate(    void* UserState, MIDL_ES_ALLOC AllocFn, MIDL_ES_WRITE WriteFn, handle_t* pHandle);
  RPC_STATUS           MesHandleFree(                       handle_t Handle);
  RPC_STATUS           MesIncrementalHandleReset(           handle_t Handle, void* UserState, MIDL_ES_ALLOC AllocFn, MIDL_ES_WRITE WriteFn, MIDL_ES_READ ReadFn, MIDL_ES_CODE OpCode);
  RPC_STATUS           MesInqProcEncodingId(                handle_t Handle, PRPC_SYNTAX_IDENTIFIER pInterfaceId, unsigned long* pProcNum);
  RPC_STATUS           NdrGetUserMarshalInfo(               unsigned long* pFlags, unsigned long InformationLevel, NDR_USER_MARSHAL_INFO* pMarshalInfo);
  RPC_STATUS           RpcAsyncAbortCall(                   PRPC_ASYNC_STATE pAsync, unsigned long ExceptionCode);
  RPC_STATUS           RpcAsyncCancelCall(                  PRPC_ASYNC_STATE pAsync, BOOL fAbortCall);
  RPC_STATUS           RpcAsyncCompleteCall(                PRPC_ASYNC_STATE pAsync, PVOID Reply);
  RPC_STATUS           RpcAsyncGetCallStatus(               PRPC_ASYNC_STATE pAsync);
  RPC_STATUS           RpcAsyncInitializeHandle(            PRPC_ASYNC_STATE pAsync, unsigned int Size);
  void                 RpcAsyncRegisterInfo(                );
  RPC_STATUS           RpcBindingBind(                      PRPC_ASYNC_STATE pAsync, RPC_BINDING_HANDLE Binding, RPC_IF_HANDLE IfSpec);
  RPC_STATUS           RpcBindingCopy(                      RPC_BINDING_HANDLE SourceBinding, RPC_BINDING_HANDLE* DestinationBinding);
  RPC_STATUS           RpcBindingCreate(                    RPC_BINDING_HANDLE_TEMPLATE_V1* Template, RPC_BINDING_HANDLE_SECURITY_V1* Security, RPC_BINDING_HANDLE_OPTIONS_V1* Options, RPC_BINDING_HANDLE* Binding);
  RPC_STATUS           RpcBindingFree(                      RPC_BINDING_HANDLE* Binding);
  RPC_STATUS           RpcBindingFromStringBinding(         RPC_TSTR StringBinding, RPC_BINDING_HANDLE* Binding);
  RPC_STATUS           RpcBindingInqAuthClient(             RPC_BINDING_HANDLE ClientBinding, RPC_AUTHZ_HANDLE* Privs, RPC_TSTR* ServerPrincName, RPC_C_AUTHN_LEVEL* AuthnLevel, RPC_C_AUTHN_SVC* AuthnSvc, RPC_C_AUTHZ* AuthzSvc);
  RPC_STATUS           RpcBindingInqAuthClientEx(           RPC_BINDING_HANDLE ClientBinding, RPC_AUTHZ_HANDLE* Privs, RPC_TSTR* ServerPrincName, RPC_C_AUTHN_LEVEL* AuthnLevel, RPC_C_AUTHN_SVC* AuthnSvc, RPC_C_AUTHZ* AuthzSvc, unsigned long flags);
  RPC_STATUS           RpcBindingInqAuthInfo(               RPC_BINDING_HANDLE Binding, RPC_TSTR* ServerPrincName, RPC_C_AUTHN_LEVEL* AuthnLevel, RPC_C_AUTHN_SVC* AuthnSvc, RPC_AUTH_IDENTITY_HANDLE* AuthIdentity, RPC_C_AUTHZ* AuthzSvc);
  RPC_STATUS           RpcBindingInqAuthInfoEx(             RPC_BINDING_HANDLE Binding, RPC_TSTR ServerPrincName, RPC_C_AUTHN_LEVEL* AuthnLevel, RPC_C_AUTHN_SVC* AuthnSvc, RPC_AUTH_IDENTITY_HANDLE* AuthIdentity, RPC_C_AUTHZ* AuthzSvc, unsigned long RpcQosVersion, RPC_SECURITY_QOS* SecurityQos);
  RPC_STATUS           RpcBindingInqObject(                 RPC_BINDING_HANDLE Binding, UUID* ObjectUuid);
  RPC_STATUS           RpcBindingInqOption(                 RPC_BINDING_HANDLE hBinding, unsigned long Option, unsigned long* pOptionValue);
  RPC_STATUS           RpcBindingReset(                     RPC_BINDING_HANDLE Binding);
  RPC_STATUS           RpcBindingServerFromClient(          RPC_BINDING_HANDLE ClientBinding, RPC_BINDING_HANDLE* ServerBinding);
  RPC_STATUS           RpcBindingSetAuthInfo(               RPC_BINDING_HANDLE Binding, RPC_TSTR ServerPrincName, RPC_C_AUTHN_LEVEL AuthnLevel, RPC_C_AUTHN_SVC AuthnSvc, RPC_AUTH_IDENTITY_HANDLE AuthIdentity, unsigned long AuthzService);
  RPC_STATUS           RpcBindingSetAuthInfoEx(             RPC_BINDING_HANDLE Binding, RPC_TSTR ServerPrincName, RPC_C_AUTHN_LEVEL AuthnLevel, RPC_C_AUTHN_SVC AuthnSvc, RPC_AUTH_IDENTITY_HANDLE AuthIdentity, RPC_C_AUTHZ AuthzSvc, RPC_SECURITY_QOS* SecurityQOS);
  RPC_STATUS           RpcBindingSetObject(                 RPC_BINDING_HANDLE Binding, UUID* ObjectUuid);
  RPC_STATUS           RpcBindingSetOption(                 RPC_BINDING_HANDLE hBinding, BindingOptions Option, unsigned long OptionValue);
  RPC_STATUS           RpcBindingToStringBinding(           RPC_BINDING_HANDLE Binding, RPC_TSTR* StringBinding);
  RPC_STATUS           RpcBindingUnbind(                    RPC_BINDING_HANDLE Binding);
  RPC_STATUS           RpcBindingVectorFree(                RPC_BINDING_VECTOR** BindingVector);
  RPC_STATUS           RpcCancelThread(                     HANDLE ThreadHandle);
  RPC_STATUS           RpcCancelThreadEx(                   HANDLE ThreadHandle, LONG Timeout);
  void                 RpcCertGeneratePrincipalName(        PCCERT_CONTEXT Context, DWORD Flags, UCHAR** pBuffer);
  RPC_STATUS           RpcEpRegister(                       RPC_IF_HANDLE IfSpec, RPC_BINDING_VECTOR* BindingVector, UUID_VECTOR* UuidVector, RPC_TSTR Annotation);
  RPC_STATUS           RpcEpRegisterNoReplace(              RPC_IF_HANDLE IfSpec, RPC_BINDING_VECTOR* BindingVector, UUID_VECTOR* UuidVector, RPC_TSTR Annotation);
  RPC_STATUS           RpcEpResolveBinding(                 RPC_BINDING_HANDLE Binding, RPC_IF_HANDLE IfSpec);
  RPC_STATUS           RpcEpUnregister(                     RPC_IF_HANDLE IfSpec, RPC_BINDING_VECTOR* BindingVector, UUID_VECTOR* UuidVector);
  RPC_STATUS           RpcErrorAddRecord(                   RPC_EXTENDED_ERROR_INFO* ErrorInfo);
  void                 RpcErrorClearInformation(            );
  RPC_STATUS           RpcErrorEndEnumeration(              RPC_ERROR_ENUM_HANDLE* EnumHandle);
  RPC_STATUS           RpcErrorGetNextRecord(               RPC_ERROR_ENUM_HANDLE* EnumHandle, BOOL CopyStrings, RPC_EXTENDED_ERROR_INFO* ErrorInfo);
  RPC_STATUS           RpcErrorGetNumberOfRecords(          RPC_ERROR_ENUM_HANDLE* EnumHandle, int* Records);
  RPC_STATUS           RpcErrorLoadErrorInfo(               PVOID ErrorBlob, size_t BlobSize, RPC_ERROR_ENUM_HANDLE* EnumHandle);
  RPC_STATUS           RpcErrorResetEnumeration(            RPC_ERROR_ENUM_HANDLE* EnumHandle);
  RPC_STATUS           RpcErrorSaveErrorInfo(               RPC_ERROR_ENUM_HANDLE* EnumHandle, PVOID* ErrorBlob, size_t* BlobSize);
  RPC_STATUS           RpcErrorStartEnumeration(            RPC_ERROR_ENUM_HANDLE* EnumHandle);
  RPC_STATUS           RpcIfIdVectorFree(                   RPC_IF_ID_VECTOR** IfIdVec);
  RPC_STATUS           RpcIfInqId(                          RPC_IF_HANDLE RpcIfHandle, RPC_IF_ID* RpcIfId);
  RPC_STATUS           RpcImpersonateClient(                RPC_BINDING_HANDLE BindingHandle);
  RPC_STATUS           RpcMgmtEnableIdleCleanup(            );
  RPC_STATUS           RpcMgmtEpEltInqBegin(                RPC_BINDING_HANDLE EpBinding, unsigned long InquiryType, RPC_IF_ID* IfId, unsigned long VersOption, UUID* ObjectUuid, RPC_EP_INQ_HANDLE* InquiryContext);
  RPC_STATUS           RpcMgmtEpEltInqDone(                 RPC_EP_INQ_HANDLE* InquiryContext);
  RPC_STATUS           RpcMgmtEpEltInqNext(                 RPC_EP_INQ_HANDLE InquiryContext, RPC_IF_ID* IfId, RPC_BINDING_HANDLE* Binding, UUID* ObjectUuid, RPC_TSTR* Annotation);
  RPC_STATUS           RpcMgmtEpUnregister(                 RPC_BINDING_HANDLE EpBinding, RPC_IF_ID* IfId, RPC_BINDING_HANDLE Binding, UUID* ObjectUuid);
  RPC_STATUS           RpcMgmtInqComTimeout(                RPC_BINDING_HANDLE Binding, unsigned int* Timeout);
  RPC_STATUS           RpcMgmtInqDefaultProtectLevel(       RPC_C_AUTHN_SVC AuthnSvc, RPC_C_AUTHN_LEVEL_unsigned_int* AuthnLevel);
  RPC_STATUS           RpcMgmtInqIfIds(                     RPC_BINDING_HANDLE Binding, RPC_IF_ID_VECTOR** IfIdVector);
  RPC_STATUS           RpcMgmtInqServerPrincName(           RPC_BINDING_HANDLE Binding, RPC_C_AUTHN_SVC AuthnSvc, RPC_TSTR* ServerPrincName);
  RPC_STATUS           RpcMgmtInqStats(                     RPC_BINDING_HANDLE Binding, RPC_STATS_VECTOR** Statistics);
  RPC_STATUS           RpcMgmtIsServerListening(            RPC_BINDING_HANDLE Binding);
  RPC_STATUS           RpcMgmtSetAuthorizationFn(           RPC_MGMT_AUTHORIZATION_FN AuthorizationFn);
  RPC_STATUS           RpcMgmtSetCancelTimeout(             signed int Seconds);
  RPC_STATUS           RpcMgmtSetComTimeout(                RPC_BINDING_HANDLE Binding, unsigned int Timeout);
  RPC_STATUS           RpcMgmtSetServerStackSize(           unsigned int ThreadStackSize);
  RPC_STATUS           RpcMgmtStatsVectorFree(              RPC_STATS_VECTOR** StatsVector);
  RPC_STATUS           RpcMgmtStopServerListening(          RPC_BINDING_HANDLE Binding);
  RPC_STATUS           RpcMgmtWaitServerListen(             );
  RPC_STATUS           RpcNetworkInqProtseqs(               RPC_PROTSEQ_VECTOR** ProtSeqVector);
  RPC_STATUS           RpcNetworkIsProtseqValid(            RPC_TSTR Protseq);
  RPC_STATUS           RpcNsBindingInqEntryName(            RPC_BINDING_HANDLE Binding, unsigned long EntryNameSyntax, RPC_TSTR* EntryName);
  RPC_STATUS           RpcObjectInqType(                    UUID* ObjUuid, UUID* TypeUuid);
  RPC_STATUS           RpcObjectSetInqFn(                   RPC_OBJECT_INQ_FN InquiryFn);
  RPC_STATUS           RpcObjectSetType(                    UUID* ObjUuid, UUID* TypeUuid);
  RPC_STATUS           RpcProtseqVectorFree(                RPC_PROTSEQ_VECTOR** ProtSeqVector);
  RPC_STATUS           RpcRevertToSelf(                     );
  RPC_STATUS           RpcRevertToSelfEx(                   RPC_BINDING_HANDLE BindingHandle);
  RPC_STATUS           RpcServerInqBindings(                RPC_BINDING_VECTOR** BindingVector);
  RPC_STATUS           RpcServerInqCallAttributes(          RPC_BINDING_HANDLE ClientBinding, void* RpcCallAttributes);
  RPC_STATUS           RpcServerInqDefaultPrincName(        RPC_C_AUTHN_SVC AuthnSvc, RPC_TSTR* PrincName);
  RPC_STATUS           RpcServerInqBindingHandle(           RPC_BINDING_HANDLE* Binding);
  RPC_STATUS           RpcServerInqIf(                      RPC_IF_HANDLE IfSpec, UUID* MgrTypeUuid, RPC_MGR_EPV** MgrEpv);
  RPC_STATUS           RpcServerListen(                     unsigned int MinimumCallThreads, unsigned int MaxCalls, unsigned int DontWait);
  RPC_STATUS           RpcServerRegisterAuthInfo(           RPC_TSTR ServerPrincName, RPC_C_AUTHN_SVC AuthnSvc, RPC_AUTH_KEY_RETRIEVAL_FN GetKeyFn, void* Arg);
  RPC_STATUS           RpcServerRegisterIf(                 RPC_IF_HANDLE IfSpec, UUID* MgrTypeUuid, RPC_MGR_EPV* MgrEpv);
  RPC_STATUS           RpcServerRegisterIf2(                RPC_IF_HANDLE IfSpec, UUID* MgrTypeUuid, RPC_MGR_EPV* MgrEpv, InterfaceRegistrationFlags Flags, unsigned int MaxCalls, unsigned int MaxRpcSize, RPC_IF_CALLBACK_FN* IfCallbackFn);
  RPC_STATUS           RpcServerRegisterIfEx(               RPC_IF_HANDLE IfSpec, UUID* MgrTypeUuid, RPC_MGR_EPV* MgrEpv, InterfaceRegistrationFlags Flags, unsigned int MaxCalls, RPC_IF_CALLBACK_FN* IfCallback);
  RPC_STATUS           RpcServerSubscribeForNotification(   RPC_BINDING_HANDLE Binding, RPC_NOTIFICATIONS Notification, RPC_NOTIFICATION_TYPES NotificationType, RPC_ASYNC_NOTIFICATION_INFO* NotificationInfo);
  RPC_STATUS           RpcServerTestCancel(                 RPC_BINDING_HANDLE BindingHandle);
  RPC_STATUS           RpcServerUnregisterIf(               RPC_IF_HANDLE IfSpec, UUID* MgrTypeUuid, unsigned int WaitForCallsToComplete);
  RPC_STATUS           RpcServerUnregisterIfEx(             RPC_IF_HANDLE IfSpec, UUID* MgrTypeUuid, int RundownContextHandles);
  RPC_STATUS           RpcServerUnsubscribeForNotification( RPC_BINDING_HANDLE Binding, RPC_NOTIFICATIONS Notification, unsigned long* NotificationsQueued);
  RPC_STATUS           RpcServerUseAllProtseqs(             unsigned int MaxCalls, void* SecurityDescriptor);
  RPC_STATUS           RpcServerUseAllProtseqsEx(           unsigned int MaxCalls, void* SecurityDescriptor, PRPC_POLICY Policy);
  RPC_STATUS           RpcServerUseAllProtseqsIf(           unsigned int MaxCalls, RPC_IF_HANDLE IfSpec, void* SecurityDescriptor);
  RPC_STATUS           RpcServerUseAllProtseqsIfEx(         unsigned int MaxCalls, RPC_IF_HANDLE IfSpec, void* SecurityDescriptor, PRPC_POLICY Policy);
  RPC_STATUS           RpcServerUseProtseq(                 RPC_TSTR ProtSeq, unsigned int MaxCalls, void* SecurityDescriptor);
  RPC_STATUS           RpcServerUseProtseqEx(               RPC_TSTR ProtSeq, unsigned int MaxCalls, void* SecurityDescriptor, PRPC_POLICY Policy);
  RPC_STATUS           RpcServerUseProtseqEp(               RPC_TSTR Protseq, unsigned int MaxCalls, RPC_TSTR Endpoint, void* SecurityDescriptor);
  RPC_STATUS           RpcServerUseProtseqEpEx(             RPC_TSTR Protseq, unsigned int MaxCalls, RPC_TSTR Endpoint, void* SecurityDescriptor, PRPC_POLICY Policy);
  RPC_STATUS           RpcServerUseProtseqIf(               RPC_TSTR Protseq, unsigned int MaxCalls, RPC_IF_HANDLE IfSpec, void* SecurityDescriptor);
  RPC_STATUS           RpcServerUseProtseqIfEx(             RPC_TSTR Protseq, unsigned int MaxCalls, RPC_IF_HANDLE IfSpec, void* SecurityDescriptor, PRPC_POLICY Policy);
  void*                RpcSmAllocate(                       size_t Size, RPC_STATUS* pStatus);
  RPC_STATUS           RpcSmClientFree(                     void* NodeToFree);
  RPC_STATUS           RpcSmDestroyClientContext(           void** ContextHandle);
  RPC_STATUS           RpcSmDisableAllocate(                );
  RPC_STATUS           RpcSmEnableAllocate(                 );
  RPC_STATUS           RpcSmFree(                           void* NodeToFree);
  RPC_SS_THREAD_HANDLE RpcSmGetThreadHandle(                RPC_STATUS* pStatus);
  RPC_STATUS           RpcSmSetClientAllocFree(             RPC_CLIENT_ALLOC* pfnAllocate, RPC_CLIENT_FREE* pfnFree);
  RPC_STATUS           RpcSmSetThreadHandle(                RPC_SS_THREAD_HANDLE Handle);
  RPC_STATUS           RpcSmSwapClientAllocFree(            RPC_CLIENT_ALLOC* pfnAllocate, RPC_CLIENT_FREE* pfnFree, RPC_CLIENT_ALLOC** pfnOldAllocate, RPC_CLIENT_FREE** pfnOldFree);
  void*                RpcSsAllocate(                       size_t Size);
  RPC_STATUS           RpcSsContextLockExclusive(           RPC_BINDING_HANDLE ServerBindingHandle, PVOID UserContext);
  RPC_STATUS           RpcSsContextLockShared(              RPC_BINDING_HANDLE ServerBindingHandle, PVOID UserContext);
  void                 RpcSsDestroyClientContext(           void** ContextHandle);
  void                 RpcSsDisableAllocate(                );
  void                 RpcSsDontSerializeContext(           );
  void                 RpcSsEnableAllocate(                 );
  void                 RpcSsFree(                           void* NodeToFree);
  RPC_SS_THREAD_HANDLE RpcSsGetThreadHandle(                );
  void                 RpcSsSetClientAllocFree(             RPC_CLIENT_ALLOC* pfnAllocate, RPC_CLIENT_FREE* pfnFree);
  void                 RpcSsSetThreadHandle(                RPC_SS_THREAD_HANDLE Handle);
  void                 RpcSsSwapClientAllocFree(            RPC_CLIENT_ALLOC* pfnAllocate, RPC_CLIENT_FREE* pfnFree, RPC_CLIENT_ALLOC** pfnOldAllocate, RPC_CLIENT_FREE** pfnOldFree);
  RPC_STATUS           RpcStringBindingCompose(             TCHAR* ObjUuid, TCHAR* ProtSeq, TCHAR* NetworkAddr, TCHAR* EndPoint, TCHAR* Options, TCHAR** StringBinding);
  RPC_STATUS           RpcStringBindingParse(               TCHAR* StringBinding, TCHAR** ObjectUuid, TCHAR** ProtSeq, TCHAR** NetworkAddr, TCHAR** EndPoint, TCHAR** NetworkOptions);
  RPC_STATUS           RpcStringFree(                       RPC_TSTR* String);
  RPC_STATUS           RpcTestCancel(                       );
  signed int           UuidCompare(                         UUID* Uuid1, UUID* Uuid2, RPC_STATUS* Status);
  RPC_STATUS           UuidCreate(                          UUID* Uuid);
  RPC_STATUS           UuidCreateSequential(                UUID* Uuid);
  RPC_STATUS           UuidCreateNil(                       UUID* Nil_Uuid);
  BOOL_int             UuidEqual(                           UUID* Uuid1, UUID* Uuid2, RPC_STATUS* Status);
  RPC_STATUS           UuidFromString(                      RPC_TSTR StringUuid, UUID* Uuid);
  unsigned short       UuidHash(                            UUID* Uuid, RPC_STATUS* Status);
  BOOL_int             UuidIsNil(                           UUID* Uuid, RPC_STATUS* Status);
  RPC_STATUS           UuidToString(                        UUID* Uuid, RPC_TSTR* StringUuid);
]]
ffi.load( 'Rpcrt4.dll' )

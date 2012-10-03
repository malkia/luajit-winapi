require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef ULONG WINAPI_WdsAuthLevel; //Alias
  static const ULONG WDS_TRANSPORTCLIENT_AUTH = 0x1;
  static const ULONG WDS_TRANSPORTCLIENT_NO_AUTH = 0x2;
  typedef struct WDS_TRANSPORTCLIENT_REQUEST {
    ULONG ulLength;
    ULONG ulApiVersion;
    WINAPI_WdsAuthLevel ulAuthLevel;
    LPCWSTR pwszServer;
    LPCWSTR pwszNamespace;
    LPCWSTR pwszObjectName;
    ULONG ulCacheSize;
    ULONG ulProtocol;
    PVOID pvProtocolData;
    ULONG ulProtocolDataLength;
  } WDS_TRANSPORTCLIENT_REQUEST;
  typedef WDS_TRANSPORTCLIENT_REQUEST *PWDS_TRANSPORTCLIENT_REQUEST; //Pointer
  typedef UINT TRANSPORTCLIENT_CALLBACK_ID; //Alias
  static const UINT WDS_TRANSPORTCLIENT_SESSION_START = 0;
  static const UINT WDS_TRANSPORTCLIENT_RECEIVE_CONTENTS = 1;
  static const UINT WDS_TRANSPORTCLIENT_SESSION_COMPLETE = 2;
  static const UINT WDS_TRANSPORTCLIENT_RECEIVE_METADATA = 3;
  static const UINT WDS_TRANSPORTCLIENT_SESSION_STARTEX = 4;
  WINAPI_ERROR_CODE WdsTransportClientAddRefBuffer(      PVOID pvBuffer);
  WINAPI_ERROR_CODE WdsTransportClientCancelSession(     HANDLE hSessionKey);
  WINAPI_ERROR_CODE WdsTransportClientCloseSession(      HANDLE hSessionKey);
  WINAPI_ERROR_CODE WdsTransportClientCompleteReceive(   HANDLE hSessionKey, HANDLE ulSize, PULARGE_INTEGER pullOffset);
  WINAPI_ERROR_CODE WdsTransportClientInitialize(        );
  WINAPI_ERROR_CODE WdsTransportClientInitializeSession( PWDS_TRANSPORTCLIENT_REQUEST pSessionRequest, PVOID pCallerData, PHANDLE hSessionKey);
  WINAPI_ERROR_CODE WdsTransportClientQueryStatus(       HANDLE hSessionKey, PULONG puStatus, PULONG puErrorCode);
  WINAPI_ERROR_CODE WdsTransportClientRegisterCallback(  HANDLE hSessionKey, TRANSPORTCLIENT_CALLBACK_ID CallbackId, PVOID pfnCallback);
  WINAPI_ERROR_CODE WdsTransportClientReleaseBuffer(     PVOID pvBuffer);
  WINAPI_ERROR_CODE WdsTransportClientShutdown(          );
  WINAPI_ERROR_CODE WdsTransportClientStartSession(      HANDLE hSessionKey);
  WINAPI_ERROR_CODE WdsTransportClientWaitForCompletion( HANDLE hSessionKey, ULONG uTimeout);
]]
return ffi.load( 'Wdstptc.dll' )

require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef ULONG WdsAuthLevel; //Alias
  static const WdsAuthLevel WDS_TRANSPORTCLIENT_AUTH = 0x1;
  static const WdsAuthLevel WDS_TRANSPORTCLIENT_NO_AUTH = 0x2;
  typedef struct WDS_TRANSPORTCLIENT_REQUEST {
    ULONG ulLength;
    ULONG ulApiVersion;
    WdsAuthLevel ulAuthLevel;
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
  static const TRANSPORTCLIENT_CALLBACK_ID WDS_TRANSPORTCLIENT_SESSION_START = 0;
  static const TRANSPORTCLIENT_CALLBACK_ID WDS_TRANSPORTCLIENT_RECEIVE_CONTENTS = 1;
  static const TRANSPORTCLIENT_CALLBACK_ID WDS_TRANSPORTCLIENT_SESSION_COMPLETE = 2;
  static const TRANSPORTCLIENT_CALLBACK_ID WDS_TRANSPORTCLIENT_RECEIVE_METADATA = 3;
  static const TRANSPORTCLIENT_CALLBACK_ID WDS_TRANSPORTCLIENT_SESSION_STARTEX = 4;
  ERROR_CODE WdsTransportClientAddRefBuffer(      PVOID pvBuffer);
  ERROR_CODE WdsTransportClientCancelSession(     HANDLE hSessionKey);
  ERROR_CODE WdsTransportClientCloseSession(      HANDLE hSessionKey);
  ERROR_CODE WdsTransportClientCompleteReceive(   HANDLE hSessionKey, HANDLE ulSize, PULARGE_INTEGER pullOffset);
  ERROR_CODE WdsTransportClientInitialize(        );
  ERROR_CODE WdsTransportClientInitializeSession( PWDS_TRANSPORTCLIENT_REQUEST pSessionRequest, PVOID pCallerData, PHANDLE hSessionKey);
  ERROR_CODE WdsTransportClientQueryStatus(       HANDLE hSessionKey, PULONG puStatus, PULONG puErrorCode);
  ERROR_CODE WdsTransportClientRegisterCallback(  HANDLE hSessionKey, TRANSPORTCLIENT_CALLBACK_ID CallbackId, PVOID pfnCallback);
  ERROR_CODE WdsTransportClientReleaseBuffer(     PVOID pvBuffer);
  ERROR_CODE WdsTransportClientShutdown(          );
  ERROR_CODE WdsTransportClientStartSession(      HANDLE hSessionKey);
  ERROR_CODE WdsTransportClientWaitForCompletion( HANDLE hSessionKey, ULONG uTimeout);
]]
ffi.load( 'Wdstptc.dll' )

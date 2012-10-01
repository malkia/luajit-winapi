require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
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
return ffi.load( "Wdstptc.dll" )

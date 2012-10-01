require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  PVOID   WdsTransportServerAllocateBuffer(   HANDLE hProvider, ULONG ulBufferSize);
  HRESULT WdsTransportServerCompleteRead(     HANDLE hProvider, ULONG ulBytesRead, PVOID pvUserData, HRESULT hReadResult);
  HRESULT WdsTransportServerFreeBuffer(       HANDLE hProvider, PVOID pvBuffer);
  HRESULT WdsTransportServerRegisterCallback( HANDLE hProvider, TRANSPORTPROVIDER_CALLBACK_ID CallbackId, PVOID pfnCallback);
  HRESULT WdsTransportServerTrace(            HANDLE hProvider, WDS_MC_SEVERITY Severity, LPCWSTR pwszFormat);
  HRESULT WdsTransportServerTraceV(           HANDLE hProvider, WDS_MC_SEVERITY Severity, LPCWSTR pwszFormat, va_list Params);
]]
return ffi.load( "Wdsmc.dll" )

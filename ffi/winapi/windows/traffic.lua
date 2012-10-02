require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  ULONG TcAddFilter(           HANDLE FlowHandle, PTC_GEN_FILTER pGenericFilter, PHANDLE pFilterHandle);
  ULONG TcAddFlow(             HANDLE IfcHandle, HANDLE ClFlowCtx, ULONG Flags, PTC_GEN_FLOW pGenericFlow, PHANDLE pFlowHandle);
  ULONG TcCloseInterface(      HANDLE IfcHandle);
  ULONG TcDeleteFilter(        HANDLE FilterHandle);
  ULONG TcDeleteFlow(          HANDLE FlowHandle);
  ULONG TcDeregisterClient(    HANDLE ClientHandle);
  ULONG TcEnumerateFlows(      HANDLE IfcHandle, PHANDLE pEnumToken, PULONG pFlowCount, PULONG pBufSize, PENUMERATION_BUFFER Buffer);
  ULONG TcEnumerateInterfaces( HANDLE ClientHandle, PULONG pBufferSize, PTC_IFC_DESCRIPTOR InterfaceBuffer);
  ULONG TcGetFlowName(         HANDLE FlowHandle, ULONG StrSize, LPTSTR pFlowName);
  ULONG TcModifyFlow(          HANDLE FlowHandle, PTC_GEN_FLOW pGenericFlow);
  ULONG TcOpenInterface(       LPTSTR pInterfaceName, HANDLE ClientHandle, HANDLE ClIfcCtx, PHANDLE pIfcHandle);
  ULONG TcQueryFlow(           LPTSTR FlowName, LPGUID pGuidParam, PULONG pBufferSize, PVOID Buffer);
  ULONG TcQueryInterface(      HANDLE IfcHandle, LPGUID pGuidParam, BOOLEAN NotifyChange, PULONG BufferSize, PVOID Buffer);
  ULONG TcRegisterClient(      ULONG TciVersion, HANDLE ClRegCtx, PTCI_CLIENT_FUNC_LIST pClientHandlerList, PHANDLE pClientHandle);
  ULONG TcSetFlow(             LPTSTR pFlowName, LPGUID pGuidParam, ULONG BufferSize, PVOID Buffer);
  ULONG TcSetInterface(        HANDLE IfcHandle, LPGUID pGuidParam, ULONG BufferSize, PVOID Buffer);
]]
return ffi.load( 'Traffic.dll' )

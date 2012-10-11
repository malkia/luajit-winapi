require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID TCI_NOTIFY_HANDLER; //Alias
  typedef LPVOID TCI_ADD_FLOW_COMPLETE_HANDLER; //Alias
  typedef LPVOID TCI_MOD_FLOW_COMPLETE_HANDLER; //Alias
  typedef LPVOID TCI_DEL_FLOW_COMPLETE_HANDLER; //Alias
  enum { MAX_STRING_LENGTH = 256 };
  typedef struct TC_GEN_FILTER {
    USHORT AddressType;
    ULONG PatternSize;
    PVOID Pattern;
    PVOID Mask;
  } TC_GEN_FILTER;
  typedef TC_GEN_FILTER *PTC_GEN_FILTER; //Pointer
  typedef struct NETWORK_ADDRESS {
    USHORT AddressLength;
    USHORT AddressType;
    UCHAR Address[1];
  } NETWORK_ADDRESS;
  typedef struct NETWORK_ADDRESS_LIST {
    LONG AddressCount;
    USHORT AddressType;
    NETWORK_ADDRESS Address[1];
  } NETWORK_ADDRESS_LIST;
  typedef struct ADDRESS_LIST_DESCRIPTOR {
    ULONG MediaType;
    NETWORK_ADDRESS_LIST AddressList;
  } ADDRESS_LIST_DESCRIPTOR;
  typedef struct TC_IFC_DESCRIPTOR {
    ULONG Length;
    LPWSTR pInterfaceName;
    LPWSTR pInterfaceID;
    ADDRESS_LIST_DESCRIPTOR AddressListDesc;
  } TC_IFC_DESCRIPTOR;
  typedef TC_IFC_DESCRIPTOR *PTC_IFC_DESCRIPTOR; //Pointer
  typedef ULONG WINAPI_QOS_OBJECT_HDR_TYPE; //Alias
  static const WINAPI_QOS_OBJECT_HDR_TYPE QOS_OBJECT_END_OF_LIST = 2001;
  static const WINAPI_QOS_OBJECT_HDR_TYPE QOS_OBJECT_SD_MODE = 2002;
  static const WINAPI_QOS_OBJECT_HDR_TYPE QOS_OBJECT_SHAPING_RATE = 2003;
  static const WINAPI_QOS_OBJECT_HDR_TYPE QOS_OBJECT_DESTADDR = 2004;
  static const WINAPI_QOS_OBJECT_HDR_TYPE RSVP_OBJECT_STATUS_INFO = 1000;
  static const WINAPI_QOS_OBJECT_HDR_TYPE RSVP_OBJECT_RESERVE_INFO = 1001;
  static const WINAPI_QOS_OBJECT_HDR_TYPE RSVP_OBJECT_ADSPEC = 1002;
  static const WINAPI_QOS_OBJECT_HDR_TYPE RSVP_OBJECT_POLICY_INFO = 1003;
  static const WINAPI_QOS_OBJECT_HDR_TYPE RSVP_OBJECT_FILTERSPEC_LIST = 1004;
  typedef struct QOS_OBJECT_HDR {
    WINAPI_QOS_OBJECT_HDR_TYPE ObjectType;
    ULONG ObjectLength;
  } QOS_OBJECT_HDR;
  typedef struct TC_GEN_FLOW {
    FLOWSPEC SendingFlowspec;
    FLOWSPEC ReceivingFlowspec;
    ULONG TcObjectsLength;
    QOS_OBJECT_HDR TcObjects[1];
  } TC_GEN_FLOW;
  typedef TC_GEN_FLOW *PTC_GEN_FLOW; //Pointer
  typedef struct ENUMERATION_BUFFER {
    ULONG Length;
    ULONG OwnerProcessId;
    USHORT FlowNameLength;
    WCHAR FlowName[MAX_STRING_LENGTH];
    PTC_GEN_FLOW pFlow;
    ULONG NumberOfFilters;
    TC_GEN_FILTER GenericFilter[1];
  } ENUMERATION_BUFFER;
  typedef ENUMERATION_BUFFER *PENUMERATION_BUFFER; //Pointer
  typedef struct TCI_CLIENT_FUNC_LIST {
    TCI_NOTIFY_HANDLER ClNotifyHandler;
    TCI_ADD_FLOW_COMPLETE_HANDLER ClAddFlowCompleteHandler;
    TCI_MOD_FLOW_COMPLETE_HANDLER ClModifyFlowCompleteHandler;
    TCI_DEL_FLOW_COMPLETE_HANDLER ClDeleteFlowCompleteHandler;
  } TCI_CLIENT_FUNC_LIST;
  typedef TCI_CLIENT_FUNC_LIST *PTCI_CLIENT_FUNC_LIST; //Pointer
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
ffi.load( 'Traffic.dll' )

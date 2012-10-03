require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/registry' )
local ffi = require( 'ffi' )
ffi.cdef [[
  enum { PXE_MAX_ADDRESS = 16 };
  typedef struct PXE_PROVIDER {
    ULONG uSizeOfStruct;
    LPWSTR pwszName;
    LPWSTR pwszFilePath;
    BOOL bIsCritical;
    ULONG uIndex;
  } PXE_PROVIDER;
  typedef PXE_PROVIDER *PPXE_PROVIDER; //Pointer
  typedef union WINAPI_PXE_ADDRESS_u {
    BYTE bAddress[PXE_MAX_ADDRESS];
    ULONG uIpAddress;
  } WINAPI_PXE_ADDRESS_u;
  typedef ULONG WINAPI_PXE_ADDR_FLAGS; //Alias
  typedef struct PXE_ADDRESS {
    WINAPI_PXE_ADDR_FLAGS uFlags;
    WINAPI_PXE_ADDRESS_u ;
    ULONG uAddrLen;
    USHORT uPort;
  } PXE_ADDRESS;
  typedef ULONG PXE_BOOT_ACTION; //Alias
  static const ULONG PXE_BA_NBP = 1;
  static const ULONG PXE_BA_CUSTOM = 2;
  static const ULONG PXE_BA_IGNORE = 3;
  static const ULONG PXE_BA_REJECTED = 4;
  typedef ULONG PXE_SEVERITY; //Alias
  static const ULONG PXE_TRACE_VERBOSE = 0x00010000;
  static const ULONG PXE_TRACE_INFO = 0x00020000;
  static const ULONG PXE_TRACE_WARNING = 0x00040000;
  static const ULONG PXE_TRACE_ERROR = 0x00080000;
  static const ULONG PXE_TRACE_FATAL = 0x00100000;
  typedef ULONG PXE_GSI_TYPE; //Alias
  static const ULONG PXE_GSI_TRACE_ENABLED = 1;
  typedef ULONG PXE_REG_INDEX; //Alias
  static const ULONG PXE_REG_INDEX_TOP = 0;
  static const ULONG PXE_REG_INDEX_BOTTOM = 0xFFFFFFFF;
  typedef ULONG PXE_PROVIDER_ATTRIBUTE; //Alias
  static const ULONG PXE_PROV_ATTR_FILTER = 0;
  typedef ULONG PXE_CALLBACK_TYPE; //Alias
  static const ULONG PXE_CALLBACK_RECV_REQUEST = 0;
  static const ULONG PXE_CALLBACK_SHUTDOWN = 1;
  static const ULONG PXE_CALLBACK_SERVICE_CONTROL = 2;
  DWORD PxeAsyncRecvDone(            HANDLE hClientRequest, PXE_BOOT_ACTION Action);
  DWORD PxeDhcpAppendOption(         PVOID pReplyPacket, ULONG uMaxReplyPacketLen, PULONG puReplyPacketLen, BYTE bOption, BYTE bOptionLen, PVOID pValue);
  DWORD PxeDhcpGetOptionValue(       PVOID pPacket, ULONG uPacketLen, ULONG uInstance, BYTE bOption, PBYTE pbOptionLen, PVOID* ppOptionValue);
  DWORD PxeDhcpGetVendorOptionValue( PVOID pPacket, ULONG uPacketLen, BYTE bOption, ULONG uInstance, PBYTE pbOptionLen, PVOID* ppOptionValue);
  DWORD PxeDhcpInitialize(           PVOID pRecvPacket, ULONG uRecvPacketLen, PVOID pReplyPacket, ULONG uMaxReplyPacketLen, PULONG puReplyPacketLen);
  DWORD PxeDhcpIsValid(              PVOID pPacket, ULONG uPacketLen, BOOL bRequestPacket, PBOOL pbPxeOptionPresent);
  DWORD PxeGetServerInfo(            PXE_GSI_TYPE uInfoType, PVOID pBuffer, ULONG uBufferLen);
  PVOID PxePacketAllocate(           HANDLE hProvider, HANDLE hClientRequest, ULONG uSize);
  DWORD PxeSendReply(                HANDLE hClientRequest, PVOID pPacket, ULONG uPacketLen, PXE_ADDRESS* pAddress);
  DWORD PxePacketFree(               HANDLE hProvider, HANDLE hClientRequest, PVOID pPacket);
  DWORD PxeProviderEnumClose(        HANDLE hEnum);
  DWORD PxeProviderEnumFirst(        HANDLE* phEnum);
  DWORD PxeProviderEnumNext(         HANDLE hEnum, PPXE_PROVIDER* ppProvider);
  DWORD PxeProviderFreeInfo(         PPXE_PROVIDER pProvider);
  DWORD PxeProviderQueryIndex(       LPCWSTR pszProviderName, PULONG puIndex);
  DWORD PxeProviderRegister(         LPCWSTR pszProviderName, LPCWSTR pszModulePath, PXE_REG_INDEX Index, BOOL bIsCritical, PHKEY phProviderKey);
  DWORD PxeProviderSetAttribute(     HANDLE hProvider, PXE_PROVIDER_ATTRIBUTE Attribute, PVOID pParameterBuffer, ULONG uParamLen);
  DWORD PxeProviderUnRegister(       LPCWSTR pszProviderName);
  DWORD PxeRegisterCallback(         HANDLE hProvider, PXE_CALLBACK_TYPE CallbackType, PVOID pCallbackFunction, PVOID pContext);
  DWORD PxeTrace(                    HANDLE hProvider, PXE_SEVERITY Severity, LPCWSTR pszFormat);
]]
return ffi.load( 'WdsPxe.dll' )

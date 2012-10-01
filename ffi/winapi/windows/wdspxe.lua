require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/registry" )
local ffi = require( "ffi" )
ffi.cdef [[
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
return ffi.load( "WdsPxe.dll" )

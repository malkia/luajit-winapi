require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HRESULT WdsBpAddOption(       HANDLE hHandle, ULONG uOption, ULONG uValueLen, PVOID pValue);
  HRESULT WdsBpCloseHandle(     HANDLE hHandle);
  HRESULT WdsBpGetOptionBuffer( HANDLE hHandle, ULONG uBufferLen, PVOID pBuffer, PULONG puBytes);
  HRESULT WdsBpInitialize(      BYTE bPacketType, HANDLE* phHandle);
  HRESULT WdsBpParseInitialize( PVOID pPacket, ULONG uPacketLen, PBYTE pbPacketType, HANDLE* phHandle);
  HRESULT WdsBpQueryOption(     HANDLE hHandle, ULONG uOption, ULONG uValueLen, PVOID pValue, PULONG puBytes);
]]
ffi.load( 'Wdsbp.dll' )

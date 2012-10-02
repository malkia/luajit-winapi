require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/native' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HRESULT DebugCreate(      REFIID InterfaceId, PVOID* Interface);
  HRESULT DebugConnect(     PCSTR RemoteOptions, REFIID InterfaceId, PVOID* Interface);
  HRESULT DebugConnectWide( PCWSTR RemoteOptions, REFIID InterfaceId, PVOID* Interface);
]]
return ffi.load( 'DbgEng.dll' )

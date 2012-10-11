require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/rpc' )
local ffi = require( 'ffi' )
ffi.cdef [[
  RPC_STATUS RpcDiagnoseError( RPC_BINDING_HANDLE BindingHandle, RPC_IF_HANDLE IfSpec, RPC_STATUS RpcStatus, RPC_ERROR_ENUM_HANDLE* EnumHandle, ULONG Options, HWND ParentWindow);
]]
return ffi.load( 'Rpcdiag.dll' )

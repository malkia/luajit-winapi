require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/sockets' )
local ffi = require( 'ffi' )
ffi.cdef [[
  INT  WPUGetQOSTemplate(     WINAPI_LPGUID lpProviderId, LPWSABUF lpQOSName, LPQOS lpQOS);
  BOOL WSCInstallQOSTemplate( WINAPI_LPGUID lpProviderId, LPWSABUF lpQOSName, LPQOS lpQOS);
  BOOL WSCRemoveQOSTemplate(  WINAPI_LPGUID lpProviderId, LPWSABUF lpQOSName);
]]
return ffi.load( 'Qosname.dll' )

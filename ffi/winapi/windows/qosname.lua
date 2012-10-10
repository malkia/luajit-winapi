require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/sockets' )
local ffi = require( 'ffi' )
ffi.cdef [[
  INT  WPUGetQOSTemplate(     LPGUID lpProviderId, LPWSABUF lpQOSName, LPQOS lpQOS);
  BOOL WSCInstallQOSTemplate( LPGUID lpProviderId, LPWSABUF lpQOSName, LPQOS lpQOS);
  BOOL WSCRemoveQOSTemplate(  LPGUID lpProviderId, LPWSABUF lpQOSName);
]]
ffi.load( 'Qosname.dll' )

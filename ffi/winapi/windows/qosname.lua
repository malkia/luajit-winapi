require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/sockets' )
local ffi = require( 'ffi' )
ffi.cdef [[
  INT  WPUGetQOSTemplate(     const LPGUID lpProviderId, LPWSABUF lpQOSName, LPQOS lpQOS);
  BOOL WSCInstallQOSTemplate( const LPGUID lpProviderId, LPWSABUF lpQOSName, LPQOS lpQOS);
  BOOL WSCRemoveQOSTemplate(  const LPGUID lpProviderId, LPWSABUF lpQOSName);
]]
return ffi.load( 'Qosname.dll' )

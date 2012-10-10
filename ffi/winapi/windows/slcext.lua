require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HRESULT SLAcquireGenuineTicket( void** ppTicketBlob, UINT* pcbTicketBlob, PCWSTR pwszTemplateId, PCWSTR pwszServerUrl, PCWSTR pwszClientToken);
]]
ffi.load( 'Slcext.dll' )

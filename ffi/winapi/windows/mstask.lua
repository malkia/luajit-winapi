require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HRESULT GetNetScheduleAccountInformation( LPCWSTR pwszServerName, DWORD ccAccount);
  HRESULT SetNetScheduleAccountInformation( LPCWSTR pwszServerName, LPCWSTR pwszAccount, LPCWSTR pwszPassword);
]]
return ffi.load( 'Mstask.dll' )

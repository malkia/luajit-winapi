require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HRESULT CreateHardwareEventMoniker( REFCLSID clsid, LPCTSTR pszEventHandler, IMoniker** ppmoniker);
]]
ffi.load( 'Shsvcs.dll' )

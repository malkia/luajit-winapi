require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HRESULT DSCreateSecurityPage( LPCWSTR pwszObjectPath, LPCWSTR pwszObjectClass, DWORD dwFlags, HPROPSHEETPAGE* phPage, PFNREADOBJECTSECURITY pfnReadSD, PFNWRITEOBJECTSECURITY pfnWriteSD, LPARAM lpContext);
]]
return ffi.load( 'DSSec.dll' )

require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PFNREADOBJECTSECURITY; //Alias
  typedef LPVOID PFNWRITEOBJECTSECURITY; //Alias
  HRESULT DSCreateSecurityPage( LPCWSTR pwszObjectPath, LPCWSTR pwszObjectClass, DWORD dwFlags, HPROPSHEETPAGE* phPage, PFNREADOBJECTSECURITY pfnReadSD, PFNWRITEOBJECTSECURITY pfnWriteSD, LPARAM lpContext);
]]
ffi.load( 'DSSec.dll' )

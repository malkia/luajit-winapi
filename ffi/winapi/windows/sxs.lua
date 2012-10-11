require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/dotnet' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef DWORD WINAPI_CreateAsmNameObjFlags; //Alias
  HRESULT CreateAssemblyCache(      IAssemblyCache** ppAsmCache, DWORD dwReserved);
  HRESULT CreateAssemblyNameObject( LPASSEMBLYNAME* ppAssemblyNameObj, LPCWSTR szAssemblyName, WINAPI_CreateAsmNameObjFlags dwFlags, LPVOID pvReserved);
]]
ffi.load( 'SxS.dll' )

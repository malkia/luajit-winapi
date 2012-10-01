require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/dotnet" )
local ffi = require( "ffi" )
ffi.cdef [[
  HRESULT CreateAssemblyCache(      IAssemblyCache** ppAsmCache, DWORD dwReserved);
  HRESULT CreateAssemblyNameObject( LPASSEMBLYNAME* ppAssemblyNameObj, LPCWSTR szAssemblyName, WINAPI_CreateAsmNameObjFlags dwFlags, LPVOID pvReserved);
]]
return ffi.load( "SxS.dll" )

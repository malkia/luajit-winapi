require( 'ffi/winapi/headers/dwrite' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HRESULT DWriteCreateFactory( DWRITE_FACTORY_TYPE factoryType, REFIID iid, IUnknown** factory);
]]
return ffi.load( 'Dwrite.dll' )

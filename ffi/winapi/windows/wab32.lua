require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/ole" )
local ffi = require( "ffi" )
ffi.cdef [[
  HRESULT WABOpen(   LPADRBOOK* lppAdrBook, LPWABOBJECT* lppWABObject, LPWAB_PARAM lpWABParam, DWORD Reserved2);
  HRESULT WABOpenEx( LPADRBOOK* lppAdrBook, LPWABOBJECT* lppWABObject, LPWAB_PARAM lpWABParam, DWORD Reserved2, ALLOCATEBUFFER* lpfnAllocateBuffer, ALLOCATEMORE* lpfnAllocateMore, FREEBUFFER* lpfnFreeBuffer);
]]
return ffi.load( "wab32.dll" )

require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IAddrBook; //Interface
  typedef void* IWABObject; //Interface
  typedef ULONG WINAPI_WAB_PARAM_Flags; //Alias
  typedef struct WAB_PARAM {
    ULONG cbSize;
    HWND hwnd;
    LPSTR szFileName;
    WINAPI_WAB_PARAM_Flags ulFlags;
    GUID guidPSExt;
  } WAB_PARAM;
  typedef WAB_PARAM *LPWAB_PARAM; //Pointer
  HRESULT WABOpen(   LPADRBOOK* lppAdrBook, LPWABOBJECT* lppWABObject, LPWAB_PARAM lpWABParam, DWORD Reserved2);
  HRESULT WABOpenEx( LPADRBOOK* lppAdrBook, LPWABOBJECT* lppWABObject, LPWAB_PARAM lpWABParam, DWORD Reserved2, ALLOCATEBUFFER* lpfnAllocateBuffer, ALLOCATEMORE* lpfnAllocateMore, FREEBUFFER* lpfnFreeBuffer);
]]
ffi.load( 'wab32.dll' )

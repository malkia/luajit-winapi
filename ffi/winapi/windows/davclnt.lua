require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PFNDAVAUTHCALLBACK; //Alias
  typedef DWORD OPAQUE_HANDLE; //Alias
  DWORD         DavCancelConnectionsToServer( LPWSTR lpName, BOOL fForce);
  DWORD         DavGetTheLockOwnerOfTheFile(  LPCWSTR FileName, PWSTR LockOwnerName, PULONG LockOwnerNameLengthInBytes);
  DWORD         DavInvalidateCache(           LPWSTR URLName);
  OPAQUE_HANDLE DavRegisterAuthCallback(      PFNDAVAUTHCALLBACK CallBack, ULONG Version);
  VOID          DavUnregisterAuthCallback(    OPAQUE_HANDLE hCallback);
]]
ffi.load( 'Davclnt.dll' )

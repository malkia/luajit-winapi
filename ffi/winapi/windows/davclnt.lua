require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  DWORD         DavCancelConnectionsToServer( LPWSTR lpName, BOOL fForce);
  DWORD         DavGetTheLockOwnerOfTheFile(  LPCWSTR FileName, PWSTR LockOwnerName, PULONG LockOwnerNameLengthInBytes);
  DWORD         DavInvalidateCache(           LPWSTR URLName);
  OPAQUE_HANDLE DavRegisterAuthCallback(      PFNDAVAUTHCALLBACK CallBack, ULONG Version);
  VOID          DavUnregisterAuthCallback(    OPAQUE_HANDLE hCallback);
]]
return ffi.load( 'Davclnt.dll' )

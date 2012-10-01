require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  BOOL  CanSendToFaxRecipient( );
  DWORD SendToFaxRecipient(    SendToMode sndMode, LPCWSTR lpFileName);
]]
return ffi.load( "FxsUtility.dll" )

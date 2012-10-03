require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UINT SendToMode; //Alias
  static const UINT SEND_TO_FAX_RECIPIENT_ATTACHMENT = 0;
  BOOL  CanSendToFaxRecipient( );
  DWORD SendToFaxRecipient(    SendToMode sndMode, LPCWSTR lpFileName);
]]
return ffi.load( 'FxsUtility.dll' )

require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/mapi/mapi' )
local ffi = require( 'ffi' )
ffi.cdef [[
  WINAPI_MapiErrorCode MAPIAddress(       LHANDLE lhSession, ULONG_PTR ulUIParam, LPSTR lpszCaption, ULONG nEditFields, LPSTR lpszLabels, ULONG nRecips, lpMapiRecipDesc lpRecips, FLAGS flFlags, ULONG ulReserved, LPULONG lpnNewRecips, lpMapiRecipDesc* lppNewRecips);
  WINAPI_MapiErrorCode MAPIDeleteMail(    LHANDLE lhSession, ULONG_PTR ulUIParam, LPSTR lpszMessageID, FLAGS flFlags, ULONG ulReserved);
  WINAPI_MapiErrorCode MAPIDetails(       LHANDLE lhSession, ULONG_PTR ulUIParam, lpMapiRecipDesc lpRecip, FLAGS flFlags, ULONG ulReserved);
  WINAPI_MapiErrorCode MAPIFindNext(      LHANDLE lhSession, ULONG_PTR ulUIParam, LPSTR lpszMessageType, LPSTR lpszSeedMessageID, FLAGS flFlags, ULONG ulReserved, LPSTR lpszMessageID);
  WINAPI_MapiErrorCode MAPIFreeBuffer(    LPVOID pv);
  WINAPI_MapiErrorCode MAPILogoff(        LHANDLE lhSession, ULONG_PTR ulUIParam, FLAGS flFlags, ULONG ulReserved);
  WINAPI_MapiErrorCode MAPILogon(         ULONG_PTR ulUIParam, LPSTR lpszProfileName, LPSTR lpszPassword, FLAGS flFlags, ULONG ulReserved, LPLHANDLE lplhSession);
  WINAPI_MapiErrorCode MAPIReadMail(      LHANDLE lhSession, ULONG_PTR ulUIParam, LPSTR lpszMessageID, FLAGS flFlags, ULONG ulReserved, lpMapiMessage* lppMessage);
  WINAPI_MapiErrorCode MAPIResolveName(   LHANDLE lhSession, ULONG_PTR ulUIParam, LPSTR lpszName, FLAGS flFlags, ULONG ulReserved, lpMapiRecipDesc* lppRecip);
  WINAPI_MapiErrorCode MAPISaveMail(      LHANDLE lhSession, ULONG_PTR ulUIParam, lpMapiMessage lpMessage, FLAGS flFlags, ULONG ulReserved, LPSTR lpszMessageID);
  WINAPI_MapiErrorCode MAPISendDocuments( ULONG_PTR ulUIParam, LPSTR lpszDelimChar, LPSTR lpszFilePaths, LPSTR lpszFileNames, ULONG ulReserved);
  WINAPI_MapiErrorCode MAPISendMail(      LHANDLE lhSession, ULONG_PTR ulUIParam, lpMapiMessage lpMessage, FLAGS flFlags, ULONG ulReserved);
]]
return ffi.load( 'Mapi32.dll' )

require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/mapi/mapi' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef ULONG_PTR LHANDLE; //Alias
  typedef LHANDLE *LPLHANDLE; //Pointer
  typedef ULONG WINAPI_MapiRecipClass; //Alias
  static const WINAPI_MapiRecipClass MAPI_ORIG = 0;
  static const WINAPI_MapiRecipClass MAPI_TO = 1;
  static const WINAPI_MapiRecipClass MAPI_CC = 2;
  static const WINAPI_MapiRecipClass MAPI_BCC = 3;
  typedef struct MapiRecipDesc {
    ULONG ulReserved;
    WINAPI_MapiRecipClass ulRecipClass;
    LPSTR lpszName;
    LPSTR lpszAddress;
    ULONG ulEIDSize;
    LPVOID lpEntryID;
  } MapiRecipDesc;
  typedef MapiRecipDesc *lpMapiRecipDesc; //Pointer
  typedef DWORD WINAPI_MapiFileDescFlags; //Alias
  typedef struct MapiFileDesc {
    ULONG ulReserved;
    WINAPI_MapiFileDescFlags flFlags;
    ULONG nPosition;
    LPSTR lpszPathName;
    LPSTR lpszFileName;
    LPVOID lpFileType;
  } MapiFileDesc;
  typedef MapiFileDesc *lpMapiFileDesc; //Pointer
  typedef unsigned long WINAPI_MapiMessageFlags; //Alias
  typedef struct MapiMessage {
    ULONG ulReserved;
    LPSTR lpszSubject;
    LPSTR lpszNoteText;
    LPSTR lpszMessageType;
    LPSTR lpszDateReceived;
    LPSTR lpszConversationID;
    WINAPI_MapiMessageFlags flFlags;
    lpMapiRecipDesc lpOriginator;
    ULONG nRecipCount;
    lpMapiRecipDesc lpRecips;
    ULONG nFileCount;
    lpMapiFileDesc lpFiles;
  } MapiMessage;
  typedef MapiMessage *lpMapiMessage; //Pointer
  typedef ULONG WINAPI_MapiErrorCode; //Alias
  static const WINAPI_MapiErrorCode SUCCESS_SUCCESS = 0;
  static const WINAPI_MapiErrorCode MAPI_E_USER_ABORT = 1;
  static const WINAPI_MapiErrorCode MAPI_E_FAILURE = 2;
  static const WINAPI_MapiErrorCode MAPI_E_LOGON_FAILURE = 3;
  static const WINAPI_MapiErrorCode MAPI_E_DISK_FULL = 4;
  static const WINAPI_MapiErrorCode MAPI_E_INSUFFICIENT_MEMORY = 5;
  static const WINAPI_MapiErrorCode MAPI_E_ACCESS_DENIED = 6;
  static const WINAPI_MapiErrorCode MAPI_E_TOO_MANY_SESSIONS = 8;
  static const WINAPI_MapiErrorCode MAPI_E_TOO_MANY_FILES = 9;
  static const WINAPI_MapiErrorCode MAPI_E_TOO_MANY_RECIPIENTS = 10;
  static const WINAPI_MapiErrorCode MAPI_E_ATTACHMENT_NOT_FOUND = 11;
  static const WINAPI_MapiErrorCode MAPI_E_ATTACHMENT_OPEN_FAILURE = 12;
  static const WINAPI_MapiErrorCode MAPI_E_ATTACHMENT_WRITE_FAILURE = 13;
  static const WINAPI_MapiErrorCode MAPI_E_UNKNOWN_RECIPIENT = 14;
  static const WINAPI_MapiErrorCode MAPI_E_BAD_RECIPTYPE = 15;
  static const WINAPI_MapiErrorCode MAPI_E_NO_MESSAGES = 16;
  static const WINAPI_MapiErrorCode MAPI_E_INVALID_MESSAGE = 17;
  static const WINAPI_MapiErrorCode MAPI_E_TEXT_TOO_LARGE = 18;
  static const WINAPI_MapiErrorCode MAPI_E_INVALID_SESSION = 19;
  static const WINAPI_MapiErrorCode MAPI_E_TYPE_NOT_SUPPORTED = 20;
  static const WINAPI_MapiErrorCode MAPI_E_AMBIGUOUS_RECIPIENT = 21;
  static const WINAPI_MapiErrorCode MAPI_E_MESSAGE_IN_USE = 22;
  static const WINAPI_MapiErrorCode MAPI_E_NETWORK_FAILURE = 23;
  static const WINAPI_MapiErrorCode MAPI_E_INVALID_EDITFIELDS = 24;
  static const WINAPI_MapiErrorCode MAPI_E_INVALID_RECIPS = 25;
  static const WINAPI_MapiErrorCode MAPI_E_NOT_SUPPORTED = 26;
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

require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  enum { MAX_DESC = 64 };
  enum { MAX_DESC_W = 256 };
  typedef DWORD WINAPI_RESTOREPOINT_EVENT; //Alias
  static const DWORD BEGIN_SYSTEM_CHANGE = 100;
  static const DWORD END_SYSTEM_CHANGE = 101;
  static const DWORD BEGIN_NESTED_SYSTEM_CHANGE = 102;
  static const DWORD END_NESTED_SYSTEM_CHANGE = 103;
  static const DWORD BEGIN_NESTED_SYSTEM_CHANGE_NORP = 104;
  typedef DWORD WINAPI_RESTOREPOINT_TYPE; //Alias
  static const DWORD APPLICATION_INSTALL = 0;
  static const DWORD APPLICATION_UNINSTALL = 1;
  static const DWORD RESTORE = 6;
  static const DWORD CHECKPOINT = 7;
  static const DWORD DEVICE_DRIVER_INSTALL = 10;
  static const DWORD FIRSTRUN = 11;
  static const DWORD MODIFY_SETTINGS = 12;
  static const DWORD CANCELLED_OPERATION = 13;
  static const DWORD BACKUP_RECOVERY = 14;
  static const DWORD BACKUP = 15;
  static const DWORD MANUAL_CHECKPOINT = 16;
  static const DWORD WINDOWS_UPDATE = 17;
  static const DWORD CRITICAL_UPDATE = 18;
  typedef struct RESTOREPOINTINFOA {
    WINAPI_RESTOREPOINT_EVENT dwEventType;
    WINAPI_RESTOREPOINT_TYPE dwRestorePtType;
    INT64 llSequenceNumber;
    CHAR szDescription[MAX_DESC];
  } RESTOREPOINTINFOA;
  typedef RESTOREPOINTINFOA *PRESTOREPOINTINFOA; //Pointer
  typedef struct RESTOREPOINTINFOW {
    WINAPI_RESTOREPOINT_EVENT dwEventType;
    WINAPI_RESTOREPOINT_TYPE dwRestorePtType;
    INT64 llSequenceNumber;
    WCHAR szDescription[MAX_DESC_W];
  } RESTOREPOINTINFOW;
  typedef RESTOREPOINTINFOW *PRESTOREPOINTINFOW; //Pointer
  typedef WINAPI_ERROR_CODE WINAPI_StateMgrStatus; //Alias
# pragma pack( push, 1 )
  typedef struct STATEMGRSTATUS {
    WINAPI_StateMgrStatus nStatus;
    INT64 llSequenceNumber;
  } STATEMGRSTATUS;
# pragma pack( pop )
  typedef STATEMGRSTATUS *PSTATEMGRSTATUS; //Pointer
  DWORD SRRemoveRestorePoint(      DWORD dwRPNum);
  BOOL  SRSetRestorePointA(        PRESTOREPOINTINFOA pRestorePtSpec, PSTATEMGRSTATUS pSMgrStatus);
  BOOL  SRSetRestorePointW(        PRESTOREPOINTINFOW pRestorePtSpec, PSTATEMGRSTATUS pSMgrStatus);
  BOOL  SRSetRestorePointInternal( PRESTOREPOINTINFOW pRestorePtSpec, PSTATEMGRSTATUS pSMgrStatus, BOOL fForceSurrogate);
]]
return ffi.load( 'SrClient.dll' )

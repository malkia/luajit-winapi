require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  enum { MAX_DESC = 64 };
  enum { MAX_DESC_W = 256 };
  typedef DWORD RESTOREPOINT_EVENT; //Alias
  static const RESTOREPOINT_EVENT BEGIN_SYSTEM_CHANGE = 100;
  static const RESTOREPOINT_EVENT END_SYSTEM_CHANGE = 101;
  static const RESTOREPOINT_EVENT BEGIN_NESTED_SYSTEM_CHANGE = 102;
  static const RESTOREPOINT_EVENT END_NESTED_SYSTEM_CHANGE = 103;
  static const RESTOREPOINT_EVENT BEGIN_NESTED_SYSTEM_CHANGE_NORP = 104;
  typedef DWORD RESTOREPOINT_TYPE; //Alias
  static const RESTOREPOINT_TYPE APPLICATION_INSTALL = 0;
  static const RESTOREPOINT_TYPE APPLICATION_UNINSTALL = 1;
  static const RESTOREPOINT_TYPE RESTORE = 6;
  static const RESTOREPOINT_TYPE CHECKPOINT = 7;
  static const RESTOREPOINT_TYPE DEVICE_DRIVER_INSTALL = 10;
  static const RESTOREPOINT_TYPE FIRSTRUN = 11;
  static const RESTOREPOINT_TYPE MODIFY_SETTINGS = 12;
  static const RESTOREPOINT_TYPE CANCELLED_OPERATION = 13;
  static const RESTOREPOINT_TYPE BACKUP_RECOVERY = 14;
  static const RESTOREPOINT_TYPE BACKUP = 15;
  static const RESTOREPOINT_TYPE MANUAL_CHECKPOINT = 16;
  static const RESTOREPOINT_TYPE WINDOWS_UPDATE = 17;
  static const RESTOREPOINT_TYPE CRITICAL_UPDATE = 18;
  typedef struct RESTOREPOINTINFOA {
    RESTOREPOINT_EVENT dwEventType;
    RESTOREPOINT_TYPE dwRestorePtType;
    INT64 llSequenceNumber;
    CHAR szDescription[MAX_DESC];
  } RESTOREPOINTINFOA;
  typedef RESTOREPOINTINFOA *PRESTOREPOINTINFOA; //Pointer
  typedef struct RESTOREPOINTINFOW {
    RESTOREPOINT_EVENT dwEventType;
    RESTOREPOINT_TYPE dwRestorePtType;
    INT64 llSequenceNumber;
    WCHAR szDescription[MAX_DESC_W];
  } RESTOREPOINTINFOW;
  typedef RESTOREPOINTINFOW *PRESTOREPOINTINFOW; //Pointer
  typedef ERROR_CODE StateMgrStatus; //Alias
# pragma pack( push, 1 )
  typedef struct STATEMGRSTATUS {
    StateMgrStatus nStatus;
    INT64 llSequenceNumber;
  } STATEMGRSTATUS;
# pragma pack( pop )
  typedef STATEMGRSTATUS *PSTATEMGRSTATUS; //Pointer
  DWORD SRRemoveRestorePoint(      DWORD dwRPNum);
  BOOL  SRSetRestorePointA(        PRESTOREPOINTINFOA pRestorePtSpec, PSTATEMGRSTATUS pSMgrStatus);
  BOOL  SRSetRestorePointW(        PRESTOREPOINTINFOW pRestorePtSpec, PSTATEMGRSTATUS pSMgrStatus);
  BOOL  SRSetRestorePointInternal( PRESTOREPOINTINFOW pRestorePtSpec, PSTATEMGRSTATUS pSMgrStatus, BOOL fForceSurrogate);
]]
ffi.load( 'SrClient.dll' )

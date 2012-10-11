require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PFN_SC_NOTIFY_CALLBACK; //Alias
  typedef HANDLE SERVICE_STATUS_HANDLE; //Alias
  typedef HANDLE SC_HANDLE; //Alias
  typedef LPVOID SC_LOCK; //Alias
  typedef UINT SC_STATUS_TYPE; //Alias
  static const SC_STATUS_TYPE SC_STATUS_PROCESS_INFO = 0;
  typedef DWORD WINAPI_ServiceType; //Alias
  typedef DWORD WINAPI_ServiceState; //Alias
  typedef DWORD WINAPI_ServiceCurrentState; //Alias
  static const WINAPI_ServiceCurrentState SERVICE_STOPPED = 0x00000001;
  static const WINAPI_ServiceCurrentState SERVICE_START_PENDING = 0x00000002;
  static const WINAPI_ServiceCurrentState SERVICE_STOP_PENDING = 0x00000003;
  static const WINAPI_ServiceCurrentState SERVICE_RUNNING = 0x00000004;
  static const WINAPI_ServiceCurrentState SERVICE_CONTINUE_PENDING = 0x00000005;
  static const WINAPI_ServiceCurrentState SERVICE_PAUSE_PENDING = 0x00000006;
  static const WINAPI_ServiceCurrentState SERVICE_PAUSED = 0x00000007;
  typedef DWORD WINAPI_ServiceStartType; //Alias
  static const WINAPI_ServiceStartType SERVICE_BOOT_START = 0x00000000;
  static const WINAPI_ServiceStartType SERVICE_SYSTEM_START = 0x00000001;
  static const WINAPI_ServiceStartType SERVICE_AUTO_START = 0x00000002;
  static const WINAPI_ServiceStartType SERVICE_DEMAND_START = 0x00000003;
  static const WINAPI_ServiceStartType SERVICE_DISABLED = 0x00000004;
  static const WINAPI_ServiceStartType SERVICE_NO_CHANGE = 0xffffffff;
  typedef DWORD WINAPI_ServiceErrorControl; //Alias
  static const WINAPI_ServiceErrorControl SERVICE_ERROR_IGNORE = 0x00000000;
  static const WINAPI_ServiceErrorControl SERVICE_ERROR_NORMAL = 0x00000001;
  static const WINAPI_ServiceErrorControl SERVICE_ERROR_SEVERE = 0x00000002;
  static const WINAPI_ServiceErrorControl SERVICE_ERROR_CRITICAL = 0x00000003;
  typedef DWORD WINAPI_ServiceInfoLevel; //Alias
  static const WINAPI_ServiceInfoLevel SERVICE_CONFIG_DESCRIPTION = 1;
  static const WINAPI_ServiceInfoLevel SERVICE_CONFIG_FAILURE_ACTIONS = 2;
  static const WINAPI_ServiceInfoLevel SERVICE_CONFIG_DELAYED_AUTO_START_INFO = 3;
  static const WINAPI_ServiceInfoLevel SERVICE_CONFIG_FAILURE_ACTIONS_FLAG = 4;
  static const WINAPI_ServiceInfoLevel SERVICE_CONFIG_SERVICE_SID_INFO = 5;
  static const WINAPI_ServiceInfoLevel SERVICE_CONFIG_REQUIRED_PRIVILEGES_INFO = 6;
  static const WINAPI_ServiceInfoLevel SERVICE_CONFIG_PRESHUTDOWN_INFO = 7;
  static const WINAPI_ServiceInfoLevel SERVICE_CONFIG_TRIGGER_INFO = 8;
  static const WINAPI_ServiceInfoLevel SERVICE_CONFIG_PREFERRED_NODE = 9;
  typedef DWORD WINAPI_SCManagerAccess; //Alias
  typedef DWORD WINAPI_ServiceAccess; //Alias
  typedef DWORD WINAPI_ServiceControl; //Alias
  static const WINAPI_ServiceControl SERVICE_CONTROL_STOP = 0x00000001;
  static const WINAPI_ServiceControl SERVICE_CONTROL_PAUSE = 0x00000002;
  static const WINAPI_ServiceControl SERVICE_CONTROL_CONTINUE = 0x00000003;
  static const WINAPI_ServiceControl SERVICE_CONTROL_INTERROGATE = 0x00000004;
  static const WINAPI_ServiceControl SERVICE_CONTROL_SHUTDOWN = 0x00000005;
  static const WINAPI_ServiceControl SERVICE_CONTROL_PARAMCHANGE = 0x00000006;
  static const WINAPI_ServiceControl SERVICE_CONTROL_NETBINDADD = 0x00000007;
  static const WINAPI_ServiceControl SERVICE_CONTROL_NETBINDREMOVE = 0x00000008;
  static const WINAPI_ServiceControl SERVICE_CONTROL_NETBINDENABLE = 0x00000009;
  static const WINAPI_ServiceControl SERVICE_CONTROL_NETBINDDISABLE = 0x0000000A;
  static const WINAPI_ServiceControl SERVICE_CONTROL_DEVICEEVENT = 0x0000000B;
  static const WINAPI_ServiceControl SERVICE_CONTROL_HARDWAREPROFILECHANGE = 0x0000000C;
  static const WINAPI_ServiceControl SERVICE_CONTROL_POWEREVENT = 0x0000000D;
  static const WINAPI_ServiceControl SERVICE_CONTROL_SESSIONCHANGE = 0x0000000E;
  static const WINAPI_ServiceControl SERVICE_CONTROL_PRESHUTDOWN = 0x0000000F;
  typedef DWORD WINAPI_ServiceAcceptControls; //Alias
  typedef DWORD WINAPI_ServiceNotifyMask; //Alias
  typedef DWORD WINAPI_ServiceFlags; //Alias
  typedef struct SERVICE_STATUS_PROCESS {
    WINAPI_ServiceType dwServiceType;
    WINAPI_ServiceCurrentState dwCurrentState;
    WINAPI_ServiceAcceptControls dwControlsAccepted;
    DWORD dwWin32ExitCode;
    DWORD dwServiceSpecificExitCode;
    DWORD dwCheckPoint;
    DWORD dwWaitHint;
    DWORD dwProcessId;
    WINAPI_ServiceFlags dwServiceFlags;
  } SERVICE_STATUS_PROCESS;
  typedef struct SERVICE_NOTIFY {
    DWORD dwVersion;
    PFN_SC_NOTIFY_CALLBACK pfnNotifyCallback;
    PVOID pContext;
    DWORD dwNotificationStatus;
    SERVICE_STATUS_PROCESS ServiceStatus;
    DWORD dwNotificationTriggered;
    LPTSTR pszServiceNames;
  } SERVICE_NOTIFY;
  typedef SERVICE_NOTIFY *PSERVICE_NOTIFY; //Pointer
  typedef struct SERVICE_STATUS {
    WINAPI_ServiceType dwServiceType;
    WINAPI_ServiceCurrentState dwCurrentState;
    WINAPI_ServiceAcceptControls dwControlsAccepted;
    DWORD dwWin32ExitCode;
    DWORD dwServiceSpecificExitCode;
    DWORD dwCheckPoint;
    DWORD dwWaitHint;
  } SERVICE_STATUS;
  typedef SERVICE_STATUS *LPSERVICE_STATUS; //Pointer
  typedef LPVOID LPSERVICE_MAIN_FUNCTION; //Alias
  typedef struct SERVICE_TABLE_ENTRY {
    LPTSTR lpServiceName;
    LPSERVICE_MAIN_FUNCTION lpServiceProc;
  } SERVICE_TABLE_ENTRY;
  typedef struct ENUM_SERVICE_STATUS {
    LPTSTR lpServiceName;
    LPTSTR lpDisplayName;
    SERVICE_STATUS ServiceStatus;
  } ENUM_SERVICE_STATUS;
  typedef ENUM_SERVICE_STATUS *LPENUM_SERVICE_STATUS; //Pointer
  typedef struct QUERY_SERVICE_CONFIG {
    WINAPI_ServiceType dwServiceType;
    WINAPI_ServiceStartType dwStartType;
    WINAPI_ServiceErrorControl dwErrorControl;
    LPTSTR lpBinaryPathName;
    LPTSTR lpLoadOrderGroup;
    DWORD dwTagId;
    LPTSTR lpDependencies;
    LPTSTR lpServiceStartName;
    LPTSTR lpDisplayName;
  } QUERY_SERVICE_CONFIG;
  typedef QUERY_SERVICE_CONFIG *LPQUERY_SERVICE_CONFIG; //Pointer
  typedef struct QUERY_SERVICE_LOCK_STATUS {
    DWORD fIsLocked;
    LPTSTR lpLockOwner;
    DWORD dwLockDuration;
  } QUERY_SERVICE_LOCK_STATUS;
  typedef QUERY_SERVICE_LOCK_STATUS *LPQUERY_SERVICE_LOCK_STATUS; //Pointer
]]

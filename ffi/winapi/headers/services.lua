require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PFN_SC_NOTIFY_CALLBACK; //Alias
  typedef HANDLE SERVICE_STATUS_HANDLE; //Alias
  typedef HANDLE SC_HANDLE; //Alias
  typedef LPVOID SC_LOCK; //Alias
  typedef enum SC_STATUS_TYPE {
    SC_STATUS_PROCESS_INFO = 0,
  } SC_STATUS_TYPE;
  typedef DWORD WINAPI_ServiceType; //Alias
  typedef DWORD WINAPI_ServiceState; //Alias
  typedef enum WINAPI_ServiceCurrentState {
    SERVICE_STOPPED = 0x00000001,
    SERVICE_START_PENDING = 0x00000002,
    SERVICE_STOP_PENDING = 0x00000003,
    SERVICE_RUNNING = 0x00000004,
    SERVICE_CONTINUE_PENDING = 0x00000005,
    SERVICE_PAUSE_PENDING = 0x00000006,
    SERVICE_PAUSED = 0x00000007,
  } WINAPI_ServiceCurrentState;
  typedef enum WINAPI_ServiceStartType {
    SERVICE_BOOT_START = 0x00000000,
    SERVICE_SYSTEM_START = 0x00000001,
    SERVICE_AUTO_START = 0x00000002,
    SERVICE_DEMAND_START = 0x00000003,
    SERVICE_DISABLED = 0x00000004,
    SERVICE_NO_CHANGE = 0xffffffff,
  } WINAPI_ServiceStartType;
  typedef enum WINAPI_ServiceErrorControl {
    SERVICE_ERROR_IGNORE = 0x00000000,
    SERVICE_ERROR_NORMAL = 0x00000001,
    SERVICE_ERROR_SEVERE = 0x00000002,
    SERVICE_ERROR_CRITICAL = 0x00000003,
    SERVICE_NO_CHANGE = 0xffffffff,
  } WINAPI_ServiceErrorControl;
  typedef enum WINAPI_ServiceInfoLevel {
    SERVICE_CONFIG_DESCRIPTION = 1,
    SERVICE_CONFIG_FAILURE_ACTIONS = 2,
    SERVICE_CONFIG_DELAYED_AUTO_START_INFO = 3,
    SERVICE_CONFIG_FAILURE_ACTIONS_FLAG = 4,
    SERVICE_CONFIG_SERVICE_SID_INFO = 5,
    SERVICE_CONFIG_REQUIRED_PRIVILEGES_INFO = 6,
    SERVICE_CONFIG_PRESHUTDOWN_INFO = 7,
    SERVICE_CONFIG_TRIGGER_INFO = 8,
    SERVICE_CONFIG_PREFERRED_NODE = 9,
  } WINAPI_ServiceInfoLevel;
  typedef DWORD WINAPI_SCManagerAccess; //Alias
  typedef DWORD WINAPI_ServiceAccess; //Alias
  typedef enum WINAPI_ServiceControl {
    SERVICE_CONTROL_STOP = 0x00000001,
    SERVICE_CONTROL_PAUSE = 0x00000002,
    SERVICE_CONTROL_CONTINUE = 0x00000003,
    SERVICE_CONTROL_INTERROGATE = 0x00000004,
    SERVICE_CONTROL_SHUTDOWN = 0x00000005,
    SERVICE_CONTROL_PARAMCHANGE = 0x00000006,
    SERVICE_CONTROL_NETBINDADD = 0x00000007,
    SERVICE_CONTROL_NETBINDREMOVE = 0x00000008,
    SERVICE_CONTROL_NETBINDENABLE = 0x00000009,
    SERVICE_CONTROL_NETBINDDISABLE = 0x0000000A,
    SERVICE_CONTROL_DEVICEEVENT = 0x0000000B,
    SERVICE_CONTROL_HARDWAREPROFILECHANGE = 0x0000000C,
    SERVICE_CONTROL_POWEREVENT = 0x0000000D,
    SERVICE_CONTROL_SESSIONCHANGE = 0x0000000E,
    SERVICE_CONTROL_PRESHUTDOWN = 0x0000000F,
  } WINAPI_ServiceControl;
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

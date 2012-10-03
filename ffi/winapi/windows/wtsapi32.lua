require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef struct WTS_PROCESS_INFO {
    DWORD SessionId;
    DWORD ProcessId;
    LPTSTR pProcessName;
    PSID pUserSid;
  } WTS_PROCESS_INFO;
  typedef WTS_PROCESS_INFO *PWTS_PROCESS_INFO; //Pointer
  typedef UINT WTS_CONNECTSTATE_CLASS; //Alias
  static const UINT WTSActive = 0;
  static const UINT WTSConnected = 1;
  static const UINT WTSConnectQuery = 2;
  static const UINT WTSShadow = 3;
  static const UINT WTSDisconnected = 4;
  static const UINT WTSIdle = 5;
  static const UINT WTSListen = 6;
  static const UINT WTSReset = 7;
  static const UINT WTSDown = 8;
  static const UINT WTSInit = 9;
  typedef struct WTS_SESSION_INFO {
    DWORD SessionId;
    LPTSTR pWinStationName;
    WTS_CONNECTSTATE_CLASS State;
  } WTS_SESSION_INFO;
  typedef WTS_SESSION_INFO *PWTS_SESSION_INFO; //Pointer
  typedef UINT WTS_INFO_CLASS; //Alias
  static const UINT WTSInitialProgram = 0;
  static const UINT WTSApplicationName = 1;
  static const UINT WTSWorkingDirectory = 2;
  static const UINT WTSOEMId = 3;
  static const UINT WTSSessionId = 4;
  static const UINT WTSUserName = 5;
  static const UINT WTSWinStationName = 6;
  static const UINT WTSDomainName = 7;
  static const UINT WTSConnectState = 8;
  static const UINT WTSClientBuildNumber = 9;
  static const UINT WTSClientName = 10;
  static const UINT WTSClientDirectory = 11;
  static const UINT WTSClientProductId = 12;
  static const UINT WTSClientHardwareId = 13;
  static const UINT WTSClientAddress = 14;
  static const UINT WTSClientDisplay = 15;
  static const UINT WTSClientProtocolType = 16;
  static const UINT WTSIdleTime = 17;
  static const UINT WTSLogonTime = 18;
  static const UINT WTSIncomingBytes = 19;
  static const UINT WTSOutgoingBytes = 20;
  static const UINT WTSIncomingFrames = 21;
  static const UINT WTSOutgoingFrames = 22;
  typedef UINT WTS_CONFIG_CLASS; //Alias
  static const UINT WTSUserConfigInitialProgram = 0;
  static const UINT WTSUserConfigWorkingDirectory = 1;
  static const UINT WTSUserConfigfInheritInitialProgram = 2;
  static const UINT WTSUserConfigfAllowLogonTerminalServer = 3;
  static const UINT WTSUserConfigTimeoutSettingsConnections = 4;
  static const UINT WTSUserConfigTimeoutSettingsDisconnections = 5;
  static const UINT WTSUserConfigTimeoutSettingsIdle = 6;
  static const UINT WTSUserConfigfDeviceClientDrives = 7;
  static const UINT WTSUserConfigfDeviceClientPrinters = 8;
  static const UINT WTSUserConfigfDeviceClientDefaultPrinter = 9;
  static const UINT WTSUserConfigBrokenTimeoutSettings = 10;
  static const UINT WTSUserConfigReconnectSettings = 11;
  static const UINT WTSUserConfigModemCallbackSettings = 12;
  static const UINT WTSUserConfigModemCallbackPhoneNumber = 13;
  static const UINT WTSUserConfigShadowingSettings = 14;
  static const UINT WTSUserConfigTerminalServerProfilePath = 15;
  static const UINT WTSUserConfigTerminalServerHomeDir = 16;
  static const UINT WTSUserConfigTerminalServerHomeDirDrive = 17;
  static const UINT WTSUserConfigfTerminalServerRemoteHomeDir = 18;
  typedef UINT WTS_VIRTUAL_CLASS; //Alias
  static const UINT WTSVirtualClientData = 0;
  static const UINT WTSVirtualFileHandle = 1;
  typedef DWORD WINAPI_ConsoleNotificationFlags; //Alias
  static const DWORD NOTIFY_FOR_ALL_SESSIONS = 1;
  static const DWORD NOTIFY_FOR_THIS_SESSION = 0;
  typedef HANDLE WINAPI_WtsServerHandle; //Alias
  static const HANDLE WTS_CURRENT_SERVER_HANDLE = 0;
  typedef DWORD WINAPI_WtsEventFlags; //Alias
  void   WTSCloseServer(                     WINAPI_WtsServerHandle hServer);
  BOOL   WTSConnectSession(                  ULONG LogonId, ULONG TargetLogonId, PTSTR pPassword, BOOL bWait);
  BOOL   WTSDisconnectSession(               WINAPI_WtsServerHandle hServer, DWORD SessionId, BOOL bWait);
  BOOL   WTSEnumerateProcesses(              WINAPI_WtsServerHandle hServer, DWORD Reserved, DWORD Version, PWTS_PROCESS_INFO* ppProcessInfo, DWORD* pCount);
  BOOL   WTSEnumerateSessions(               WINAPI_WtsServerHandle hServer, DWORD Reserved, DWORD Version, PWTS_SESSION_INFO* ppSessionInfo, DWORD* pCount);
  void   WTSFreeMemory(                      PVOID pMemory);
  BOOL   WTSLogoffSession(                   WINAPI_WtsServerHandle hServer, DWORD SessionId, BOOL bWait);
  HANDLE WTSOpenServer(                      LPTSTR pServerName);
  BOOL   WTSQuerySessionInformation(         WINAPI_WtsServerHandle hServer, DWORD SessionId, WTS_INFO_CLASS WTSInfoClass, LPTSTR* ppBuffer, DWORD* pBytesReturned);
  BOOL   WTSQueryUserConfig(                 LPTSTR pServerName, LPTSTR pUserName, WTS_CONFIG_CLASS WTSConfigClass, LPTSTR* ppBuffer, DWORD* pBytesReturned);
  BOOL   WTSQueryUserToken(                  ULONG SessionId, PHANDLE phToken);
  BOOL   WTSRegisterSessionNotification(     HWND hWnd, WINAPI_ConsoleNotificationFlags dwFlags);
  BOOL   WTSRegisterSessionNotificationEx(   WINAPI_WtsServerHandle hServer, HWND hWnd, WINAPI_ConsoleNotificationFlags dwFlags);
  BOOL   WTSSendMessage(                     WINAPI_WtsServerHandle hServer, DWORD SessionId, LPTSTR pTitle, DWORD TitleLength, LPTSTR pMessage, DWORD MessageLength, DWORD Style, DWORD Timeout, DWORD* pResponse, BOOL bWait);
  BOOL   WTSSetUserConfig(                   LPTSTR pServerName, LPTSTR pUserName, WTS_CONFIG_CLASS WTSConfigClass, LPTSTR pBuffer, DWORD DataLength);
  BOOL   WTSShutdownSystem(                  WINAPI_WtsServerHandle hServer, DWORD ShutdownFlag);
  BOOL   WTSStartRemoteControlSession(       LPTSTR pTargetServerName, ULONG TargetLogonId, BYTE HotkeyVk, USHORT HotkeyModifiers);
  BOOL   WTSStopRemoteControlSession(        ULONG LogonId);
  BOOL   WTSTerminateProcess(                WINAPI_WtsServerHandle hServer, DWORD ProcessId, DWORD ExitCode);
  BOOL   WTSUnRegisterSessionNotification(   HWND hWnd);
  BOOL   WTSUnRegisterSessionNotificationEx( WINAPI_WtsServerHandle hServer, HWND hWnd);
  BOOL   WTSVirtualChannelClose(             HANDLE hChannelHandle);
  HANDLE WTSVirtualChannelOpen(              WINAPI_WtsServerHandle hServer, DWORD SessionId, LPSTR pVirtualName);
  BOOL   WTSVirtualChannelPurgeInput(        HANDLE hChannelHandle);
  BOOL   WTSVirtualChannelPurgeOutput(       HANDLE hChannelHandle);
  BOOL   WTSVirtualChannelQuery(             HANDLE hChannelHandle, WTS_VIRTUAL_CLASS WtsVirtualClass, PVOID* ppBuffer, DWORD* pBytesReturned);
  BOOL   WTSVirtualChannelRead(              HANDLE hChannelHandle, ULONG TimeOut, LPVOID Buffer, ULONG BufferSize, PULONG pBytesRead);
  BOOL   WTSVirtualChannelWrite(             HANDLE hChannelHandle, LPVOID Buffer, ULONG Length, PULONG pBytesWritten);
  BOOL   WTSWaitSystemEvent(                 WINAPI_WtsServerHandle hServer, WINAPI_WtsEventFlags EventMask, WINAPI_WtsEventFlags* pEventFlags);
]]
return ffi.load( 'Wtsapi32.dll' )

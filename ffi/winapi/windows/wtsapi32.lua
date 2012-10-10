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
  static const WTS_CONNECTSTATE_CLASS WTSActive = 0;
  static const WTS_CONNECTSTATE_CLASS WTSConnected = 1;
  static const WTS_CONNECTSTATE_CLASS WTSConnectQuery = 2;
  static const WTS_CONNECTSTATE_CLASS WTSShadow = 3;
  static const WTS_CONNECTSTATE_CLASS WTSDisconnected = 4;
  static const WTS_CONNECTSTATE_CLASS WTSIdle = 5;
  static const WTS_CONNECTSTATE_CLASS WTSListen = 6;
  static const WTS_CONNECTSTATE_CLASS WTSReset = 7;
  static const WTS_CONNECTSTATE_CLASS WTSDown = 8;
  static const WTS_CONNECTSTATE_CLASS WTSInit = 9;
  typedef struct WTS_SESSION_INFO {
    DWORD SessionId;
    LPTSTR pWinStationName;
    WTS_CONNECTSTATE_CLASS State;
  } WTS_SESSION_INFO;
  typedef WTS_SESSION_INFO *PWTS_SESSION_INFO; //Pointer
  typedef UINT WTS_INFO_CLASS; //Alias
  static const WTS_INFO_CLASS WTSInitialProgram = 0;
  static const WTS_INFO_CLASS WTSApplicationName = 1;
  static const WTS_INFO_CLASS WTSWorkingDirectory = 2;
  static const WTS_INFO_CLASS WTSOEMId = 3;
  static const WTS_INFO_CLASS WTSSessionId = 4;
  static const WTS_INFO_CLASS WTSUserName = 5;
  static const WTS_INFO_CLASS WTSWinStationName = 6;
  static const WTS_INFO_CLASS WTSDomainName = 7;
  static const WTS_INFO_CLASS WTSConnectState = 8;
  static const WTS_INFO_CLASS WTSClientBuildNumber = 9;
  static const WTS_INFO_CLASS WTSClientName = 10;
  static const WTS_INFO_CLASS WTSClientDirectory = 11;
  static const WTS_INFO_CLASS WTSClientProductId = 12;
  static const WTS_INFO_CLASS WTSClientHardwareId = 13;
  static const WTS_INFO_CLASS WTSClientAddress = 14;
  static const WTS_INFO_CLASS WTSClientDisplay = 15;
  static const WTS_INFO_CLASS WTSClientProtocolType = 16;
  static const WTS_INFO_CLASS WTSIdleTime = 17;
  static const WTS_INFO_CLASS WTSLogonTime = 18;
  static const WTS_INFO_CLASS WTSIncomingBytes = 19;
  static const WTS_INFO_CLASS WTSOutgoingBytes = 20;
  static const WTS_INFO_CLASS WTSIncomingFrames = 21;
  static const WTS_INFO_CLASS WTSOutgoingFrames = 22;
  typedef UINT WTS_CONFIG_CLASS; //Alias
  static const WTS_CONFIG_CLASS WTSUserConfigInitialProgram = 0;
  static const WTS_CONFIG_CLASS WTSUserConfigWorkingDirectory = 1;
  static const WTS_CONFIG_CLASS WTSUserConfigfInheritInitialProgram = 2;
  static const WTS_CONFIG_CLASS WTSUserConfigfAllowLogonTerminalServer = 3;
  static const WTS_CONFIG_CLASS WTSUserConfigTimeoutSettingsConnections = 4;
  static const WTS_CONFIG_CLASS WTSUserConfigTimeoutSettingsDisconnections = 5;
  static const WTS_CONFIG_CLASS WTSUserConfigTimeoutSettingsIdle = 6;
  static const WTS_CONFIG_CLASS WTSUserConfigfDeviceClientDrives = 7;
  static const WTS_CONFIG_CLASS WTSUserConfigfDeviceClientPrinters = 8;
  static const WTS_CONFIG_CLASS WTSUserConfigfDeviceClientDefaultPrinter = 9;
  static const WTS_CONFIG_CLASS WTSUserConfigBrokenTimeoutSettings = 10;
  static const WTS_CONFIG_CLASS WTSUserConfigReconnectSettings = 11;
  static const WTS_CONFIG_CLASS WTSUserConfigModemCallbackSettings = 12;
  static const WTS_CONFIG_CLASS WTSUserConfigModemCallbackPhoneNumber = 13;
  static const WTS_CONFIG_CLASS WTSUserConfigShadowingSettings = 14;
  static const WTS_CONFIG_CLASS WTSUserConfigTerminalServerProfilePath = 15;
  static const WTS_CONFIG_CLASS WTSUserConfigTerminalServerHomeDir = 16;
  static const WTS_CONFIG_CLASS WTSUserConfigTerminalServerHomeDirDrive = 17;
  static const WTS_CONFIG_CLASS WTSUserConfigfTerminalServerRemoteHomeDir = 18;
  typedef UINT WTS_VIRTUAL_CLASS; //Alias
  static const WTS_VIRTUAL_CLASS WTSVirtualClientData = 0;
  static const WTS_VIRTUAL_CLASS WTSVirtualFileHandle = 1;
  typedef DWORD ConsoleNotificationFlags; //Alias
  static const ConsoleNotificationFlags NOTIFY_FOR_ALL_SESSIONS = 1;
  static const ConsoleNotificationFlags NOTIFY_FOR_THIS_SESSION = 0;
  typedef HANDLE WtsServerHandle; //Alias
  static const WtsServerHandle WTS_CURRENT_SERVER_HANDLE = 0;
  typedef DWORD WtsEventFlags; //Alias
  void   WTSCloseServer(                     WtsServerHandle hServer);
  BOOL   WTSConnectSession(                  ULONG LogonId, ULONG TargetLogonId, PTSTR pPassword, BOOL bWait);
  BOOL   WTSDisconnectSession(               WtsServerHandle hServer, DWORD SessionId, BOOL bWait);
  BOOL   WTSEnumerateProcesses(              WtsServerHandle hServer, DWORD Reserved, DWORD Version, PWTS_PROCESS_INFO* ppProcessInfo, DWORD* pCount);
  BOOL   WTSEnumerateSessions(               WtsServerHandle hServer, DWORD Reserved, DWORD Version, PWTS_SESSION_INFO* ppSessionInfo, DWORD* pCount);
  void   WTSFreeMemory(                      PVOID pMemory);
  BOOL   WTSLogoffSession(                   WtsServerHandle hServer, DWORD SessionId, BOOL bWait);
  HANDLE WTSOpenServer(                      LPTSTR pServerName);
  BOOL   WTSQuerySessionInformation(         WtsServerHandle hServer, DWORD SessionId, WTS_INFO_CLASS WTSInfoClass, LPTSTR* ppBuffer, DWORD* pBytesReturned);
  BOOL   WTSQueryUserConfig(                 LPTSTR pServerName, LPTSTR pUserName, WTS_CONFIG_CLASS WTSConfigClass, LPTSTR* ppBuffer, DWORD* pBytesReturned);
  BOOL   WTSQueryUserToken(                  ULONG SessionId, PHANDLE phToken);
  BOOL   WTSRegisterSessionNotification(     HWND hWnd, ConsoleNotificationFlags dwFlags);
  BOOL   WTSRegisterSessionNotificationEx(   WtsServerHandle hServer, HWND hWnd, ConsoleNotificationFlags dwFlags);
  BOOL   WTSSendMessage(                     WtsServerHandle hServer, DWORD SessionId, LPTSTR pTitle, DWORD TitleLength, LPTSTR pMessage, DWORD MessageLength, DWORD Style, DWORD Timeout, DWORD* pResponse, BOOL bWait);
  BOOL   WTSSetUserConfig(                   LPTSTR pServerName, LPTSTR pUserName, WTS_CONFIG_CLASS WTSConfigClass, LPTSTR pBuffer, DWORD DataLength);
  BOOL   WTSShutdownSystem(                  WtsServerHandle hServer, DWORD ShutdownFlag);
  BOOL   WTSStartRemoteControlSession(       LPTSTR pTargetServerName, ULONG TargetLogonId, BYTE HotkeyVk, USHORT HotkeyModifiers);
  BOOL   WTSStopRemoteControlSession(        ULONG LogonId);
  BOOL   WTSTerminateProcess(                WtsServerHandle hServer, DWORD ProcessId, DWORD ExitCode);
  BOOL   WTSUnRegisterSessionNotification(   HWND hWnd);
  BOOL   WTSUnRegisterSessionNotificationEx( WtsServerHandle hServer, HWND hWnd);
  BOOL   WTSVirtualChannelClose(             HANDLE hChannelHandle);
  HANDLE WTSVirtualChannelOpen(              WtsServerHandle hServer, DWORD SessionId, LPSTR pVirtualName);
  BOOL   WTSVirtualChannelPurgeInput(        HANDLE hChannelHandle);
  BOOL   WTSVirtualChannelPurgeOutput(       HANDLE hChannelHandle);
  BOOL   WTSVirtualChannelQuery(             HANDLE hChannelHandle, WTS_VIRTUAL_CLASS WtsVirtualClass, PVOID* ppBuffer, DWORD* pBytesReturned);
  BOOL   WTSVirtualChannelRead(              HANDLE hChannelHandle, ULONG TimeOut, LPVOID Buffer, ULONG BufferSize, PULONG pBytesRead);
  BOOL   WTSVirtualChannelWrite(             HANDLE hChannelHandle, LPVOID Buffer, ULONG Length, PULONG pBytesWritten);
  BOOL   WTSWaitSystemEvent(                 WtsServerHandle hServer, WtsEventFlags EventMask, WtsEventFlags* pEventFlags);
]]
ffi.load( 'Wtsapi32.dll' )

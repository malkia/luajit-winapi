require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
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
return ffi.load( "Wtsapi32.dll" )

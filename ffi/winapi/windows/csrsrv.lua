require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/native' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PCSR_THREAD; //Alias
  typedef LPVOID PCSR_API_MESSAGE; //Alias
  typedef LPVOID PCSR_NT_SESSION; //Alias
  typedef LPVOID PCSR_PROCESS; //Alias
  typedef LPVOID CSR_WAIT_FUNCTION; //Alias
  PCSR_THREAD CsrAddStaticServerThread(    HANDLE hThread, PCLIENT_ID ClientId, ULONG ThreadFlags);
  NTSTATUS    CsrCallServerFromServer(     PCSR_API_MESSAGE ReceiveMsg, PCSR_API_MESSAGE ReplyMsg);
  PCSR_THREAD CsrConnectToUser(            );
  NTSTATUS    CsrCreateProcess(            HANDLE hProcess, HANDLE hThread, PCLIENT_ID ClientId, PCSR_NT_SESSION NtSession, ULONG Flags, PCLIENT_ID DebugCid);
  NTSTATUS    CsrCreateRemoteThread(       HANDLE hThread, PCLIENT_ID ClientId);
  BOOLEAN     CsrCreateWait(               PLIST_ENTRY WaitList, CSR_WAIT_FUNCTION WaitFunction, PCSR_THREAD CsrWaitThread, PCSR_API_MESSAGE WaitApiMessage, PVOID WaitContext, PLIST_ENTRY UserWaitList);
  NTSTATUS    CsrDebugProcess(             PCSR_PROCESS CsrProcess);
  NTSTATUS    CsrDebugProcessStop(         PCSR_PROCESS CsrProcess);
  VOID        CsrDereferenceProcess(       PCSR_PROCESS CsrProcess);
  VOID        CsrDereferenceThread(        PCSR_THREAD CsrThread);
  VOID        CsrDereferenceWait(          PLIST_ENTRY WaitList);
  NTSTATUS    CsrDestroyProcess(           PCLIENT_ID Cid, NTSTATUS ExitStatus);
  NTSTATUS    CsrDestroyThread(            PCLIENT_ID Cid);
  NTSTATUS    CsrExecServerThread(         PVOID ThreadHandler, ULONG Flags);
  NTSTATUS    CsrGetProcessLuid(           HANDLE hProcess, PLUID Luid);
  BOOLEAN     CsrImpersonateClient(        PCSR_THREAD CsrThread);
  NTSTATUS    CsrLockProcessByClientId(    HANDLE Pid, PCSR_PROCESS* CsrProcess);
  NTSTATUS    CsrLockThreadByClientId(     HANDLE Tid, PCSR_THREAD* CsrThread);
  VOID        CsrMoveSatisfiedWait(        PLIST_ENTRY NewEntry, PLIST_ENTRY WaitList);
  BOOLEAN     CsrNotifyWait(               PLIST_ENTRY WaitList, ULONG WaitType, PVOID WaitArgument1, PVOID WaitArgument2);
  VOID        CsrPopulateDosDevices(       );
  VOID        CsrLockedReferenceProcess(   PCSR_PROCESS CsrProcess);
  HANDLE      CsrQueryApiPort(             );
  VOID        CsrReferenceThread(          PCSR_THREAD CsrThread);
  BOOLEAN     CsrRevertToSelf(             );
  NTSTATUS    CsrServerInitialization(     ULONG ArgumentCount, LPVOID Arguments);
  VOID        CsrSetBackgroundPriority(    PCSR_PROCESS CsrProcess);
  VOID        CsrSetCallingSpooler(        ULONG Reserved);
  VOID        CsrSetForegroundPriority(    PCSR_PROCESS CsrProcess);
  NTSTATUS    CsrShutdownProcesses(        PLUID CallerLuid, ULONG Flags);
  LONG        CsrUnhandledExceptionFilter( PEXCEPTION_POINTERS ExceptionInfo);
  NTSTATUS    CsrUnlockProcess(            PCSR_PROCESS CsrProcess);
  NTSTATUS    CsrUnlockThread(             PCSR_THREAD CsrThread);
  BOOLEAN     CsrValidateMessageBuffer(    PCSR_API_MESSAGE ApiMessage, PVOID* Buffer, ULONG ArgumentSize, ULONG ArgumentCount);
  BOOLEAN     CsrValidateMessageString(    PCSR_API_MESSAGE ApiMessage, LPWSTR* MessageString);
]]
ffi.load( 'CsrSrv.dll' )

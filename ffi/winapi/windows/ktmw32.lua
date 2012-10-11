require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef ULONG NOTIFICATION_MASK; //Alias
  typedef struct TRANSACTION_NOTIFICATION {
    PVOID TransactionKey;
    NOTIFICATION_MASK TransactionNotification;
    LARGE_INTEGER TmVirtualClock;
    ULONG ArgumentLength;
  } TRANSACTION_NOTIFICATION;
  typedef TRANSACTION_NOTIFICATION *PTRANSACTION_NOTIFICATION; //Pointer
  BOOL   CommitTransaction(                   HANDLE TransactionHandle);
  BOOL   CommitTransactionAsync(              HANDLE TransactionHandle);
  HANDLE CreateTransaction(                   LPSECURITY_ATTRIBUTES lpTransactionAttributes, LPGUID UOW, DWORD CreateOptions, DWORD IsolationLevel, DWORD IsolationFlags, DWORD Timeout, LPWSTR Description);
  BOOL   GetTransactionId(                    HANDLE TransactionHandle, LPGUID TransactionId);
  BOOL   GetTransactionInformation(           HANDLE TransactionHandle, PDWORD Outcome, PDWORD IsolationLevel, PDWORD IsolationFlags, PDWORD Timeout, DWORD BufferLength, LPWSTR Description);
  HANDLE OpenTransaction(                     DWORD dwDesiredAccess, LPGUID TransactionId);
  BOOL   RollbackComplete(                    HANDLE EnlistmentHandle, PLARGE_INTEGER TmVirtualClock);
  BOOL   RollbackTransaction(                 HANDLE TransactionHandle);
  BOOL   RollbackTransactionAsync(            HANDLE TransactionHandle);
  BOOL   SetTransactionInformation(           HANDLE TransactionHandle, DWORD IsolationLevel, DWORD IsolationFlags, DWORD Timeout, LPWSTR Description);
  BOOL   CommitComplete(                      HANDLE EnlistmentHandle, PLARGE_INTEGER TmVirtualClock);
  BOOL   CommitEnlistment(                    HANDLE EnlistmentHandle, PLARGE_INTEGER TmVirtualClock);
  BOOL   GetEnlistmentId(                     HANDLE EnlistmentHandle, LPGUID EnlistmentId);
  HANDLE CreateEnlistment(                    LPSECURITY_ATTRIBUTES lpEnlistmentrAttributes, HANDLE ResourceManagerHandle, HANDLE TransactionHandle, NOTIFICATION_MASK NotificationMask, DWORD CreateOptions, PVOID EnlistmentKey);
  BOOL   GetEnlistmentRecoveryInformation(    HANDLE EnlistmentHandle, ULONG BufferSize, PVOID Buffer, PULONG BufferUsed);
  HANDLE OpenEnlistment(                      DWORD dwDesiredAccess, HANDLE ResourceManagerHandle, LPGUID EnlistmentId);
  BOOL   PrepareEnlistment(                   HANDLE EnlistmentHandle, PLARGE_INTEGER TmVirtualClock);
  BOOL   PrePrepareEnlistment(                HANDLE EnlistmentHandle, PLARGE_INTEGER TmVirtualClock);
  BOOL   RecoverEnlistment(                   HANDLE EnlistmentHandle, PVOID EnlistmentKey);
  BOOL   ReadOnlyEnlistment(                  HANDLE EnlistmentHandle, PLARGE_INTEGER TmVirtualClock);
  BOOL   RollbackEnlistment(                  HANDLE EnlistmentHandle, PLARGE_INTEGER TmVirtualClock);
  BOOL   SetEnlistmentRecoveryInformation(    HANDLE EnlistmentHandle, ULONG BufferSize, PVOID Buffer);
  BOOL   SinglePhaseReject(                   HANDLE EnlistmentHandle, PLARGE_INTEGER TmVirtualClock);
  HANDLE CreateResourceManager(               LPSECURITY_ATTRIBUTES lpResourceManagerAttributes, LPGUID ResourceManagerID, DWORD CreateOptions, HANDLE TmHandle, LPWSTR Description);
  BOOL   GetNotificationResourceManager(      HANDLE ResourceManagerHandle, PTRANSACTION_NOTIFICATION TransactionNotification, ULONG NotificationLength, DWORD dwMilliseconds, PULONG ReturnLength);
  BOOL   GetNotificationResourceManagerAsync( HANDLE ResourceManagerHandle, PTRANSACTION_NOTIFICATION TransactionNotification, ULONG TransactionNotificationLength, PULONG ReturnLength, LPOVERLAPPED pOverlapped);
  HANDLE OpenResourceManager(                 DWORD dwDesiredAccess, HANDLE TmHandle, LPGUID RmGuid);
  BOOL   PrepareComplete(                     HANDLE EnlistmentHandle, PLARGE_INTEGER TmVirtualClock);
  BOOL   PrePrepareComplete(                  HANDLE EnlistmentHandle, PLARGE_INTEGER TmVirtualClock);
  BOOL   RecoverResourceManager(              HANDLE ResourceManagerHandle);
  BOOL   SetResourceManagerCompletionPort(    HANDLE ResourceManagerHandle, HANDLE IoCompletionPortHandle, ULONG_PTR CompletionKey);
  HANDLE CreateTransactionManager(            LPSECURITY_ATTRIBUTES lpTransactionAttributes, LPWSTR LogFileName, ULONG CreateOptions, ULONG CommitStrength);
  BOOL   GetCurrentClockTransactionManager(   HANDLE TransactionManagerHandle, PLARGE_INTEGER TmVirtualClock);
  BOOL   GetTransactionManagerId(             HANDLE TransactionManagerHandle, LPGUID TransactionManagerId);
  HANDLE OpenTransactionManager(              LPWSTR LogFileName, ACCESS_MASK DesiredAccess, ULONG OpenOptions);
  HANDLE OpenTransactionManagerById(          LPGUID TransactionManagerId, ACCESS_MASK DesiredAccess, ULONG OpenOptions);
  BOOL   RecoverTransactionManager(           HANDLE TransactionManagerHandle);
  BOOL   RenameTransactionManager(            LPWSTR LogFileName, LPGUID ExistingTransactionManagerGuid);
  BOOL   RollforwardTransactionManager(       HANDLE TransactionManagerHandle, PLARGE_INTEGER TmVirtualClock);
]]
return ffi.load( 'Ktmw32.dll' )

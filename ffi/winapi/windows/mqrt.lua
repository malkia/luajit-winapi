require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* ITransaction; //Interface
  typedef HANDLE QUEUEHANDLE; //Alias
  typedef PROPID QUEUEPROPID; //Alias
  typedef PROPID QMPROPID; //Alias
  typedef PROPID MGMTPROPID; //Alias
  typedef PROPID MSGPROPID; //Alias
  typedef LPVOID PMQRECEIVECALLBACK; //Alias
  typedef PROPVARIANT MQPROPVARIANT; //Alias
  typedef MQPROPVARIANT *MQPROPVARIANT[]; //Pointer
  typedef ULONG WINAPI_MQPR_Rel; //Alias
  typedef struct MQPROPERTYRESTRICTION {
    WINAPI_MQPR_Rel rel;
    PROPID prop;
    MQPROPVARIANT prval;
  } MQPROPERTYRESTRICTION;
  typedef struct MQQUEUEPROPS {
    DWORD cProp;
    QUEUEPROPID* aPropID;
    MQPROPVARIANT* aPropVar;
    HRESULT* aStatus;
  } MQQUEUEPROPS;
  typedef struct MQQMPROPS {
    DWORD cProp;
    QMPROPID* aPropID;
    MQPROPVARIANT* aPropVar;
    HRESULT* aStatus;
  } MQQMPROPS;
  typedef struct MQPRIVATEPROPS {
    DWORD cProp;
    QMPROPID* aPropID;
    MQPROPVARIANT* aPropVar;
    HRESULT* aStatus;
  } MQPRIVATEPROPS;
  typedef struct MQRESTRICTION {
    ULONG cRes;
    MQPROPERTYRESTRICTION* paPropRes;
  } MQRESTRICTION;
  typedef struct MQCOLUMNSET {
    ULONG cCol;
    PROPID* aCol;
  } MQCOLUMNSET;
  typedef struct MQSORTKEY {
    PROPID propColumn;
    ULONG dwOrder;
  } MQSORTKEY;
  typedef struct MQSORTSET {
    ULONG cCol;
    MQSORTKEY* aCol;
  } MQSORTSET;
  typedef struct MQMGMTPROPS {
    DWORD cProp;
    MGMTPROPID* aPropID;
    MQPROPVARIANT* aPropVar;
    HRESULT* aStatus;
  } MQMGMTPROPS;
  typedef struct MQMSGPROPS {
    DWORD cProp;
    MSGPROPID* aPropID;
    MQPROPVARIANT* aPropVar;
    HRESULT* aStatus;
  } MQMSGPROPS;
  HRESULT MQADsPathToFormatName(           LPCWSTR lpwcsADsPath);
  HRESULT MQBeginTransaction(              ITransaction** ppTransaction);
  HRESULT MQCloseCursor(                   HANDLE hCursor);
  HRESULT MQCloseQueue(                    QUEUEHANDLE hQueue);
  HRESULT MQCreateCursor(                  QUEUEHANDLE hQueue, PHANDLE phCursor);
  HRESULT MQCreateQueue(                   PSECURITY_DESCRIPTOR pSecurityDescriptor, MQQUEUEPROPS* pQueueProps, LPWSTR lpwcsFormatName, LPDWORD lpdwFormatNameLength);
  HRESULT MQDeleteQueue(                   LPCWSTR lpwcsFormatName);
  VOID    MQFreeMemory(                    PVOID pvMemory);
  VOID    MQFreeSecurityContext(           HANDLE hSecurityContext);
  HRESULT MQGetMachineProperties(          LPCWSTR lpwcsMachineName, GUID* pguidMachineID, MQQMPROPS* pQMProps);
  HRESULT MQGetOverlappedResult(           LPOVERLAPPED lpOverlapped);
  HRESULT MQGetPrivateComputerInformation( LPCWSTR lpwcsComputerName, MQPRIVATEPROPS* pPrivateProps);
  HRESULT MQGetQueueProperties(            LPCWSTR lpwcsFormatName, MQQUEUEPROPS* pQueueProps);
  HRESULT MQGetQueueSecurity(              LPCWSTR lpwcsFormatName, SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor, DWORD nLength, LPDWORD lpnLengthNeeded);
  HRESULT MQGetSecurityContext(            LPVOID lpCertBuffer, DWORD dwCertBufferLength, HANDLE* phSecurityContext);
  HRESULT MQGetSecurityContextEx(          LPVOID lpCertBuffer, DWORD dwCertBufferLength, HANDLE* phSecurityContext);
  HRESULT MQHandleToFormatName(            QUEUEHANDLE hQueue, LPWSTR lpwcsFormatName, LPDWORD lpdwCount);
  HRESULT MQInstanceToFormatName(          GUID* pGUID, LPWSTR lpwcsFormatName, LPDWORD lpdwCount);
  HRESULT MQLocateBegin(                   LPCWSTR lpwcsContext, MQRESTRICTION* pRestriction, MQCOLUMNSET* pColumns, MQSORTSET* pSort, PHANDLE phEnum);
  HRESULT MQLocateEnd(                     HANDLE hEnum);
  HRESULT MQLocateNext(                    HANDLE hEnum, DWORD* pcProps, MQPROPVARIANT* aPropVar);
  HRESULT MQMarkMessageRejected(           QUEUEHANDLE hQueue, ULONGLONG ullLookupId);
  HRESULT MQMgmtAction(                    LPCWSTR pMachineName, LPCWSTR pObjectName, LPCWSTR pAction);
  HRESULT MQMgmtGetInfo(                   LPCWSTR pMachineName, LPCWSTR pObjectName, MQMGMTPROPS* pMgmtProps);
  HRESULT MQMoveMessage(                   QUEUEHANDLE sourceQueue, QUEUEHANDLE targetQueue, ULONGLONG lookupID);
  HRESULT MQOpenQueue(                     LPCWSTR lpwcsFormatName, DWORD dwAccess, DWORD dwShareMode, QUEUEHANDLE* phQueue);
  HRESULT MQPathNameToFormatName(          LPCWSTR lpwcsPathName, LPWSTR lpwcsFormatName, LPDWORD lpdwCount);
  HRESULT MQPurgeQueue(                    HANDLE hQueue);
  HRESULT MQReceiveMessage(                QUEUEHANDLE hSource, DWORD dwTimeout, DWORD dwAction, MQMSGPROPS* pMessageProps, LPOVERLAPPED lpOverlapped, PMQRECEIVECALLBACK fnReceiveCallback, HANDLE hCursor, ITransaction* pTransaction);
  HRESULT MQReceiveMessageByLookupId(      QUEUEHANDLE hSource, ULONGLONG ullLookupId, DWORD dwLookupAction, MQMSGPROPS* pMessageProps, LPOVERLAPPED lpOverlapped, PMQRECEIVECALLBACK fnReceiveCallback, ITransaction* pTransaction);
  HRESULT MQRegisterCertificate(           DWORD dwFlags, PVOID lpCertBuffer, DWORD dwCertBufferLength);
  HRESULT MQSendMessage(                   QUEUEHANDLE hDestinationQueue, MQMSGPROPS* pMessageProps, ITransaction* pTransaction);
  HRESULT MQSetQueueProperties(            LPCWSTR lpwcsFormatName, MQQUEUEPROPS* pQueueProps);
  HRESULT MQSetQueueSecurity(              LPCWSTR lpwcsFormatName, SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR pSecurityDescriptor);
]]
ffi.load( 'Mqrt.dll' )

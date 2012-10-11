require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/shell' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IEnumSyncMgrConflict; //Interface
  typedef void* IEnumSyncMgrEvents; //Interface
  typedef void* IEnumSyncMgrSyncItems; //Interface
  typedef void* ISyncMgrConflict; //Interface
  typedef void* ISyncMgrConflictFolder; //Interface
  typedef void* ISyncMgrConflictItems; //Interface
  typedef void* ISyncMgrConflictPresenter; //Interface
  typedef void* ISyncMgrConflictResolutionItems; //Interface
  typedef void* ISyncMgrConflictResolveInfo; //Interface
  typedef void* ISyncMgrConflictStore; //Interface
  typedef void* ISyncMgrControl; //Interface
  typedef void* ISyncMgrEvent; //Interface
  typedef void* ISyncMgrEventLinkUIOperation; //Interface
  typedef void* ISyncMgrEventStore; //Interface
  typedef void* ISyncMgrHandler; //Interface
  typedef void* ISyncMgrHandlerCollection; //Interface
  typedef void* ISyncMgrHandlerInfo; //Interface
  typedef void* ISyncMgrResolutionHandler; //Interface
  typedef void* ISyncMgrScheduleWizardUIOperation; //Interface
  typedef void* ISyncMgrSessionCreator; //Interface
  typedef void* ISyncMgrSyncCallback; //Interface
  typedef void* ISyncMgrSyncItem; //Interface
  typedef void* ISyncMgrSyncItemContainer; //Interface
  typedef void* ISyncMgrSyncItemInfo; //Interface
  typedef void* ISyncMgrSyncResult; //Interface
  typedef void* ISyncMgrUIOperation; //Interface
  typedef DWORD SYNCMGR_ITEM_POLICIES; //Alias
  typedef DWORD SYNCMGR_EVENT_FLAGS; //Alias
  typedef DWORD SYNCMGR_RESOLUTION_ABILITIES_FLAGS; //Alias
  typedef DWORD SYNCMGR_HANDLER_POLICIES; //Alias
  typedef DWORD SYNCMGR_HANDLER_CAPABILITIES; //Alias
  typedef DWORD SYNCMGR_SYNC_CONTROL_FLAGS; //Alias
  typedef UINT SYNCMGR_EVENT_LEVEL; //Alias
  static const SYNCMGR_EVENT_LEVEL SYNCMGR_EL_INFORMATION = 1;
  static const SYNCMGR_EVENT_LEVEL SYNCMGR_EL_WARNING = 2;
  static const SYNCMGR_EVENT_LEVEL SYNCMGR_EL_ERROR = 3;
  typedef UINT SYNCMGR_CANCEL_REQUEST; //Alias
  static const SYNCMGR_CANCEL_REQUEST SYNCMGR_CR_NONE = 0;
  static const SYNCMGR_CANCEL_REQUEST SYNCMGR_CR_CANCEL_ITEM = 1;
  static const SYNCMGR_CANCEL_REQUEST SYNCMGR_CR_CANCEL_ALL = 2;
  typedef UINT SYNCMGR_PROGRESS_STATUS; //Alias
  static const SYNCMGR_PROGRESS_STATUS SYNCMGR_PS_UPDATING = 1;
  static const SYNCMGR_PROGRESS_STATUS SYNCMGR_PS_UPDATING_INDETERMINATE = 2;
  static const SYNCMGR_PROGRESS_STATUS SYNCMGR_PS_SUCCEEDED = 3;
  static const SYNCMGR_PROGRESS_STATUS SYNCMGR_PS_FAILED = 4;
  static const SYNCMGR_PROGRESS_STATUS SYNCMGR_PS_CANCELED = 5;
  static const SYNCMGR_PROGRESS_STATUS SYNCMGR_PS_DISCONNECTED = 6;
  typedef UINT SYNCMGR_RESOLUTION_FEEDBACK; //Alias
  static const SYNCMGR_RESOLUTION_FEEDBACK SYNCMGR_RF_CONTINUE = 0;
  static const SYNCMGR_RESOLUTION_FEEDBACK SYNCMGR_RF_REFRESH = 1;
  static const SYNCMGR_RESOLUTION_FEEDBACK SYNCMGR_RF_CANCEL = 2;
  typedef UINT SYNCMGR_HANDLER_TYPE; //Alias
  static const SYNCMGR_HANDLER_TYPE SYNCMGR_HT_UNSPECIFIED = 0;
  static const SYNCMGR_HANDLER_TYPE SYNCMGR_HT_APPLICATION = 1;
  static const SYNCMGR_HANDLER_TYPE SYNCMGR_HT_DEVICE = 2;
  static const SYNCMGR_HANDLER_TYPE SYNCMGR_HT_FOLDER = 3;
  static const SYNCMGR_HANDLER_TYPE SYNCMGR_HT_SERVICE = 4;
  static const SYNCMGR_HANDLER_TYPE SYNCMGR_HT_COMPUTER = 5;
  typedef UINT SYNCMGR_UPDATE_REASON; //Alias
  static const SYNCMGR_UPDATE_REASON SYNCMGR_UR_ADDED = 0;
  static const SYNCMGR_UPDATE_REASON SYNCMGR_UR_CHANGED = 1;
  static const SYNCMGR_UPDATE_REASON SYNCMGR_UR_REMOVED = 2;
  typedef UINT SYNCMGR_PRESENTER_CHOICE; //Alias
  static const SYNCMGR_PRESENTER_CHOICE SYNCMGR_PC_NO_CHOICE = 0;
  static const SYNCMGR_PRESENTER_CHOICE SYNCMGR_PC_KEEP_ONE = 1;
  static const SYNCMGR_PRESENTER_CHOICE SYNCMGR_PC_KEEP_MULTIPLE = 2;
  static const SYNCMGR_PRESENTER_CHOICE SYNCMGR_PC_KEEP_RECENT = 3;
  static const SYNCMGR_PRESENTER_CHOICE SYNCMGR_PC_REMOVE_FROM_SYNC_SET = 4;
  static const SYNCMGR_PRESENTER_CHOICE SYNCMGR_PC_SKIP = 5;
  typedef UINT SYNCMGR_PRESENTER_NEXT_STEP; //Alias
  static const SYNCMGR_PRESENTER_NEXT_STEP SYNCMGR_PNS_CONTINUE = 0;
  static const SYNCMGR_PRESENTER_NEXT_STEP SYNCMGR_PNS_DEFAULT = 1;
  static const SYNCMGR_PRESENTER_NEXT_STEP SYNCMGR_PNS_CANCEL = 2;
  typedef struct CONFIRM_CONFLICT_RESULT_INFO {
    LPWSTR pszNewName;
    UINT iItemIndex;
  } CONFIRM_CONFLICT_RESULT_INFO;
  typedef UINT SYNCMGR_CONFLICT_ITEM_TYPE; //Alias
  static const SYNCMGR_CONFLICT_ITEM_TYPE SYNCMGR_CIT_UPDATED = 0x1;
  static const SYNCMGR_CONFLICT_ITEM_TYPE SYNCMGR_CIT_DELETED = 0x2;
  typedef struct CONFIRM_CONFLICT_ITEM {
    IShellItem2* pShellItem;
    LPWSTR pszOriginalName;
    LPWSTR pszAlternateName;
    LPWSTR pszLocationShort;
    LPWSTR pszLocationFull;
    SYNCMGR_CONFLICT_ITEM_TYPE nType;
  } CONFIRM_CONFLICT_ITEM;
  typedef struct BYTE_BLOB {
    unsigned long clSize;
    byte abData[1];
  } BYTE_BLOB;
  typedef struct SYNCMGR_CONFLICT_ID_INFO {
    BYTE_BLOB* pblobID;
    BYTE_BLOB* pblobExtra;
  } SYNCMGR_CONFLICT_ID_INFO;
  typedef DWORD SYNCMGR_CONTROL_FLAGS; //Alias
  typedef DWORD SYNCMGR_ITEM_CAPABILITIES; //Alias
]]

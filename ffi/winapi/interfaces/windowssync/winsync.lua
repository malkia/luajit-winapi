require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IAsynchronousDataRetriever; //Interface
  typedef void* IChangeConflict; //Interface
  typedef void* IChangeUnitException; //Interface
  typedef void* IChangeUnitListFilterInfo; //Interface
  typedef void* IClockVector; //Interface
  typedef void* IClockVectorElement; //Interface
  typedef void* IConstructReplicaKeyMap; //Interface
  typedef void* ICoreFragment; //Interface
  typedef void* ICoreFragmentInspector; //Interface
  typedef void* IDataRetrieverCallback; //Interface
  typedef void* IEnumChangeUnitExceptions; //Interface
  typedef void* IEnumClockVector; //Interface
  typedef void* IEnumFeedClockVector; //Interface
  typedef void* IEnumRangeExceptions; //Interface
  typedef void* IEnumSingleItemExceptions; //Interface
  typedef void* IEnumSyncChanges; //Interface
  typedef void* IEnumSyncChangeUnits; //Interface
  typedef void* IFeedClockVector; //Interface
  typedef void* IFeedClockVectorElement; //Interface
  typedef void* IFilterRequestCallback; //Interface
  typedef void* IForgottenKnowledge; //Interface
  typedef void* IKnowledgeSyncProvider; //Interface
  typedef void* ILoadChangeContext; //Interface
  typedef void* IProviderConverter; //Interface
  typedef void* IRangeException; //Interface
  typedef void* IRecoverableError; //Interface
  typedef void* IRecoverableErrorData; //Interface
  typedef void* IReplicaKeyMap; //Interface
  typedef void* IRequestFilteredSync; //Interface
  typedef void* ISingleItemException; //Interface
  typedef void* ISupportFilteredSync; //Interface
  typedef void* ISupportLastWriteTime; //Interface
  typedef void* ISyncCallback; //Interface
  typedef void* ISyncCallback2; //Interface
  typedef void* ISyncChange; //Interface
  typedef void* ISyncChangeBatch; //Interface
  typedef void* ISyncChangeBatchAdvanced; //Interface
  typedef void* ISyncChangeBatchBase; //Interface
  typedef void* ISyncChangeBatchBase2; //Interface
  typedef void* ISyncChangeBatchWithPrerequisite; //Interface
  typedef void* ISyncChangeBuilder; //Interface
  typedef void* ISyncChangeUnit; //Interface
  typedef void* ISyncChangeWithPrerequisite; //Interface
  typedef void* ISyncFilterInfo; //Interface
  typedef void* ISyncFilterInfo2; //Interface
  typedef void* ISyncFullEnumerationChange; //Interface
  typedef void* ISyncFullEnumerationChangeBatch; //Interface
  typedef void* ISynchronousDataRetriever; //Interface
  typedef void* ISyncKnowledge; //Interface
  typedef void* ISyncKnowledge2; //Interface
  typedef void* ISyncProvider; //Interface
  typedef void* ISyncSessionExtendedErrorInfo; //Interface
  typedef void* ISyncSessionState; //Interface
  typedef void* ISyncSessionState2; //Interface
  typedef UINT CONFLICT_RESOLUTION_POLICY; //Alias
  static const CONFLICT_RESOLUTION_POLICY CRP_NONE = 0;
  static const CONFLICT_RESOLUTION_POLICY CRP_DESTINATION_PROVIDER_WINS = 1;
  static const CONFLICT_RESOLUTION_POLICY CRP_SOURCE_PROVIDER_WINS = 2;
  typedef UINT FILTERING_TYPE; //Alias
  static const FILTERING_TYPE FT_CURRENT_ITEMS_ONLY = 0;
  typedef UINT KNOWLEDGE_COOKIE_COMPARISON_RESULT; //Alias
  static const KNOWLEDGE_COOKIE_COMPARISON_RESULT KCCR_COOKIE_KNOWLEDGE_EQUAL = 0;
  static const KNOWLEDGE_COOKIE_COMPARISON_RESULT KCCR_COOKIE_KNOWLEDGE_CONTAINED = 1;
  static const KNOWLEDGE_COOKIE_COMPARISON_RESULT KCCR_COOKIE_KNOWLEDGE_CONTAINS = 2;
  static const KNOWLEDGE_COOKIE_COMPARISON_RESULT KCCR_COOKIE_KNOWLEDGE_NOT_COMPARABLE = 3;
  typedef UINT SYNC_FULL_ENUMERATION_ACTION; //Alias
  static const SYNC_FULL_ENUMERATION_ACTION SFEA_FULL_ENUMERATION = 0;
  static const SYNC_FULL_ENUMERATION_ACTION SFEA_PARTIAL_SYNC = 1;
  static const SYNC_FULL_ENUMERATION_ACTION SFEA_ABORT = 2;
  typedef UINT SYNC_PROGRESS_STAGE; //Alias
  static const SYNC_PROGRESS_STAGE SPS_CHANGE_DETECTION = 0;
  static const SYNC_PROGRESS_STAGE SPS_CHANGE_ENUMERATION = 1;
  static const SYNC_PROGRESS_STAGE SPS_CHANGE_APPLICATION = 2;
  typedef UINT SYNC_PROVIDER_ROLE; //Alias
  static const SYNC_PROVIDER_ROLE SPR_SOURCE = 0;
  static const SYNC_PROVIDER_ROLE SPR_DESTINATION = 1;
  typedef UINT SYNC_RESOLVE_ACTION; //Alias
  static const SYNC_RESOLVE_ACTION SRA_DEFER = 0;
  static const SYNC_RESOLVE_ACTION SRA_ACCEPT_DESTINATION_PROVIDER = 1;
  static const SYNC_RESOLVE_ACTION SRA_ACCEPT_SOURCE_PROVIDER = 2;
  static const SYNC_RESOLVE_ACTION SRA_MERGE = 3;
  static const SYNC_RESOLVE_ACTION SRA_TRANSFER_AND_DEFER = 4;
  typedef UINT SYNC_SERIALIZATION_VERSION; //Alias
  static const SYNC_SERIALIZATION_VERSION SYNC_SERIALIZATION_VERSION_V1 = 1;
  static const SYNC_SERIALIZATION_VERSION SYNC_SERIALIZATION_VERSION_V2 = 4;
  typedef UINT SYNC_STATISTICS; //Alias
  static const SYNC_STATISTICS SYNC_STATISTICS_RANGE_COUNT = 0;
  typedef struct ID_PARAMETER_PAIR {
    BOOL fIsVariable;
    USHORT cbIdSize;
  } ID_PARAMETER_PAIR;
  typedef struct ID_PARAMETERS {
    DWORD dwSize;
    ID_PARAMETER_PAIR replicaId;
    ID_PARAMETER_PAIR itemId;
    ID_PARAMETER_PAIR changeUnitId;
  } ID_PARAMETERS;
  typedef struct SYNC_RANGE {
    BYTE* pbClosedLowerBound;
    BYTE* pbClosedUpperBound;
  } SYNC_RANGE;
  typedef SYNC_RANGE *const SYNC_RANGE*; //Pointer
  typedef struct SYNC_SESSION_STATISTICS {
    DWORD dwChangesApplied;
    DWORD dwChangesFailed;
  } SYNC_SESSION_STATISTICS;
  typedef struct SYNC_TIME {
    DWORD dwDate;
    DWORD dwTime;
  } SYNC_TIME;
  typedef struct SYNC_VERSION {
    DWORD dwLastUpdatingReplicaKey;
    ULONGLONG ullTickCount;
  } SYNC_VERSION;
  typedef SYNC_VERSION *const SYNC_VERSION*; //Pointer
]]

require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IEnumWbemClassObject; //Interface
  typedef void* IMofCompiler; //Interface
  typedef void* ISWbemDateTime; //Interface
  typedef void* ISWbemEventSource; //Interface
  typedef void* ISWbemLastError; //Interface
  typedef void* ISWbemLocator; //Interface
  typedef void* ISWbemMethod; //Interface
  typedef void* ISWbemMethodSet; //Interface
  typedef void* ISWbemNamedValue; //Interface
  typedef void* ISWbemNamedValueSet; //Interface
  typedef void* ISWbemObject; //Interface
  typedef void* ISWbemObjectEx; //Interface
  typedef void* ISWbemObjectPath; //Interface
  typedef void* ISWbemObjectSet; //Interface
  typedef void* ISWbemPrivilege; //Interface
  typedef void* ISWbemPrivilegeSet; //Interface
  typedef void* ISWbemProperty; //Interface
  typedef void* ISWbemPropertySet; //Interface
  typedef void* ISWbemQualifier; //Interface
  typedef void* ISWbemQualifierSet; //Interface
  typedef void* ISWbemRefreshableItem; //Interface
  typedef void* ISWbemRefresher; //Interface
  typedef void* ISWbemSecurity; //Interface
  typedef void* ISWbemServices; //Interface
  typedef void* ISWbemServicesEx; //Interface
  typedef void* ISWbemSink; //Interface
  typedef void* ISWbemSinkEvents; //Interface
  typedef void* IUnsecuredApartment; //Interface
  typedef void* IWbemBackupRestore; //Interface
  typedef void* IWbemBackupRestoreEx; //Interface
  typedef void* IWbemCallResult; //Interface
  typedef void* IWbemClassObject; //Interface
  typedef void* IWbemConfigureRefresher; //Interface
  typedef void* IWbemContext; //Interface
  typedef void* IWbemDecoupledBasicEventProvider; //Interface
  typedef void* IWbemDecoupledRegistrar; //Interface
  typedef void* IWbemEventConsumerProvider; //Interface
  typedef void* IWbemEventProvider; //Interface
  typedef void* IWbemEventProviderQuerySink; //Interface
  typedef void* IWbemEventProviderSecurity; //Interface
  typedef void* IWbemEventSink; //Interface
  typedef void* IWbemHiPerfEnum; //Interface
  typedef void* IWbemHiPerfProvider; //Interface
  typedef void* IWbemLocator; //Interface
  typedef void* IWbemObjectAccess; //Interface
  typedef void* IWbemObjectSink; //Interface
  typedef void* IWbemObjectTextSrc; //Interface
  typedef void* IWbemPropertyProvider; //Interface
  typedef void* IWbemProviderIdentity; //Interface
  typedef void* IWbemProviderInit; //Interface
  typedef void* IWbemProviderInitSink; //Interface
  typedef void* IWbemQualifierSet; //Interface
  typedef void* IWbemRefresher; //Interface
  typedef void* IWbemServices; //Interface
  typedef void* IWbemShutdown; //Interface
  typedef void* IWbemStatusCodeText; //Interface
  typedef void* IWbemUnboundObjectSink; //Interface
  typedef void* IWbemUnsecuredApartment; //Interface
  typedef void* IWMIExtension; //Interface
  typedef LPWSTR WBEM_WSTR; //Alias
  typedef LPCWSTR WBEM_CWSTR; //Alias
  typedef HRESULT WBEMSTATUS; //Alias
  static const WBEMSTATUS WBEM_S_NO_ERROR = 0;
  static const WBEMSTATUS WBEM_S_FALSE = 1;
  static const WBEMSTATUS WBEM_S_ALREADY_EXISTS = 0x40001;
  static const WBEMSTATUS WBEM_S_RESET_TO_DEFAULT = 0x40002;
  static const WBEMSTATUS WBEM_S_DIFFERENT = 0x40003;
  static const WBEMSTATUS WBEM_S_TIMEDOUT = 0x40004;
  static const WBEMSTATUS WBEM_S_NO_MORE_DATA = 0x40005;
  static const WBEMSTATUS WBEM_S_OPERATION_CANCELLED = 0x40006;
  static const WBEMSTATUS WBEM_S_PENDING = 0x40007;
  static const WBEMSTATUS WBEM_S_DUPLICATE_OBJECTS = 0x40008;
  static const WBEMSTATUS WBEM_S_ACCESS_DENIED = 0x40009;
  static const WBEMSTATUS WBEM_S_PARTIAL_RESULTS = 0x40010;
  static const WBEMSTATUS WBEM_S_SOURCE_NOT_AVAILABLE = 0x40017;
  static const WBEMSTATUS WBEM_E_FAILED = 0x80041001;
  static const WBEMSTATUS WBEM_E_NOT_FOUND = 0x80041002;
  static const WBEMSTATUS WBEM_E_ACCESS_DENIED = 0x80041003;
  static const WBEMSTATUS WBEM_E_PROVIDER_FAILURE = 0x80041004;
  static const WBEMSTATUS WBEM_E_TYPE_MISMATCH = 0x80041005;
  static const WBEMSTATUS WBEM_E_OUT_OF_MEMORY = 0x80041006;
  static const WBEMSTATUS WBEM_E_INVALID_CONTEXT = 0x80041007;
  static const WBEMSTATUS WBEM_E_INVALID_PARAMETER = 0x80041008;
  static const WBEMSTATUS WBEM_E_NOT_AVAILABLE = 0x80041009;
  static const WBEMSTATUS WBEM_E_CRITICAL_ERROR = 0x8004100a;
  static const WBEMSTATUS WBEM_E_INVALID_STREAM = 0x8004100b;
  static const WBEMSTATUS WBEM_E_NOT_SUPPORTED = 0x8004100c;
  static const WBEMSTATUS WBEM_E_INVALID_SUPERCLASS = 0x8004100d;
  static const WBEMSTATUS WBEM_E_INVALID_NAMESPACE = 0x8004100e;
  static const WBEMSTATUS WBEM_E_INVALID_OBJECT = 0x8004100f;
  static const WBEMSTATUS WBEM_E_INVALID_CLASS = 0x80041010;
  static const WBEMSTATUS WBEM_E_PROVIDER_NOT_FOUND = 0x80041011;
  static const WBEMSTATUS WBEM_E_INVALID_PROVIDER_REGISTRATION = 0x80041012;
  static const WBEMSTATUS WBEM_E_PROVIDER_LOAD_FAILURE = 0x80041013;
  static const WBEMSTATUS WBEM_E_INITIALIZATION_FAILURE = 0x80041014;
  static const WBEMSTATUS WBEM_E_TRANSPORT_FAILURE = 0x80041015;
  static const WBEMSTATUS WBEM_E_INVALID_OPERATION = 0x80041016;
  static const WBEMSTATUS WBEM_E_INVALID_QUERY = 0x80041017;
  static const WBEMSTATUS WBEM_E_INVALID_QUERY_TYPE = 0x80041018;
  static const WBEMSTATUS WBEM_E_ALREADY_EXISTS = 0x80041019;
  static const WBEMSTATUS WBEM_E_OVERRIDE_NOT_ALLOWED = 0x8004101a;
  static const WBEMSTATUS WBEM_E_PROPAGATED_QUALIFIER = 0x8004101b;
  static const WBEMSTATUS WBEM_E_PROPAGATED_PROPERTY = 0x8004101c;
  static const WBEMSTATUS WBEM_E_UNEXPECTED = 0x8004101d;
  static const WBEMSTATUS WBEM_E_ILLEGAL_OPERATION = 0x8004101e;
  static const WBEMSTATUS WBEM_E_CANNOT_BE_KEY = 0x8004101f;
  static const WBEMSTATUS WBEM_E_INCOMPLETE_CLASS = 0x80041020;
  static const WBEMSTATUS WBEM_E_INVALID_SYNTAX = 0x80041021;
  static const WBEMSTATUS WBEM_E_NONDECORATED_OBJECT = 0x80041022;
  static const WBEMSTATUS WBEM_E_READ_ONLY = 0x80041023;
  static const WBEMSTATUS WBEM_E_PROVIDER_NOT_CAPABLE = 0x80041024;
  static const WBEMSTATUS WBEM_E_CLASS_HAS_CHILDREN = 0x80041025;
  static const WBEMSTATUS WBEM_E_CLASS_HAS_INSTANCES = 0x80041026;
  static const WBEMSTATUS WBEM_E_QUERY_NOT_IMPLEMENTED = 0x80041027;
  static const WBEMSTATUS WBEM_E_ILLEGAL_NULL = 0x80041028;
  static const WBEMSTATUS WBEM_E_INVALID_QUALIFIER_TYPE = 0x80041029;
  static const WBEMSTATUS WBEM_E_INVALID_PROPERTY_TYPE = 0x8004102a;
  static const WBEMSTATUS WBEM_E_VALUE_OUT_OF_RANGE = 0x8004102b;
  static const WBEMSTATUS WBEM_E_CANNOT_BE_SINGLETON = 0x8004102c;
  static const WBEMSTATUS WBEM_E_INVALID_CIM_TYPE = 0x8004102d;
  static const WBEMSTATUS WBEM_E_INVALID_METHOD = 0x8004102e;
  static const WBEMSTATUS WBEM_E_INVALID_METHOD_PARAMETERS = 0x8004102f;
  static const WBEMSTATUS WBEM_E_SYSTEM_PROPERTY = 0x80041030;
  static const WBEMSTATUS WBEM_E_INVALID_PROPERTY = 0x80041031;
  static const WBEMSTATUS WBEM_E_CALL_CANCELLED = 0x80041032;
  static const WBEMSTATUS WBEM_E_SHUTTING_DOWN = 0x80041033;
  static const WBEMSTATUS WBEM_E_PROPAGATED_METHOD = 0x80041034;
  static const WBEMSTATUS WBEM_E_UNSUPPORTED_PARAMETER = 0x80041035;
  static const WBEMSTATUS WBEM_E_MISSING_PARAMETER_ID = 0x80041036;
  static const WBEMSTATUS WBEM_E_INVALID_PARAMETER_ID = 0x80041037;
  static const WBEMSTATUS WBEM_E_NONCONSECUTIVE_PARAMETER_IDS = 0x80041038;
  static const WBEMSTATUS WBEM_E_PARAMETER_ID_ON_RETVAL = 0x80041039;
  static const WBEMSTATUS WBEM_E_INVALID_OBJECT_PATH = 0x8004103a;
  static const WBEMSTATUS WBEM_E_OUT_OF_DISK_SPACE = 0x8004103b;
  static const WBEMSTATUS WBEM_E_BUFFER_TOO_SMALL = 0x8004103c;
  static const WBEMSTATUS WBEM_E_UNSUPPORTED_PUT_EXTENSION = 0x8004103d;
  static const WBEMSTATUS WBEM_E_UNKNOWN_OBJECT_TYPE = 0x8004103e;
  static const WBEMSTATUS WBEM_E_UNKNOWN_PACKET_TYPE = 0x8004103f;
  static const WBEMSTATUS WBEM_E_MARSHAL_VERSION_MISMATCH = 0x80041040;
  static const WBEMSTATUS WBEM_E_MARSHAL_INVALID_SIGNATURE = 0x80041041;
  static const WBEMSTATUS WBEM_E_INVALID_QUALIFIER = 0x80041042;
  static const WBEMSTATUS WBEM_E_INVALID_DUPLICATE_PARAMETER = 0x80041043;
  static const WBEMSTATUS WBEM_E_TOO_MUCH_DATA = 0x80041044;
  static const WBEMSTATUS WBEM_E_SERVER_TOO_BUSY = 0x80041045;
  static const WBEMSTATUS WBEM_E_INVALID_FLAVOR = 0x80041046;
  static const WBEMSTATUS WBEM_E_CIRCULAR_REFERENCE = 0x80041047;
  static const WBEMSTATUS WBEM_E_UNSUPPORTED_CLASS_UPDATE = 0x80041048;
  static const WBEMSTATUS WBEM_E_CANNOT_CHANGE_KEY_INHERITANCE = 0x80041049;
  static const WBEMSTATUS WBEM_E_CANNOT_CHANGE_INDEX_INHERITANCE = 0x80041050;
  static const WBEMSTATUS WBEM_E_TOO_MANY_PROPERTIES = 0x80041051;
  static const WBEMSTATUS WBEM_E_UPDATE_TYPE_MISMATCH = 0x80041052;
  static const WBEMSTATUS WBEM_E_UPDATE_OVERRIDE_NOT_ALLOWED = 0x80041053;
  static const WBEMSTATUS WBEM_E_UPDATE_PROPAGATED_METHOD = 0x80041054;
  static const WBEMSTATUS WBEM_E_METHOD_NOT_IMPLEMENTED = 0x80041055;
  static const WBEMSTATUS WBEM_E_METHOD_DISABLED = 0x80041056;
  static const WBEMSTATUS WBEM_E_REFRESHER_BUSY = 0x80041057;
  static const WBEMSTATUS WBEM_E_UNPARSABLE_QUERY = 0x80041058;
  static const WBEMSTATUS WBEM_E_NOT_EVENT_CLASS = 0x80041059;
  static const WBEMSTATUS WBEM_E_MISSING_GROUP_WITHIN = 0x8004105a;
  static const WBEMSTATUS WBEM_E_MISSING_AGGREGATION_LIST = 0x8004105b;
  static const WBEMSTATUS WBEM_E_PROPERTY_NOT_AN_OBJECT = 0x8004105c;
  static const WBEMSTATUS WBEM_E_AGGREGATING_BY_OBJECT = 0x8004105d;
  static const WBEMSTATUS WBEM_E_UNINTERPRETABLE_PROVIDER_QUERY = 0x8004105f;
  static const WBEMSTATUS WBEM_E_BACKUP_RESTORE_WINMGMT_RUNNING = 0x80041060;
  static const WBEMSTATUS WBEM_E_QUEUE_OVERFLOW = 0x80041061;
  static const WBEMSTATUS WBEM_E_PRIVILEGE_NOT_HELD = 0x80041062;
  static const WBEMSTATUS WBEM_E_INVALID_OPERATOR = 0x80041063;
  static const WBEMSTATUS WBEM_E_LOCAL_CREDENTIALS = 0x80041064;
  static const WBEMSTATUS WBEM_E_CANNOT_BE_ABSTRACT = 0x80041065;
  static const WBEMSTATUS WBEM_E_AMENDED_OBJECT = 0x80041066;
  static const WBEMSTATUS WBEM_E_CLIENT_TOO_SLOW = 0x80041067;
  static const WBEMSTATUS WBEM_E_NULL_SECURITY_DESCRIPTOR = 0x80041068;
  static const WBEMSTATUS WBEM_E_TIMED_OUT = 0x80041069;
  static const WBEMSTATUS WBEM_E_INVALID_ASSOCIATION = 0x8004106a;
  static const WBEMSTATUS WBEM_E_AMBIGUOUS_OPERATION = 0x8004106b;
  static const WBEMSTATUS WBEM_E_QUOTA_VIOLATION = 0x8004106c;
  static const WBEMSTATUS WBEM_E_RESERVED_001 = 0x8004106d;
  static const WBEMSTATUS WBEM_E_RESERVED_002 = 0x8004106e;
  static const WBEMSTATUS WBEM_E_UNSUPPORTED_LOCALE = 0x8004106f;
  static const WBEMSTATUS WBEM_E_HANDLE_OUT_OF_DATE = 0x80041070;
  static const WBEMSTATUS WBEM_E_CONNECTION_FAILED = 0x80041071;
  static const WBEMSTATUS WBEM_E_INVALID_HANDLE_REQUEST = 0x80041072;
  static const WBEMSTATUS WBEM_E_PROPERTY_NAME_TOO_WIDE = 0x80041073;
  static const WBEMSTATUS WBEM_E_CLASS_NAME_TOO_WIDE = 0x80041074;
  static const WBEMSTATUS WBEM_E_METHOD_NAME_TOO_WIDE = 0x80041075;
  static const WBEMSTATUS WBEM_E_QUALIFIER_NAME_TOO_WIDE = 0x80041076;
  static const WBEMSTATUS WBEM_E_RERUN_COMMAND = 0x80041077;
  static const WBEMSTATUS WBEM_E_DATABASE_VER_MISMATCH = 0x80041078;
  static const WBEMSTATUS WBEM_E_VETO_DELETE = 0x80041079;
  static const WBEMSTATUS WBEM_E_VETO_PUT = 0x8004107a;
  static const WBEMSTATUS WBEM_E_INVALID_LOCALE = 0x80041080;
  static const WBEMSTATUS WBEM_E_PROVIDER_SUSPENDED = 0x80041081;
  static const WBEMSTATUS WBEM_E_SYNCHRONIZATION_REQUIRED = 0x80041082;
  static const WBEMSTATUS WBEM_E_NO_SCHEMA = 0x80041083;
  static const WBEMSTATUS WBEM_E_PROVIDER_ALREADY_REGISTERED = 0x80041084;
  static const WBEMSTATUS WBEM_E_PROVIDER_NOT_REGISTERED = 0x80041085;
  static const WBEMSTATUS WBEM_E_FATAL_TRANSPORT_ERROR = 0x80041086;
  static const WBEMSTATUS WBEM_E_ENCRYPTED_CONNECTION_REQUIRED = 0x80041087;
  static const WBEMSTATUS WBEM_E_PROVIDER_TIMED_OUT = 0x80041088;
  static const WBEMSTATUS WBEM_E_NO_KEY = 0x80041089;
  static const WBEMSTATUS WBEM_E_PROVIDER_DISABLED = 0x8004108a;
  static const WBEMSTATUS WBEMESS_E_REGISTRATION_TOO_BROAD = 0x80042001;
  static const WBEMSTATUS WBEMESS_E_REGISTRATION_TOO_PRECISE = 0x80042002;
  static const WBEMSTATUS WBEMESS_E_AUTHZ_NOT_PRIVILEGED = 0x80042003;
  static const WBEMSTATUS WBEMMOF_E_EXPECTED_QUALIFIER_NAME = 0x80044001;
  static const WBEMSTATUS WBEMMOF_E_EXPECTED_SEMI = 0x80044002;
  static const WBEMSTATUS WBEMMOF_E_EXPECTED_OPEN_BRACE = 0x80044003;
  static const WBEMSTATUS WBEMMOF_E_EXPECTED_CLOSE_BRACE = 0x80044004;
  static const WBEMSTATUS WBEMMOF_E_EXPECTED_CLOSE_BRACKET = 0x80044005;
  static const WBEMSTATUS WBEMMOF_E_EXPECTED_CLOSE_PAREN = 0x80044006;
  static const WBEMSTATUS WBEMMOF_E_ILLEGAL_CONSTANT_VALUE = 0x80044007;
  static const WBEMSTATUS WBEMMOF_E_EXPECTED_TYPE_IDENTIFIER = 0x80044008;
  static const WBEMSTATUS WBEMMOF_E_EXPECTED_OPEN_PAREN = 0x80044009;
  static const WBEMSTATUS WBEMMOF_E_UNRECOGNIZED_TOKEN = 0x8004400a;
  static const WBEMSTATUS WBEMMOF_E_UNRECOGNIZED_TYPE = 0x8004400b;
  static const WBEMSTATUS WBEMMOF_E_EXPECTED_PROPERTY_NAME = 0x8004400c;
  static const WBEMSTATUS WBEMMOF_E_TYPEDEF_NOT_SUPPORTED = 0x8004400d;
  static const WBEMSTATUS WBEMMOF_E_UNEXPECTED_ALIAS = 0x8004400e;
  static const WBEMSTATUS WBEMMOF_E_UNEXPECTED_ARRAY_INIT = 0x8004400f;
  static const WBEMSTATUS WBEMMOF_E_INVALID_AMENDMENT_SYNTAX = 0x80044010;
  static const WBEMSTATUS WBEMMOF_E_INVALID_DUPLICATE_AMENDMENT = 0x80044011;
  static const WBEMSTATUS WBEMMOF_E_INVALID_PRAGMA = 0x80044012;
  static const WBEMSTATUS WBEMMOF_E_INVALID_NAMESPACE_SYNTAX = 0x80044013;
  static const WBEMSTATUS WBEMMOF_E_EXPECTED_CLASS_NAME = 0x80044014;
  static const WBEMSTATUS WBEMMOF_E_TYPE_MISMATCH = 0x80044015;
  static const WBEMSTATUS WBEMMOF_E_EXPECTED_ALIAS_NAME = 0x80044016;
  static const WBEMSTATUS WBEMMOF_E_INVALID_CLASS_DECLARATION = 0x80044017;
  static const WBEMSTATUS WBEMMOF_E_INVALID_INSTANCE_DECLARATION = 0x80044018;
  static const WBEMSTATUS WBEMMOF_E_EXPECTED_DOLLAR = 0x80044019;
  static const WBEMSTATUS WBEMMOF_E_CIMTYPE_QUALIFIER = 0x8004401a;
  static const WBEMSTATUS WBEMMOF_E_DUPLICATE_PROPERTY = 0x8004401b;
  static const WBEMSTATUS WBEMMOF_E_INVALID_NAMESPACE_SPECIFICATION = 0x8004401c;
  static const WBEMSTATUS WBEMMOF_E_OUT_OF_RANGE = 0x8004401d;
  static const WBEMSTATUS WBEMMOF_E_INVALID_FILE = 0x8004401e;
  static const WBEMSTATUS WBEMMOF_E_ALIASES_IN_EMBEDDED = 0x8004401f;
  static const WBEMSTATUS WBEMMOF_E_NULL_ARRAY_ELEM = 0x80044020;
  static const WBEMSTATUS WBEMMOF_E_DUPLICATE_QUALIFIER = 0x80044021;
  static const WBEMSTATUS WBEMMOF_E_EXPECTED_FLAVOR_TYPE = 0x80044022;
  static const WBEMSTATUS WBEMMOF_E_INCOMPATIBLE_FLAVOR_TYPES = 0x80044023;
  static const WBEMSTATUS WBEMMOF_E_MULTIPLE_ALIASES = 0x80044024;
  static const WBEMSTATUS WBEMMOF_E_INCOMPATIBLE_FLAVOR_TYPES2 = 0x80044025;
  static const WBEMSTATUS WBEMMOF_E_NO_ARRAYS_RETURNED = 0x80044026;
  static const WBEMSTATUS WBEMMOF_E_MUST_BE_IN_OR_OUT = 0x80044027;
  static const WBEMSTATUS WBEMMOF_E_INVALID_FLAGS_SYNTAX = 0x80044028;
  static const WBEMSTATUS WBEMMOF_E_EXPECTED_BRACE_OR_BAD_TYPE = 0x80044029;
  static const WBEMSTATUS WBEMMOF_E_UNSUPPORTED_CIMV22_QUAL_VALUE = 0x8004402a;
  static const WBEMSTATUS WBEMMOF_E_UNSUPPORTED_CIMV22_DATA_TYPE = 0x8004402b;
  static const WBEMSTATUS WBEMMOF_E_INVALID_DELETEINSTANCE_SYNTAX = 0x8004402c;
  static const WBEMSTATUS WBEMMOF_E_INVALID_QUALIFIER_SYNTAX = 0x8004402d;
  static const WBEMSTATUS WBEMMOF_E_QUALIFIER_USED_OUTSIDE_SCOPE = 0x8004402e;
  static const WBEMSTATUS WBEMMOF_E_ERROR_CREATING_TEMP_FILE = 0x8004402f;
  static const WBEMSTATUS WBEMMOF_E_ERROR_INVALID_INCLUDE_FILE = 0x80044030;
  static const WBEMSTATUS WBEMMOF_E_INVALID_DELETECLASS_SYNTAX = 0x80044031;
  typedef struct WBEM_COMPILE_STATUS_INFO {
    long lPhaseError;
    HRESULT hRes;
    long ObjectNum;
    long FirstLine;
    long LastLine;
    DWORD dwOutFlags;
  } WBEM_COMPILE_STATUS_INFO;
  typedef UINT WbemObjectTextFormatEnum; //Alias
  static const WbemObjectTextFormatEnum wbemObjectTextFormatCIMDTD20 = 1;
  static const WbemObjectTextFormatEnum wbemObjectTextFormatWMIDTD20 = 2;
  typedef UINT WbemPrivilegeEnum; //Alias
  static const WbemPrivilegeEnum wbemPrivilegeCreateToken = 1;
  static const WbemPrivilegeEnum wbemPrivilegePrimaryToken = 2;
  static const WbemPrivilegeEnum wbemPrivilegeLockMemory = 3;
  static const WbemPrivilegeEnum wbemPrivilegeIncreaseQuota = 4;
  static const WbemPrivilegeEnum wbemPrivilegeMachineAccount = 5;
  static const WbemPrivilegeEnum wbemPrivilegeTcb = 6;
  static const WbemPrivilegeEnum wbemPrivilegeSecurity = 7;
  static const WbemPrivilegeEnum wbemPrivilegeTakeOwnership = 8;
  static const WbemPrivilegeEnum wbemPrivilegeLoadDriver = 9;
  static const WbemPrivilegeEnum wbemPrivilegeSystemProfile = 10;
  static const WbemPrivilegeEnum wbemPrivilegeSystemtime = 11;
  static const WbemPrivilegeEnum wbemPrivilegeProfileSingleProcess = 12;
  static const WbemPrivilegeEnum wbemPrivilegeIncreaseBasePriority = 13;
  static const WbemPrivilegeEnum wbemPrivilegeCreatePagefile = 14;
  static const WbemPrivilegeEnum wbemPrivilegeCreatePermanent = 15;
  static const WbemPrivilegeEnum wbemPrivilegeBackup = 16;
  static const WbemPrivilegeEnum wbemPrivilegeRestore = 17;
  static const WbemPrivilegeEnum wbemPrivilegeShutdown = 18;
  static const WbemPrivilegeEnum wbemPrivilegeDebug = 19;
  static const WbemPrivilegeEnum wbemPrivilegeAudit = 20;
  static const WbemPrivilegeEnum wbemPrivilegeSystemEnvironment = 21;
  static const WbemPrivilegeEnum wbemPrivilegeChangeNotify = 22;
  static const WbemPrivilegeEnum wbemPrivilegeRemoteShutdown = 23;
  static const WbemPrivilegeEnum wbemPrivilegeUndock = 24;
  static const WbemPrivilegeEnum wbemPrivilegeSyncAgent = 25;
  static const WbemPrivilegeEnum wbemPrivilegeEnableDelegation = 26;
  static const WbemPrivilegeEnum wbemPrivilegeManageVolume = 27;
  typedef UINT WbemCimtypeEnum; //Alias
  static const WbemCimtypeEnum wbemCimtypeSint8 = 16;
  static const WbemCimtypeEnum wbemCimtypeUint8 = 17;
  static const WbemCimtypeEnum wbemCimtypeSint16 = 2;
  static const WbemCimtypeEnum wbemCimtypeUint16 = 18;
  static const WbemCimtypeEnum wbemCimtypeSint32 = 3;
  static const WbemCimtypeEnum wbemCimtypeUint32 = 19;
  static const WbemCimtypeEnum wbemCimtypeSint64 = 20;
  static const WbemCimtypeEnum wbemCimtypeUint64 = 21;
  static const WbemCimtypeEnum wbemCimtypeReal32 = 4;
  static const WbemCimtypeEnum wbemCimtypeReal64 = 5;
  static const WbemCimtypeEnum wbemCimtypeBoolean = 11;
  static const WbemCimtypeEnum wbemCimtypeString = 8;
  static const WbemCimtypeEnum wbemCimtypeDatetime = 101;
  static const WbemCimtypeEnum wbemCimtypeReference = 102;
  static const WbemCimtypeEnum wbemCimtypeChar16 = 103;
  static const WbemCimtypeEnum wbemCimtypeObject = 13;
  typedef UINT WbemImpersonationLevelEnum; //Alias
  static const WbemImpersonationLevelEnum wbemImpersonationLevelAnonymous = 1;
  static const WbemImpersonationLevelEnum wbemImpersonationLevelIdentify = 2;
  static const WbemImpersonationLevelEnum wbemImpersonationLevelImpersonate = 3;
  static const WbemImpersonationLevelEnum wbemImpersonationLevelDelegate = 4;
  typedef UINT WbemAuthenticationLevelEnum; //Alias
  static const WbemAuthenticationLevelEnum wbemAuthenticationLevelDefault = 0;
  static const WbemAuthenticationLevelEnum wbemAuthenticationLevelNone = 1;
  static const WbemAuthenticationLevelEnum wbemAuthenticationLevelConnect = 2;
  static const WbemAuthenticationLevelEnum wbemAuthenticationLevelCall = 3;
  static const WbemAuthenticationLevelEnum wbemAuthenticationLevelPkt = 4;
  static const WbemAuthenticationLevelEnum wbemAuthenticationLevelPktIntegrity = 5;
  static const WbemAuthenticationLevelEnum wbemAuthenticationLevelPktPrivacy = 6;
  typedef UINT CIMTYPE; //Alias
  typedef ULONG WBEM_COMPILER_OPTIONS; //Alias
  typedef ULONG WBEM_CHANGE_FLAG_TYPE; //Alias
  typedef ULONG WbemConnectOptionsEnum; //Alias
  typedef ULONG WBEM_CONNECT_OPTIONS; //Alias
]]

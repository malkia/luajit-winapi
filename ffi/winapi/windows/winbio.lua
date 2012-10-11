require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/registry' )
require( 'ffi/winapi/headers/events' )
require( 'ffi/winapi/headers/services' )
require( 'ffi/winapi/headers/cryptography' )
require( 'ffi/winapi/headers/security' )
require( 'ffi/winapi/headers/native' )
require( 'ffi/winapi/headers/network' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef ULONG WINBIO_SESSION_HANDLE; //Alias
  typedef ULONG WINBIO_UNIT_ID; //Alias
  typedef LPVOID PWINBIO_ENROLL_CAPTURE_CALLBACK; //Alias
  typedef LPVOID PWINBIO_IDENTIFY_CALLBACK; //Alias
  typedef LPVOID PWINBIO_LOCATE_SENSOR_CALLBACK; //Alias
  typedef LPVOID PWINBIO_EVENT_CALLBACK; //Alias
  typedef LPVOID PWINBIO_CAPTURE_CALLBACK; //Alias
  typedef LPVOID PWINBIO_VERIFY_CALLBACK; //Alias
  typedef UUID WINBIO_UUID; //Alias
  typedef ULONG WINBIO_BIOMETRIC_SENSOR_SUBTYPE; //Alias
  enum { SECURITY_MAX_SID_SIZE = 68 };
  typedef ULONG WINBIO_BIOMETRIC_TYPE; //Alias
  typedef ULONG WINBIO_POOL_TYPE; //Alias
  static const WINBIO_POOL_TYPE WINBIO_POOL_UNKNOWN = 0;
  static const WINBIO_POOL_TYPE WINBIO_POOL_SYSTEM = 1;
  static const WINBIO_POOL_TYPE WINBIO_POOL_PRIVATE = 2;
  static const WINBIO_POOL_TYPE WINBIO_POOL_UNASSIGNED = 3;
  typedef struct WINBIO_VERSION {
    DWORD MajorVersion;
    DWORD MinorVersion;
  } WINBIO_VERSION;
  typedef UINT WINBIO_IDENTITY_TYPE; //Alias
  static const WINBIO_IDENTITY_TYPE WINBIO_ID_TYPE_NULL = 0;
  static const WINBIO_IDENTITY_TYPE WINBIO_ID_TYPE_WILDCARD = 1;
  static const WINBIO_IDENTITY_TYPE WINBIO_ID_TYPE_GUID = 2;
  static const WINBIO_IDENTITY_TYPE WINBIO_ID_TYPE_SID = 3;
  typedef struct WINAPI_WINBIO_IDENTITY_u_s {
    ULONG Size;
    UCHAR Data[SECURITY_MAX_SID_SIZE];
  } WINAPI_WINBIO_IDENTITY_u_s;
  typedef union WINAPI_WINBIO_IDENTITY_u {
    ULONG Null;
    ULONG Wildcard;
    GUID TemplateGuid;
    WINAPI_WINBIO_IDENTITY_u_s AccountSid;
  } WINAPI_WINBIO_IDENTITY_u;
  typedef struct WINBIO_IDENTITY {
    WINBIO_IDENTITY_TYPE Type;
    WINAPI_WINBIO_IDENTITY_u Value;
  } WINBIO_IDENTITY;
  typedef ULONG WINBIO_CAPABILITIES; //Alias
  typedef struct WINBIO_UNIT_SCHEMA {
    WINBIO_UNIT_ID UnitId;
    WINBIO_POOL_TYPE PoolType;
    WINBIO_BIOMETRIC_TYPE BiometricFactor;
    WINBIO_BIOMETRIC_SENSOR_SUBTYPE SensorSubType;
    WINBIO_CAPABILITIES Capabilities;
    WINBIO_STRING DeviceInstanceId;
    WINBIO_STRING Description;
    WINBIO_STRING Manufacturer;
    WINBIO_STRING Model;
    WINBIO_STRING SerialNumber;
    WINBIO_VERSION FirmwareVersion;
  } WINBIO_UNIT_SCHEMA;
  typedef ULONG WINAPI_WINBIO_DATABASE_ATTRIBUTES; //Alias
  typedef struct WINBIO_STORAGE_SCHEMA {
    WINBIO_BIOMETRIC_TYPE BiometricFactor;
    WINBIO_UUID DatabaseId;
    WINBIO_UUID DataFormat;
    WINAPI_WINBIO_DATABASE_ATTRIBUTES Attributes;
    WINBIO_STRING FilePath;
    WINBIO_STRING ConnectionString;
  } WINBIO_STORAGE_SCHEMA;
  typedef struct WINBIO_BSP_SCHEMA {
    WINBIO_BIOMETRIC_TYPE BiometricFactor;
    WINBIO_UUID BspId;
    WINBIO_STRING Description;
    WINBIO_STRING Vendor;
    WINBIO_VERSION Version;
  } WINBIO_BSP_SCHEMA;
  typedef struct WINBIO_BIR_DATA {
    ULONG Size;
    ULONG Offset;
  } WINBIO_BIR_DATA;
  typedef struct WINBIO_BIR {
    WINBIO_BIR_DATA HeaderBlock;
    WINBIO_BIR_DATA StandardDataBlock;
    WINBIO_BIR_DATA VendorDataBlock;
    WINBIO_BIR_DATA SignatureBlock;
  } WINBIO_BIR;
  typedef WINBIO_BIR *PWINBIO_BIR; //Pointer
  typedef ULONG WINBIO_PROPERTY_TYPE; //Alias
  static const WINBIO_PROPERTY_TYPE WINBIO_PROPERTY_TYPE_SESSION = 1;
  static const WINBIO_PROPERTY_TYPE WINBIO_PROPERTY_TYPE_UNIT = 2;
  static const WINBIO_PROPERTY_TYPE WINBIO_PROPERTY_TYPE_TEMPLATE = 3;
  typedef UINT WINBIO_CREDENTIAL_FORMAT; //Alias
  static const WINBIO_CREDENTIAL_FORMAT WINBIO_PASSWORD_GENERIC = 0x00000001;
  static const WINBIO_CREDENTIAL_FORMAT WINBIO_PASSWORD_PACKED = 0x00000002;
  typedef ULONG WINBIO_COMPONENT; //Alias
  static const WINBIO_COMPONENT WINBIO_COMPONENT_SENSOR = 1;
  static const WINBIO_COMPONENT WINBIO_COMPONENT_ENGINE = 2;
  static const WINBIO_COMPONENT WINBIO_COMPONENT_STORAGE = 3;
  typedef UCHAR WINBIO_BIR_PURPOSE; //Alias
  typedef UCHAR WINBIO_BIR_DATA_FLAGS; //Alias
  typedef UCHAR WINBIO_BIOMETRIC_SUBTYPE; //Alias
  static const WINBIO_BIOMETRIC_SUBTYPE WINBIO_SUBTYPE_NO_INFORMATION = 0x00;
  static const WINBIO_BIOMETRIC_SUBTYPE WINBIO_SUBTYPE_ANY = 0xFF;
  typedef ULONG WINBIO_REJECT_DETAIL; //Alias
  static const WINBIO_REJECT_DETAIL WINBIO_FP_TOO_HIGH = 1;
  static const WINBIO_REJECT_DETAIL WINBIO_FP_TOO_LOW = 2;
  static const WINBIO_REJECT_DETAIL WINBIO_FP_TOO_LEFT = 3;
  static const WINBIO_REJECT_DETAIL WINBIO_FP_TOO_RIGHT = 4;
  static const WINBIO_REJECT_DETAIL WINBIO_FP_TOO_FAST = 5;
  static const WINBIO_REJECT_DETAIL WINBIO_FP_TOO_SLOW = 6;
  static const WINBIO_REJECT_DETAIL WINBIO_FP_POOR_QUALITY = 7;
  static const WINBIO_REJECT_DETAIL WINBIO_FP_TOO_SKEWED = 8;
  static const WINBIO_REJECT_DETAIL WINBIO_FP_TOO_SHORT = 9;
  static const WINBIO_REJECT_DETAIL WINBIO_FP_MERGE_FAILURE = 10;
  typedef ULONG WINBIO_EVENT_TYPE; //Alias
  static const WINBIO_EVENT_TYPE WINBIO_EVENT_ERROR = 0xFFFFFFFF;
  static const WINBIO_EVENT_TYPE WINBIO_EVENT_FP_UNCLAIMED = 0x00000001;
  static const WINBIO_EVENT_TYPE WINBIO_EVENT_FP_UNCLAIMED_IDENTIFY = 0x00000002;
  typedef ULONG WINBIO_SESSION_FLAGS; //Alias
  typedef UINT WINBIO_CREDENTIAL_TYPE; //Alias
  typedef ULONG WINBIO_SETTING_SOURCE_TYPE; //Alias
  static const WINBIO_SETTING_SOURCE_TYPE WINBIO_SETTING_SOURCE_INVALID = 0;
  static const WINBIO_SETTING_SOURCE_TYPE WINBIO_SETTING_SOURCE_DEFAULT = 1;
  static const WINBIO_SETTING_SOURCE_TYPE WINBIO_SETTING_SOURCE_POLICY = 2;
  static const WINBIO_SETTING_SOURCE_TYPE WINBIO_SETTING_SOURCE_LOCAL = 3;
  typedef WINBIO_SETTING_SOURCE_TYPE *PWINBIO_SETTING_SOURCE_TYPE; //Pointer
  typedef ULONG WINBIO_PROPERTY_ID; //Alias
  static const WINBIO_PROPERTY_ID WINBIO_PROPERTY_SAMPLE_HINT = 1;
  typedef UINT WINBIO_CREDENTIAL_STATE; //Alias
  static const WINBIO_CREDENTIAL_STATE WINBIO_CREDENTIAL_NOT_SET = 0x00000001;
  static const WINBIO_CREDENTIAL_STATE WINBIO_CREDENTIAL_SET = 0x00000002;
  HRESULT WinBioAcquireFocus(               );
  HRESULT WinBioCancel(                     WINBIO_SESSION_HANDLE SessionHandle);
  HRESULT WinBioCaptureSample(              WINBIO_SESSION_HANDLE SessionHandle, WINBIO_BIR_PURPOSE Purpose, WINBIO_BIR_DATA_FLAGS Flags, WINBIO_UNIT_ID* UnitId, PWINBIO_BIR* Sample, SIZE_T* SampleSize, WINBIO_REJECT_DETAIL* RejectDetail);
  HRESULT WinBioCaptureSampleWithCallback(  WINBIO_SESSION_HANDLE SessionHandle, WINBIO_BIR_PURPOSE Purpose, WINBIO_BIR_DATA_FLAGS Flags, PWINBIO_CAPTURE_CALLBACK CaptureCallback, PVOID CaptureCallbackContext);
  HRESULT WinBioCloseSession(               WINBIO_SESSION_HANDLE SessionHandle);
  HRESULT WinBioControlUnit(                WINBIO_SESSION_HANDLE SessionHandle, WINBIO_UNIT_ID UnitId, WINBIO_COMPONENT Component, ULONG ControlCode, PUCHAR SendBuffer, SIZE_T SendBufferSize, PUCHAR ReceiveBuffer, SIZE_T ReceiveBufferSize, SIZE_T* ReceiveDataSize, ULONG* OperationStatus);
  HRESULT WinBioControlUnitPrivileged(      WINBIO_SESSION_HANDLE SessionHandle, WINBIO_UNIT_ID UnitId, WINBIO_COMPONENT Component, ULONG ControlCode, PUCHAR SendBuffer, SIZE_T SendBufferSize, PUCHAR ReceiveBuffer, SIZE_T ReceiveBufferSize, SIZE_T* ReceiveDataSize, ULONG* OperationStatus);
  HRESULT WinBioDeleteTemplate(             WINBIO_SESSION_HANDLE SessionHandle, WINBIO_UNIT_ID UnitId, WINBIO_IDENTITY* Identity, WINBIO_BIOMETRIC_SUBTYPE SubFactor);
  HRESULT WinBioEnrollBegin(                WINBIO_SESSION_HANDLE SessionHandle, WINBIO_BIOMETRIC_SUBTYPE SubFactor, WINBIO_UNIT_ID UnitId);
  HRESULT WinBioEnrollCapture(              WINBIO_SESSION_HANDLE SessionHandle, WINBIO_REJECT_DETAIL* RejectDetail);
  HRESULT WinBioEnrollCaptureWithCallback(  WINBIO_SESSION_HANDLE SessionHandle, PWINBIO_ENROLL_CAPTURE_CALLBACK EnrollCallback, PVOID EnrollCallbackContext);
  HRESULT WinBioEnrollCommit(               WINBIO_SESSION_HANDLE SessionHandle, WINBIO_IDENTITY* Identity, BOOLEAN* IsNewTemplate);
  HRESULT WinBioEnrollDiscard(              WINBIO_SESSION_HANDLE SessionHandle);
  HRESULT WinBioEnumBiometricUnits(         WINBIO_BIOMETRIC_TYPE Factor, WINBIO_UNIT_SCHEMA** UnitSchemaArray, SIZE_T* UnitCount);
  HRESULT WinBioEnumDatabases(              WINBIO_BIOMETRIC_TYPE Factor, WINBIO_STORAGE_SCHEMA** StorageSchemaArray, SIZE_T* StorageCount);
  HRESULT WinBioEnumEnrollments(            WINBIO_SESSION_HANDLE SessionHandle, WINBIO_UNIT_ID UnitId, WINBIO_IDENTITY* Identity, WINBIO_BIOMETRIC_SUBTYPE** SubFactorArray, SIZE_T* SubFactorCount);
  HRESULT WinBioEnumServiceProviders(       WINBIO_BIOMETRIC_TYPE Factor, WINBIO_BSP_SCHEMA** BspSchemaArray, SIZE_T* BspCount);
  HRESULT WinBioFree(                       PVOID Address);
  HRESULT WinBioGetCredentialState(         WINBIO_IDENTITY Identity, WINBIO_CREDENTIAL_TYPE Type, WINBIO_CREDENTIAL_STATE* CredentialState);
  HRESULT WinBioGetDomainLogonSetting(      BOOLEAN* Value, PWINBIO_SETTING_SOURCE_TYPE Source);
  HRESULT WinBioGetProperty(                WINBIO_SESSION_HANDLE SessionHandle, WINBIO_PROPERTY_TYPE PropertyType, WINBIO_PROPERTY_ID PropertyId, WINBIO_UNIT_ID UnitId, WINBIO_IDENTITY* Identity, WINBIO_BIOMETRIC_SUBTYPE SubFactor, PVOID* PropertyBuffer, SIZE_T* PropertyBufferSize);
  HRESULT WinBioIdentify(                   WINBIO_SESSION_HANDLE SessionHandle, WINBIO_UNIT_ID* UnitId, WINBIO_IDENTITY* Identity, WINBIO_BIOMETRIC_SUBTYPE* SubFactor, WINBIO_REJECT_DETAIL* RejectDetail);
  HRESULT WinBioIdentifyWithCallback(       WINBIO_SESSION_HANDLE SessionHandle, PWINBIO_IDENTIFY_CALLBACK IdentifyCallback, PVOID IdentifyCallbackContext);
  HRESULT WinBioLocateSensor(               WINBIO_SESSION_HANDLE SessionHandle, WINBIO_UNIT_ID* UnitId);
  HRESULT WinBioLocateSensorWithCallback(   WINBIO_SESSION_HANDLE SessionHandle, PWINBIO_LOCATE_SENSOR_CALLBACK LocateCallback, PVOID LocateCallbackContext);
  HRESULT WinBioLockUnit(                   WINBIO_SESSION_HANDLE SessionHandle, WINBIO_UNIT_ID UnitId);
  HRESULT WinBioLogonIdentifiedUser(        WINBIO_SESSION_HANDLE SessionHandle);
  HRESULT WinBioOpenSession(                WINBIO_BIOMETRIC_TYPE Factor, WINBIO_POOL_TYPE PoolType, WINBIO_SESSION_FLAGS Flags, WINBIO_UNIT_ID* UnitArray, SIZE_T UnitCount, GUID* DatabaseId, WINBIO_SESSION_HANDLE* SessionHandle);
  HRESULT WinBioReleaseFocus(               );
  HRESULT WinBioRegisterEventMonitor(       WINBIO_SESSION_HANDLE SessionHandle, WINBIO_EVENT_TYPE EventMask, PWINBIO_EVENT_CALLBACK EventCallback, PVOID EventCallbackContext);
  HRESULT WinBioRemoveAllCredentials(       );
  HRESULT WinBioRemoveAllDomainCredentials( );
  HRESULT WinBioRemoveCredential(           WINBIO_IDENTITY Identity, WINBIO_CREDENTIAL_TYPE Type);
  HRESULT WinBioSetCredential(              WINBIO_CREDENTIAL_TYPE Type, PUCHAR Credential, SIZE_T CredentialSize, WINBIO_CREDENTIAL_FORMAT Format);
  HRESULT WinBioUnlockUnit(                 WINBIO_SESSION_HANDLE SessionHandle, WINBIO_UNIT_ID UnitId);
  HRESULT WinBioUnregisterEventMonitor(     WINBIO_SESSION_HANDLE SessionHandle);
  HRESULT WinBioVerify(                     WINBIO_SESSION_HANDLE SessionHandle, WINBIO_IDENTITY* Identity, WINBIO_BIOMETRIC_SUBTYPE SubFactor, WINBIO_UNIT_ID* UnitId, BOOLEAN* Match, WINBIO_REJECT_DETAIL* RejectDetail);
  HRESULT WinBioVerifyWithCallback(         WINBIO_SESSION_HANDLE SessionHandle, WINBIO_IDENTITY* Identity, WINBIO_BIOMETRIC_SUBTYPE SubFactor, PWINBIO_VERIFY_CALLBACK VerifyCallback, PVOID VerifyCallbackContext);
  HRESULT WinBioWait(                       WINBIO_SESSION_HANDLE SessionHandle);
]]
return ffi.load( 'Winbio.dll' )

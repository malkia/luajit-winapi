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

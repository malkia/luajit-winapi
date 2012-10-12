require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/power' )
require( 'ffi/winapi/headers/registry' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PWRSCHEMESENUMPROC; //Alias
  typedef DWORD WINAPI_POWER_ACTION; //Alias
  typedef DWORD WINAPI_POWER_LEVEL; //Alias
  typedef struct POWER_ACTION_POLICY {
    POWER_ACTION Action;
    WINAPI_POWER_ACTION Flags;
    WINAPI_POWER_LEVEL EventCode;
  } POWER_ACTION_POLICY;
  typedef struct USER_POWER_POLICY {
    ULONG Revision;
    POWER_ACTION_POLICY IdleAc;
    POWER_ACTION_POLICY IdleDc;
    ULONG IdleTimeoutAc;
    ULONG IdleTimeoutDc;
    UCHAR IdleSensitivityAc;
    UCHAR IdleSensitivityDc;
    UCHAR ThrottlePolicyAc;
    UCHAR ThrottlePolicyDc;
    SYSTEM_POWER_STATE MaxSleepAc;
    SYSTEM_POWER_STATE MaxSleepDc;
    ULONG Reserved[2];
    ULONG VideoTimeoutAc;
    ULONG VideoTimeoutDc;
    ULONG SpindownTimeoutAc;
    ULONG SpindownTimeoutDc;
    BOOLEAN OptimizeForPowerAc;
    BOOLEAN OptimizeForPowerDc;
    UCHAR FanThrottleToleranceAc;
    UCHAR FanThrottleToleranceDc;
    UCHAR ForcedThrottleAc;
    UCHAR ForcedThrottleDc;
  } USER_POWER_POLICY;
  typedef struct MACHINE_POWER_POLICY {
    ULONG Revision;
    SYSTEM_POWER_STATE MinSleepAc;
    SYSTEM_POWER_STATE MinSleepDc;
    SYSTEM_POWER_STATE ReducedLatencySleepAc;
    SYSTEM_POWER_STATE ReducedLatencySleepDc;
    ULONG DozeTimeoutAc;
    ULONG DozeTimeoutDc;
    ULONG DozeS4TimeoutAc;
    ULONG DozeS4TimeoutDc;
    UCHAR MinThrottleAc;
    UCHAR MinThrottleDc;
    UCHAR pad1[2];
    POWER_ACTION_POLICY OverThrottledAc;
    POWER_ACTION_POLICY OverThrottledDc;
  } MACHINE_POWER_POLICY;
  typedef struct POWER_POLICY {
    USER_POWER_POLICY user;
    MACHINE_POWER_POLICY mach;
  } POWER_POLICY;
  typedef POWER_POLICY *PPOWER_POLICY; //Pointer
  typedef struct SYSTEM_POWER_LEVEL {
    BOOLEAN Enable;
    BYTE Spare[3];
    DWORD BatteryLevel;
    POWER_ACTION_POLICY PowerPolicy;
    SYSTEM_POWER_STATE MinSystemState;
  } SYSTEM_POWER_LEVEL;
  enum { NUM_DISCHARGE_POLICIES = 4 };
  typedef struct GLOBAL_USER_POWER_POLICY {
    ULONG Revision;
    POWER_ACTION_POLICY PowerButtonAc;
    POWER_ACTION_POLICY PowerButtonDc;
    POWER_ACTION_POLICY SleepButtonAc;
    POWER_ACTION_POLICY SleepButtonDc;
    POWER_ACTION_POLICY LidCloseAc;
    POWER_ACTION_POLICY LidCloseDc;
    SYSTEM_POWER_LEVEL DischargePolicy[NUM_DISCHARGE_POLICIES];
    ULONG GlobalFlags;
  } GLOBAL_USER_POWER_POLICY;
  typedef struct GLOBAL_MACHINE_POWER_POLICY {
    ULONG Revision;
    SYSTEM_POWER_STATE LidOpenWakeAc;
    SYSTEM_POWER_STATE LidOpenWakeDc;
    ULONG BroadcastCapacityResolution;
  } GLOBAL_MACHINE_POWER_POLICY;
  typedef struct GLOBAL_POWER_POLICY {
    GLOBAL_USER_POWER_POLICY user;
    GLOBAL_MACHINE_POWER_POLICY mach;
  } GLOBAL_POWER_POLICY;
  typedef GLOBAL_POWER_POLICY *PGLOBAL_POWER_POLICY; //Pointer
  typedef struct PROCESSOR_POWER_POLICY_INFO {
    DWORD TimeCheck;
    DWORD DemoteLimit;
    DWORD PromoteLimit;
    BYTE DemotePercent;
    BYTE PromotePercent;
    BYTE Spare[2];
    DWORD Reserved;
  } PROCESSOR_POWER_POLICY_INFO;
  typedef struct PROCESSOR_POWER_POLICY {
    DWORD Revision;
    BYTE DynamicThrottle;
    BYTE Spare[3];
    DWORD Reserved;
    DWORD PolicyCount;
    PROCESSOR_POWER_POLICY_INFO Policy[3];
  } PROCESSOR_POWER_POLICY;
  typedef struct MACHINE_PROCESSOR_POWER_POLICY {
    ULONG Revision;
    PROCESSOR_POWER_POLICY ProcessorPolicyAc;
    PROCESSOR_POWER_POLICY ProcessorPolicyDc;
  } MACHINE_PROCESSOR_POWER_POLICY;
  typedef MACHINE_PROCESSOR_POWER_POLICY *PMACHINE_PROCESSOR_POWER_POLICY; //Pointer
  typedef struct BATTERY_REPORTING_SCALE {
    DWORD Granularity;
    DWORD Capacity;
  } BATTERY_REPORTING_SCALE;
  typedef struct SYSTEM_POWER_CAPABILITIES {
    BOOLEAN PowerButtonPresent;
    BOOLEAN SleepButtonPresent;
    BOOLEAN LidPresent;
    BOOLEAN SystemS1;
    BOOLEAN SystemS2;
    BOOLEAN SystemS3;
    BOOLEAN SystemS4;
    BOOLEAN SystemS5;
    BOOLEAN HiberFilePresent;
    BOOLEAN FullWake;
    BOOLEAN VideoDimPresent;
    BOOLEAN ApmPresent;
    BOOLEAN UpsPresent;
    BOOLEAN ThermalControl;
    BOOLEAN ProcessorThrottle;
    BYTE ProcessorMinThrottle;
    BYTE ProcessorMaxThrottle;
    BOOLEAN FastSystemS4;
    BYTE spare2[3];
    BOOLEAN DiskSpinDown;
    BYTE spare3[8];
    BOOLEAN SystemBatteriesPresent;
    BOOLEAN BatteriesAreShortTerm;
    BATTERY_REPORTING_SCALE BatteryScale[3];
    SYSTEM_POWER_STATE AcOnLineWake;
    SYSTEM_POWER_STATE SoftLidWake;
    SYSTEM_POWER_STATE RtcWake;
    SYSTEM_POWER_STATE MinDeviceWakeState;
    SYSTEM_POWER_STATE DefaultLowLatencyWake;
  } SYSTEM_POWER_CAPABILITIES;
  typedef SYSTEM_POWER_CAPABILITIES *PSYSTEM_POWER_CAPABILITIES; //Pointer
  typedef UINT POWER_PLATFORM_ROLE; //Alias
  static const POWER_PLATFORM_ROLE PlatformRoleUnspecified = 0;
  static const POWER_PLATFORM_ROLE PlatformRoleDesktop = 1;
  static const POWER_PLATFORM_ROLE PlatformRoleMobile = 2;
  static const POWER_PLATFORM_ROLE PlatformRoleWorkstation = 3;
  static const POWER_PLATFORM_ROLE PlatformRoleEnterpriseServer = 4;
  static const POWER_PLATFORM_ROLE PlatformRoleSOHOServer = 5;
  static const POWER_PLATFORM_ROLE PlatformRoleAppliancePC = 6;
  static const POWER_PLATFORM_ROLE PlatformRolePerformanceServer = 7;
  static const POWER_PLATFORM_ROLE PlatformRoleMaximum = 8;
  NTSTATUS            CallNtPowerInformation(                      POWER_INFORMATION_LEVEL InformationLevel, PVOID lpInputBuffer, ULONG nInputBufferSize, PVOID lpOutputBuffer, ULONG nOutputBufferSize);
  BOOLEAN             DevicePowerClose(                            );
  BOOLEAN             DevicePowerEnumDevices(                      ULONG QueryIndex, ULONG QueryInterpretationFlags, ULONG QueryFlags, PBYTE pReturnBuffer, PULONG pBufferSize);
  BOOLEAN             DevicePowerOpen(                             ULONG Flags);
  DWORD               DevicePowerSetDeviceState(                   LPCWSTR DeviceDescription, ULONG SetFlags, PCVOID SetData);
  BOOLEAN             GetCurrentPowerPolicies(                     PGLOBAL_POWER_POLICY pGlobalPowerPolicy, PPOWER_POLICY pPowerPolicy);
  DWORD               PowerCanRestoreIndividualDefaultPowerScheme( const GUID* SchemeGuid);
  DWORD               PowerCreatePossibleSetting(                  HKEY RootSystemPowerKey, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, ULONG PossibleSettingIndex);
  DWORD               PowerCreateSetting(                          HKEY RootSystemPowerKey, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid);
  DWORD               PowerDeleteScheme(                           HKEY RootPowerKey, const GUID* SchemeGuid);
  POWER_PLATFORM_ROLE PowerDeterminePlatformRole(                  );
  DWORD               PowerDuplicateScheme(                        HKEY RootPowerKey, const GUID* SourceSchemeGuid, GUID** DestinationSchemeGuid);
  DWORD               PowerEnumerate(                              HKEY RootPowerKey, const GUID* SchemeGuid, const GUID* SubGroupOfPowerSettingsGuid, POWER_DATA_ACCESSOR AccessFlags, ULONG Index, UCHAR* Buffer, DWORD* BufferSize);
  DWORD               PowerImportPowerScheme(                      HKEY RootPowerKey, LPCWSTR ImportFileNamePath, GUID** DestinationSchemeGuid);
  DWORD               PowerReadACDefaultIndex(                     HKEY RootPowerKey, const GUID* SchemePersonalityGuid, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, LPDWORD AcDefaultIndex);
  DWORD               PowerReadACValue(                            HKEY RootPowerKey, const GUID* SchemeGuid, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, WINAPI_RegType_PULONG Type, LPBYTE Buffer, LPDWORD BufferSize);
  DWORD               PowerReadACValueIndex(                       HKEY RootPowerKey, const GUID* SchemeGuid, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, LPDWORD AcValueIndex);
  DWORD               PowerReadDCDefaultIndex(                     HKEY RootPowerKey, const GUID* SchemePersonalityGuid, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, LPDWORD DcDefaultIndex);
  DWORD               PowerReadDCValue(                            HKEY RootPowerKey, const GUID* SchemeGuid, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, WINAPI_RegType_PULONG Type, PUCHAR Buffer, LPDWORD BufferSize);
  DWORD               PowerReadDCValueIndex(                       HKEY RootPowerKey, const GUID* SchemeGuid, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, LPDWORD DcValueIndex);
  DWORD               PowerReadDescription(                        HKEY RootPowerKey, const GUID* SchemeGuid, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, LPWSTR Buffer, LPDWORD BufferSize);
  DWORD               PowerReadFriendlyName(                       HKEY RootPowerKey, const GUID* SchemeGuid, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, LPWSTR Buffer, LPDWORD BufferSize);
  DWORD               PowerReadIconResourceSpecifier(              HKEY RootPowerKey, const GUID* SchemeGuid, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, PUCHAR Buffer, LPDWORD BufferSize);
  DWORD               PowerReadPossibleDescription(                HKEY RootPowerKey, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, ULONG PossibleSettingIndex, PUCHAR Buffer, LPDWORD BufferSize);
  DWORD               PowerReadPossibleFriendlyName(               HKEY RootPowerKey, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, ULONG PossibleSettingIndex, PUCHAR Buffer, LPDWORD BufferSize);
  DWORD               PowerReadPossibleValue(                      HKEY RootPowerKey, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, WINAPI_RegType_PULONG Type, ULONG PossibleSettingIndex, PUCHAR Buffer, LPDWORD BufferSize);
  DWORD               PowerReadSettingAttributes(                  const GUID* SubGroupGuid, const GUID* PowerSettingGuid);
  DWORD               PowerReadValueIncrement(                     HKEY RootPowerKey, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, LPDWORD ValueIncrement);
  DWORD               PowerReadValueMax(                           HKEY RootPowerKey, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, LPDWORD ValueMaximum);
  DWORD               PowerReadValueMin(                           HKEY RootPowerKey, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, LPDWORD ValueMinimum);
  DWORD               PowerReadValueUnitsSpecifier(                HKEY RootPowerKey, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, LPWSTR Buffer, LPDWORD BufferSize);
  DWORD               PowerRemovePowerSetting(                     const GUID* PowerSettingSubKeyGuid, const GUID* PowerSettingGuid);
  DWORD               PowerReplaceDefaultPowerSchemes(             );
  DWORD               PowerRestoreDefaultPowerSchemes(             );
  DWORD               PowerRestoreIndividualDefaultPowerScheme(    const GUID* SchemeGuid);
  DWORD               PowerSetActiveScheme(                        HKEY UserRootPowerKey, const GUID* SchemeGuid);
  DWORD               PowerSettingAccessCheck(                     POWER_DATA_ACCESSOR AccessFlags, const GUID* PowerGuid);
  DWORD               PowerWriteACDefaultIndex(                    HKEY RootSystemPowerKey, const GUID* SchemePersonalityGuid, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, DWORD DefaultAcIndex);
  DWORD               PowerWriteACValueIndex(                      HKEY RootPowerKey, const GUID* SchemeGuid, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, DWORD AcValueIndex);
  DWORD               PowerWriteDCDefaultIndex(                    HKEY RootSystemPowerKey, const GUID* SchemePersonalityGuid, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, DWORD DefaultDcIndex);
  DWORD               PowerWriteDCValueIndex(                      HKEY RootPowerKey, const GUID* SchemeGuid, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, DWORD DcValueIndex);
  DWORD               PowerWriteDescription(                       HKEY RootPowerKey, const GUID* SchemeGuid, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, UCHAR* Buffer, DWORD BufferSize);
  DWORD               PowerWriteFriendlyName(                      HKEY RootPowerKey, const GUID* SchemeGuid, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, UCHAR* Buffer, DWORD BufferSize);
  DWORD               PowerWriteIconResourceSpecifier(             HKEY RootPowerKey, const GUID* SchemeGuid, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, UCHAR* Buffer, DWORD BufferSize);
  DWORD               PowerWritePossibleDescription(               HKEY RootPowerKey, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, ULONG PossibleSettingIndex, UCHAR* Buffer, DWORD BufferSize);
  DWORD               PowerWritePossibleFriendlyName(              HKEY RootPowerKey, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, ULONG PossibleSettingIndex, UCHAR* Buffer, DWORD BufferSize);
  DWORD               PowerWritePossibleValue(                     HKEY RootPowerKey, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, ULONG Type, ULONG PossibleSettingIndex, UCHAR* Buffer, DWORD BufferSize);
  DWORD               PowerWriteSettingAttributes(                 const GUID* SubGroupGuid, const GUID* PowerSettingGuid, DWORD Attributes);
  DWORD               PowerWriteValueIncrement(                    HKEY RootPowerKey, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, DWORD ValueIncrement);
  DWORD               PowerWriteValueMax(                          HKEY RootPowerKey, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, DWORD ValueMaximum);
  DWORD               PowerWriteValueMin(                          HKEY RootPowerKey, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, DWORD ValueMinimum);
  DWORD               PowerWriteValueUnitsSpecifier(               HKEY RootPowerKey, const GUID* SubGroupOfPowerSettingsGuid, const GUID* PowerSettingGuid, UCHAR* Buffer, DWORD BufferSize);
  BOOLEAN             CanUserWritePwrScheme(                       );
  BOOLEAN             DeletePwrScheme(                             UINT uiIndex);
  BOOLEAN             EnumPwrSchemes(                              PWRSCHEMESENUMPROC lpfnPwrSchemesEnumProc, LPARAM lParam);
  BOOLEAN             GetActivePwrScheme(                          PUINT puiID);
  DWORD               PowerGetActiveScheme(                        HKEY UserRootPowerKey, GUID** ActivePolicyGuid);
  BOOLEAN             GetPwrDiskSpindownRange(                     PUINT RangeMax, PUINT RangeMin);
  BOOLEAN             IsPwrHibernateAllowed(                       );
  BOOLEAN             GetPwrCapabilities(                          PSYSTEM_POWER_CAPABILITIES lpSystemPowerCapabilities);
  BOOLEAN             IsPwrShutdownAllowed(                        );
  BOOLEAN             IsPwrSuspendAllowed(                         );
  BOOLEAN             ReadGlobalPwrPolicy(                         PGLOBAL_POWER_POLICY pGlobalPowerPolicy);
  BOOLEAN             ReadProcessorPwrScheme(                      UINT uiID, PMACHINE_PROCESSOR_POWER_POLICY pMachineProcessorPowerPolicy);
  BOOLEAN             ReadPwrScheme(                               UINT uiID, PPOWER_POLICY pPowerPolicy);
  BOOLEAN             SetActivePwrScheme(                          UINT uiID, PGLOBAL_POWER_POLICY lpGlobalPowerPolicy, PPOWER_POLICY lpPowerPolicy);
  BOOLEAN             SetSuspendState(                             BOOLEAN Hibernate, BOOLEAN ForceCritical, BOOLEAN DisableWakeEvent);
  BOOLEAN             WriteGlobalPwrPolicy(                        PGLOBAL_POWER_POLICY pGlobalPowerPolicy);
  BOOLEAN             WriteProcessorPwrScheme(                     UINT ID, PMACHINE_PROCESSOR_POWER_POLICY pMachineProcessorPowerPolicy);
  BOOLEAN             WritePwrScheme(                              PUINT puiID, LPWSTR lpszName, LPWSTR lpszDescription, PPOWER_POLICY pPowerPolicy);
]]
return ffi.load( 'PowrProf.dll' )

require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/power" )
require( "ffi/winapi/headers/registry" )
local ffi = require( "ffi" )
ffi.cdef [[
  NTSTATUS            CallNtPowerInformation(                      POWER_INFORMATION_LEVEL InformationLevel, PVOID lpInputBuffer, ULONG nInputBufferSize, PVOID lpOutputBuffer, ULONG nOutputBufferSize);
  BOOLEAN             DevicePowerClose(                            );
  BOOLEAN             DevicePowerEnumDevices(                      ULONG QueryIndex, ULONG QueryInterpretationFlags, ULONG QueryFlags, PBYTE pReturnBuffer, PULONG pBufferSize);
  BOOLEAN             DevicePowerOpen(                             ULONG Flags);
  DWORD               DevicePowerSetDeviceState(                   LPCWSTR DeviceDescription, ULONG SetFlags, PCVOID SetData);
  BOOLEAN             GetCurrentPowerPolicies(                     PGLOBAL_POWER_POLICY pGlobalPowerPolicy, PPOWER_POLICY pPowerPolicy);
  DWORD               PowerCanRestoreIndividualDefaultPowerScheme( GUID* SchemeGuid);
  DWORD               PowerCreatePossibleSetting(                  HKEY RootSystemPowerKey, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, ULONG PossibleSettingIndex);
  DWORD               PowerCreateSetting(                          HKEY RootSystemPowerKey, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid);
  DWORD               PowerDeleteScheme(                           HKEY RootPowerKey, GUID* SchemeGuid);
  POWER_PLATFORM_ROLE PowerDeterminePlatformRole(                  );
  DWORD               PowerDuplicateScheme(                        HKEY RootPowerKey, GUID* SourceSchemeGuid, GUID** DestinationSchemeGuid);
  DWORD               PowerEnumerate(                              HKEY RootPowerKey, GUID* SchemeGuid, GUID* SubGroupOfPowerSettingsGuid, POWER_DATA_ACCESSOR AccessFlags, ULONG Index, UCHAR* Buffer, DWORD* BufferSize);
  DWORD               PowerImportPowerScheme(                      HKEY RootPowerKey, LPCWSTR ImportFileNamePath, GUID** DestinationSchemeGuid);
  DWORD               PowerReadACDefaultIndex(                     HKEY RootPowerKey, GUID* SchemePersonalityGuid, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, LPDWORD AcDefaultIndex);
  DWORD               PowerReadACValue(                            HKEY RootPowerKey, GUID* SchemeGuid, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, WINAPI_RegType_PULONG Type, LPBYTE Buffer, LPDWORD BufferSize);
  DWORD               PowerReadACValueIndex(                       HKEY RootPowerKey, GUID* SchemeGuid, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, LPDWORD AcValueIndex);
  DWORD               PowerReadDCDefaultIndex(                     HKEY RootPowerKey, GUID* SchemePersonalityGuid, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, LPDWORD DcDefaultIndex);
  DWORD               PowerReadDCValue(                            HKEY RootPowerKey, GUID* SchemeGuid, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, WINAPI_RegType_PULONG Type, PUCHAR Buffer, LPDWORD BufferSize);
  DWORD               PowerReadDCValueIndex(                       HKEY RootPowerKey, GUID* SchemeGuid, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, LPDWORD DcValueIndex);
  DWORD               PowerReadDescription(                        HKEY RootPowerKey, GUID* SchemeGuid, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, LPWSTR Buffer, LPDWORD BufferSize);
  DWORD               PowerReadFriendlyName(                       HKEY RootPowerKey, GUID* SchemeGuid, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, LPWSTR Buffer, LPDWORD BufferSize);
  DWORD               PowerReadIconResourceSpecifier(              HKEY RootPowerKey, GUID* SchemeGuid, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, PUCHAR Buffer, LPDWORD BufferSize);
  DWORD               PowerReadPossibleDescription(                HKEY RootPowerKey, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, ULONG PossibleSettingIndex, PUCHAR Buffer, LPDWORD BufferSize);
  DWORD               PowerReadPossibleFriendlyName(               HKEY RootPowerKey, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, ULONG PossibleSettingIndex, PUCHAR Buffer, LPDWORD BufferSize);
  DWORD               PowerReadPossibleValue(                      HKEY RootPowerKey, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, WINAPI_RegType_PULONG Type, ULONG PossibleSettingIndex, PUCHAR Buffer, LPDWORD BufferSize);
  DWORD               PowerReadSettingAttributes(                  GUID* SubGroupGuid, GUID* PowerSettingGuid);
  DWORD               PowerReadValueIncrement(                     HKEY RootPowerKey, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, LPDWORD ValueIncrement);
  DWORD               PowerReadValueMax(                           HKEY RootPowerKey, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, LPDWORD ValueMaximum);
  DWORD               PowerReadValueMin(                           HKEY RootPowerKey, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, LPDWORD ValueMinimum);
  DWORD               PowerReadValueUnitsSpecifier(                HKEY RootPowerKey, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, LPWSTR Buffer, LPDWORD BufferSize);
  DWORD               PowerRemovePowerSetting(                     GUID* PowerSettingSubKeyGuid, GUID* PowerSettingGuid);
  DWORD               PowerReplaceDefaultPowerSchemes(             );
  DWORD               PowerRestoreDefaultPowerSchemes(             );
  DWORD               PowerRestoreIndividualDefaultPowerScheme(    GUID* SchemeGuid);
  DWORD               PowerSetActiveScheme(                        HKEY UserRootPowerKey, GUID* SchemeGuid);
  DWORD               PowerSettingAccessCheck(                     POWER_DATA_ACCESSOR AccessFlags, GUID* PowerGuid);
  DWORD               PowerWriteACDefaultIndex(                    HKEY RootSystemPowerKey, GUID* SchemePersonalityGuid, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, DWORD DefaultAcIndex);
  DWORD               PowerWriteACValueIndex(                      HKEY RootPowerKey, GUID* SchemeGuid, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, DWORD AcValueIndex);
  DWORD               PowerWriteDCDefaultIndex(                    HKEY RootSystemPowerKey, GUID* SchemePersonalityGuid, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, DWORD DefaultDcIndex);
  DWORD               PowerWriteDCValueIndex(                      HKEY RootPowerKey, GUID* SchemeGuid, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, DWORD DcValueIndex);
  DWORD               PowerWriteDescription(                       HKEY RootPowerKey, GUID* SchemeGuid, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, UCHAR* Buffer, DWORD BufferSize);
  DWORD               PowerWriteFriendlyName(                      HKEY RootPowerKey, GUID* SchemeGuid, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, UCHAR* Buffer, DWORD BufferSize);
  DWORD               PowerWriteIconResourceSpecifier(             HKEY RootPowerKey, GUID* SchemeGuid, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, UCHAR* Buffer, DWORD BufferSize);
  DWORD               PowerWritePossibleDescription(               HKEY RootPowerKey, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, ULONG PossibleSettingIndex, UCHAR* Buffer, DWORD BufferSize);
  DWORD               PowerWritePossibleFriendlyName(              HKEY RootPowerKey, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, ULONG PossibleSettingIndex, UCHAR* Buffer, DWORD BufferSize);
  DWORD               PowerWritePossibleValue(                     HKEY RootPowerKey, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, ULONG Type, ULONG PossibleSettingIndex, UCHAR* Buffer, DWORD BufferSize);
  DWORD               PowerWriteSettingAttributes(                 GUID* SubGroupGuid, GUID* PowerSettingGuid, DWORD Attributes);
  DWORD               PowerWriteValueIncrement(                    HKEY RootPowerKey, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, DWORD ValueIncrement);
  DWORD               PowerWriteValueMax(                          HKEY RootPowerKey, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, DWORD ValueMaximum);
  DWORD               PowerWriteValueMin(                          HKEY RootPowerKey, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, DWORD ValueMinimum);
  DWORD               PowerWriteValueUnitsSpecifier(               HKEY RootPowerKey, GUID* SubGroupOfPowerSettingsGuid, GUID* PowerSettingGuid, UCHAR* Buffer, DWORD BufferSize);
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
return ffi.load( "PowrProf.dll" )

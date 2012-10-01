require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  ISDSC_STATUS AddISNSServer(                       PTCHAR Address);
  ISDSC_STATUS AddIScsiConnection(                  PISCSI_UNIQUE_SESSION_ID UniqueSessionId, PVOID Reserved, ULONG InitiatorPortNumber, PISCSI_TARGET_PORTAL TargetPortal, ISCSI_SECURITY_FLAGS SecurityFlags, PISCSI_LOGIN_OPTIONS LoginOptions, ULONG KeySize, PCHAR Key, PISCSI_UNIQUE_CONNECTION_ID ConnectionId);
  ISDSC_STATUS AddIScsiSendTargetPortal(            PTCHAR InitiatorName, ULONG InitiatorPortNumber, PISCSI_LOGIN_OPTIONS LoginOptions, ISCSI_SECURITY_FLAGS SecurityFlags, PISCSI_TARGET_PORTAL Portal);
  ISDSC_STATUS AddIScsiStaticTarget(                PTCHAR TargetName, PTCHAR TargetAlias, ISCSI_TARGET_FLAGS TargetFlags, BOOLEAN Persist, PISCSI_TARGET_MAPPING Mappings, PISCSI_LOGIN_OPTIONS LoginOptions, PISCSI_TARGET_PORTAL_GROUP PortalGroup);
  ISDSC_STATUS AddPersistentIScsiDevice(            PTCHAR VolumePath);
  ISDSC_STATUS AddRadiusServer(                     PWCHAR Address);
  ISDSC_STATUS ClearPersistentIScsiDevices(         );
  ISDSC_STATUS GetDevicesForIScsiSession(           PISCSI_UNIQUE_SESSION_ID UniqueSessionId, ULONG* DeviceCount, PISCSI_DEVICE_ON_SESSION Devices);
  ISDSC_STATUS GetIScsiIKEInfo(                     PTCHAR InitiatorName, ULONG PortNumber, PULONG Reserved, PIKE_AUTHENTICATION_INFORMATION AuthInfo);
  ISDSC_STATUS GetIScsiInitiatorNodeName(           PTCHAR InitiatorNodeName);
  ISDSC_STATUS GetIScsiSessionList(                 ULONG* BufferSize, ULONG* SessionCount, PISCSI_SESSION_INFO SessionInfo);
  ISDSC_STATUS GetIScsiTargetInformation(           PTCHAR TargetName, PTCHAR DiscoveryMechanism, TARGET_INFORMATION_CLASS InfoClass, PULONG BufferSize, PVOID Buffer);
  ISDSC_STATUS GetIScsiVersionInformation(          PISCSI_VERSION_INFO VersionInfo);
  ISDSC_STATUS LoginIScsiTarget(                    PTCHAR TargetName, BOOLEAN IsInformationalSession, PTCHAR InitiatorName, ULONG InitiatorPortNumber, PISCSI_TARGET_PORTAL TargetPortal, ISCSI_SECURITY_FLAGS SecurityFlags, PISCSI_TARGET_MAPPING Mappings, PISCSI_LOGIN_OPTIONS LoginOptions, ULONG KeySize, PCHAR Key, BOOLEAN IsPersistent, PISCSI_UNIQUE_SESSION_ID UniqueSessionId, PISCSI_UNIQUE_CONNECTION_ID UniqueConnectionId);
  ISDSC_STATUS LogoutIScsiTarget(                   PISCSI_UNIQUE_SESSION_ID UniqueSessionId);
  ISDSC_STATUS RefreshISNSServer(                   PTCHAR Address);
  ISDSC_STATUS RefreshIScsiSendTargetPortal(        PTCHAR InitiatorInstance, ULONG InitiatorPortNumber, PISCSI_TARGET_PORTAL Portal);
  ISDSC_STATUS RemoveISNSServer(                    PTCHAR Address);
  ISDSC_STATUS RemoveIScsiConnection(               PISCSI_UNIQUE_SESSION_ID UniqueSessionId, PISCSI_UNIQUE_CONNECTION_ID UniqueConnectionId);
  ISDSC_STATUS RemoveIScsiPersistentTarget(         PTCHAR InitiatorInstance, ULONG InitiatorPortNumber, PTCHAR TargetName, PISCSI_TARGET_PORTAL Portal);
  ISDSC_STATUS RemoveIScsiSendTargetPortal(         PTCHAR InitiatorInstance, ULONG InitiatorPortNumber, PISCSI_TARGET_PORTAL Portal);
  ISDSC_STATUS RemoveIScsiStaticTarget(             PTCHAR TargetName);
  ISDSC_STATUS RemovePersistentIScsiDevice(         PTCHAR VolumePath);
  ISDSC_STATUS RemoveRadiusServer(                  PTCHAR Address);
  ISDSC_STATUS ReportActiveIScsiTargetMappings(     PULONG BufferSize, PULONG MappingCount, PISCSI_TARGET_MAPPING Mappings);
  ISDSC_STATUS ReportISNSServerList(                PULONG BufferSizeInChar, PTCHAR Buffer);
  ISDSC_STATUS ReportIScsiInitiatorList(            ULONG* BufferSize, PTCHAR Buffer);
  ISDSC_STATUS ReportIScsiPersistentLogins(         ULONG* Count, PPERSISTENT_ISCSI_LOGIN_INFO PersistentLoginInfo, PULONG BufferSizeInBytes);
  ISDSC_STATUS ReportIScsiSendTargetPortals(        PULONG PortalCount, PISCSI_TARGET_PORTAL_INFO PortalInfo);
  ISDSC_STATUS ReportIScsiSendTargetPortalsEx(      PULONG PortalCount, PULONG PortalInfoSize, PISCSI_TARGET_PORTAL_INFO_EX PortalInfo);
  ISDSC_STATUS ReportIScsiTargets(                  BOOLEAN ForceUpdate, PULONG BufferSize, PTCHAR Buffer);
  ISDSC_STATUS ReportIScsiTargetPortals(            PWCHAR InitiatorName, PWCHAR TargetName, PUSHORT TargetPortalTag, PULONG ElementCount, PISCSI_TARGET_PORTAL Portals);
  ISDSC_STATUS ReportPersistentIScsiDevices(        PULONG BufferSizeInChar, PTCHAR Buffer);
  ISDSC_STATUS ReportRadiusServerList(              PULONG BufferSizeInChar, PTCHAR Buffer);
  ISDSC_STATUS SendScsiInquiry(                     PISCSI_UNIQUE_SESSION_ID* UniqueSessionId, ULONGLONG Lun, UCHAR EvpdCmddt, UCHAR PageCode, PUCHAR* ScsiStatus, PULONG* ReponseSize, PUCHAR ReponseBuffer, PULONG* SenseSize, PUCHAR SenseBuffer);
  ISDSC_STATUS SendScsiReadCapacity(                PISCSI_UNIQUE_SESSION_ID UniqueSessionId, ULONGLONG Lun, PUCHAR* ScsiStatus, PULONG* ResponseSize, PUCHAR ResponseBuffer, PULONG* SenseSize, PUCHAR SenseBuffer);
  ISDSC_STATUS SendScsiReportLuns(                  PISCSI_UNIQUE_SESSION_ID UniqueSessionId, PUCHAR* ScsiStatus, PULONG* ResponseSize, PUCHAR ResponseBuffer, PULONG* SenseSize, PUCHAR SenseBuffer);
  ISDSC_STATUS SetIScsiGroupPresharedKey(           ULONG KeyLength, PUCHAR Key, BOOLEAN Persist);
  ISDSC_STATUS SetIScsiIKEInfo(                     PTCHAR InitiatorName, ULONG PortNumber, PIKE_AUTHENTICATION_INFORMATION AuthInfo, BOOLEAN Persist);
  ISDSC_STATUS SetIScsiInitiatorCHAPSharedSecret(   ULONG SharedSecretLength, PUCHAR SharedSecret);
  ISDSC_STATUS SetIScsiInitiatorRADIUSSharedSecret( ULONG SharedSecretLength, PUCHAR SharedSecret);
  ISDSC_STATUS SetIScsiInitiatorNodeName(           PTCHAR InitiatorNodeName);
  ISDSC_STATUS SetIScsiTunnelModeOuterAddress(      PTCHAR InitiatorName, ULONG InitiatorPortNumber, PTCHAR DestinationAddress, PTCHAR OuterModeAddress, BOOLEAN Persist);
  ISDSC_STATUS SetupPersistentIScsiDevices(         );
]]
return ffi.load( "Iscsidsc.dll" )

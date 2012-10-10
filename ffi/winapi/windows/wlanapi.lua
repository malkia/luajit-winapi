require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID WLAN_NOTIFICATION_CALLBACK; //Alias
  typedef ULONG WLAN_SIGNAL_QUALITY; //Alias
  enum { WLAN_MAX_NAME_LENGTH = 256 };
  enum { DOT11_SSID_MAX_LENGTH = 32 };
  enum { DOT11_RATE_SET_MAX_LENGTH = 126 };
  typedef DWORD WlanProfileFlags; //Alias
  typedef UINT DOT11_BSS_TYPE; //Alias
  static const DOT11_BSS_TYPE dot11_BSS_type_infrastructure = 1;
  static const DOT11_BSS_TYPE dot11_BSS_type_independent = 2;
  static const DOT11_BSS_TYPE dot11_BSS_type_any = 3;
  typedef UINT DOT11_PHY_TYPE; //Alias
  static const DOT11_PHY_TYPE dot11_phy_type_unknown = 0;
  static const DOT11_PHY_TYPE dot11_phy_type_fhss = 1;
  static const DOT11_PHY_TYPE dot11_phy_type_dsss = 2;
  static const DOT11_PHY_TYPE dot11_phy_type_irbaseband = 3;
  static const DOT11_PHY_TYPE dot11_phy_type_ofdm = 4;
  static const DOT11_PHY_TYPE dot11_phy_type_hrdsss = 5;
  static const DOT11_PHY_TYPE dot11_phy_type_erp = 6;
  static const DOT11_PHY_TYPE dot11_phy_type_ht = 7;
  enum { WLAN_MAX_PHY_INDEX = 64 };
  enum { WLAN_MAX_PHY_TYPE_NUMBER = 8 };
  typedef struct DOT11_SSID {
    ULONG uSSIDLength;
    UCHAR ucSSID[DOT11_SSID_MAX_LENGTH];
  } DOT11_SSID;
  typedef DOT11_SSID *PDOT11_SSID; //Pointer
  typedef DOT11_SSID *PDOT11_SSID; //Pointer
  typedef UINT DOT11_AUTH_ALGORITHM; //Alias
  static const DOT11_AUTH_ALGORITHM DOT11_AUTH_ALGO_80211_OPEN = 1;
  static const DOT11_AUTH_ALGORITHM DOT11_AUTH_ALGO_80211_SHARED_KEY = 2;
  static const DOT11_AUTH_ALGORITHM DOT11_AUTH_ALGO_WPA = 3;
  static const DOT11_AUTH_ALGORITHM DOT11_AUTH_ALGO_WPA_PSK = 4;
  static const DOT11_AUTH_ALGORITHM DOT11_AUTH_ALGO_WPA_NONE = 5;
  static const DOT11_AUTH_ALGORITHM DOT11_AUTH_ALGO_RSNA = 6;
  static const DOT11_AUTH_ALGORITHM DOT11_AUTH_ALGO_RSNA_PSK = 7;
  typedef UINT DOT11_CIPHER_ALGORITHM; //Alias
  static const DOT11_CIPHER_ALGORITHM DOT11_CIPHER_ALGO_NONE = 0x00;
  static const DOT11_CIPHER_ALGORITHM DOT11_CIPHER_ALGO_WEP40 = 0x01;
  static const DOT11_CIPHER_ALGORITHM DOT11_CIPHER_ALGO_TKIP = 0x02;
  static const DOT11_CIPHER_ALGORITHM DOT11_CIPHER_ALGO_CCMP = 0x04;
  static const DOT11_CIPHER_ALGORITHM DOT11_CIPHER_ALGO_WEP104 = 0x05;
  static const DOT11_CIPHER_ALGORITHM DOT11_CIPHER_ALGO_WPA_USE_GROUP = 0x100;
  static const DOT11_CIPHER_ALGORITHM DOT11_CIPHER_ALGO_WEP = 0x101;
  typedef UCHAR NDIS_OBJECT_TYPE; //Alias
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_DEFAULT = 0x80;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_MINIPORT_INIT_PARAMETERS = 0x81;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_SG_DMA_DESCRIPTION = 0x83;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_MINIPORT_INTERRUPT = 0x84;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_DEVICE_OBJECT_ATTRIBUTES = 0x85;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_BIND_PARAMETERS = 0x86;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_OPEN_PARAMETERS = 0x87;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_RSS_CAPABILITIES = 0x88;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_RSS_PARAMETERS = 0x89;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_MINIPORT_DRIVER_CHARACTERISTICS = 0x8A;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_FILTER_DRIVER_CHARACTERISTICS = 0x8B;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_FILTER_PARTIAL_CHARACTERISTICS = 0x8C;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_FILTER_ATTRIBUTES = 0x8D;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_CLIENT_CHIMNEY_OFFLOAD_GENERIC_CHARACTERISTICS = 0x8E;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_PROVIDER_CHIMNEY_OFFLOAD_GENERIC_CHARACTERISTICS = 0x8F;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_CO_PROTOCOL_CHARACTERISTICS = 0x90;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_CO_MINIPORT_CHARACTERISTICS = 0x91;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_MINIPORT_PNP_CHARACTERISTICS = 0x92;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_CLIENT_CHIMNEY_OFFLOAD_CHARACTERISTICS = 0x93;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_PROVIDER_CHIMNEY_OFFLOAD_CHARACTERISTICS = 0x94;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_PROTOCOL_DRIVER_CHARACTERISTICS = 0x95;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_REQUEST_EX = 0x96;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_OID_REQUEST = 0x96;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_TIMER_CHARACTERISTICS = 0x97;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_STATUS_INDICATION = 0x98;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_FILTER_ATTACH_PARAMETERS = 0x99;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_FILTER_PAUSE_PARAMETERS = 0x9A;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_FILTER_RESTART_PARAMETERS = 0x9B;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_PORT_CHARACTERISTICS = 0x9C;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_PORT_STATE = 0x9D;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_MINIPORT_ADAPTER_REGISTRATION_ATTRIBUTES = 0x9E;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_MINIPORT_ADAPTER_GENERAL_ATTRIBUTES = 0x9F;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_MINIPORT_ADAPTER_OFFLOAD_ATTRIBUTES = 0xA0;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_MINIPORT_ADAPTER_NATIVE_802_11_ATTRIBUTES = 0xA1;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_RESTART_GENERAL_ATTRIBUTES = 0xA2;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_PROTOCOL_RESTART_PARAMETERS = 0xA3;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_MINIPORT_ADD_DEVICE_REGISTRATION_ATTRIBUTES = 0xA4;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_CO_CALL_MANAGER_OPTIONAL_HANDLERS = 0xA5;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_CO_CLIENT_OPTIONAL_HANDLERS = 0xA6;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_OFFLOAD = 0xA7;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_OFFLOAD_ENCAPSULATION = 0xA8;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_CONFIGURATION_OBJECT = 0xA9;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_DRIVER_WRAPPER_OBJECT = 0xAA;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_HD_SPLIT_ATTRIBUTES = 0xAB;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_NSI_NETWORK_RW_STRUCT = 0xAC;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_NSI_COMPARTMENT_RW_STRUCT = 0xAD;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_NSI_INTERFACE_PERSIST_RW_STRUCT = 0xAE;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_MINIPORT_ADAPTER_HARDWARE_ASSIST_ATTRIBUTES = 0xAF;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_SHARED_MEMORY_PROVIDER_CHARACTERISTICS = 0xB0;
  static const NDIS_OBJECT_TYPE NDIS_OBJECT_TYPE_RSS_PROCESSOR_INFO = 0xB1;
  typedef struct NDIS_OBJECT_HEADER {
    NDIS_OBJECT_TYPE Type;
    UCHAR Revision;
    USHORT Size;
  } NDIS_OBJECT_HEADER;
  typedef struct DOT11_BSSID_LIST {
    NDIS_OBJECT_HEADER Header;
    ULONG uNumOfEntries;
    ULONG uTotalNumOfEntries;
    DOT11_MAC_ADDRESS BSSIDs[1];
  } DOT11_BSSID_LIST;
  typedef DOT11_BSSID_LIST *PDOT11_BSSID_LIST; //Pointer
  typedef UINT WLAN_INTERFACE_STATE; //Alias
  static const WLAN_INTERFACE_STATE wlan_interface_state_not_ready = 0;
  static const WLAN_INTERFACE_STATE wlan_interface_state_connected = 1;
  static const WLAN_INTERFACE_STATE wlan_interface_state_ad_hoc_network_formed = 2;
  static const WLAN_INTERFACE_STATE wlan_interface_state_disconnecting = 3;
  static const WLAN_INTERFACE_STATE wlan_interface_state_disconnected = 4;
  static const WLAN_INTERFACE_STATE wlan_interface_state_associating = 5;
  static const WLAN_INTERFACE_STATE wlan_interface_state_discovering = 6;
  static const WLAN_INTERFACE_STATE wlan_interface_state_authenticating = 7;
  typedef struct WLAN_INTERFACE_INFO {
    GUID InterfaceGuid;
    WCHAR strInterfaceDescription[WLAN_MAX_NAME_LENGTH];
    WLAN_INTERFACE_STATE isState;
  } WLAN_INTERFACE_INFO;
  typedef struct WLAN_INTERFACE_INFO_LIST {
    DWORD dwNumberOfItems;
    DWORD dwIndex;
    WLAN_INTERFACE_INFO InterfaceInfo[1];
  } WLAN_INTERFACE_INFO_LIST;
  typedef WLAN_INTERFACE_INFO_LIST *PWLAN_INTERFACE_INFO_LIST; //Pointer
  typedef struct WLAN_RAW_DATA_LIST_s {
    DWORD dwDataOffset;
    DWORD dwDataSize;
  } WLAN_RAW_DATA_LIST_s;
  typedef struct WLAN_RAW_DATA_LIST {
    DWORD dwTotalSize;
    DWORD dwNumberOfItems;
    WLAN_RAW_DATA_LIST_s DataList[1];
  } WLAN_RAW_DATA_LIST;
  typedef WLAN_RAW_DATA_LIST *PWLAN_RAW_DATA_LIST; //Pointer
  typedef WLAN_RAW_DATA_LIST *PWLAN_RAW_DATA_LIST; //Pointer
  typedef DWORD WLAN_AVAILABLE_NETWORK_FLAGS; //Alias
  typedef struct WLAN_AVAILABLE_NETWORK {
    WCHAR strProfileName[WLAN_MAX_NAME_LENGTH];
    DOT11_SSID dot11Ssid;
    DOT11_BSS_TYPE dot11BssType;
    ULONG uNumberOfBssids;
    BOOL bNetworkConnectable;
    WLAN_REASON_CODE wlanNotConnectableReason;
    ULONG uNumberOfPhyTypes;
    DOT11_PHY_TYPE dot11PhyTypes[WLAN_MAX_PHY_TYPE_NUMBER];
    BOOL bMorePhyTypes;
    WLAN_SIGNAL_QUALITY wlanSignalQuality;
    BOOL bSecurityEnabled;
    DOT11_AUTH_ALGORITHM dot11DefaultAuthAlgorithm;
    DOT11_CIPHER_ALGORITHM dot11DefaultCipherAlgorithm;
    WLAN_AVAILABLE_NETWORK_FLAGS dwFlags;
    DWORD dwReserved;
  } WLAN_AVAILABLE_NETWORK;
  typedef struct WLAN_AVAILABLE_NETWORK_LIST {
    DWORD dwNumberOfItems;
    DWORD dwIndex;
    WLAN_AVAILABLE_NETWORK Network[1];
  } WLAN_AVAILABLE_NETWORK_LIST;
  typedef WLAN_AVAILABLE_NETWORK_LIST *PWLAN_AVAILABLE_NETWORK_LIST; //Pointer
  typedef struct DOT11_NETWORK {
    DOT11_SSID dot11Ssid;
    DOT11_BSS_TYPE dot11BssType;
  } DOT11_NETWORK;
  typedef struct DOT11_NETWORK_LIST {
    DWORD dwNumberOfItems;
    DWORD dwIndex;
    DOT11_NETWORK Network[1];
  } DOT11_NETWORK_LIST;
  typedef DOT11_NETWORK_LIST *PDOT11_NETWORK_LIST; //Pointer
  typedef DOT11_NETWORK_LIST *PDOT11_NETWORK_LIST; //Pointer
  typedef UINT WLAN_INTERFACE_TYPE; //Alias
  static const WLAN_INTERFACE_TYPE wlan_interface_type_emulated_802_11 = 0;
  static const WLAN_INTERFACE_TYPE wlan_interface_type_native_802_11 = 1;
  static const WLAN_INTERFACE_TYPE wlan_interface_type_invalid = 2;
  typedef struct WLAN_INTERFACE_CAPABILITY {
    WLAN_INTERFACE_TYPE interfaceType;
    BOOL bDot11DSupported;
    DWORD dwMaxDesiredSsidListSize;
    DWORD dwMaxDesiredBssidListSize;
    DWORD dwNumberOfSupportedPhys;
    DOT11_PHY_TYPE dot11PhyTypes[WLAN_MAX_PHY_INDEX];
  } WLAN_INTERFACE_CAPABILITY;
  typedef WLAN_INTERFACE_CAPABILITY *PWLAN_INTERFACE_CAPABILITY; //Pointer
  typedef struct WLAN_RATE_SET {
    ULONG uRateSetLength;
    USHORT usRateSet[DOT11_RATE_SET_MAX_LENGTH];
  } WLAN_RATE_SET;
  typedef struct WLAN_BSS_ENTRY {
    DOT11_SSID dot11Ssid;
    ULONG uPhyId;
    DOT11_MAC_ADDRESS dot11Bssid;
    DOT11_BSS_TYPE dot11BssType;
    DOT11_PHY_TYPE dot11BssPhyType;
    LONG lRssi;
    ULONG uLinkQuality;
    BOOLEAN bInRegDomain;
    USHORT usBeaconPeriod;
    ULONGLONG ullTimestamp;
    ULONGLONG ullHostTimestamp;
    USHORT usCapabilityInformation;
    ULONG ulChCenterFrequency;
    WLAN_RATE_SET wlanRateSet;
    ULONG ulIeOffset;
    ULONG ulIeSize;
  } WLAN_BSS_ENTRY;
  typedef struct WLAN_BSS_LIST {
    DWORD dwTotalSize;
    DWORD dwNumberOfItems;
    WLAN_BSS_ENTRY wlanBssEntries[1];
  } WLAN_BSS_LIST;
  typedef WLAN_BSS_LIST *PWLAN_BSS_LIST; //Pointer
  typedef struct WLAN_PROFILE_INFO {
    WCHAR strProfileName[WLAN_MAX_NAME_LENGTH];
    WlanProfileFlags dwFlags;
  } WLAN_PROFILE_INFO;
  typedef struct WLAN_PROFILE_INFO_LIST {
    DWORD dwNumberOfItems;
    DWORD dwIndex;
    WLAN_PROFILE_INFO ProfileInfo[1];
  } WLAN_PROFILE_INFO_LIST;
  typedef WLAN_PROFILE_INFO_LIST *PWLAN_PROFILE_INFO_LIST; //Pointer
  typedef UINT WLAN_HOSTED_NETWORK_STATE; //Alias
  static const WLAN_HOSTED_NETWORK_STATE wlan_hosted_network_unavailable = 0;
  static const WLAN_HOSTED_NETWORK_STATE wlan_hosted_network_idle = 1;
  static const WLAN_HOSTED_NETWORK_STATE wlan_hosted_network_active = 2;
  typedef UINT WLAN_HOSTED_NETWORK_PEER_AUTH_STATE; //Alias
  static const WLAN_HOSTED_NETWORK_PEER_AUTH_STATE wlan_hosted_network_peer_state_invalid = 0;
  static const WLAN_HOSTED_NETWORK_PEER_AUTH_STATE wlan_hosted_network_peer_state_authenticated = 1;
  typedef struct WLAN_HOSTED_NETWORK_PEER_STATE {
    DOT11_MAC_ADDRESS PeerMacAddress;
    WLAN_HOSTED_NETWORK_PEER_AUTH_STATE PeerAuthState;
  } WLAN_HOSTED_NETWORK_PEER_STATE;
  typedef struct WLAN_HOSTED_NETWORK_STATUS {
    WLAN_HOSTED_NETWORK_STATE HostedNetworkState;
    GUID IPDeviceID;
    DOT11_MAC_ADDRESS wlanHostedNetworkBSSID;
    DOT11_PHY_TYPE dot11PhyType;
    ULONG ulChannelFrequency;
    DWORD dwNumberOfPeers;
    WLAN_HOSTED_NETWORK_PEER_STATE PeerList[1];
  } WLAN_HOSTED_NETWORK_STATUS;
  typedef WLAN_HOSTED_NETWORK_STATUS *PWLAN_HOSTED_NETWORK_STATUS; //Pointer
  typedef struct WLAN_RAW_DATA {
    DWORD dwDataSize;
    BYTE DataBlob[1];
  } WLAN_RAW_DATA;
  typedef WLAN_RAW_DATA *PWLAN_RAW_DATA; //Pointer
  typedef UINT WLAN_CONNECTION_MODE; //Alias
  static const WLAN_CONNECTION_MODE wlan_connection_mode_profile = 0;
  static const WLAN_CONNECTION_MODE wlan_connection_mode_temporary_profile = 1;
  static const WLAN_CONNECTION_MODE wlan_connection_mode_discovery_secure = 2;
  static const WLAN_CONNECTION_MODE wlan_connection_mode_discovery_unsecure = 3;
  static const WLAN_CONNECTION_MODE wlan_connection_mode_auto = 4;
  static const WLAN_CONNECTION_MODE wlan_connection_mode_invalid = 5;
  typedef DWORD WlanConnectionFlags; //Alias
  typedef struct WLAN_CONNECTION_PARAMETERS {
    WLAN_CONNECTION_MODE wlanConnectionMode;
    LPCWSTR strProfile;
    PDOT11_SSID pDot11Ssid;
    PDOT11_BSSID_LIST pDesiredBssidList;
    DOT11_BSS_TYPE dot11BssType;
    WlanConnectionFlags dwFlags;
  } WLAN_CONNECTION_PARAMETERS;
  typedef WLAN_CONNECTION_PARAMETERS *PWLAN_CONNECTION_PARAMETERS; //Pointer
  typedef UINT WLAN_OPCODE_VALUE_TYPE; //Alias
  static const WLAN_OPCODE_VALUE_TYPE wlan_opcode_value_type_query_only = 0;
  static const WLAN_OPCODE_VALUE_TYPE wlan_opcode_value_type_set_by_group_policy = 1;
  static const WLAN_OPCODE_VALUE_TYPE wlan_opcode_value_type_set_by_user = 2;
  static const WLAN_OPCODE_VALUE_TYPE wlan_opcode_value_type_invalid = 3;
  typedef WLAN_OPCODE_VALUE_TYPE *PWLAN_OPCODE_VALUE_TYPE; //Pointer
  typedef UINT WLAN_FILTER_LIST_TYPE; //Alias
  static const WLAN_FILTER_LIST_TYPE wlan_filter_list_type_gp_permit = 0;
  static const WLAN_FILTER_LIST_TYPE wlan_filter_list_type_gp_deny = 1;
  static const WLAN_FILTER_LIST_TYPE wlan_filter_list_type_user_permit = 2;
  static const WLAN_FILTER_LIST_TYPE wlan_filter_list_type_user_deny = 3;
  typedef UINT WLAN_SECURABLE_OBJECT; //Alias
  static const WLAN_SECURABLE_OBJECT wlan_secure_permit_list = 0;
  static const WLAN_SECURABLE_OBJECT wlan_secure_deny_list = 1;
  static const WLAN_SECURABLE_OBJECT wlan_secure_ac_enabled = 2;
  static const WLAN_SECURABLE_OBJECT wlan_secure_bc_scan_enabled = 3;
  static const WLAN_SECURABLE_OBJECT wlan_secure_bss_type = 4;
  static const WLAN_SECURABLE_OBJECT wlan_secure_show_denied = 5;
  static const WLAN_SECURABLE_OBJECT wlan_secure_interface_properties = 6;
  static const WLAN_SECURABLE_OBJECT wlan_secure_ihv_control = 7;
  static const WLAN_SECURABLE_OBJECT wlan_secure_all_user_profiles_order = 8;
  static const WLAN_SECURABLE_OBJECT wlan_secure_add_new_all_user_profiles = 9;
  static const WLAN_SECURABLE_OBJECT wlan_secure_add_new_per_user_profiles = 10;
  static const WLAN_SECURABLE_OBJECT wlan_secure_media_streaming_mode_enabled = 11;
  static const WLAN_SECURABLE_OBJECT wlan_secure_current_operation_mode = 12;
  typedef UINT WLAN_HOSTED_NETWORK_REASON; //Alias
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_success = 0;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_unspecified = 1;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_bad_parameters = 2;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_service_shutting_down = 3;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_insufficient_resources = 4;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_elevation_required = 5;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_read_only = 6;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_persistence_failed = 7;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_crypt_error = 8;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_impersonation = 9;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_stop_before_start = 10;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_interface_available = 11;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_interface_unavailable = 12;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_miniport_stopped = 13;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_miniport_started = 14;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_incompatible_connection_started = 15;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_incompatible_connection_stopped = 16;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_user_action = 17;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_client_abort = 18;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_ap_start_failed = 19;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_peer_arrived = 20;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_peer_departed = 21;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_peer_timeout = 22;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_gp_denied = 23;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_service_unavailable = 24;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_device_change = 25;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_properties_change = 26;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_virtual_station_blocking_use = 27;
  static const WLAN_HOSTED_NETWORK_REASON wlan_hosted_network_reason_service_available_on_virtual_station = 28;
  typedef WLAN_HOSTED_NETWORK_REASON *PWLAN_HOSTED_NETWORK_REASON; //Pointer
  typedef UINT WLAN_HOSTED_NETWORK_OPCODE; //Alias
  static const WLAN_HOSTED_NETWORK_OPCODE wlan_hosted_network_opcode_connection_settings = 0;
  static const WLAN_HOSTED_NETWORK_OPCODE wlan_hosted_network_opcode_security_settings = 1;
  static const WLAN_HOSTED_NETWORK_OPCODE wlan_hosted_network_opcode_station_profile = 2;
  static const WLAN_HOSTED_NETWORK_OPCODE wlan_hosted_network_opcode_enable = 3;
  typedef UINT WLAN_IHV_CONTROL_TYPE; //Alias
  static const WLAN_IHV_CONTROL_TYPE wlan_ihv_control_type_service = 0;
  static const WLAN_IHV_CONTROL_TYPE wlan_ihv_control_type_driver = 1;
  typedef UINT WLAN_AUTOCONF_OPCODE; //Alias
  static const WLAN_AUTOCONF_OPCODE wlan_autoconf_opcode_start = 0;
  static const WLAN_AUTOCONF_OPCODE wlan_autoconf_opcode_show_denied_networks = 1;
  static const WLAN_AUTOCONF_OPCODE wlan_autoconf_opcode_power_setting = 2;
  static const WLAN_AUTOCONF_OPCODE wlan_autoconf_opcode_only_use_gp_profiles_for_allowed_networks = 3;
  static const WLAN_AUTOCONF_OPCODE wlan_autoconf_opcode_allow_explicit_creds = 4;
  static const WLAN_AUTOCONF_OPCODE wlan_autoconf_opcode_block_period = 5;
  static const WLAN_AUTOCONF_OPCODE wlan_autoconf_opcode_allow_virtual_station_extensibility = 6;
  static const WLAN_AUTOCONF_OPCODE wlan_autoconf_opcode_end = 7;
  typedef UINT WLAN_INTF_OPCODE; //Alias
  static const WLAN_INTF_OPCODE wlan_intf_opcode_autoconf_enabled = 1;
  static const WLAN_INTF_OPCODE wlan_intf_opcode_background_scan_enabled = 2;
  static const WLAN_INTF_OPCODE wlan_intf_opcode_media_streaming_mode = 3;
  static const WLAN_INTF_OPCODE wlan_intf_opcode_radio_state = 4;
  static const WLAN_INTF_OPCODE wlan_intf_opcode_bss_type = 5;
  static const WLAN_INTF_OPCODE wlan_intf_opcode_interface_state = 6;
  static const WLAN_INTF_OPCODE wlan_intf_opcode_current_connection = 7;
  static const WLAN_INTF_OPCODE wlan_intf_opcode_channel_number = 8;
  static const WLAN_INTF_OPCODE wlan_intf_opcode_supported_infrastructure_auth_cipher_pairs = 9;
  static const WLAN_INTF_OPCODE wlan_intf_opcode_supported_adhoc_auth_cipher_pairs = 10;
  static const WLAN_INTF_OPCODE wlan_intf_opcode_supported_country_or_region_string_list = 11;
  static const WLAN_INTF_OPCODE wlan_intf_opcode_current_operation_mode = 12;
  static const WLAN_INTF_OPCODE wlan_intf_opcode_supported_safe_mode = 13;
  static const WLAN_INTF_OPCODE wlan_intf_opcode_certified_safe_mode = 14;
  static const WLAN_INTF_OPCODE wlan_intf_opcode_hosted_network_capable = 15;
  static const WLAN_INTF_OPCODE wlan_intf_opcode_statistics = 0x10000101;
  static const WLAN_INTF_OPCODE wlan_intf_opcode_rssi = 0x10000102;
  typedef DWORD WlanNotificationSource; //Alias
  typedef DWORD WlanAvailableFlags; //Alias
  typedef DWORD WlanAccess; //Alias
  typedef struct EAP_TYPE {
    BYTE type;
    DWORD dwVendorId;
    DWORD dwVendorType;
  } EAP_TYPE;
  typedef struct EAP_METHOD_TYPE {
    EAP_TYPE eapType;
    DWORD dwAuthorId;
  } EAP_METHOD_TYPE;
  PVOID      WlanAllocateMemory(                       DWORD dwMemorySize);
  ERROR_CODE WlanCloseHandle(                          HANDLE hClientHandle, PVOID pReserved);
  ERROR_CODE WlanConnect(                              HANDLE hClientHandle, GUID* pInterfaceGuid, PWLAN_CONNECTION_PARAMETERS pConnectionParameters, PVOID pReserved);
  ERROR_CODE WlanDeleteProfile(                        HANDLE hClientHandle, GUID* pInterfaceGuid, LPCWSTR strProfileName, PVOID pReserved);
  ERROR_CODE WlanDisconnect(                           HANDLE hClientHandle, GUID* pInterfaceGuid, PVOID pReserved);
  ERROR_CODE WlanEnumInterfaces(                       HANDLE hClientHandle, PVOID pReserved, PWLAN_INTERFACE_INFO_LIST* ppInterfaceList);
  ERROR_CODE WlanExtractPsdIEDataList(                 HANDLE hClientHandle, DWORD dwIeDataSize, PBYTE pRawIeData, LPCWSTR strFormat, PVOID pReserved, PWLAN_RAW_DATA_LIST* ppPsdIEDataList);
  VOID       WlanFreeMemory(                           PVOID pMemory);
  ERROR_CODE WlanGetAvailableNetworkList(              HANDLE hClientHandle, GUID* pInterfaceGuid, WlanAvailableFlags dwFlags, PVOID pReserved, PWLAN_AVAILABLE_NETWORK_LIST* ppAvailableNetworkList);
  ERROR_CODE WlanGetFilterList(                        HANDLE hClientHandle, WLAN_FILTER_LIST_TYPE wlanFilterListType, PVOID pReserved, PDOT11_NETWORK_LIST* ppNetworkList);
  ERROR_CODE WlanGetInterfaceCapability(               HANDLE hClientHandle, GUID* pInterfaceGuid, PVOID pReserved, PWLAN_INTERFACE_CAPABILITY* ppCapability);
  ERROR_CODE WlanGetNetworkBssList(                    HANDLE hClientHandle, GUID* pInterfaceGuid, PDOT11_SSID pDot11Ssid, DOT11_BSS_TYPE dot11BssType, BOOL bSecurityEnabled, PVOID pReserved, PWLAN_BSS_LIST* ppWlanBssList);
  ERROR_CODE WlanGetProfile(                           HANDLE hClientHandle, GUID* pInterfaceGuid, LPCWSTR strProfileName, PVOID pReserved, LPWSTR* pstrProfileXml, WlanProfileFlags* pdwFlags, WlanAccess* pdwGrantedAccess);
  ERROR_CODE WlanGetProfileCustomUserData(             HANDLE hClientHandle, GUID* pInterfaceGuid, LPCWSTR strProfileName, PVOID pReserved, DWORD* pdwDataSize, PBYTE* ppData);
  ERROR_CODE WlanGetProfileList(                       HANDLE hClientHandle, GUID* pInterfaceGuid, PVOID pReserved, PWLAN_PROFILE_INFO_LIST* ppProfileList);
  ERROR_CODE WlanGetSecuritySettings(                  HANDLE hClientHandle, WLAN_SECURABLE_OBJECT SecurableObject, PWLAN_OPCODE_VALUE_TYPE pValueType, LPWSTR* pstrCurrentSDDL, WlanAccess* pdwGrantedAccess);
  ERROR_CODE WlanHostedNetworkForceStart(              HANDLE hClientHandle, PWLAN_HOSTED_NETWORK_REASON pFailReason, PVOID pvReserved);
  ERROR_CODE WlanHostedNetworkForceStop(               HANDLE hClientHandle, PWLAN_HOSTED_NETWORK_REASON pFailReason, PVOID pvReserved);
  ERROR_CODE WlanHostedNetworkInitSettings(            HANDLE hClientHandle, PWLAN_HOSTED_NETWORK_REASON pFailReason, PVOID pvReserved);
  ERROR_CODE WlanHostedNetworkQueryProperty(           HANDLE hClientHandle, WLAN_HOSTED_NETWORK_OPCODE OpCode, PDWORD pdwDataSize, PVOID* ppvData, PWLAN_OPCODE_VALUE_TYPE* pWlanOpcodeValueType, PVOID pvReserved);
  ERROR_CODE WlanHostedNetworkQuerySecondaryKey(       HANDLE hClientHandle, DWORD pdwKeyLength, PUCHAR* ppucKeyData, PBOOL pbIsPassPhrase, PBOOL pbPersistent, PWLAN_HOSTED_NETWORK_REASON pFailReason, PVOID pvReserved);
  ERROR_CODE WlanHostedNetworkQueryStatus(             HANDLE hClientHandle, PWLAN_HOSTED_NETWORK_STATUS* ppWlanHostedNetworkStatus, PVOID pvReserved);
  ERROR_CODE WlanHostedNetworkRefreshSecuritySettings( HANDLE hClientHandle, PWLAN_HOSTED_NETWORK_REASON pFailReason, PVOID pvReserved);
  ERROR_CODE WlanHostedNetworkSetProperty(             HANDLE hClientHandle, WLAN_HOSTED_NETWORK_OPCODE OpCode, DWORD dwDataSize, PVOID pvData, PWLAN_HOSTED_NETWORK_REASON pFailReason, PVOID pvReserved);
  ERROR_CODE WlanHostedNetworkSetSecondaryKey(         HANDLE hClientHandle, DWORD dwKeyLength, PUCHAR pucKeyData, BOOL bIsPassPhrase, BOOL bPersistent, PWLAN_HOSTED_NETWORK_REASON pFailReason, PVOID pvReserved);
  ERROR_CODE WlanHostedNetworkStartUsing(              HANDLE hClientHandle, PWLAN_HOSTED_NETWORK_REASON pFailReason, PVOID pvReserved);
  ERROR_CODE WlanHostedNetworkStopUsing(               HANDLE hClientHandle, PWLAN_HOSTED_NETWORK_REASON pFailReason, PVOID pvReserved);
  ERROR_CODE WlanIhvControl(                           HANDLE hClientHandle, GUID* pInterfaceGuid, WLAN_IHV_CONTROL_TYPE Type, DWORD dwInBufferSize, PVOID pInBuffer, DWORD dwOutBufferSize, PVOID pOutBuffer, PDWORD pdwBytesReturned);
  ERROR_CODE WlanOpenHandle(                           DWORD dwClientVersion, PVOID pReserved, PDWORD pdwNegotiatedVersion, PHANDLE phClientHandle);
  ERROR_CODE WlanQueryAutoConfigParameter(             HANDLE hClientHandle, WLAN_AUTOCONF_OPCODE OpCode, PVOID pReserved, PDWORD pdwDataSize, PVOID ppData, PWLAN_OPCODE_VALUE_TYPE pWlanOpcodeValueType);
  ERROR_CODE WlanQueryInterface(                       HANDLE hClientHandle, GUID* pInterfaceGuid, WLAN_INTF_OPCODE OpCode, PVOID pReserved, PDWORD pdwDataSize, PVOID* ppData, PWLAN_OPCODE_VALUE_TYPE pWlanOpcodeValueType);
  ERROR_CODE WlanReasonCodeToString(                   DWORD dwReasonCode, DWORD dwBufferSize, PWCHAR pStringBuffer, PVOID pReserved);
  ERROR_CODE WlanRegisterNotification(                 HANDLE hClientHandle, WlanNotificationSource dwNotifSource, BOOL bIgnoreDuplicate, WLAN_NOTIFICATION_CALLBACK funcCallback, PVOID pCallbackContext, PVOID pReserved, WlanNotificationSource* pdwPrevNotifSource);
  ERROR_CODE WlanRegisterVirtualStationNotification(   HANDLE hClientHandle, BOOL bRegister, PVOID pvReserved);
  ERROR_CODE WlanSaveTemporaryProfile(                 HANDLE hClientHandle, GUID* pInterfaceGuid, LPCWSTR strProfileName, LPCWSTR strAllUserProfileSecurity, WlanProfileFlags dwFlags, BOOL bOverWrite, PVOID pReserved);
  ERROR_CODE WlanScan(                                 HANDLE hClientHandle, GUID* pInterfaceGuid, PDOT11_SSID pDot11Ssid, PWLAN_RAW_DATA pIeData, PVOID pReserved);
  ERROR_CODE WlanSetAutoConfigParameter(               HANDLE hClientHandle, WLAN_AUTOCONF_OPCODE OpCode, DWORD dwDataSize, PVOID pData, PVOID pReserved);
  ERROR_CODE WlanSetFilterList(                        HANDLE hClientHandle, WLAN_FILTER_LIST_TYPE wlanFilterListType, PDOT11_NETWORK_LIST pNetworkList, PVOID pReserved);
  ERROR_CODE WlanSetInterface(                         HANDLE hClientHandle, GUID* pInterfaceGuid, WLAN_INTF_OPCODE OpCode, DWORD dwDataSize, PVOID pData, PVOID pReserved);
  ERROR_CODE WlanSetProfile(                           HANDLE hClientHandle, GUID* pInterfaceGuid, DWORD dwFlags, LPCWSTR strProfileXml, LPCWSTR strAllUserProfileSecurity, BOOL bOverwrite, PVOID pReserved, DWORD* pdwReasonCode);
  ERROR_CODE WlanSetProfileCustomUserData(             HANDLE hClientHandle, GUID* pInterfaceGuid, LPCWSTR strProfileName, DWORD dwDataSize, PBYTE pData, PVOID pReserved);
  ERROR_CODE WlanSetProfileEapUserData(                HANDLE hClientHandle, GUID* pInterfaceGuid, LPCWSTR strProfileName, EAP_METHOD_TYPE eapType, DWORD dwFlags, DWORD dwEapUserDataSize, LPBYTE pbEapUserData, PVOID pReserved);
  ERROR_CODE WlanSetProfileEapXmlUserData(             HANDLE hClientHandle, GUID* pInterfaceGuid, LPCWSTR strProfileName, DWORD dwFlags, LPCWSTR strEapXmlUserData, PVOID pReserved);
  ERROR_CODE WlanSetProfileList(                       HANDLE hClientHandle, GUID* pInterfaceGuid, DWORD dwItems, LPCWSTR* strProfileNames, PVOID pReserved);
  ERROR_CODE WlanSetProfilePosition(                   HANDLE hClientHandle, GUID* pInterfaceGuid, LPCWSTR strProfileName, DWORD dwPosition, PVOID pReserved);
  ERROR_CODE WlanSetPsdIEDataList(                     HANDLE hClientHandle, LPCWSTR strFormat, PWLAN_RAW_DATA_LIST pPsdIEDataList, PVOID pReserved);
  ERROR_CODE WlanSetSecuritySettings(                  HANDLE hClientHandle, WLAN_SECURABLE_OBJECT SecurableObject, LPCWSTR strModifiedSDDL);
]]
ffi.load( 'Wlanapi.dll' )

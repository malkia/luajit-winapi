require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/sockets' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef HANDLE HRASCONN; //Alias
  typedef HRASCONN *LPHRASCONN; //Pointer
  typedef FILETIME ProbationTime; //Alias
  typedef GUID ConnectionId; //Alias
  typedef IN_ADDR RASIPV4ADDR; //Alias
  typedef IN6_ADDR RASIPV6ADDR; //Alias
  enum { RAS_MaxDeviceType_plus_1 = 17 };
  enum { RAS_MaxDeviceName_plus_1 = 129 };
  enum { RAS_MaxPhoneNumber_plus_1 = 129 };
  enum { RAS_MaxCallbackNumber_plus_1 = 129 };
  enum { RAS_MaxAreaCode_plus_1 = 11 };
  enum { RAS_MaxPadType_plus_1 = 33 };
  enum { RAS_MaxX25Address_plus_1 = 201 };
  enum { RAS_MaxFacilities_plus_1 = 201 };
  enum { RAS_MaxUserData_plus_1 = 201 };
  enum { RAS_MaxDnsSuffix = 256 };
  enum { UNLEN_plus_1 = 257 };
  enum { PWLEN_plus_1 = 257 };
  enum { DNLEN_plus_1 = 16 };
  typedef DWORD RASAPIVERSION; //Alias
  static const RASAPIVERSION RASAPIVERSION_500 = 1;
  static const RASAPIVERSION RASAPIVERSION_501 = 2;
  static const RASAPIVERSION RASAPIVERSION_600 = 3;
  static const RASAPIVERSION RASAPIVERSION_601 = 4;
  typedef union WINAPI_RASTUNNELENDPOINT_u {
    RASIPV4ADDR ipv4;
    RASIPV6ADDR ipv6;
  } WINAPI_RASTUNNELENDPOINT_u;
  typedef DWORD WINAPI_RASTUNNELENDPOINT_TYPE; //Alias
  static const WINAPI_RASTUNNELENDPOINT_TYPE RASTUNNELENDPOINT_UNKNOWN = 0;
  static const WINAPI_RASTUNNELENDPOINT_TYPE RASTUNNELENDPOINT_IPv4 = 1;
  static const WINAPI_RASTUNNELENDPOINT_TYPE RASTUNNELENDPOINT_IPv6 = 2;
# pragma pack( push, 4 )
  typedef struct RASTUNNELENDPOINT {
    WINAPI_RASTUNNELENDPOINT_TYPE dwType;
    WINAPI_RASTUNNELENDPOINT_u ;
  } RASTUNNELENDPOINT;
# pragma pack( pop )
# pragma pack( push, 4 )
  typedef struct RASDIALPARAMS {
    DWORD dwSize;
    TCHAR szEntryName[RAS_MaxEntryName_plus_1];
    TCHAR szPhoneNumber[RAS_MaxPhoneNumber_plus_1];
    TCHAR szCallbackNumber[RAS_MaxCallbackNumber_plus_1];
    TCHAR szUserName[UNLEN_plus_1];
    TCHAR szPassword[PWLEN_plus_1];
    TCHAR szDomain[DNLEN_plus_1];
    DWORD dwSubEntry;
    ULONG_PTR dwCallbackId;
    DWORD dwIfIndex;
  } RASDIALPARAMS;
# pragma pack( pop )
  typedef RASDIALPARAMS *LPRASDIALPARAMS; //Pointer
  typedef DWORD WINAPI_RASCONN_FLAGS; //Alias
# pragma pack( push, 4 )
  typedef struct RASCONN {
    DWORD dwSize;
    HRASCONN hrasconn;
    TCHAR szEntryName[RAS_MaxEntryName_plus_1];
    TCHAR szDeviceType[RAS_MaxDeviceType_plus_1];
    TCHAR szDeviceName[RAS_MaxDeviceName_plus_1];
    TCHAR szPhonebook[MAX_PATH];
    DWORD dwSubEntry;
    GUID guidEntry;
    WINAPI_RASCONN_FLAGS dwFlags;
    LUID luid;
    GUID guidCorrelationId;
  } RASCONN;
# pragma pack( pop )
  typedef RASCONN *LPRASCONN; //Pointer
# pragma pack( push, 4 )
  typedef struct RASDEVINFO {
    DWORD dwSize;
    TCHAR szDeviceType[RAS_MaxDeviceType_plus_1];
    TCHAR szDeviceName[RAS_MaxDeviceName_plus_1];
  } RASDEVINFO;
# pragma pack( pop )
  typedef RASDEVINFO *LPRASDEVINFO; //Pointer
  typedef DWORD WINAPI_RASENTRYNAME_FLAGS; //Alias
# pragma pack( push, 4 )
  typedef struct RASENTRYNAME {
    DWORD dwSize;
    TCHAR szEntryName[RAS_MaxEntryName_plus_1];
    WINAPI_RASENTRYNAME_FLAGS dwFlags;
    TCHAR szPhonebookPath[MAX_PATH_plus_1];
  } RASENTRYNAME;
# pragma pack( pop )
  typedef RASENTRYNAME *LPRASENTRYNAME; //Pointer
# pragma pack( push, 4 )
  typedef struct RASAUTODIALENTRY {
    DWORD dwSize;
    DWORD dwFlags;
    DWORD dwDialingLocation;
    TCHAR szEntry[RAS_MaxEntryName_plus_1];
  } RASAUTODIALENTRY;
# pragma pack( pop )
  typedef RASAUTODIALENTRY *LPRASAUTODIALENTRY; //Pointer
  typedef UINT RASCONNSTATE; //Alias
  static const RASCONNSTATE RASCS_OpenPort = 0;
  static const RASCONNSTATE RASCS_PortOpened = 1;
  static const RASCONNSTATE RASCS_ConnectDevice = 2;
  static const RASCONNSTATE RASCS_DeviceConnected = 3;
  static const RASCONNSTATE RASCS_AllDevicesConnected = 4;
  static const RASCONNSTATE RASCS_Authenticate = 5;
  static const RASCONNSTATE RASCS_AuthNotify = 6;
  static const RASCONNSTATE RASCS_AuthRetry = 7;
  static const RASCONNSTATE RASCS_AuthCallback = 8;
  static const RASCONNSTATE RASCS_AuthChangePassword = 9;
  static const RASCONNSTATE RASCS_AuthProject = 10;
  static const RASCONNSTATE RASCS_AuthLinkSpeed = 11;
  static const RASCONNSTATE RASCS_AuthAck = 12;
  static const RASCONNSTATE RASCS_ReAuthenticate = 13;
  static const RASCONNSTATE RASCS_Authenticated = 14;
  static const RASCONNSTATE RASCS_PrepareForCallback = 15;
  static const RASCONNSTATE RASCS_WaitForModemReset = 16;
  static const RASCONNSTATE RASCS_WaitForCallback = 17;
  static const RASCONNSTATE RASCS_Projected = 18;
  static const RASCONNSTATE RASCS_StartAuthentication = 19;
  static const RASCONNSTATE RASCS_CallbackComplete = 20;
  static const RASCONNSTATE RASCS_LogonNetwork = 21;
  static const RASCONNSTATE RASCS_SubEntryConnected = 22;
  static const RASCONNSTATE RASCS_SubEntryDisconnected = 23;
  static const RASCONNSTATE RASCS_ApplySettings = 24;
  static const RASCONNSTATE RASCS_Interactive = 0x1000;
  static const RASCONNSTATE RASCS_RetryAuthentication = 0x1001;
  static const RASCONNSTATE RASCS_CallbackSetByCaller = 0x1002;
  static const RASCONNSTATE RASCS_PasswordExpired = 0x1003;
  static const RASCONNSTATE RASCS_InvokeEapUI = 0x1004;
  static const RASCONNSTATE RASCS_Connected = 0x2000;
  static const RASCONNSTATE RASCS_Disconnected = 0x2001;
  typedef UINT RASCONNSUBSTATE; //Alias
  static const RASCONNSUBSTATE RASCSS_None = 0;
  static const RASCONNSUBSTATE RASCSS_Dormant = 1;
  static const RASCONNSUBSTATE RASCSS_Reconnecting = 2;
  static const RASCONNSUBSTATE RASCSS_Reconnected = 0x2000;
# pragma pack( push, 4 )
  typedef struct RASCONNSTATUS {
    DWORD dwSize;
    RASCONNSTATE rasconnstate;
    DWORD dwError;
    TCHAR szDeviceType[RAS_MaxDeviceType_plus_1];
    TCHAR szDeviceName[RAS_MaxDeviceName_plus_1];
    TCHAR szPhoneNumber[RAS_MaxPhoneNumber_plus_1];
    RASTUNNELENDPOINT localEndPoint;
    RASTUNNELENDPOINT remoteEndPoint;
    RASCONNSUBSTATE rasconnsubstate;
  } RASCONNSTATUS;
# pragma pack( pop )
  typedef RASCONNSTATUS *LPRASCONNSTATUS; //Pointer
  typedef DWORD WINAPI_RASCM_FLAGS; //Alias
# pragma pack( push, 4 )
  typedef struct RASCREDENTIALS {
    DWORD dwSize;
    WINAPI_RASCM_FLAGS dwMask;
    TCHAR szUserName[UNLEN_plus_1];
    TCHAR szPassword[PWLEN_plus_1];
    TCHAR szDomain[DNLEN_plus_1];
  } RASCREDENTIALS;
# pragma pack( pop )
  typedef RASCREDENTIALS *LPRASCREDENTIALS; //Pointer
# pragma pack( push, 4 )
  typedef struct RASEAPUSERIDENTITY {
    TCHAR szUserName[UNLEN_plus_1];
    DWORD dwSizeofEapInfo;
    BYTE pbEapInfo[1];
  } RASEAPUSERIDENTITY;
# pragma pack( pop )
  typedef RASEAPUSERIDENTITY *LPRASEAPUSERIDENTITY; //Pointer
# pragma pack( push, 4 )
  typedef struct RASIPADDR {
    BYTE a;
    BYTE b;
    BYTE c;
    BYTE d;
  } RASIPADDR;
# pragma pack( pop )
  typedef DWORD WINAPI_RASEO_FLAGS; //Alias
  typedef DWORD WINAPI_RASEO2_FLAGS; //Alias
  typedef DWORD WINAPI_RASNP_FLAGS; //Alias
  typedef DWORD WINAPI_RASFP_FLAGS; //Alias
  typedef DWORD WINAPI_RASEDM_ENUM; //Alias
  static const WINAPI_RASEDM_ENUM RASEDM_DialAll = 1;
  static const WINAPI_RASEDM_ENUM RASEDM_DialAsNeeded = 2;
  typedef DWORD WINAPI_RASET_ENUM; //Alias
  static const WINAPI_RASET_ENUM RASET_Phone = 1;
  static const WINAPI_RASET_ENUM RASET_Vpn = 2;
  static const WINAPI_RASET_ENUM RASET_Direct = 3;
  static const WINAPI_RASET_ENUM RASET_Internet = 4;
  static const WINAPI_RASET_ENUM RASET_Broadband = 5;
  typedef DWORD WINAPI_RAS_ENCRYPTION_TYPE; //Alias
  static const WINAPI_RAS_ENCRYPTION_TYPE ET_None = 0;
  static const WINAPI_RAS_ENCRYPTION_TYPE ET_Require = 1;
  static const WINAPI_RAS_ENCRYPTION_TYPE ET_RequireMax = 2;
  static const WINAPI_RAS_ENCRYPTION_TYPE ET_Optional = 3;
  typedef DWORD WINAPI_RAS_VPN_STRATEGY; //Alias
  static const WINAPI_RAS_VPN_STRATEGY VS_Default = 0;
  static const WINAPI_RAS_VPN_STRATEGY VS_PptpOnly = 1;
  static const WINAPI_RAS_VPN_STRATEGY VS_PptpFirst = 2;
  static const WINAPI_RAS_VPN_STRATEGY VS_L2tpOnly = 3;
  static const WINAPI_RAS_VPN_STRATEGY VS_L2tpFirst = 4;
  static const WINAPI_RAS_VPN_STRATEGY VS_SstpOnly = 5;
  static const WINAPI_RAS_VPN_STRATEGY VS_SstpFirst = 6;
  static const WINAPI_RAS_VPN_STRATEGY VS_Ikev2Only = 7;
  static const WINAPI_RAS_VPN_STRATEGY VS_Ikev2First = 8;
  static const WINAPI_RAS_VPN_STRATEGY VS_PptpSstp = 12;
  static const WINAPI_RAS_VPN_STRATEGY VS_L2tpSstp = 13;
  static const WINAPI_RAS_VPN_STRATEGY VS_Ikev2Sstp = 14;
# pragma pack( push, 4 )
  typedef struct RASENTRY {
    DWORD dwSize;
    WINAPI_RASEO_FLAGS dwfOptions;
    DWORD dwCountryID;
    DWORD dwCountryCode;
    TCHAR szAreaCode[RAS_MaxAreaCode_plus_1];
    TCHAR szLocalPhoneNumber[RAS_MaxPhoneNumber_plus_1];
    DWORD dwAlternateOffset;
    RASIPADDR ipaddr;
    RASIPADDR ipaddrDns;
    RASIPADDR ipaddrDnsAlt;
    RASIPADDR ipaddrWins;
    RASIPADDR ipaddrWinsAlt;
    DWORD dwFrameSize;
    WINAPI_RASNP_FLAGS dwfNetProtocols;
    WINAPI_RASFP_FLAGS dwFramingProtocol;
    TCHAR szScript[MAX_PATH];
    TCHAR szAutodialDll[MAX_PATH];
    TCHAR szAutodialFunc[MAX_PATH];
    TCHAR szDeviceType[RAS_MaxDeviceType_plus_1];
    TCHAR szDeviceName[RAS_MaxDeviceName_plus_1];
    TCHAR szX25PadType[RAS_MaxPadType_plus_1];
    TCHAR szX25Address[RAS_MaxX25Address_plus_1];
    TCHAR szX25Facilities[RAS_MaxFacilities_plus_1];
    TCHAR szX25UserData[RAS_MaxUserData_plus_1];
    DWORD dwChannels;
    DWORD dwReserved1;
    DWORD dwReserved2;
    DWORD dwSubEntries;
    WINAPI_RASEDM_ENUM dwDialMode;
    DWORD dwDialExtraPercent;
    DWORD dwDialExtraSampleSeconds;
    DWORD dwHangUpExtraPercent;
    DWORD dwHangUpExtraSampleSeconds;
    DWORD dwIdleDisconnectSeconds;
    WINAPI_RASET_ENUM dwType;
    WINAPI_RAS_ENCRYPTION_TYPE dwEncryptionType;
    DWORD dwCustomAuthKey;
    GUID guidId;
    TCHAR szCustomDialDll[MAX_PATH];
    WINAPI_RAS_VPN_STRATEGY dwVpnStrategy;
    WINAPI_RASEO2_FLAGS dwfOptions2;
    DWORD dwfOptions3;
    TCHAR szDnsSuffix[RAS_MaxDnsSuffix];
    DWORD dwTcpWindowSize;
    TCHAR szPrerequisitePbk[MAX_PATH];
    TCHAR szPrerequisiteEntry[RAS_MaxEntryName_plus_1];
    DWORD dwRedialCount;
    DWORD dwRedialPause;
    RASIPV6ADDR ipv6addrDns;
    RASIPV6ADDR ipv6addrDnsAlt;
    DWORD dwIPv4InterfaceMetric;
    DWORD dwIPv6InterfaceMetric;
    RASIPV6ADDR ipv6addr;
    DWORD dwIPv6PrefixLength;
    DWORD dwNetworkOutageTime;
  } RASENTRY;
# pragma pack( pop )
  typedef RASENTRY *LPRASENTRY; //Pointer
  typedef DWORD WINAPI_RASIPO_OPTIONS; //Alias
  typedef DWORD WINAPI_RASLCPAP; //Alias
  static const WINAPI_RASLCPAP RASLCPAP_PAP = 0xC023;
  static const WINAPI_RASLCPAP RASLCPAP_SPAP = 0xC027;
  static const WINAPI_RASLCPAP RASLCPAP_CHAP = 0xC223;
  static const WINAPI_RASLCPAP RASLCPAP_EAP = 0xC227;
  typedef DWORD WINAPI_RASLCPAD; //Alias
  static const WINAPI_RASLCPAD RASLCPAD_CHAP_MD5 = 0x05;
  static const WINAPI_RASLCPAD RASLCPAD_CHAP_MS = 0x80;
  static const WINAPI_RASLCPAD RASLCPAD_CHAP_MSV2 = 0x81;
  typedef DWORD WINAPI_RASLCPO; //Alias
  typedef DWORD WINAPI_RASCCPCA; //Alias
  static const WINAPI_RASCCPCA RASCCPCA_MPPC = 0x00000006;
  static const WINAPI_RASCCPCA RASCCPCA_STAC = 0x00000005;
  typedef DWORD WINAPI_RASCCPO; //Alias
# pragma pack( push, 4 )
  typedef struct RASPPP_PROJECTION_INFO {
    DWORD dwIPv4NegotiationError;
    RASIPV4ADDR ipv4Address;
    RASIPV4ADDR ipv4ServerAddress;
    WINAPI_RASIPO_OPTIONS dwIPv4Options;
    WINAPI_RASIPO_OPTIONS dwIPv4ServerOptions;
    DWORD dwIPv6NegotiationError;
    BYTE bInterfaceIdentifier[8];
    BYTE bServerInterfaceIdentifier[8];
    BOOL fBundled;
    BOOL fMultilink;
    WINAPI_RASLCPAP dwAuthenticationProtocol;
    WINAPI_RASLCPAD dwAuthenticationData;
    WINAPI_RASLCPAP dwServerAuthenticationProtocol;
    WINAPI_RASLCPAD dwServerAuthenticationData;
    DWORD dwEapTypeId;
    DWORD dwServerEapTypeId;
    WINAPI_RASLCPO dwLcpOptions;
    WINAPI_RASLCPO dwLcpServerOptions;
    DWORD dwCcpError;
    WINAPI_RASCCPCA dwCcpCompressionAlgorithm;
    WINAPI_RASCCPCA dwCcpServerCompressionAlgorithm;
    WINAPI_RASCCPO dwCcpOptions;
    WINAPI_RASCCPO dwCcpServerOptions;
  } RASPPP_PROJECTION_INFO;
# pragma pack( pop )
  typedef UINT IPSEC_CIPHER_TYPE; //Alias
  static const IPSEC_CIPHER_TYPE IPSEC_CIPHER_TYPE_DES = 1;
  static const IPSEC_CIPHER_TYPE IPSEC_CIPHER_TYPE_3DES = 2;
  static const IPSEC_CIPHER_TYPE IPSEC_CIPHER_TYPE_AES_128 = 3;
  static const IPSEC_CIPHER_TYPE IPSEC_CIPHER_TYPE_AES_192 = 4;
  static const IPSEC_CIPHER_TYPE IPSEC_CIPHER_TYPE_AES_256 = 5;
  typedef DWORD WINAPI_RASIKEv2_FLAGS; //Alias
  typedef DWORD WINAPI_RASIKEv2_AUTH; //Alias
  static const WINAPI_RASIKEv2_AUTH RASIKEv2_AUTH_MACHINECERTIFICATES = 1;
  static const WINAPI_RASIKEv2_AUTH RASIKEv2_AUTH_EAP = 2;
# pragma pack( push, 4 )
  typedef struct RASIKEV2_PROJECTION_INFO {
    DWORD dwIPv4NegotiationError;
    RASIPV4ADDR ipv4Address;
    RASIPV4ADDR ipv4ServerAddress;
    DWORD dwIPv6NegotiationError;
    RASIPV6ADDR ipv6Address;
    RASIPV6ADDR ipv6ServerAddress;
    DWORD dwPrefixLength;
    WINAPI_RASIKEv2_AUTH dwAuthenticationProtocol;
    DWORD dwEapTypeId;
    WINAPI_RASIKEv2_FLAGS dwFlags;
    IPSEC_CIPHER_TYPE dwEncryptionMethod;
    DWORD numIPv4ServerAddresses;
    RASIPV4ADDR* ipv4ServerAddresses;
    DWORD numIPv6ServerAddresses;
    RASIPV6ADDR* ipv6ServerAddresses;
  } RASIKEV2_PROJECTION_INFO;
# pragma pack( pop )
  typedef union WINAPI_RAS_PROJECTION_INFO_u {
    RASPPP_PROJECTION_INFO ppp;
    RASIKEV2_PROJECTION_INFO ikev2;
  } WINAPI_RAS_PROJECTION_INFO_u;
  typedef UINT RASPROJECTION_INFO_TYPE; //Alias
  static const RASPROJECTION_INFO_TYPE PROJECTION_INFO_TYPE_PPP = 1;
  static const RASPROJECTION_INFO_TYPE PROJECTION_INFO_TYPE_IKEv2 = 2;
# pragma pack( push, 4 )
  typedef struct RAS_PROJECTION_INFO {
    RASAPIVERSION version;
    RASPROJECTION_INFO_TYPE type;
    WINAPI_RAS_PROJECTION_INFO_u ;
  } RAS_PROJECTION_INFO;
# pragma pack( pop )
  typedef RAS_PROJECTION_INFO *PRAS_PROJECTION_INFO; //Pointer
# pragma pack( push, 4 )
  typedef struct RASSUBENTRY {
    DWORD dwSize;
    DWORD dwfFlags;
    TCHAR szDeviceType[RAS_MaxDeviceType_plus_1];
    TCHAR szDeviceName[RAS_MaxDeviceName_plus_1];
    TCHAR szLocalPhoneNumber[RAS_MaxPhoneNumber_plus_1];
    DWORD dwAlternateOffset;
  } RASSUBENTRY;
# pragma pack( pop )
  typedef RASSUBENTRY *LPRASSUBENTRY; //Pointer
# pragma pack( push, 4 )
  typedef struct RASUPDATECONN {
    RASAPIVERSION version;
    DWORD dwSize;
    DWORD dwFlags;
    DWORD dwIfIndex;
    RASTUNNELENDPOINT localEndPoint;
    RASTUNNELENDPOINT remoteEndPoint;
  } RASUPDATECONN;
# pragma pack( pop )
  typedef RASUPDATECONN *LPRASUPDATECONN; //Pointer
# pragma pack( push, 4 )
  typedef struct RASEAPINFO {
    DWORD dwSizeofEapInfo;
    BYTE* pbEapInfo;
  } RASEAPINFO;
# pragma pack( pop )
# pragma pack( push, 4 )
  typedef struct RASDEVSPECIFICINFO {
    DWORD dwSize;
    BYTE* pbDevSpecificInfo;
  } RASDEVSPECIFICINFO;
# pragma pack( pop )
# pragma pack( push, 4 )
  typedef struct RASDIALEXTENSIONS {
    DWORD dwSize;
    DWORD dwfOptions;
    HWND hwndParent;
    ULONG_PTR reserved;
    ULONG_PTR reserved1;
    RASEAPINFO RasEapInfo;
    BOOL fSkipPppAuth;
    RASDEVSPECIFICINFO RasDevSpecificInfo;
  } RASDIALEXTENSIONS;
# pragma pack( pop )
  typedef RASDIALEXTENSIONS *LPRASDIALEXTENSIONS; //Pointer
# pragma pack( push, 4 )
  typedef struct RAS_STATS {
    DWORD dwSize;
    DWORD dwBytesXmited;
    DWORD dwBytesRcved;
    DWORD dwFramesXmited;
    DWORD dwFramesRcved;
    DWORD dwCrcErr;
    DWORD dwTimeoutErr;
    DWORD dwAlignmentErr;
    DWORD dwHardwareOverrunErr;
    DWORD dwFramingErr;
    DWORD dwBufferOverrunErr;
    DWORD dwCompressionRatioIn;
    DWORD dwCompressionRatioOut;
    DWORD dwBps;
    DWORD dwConnectDuration;
  } RAS_STATS;
# pragma pack( pop )
# pragma pack( push, 4 )
  typedef struct RASCTRYINFO {
    DWORD dwSize;
    DWORD dwCountryID;
    DWORD dwNextCountryID;
    DWORD dwCountryCode;
    DWORD dwCountryNameOffset;
  } RASCTRYINFO;
# pragma pack( pop )
  typedef RASCTRYINFO *LPRASCTRYINFO; //Pointer
  typedef UINT IsolationState; //Alias
  static const IsolationState isolationStateNotRestricted = 1;
  static const IsolationState isolationStateInProbation = 2;
  static const IsolationState isolationStateRestrictedAccess = 3;
# pragma pack( push, 4 )
  typedef struct RASNAPSTATE {
    DWORD dwSize;
    DWORD dwFlags;
    IsolationState isolationState;
    ProbationTime probationTime;
  } RASNAPSTATE;
# pragma pack( pop )
  typedef RASNAPSTATE *LPRASNAPSTATE; //Pointer
  typedef DWORD WINAPI_RasConnNotifyFlags; //Alias
  typedef DWORD RASPROJECTION; //Alias
  DWORD RasClearConnectionStatistics( HRASCONN hRasConn);
  DWORD RasClearLinkStatistics(       HRASCONN hRasConn, DWORD dwSubEntry);
  DWORD RasConnectionNotification(    HRASCONN hrasconn, HANDLE hEvent, WINAPI_RasConnNotifyFlags dwFlags);
  DWORD RasCreatePhonebookEntry(      HWND hwnd, LPCTSTR lpszPhonebook);
  DWORD RasDeleteEntry(               LPCTSTR lpszPhonebook, LPCTSTR lpszEntry);
  DWORD RasDeleteSubEntry(            LPCTSTR lpszPhonebook, LPCTSTR lpszEntry, DWORD dwSubEntryId);
  DWORD RasDial(                      LPRASDIALEXTENSIONS lpRasDialExtensions, LPCTSTR lpszPhonebook, LPRASDIALPARAMS lpRasDialParams, DWORD dwNotifierType, LPVOID lpvNotifier, LPHRASCONN lphRasConn);
  DWORD RasEditPhonebookEntry(        HWND hwnd, LPCTSTR lpszPhonebook, LPCTSTR lpszEntryName);
  DWORD RasEnumAutodialAddresses(     LPTSTR* lppAddresses, LPDWORD lpdwcbAddresses, LPDWORD lpdwcAddresses);
  DWORD RasEnumConnections(           LPRASCONN lprasconn, LPDWORD lpcb, LPDWORD lpcConnections);
  DWORD RasEnumDevices(               LPRASDEVINFO lpRasDevInfo, LPDWORD lpcb, LPDWORD lpcDevices);
  DWORD RasEnumEntries(               LPCTSTR reserved, LPCTSTR lpszPhonebook, LPRASENTRYNAME lprasentryname, LPDWORD lpcb, LPDWORD lpcEntries);
  void  RasFreeEapUserIdentity(       LPRASEAPUSERIDENTITY pRasEapUserIdentity);
  DWORD RasGetAutodialAddress(        LPCTSTR lpszAddress, LPDWORD lpdwReserved, LPRASAUTODIALENTRY lpAutoDialEntries, LPDWORD lpdwcbAutoDialEntries, LPDWORD lpdwcAutoDialEntries);
  DWORD RasGetAutodialEnable(         DWORD dwDialingLocation, LPBOOL lpfEnabled);
  DWORD RasGetAutodialParam(          DWORD dwKey, LPVOID lpvValue, LPDWORD lpdwcbValue);
  DWORD RasGetConnectionStatistics(   HRASCONN hRasConn, RAS_STATS* lpStatistics);
  DWORD RasGetConnectStatus(          HRASCONN hrasconn, LPRASCONNSTATUS lprasconnstatus);
  DWORD RasGetCountryInfo(            LPRASCTRYINFO lpRasCtryInfo, LPDWORD lpdwSize);
  DWORD RasGetCredentials(            LPCTSTR lpszPhonebook, LPCTSTR lpszEntry, LPRASCREDENTIALS lpCredentials);
  DWORD RasGetCustomAuthData(         LPCWSTR pszPhonebook, LPCWSTR pszEntry, BYTE* pbCustomAuthData, DWORD* pdwSizeofCustomAuthData);
  DWORD RasGetEapUserData(            HANDLE hToken, LPCTSTR pszPhonebook, LPCTSTR pszEntry, BYTE* pbEapData, DWORD* pdwSizeofEapData);
  DWORD RasGetEapUserIdentity(        LPCSTR pszPhonebook, LPCSTR pszEntry, DWORD dwFlags, HWND hwnd, LPRASEAPUSERIDENTITY* ppRasEapUserIdentity);
  DWORD RasGetEntryDialParams(        LPCTSTR lpszPhonebook, LPRASDIALPARAMS lprasdialparams, LPBOOL lpfPassword);
  DWORD RasGetEntryProperties(        LPCTSTR lpszPhonebook, LPCTSTR lpszEntry, LPRASENTRY lpRasEntry, LPDWORD lpdwEntryInfoSize, LPBYTE lpbDeviceInfo, LPDWORD lpdwDeviceInfoSize);
  DWORD RasGetErrorString(            UINT uErrorValue, LPTSTR lpszErrorString, DWORD cBufSize);
  DWORD RasGetLinkStatistics(         HRASCONN hRasConn, DWORD dwSubEntry, RAS_STATS* lpStatistics);
  DWORD RasGetNapStatus(              HRASCONN hRasConn, LPRASNAPSTATE pNapState);
  DWORD RasGetProjectionInfo(         HRASCONN hrasconn, RASPROJECTION rasprojection, LPVOID lpprojection, LPDWORD lpcb);
  DWORD RasGetProjectionInfoEx(       HRASCONN Hrasconn, PRAS_PROJECTION_INFO pRasProjection, LPDWORD lpdwSize);
  DWORD RasGetQuarantineConnectionId( HRASCONN hRasConn, ConnectionId* lpConnectionId);
  DWORD RasGetSubEntryHandle(         HRASCONN hRasConn, DWORD dwSubEntry, LPHRASCONN lphRasConn);
  DWORD RasGetSubEntryProperties(     LPCTSTR lpszPhonebook, LPCTSTR lpszEntry, DWORD dwSubEntry, LPRASSUBENTRY lpRasSubEntry, LPDWORD lpdwcb, LPBYTE lpbDeviceConfig, LPDWORD lpcbDeviceConfig);
  DWORD RasHangUp(                    HRASCONN hrasconn);
  DWORD RasInvokeEapUI(               HRASCONN hRasConn, DWORD dwSubEntry, LPRASDIALEXTENSIONS lpExtensions, HWND hwnd);
  DWORD RasRenameEntry(               LPCTSTR lpszPhonebook, LPCTSTR lpszOldEntry, LPCTSTR lpszNewEntry);
  DWORD RasSetAutodialAddress(        LPCTSTR lpszAddress, DWORD dwReserved, LPRASAUTODIALENTRY lpAutoDialEntries, DWORD dwcbAutoDialEntries, DWORD dwcAutoDialEntries);
  DWORD RasSetAutodialEnable(         DWORD dwDialingLocation, BOOL fEnabled);
  DWORD RasSetAutodialParam(          DWORD dwKey, LPVOID lpvValue, DWORD dwcbValue);
  DWORD RasSetCredentials(            LPCTSTR lpszPhonebook, LPCTSTR lpszEntry, LPRASCREDENTIALS lpCredentials, BOOL fClearCredentials);
  DWORD RasSetCustomAuthData(         LPCWSTR pszPhonebook, LPCWSTR pszEntry, BYTE* pbCustomAuthData, DWORD dwSizeofCustomAuthData);
  DWORD RasSetEapUserData(            HANDLE hToken, LPCTSTR pszPhonebook, LPCTSTR pszEntry, BYTE* pbEapData, DWORD dwSizeofEapData);
  DWORD RasSetEntryDialParams(        LPCTSTR lpszPhonebook, LPRASDIALPARAMS lprasdialparams, BOOL fRemovePassword);
  DWORD RasSetEntryProperties(        LPCTSTR lpszPhonebook, LPCTSTR lpszEntry, LPRASENTRY lpRasEntry, DWORD dwEntryInfoSize, LPBYTE lpbDeviceInfo, DWORD dwDeviceInfoSize);
  DWORD RasSetSubEntryProperties(     LPCTSTR lpszPhonebook, LPCTSTR lpszEntry, DWORD dwSubEntry, LPRASSUBENTRY lpRasSubEntry, DWORD dwcbRasSubEntry, LPBYTE lpbDeviceConfig, DWORD dwcbDeviceConfig);
  DWORD RasUpdateConnection(          HRASCONN hrasconn, LPRASUPDATECONN lprasupdateconn);
  DWORD RasValidateEntryName(         LPCTSTR lpszPhonebook, LPCTSTR lpszEntry);
]]
return ffi.load( 'Rasapi32.dll' )

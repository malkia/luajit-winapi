require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  PVOID             WlanAllocateMemory(                       DWORD dwMemorySize);
  WINAPI_ERROR_CODE WlanCloseHandle(                          HANDLE hClientHandle, PVOID pReserved);
  WINAPI_ERROR_CODE WlanConnect(                              HANDLE hClientHandle, GUID* pInterfaceGuid, PWLAN_CONNECTION_PARAMETERS pConnectionParameters, PVOID pReserved);
  WINAPI_ERROR_CODE WlanDeleteProfile(                        HANDLE hClientHandle, GUID* pInterfaceGuid, LPCWSTR strProfileName, PVOID pReserved);
  WINAPI_ERROR_CODE WlanDisconnect(                           HANDLE hClientHandle, GUID* pInterfaceGuid, PVOID pReserved);
  WINAPI_ERROR_CODE WlanEnumInterfaces(                       HANDLE hClientHandle, PVOID pReserved, PWLAN_INTERFACE_INFO_LIST* ppInterfaceList);
  WINAPI_ERROR_CODE WlanExtractPsdIEDataList(                 HANDLE hClientHandle, DWORD dwIeDataSize, PBYTE pRawIeData, LPCWSTR strFormat, PVOID pReserved, PWLAN_RAW_DATA_LIST* ppPsdIEDataList);
  VOID              WlanFreeMemory(                           PVOID pMemory);
  WINAPI_ERROR_CODE WlanGetAvailableNetworkList(              HANDLE hClientHandle, GUID* pInterfaceGuid, WINAPI_WlanAvailableFlags dwFlags, PVOID pReserved, PWLAN_AVAILABLE_NETWORK_LIST* ppAvailableNetworkList);
  WINAPI_ERROR_CODE WlanGetFilterList(                        HANDLE hClientHandle, WLAN_FILTER_LIST_TYPE wlanFilterListType, PVOID pReserved, PDOT11_NETWORK_LIST* ppNetworkList);
  WINAPI_ERROR_CODE WlanGetInterfaceCapability(               HANDLE hClientHandle, GUID* pInterfaceGuid, PVOID pReserved, PWLAN_INTERFACE_CAPABILITY* ppCapability);
  WINAPI_ERROR_CODE WlanGetNetworkBssList(                    HANDLE hClientHandle, GUID* pInterfaceGuid, PDOT11_SSID pDot11Ssid, DOT11_BSS_TYPE dot11BssType, BOOL bSecurityEnabled, PVOID pReserved, PWLAN_BSS_LIST* ppWlanBssList);
  WINAPI_ERROR_CODE WlanGetProfile(                           HANDLE hClientHandle, GUID* pInterfaceGuid, LPCWSTR strProfileName, PVOID pReserved, LPWSTR* pstrProfileXml, WINAPI_WlanProfileFlags* pdwFlags, WINAPI_WlanAccess* pdwGrantedAccess);
  WINAPI_ERROR_CODE WlanGetProfileCustomUserData(             HANDLE hClientHandle, GUID* pInterfaceGuid, LPCWSTR strProfileName, PVOID pReserved, DWORD* pdwDataSize, PBYTE* ppData);
  WINAPI_ERROR_CODE WlanGetProfileList(                       HANDLE hClientHandle, GUID* pInterfaceGuid, PVOID pReserved, PWLAN_PROFILE_INFO_LIST* ppProfileList);
  WINAPI_ERROR_CODE WlanGetSecuritySettings(                  HANDLE hClientHandle, WLAN_SECURABLE_OBJECT SecurableObject, PWLAN_OPCODE_VALUE_TYPE pValueType, LPWSTR* pstrCurrentSDDL, WINAPI_WlanAccess* pdwGrantedAccess);
  WINAPI_ERROR_CODE WlanHostedNetworkForceStart(              HANDLE hClientHandle, PWLAN_HOSTED_NETWORK_REASON pFailReason, PVOID pvReserved);
  WINAPI_ERROR_CODE WlanHostedNetworkForceStop(               HANDLE hClientHandle, PWLAN_HOSTED_NETWORK_REASON pFailReason, PVOID pvReserved);
  WINAPI_ERROR_CODE WlanHostedNetworkInitSettings(            HANDLE hClientHandle, PWLAN_HOSTED_NETWORK_REASON pFailReason, PVOID pvReserved);
  WINAPI_ERROR_CODE WlanHostedNetworkQueryProperty(           HANDLE hClientHandle, WLAN_HOSTED_NETWORK_OPCODE OpCode, PDWORD pdwDataSize, PVOID* ppvData, PWLAN_OPCODE_VALUE_TYPE* pWlanOpcodeValueType, PVOID pvReserved);
  WINAPI_ERROR_CODE WlanHostedNetworkQuerySecondaryKey(       HANDLE hClientHandle, DWORD pdwKeyLength, PUCHAR* ppucKeyData, PBOOL pbIsPassPhrase, PBOOL pbPersistent, PWLAN_HOSTED_NETWORK_REASON pFailReason, PVOID pvReserved);
  WINAPI_ERROR_CODE WlanHostedNetworkQueryStatus(             HANDLE hClientHandle, PWLAN_HOSTED_NETWORK_STATUS* ppWlanHostedNetworkStatus, PVOID pvReserved);
  WINAPI_ERROR_CODE WlanHostedNetworkRefreshSecuritySettings( HANDLE hClientHandle, PWLAN_HOSTED_NETWORK_REASON pFailReason, PVOID pvReserved);
  WINAPI_ERROR_CODE WlanHostedNetworkSetProperty(             HANDLE hClientHandle, WLAN_HOSTED_NETWORK_OPCODE OpCode, DWORD dwDataSize, PVOID pvData, PWLAN_HOSTED_NETWORK_REASON pFailReason, PVOID pvReserved);
  WINAPI_ERROR_CODE WlanHostedNetworkSetSecondaryKey(         HANDLE hClientHandle, DWORD dwKeyLength, PUCHAR pucKeyData, BOOL bIsPassPhrase, BOOL bPersistent, PWLAN_HOSTED_NETWORK_REASON pFailReason, PVOID pvReserved);
  WINAPI_ERROR_CODE WlanHostedNetworkStartUsing(              HANDLE hClientHandle, PWLAN_HOSTED_NETWORK_REASON pFailReason, PVOID pvReserved);
  WINAPI_ERROR_CODE WlanHostedNetworkStopUsing(               HANDLE hClientHandle, PWLAN_HOSTED_NETWORK_REASON pFailReason, PVOID pvReserved);
  WINAPI_ERROR_CODE WlanIhvControl(                           HANDLE hClientHandle, GUID* pInterfaceGuid, WLAN_IHV_CONTROL_TYPE Type, DWORD dwInBufferSize, PVOID pInBuffer, DWORD dwOutBufferSize, PVOID pOutBuffer, PDWORD pdwBytesReturned);
  WINAPI_ERROR_CODE WlanOpenHandle(                           DWORD dwClientVersion, PVOID pReserved, PDWORD pdwNegotiatedVersion, PHANDLE phClientHandle);
  WINAPI_ERROR_CODE WlanQueryAutoConfigParameter(             HANDLE hClientHandle, WLAN_AUTOCONF_OPCODE OpCode, PVOID pReserved, PDWORD pdwDataSize, PVOID ppData, PWLAN_OPCODE_VALUE_TYPE pWlanOpcodeValueType);
  WINAPI_ERROR_CODE WlanQueryInterface(                       HANDLE hClientHandle, GUID* pInterfaceGuid, WLAN_INTF_OPCODE OpCode, PVOID pReserved, PDWORD pdwDataSize, PVOID* ppData, PWLAN_OPCODE_VALUE_TYPE pWlanOpcodeValueType);
  WINAPI_ERROR_CODE WlanReasonCodeToString(                   DWORD dwReasonCode, DWORD dwBufferSize, PWCHAR pStringBuffer, PVOID pReserved);
  WINAPI_ERROR_CODE WlanRegisterNotification(                 HANDLE hClientHandle, WINAPI_WlanNotificationSource dwNotifSource, BOOL bIgnoreDuplicate, WLAN_NOTIFICATION_CALLBACK funcCallback, PVOID pCallbackContext, PVOID pReserved, WINAPI_WlanNotificationSource* pdwPrevNotifSource);
  WINAPI_ERROR_CODE WlanRegisterVirtualStationNotification(   HANDLE hClientHandle, BOOL bRegister, PVOID pvReserved);
  WINAPI_ERROR_CODE WlanSaveTemporaryProfile(                 HANDLE hClientHandle, GUID* pInterfaceGuid, LPCWSTR strProfileName, LPCWSTR strAllUserProfileSecurity, WINAPI_WlanProfileFlags dwFlags, BOOL bOverWrite, PVOID pReserved);
  WINAPI_ERROR_CODE WlanScan(                                 HANDLE hClientHandle, GUID* pInterfaceGuid, PDOT11_SSID pDot11Ssid, PWLAN_RAW_DATA pIeData, PVOID pReserved);
  WINAPI_ERROR_CODE WlanSetAutoConfigParameter(               HANDLE hClientHandle, WLAN_AUTOCONF_OPCODE OpCode, DWORD dwDataSize, PVOID pData, PVOID pReserved);
  WINAPI_ERROR_CODE WlanSetFilterList(                        HANDLE hClientHandle, WLAN_FILTER_LIST_TYPE wlanFilterListType, PDOT11_NETWORK_LIST pNetworkList, PVOID pReserved);
  WINAPI_ERROR_CODE WlanSetInterface(                         HANDLE hClientHandle, GUID* pInterfaceGuid, WLAN_INTF_OPCODE OpCode, DWORD dwDataSize, PVOID pData, PVOID pReserved);
  WINAPI_ERROR_CODE WlanSetProfile(                           HANDLE hClientHandle, GUID* pInterfaceGuid, DWORD dwFlags, LPCWSTR strProfileXml, LPCWSTR strAllUserProfileSecurity, BOOL bOverwrite, PVOID pReserved, DWORD* pdwReasonCode);
  WINAPI_ERROR_CODE WlanSetProfileCustomUserData(             HANDLE hClientHandle, GUID* pInterfaceGuid, LPCWSTR strProfileName, DWORD dwDataSize, PBYTE pData, PVOID pReserved);
  WINAPI_ERROR_CODE WlanSetProfileEapUserData(                HANDLE hClientHandle, GUID* pInterfaceGuid, LPCWSTR strProfileName, EAP_METHOD_TYPE eapType, DWORD dwFlags, DWORD dwEapUserDataSize, LPBYTE pbEapUserData, PVOID pReserved);
  WINAPI_ERROR_CODE WlanSetProfileEapXmlUserData(             HANDLE hClientHandle, GUID* pInterfaceGuid, LPCWSTR strProfileName, DWORD dwFlags, LPCWSTR strEapXmlUserData, PVOID pReserved);
  WINAPI_ERROR_CODE WlanSetProfileList(                       HANDLE hClientHandle, GUID* pInterfaceGuid, DWORD dwItems, LPCWSTR* strProfileNames, PVOID pReserved);
  WINAPI_ERROR_CODE WlanSetProfilePosition(                   HANDLE hClientHandle, GUID* pInterfaceGuid, LPCWSTR strProfileName, DWORD dwPosition, PVOID pReserved);
  WINAPI_ERROR_CODE WlanSetPsdIEDataList(                     HANDLE hClientHandle, LPCWSTR strFormat, PWLAN_RAW_DATA_LIST pPsdIEDataList, PVOID pReserved);
  WINAPI_ERROR_CODE WlanSetSecuritySettings(                  HANDLE hClientHandle, WLAN_SECURABLE_OBJECT SecurableObject, LPCWSTR strModifiedSDDL);
]]
return ffi.load( "Wlanapi.dll" )

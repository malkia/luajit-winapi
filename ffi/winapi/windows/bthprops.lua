require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/bluetooth' )
local ffi = require( 'ffi' )
ffi.cdef [[
  DWORD                  BluetoothAuthenticateDevice(           HWND hwndParent, HANDLE hRadio, BLUETOOTH_DEVICE_INFO* pbtdi, PWCHAR pszPasskey, ULONG ulPasskeyLength);
  DWORD                  BluetoothAuthenticateMultipleDevices(  HWND hwndParent, HANDLE hRadio, DWORD cDevices, BLUETOOTH_DEVICE_INFO* pbtdi);
  BOOL                   BluetoothDisplayDeviceProperties(      HWND hwndParent, BLUETOOTH_DEVICE_INFO* pbtdi);
  BOOL                   BluetoothEnableDiscovery(              HANDLE hRadio, BOOL fEnabled);
  BOOL                   BluetoothEnableIncomingConnections(    HANDLE hRadio, BOOL fEnabled);
  DWORD                  BluetoothEnumerateInstalledServices(   HANDLE hRadio, BLUETOOTH_DEVICE_INFO* pbtdi, DWORD* pcServices, GUID* pGuidServices);
  BOOL                   BluetoothFindDeviceClose(              HBLUETOOTH_DEVICE_FIND hFind);
  HBLUETOOTH_DEVICE_FIND BluetoothFindFirstDevice(              BLUETOOTH_DEVICE_SEARCH_PARAMS* pbtsp, BLUETOOTH_DEVICE_INFO* pbtdi);
  HBLUETOOTH_RADIO_FIND  BluetoothFindFirstRadio(               BLUETOOTH_FIND_RADIO_PARAMS* pbtfrp, HANDLE* phRadio);
  BOOL                   BluetoothFindNextDevice(               HBLUETOOTH_DEVICE_FIND hFind, BLUETOOTH_DEVICE_INFO* pbtdi);
  BOOL                   BluetoothFindNextRadio(                HBLUETOOTH_RADIO_FIND hFind, HANDLE* phRadio);
  BOOL                   BluetoothFindRadioClose(               HBLUETOOTH_RADIO_FIND hFind);
  DWORD                  BluetoothGetDeviceInfo(                HANDLE hRadio, BLUETOOTH_DEVICE_INFO* pbtdi);
  DWORD                  BluetoothGetRadioInfo(                 HANDLE hRadio, PBLUETOOTH_RADIO_INFO pRadioInfo);
  BOOL                   BluetoothIsConnectable(                HANDLE hRadio);
  BOOL                   BluetoothIsDiscoverable(               HANDLE hRadio);
  DWORD                  BluetoothRegisterForAuthentication(    BLUETOOTH_DEVICE_INFO* pbtdi, HBLUETOOTH_AUTHENTICATION_REGISTRATION* phRegHandle, PFN_AUTHENTICATION_CALLBACK pfnCallback, PVOID pvParam);
  DWORD                  BluetoothRemoveDevice(                 BLUETOOTH_ADDRESS* pAddress);
  BOOL                   BluetoothSdpEnumAttributes(            LPBYTE pSDPStream, ULONG cbStreamSize, PFN_BLUETOOTH_ENUM_ATTRIBUTES_CALLBACK pfnCallback, LPVOID pvParam);
  DWORD                  BluetoothSdpGetAttributeValue(         LPBYTE pRecordStream, ULONG cbRecordLength, USHORT usAttributeId, PSDP_ELEMENT_DATA pAttributeData);
  DWORD                  BluetoothSdpGetContainerElementData(   LPBYTE pContainerStream, ULONG cbContainerLength, HBLUETOOTH_CONTAINER_ELEMENT* pElement, PSDP_ELEMENT_DATA pData);
  DWORD                  BluetoothSdpGetElementData(            LPBYTE pSdpStream, ULONG cbSpdStreamLength, PSDP_ELEMENT_DATA pData);
  DWORD                  BluetoothSdpGetString(                 LPBYTE pRecordStream, ULONG cbRecordLength, PSDP_STRING_TYPE_DATA pStringData, USHORT usStringOffset, PWCHAR pszString, PULONG pcchStringLength);
  BOOL                   BluetoothSelectDevices(                BLUETOOTH_SELECT_DEVICE_PARAMS* pbtsdp);
  BOOL                   BluetoothSelectDevicesFree(            BLUETOOTH_SELECT_DEVICE_PARAMS* pbtsdp);
  DWORD                  BluetoothSendAuthenticationResponse(   HANDLE hRadio, BLUETOOTH_DEVICE_INFO* pbtdi, LPWSTR pszPasskey);
  DWORD                  BluetoothSetLocalServiceInfo(          HANDLE hRadioIn, const GUID* pClassGuid, ULONG ulInstance, const BLUETOOTH_LOCAL_SERVICE_INFO* pServiceInfoIn);
  DWORD                  BluetoothSetServiceState(              HANDLE hRadio, BLUETOOTH_DEVICE_INFO* pbtdi, GUID* pGuidService, DWORD dwServiceFlags);
  BOOL                   BluetoothUnregisterAuthentication(     HBLUETOOTH_AUTHENTICATION_REGISTRATION hRegHandle);
  DWORD                  BluetoothUpdateDeviceRecord(           BLUETOOTH_DEVICE_INFO* pbtdi);
  HRESULT                BluetoothAuthenticateDeviceEx(         HWND hwndParentIn, HANDLE hRadioIn, BLUETOOTH_DEVICE_INFO* pbtdilInOut, PBLUETOOTH_OOB_DATA_INFO pbtdilInOut, BLUETOOTH_AUTHENTICATION_REQUIREMENTS authenticationRequirement);
  HRESULT                BluetoothRegisterForAuthenticationEx(  const BLUETOOTH_DEVICE_INFO* pbtdiln, HBLUETOOTH_AUTHENTICATION_REGISTRATION* phRegHandleOut, PFN_AUTHENTICATION_CALLBACK_EX pfnCallbackIn, PVOID pvParam);
  HRESULT                BluetoothSendAuthenticationResponseEx( HANDLE hRadioIn, PBLUETOOTH_AUTHENTICATE_RESPONSE pauthResponse);
]]
return ffi.load( 'Bthprops.cpl' )

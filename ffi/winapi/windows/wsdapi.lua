require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  void*   WSDAllocateLinkedMemory(           void* pParent, size_t cbSize);
  void    WSDAttachLinkedMemory(             void* pParent, void* pChild);
  HRESULT WSDCreateDeviceHost(               WCHAR* pszLocalId, IWSDXMLContext* pContext, IWSDDeviceHost** ppDeviceHost);
  HRESULT WSDCreateDeviceHostAdvanced(       WCHAR* pszLocalId, IWSDXMLContext* pContext, IWSDAddress** ppHostAddresses, DWORD dwHostAddressCount, IWSDDeviceHost** ppDeviceHost);
  HRESULT WSDCreateDeviceProxy(              WCHAR* pszDeviceId, WCHAR* pszLocalId, IWSDXMLContext* pContext, IWSDDeviceProxy** ppDeviceProxy);
  HRESULT WSDCreateDeviceProxyAdvanced(      WCHAR* pszDeviceId, IWSDAddress* pDeviceAddress, WCHAR* pszLocalId, IWSDXMLContext* pContext, IWSDDeviceProxy** ppDeviceProxy);
  HRESULT WSDCreateDiscoveryProvider(        IWSDXMLContext* pContext, IWSDiscoveryProvider** ppProvider);
  HRESULT WSDCreateDiscoveryProvider2(       IWSDXMLContext* pContext, WSD_CONFIG_PARAM* pConfigParams, DWORD dwConfigParamCount, IWSDiscoveryProvider** ppProvider);
  HRESULT WSDCreateDiscoveryPublisher(       IWSDXMLContext* pContext, IWSDiscoveryPublisher** ppPublisher);
  HRESULT WSDCreateDiscoveryPublisher2(      IWSDXMLContext* pContext, WSD_CONFIG_PARAM* pConfigParams, DWORD dwConfigParamCount, IWSDiscoveryPublisher** ppPublisher);
  HRESULT WSDCreateHttpAddress(              IWSDHttpAddress** ppAddress);
  HRESULT WSDCreateHttpMessageParameters(    IWSDHttpMessageParameters** ppTxParams);
  HRESULT WSDCreateOutboundAttachment(       IWSDOutboundAttachment** attachmentOut);
  HRESULT WSDCreateUdpAddress(               IWSDUdpAddress** ppAddress);
  HRESULT WSDCreateUdpMessageParameters(     IWSDUdpMessageParameters** ppTxParams);
  void    WSDDetachLinkedMemory(             void* pVoid);
  void    WSDFreeLinkedMemory(               void* pVoid);
  HRESULT WSDGenerateFault(                  LPCWSTR pszCode, LPCWSTR pszSubCode, LPCWSTR pszReason, LPCWSTR pszDetail, IWSDXMLContext* pContext, WSD_SOAP_FAULT** ppFault);
  HRESULT WSDGenerateFaultEx(                WSDXML_NAME* pCode, WSDXML_NAME* pSubCode, WSD_LOCALIZED_STRING_LIST* pReasons, LPCWSTR pszDetail, WSD_SOAP_FAULT** ppFault);
  HRESULT WSDGetConfigurationOption(         DWORD dwOption, LPVOID pVoid, DWORD cbOutBuffer);
  HRESULT WSDSetConfigurationOption(         DWORD dwOption, LPVOID pVoid, DWORD cbInBuffer);
  HRESULT WSDUriDecode(                      LPCWSTR source, DWORD cchSource, LPWSTR* destOut, DWORD* cchDestOut);
  HRESULT WSDUriEncode(                      LPCWSTR source, DWORD cchSource, LPWSTR* destOut, DWORD* cchDestOut);
  HRESULT WSDXMLAddChild(                    WSDXML_ELEMENT* pParent, WSDXML_ELEMENT* pChild);
  HRESULT WSDXMLAddSibling(                  WSDXML_ELEMENT* pFirst, WSDXML_ELEMENT* pSecond);
  HRESULT WSDXMLBuildAnyForSingleElement(    WSDXML_NAME* pElementName, LPCWSTR pszText, WSDXML_ELEMENT** ppAny);
  HRESULT WSDXMLCleanupElement(              WSDXML_ELEMENT* pAny);
  HRESULT WSDXMLCreateContext(               IWSDXMLContext** ppContext);
  HRESULT WSDXMLGetNameFromBuiltinNamespace( LPCWSTR pszNamespace, LPCWSTR pszName, WSDXML_NAME** ppName);
  HRESULT WSDXMLGetValueFromAny(             WCHAR* pszNamespace, WCHAR* pszName, WSDXML_ELEMENT* pAny, LPCWSTR* ppszValue);
]]
return ffi.load( "Wsdapi.dll" )

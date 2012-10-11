require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IWSDAddress; //Interface
  typedef void* IWSDUdpAddress; //Interface
  typedef void* IWSDXMLContext; //Interface
  typedef void* IWSDDeviceHost; //Interface
  typedef void* IWSDHttpAddress; //Interface
  typedef void* IWSDDeviceProxy; //Interface
  typedef void* IWSDiscoveryProvider; //Interface
  typedef void* IWSDiscoveryPublisher; //Interface
  typedef void* IWSDOutboundAttachment; //Interface
  typedef void* IWSDHttpMessageParameters; //Interface
  typedef void* IWSDUdpMessageParameters; //Interface
  typedef struct WSD_LOCALIZED_STRING {
    WCHAR* lang;
    WCHAR* String;
  } WSD_LOCALIZED_STRING;
  typedef struct WSD_LOCALIZED_STRING_LIST {
    LPVOID Next;
    WSD_LOCALIZED_STRING* Element;
  } WSD_LOCALIZED_STRING_LIST;
  typedef struct WSDXML_NAMESPACE {
    WCHAR* Uri;
    WCHAR* PreferredPrefix;
    LPVOID Names;
    WORD NamesCount;
    WORD Encoding;
  } WSDXML_NAMESPACE;
  typedef struct WSDXML_NAME {
    WSDXML_NAMESPACE* Space;
    WCHAR* LocalName;
  } WSDXML_NAME;
  typedef struct WSD_SOAP_FAULT_SUBCODE {
    WSDXML_NAME* Value;
    LPVOID Subcode;
  } WSD_SOAP_FAULT_SUBCODE;
  typedef UINT WINAPI_WSDXML_NODE_TYPE; //Alias
  static const WINAPI_WSDXML_NODE_TYPE ElementType = 0;
  static const WINAPI_WSDXML_NODE_TYPE TextType = 1;
  typedef struct WSDXML_NODE {
    WINAPI_WSDXML_NODE_TYPE Type;
    LPVOID Parent;
    LPVOID Next;
  } WSDXML_NODE;
  typedef struct WSDXML_ATTRIBUTE {
    LPVOID Element;
    LPVOID Next;
    WSDXML_NAME* Name;
    WCHAR* Value;
  } WSDXML_ATTRIBUTE;
  typedef struct WSDXML_PREFIX_MAPPING {
    DWORD Refs;
    LPVOID Next;
    WSDXML_NAMESPACE* Space;
    WCHAR* Prefix;
  } WSDXML_PREFIX_MAPPING;
  typedef struct WSDXML_ELEMENT {
    WSDXML_NODE Node;
    WSDXML_NAME* Name;
    WSDXML_ATTRIBUTE* FirstAttribute;
    WSDXML_NODE* FirstChild;
    WSDXML_PREFIX_MAPPING* PrefixMappings;
  } WSDXML_ELEMENT;
  typedef UINT WSD_CONFIG_PARAM_TYPE; //Alias
  static const WSD_CONFIG_PARAM_TYPE WSD_CONFIG_MAX_INBOUND_MESSAGE_SIZE = 1;
  static const WSD_CONFIG_PARAM_TYPE WSD_CONFIG_MAX_OUTBOUND_MESSAGE_SIZE = 2;
  static const WSD_CONFIG_PARAM_TYPE WSD_SECURITY_SSL_CERT_FOR_CLIENT_AUTH = 3;
  static const WSD_CONFIG_PARAM_TYPE WSD_SECURITY_SSL_SERVER_CERT_VALIDATION = 4;
  static const WSD_CONFIG_PARAM_TYPE WSD_SECURITY_SSL_CLIENT_CERT_VALIDATION = 5;
  static const WSD_CONFIG_PARAM_TYPE WSD_SECURITY_SSL_NEGOTIATE_CLIENT_CERT = 6;
  static const WSD_CONFIG_PARAM_TYPE WSD_SECURITY_COMPACTSIG_SIGNING_CERT = 7;
  static const WSD_CONFIG_PARAM_TYPE WSD_SECURITY_COMPACTSIG_VALIDATION = 8;
  static const WSD_CONFIG_PARAM_TYPE WSD_CONFIG_HOSTING_ADDRESSES = 9;
  static const WSD_CONFIG_PARAM_TYPE WSD_CONFIG_DEVICE_ADDRESSES = 10;
  typedef struct WSD_CONFIG_PARAM {
    WSD_CONFIG_PARAM_TYPE configParamType;
    PVOID pConfigData;
    DWORD dwConfigDataSize;
  } WSD_CONFIG_PARAM;
  typedef struct WSD_SOAP_FAULT_CODE {
    WSDXML_NAME* Value;
    WSD_SOAP_FAULT_SUBCODE* Subcode;
  } WSD_SOAP_FAULT_CODE;
  typedef struct WSD_SOAP_FAULT_REASON {
    WSD_LOCALIZED_STRING_LIST* Text;
  } WSD_SOAP_FAULT_REASON;
  typedef struct WSD_SOAP_FAULT {
    WSD_SOAP_FAULT_CODE* Code;
    WSD_SOAP_FAULT_REASON* Reason;
    WCHAR* Node;
    WCHAR* Role;
    WSDXML_ELEMENT* Detail;
  } WSD_SOAP_FAULT;
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
ffi.load( 'Wsdapi.dll' )

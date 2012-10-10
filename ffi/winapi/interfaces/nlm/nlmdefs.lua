require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IEnumNetworkConnections; //Interface
  typedef void* IEnumNetworks; //Interface
  typedef void* INetwork; //Interface
  typedef void* INetworkConnection; //Interface
  typedef void* INetworkConnectionEvents; //Interface
  typedef void* INetworkEvents; //Interface
  typedef void* INetworkListManager; //Interface
  typedef void* INetworkListManagerEvents; //Interface
  typedef UINT NLM_ENUM_NETWORK; //Alias
  static const NLM_ENUM_NETWORK NLM_ENUM_NETWORK_CONNECTED = 0x1;
  static const NLM_ENUM_NETWORK NLM_ENUM_NETWORK_DISCONNECTED = 0x2;
  static const NLM_ENUM_NETWORK NLM_ENUM_NETWORK_ALL = 0x3;
  typedef UINT NLM_CONNECTION_PROPERTY_CHANGE; //Alias
  static const NLM_CONNECTION_PROPERTY_CHANGE NLM_CONNECTION_PROPERTY_CHANGE_AUTHENTICATION = 0x1;
  typedef UINT NLM_NETWORK_CATEGORY; //Alias
  static const NLM_NETWORK_CATEGORY NLM_NETWORK_CATEGORY_PUBLIC = 0;
  static const NLM_NETWORK_CATEGORY NLM_NETWORK_CATEGORY_PRIVATE = 0x1;
  static const NLM_NETWORK_CATEGORY NLM_NETWORK_CATEGORY_DOMAIN_AUTHENTICATED = 0x2;
  typedef UINT NLM_CONNECTIVITY; //Alias
  typedef UINT NLM_DOMAIN_TYPE; //Alias
  static const NLM_DOMAIN_TYPE NLM_DOMAIN_TYPE_NON_DOMAIN_NETWORK = 0;
  static const NLM_DOMAIN_TYPE NLM_DOMAIN_TYPE_DOMAIN_NETWORK = 0x1;
  static const NLM_DOMAIN_TYPE NLM_DOMAIN_TYPE_DOMAIN_AUTHENTICATED = 0x2;
  typedef UINT NLM_NETWORK_PROPERTY_CHANGE; //Alias
  static const NLM_NETWORK_PROPERTY_CHANGE NLM_NETWORK_PROPERTY_CHANGE_CONNECTION = 0x1;
  static const NLM_NETWORK_PROPERTY_CHANGE NLM_NETWORK_PROPERTY_CHANGE_DESCRIPTION = 0x2;
  static const NLM_NETWORK_PROPERTY_CHANGE NLM_NETWORK_PROPERTY_CHANGE_NAME = 0x4;
  static const NLM_NETWORK_PROPERTY_CHANGE NLM_NETWORK_PROPERTY_CHANGE_ICON = 0x8;
  static const NLM_NETWORK_PROPERTY_CHANGE NLM_NETWORK_PROPERTY_CHANGE_CATEGORY_VALUE = 0x10;
]]

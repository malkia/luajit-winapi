require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* INetFwAuthorizedApplication; //Interface
  typedef void* INetFwAuthorizedApplications; //Interface
  typedef void* INetFwIcmpSettings; //Interface
  typedef void* INetFwMgr; //Interface
  typedef void* INetFwOpenPort; //Interface
  typedef void* INetFwOpenPorts; //Interface
  typedef void* INetFwPolicy; //Interface
  typedef void* INetFwPolicy2; //Interface
  typedef void* INetFwProduct; //Interface
  typedef void* INetFwProducts; //Interface
  typedef void* INetFwProfile; //Interface
  typedef void* INetFwRemoteAdminSettings; //Interface
  typedef void* INetFwRule; //Interface
  typedef void* INetFwRule2; //Interface
  typedef void* INetFwRules; //Interface
  typedef void* INetFwService; //Interface
  typedef void* INetFwServiceRestriction; //Interface
  typedef void* INetFwServices; //Interface
  typedef enum NET_FW_IP_VERSION {
    NET_FW_IP_VERSION_V4 = 0,
    NET_FW_IP_VERSION_V6 = 1,
    NET_FW_IP_VERSION_ANY = 2,
  } NET_FW_IP_VERSION;
  typedef enum NET_FW_SCOPE {
    NET_FW_SCOPE_ALL = 0,
    NET_FW_SCOPE_LOCAL_SUBNET = 1,
    NET_FW_SCOPE_CUSTOM = 2,
  } NET_FW_SCOPE;
  typedef enum NET_FW_PROFILE_TYPE {
    NET_FW_PROFILE_DOMAIN = 0,
    NET_FW_PROFILE_STANDARD = 1,
    NET_FW_PROFILE_CURRENT = 2,
  } NET_FW_PROFILE_TYPE;
  typedef enum NET_FW_IP_PROTOCOL {
    NET_FW_IP_PROTOCOL_TCP = 6,
    NET_FW_IP_PROTOCOL_UDP = 17,
    NET_FW_IP_PROTOCOL_ANY = 256,
  } NET_FW_IP_PROTOCOL;
  typedef UINT NET_FW_PROFILE_TYPE2; //Alias
  typedef enum NET_FW_MODIFY_STATE {
    NET_FW_MODIFY_STATE_OK = 0,
    NET_FW_MODIFY_STATE_GP_OVERRIDE = 1,
    NET_FW_MODIFY_STATE_INBOUND_BLOCKED = 2,
  } NET_FW_MODIFY_STATE;
  typedef enum NET_FW_RULE_DIRECTION {
    NET_FW_RULE_DIR_IN = 1,
    NET_FW_RULE_DIR_OUT = 2,
  } NET_FW_RULE_DIRECTION;
  typedef enum NET_FW_ACTION {
    NET_FW_ACTION_BLOCK = 0,
    NET_FW_ACTION_ALLOW = 1,
  } NET_FW_ACTION;
  typedef enum NET_FW_SERVICE_TYPE {
    NET_FW_SERVICE_FILE_AND_PRINT = 0,
    NET_FW_SERVICE_UPNP = 1,
    NET_FW_SERVICE_REMOTE_DESKTOP = 2,
    NET_FW_SERVICE_NONE = 3,
  } NET_FW_SERVICE_TYPE;
]]

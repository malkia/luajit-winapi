require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/shell' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IConnectableCredentialProviderCredential; //Interface
  typedef void* ICredentialProvider; //Interface
  typedef void* ICredentialProviderCredential; //Interface
  typedef void* ICredentialProviderCredentialEvents; //Interface
  typedef void* ICredentialProviderEvents; //Interface
  typedef void* ICredentialProviderFilter; //Interface
  typedef void* IQueryContinueWithStatus; //Interface
  typedef UINT CREDENTIAL_PROVIDER_FIELD_STATE; //Alias
  static const UINT CPFS_HIDDEN = 0;
  static const UINT CPFS_DISPLAY_IN_SELECTED_TILE = 1;
  static const UINT CPFS_DISPLAY_IN_DESELECTED_TILE = 2;
  static const UINT CPFS_DISPLAY_IN_BOTH = 3;
  typedef UINT CREDENTIAL_PROVIDER_GET_SERIALIZATION_RESPONSE; //Alias
  static const UINT CPGSR_NO_CREDENTIAL_NOT_FINISHED = 0;
  static const UINT CPGSR_NO_CREDENTIAL_FINISHED = 1;
  static const UINT CPGSR_RETURN_CREDENTIAL_FINISHED = 2;
  typedef UINT CREDENTIAL_PROVIDER_STATUS_ICON; //Alias
  static const UINT CPSI_NONE = 0;
  static const UINT CPSI_ERROR = 1;
  static const UINT CPSI_WARNING = 2;
  static const UINT CPSI_SUCCESS = 3;
  typedef UINT CREDENTIAL_PROVIDER_USAGE_SCENARIO; //Alias
  static const UINT CPUS_INVALID = 0;
  static const UINT CPUS_LOGON = 1;
  static const UINT CPUS_UNLOCK_WORKSTATION = 2;
  static const UINT CPUS_CHANGE_PASSWORD = 3;
  static const UINT CPUS_CREDUI = 4;
  static const UINT CPUS_PLAP = 5;
  typedef UINT CREDENTIAL_PROVIDER_FIELD_INTERACTIVE_STATE; //Alias
  static const UINT CPFIS_NONE = 0;
  static const UINT CPFIS_READONLY = 1;
  static const UINT CPFIS_DISABLED = 2;
  static const UINT CPFIS_FOCUSED = 3;
  typedef struct CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION {
    ULONG ulAuthenticationPackage;
    GUID clsidCredentialProvider;
    ULONG cbSerialization;
    byte* rgbSerialization;
  } CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION;
  typedef UINT CREDENTIAL_PROVIDER_FIELD_TYPE; //Alias
  static const UINT CPFT_INVALID = 0;
  static const UINT CPFT_LARGE_TEXT = 1;
  static const UINT CPFT_SMALL_TEXT = 2;
  static const UINT CPFT_COMMAND_LINK = 3;
  static const UINT CPFT_EDIT_TEXT = 4;
  static const UINT CPFT_PASSWORD_TEXT = 5;
  static const UINT CPFT_TILE_IMAGE = 6;
  static const UINT CPFT_CHECKBOX = 7;
  static const UINT CPFT_COMBOBOX = 8;
  static const UINT CPFT_SUBMIT_BUTTON = 9;
  typedef struct CREDENTIAL_PROVIDER_FIELD_DESCRIPTOR {
    DWORD dwFieldID;
    CREDENTIAL_PROVIDER_FIELD_TYPE cpft;
    LPWSTR pszLabel;
    GUID guidFieldType;
  } CREDENTIAL_PROVIDER_FIELD_DESCRIPTOR;
]]

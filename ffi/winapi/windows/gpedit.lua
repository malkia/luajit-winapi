require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UINT GROUP_POLICY_OBJECT_TYPE; //Alias
  static const GROUP_POLICY_OBJECT_TYPE GPOTypeLocal = 0;
  static const GROUP_POLICY_OBJECT_TYPE GPOTypeRemote = 1;
  static const GROUP_POLICY_OBJECT_TYPE GPOTypeDS = 2;
  static const GROUP_POLICY_OBJECT_TYPE GPOTypeLocalUser = 3;
  static const GROUP_POLICY_OBJECT_TYPE GPOTypeLocalGroup = 4;
  typedef UINT GROUP_POLICY_HINT_TYPE; //Alias
  static const GROUP_POLICY_HINT_TYPE GPHintUnknown = 0;
  static const GROUP_POLICY_HINT_TYPE GPHintMachine = 1;
  static const GROUP_POLICY_HINT_TYPE GPHintSite = 2;
  static const GROUP_POLICY_HINT_TYPE GPHintDomain = 3;
  static const GROUP_POLICY_HINT_TYPE GPHintOrganizationalUnit = 4;
  typedef struct GPOBROWSEINFO {
    DWORD dwSize;
    DWORD dwFlags;
    HWND hwndOwner;
    LPOLESTR lpTitle;
    LPOLESTR lpInitialOU;
    LPOLESTR lpDSPath;
    DWORD dwDSPathSize;
    LPOLESTR lpName;
    DWORD dwNameSize;
    GROUP_POLICY_OBJECT_TYPE gpoType;
    GROUP_POLICY_HINT_TYPE gpoHint;
  } GPOBROWSEINFO;
  typedef GPOBROWSEINFO *LPGPOBROWSEINFO; //Pointer
  HRESULT BrowseForGPO(      LPGPOBROWSEINFO lpBrowseInfo);
  HRESULT CreateGPOLink(     LPOLESTR lpGPO, LPOLESTR lpContainer, BOOL fHighPriority);
  HRESULT DeleteAllGPOLinks( LPOLESTR lpContainer);
  HRESULT DeleteGPOLink(     LPOLESTR lpGPO, LPOLESTR lpContainer);
  HRESULT ExportRSoPData(    LPOLESTR lpNameSpace, LPOLESTR lpFileName);
  HRESULT ImportRSoPData(    LPOLESTR lpNameSpace, LPOLESTR lpFileName);
]]
ffi.load( 'Gpedit.dll' )

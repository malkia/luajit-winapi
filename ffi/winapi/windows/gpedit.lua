require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UINT GROUP_POLICY_OBJECT_TYPE; //Alias
  static const UINT GPOTypeLocal = 0;
  static const UINT GPOTypeRemote = 1;
  static const UINT GPOTypeDS = 2;
  static const UINT GPOTypeLocalUser = 3;
  static const UINT GPOTypeLocalGroup = 4;
  typedef UINT GROUP_POLICY_HINT_TYPE; //Alias
  static const UINT GPHintUnknown = 0;
  static const UINT GPHintMachine = 1;
  static const UINT GPHintSite = 2;
  static const UINT GPHintDomain = 3;
  static const UINT GPHintOrganizationalUnit = 4;
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
return ffi.load( 'Gpedit.dll' )

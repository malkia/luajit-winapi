require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef struct NETCONNECTINFOSTRUCT {
    DWORD cbStructure;
    DWORD dwFlags;
    DWORD dwSpeed;
    DWORD dwDelay;
    DWORD dwOptDataSize;
  } NETCONNECTINFOSTRUCT;
  typedef NETCONNECTINFOSTRUCT *LPNETCONNECTINFOSTRUCT; //Pointer
  typedef struct DISCDLGSTRUCT {
    DWORD cbStructure;
    HWND hwndOwner;
    LPTSTR lpLocalName;
    LPTSTR lpRemoteName;
    DWORD dwFlags;
  } DISCDLGSTRUCT;
  typedef DISCDLGSTRUCT *LPDISCDLGSTRUCT; //Pointer
  typedef struct NETINFOSTRUCT {
    DWORD cbStructure;
    DWORD dwProviderVersion;
    DWORD dwStatus;
    DWORD dwCharacteristics;
    ULONG_PTR dwHandle;
    WORD wNetType;
    DWORD dwPrinters;
    DWORD dwDrives;
  } NETINFOSTRUCT;
  typedef NETINFOSTRUCT *LPNETINFOSTRUCT; //Pointer
  typedef DWORD ResourceScope; //Alias
  static const ResourceScope RESOURCE_CONNECTED = 0x00000001;
  static const ResourceScope RESOURCE_GLOBALNET = 0x00000002;
  static const ResourceScope RESOURCE_REMEMBERED = 0x00000003;
  static const ResourceScope RESOURCE_RECENT = 0x00000004;
  static const ResourceScope RESOURCE_CONTEXT = 0x00000005;
  typedef DWORD RESOURCETYPE; //Alias
  typedef DWORD RESOURCEUSAGE; //Alias
  typedef DWORD UniversalInfoLevel; //Alias
  static const UniversalInfoLevel UNIVERSAL_NAME_INFO_LEVEL = 0x00000001;
  static const UniversalInfoLevel REMOTE_NAME_INFO_LEVEL = 0x00000002;
  typedef DWORD ConnectFlags; //Alias
  typedef DWORD RESOURCEDISPLAYTYPE; //Alias
  static const RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_GENERIC = 0x00000000;
  static const RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_DOMAIN = 0x00000001;
  static const RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_SERVER = 0x00000002;
  static const RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_SHARE = 0x00000003;
  static const RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_FILE = 0x00000004;
  static const RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_GROUP = 0x00000005;
  static const RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_NETWORK = 0x00000006;
  static const RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_ROOT = 0x00000007;
  static const RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_SHAREADMIN = 0x00000008;
  static const RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_DIRECTORY = 0x00000009;
  static const RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_TREE = 0x0000000A;
  static const RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_NDSCONTAINER = 0x0000000B;
  typedef struct NETRESOURCE {
    ResourceScope dwScope;
    RESOURCETYPE dwType;
    RESOURCEDISPLAYTYPE dwDisplayType;
    RESOURCEUSAGE dwUsage;
    LPTSTR lpLocalName;
    LPTSTR lpRemoteName;
    LPTSTR lpComment;
    LPTSTR lpProvider;
  } NETRESOURCE;
  typedef NETRESOURCE *LPNETRESOURCE; //Pointer
  typedef DWORD CONNDLG; //Alias
  typedef struct CONNECTDLGSTRUCT {
    DWORD cbStructure;
    HWND hwndOwner;
    LPNETRESOURCE lpConnRes;
    CONNDLG dwFlags;
    DWORD dwDevNum;
  } CONNECTDLGSTRUCT;
  typedef CONNECTDLGSTRUCT *LPCONNECTDLGSTRUCT; //Pointer
  void       WNetSetLastError(                 DWORD err, LPTSTR lpError, LPTSTR lpProvider);
  ERROR_CODE MultinetGetConnectionPerformance( LPNETRESOURCE lpNetResource, LPNETCONNECTINFOSTRUCT lpNetConnectInfoStruct);
  ERROR_CODE WNetAddConnection2(               LPNETRESOURCE lpNetResource, LPCTSTR lpPassword, LPCTSTR lpUsername, ConnectFlags dwFlags);
  ERROR_CODE WNetAddConnection3(               HWND hwndOwner, LPNETRESOURCE lpNetResource, LPTSTR lpPassword, LPTSTR lpUserName, ConnectFlags dwFlags);
  ERROR_CODE WNetCancelConnection(             LPCTSTR lpName, BOOL fForce);
  ERROR_CODE WNetCancelConnection2(            LPCTSTR lpName, ConnectFlags dwFlags, BOOL fForce);
  ERROR_CODE WNetCloseEnum(                    HANDLE hEnum);
  ERROR_CODE WNetConnectionDialog(             HWND hwnd, RESOURCETYPE dwType);
  ERROR_CODE WNetConnectionDialog1(            LPCONNECTDLGSTRUCT lpConnDlgStruct);
  ERROR_CODE WNetDisconnectDialog(             HWND hwnd, RESOURCETYPE dwType);
  ERROR_CODE WNetDisconnectDialog1(            LPDISCDLGSTRUCT lpConnDlgStruct);
  ERROR_CODE WNetEnumResource(                 HANDLE hEnum, LPDWORD lpcCount, LPNETRESOURCE lpBuffer, LPDWORD lpBufferSize);
  ERROR_CODE WNetGetConnection(                LPCTSTR lpLocalName, LPTSTR lpRemoteName, LPDWORD lpnLength);
  ERROR_CODE WNetGetLastError(                 LPDWORD lpError, LPTSTR lpErrorBuf, DWORD nErrorBufSize, LPTSTR lpNameBuf, DWORD nNameBufSize);
  ERROR_CODE WNetGetNetworkInformation(        LPCTSTR lpProvider, LPNETINFOSTRUCT lpNetInfoStruct);
  ERROR_CODE WNetGetProviderName(              DWORD dwNetType, LPTSTR lpProviderName, LPDWORD lpBufferSize);
  ERROR_CODE WNetGetResourceInformation(       LPNETRESOURCE lpNetResource, LPVOID lpBuffer, LPDWORD lpcbBuffer, LPTSTR* lplpSystem);
  ERROR_CODE WNetGetResourceParent(            LPNETRESOURCE lpNetResource, LPNETRESOURCE lpBuffer, LPDWORD lpcbBuffer);
  ERROR_CODE WNetGetUniversalName(             LPCTSTR lpLocalPath, UniversalInfoLevel dwInfoLevel, LPVOID lpBuffer, LPDWORD lpBufferSize);
  ERROR_CODE WNetGetUser(                      LPCTSTR lpName, LPTSTR lpUserName, LPDWORD lpnLength);
  ERROR_CODE WNetOpenEnum(                     ResourceScope dwScope, RESOURCETYPE dwType, RESOURCEUSAGE dwUsage, LPNETRESOURCE lpNetResource, LPHANDLE lphEnum);
  ERROR_CODE WNetRestoreConnectionW(           HWND hwndParent, LPCWSTR lpDevice, BOOL fUseUI);
  ERROR_CODE WNetUseConnection(                HWND hwndOwner, LPNETRESOURCE lpNetResource, LPCTSTR lpPassword, LPCTSTR lpUserID, ConnectFlags dwFlags, LPTSTR lpAccessName, LPDWORD lpBufferSize, LPDWORD lpResult);
  ERROR_CODE WNetAddConnection(                LPCTSTR lpRemoteName, LPCTSTR lpPassword, LPCTSTR lpLocalName);
]]
ffi.load( 'Mpr.dll' )

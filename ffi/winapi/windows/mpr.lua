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
  typedef DWORD WINAPI_ResourceScope; //Alias
  static const WINAPI_ResourceScope RESOURCE_CONNECTED = 0x00000001;
  static const WINAPI_ResourceScope RESOURCE_GLOBALNET = 0x00000002;
  static const WINAPI_ResourceScope RESOURCE_REMEMBERED = 0x00000003;
  static const WINAPI_ResourceScope RESOURCE_RECENT = 0x00000004;
  static const WINAPI_ResourceScope RESOURCE_CONTEXT = 0x00000005;
  typedef DWORD WINAPI_RESOURCETYPE; //Alias
  typedef DWORD WINAPI_RESOURCEUSAGE; //Alias
  typedef DWORD WINAPI_UniversalInfoLevel; //Alias
  static const WINAPI_UniversalInfoLevel UNIVERSAL_NAME_INFO_LEVEL = 0x00000001;
  static const WINAPI_UniversalInfoLevel REMOTE_NAME_INFO_LEVEL = 0x00000002;
  typedef DWORD WINAPI_ConnectFlags; //Alias
  typedef DWORD WINAPI_RESOURCEDISPLAYTYPE; //Alias
  static const WINAPI_RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_GENERIC = 0x00000000;
  static const WINAPI_RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_DOMAIN = 0x00000001;
  static const WINAPI_RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_SERVER = 0x00000002;
  static const WINAPI_RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_SHARE = 0x00000003;
  static const WINAPI_RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_FILE = 0x00000004;
  static const WINAPI_RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_GROUP = 0x00000005;
  static const WINAPI_RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_NETWORK = 0x00000006;
  static const WINAPI_RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_ROOT = 0x00000007;
  static const WINAPI_RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_SHAREADMIN = 0x00000008;
  static const WINAPI_RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_DIRECTORY = 0x00000009;
  static const WINAPI_RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_TREE = 0x0000000A;
  static const WINAPI_RESOURCEDISPLAYTYPE RESOURCEDISPLAYTYPE_NDSCONTAINER = 0x0000000B;
  typedef struct NETRESOURCE {
    WINAPI_ResourceScope dwScope;
    WINAPI_RESOURCETYPE dwType;
    WINAPI_RESOURCEDISPLAYTYPE dwDisplayType;
    WINAPI_RESOURCEUSAGE dwUsage;
    LPTSTR lpLocalName;
    LPTSTR lpRemoteName;
    LPTSTR lpComment;
    LPTSTR lpProvider;
  } NETRESOURCE;
  typedef NETRESOURCE *LPNETRESOURCE; //Pointer
  typedef DWORD WINAPI_CONNDLG; //Alias
  typedef struct CONNECTDLGSTRUCT {
    DWORD cbStructure;
    HWND hwndOwner;
    LPNETRESOURCE lpConnRes;
    WINAPI_CONNDLG dwFlags;
    DWORD dwDevNum;
  } CONNECTDLGSTRUCT;
  typedef CONNECTDLGSTRUCT *LPCONNECTDLGSTRUCT; //Pointer
  void              WNetSetLastError(                 DWORD err, LPTSTR lpError, LPTSTR lpProvider);
  WINAPI_ERROR_CODE MultinetGetConnectionPerformance( LPNETRESOURCE lpNetResource, LPNETCONNECTINFOSTRUCT lpNetConnectInfoStruct);
  WINAPI_ERROR_CODE WNetAddConnection2(               LPNETRESOURCE lpNetResource, LPCTSTR lpPassword, LPCTSTR lpUsername, WINAPI_ConnectFlags dwFlags);
  WINAPI_ERROR_CODE WNetAddConnection3(               HWND hwndOwner, LPNETRESOURCE lpNetResource, LPTSTR lpPassword, LPTSTR lpUserName, WINAPI_ConnectFlags dwFlags);
  WINAPI_ERROR_CODE WNetCancelConnection(             LPCTSTR lpName, BOOL fForce);
  WINAPI_ERROR_CODE WNetCancelConnection2(            LPCTSTR lpName, WINAPI_ConnectFlags dwFlags, BOOL fForce);
  WINAPI_ERROR_CODE WNetCloseEnum(                    HANDLE hEnum);
  WINAPI_ERROR_CODE WNetConnectionDialog(             HWND hwnd, WINAPI_RESOURCETYPE dwType);
  WINAPI_ERROR_CODE WNetConnectionDialog1(            LPCONNECTDLGSTRUCT lpConnDlgStruct);
  WINAPI_ERROR_CODE WNetDisconnectDialog(             HWND hwnd, WINAPI_RESOURCETYPE dwType);
  WINAPI_ERROR_CODE WNetDisconnectDialog1(            LPDISCDLGSTRUCT lpConnDlgStruct);
  WINAPI_ERROR_CODE WNetEnumResource(                 HANDLE hEnum, LPDWORD lpcCount, LPNETRESOURCE lpBuffer, LPDWORD lpBufferSize);
  WINAPI_ERROR_CODE WNetGetConnection(                LPCTSTR lpLocalName, LPTSTR lpRemoteName, LPDWORD lpnLength);
  WINAPI_ERROR_CODE WNetGetLastError(                 LPDWORD lpError, LPTSTR lpErrorBuf, DWORD nErrorBufSize, LPTSTR lpNameBuf, DWORD nNameBufSize);
  WINAPI_ERROR_CODE WNetGetNetworkInformation(        LPCTSTR lpProvider, LPNETINFOSTRUCT lpNetInfoStruct);
  WINAPI_ERROR_CODE WNetGetProviderName(              DWORD dwNetType, LPTSTR lpProviderName, LPDWORD lpBufferSize);
  WINAPI_ERROR_CODE WNetGetResourceInformation(       LPNETRESOURCE lpNetResource, LPVOID lpBuffer, LPDWORD lpcbBuffer, LPTSTR* lplpSystem);
  WINAPI_ERROR_CODE WNetGetResourceParent(            LPNETRESOURCE lpNetResource, LPNETRESOURCE lpBuffer, LPDWORD lpcbBuffer);
  WINAPI_ERROR_CODE WNetGetUniversalName(             LPCTSTR lpLocalPath, WINAPI_UniversalInfoLevel dwInfoLevel, LPVOID lpBuffer, LPDWORD lpBufferSize);
  WINAPI_ERROR_CODE WNetGetUser(                      LPCTSTR lpName, LPTSTR lpUserName, LPDWORD lpnLength);
  WINAPI_ERROR_CODE WNetOpenEnum(                     WINAPI_ResourceScope dwScope, WINAPI_RESOURCETYPE dwType, WINAPI_RESOURCEUSAGE dwUsage, LPNETRESOURCE lpNetResource, LPHANDLE lphEnum);
  WINAPI_ERROR_CODE WNetRestoreConnectionW(           HWND hwndParent, LPCWSTR lpDevice, BOOL fUseUI);
  WINAPI_ERROR_CODE WNetUseConnection(                HWND hwndOwner, LPNETRESOURCE lpNetResource, LPCTSTR lpPassword, LPCTSTR lpUserID, WINAPI_ConnectFlags dwFlags, LPTSTR lpAccessName, LPDWORD lpBufferSize, LPDWORD lpResult);
  WINAPI_ERROR_CODE WNetAddConnection(                LPCTSTR lpRemoteName, LPCTSTR lpPassword, LPCTSTR lpLocalName);
]]
return ffi.load( 'Mpr.dll' )

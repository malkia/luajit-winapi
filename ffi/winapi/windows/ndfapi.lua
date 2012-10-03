require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/sockets' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef PVOID NDFHANDLE; //Alias
  typedef UINT ATTRIBUTE_TYPE; //Alias
  static const UINT AT_INVALID = 0;
  static const UINT AT_BOOLEAN = 1;
  static const UINT AT_INT8 = 2;
  static const UINT AT_UINT8 = 3;
  static const UINT AT_INT16 = 4;
  static const UINT AT_UINT16 = 5;
  static const UINT AT_INT32 = 6;
  static const UINT AT_UINT32 = 7;
  static const UINT AT_INT64 = 8;
  static const UINT AT_UINT64 = 9;
  static const UINT AT_STRING = 10;
  static const UINT AT_GUID = 11;
  static const UINT AT_LIFE_TIME = 12;
  static const UINT AT_SOCKADDR = 13;
  static const UINT AT_OCTET_STRING = 14;
  typedef struct OCTET_STRING {
    DWORD dwLength;
    BYTE* lpValue;
  } OCTET_STRING;
  typedef struct LIFE_TIME {
    FILETIME startTime;
    FILETIME endTime;
  } LIFE_TIME;
  typedef struct DIAG_SOCKADDR {
    USHORT family;
    CHAR data[126];
  } DIAG_SOCKADDR;
  typedef union WINAPI_HELPER_ATTRIBUTE_u {
    BOOL Boolean;
    char Char;
    byte Byte;
    short Short;
    WORD Word;
    int Int;
    DWORD DWord;
    LONGLONG Int64;
    ULONGLONG UInt64;
    LPWSTR PWStr;
    GUID Guid;
    LIFE_TIME LifeTime;
    DIAG_SOCKADDR Address;
    OCTET_STRING OctetString;
  } WINAPI_HELPER_ATTRIBUTE_u;
  typedef struct HELPER_ATTRIBUTE {
    LPWSTR pwszName;
    ATTRIBUTE_TYPE type;
    WINAPI_HELPER_ATTRIBUTE_u ;
  } HELPER_ATTRIBUTE;
  HRESULT NdfCloseIncident(              NDFHANDLE handle);
  HRESULT NdfCreateConnectivityIncident( NDFHANDLE* handle);
  HRESULT NdfCreateDNSIncident(          LPCWSTR hostname, WORD querytype, NDFHANDLE* handle);
  HRESULT NdfCreateIncident(             LPCWSTR helperClassName, ULONG celt, HELPER_ATTRIBUTE* attributes, NDFHANDLE* handle);
  HRESULT NdfCreateSharingIncident(      LPCWSTR sharename, NDFHANDLE* handle);
  HRESULT NdfCreateWebIncident(          LPCWSTR url, NDFHANDLE* handle);
  HRESULT NdfCreateWebIncidentEx(        LPCWSTR url, BOOL useWinHTTP, LPWSTR moduleName, NDFHANDLE* handle);
  HRESULT NdfCreateWinSockIncident(      SOCKET sock, LPCWSTR host, USHORT port, LPCWSTR appID, SID* userId, NDFHANDLE* handle);
  HRESULT NdfExecuteDiagnosis(           NDFHANDLE handle, HWND hwnd);
]]
return ffi.load( 'Ndfapi.dll' )

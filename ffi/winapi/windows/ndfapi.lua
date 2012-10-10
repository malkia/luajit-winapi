require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/sockets' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef PVOID NDFHANDLE; //Alias
  typedef UINT ATTRIBUTE_TYPE; //Alias
  static const ATTRIBUTE_TYPE AT_INVALID = 0;
  static const ATTRIBUTE_TYPE AT_BOOLEAN = 1;
  static const ATTRIBUTE_TYPE AT_INT8 = 2;
  static const ATTRIBUTE_TYPE AT_UINT8 = 3;
  static const ATTRIBUTE_TYPE AT_INT16 = 4;
  static const ATTRIBUTE_TYPE AT_UINT16 = 5;
  static const ATTRIBUTE_TYPE AT_INT32 = 6;
  static const ATTRIBUTE_TYPE AT_UINT32 = 7;
  static const ATTRIBUTE_TYPE AT_INT64 = 8;
  static const ATTRIBUTE_TYPE AT_UINT64 = 9;
  static const ATTRIBUTE_TYPE AT_STRING = 10;
  static const ATTRIBUTE_TYPE AT_GUID = 11;
  static const ATTRIBUTE_TYPE AT_LIFE_TIME = 12;
  static const ATTRIBUTE_TYPE AT_SOCKADDR = 13;
  static const ATTRIBUTE_TYPE AT_OCTET_STRING = 14;
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
    CHAR data_126_;
  } DIAG_SOCKADDR;
  typedef union HELPER_ATTRIBUTE_u {
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
  } HELPER_ATTRIBUTE_u;
  typedef struct HELPER_ATTRIBUTE {
    LPWSTR pwszName;
    ATTRIBUTE_TYPE type;
    HELPER_ATTRIBUTE_u ;
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
ffi.load( 'Ndfapi.dll' )

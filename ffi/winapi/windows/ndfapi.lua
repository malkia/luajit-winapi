require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/sockets' )
local ffi = require( 'ffi' )
ffi.cdef [[
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

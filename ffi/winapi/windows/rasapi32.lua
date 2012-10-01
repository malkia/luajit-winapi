require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/sockets" )
local ffi = require( "ffi" )
ffi.cdef [[
  DWORD RasClearConnectionStatistics( HRASCONN hRasConn);
  DWORD RasClearLinkStatistics(       HRASCONN hRasConn, DWORD dwSubEntry);
  DWORD RasConnectionNotification(    HRASCONN hrasconn, HANDLE hEvent, WINAPI_RasConnNotifyFlags dwFlags);
  DWORD RasCreatePhonebookEntry(      HWND hwnd, LPCTSTR lpszPhonebook);
  DWORD RasDeleteEntry(               LPCTSTR lpszPhonebook, LPCTSTR lpszEntry);
  DWORD RasDeleteSubEntry(            LPCTSTR lpszPhonebook, LPCTSTR lpszEntry, DWORD dwSubEntryId);
  DWORD RasDial(                      LPRASDIALEXTENSIONS lpRasDialExtensions, LPCTSTR lpszPhonebook, LPRASDIALPARAMS lpRasDialParams, DWORD dwNotifierType, LPVOID lpvNotifier, LPHRASCONN lphRasConn);
  DWORD RasEditPhonebookEntry(        HWND hwnd, LPCTSTR lpszPhonebook, LPCTSTR lpszEntryName);
  DWORD RasEnumAutodialAddresses(     LPTSTR* lppAddresses, LPDWORD lpdwcbAddresses, LPDWORD lpdwcAddresses);
  DWORD RasEnumConnections(           LPRASCONN lprasconn, LPDWORD lpcb, LPDWORD lpcConnections);
  DWORD RasEnumDevices(               LPRASDEVINFO lpRasDevInfo, LPDWORD lpcb, LPDWORD lpcDevices);
  DWORD RasEnumEntries(               LPCTSTR reserved, LPCTSTR lpszPhonebook, LPRASENTRYNAME lprasentryname, LPDWORD lpcb, LPDWORD lpcEntries);
  void  RasFreeEapUserIdentity(       LPRASEAPUSERIDENTITY pRasEapUserIdentity);
  DWORD RasGetAutodialAddress(        LPCTSTR lpszAddress, LPDWORD lpdwReserved, LPRASAUTODIALENTRY lpAutoDialEntries, LPDWORD lpdwcbAutoDialEntries, LPDWORD lpdwcAutoDialEntries);
  DWORD RasGetAutodialEnable(         DWORD dwDialingLocation, LPBOOL lpfEnabled);
  DWORD RasGetAutodialParam(          DWORD dwKey, LPVOID lpvValue, LPDWORD lpdwcbValue);
  DWORD RasGetConnectionStatistics(   HRASCONN hRasConn, RAS_STATS* lpStatistics);
  DWORD RasGetConnectStatus(          HRASCONN hrasconn, LPRASCONNSTATUS lprasconnstatus);
  DWORD RasGetCountryInfo(            LPRASCTRYINFO lpRasCtryInfo, LPDWORD lpdwSize);
  DWORD RasGetCredentials(            LPCTSTR lpszPhonebook, LPCTSTR lpszEntry, LPRASCREDENTIALS lpCredentials);
  DWORD RasGetCustomAuthData(         LPCWSTR pszPhonebook, LPCWSTR pszEntry, BYTE* pbCustomAuthData, DWORD* pdwSizeofCustomAuthData);
  DWORD RasGetEapUserData(            HANDLE hToken, LPCTSTR pszPhonebook, LPCTSTR pszEntry, BYTE* pbEapData, DWORD* pdwSizeofEapData);
  DWORD RasGetEapUserIdentity(        LPCSTR pszPhonebook, LPCSTR pszEntry, DWORD dwFlags, HWND hwnd, LPRASEAPUSERIDENTITY* ppRasEapUserIdentity);
  DWORD RasGetEntryDialParams(        LPCTSTR lpszPhonebook, LPRASDIALPARAMS lprasdialparams, LPBOOL lpfPassword);
  DWORD RasGetEntryProperties(        LPCTSTR lpszPhonebook, LPCTSTR lpszEntry, LPRASENTRY lpRasEntry, LPDWORD lpdwEntryInfoSize, LPBYTE lpbDeviceInfo, LPDWORD lpdwDeviceInfoSize);
  DWORD RasGetErrorString(            UINT uErrorValue, LPTSTR lpszErrorString, DWORD cBufSize);
  DWORD RasGetLinkStatistics(         HRASCONN hRasConn, DWORD dwSubEntry, RAS_STATS* lpStatistics);
  DWORD RasGetNapStatus(              HRASCONN hRasConn, LPRASNAPSTATE pNapState);
  DWORD RasGetProjectionInfo(         HRASCONN hrasconn, RASPROJECTION rasprojection, LPVOID lpprojection, LPDWORD lpcb);
  DWORD RasGetProjectionInfoEx(       HRASCONN Hrasconn, PRAS_PROJECTION_INFO pRasProjection, LPDWORD lpdwSize);
  DWORD RasGetQuarantineConnectionId( HRASCONN hRasConn, ConnectionId* lpConnectionId);
  DWORD RasGetSubEntryHandle(         HRASCONN hRasConn, DWORD dwSubEntry, LPHRASCONN lphRasConn);
  DWORD RasGetSubEntryProperties(     LPCTSTR lpszPhonebook, LPCTSTR lpszEntry, DWORD dwSubEntry, LPRASSUBENTRY lpRasSubEntry, LPDWORD lpdwcb, LPBYTE lpbDeviceConfig, LPDWORD lpcbDeviceConfig);
  DWORD RasHangUp(                    HRASCONN hrasconn);
  DWORD RasInvokeEapUI(               HRASCONN hRasConn, DWORD dwSubEntry, LPRASDIALEXTENSIONS lpExtensions, HWND hwnd);
  DWORD RasRenameEntry(               LPCTSTR lpszPhonebook, LPCTSTR lpszOldEntry, LPCTSTR lpszNewEntry);
  DWORD RasSetAutodialAddress(        LPCTSTR lpszAddress, DWORD dwReserved, LPRASAUTODIALENTRY lpAutoDialEntries, DWORD dwcbAutoDialEntries, DWORD dwcAutoDialEntries);
  DWORD RasSetAutodialEnable(         DWORD dwDialingLocation, BOOL fEnabled);
  DWORD RasSetAutodialParam(          DWORD dwKey, LPVOID lpvValue, DWORD dwcbValue);
  DWORD RasSetCredentials(            LPCTSTR lpszPhonebook, LPCTSTR lpszEntry, LPRASCREDENTIALS lpCredentials, BOOL fClearCredentials);
  DWORD RasSetCustomAuthData(         LPCWSTR pszPhonebook, LPCWSTR pszEntry, BYTE* pbCustomAuthData, DWORD dwSizeofCustomAuthData);
  DWORD RasSetEapUserData(            HANDLE hToken, LPCTSTR pszPhonebook, LPCTSTR pszEntry, BYTE* pbEapData, DWORD dwSizeofEapData);
  DWORD RasSetEntryDialParams(        LPCTSTR lpszPhonebook, LPRASDIALPARAMS lprasdialparams, BOOL fRemovePassword);
  DWORD RasSetEntryProperties(        LPCTSTR lpszPhonebook, LPCTSTR lpszEntry, LPRASENTRY lpRasEntry, DWORD dwEntryInfoSize, LPBYTE lpbDeviceInfo, DWORD dwDeviceInfoSize);
  DWORD RasSetSubEntryProperties(     LPCTSTR lpszPhonebook, LPCTSTR lpszEntry, DWORD dwSubEntry, LPRASSUBENTRY lpRasSubEntry, DWORD dwcbRasSubEntry, LPBYTE lpbDeviceConfig, DWORD dwcbDeviceConfig);
  DWORD RasUpdateConnection(          HRASCONN hrasconn, LPRASUPDATECONN lprasupdateconn);
  DWORD RasValidateEntryName(         LPCTSTR lpszPhonebook, LPCTSTR lpszEntry);
]]
return ffi.load( "Rasapi32.dll" )

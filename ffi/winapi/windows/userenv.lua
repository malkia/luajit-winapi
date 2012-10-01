require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/security" )
local ffi = require( "ffi" )
ffi.cdef [[
  HANDLE  EnterCriticalPolicySection(      BOOL bMachine);
  BOOL    FreeGPOList(                     PGROUP_POLICY_OBJECT pGPOList);
  DWORD   GetAppliedGPOList(               DWORD dwFlags, LPCTSTR pMachineName, PSID pSidUser, GUID* pGuidExtension, PGROUP_POLICY_OBJECT* ppGPOList);
  BOOL    GetGPOList(                      HANDLE hToken, LPCTSTR lpName, LPCTSTR lpHostName, LPCTSTR lpComputerName, DWORD dwFlags, PGROUP_POLICY_OBJECT* pGPOList);
  BOOL    LeaveCriticalPolicySection(      HANDLE hSection);
  DWORD   ProcessGroupPolicyCompleted(     REFGPEXTENSIONID extensionId, ASYNCCOMPLETIONHANDLE pAsyncHandle, DWORD dwStatus);
  DWORD   ProcessGroupPolicyCompletedEx(   REFGPEXTENSIONID extensionId, ASYNCCOMPLETIONHANDLE pAsyncHandle, DWORD dwStatus, HRESULT RsopStatus);
  BOOL    RefreshPolicy(                   BOOL bMachine);
  BOOL    RefreshPolicyEx(                 BOOL bMachine, DWORD dwOptions);
  BOOL    RegisterGPNotification(          HANDLE hEvent, BOOL bMachine);
  HRESULT RsopAccessCheckByType(           PSECURITY_DESCRIPTOR pSecurityDescriptor, PSID pPrincipalSelfSid, PRSOPTOKEN pRsopToken, DWORD dwDesiredAccessMask, POBJECT_TYPE_LIST pObjectTypeList, DWORD ObjectTypeListLength, PGENERIC_MAPPING pGenericMapping, PPRIVILEGE_SET pPrivilegeSet, LPDWORD pdwPrivilegeSetLength, LPDWORD pdwGrantedAccessMask, LPBOOL pbAccessStatus);
  HRESULT RsopFileAccessCheck(             LPWSTR pszFileName, PRSOPTOKEN pRsopToken, DWORD dwDesiredAccessMask, LPDWORD pdwGrantedAccessMask, LPBOOL pbAccessStatus);
  HRESULT RsopResetPolicySettingStatus(    DWORD dwFlags, IWbemServices* pServices, IWbemClassObject* pSettingInstance);
  HRESULT RsopSetPolicySettingStatus(      DWORD dwFlags, IWbemServices* pServices, IWbemClassObject* pSettingInstance, DWORD nInfo, POLICYSETTINGSTATUSINFO* pStatus);
  BOOL    UnregisterGPNotification(        HANDLE hEvent);
  BOOL    CreateEnvironmentBlock(          LPVOID* lpEnvironment, HANDLE hToken, BOOL bInherit);
  HRESULT CreateProfile(                   LPCWSTR pszUserSid, LPCWSTR pszUserName, LPWSTR pszProfilePath, DWORD cchProfilePath);
  BOOL    CreateUserProfileEx(             PSID pSid, LPCTSTR lpUserName, LPCTSTR lpUserHive, LPTSTR lpProfileDir, DWORD dwDirSize, BOOL bWin9xUpg);
  BOOL    DeleteProfile(                   LPCTSTR lpSidString, LPCTSTR lpProfilePath, LPCTSTR lpComputerName);
  BOOL    DestroyEnvironmentBlock(         LPVOID lpEnvironment);
  BOOL    ExpandEnvironmentStringsForUser( HANDLE hToken, LPCTSTR lpSrc, LPTSTR lpDest, DWORD dwSize);
  BOOL    GetAllUsersProfileDirectory(     LPTSTR lpProfileDir, LPDWORD lpcchSize);
  BOOL    GetDefaultUserProfileDirectory(  LPTSTR lpProfileDir, LPDWORD lpcchSize);
  BOOL    GetProfilesDirectory(            LPTSTR lpProfilesDir, LPDWORD lpcchSize);
  BOOL    GetProfileType(                  WINAPI_ProfileType* pdwFlags);
  BOOL    GetUserProfileDirectory(         HANDLE hToken, LPTSTR lpProfileDir, LPDWORD lpcchSize);
  BOOL    LoadUserProfile(                 HANDLE hToken, LPPROFILEINFO lpProfileInfo);
  BOOL    UnloadUserProfile(               HANDLE hToken, HANDLE hProfile);
]]
return ffi.load( "Userenv.dll" )

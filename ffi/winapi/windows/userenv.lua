require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/security' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IWbemServices; //Interface
  typedef void* IWbemClassObject; //Interface
  typedef GUID* REFGPEXTENSIONID; //Alias
  typedef UINT_PTR ASYNCCOMPLETIONHANDLE; //Alias
  typedef PVOID PRSOPTOKEN; //Alias
  typedef UINT GPO_LINK; //Alias
  static const GPO_LINK GPLinkUnknown = 0;
  static const GPO_LINK GPLinkMachine = 1;
  static const GPO_LINK GPLinkSite = 2;
  static const GPO_LINK GPLinkDomain = 3;
  static const GPO_LINK GPLinkOrganizationalUnit = 4;
  typedef DWORD WINAPI_GPO_FLAG; //Alias
  typedef struct GROUP_POLICY_OBJECT {
    WINAPI_GPO_FLAG dwOptions;
    DWORD dwVersion;
    LPTSTR lpDSPath;
    LPTSTR lpFileSysPath;
    LPTSTR lpDisplayName;
    TCHAR szGPOName[50];
    GPO_LINK GPOLink;
    LPARAM lParam;
    LPVOID pNext;
    LPVOID pPrev;
    LPTSTR lpExtensions;
    LPARAM lParam2;
    LPTSTR lpLink;
  } GROUP_POLICY_OBJECT;
  typedef GROUP_POLICY_OBJECT *PGROUP_POLICY_OBJECT; //Pointer
  typedef UINT SETTINGSTATUS; //Alias
  static const SETTINGSTATUS RSOPUnspecified = 0;
  static const SETTINGSTATUS RSOPApplied = 1;
  static const SETTINGSTATUS RSOPIgnored = 2;
  static const SETTINGSTATUS RSOPFailed = 3;
  static const SETTINGSTATUS RSOPSubsettingFailed = 4;
  typedef struct POLICYSETTINGSTATUSINFO {
    LPWSTR szKey;
    LPWSTR szEventSource;
    LPWSTR szEventLogName;
    DWORD dwEventID;
    DWORD dwErrorCode;
    SETTINGSTATUS status;
    SYSTEMTIME timeLogged;
  } POLICYSETTINGSTATUSINFO;
  typedef struct PROFILEINFO {
    DWORD dwSize;
    DWORD dwFlags;
    LPTSTR lpUserName;
    LPTSTR lpProfilePath;
    LPTSTR lpDefaultPath;
    LPTSTR lpServerName;
    LPTSTR lpPolicyPath;
    HANDLE hProfile;
  } PROFILEINFO;
  typedef PROFILEINFO *LPPROFILEINFO; //Pointer
  typedef DWORD WINAPI_ProfileType; //Alias
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
return ffi.load( 'Userenv.dll' )

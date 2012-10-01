require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  HRESULT WdsCliAuthorizeSession(                 HANDLE hSession, PWDS_CLI_CRED pCred);
  HRESULT WdsCliCancelTransfer(                   HANDLE hTransfer);
  HRESULT WdsCliClose(                            HANDLE Handle);
  HRESULT WdsCliCreateSession(                    PWSTR pwszServer, PWDS_CLI_CRED pCred, PHANDLE phSession);
  HRESULT WdsCliFindFirstImage(                   HANDLE hSession, PHANDLE phFindHandle);
  HRESULT WdsCliFindNextImage(                    HANDLE Handle);
  HRESULT WdsCliFreeStringArray(                  PWSTR* ppwszArray, ULONG ulCount);
  HRESULT WdsCliObtainDriverPackages(             HANDLE hImage, PWSTR* ppwszServerName, PWSTR** pppwszDriverPackages, ULONG* pulCount);
  HRESULT WdsCliGetEnumerationFlags(              HANDLE Handle, PDWORD pdwFlags);
  HRESULT WdsCliGetImageArchitecture(             HANDLE hIfh, PDWORD pdwValue);
  HRESULT WdsCliGetImageDescription(              HANDLE hIfh, PWSTR* ppwszValue);
  HRESULT WdsCliGetImageGroup(                    HANDLE hIfh, PWSTR* ppwszValue);
  HRESULT WdsCliGetImageHalName(                  HANDLE hIfh, PWSTR* ppwszValue);
  HRESULT WdsCliGetImageHandleFromFindHandle(     HANDLE FindHandle, PHANDLE phImageHandle);
  HRESULT WdsCliGetImageHandleFromTransferHandle( HANDLE hTransfer, PHANDLE phImageHandle);
  HRESULT WdsCliGetImageIndex(                    HANDLE hIfh, PDWORD pdwValue);
  HRESULT WdsCliGetImageLanguage(                 HANDLE hIfh, PWSTR* ppwszValue);
  HRESULT WdsCliGetImageLanguages(                HANDLE hIfh, PTSTR** pppszValues, PDWORD pdwNumValues);
  HRESULT WdsCliGetImageLastModifiedTime(         HANDLE hIfh, PSYSTEMTIME* ppSysTimeValue);
  HRESULT WdsCliGetImageName(                     HANDLE hIfh, PWSTR* ppwszValue);
  HRESULT WdsCliGetImageNamespace(                HANDLE hIfh, PWSTR* ppwszValue);
  HRESULT WdsCliGetImagePath(                     HANDLE hIfh, PWSTR* ppwszValue);
  HRESULT WdsCliGetImageSize(                     HANDLE hIfh, PULONGLONG pullValue);
  HRESULT WdsCliGetImageVersion(                  HANDLE hIfh, PWSTR* ppwszValue);
  HRESULT WdsCliGetTransferSize(                  HANDLE hIfh, PULONGLONG pullValue);
  HRESULT WdsCliInitializeLog(                    HANDLE hSession, ULONG ulClientArchitecture, PWSTR pwszClientId, PWSTR pwszClientAddress);
  HRESULT WdsCliLog(                              HANDLE hSession, ULONG ulLogLevel, ULONG ulMessageCode);
  HRESULT WdsCliRegisterTrace(                    PFN_WdsCliTraceFunction pfn);
  HRESULT WdsCliTransferFile(                     PCWSTR pwszServer, PCWSTR pwszNamespace, PCWSTR pwszRemoteFilePath, PCWSTR pwszLocalFilePath, DWORD dwFlags, DWORD dwReserved, PFN_WdsCliCallback pfnWdsCliCallback, PVOID pvUserData, PHANDLE phTransfer);
  HRESULT WdsCliTransferImage(                    HANDLE hImage, PWSTR pwszLocalPath, DWORD dwFlags, DWORD dwReserved, PFN_WdsCliCallback pfnWdsCliCallback, PVOID pvUserData, PHANDLE phTransfer);
  HRESULT WdsCliWaitForTransfer(                  HANDLE hTransfer);
]]
return ffi.load( "WdsClientAPI.dll" )

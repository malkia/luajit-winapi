require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/cryptography' )
local ffi = require( 'ffi' )
ffi.cdef [[
  BOOL                     OpenPersonalTrustDBDialog(             HWND hwndParent);
  BOOL                     OpenPersonalTrustDBDialogEx(           HWND hwndParent, DWORD dwFlags, PVOID* pvReserved);
  BOOL                     CryptCATCDFClose(                      CRYPTCATCDF* pCDF);
  CRYPTCATATTRIBUTE*       CryptCATCDFEnumAttributesWithCDFTag(   CRYPTCATCDF* pCDF, LPWSTR pwszMemberTag, CRYPTCATMEMBER* pMember, CRYPTCATATTRIBUTE* pPrevAttr, PFN_CDF_PARSE_ERROR_CALLBACK pfnParseError);
  CRYPTCATATTRIBUTE*       CryptCATCDFEnumCatAttributes(          CRYPTCATCDF* pCDF, CRYPTCATATTRIBUTE* pPrevAttr, PFN_CDF_PARSE_ERROR_CALLBACK pfnParseError);
  LPWSTR                   CryptCATCDFEnumMembersByCDFTagEx(      CRYPTCATCDF* pCDF, LPWSTR pwszPrevCDFTag, PFN_CDF_PARSE_ERROR_CALLBACK pfnParseError, CRYPTCATMEMBER** ppMember, BOOL fContinueOnError, LPVOID pvReserved);
  CRYPTCATCDF*             CryptCATCDFOpen(                       LPWSTR pwszFilePath, PFN_CDF_PARSE_ERROR_CALLBACK pfnParseError);
  BOOL                     CryptCATAdminAcquireContext(           HCATADMIN* phCatAdmin, WINAPI_GUID* pgSubsystem, DWORD dwFlags);
  HCATINFO                 CryptCATAdminAddCatalog(               HCATADMIN hCatAdmin, WCHAR* pwszCatalogFile, WCHAR* pwszSelectBaseName, DWORD dwFlags);
  HCATINFO                 CryptCATAdminEnumCatalogFromHash(      HCATADMIN hCatAdmin, BYTE* pbHash, DWORD cbHash, DWORD dwFlags, HCATINFO* phPrevCatInfo);
  BOOL                     CryptCATAdminRemoveCatalog(            HCATADMIN hCatAdmin, LPCWSTR pwszCatalogFile, DWORD dwFlags);
  BOOL                     CryptCATAdminCalcHashFromFileHandle(   HANDLE hFile, DWORD* pcbHash, BYTE* pbHash, DWORD dwFlags);
  BOOL                     CryptCATAdminReleaseCatalogContext(    HCATADMIN hCatAdmin, HCATINFO hCatInfo, DWORD dwFlags);
  BOOL                     CryptCATAdminReleaseContext(           HCATADMIN hCatAdmin, DWORD dwFlags);
  BOOL                     CryptCATAdminResolveCatalogPath(       HCATADMIN hCatAdmin, WCHAR* pwszCatalogFile, CATALOG_INFO* psCatInfo, DWORD dwFlags);
  BOOL                     CryptCATCatalogInfoFromContext(        HCATINFO hCatInfo, CATALOG_INFO* psCatInfo, DWORD dwFlags);
  BOOL                     CryptCATClose(                         HANDLE hCatalog);
  HANDLE                   CryptCATOpen(                          LPWSTR pwszFileName, DWORD fdwOpenFlags, HCRYPTPROV hProv, DWORD dwPublicVersion, DWORD dwEncodingType);
  CRYPTCATATTRIBUTE*       CryptCATEnumerateAttr(                 HANDLE hCatalog, CRYPTCATMEMBER* pCatMember, CRYPTCATATTRIBUTE* pPrevAttr);
  CRYPTCATATTRIBUTE*       CryptCATEnumerateCatAttr(              HANDLE hCatalog, CRYPTCATATTRIBUTE* pPrevAttr);
  CRYPTCATMEMBER*          CryptCATEnumerateMember(               HANDLE hCatalog, CRYPTCATMEMBER* pPrevMember);
  CRYPTCATATTRIBUTE*       CryptCATGetAttrInfo(                   HANDLE hCatalog, CRYPTCATMEMBER* pCatMember, LPWSTR pwszReferenceTag);
  CRYPTCATMEMBER*          CryptCATGetMemberInfo(                 HANDLE hCatalog, LPWSTR pwszReferenceTag);
  BOOL                     IsCatalogFile(                         HANDLE hFile, WCHAR* pwszFileName);
  BOOL                     WintrustAddActionID(                   GUID* pgActionID, DWORD fdwFlags, CRYPT_REGISTER_ACTIONID* psProvInfo);
  void                     WintrustGetRegPolicyFlags(             WINAPI_WintrustPolicyFlags* pdwPolicyFlags);
  BOOL                     WintrustLoadFunctionPointers(          GUID* pgActionID, CRYPT_PROVIDER_FUNCTIONS* pPfns);
  BOOL                     WintrustRemoveActionID(                GUID* pgActionID);
  void                     WintrustSetDefaultIncludePEPageHashes( BOOL fIncludePEPageHashes);
  BOOL                     WintrustSetRegPolicyFlags(             WINAPI_WintrustPolicyFlags dwPolicyFlags);
  LONG                     WinVerifyTrust(                        HWND hWnd, GUID* pgActionID, LPVOID pWVTData);
  HRESULT                  WinVerifyTrustEx(                      HWND hwnd, GUID* pgActionID, WINTRUST_DATA* pWinTrustData);
  HRESULT                  WTHelperCertCheckValidSignature(       CRYPT_PROVIDER_DATA* pProvData);
  PCCERT_CONTEXT           WTHelperCertFindIssuerCertificate(     PCCERT_CONTEXT pChildContext, DWORD chStores, HCERTSTORE* pahStores, FILETIME* psftVerifyAsOf, DWORD dwEncoding, DWORD* pdwConfidence, DWORD* dwError);
  BOOL                     WTHelperCertIsSelfSigned(              DWORD dwEncoding, CERT_INFO* pCert);
  LONG                     WTHelperGetFileHash(                   LPCWSTR pwszFilename, DWORD dwFlags, PVOID pvReserved, BYTE* pbFileHash, DWORD* pcbFileHash, ALG_ID* pHashAlgid);
  CRYPT_PROVIDER_CERT*     WTHelperGetProvCertFromChain(          CRYPT_PROVIDER_SGNR* pSgnr, DWORD idxCert);
  CRYPT_PROVIDER_PRIVDATA* WTHelperGetProvPrivateDataFromChain(   CRYPT_PROVIDER_DATA* pProvData, GUID* pgProviderID);
  CRYPT_PROVIDER_SGNR*     WTHelperGetProvSignerFromChain(        CRYPT_PROVIDER_DATA* pProvData, DWORD idxSigner, BOOL fCounterSigner, DWORD idxCounterSigner);
  CRYPT_PROVIDER_DATA*     WTHelperProvDataFromStateData(         HANDLE hStateData);
]]
return ffi.load( 'Wintrust.dll' )

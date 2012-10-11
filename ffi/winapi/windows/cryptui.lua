require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/cryptography' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PFNCFILTERPROC; //Alias
  typedef LPVOID PFNCCERTDISPLAYPROC; //Alias
  typedef union WINAPI_CRYPTUI_WIZ_EXPORT_INFO_u {
    PCCERT_CONTEXT pCertContext;
    PCCTL_CONTEXT pCTLContext;
    PCCRL_CONTEXT pCRLContext;
    HCERTSTORE hCertStore;
  } WINAPI_CRYPTUI_WIZ_EXPORT_INFO_u;
  typedef struct CRYPTUI_WIZ_EXPORT_INFO {
    DWORD dwSize;
    LPCWSTR pwszExportFileName;
    DWORD dwSubjectChoice;
    WINAPI_CRYPTUI_WIZ_EXPORT_INFO_u ;
    DWORD cStores;
    HCERTSTORE* rghStores;
  } CRYPTUI_WIZ_EXPORT_INFO;
  typedef CRYPTUI_WIZ_EXPORT_INFO *PCCRYPTUI_WIZ_EXPORT_INFO; //Pointer
  typedef DWORD WINAPI_CRYPTUI_WIZ_IMPORT_SRC_INFO_CHOICE; //Alias
  static const WINAPI_CRYPTUI_WIZ_IMPORT_SRC_INFO_CHOICE CRYPTUI_WIZ_IMPORT_SUBJECT_FILE = 1;
  static const WINAPI_CRYPTUI_WIZ_IMPORT_SRC_INFO_CHOICE CRYPTUI_WIZ_IMPORT_SUBJECT_CERT_CONTEXT = 2;
  static const WINAPI_CRYPTUI_WIZ_IMPORT_SRC_INFO_CHOICE CRYPTUI_WIZ_IMPORT_SUBJECT_CTL_CONTEXT = 3;
  static const WINAPI_CRYPTUI_WIZ_IMPORT_SRC_INFO_CHOICE CRYPTUI_WIZ_IMPORT_SUBJECT_CRL_CONTEXT = 4;
  static const WINAPI_CRYPTUI_WIZ_IMPORT_SRC_INFO_CHOICE CRYPTUI_WIZ_IMPORT_SUBJECT_CERT_STORE = 5;
  typedef union WINAPI_CRYPTUI_WIZ_IMPORT_SRC_INFO_u {
    LPCWSTR pwszFileName;
    PCCERT_CONTEXT pCertContext;
    PCCTL_CONTEXT pCTLContext;
    PCCRL_CONTEXT pCRLContext;
    HCERTSTORE hCertStore;
  } WINAPI_CRYPTUI_WIZ_IMPORT_SRC_INFO_u;
  typedef struct CRYPTUI_WIZ_IMPORT_SRC_INFO {
    DWORD dwSize;
    WINAPI_CRYPTUI_WIZ_IMPORT_SRC_INFO_CHOICE dwSubjectChoice;
    WINAPI_CRYPTUI_WIZ_IMPORT_SRC_INFO_u ;
    DWORD dwFlags;
    LPCWSTR pwszPassword;
  } CRYPTUI_WIZ_IMPORT_SRC_INFO;
  typedef CRYPTUI_WIZ_IMPORT_SRC_INFO *PCCRYPTUI_WIZ_IMPORT_SRC_INFO; //Pointer
  typedef union WINAPI_CRYPTUI_VIEWCERTIFICATE_STRUCT_u {
    CRYPT_PROVIDER_DATA* pCryptProviderData;
    HANDLE hWVTStateData;
  } WINAPI_CRYPTUI_VIEWCERTIFICATE_STRUCT_u;
  typedef DWORD WINAPI_CRYPTUI_VIEWCERTIFICATE_STRUCT_FLAGS; //Alias
  typedef struct CRYPTUI_VIEWCERTIFICATE_STRUCT {
    DWORD dwSize;
    HWND hwndParent;
    WINAPI_CRYPTUI_VIEWCERTIFICATE_STRUCT_FLAGS dwFlags;
    LPCTSTR szTitle;
    PCCERT_CONTEXT pCertContext;
    LPCSTR* rgszPurposes;
    DWORD cPurposes;
    WINAPI_CRYPTUI_VIEWCERTIFICATE_STRUCT_u ;
    BOOL fpCryptProviderDataTrustedUsage;
    DWORD idxSigner;
    DWORD idxCert;
    BOOL fCounterSigner;
    DWORD idxCounterSigner;
    DWORD cStores;
    HCERTSTORE* rghStores;
    DWORD cPropSheetPages;
    LPCPROPSHEETPAGE rgPropSheetPages;
    DWORD nStartPage;
  } CRYPTUI_VIEWCERTIFICATE_STRUCT;
  typedef CRYPTUI_VIEWCERTIFICATE_STRUCT *PCCRYPTUI_VIEWCERTIFICATE_STRUCT; //Pointer
  typedef struct CRYPTUI_VIEWSIGNERINFO_STRUCT {
    DWORD dwSize;
    HWND hwndParent;
    DWORD dwFlags;
    LPCTSTR szTitle;
    CMSG_SIGNER_INFO* pSignerInfo;
    HCRYPTMSG hMsg;
    LPCSTR pszOID;
    DWORD_PTR dwReserved;
    DWORD cStores;
    HCERTSTORE* rghStores;
    DWORD cPropSheetPages;
    LPCPROPSHEETPAGE rgPropSheetPages;
  } CRYPTUI_VIEWSIGNERINFO_STRUCT;
  typedef DWORD WINAPI_CRYPTUI_SELECT_FLAGS; //Alias
  typedef struct CRYPTUI_SELECTCERTIFICATE_STRUCT {
    DWORD dwSize;
    HWND hwndParent;
    DWORD dwFlags;
    LPCTSTR szTitle;
    WINAPI_CRYPTUI_SELECT_FLAGS dwDontUseColumn;
    LPCTSTR szDisplayString;
    PFNCFILTERPROC pFilterCallback;
    PFNCCERTDISPLAYPROC pDisplayCallback;
    void* pvCallbackData;
    DWORD cDisplayStores;
    HCERTSTORE* rghDisplayStores;
    DWORD cStores;
    HCERTSTORE* rghStores;
    DWORD cPropSheetPages;
    LPCPROPSHEETPAGE rgPropSheetPages;
    HCERTSTORE hSelectedCertStore;
  } CRYPTUI_SELECTCERTIFICATE_STRUCT;
  typedef CRYPTUI_SELECTCERTIFICATE_STRUCT *PCCRYPTUI_SELECTCERTIFICATE_STRUCT; //Pointer
  typedef struct CRYPTUI_WIZ_DIGITAL_SIGN_BLOB_INFO {
    DWORD dwSize;
    GUID* pGuidSubject;
    DWORD cbBlob;
    BYTE* pbBlob;
    LPCWSTR pwszDisplayName;
  } CRYPTUI_WIZ_DIGITAL_SIGN_BLOB_INFO;
  typedef CRYPTUI_WIZ_DIGITAL_SIGN_BLOB_INFO *PCCRYPTUI_WIZ_DIGITAL_SIGN_BLOB_INFO; //Pointer
  typedef union WINAPI_CRYPTUI_WIZ_DIGITAL_SIGN_INFO_u1 {
    LPCWSTR pwszFileName;
    PCCRYPTUI_WIZ_DIGITAL_SIGN_BLOB_INFO pSignBlobInfo;
  } WINAPI_CRYPTUI_WIZ_DIGITAL_SIGN_INFO_u1;
  typedef struct CRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO {
    DWORD dwSize;
    DWORD cCertStore;
    HCERTSTORE* rghCertStore;
    PFNCFILTERPROC pFilterCallback;
    void* pvCallbackData;
  } CRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO;
  typedef CRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO *PCCRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO; //Pointer
  typedef struct CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE_INFO {
    DWORD dwSize;
    LPWSTR pwszPvkFileName;
    LPWSTR pwszProvName;
    WINAPI_CryptProv dwProvType;
  } CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE_INFO;
  typedef CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE_INFO *PCCRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE_INFO; //Pointer
  typedef union WINAPI_CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO_u {
    PCCRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE_INFO pPvkFileInfo;
    PCRYPT_KEY_PROV_INFO pPvkProvInfo;
  } WINAPI_CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO_u;
  typedef DWORD WINAPI_CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO_CHOICE; //Alias
  static const WINAPI_CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO_CHOICE CRYPTUI_WIZ_DIGITAL_SIGN_PVK_FILE = 0x01;
  static const WINAPI_CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO_CHOICE CRYPTUI_WIZ_DIGITAL_SIGN_PVK_PROV = 0x02;
  typedef struct CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO {
    DWORD dwSize;
    LPWSTR pwszSigningCertFileName;
    WINAPI_CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO_CHOICE dwPvkChoice;
    WINAPI_CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO_u ;
  } CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO;
  typedef CRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO *PCCRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO; //Pointer
  typedef union WINAPI_CRYPTUI_WIZ_DIGITAL_SIGN_INFO_u2 {
    PCCERT_CONTEXT pSigningCertContext;
    PCCRYPTUI_WIZ_DIGITAL_SIGN_STORE_INFO pSigningCertStore;
    PCCRYPTUI_WIZ_DIGITAL_SIGN_CERT_PVK_INFO pSigningCertPvkInfo;
  } WINAPI_CRYPTUI_WIZ_DIGITAL_SIGN_INFO_u2;
  typedef DWORD WINAPI_CRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO_FLAGS; //Alias
  typedef struct CRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO {
    DWORD dwSize;
    WINAPI_CRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO_FLAGS dwAttrFlags;
    LPCWSTR pwszDescription;
    LPCWSTR pwszMoreInfoLocation;
    LPCSTR pszHashAlg;
    LPCWSTR pwszSigningCertDisplayString;
    HCERTSTORE hAdditionalCertStore;
    PCRYPT_ATTRIBUTES psAuthenticated;
    PCRYPT_ATTRIBUTES psUnauthenticated;
  } CRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO;
  typedef CRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO *PCCRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO; //Pointer
  typedef struct CRYPTUI_WIZ_DIGITAL_SIGN_INFO {
    DWORD dwSize;
    DWORD dwSubjectChoice;
    WINAPI_CRYPTUI_WIZ_DIGITAL_SIGN_INFO_u1 ;
    DWORD dwSigningCertChoice;
    WINAPI_CRYPTUI_WIZ_DIGITAL_SIGN_INFO_u2 ;
    LPCWSTR pwszTimestampURL;
    DWORD dwAdditionalCertChoice;
    PCCRYPTUI_WIZ_DIGITAL_SIGN_EXTENDED_INFO pSignExtInfo;
  } CRYPTUI_WIZ_DIGITAL_SIGN_INFO;
  typedef CRYPTUI_WIZ_DIGITAL_SIGN_INFO *PCCRYPTUI_WIZ_DIGITAL_SIGN_INFO; //Pointer
  typedef struct CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT {
    DWORD dwSize;
    DWORD cbBlob;
    BYTE* pbBlob;
  } CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT;
  typedef CRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT *PCCRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT; //Pointer
  typedef struct CRYPTUI_CERT_MGR_STRUCT {
    DWORD dwSize;
    HWND hwndParent;
    DWORD dwFlags;
    LPCWSTR pwszTitle;
    LPCSTR pszInitUsageOID;
  } CRYPTUI_CERT_MGR_STRUCT;
  typedef CRYPTUI_CERT_MGR_STRUCT *PCCRYPTUI_CERT_MGR_STRUCT; //Pointer
  typedef DWORD WINAPI_CryptUiWizFlags; //Alias
  BOOL           CryptUIWizDigitalSign(                DWORD dwFlags, HWND hwndParent, LPCWSTR pwszWizardTitle, PCCRYPTUI_WIZ_DIGITAL_SIGN_INFO pDigitalSignInfo, PCCRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT* ppSignContext);
  BOOL           CryptUIWizFreeDigitalSignContext(     PCCRYPTUI_WIZ_DIGITAL_SIGN_CONTEXT pSignContext);
  BOOL           CryptUIWizExport(                     WINAPI_CryptUiWizFlags dwFlags, HWND hwndParent, LPCWSTR pwszWizardTitle, PCCRYPTUI_WIZ_EXPORT_INFO pExportInfo, void* pvoid);
  BOOL           CryptUIWizImport(                     WINAPI_CryptUiWizFlags dwFlags, HWND hwndParent, LPCWSTR pwszWizardTitle, PCCRYPTUI_WIZ_IMPORT_SRC_INFO pImportSrc, HCERTSTORE hDestCertStore);
  BOOL           CryptUIDlgCertMgr(                    PCCRYPTUI_CERT_MGR_STRUCT pCryptUICertMgr);
  PCCERT_CONTEXT CryptUIDlgSelectCertificate(          PCCRYPTUI_SELECTCERTIFICATE_STRUCT pcsc);
  PCCERT_CONTEXT CryptUIDlgSelectCertificateFromStore( HCERTSTORE hCertStore, HWND hwnd, LPCWSTR pwszTitle, LPCWSTR pwszDisplayString, DWORD dwDontUseColumn, DWORD dwFlags, void* pvReserved);
  BOOL           CryptUIDlgViewCertificate(            PCCRYPTUI_VIEWCERTIFICATE_STRUCT pCertViewInfo, BOOL* pfPropertiesChanged);
  BOOL           CryptUIDlgViewContext(                DWORD dwContextType, void* pvContext, HWND hwnd, LPCWSTR pwszTitle, DWORD dwFlags, void* pvReserved);
  BOOL           CryptUIDlgViewSignerInfo(             CRYPTUI_VIEWSIGNERINFO_STRUCT* pcvsi);
]]
return ffi.load( 'Cryptui.dll' )

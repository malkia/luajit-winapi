require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/cryptography" )
local ffi = require( "ffi" )
ffi.cdef [[
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
return ffi.load( "Cryptui.dll" )

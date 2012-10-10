require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/cryptography' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PFNCMHOOKPROC; //Alias
  typedef LPVOID PFNCMFILTERPROC; //Alias
  typedef struct CERT_SELECT_STRUCT {
    DWORD dwSize;
    HWND hwndParent;
    HINSTANCE hInstance;
    LPCTSTR pTemplateName;
    DWORD dwFlags;
    LPCTSTR szTitle;
    DWORD cCertStore;
    HCERTSTORE* arrayCertStore;
    LPCTSTR szPurposeOid;
    DWORD cCertContext;
    PCCERT_CONTEXT* arrayCertContext;
    LPARAM lCustData;
    PFNCMHOOKPROC pfnHook;
    PFNCMFILTERPROC pfnFilter;
    LPCTSTR szHelpFileName;
    DWORD dwHelpId;
    HCRYPTPROV hprov;
  } CERT_SELECT_STRUCT;
  typedef CERT_SELECT_STRUCT *PCERT_SELECT_STRUCT; //Pointer
  typedef struct CTL_MODIFY_REQUEST {
    PCCERT_CONTEXT pccert;
    DWORD dwOperation;
    DWORD dwError;
  } CTL_MODIFY_REQUEST;
  typedef CTL_MODIFY_REQUEST *PCTL_MODIFY_REQUEST; //Pointer
  BOOL    CertSelectCertificate(         PCERT_SELECT_STRUCT pCertSelectInfo);
  DWORD   GetFriendlyNameOfCert(         PCCERT_CONTEXT pccert, LPTSTR pchBuffer, DWORD cchBuffer);
  HRESULT CertModifyCertificatesToTrust( int cCerts, PCTL_MODIFY_REQUEST rgCerts, LPCSTR szPurpose, HWND hwnd, HCERTSTORE hcertstoreTrust, PCCERT_CONTEXT pccertSigner);
]]
ffi.load( 'CryptDlg.dll' )

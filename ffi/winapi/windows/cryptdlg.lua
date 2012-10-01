require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/cryptography" )
local ffi = require( "ffi" )
ffi.cdef [[
  BOOL    CertSelectCertificate(         PCERT_SELECT_STRUCT pCertSelectInfo);
  DWORD   GetFriendlyNameOfCert(         PCCERT_CONTEXT pccert, LPTSTR pchBuffer, DWORD cchBuffer);
  HRESULT CertModifyCertificatesToTrust( int cCerts, PCTL_MODIFY_REQUEST rgCerts, LPCSTR szPurpose, HWND hwnd, HCERTSTORE hcertstoreTrust, PCCERT_CONTEXT pccertSigner);
]]
return ffi.load( "CryptDlg.dll" )

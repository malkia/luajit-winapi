require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PX509Certificate; //Alias
  BOOL SslCrackCertificate( PUCHAR pbCertificate, DWORD dwCertificate, DWORD dwFlags, PX509Certificate* ppCertificate);
  BOOL SslEmptyCache(       LPSTR pszTargetName, DWORD dwFlags);
  void SslFreeCertificate(  PX509Certificate pCertificate);
]]
ffi.load( 'Schannel.dll' )

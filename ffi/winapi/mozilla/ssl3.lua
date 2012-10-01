require( "ffi/winapi/mozilla/nspr" )
local ffi = require( "ffi" )
ffi.cdef [[
  SECStatus        SSL_OptionSetDefault(           WINAPI_SSLOption option, PRBool on);
  SECStatus        SSL_OptionGetDefault(           WINAPI_SSLOption option, PRBool* on);
  SECStatus        SSL_CipherPrefSetDefault(       WINAPI_SSLCipher cipher, PRBool enabled);
  SECStatus        SSL_CipherPrefGetDefault(       WINAPI_SSLCipher cipher, PRBool* enabled);
  void             SSL_ClearSessionCache(          );
  SECStatus        SSL_ConfigServerSessionIDCache( int maxCacheEntries, PRUint32 timeout, PRUint32 ssl3_timeout, char* directory);
  SECStatus        SSL_ConfigMPServerSIDCache(     int maxCacheEntries, PRUint32 timeout, PRUint32 ssl3_timeout, char* directory);
  SECStatus        SSL_InheritMPServerSIDCache(    char* envString);
  SECStatus        NSS_SetDomesticPolicy(          );
  SECStatus        NSS_SetExportPolicy(            );
  SECStatus        NSS_SetFrancePolicy(            );
  SECStatus        SSL_CipherPolicySet(            WINAPI_SSLCipher cipher, WINAPI_SSLPolicy policy);
  SECStatus        SSL_CipherPolicyGet(            WINAPI_SSLCipher cipher, WINAPI_SSLPolicy policy);
  PRFileDesc*      SSL_ImportFD(                   PRFileDesc* model, PRFileDesc* fd);
  SECStatus        SSL_OptionSet(                  PRFileDesc* fd, WINAPI_SSLOption option, PRBool on);
  SECStatus        SSL_OptionGet(                  PRFileDesc* fd, WINAPI_SSLOption option, PRBool* on);
  SECStatus        SSL_CipherPrefSet(              PRFileDesc* fd, WINAPI_SSLCipher cipher, PRBool enabled);
  SECStatus        SSL_CipherPrefGet(              PRFileDesc* fd, WINAPI_SSLCipher cipher, PRBool* enabled);
  SECStatus        SSL_ConfigSecureServer(         PRFileDesc* fd, CERTCertificate* cert, SECKEYPrivateKey* key, SSLKEAType keaType);
  int              SSL_SetURL(                     PRFileDesc* fd, char* url);
  int              SSL_SetPKCS11PinArg(            PRFileDesc* fd, void* a);
  SECStatus        SSL_AuthCertificateHook(        PRFileDesc* fd, SSLAuthCertificate f, void* arg);
  SECStatus        SSL_AuthCertificate(            void* arg, PRFileDesc* fd, PRBool checksig, PRBool isServer);
  SECStatus        SSL_BadCertHook(                PRFileDesc* fd, SSLBadCertHandler f, void* arg);
  SECStatus        SSL_GetClientAuthDataHook(      PRFileDesc* fd, SSLGetClientAuthData f, void* arg);
  SECStatus        NSS_GetClientAuthData(          void* arg, PRFileDesc* socket, CERTDistNamesStr* caNames, CERTCertificateStr** pRetCert, SECKEYPrivateKeyStr** pRetKey);
  SECStatus        SSL_HandshakeCallback(          PRFileDesc* fd, SSLHandshakeCallback cb, void* client_data);
  int              SSL_InvalidateSession(          PRFileDesc* fd);
  int              SSL_DataPending(                PRFileDesc* fd);
  SECStatus        SSL_SecurityStatus(             PRFileDesc* fd, WINAPI_SSLSecurityStatus* on, char** cipher, int* keysize, int* secretKeySize, char** issuer, char** subject);
  SECItem*         SSL_GetSessionID(               PRFileDesc* fd);
  int              SSL_SetSockPeerID(              PRFileDesc* fd, char* peerID);
  CERTCertificate* SSL_PeerCertificate(            PRFileDesc* fd);
  char*            SSL_RevealURL(                  PRFileDesc* fd);
  void*            SSL_RevealPinArg(               PRFileDesc* fd);
  SECStatus        SSL_ForceHandshake(             PRFileDesc* fd);
  SECStatus        SSL_ReHandshake(                PRFileDesc* fd, PRBool flushCache);
  SECStatus        SSL_ResetHandshake(             PRFileDesc* fd, PRBool asServer);
]]
return ffi.load( "SSL3.DLL" )

require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  HANDLE SCardAccessStartedEvent(      );
  LONG   SCardAddReaderToGroup(        SCARDCONTEXT hContext, LPCTSTR szReaderName, LPCTSTR szGroupName);
  LONG   SCardBeginTransaction(        SCARDHANDLE hCard);
  LONG   SCardCancel(                  SCARDCONTEXT hContext);
  LONG   SCardConnect(                 SCARDCONTEXT hContext, LPCTSTR szReader, DWORD dwShareMode, DWORD dwPreferredProtocols, LPSCARDHANDLE phCard, LPDWORD pdwActiveProtocol);
  LONG   SCardControl(                 SCARDHANDLE hCard, DWORD dwControlCode, LPCVOID lpInBuffer, DWORD nInBufferSize, LPVOID lpOutBuffer, DWORD nOutBufferSize, LPDWORD lpBytesReturned);
  LONG   SCardDisconnect(              SCARDHANDLE hCard, DWORD dwDisposition);
  LONG   SCardEndTransaction(          SCARDHANDLE hCard, DWORD dwDisposition);
  LONG   SCardEstablishContext(        WINAPI_SCardScope dwScope, LPCVOID pvReserved1, LPCVOID pvReserved2, LPSCARDCONTEXT phContext);
  LONG   SCardForgetCardType(          SCARDCONTEXT hContext, LPCTSTR szCardName);
  LONG   SCardForgetReader(            SCARDCONTEXT hContext, LPCTSTR szReaderName);
  LONG   SCardForgetReaderGroup(       SCARDCONTEXT hContext, LPCTSTR szGroupName);
  LONG   SCardFreeMemory(              SCARDCONTEXT hContext, LPCVOID pvMem);
  LONG   SCardGetAttrib(               SCARDHANDLE hCard, DWORD dwAttrId, LPBYTE pbAttr, LPDWORD pcbAttrLen);
  LONG   SCardGetCardTypeProviderName( SCARDCONTEXT hContext, LPCTSTR szCardName, DWORD dwProviderId, LPTSTR szProvider, LPDWORD* pcchProvider);
  LONG   SCardGetProviderId(           SCARDCONTEXT hContext, LPCTSTR szCard, LPGUID pguidProviderId);
  LONG   SCardGetStatusChange(         SCARDCONTEXT hContext, DWORD dwTimeout, LPSCARD_READERSTATE rgReaderStates, DWORD cReaders);
  LONG   SCardGetTransmitCount(        SCARDHANDLE hCard, LPDWORD pcTransmitCount);
  LONG   SCardIntroduceCardType(       SCARDCONTEXT hContext, LPCTSTR szCardName, LPCGUID pguidPrimaryProvider, LPCGUID rgguidInterfaces, DWORD dwInterfaceCount, LPCBYTE pbAtr, LPCBYTE pbAtrMask, DWORD cbAtrLen);
  LONG   SCardIntroduceReader(         SCARDCONTEXT hContext, LPCTSTR szReaderName, LPCTSTR szDeviceName);
  LONG   SCardIntroduceReaderGroup(    SCARDCONTEXT hContext, LPCTSTR szGroupName);
  LONG   SCardIsValidContext(          SCARDCONTEXT hContext);
  LONG   SCardListCards(               SCARDCONTEXT hContext, LPCBYTE pbAtr, LPCGUID rgguidInterfaces, DWORD cguidInterfaceCount, LPTSTR mszCards, LPDWORD pcchCards);
  LONG   SCardListInterfaces(          SCARDCONTEXT hContext, LPCTSTR szCard, LPGUID pguidInterfaces, LPDWORD pcguidInterfaces);
  LONG   SCardListReaderGroups(        SCARDCONTEXT hContext, LPTSTR mszGroups, LPDWORD pcchGroups);
  LONG   SCardListReaders(             SCARDCONTEXT hContext, LPCTSTR mszGroups, LPTSTR mszReaders, LPDWORD pcchReaders);
  LONG   SCardLocateCards(             SCARDCONTEXT hContext, LPCTSTR mszCards, LPSCARD_READERSTATE rgReaderStates, DWORD cReaders);
  LONG   SCardLocateCardsByATR(        SCARDCONTEXT hContext, LPSCARD_ATRMASK rgAtrMasks, DWORD cAtrs, LPSCARD_READERSTATE rgReaderStates, DWORD cReaders);
  LONG   SCardReadCache(               SCARDCONTEXT hContext, UUID* CardIdentifier, DWORD FreshnessCounter, LPTSTR LookupName, PBYTE Data, DWORD* DataLen);
  LONG   SCardReconnect(               SCARDHANDLE hCard, DWORD dwShareMode, DWORD dwPreferredProtocols, DWORD dwInitialization, LPDWORD pdwActiveProtocol);
  LONG   SCardReleaseContext(          SCARDCONTEXT hContext);
  void   SCardReleaseStartedEvent(     );
  LONG   SCardRemoveReaderFromGroup(   SCARDCONTEXT hContext, LPCTSTR szReaderName, LPCTSTR szGroupName);
  LONG   SCardSetAttrib(               SCARDHANDLE hCard, DWORD dwAttrId, LPCBYTE pbAttr, DWORD cbAttrLen);
  LONG   SCardSetCardTypeProviderName( SCARDCONTEXT hContext, LPCTSTR szCardName, DWORD dwProviderId, LPCTSTR szProvider);
  LONG   SCardStatus(                  SCARDHANDLE hCard, LPTSTR szReaderName, LPDWORD pcchReaderLen, LPDWORD pdwState, LPDWORD pdwProtocol, LPBYTE pbAtr, LPDWORD pcbAtrLen);
  LONG   SCardTransmit(                SCARDHANDLE hCard, LPCSCARD_IO_REQUEST pioSendPci, LPCBYTE pbSendBuffer, DWORD cbSendLength, LPSCARD_IO_REQUEST pioRecvPci, LPBYTE pbRecvBuffer, LPDWORD pcbRecvLength);
  LONG   SCardWriteCache(              SCARDCONTEXT hContext, UUID* CardIdentifier, DWORD FreshnessCounter, LPTSTR LookupName, PBYTE Data, DWORD DataLen);
]]
return ffi.load( "Winscard.dll" )

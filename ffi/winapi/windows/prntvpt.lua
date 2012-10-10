require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef HANDLE HPTPROVIDER; //Alias
  typedef UINT EDefaultDevmodeType; //Alias
  static const EDefaultDevmodeType kUserDefaultDevmode = 0;
  static const EDefaultDevmodeType kPrinterDefaultDevmode = 1;
  typedef UINT EPrintTicketScope; //Alias
  static const EPrintTicketScope kPTPageScope = 0;
  static const EPrintTicketScope kPTDocumentScope = 1;
  static const EPrintTicketScope kPTJobScope = 3;
  HRESULT PTConvertPrintTicketToDevMode( HPTPROVIDER hProvider, IStream* pPrintTicket, EDefaultDevmodeType baseDevmodeType, EPrintTicketScope scope, ULONG* pcbDevmode, PDEVMODE* ppDevmode, BSTR* pbstrErrorMessage);
  HRESULT PTConvertDevModeToPrintTicket( HPTPROVIDER hProvider, ULONG cbDevmode, PDEVMODE pDevmode, EPrintTicketScope scope, IStream* pPrintTicket);
  HRESULT PTReleaseMemory(               PVOID pBuffer);
  HRESULT PTMergeAndValidatePrintTicket( HPTPROVIDER hProvider, IStream* pBaseTicket, IStream* pDeltaTicket, EPrintTicketScope scope, IStream* pResultTicket, BSTR* pbstrErrorMessage);
  HRESULT PTGetPrintCapabilities(        HPTPROVIDER hProvider, IStream* pPrintTicket, IStream* pCapabilities, BSTR* pbstrErrorMessage);
  HRESULT PTOpenProvider(                PCWSTR pszPrinterName, DWORD version, HPTPROVIDER* phProvider);
  HRESULT PTOpenProviderEx(              PCWSTR pszPrinterName, DWORD maxVersion, DWORD prefVersion, HPTPROVIDER* phProvider, DWORD* usedVersion);
  HRESULT PTCloseProvider(               HPTPROVIDER hProvider);
  HRESULT PTQuerySchemaVersionSupport(   PCWSTR pszPrinterName, DWORD* pMaxVersion);
]]
ffi.load( 'Prntvpt.dll' )

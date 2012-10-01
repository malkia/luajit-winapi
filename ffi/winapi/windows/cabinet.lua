require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  BOOL    FCIAddFile(           HFCI hfci, LPSTR pszSourceFile, LPSTR pszFileName, BOOL fExecute, PFNFCIGETNEXTCABINET GetNextCab, PFNFCISTATUS pfnProgress, PFNFCIGETOPENINFO pfnOpenInfo, TCOMP typeCompress);
  HFCI    FCICreate(            WINAPI_PERF_FCI perf, PFNFCIFILEPLACED pfnfiledest, PFNFCIALLOC pfnalloc, PFNFCIFREE pfnfree, PFNFCIOPEN pfnopen, PFNFCIREAD pfnread, PFNFCIWRITE pfnwrite, PFNFCICLOSE pfnclose, PFNFCISEEK pfnseek, PFNFCIDELETE pfndelete, PFNFCIGETTEMPFILE pfnfcigtf, PCCAB pccab, void* pv);
  BOOL    FCIDestroy(           HFCI hfci);
  BOOL    FCIFlushCabinet(      HFCI hfci, BOOL fGetNextCab, PFNFCIGETNEXTCABINET GetNextCab, PFNFCISTATUS pfnProgress);
  BOOL    FCIFlushFolder(       HFCI hfci, PFNFCIGETNEXTCABINET GetNextCab, PFNFCISTATUS pfnProgress);
  BOOL    FDICopy(              HFDI hfdi, LPSTR pszCabinet, LPSTR pszCabPath, INT flags, PFNFDINOTIFY pfnfdin, PFNFDIDECRYPT pfnfdid, void* pvUser);
  HFDI    FDICreate(            PFNALLOC pfnalloc, PFNFREE pfnfree, PFNOPEN pfnopen, PFNREAD pfnread, PFNWRITE pfnwrite, PFNCLOSE pfnclose, PFNSEEK pfnseek, int cpuType, WINAPI_PERF_FDI perf);
  BOOL    FDIDestroy(           BOOL hfdi);
  BOOL    FDIIsCabinet(         HFDI hfdi, INT_PTR hf, PFDICABINETINFO pfdici);
  BOOL    FDITruncateCabinet(   HFDI hfdi, LPSTR* pszCabinetName, USHORT iFolderToDelete);
  VOID    DeleteExtractedFiles( PSESSION ps);
  VOID    DllGetVersion(        PCABINETDLLVERSIONINFO pcdvi);
  HRESULT Extract(              PSESSION ps, LPCSTR lpCabName);
  LPCSTR  GetDllVersion(        );
]]
return ffi.load( "Cabinet.dll" )

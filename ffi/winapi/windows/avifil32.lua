require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/multimedia" )
local ffi = require( "ffi" )
ffi.cdef [[
  STDAPI             AVIBuildFilter(             LPTSTR lpszFilter, LONG cbFilter, BOOL fSaving);
  STDAPI             AVIClearClipboard(          );
  STDAPI_(ULONG)     AVIFileAddRef(              PAVIFILE pfile);
  STDAPI             AVIFileCreateStream(        PAVIFILE pfile, PAVISTREAM* ppavi, AVISTREAMINFO* psi);
  STDAPI             AVIFileEndRecord(           PAVIFILE pfile);
  STDAPI_(VOID)      AVIFileExit(                );
  STDAPI             AVIFileGetStream(           PAVIFILE pfile, PAVISTREAM* ppavi, DWORD fccType, LONG lParam);
  STDAPI             AVIFileInfo(                PAVIFILE pfile, AVIFILEINFO* pfi, LONG lSize);
  STDAPI_(VOID)      AVIFileInit(                );
  STDAPI             AVIFileOpen(                PAVIFILE* ppfile, LPCTSTR szFile, UINT mode, CLSID pclsidHandler);
  STDAPI             AVIFileReadData(            PAVIFILE pfile, DWORD ckid, LPVOID lpData, LONG* lpcbData);
  STDAPI_(ULONG)     AVIFileRelease(             PAVIFILE pfile);
  STDAPI             AVIFileWriteData(           PAVIFILE pfile, DWORD ckid, LPVOID lpData, LONG cbData);
  STDAPI             AVIGetFromClipboard(        PAVIFILE* lppf);
  STDAPI             AVIMakeCompressedStream(    PAVISTREAM* ppsCompressed, PAVISTREAM psSource, AVICOMPRESSOPTIONS* lpOptions, CLSID* pclsidHandler);
  STDAPI             AVIMakeFileFromStreams(     PAVIFILE* ppfile, int nStreams, PAVISTREAM* papStreams);
  STDAPI             AVIMakeStreamFromClipboard( UINT cfFormat, HANDLE hGlobal, PAVISTREAM* ppstream);
  STDAPI             AVIPutFileOnClipboard(      PAVIFILE pf);
  HRESULT            AVISave(                    LPCTSTR szFile, CLSID* pclsidHandler, AVISAVECALLBACK lpfnCallback, int nStreams, PAVISTREAM pavi, LPAVICOMPRESSOPTIONS lpOptions);
  BOOL               AVISaveOptions(             HWND hwnd, UINT uiFlags, int nStreams, PAVISTREAM* ppavi, LPAVICOMPRESSOPTIONS* plpOptions);
  LONG               AVISaveOptionsFree(         int nStreams, LPAVICOMPRESSOPTIONS* plpOptions);
  STDAPI             AVISaveV(                   LPCTSTR szFile, CLSID* pclsidHandler, AVISAVECALLBACK lpfnCallback, int nStreams, PAVISTREAM* ppavi, LPAVICOMPRESSOPTIONS* plpOptions);
  STDAPI_(LONG)      AVIStreamAddRef(            PAVISTREAM pavi);
  STDAPI             AVIStreamBeginStreaming(    PAVISTREAM pavi, LONG lStart, LONG lEnd, LONG lRate);
  STDAPI             AVIStreamCreate(            PAVISTREAM* ppavi, LONG lParam1, LONG lParam2, CLSID* pclsidHandler);
  STDAPI             AVIStreamEndStreaming(      PAVISTREAM pavi);
  STDAPI_(LONG)      AVIStreamFindSample(        PAVISTREAM pavi, LONG lPos, LONG lFlags);
  STDAPI_(LPVOID)    AVIStreamGetFrame(          PGETFRAME pgf, LONG lPos);
  STDAPI             AVIStreamGetFrameClose(     PGETFRAME pget);
  STDAPI_(PGETFRAME) AVIStreamGetFrameOpen(      PAVISTREAM pavi, LPBITMAPINFOHEADER lpbiWanted);
  STDAPI             AVIStreamInfo(              PAVISTREAM pavi, AVISTREAMINFO* psi, LONG lSize);
  STDAPI_(LONG)      AVIStreamLength(            PAVISTREAM pavi);
  STDAPI             AVIStreamOpenFromFile(      PAVISTREAM* ppavi, LPCTSTR szFile, DWORD fccType, LONG lParam, UINT mode, CLSID* pclsidHandler);
  STDAPI             AVIStreamRead(              PAVISTREAM pavi, LONG lStart, LONG lSamples, LPVOID lpBuffer, LONG cbBuffer, LONG* plBytes, LONG* plSamples);
  STDAPI             AVIStreamReadData(          PAVISTREAM pavi, DWORD ckid, LPVOID lpData, LONG* lpcbData);
  STDAPI             AVIStreamReadFormat(        PAVISTREAM pavi, LONG lPos, LPVOID lpFormat, LONG* lpcbFormat);
  STDAPI_(LONG)      AVIStreamRelease(           PAVISTREAM pavi);
  STDAPI_(LONG)      AVIStreamSampleToTime(      PAVISTREAM pavi, LONG lSample);
  STDAPI             AVIStreamSetFormat(         PAVISTREAM pavi, LONG lPos, LPVOID lpFormat, LONG cbFormat);
  STDAPI_(LONG)      AVIStreamStart(             PAVISTREAM pavi);
  STDAPI_(LONG)      AVIStreamTimeToSample(      PAVISTREAM pavi, LONG lTime);
  STDAPI             AVIStreamWrite(             PAVISTREAM pavi, LONG lStart, LONG lSamples, LPVOID lpBuffer, LONG cbBuffer, DWORD dwFlags, LONG* plSampWritten, LONG* plBytesWritten);
  STDAPI             AVIStreamWriteData(         PAVISTREAM pavi, DWORD ckid, LPVOID lpData, LONG cbData);
  STDAPI             CreateEditableStream(       PAVISTREAM* ppsEditable, PAVISTREAM psSource);
  STDAPI             EditStreamClone(            PAVISTREAM pavi, PAVISTREAM* ppResult);
  STDAPI             EditStreamCopy(             PAVISTREAM pavi, LONG* plStart, LONG* plLength, PAVISTREAM* ppResult);
  STDAPI             EditStreamCut(              PAVISTREAM pavi, LONG* plStart, LONG* plLength, PAVISTREAM* ppResult);
  STDAPI             EditStreamPaste(            PAVISTREAM pavi, LONG* plPos, LONG* plLength, PAVISTREAM pstream, LONG lStart, LONG lLength);
  STDAPI             EditStreamSetInfo(          PAVISTREAM pavi, AVISTREAMINFO* lpInfo, LONG cbInfo);
  STDAPI             EditStreamSetName(          PAVISTREAM pavi, LPCTSTR lpszName);
]]
return ffi.load( "avifil32.dll" )

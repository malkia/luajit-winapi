require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/mmf/mmfdefs' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HRESULT MFCreateSinkWriterFromMediaSink(     IMFMediaSink* pMediaSink, IMFAttributes* pAttributes, IMFSinkWriter** ppSinkWriter);
  HRESULT MFCreateSinkWriterFromURL(           LPCWSTR pwszOutputURL, IMFByteStream* pByteStream, IMFAttributes* pAttributes, IMFSinkWriter** ppSinkWriter);
  HRESULT MFCreateSourceReaderFromByteStream(  IMFByteStream* pByteStream, IMFAttributes* pAttributes, IMFSourceReader** ppSourceReader);
  HRESULT MFCreateSourceReaderFromMediaSource( IMFMediaSource* pMediaSource, IMFAttributes* pAttributes, IMFSourceReader** ppSourceReader);
  HRESULT MFCreateSourceReaderFromURL(         LPCWSTR pwszURL, IMFAttributes* pAttributes, IMFSourceReader** ppSourceReader);
]]
return ffi.load( 'Mfreadwrite.dll' )

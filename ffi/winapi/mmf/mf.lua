require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/mmf/mmfdefs' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HRESULT CreateNamedPropertyStore(                     INamedPropertyStore** ppStore);
  HRESULT MFCreate3GPMediaSink(                         IMFByteStream* pIByteStream, IMFMediaType* pVideoMediaType, IMFMediaType* pAudioMediaType, IMFMediaSink** ppIMediaSink);
  HRESULT MFCreateAggregateSource(                      IMFCollection* pSourceCollection, IMFMediaSource** ppAggSource);
  HRESULT MFCreateASFContentInfo(                       IMFASFContentInfo** ppIContentInfo);
  HRESULT MFCreateASFIndexer(                           IMFASFIndexer** ppIIndexer);
  HRESULT MFCreateASFIndexerByteStream(                 IMFByteStream* pIContentByteStream, QWORD cbIndexStartOffset, IMFByteStream** pIIndexByteStream);
  HRESULT MFCreateASFMediaSink(                         IMFByteStream* pIByteStream, IMFMediaSink** ppIMediaSink);
  HRESULT MFCreateASFMediaSinkActivate(                 LPCWSTR pwszFileName, IMFASFContentInfo* pContentInfo, IMFActivate** ppIActivate);
  HRESULT MFCreateASFMultiplexer(                       IMFASFMultiplexer** ppIMultiplexer);
  HRESULT MFCreateASFProfile(                           IMFASFProfile** ppIProfile);
  HRESULT MFCreateASFProfileFromPresentationDescriptor( IMFPresentationDescriptor* pIPD, IMFASFProfile** ppIProfile);
  HRESULT MFCreateASFSplitter(                          IMFASFSplitter** ppISplitter);
  HRESULT MFCreateASFStreamingMediaSink(                IMFByteStream* pIByteStream, IMFMediaSink** ppIMediaSink);
  HRESULT MFCreateASFStreamingMediaSinkActivate(        IMFActivate* pByteStreamActivate, IMFASFContentInfo* pContentInfo, IMFActivate** ppIActivate);
  HRESULT MFCreateASFStreamSelector(                    IMFASFProfile* pIASFProfile, IMFASFStreamSelector** ppSelector);
  HRESULT MFCreateAudioRenderer(                        IMFAttributes* pAudioAttributes, IMFMediaSink** ppSink);
  HRESULT MFCreateAudioRendererActivate(                IMFActivate** ppActivate);
  HRESULT MFCreateCredentialCache(                      IMFNetCredentialCache** ppCache);
  HRESULT MFCreateDeviceSource(                         IMFAttributes* pAttributes, IMFMediaSource** ppSource);
  STDAPI  MFCreateDeviceSourceActivate(                 IMFAttributes* pAttributes, IMFActivate** ppActivate);
  HRESULT MFCreateMediaSession(                         IMFAttributes* pConfiguration, IMFMediaSession** ppMS);
  HRESULT MFCreateMP3MediaSink(                         IMFByteStream* pTargetByteStream, IMFMediaSink** ppMediaSink);
  HRESULT MFCreateMPEG4MediaSink(                       IMFByteStream* pIByteStream, IMFMediaType* pVideoMediaType, IMFMediaType* pAudioMediaType, IMFMediaSink** ppIMediaSink);
  HRESULT MFCreateNetSchemePlugin(                      REFIID riid, LPVOID* ppvHandler);
  HRESULT MFCreatePMPMediaSession(                      DWORD dwCreationFlags, IMFAttributes* pConfiguration, IMFMediaSession** ppMediaSession, IMFActivate** ppEnablerActivate);
  HRESULT MFCreatePMPServer(                            DWORD dwCreationFlags, IMFPMPServer** ppPMPServer);
  HRESULT MFCreatePresentationClock(                    IMFPresentationClock** ppPresentationClock);
  HRESULT MFCreatePresentationDescriptorFromASFProfile( IMFASFProfile* pIProfile, IMFPresentationDescriptor** ppIPD);
  HRESULT MFCreateProxyLocator(                         LPCWSTR pszProtocol, IPropertyStore* pProxyConfig, IMFNetProxyLocator** ppProxyLocator);
  HRESULT MFCreateRemoteDesktopPlugin(                  IMFRemoteDesktopPlugin** ppPlugin);
  HRESULT MFCreateSampleCopierMFT(                      IMFTransform** ppCopierMFT);
  HRESULT MFCreateSampleGrabberSinkActivate(            IMFMediaType* pIMFMediaType, IMFSampleGrabberSinkCallback* pIMFSampleGrabberSinkCallback, IMFActivate** ppIActivate);
  HRESULT MFCreateSequencerSegmentOffset(               MFSequencerElementId dwId, MFTIME hnsOffset, PROPVARIANT* pvarSegmentOffset);
  HRESULT MFCreateSequencerSource(                      IUnknown* pReserved, IMFSequencerSource** ppSequencerSource);
  HRESULT MFCreateSimpleTypeHandler(                    IMFMediaTypeHandler** ppHandler);
  HRESULT MFCreateStandardQualityManager(               IMFQualityManager** ppQualityManager);
  HRESULT MFCreateTopoLoader(                           IMFTopoLoader** ppObj);
  HRESULT MFCreateTopology(                             IMFTopology** ppTopo);
  HRESULT MFCreateTopologyNode(                         MF_TOPOLOGY_TYPE NodeType, IMFTopologyNode** ppNode);
  HRESULT MFCreateTranscodeProfile(                     IMFTranscodeProfile** ppTranscodeProfile);
  HRESULT MFCreateTranscodeSinkActivate(                IMFActivate** ppActivate);
  STDAPI  MFCreateTranscodeTopology(                    IMFMediaSource* pSrc, LPCWSTR pwszOutputFilePath, IMFTranscodeProfile* pProfile, IMFTopology** ppTranscodeTopo);
  HRESULT MFCreateVideoRenderer(                        REFIID riidRenderer, void** ppVideoRenderer);
  HRESULT MFCreateVideoRendererActivate(                HWND hwndVideo, IMFActivate** ppActivate);
  HRESULT MFCreateWMAEncoderActivate(                   IMFMediaType* pMediaType, IPropertyStore* pEncodingConfigurationProperties, IMFActivate** ppActivate);
  HRESULT MFCreateWMVEncoderActivate(                   IMFMediaType* pMediaType, IPropertyStore* pEncodingConfigurationProperties, IMFActivate** ppActivate);
  HRESULT MFEnumDeviceSources(                          IMFAttributes* pAttributes, IMFActivate*** pppSourceActivate, UINT32* pcSourceActivate);
  HRESULT MFGetService(                                 IUnknown* punkObject, REFGUID guidService, REFIID riid, LPVOID* ppvObject);
  HRESULT MFGetSupportedMimeTypes(                      PROPVARIANT* pPropVarMimeTypeArray);
  HRESULT MFGetSupportedSchemes(                        PROPVARIANT* pPropVarSchemeArray);
  HRESULT MFGetTopoNodeCurrentType(                     IMFTopologyNode* pNode, DWORD dwStreamIndex, BOOL fOutput, IMFMediaType** ppType);
  HRESULT MFRequireProtectedEnvironment(                IMFPresentationDescriptor* pPresentationDescriptor);
  HRESULT MFShutdownObject(                             IUnknown* pUnk);
  HRESULT MFTranscodeGetAudioOutputAvailableTypes(      REFGUID guidSubType, DWORD dwMFTFlags, IMFAttributes* pCodecConfig, IMFCollection** ppAvailableTypes);
]]
ffi.load( 'Mf.dll' )

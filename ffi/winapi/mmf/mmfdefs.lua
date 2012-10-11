require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/multimedia' )
require( 'ffi/winapi/headers/directx' )
require( 'ffi/winapi/headers/gdi' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* INamedPropertyStore; //Interface
  typedef void* IMediaBuffer; //Interface
  typedef void* IDirect3DDeviceManager9; //Interface
  typedef void* IDirectXVideoAccelerationService; //Interface
  typedef void* IDirectXVideoDecoder; //Interface
  typedef void* IDirectXVideoDecoderService; //Interface
  typedef void* IDirectXVideoMemoryConfiguration; //Interface
  typedef void* IDirectXVideoProcessor; //Interface
  typedef void* IDirectXVideoProcessorService; //Interface
  typedef void* IDXVAHD_Device; //Interface
  typedef void* IDXVAHD_VideoProcessor; //Interface
  typedef void* IMF2DBuffer; //Interface
  typedef void* IMFActivate; //Interface
  typedef void* IMFASFContentInfo; //Interface
  typedef void* IMFASFIndexer; //Interface
  typedef void* IMFASFMultiplexer; //Interface
  typedef void* IMFASFMutualExclusion; //Interface
  typedef void* IMFASFProfile; //Interface
  typedef void* IMFASFSplitter; //Interface
  typedef void* IMFASFStreamConfig; //Interface
  typedef void* IMFASFStreamPrioritization; //Interface
  typedef void* IMFASFStreamSelector; //Interface
  typedef void* IMFAsyncCallback; //Interface
  typedef void* IMFAsyncResult; //Interface
  typedef void* IMFAttributes; //Interface
  typedef void* IMFAudioMediaType; //Interface
  typedef void* IMFAudioPolicy; //Interface
  typedef void* IMFAudioStreamVolume; //Interface
  typedef void* IMFByteStream; //Interface
  typedef void* IMFByteStreamBuffering; //Interface
  typedef void* IMFByteStreamCacheControl; //Interface
  typedef void* IMFByteStreamHandler; //Interface
  typedef void* IMFClock; //Interface
  typedef void* IMFClockStateSink; //Interface
  typedef void* IMFCollection; //Interface
  typedef void* IMFContentEnabler; //Interface
  typedef void* IMFContentProtectionManager; //Interface
  typedef void* IMFDRMNetHelper; //Interface
  typedef void* IMFFieldOfUseMFTUnlock; //Interface
  typedef void* IMFFinalizableMediaSink; //Interface
  typedef void* IMFGetService; //Interface
  typedef void* IMFInputTrustAuthority; //Interface
  typedef void* IMFLocalMFTRegistration; //Interface
  typedef void* IMFMediaBuffer; //Interface
  typedef void* IMFMediaEvent; //Interface
  typedef void* IMFMediaEventGenerator; //Interface
  typedef void* IMFMediaEventQueue; //Interface
  typedef void* IMFMediaSession; //Interface
  typedef void* IMFMediaSink; //Interface
  typedef void* IMFMediaSinkPreroll; //Interface
  typedef void* IMFMediaSource; //Interface
  typedef void* IMFMediaSourcePresentationProvider; //Interface
  typedef void* IMFMediaSourceTopologyProvider; //Interface
  typedef void* IMFMediaStream; //Interface
  typedef void* IMFMediaType; //Interface
  typedef void* IMFMediaTypeHandler; //Interface
  typedef void* IMFMetadata; //Interface
  typedef void* IMFMetadataProvider; //Interface
  typedef void* IMFNetCredential; //Interface
  typedef void* IMFNetCredentialCache; //Interface
  typedef void* IMFNetCredentialManager; //Interface
  typedef void* IMFNetProxyLocator; //Interface
  typedef void* IMFNetProxyLocatorFactory; //Interface
  typedef void* IMFNetSchemeHandlerConfig; //Interface
  typedef void* IMFObjectReferenceStream; //Interface
  typedef void* IMFOutputPolicy; //Interface
  typedef void* IMFOutputSchema; //Interface
  typedef void* IMFOutputTrustAuthority; //Interface
  typedef void* IMFPluginControl; //Interface
  typedef void* IMFPMediaItem; //Interface
  typedef void* IMFPMediaPlayer; //Interface
  typedef void* IMFPMediaPlayerCallback; //Interface
  typedef void* IMFPMPClient; //Interface
  typedef void* IMFPMPHost; //Interface
  typedef void* IMFPMPServer; //Interface
  typedef void* IMFPresentationClock; //Interface
  typedef void* IMFPresentationDescriptor; //Interface
  typedef void* IMFPresentationTimeSource; //Interface
  typedef void* IMFQualityAdvise; //Interface
  typedef void* IMFQualityAdvise2; //Interface
  typedef void* IMFQualityAdviseLimits; //Interface
  typedef void* IMFQualityManager; //Interface
  typedef void* IMFRateControl; //Interface
  typedef void* IMFRateSupport; //Interface
  typedef void* IMFReadWriteClassFactory; //Interface
  typedef void* IMFRealTimeClient; //Interface
  typedef void* IMFRemoteAsyncCallback; //Interface
  typedef void* IMFRemoteDesktopPlugin; //Interface
  typedef void* IMFRemoteProxy; //Interface
  typedef void* IMFSAMIStyle; //Interface
  typedef void* IMFSample; //Interface
  typedef void* IMFSampleGrabberSinkCallback; //Interface
  typedef void* IMFSampleGrabberSinkCallback2; //Interface
  typedef void* IMFSampleProtection; //Interface
  typedef void* IMFSaveJob; //Interface
  typedef void* IMFSchemeHandler; //Interface
  typedef void* IMFSecureChannel; //Interface
  typedef void* IMFSequencerSource; //Interface
  typedef void* IMFShutdown; //Interface
  typedef void* IMFSimpleAudioVolume; //Interface
  typedef void* IMFSinkWriter; //Interface
  typedef void* IMFSinkWriterCallback; //Interface
  typedef void* IMFSourceOpenMonitor; //Interface
  typedef void* IMFSourceReader; //Interface
  typedef void* IMFSourceReaderCallback; //Interface
  typedef void* IMFSourceResolver; //Interface
  typedef void* IMFSSLCertificateManager; //Interface
  typedef void* IMFStreamDescriptor; //Interface
  typedef void* IMFStreamingSinkConfig; //Interface
  typedef void* IMFStreamSink; //Interface
  typedef void* IMFTimecodeTranslate; //Interface
  typedef void* IMFTimer; //Interface
  typedef void* IMFTopoLoader; //Interface
  typedef void* IMFTopology; //Interface
  typedef void* IMFTopologyNode; //Interface
  typedef void* IMFTopologyNodeAttributeEditor; //Interface
  typedef void* IMFTranscodeProfile; //Interface
  typedef void* IMFTranscodeSinkInfoProvider; //Interface
  typedef void* IMFTransform; //Interface
  typedef void* IMFTrustedInput; //Interface
  typedef void* IMFTrustedOutput; //Interface
  typedef void* IMFVideoMediaType; //Interface
  typedef void* IMFVideoSampleAllocator; //Interface
  typedef void* IMFVideoSampleAllocatorCallback; //Interface
  typedef void* IMFVideoSampleAllocatorNotify; //Interface
  typedef void* IMFWorkQueueServices; //Interface
  typedef void* IDirect3DDevice9; //Interface
  typedef void* IDirect3DSurface9; //Interface
  typedef ULONGLONG QWORD; //Alias
  typedef LONGLONG MFTIME; //Alias
  typedef unsigned __int64 TOPOID; //Alias
  typedef unsigned __int64 MFWORKITEM_KEY; //Alias
  typedef LPVOID MFPERIODICCALLBACK; //Alias
  typedef DWORD MFSequencerElementId; //Alias
  static const MFSequencerElementId MFSEQUENCER_INVALID_ELEMENT_ID = 0xffffffff;
  typedef UINT MF_ATTRIBUTE_TYPE; //Alias
  static const MF_ATTRIBUTE_TYPE MF_ATTRIBUTE_UINT32 = 19;
  static const MF_ATTRIBUTE_TYPE MF_ATTRIBUTE_UINT64 = 21;
  static const MF_ATTRIBUTE_TYPE MF_ATTRIBUTE_DOUBLE = 5;
  static const MF_ATTRIBUTE_TYPE MF_ATTRIBUTE_GUID = 72;
  static const MF_ATTRIBUTE_TYPE MF_ATTRIBUTE_STRING = 31;
  static const MF_ATTRIBUTE_TYPE MF_ATTRIBUTE_BLOB = 0x1011;
  static const MF_ATTRIBUTE_TYPE MF_ATTRIBUTE_IUNKNOWN = 13;
  typedef UINT MF_ATTRIBUTES_MATCH_TYPE; //Alias
  static const MF_ATTRIBUTES_MATCH_TYPE MF_ATTRIBUTES_MATCH_OUR_ITEMS = 0;
  static const MF_ATTRIBUTES_MATCH_TYPE MF_ATTRIBUTES_MATCH_THEIR_ITEMS = 1;
  static const MF_ATTRIBUTES_MATCH_TYPE MF_ATTRIBUTES_MATCH_ALL_ITEMS = 2;
  static const MF_ATTRIBUTES_MATCH_TYPE MF_ATTRIBUTES_MATCH_INTERSECTION = 3;
  static const MF_ATTRIBUTES_MATCH_TYPE MF_ATTRIBUTES_MATCH_SMALLER = 4;
  typedef UINT MFBYTESTREAM_SEEK_ORIGIN; //Alias
  static const MFBYTESTREAM_SEEK_ORIGIN msoBegin = 0;
  static const MFBYTESTREAM_SEEK_ORIGIN msoCurrent = 1;
  typedef UINT MF_OBJECT_TYPE; //Alias
  static const MF_OBJECT_TYPE MF_OBJECT_MEDIASOURCE = 0;
  static const MF_OBJECT_TYPE MF_OBJECT_BYTESTREAM = 1;
  static const MF_OBJECT_TYPE MF_OBJECT_INVALID = 2;
  typedef UINT MFCLOCK_STATE; //Alias
  static const MFCLOCK_STATE MFCLOCK_STATE_INVALID = 0;
  static const MFCLOCK_STATE MFCLOCK_STATE_RUNNING = 1;
  static const MFCLOCK_STATE MFCLOCK_STATE_STOPPED = 2;
  static const MFCLOCK_STATE MFCLOCK_STATE_PAUSED = 3;
  typedef UINT MFPOLICYMANAGER_ACTION; //Alias
  static const MFPOLICYMANAGER_ACTION PEACTION_NO = 0;
  static const MFPOLICYMANAGER_ACTION PEACTION_PLAY = 1;
  static const MFPOLICYMANAGER_ACTION PEACTION_COPY = 2;
  static const MFPOLICYMANAGER_ACTION PEACTION_EXPORT = 3;
  static const MFPOLICYMANAGER_ACTION PEACTION_EXTRACT = 4;
  static const MFPOLICYMANAGER_ACTION PEACTION_RESERVED1 = 5;
  static const MFPOLICYMANAGER_ACTION PEACTION_RESERVED2 = 6;
  static const MFPOLICYMANAGER_ACTION PEACTION_RESERVED3 = 7;
  typedef UINT MF_TOPOLOGY_TYPE; //Alias
  static const MF_TOPOLOGY_TYPE MF_TOPOLOGY_OUTPUT_NODE = 0;
  static const MF_TOPOLOGY_TYPE MF_TOPOLOGY_SOURCESTREAM_NODE = 1;
  static const MF_TOPOLOGY_TYPE MF_TOPOLOGY_TRANSFORM_NODE = 2;
  static const MF_TOPOLOGY_TYPE MF_TOPOLOGY_TEE_NODE = 3;
  typedef UINT MFASYNC_WORKQUEUE_TYPE; //Alias
  static const MFASYNC_WORKQUEUE_TYPE MF_STANDARD_WORKQUEUE = 0;
  static const MFASYNC_WORKQUEUE_TYPE MF_WINDOW_WORKQUEUE = 1;
  typedef UINT MF_FILE_ACCESSMODE; //Alias
  static const MF_FILE_ACCESSMODE MF_ACCESSMODE_READ = 1;
  static const MF_FILE_ACCESSMODE MF_ACCESSMODE_WRITE = 2;
  static const MF_FILE_ACCESSMODE MF_ACCESSMODE_READWRITE = 3;
  typedef UINT EAllocationType; //Alias
  static const EAllocationType eAllocationTypeDynamic = 0;
  static const EAllocationType eAllocationTypeRT = 1;
  static const EAllocationType eAllocationTypePageable = 2;
  static const EAllocationType eAllocationTypeIgnore = 3;
  typedef UINT MFSHUTDOWN_STATUS; //Alias
  static const MFSHUTDOWN_STATUS MFSHUTDOWN_INITIATED = 0;
  static const MFSHUTDOWN_STATUS MFSHUTDOWN_COMPLETED = 1;
  typedef UINT MFSTREAMSINK_MARKER_TYPE; //Alias
  static const MFSTREAMSINK_MARKER_TYPE MFSTREAMSINK_MARKER_DEFAULT = 0;
  static const MFSTREAMSINK_MARKER_TYPE MFSTREAMSINK_MARKER_ENDOFSEGMENT = 1;
  static const MFSTREAMSINK_MARKER_TYPE MFSTREAMSINK_MARKER_TICK = 2;
  static const MFSTREAMSINK_MARKER_TYPE MFSTREAMSINK_MARKER_EVENT = 3;
  typedef UINT MF_FILE_OPENMODE; //Alias
  static const MF_FILE_OPENMODE MF_OPENMODE_FAIL_IF_NOT_EXIST = 0;
  static const MF_FILE_OPENMODE MF_OPENMODE_FAIL_IF_EXIST = 1;
  static const MF_FILE_OPENMODE MF_OPENMODE_RESET_IF_EXIST = 2;
  static const MF_FILE_OPENMODE MF_OPENMODE_APPEND_IF_EXIST = 3;
  static const MF_FILE_OPENMODE MF_OPENMODE_DELETE_IF_EXIST = 4;
  typedef UINT MF_URL_TRUST_STATUS; //Alias
  static const MF_URL_TRUST_STATUS MF_LICENSE_URL_UNTRUSTED = 0;
  static const MF_URL_TRUST_STATUS MF_LICENSE_URL_TRUSTED = 1;
  static const MF_URL_TRUST_STATUS MF_LICENSE_URL_TAMPERED = 2;
  typedef UINT MF_QUALITY_DROP_MODE; //Alias
  static const MF_QUALITY_DROP_MODE MF_DROP_MODE_NONE = 0;
  static const MF_QUALITY_DROP_MODE MF_DROP_MODE_1 = 0x1;
  static const MF_QUALITY_DROP_MODE MF_DROP_MODE_2 = 0x2;
  static const MF_QUALITY_DROP_MODE MF_DROP_MODE_3 = 0x3;
  static const MF_QUALITY_DROP_MODE MF_DROP_MODE_4 = 0x4;
  static const MF_QUALITY_DROP_MODE MF_DROP_MODE_5 = 0x5;
  typedef UINT MF_QUALITY_LEVEL; //Alias
  static const MF_QUALITY_LEVEL MF_QUALITY_NORMAL = 0;
  static const MF_QUALITY_LEVEL MF_QUALITY_NORMAL_MINUS_1 = 0x1;
  static const MF_QUALITY_LEVEL MF_QUALITY_NORMAL_MINUS_2 = 0x2;
  static const MF_QUALITY_LEVEL MF_QUALITY_NORMAL_MINUS_3 = 0x3;
  static const MF_QUALITY_LEVEL MF_QUALITY_NORMAL_MINUS_4 = 0x4;
  static const MF_QUALITY_LEVEL MF_QUALITY_NORMAL_MINUS_5 = 0x5;
  typedef UINT MFRATE_DIRECTION; //Alias
  static const MFRATE_DIRECTION MFRATE_FORWARD = 0;
  static const MFRATE_DIRECTION MFRATE_REVERSE = 1;
  typedef UINT MF_FILE_FLAGS; //Alias
  typedef struct MF_LEAKY_BUCKET_PAIR {
    DWORD dwBitrate;
    DWORD msBufferWindow;
  } MF_LEAKY_BUCKET_PAIR;
  typedef struct MFBYTESTREAM_BUFFERING_PARAMS {
    QWORD cbTotalFileSize;
    QWORD cbPlayableDataSize;
    MF_LEAKY_BUCKET_PAIR* prgBuckets;
    DWORD cBuckets;
    QWORD qwNetBufferingTime;
    QWORD qwExtraBufferingTimeDuringSeek;
    QWORD qwPlayDuration;
    float dRate;
  } MFBYTESTREAM_BUFFERING_PARAMS;
  typedef DWORD MFCLOCK_RELATIONAL_FLAGS; //Alias
  typedef DWORD WINAPI_MFCLOCK_JITTER; //Alias
  static const WINAPI_MFCLOCK_JITTER MFCLOCK_FREQUENCY_HNS = 10000000;
  static const WINAPI_MFCLOCK_JITTER MFCLOCK_TOLERANCE_UNKNOWN = 50000;
  static const WINAPI_MFCLOCK_JITTER MFCLOCK_JITTER_ISR = 1000;
  static const WINAPI_MFCLOCK_JITTER MFCLOCK_JITTER_DPC = 4000;
  static const WINAPI_MFCLOCK_JITTER MFCLOCK_JITTER_PASSIVE = 10000;
  typedef struct MFCLOCK_PROPERTIES {
    unsigned __int64 qwCorrelationRate;
    GUID guidClockId;
    MFCLOCK_RELATIONAL_FLAGS dwClockFlags;
    unsigned __int64 qwClockFrequency;
    DWORD dwClockTolerance;
    WINAPI_MFCLOCK_JITTER dwClockJitter;
  } MFCLOCK_PROPERTIES;
  typedef struct MFINPUTTRUSTAUTHORITY_ACCESS_ACTION {
    MFPOLICYMANAGER_ACTION Action;
    BYTE* pbTicket;
    DWORD cbTicket;
  } MFINPUTTRUSTAUTHORITY_ACCESS_ACTION;
  typedef struct MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS {
    DWORD dwSize;
    DWORD dwVer;
    DWORD cbSignatureOffset;
    DWORD cbSignatureSize;
    DWORD cbExtensionOffset;
    DWORD cbExtensionSize;
    DWORD cActions;
    MFINPUTTRUSTAUTHORITY_ACCESS_ACTION rgOutputActions[1];
  } MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS;
  typedef UINT32 MFT_ENUM_FLAG; //Alias
  typedef struct MFT_REGISTER_TYPE_INFO {
    GUID guidMajorType;
    GUID guidSubtype;
  } MFT_REGISTER_TYPE_INFO;
  typedef struct MFT_REGISTRATION_INFO {
    CLSID clsid;
    GUID guidCategory;
    MFT_ENUM_FLAG uiFlags;
    LPCWSTR pszName;
    DWORD cInTypes;
    MFT_REGISTER_TYPE_INFO* pInTypes;
    DWORD cOutTypes;
    MFT_REGISTER_TYPE_INFO* pOutTypes;
  } MFT_REGISTRATION_INFO;
  typedef UINT MediaEventType; //Alias
  static const MediaEventType MEUnknown = 0;
  static const MediaEventType MEError = 1;
  static const MediaEventType MEExtendedType = 2;
  static const MediaEventType MENonFatalError = 3;
  static const MediaEventType MESessionUnknown = 100;
  static const MediaEventType MESessionTopologySet = 101;
  static const MediaEventType MESessionTopologiesCleared = 102;
  static const MediaEventType MESessionStarted = 103;
  static const MediaEventType MESessionPaused = 104;
  static const MediaEventType MESessionStopped = 105;
  static const MediaEventType MESessionClosed = 106;
  static const MediaEventType MESessionEnded = 107;
  static const MediaEventType MESessionRateChanged = 108;
  static const MediaEventType MESessionScrubSampleComplete = 109;
  static const MediaEventType MESessionCapabilitiesChanged = 110;
  static const MediaEventType MESessionTopologyStatus = 111;
  static const MediaEventType MESessionNotifyPresentationTime = 112;
  static const MediaEventType MENewPresentation = 113;
  static const MediaEventType MELicenseAcquisitionStart = 114;
  static const MediaEventType MELicenseAcquisitionCompleted = 115;
  static const MediaEventType MEIndividualizationStart = 116;
  static const MediaEventType MEIndividualizationCompleted = 117;
  static const MediaEventType MEEnablerProgress = 118;
  static const MediaEventType MEEnablerCompleted = 119;
  static const MediaEventType MEPolicyError = 120;
  static const MediaEventType MEPolicyReport = 121;
  static const MediaEventType MEBufferingStarted = 122;
  static const MediaEventType MEBufferingStopped = 123;
  static const MediaEventType MEConnectStart = 124;
  static const MediaEventType MEConnectEnd = 125;
  static const MediaEventType MEReconnectStart = 126;
  static const MediaEventType MEReconnectEnd = 127;
  static const MediaEventType MERendererEvent = 128;
  static const MediaEventType MESessionStreamSinkFormatChanged = 129;
  static const MediaEventType MESourceUnknown = 200;
  static const MediaEventType MESourceStarted = 201;
  static const MediaEventType MEStreamStarted = 202;
  static const MediaEventType MESourceSeeked = 203;
  static const MediaEventType MEStreamSeeked = 204;
  static const MediaEventType MENewStream = 205;
  static const MediaEventType MEUpdatedStream = 206;
  static const MediaEventType MESourceStopped = 207;
  static const MediaEventType MEStreamStopped = 208;
  static const MediaEventType MESourcePaused = 209;
  static const MediaEventType MEStreamPaused = 210;
  static const MediaEventType MEEndOfPresentation = 211;
  static const MediaEventType MEEndOfStream = 212;
  static const MediaEventType MEMediaSample = 213;
  static const MediaEventType MEStreamTick = 214;
  static const MediaEventType MEStreamThinMode = 215;
  static const MediaEventType MEStreamFormatChanged = 216;
  static const MediaEventType MESourceRateChanged = 217;
  static const MediaEventType MEEndOfPresentationSegment = 218;
  static const MediaEventType MESourceCharacteristicsChanged = 219;
  static const MediaEventType MESourceRateChangeRequested = 220;
  static const MediaEventType MESourceMetadataChanged = 221;
  static const MediaEventType MESequencerSourceTopologyUpdated = 222;
  static const MediaEventType MESinkUnknown = 300;
  static const MediaEventType MEStreamSinkStarted = 301;
  static const MediaEventType MEStreamSinkStopped = 302;
  static const MediaEventType MEStreamSinkPaused = 303;
  static const MediaEventType MEStreamSinkRateChanged = 304;
  static const MediaEventType MEStreamSinkRequestSample = 305;
  static const MediaEventType MEStreamSinkMarker = 306;
  static const MediaEventType MEStreamSinkPrerolled = 307;
  static const MediaEventType MEStreamSinkScrubSampleComplete = 308;
  static const MediaEventType MEStreamSinkFormatChanged = 309;
  static const MediaEventType MEStreamSinkDeviceChanged = 310;
  static const MediaEventType MEQualityNotify = 311;
  static const MediaEventType MESinkInvalidated = 312;
  static const MediaEventType MEAudioSessionNameChanged = 313;
  static const MediaEventType MEAudioSessionVolumeChanged = 314;
  static const MediaEventType MEAudioSessionDeviceRemoved = 315;
  static const MediaEventType MEAudioSessionServerShutdown = 316;
  static const MediaEventType MEAudioSessionGroupingParamChanged = 317;
  static const MediaEventType MEAudioSessionIconChanged = 318;
  static const MediaEventType MEAudioSessionFormatChanged = 319;
  static const MediaEventType MEAudioSessionDisconnected = 320;
  static const MediaEventType MEAudioSessionExclusiveModeOverride = 321;
  static const MediaEventType METrustUnknown = 400;
  static const MediaEventType MEPolicyChanged = 401;
  static const MediaEventType MEContentProtectionMessage = 402;
  static const MediaEventType MEPolicySet = 403;
  static const MediaEventType MEWMDRMLicenseBackupCompleted = 500;
  static const MediaEventType MEWMDRMLicenseBackupProgress = 501;
  static const MediaEventType MEWMDRMLicenseRestoreCompleted = 502;
  static const MediaEventType MEWMDRMLicenseRestoreProgress = 503;
  static const MediaEventType MEWMDRMLicenseAcquisitionCompleted = 506;
  static const MediaEventType MEWMDRMIndividualizationCompleted = 508;
  static const MediaEventType MEWMDRMIndividualizationProgress = 513;
  static const MediaEventType MEWMDRMProximityCompleted = 514;
  static const MediaEventType MEWMDRMLicenseStoreCleaned = 515;
  static const MediaEventType MEWMDRMRevocationDownloadCompleted = 516;
  static const MediaEventType METransformUnknown = 600;
  static const MediaEventType METransformNeedInput = 601;
  static const MediaEventType METransformHaveOutput = 602;
  static const MediaEventType METransformDrainComplete = 603;
  static const MediaEventType METransformMarker = 604;
  typedef struct MFNetCredentialManagerGetParam {
    HRESULT hrOp;
    BOOL fAllowLoggedOnUser;
    BOOL fClearTextPackage;
    LPCWSTR pszUrl;
    LPCWSTR pszSite;
    LPCWSTR pszRealm;
    LPCWSTR pszPackage;
    LONG nRetries;
  } MFNetCredentialManagerGetParam;
  typedef struct MF_SINK_WRITER_STATISTICS {
    DWORD cb;
    LONGLONG llLastTimestampReceived;
    LONGLONG llLastTimestampEncoded;
    LONGLONG llLastTimestampProcessed;
    LONGLONG llLastStreamTickReceived;
    LONGLONG llLastSinkSampleRequest;
    QWORD qwNumSamplesReceived;
    QWORD qwNumSamplesEncoded;
    QWORD qwNumSamplesProcessed;
    QWORD qwNumStreamTicksReceived;
    DWORD dwByteCountQueued;
    QWORD qwByteCountProcessed;
    DWORD dwNumOutstandingSinkSampleRequests;
    DWORD dwAverageSampleRateReceived;
    DWORD dwAverageSampleRateEncoded;
    DWORD dwAverageSampleRateProcessed;
  } MF_SINK_WRITER_STATISTICS;
  typedef struct MF_TRANSCODE_SINK_INFO {
    DWORD dwVideoStreamID;
    IMFMediaType* pVideoMediaType;
    DWORD dwAudioStreamID;
    IMFMediaType* pAudioMediaType;
  } MF_TRANSCODE_SINK_INFO;
  typedef UINT MFNETSOURCE_PROTOCOL_TYPE; //Alias
  static const MFNETSOURCE_PROTOCOL_TYPE MFNETSOURCE_UNDEFINED = 0;
  static const MFNETSOURCE_PROTOCOL_TYPE MFNETSOURCE_HTTP = 0x1;
  static const MFNETSOURCE_PROTOCOL_TYPE MFNETSOURCE_RTSP = 0x2;
  static const MFNETSOURCE_PROTOCOL_TYPE MFNETSOURCE_FILE = 0x3;
  static const MFNETSOURCE_PROTOCOL_TYPE MFNETSOURCE_MULTICAST = 0x4;
  typedef union WINAPI_MFTOPONODE_ATTRIBUTE_UPDATE_u {
    UINT32 u32;
    UINT64 u64;
    double d;
  } WINAPI_MFTOPONODE_ATTRIBUTE_UPDATE_u;
  typedef struct MFTOPONODE_ATTRIBUTE_UPDATE {
    TOPOID NodeId;
    GUID guidAttributeKey;
    MF_ATTRIBUTE_TYPE attrType;
    WINAPI_MFTOPONODE_ATTRIBUTE_UPDATE_u ;
  } MFTOPONODE_ATTRIBUTE_UPDATE;
  typedef UINT32 MFP_CREATION_OPTIONS; //Alias
  typedef UINT MFVideoInterlaceMode; //Alias
  static const MFVideoInterlaceMode MFVideoInterlace_Unknown = 0;
  static const MFVideoInterlaceMode MFVideoInterlace_Progressive = 2;
  static const MFVideoInterlaceMode MFVideoInterlace_FieldInterleavedUpperFirst = 3;
  static const MFVideoInterlaceMode MFVideoInterlace_FieldInterleavedLowerFirst = 4;
  static const MFVideoInterlaceMode MFVideoInterlace_FieldSingleUpper = 5;
  static const MFVideoInterlaceMode MFVideoInterlace_FieldSingleLower = 6;
  static const MFVideoInterlaceMode MFVideoInterlace_MixedInterlaceOrProgressive = 7;
  typedef UINT MFVideoTransferFunction; //Alias
  static const MFVideoTransferFunction MFVideoTransFunc_Unknown = 0;
  static const MFVideoTransferFunction MFVideoTransFunc_10 = 1;
  static const MFVideoTransferFunction MFVideoTransFunc_18 = 2;
  static const MFVideoTransferFunction MFVideoTransFunc_20 = 3;
  static const MFVideoTransferFunction MFVideoTransFunc_22 = 4;
  static const MFVideoTransferFunction MFVideoTransFunc_709 = 5;
  static const MFVideoTransferFunction MFVideoTransFunc_240M = 6;
  static const MFVideoTransferFunction MFVideoTransFunc_sRGB = 7;
  static const MFVideoTransferFunction MFVideoTransFunc_28 = 8;
  static const MFVideoTransferFunction MFVideoTransFunc_Log_100 = 9;
  static const MFVideoTransferFunction MFVideoTransFunc_Log_316 = 10;
  static const MFVideoTransferFunction MFVideoTransFunc_709_sym = 11;
  typedef UINT MFVideoPrimaries; //Alias
  static const MFVideoPrimaries MFVideoPrimaries_Unknown = 0;
  static const MFVideoPrimaries MFVideoPrimaries_reserved = 1;
  static const MFVideoPrimaries MFVideoPrimaries_BT709 = 2;
  static const MFVideoPrimaries MFVideoPrimaries_BT470_2_SysM = 3;
  static const MFVideoPrimaries MFVideoPrimaries_BT470_2_SysBG = 4;
  static const MFVideoPrimaries MFVideoPrimaries_SMPTE170M = 5;
  static const MFVideoPrimaries MFVideoPrimaries_SMPTE240M = 6;
  static const MFVideoPrimaries MFVideoPrimaries_EBU3213 = 7;
  static const MFVideoPrimaries MFVideoPrimaries_SMPTE_C = 8;
  typedef UINT MFVideoLighting; //Alias
  static const MFVideoLighting MFVideoLighting_Unknown = 0;
  static const MFVideoLighting MFVideoLighting_bright = 1;
  static const MFVideoLighting MFVideoLighting_office = 2;
  static const MFVideoLighting MFVideoLighting_dim = 3;
  static const MFVideoLighting MFVideoLighting_dark = 4;
  typedef UINT MFVideoTransferMatrix; //Alias
  static const MFVideoTransferMatrix MFVideoTransferMatrix_Unknown = 0;
  static const MFVideoTransferMatrix MFVideoTransferMatrix_BT709 = 1;
  static const MFVideoTransferMatrix MFVideoTransferMatrix_BT601 = 2;
  static const MFVideoTransferMatrix MFVideoTransferMatrix_SMPTE240M = 3;
  typedef UINT MFVideoChromaSubsampling; //Alias
  typedef UINT MFNominalRange; //Alias
  static const MFNominalRange MFNominalRange_Unknown = 0;
  static const MFNominalRange MFNominalRange_0_255 = 1;
  static const MFNominalRange MFNominalRange_16_235 = 2;
  static const MFNominalRange MFNominalRange_48_208 = 3;
  static const MFNominalRange MFNominalRange_64_127 = 4;
  typedef unsigned __int64 MFVideoFlags; //Alias
  typedef struct MFRatio {
    DWORD Numerator;
    DWORD Denominator;
  } MFRatio;
  typedef struct MFOffset {
    WORD fract;
    short value;
  } MFOffset;
  typedef struct MFVideoArea {
    MFOffset OffsetX;
    MFOffset OffsetY;
    SIZE Area;
  } MFVideoArea;
  typedef struct MFVideoInfo {
    DWORD dwWidth;
    DWORD dwHeight;
    MFRatio PixelAspectRatio;
    MFVideoChromaSubsampling SourceChromaSubsampling;
    MFVideoInterlaceMode InterlaceMode;
    MFVideoTransferFunction TransferFunction;
    MFVideoPrimaries ColorPrimaries;
    MFVideoTransferMatrix TransferMatrix;
    MFVideoLighting SourceLighting;
    MFRatio FramesPerSecond;
    MFNominalRange NominalRange;
    MFVideoArea GeometricAperture;
    MFVideoArea MinimumDisplayAperture;
    MFVideoArea PanScanAperture;
    MFVideoFlags VideoFlags;
  } MFVideoInfo;
  typedef struct MFAYUVSample {
    BYTE bCrValue;
    BYTE bCbValue;
    BYTE bYValue;
    BYTE bSampleAlpha8;
  } MFAYUVSample;
  typedef struct MFARGB {
    BYTE rgbBlue;
    BYTE rgbGreen;
    BYTE rgbRed;
    BYTE rgbAlpha;
  } MFARGB;
  typedef union MFPaletteEntry {
    MFARGB ARGB;
    MFAYUVSample AYCbCr;
  } MFPaletteEntry;
  typedef struct MFVideoSurfaceInfo {
    DWORD Format;
    DWORD PaletteEntries;
    MFPaletteEntry Palette[1];
  } MFVideoSurfaceInfo;
  typedef struct MFVideoCompressedInfo {
    LONGLONG AvgBitrate;
    LONGLONG AvgBitErrorRate;
    DWORD MaxKeyFrameSpacing;
  } MFVideoCompressedInfo;
  typedef struct MFVIDEOFORMAT {
    DWORD dwSize;
    MFVideoInfo videoInfo;
    GUID guidFormat;
    MFVideoCompressedInfo compressedInfo;
    MFVideoSurfaceInfo surfaceInfo;
  } MFVIDEOFORMAT;
  typedef struct ASF_INDEX_IDENTIFIER {
    GUID guidIndexType;
    WORD wStreamNumber;
  } ASF_INDEX_IDENTIFIER;
  typedef struct ASF_MUX_STATISTICS {
    DWORD cFramesWritten;
    DWORD cFramesDropped;
  } ASF_MUX_STATISTICS;
  typedef UINT ASF_SELECTION_STATUS; //Alias
  static const ASF_SELECTION_STATUS ASF_STATUS_NOTSELECTED = 0;
  static const ASF_SELECTION_STATUS ASF_STATUS_CLEANPOINTSONLY = 1;
  static const ASF_SELECTION_STATUS ASF_STATUS_ALLDATAUNITS = 2;
  typedef UINT MFT_MESSAGE_TYPE; //Alias
  static const MFT_MESSAGE_TYPE MFT_MESSAGE_COMMAND_FLUSH = 0;
  static const MFT_MESSAGE_TYPE MFT_MESSAGE_COMMAND_DRAIN = 0x1;
  static const MFT_MESSAGE_TYPE MFT_MESSAGE_SET_D3D_MANAGER = 0x2;
  static const MFT_MESSAGE_TYPE MFT_MESSAGE_DROP_SAMPLES = 0x3;
  static const MFT_MESSAGE_TYPE MFT_MESSAGE_NOTIFY_BEGIN_STREAMING = 0x10000000;
  static const MFT_MESSAGE_TYPE MFT_MESSAGE_NOTIFY_END_STREAMING = 0x10000001;
  static const MFT_MESSAGE_TYPE MFT_MESSAGE_NOTIFY_END_OF_STREAM = 0x10000002;
  static const MFT_MESSAGE_TYPE MFT_MESSAGE_NOTIFY_START_OF_STREAM = 0x10000003;
  static const MFT_MESSAGE_TYPE MFT_MESSAGE_COMMAND_MARKER = 0x20000000;
  typedef DWORD MFT_INPUT_STREAM_INFO_FLAGS; //Alias
  typedef struct MFT_INPUT_STREAM_INFO {
    LONGLONG hnsMaxLatency;
    MFT_INPUT_STREAM_INFO_FLAGS dwFlags;
    DWORD cbSize;
    DWORD cbMaxLookahead;
    DWORD cbAlignment;
  } MFT_INPUT_STREAM_INFO;
  typedef DWORD MFT_OUTPUT_STREAM_INFO_FLAGS; //Alias
  typedef struct MFT_OUTPUT_STREAM_INFO {
    MFT_OUTPUT_STREAM_INFO_FLAGS dwFlags;
    DWORD cbSize;
    DWORD cbAlignment;
  } MFT_OUTPUT_STREAM_INFO;
  typedef struct MFT_OUTPUT_DATA_BUFFER {
    DWORD dwStreamID;
    IMFSample* pSample;
    DWORD dwStatus;
    IMFCollection* pEvents;
  } MFT_OUTPUT_DATA_BUFFER;
  typedef UINT MFStandardVideoFormat; //Alias
  static const MFStandardVideoFormat MFStdVideoFormat_reserved = 0;
  static const MFStandardVideoFormat MFStdVideoFormat_NTSC = 1;
  static const MFStandardVideoFormat MFStdVideoFormat_PAL = 2;
  static const MFStandardVideoFormat MFStdVideoFormat_DVD_NTSC = 3;
  static const MFStandardVideoFormat MFStdVideoFormat_DVD_PAL = 4;
  static const MFStandardVideoFormat MFStdVideoFormat_DV_PAL = 5;
  static const MFStandardVideoFormat MFStdVideoFormat_DV_NTSC = 6;
  static const MFStandardVideoFormat MFStdVideoFormat_ATSC_SD480i = 7;
  static const MFStandardVideoFormat MFStdVideoFormat_ATSC_HD1080i = 8;
  static const MFStandardVideoFormat MFStdVideoFormat_ATSC_HD720p = 9;
  typedef UINT32 MFP_MEDIAITEM_CHARACTERISTICS; //Alias
  typedef UINT MFP_MEDIAPLAYER_STATE; //Alias
  static const MFP_MEDIAPLAYER_STATE MFP_MEDIAPLAYER_STATE_EMPTY = 0;
  static const MFP_MEDIAPLAYER_STATE MFP_MEDIAPLAYER_STATE_STOPPED = 0x1;
  static const MFP_MEDIAPLAYER_STATE MFP_MEDIAPLAYER_STATE_PLAYING = 0x2;
  static const MFP_MEDIAPLAYER_STATE MFP_MEDIAPLAYER_STATE_PAUSED = 0x3;
  static const MFP_MEDIAPLAYER_STATE MFP_MEDIAPLAYER_STATE_SHUTDOWN = 0x4;
  typedef struct MFVideoNormalizedRect {
    float left;
    float top;
    float right;
    float bottom;
  } MFVideoNormalizedRect;
  typedef UINT MFP_EVENT_TYPE; //Alias
  static const MFP_EVENT_TYPE MFP_EVENT_TYPE_PLAY = 0;
  static const MFP_EVENT_TYPE MFP_EVENT_TYPE_PAUSE = 1;
  static const MFP_EVENT_TYPE MFP_EVENT_TYPE_STOP = 2;
  static const MFP_EVENT_TYPE MFP_EVENT_TYPE_POSITION_SET = 3;
  static const MFP_EVENT_TYPE MFP_EVENT_TYPE_RATE_SET = 4;
  static const MFP_EVENT_TYPE MFP_EVENT_TYPE_MEDIAITEM_CREATED = 5;
  static const MFP_EVENT_TYPE MFP_EVENT_TYPE_MEDIAITEM_SET = 6;
  static const MFP_EVENT_TYPE MFP_EVENT_TYPE_FRAME_STEP = 7;
  static const MFP_EVENT_TYPE MFP_EVENT_TYPE_MEDIAITEM_CLEARED = 8;
  static const MFP_EVENT_TYPE MFP_EVENT_TYPE_MF = 9;
  static const MFP_EVENT_TYPE MFP_EVENT_TYPE_ERROR = 10;
  static const MFP_EVENT_TYPE MFP_EVENT_TYPE_PLAYBACK_ENDED = 11;
  static const MFP_EVENT_TYPE MFP_EVENT_TYPE_ACQUIRE_USER_CREDENTIAL = 12;
  typedef struct MFP_EVENT_HEADER {
    MFP_EVENT_TYPE eEventType;
    HRESULT hrEvent;
    IMFPMediaPlayer* pMediaPlayer;
    MFP_MEDIAPLAYER_STATE eState;
    IPropertyStore* pPropertyStore;
  } MFP_EVENT_HEADER;
  typedef union DXVA2_ExtendedFormat {
    UINT value;
  } DXVA2_ExtendedFormat;
  typedef struct DXVA2_Frequency {
    UINT Numerator;
    UINT Denominator;
  } DXVA2_Frequency;
  typedef struct DXVA2_VideoDesc {
    UINT SampleWidth;
    UINT SampleHeight;
    DXVA2_ExtendedFormat SampleFormat;
    D3DFORMAT Format;
    DXVA2_Frequency InputSampleFreq;
    DXVA2_Frequency OutputFrameFreq;
    UINT UABProtectionLevel;
    UINT Reserved;
  } DXVA2_VideoDesc;
  typedef DWORD WINAPI_DXVA2_BufferType; //Alias
  static const WINAPI_DXVA2_BufferType DXVA2_PictureParametersBufferType = 0;
  static const WINAPI_DXVA2_BufferType DXVA2_MacroBlockControlBufferType = 1;
  static const WINAPI_DXVA2_BufferType DXVA2_ResidualDifferenceBufferType = 2;
  static const WINAPI_DXVA2_BufferType DXVA2_DeblockingControlBufferType = 3;
  static const WINAPI_DXVA2_BufferType DXVA2_InverseQuantizationMatrixBufferType = 4;
  static const WINAPI_DXVA2_BufferType DXVA2_SliceControlBufferType = 5;
  static const WINAPI_DXVA2_BufferType DXVA2_BitStreamDateBufferType = 6;
  static const WINAPI_DXVA2_BufferType DXVA2_MotionVectorBuffer = 7;
  static const WINAPI_DXVA2_BufferType DXVA2_FilmGrainBuffer = 8;
  typedef struct DXVA2_DecodeBufferDesc {
    WINAPI_DXVA2_BufferType CompressedBufferType;
    UINT BufferIndex;
    UINT DataOffset;
    UINT DataSize;
    UINT FirstMBaddress;
    UINT NumMBsInBuffer;
    UINT Width;
    UINT Height;
    UINT Stride;
    UINT ReservedBits;
    PVOID pvPVPState;
  } DXVA2_DecodeBufferDesc;
  typedef struct DXVA2_DecodeExtensionData {
    UINT Function;
    PVOID pPrivateInputData;
    UINT PrivateInputDataSize;
    PVOID pPrivateOutputData;
    UINT PrivateOutputDataSize;
  } DXVA2_DecodeExtensionData;
  typedef struct DXVA2_DecodeExecuteParams {
    UINT NumCompBuffers;
    DXVA2_DecodeBufferDesc* pCompressedBuffers;
    DXVA2_DecodeExtensionData* pExtensionData;
  } DXVA2_DecodeExecuteParams;
  typedef struct DXVA2_ConfigPictureDecode {
    GUID guidConfigBitstreamEncryption;
    GUID guidConfigMBcontrolEncryption;
    GUID guidConfigResidDiffEncryption;
    UINT ConfigBitstreamRaw;
    UINT ConfigMBcontrolRasterOrder;
    UINT ConfigResidDiffHost;
    UINT ConfigSpatialResid8;
    UINT ConfigResid8Subtraction;
    UINT ConfigSpatialHost8or9Clipping;
    UINT ConfigSpatialResidInterleaved;
    UINT ConfigIntraResidUnsigned;
    UINT ConfigResidDiffAccelerator;
    UINT ConfigHostInverseScan;
    UINT ConfigSpecificIDCT;
    UINT Config4GroupedCoefs;
    USHORT ConfigMinRenderTargetBuffCount;
    USHORT ConfigDecoderSpecific;
  } DXVA2_ConfigPictureDecode;
  typedef UINT DXVA2_SurfaceType; //Alias
  static const DXVA2_SurfaceType DXVA2_SurfaceType_DecoderRenderTarget = 0;
  static const DXVA2_SurfaceType DXVA2_SurfaceType_ProcessorRenderTarget = 1;
  static const DXVA2_SurfaceType DXVA2_SurfaceType_D3DRenderTargetTexture = 2;
  typedef UINT WINAPI_DXVA2_VPDev; //Alias
  typedef UINT WINAPI_DXVA2_DeinterlaceTech; //Alias
  typedef UINT WINAPI_DXVA2_ProcAmp; //Alias
  typedef UINT WINAPI_DXVA2_VideoProcess; //Alias
  typedef UINT WINAPI_DXVA2_NoiseFilterTech; //Alias
  typedef UINT WINAPI_DXVA2_DetailFilterTech; //Alias
  typedef struct DXVA2_VideoProcessorCaps {
    WINAPI_DXVA2_VPDev DeviceCaps;
    D3DPOOL InputPool;
    UINT NumForwardRefSamples;
    UINT NumBackwardRefSamples;
    UINT Reserved;
    WINAPI_DXVA2_DeinterlaceTech DeinterlaceTechnology;
    WINAPI_DXVA2_ProcAmp ProcAmpControlCaps;
    WINAPI_DXVA2_VideoProcess VideoProcessorOperations;
    WINAPI_DXVA2_NoiseFilterTech NoiseFilterTechnology;
    WINAPI_DXVA2_DetailFilterTech DetailFilterTechnology;
  } DXVA2_VideoProcessorCaps;
  typedef struct WINAPI_DXVA2_Fixed32_s {
    USHORT Fraction;
    SHORT Value;
  } WINAPI_DXVA2_Fixed32_s;
  typedef union DXVA2_Fixed32 {
    WINAPI_DXVA2_Fixed32_s ;
    LONG ll;
  } DXVA2_Fixed32;
  typedef struct DXVA2_ValueRange {
    DXVA2_Fixed32 MinValue;
    DXVA2_Fixed32 MaxValue;
    DXVA2_Fixed32 DefaultValue;
    DXVA2_Fixed32 StepSize;
  } DXVA2_ValueRange;
  typedef DWORD WINAPI_DXVA2_DestData; //Alias
  typedef struct DXVA2_AYUVSample16 {
    USHORT Cr;
    USHORT Cb;
    USHORT Y;
    USHORT Alpha;
  } DXVA2_AYUVSample16;
  typedef struct DXVA2_ProcAmpValues {
    DXVA2_Fixed32 Brightness;
    DXVA2_Fixed32 Contrast;
    DXVA2_Fixed32 Hue;
    DXVA2_Fixed32 Saturation;
  } DXVA2_ProcAmpValues;
  typedef struct DXVA2_FilterValues {
    DXVA2_Fixed32 Level;
    DXVA2_Fixed32 Threshold;
    DXVA2_Fixed32 Radius;
  } DXVA2_FilterValues;
  typedef struct DXVA2_VideoProcessBltParams {
    REFERENCE_TIME TargetFrame;
    RECT TargetRect;
    SIZE ConstrictionSize;
    UINT StreamingFlags;
    DXVA2_AYUVSample16 BackgroundColor;
    DXVA2_ExtendedFormat DestFormat;
    DXVA2_ProcAmpValues ProcAmpValues;
    DXVA2_Fixed32 Alpha;
    DXVA2_FilterValues NoiseFilterLuma;
    DXVA2_FilterValues NoiseFilterChroma;
    DXVA2_FilterValues DetailFilterLuma;
    DXVA2_FilterValues DetailFilterChroma;
    WINAPI_DXVA2_DestData DestData;
  } DXVA2_VideoProcessBltParams;
  typedef struct DXVA2_AYUVSample8 {
    UCHAR Cr;
    UCHAR Cb;
    UCHAR Y;
    UCHAR Alpha;
  } DXVA2_AYUVSample8;
  typedef struct DXVA2_VideoSample {
    REFERENCE_TIME Start;
    REFERENCE_TIME End;
    DXVA2_ExtendedFormat SampleFormat;
    IDirect3DSurface9* SrcSurface;
    RECT SrcRect;
    RECT DstRect;
    DXVA2_AYUVSample8 Pal[16];
    DXVA2_Fixed32 PlanarAlpha;
    DWORD SampleData;
  } DXVA2_VideoSample;
  typedef struct MPEG1VIDEOINFO {
    VIDEOINFOHEADER hdr;
    DWORD dwStartTimeCode;
    DWORD cbSequenceHeader;
    BYTE bSequenceHeader[1];
  } MPEG1VIDEOINFO;
  typedef DWORD AM_MPEG2Profile; //Alias
  static const AM_MPEG2Profile AM_MPEG2Profile_Simple = 1;
  static const AM_MPEG2Profile AM_MPEG2Profile_Main = 2;
  static const AM_MPEG2Profile AM_MPEG2Profile_SNRScalable = 3;
  static const AM_MPEG2Profile AM_MPEG2Profile_SpatiallyScalable = 4;
  static const AM_MPEG2Profile AM_MPEG2Profile_High = 5;
  typedef DWORD AM_MPEG2Level; //Alias
  static const AM_MPEG2Level AM_MPEG2Level_Low = 1;
  static const AM_MPEG2Level AM_MPEG2Level_Main = 2;
  static const AM_MPEG2Level AM_MPEG2Level_High1440 = 3;
  static const AM_MPEG2Level AM_MPEG2Level_High = 4;
  typedef DWORD WINAPI_AMMPEG2_FLAGS; //Alias
  typedef struct MPEG2VIDEOINFO {
    VIDEOINFOHEADER2 hdr;
    DWORD dwStartTimeCode;
    DWORD cbSequenceHeader;
    AM_MPEG2Profile dwProfile;
    AM_MPEG2Level dwLevel;
    WINAPI_AMMPEG2_FLAGS dwFlags;
    DWORD dwSequenceHeader[1];
  } MPEG2VIDEOINFO;
  typedef UINT DXVAHD_FILTER; //Alias
  static const DXVAHD_FILTER DXVAHD_FILTER_BRIGHTNESS = 0;
  static const DXVAHD_FILTER DXVAHD_FILTER_CONTRAST = 1;
  static const DXVAHD_FILTER DXVAHD_FILTER_HUE = 2;
  static const DXVAHD_FILTER DXVAHD_FILTER_SATURATION = 3;
  static const DXVAHD_FILTER DXVAHD_FILTER_NOISE_REDUCTION = 4;
  static const DXVAHD_FILTER DXVAHD_FILTER_EDGE_ENHANCEMENT = 5;
  static const DXVAHD_FILTER DXVAHD_FILTER_ANAMORPHIC_SCALING = 6;
  typedef UINT DXVAHD_SURFACE_TYPE; //Alias
  static const DXVAHD_SURFACE_TYPE DXVAHD_SURFACE_TYPE_VIDEO_INPUT = 0;
  static const DXVAHD_SURFACE_TYPE DXVAHD_SURFACE_TYPE_VIDEO_INPUT_PRIVATE = 1;
  static const DXVAHD_SURFACE_TYPE DXVAHD_SURFACE_TYPE_VIDEO_OUTPUT = 2;
  typedef UINT DXVAHD_BLT_STATE; //Alias
  static const DXVAHD_BLT_STATE DXVAHD_BLT_STATE_TARGET_RECT = 0;
  static const DXVAHD_BLT_STATE DXVAHD_BLT_STATE_BACKGROUND_COLOR = 1;
  static const DXVAHD_BLT_STATE DXVAHD_BLT_STATE_OUTPUT_COLOR_SPACE = 2;
  static const DXVAHD_BLT_STATE DXVAHD_BLT_STATE_ALPHA_FILL = 3;
  static const DXVAHD_BLT_STATE DXVAHD_BLT_STATE_CONSTRICTION = 4;
  static const DXVAHD_BLT_STATE DXVAHD_BLT_STATE_PRIVATE = 1000;
  typedef UINT DXVAHD_STREAM_STATE; //Alias
  static const DXVAHD_STREAM_STATE DXVAHD_STREAM_STATE_D3DFORMAT = 0;
  static const DXVAHD_STREAM_STATE DXVAHD_STREAM_STATE_FRAME_FORMAT = 1;
  static const DXVAHD_STREAM_STATE DXVAHD_STREAM_STATE_INPUT_COLOR_SPACE = 2;
  static const DXVAHD_STREAM_STATE DXVAHD_STREAM_STATE_OUTPUT_RATE = 3;
  static const DXVAHD_STREAM_STATE DXVAHD_STREAM_STATE_SOURCE_RECT = 4;
  static const DXVAHD_STREAM_STATE DXVAHD_STREAM_STATE_DESTINATION_RECT = 5;
  static const DXVAHD_STREAM_STATE DXVAHD_STREAM_STATE_ALPHA = 6;
  static const DXVAHD_STREAM_STATE DXVAHD_STREAM_STATE_PALETTE = 7;
  static const DXVAHD_STREAM_STATE DXVAHD_STREAM_STATE_LUMA_KEY = 8;
  static const DXVAHD_STREAM_STATE DXVAHD_STREAM_STATE_ASPECT_RATIO = 9;
  static const DXVAHD_STREAM_STATE DXVAHD_STREAM_STATE_FILTER_BRIGHTNESS = 100;
  static const DXVAHD_STREAM_STATE DXVAHD_STREAM_STATE_FILTER_CONTRAST = 101;
  static const DXVAHD_STREAM_STATE DXVAHD_STREAM_STATE_FILTER_HUE = 102;
  static const DXVAHD_STREAM_STATE DXVAHD_STREAM_STATE_FILTER_SATURATION = 103;
  static const DXVAHD_STREAM_STATE DXVAHD_STREAM_STATE_FILTER_NOISE_REDUCTION = 104;
  static const DXVAHD_STREAM_STATE DXVAHD_STREAM_STATE_FILTER_EDGE_ENHANCEMENT = 105;
  static const DXVAHD_STREAM_STATE DXVAHD_STREAM_STATE_FILTER_ANAMORPHIC_SCALING = 106;
  static const DXVAHD_STREAM_STATE DXVAHD_STREAM_STATE_PRIVATE = 1000;
  typedef UINT DXVAHD_DEVICE_TYPE; //Alias
  static const DXVAHD_DEVICE_TYPE DXVAHD_DEVICE_TYPE_HARDWARE = 0;
  static const DXVAHD_DEVICE_TYPE DXVAHD_DEVICE_TYPE_SOFTWARE = 1;
  static const DXVAHD_DEVICE_TYPE DXVAHD_DEVICE_TYPE_REFERENCE = 2;
  static const DXVAHD_DEVICE_TYPE DXVAHD_DEVICE_TYPE_OTHER = 3;
  typedef UINT DXVAHD_DEVICE_CAPS; //Alias
  typedef UINT DXVAHD_FEATURE_CAPS; //Alias
  typedef UINT DXVAHD_FILTER_CAPS; //Alias
  typedef UINT DXVAHD_INPUT_FORMAT_CAPS; //Alias
  typedef struct DXVAHD_VPDEVCAPS {
    DXVAHD_DEVICE_TYPE DeviceType;
    DXVAHD_DEVICE_CAPS DeviceCaps;
    DXVAHD_FEATURE_CAPS FeatureCaps;
    DXVAHD_FILTER_CAPS FilterCaps;
    DXVAHD_INPUT_FORMAT_CAPS InputFormatCaps;
    D3DPOOL InputPool;
    UINT OutputFormatCount;
    UINT InputFormatCount;
    UINT VideoProcessorCount;
    UINT MaxInputStreams;
    UINT MaxStreamStates;
  } DXVAHD_VPDEVCAPS;
  typedef UINT DXVAHD_PROCESSOR_CAPS; //Alias
  typedef UINT DXVAHD_ITELECINE_CAPS; //Alias
  typedef struct DXVAHD_VPCAPS {
    GUID VPGuid;
    UINT PastFrames;
    UINT FutureFrames;
    DXVAHD_PROCESSOR_CAPS ProcessorCaps;
    DXVAHD_ITELECINE_CAPS ITelecineCaps;
    UINT CustomRateCount;
  } DXVAHD_VPCAPS;
  typedef struct DXVAHD_CUSTOM_RATE_DATA {
    DXVAHD_RATIONAL CustomRate;
    UINT OutputFrames;
    BOOL InputInterlaced;
    UINT InputFramesOrFields;
  } DXVAHD_CUSTOM_RATE_DATA;
  typedef struct DXVAHD_FILTER_RANGE_DATA {
    INT Minimum;
    INT Maximum;
    INT Default;
    FLOAT Multiplier;
  } DXVAHD_FILTER_RANGE_DATA;
  typedef struct DXVAHD_STREAM_DATA {
    BOOL Enable;
    UINT OutputIndex;
    UINT InputFrameOrField;
    UINT PastFrames;
    UINT FutureFrames;
    IDirect3DSurface9** ppPastSurfaces;
    IDirect3DSurface9* pInputSurface;
    IDirect3DSurface9** ppFutureSurfaces;
  } DXVAHD_STREAM_DATA;
]]

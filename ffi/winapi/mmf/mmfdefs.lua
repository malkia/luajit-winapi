require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/multimedia" )
require( "ffi/winapi/headers/directx" )
require( "ffi/winapi/headers/gdi" )
local ffi = require( "ffi" )
ffi.cdef [[
  typedef ULONGLONG QWORD;
  typedef LONGLONG MFTIME;
  typedef unsigned __int64 TOPOID;
  typedef unsigned __int64 MFWORKITEM_KEY;
  typedef LPVOID MFPERIODICCALLBACK;
  typedef VIDEOINFOHEADER KS_VIDEOINFOHEADER*;
  typedef VIDEOINFOHEADER2 KS_VIDEOINFOHEADER2*;
  typedef enum MFSequencerElementId {
    MFSEQUENCER_INVALID_ELEMENT_ID = 0xffffffff,
  } MFSequencerElementId;
  typedef enum MF_ATTRIBUTE_TYPE {
    MF_ATTRIBUTE_UINT32 = 19,
    MF_ATTRIBUTE_UINT64 = 21,
    MF_ATTRIBUTE_DOUBLE = 5,
    MF_ATTRIBUTE_GUID = 72,
    MF_ATTRIBUTE_STRING = 31,
    MF_ATTRIBUTE_BLOB = 0x1011,
    MF_ATTRIBUTE_IUNKNOWN = 13,
  } MF_ATTRIBUTE_TYPE;
  typedef enum MF_ATTRIBUTES_MATCH_TYPE {
    MF_ATTRIBUTES_MATCH_OUR_ITEMS = 0,
    MF_ATTRIBUTES_MATCH_THEIR_ITEMS = 1,
    MF_ATTRIBUTES_MATCH_ALL_ITEMS = 2,
    MF_ATTRIBUTES_MATCH_INTERSECTION = 3,
    MF_ATTRIBUTES_MATCH_SMALLER = 4,
  } MF_ATTRIBUTES_MATCH_TYPE;
  typedef enum MFBYTESTREAM_SEEK_ORIGIN {
    msoBegin = 0,
    msoCurrent = 1,
  } MFBYTESTREAM_SEEK_ORIGIN;
  typedef enum MF_OBJECT_TYPE {
    MF_OBJECT_MEDIASOURCE = 0,
    MF_OBJECT_BYTESTREAM = 1,
    MF_OBJECT_INVALID = 2,
  } MF_OBJECT_TYPE;
  typedef enum MFCLOCK_STATE {
    MFCLOCK_STATE_INVALID = 0,
    MFCLOCK_STATE_RUNNING = 1,
    MFCLOCK_STATE_STOPPED = 2,
    MFCLOCK_STATE_PAUSED = 3,
  } MFCLOCK_STATE;
  typedef enum MFPOLICYMANAGER_ACTION {
    PEACTION_NO = 0,
    PEACTION_PLAY = 1,
    PEACTION_COPY = 2,
    PEACTION_EXPORT = 3,
    PEACTION_EXTRACT = 4,
    PEACTION_RESERVED1 = 5,
    PEACTION_RESERVED2 = 6,
    PEACTION_RESERVED3 = 7,
  } MFPOLICYMANAGER_ACTION;
  typedef enum MF_TOPOLOGY_TYPE {
    MF_TOPOLOGY_OUTPUT_NODE = 0,
    MF_TOPOLOGY_SOURCESTREAM_NODE = 1,
    MF_TOPOLOGY_TRANSFORM_NODE = 2,
    MF_TOPOLOGY_TEE_NODE = 3,
  } MF_TOPOLOGY_TYPE;
  typedef enum MFASYNC_WORKQUEUE_TYPE {
    MF_STANDARD_WORKQUEUE = 0,
    MF_WINDOW_WORKQUEUE = 1,
  } MFASYNC_WORKQUEUE_TYPE;
  typedef enum MF_FILE_ACCESSMODE {
    MF_ACCESSMODE_READ = 1,
    MF_ACCESSMODE_WRITE = 2,
    MF_ACCESSMODE_READWRITE = 3,
  } MF_FILE_ACCESSMODE;
  typedef enum EAllocationType {
    eAllocationTypeDynamic = 0,
    eAllocationTypeRT = 1,
    eAllocationTypePageable = 2,
    eAllocationTypeIgnore = 3,
  } EAllocationType;
  typedef enum MFSHUTDOWN_STATUS {
    MFSHUTDOWN_INITIATED = 0,
    MFSHUTDOWN_COMPLETED = 1,
  } MFSHUTDOWN_STATUS;
  typedef enum MFSTREAMSINK_MARKER_TYPE {
    MFSTREAMSINK_MARKER_DEFAULT = 0,
    MFSTREAMSINK_MARKER_ENDOFSEGMENT = 1,
    MFSTREAMSINK_MARKER_TICK = 2,
    MFSTREAMSINK_MARKER_EVENT = 3,
  } MFSTREAMSINK_MARKER_TYPE;
  typedef enum MF_FILE_OPENMODE {
    MF_OPENMODE_FAIL_IF_NOT_EXIST = 0,
    MF_OPENMODE_FAIL_IF_EXIST = 1,
    MF_OPENMODE_RESET_IF_EXIST = 2,
    MF_OPENMODE_APPEND_IF_EXIST = 3,
    MF_OPENMODE_DELETE_IF_EXIST = 4,
  } MF_FILE_OPENMODE;
  typedef enum MF_URL_TRUST_STATUS {
    MF_LICENSE_URL_UNTRUSTED = 0,
    MF_LICENSE_URL_TRUSTED = 1,
    MF_LICENSE_URL_TAMPERED = 2,
  } MF_URL_TRUST_STATUS;
  typedef enum MF_QUALITY_DROP_MODE {
    MF_DROP_MODE_NONE = 0,
    MF_DROP_MODE_1 = 0x1,
    MF_DROP_MODE_2 = 0x2,
    MF_DROP_MODE_3 = 0x3,
    MF_DROP_MODE_4 = 0x4,
    MF_DROP_MODE_5 = 0x5,
  } MF_QUALITY_DROP_MODE;
  typedef enum MF_QUALITY_LEVEL {
    MF_QUALITY_NORMAL = 0,
    MF_QUALITY_NORMAL_MINUS_1 = 0x1,
    MF_QUALITY_NORMAL_MINUS_2 = 0x2,
    MF_QUALITY_NORMAL_MINUS_3 = 0x3,
    MF_QUALITY_NORMAL_MINUS_4 = 0x4,
    MF_QUALITY_NORMAL_MINUS_5 = 0x5,
  } MF_QUALITY_LEVEL;
  typedef enum MFRATE_DIRECTION {
    MFRATE_FORWARD = 0,
    MFRATE_REVERSE = 1,
  } MFRATE_DIRECTION;
  typedef UINT MF_FILE_FLAGS;
  typedef struct MF_LEAKY_BUCKET_PAIR {
    DWORD dwBitrate,
    DWORD msBufferWindow,
  } MF_LEAKY_BUCKET_PAIR;

  typedef struct MFBYTESTREAM_BUFFERING_PARAMS {
    QWORD cbTotalFileSize,
    QWORD cbPlayableDataSize,
    MF_LEAKY_BUCKET_PAIR* prgBuckets,
    DWORD cBuckets,
    QWORD qwNetBufferingTime,
    QWORD qwExtraBufferingTimeDuringSeek,
    QWORD qwPlayDuration,
    float dRate,
  } MFBYTESTREAM_BUFFERING_PARAMS;

  typedef DWORD MFCLOCK_RELATIONAL_FLAGS;
  typedef enum WINAPI_MFCLOCK_JITTER {
    MFCLOCK_FREQUENCY_HNS = 10000000,
    MFCLOCK_TOLERANCE_UNKNOWN = 50000,
    MFCLOCK_JITTER_ISR = 1000,
    MFCLOCK_JITTER_DPC = 4000,
    MFCLOCK_JITTER_PASSIVE = 10000,
  } WINAPI_MFCLOCK_JITTER;
  typedef struct MFCLOCK_PROPERTIES {
    unsigned __int64 qwCorrelationRate,
    GUID guidClockId,
    MFCLOCK_RELATIONAL_FLAGS dwClockFlags,
    unsigned __int64 qwClockFrequency,
    DWORD dwClockTolerance,
    WINAPI_MFCLOCK_JITTER dwClockJitter,
  } MFCLOCK_PROPERTIES;

  typedef struct MFINPUTTRUSTAUTHORITY_ACCESS_ACTION {
    MFPOLICYMANAGER_ACTION Action,
    BYTE* pbTicket,
    DWORD cbTicket,
  } MFINPUTTRUSTAUTHORITY_ACCESS_ACTION;

  typedef struct MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS {
    DWORD dwSize,
    DWORD dwVer,
    DWORD cbSignatureOffset,
    DWORD cbSignatureSize,
    DWORD cbExtensionOffset,
    DWORD cbExtensionSize,
    DWORD cActions,
    MFINPUTTRUSTAUTHORITY_ACCESS_ACTION [1] rgOutputActions,
  } MFINPUTTRUSTAUTHORITY_ACCESS_PARAMS;

  typedef UINT32 MFT_ENUM_FLAG;
  typedef struct MFT_REGISTER_TYPE_INFO {
    GUID guidMajorType,
    GUID guidSubtype,
  } MFT_REGISTER_TYPE_INFO;

  typedef struct MFT_REGISTRATION_INFO {
    CLSID clsid,
    GUID guidCategory,
    MFT_ENUM_FLAG uiFlags,
    LPCWSTR pszName,
    DWORD cInTypes,
    MFT_REGISTER_TYPE_INFO* pInTypes,
    DWORD cOutTypes,
    MFT_REGISTER_TYPE_INFO* pOutTypes,
  } MFT_REGISTRATION_INFO;

  typedef enum MediaEventType {
    MEUnknown = 0,
    MEError = 1,
    MEExtendedType = 2,
    MENonFatalError = 3,
    MESessionUnknown = 100,
    MESessionTopologySet = 101,
    MESessionTopologiesCleared = 102,
    MESessionStarted = 103,
    MESessionPaused = 104,
    MESessionStopped = 105,
    MESessionClosed = 106,
    MESessionEnded = 107,
    MESessionRateChanged = 108,
    MESessionScrubSampleComplete = 109,
    MESessionCapabilitiesChanged = 110,
    MESessionTopologyStatus = 111,
    MESessionNotifyPresentationTime = 112,
    MENewPresentation = 113,
    MELicenseAcquisitionStart = 114,
    MELicenseAcquisitionCompleted = 115,
    MEIndividualizationStart = 116,
    MEIndividualizationCompleted = 117,
    MEEnablerProgress = 118,
    MEEnablerCompleted = 119,
    MEPolicyError = 120,
    MEPolicyReport = 121,
    MEBufferingStarted = 122,
    MEBufferingStopped = 123,
    MEConnectStart = 124,
    MEConnectEnd = 125,
    MEReconnectStart = 126,
    MEReconnectEnd = 127,
    MERendererEvent = 128,
    MESessionStreamSinkFormatChanged = 129,
    MESourceUnknown = 200,
    MESourceStarted = 201,
    MEStreamStarted = 202,
    MESourceSeeked = 203,
    MEStreamSeeked = 204,
    MENewStream = 205,
    MEUpdatedStream = 206,
    MESourceStopped = 207,
    MEStreamStopped = 208,
    MESourcePaused = 209,
    MEStreamPaused = 210,
    MEEndOfPresentation = 211,
    MEEndOfStream = 212,
    MEMediaSample = 213,
    MEStreamTick = 214,
    MEStreamThinMode = 215,
    MEStreamFormatChanged = 216,
    MESourceRateChanged = 217,
    MEEndOfPresentationSegment = 218,
    MESourceCharacteristicsChanged = 219,
    MESourceRateChangeRequested = 220,
    MESourceMetadataChanged = 221,
    MESequencerSourceTopologyUpdated = 222,
    MESinkUnknown = 300,
    MEStreamSinkStarted = 301,
    MEStreamSinkStopped = 302,
    MEStreamSinkPaused = 303,
    MEStreamSinkRateChanged = 304,
    MEStreamSinkRequestSample = 305,
    MEStreamSinkMarker = 306,
    MEStreamSinkPrerolled = 307,
    MEStreamSinkScrubSampleComplete = 308,
    MEStreamSinkFormatChanged = 309,
    MEStreamSinkDeviceChanged = 310,
    MEQualityNotify = 311,
    MESinkInvalidated = 312,
    MEAudioSessionNameChanged = 313,
    MEAudioSessionVolumeChanged = 314,
    MEAudioSessionDeviceRemoved = 315,
    MEAudioSessionServerShutdown = 316,
    MEAudioSessionGroupingParamChanged = 317,
    MEAudioSessionIconChanged = 318,
    MEAudioSessionFormatChanged = 319,
    MEAudioSessionDisconnected = 320,
    MEAudioSessionExclusiveModeOverride = 321,
    METrustUnknown = 400,
    MEPolicyChanged = 401,
    MEContentProtectionMessage = 402,
    MEPolicySet = 403,
    MEWMDRMLicenseBackupCompleted = 500,
    MEWMDRMLicenseBackupProgress = 501,
    MEWMDRMLicenseRestoreCompleted = 502,
    MEWMDRMLicenseRestoreProgress = 503,
    MEWMDRMLicenseAcquisitionCompleted = 506,
    MEWMDRMIndividualizationCompleted = 508,
    MEWMDRMIndividualizationProgress = 513,
    MEWMDRMProximityCompleted = 514,
    MEWMDRMLicenseStoreCleaned = 515,
    MEWMDRMRevocationDownloadCompleted = 516,
    METransformUnknown = 600,
    METransformNeedInput = 601,
    METransformHaveOutput = 602,
    METransformDrainComplete = 603,
    METransformMarker = 604,
  } MediaEventType;
  typedef struct MFNetCredentialManagerGetParam {
    HRESULT hrOp,
    BOOL fAllowLoggedOnUser,
    BOOL fClearTextPackage,
    LPCWSTR pszUrl,
    LPCWSTR pszSite,
    LPCWSTR pszRealm,
    LPCWSTR pszPackage,
    LONG nRetries,
  } MFNetCredentialManagerGetParam;

  typedef struct MF_SINK_WRITER_STATISTICS {
    DWORD cb,
    LONGLONG llLastTimestampReceived,
    LONGLONG llLastTimestampEncoded,
    LONGLONG llLastTimestampProcessed,
    LONGLONG llLastStreamTickReceived,
    LONGLONG llLastSinkSampleRequest,
    QWORD qwNumSamplesReceived,
    QWORD qwNumSamplesEncoded,
    QWORD qwNumSamplesProcessed,
    QWORD qwNumStreamTicksReceived,
    DWORD dwByteCountQueued,
    QWORD qwByteCountProcessed,
    DWORD dwNumOutstandingSinkSampleRequests,
    DWORD dwAverageSampleRateReceived,
    DWORD dwAverageSampleRateEncoded,
    DWORD dwAverageSampleRateProcessed,
  } MF_SINK_WRITER_STATISTICS;

  typedef struct MF_TRANSCODE_SINK_INFO {
    DWORD dwVideoStreamID,
    IMFMediaType* pVideoMediaType,
    DWORD dwAudioStreamID,
    IMFMediaType* pAudioMediaType,
  } MF_TRANSCODE_SINK_INFO;

  typedef enum MFNETSOURCE_PROTOCOL_TYPE {
    MFNETSOURCE_UNDEFINED = 0,
    MFNETSOURCE_HTTP = 0x1,
    MFNETSOURCE_RTSP = 0x2,
    MFNETSOURCE_FILE = 0x3,
    MFNETSOURCE_MULTICAST = 0x4,
  } MFNETSOURCE_PROTOCOL_TYPE;
  typedef union WINAPI_MFTOPONODE_ATTRIBUTE_UPDATE_u {
    UINT32 u32,
    UINT64 u64,
    double d,
  } WINAPI_MFTOPONODE_ATTRIBUTE_UPDATE_u;

  typedef struct MFTOPONODE_ATTRIBUTE_UPDATE {
    TOPOID NodeId,
    GUID guidAttributeKey,
    MF_ATTRIBUTE_TYPE attrType,
    WINAPI_MFTOPONODE_ATTRIBUTE_UPDATE_u ,
  } MFTOPONODE_ATTRIBUTE_UPDATE;

  typedef UINT32 MFP_CREATION_OPTIONS;
  typedef enum MFVideoInterlaceMode {
    MFVideoInterlace_Unknown = 0,
    MFVideoInterlace_Progressive = 2,
    MFVideoInterlace_FieldInterleavedUpperFirst = 3,
    MFVideoInterlace_FieldInterleavedLowerFirst = 4,
    MFVideoInterlace_FieldSingleUpper = 5,
    MFVideoInterlace_FieldSingleLower = 6,
    MFVideoInterlace_MixedInterlaceOrProgressive = 7,
  } MFVideoInterlaceMode;
  typedef enum MFVideoTransferFunction {
    MFVideoTransFunc_Unknown = 0,
    MFVideoTransFunc_10 = 1,
    MFVideoTransFunc_18 = 2,
    MFVideoTransFunc_20 = 3,
    MFVideoTransFunc_22 = 4,
    MFVideoTransFunc_709 = 5,
    MFVideoTransFunc_240M = 6,
    MFVideoTransFunc_sRGB = 7,
    MFVideoTransFunc_28 = 8,
    MFVideoTransFunc_Log_100 = 9,
    MFVideoTransFunc_Log_316 = 10,
    MFVideoTransFunc_709_sym = 11,
  } MFVideoTransferFunction;
  typedef enum MFVideoPrimaries {
    MFVideoPrimaries_Unknown = 0,
    MFVideoPrimaries_reserved = 1,
    MFVideoPrimaries_BT709 = 2,
    MFVideoPrimaries_BT470_2_SysM = 3,
    MFVideoPrimaries_BT470_2_SysBG = 4,
    MFVideoPrimaries_SMPTE170M = 5,
    MFVideoPrimaries_SMPTE240M = 6,
    MFVideoPrimaries_EBU3213 = 7,
    MFVideoPrimaries_SMPTE_C = 8,
  } MFVideoPrimaries;
  typedef enum MFVideoLighting {
    MFVideoLighting_Unknown = 0,
    MFVideoLighting_bright = 1,
    MFVideoLighting_office = 2,
    MFVideoLighting_dim = 3,
    MFVideoLighting_dark = 4,
  } MFVideoLighting;
  typedef enum MFVideoTransferMatrix {
    MFVideoTransferMatrix_Unknown = 0,
    MFVideoTransferMatrix_BT709 = 1,
    MFVideoTransferMatrix_BT601 = 2,
    MFVideoTransferMatrix_SMPTE240M = 3,
  } MFVideoTransferMatrix;
  typedef UINT MFVideoChromaSubsampling;
  typedef enum MFNominalRange {
    MFNominalRange_Unknown = 0,
    MFNominalRange_0_255 = 1,
    MFNominalRange_16_235 = 2,
    MFNominalRange_48_208 = 3,
    MFNominalRange_64_127 = 4,
  } MFNominalRange;
  typedef unsigned __int64 MFVideoFlags;
  typedef struct MFRatio {
    DWORD Numerator,
    DWORD Denominator,
  } MFRatio;

  typedef struct MFOffset {
    WORD fract,
    short value,
  } MFOffset;

  typedef struct MFVideoArea {
    MFOffset OffsetX,
    MFOffset OffsetY,
    SIZE Area,
  } MFVideoArea;

  typedef struct MFVideoInfo {
    DWORD dwWidth,
    DWORD dwHeight,
    MFRatio PixelAspectRatio,
    MFVideoChromaSubsampling SourceChromaSubsampling,
    MFVideoInterlaceMode InterlaceMode,
    MFVideoTransferFunction TransferFunction,
    MFVideoPrimaries ColorPrimaries,
    MFVideoTransferMatrix TransferMatrix,
    MFVideoLighting SourceLighting,
    MFRatio FramesPerSecond,
    MFNominalRange NominalRange,
    MFVideoArea GeometricAperture,
    MFVideoArea MinimumDisplayAperture,
    MFVideoArea PanScanAperture,
    MFVideoFlags VideoFlags,
  } MFVideoInfo;

  typedef struct MFAYUVSample {
    BYTE bCrValue,
    BYTE bCbValue,
    BYTE bYValue,
    BYTE bSampleAlpha8,
  } MFAYUVSample;

  typedef struct MFARGB {
    BYTE rgbBlue,
    BYTE rgbGreen,
    BYTE rgbRed,
    BYTE rgbAlpha,
  } MFARGB;

  typedef union MFPaletteEntry {
    MFARGB ARGB,
    MFAYUVSample AYCbCr,
  } MFPaletteEntry;

  typedef struct MFVideoSurfaceInfo {
    DWORD Format,
    DWORD PaletteEntries,
    MFPaletteEntry [1] Palette,
  } MFVideoSurfaceInfo;

  typedef struct MFVideoCompressedInfo {
    LONGLONG AvgBitrate,
    LONGLONG AvgBitErrorRate,
    DWORD MaxKeyFrameSpacing,
  } MFVideoCompressedInfo;

  typedef struct MFVIDEOFORMAT {
    DWORD dwSize,
    MFVideoInfo videoInfo,
    GUID guidFormat,
    MFVideoCompressedInfo compressedInfo,
    MFVideoSurfaceInfo surfaceInfo,
  } MFVIDEOFORMAT;

  typedef struct ASF_INDEX_IDENTIFIER {
    GUID guidIndexType,
    WORD wStreamNumber,
  } ASF_INDEX_IDENTIFIER;

  typedef struct ASF_MUX_STATISTICS {
    DWORD cFramesWritten,
    DWORD cFramesDropped,
  } ASF_MUX_STATISTICS;

  typedef enum ASF_SELECTION_STATUS {
    ASF_STATUS_NOTSELECTED = 0,
    ASF_STATUS_CLEANPOINTSONLY = 1,
    ASF_STATUS_ALLDATAUNITS = 2,
  } ASF_SELECTION_STATUS;
  typedef enum MFT_MESSAGE_TYPE {
    MFT_MESSAGE_COMMAND_FLUSH = 0,
    MFT_MESSAGE_COMMAND_DRAIN = 0x1,
    MFT_MESSAGE_SET_D3D_MANAGER = 0x2,
    MFT_MESSAGE_DROP_SAMPLES = 0x3,
    MFT_MESSAGE_NOTIFY_BEGIN_STREAMING = 0x10000000,
    MFT_MESSAGE_NOTIFY_END_STREAMING = 0x10000001,
    MFT_MESSAGE_NOTIFY_END_OF_STREAM = 0x10000002,
    MFT_MESSAGE_NOTIFY_START_OF_STREAM = 0x10000003,
    MFT_MESSAGE_COMMAND_MARKER = 0x20000000,
  } MFT_MESSAGE_TYPE;
  typedef DWORD MFT_INPUT_STREAM_INFO_FLAGS;
  typedef struct MFT_INPUT_STREAM_INFO {
    LONGLONG hnsMaxLatency,
    MFT_INPUT_STREAM_INFO_FLAGS dwFlags,
    DWORD cbSize,
    DWORD cbMaxLookahead,
    DWORD cbAlignment,
  } MFT_INPUT_STREAM_INFO;

  typedef DWORD MFT_OUTPUT_STREAM_INFO_FLAGS;
  typedef struct MFT_OUTPUT_STREAM_INFO {
    MFT_OUTPUT_STREAM_INFO_FLAGS dwFlags,
    DWORD cbSize,
    DWORD cbAlignment,
  } MFT_OUTPUT_STREAM_INFO;

  typedef struct MFT_OUTPUT_DATA_BUFFER {
    DWORD dwStreamID,
    IMFSample* pSample,
    DWORD dwStatus,
    IMFCollection* pEvents,
  } MFT_OUTPUT_DATA_BUFFER;

  typedef enum MFStandardVideoFormat {
    MFStdVideoFormat_reserved = 0,
    MFStdVideoFormat_NTSC = 1,
    MFStdVideoFormat_PAL = 2,
    MFStdVideoFormat_DVD_NTSC = 3,
    MFStdVideoFormat_DVD_PAL = 4,
    MFStdVideoFormat_DV_PAL = 5,
    MFStdVideoFormat_DV_NTSC = 6,
    MFStdVideoFormat_ATSC_SD480i = 7,
    MFStdVideoFormat_ATSC_HD1080i = 8,
    MFStdVideoFormat_ATSC_HD720p = 9,
  } MFStandardVideoFormat;
  typedef UINT32 MFP_MEDIAITEM_CHARACTERISTICS;
  typedef enum MFP_MEDIAPLAYER_STATE {
    MFP_MEDIAPLAYER_STATE_EMPTY = 0,
    MFP_MEDIAPLAYER_STATE_STOPPED = 0x1,
    MFP_MEDIAPLAYER_STATE_PLAYING = 0x2,
    MFP_MEDIAPLAYER_STATE_PAUSED = 0x3,
    MFP_MEDIAPLAYER_STATE_SHUTDOWN = 0x4,
  } MFP_MEDIAPLAYER_STATE;
  typedef struct MFVideoNormalizedRect {
    float left,
    float top,
    float right,
    float bottom,
  } MFVideoNormalizedRect;

  typedef enum MFP_EVENT_TYPE {
    MFP_EVENT_TYPE_PLAY = 0,
    MFP_EVENT_TYPE_PAUSE = 1,
    MFP_EVENT_TYPE_STOP = 2,
    MFP_EVENT_TYPE_POSITION_SET = 3,
    MFP_EVENT_TYPE_RATE_SET = 4,
    MFP_EVENT_TYPE_MEDIAITEM_CREATED = 5,
    MFP_EVENT_TYPE_MEDIAITEM_SET = 6,
    MFP_EVENT_TYPE_FRAME_STEP = 7,
    MFP_EVENT_TYPE_MEDIAITEM_CLEARED = 8,
    MFP_EVENT_TYPE_MF = 9,
    MFP_EVENT_TYPE_ERROR = 10,
    MFP_EVENT_TYPE_PLAYBACK_ENDED = 11,
    MFP_EVENT_TYPE_ACQUIRE_USER_CREDENTIAL = 12,
  } MFP_EVENT_TYPE;
  typedef struct MFP_EVENT_HEADER {
    MFP_EVENT_TYPE eEventType,
    HRESULT hrEvent,
    IMFPMediaPlayer* pMediaPlayer,
    MFP_MEDIAPLAYER_STATE eState,
    IPropertyStore* pPropertyStore,
  } MFP_EVENT_HEADER;

  typedef union DXVA2_ExtendedFormat {
    UINT value,
  } DXVA2_ExtendedFormat;

  typedef struct DXVA2_Frequency {
    UINT Numerator,
    UINT Denominator,
  } DXVA2_Frequency;

  typedef struct DXVA2_VideoDesc {
    UINT SampleWidth,
    UINT SampleHeight,
    DXVA2_ExtendedFormat SampleFormat,
    D3DFORMAT Format,
    DXVA2_Frequency InputSampleFreq,
    DXVA2_Frequency OutputFrameFreq,
    UINT UABProtectionLevel,
    UINT Reserved,
  } DXVA2_VideoDesc;

  typedef enum WINAPI_DXVA2_BufferType {
    DXVA2_PictureParametersBufferType = 0,
    DXVA2_MacroBlockControlBufferType = 1,
    DXVA2_ResidualDifferenceBufferType = 2,
    DXVA2_DeblockingControlBufferType = 3,
    DXVA2_InverseQuantizationMatrixBufferType = 4,
    DXVA2_SliceControlBufferType = 5,
    DXVA2_BitStreamDateBufferType = 6,
    DXVA2_MotionVectorBuffer = 7,
    DXVA2_FilmGrainBuffer = 8,
  } WINAPI_DXVA2_BufferType;
  typedef struct DXVA2_DecodeBufferDesc {
    WINAPI_DXVA2_BufferType CompressedBufferType,
    UINT BufferIndex,
    UINT DataOffset,
    UINT DataSize,
    UINT FirstMBaddress,
    UINT NumMBsInBuffer,
    UINT Width,
    UINT Height,
    UINT Stride,
    UINT ReservedBits,
    PVOID pvPVPState,
  } DXVA2_DecodeBufferDesc;

  typedef struct DXVA2_DecodeExtensionData {
    UINT Function,
    PVOID pPrivateInputData,
    UINT PrivateInputDataSize,
    PVOID pPrivateOutputData,
    UINT PrivateOutputDataSize,
  } DXVA2_DecodeExtensionData;

  typedef struct DXVA2_DecodeExecuteParams {
    UINT NumCompBuffers,
    DXVA2_DecodeBufferDesc* pCompressedBuffers,
    DXVA2_DecodeExtensionData* pExtensionData,
  } DXVA2_DecodeExecuteParams;

  typedef struct DXVA2_ConfigPictureDecode {
    GUID guidConfigBitstreamEncryption,
    GUID guidConfigMBcontrolEncryption,
    GUID guidConfigResidDiffEncryption,
    UINT ConfigBitstreamRaw,
    UINT ConfigMBcontrolRasterOrder,
    UINT ConfigResidDiffHost,
    UINT ConfigSpatialResid8,
    UINT ConfigResid8Subtraction,
    UINT ConfigSpatialHost8or9Clipping,
    UINT ConfigSpatialResidInterleaved,
    UINT ConfigIntraResidUnsigned,
    UINT ConfigResidDiffAccelerator,
    UINT ConfigHostInverseScan,
    UINT ConfigSpecificIDCT,
    UINT Config4GroupedCoefs,
    USHORT ConfigMinRenderTargetBuffCount,
    USHORT ConfigDecoderSpecific,
  } DXVA2_ConfigPictureDecode;

  typedef enum DXVA2_SurfaceType {
    DXVA2_SurfaceType_DecoderRenderTarget = 0,
    DXVA2_SurfaceType_ProcessorRenderTarget = 1,
    DXVA2_SurfaceType_D3DRenderTargetTexture = 2,
  } DXVA2_SurfaceType;
  typedef UINT WINAPI_DXVA2_VPDev;
  typedef UINT WINAPI_DXVA2_DeinterlaceTech;
  typedef UINT WINAPI_DXVA2_ProcAmp;
  typedef UINT WINAPI_DXVA2_VideoProcess;
  typedef UINT WINAPI_DXVA2_NoiseFilterTech;
  typedef UINT WINAPI_DXVA2_DetailFilterTech;
  typedef struct DXVA2_VideoProcessorCaps {
    WINAPI_DXVA2_VPDev DeviceCaps,
    D3DPOOL InputPool,
    UINT NumForwardRefSamples,
    UINT NumBackwardRefSamples,
    UINT Reserved,
    WINAPI_DXVA2_DeinterlaceTech DeinterlaceTechnology,
    WINAPI_DXVA2_ProcAmp ProcAmpControlCaps,
    WINAPI_DXVA2_VideoProcess VideoProcessorOperations,
    WINAPI_DXVA2_NoiseFilterTech NoiseFilterTechnology,
    WINAPI_DXVA2_DetailFilterTech DetailFilterTechnology,
  } DXVA2_VideoProcessorCaps;

  typedef struct WINAPI_DXVA2_Fixed32_s {
    USHORT Fraction,
    SHORT Value,
  } WINAPI_DXVA2_Fixed32_s;

  typedef union DXVA2_Fixed32 {
    WINAPI_DXVA2_Fixed32_s ,
    LONG ll,
  } DXVA2_Fixed32;

  typedef struct DXVA2_ValueRange {
    DXVA2_Fixed32 MinValue,
    DXVA2_Fixed32 MaxValue,
    DXVA2_Fixed32 DefaultValue,
    DXVA2_Fixed32 StepSize,
  } DXVA2_ValueRange;

  typedef DWORD WINAPI_DXVA2_DestData;
  typedef struct DXVA2_AYUVSample16 {
    USHORT Cr,
    USHORT Cb,
    USHORT Y,
    USHORT Alpha,
  } DXVA2_AYUVSample16;

  typedef struct DXVA2_ProcAmpValues {
    DXVA2_Fixed32 Brightness,
    DXVA2_Fixed32 Contrast,
    DXVA2_Fixed32 Hue,
    DXVA2_Fixed32 Saturation,
  } DXVA2_ProcAmpValues;

  typedef struct DXVA2_FilterValues {
    DXVA2_Fixed32 Level,
    DXVA2_Fixed32 Threshold,
    DXVA2_Fixed32 Radius,
  } DXVA2_FilterValues;

  typedef struct DXVA2_VideoProcessBltParams {
    REFERENCE_TIME TargetFrame,
    RECT TargetRect,
    SIZE ConstrictionSize,
    UINT StreamingFlags,
    DXVA2_AYUVSample16 BackgroundColor,
    DXVA2_ExtendedFormat DestFormat,
    DXVA2_ProcAmpValues ProcAmpValues,
    DXVA2_Fixed32 Alpha,
    DXVA2_FilterValues NoiseFilterLuma,
    DXVA2_FilterValues NoiseFilterChroma,
    DXVA2_FilterValues DetailFilterLuma,
    DXVA2_FilterValues DetailFilterChroma,
    WINAPI_DXVA2_DestData DestData,
  } DXVA2_VideoProcessBltParams;

  typedef struct DXVA2_AYUVSample8 {
    UCHAR Cr,
    UCHAR Cb,
    UCHAR Y,
    UCHAR Alpha,
  } DXVA2_AYUVSample8;

  typedef struct DXVA2_VideoSample {
    REFERENCE_TIME Start,
    REFERENCE_TIME End,
    DXVA2_ExtendedFormat SampleFormat,
    IDirect3DSurface9* SrcSurface,
    RECT SrcRect,
    RECT DstRect,
    DXVA2_AYUVSample8 [16] Pal,
    DXVA2_Fixed32 PlanarAlpha,
    DWORD SampleData,
  } DXVA2_VideoSample;

  typedef struct MPEG1VIDEOINFO {
    VIDEOINFOHEADER hdr,
    DWORD dwStartTimeCode,
    DWORD cbSequenceHeader,
    BYTE [1] bSequenceHeader,
  } MPEG1VIDEOINFO;

  typedef enum AM_MPEG2Profile {
    AM_MPEG2Profile_Simple = 1,
    AM_MPEG2Profile_Main = 2,
    AM_MPEG2Profile_SNRScalable = 3,
    AM_MPEG2Profile_SpatiallyScalable = 4,
    AM_MPEG2Profile_High = 5,
  } AM_MPEG2Profile;
  typedef enum AM_MPEG2Level {
    AM_MPEG2Level_Low = 1,
    AM_MPEG2Level_Main = 2,
    AM_MPEG2Level_High1440 = 3,
    AM_MPEG2Level_High = 4,
  } AM_MPEG2Level;
  typedef DWORD WINAPI_AMMPEG2_FLAGS;
  typedef struct MPEG2VIDEOINFO {
    VIDEOINFOHEADER2 hdr,
    DWORD dwStartTimeCode,
    DWORD cbSequenceHeader,
    AM_MPEG2Profile dwProfile,
    AM_MPEG2Level dwLevel,
    WINAPI_AMMPEG2_FLAGS dwFlags,
    DWORD [1] dwSequenceHeader,
  } MPEG2VIDEOINFO;

  typedef enum DXVAHD_FILTER {
    DXVAHD_FILTER_BRIGHTNESS = 0,
    DXVAHD_FILTER_CONTRAST = 1,
    DXVAHD_FILTER_HUE = 2,
    DXVAHD_FILTER_SATURATION = 3,
    DXVAHD_FILTER_NOISE_REDUCTION = 4,
    DXVAHD_FILTER_EDGE_ENHANCEMENT = 5,
    DXVAHD_FILTER_ANAMORPHIC_SCALING = 6,
  } DXVAHD_FILTER;
  typedef enum DXVAHD_SURFACE_TYPE {
    DXVAHD_SURFACE_TYPE_VIDEO_INPUT = 0,
    DXVAHD_SURFACE_TYPE_VIDEO_INPUT_PRIVATE = 1,
    DXVAHD_SURFACE_TYPE_VIDEO_OUTPUT = 2,
  } DXVAHD_SURFACE_TYPE;
  typedef enum DXVAHD_BLT_STATE {
    DXVAHD_BLT_STATE_TARGET_RECT = 0,
    DXVAHD_BLT_STATE_BACKGROUND_COLOR = 1,
    DXVAHD_BLT_STATE_OUTPUT_COLOR_SPACE = 2,
    DXVAHD_BLT_STATE_ALPHA_FILL = 3,
    DXVAHD_BLT_STATE_CONSTRICTION = 4,
    DXVAHD_BLT_STATE_PRIVATE = 1000,
  } DXVAHD_BLT_STATE;
  typedef enum DXVAHD_STREAM_STATE {
    DXVAHD_STREAM_STATE_D3DFORMAT = 0,
    DXVAHD_STREAM_STATE_FRAME_FORMAT = 1,
    DXVAHD_STREAM_STATE_INPUT_COLOR_SPACE = 2,
    DXVAHD_STREAM_STATE_OUTPUT_RATE = 3,
    DXVAHD_STREAM_STATE_SOURCE_RECT = 4,
    DXVAHD_STREAM_STATE_DESTINATION_RECT = 5,
    DXVAHD_STREAM_STATE_ALPHA = 6,
    DXVAHD_STREAM_STATE_PALETTE = 7,
    DXVAHD_STREAM_STATE_LUMA_KEY = 8,
    DXVAHD_STREAM_STATE_ASPECT_RATIO = 9,
    DXVAHD_STREAM_STATE_FILTER_BRIGHTNESS = 100,
    DXVAHD_STREAM_STATE_FILTER_CONTRAST = 101,
    DXVAHD_STREAM_STATE_FILTER_HUE = 102,
    DXVAHD_STREAM_STATE_FILTER_SATURATION = 103,
    DXVAHD_STREAM_STATE_FILTER_NOISE_REDUCTION = 104,
    DXVAHD_STREAM_STATE_FILTER_EDGE_ENHANCEMENT = 105,
    DXVAHD_STREAM_STATE_FILTER_ANAMORPHIC_SCALING = 106,
    DXVAHD_STREAM_STATE_PRIVATE = 1000,
  } DXVAHD_STREAM_STATE;
  typedef enum DXVAHD_DEVICE_TYPE {
    DXVAHD_DEVICE_TYPE_HARDWARE = 0,
    DXVAHD_DEVICE_TYPE_SOFTWARE = 1,
    DXVAHD_DEVICE_TYPE_REFERENCE = 2,
    DXVAHD_DEVICE_TYPE_OTHER = 3,
  } DXVAHD_DEVICE_TYPE;
  typedef UINT DXVAHD_DEVICE_CAPS;
  typedef UINT DXVAHD_FEATURE_CAPS;
  typedef UINT DXVAHD_FILTER_CAPS;
  typedef UINT DXVAHD_INPUT_FORMAT_CAPS;
  typedef struct DXVAHD_VPDEVCAPS {
    DXVAHD_DEVICE_TYPE DeviceType,
    DXVAHD_DEVICE_CAPS DeviceCaps,
    DXVAHD_FEATURE_CAPS FeatureCaps,
    DXVAHD_FILTER_CAPS FilterCaps,
    DXVAHD_INPUT_FORMAT_CAPS InputFormatCaps,
    D3DPOOL InputPool,
    UINT OutputFormatCount,
    UINT InputFormatCount,
    UINT VideoProcessorCount,
    UINT MaxInputStreams,
    UINT MaxStreamStates,
  } DXVAHD_VPDEVCAPS;

  typedef UINT DXVAHD_PROCESSOR_CAPS;
  typedef UINT DXVAHD_ITELECINE_CAPS;
  typedef struct DXVAHD_VPCAPS {
    GUID VPGuid,
    UINT PastFrames,
    UINT FutureFrames,
    DXVAHD_PROCESSOR_CAPS ProcessorCaps,
    DXVAHD_ITELECINE_CAPS ITelecineCaps,
    UINT CustomRateCount,
  } DXVAHD_VPCAPS;

  typedef struct DXVAHD_CUSTOM_RATE_DATA {
    DXVAHD_RATIONAL CustomRate,
    UINT OutputFrames,
    BOOL InputInterlaced,
    UINT InputFramesOrFields,
  } DXVAHD_CUSTOM_RATE_DATA;

  typedef struct DXVAHD_FILTER_RANGE_DATA {
    INT Minimum,
    INT Maximum,
    INT Default,
    FLOAT Multiplier,
  } DXVAHD_FILTER_RANGE_DATA;

  typedef struct DXVAHD_STREAM_DATA {
    BOOL Enable,
    UINT OutputIndex,
    UINT InputFrameOrField,
    UINT PastFrames,
    UINT FutureFrames,
    IDirect3DSurface9** ppPastSurfaces,
    IDirect3DSurface9* pInputSurface,
    IDirect3DSurface9** ppFutureSurfaces,
  } DXVAHD_STREAM_DATA;

]]

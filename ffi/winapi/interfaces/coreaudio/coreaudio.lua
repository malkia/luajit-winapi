require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/multimedia' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IAudioAutoGainControl; //Interface
  typedef void* IAudioBass; //Interface
  typedef void* IAudioCaptureClient; //Interface
  typedef void* IAudioChannelConfig; //Interface
  typedef void* IAudioClient; //Interface
  typedef void* IAudioClock; //Interface
  typedef void* IAudioClock2; //Interface
  typedef void* IAudioClockAdjustment; //Interface
  typedef void* IAudioEndpointVolume; //Interface
  typedef void* IAudioEndpointVolumeCallback; //Interface
  typedef void* IAudioEndpointVolumeEx; //Interface
  typedef void* IAudioInputSelector; //Interface
  typedef void* IAudioLoudness; //Interface
  typedef void* IAudioMeterInformation; //Interface
  typedef void* IAudioMidrange; //Interface
  typedef void* IAudioMute; //Interface
  typedef void* IAudioOutputSelector; //Interface
  typedef void* IAudioPeakMeter; //Interface
  typedef void* IAudioRenderClient; //Interface
  typedef void* IAudioSessionControl; //Interface
  typedef void* IAudioSessionControl2; //Interface
  typedef void* IAudioSessionEnumerator; //Interface
  typedef void* IAudioSessionEvents; //Interface
  typedef void* IAudioSessionManager; //Interface
  typedef void* IAudioSessionManager2; //Interface
  typedef void* IAudioSessionNotification; //Interface
  typedef void* IAudioStreamVolume; //Interface
  typedef void* IAudioTreble; //Interface
  typedef void* IAudioVolumeDuckNotification; //Interface
  typedef void* IAudioVolumeLevel; //Interface
  typedef void* IChannelAudioVolume; //Interface
  typedef void* IConnector; //Interface
  typedef void* IControlChangeNotify; //Interface
  typedef void* IControlInterface; //Interface
  typedef void* IDeviceSpecificProperty; //Interface
  typedef void* IDeviceTopology; //Interface
  typedef void* IKsControl; //Interface
  typedef void* IKsFormatSupport; //Interface
  typedef void* IKsJackDescription; //Interface
  typedef void* IKsJackDescription2; //Interface
  typedef void* IKsJackSinkInformation; //Interface
  typedef void* IMMDevice; //Interface
  typedef void* IMMDeviceActivator; //Interface
  typedef void* IMMDeviceCollection; //Interface
  typedef void* IMMDeviceEnumerator; //Interface
  typedef void* IMMEndpoint; //Interface
  typedef void* IMMNotificationClient; //Interface
  typedef void* IPart; //Interface
  typedef void* IPartsList; //Interface
  typedef void* IPerChannelDbLevel; //Interface
  typedef void* ISimpleAudioVolume; //Interface
  typedef void* ISubunit; //Interface
  enum { MAX_SINK_DESCRIPTION_NAME_LENGTH = 32 };
  typedef float *float []; //Pointer
  typedef HRESULT AUDCLNT_HRESULT; //Alias
  static const AUDCLNT_HRESULT AUDCLNT_E_NOT_INITIALIZED = 0x88890001;
  static const AUDCLNT_HRESULT AUDCLNT_E_ALREADY_INITIALIZED = 0x88890002;
  static const AUDCLNT_HRESULT AUDCLNT_E_WRONG_ENDPOINT_TYPE = 0x88890003;
  static const AUDCLNT_HRESULT AUDCLNT_E_DEVICE_INVALIDATED = 0x88890004;
  static const AUDCLNT_HRESULT AUDCLNT_E_NOT_STOPPED = 0x88890005;
  static const AUDCLNT_HRESULT AUDCLNT_E_BUFFER_TOO_LARGE = 0x88890006;
  static const AUDCLNT_HRESULT AUDCLNT_E_OUT_OF_ORDER = 0x88890007;
  static const AUDCLNT_HRESULT AUDCLNT_E_UNSUPPORTED_FORMAT = 0x88890008;
  static const AUDCLNT_HRESULT AUDCLNT_E_INVALID_SIZE = 0x88890009;
  static const AUDCLNT_HRESULT AUDCLNT_E_DEVICE_IN_USE = 0x8889000a;
  static const AUDCLNT_HRESULT AUDCLNT_E_BUFFER_OPERATION_PENDING = 0x8889000b;
  static const AUDCLNT_HRESULT AUDCLNT_E_THREAD_NOT_REGISTERED = 0x8889000c;
  static const AUDCLNT_HRESULT AUDCLNT_E_EXCLUSIVE_MODE_NOT_ALLOWED = 0x8889000e;
  static const AUDCLNT_HRESULT AUDCLNT_E_ENDPOINT_CREATE_FAILED = 0x8889000f;
  static const AUDCLNT_HRESULT AUDCLNT_E_SERVICE_NOT_RUNNING = 0x88890010;
  static const AUDCLNT_HRESULT AUDCLNT_E_EVENTHANDLE_NOT_EXPECTED = 0x88890011;
  static const AUDCLNT_HRESULT AUDCLNT_E_EXCLUSIVE_MODE_ONLY = 0x88890012;
  static const AUDCLNT_HRESULT AUDCLNT_E_BUFDURATION_PERIOD_NOT_EQUAL = 0x88890013;
  static const AUDCLNT_HRESULT AUDCLNT_E_EVENTHANDLE_NOT_SET = 0x88890014;
  static const AUDCLNT_HRESULT AUDCLNT_E_INCORRECT_BUFFER_SIZE = 0x88890015;
  static const AUDCLNT_HRESULT AUDCLNT_E_BUFFER_SIZE_ERROR = 0x88890016;
  static const AUDCLNT_HRESULT AUDCLNT_E_CPUUSAGE_EXCEEDED = 0x88890017;
  static const AUDCLNT_HRESULT AUDCLNT_E_BUFFER_ERROR = 0x88890018;
  static const AUDCLNT_HRESULT AUDCLNT_E_BUFFER_SIZE_NOT_ALIGNED = 0x88890019;
  static const AUDCLNT_HRESULT AUDCLNT_E_INVALID_DEVICE_PERIOD = 0x88890020;
  static const AUDCLNT_HRESULT AUDCLNT_S_BUFFER_EMPTY = 0x08890001;
  static const AUDCLNT_HRESULT AUDCLNT_S_THREAD_ALREADY_REGISTERED = 0x08890002;
  static const AUDCLNT_HRESULT AUDCLNT_S_POSITION_STALLED = 0x08890003;
  typedef UINT AUDCLNT_SHAREMODE; //Alias
  static const AUDCLNT_SHAREMODE AUDCLNT_SHAREMODE_SHARED = 0;
  static const AUDCLNT_SHAREMODE AUDCLNT_SHAREMODE_EXCLUSIVE = 1;
  typedef UINT AudioSessionState; //Alias
  static const AudioSessionState AudioSessionStateInactive = 0;
  static const AudioSessionState AudioSessionStateActive = 1;
  static const AudioSessionState AudioSessionStateExpired = 2;
  typedef UINT AudioSessionDisconnectReason; //Alias
  static const AudioSessionDisconnectReason DisconnectReasonDeviceRemoval = 0;
  static const AudioSessionDisconnectReason DisconnectReasonServerShutdown = 1;
  static const AudioSessionDisconnectReason DisconnectReasonFormatChanged = 2;
  static const AudioSessionDisconnectReason DisconnectReasonSessionLogoff = 3;
  static const AudioSessionDisconnectReason DisconnectReasonSessionDisconnected = 4;
  static const AudioSessionDisconnectReason DisconnectReasonExclusiveModeOverride = 5;
  typedef UINT ConnectorType; //Alias
  static const ConnectorType Unknown_Connector = 0;
  static const ConnectorType Physical_Internal = 1;
  static const ConnectorType Physical_External = 2;
  static const ConnectorType Software_IO = 3;
  static const ConnectorType Software_Fixed = 4;
  static const ConnectorType Network = 5;
  typedef UINT DataFlow; //Alias
  static const DataFlow In = 0;
  static const DataFlow Out = 1;
  typedef UINT EDataFlow; //Alias
  static const EDataFlow eRender = 0;
  static const EDataFlow eCapture = 1;
  static const EDataFlow eAll = 2;
  typedef UINT ERole; //Alias
  static const ERole eConsole = 0;
  static const ERole eMultimedia = 1;
  static const ERole eCommunications = 2;
  typedef UINT PartType; //Alias
  static const PartType Connector = 0;
  static const PartType Subunit = 1;
  typedef struct KSIDENTIFIER_s {
    GUID Set;
    ULONG Id;
    ULONG Flags;
  } KSIDENTIFIER_s;
  typedef union KSIDENTIFIER {
    KSIDENTIFIER_s ;
    LONGLONG Alignment;
  } KSIDENTIFIER;
  typedef KSIDENTIFIER KSPROPERTY; //Alias
  typedef KSPROPERTY *PKSPROPERTY; //Pointer
  typedef KSIDENTIFIER KSMETHOD; //Alias
  typedef KSMETHOD *PKSMETHOD; //Pointer
  typedef KSIDENTIFIER KSEVENT; //Alias
  typedef KSEVENT *PKSEVENT; //Pointer
  typedef struct KSDATAFORMAT {
    ULONG FormatSize;
    ULONG Flags;
    ULONG SampleSize;
    ULONG Reserved;
    GUID MajorFormat;
    GUID SubFormat;
    GUID Specifier;
  } KSDATAFORMAT;
  typedef KSDATAFORMAT *PKSDATAFORMAT; //Pointer
  typedef UINT EPcxConnectionType; //Alias
  static const EPcxConnectionType eConnTypeUnknown = 0;
  static const EPcxConnectionType eConnType3Point5mm = 1;
  static const EPcxConnectionType eConnTypeQuarter = 2;
  static const EPcxConnectionType eConnTypeAtapiInternal = 3;
  static const EPcxConnectionType eConnTypeRCA = 4;
  static const EPcxConnectionType eConnTypeOptical = 5;
  static const EPcxConnectionType eConnTypeOtherDigital = 6;
  static const EPcxConnectionType eConnTypeOtherAnalog = 7;
  static const EPcxConnectionType eConnTypeMultichannelAnalogDIN = 8;
  static const EPcxConnectionType eConnTypeXlrProfessional = 9;
  static const EPcxConnectionType eConnTypeRJ11Modem = 10;
  static const EPcxConnectionType eConnTypeCombination = 11;
  typedef UINT EPcxGeoLocation; //Alias
  static const EPcxGeoLocation eGeoLocRear = 0x1;
  static const EPcxGeoLocation eGeoLocFront = 2;
  static const EPcxGeoLocation eGeoLocLeft = 3;
  static const EPcxGeoLocation eGeoLocRight = 4;
  static const EPcxGeoLocation eGeoLocTop = 5;
  static const EPcxGeoLocation eGeoLocBottom = 6;
  static const EPcxGeoLocation eGeoLocRearPanel = 7;
  static const EPcxGeoLocation eGeoLocRiser = 8;
  static const EPcxGeoLocation eGeoLocInsideMobileLid = 9;
  static const EPcxGeoLocation eGeoLocDrivebay = 10;
  static const EPcxGeoLocation eGeoLocHDMI = 11;
  static const EPcxGeoLocation eGeoLocOutsideMobileLid = 12;
  static const EPcxGeoLocation eGeoLocATAPI = 13;
  static const EPcxGeoLocation eGeoLocReserved5 = 14;
  static const EPcxGeoLocation eGeoLocReserved6 = 15;
  typedef UINT EPcxGenLocation; //Alias
  static const EPcxGenLocation eGenLocPrimaryBox = 0;
  static const EPcxGenLocation eGenLocInternal = 1;
  static const EPcxGenLocation eGenLocSeparate = 2;
  static const EPcxGenLocation eGenLocOther = 3;
  typedef UINT EPxcPortConnection; //Alias
  static const EPxcPortConnection ePortConnJack = 0;
  static const EPxcPortConnection ePortConnIntegratedDevice = 1;
  static const EPxcPortConnection ePortConnBothIntegratedAndJack = 2;
  static const EPxcPortConnection ePortConnUnknown = 3;
  typedef struct KSJACK_DESCRIPTION {
    SPEAKER_POSITION ChannelMapping;
    COLORREF Color;
    EPcxConnectionType ConnectionType;
    EPcxGeoLocation GeoLocation;
    EPcxGenLocation GenLocation;
    EPxcPortConnection PortConnection;
    BOOL IsConnected;
  } KSJACK_DESCRIPTION;
  typedef DWORD JACKDESC2_FLAGS; //Alias
  typedef struct KSJACK_DESCRIPTION2 {
    DWORD DeviceStateInfo;
    JACKDESC2_FLAGS JackCapabilities;
  } KSJACK_DESCRIPTION2;
  typedef UINT KSJACK_SINK_CONNECTIONTYPE; //Alias
  static const KSJACK_SINK_CONNECTIONTYPE KSJACK_SINK_CONNECTIONTYPE_HDMI = 0;
  static const KSJACK_SINK_CONNECTIONTYPE KSJACK_SINK_CONNECTIONTYPE_DISPLAYPORT = 1;
  typedef struct KSJACK_SINK_INFORMATION {
    KSJACK_SINK_CONNECTIONTYPE ConnType;
    WORD ManufacturerId;
    WORD ProductId;
    WORD AudioLatency;
    BOOL HDCPCapable;
    BOOL AICapable;
    UCHAR SinkDescriptionLength;
    WCHAR SinkDescription[MAX_SINK_DESCRIPTION_NAME_LENGTH];
    LUID PortId;
  } KSJACK_SINK_INFORMATION;
  typedef struct AUDIO_VOLUME_NOTIFICATION_DATA {
    GUID guidEventContext;
    BOOL bMuted;
    float fMasterVolume;
    UINT nChannels;
    float afChannelVolumes[1];
  } AUDIO_VOLUME_NOTIFICATION_DATA;
  typedef AUDIO_VOLUME_NOTIFICATION_DATA *PAUDIO_VOLUME_NOTIFICATION_DATA; //Pointer
]]

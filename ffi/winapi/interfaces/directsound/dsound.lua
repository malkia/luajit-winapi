require( 'ffi/winapi/headers/multimedia' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IDirectSound; //Interface
  typedef void* IDirectSound3DBuffer; //Interface
  typedef void* IDirectSound3DListener; //Interface
  typedef void* IDirectSound8; //Interface
  typedef void* IDirectSoundBuffer; //Interface
  typedef void* IDirectSoundBuffer8; //Interface
  typedef void* IDirectSoundCapture; //Interface
  typedef void* IDirectSoundCaptureBuffer; //Interface
  typedef void* IDirectSoundCaptureBuffer8; //Interface
  typedef void* IDirectSoundCaptureFXAec; //Interface
  typedef void* IDirectSoundCaptureFXNoiseSuppress; //Interface
  typedef void* IDirectSoundFullDuplex; //Interface
  typedef void* IDirectSoundFXChorus; //Interface
  typedef void* IDirectSoundFXCompressor; //Interface
  typedef void* IDirectSoundFXDistortion; //Interface
  typedef void* IDirectSoundFXEcho; //Interface
  typedef void* IDirectSoundFXFlanger; //Interface
  typedef void* IDirectSoundFXGargle; //Interface
  typedef void* IDirectSoundFXI3DL2Reverb; //Interface
  typedef void* IDirectSoundFXParamEq; //Interface
  typedef void* IDirectSoundFXWavesReverb; //Interface
  typedef void* IDirectSoundNotify; //Interface
  typedef void* IKsPropertySet; //Interface
  typedef void* IReferenceClock; //Interface
//typedef IDirectSoundCapture* IDirectSoundCapture8*; //Alias
//typedef IDirectSoundCapture** IDirectSoundCapture8**; //Alias
  typedef IDirectSound* LPDIRECTSOUND; //Alias
  typedef IDirectSound8* LPDIRECTSOUND8; //Alias
  typedef IDirectSoundCapture* LPDIRECTSOUNDCAPTURE; //Alias
  typedef IDirectSoundCapture8* LPDIRECTSOUNDCAPTURE8; //Alias
  typedef IDirectSoundFullDuplex* LPDIRECTSOUNDFULLDUPLEX; //Alias
  typedef IDirectSoundCaptureBuffer8* LPDIRECTSOUNDCAPTUREBUFFER8; //Alias
  typedef IDirectSoundCaptureBuffer8** LPLPDIRECTSOUNDCAPTUREBUFFER8; //Alias
  typedef IDirectSoundBuffer8* LPDIRECTSOUNDBUFFER8; //Alias
  typedef IDirectSoundBuffer8** LPLPDIRECTSOUNDBUFFER8; //Alias
  typedef IDirectSoundBuffer* LPDIRECTSOUNDBUFFER; //Alias
//typedef IDirectSoundCaptureBuffer** LPDIRECTSOUNDCAPTUREBUFFER*; //Alias
  typedef LPVOID LPDSENUMCALLBACK; //Alias
  typedef float D3DVALUE; //Alias
  typedef HRESULT WINAPI_DS_HRESULT; //Alias
  static const WINAPI_DS_HRESULT DS_OK = 0x00000000;
//static const WINAPI_DS_HRESULT S_FALSE = 1;
//static const WINAPI_DS_HRESULT E_ABORT = 0x80004004;
//static const WINAPI_DS_HRESULT E_HANDLE = 0x80070006;
//static const WINAPI_DS_HRESULT E_OUTOFMEMORY = 0x8007000E;
//static const WINAPI_DS_HRESULT E_POINTER = 0x80004003;
//static const WINAPI_DS_HRESULT E_UNEXPECTED = 0x8000FFFF;
  static const WINAPI_DS_HRESULT DS_NO_VIRTUALIZATION = 0x0878000a;
  static const WINAPI_DS_HRESULT DSERR_ALLOCATED = 0x8878000a;
  static const WINAPI_DS_HRESULT DSERR_CONTROLUNAVAIL = 0x8878001e;
  static const WINAPI_DS_HRESULT DSERR_INVALIDPARAM = 0x80070057;
  static const WINAPI_DS_HRESULT DSERR_INVALIDCALL = 0x88780032;
  static const WINAPI_DS_HRESULT DSERR_GENERIC = 0x80004005;
  static const WINAPI_DS_HRESULT DSERR_PRIOLEVELNEEDED = 0x88780046;
  static const WINAPI_DS_HRESULT DSERR_OUTOFMEMORY = 0x8007000e;
  static const WINAPI_DS_HRESULT DSERR_BADFORMAT = 0x88780064;
  static const WINAPI_DS_HRESULT DSERR_UNSUPPORTED = 0x80004001;
  static const WINAPI_DS_HRESULT DSERR_NODRIVER = 0x88780078;
  static const WINAPI_DS_HRESULT DSERR_ALREADYINITIALIZED = 0x88780082;
  static const WINAPI_DS_HRESULT DSERR_NOAGGREGATION = 0x80040110;
  static const WINAPI_DS_HRESULT DSERR_BUFFERLOST = 0x88780096;
  static const WINAPI_DS_HRESULT DSERR_OTHERAPPHASPRIO = 0x887800a0;
  static const WINAPI_DS_HRESULT DSERR_UNINITIALIZED = 0x887800aa;
  static const WINAPI_DS_HRESULT DSERR_NOINTERFACE = 0x80004002;
  static const WINAPI_DS_HRESULT DSERR_ACCESSDENIED = 0x80070005;
  static const WINAPI_DS_HRESULT DSERR_BUFFERTOOSMALL = 0x887800b4;
  static const WINAPI_DS_HRESULT DSERR_DS8_REQUIRED = 0x887800be;
  static const WINAPI_DS_HRESULT DSERR_SENDLOOP = 0x887800c8;
  static const WINAPI_DS_HRESULT DSERR_BADSENDBUFFERGUID = 0x887800d2;
  static const WINAPI_DS_HRESULT DSERR_OBJECTNOTFOUND = 0x88781161;
  static const WINAPI_DS_HRESULT DSERR_FXUNAVAILABLE = 0x887800dc;
  typedef DWORD WINAPI_DSCFX_Flags; //Alias
  typedef struct DSCEFFECTDESC {
    DWORD dwSize;
    WINAPI_DSCFX_Flags dwFlags;
    GUID guidDSCFXClass;
    GUID guidDSCFXInstance;
    DWORD dwReserved1;
    DWORD dwReserved2;
  } DSCEFFECTDESC;
  typedef DSCEFFECTDESC *LPDSCEFFECTDESC; //Pointer
  typedef DWORD WINAPI_DSCBCAPS_Flags; //Alias
  typedef struct DSCBUFFERDESC {
    DWORD dwSize;
    WINAPI_DSCBCAPS_Flags dwFlags;
    DWORD dwBufferBytes;
    DWORD dwReserved;
    LPWAVEFORMATEX lpwfxFormat;
    DWORD dwFXCount;
    LPDSCEFFECTDESC lpDSCFXDesc;
  } DSCBUFFERDESC;
  typedef DSCBUFFERDESC *LPCDSCBUFFERDESC; //Pointer
  typedef DWORD WINAPI_DSBCAPS_Flags; //Alias
  typedef struct DSBUFFERDESC {
    DWORD dwSize;
    WINAPI_DSBCAPS_Flags dwFlags;
    DWORD dwBufferBytes;
    DWORD dwReserved;
    LPWAVEFORMATEX lpwfxFormat;
    GUID guid3DAlgorithm;
  } DSBUFFERDESC;
  typedef DSBUFFERDESC *LPCDSBUFFERDESC; //Pointer
  typedef DWORD WINAPI_DS3DMODE; //Alias
  typedef struct DS3DBUFFER {
    DWORD dwSize;
    D3DVECTOR vPosition;
    D3DVECTOR vVelocity;
    DWORD dwInsideConeAngle;
    DWORD dwOutsideConeAngle;
    D3DVECTOR vConeOrientation;
    LONG lConeOutsideVolume;
    D3DVALUE flMinDistance;
    D3DVALUE flMaxDistance;
    WINAPI_DS3DMODE dwMode;
  } DS3DBUFFER;
  typedef DS3DBUFFER *LPDS3DBUFFER; //Pointer
  typedef DS3DBUFFER *LPCDS3DBUFFER; //Pointer
  typedef struct DS3DLISTENER {
    DWORD dwSize;
    D3DVECTOR vPosition;
    D3DVECTOR vVelocity;
    D3DVECTOR vOrientFront;
    D3DVECTOR vOrientTop;
    D3DVALUE flDistanceFactor;
    D3DVALUE flRolloffFactor;
    D3DVALUE flDopplerFactor;
  } DS3DLISTENER;
  typedef DS3DLISTENER *LPDS3DLISTENER; //Pointer
  typedef DS3DLISTENER *LPCDS3DLISTENER; //Pointer
  typedef struct DSBCAPS {
    DWORD dwSize;
    WINAPI_DSBCAPS_Flags dwFlags;
    DWORD dwBufferBytes;
    DWORD dwUnlockTransferRate;
    DWORD dwPlayCpuOverhead;
  } DSBCAPS;
  typedef DSBCAPS *LPDSBCAPS; //Pointer
  typedef struct DSCBCAPS {
    DWORD dwSize;
    WINAPI_DSCBCAPS_Flags dwFlags;
    DWORD dwBufferBytes;
    DWORD dwReserved;
  } DSCBCAPS;
  typedef DSCBCAPS *LPDSCBCAPS; //Pointer
  typedef DWORD WINAPI_DSCFX_AEC_MODE; //Alias
  typedef struct DSCFXAec {
    BOOL fEnable;
    BOOL fNoiseFill;
    WINAPI_DSCFX_AEC_MODE dwMode;
  } DSCFXAec;
  typedef DSCFXAec *LPDSCFXAec; //Pointer
  typedef DSCFXAec *LPCDSCFXAec; //Pointer
  typedef struct DSCFXNoiseSuppress {
    BOOL fEnable;
  } DSCFXNoiseSuppress;
  typedef DSCFXNoiseSuppress *LPDSCFXNoiseSuppress; //Pointer
  typedef DSCFXNoiseSuppress *LPCDSCFXNoiseSuppress; //Pointer
  typedef ULONG WINAPI_DSFXCHORUS_WAVE; //Alias
  static const WINAPI_DSFXCHORUS_WAVE DSFXCHORUS_WAVE_TRIANGLE = 0;
  static const WINAPI_DSFXCHORUS_WAVE DSFXCHORUS_WAVE_SIN = 1;
  typedef LONG WINAPI_DSFXCHORUS_PHASE; //Alias
  static const WINAPI_DSFXCHORUS_PHASE DSFXCHORUS_PHASE_NEG_180 = 0;
  static const WINAPI_DSFXCHORUS_PHASE DSFXCHORUS_PHASE_NEG_90 = 1;
  static const WINAPI_DSFXCHORUS_PHASE DSFXCHORUS_PHASE_ZERO = 2;
  static const WINAPI_DSFXCHORUS_PHASE DSFXCHORUS_PHASE_90 = 3;
  static const WINAPI_DSFXCHORUS_PHASE DSFXCHORUS_PHASE_180 = 4;
  typedef struct DSFXChorus {
    FLOAT fWetDryMix;
    FLOAT fDepth;
    FLOAT fFeedback;
    FLOAT fFrequency;
    WINAPI_DSFXCHORUS_WAVE lWaveform;
    FLOAT fDelay;
    WINAPI_DSFXCHORUS_PHASE lPhase;
  } DSFXChorus;
  typedef DSFXChorus *LPDSFXChorus; //Pointer
  typedef DSFXChorus *LPCDSFXChorus; //Pointer
  typedef struct DSFXCompressor {
    FLOAT fGain;
    FLOAT fAttack;
    FLOAT fRelease;
    FLOAT fThreshold;
    FLOAT fRatio;
    FLOAT fPredelay;
  } DSFXCompressor;
  typedef DSFXCompressor *LPDSFXCompressor; //Pointer
  typedef DSFXCompressor *LPCDSFXCompressor; //Pointer
  typedef struct DSFXDistortion {
    FLOAT fGain;
    FLOAT fEdge;
    FLOAT fPostEQCenterFrequency;
    FLOAT fPostEQBandwidth;
    FLOAT fPreLowpassCutoff;
  } DSFXDistortion;
  typedef DSFXDistortion *LPDSFXDistortion; //Pointer
  typedef DSFXDistortion *LPCDSFXDistortion; //Pointer
  typedef struct DSFXEcho {
    FLOAT fWetDryMix;
    FLOAT fFeedback;
    FLOAT fLeftDelay;
    FLOAT fRightDelay;
    LONG lPanDelay;
  } DSFXEcho;
  typedef DSFXEcho *LPDSFXEcho; //Pointer
  typedef DSFXEcho *LPCDSFXEcho; //Pointer
  typedef LONG WINAPI_DSFXFLANGER_WAVE; //Alias
  static const WINAPI_DSFXFLANGER_WAVE DSFXFLANGER_WAVE_TRIANGLE = 0;
  static const WINAPI_DSFXFLANGER_WAVE DSFXFLANGER_WAVE_SIN = 1;
  typedef LONG WINAPI_DSFXFLANGER_PHASE; //Alias
  static const WINAPI_DSFXFLANGER_PHASE DSFXFLANGER_PHASE_NEG_180 = 0;
  static const WINAPI_DSFXFLANGER_PHASE DSFXFLANGER_PHASE_NEG_90 = 1;
  static const WINAPI_DSFXFLANGER_PHASE DSFXFLANGER_PHASE_ZERO = 2;
  static const WINAPI_DSFXFLANGER_PHASE DSFXFLANGER_PHASE_90 = 3;
  static const WINAPI_DSFXFLANGER_PHASE DSFXFLANGER_PHASE_180 = 4;
  typedef struct DSFXFlanger {
    FLOAT fWetDryMix;
    FLOAT fDepth;
    FLOAT fFeedback;
    FLOAT fFrequency;
    WINAPI_DSFXFLANGER_WAVE lWaveform;
    FLOAT fDelay;
    WINAPI_DSFXFLANGER_PHASE lPhase;
  } DSFXFlanger;
  typedef DSFXFlanger *LPDSFXFlanger; //Pointer
  typedef DSFXFlanger *LPCDSFXFlanger; //Pointer
  typedef DWORD WINAPI_DSFXGARGLE_WAVE; //Alias
  static const WINAPI_DSFXGARGLE_WAVE DSFXGARGLE_WAVE_TRIANGLE = 0;
  static const WINAPI_DSFXGARGLE_WAVE DSFXGARGLE_WAVE_SQUARE = 1;
  typedef struct DSFXGargle {
    DWORD dwRateHz;
    WINAPI_DSFXGARGLE_WAVE dwWaveShape;
  } DSFXGargle;
  typedef DSFXGargle *LPDSFXGargle; //Pointer
  typedef DSFXGargle *LPCDSFXGargle; //Pointer
  typedef struct DSFXI3DL2Reverb {
    LONG lRoom;
    LONG lRoomHF;
    FLOAT flRoomRolloffFactor;
    FLOAT flDecayTime;
    FLOAT flDecayHFRatio;
    LONG lReflections;
    FLOAT flReflectionsDelay;
    LONG lReverb;
    FLOAT flReverbDelay;
    FLOAT flDiffusion;
    FLOAT flDensity;
    FLOAT flHFReference;
  } DSFXI3DL2Reverb;
  typedef DSFXI3DL2Reverb *LPDSFXI3DL2Reverb; //Pointer
  typedef DSFXI3DL2Reverb *LPCDSFXI3DL2Reverb; //Pointer
  typedef struct DSFXParamEq {
    FLOAT fCenter;
    FLOAT fBandwidth;
    FLOAT fGain;
  } DSFXParamEq;
  typedef DSFXParamEq *LPDSFXParamEq; //Pointer
  typedef DSFXParamEq *LPCDSFXParamEq; //Pointer
  typedef struct DSFXWavesReverb {
    FLOAT fInGain;
    FLOAT fReverbMix;
    FLOAT fReverbTime;
    FLOAT fHighFreqRTRatio;
  } DSFXWavesReverb;
  typedef DSFXWavesReverb *LPDSFXWavesReverb; //Pointer
  typedef DSFXWavesReverb *LPCDSFXWavesReverb; //Pointer
  typedef DWORD WINAPI_DSBPN_Enum; //Alias
  static const WINAPI_DSBPN_Enum DSBPN_OFFSETSTOP = 0xFFFFFFFF;
  typedef struct DSBPOSITIONNOTIFY {
    WINAPI_DSBPN_Enum dwOffset;
    HANDLE hEventNotify;
  } DSBPOSITIONNOTIFY;
  typedef DSBPOSITIONNOTIFY *LPCDSBPOSITIONNOTIFY; //Pointer
  typedef DWORD WINAPI_DSCCAPS_Flags; //Alias
  typedef struct DSCCAPS {
    DWORD dwSize;
    WINAPI_DSCCAPS_Flags dwFlags;
    DWORD dwFormats;
    DWORD dwChannels;
  } DSCCAPS;
  typedef DSCCAPS *LPDSCCAPS; //Pointer
  typedef DWORD WINAPI_DSCAPS_Flags; //Alias
  typedef struct DSCAPS {
    DWORD dwSize;
    WINAPI_DSCAPS_Flags dwFlags;
    DWORD dwMinSecondarySampleRate;
    DWORD dwMaxSecondarySampleRate;
    DWORD dwPrimaryBuffers;
    DWORD dwMaxHwMixingAllBuffers;
    DWORD dwMaxHwMixingStaticBuffers;
    DWORD dwMaxHwMixingStreamingBuffers;
    DWORD dwFreeHwMixingAllBuffers;
    DWORD dwFreeHwMixingStaticBuffers;
    DWORD dwFreeHwMixingStreamingBuffers;
    DWORD dwMaxHw3DAllBuffers;
    DWORD dwMaxHw3DStaticBuffers;
    DWORD dwMaxHw3DStreamingBuffers;
    DWORD dwFreeHw3DAllBuffers;
    DWORD dwFreeHw3DStaticBuffers;
    DWORD dwFreeHw3DStreamingBuffers;
    DWORD dwTotalHwMemBytes;
    DWORD dwFreeHwMemBytes;
    DWORD dwMaxContigFreeHwMemBytes;
    DWORD dwUnlockTransferRateHwBuffers;
    DWORD dwPlayCpuOverheadSwBuffers;
    DWORD dwReserved1;
    DWORD dwReserved2;
  } DSCAPS;
  typedef DSCAPS *LPDSCAPS; //Pointer
  typedef DWORD WINAPI_DSSCL_Flags; //Alias
  typedef DWORD WINAPI_DSSPEAKER_Flags; //Alias
  typedef DWORD WINAPI_DSBPLAY_Flags; //Alias
  typedef DWORD WINAPI_DSBLOCK_Flags; //Alias
  WINAPI_DS_HRESULT DirectSoundCaptureCreate(    LPCGUID pcGuidDevice, LPDIRECTSOUNDCAPTURE* ppDSC, LPUNKNOWN pUnkOuter);
  WINAPI_DS_HRESULT DirectSoundCaptureCreate8(   LPCGUID lpcGUID, LPDIRECTSOUNDCAPTURE8* lplpDSC, LPUNKNOWN pUnkOuter);
  WINAPI_DS_HRESULT DirectSoundCaptureEnumerate( LPDSENUMCALLBACK lpDSEnumCallback, LPVOID lpContext);
  WINAPI_DS_HRESULT DirectSoundCreate(           LPCGUID pcGuidDevice, LPDIRECTSOUND8* ppDS, LPUNKNOWN pUnkOuter);
  WINAPI_DS_HRESULT DirectSoundCreate8(          LPCGUID lpcGuidDevice, LPDIRECTSOUND8* ppDS8, LPUNKNOWN pUnkOuter);
  WINAPI_DS_HRESULT DirectSoundEnumerate(        LPDSENUMCALLBACK lpDSEnumCallback, LPVOID lpContext);
  WINAPI_DS_HRESULT DirectSoundFullDuplexCreate( LPCGUID pcGuidCaptureDevice, LPCGUID pcGuidRenderDevice, LPCDSCBUFFERDESC pcDSCBufferDesc, LPCDSBUFFERDESC pcDSBufferDesc, HWND hWnd, DWORD dwLevel, LPDIRECTSOUNDFULLDUPLEX* ppDSFD, LPDIRECTSOUNDCAPTUREBUFFER8* ppDSCBuffer8, LPDIRECTSOUNDBUFFER8* ppDSBuffer8, LPUNKNOWN pUnkOuter);
  WINAPI_DS_HRESULT GetDeviceID(                 LPCGUID pGuidSrc, LPGUID pGuidDest);
]]
return ffi.load( 'dsound.dll' )

require( "ffi/winapi/headers/multimedia" )
local ffi = require( "ffi" )
ffi.cdef [[
  WINAPI_DS_HRESULT DirectSoundCaptureCreate(    LPCGUID pcGuidDevice, LPDIRECTSOUNDCAPTURE* ppDSC, LPUNKNOWN pUnkOuter);
  WINAPI_DS_HRESULT DirectSoundCaptureCreate8(   LPCGUID lpcGUID, LPDIRECTSOUNDCAPTURE8* lplpDSC, LPUNKNOWN pUnkOuter);
  WINAPI_DS_HRESULT DirectSoundCaptureEnumerate( LPDSENUMCALLBACK lpDSEnumCallback, LPVOID lpContext);
  WINAPI_DS_HRESULT DirectSoundCreate(           LPCGUID pcGuidDevice, LPDIRECTSOUND8* ppDS, LPUNKNOWN pUnkOuter);
  WINAPI_DS_HRESULT DirectSoundCreate8(          LPCGUID lpcGuidDevice, LPDIRECTSOUND8* ppDS8, LPUNKNOWN pUnkOuter);
  WINAPI_DS_HRESULT DirectSoundEnumerate(        LPDSENUMCALLBACK lpDSEnumCallback, LPVOID lpContext);
  WINAPI_DS_HRESULT DirectSoundFullDuplexCreate( LPCGUID pcGuidCaptureDevice, LPCGUID pcGuidRenderDevice, LPCDSCBUFFERDESC pcDSCBufferDesc, LPCDSBUFFERDESC pcDSBufferDesc, HWND hWnd, DWORD dwLevel, LPDIRECTSOUNDFULLDUPLEX* ppDSFD, LPDIRECTSOUNDCAPTUREBUFFER8* ppDSCBuffer8, LPDIRECTSOUNDBUFFER8* ppDSBuffer8, LPUNKNOWN pUnkOuter);
  WINAPI_DS_HRESULT GetDeviceID(                 LPCGUID pGuidSrc, LPGUID pGuidDest);
]]
return ffi.load( "dsound.dll" )

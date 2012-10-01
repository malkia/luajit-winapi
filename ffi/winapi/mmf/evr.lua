require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/mmf/mmfdefs" )
local ffi = require( "ffi" )
ffi.cdef [[
  HRESULT MFCreateDXSurfaceBuffer(        REFIID riid, IUnknown* punkSurface, BOOL fBottomUpWhenLinear, IMFMediaBuffer** ppBuffer);
  HRESULT MFCreateVideoMixer(             IUnknown* pOwner, REFIID riidDevice, REFIID riid, void** ppVideoMixer);
  HRESULT MFCreateVideoMixerAndPresenter( IUnknown* pMixerOwner, IUnknown* pPresenterOwner, REFIID riidMixer, void** ppvVideoMixer, REFIID riidPresenter, void** ppvVideoPresenter);
  HRESULT MFCreateVideoPresenter(         IUnknown* pOwner, REFIID riidDevice, REFIID riid, void** ppvVideoPresenter);
  STDAPI  MFCreateVideoSampleAllocator(   REFIID riid, void** ppSampleAllocator);
  HRESULT MFCreateVideoSampleFromSurface( IUnknown* pUnkSurface, IMFSample** ppSample);
  BOOL    MFIsFormatYUV(                  DWORD Format);
]]
return ffi.load( "Evr.dll" )

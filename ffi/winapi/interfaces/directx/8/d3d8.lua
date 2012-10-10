require( 'ffi/winapi/headers/directx' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IDirect3D8; //Interface
  typedef void* IDirect3DBaseTexture8; //Interface
  typedef void* IDirect3DCubeTexture8; //Interface
  typedef void* IDirect3DDevice8; //Interface
  typedef void* IDirect3DIndexBuffer8; //Interface
  typedef void* IDirect3DResource8; //Interface
  typedef void* IDirect3DSurface8; //Interface
  typedef void* IDirect3DSwapChain8; //Interface
  typedef void* IDirect3DTexture8; //Interface
  typedef void* IDirect3DVertexBuffer8; //Interface
  typedef void* IDirect3DVolume8; //Interface
  typedef void* IDirect3DVolumeTexture8; //Interface
# pragma pack( push, 4 )
  typedef struct D3DADAPTER_IDENTIFIER8 {
    char Driver_MAX_DEVICE_IDENTIFIER_STRING_;
    char Description_MAX_DEVICE_IDENTIFIER_STRING_;
    LARGE_INTEGER DriverVersion;
    DWORD VendorId;
    DWORD DeviceId;
    DWORD SubSysId;
    DWORD Revision;
    GUID DeviceIdentifier;
    DWORD WHQLLevel;
  } D3DADAPTER_IDENTIFIER8;
# pragma pack( pop )
# pragma pack( push, 4 )
  typedef struct D3DVIEWPORT8 {
    DWORD X;
    DWORD Y;
    DWORD Width;
    DWORD Height;
    float MinZ;
    float MaxZ;
  } D3DVIEWPORT8;
# pragma pack( pop )
# pragma pack( push, 4 )
  typedef struct D3DMATERIAL8 {
    D3DCOLORVALUE Diffuse;
    D3DCOLORVALUE Ambient;
    D3DCOLORVALUE Specular;
    D3DCOLORVALUE Emissive;
    float Power;
  } D3DMATERIAL8;
# pragma pack( pop )
# pragma pack( push, 4 )
  typedef struct D3DLIGHT8 {
    D3DLIGHTTYPE Type;
    D3DCOLORVALUE Diffuse;
    D3DCOLORVALUE Specular;
    D3DCOLORVALUE Ambient;
    D3DVECTOR Position;
    D3DVECTOR Direction;
    float Range;
    float Falloff;
    float Attenuation0;
    float Attenuation1;
    float Attenuation2;
    float Theta;
    float Phi;
  } D3DLIGHT8;
# pragma pack( pop )
  typedef DWORD D3DCS_FLAGS; //Alias
# pragma pack( push, 4 )
  typedef struct D3DCLIPSTATUS8 {
    D3DCS_FLAGS ClipUnion;
    D3DCS_FLAGS ClipIntersection;
  } D3DCLIPSTATUS8;
# pragma pack( pop )
# pragma pack( push, 4 )
  typedef struct D3DCAPS8 {
    D3DDEVTYPE DeviceType;
    UINT AdapterOrdinal;
    D3DCAPS Caps;
    D3DCAPS2 Caps2;
    D3DCAPS3 Caps3;
    D3DPRESENT PresentationIntervals;
    D3DCURSORCAPS CursorCaps;
    D3DDEVCAPS DevCaps;
    D3DPMISCCAPS PrimitiveMiscCaps;
    D3DPRASTERCAPS RasterCaps;
    D3DPCMPCAPS ZCmpCaps;
    D3DPBLENDCAPS SrcBlendCaps;
    D3DPBLENDCAPS DestBlendCaps;
    D3DPCMPCAPS AlphaCmpCaps;
    D3DPSHADECAPS ShadeCaps;
    D3DPTEXTURECAPS TextureCaps;
    D3DPTFILTERCAPS TextureFilterCaps;
    D3DPTFILTERCAPS CubeTextureFilterCaps;
    D3DPTFILTERCAPS VolumeTextureFilterCaps;
    D3DPTADDRESSCAPS TextureAddressCaps;
    D3DPTADDRESSCAPS VolumeTextureAddressCaps;
    D3DLINECAPS LineCaps;
    DWORD MaxTextureWidth;
    DWORD MaxTextureHeight;
    DWORD MaxVolumeExtent;
    DWORD MaxTextureRepeat;
    DWORD MaxTextureAspectRatio;
    DWORD MaxAnisotropy;
    float MaxVertexW;
    float GuardBandLeft;
    float GuardBandTop;
    float GuardBandRight;
    float GuardBandBottom;
    float ExtentsAdjust;
    D3DSTENCILCAPS StencilCaps;
    D3DFVFCAPS FVFCaps;
    D3DTEXOPCAPS TextureOpCaps;
    DWORD MaxTextureBlendStages;
    DWORD MaxSimultaneousTextures;
    D3DVTXPCAPS VertexProcessingCaps;
    DWORD MaxActiveLights;
    DWORD MaxUserClipPlanes;
    DWORD MaxVertexBlendMatrices;
    DWORD MaxVertexBlendMatrixIndex;
    float MaxPointSize;
    DWORD MaxPrimitiveCount;
    DWORD MaxVertexIndex;
    DWORD MaxStreams;
    DWORD MaxStreamStride;
    DWORD VertexShaderVersion;
    DWORD MaxVertexShaderConst;
    DWORD PixelShaderVersion;
    float MaxPixelShaderValue;
  } D3DCAPS8;
# pragma pack( pop )
  IDirect3D8* Direct3DCreate8( UINT SDKVersion);
]]
ffi.load( 'd3d8.dll' )

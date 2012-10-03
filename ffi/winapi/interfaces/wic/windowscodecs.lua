require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IWICBitmap; //Interface
  typedef void* IWICBitmapClipper; //Interface
  typedef void* IWICBitmapCodecInfo; //Interface
  typedef void* IWICBitmapCodecProgressNotification; //Interface
  typedef void* IWICBitmapDecoder; //Interface
  typedef void* IWICBitmapDecoderInfo; //Interface
  typedef void* IWICBitmapEncoder; //Interface
  typedef void* IWICBitmapEncoderInfo; //Interface
  typedef void* IWICBitmapFlipRotator; //Interface
  typedef void* IWICBitmapFrameDecode; //Interface
  typedef void* IWICBitmapFrameEncode; //Interface
  typedef void* IWICBitmapLock; //Interface
  typedef void* IWICBitmapScaler; //Interface
  typedef void* IWICBitmapSource; //Interface
  typedef void* IWICBitmapSourceTransform; //Interface
  typedef void* IWICColorContext; //Interface
  typedef void* IWICColorTransform; //Interface
  typedef void* IWICComponentFactory; //Interface
  typedef void* IWICComponentInfo; //Interface
  typedef void* IWICDevelopRaw; //Interface
  typedef void* IWICDevelopRawNotificationCallback; //Interface
  typedef void* IWICEnumMetadataItem; //Interface
  typedef void* IWICFastMetadataEncoder; //Interface
  typedef void* IWICFormatConverter; //Interface
  typedef void* IWICFormatConverterInfo; //Interface
  typedef void* IWICImagingFactory; //Interface
  typedef void* IWICMetadataBlockReader; //Interface
  typedef void* IWICMetadataBlockWriter; //Interface
  typedef void* IWICMetadataHandlerInfo; //Interface
  typedef void* IWICMetadataQueryReader; //Interface
  typedef void* IWICMetadataQueryWriter; //Interface
  typedef void* IWICMetadataReader; //Interface
  typedef void* IWICMetadataReaderInfo; //Interface
  typedef void* IWICMetadataWriter; //Interface
  typedef void* IWICMetadataWriterInfo; //Interface
  typedef void* IWICPalette; //Interface
  typedef void* IWICPersistStream; //Interface
  typedef void* IWICPixelFormatInfo; //Interface
  typedef void* IWICPixelFormatInfo2; //Interface
  typedef void* IWICProgressCallback; //Interface
  typedef void* IWICProgressiveLevelControl; //Interface
  typedef void* IWICStream; //Interface
  typedef void* IWICStreamProvider; //Interface
  typedef void* IPropertyBag2; //Interface
  typedef HRESULT WINAPI_WIC_HRESULT; //Alias
  static const HRESULT S_OK = 0;
  static const HRESULT E_NOINTERFACE = 0x80004002;
  static const HRESULT CO_E_NOTINITIALIZED = 0x800401F0;
  static const HRESULT WINCODEC_ERR_GENERIC_ERROR = 0x80004005;
  static const HRESULT WINCODEC_ERR_INVALIDPARAMETER = 0x80070057;
  static const HRESULT WINCODEC_ERR_OUTOFMEMORY = 0x8007000e;
  static const HRESULT WINCODEC_ERR_NOTIMPLEMENTED = 0x80004001;
  static const HRESULT WINCODEC_ERR_ABORTED = 0x80004004;
  static const HRESULT WINCODEC_ERR_ACCESSDENIED = 0x80070005;
  static const HRESULT WINCODEC_ERR_VALUEOVERFLOW = 0x80070216;
  static const HRESULT WINCODEC_ERR_WRONGSTATE = 0x88982f04;
  static const HRESULT WINCODEC_ERR_VALUEOUTOFRANGE = 0x88982f05;
  static const HRESULT WINCODEC_ERR_UNKNOWNIMAGEFORMAT = 0x88982f07;
  static const HRESULT WINCODEC_ERR_UNSUPPORTEDVERSION = 0x88982f0b;
  static const HRESULT WINCODEC_ERR_NOTINITIALIZED = 0x88982f0c;
  static const HRESULT WINCODEC_ERR_ALREADYLOCKED = 0x88982f0d;
  static const HRESULT WINCODEC_ERR_PROPERTYNOTFOUND = 0x88982f40;
  static const HRESULT WINCODEC_ERR_PROPERTYNOTSUPPORTED = 0x88982f41;
  static const HRESULT WINCODEC_ERR_PROPERTYSIZE = 0x88982f42;
  static const HRESULT WINCODEC_ERR_CODECPRESENT = 0x88982f43;
  static const HRESULT WINCODEC_ERR_CODECNOTHUMBNAIL = 0x88982f44;
  static const HRESULT WINCODEC_ERR_PALETTEUNAVAILABLE = 0x88982f45;
  static const HRESULT WINCODEC_ERR_CODECTOOMANYSCANLINES = 0x88982f46;
  static const HRESULT WINCODEC_ERR_INTERNALERROR = 0x88982f48;
  static const HRESULT WINCODEC_ERR_SOURCERECTDOESNOTMATCHDIMENSIONS = 0x88982f49;
  static const HRESULT WINCODEC_ERR_COMPONENTNOTFOUND = 0x88982f50;
  static const HRESULT WINCODEC_ERR_IMAGESIZEOUTOFRANGE = 0x88982f51;
  static const HRESULT WINCODEC_ERR_TOOMUCHMETADATA = 0x88982f52;
  static const HRESULT WINCODEC_ERR_BADIMAGE = 0x88982f60;
  static const HRESULT WINCODEC_ERR_BADHEADER = 0x88982f61;
  static const HRESULT WINCODEC_ERR_FRAMEMISSING = 0x88982f62;
  static const HRESULT WINCODEC_ERR_BADMETADATAHEADER = 0x88982f63;
  static const HRESULT WINCODEC_ERR_BADSTREAMDATA = 0x88982f70;
  static const HRESULT WINCODEC_ERR_STREAMWRITE = 0x88982f71;
  static const HRESULT WINCODEC_ERR_STREAMREAD = 0x88982f72;
  static const HRESULT WINCODEC_ERR_STREAMNOTAVAILABLE = 0x88982f73;
  static const HRESULT WINCODEC_ERR_UNSUPPORTEDPIXELFORMAT = 0x88982f80;
  static const HRESULT WINCODEC_ERR_UNSUPPORTEDOPERATION = 0x88982f81;
  static const HRESULT WINCODEC_ERR_INVALIDREGISTRATION = 0x88982f8a;
  static const HRESULT WINCODEC_ERR_COMPONENTINITIALIZEFAILURE = 0x88982f8b;
  static const HRESULT WINCODEC_ERR_INSUFFICIENTBUFFER = 0x88982f8c;
  static const HRESULT WINCODEC_ERR_DUPLICATEMETADATAPRESENT = 0x88982f8d;
  static const HRESULT WINCODEC_ERR_PROPERTYUNEXPECTEDTYPE = 0x88982f8e;
  static const HRESULT WINCODEC_ERR_UNEXPECTEDSIZE = 0x88982f8f;
  static const HRESULT WINCODEC_ERR_INVALIDQUERYREQUEST = 0x88982f90;
  static const HRESULT WINCODEC_ERR_UNEXPECTEDMETADATATYPE = 0x88982f91;
  static const HRESULT WINCODEC_ERR_REQUESTONLYVALIDATMETADATAROOT = 0x88982f92;
  static const HRESULT WINCODEC_ERR_INVALIDQUERYCHARACTER = 0x88982f93;
  static const HRESULT WINCODEC_ERR_WIN32ERROR = 0x88982f94;
  static const HRESULT WINCODEC_ERR_INVALIDPROGRESSIVELEVEL = 0x88982f95;
  typedef struct WICRawToneCurvePoint {
    double Input;
    double Output;
  } WICRawToneCurvePoint;
  typedef struct WICRawToneCurve {
    UINT cPoints;
    WICRawToneCurvePoint aPoints[1];
  } WICRawToneCurve;
  typedef REFGUID REFWICPixelFormatGUID; //Alias
  typedef GUID WICPixelFormatGUID; //Alias
  typedef LPVOID PFNProgressNotification; //Alias
  typedef BYTE* WICInProcPointer; //Alias
  typedef UINT32 WICColor; //Alias
  typedef UINT WICSectionAccessLevel; //Alias
  static const UINT WICSectionAccessLevelRead = 0x1;
  static const UINT WICSectionAccessLevelReadWrite = 0x3;
  typedef UINT WICComponentType; //Alias
  static const UINT WICDecoder = 0x1;
  static const UINT WICEncoder = 0x2;
  static const UINT WICPixelFormatConverter = 0x4;
  static const UINT WICMetadataReader = 0x8;
  static const UINT WICMetadataWriter = 0x10;
  static const UINT WICPixelFormat = 0x20;
  static const UINT WICAllComponents = 0x3f;
  typedef UINT WICDecodeOptions; //Alias
  static const UINT WICDecodeMetadataCacheOnDemand = 0;
  static const UINT WICDecodeMetadataCacheOnLoad = 0x1;
  typedef UINT WICBitmapEncoderCacheOption; //Alias
  static const UINT WICBitmapEncoderCacheInMemory = 0;
  static const UINT WICBitmapEncoderCacheTempFile = 0x1;
  static const UINT WICBitmapEncoderNoCache = 0x2;
  typedef UINT WICBitmapTransformOptions; //Alias
  static const UINT WICBitmapTransformRotate0 = 0;
  static const UINT WICBitmapTransformRotate90 = 0x1;
  static const UINT WICBitmapTransformRotate180 = 0x2;
  static const UINT WICBitmapTransformRotate270 = 0x3;
  static const UINT WICBitmapTransformFlipHorizontal = 0x8;
  static const UINT WICBitmapTransformFlipVertical = 0x10;
  typedef UINT WICBitmapInterpolationMode; //Alias
  static const UINT WICBitmapInterpolationModeNearestNeighbor = 0;
  static const UINT WICBitmapInterpolationModeLinear = 0x1;
  static const UINT WICBitmapInterpolationModeCubic = 0x2;
  static const UINT WICBitmapInterpolationModeFant = 0x3;
  typedef UINT WICColorContextType; //Alias
  static const UINT WICColorContextUninitialized = 0;
  static const UINT WICColorContextProfile = 0x1;
  static const UINT WICColorContextExifColorSpace = 0x2;
  typedef UINT WICBitmapCreateCacheOption; //Alias
  static const UINT WICBitmapNoCache = 0;
  static const UINT WICBitmapCacheOnDemand = 0x1;
  static const UINT WICBitmapCacheOnLoad = 0x2;
  typedef UINT WICBitmapAlphaChannelOption; //Alias
  static const UINT WICBitmapUseAlpha = 0;
  static const UINT WICBitmapUsePremultipliedAlpha = 0x1;
  static const UINT WICBitmapIgnoreAlpha = 0x2;
  typedef UINT WICRawParameterSet; //Alias
  static const UINT WICAsShotParameterSet = 0x1;
  static const UINT WICUserAdjustedParameterSet = 0x2;
  static const UINT WICAutoAdjustedParameterSet = 0x3;
  typedef UINT WICNamedWhitePoint; //Alias
  static const UINT WICWhitePointDefault = 0x1;
  static const UINT WICWhitePointDaylight = 0x2;
  static const UINT WICWhitePointCloudy = 0x4;
  static const UINT WICWhitePointShade = 0x8;
  static const UINT WICWhitePointTungsten = 0x10;
  static const UINT WICWhitePointFluorescent = 0x20;
  static const UINT WICWhitePointFlash = 0x40;
  static const UINT WICWhitePointUnderwater = 0x80;
  static const UINT WICWhitePointCustom = 0x100;
  static const UINT WICWhitePointAutoWhiteBalance = 0x200;
  typedef UINT WICRawRenderMode; //Alias
  static const UINT WICRawRenderModeDraft = 0x1;
  static const UINT WICRawRenderModeNormal = 0x2;
  static const UINT WICRawRenderModeBestQuality = 0x3;
  typedef UINT WICBitmapDitherType; //Alias
  static const UINT WICBitmapDitherTypeSolid = 0;
  static const UINT WICBitmapDitherTypeOrdered4x4 = 0x1;
  static const UINT WICBitmapDitherTypeOrdered8x8 = 0x2;
  static const UINT WICBitmapDitherTypeOrdered16x16 = 0x3;
  static const UINT WICBitmapDitherTypeSpiral4x4 = 0x4;
  static const UINT WICBitmapDitherTypeSpiral8x8 = 0x5;
  static const UINT WICBitmapDitherTypeDualSpiral4x4 = 0x6;
  static const UINT WICBitmapDitherTypeDualSpiral8x8 = 0x7;
  static const UINT WICBitmapDitherTypeErrorDiffusion = 0x8;
  typedef UINT WICBitmapPaletteType; //Alias
  static const UINT WICBitmapPaletteTypeCustom = 0;
  static const UINT WICBitmapPaletteTypeMedianCut = 0x1;
  static const UINT WICBitmapPaletteTypeFixedBW = 0x2;
  static const UINT WICBitmapPaletteTypeFixedHalftone8 = 0x3;
  static const UINT WICBitmapPaletteTypeFixedHalftone27 = 0x4;
  static const UINT WICBitmapPaletteTypeFixedHalftone64 = 0x5;
  static const UINT WICBitmapPaletteTypeFixedHalftone125 = 0x6;
  static const UINT WICBitmapPaletteTypeFixedHalftone216 = 0x7;
  static const UINT WICBitmapPaletteTypeFixedHalftone252 = 0x8;
  static const UINT WICBitmapPaletteTypeFixedHalftone256 = 0x9;
  static const UINT WICBitmapPaletteTypeFixedGray4 = 0xa;
  static const UINT WICBitmapPaletteTypeFixedGray16 = 0xb;
  static const UINT WICBitmapPaletteTypeFixedGray256 = 0xc;
  typedef UINT WICPixelFormatNumericRepresentation; //Alias
  static const UINT WICPixelFormatNumericRepresentationUnspecified = 0;
  static const UINT WICPixelFormatNumericRepresentationIndexed = 0x1;
  static const UINT WICPixelFormatNumericRepresentationUnsignedInteger = 0x2;
  static const UINT WICPixelFormatNumericRepresentationSignedInteger = 0x3;
  static const UINT WICPixelFormatNumericRepresentationFixed = 0x4;
  static const UINT WICPixelFormatNumericRepresentationFloat = 0x5;
  typedef UINT WICProgressOperation; //Alias
  static const UINT WICProgressOperationCopyPixels = 0x1;
  static const UINT WICProgressOperationWritePixels = 0x2;
  static const UINT WICProgressOperationAll = 0xffff;
  typedef struct WICRect {
    INT X;
    INT Y;
    INT Width;
    INT Height;
  } WICRect;
  typedef struct WICBitmapPattern {
    ULARGE_INTEGER Position;
    ULONG Length;
    BYTE* Pattern;
    BYTE* Mask;
    BOOL EndOfStream;
  } WICBitmapPattern;
  typedef UINT WICRawCapabilities; //Alias
  static const UINT WICRawCapabilityNotSupported = 0;
  static const UINT WICRawCapabilityGetSupported = 0x1;
  static const UINT WICRawCapabilityFullySupported = 0x2;
  typedef UINT WICRawRotationCapabilities; //Alias
  static const UINT WICRawRotationCapabilityNotSupported = 0;
  static const UINT WICRawRotationCapabilityGetSupported = 0x1;
  static const UINT WICRawRotationCapabilityNinetyDegreesSupported = 0x2;
  static const UINT WICRawRotationCapabilityFullySupported = 0x3;
  typedef struct WICRawCapabilitiesInfo {
    UINT cbSize;
    UINT CodecMajorVersion;
    UINT CodecMinorVersion;
    WICRawCapabilities ExposureCompensationSupport;
    WICRawCapabilities ContrastSupport;
    WICRawCapabilities RGBWhitePointSupport;
    WICRawCapabilities NamedWhitePointSupport;
    UINT NamedWhitePointSupportMask;
    WICRawCapabilities KelvinWhitePointSupport;
    WICRawCapabilities GammaSupport;
    WICRawCapabilities TintSupport;
    WICRawCapabilities SaturationSupport;
    WICRawCapabilities SharpnessSupport;
    WICRawCapabilities NoiseReductionSupport;
    WICRawCapabilities DestinationColorProfileSupport;
    WICRawCapabilities ToneCurveSupport;
    WICRawRotationCapabilities RotationSupport;
    WICRawCapabilities RenderModeSupport;
  } WICRawCapabilitiesInfo;
  typedef struct WICMetadataPattern {
    ULARGE_INTEGER Position;
    ULONG Length;
    BYTE* Pattern;
    BYTE* Mask;
    ULARGE_INTEGER DataOffset;
  } WICMetadataPattern;
  typedef struct WICMetadataHeader {
    ULARGE_INTEGER Position;
    ULONG Length;
    BYTE* Header;
    ULARGE_INTEGER DataOffset;
  } WICMetadataHeader;
  WINAPI_WIC_HRESULT WICConvertBitmapSource(       REFWICPixelFormatGUID dstFormat, IWICBitmapSource* pISrc, IWICBitmapSource** ppIDst);
  WINAPI_WIC_HRESULT WICCreateBitmapFromSection(   UINT width, UINT height, REFWICPixelFormatGUID pixelFormat, HANDLE hSection, UINT stride, UINT offset, IWICBitmap** pIBitmap);
  WINAPI_WIC_HRESULT WICCreateBitmapFromSectionEx( UINT width, UINT height, REFWICPixelFormatGUID pixelFormat, HANDLE hSection, UINT stride, UINT offset, WICSectionAccessLevel desiredAccessLevel, IWICBitmap** pIBitmap);
  WINAPI_WIC_HRESULT WICGetMetadataContentSize(    REFGUID guidContainerFormat, IWICMetadataWriter* pIWriter, ULARGE_INTEGER* pcbSize);
  WINAPI_WIC_HRESULT WICMapSchemaToName(           REFGUID guidMetadataFormat, LPWSTR pwzSchema, UINT cchName, WCHAR* wzName, UINT pcchActual);
  WINAPI_WIC_HRESULT WICMapGuidToShortName(        REFGUID guid, UINT cchName, WCHAR* wzName, UINT* pcchActual);
  WINAPI_WIC_HRESULT WICMapShortNameToGuid(        WINAPI_WCHAR* wzName, GUID* pguid);
  WINAPI_WIC_HRESULT WICMatchMetadataContent(      REFGUID guidContainerFormat, WINAPI_GUID* pguidVendor, IStream* pIStream, GUID* pguidMetadataFormat);
  WINAPI_WIC_HRESULT WICSerializeMetadataContent(  REFGUID guidContainerFormat, IWICMetadataWriter* pIWriter, DWORD dwPersistOptions, IStream* pIStream);
]]
return ffi.load( 'WindowsCodecs.dll' )

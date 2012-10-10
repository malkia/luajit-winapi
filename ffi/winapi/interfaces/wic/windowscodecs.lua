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
  typedef HRESULT WIC_HRESULT; //Alias
  static const WIC_HRESULT S_OK = 0;
  static const WIC_HRESULT S_FALSE = 1;
  static const WIC_HRESULT E_HANDLE = 0x80070006;
  static const WIC_HRESULT E_NOINTERFACE = 0x80004002;
  static const WIC_HRESULT E_POINTER = 0x80004003;
  static const WIC_HRESULT E_UNEXPECTED = 0x8000FFFF;
  static const WIC_HRESULT CO_E_NOTINITIALIZED = 0x800401F0;
  static const WIC_HRESULT WINCODEC_ERR_GENERIC_ERROR = 0x80004005;
  static const WIC_HRESULT WINCODEC_ERR_INVALIDPARAMETER = 0x80070057;
  static const WIC_HRESULT WINCODEC_ERR_OUTOFMEMORY = 0x8007000e;
  static const WIC_HRESULT WINCODEC_ERR_NOTIMPLEMENTED = 0x80004001;
  static const WIC_HRESULT WINCODEC_ERR_ABORTED = 0x80004004;
  static const WIC_HRESULT WINCODEC_ERR_ACCESSDENIED = 0x80070005;
  static const WIC_HRESULT WINCODEC_ERR_VALUEOVERFLOW = 0x80070216;
  static const WIC_HRESULT WINCODEC_ERR_WRONGSTATE = 0x88982f04;
  static const WIC_HRESULT WINCODEC_ERR_VALUEOUTOFRANGE = 0x88982f05;
  static const WIC_HRESULT WINCODEC_ERR_UNKNOWNIMAGEFORMAT = 0x88982f07;
  static const WIC_HRESULT WINCODEC_ERR_UNSUPPORTEDVERSION = 0x88982f0b;
  static const WIC_HRESULT WINCODEC_ERR_NOTINITIALIZED = 0x88982f0c;
  static const WIC_HRESULT WINCODEC_ERR_ALREADYLOCKED = 0x88982f0d;
  static const WIC_HRESULT WINCODEC_ERR_PROPERTYNOTFOUND = 0x88982f40;
  static const WIC_HRESULT WINCODEC_ERR_PROPERTYNOTSUPPORTED = 0x88982f41;
  static const WIC_HRESULT WINCODEC_ERR_PROPERTYSIZE = 0x88982f42;
  static const WIC_HRESULT WINCODEC_ERR_CODECPRESENT = 0x88982f43;
  static const WIC_HRESULT WINCODEC_ERR_CODECNOTHUMBNAIL = 0x88982f44;
  static const WIC_HRESULT WINCODEC_ERR_PALETTEUNAVAILABLE = 0x88982f45;
  static const WIC_HRESULT WINCODEC_ERR_CODECTOOMANYSCANLINES = 0x88982f46;
  static const WIC_HRESULT WINCODEC_ERR_INTERNALERROR = 0x88982f48;
  static const WIC_HRESULT WINCODEC_ERR_SOURCERECTDOESNOTMATCHDIMENSIONS = 0x88982f49;
  static const WIC_HRESULT WINCODEC_ERR_COMPONENTNOTFOUND = 0x88982f50;
  static const WIC_HRESULT WINCODEC_ERR_IMAGESIZEOUTOFRANGE = 0x88982f51;
  static const WIC_HRESULT WINCODEC_ERR_TOOMUCHMETADATA = 0x88982f52;
  static const WIC_HRESULT WINCODEC_ERR_BADIMAGE = 0x88982f60;
  static const WIC_HRESULT WINCODEC_ERR_BADHEADER = 0x88982f61;
  static const WIC_HRESULT WINCODEC_ERR_FRAMEMISSING = 0x88982f62;
  static const WIC_HRESULT WINCODEC_ERR_BADMETADATAHEADER = 0x88982f63;
  static const WIC_HRESULT WINCODEC_ERR_BADSTREAMDATA = 0x88982f70;
  static const WIC_HRESULT WINCODEC_ERR_STREAMWRITE = 0x88982f71;
  static const WIC_HRESULT WINCODEC_ERR_STREAMREAD = 0x88982f72;
  static const WIC_HRESULT WINCODEC_ERR_STREAMNOTAVAILABLE = 0x88982f73;
  static const WIC_HRESULT WINCODEC_ERR_UNSUPPORTEDPIXELFORMAT = 0x88982f80;
  static const WIC_HRESULT WINCODEC_ERR_UNSUPPORTEDOPERATION = 0x88982f81;
  static const WIC_HRESULT WINCODEC_ERR_INVALIDREGISTRATION = 0x88982f8a;
  static const WIC_HRESULT WINCODEC_ERR_COMPONENTINITIALIZEFAILURE = 0x88982f8b;
  static const WIC_HRESULT WINCODEC_ERR_INSUFFICIENTBUFFER = 0x88982f8c;
  static const WIC_HRESULT WINCODEC_ERR_DUPLICATEMETADATAPRESENT = 0x88982f8d;
  static const WIC_HRESULT WINCODEC_ERR_PROPERTYUNEXPECTEDTYPE = 0x88982f8e;
  static const WIC_HRESULT WINCODEC_ERR_UNEXPECTEDSIZE = 0x88982f8f;
  static const WIC_HRESULT WINCODEC_ERR_INVALIDQUERYREQUEST = 0x88982f90;
  static const WIC_HRESULT WINCODEC_ERR_UNEXPECTEDMETADATATYPE = 0x88982f91;
  static const WIC_HRESULT WINCODEC_ERR_REQUESTONLYVALIDATMETADATAROOT = 0x88982f92;
  static const WIC_HRESULT WINCODEC_ERR_INVALIDQUERYCHARACTER = 0x88982f93;
  static const WIC_HRESULT WINCODEC_ERR_WIN32ERROR = 0x88982f94;
  static const WIC_HRESULT WINCODEC_ERR_INVALIDPROGRESSIVELEVEL = 0x88982f95;
  typedef struct WICRawToneCurvePoint {
    double Input;
    double Output;
  } WICRawToneCurvePoint;
  typedef struct WICRawToneCurve {
    UINT cPoints;
    WICRawToneCurvePoint aPoints_1_;
  } WICRawToneCurve;
  typedef REFGUID REFWICPixelFormatGUID; //Alias
  typedef GUID WICPixelFormatGUID; //Alias
  typedef LPVOID PFNProgressNotification; //Alias
  typedef BYTE* WICInProcPointer; //Alias
  typedef UINT32 WICColor; //Alias
  typedef UINT WICSectionAccessLevel; //Alias
  static const WICSectionAccessLevel WICSectionAccessLevelRead = 0x1;
  static const WICSectionAccessLevel WICSectionAccessLevelReadWrite = 0x3;
  typedef UINT WICComponentType; //Alias
  static const WICComponentType WICDecoder = 0x1;
  static const WICComponentType WICEncoder = 0x2;
  static const WICComponentType WICPixelFormatConverter = 0x4;
  static const WICComponentType WICMetadataReader = 0x8;
  static const WICComponentType WICMetadataWriter = 0x10;
  static const WICComponentType WICPixelFormat = 0x20;
  static const WICComponentType WICAllComponents = 0x3f;
  typedef UINT WICDecodeOptions; //Alias
  static const WICDecodeOptions WICDecodeMetadataCacheOnDemand = 0;
  static const WICDecodeOptions WICDecodeMetadataCacheOnLoad = 0x1;
  typedef UINT WICBitmapEncoderCacheOption; //Alias
  static const WICBitmapEncoderCacheOption WICBitmapEncoderCacheInMemory = 0;
  static const WICBitmapEncoderCacheOption WICBitmapEncoderCacheTempFile = 0x1;
  static const WICBitmapEncoderCacheOption WICBitmapEncoderNoCache = 0x2;
  typedef UINT WICBitmapTransformOptions; //Alias
  static const WICBitmapTransformOptions WICBitmapTransformRotate0 = 0;
  static const WICBitmapTransformOptions WICBitmapTransformRotate90 = 0x1;
  static const WICBitmapTransformOptions WICBitmapTransformRotate180 = 0x2;
  static const WICBitmapTransformOptions WICBitmapTransformRotate270 = 0x3;
  static const WICBitmapTransformOptions WICBitmapTransformFlipHorizontal = 0x8;
  static const WICBitmapTransformOptions WICBitmapTransformFlipVertical = 0x10;
  typedef UINT WICBitmapInterpolationMode; //Alias
  static const WICBitmapInterpolationMode WICBitmapInterpolationModeNearestNeighbor = 0;
  static const WICBitmapInterpolationMode WICBitmapInterpolationModeLinear = 0x1;
  static const WICBitmapInterpolationMode WICBitmapInterpolationModeCubic = 0x2;
  static const WICBitmapInterpolationMode WICBitmapInterpolationModeFant = 0x3;
  typedef UINT WICColorContextType; //Alias
  static const WICColorContextType WICColorContextUninitialized = 0;
  static const WICColorContextType WICColorContextProfile = 0x1;
  static const WICColorContextType WICColorContextExifColorSpace = 0x2;
  typedef UINT WICBitmapCreateCacheOption; //Alias
  static const WICBitmapCreateCacheOption WICBitmapNoCache = 0;
  static const WICBitmapCreateCacheOption WICBitmapCacheOnDemand = 0x1;
  static const WICBitmapCreateCacheOption WICBitmapCacheOnLoad = 0x2;
  typedef UINT WICBitmapAlphaChannelOption; //Alias
  static const WICBitmapAlphaChannelOption WICBitmapUseAlpha = 0;
  static const WICBitmapAlphaChannelOption WICBitmapUsePremultipliedAlpha = 0x1;
  static const WICBitmapAlphaChannelOption WICBitmapIgnoreAlpha = 0x2;
  typedef UINT WICRawParameterSet; //Alias
  static const WICRawParameterSet WICAsShotParameterSet = 0x1;
  static const WICRawParameterSet WICUserAdjustedParameterSet = 0x2;
  static const WICRawParameterSet WICAutoAdjustedParameterSet = 0x3;
  typedef UINT WICNamedWhitePoint; //Alias
  static const WICNamedWhitePoint WICWhitePointDefault = 0x1;
  static const WICNamedWhitePoint WICWhitePointDaylight = 0x2;
  static const WICNamedWhitePoint WICWhitePointCloudy = 0x4;
  static const WICNamedWhitePoint WICWhitePointShade = 0x8;
  static const WICNamedWhitePoint WICWhitePointTungsten = 0x10;
  static const WICNamedWhitePoint WICWhitePointFluorescent = 0x20;
  static const WICNamedWhitePoint WICWhitePointFlash = 0x40;
  static const WICNamedWhitePoint WICWhitePointUnderwater = 0x80;
  static const WICNamedWhitePoint WICWhitePointCustom = 0x100;
  static const WICNamedWhitePoint WICWhitePointAutoWhiteBalance = 0x200;
  typedef UINT WICRawRenderMode; //Alias
  static const WICRawRenderMode WICRawRenderModeDraft = 0x1;
  static const WICRawRenderMode WICRawRenderModeNormal = 0x2;
  static const WICRawRenderMode WICRawRenderModeBestQuality = 0x3;
  typedef UINT WICBitmapDitherType; //Alias
  static const WICBitmapDitherType WICBitmapDitherTypeSolid = 0;
  static const WICBitmapDitherType WICBitmapDitherTypeOrdered4x4 = 0x1;
  static const WICBitmapDitherType WICBitmapDitherTypeOrdered8x8 = 0x2;
  static const WICBitmapDitherType WICBitmapDitherTypeOrdered16x16 = 0x3;
  static const WICBitmapDitherType WICBitmapDitherTypeSpiral4x4 = 0x4;
  static const WICBitmapDitherType WICBitmapDitherTypeSpiral8x8 = 0x5;
  static const WICBitmapDitherType WICBitmapDitherTypeDualSpiral4x4 = 0x6;
  static const WICBitmapDitherType WICBitmapDitherTypeDualSpiral8x8 = 0x7;
  static const WICBitmapDitherType WICBitmapDitherTypeErrorDiffusion = 0x8;
  typedef UINT WICBitmapPaletteType; //Alias
  static const WICBitmapPaletteType WICBitmapPaletteTypeCustom = 0;
  static const WICBitmapPaletteType WICBitmapPaletteTypeMedianCut = 0x1;
  static const WICBitmapPaletteType WICBitmapPaletteTypeFixedBW = 0x2;
  static const WICBitmapPaletteType WICBitmapPaletteTypeFixedHalftone8 = 0x3;
  static const WICBitmapPaletteType WICBitmapPaletteTypeFixedHalftone27 = 0x4;
  static const WICBitmapPaletteType WICBitmapPaletteTypeFixedHalftone64 = 0x5;
  static const WICBitmapPaletteType WICBitmapPaletteTypeFixedHalftone125 = 0x6;
  static const WICBitmapPaletteType WICBitmapPaletteTypeFixedHalftone216 = 0x7;
  static const WICBitmapPaletteType WICBitmapPaletteTypeFixedHalftone252 = 0x8;
  static const WICBitmapPaletteType WICBitmapPaletteTypeFixedHalftone256 = 0x9;
  static const WICBitmapPaletteType WICBitmapPaletteTypeFixedGray4 = 0xa;
  static const WICBitmapPaletteType WICBitmapPaletteTypeFixedGray16 = 0xb;
  static const WICBitmapPaletteType WICBitmapPaletteTypeFixedGray256 = 0xc;
  typedef UINT WICPixelFormatNumericRepresentation; //Alias
  static const WICPixelFormatNumericRepresentation WICPixelFormatNumericRepresentationUnspecified = 0;
  static const WICPixelFormatNumericRepresentation WICPixelFormatNumericRepresentationIndexed = 0x1;
  static const WICPixelFormatNumericRepresentation WICPixelFormatNumericRepresentationUnsignedInteger = 0x2;
  static const WICPixelFormatNumericRepresentation WICPixelFormatNumericRepresentationSignedInteger = 0x3;
  static const WICPixelFormatNumericRepresentation WICPixelFormatNumericRepresentationFixed = 0x4;
  static const WICPixelFormatNumericRepresentation WICPixelFormatNumericRepresentationFloat = 0x5;
  typedef UINT WICProgressOperation; //Alias
  static const WICProgressOperation WICProgressOperationCopyPixels = 0x1;
  static const WICProgressOperation WICProgressOperationWritePixels = 0x2;
  static const WICProgressOperation WICProgressOperationAll = 0xffff;
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
  static const WICRawCapabilities WICRawCapabilityNotSupported = 0;
  static const WICRawCapabilities WICRawCapabilityGetSupported = 0x1;
  static const WICRawCapabilities WICRawCapabilityFullySupported = 0x2;
  typedef UINT WICRawRotationCapabilities; //Alias
  static const WICRawRotationCapabilities WICRawRotationCapabilityNotSupported = 0;
  static const WICRawRotationCapabilities WICRawRotationCapabilityGetSupported = 0x1;
  static const WICRawRotationCapabilities WICRawRotationCapabilityNinetyDegreesSupported = 0x2;
  static const WICRawRotationCapabilities WICRawRotationCapabilityFullySupported = 0x3;
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
  WIC_HRESULT WICConvertBitmapSource(       REFWICPixelFormatGUID dstFormat, IWICBitmapSource* pISrc, IWICBitmapSource** ppIDst);
  WIC_HRESULT WICCreateBitmapFromSection(   UINT width, UINT height, REFWICPixelFormatGUID pixelFormat, HANDLE hSection, UINT stride, UINT offset, IWICBitmap** pIBitmap);
  WIC_HRESULT WICCreateBitmapFromSectionEx( UINT width, UINT height, REFWICPixelFormatGUID pixelFormat, HANDLE hSection, UINT stride, UINT offset, WICSectionAccessLevel desiredAccessLevel, IWICBitmap** pIBitmap);
  WIC_HRESULT WICGetMetadataContentSize(    REFGUID guidContainerFormat, IWICMetadataWriter* pIWriter, ULARGE_INTEGER* pcbSize);
  WIC_HRESULT WICMapSchemaToName(           REFGUID guidMetadataFormat, LPWSTR pwzSchema, UINT cchName, WCHAR* wzName, UINT pcchActual);
  WIC_HRESULT WICMapGuidToShortName(        REFGUID guid, UINT cchName, WCHAR* wzName, UINT* pcchActual);
  WIC_HRESULT WICMapShortNameToGuid(        WCHAR* wzName, GUID* pguid);
  WIC_HRESULT WICMatchMetadataContent(      REFGUID guidContainerFormat, GUID* pguidVendor, IStream* pIStream, GUID* pguidMetadataFormat);
  WIC_HRESULT WICSerializeMetadataContent(  REFGUID guidContainerFormat, IWICMetadataWriter* pIWriter, DWORD dwPersistOptions, IStream* pIStream);
]]
ffi.load( 'WindowsCodecs.dll' )

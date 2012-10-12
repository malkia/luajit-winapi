require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/gdi' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IDirectDrawSurface7; //Interface
//typedef LPLOGFONT LOGFONT*; //Alias
//typedef LOGFONT* GDIPCONST LOGFONT*; //Alias
//typedef GUID* GDIPCONST GUID*; //Alias
//typedef WCHAR* GDIPCONST WCHAR*; //Alias
  typedef float REAL; //Alias
//typedef REAL* GDIPCONST REAL*; //Alias
//typedef UINT16* GDIPCONST UINT16*; //Alias
//typedef void* GDIPCONST void*; //Alias
  typedef BITMAPINFO *GDIPCONST BITMAPINFO*; //Pointer
//typedef CLSID* GDIPCONST CLSID*; //Alias
//typedef BYTE* GDIPCONST BYTE*; //Alias
//typedef LPVOID GdiplusAbort*; //Alias
  typedef LPVOID DebugEventProc; //Alias
  typedef LPVOID NotificationHookProc; //Alias
  typedef LPVOID NotificationUnhookProc; //Alias
  typedef LPVOID GetThumbnailImageAbort; //Alias
  typedef LPVOID DrawImageAbort; //Alias
  typedef LPVOID EnumerateMetafileProc; //Alias
  typedef UINT GraphicsState; //Alias
  typedef UINT GraphicsContainer; //Alias
  typedef DWORD ARGB; //Alias
//typedef ARGB* GDIPCONST ARGB*; //Alias
  typedef EncoderParameters *GDIPCONST EncoderParameters*; //Pointer
//typedef LPVOID GpCachedBitmap*; //Alias
//typedef LPVOID GpPath*; //Alias
//typedef LPVOID GDIPCONST GpPath*; //Alias
//typedef LPVOID GpPathIterator*; //Alias
//typedef LPVOID GpPathGradient*; //Alias
//typedef LPVOID GpFontFamily*; //Alias
//typedef LPVOID GDIPCONST GpFontFamily*; //Alias
//typedef LPVOID GpPen*; //Alias
//typedef LPVOID GDIPCONST GpPen*; //Alias
//typedef LPVOID GpGraphics*; //Alias
//typedef GpGraphics* GDIPCONST GpGraphics*; //Alias
//typedef GpGraphics* GpGraphics*; //Alias
//typedef LPVOID GpRegion*; //Alias
//typedef LPVOID GpBrush*; //Alias
//typedef GpBrush* GDIPCONST GpBrush*; //Alias
//typedef LPVOID GpHatch*; //Alias
//typedef LPVOID GpImage*; //Alias
//typedef LPVOID GpTexture*; //Alias
//typedef LPVOID GpImageAttributes*; //Alias
//typedef GpImageAttributes* GDIPCONST GpImageAttributes*; //Alias
//typedef LPVOID GpSolidFill*; //Alias
//typedef LPVOID GpLineGradient*; //Alias
//typedef LPVOID GpCustomLineCap*; //Alias
//typedef LPVOID GpAdjustableArrowCap*; //Alias
//typedef LPVOID GpBitmap*; //Alias
//typedef LPVOID CGpEffect*; //Alias
//typedef LPVOID GpMetafile*; //Alias
//typedef GpMetafile* GDIPCONST GpMetafile*; //Alias
//typedef LPVOID GpFontCollection*; //Alias
//typedef LPVOID GpFont*; //Alias
//typedef GpFont* GDIPCONST GpFont*; //Alias
//typedef LPVOID GpStringFormat*; //Alias
//typedef GpStringFormat* GDIPCONST GpStringFormat*; //Alias
//typedef LPVOID GpMatrix*; //Alias
//typedef LPVOID GDIPCONST GpMatrix*; //Alias
  typedef WORD WINAPI_PropertyTagType; //Alias
  static const WINAPI_PropertyTagType PropertyTagTypeByte = 1;
  static const WINAPI_PropertyTagType PropertyTagTypeASCII = 2;
  static const WINAPI_PropertyTagType PropertyTagTypeShort = 3;
  static const WINAPI_PropertyTagType PropertyTagTypeLong = 4;
  static const WINAPI_PropertyTagType PropertyTagTypeRational = 5;
  static const WINAPI_PropertyTagType PropertyTagTypeUndefined = 7;
  static const WINAPI_PropertyTagType PropertyTagTypeSLONG = 9;
  static const WINAPI_PropertyTagType PropertyTagTypeSRational = 10;
  typedef struct PropertyItem {
    PROPID id;
    ULONG length;
    WINAPI_PropertyTagType type;
    VOID* value;
  } PropertyItem;
  typedef PropertyItem *GDIPCONST PropertyItem*; //Pointer
# pragma pack( push, 2 )
  typedef struct METAHEADER {
    WORD mtType;
    WORD mtHeaderSize;
    WORD mtVersion;
    DWORD mtSize;
    WORD mtNoObjects;
    DWORD mtMaxRecord;
    WORD mtNoParameters;
  } METAHEADER;
# pragma pack( pop )
  typedef struct ENHMETAHEADER3 {
    DWORD iType;
    DWORD nSize;
    RECTL rclBounds;
    RECTL rclFrame;
    DWORD dSignature;
    DWORD nVersion;
    DWORD nBytes;
    DWORD nRecords;
    WORD nHandles;
    WORD sReserved;
    DWORD nDescription;
    DWORD offDescription;
    DWORD nPalEntries;
    SIZEL szlDevice;
    SIZEL szlMillimeters;
  } ENHMETAHEADER3;
  typedef union WINAPI_MetafileHeader_u {
    METAHEADER WmfHeader;
    ENHMETAHEADER3 EmfHeader;
  } WINAPI_MetafileHeader_u;
  typedef UINT MetafileType; //Alias
  static const MetafileType MetafileTypeInvalid = 0;
  static const MetafileType MetafileTypeWmf = 1;
  static const MetafileType MetafileTypeWmfPlaceable = 2;
  static const MetafileType MetafileTypeEmf = 3;
  static const MetafileType MetafileTypeEmfPlusOnly = 4;
  static const MetafileType MetafileTypeEmfPlusDual = 5;
  typedef UINT WINAPI_GDIP_EMFPLUSFLAGS; //Alias
  typedef struct MetafileHeader {
    MetafileType Type;
    UINT Size;
    UINT Version;
    WINAPI_GDIP_EMFPLUSFLAGS EmfPlusFlags;
    REAL DpiX;
    REAL DpiY;
    INT X;
    INT Y;
    INT Width;
    INT Height;
    WINAPI_MetafileHeader_u Height;
    INT EmfPlusHeaderSize;
    INT LogicalDpiX;
    INT LogicalDpiY;
  } MetafileHeader;
# pragma pack( push, 2 )
  typedef struct PWMFRect16 {
    INT16 Left;
    INT16 Top;
    INT16 Right;
    INT16 Bottom;
  } PWMFRect16;
# pragma pack( pop )
# pragma pack( push, 2 )
  typedef struct WmfPlaceableFileHeader {
    UINT32 Key;
    INT16 Hmf;
    PWMFRect16 BoundingBox;
    INT16 Inch;
    UINT32 Reserved;
    INT16 Checksum;
  } WmfPlaceableFileHeader;
# pragma pack( pop )
  typedef WmfPlaceableFileHeader *GDIPCONST WmfPlaceableFileHeader*; //Pointer
  typedef struct BitmapData {
    UINT Width;
    UINT Height;
    INT Stride;
    PixelFormat PixelFormat;
    VOID* Scan0;
    UINT_PTR Reserved;
  } BitmapData;
  typedef struct Color {
    ARGB Argb;
  } Color;
  typedef struct ColorMap {
    Color oldColor;
    Color newColor;
  } ColorMap;
  typedef ColorMap *GDIPCONST ColorMap*; //Pointer
  typedef struct ColorMatrix {
    REAL m[5][5];
  } ColorMatrix;
  typedef ColorMatrix *GDIPCONST ColorMatrix*; //Pointer
  typedef struct ImageItemData {
    UINT Size;
    UINT Position;
    VOID* Desc;
    UINT DescSize;
    VOID* Data;
    UINT DataSize;
    UINT Cookie;
  } ImageItemData;
  typedef UINT PaletteFlags; //Alias
  typedef struct ColorPalette {
    PaletteFlags Flags;
    UINT Count;
    ARGB Entries[1];
  } ColorPalette;
  typedef ColorPalette *GDIPCONST ColorPalette*; //Pointer
  typedef struct GdiplusStartupOutput {
    NotificationHookProc NotificationHook;
    NotificationUnhookProc NotificationUnhook;
  } GdiplusStartupOutput;
  typedef struct GdiplusStartupInput {
    UINT32 GdiplusVersion;
    DebugEventProc DebugEventCallback;
    BOOL SuppressBackgroundThread;
    BOOL SuppressExternalCodecs;
  } GdiplusStartupInput;
  typedef DWORD ImageCodecFlags; //Alias
  typedef struct ImageCodecInfo {
    CLSID Clsid;
    GUID FormatID;
    WCHAR* CodecName;
    WCHAR* DllName;
    WCHAR* FormatDescription;
    WCHAR* FilenameExtension;
    WCHAR* MimeType;
    ImageCodecFlags Flags;
    DWORD Version;
    DWORD SigCount;
    DWORD SigSize;
    BYTE* SigPattern;
    BYTE* SigMask;
  } ImageCodecInfo;
  typedef struct Point {
    INT X;
    INT Y;
  } Point;
  typedef Point *GDIPCONST Point*; //Pointer
  typedef Point *GpPoint*; //Pointer
  typedef Point *GDIPCONST GpPoint*; //Pointer
  typedef struct PointF {
    REAL X;
    REAL Y;
  } PointF;
  typedef PointF *GDIPCONST PointF*; //Pointer
  typedef PointF *GpPointF*; //Pointer
  typedef PointF *GDIPCONST GpPointF*; //Pointer
  typedef struct PathData {
    INT Count;
    PointF* Points;
    BYTE* Types;
  } PathData;
  typedef PathData *GpPathData*; //Pointer
  typedef struct Rect {
    INT X;
    INT Y;
    INT Width;
    INT Height;
  } Rect;
  typedef Rect *GDIPCONST Rect*; //Pointer
  typedef Rect *GpRect*; //Pointer
  typedef Rect *GDIPCONST GpRect*; //Pointer
  typedef struct RectF {
    REAL X;
    REAL Y;
    REAL Width;
    REAL Height;
  } RectF;
  typedef RectF *GDIPCONST RectF*; //Pointer
  typedef RectF *GpRectF*; //Pointer
  typedef RectF *GDIPCONST GpRectF*; //Pointer
  typedef struct CharacterRange {
    INT First;
    INT Length;
  } CharacterRange;
  typedef CharacterRange *GDIPCONST CharacterRange*; //Pointer
  typedef UINT DitherType; //Alias
  static const DitherType DitherTypeNone = 0;
  static const DitherType DitherTypeSolid = 1;
  static const DitherType DitherTypeOrdered4x4 = 2;
  static const DitherType DitherTypeOrdered8x8 = 3;
  static const DitherType DitherTypeOrdered16x16 = 4;
  static const DitherType DitherTypeSpiral4x4 = 5;
  static const DitherType DitherTypeSpiral8x8 = 6;
  static const DitherType DitherTypeDualSpiral4x4 = 7;
  static const DitherType DitherTypeDualSpiral8x8 = 8;
  static const DitherType DitherTypeErrorDiffusion = 9;
  static const DitherType DitherTypeMax = 10;
  typedef UINT GpFillMode; //Alias
  static const GpFillMode FillModeAlternate = 0;
  static const GpFillMode FillModeWinding = 1;
  typedef UINT GpWrapMode; //Alias
  static const GpWrapMode WrapModeTile = 0;
  static const GpWrapMode WrapModeTileFlipX = 1;
  static const GpWrapMode WrapModeTileFlipY = 2;
  static const GpWrapMode WrapModeTileFlipXY = 3;
  static const GpWrapMode WrapModeClamp = 4;
  typedef UINT GpPenAlignment; //Alias
  static const GpPenAlignment PenAlignmentCenter = 0;
  static const GpPenAlignment PenAlignmentInset = 1;
  typedef UINT PaletteType; //Alias
  static const PaletteType PaletteTypeCustom = 0;
  static const PaletteType PaletteTypeOptimal = 1;
  static const PaletteType PaletteTypeFixedBW = 2;
  static const PaletteType PaletteTypeFixedHalftone8 = 3;
  static const PaletteType PaletteTypeFixedHalftone27 = 4;
  static const PaletteType PaletteTypeFixedHalftone64 = 5;
  static const PaletteType PaletteTypeFixedHalftone125 = 6;
  static const PaletteType PaletteTypeFixedHalftone216 = 7;
  static const PaletteType PaletteTypeFixedHalftone252 = 8;
  static const PaletteType PaletteTypeFixedHalftone256 = 9;
  typedef UINT HistogramFormat; //Alias
  static const HistogramFormat HistogramFormatARGB = 0;
  static const HistogramFormat HistogramFormatPARGB = 1;
  static const HistogramFormat HistogramFormatRGB = 2;
  static const HistogramFormat HistogramFormatGray = 3;
  static const HistogramFormat HistogramFormatB = 4;
  static const HistogramFormat HistogramFormatG = 5;
  static const HistogramFormat HistogramFormatR = 6;
  static const HistogramFormat HistogramFormatA = 7;
  typedef UINT ColorMatrixFlags; //Alias
  static const ColorMatrixFlags ColorMatrixFlagsDefault = 0;
  static const ColorMatrixFlags ColorMatrixFlagsSkipGrays = 1;
  static const ColorMatrixFlags ColorMatrixFlagsAltGray = 2;
  typedef UINT ColorChannelFlags; //Alias
  static const ColorChannelFlags ColorChannelFlagsC = 0;
  static const ColorChannelFlags ColorChannelFlagsM = 1;
  static const ColorChannelFlags ColorChannelFlagsY = 2;
  static const ColorChannelFlags ColorChannelFlagsK = 3;
  static const ColorChannelFlags ColorChannelFlagsLast = 4;
  typedef UINT SmoothingMode; //Alias
  static const SmoothingMode SmoothingModeInvalid = -1;
  static const SmoothingMode SmoothingModeDefault = 0;
  static const SmoothingMode SmoothingModeHighSpeed = 1;
  static const SmoothingMode SmoothingModeHighQuality = 2;
  static const SmoothingMode SmoothingModeNone = 3;
  static const SmoothingMode SmoothingModeAntiAlias8x4 = 4;
  static const SmoothingMode SmoothingModeAntiAlias8x8 = 5;
  typedef UINT StringAlignment; //Alias
  static const StringAlignment StringAlignmentNear = 0;
  static const StringAlignment StringAlignmentCenter = 1;
  static const StringAlignment StringAlignmentFar = 2;
  typedef UINT WarpMode; //Alias
  static const WarpMode WarpModePerspective = 0;
  static const WarpMode WarpModeBilinear = 1;
  typedef UINT GpPenType; //Alias
  static const GpPenType PenTypeUnknown = -1;
  static const GpPenType PenTypeSolidColor = 0;
  static const GpPenType PenTypeHatchFill = 1;
  static const GpPenType PenTypeTextureFill = 2;
  static const GpPenType PenTypePathGradient = 3;
  static const GpPenType PenTypeLinearGradient = 4;
  typedef UINT GpDashStyle; //Alias
  static const GpDashStyle DashStyleSolid = 0;
  static const GpDashStyle DashStyleDash = 1;
  static const GpDashStyle DashStyleDashDot = 2;
  static const GpDashStyle DashStyleDashDotDot = 3;
  static const GpDashStyle DashStyleCustom = 4;
  typedef UINT CustomLineCapType; //Alias
  static const CustomLineCapType CustomLineCapTypeDefault = 0;
  static const CustomLineCapType CustomLineCapTypeAdjustableArrow = 1;
  typedef UINT RotateFlipType; //Alias
  static const RotateFlipType RotateNoneFlipNone = 0;
  static const RotateFlipType Rotate90FlipNone = 1;
  static const RotateFlipType Rotate180FlipNone = 2;
  static const RotateFlipType Rotate270FlipNone = 3;
  static const RotateFlipType RotateNoneFlipX = 4;
  static const RotateFlipType Rotate90FlipX = 5;
  static const RotateFlipType Rotate180FlipX = 6;
  static const RotateFlipType Rotate270FlipX = 7;
  typedef UINT GpFlushIntention; //Alias
  static const GpFlushIntention FlushIntentionFlush = 0;
  static const GpFlushIntention FlushIntentionSync = 1;
  typedef UINT PixelOffsetMode; //Alias
  static const PixelOffsetMode PixelOffsetModeInvalid = -1;
  static const PixelOffsetMode PixelOffsetModeDefault = 0;
  static const PixelOffsetMode PixelOffsetModeHighSpeed = 1;
  static const PixelOffsetMode PixelOffsetModeHighQuality = 2;
  static const PixelOffsetMode PixelOffsetModeNone = 3;
  static const PixelOffsetMode PixelOffsetModeHalf = 4;
  typedef UINT GpCoordinateSpace; //Alias
  static const GpCoordinateSpace CoordinateSpaceWorld = 0;
  static const GpCoordinateSpace CoordinateSpacePage = 1;
  static const GpCoordinateSpace CoordinateSpaceDevice = 2;
  typedef UINT EmfType; //Alias
  static const EmfType EmfTypeEmfOnly = 3;
  static const EmfType EmfTypeEmfPlusOnly = 4;
  static const EmfType EmfTypeEmfPlusDual = 5;
  typedef UINT MetafileFrameUnit; //Alias
  static const MetafileFrameUnit MetafileFrameUnitPixel = 2;
  static const MetafileFrameUnit MetafileFrameUnitPoint = 3;
  static const MetafileFrameUnit MetafileFrameUnitInch = 4;
  static const MetafileFrameUnit MetafileFrameUnitDocument = 5;
  static const MetafileFrameUnit MetafileFrameUnitMillimeter = 6;
  static const MetafileFrameUnit MetafileFrameUnitGdi = 7;
  typedef UINT StringDigitSubstitute; //Alias
  static const StringDigitSubstitute StringDigitSubstituteUser = 0;
  static const StringDigitSubstitute StringDigitSubstituteNone = 1;
  static const StringDigitSubstitute StringDigitSubstituteNational = 2;
  static const StringDigitSubstitute StringDigitSubstituteTraditional = 3;
  typedef UINT GpTestControlEnum; //Alias
  static const GpTestControlEnum TestControlForceBilinear = 0;
  static const GpTestControlEnum TestControlNoICM = 1;
  static const GpTestControlEnum TestControlGetBuildNumber = 2;
  typedef UINT CombineMode; //Alias
  static const CombineMode CombineModeReplace = 0;
  static const CombineMode CombineModeIntersect = 1;
  static const CombineMode CombineModeUnion = 2;
  static const CombineMode CombineModeXor = 3;
  static const CombineMode CombineModeExclude = 4;
  static const CombineMode CombineModeComplement = 5;
  typedef UINT GpBrushType; //Alias
  static const GpBrushType BrushTypeSolidColor = 0;
  static const GpBrushType BrushTypeHatchFill = 1;
  static const GpBrushType BrushTypeTextureFill = 2;
  static const GpBrushType BrushTypePathGradient = 3;
  static const GpBrushType BrushTypeLinearGradient = 4;
  typedef UINT GpHatchStyle; //Alias
  static const GpHatchStyle HatchStyleHorizontal = 0;
  static const GpHatchStyle HatchStyleVertical = 1;
  static const GpHatchStyle HatchStyleForwardDiagonal = 2;
  static const GpHatchStyle HatchStyleBackwardDiagonal = 3;
  static const GpHatchStyle HatchStyleCross = 4;
  static const GpHatchStyle HatchStyleDiagonalCross = 5;
  static const GpHatchStyle HatchStyle05Percent = 6;
  static const GpHatchStyle HatchStyle10Percent = 7;
  static const GpHatchStyle HatchStyle20Percent = 8;
  static const GpHatchStyle HatchStyle25Percent = 9;
  static const GpHatchStyle HatchStyle30Percent = 10;
  static const GpHatchStyle HatchStyle40Percent = 11;
  static const GpHatchStyle HatchStyle50Percent = 12;
  static const GpHatchStyle HatchStyle60Percent = 13;
  static const GpHatchStyle HatchStyle70Percent = 14;
  static const GpHatchStyle HatchStyle75Percent = 15;
  static const GpHatchStyle HatchStyle80Percent = 16;
  static const GpHatchStyle HatchStyle90Percent = 17;
  static const GpHatchStyle HatchStyleLightDownwardDiagonal = 18;
  static const GpHatchStyle HatchStyleLightUpwardDiagonal = 19;
  static const GpHatchStyle HatchStyleDarkDownwardDiagonal = 20;
  static const GpHatchStyle HatchStyleDarkUpwardDiagonal = 21;
  static const GpHatchStyle HatchStyleWideDownwardDiagonal = 22;
  static const GpHatchStyle HatchStyleWideUpwardDiagonal = 23;
  static const GpHatchStyle HatchStyleLightVertical = 24;
  static const GpHatchStyle HatchStyleLightHorizontal = 25;
  static const GpHatchStyle HatchStyleNarrowVertical = 26;
  static const GpHatchStyle HatchStyleNarrowHorizontal = 27;
  static const GpHatchStyle HatchStyleDarkVertical = 28;
  static const GpHatchStyle HatchStyleDarkHorizontal = 29;
  static const GpHatchStyle HatchStyleDashedDownwardDiagonal = 30;
  static const GpHatchStyle HatchStyleDashedUpwardDiagonal = 31;
  static const GpHatchStyle HatchStyleDashedHorizontal = 32;
  static const GpHatchStyle HatchStyleDashedVertical = 33;
  static const GpHatchStyle HatchStyleSmallConfetti = 34;
  static const GpHatchStyle HatchStyleLargeConfetti = 35;
  static const GpHatchStyle HatchStyleZigZag = 36;
  static const GpHatchStyle HatchStyleWave = 37;
  static const GpHatchStyle HatchStyleDiagonalBrick = 38;
  static const GpHatchStyle HatchStyleHorizontalBrick = 39;
  static const GpHatchStyle HatchStyleWeave = 40;
  static const GpHatchStyle HatchStylePlaid = 41;
  static const GpHatchStyle HatchStyleDivot = 42;
  static const GpHatchStyle HatchStyleDottedGrid = 43;
  static const GpHatchStyle HatchStyleDottedDiamond = 44;
  static const GpHatchStyle HatchStyleShingle = 45;
  static const GpHatchStyle HatchStyleTrellis = 46;
  static const GpHatchStyle HatchStyleSphere = 47;
  static const GpHatchStyle HatchStyleSmallGrid = 48;
  static const GpHatchStyle HatchStyleSmallCheckerBoard = 49;
  static const GpHatchStyle HatchStyleLargeCheckerBoard = 50;
  static const GpHatchStyle HatchStyleOutlinedDiamond = 51;
  static const GpHatchStyle HatchStyleSolidDiamond = 52;
  typedef UINT LinearGradientMode; //Alias
  static const LinearGradientMode LinearGradientModeHorizontal = 0;
  static const LinearGradientMode LinearGradientModeVertical = 1;
  static const LinearGradientMode LinearGradientModeForwardDiagonal = 2;
  static const LinearGradientMode LinearGradientModeBackwardDiagonal = 3;
  typedef UINT Unit; //Alias
  static const Unit UnitWorld = 0;
  static const Unit UnitDisplay = 1;
  static const Unit UnitPixel = 2;
  static const Unit UnitPoint = 3;
  static const Unit UnitInch = 4;
  static const Unit UnitDocument = 5;
  static const Unit UnitMillimeter = 6;
  typedef Unit GpUnit; //Alias
  typedef UINT GpLineCap; //Alias
  static const GpLineCap LineCapFlat = 0;
  static const GpLineCap LineCapSquare = 1;
  static const GpLineCap LineCapRound = 2;
  static const GpLineCap LineCapTriangle = 3;
  static const GpLineCap LineCapNoAnchor = 0x10;
  static const GpLineCap LineCapSquareAnchor = 0x11;
  static const GpLineCap LineCapRoundAnchor = 0x12;
  static const GpLineCap LineCapDiamondAnchor = 0x13;
  static const GpLineCap LineCapArrowAnchor = 0x14;
  static const GpLineCap LineCapCustom = 0xff;
  typedef UINT GpDashCap; //Alias
  static const GpDashCap DashCapFlat = 0;
  static const GpDashCap DashCapRound = 1;
  static const GpDashCap DashCapTriangle = 2;
  typedef UINT GpLineJoin; //Alias
  static const GpLineJoin LineJoinMiter = 0;
  static const GpLineJoin LineJoinBevel = 1;
  static const GpLineJoin LineJoinRound = 2;
  static const GpLineJoin LineJoinMiterClipped = 3;
  typedef UINT GpMatrixOrder; //Alias
  static const GpMatrixOrder MatrixOrderPrepend = 0;
  static const GpMatrixOrder MatrixOrderAppend = 1;
  typedef UINT ImageType; //Alias
  static const ImageType ImageTypeUnknown = 0;
  static const ImageType ImageTypeBitmap = 1;
  static const ImageType ImageTypeMetafile = 2;
  typedef UINT ColorAdjustType; //Alias
  static const ColorAdjustType ColorAdjustTypeDefault = 0;
  static const ColorAdjustType ColorAdjustTypeBitmap = 1;
  static const ColorAdjustType ColorAdjustTypeBrush = 2;
  static const ColorAdjustType ColorAdjustTypePen = 3;
  static const ColorAdjustType ColorAdjustTypeText = 4;
  static const ColorAdjustType ColorAdjustTypeCount = 5;
  static const ColorAdjustType ColorAdjustTypeAny = 6;
  typedef UINT CompositingMode; //Alias
  static const CompositingMode CompositingModeSourceOver = 0;
  static const CompositingMode CompositingModeSourceCopy = 1;
  typedef UINT CompositingQuality; //Alias
  static const CompositingQuality CompositingQualityInvalid = -1;
  static const CompositingQuality CompositingQualityDefault = 0;
  static const CompositingQuality CompositingQualityHighSpeed = 1;
  static const CompositingQuality CompositingQualityHighQuality = 2;
  static const CompositingQuality CompositingQualityGammaCorrected = 3;
  static const CompositingQuality CompositingQualityAssumeLinear = 4;
  typedef UINT TextRenderingHint; //Alias
  static const TextRenderingHint TextRenderingHintSystemDefault = 0;
  static const TextRenderingHint TextRenderingHintSingleBitPerPixelGridFit = 1;
  static const TextRenderingHint TextRenderingHintSingleBitPerPixel = 2;
  static const TextRenderingHint TextRenderingHintAntiAliasGridFit = 3;
  static const TextRenderingHint TextRenderingHintAntiAlias = 4;
  static const TextRenderingHint TextRenderingHintClearTypeGridFit = 5;
  typedef UINT StringTrimming; //Alias
  static const StringTrimming StringTrimmingNone = 0;
  static const StringTrimming StringTrimmingCharacter = 1;
  static const StringTrimming StringTrimmingWord = 2;
  static const StringTrimming StringTrimmingEllipsisCharacter = 3;
  static const StringTrimming StringTrimmingEllipsisWord = 4;
  static const StringTrimming StringTrimmingEllipsisPath = 5;
  typedef LPVOID EmfPlusRecordType; //Alias
  typedef UINT GpStatus; //Alias
  static const GpStatus Ok = 0;
  static const GpStatus GenericError = 1;
  static const GpStatus InvalidParameter = 2;
  static const GpStatus OutOfMemory = 3;
  static const GpStatus ObjectBusy = 4;
  static const GpStatus InsufficientBuffer = 5;
  static const GpStatus NotImplemented = 6;
  static const GpStatus Win32Error = 7;
  static const GpStatus WrongState = 8;
  static const GpStatus Aborted = 9;
  static const GpStatus FileNotFound = 10;
  static const GpStatus ValueOverflow = 11;
  static const GpStatus AccessDenied = 12;
  static const GpStatus UnknownImageFormat = 13;
  static const GpStatus FontFamilyNotFound = 14;
  static const GpStatus FontStyleNotFound = 15;
  static const GpStatus NotTrueTypeFont = 16;
  static const GpStatus UnsupportedGdiplusVersion = 17;
  static const GpStatus GdiplusNotInitialized = 18;
  static const GpStatus PropertyNotFound = 19;
  static const GpStatus PropertyNotSupported = 20;
  static const GpStatus ProfileNotFound = 21;
  typedef INT WINAPI_FontStyle; //Alias
  static const WINAPI_FontStyle FontStyleRegular = 0;
  static const WINAPI_FontStyle FontStyleBold = 1;
  static const WINAPI_FontStyle FontStyleItalic = 2;
  static const WINAPI_FontStyle FontStyleBoldItalic = 3;
  static const WINAPI_FontStyle FontStyleUnderline = 4;
  static const WINAPI_FontStyle FontStyleStrikeout = 8;
  typedef UINT WINAPI_StringFormatFlags; //Alias
  typedef UINT WINAPI_ImageLockMode; //Alias
  typedef INT WINAPI_HotkeyPrefix; //Alias
  static const WINAPI_HotkeyPrefix HotkeyPrefixNone = 0;
  static const WINAPI_HotkeyPrefix HotkeyPrefixShow = 1;
  static const WINAPI_HotkeyPrefix HotkeyPrefixHide = 2;
  typedef UINT WINAPI_DriverStringOptions; //Alias
  GpStatus GdiplusStartup(                                   ULONG_PTR* token, GdiplusStartupInput* input, GdiplusStartupOutput* output);
  void     GdiplusShutdown(                                  ULONG_PTR token);
  GpStatus GdipCreatePath(                                   GpFillMode brushMode, GpPath** path);
  GpStatus GdipCreatePath2(                                  GDIPCONST GpPointF* points, GDIPCONST BYTE* types, INT count, GpFillMode fillMode, GpPath** path);
  GpStatus GdipCreatePath2I(                                 GDIPCONST GpPoint* points, GDIPCONST BYTE* types, INT count, GpFillMode fillMode, GpPath** path);
  GpStatus GdipClonePath(                                    GpPath* path, GpPath** clonePath);
  GpStatus GdipDeletePath(                                   GpPath* path);
  GpStatus GdipResetPath(                                    GpPath* path);
  GpStatus GdipGetPointCount(                                GpPath* path, INT* count);
  GpStatus GdipGetPathTypes(                                 GpPath* path, BYTE* types, INT count);
  GpStatus GdipGetPathPoints(                                GpPath* path, GpPointF* points, INT count);
  GpStatus GdipGetPathPointsI(                               GpPath* path, GpPoint* points, INT count);
  GpStatus GdipGetPathFillMode(                              GpPath* path, GpFillMode* fillmode);
  GpStatus GdipSetPathFillMode(                              GpPath* path, GpFillMode fillmode);
  GpStatus GdipGetPathData(                                  GpPath* path, GpPathData* pathData);
  GpStatus GdipStartPathFigure(                              GpPath* path);
  GpStatus GdipClosePathFigure(                              GpPath* path);
  GpStatus GdipClosePathFigures(                             GpPath* path);
  GpStatus GdipSetPathMarker(                                GpPath* path);
  GpStatus GdipClearPathMarkers(                             GpPath* path);
  GpStatus GdipReversePath(                                  GpPath* path);
  GpStatus GdipGetPathLastPoint(                             GpPath* path, GpPointF* lastPoint);
  GpStatus GdipAddPathLine(                                  GpPath* path, REAL x1, REAL y1, REAL x2, REAL y2);
  GpStatus GdipAddPathLine2(                                 GpPath* path, GDIPCONST GpPointF* points, INT count);
  GpStatus GdipAddPathArc(                                   GpPath* path, REAL x, REAL y, REAL width, REAL height, REAL startAngle, REAL sweepAngle);
  GpStatus GdipAddPathBezier(                                GpPath* path, REAL x1, REAL y1, REAL x2, REAL y2, REAL x3, REAL y3, REAL x4, REAL y4);
  GpStatus GdipAddPathBeziers(                               GpPath* path, GDIPCONST GpPointF* points, INT count);
  GpStatus GdipAddPathCurve(                                 GpPath* path, GDIPCONST GpPointF* points, INT count);
  GpStatus GdipAddPathCurve2(                                GpPath* path, GDIPCONST GpPointF* points, INT count, REAL tension);
  GpStatus GdipAddPathCurve3(                                GpPath* path, GDIPCONST GpPointF* points, INT count, INT offset, INT numberOfSegments, REAL tension);
  GpStatus GdipAddPathClosedCurve(                           GpPath* path, GDIPCONST GpPointF* points, INT count);
  GpStatus GdipAddPathClosedCurve2(                          GpPath* path, GDIPCONST GpPointF* points, INT count, REAL tension);
  GpStatus GdipAddPathRectangle(                             GpPath* path, REAL x, REAL y, REAL width, REAL height);
  GpStatus GdipAddPathRectangles(                            GpPath* path, GDIPCONST GpRectF* rects, INT count);
  GpStatus GdipAddPathEllipse(                               GpPath* path, REAL x, REAL y, REAL width, REAL height);
  GpStatus GdipAddPathPie(                                   GpPath* path, REAL x, REAL y, REAL width, REAL height, REAL startAngle, REAL sweepAngle);
  GpStatus GdipAddPathPolygon(                               GpPath* path, GDIPCONST GpPointF* points, INT count);
  GpStatus GdipAddPathPath(                                  GpPath* path, GDIPCONST GpPath* addingPath, BOOL connect);
  GpStatus GdipAddPathString(                                GpPath* path, GDIPCONST WCHAR* string, INT length, GDIPCONST GpFontFamily* family, INT style, REAL emSize, GDIPCONST RectF* layoutRect, GDIPCONST GpStringFormat* format);
  GpStatus GdipAddPathStringI(                               GpPath* path, GDIPCONST WCHAR* string, INT length, GDIPCONST GpFontFamily* family, INT style, REAL emSize, GDIPCONST Rect* layoutRect, GDIPCONST GpStringFormat* format);
  GpStatus GdipAddPathLineI(                                 GpPath* path, INT x1, INT y1, INT x2, INT y2);
  GpStatus GdipAddPathLine2I(                                GpPath* path, GDIPCONST GpPoint* points, INT count);
  GpStatus GdipAddPathArcI(                                  GpPath* path, INT x, INT y, INT width, INT height, REAL startAngle, REAL sweepAngle);
  GpStatus GdipAddPathBezierI(                               GpPath* path, INT x1, INT y1, INT x2, INT y2, INT x3, INT y3, INT x4, INT y4);
  GpStatus GdipAddPathBeziersI(                              GpPath* path, GDIPCONST GpPoint* points, INT count);
  GpStatus GdipAddPathCurveI(                                GpPath* path, GDIPCONST GpPoint* points, INT count);
  GpStatus GdipAddPathCurve2I(                               GpPath* path, GDIPCONST GpPoint* points, INT count, REAL tension);
  GpStatus GdipAddPathCurve3I(                               GpPath* path, GDIPCONST GpPoint* points, INT count, INT offset, INT numberOfSegments, REAL tension);
  GpStatus GdipAddPathClosedCurveI(                          GpPath* path, GDIPCONST GpPoint* points, INT count);
  GpStatus GdipAddPathClosedCurve2I(                         GpPath* path, GDIPCONST GpPoint* points, INT count, REAL tension);
  GpStatus GdipAddPathRectangleI(                            GpPath* path, INT x, INT y, INT width, INT height);
  GpStatus GdipAddPathRectanglesI(                           GpPath* path, GDIPCONST GpRect* rects, INT count);
  GpStatus GdipAddPathEllipseI(                              GpPath* path, INT x, INT y, INT width, INT height);
  GpStatus GdipAddPathPieI(                                  GpPath* path, INT x, INT y, INT width, INT height, REAL startAngle, REAL sweepAngle);
  GpStatus GdipAddPathPolygonI(                              GpPath* path, GDIPCONST GpPoint* points, INT count);
  GpStatus GdipFlattenPath(                                  GpPath* path, GpMatrix* matrix, REAL flatness);
  GpStatus GdipWindingModeOutline(                           GpPath* path, GpMatrix* matrix, REAL flatness);
  GpStatus GdipWidenPath(                                    GpPath* nativePath, GpPen* pen, GpMatrix* matrix, REAL flatness);
  GpStatus GdipWarpPath(                                     GpPath* path, GpMatrix* matrix, GDIPCONST GpPointF* points, INT count, REAL srcx, REAL srcy, REAL srcwidth, REAL srcheight, WarpMode warpMode, REAL flatness);
  GpStatus GdipTransformPath(                                GpPath* path, GpMatrix* matrix);
  GpStatus GdipGetPathWorldBounds(                           GpPath* path, GpRectF* bounds, GDIPCONST GpMatrix* matrix, GDIPCONST GpPen* pen);
  GpStatus GdipGetPathWorldBoundsI(                          GpPath* path, GpRect* bounds, GDIPCONST GpMatrix* matrix, GDIPCONST GpPen* pen);
  GpStatus GdipIsVisiblePathPoint(                           GpPath* path, REAL x, REAL y, GpGraphics* graphics, BOOL* result);
  GpStatus GdipIsVisiblePathPointI(                          GpPath* path, INT x, INT y, GpGraphics* graphics, BOOL* result);
  GpStatus GdipIsOutlineVisiblePathPoint(                    GpPath* path, REAL x, REAL y, GpPen* pen, GpGraphics* graphics, BOOL* result);
  GpStatus GdipIsOutlineVisiblePathPointI(                   GpPath* path, INT x, INT y, GpPen* pen, GpGraphics* graphics, BOOL* result);
  GpStatus GdipCreatePathIter(                               GpPathIterator** iterator, GpPath* path);
  GpStatus GdipDeletePathIter(                               GpPathIterator* iterator);
  GpStatus GdipPathIterNextSubpath(                          GpPathIterator* iterator, INT* resultCount, INT* startIndex, INT* endIndex, BOOL* isClosed);
  GpStatus GdipPathIterNextSubpathPath(                      GpPathIterator* iterator, INT* resultCount, GpPath* path, BOOL* isClosed);
  GpStatus GdipPathIterNextPathType(                         GpPathIterator* iterator, INT* resultCount, BYTE* pathType, INT* startIndex, INT* endIndex);
  GpStatus GdipPathIterNextMarker(                           GpPathIterator* iterator, INT* resultCount, INT* startIndex, INT* endIndex);
  GpStatus GdipPathIterNextMarkerPath(                       GpPathIterator* iterator, INT* resultCount, GpPath* path);
  GpStatus GdipPathIterGetCount(                             GpPathIterator* iterator, INT* count);
  GpStatus GdipPathIterGetSubpathCount(                      GpPathIterator* iterator, INT* count);
  GpStatus GdipPathIterIsValid(                              GpPathIterator* iterator, BOOL* valid);
  GpStatus GdipPathIterHasCurve(                             GpPathIterator* iterator, BOOL* hasCurve);
  GpStatus GdipPathIterRewind(                               GpPathIterator* iterator);
  GpStatus GdipPathIterEnumerate(                            GpPathIterator* iterator, INT* resultCount, GpPointF* points, BYTE* types, INT count);
  GpStatus GdipPathIterCopyData(                             GpPathIterator* iterator, INT* resultCount, GpPointF* points, BYTE* types, INT startIndex, INT endIndex);
  GpStatus GdipCreateMatrix(                                 GpMatrix** matrix);
  GpStatus GdipCreateMatrix2(                                REAL m11, REAL m12, REAL m21, REAL m22, REAL dx, REAL dy, GpMatrix** matrix);
  GpStatus GdipCreateMatrix3(                                GDIPCONST GpRectF* rect, GDIPCONST GpPointF* dstplg, GpMatrix** matrix);
  GpStatus GdipCreateMatrix3I(                               GDIPCONST GpRect* rect, GDIPCONST GpPoint* dstplg, GpMatrix** matrix);
  GpStatus GdipCloneMatrix(                                  GpMatrix* matrix, GpMatrix** cloneMatrix);
  GpStatus GdipDeleteMatrix(                                 GpMatrix* matrix);
  GpStatus GdipSetMatrixElements(                            GpMatrix* matrix, REAL m11, REAL m12, REAL m21, REAL m22, REAL dx, REAL dy);
  GpStatus GdipMultiplyMatrix(                               GpMatrix* matrix, GpMatrix* matrix2, GpMatrixOrder order);
  GpStatus GdipTranslateMatrix(                              GpMatrix* matrix, REAL offsetX, REAL offsetY, GpMatrixOrder order);
  GpStatus GdipScaleMatrix(                                  GpMatrix* matrix, REAL scaleX, REAL scaleY, GpMatrixOrder order);
  GpStatus GdipRotateMatrix(                                 GpMatrix* matrix, REAL angle, GpMatrixOrder order);
  GpStatus GdipShearMatrix(                                  GpMatrix* matrix, REAL shearX, REAL shearY, GpMatrixOrder order);
  GpStatus GdipInvertMatrix(                                 GpMatrix* matrix);
  GpStatus GdipTransformMatrixPoints(                        GpMatrix* matrix, GpPointF* pts, INT count);
  GpStatus GdipTransformMatrixPointsI(                       GpMatrix* matrix, GpPoint* pts, INT count);
  GpStatus GdipVectorTransformMatrixPoints(                  GpMatrix* matrix, GpPointF* pts, INT count);
  GpStatus GdipVectorTransformMatrixPointsI(                 GpMatrix* matrix, GpPoint* pts, INT count);
  GpStatus GdipGetMatrixElements(                            GDIPCONST GpMatrix* matrix, REAL* matrixOut);
  GpStatus GdipIsMatrixInvertible(                           GDIPCONST GpMatrix* matrix, BOOL* result);
  GpStatus GdipIsMatrixIdentity(                             GDIPCONST GpMatrix* matrix, BOOL* result);
  GpStatus GdipIsMatrixEqual(                                GDIPCONST GpMatrix* matrix, GDIPCONST GpMatrix* matrix2, BOOL* result);
  GpStatus GdipCreateRegion(                                 GpRegion** region);
  GpStatus GdipCreateRegionRect(                             GDIPCONST GpRectF* rect, GpRegion** region);
  GpStatus GdipCreateRegionRectI(                            GDIPCONST GpRect* rect, GpRegion** region);
  GpStatus GdipCreateRegionPath(                             GpPath* path, GpRegion** region);
  GpStatus GdipCreateRegionRgnData(                          GDIPCONST BYTE* regionData, INT size, GpRegion** region);
  GpStatus GdipCreateRegionHrgn(                             HRGN hRgn, GpRegion** region);
  GpStatus GdipCloneRegion(                                  GpRegion* region, GpRegion** cloneRegion);
  GpStatus GdipDeleteRegion(                                 GpRegion* region);
  GpStatus GdipSetInfinite(                                  GpRegion* region);
  GpStatus GdipSetEmpty(                                     GpRegion* region);
  GpStatus GdipCombineRegionRect(                            GpRegion* region, GDIPCONST GpRectF* rect, CombineMode combineMode);
  GpStatus GdipCombineRegionRectI(                           GpRegion* region, GDIPCONST GpRect* rect, CombineMode combineMode);
  GpStatus GdipCombineRegionPath(                            GpRegion* region, GpPath* path, CombineMode combineMode);
  GpStatus GdipCombineRegionRegion(                          GpRegion* region, GpRegion* region2, CombineMode combineMode);
  GpStatus GdipTranslateRegion(                              GpRegion* region, REAL dx, REAL dy);
  GpStatus GdipTranslateRegionI(                             GpRegion* region, INT dx, INT dy);
  GpStatus GdipTransformRegion(                              GpRegion* region, GpMatrix* matrix);
  GpStatus GdipGetRegionBounds(                              GpRegion* region, GpGraphics* graphics, GpRectF* rect);
  GpStatus GdipGetRegionBoundsI(                             GpRegion* region, GpGraphics* graphics, GpRect* rect);
  GpStatus GdipGetRegionHRgn(                                GpRegion* region, GpGraphics* graphics, HRGN* hRgn);
  GpStatus GdipIsEmptyRegion(                                GpRegion* region, GpGraphics* graphics, BOOL* result);
  GpStatus GdipIsInfiniteRegion(                             GpRegion* region, GpGraphics* graphics, BOOL* result);
  GpStatus GdipIsEqualRegion(                                GpRegion* region, GpRegion* region2, GpGraphics* graphics, BOOL* result);
  GpStatus GdipGetRegionDataSize(                            GpRegion* region, UINT* bufferSize);
  GpStatus GdipGetRegionData(                                GpRegion* region, BYTE* buffer, UINT bufferSize, UINT* sizeFilled);
  GpStatus GdipIsVisibleRegionPoint(                         GpRegion* region, REAL x, REAL y, GpGraphics* graphics, BOOL* result);
  GpStatus GdipIsVisibleRegionPointI(                        GpRegion* region, INT x, INT y, GpGraphics* graphics, BOOL* result);
  GpStatus GdipIsVisibleRegionRect(                          GpRegion* region, REAL x, REAL y, REAL width, REAL height, GpGraphics* graphics, BOOL* result);
  GpStatus GdipIsVisibleRegionRectI(                         GpRegion* region, INT x, INT y, INT width, INT height, GpGraphics* graphics, BOOL* result);
  GpStatus GdipGetRegionScansCount(                          GpRegion* region, UINT* count, GpMatrix* matrix);
  GpStatus GdipGetRegionScans(                               GpRegion* region, GpRectF* rects, INT* count, GpMatrix* matrix);
  GpStatus GdipGetRegionScansI(                              GpRegion* region, GpRect* rects, INT* count, GpMatrix* matrix);
  GpStatus GdipCloneBrush(                                   GpBrush* brush, GpBrush** cloneBrush);
  GpStatus GdipDeleteBrush(                                  GpBrush* brush);
  GpStatus GdipGetBrushType(                                 GpBrush* brush, GpBrushType* type);
  GpStatus GdipCreateHatchBrush(                             GpHatchStyle hatchstyle, ARGB forecol, ARGB backcol, GpHatch** brush);
  GpStatus GdipGetHatchStyle(                                GpHatch* brush, GpHatchStyle* hatchstyle);
  GpStatus GdipGetHatchForegroundColor(                      GpHatch* brush, ARGB* forecol);
  GpStatus GdipGetHatchBackgroundColor(                      GpHatch* brush, ARGB* backcol);
  GpStatus GdipCreateTexture(                                GpImage* image, GpWrapMode wrapmode, GpTexture** texture);
  GpStatus GdipCreateTexture2(                               GpImage* image, GpWrapMode wrapmode, REAL x, REAL y, REAL width, REAL height, GpTexture** texture);
  GpStatus GdipCreateTextureIA(                              GpImage* image, GDIPCONST GpImageAttributes* imageAttributes, REAL x, REAL y, REAL width, REAL height, GpTexture** texture);
  GpStatus GdipCreateTexture2I(                              GpImage* image, GpWrapMode wrapmode, INT x, INT y, INT width, INT height, GpTexture** texture);
  GpStatus GdipCreateTextureIAI(                             GpImage* image, GDIPCONST GpImageAttributes* imageAttributes, INT x, INT y, INT width, INT height, GpTexture** texture);
  GpStatus GdipGetTextureTransform(                          GpTexture* brush, GpMatrix* matrix);
  GpStatus GdipSetTextureTransform(                          GpTexture* brush, GDIPCONST GpMatrix* matrix);
  GpStatus GdipResetTextureTransform(                        GpTexture* brush);
  GpStatus GdipMultiplyTextureTransform(                     GpTexture* brush, GDIPCONST GpMatrix* matrix, GpMatrixOrder order);
  GpStatus GdipTranslateTextureTransform(                    GpTexture* brush, REAL dx, REAL dy, GpMatrixOrder order);
  GpStatus GdipScaleTextureTransform(                        GpTexture* brush, REAL sx, REAL sy, GpMatrixOrder order);
  GpStatus GdipRotateTextureTransform(                       GpTexture* brush, REAL angle, GpMatrixOrder order);
  GpStatus GdipSetTextureWrapMode(                           GpTexture* brush, GpWrapMode wrapmode);
  GpStatus GdipGetTextureWrapMode(                           GpTexture* brush, GpWrapMode* wrapmode);
  GpStatus GdipGetTextureImage(                              GpTexture* brush, GpImage** image);
  GpStatus GdipCreateSolidFill(                              ARGB color, GpSolidFill** brush);
  GpStatus GdipSetSolidFillColor(                            GpSolidFill* brush, ARGB color);
  GpStatus GdipGetSolidFillColor(                            GpSolidFill* brush, ARGB* color);
  GpStatus GdipCreateLineBrush(                              GDIPCONST GpPointF* point1, GDIPCONST GpPointF* point2, ARGB color1, ARGB color2, GpWrapMode wrapMode, GpLineGradient** lineGradient);
  GpStatus GdipCreateLineBrushI(                             GDIPCONST GpPoint* point1, GDIPCONST GpPoint* point2, ARGB color1, ARGB color2, GpWrapMode wrapMode, GpLineGradient** lineGradient);
  GpStatus GdipCreateLineBrushFromRect(                      GDIPCONST GpRectF* rect, ARGB color1, ARGB color2, LinearGradientMode mode, GpWrapMode wrapMode, GpLineGradient** lineGradient);
  GpStatus GdipCreateLineBrushFromRectI(                     GDIPCONST GpRect* rect, ARGB color1, ARGB color2, LinearGradientMode mode, GpWrapMode wrapMode, GpLineGradient** lineGradient);
  GpStatus GdipCreateLineBrushFromRectWithAngle(             GDIPCONST GpRectF* rect, ARGB color1, ARGB color2, REAL angle, BOOL isAngleScalable, GpWrapMode wrapMode, GpLineGradient** lineGradient);
  GpStatus GdipCreateLineBrushFromRectWithAngleI(            GDIPCONST GpRect* rect, ARGB color1, ARGB color2, REAL angle, BOOL isAngleScalable, GpWrapMode wrapMode, GpLineGradient** lineGradient);
  GpStatus GdipSetLineColors(                                GpLineGradient* brush, ARGB color1, ARGB color2);
  GpStatus GdipGetLineColors(                                GpLineGradient* brush, ARGB* colors);
  GpStatus GdipGetLineRect(                                  GpLineGradient* brush, GpRectF* rect);
  GpStatus GdipGetLineRectI(                                 GpLineGradient* brush, GpRect* rect);
  GpStatus GdipSetLineGammaCorrection(                       GpLineGradient* brush, BOOL useGammaCorrection);
  GpStatus GdipGetLineGammaCorrection(                       GpLineGradient* brush, BOOL* useGammaCorrection);
  GpStatus GdipGetLineBlendCount(                            GpLineGradient* brush, INT* count);
  GpStatus GdipGetLineBlend(                                 GpLineGradient* brush, REAL* blend, REAL* positions, INT count);
  GpStatus GdipSetLineBlend(                                 GpLineGradient* brush, GDIPCONST REAL* blend, GDIPCONST REAL* positions, INT count);
  GpStatus GdipGetLinePresetBlendCount(                      GpLineGradient* brush, INT* count);
  GpStatus GdipGetLinePresetBlend(                           GpLineGradient* brush, ARGB* blend, REAL* positions, INT count);
  GpStatus GdipSetLinePresetBlend(                           GpLineGradient* brush, GDIPCONST ARGB* blend, GDIPCONST REAL* positions, INT count);
  GpStatus GdipSetLineSigmaBlend(                            GpLineGradient* brush, REAL focus, REAL scale);
  GpStatus GdipSetLineLinearBlend(                           GpLineGradient* brush, REAL focus, REAL scale);
  GpStatus GdipSetLineWrapMode(                              GpLineGradient* brush, GpWrapMode wrapmode);
  GpStatus GdipGetLineWrapMode(                              GpLineGradient* brush, GpWrapMode* wrapmode);
  GpStatus GdipGetLineTransform(                             GpLineGradient* brush, GpMatrix* matrix);
  GpStatus GdipSetLineTransform(                             GpLineGradient* brush, GDIPCONST GpMatrix* matrix);
  GpStatus GdipResetLineTransform(                           GpLineGradient* brush);
  GpStatus GdipMultiplyLineTransform(                        GpLineGradient* brush, GDIPCONST GpMatrix* matrix, GpMatrixOrder order);
  GpStatus GdipTranslateLineTransform(                       GpLineGradient* brush, REAL dx, REAL dy, GpMatrixOrder order);
  GpStatus GdipScaleLineTransform(                           GpLineGradient* brush, REAL sx, REAL sy, GpMatrixOrder order);
  GpStatus GdipRotateLineTransform(                          GpLineGradient* brush, REAL angle, GpMatrixOrder order);
  GpStatus GdipCreatePathGradient(                           GDIPCONST GpPointF* points, INT count, GpWrapMode wrapMode, GpPathGradient** polyGradient);
  GpStatus GdipCreatePathGradientI(                          GDIPCONST GpPoint* points, INT count, GpWrapMode wrapMode, GpPathGradient** polyGradient);
  GpStatus GdipCreatePathGradientFromPath(                   GDIPCONST GpPath* path, GpPathGradient** polyGradient);
  GpStatus GdipGetPathGradientCenterColor(                   GpPathGradient* brush, ARGB* colors);
  GpStatus GdipSetPathGradientCenterColor(                   GpPathGradient* brush, ARGB colors);
  GpStatus GdipGetPathGradientSurroundColorsWithCount(       GpPathGradient* brush, ARGB* color, INT* count);
  GpStatus GdipSetPathGradientSurroundColorsWithCount(       GpPathGradient* brush, GDIPCONST ARGB* color, INT* count);
  GpStatus GdipGetPathGradientPath(                          GpPathGradient* brush, GpPath* path);
  GpStatus GdipSetPathGradientPath(                          GpPathGradient* brush, GDIPCONST GpPath* path);
  GpStatus GdipGetPathGradientCenterPoint(                   GpPathGradient* brush, GpPointF* points);
  GpStatus GdipGetPathGradientCenterPointI(                  GpPathGradient* brush, GpPoint* points);
  GpStatus GdipSetPathGradientCenterPoint(                   GpPathGradient* brush, GDIPCONST GpPointF* points);
  GpStatus GdipSetPathGradientCenterPointI(                  GpPathGradient* brush, GDIPCONST GpPoint* points);
  GpStatus GdipGetPathGradientRect(                          GpPathGradient* brush, GpRectF* rect);
  GpStatus GdipGetPathGradientRectI(                         GpPathGradient* brush, GpRect* rect);
  GpStatus GdipGetPathGradientPointCount(                    GpPathGradient* brush, INT* count);
  GpStatus GdipGetPathGradientSurroundColorCount(            GpPathGradient* brush, INT* count);
  GpStatus GdipSetPathGradientGammaCorrection(               GpPathGradient* brush, BOOL useGammaCorrection);
  GpStatus GdipGetPathGradientGammaCorrection(               GpPathGradient* brush, BOOL* useGammaCorrection);
  GpStatus GdipGetPathGradientBlendCount(                    GpPathGradient* brush, INT* count);
  GpStatus GdipGetPathGradientBlend(                         GpPathGradient* brush, REAL* blend, REAL* positions, INT count);
  GpStatus GdipSetPathGradientBlend(                         GpPathGradient* brush, GDIPCONST REAL* blend, GDIPCONST REAL* positions, INT count);
  GpStatus GdipGetPathGradientPresetBlendCount(              GpPathGradient* brush, INT* count);
  GpStatus GdipGetPathGradientPresetBlend(                   GpPathGradient* brush, ARGB* blend, REAL* positions, INT count);
  GpStatus GdipSetPathGradientPresetBlend(                   GpPathGradient* brush, GDIPCONST ARGB* blend, GDIPCONST REAL* positions, INT count);
  GpStatus GdipSetPathGradientSigmaBlend(                    GpPathGradient* brush, REAL focus, REAL scale);
  GpStatus GdipSetPathGradientLinearBlend(                   GpPathGradient* brush, REAL focus, REAL scale);
  GpStatus GdipGetPathGradientWrapMode(                      GpPathGradient* brush, GpWrapMode* wrapmode);
  GpStatus GdipSetPathGradientWrapMode(                      GpPathGradient* brush, GpWrapMode wrapmode);
  GpStatus GdipGetPathGradientTransform(                     GpPathGradient* brush, GpMatrix* matrix);
  GpStatus GdipSetPathGradientTransform(                     GpPathGradient* brush, GpMatrix* matrix);
  GpStatus GdipResetPathGradientTransform(                   GpPathGradient* brush);
  GpStatus GdipMultiplyPathGradientTransform(                GpPathGradient* brush, GDIPCONST GpMatrix* matrix, GpMatrixOrder order);
  GpStatus GdipTranslatePathGradientTransform(               GpPathGradient* brush, REAL dx, REAL dy, GpMatrixOrder order);
  GpStatus GdipScalePathGradientTransform(                   GpPathGradient* brush, REAL sx, REAL sy, GpMatrixOrder order);
  GpStatus GdipRotatePathGradientTransform(                  GpPathGradient* brush, REAL angle, GpMatrixOrder order);
  GpStatus GdipGetPathGradientFocusScales(                   GpPathGradient* brush, REAL* xScale, REAL* yScale);
  GpStatus GdipSetPathGradientFocusScales(                   GpPathGradient* brush, REAL xScale, REAL yScale);
  GpStatus GdipCreatePen1(                                   ARGB color, REAL width, GpUnit unit, GpPen** pen);
  GpStatus GdipCreatePen2(                                   GpBrush* brush, REAL width, GpUnit unit, GpPen** pen);
  GpStatus GdipClonePen(                                     GpPen* pen, GpPen** clonepen);
  GpStatus GdipDeletePen(                                    GpPen* pen);
  GpStatus GdipSetPenWidth(                                  GpPen* pen, REAL width);
  GpStatus GdipGetPenWidth(                                  GpPen* pen, REAL* width);
  GpStatus GdipSetPenUnit(                                   GpPen* pen, GpUnit unit);
  GpStatus GdipGetPenUnit(                                   GpPen* pen, GpUnit* unit);
  GpStatus GdipSetPenLineCap197819(                          GpPen* pen, GpLineCap startCap, GpLineCap endCap, GpDashCap dashCap);
  GpStatus GdipSetPenStartCap(                               GpPen* pen, GpLineCap startCap);
  GpStatus GdipSetPenEndCap(                                 GpPen* pen, GpLineCap endCap);
  GpStatus GdipSetPenDashCap197819(                          GpPen* pen, GpDashCap dashCap);
  GpStatus GdipGetPenStartCap(                               GpPen* pen, GpLineCap* startCap);
  GpStatus GdipGetPenEndCap(                                 GpPen* pen, GpLineCap* endCap);
  GpStatus GdipGetPenDashCap197819(                          GpPen* pen, GpDashCap* dashCap);
  GpStatus GdipSetPenLineJoin(                               GpPen* pen, GpLineJoin lineJoin);
  GpStatus GdipGetPenLineJoin(                               GpPen* pen, GpLineJoin* lineJoin);
  GpStatus GdipSetPenCustomStartCap(                         GpPen* pen, GpCustomLineCap* customCap);
  GpStatus GdipGetPenCustomStartCap(                         GpPen* pen, GpCustomLineCap** customCap);
  GpStatus GdipSetPenCustomEndCap(                           GpPen* pen, GpCustomLineCap* customCap);
  GpStatus GdipGetPenCustomEndCap(                           GpPen* pen, GpCustomLineCap** customCap);
  GpStatus GdipSetPenMiterLimit(                             GpPen* pen, REAL miterLimit);
  GpStatus GdipGetPenMiterLimit(                             GpPen* pen, REAL* miterLimit);
  GpStatus GdipSetPenMode(                                   GpPen* pen, GpPenAlignment penMode);
  GpStatus GdipGetPenMode(                                   GpPen* pen, GpPenAlignment* penMode);
  GpStatus GdipSetPenTransform(                              GpPen* pen, GpMatrix* matrix);
  GpStatus GdipGetPenTransform(                              GpPen* pen, GpMatrix* matrix);
  GpStatus GdipResetPenTransform(                            GpPen* pen);
  GpStatus GdipMultiplyPenTransform(                         GpPen* pen, GDIPCONST GpMatrix* matrix, GpMatrixOrder order);
  GpStatus GdipTranslatePenTransform(                        GpPen* pen, REAL dx, REAL dy, GpMatrixOrder order);
  GpStatus GdipScalePenTransform(                            GpPen* pen, REAL sx, REAL sy, GpMatrixOrder order);
  GpStatus GdipRotatePenTransform(                           GpPen* pen, REAL angle, GpMatrixOrder order);
  GpStatus GdipSetPenColor(                                  GpPen* pen, ARGB argb);
  GpStatus GdipGetPenColor(                                  GpPen* pen, ARGB* argb);
  GpStatus GdipSetPenBrushFill(                              GpPen* pen, GpBrush* brush);
  GpStatus GdipGetPenBrushFill(                              GpPen* pen, GpBrush** brush);
  GpStatus GdipGetPenFillType(                               GpPen* pen, GpPenType* type);
  GpStatus GdipGetPenDashStyle(                              GpPen* pen, GpDashStyle* dashstyle);
  GpStatus GdipSetPenDashStyle(                              GpPen* pen, GpDashStyle dashstyle);
  GpStatus GdipGetPenDashOffset(                             GpPen* pen, REAL* offset);
  GpStatus GdipSetPenDashOffset(                             GpPen* pen, REAL offset);
  GpStatus GdipGetPenDashCount(                              GpPen* pen, INT* count);
  GpStatus GdipSetPenDashArray(                              GpPen* pen, GDIPCONST REAL* dash, INT count);
  GpStatus GdipGetPenDashArray(                              GpPen* pen, REAL* dash, INT count);
  GpStatus GdipGetPenCompoundCount(                          GpPen* pen, INT* count);
  GpStatus GdipSetPenCompoundArray(                          GpPen* pen, GDIPCONST REAL* dash, INT count);
  GpStatus GdipGetPenCompoundArray(                          GpPen* pen, REAL* dash, INT count);
  GpStatus GdipCreateCustomLineCap(                          GpPath* fillPath, GpPath* strokePath, GpLineCap baseCap, REAL baseInset, GpCustomLineCap** customCap);
  GpStatus GdipDeleteCustomLineCap(                          GpCustomLineCap* customCap);
  GpStatus GdipCloneCustomLineCap(                           GpCustomLineCap* customCap, GpCustomLineCap** clonedCap);
  GpStatus GdipGetCustomLineCapType(                         GpCustomLineCap* customCap, CustomLineCapType* capType);
  GpStatus GdipSetCustomLineCapStrokeCaps(                   GpCustomLineCap* customCap, GpLineCap startCap, GpLineCap endCap);
  GpStatus GdipGetCustomLineCapStrokeCaps(                   GpCustomLineCap* customCap, GpLineCap* startCap, GpLineCap* endCap);
  GpStatus GdipSetCustomLineCapStrokeJoin(                   GpCustomLineCap* customCap, GpLineJoin lineJoin);
  GpStatus GdipGetCustomLineCapStrokeJoin(                   GpCustomLineCap* customCap, GpLineJoin* lineJoin);
  GpStatus GdipSetCustomLineCapBaseCap(                      GpCustomLineCap* customCap, GpLineCap baseCap);
  GpStatus GdipGetCustomLineCapBaseCap(                      GpCustomLineCap* customCap, GpLineCap* baseCap);
  GpStatus GdipSetCustomLineCapBaseInset(                    GpCustomLineCap* customCap, REAL inset);
  GpStatus GdipGetCustomLineCapBaseInset(                    GpCustomLineCap* customCap, REAL* inset);
  GpStatus GdipSetCustomLineCapWidthScale(                   GpCustomLineCap* customCap, REAL widthScale);
  GpStatus GdipGetCustomLineCapWidthScale(                   GpCustomLineCap* customCap, REAL* widthScale);
  GpStatus GdipCreateAdjustableArrowCap(                     REAL height, REAL width, BOOL isFilled, GpAdjustableArrowCap** cap);
  GpStatus GdipSetAdjustableArrowCapHeight(                  GpAdjustableArrowCap* cap, REAL height);
  GpStatus GdipGetAdjustableArrowCapHeight(                  GpAdjustableArrowCap* cap, REAL* height);
  GpStatus GdipSetAdjustableArrowCapWidth(                   GpAdjustableArrowCap* cap, REAL width);
  GpStatus GdipGetAdjustableArrowCapWidth(                   GpAdjustableArrowCap* cap, REAL* width);
  GpStatus GdipSetAdjustableArrowCapMiddleInset(             GpAdjustableArrowCap* cap, REAL middleInset);
  GpStatus GdipGetAdjustableArrowCapMiddleInset(             GpAdjustableArrowCap* cap, REAL* middleInset);
  GpStatus GdipSetAdjustableArrowCapFillState(               GpAdjustableArrowCap* cap, BOOL fillState);
  GpStatus GdipGetAdjustableArrowCapFillState(               GpAdjustableArrowCap* cap, BOOL* fillState);
  GpStatus GdipLoadImageFromStream(                          IStream* stream, GpImage** image);
  GpStatus GdipLoadImageFromFile(                            GDIPCONST WCHAR* filename, GpImage** image);
  GpStatus GdipLoadImageFromStreamICM(                       IStream* stream, GpImage** image);
  GpStatus GdipLoadImageFromFileICM(                         GDIPCONST WCHAR* filename, GpImage** image);
  GpStatus GdipCloneImage(                                   GpImage* image, GpImage** cloneImage);
  GpStatus GdipDisposeImage(                                 GpImage* image);
  GpStatus GdipSaveImageToFile(                              GpImage* image, GDIPCONST WCHAR* filename, GDIPCONST CLSID* clsidEncoder, GDIPCONST EncoderParameters* encoderParams);
  GpStatus GdipSaveImageToStream(                            GpImage* image, IStream* stream, GDIPCONST CLSID* clsidEncoder, GDIPCONST EncoderParameters* encoderParams);
  GpStatus GdipSaveAdd(                                      GpImage* image, GDIPCONST EncoderParameters* encoderParams);
  GpStatus GdipSaveAddImage(                                 GpImage* image, GpImage* newImage, GDIPCONST EncoderParameters* encoderParams);
  GpStatus GdipGetImageGraphicsContext(                      GpImage* image, GpGraphics** graphics);
  GpStatus GdipGetImageBounds(                               GpImage* image, GpRectF* srcRect, GpUnit* srcUnit);
  GpStatus GdipGetImageDimension(                            GpImage* image, REAL* width, REAL* height);
  GpStatus GdipGetImageType(                                 GpImage* image, ImageType* type);
  GpStatus GdipGetImageWidth(                                GpImage* image, UINT* width);
  GpStatus GdipGetImageHeight(                               GpImage* image, UINT* height);
  GpStatus GdipGetImageHorizontalResolution(                 GpImage* image, REAL* resolution);
  GpStatus GdipGetImageVerticalResolution(                   GpImage* image, REAL* resolution);
  GpStatus GdipGetImageFlags(                                GpImage* image, UINT* flags);
  GpStatus GdipGetImageRawFormat(                            GpImage* image, GUID* format);
  GpStatus GdipGetImagePixelFormat(                          GpImage* image, PixelFormat* format);
  GpStatus GdipGetImageThumbnail(                            GpImage* image, UINT thumbWidth, UINT thumbHeight, GpImage** thumbImage, GetThumbnailImageAbort callback, VOID* callbackData);
  GpStatus GdipGetEncoderParameterListSize(                  GpImage* image, GDIPCONST CLSID* clsidEncoder, UINT* size);
  GpStatus GdipGetEncoderParameterList(                      GpImage* image, GDIPCONST CLSID* clsidEncoder, UINT size, EncoderParameters* buffer);
  GpStatus GdipImageGetFrameDimensionsCount(                 GpImage* image, UINT* count);
  GpStatus GdipImageGetFrameDimensionsList(                  GpImage* image, GUID* dimensionIDs, UINT count);
  GpStatus GdipImageGetFrameCount(                           GpImage* image, GDIPCONST GUID* dimensionID, UINT* count);
  GpStatus GdipImageSelectActiveFrame(                       GpImage* image, GDIPCONST GUID* dimensionID, UINT frameIndex);
  GpStatus GdipImageRotateFlip(                              GpImage* image, RotateFlipType rfType);
  GpStatus GdipGetImagePalette(                              GpImage* image, ColorPalette* palette, INT size);
  GpStatus GdipSetImagePalette(                              GpImage* image, GDIPCONST ColorPalette* palette);
  GpStatus GdipGetImagePaletteSize(                          GpImage* image, INT* size);
  GpStatus GdipGetPropertyCount(                             GpImage* image, UINT* numOfProperty);
  GpStatus GdipGetPropertyIdList(                            GpImage* image, UINT numOfProperty, PROPID* list);
  GpStatus GdipGetPropertyItemSize(                          GpImage* image, PROPID propId, UINT* size);
  GpStatus GdipGetPropertyItem(                              GpImage* image, PROPID propId, PropertyItem* buffer);
  GpStatus GdipGetPropertySize(                              GpImage* image, UINT* totalBufferSize, UINT* numProperties);
  GpStatus GdipGetAllPropertyItems(                          GpImage* image, UINT totalBufferSize, UINT numProperties, PropertyItem* allItems);
  GpStatus GdipRemovePropertyItem(                           GpImage* image, PROPID propId);
  GpStatus GdipSetPropertyItem(                              GpImage* image, GDIPCONST PropertyItem* item);
  GpStatus GdipFindFirstImageItem(                           GpImage* image, ImageItemData* item);
  GpStatus GdipFindNextImageItem(                            GpImage* image, ImageItemData* item);
  GpStatus GdipGetImageItemData(                             GpImage* image, ImageItemData* item);
  GpStatus GdipImageForceValidation(                         GpImage* image);
  GpStatus GdipCreateBitmapFromStream(                       IStream* stream, GpBitmap** bitmap);
  GpStatus GdipCreateBitmapFromFile(                         GDIPCONST WCHAR* filename, GpBitmap** bitmap);
  GpStatus GdipCreateBitmapFromStreamICM(                    IStream* stream, GpBitmap** bitmap);
  GpStatus GdipCreateBitmapFromFileICM(                      GDIPCONST WCHAR* filename, GpBitmap** bitmap);
  GpStatus GdipCreateBitmapFromScan0(                        INT width, INT height, INT stride, PixelFormat format, BYTE* scan0, GpBitmap** bitmap);
  GpStatus GdipCreateBitmapFromGraphics(                     INT width, INT height, GpGraphics* target, GpBitmap** bitmap);
  GpStatus GdipCreateBitmapFromDirectDrawSurface(            IDirectDrawSurface7* surface, GpBitmap** bitmap);
  GpStatus GdipCreateBitmapFromGdiDib(                       GDIPCONST BITMAPINFO* gdiBitmapInfo, VOID* gdiBitmapData, GpBitmap** bitmap);
  GpStatus GdipCreateBitmapFromHBITMAP(                      HBITMAP hbm, HPALETTE hpal, GpBitmap** bitmap);
  GpStatus GdipCreateHBITMAPFromBitmap(                      GpBitmap* bitmap, HBITMAP* hbmReturn, ARGB background);
  GpStatus GdipCreateBitmapFromHICON(                        HICON hicon, GpBitmap** bitmap);
  GpStatus GdipCreateHICONFromBitmap(                        GpBitmap* bitmap, HICON* hbmReturn);
  GpStatus GdipCreateBitmapFromResource(                     HINSTANCE hInstance, GDIPCONST WCHAR* lpBitmapName, GpBitmap** bitmap);
  GpStatus GdipCloneBitmapArea(                              REAL x, REAL y, REAL width, REAL height, PixelFormat format, GpBitmap* srcBitmap, GpBitmap** dstBitmap);
  GpStatus GdipCloneBitmapAreaI(                             INT x, INT y, INT width, INT height, PixelFormat format, GpBitmap* srcBitmap, GpBitmap** dstBitmap);
  GpStatus GdipBitmapLockBits(                               GpBitmap* bitmap, GDIPCONST GpRect* rect, WINAPI_ImageLockMode flags, PixelFormat format, BitmapData* lockedBitmapData);
  GpStatus GdipBitmapUnlockBits(                             GpBitmap* bitmap, BitmapData* lockedBitmapData);
  GpStatus GdipBitmapGetPixel(                               GpBitmap* bitmap, INT x, INT y, ARGB* color);
  GpStatus GdipBitmapSetPixel(                               GpBitmap* bitmap, INT x, INT y, ARGB color);
  GpStatus GdipImageSetAbort(                                GpImage* pImage, GdiplusAbort* pIAbort);
  GpStatus GdipGraphicsSetAbort(                             GpGraphics* pGraphics, GdiplusAbort* pIAbort);
  GpStatus GdipBitmapConvertFormat(                          GpBitmap* pInputBitmap, PixelFormat format, DitherType dithertype, PaletteType palettetype, ColorPalette* palette, REAL alphaThresholdPercent);
  GpStatus GdipInitializePalette(                            ColorPalette* palette, PaletteType palettetype, INT optimalColors, BOOL useTransparentColor, GpBitmap* bitmap);
  GpStatus GdipBitmapApplyEffect(                            GpBitmap* bitmap, CGpEffect* effect, RECT* roi, BOOL useAuxData, VOID** auxData, INT* auxDataSize);
  GpStatus GdipBitmapCreateApplyEffect(                      GpBitmap** inputBitmaps, INT numInputs, CGpEffect* effect, RECT* roi, RECT* outputRect, GpBitmap** outputBitmap, BOOL useAuxData, VOID** auxData, INT* auxDataSize);
  GpStatus GdipBitmapGetHistogram(                           GpBitmap* bitmap, HistogramFormat format, UINT NumberOfEntries, UINT* channel0, UINT* channel1, UINT* channel2, UINT* channel3);
  GpStatus GdipBitmapGetHistogramSize(                       HistogramFormat format, UINT* NumberOfEntries);
  GpStatus GdipBitmapSetResolution(                          GpBitmap* bitmap, REAL xdpi, REAL ydpi);
  GpStatus GdipCreateImageAttributes(                        GpImageAttributes** imageattr);
  GpStatus GdipCloneImageAttributes(                         GDIPCONST GpImageAttributes* imageattr, GpImageAttributes** cloneImageattr);
  GpStatus GdipDisposeImageAttributes(                       GpImageAttributes* imageattr);
  GpStatus GdipSetImageAttributesToIdentity(                 GpImageAttributes* imageattr, ColorAdjustType type);
  GpStatus GdipResetImageAttributes(                         GpImageAttributes* imageattr, ColorAdjustType type);
  GpStatus GdipSetImageAttributesColorMatrix(                GpImageAttributes* imageattr, ColorAdjustType type, BOOL enableFlag, GDIPCONST ColorMatrix* colorMatrix, GDIPCONST ColorMatrix* grayMatrix, ColorMatrixFlags flags);
  GpStatus GdipSetImageAttributesThreshold(                  GpImageAttributes* imageattr, ColorAdjustType type, BOOL enableFlag, REAL threshold);
  GpStatus GdipSetImageAttributesGamma(                      GpImageAttributes* imageattr, ColorAdjustType type, BOOL enableFlag, REAL gamma);
  GpStatus GdipSetImageAttributesNoOp(                       GpImageAttributes* imageattr, ColorAdjustType type, BOOL enableFlag);
  GpStatus GdipSetImageAttributesColorKeys(                  GpImageAttributes* imageattr, ColorAdjustType type, BOOL enableFlag, ARGB colorLow, ARGB colorHigh);
  GpStatus GdipSetImageAttributesOutputChannel(              GpImageAttributes* imageattr, ColorAdjustType type, BOOL enableFlag, ColorChannelFlags channelFlags);
  GpStatus GdipSetImageAttributesOutputChannelColorProfile(  GpImageAttributes* imageattr, ColorAdjustType type, BOOL enableFlag, GDIPCONST WCHAR* colorProfileFilename);
  GpStatus GdipSetImageAttributesRemapTable(                 GpImageAttributes* imageattr, ColorAdjustType type, BOOL enableFlag, UINT mapSize, GDIPCONST ColorMap* map);
  GpStatus GdipSetImageAttributesWrapMode(                   GpImageAttributes* imageAttr, GpWrapMode wrap, ARGB argb, BOOL clamp);
  GpStatus GdipSetImageAttributesICMMode(                    GpImageAttributes* imageAttr, BOOL on);
  GpStatus GdipGetImageAttributesAdjustedPalette(            GpImageAttributes* imageAttr, ColorPalette* colorPalette, ColorAdjustType colorAdjustType);
  GpStatus GdipFlush(                                        GpGraphics* graphics, GpFlushIntention intention);
  GpStatus GdipCreateFromHDC(                                HDC hdc, GpGraphics** graphics);
  GpStatus GdipCreateFromHDC2(                               HDC hdc, HANDLE hDevice, GpGraphics** graphics);
  GpStatus GdipCreateFromHWND(                               HWND hwnd, GpGraphics** graphics);
  GpStatus GdipCreateFromHWNDICM(                            HWND hwnd, GpGraphics** graphics);
  GpStatus GdipDeleteGraphics(                               GpGraphics* graphics);
  GpStatus GdipGetDC(                                        GpGraphics* graphics, HDC* hdc);
  GpStatus GdipReleaseDC(                                    GpGraphics* graphics, HDC hdc);
  GpStatus GdipSetCompositingMode(                           GpGraphics* graphics, CompositingMode compositingMode);
  GpStatus GdipGetCompositingMode(                           GpGraphics* graphics, CompositingMode* compositingMode);
  GpStatus GdipSetRenderingOrigin(                           GpGraphics* graphics, INT x, INT y);
  GpStatus GdipGetRenderingOrigin(                           GpGraphics* graphics, INT* x, INT* y);
  GpStatus GdipSetCompositingQuality(                        GpGraphics* graphics, CompositingQuality compositingQuality);
  GpStatus GdipGetCompositingQuality(                        GpGraphics* graphics, CompositingQuality* compositingQuality);
  GpStatus GdipSetSmoothingMode(                             GpGraphics* graphics, SmoothingMode smoothingMode);
  GpStatus GdipGetSmoothingMode(                             GpGraphics* graphics, SmoothingMode* smoothingMode);
  GpStatus GdipSetPixelOffsetMode(                           GpGraphics* graphics, PixelOffsetMode pixelOffsetMode);
  GpStatus GdipGetPixelOffsetMode(                           GpGraphics* graphics, PixelOffsetMode* pixelOffsetMode);
  GpStatus GdipSetTextRenderingHint(                         GpGraphics* graphics, TextRenderingHint mode);
  GpStatus GdipGetTextRenderingHint(                         GpGraphics* graphics, TextRenderingHint* mode);
  GpStatus GdipSetTextContrast(                              GpGraphics* graphics, UINT contrast);
  GpStatus GdipGetTextContrast(                              GpGraphics* graphics, UINT* contrast);
  GpStatus GdipSetInterpolationMode(                         GpGraphics* graphics, InterpolationMode interpolationMode);
  GpStatus GdipGetInterpolationMode(                         GpGraphics* graphics, InterpolationMode* interpolationMode);
  GpStatus GdipSetWorldTransform(                            GpGraphics* graphics, GpMatrix* matrix);
  GpStatus GdipResetWorldTransform(                          GpGraphics* graphics);
  GpStatus GdipMultiplyWorldTransform(                       GpGraphics* graphics, GDIPCONST GpMatrix* matrix, GpMatrixOrder order);
  GpStatus GdipTranslateWorldTransform(                      GpGraphics* graphics, REAL dx, REAL dy, GpMatrixOrder order);
  GpStatus GdipScaleWorldTransform(                          GpGraphics* graphics, REAL sx, REAL sy, GpMatrixOrder order);
  GpStatus GdipRotateWorldTransform(                         GpGraphics* graphics, REAL angle, GpMatrixOrder order);
  GpStatus GdipGetWorldTransform(                            GpGraphics* graphics, GpMatrix* matrix);
  GpStatus GdipResetPageTransform(                           GpGraphics* graphics);
  GpStatus GdipGetPageUnit(                                  GpGraphics* graphics, GpUnit* unit);
  GpStatus GdipGetPageScale(                                 GpGraphics* graphics, REAL* scale);
  GpStatus GdipSetPageUnit(                                  GpGraphics* graphics, GpUnit unit);
  GpStatus GdipSetPageScale(                                 GpGraphics* graphics, REAL scale);
  GpStatus GdipGetDpiX(                                      GpGraphics* graphics, REAL* dpi);
  GpStatus GdipGetDpiY(                                      GpGraphics* graphics, REAL* dpi);
  GpStatus GdipTransformPoints(                              GpGraphics* graphics, GpCoordinateSpace destSpace, GpCoordinateSpace srcSpace, GpPointF* points, INT count);
  GpStatus GdipTransformPointsI(                             GpGraphics* graphics, GpCoordinateSpace destSpace, GpCoordinateSpace srcSpace, GpPoint* points, INT count);
  GpStatus GdipGetNearestColor(                              GpGraphics* graphics, ARGB* argb);
  HPALETTE GdipCreateHalftonePalette(                        );
  GpStatus GdipDrawLine(                                     GpGraphics* graphics, GpPen* pen, REAL x1, REAL y1, REAL x2, REAL y2);
  GpStatus GdipDrawLineI(                                    GpGraphics* graphics, GpPen* pen, INT x1, INT y1, INT x2, INT y2);
  GpStatus GdipDrawLines(                                    GpGraphics* graphics, GpPen* pen, GDIPCONST GpPointF* points, INT count);
  GpStatus GdipDrawLinesI(                                   GpGraphics* graphics, GpPen* pen, GDIPCONST GpPoint* points, INT count);
  GpStatus GdipDrawArc(                                      GpGraphics* graphics, GpPen* pen, REAL x, REAL y, REAL width, REAL height, REAL startAngle, REAL sweepAngle);
  GpStatus GdipDrawArcI(                                     GpGraphics* graphics, GpPen* pen, INT x, INT y, INT width, INT height, REAL startAngle, REAL sweepAngle);
  GpStatus GdipDrawBezier(                                   GpGraphics* graphics, GpPen* pen, REAL x1, REAL y1, REAL x2, REAL y2, REAL x3, REAL y3, REAL x4, REAL y4);
  GpStatus GdipDrawBezierI(                                  GpGraphics* graphics, GpPen* pen, INT x1, INT y1, INT x2, INT y2, INT x3, INT y3, INT x4, INT y4);
  GpStatus GdipDrawBeziers(                                  GpGraphics* graphics, GpPen* pen, GDIPCONST GpPointF* points, INT count);
  GpStatus GdipDrawBeziersI(                                 GpGraphics* graphics, GpPen* pen, GDIPCONST GpPoint* points, INT count);
  GpStatus GdipDrawRectangle(                                GpGraphics* graphics, GpPen* pen, REAL x, REAL y, REAL width, REAL height);
  GpStatus GdipDrawRectangleI(                               GpGraphics* graphics, GpPen* pen, INT x, INT y, INT width, INT height);
  GpStatus GdipDrawRectangles(                               GpGraphics* graphics, GpPen* pen, GDIPCONST GpRectF* rects, INT count);
  GpStatus GdipDrawRectanglesI(                              GpGraphics* graphics, GpPen* pen, GDIPCONST GpRect* rects, INT count);
  GpStatus GdipDrawEllipse(                                  GpGraphics* graphics, GpPen* pen, REAL x, REAL y, REAL width, REAL height);
  GpStatus GdipDrawEllipseI(                                 GpGraphics* graphics, GpPen* pen, INT x, INT y, INT width, INT height);
  GpStatus GdipDrawPie(                                      GpGraphics* graphics, GpPen* pen, REAL x, REAL y, REAL width, REAL height, REAL startAngle, REAL sweepAngle);
  GpStatus GdipDrawPieI(                                     GpGraphics* graphics, GpPen* pen, INT x, INT y, INT width, INT height, REAL startAngle, REAL sweepAngle);
  GpStatus GdipDrawPolygon(                                  GpGraphics* graphics, GpPen* pen, GDIPCONST GpPointF* points, INT count);
  GpStatus GdipDrawPolygonI(                                 GpGraphics* graphics, GpPen* pen, GDIPCONST GpPoint* points, INT count);
  GpStatus GdipDrawPath(                                     GpGraphics* graphics, GpPen* pen, GpPath* path);
  GpStatus GdipDrawCurve(                                    GpGraphics* graphics, GpPen* pen, GDIPCONST GpPointF* points, INT count);
  GpStatus GdipDrawCurveI(                                   GpGraphics* graphics, GpPen* pen, GDIPCONST GpPoint* points, INT count);
  GpStatus GdipDrawCurve2(                                   GpGraphics* graphics, GpPen* pen, GDIPCONST GpPointF* points, INT count, REAL tension);
  GpStatus GdipDrawCurve2I(                                  GpGraphics* graphics, GpPen* pen, GDIPCONST GpPoint* points, INT count, REAL tension);
  GpStatus GdipDrawCurve3(                                   GpGraphics* graphics, GpPen* pen, GDIPCONST GpPointF* points, INT count, INT offset, INT numberOfSegments, REAL tension);
  GpStatus GdipDrawCurve3I(                                  GpGraphics* graphics, GpPen* pen, GDIPCONST GpPoint* points, INT count, INT offset, INT numberOfSegments, REAL tension);
  GpStatus GdipDrawClosedCurve(                              GpGraphics* graphics, GpPen* pen, GDIPCONST GpPointF* points, INT count);
  GpStatus GdipDrawClosedCurveI(                             GpGraphics* graphics, GpPen* pen, GDIPCONST GpPoint* points, INT count);
  GpStatus GdipDrawClosedCurve2(                             GpGraphics* graphics, GpPen* pen, GDIPCONST GpPointF* points, INT count, REAL tension);
  GpStatus GdipDrawClosedCurve2I(                            GpGraphics* graphics, GpPen* pen, GDIPCONST GpPoint* points, INT count, REAL tension);
  GpStatus GdipGraphicsClear(                                GpGraphics* graphics, ARGB color);
  GpStatus GdipFillRectangle(                                GpGraphics* graphics, GpBrush* brush, REAL x, REAL y, REAL width, REAL height);
  GpStatus GdipFillRectangleI(                               GpGraphics* graphics, GpBrush* brush, INT x, INT y, INT width, INT height);
  GpStatus GdipFillRectangles(                               GpGraphics* graphics, GpBrush* brush, GDIPCONST GpRectF* rects, INT count);
  GpStatus GdipFillRectanglesI(                              GpGraphics* graphics, GpBrush* brush, GDIPCONST GpRect* rects, INT count);
  GpStatus GdipFillPolygon(                                  GpGraphics* graphics, GpBrush* brush, GDIPCONST GpPointF* points, INT count, GpFillMode fillMode);
  GpStatus GdipFillPolygonI(                                 GpGraphics* graphics, GpBrush* brush, GDIPCONST GpPoint* points, INT count, GpFillMode fillMode);
  GpStatus GdipFillPolygon2(                                 GpGraphics* graphics, GpBrush* brush, GDIPCONST GpPointF* points, INT count);
  GpStatus GdipFillPolygon2I(                                GpGraphics* graphics, GpBrush* brush, GDIPCONST GpPoint* points, INT count);
  GpStatus GdipFillEllipse(                                  GpGraphics* graphics, GpBrush* brush, REAL x, REAL y, REAL width, REAL height);
  GpStatus GdipFillEllipseI(                                 GpGraphics* graphics, GpBrush* brush, INT x, INT y, INT width, INT height);
  GpStatus GdipFillPie(                                      GpGraphics* graphics, GpBrush* brush, REAL x, REAL y, REAL width, REAL height, REAL startAngle, REAL sweepAngle);
  GpStatus GdipFillPieI(                                     GpGraphics* graphics, GpBrush* brush, INT x, INT y, INT width, INT height, REAL startAngle, REAL sweepAngle);
  GpStatus GdipFillPath(                                     GpGraphics* graphics, GpBrush* brush, GpPath* path);
  GpStatus GdipFillClosedCurve(                              GpGraphics* graphics, GpBrush* brush, GDIPCONST GpPointF* points, INT count);
  GpStatus GdipFillClosedCurveI(                             GpGraphics* graphics, GpBrush* brush, GDIPCONST GpPoint* points, INT count);
  GpStatus GdipFillClosedCurve2(                             GpGraphics* graphics, GpBrush* brush, GDIPCONST GpPointF* points, INT count, REAL tension, GpFillMode fillMode);
  GpStatus GdipFillClosedCurve2I(                            GpGraphics* graphics, GpBrush* brush, GDIPCONST GpPoint* points, INT count, REAL tension, GpFillMode fillMode);
  GpStatus GdipFillRegion(                                   GpGraphics* graphics, GpBrush* brush, GpRegion* region);
  GpStatus GdipDrawImageFX(                                  GpGraphics* graphics, GpImage* image, GpRectF* source, GpMatrix* xForm, CGpEffect* effect, GpImageAttributes* imageAttributes, GpUnit srcUnit);
  GpStatus GdipDrawImage(                                    GpGraphics* graphics, GpImage* image, REAL x, REAL y);
  GpStatus GdipDrawImageI(                                   GpGraphics* graphics, GpImage* image, INT x, INT y);
  GpStatus GdipDrawImageRect(                                GpGraphics* graphics, GpImage* image, REAL x, REAL y, REAL width, REAL height);
  GpStatus GdipDrawImageRectI(                               GpGraphics* graphics, GpImage* image, INT x, INT y, INT width, INT height);
  GpStatus GdipDrawImagePoints(                              GpGraphics* graphics, GpImage* image, GDIPCONST GpPointF* dstpoints, INT count);
  GpStatus GdipDrawImagePointsI(                             GpGraphics* graphics, GpImage* image, GDIPCONST GpPoint* dstpoints, INT count);
  GpStatus GdipDrawImagePointRect(                           GpGraphics* graphics, GpImage* image, REAL x, REAL y, REAL srcx, REAL srcy, REAL srcwidth, REAL srcheight, GpUnit srcUnit);
  GpStatus GdipDrawImagePointRectI(                          GpGraphics* graphics, GpImage* image, INT x, INT y, INT srcx, INT srcy, INT srcwidth, INT srcheight, GpUnit srcUnit);
  GpStatus GdipDrawImageRectRect(                            GpGraphics* graphics, GpImage* image, REAL dstx, REAL dsty, REAL dstwidth, REAL dstheight, REAL srcx, REAL srcy, REAL srcwidth, REAL srcheight, GpUnit srcUnit, GDIPCONST GpImageAttributes* imageAttributes, DrawImageAbort callback, VOID* callbackData);
  GpStatus GdipDrawImageRectRectI(                           GpGraphics* graphics, GpImage* image, INT dstx, INT dsty, INT dstwidth, INT dstheight, INT srcx, INT srcy, INT srcwidth, INT srcheight, GpUnit srcUnit, GDIPCONST GpImageAttributes* imageAttributes, DrawImageAbort callback, VOID* callbackData);
  GpStatus GdipDrawImagePointsRect(                          GpGraphics* graphics, GpImage* image, GDIPCONST GpPointF* points, INT count, REAL srcx, REAL srcy, REAL srcwidth, REAL srcheight, GpUnit srcUnit, GDIPCONST GpImageAttributes* imageAttributes, DrawImageAbort callback, VOID* callbackData);
  GpStatus GdipDrawImagePointsRectI(                         GpGraphics* graphics, GpImage* image, GDIPCONST GpPoint* points, INT count, INT srcx, INT srcy, INT srcwidth, INT srcheight, GpUnit srcUnit, GDIPCONST GpImageAttributes* imageAttributes, DrawImageAbort callback, VOID* callbackData);
  GpStatus GdipEnumerateMetafileDestPoint(                   GpGraphics* graphics, GDIPCONST GpMetafile* metafile, EnumerateMetafileProc callback, VOID* callbackData, GDIPCONST GpImageAttributes* imageAttributes);
  GpStatus GdipEnumerateMetafileDestPointI(                  GpGraphics* graphics, GDIPCONST GpMetafile* metafile, EnumerateMetafileProc callback, VOID* callbackData, GDIPCONST GpImageAttributes* imageAttributes);
  GpStatus GdipEnumerateMetafileDestRect(                    GpGraphics* graphics, GDIPCONST GpMetafile* metafile, EnumerateMetafileProc callback, VOID* callbackData, GDIPCONST GpImageAttributes* imageAttributes);
  GpStatus GdipEnumerateMetafileDestRectI(                   GpGraphics* graphics, GDIPCONST GpMetafile* metafile, EnumerateMetafileProc callback, VOID* callbackData, GDIPCONST GpImageAttributes* imageAttributes);
  GpStatus GdipEnumerateMetafileDestPoints(                  GpGraphics* graphics, GDIPCONST GpMetafile* metafile, GDIPCONST PointF* destPoints, INT count, EnumerateMetafileProc callback, VOID* callbackData, GDIPCONST GpImageAttributes* imageAttributes);
  GpStatus GdipEnumerateMetafileDestPointsI(                 GpGraphics* graphics, GDIPCONST GpMetafile* metafile, GDIPCONST Point* destPoints, INT count, EnumerateMetafileProc callback, VOID* callbackData, GDIPCONST GpImageAttributes* imageAttributes);
  GpStatus GdipEnumerateMetafileSrcRectDestPoint(            GpGraphics* graphics, GDIPCONST GpMetafile* metafile, Unit srcUnit, EnumerateMetafileProc callback, VOID* callbackData, GDIPCONST GpImageAttributes* imageAttributes);
  GpStatus GdipEnumerateMetafileSrcRectDestPointI(           GpGraphics* graphics, GDIPCONST GpMetafile* metafile, Unit srcUnit, EnumerateMetafileProc callback, VOID* callbackData, GDIPCONST GpImageAttributes* imageAttributes);
  GpStatus GdipEnumerateMetafileSrcRectDestRect(             GpGraphics* graphics, GDIPCONST GpMetafile* metafile, Unit srcUnit, EnumerateMetafileProc callback, VOID* callbackData, GDIPCONST GpImageAttributes* imageAttributes);
  GpStatus GdipEnumerateMetafileSrcRectDestRectI(            GpGraphics* graphics, GDIPCONST GpMetafile* metafile, Unit srcUnit, EnumerateMetafileProc callback, VOID* callbackData, GDIPCONST GpImageAttributes* imageAttributes);
  GpStatus GdipEnumerateMetafileSrcRectDestPoints(           GpGraphics* graphics, GDIPCONST GpMetafile* metafile, GDIPCONST PointF* destPoints, INT count, Unit srcUnit, EnumerateMetafileProc callback, VOID* callbackData, GDIPCONST GpImageAttributes* imageAttributes);
  GpStatus GdipEnumerateMetafileSrcRectDestPointsI(          GpGraphics* graphics, GDIPCONST GpMetafile* metafile, GDIPCONST Point* destPoints, INT count, Unit srcUnit, EnumerateMetafileProc callback, VOID* callbackData, GDIPCONST GpImageAttributes* imageAttributes);
  GpStatus GdipPlayMetafileRecord(                           GDIPCONST GpMetafile* metafile, EmfPlusRecordType recordType, UINT flags, UINT dataSize, GDIPCONST BYTE* data);
  GpStatus GdipSetClipGraphics(                              GpGraphics* graphics, GpGraphics* srcgraphics, CombineMode combineMode);
  GpStatus GdipSetClipRect(                                  GpGraphics* graphics, REAL x, REAL y, REAL width, REAL height, CombineMode combineMode);
  GpStatus GdipSetClipRectI(                                 GpGraphics* graphics, INT x, INT y, INT width, INT height, CombineMode combineMode);
  GpStatus GdipSetClipPath(                                  GpGraphics* graphics, GpPath* path, CombineMode combineMode);
  GpStatus GdipSetClipRegion(                                GpGraphics* graphics, GpRegion* region, CombineMode combineMode);
  GpStatus GdipSetClipHrgn(                                  GpGraphics* graphics, HRGN hRgn, CombineMode combineMode);
  GpStatus GdipResetClip(                                    GpGraphics* graphics);
  GpStatus GdipTranslateClip(                                GpGraphics* graphics, REAL dx, REAL dy);
  GpStatus GdipTranslateClipI(                               GpGraphics* graphics, INT dx, INT dy);
  GpStatus GdipGetClip(                                      GpGraphics* graphics, GpRegion* region);
  GpStatus GdipGetClipBounds(                                GpGraphics* graphics, GpRectF* rect);
  GpStatus GdipGetClipBoundsI(                               GpGraphics* graphics, GpRect* rect);
  GpStatus GdipIsClipEmpty(                                  GpGraphics* graphics, BOOL* result);
  GpStatus GdipGetVisibleClipBounds(                         GpGraphics* graphics, GpRectF* rect);
  GpStatus GdipGetVisibleClipBoundsI(                        GpGraphics* graphics, GpRect* rect);
  GpStatus GdipIsVisibleClipEmpty(                           GpGraphics* graphics, BOOL* result);
  GpStatus GdipIsVisiblePoint(                               GpGraphics* graphics, REAL x, REAL y, BOOL* result);
  GpStatus GdipIsVisiblePointI(                              GpGraphics* graphics, INT x, INT y, BOOL* result);
  GpStatus GdipIsVisibleRect(                                GpGraphics* graphics, REAL x, REAL y, REAL width, REAL height, BOOL* result);
  GpStatus GdipIsVisibleRectI(                               GpGraphics* graphics, INT x, INT y, INT width, INT height, BOOL* result);
  GpStatus GdipSaveGraphics(                                 GpGraphics* graphics, GraphicsState* state);
  GpStatus GdipRestoreGraphics(                              GpGraphics* graphics, GraphicsState state);
  GpStatus GdipBeginContainer(                               GpGraphics* graphics, GDIPCONST GpRectF* dstrect, GDIPCONST GpRectF* srcrect, GpUnit unit, GraphicsContainer* state);
  GpStatus GdipBeginContainerI(                              GpGraphics* graphics, GDIPCONST GpRect* dstrect, GDIPCONST GpRect* srcrect, GpUnit unit, GraphicsContainer* state);
  GpStatus GdipBeginContainer2(                              GpGraphics* graphics, GraphicsContainer* state);
  GpStatus GdipEndContainer(                                 GpGraphics* graphics, GraphicsContainer state);
  GpStatus GdipGetMetafileHeaderFromWmf(                     HMETAFILE hWmf, GDIPCONST WmfPlaceableFileHeader* wmfPlaceableFileHeader, MetafileHeader* header);
  GpStatus GdipGetMetafileHeaderFromEmf(                     HENHMETAFILE hEmf, MetafileHeader* header);
  GpStatus GdipGetMetafileHeaderFromFile(                    GDIPCONST WCHAR* filename, MetafileHeader* header);
  GpStatus GdipGetMetafileHeaderFromStream(                  IStream* stream, MetafileHeader* header);
  GpStatus GdipGetMetafileHeaderFromMetafile(                GpMetafile* metafile, MetafileHeader* header);
  GpStatus GdipGetHemfFromMetafile(                          GpMetafile* metafile, HENHMETAFILE* hEmf);
  GpStatus GdipCreateStreamOnFile(                           GDIPCONST WCHAR* filename, UINT access, IStream** stream);
  GpStatus GdipCreateMetafileFromWmf(                        HMETAFILE hWmf, BOOL deleteWmf, GDIPCONST WmfPlaceableFileHeader* wmfPlaceableFileHeader, GpMetafile** metafile);
  GpStatus GdipCreateMetafileFromEmf(                        HENHMETAFILE hEmf, BOOL deleteEmf, GpMetafile** metafile);
  GpStatus GdipCreateMetafileFromFile(                       GDIPCONST WCHAR* file, GpMetafile** metafile);
  GpStatus GdipCreateMetafileFromWmfFile(                    GDIPCONST WCHAR* file, GDIPCONST WmfPlaceableFileHeader* wmfPlaceableFileHeader, GpMetafile** metafile);
  GpStatus GdipCreateMetafileFromStream(                     IStream* stream, GpMetafile** metafile);
  GpStatus GdipRecordMetafile(                               HDC referenceHdc, EmfType type, GDIPCONST GpRectF* frameRect, MetafileFrameUnit frameUnit, GDIPCONST WCHAR* description, GpMetafile** metafile);
  GpStatus GdipRecordMetafileI(                              HDC referenceHdc, EmfType type, GDIPCONST GpRect* frameRect, MetafileFrameUnit frameUnit, GDIPCONST WCHAR* description, GpMetafile** metafile);
  GpStatus GdipRecordMetafileFileName(                       GDIPCONST WCHAR* fileName, HDC referenceHdc, EmfType type, GDIPCONST GpRectF* frameRect, MetafileFrameUnit frameUnit, GDIPCONST WCHAR* description, GpMetafile** metafile);
  GpStatus GdipRecordMetafileFileNameI(                      GDIPCONST WCHAR* fileName, HDC referenceHdc, EmfType type, GDIPCONST GpRect* frameRect, MetafileFrameUnit frameUnit, GDIPCONST WCHAR* description, GpMetafile** metafile);
  GpStatus GdipRecordMetafileStream(                         IStream* stream, HDC referenceHdc, EmfType type, GDIPCONST GpRectF* frameRect, MetafileFrameUnit frameUnit, GDIPCONST WCHAR* description, GpMetafile** metafile);
  GpStatus GdipRecordMetafileStreamI(                        IStream* stream, HDC referenceHdc, EmfType type, GDIPCONST GpRect* frameRect, MetafileFrameUnit frameUnit, GDIPCONST WCHAR* description, GpMetafile** metafile);
  GpStatus GdipSetMetafileDownLevelRasterizationLimit(       GpMetafile* metafile, UINT metafileRasterizationLimitDpi);
  GpStatus GdipGetMetafileDownLevelRasterizationLimit(       GDIPCONST GpMetafile* metafile, UINT* metafileRasterizationLimitDpi);
  GpStatus GdipGetImageDecodersSize(                         UINT* numDecoders, UINT* size);
  GpStatus GdipGetImageDecoders(                             UINT numDecoders, UINT size, ImageCodecInfo* decoders);
  GpStatus GdipGetImageEncodersSize(                         UINT* numEncoders, UINT* size);
  GpStatus GdipGetImageEncoders(                             UINT numEncoders, UINT size, ImageCodecInfo* encoders);
  GpStatus GdipComment(                                      GpGraphics* graphics, UINT sizeData, GDIPCONST BYTE* data);
  GpStatus GdipCreateFontFamilyFromName(                     GDIPCONST WCHAR* name, GpFontCollection* fontCollection, GpFontFamily** FontFamily);
  GpStatus GdipDeleteFontFamily(                             GpFontFamily* FontFamily);
  GpStatus GdipCloneFontFamily(                              GpFontFamily* FontFamily, GpFontFamily** clonedFontFamily);
  GpStatus GdipGetGenericFontFamilySansSerif(                GpFontFamily** nativeFamily);
  GpStatus GdipGetGenericFontFamilySerif(                    GpFontFamily** nativeFamily);
  GpStatus GdipGetGenericFontFamilyMonospace(                GpFontFamily** nativeFamily);
  GpStatus GdipGetFamilyName(                                GDIPCONST GpFontFamily* family, LPWSTR name, LANGID language);
  GpStatus GdipIsStyleAvailable(                             GDIPCONST GpFontFamily* family, INT style, BOOL* IsStyleAvailable);
  GpStatus GdipFontCollectionEnumerable(                     GpFontCollection* fontCollection, GpGraphics* graphics, INT* numFound);
  GpStatus GdipFontCollectionEnumerate(                      GpFontCollection* fontCollection, INT numSought, GpFontFamily* gpfamilies, INT* numFound, GpGraphics* graphics);
  GpStatus GdipGetEmHeight(                                  GDIPCONST GpFontFamily* family, WINAPI_FontStyle style, UINT16* EmHeight);
  GpStatus GdipGetCellAscent(                                GDIPCONST GpFontFamily* family, INT style, UINT16* CellAscent);
  GpStatus GdipGetCellDescent(                               GDIPCONST GpFontFamily* family, INT style, UINT16* CellDescent);
  GpStatus GdipGetLineSpacing(                               GDIPCONST GpFontFamily* family, WINAPI_FontStyle style, UINT16* LineSpacing);
  GpStatus GdipCreateFontFromDC(                             HDC hdc, GpFont** font);
  GpStatus GdipCreateFontFromLogfont(                        HDC hdc, GDIPCONST LOGFONT* logfont, GpFont** font);
  GpStatus GdipCreateFont(                                   GDIPCONST GpFontFamily* fontFamily, REAL emSize, WINAPI_FontStyle style, Unit unit, GpFont** font);
  GpStatus GdipCloneFont(                                    GpFont* font, GpFont** cloneFont);
  GpStatus GdipDeleteFont(                                   GpFont* font);
  GpStatus GdipGetFamily(                                    GpFont* font, GpFontFamily** family);
  GpStatus GdipGetFontStyle(                                 GpFont* font, WINAPI_FontStyle* style);
  GpStatus GdipGetFontSize(                                  GpFont* font, REAL* size);
  GpStatus GdipGetFontUnit(                                  GpFont* font, Unit* unit);
  GpStatus GdipGetFontHeight(                                GDIPCONST GpFont* font, GDIPCONST GpGraphics* graphics, REAL* height);
  GpStatus GdipGetFontHeightGivenDPI(                        GDIPCONST GpFont* font, REAL dpi, REAL* height);
  GpStatus GdipGetLogFont(                                   GpFont* font, GpGraphics* graphics, LOGFONT* logfont);
  GpStatus GdipNewInstalledFontCollection(                   GpFontCollection** fontCollection);
  GpStatus GdipNewPrivateFontCollection(                     GpFontCollection** fontCollection);
  GpStatus GdipDeletePrivateFontCollection(                  GpFontCollection** fontCollection);
  GpStatus GdipGetFontCollectionFamilyCount(                 GpFontCollection* fontCollection, INT* numFound);
  GpStatus GdipGetFontCollectionFamilyList(                  GpFontCollection* fontCollection, INT numSought, GpFontFamily* gpfamilies, INT* numFound);
  GpStatus GdipPrivateAddFontFile(                           GpFontCollection* fontCollection, GDIPCONST WCHAR* filename);
  GpStatus GdipPrivateAddMemoryFont(                         GpFontCollection* fontCollection, GDIPCONST void* memory, INT length);
  GpStatus GdipDrawString(                                   GpGraphics* graphics, GDIPCONST WCHAR* string, INT length, GDIPCONST GpFont* font, GDIPCONST RectF* layoutRect, GDIPCONST GpStringFormat* stringFormat, GDIPCONST GpBrush* brush);
  GpStatus GdipMeasureString(                                GpGraphics* graphics, GDIPCONST WCHAR* string, INT length, GDIPCONST GpFont* font, GDIPCONST RectF* layoutRect, GDIPCONST GpStringFormat* stringFormat, RectF* boundingBox, INT* codepointsFitted, INT* linesFilled);
  GpStatus GdipMeasureCharacterRanges(                       GpGraphics* graphics, GDIPCONST WCHAR* string, INT length, GDIPCONST GpFont* font, GDIPCONST GpStringFormat* stringFormat, INT regionCount, GpRegion** regions);
  GpStatus GdipDrawDriverString(                             GpGraphics* graphics, GDIPCONST UINT16* text, INT length, GDIPCONST GpFont* font, GDIPCONST GpBrush* brush, GDIPCONST PointF* positions, WINAPI_DriverStringOptions flags, GDIPCONST GpMatrix* matrix);
  GpStatus GdipMeasureDriverString(                          GpGraphics* graphics, GDIPCONST UINT16* text, INT length, GDIPCONST GpFont* font, GDIPCONST PointF* positions, WINAPI_DriverStringOptions flags, GDIPCONST GpMatrix* matrix, RectF* boundingBox);
  GpStatus GdipCreateStringFormat(                           WINAPI_StringFormatFlags formatAttributes, LANGID language, GpStringFormat** format);
  GpStatus GdipStringFormatGetGenericDefault(                GpStringFormat** format);
  GpStatus GdipStringFormatGetGenericTypographic(            GpStringFormat** format);
  GpStatus GdipDeleteStringFormat(                           GpStringFormat* format);
  GpStatus GdipCloneStringFormat(                            GDIPCONST GpStringFormat* format, GpStringFormat** newFormat);
  GpStatus GdipSetStringFormatFlags(                         GpStringFormat* format, WINAPI_StringFormatFlags flags);
  GpStatus GdipGetStringFormatFlags(                         GDIPCONST GpStringFormat* format, WINAPI_StringFormatFlags* flags);
  GpStatus GdipSetStringFormatAlign(                         GpStringFormat* format, StringAlignment align);
  GpStatus GdipGetStringFormatAlign(                         GDIPCONST GpStringFormat* format, StringAlignment* align);
  GpStatus GdipSetStringFormatLineAlign(                     GpStringFormat* format, StringAlignment align);
  GpStatus GdipGetStringFormatLineAlign(                     GDIPCONST GpStringFormat* format, StringAlignment* align);
  GpStatus GdipSetStringFormatTrimming(                      GpStringFormat* format, StringTrimming trimming);
  GpStatus GdipGetStringFormatTrimming(                      GDIPCONST GpStringFormat* format, StringTrimming* trimming);
  GpStatus GdipSetStringFormatHotkeyPrefix(                  GpStringFormat* format, WINAPI_HotkeyPrefix hotkeyPrefix);
  GpStatus GdipGetStringFormatHotkeyPrefix(                  GDIPCONST GpStringFormat* format, WINAPI_HotkeyPrefix* hotkeyPrefix);
  GpStatus GdipSetStringFormatTabStops(                      GpStringFormat* format, REAL firstTabOffset, INT count, GDIPCONST REAL* tabStops);
  GpStatus GdipGetStringFormatTabStops(                      GDIPCONST GpStringFormat* format, INT count, REAL* firstTabOffset, REAL* tabStops);
  GpStatus GdipGetStringFormatTabStopCount(                  GDIPCONST GpStringFormat* format, INT* count);
  GpStatus GdipSetStringFormatDigitSubstitution(             GpStringFormat* format, LANGID language, StringDigitSubstitute substitute);
  GpStatus GdipGetStringFormatDigitSubstitution(             GDIPCONST GpStringFormat* format, LANGID* language, StringDigitSubstitute* substitute);
  GpStatus GdipGetStringFormatMeasurableCharacterRangeCount( GDIPCONST GpStringFormat* format, INT* count);
  GpStatus GdipSetStringFormatMeasurableCharacterRanges(     GpStringFormat* format, INT rangeCount, GDIPCONST CharacterRange* ranges);
  GpStatus GdipCreateCachedBitmap(                           GpBitmap* bitmap, GpGraphics* graphics, GpCachedBitmap** cachedBitmap);
  GpStatus GdipDeleteCachedBitmap(                           GpCachedBitmap* cachedBitmap);
  GpStatus GdipDrawCachedBitmap(                             GpGraphics* graphics, GpCachedBitmap* cachedBitmap, INT x, INT y);
  UINT     GdipEmfToWmfBits(                                 HENHMETAFILE hemf, UINT cbData16, LPBYTE pData16, INT iMapMode, INT eFlags);
  GpStatus GdipSetImageAttributesCachedBackground(           GpImageAttributes* imageattr, BOOL enableFlag);
  GpStatus GdipTestControl(                                  GpTestControlEnum control, void* param);
  GpStatus GdiplusNotificationHook(                          ULONG_PTR* token);
  VOID     GdiplusNotificationUnhook(                        ULONG_PTR token);
  GpStatus GdipConvertToEmfPlus(                             GpGraphics* refGraphics, GpMetafile* metafile, INT* conversionFailureFlag, EmfType emfType, WCHAR* description, GpMetafile** out_metafile);
  GpStatus GdipConvertToEmfPlusToFile(                       GpGraphics* refGraphics, GpMetafile* metafile, INT* conversionFailureFlag, WCHAR* filename, EmfType emfType, WCHAR* description, GpMetafile** out_metafile);
  GpStatus GdipConvertToEmfPlusToStream(                     GpGraphics* refGraphics, GpMetafile* metafile, INT* conversionFailureFlag, IStream* stream, EmfType emfType, WCHAR* description, GpMetafile** out_metafile);
]]
return ffi.load( 'gdiplus.dll' )

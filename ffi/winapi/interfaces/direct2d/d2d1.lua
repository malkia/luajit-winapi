require( 'ffi/winapi/headers/directx' )
require( 'ffi/winapi/headers/dwrite' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* ID2D1Bitmap; //Interface
  typedef void* ID2D1BitmapBrush; //Interface
  typedef void* ID2D1BitmapRenderTarget; //Interface
  typedef void* ID2D1Brush; //Interface
  typedef void* ID2D1DCRenderTarget; //Interface
  typedef void* ID2D1DrawingStateBlock; //Interface
  typedef void* ID2D1EllipseGeometry; //Interface
  typedef void* ID2D1Factory; //Interface
  typedef void* ID2D1GdiInteropRenderTarget; //Interface
  typedef void* ID2D1Geometry; //Interface
  typedef void* ID2D1GeometryGroup; //Interface
  typedef void* ID2D1GeometrySink; //Interface
  typedef void* ID2D1GradientStopCollection; //Interface
  typedef void* ID2D1HwndRenderTarget; //Interface
  typedef void* ID2D1Layer; //Interface
  typedef void* ID2D1LinearGradientBrush; //Interface
  typedef void* ID2D1Mesh; //Interface
  typedef void* ID2D1PathGeometry; //Interface
  typedef void* ID2D1RadialGradientBrush; //Interface
  typedef void* ID2D1RectangleGeometry; //Interface
  typedef void* ID2D1RenderTarget; //Interface
  typedef void* ID2D1Resource; //Interface
  typedef void* ID2D1RoundedRectangleGeometry; //Interface
  typedef void* ID2D1SimplifiedGeometrySink; //Interface
  typedef void* ID2D1SolidColorBrush; //Interface
  typedef void* ID2D1StrokeStyle; //Interface
  typedef void* ID2D1TessellationSink; //Interface
  typedef void* ID2D1TransformedGeometry; //Interface
  typedef void* IWICBitmapSource; //Interface
  typedef void* IWICBitmap; //Interface
  typedef void* IDXGISurface; //Interface
  typedef D3DCOLORVALUE D2D1_COLOR_F; //Alias
  typedef UINT64 D2D1_TAG; //Alias
  typedef HRESULT D2D_HRESULT; //Alias
  static const D2D_HRESULT D2DERR_UNSUPPORTED_PIXEL_FORMAT = 0x88982f80;
  static const D2D_HRESULT D2DERR_INSUFFICIENT_BUFFER = 0x8007007a;
  static const D2D_HRESULT D2DERR_WRONG_STATE = 0x88990001;
  static const D2D_HRESULT D2DERR_NOT_INITIALIZED = 0x88990002;
  static const D2D_HRESULT D2DERR_UNSUPPORTED_OPERATION = 0x88990003;
  static const D2D_HRESULT D2DERR_SCANNER_FAILED = 0x88990004;
  static const D2D_HRESULT D2DERR_SCREEN_ACCESS_DENIED = 0x88990005;
  static const D2D_HRESULT D2DERR_DISPLAY_STATE_INVALID = 0x88990006;
  static const D2D_HRESULT D2DERR_ZERO_VECTOR = 0x88990007;
  static const D2D_HRESULT D2DERR_INTERNAL_ERROR = 0x88990008;
  static const D2D_HRESULT D2DERR_DISPLAY_FORMAT_NOT_SUPPORTED = 0x88990009;
  static const D2D_HRESULT D2DERR_INVALID_CALL = 0x8899000a;
  static const D2D_HRESULT D2DERR_NO_HARDWARE_DEVICE = 0x8899000b;
  static const D2D_HRESULT D2DERR_RECREATE_TARGET = 0x8899000c;
  static const D2D_HRESULT D2DERR_TOO_MANY_SHADER_ELEMENTS = 0x8899000d;
  static const D2D_HRESULT D2DERR_SHADER_COMPILE_FAILED = 0x8899000e;
  static const D2D_HRESULT D2DERR_MAX_TEXTURE_SIZE_EXCEEDED = 0x8899000f;
  static const D2D_HRESULT D2DERR_UNSUPPORTED_VERSION = 0x88990010;
  static const D2D_HRESULT D2DERR_BAD_NUMBER = 0x88990011;
  static const D2D_HRESULT D2DERR_WRONG_FACTORY = 0x88990012;
  static const D2D_HRESULT D2DERR_LAYER_ALREADY_IN_USE = 0x88990013;
  static const D2D_HRESULT D2DERR_POP_CALL_DID_NOT_MATCH_PUSH = 0x88990014;
  static const D2D_HRESULT D2DERR_WRONG_RESOURCE_DOMAIN = 0x88990015;
  static const D2D_HRESULT D2DERR_PUSH_POP_UNBALANCED = 0x88990016;
  static const D2D_HRESULT D2DERR_RENDER_TARGET_HAS_LAYER_OR_CLIPRECT = 0x88990017;
  static const D2D_HRESULT D2DERR_INCOMPATIBLE_BRUSH_TYPES = 0x88990018;
  static const D2D_HRESULT D2DERR_WIN32_ERROR = 0x88990019;
  static const D2D_HRESULT D2DERR_TARGET_NOT_GDI_COMPATIBLE = 0x8899001a;
  static const D2D_HRESULT D2DERR_TEXT_EFFECT_IS_WRONG_TYPE = 0x8899001b;
  static const D2D_HRESULT D2DERR_TEXT_RENDERER_NOT_RELEASED = 0x8899001c;
  static const D2D_HRESULT D2DERR_EXCEEDS_MAX_BITMAP_SIZE = 0x8899001d;
  typedef UINT D2D1_FACTORY_TYPE; //Alias
  static const D2D1_FACTORY_TYPE D2D1_FACTORY_TYPE_SINGLE_THREADED = 0;
  static const D2D1_FACTORY_TYPE D2D1_FACTORY_TYPE_MULTI_THREADED = 1;
  typedef struct D2D1_POINT_2F {
    FLOAT x;
    FLOAT y;
  } D2D1_POINT_2F;
  typedef struct D2D1_MATRIX_3X2_F {
    FLOAT _11;
    FLOAT _12;
    FLOAT _21;
    FLOAT _22;
    FLOAT _31;
    FLOAT _32;
  } D2D1_MATRIX_3X2_F;
  typedef struct D2D1_SIZE_F {
    FLOAT width;
    FLOAT height;
  } D2D1_SIZE_F;
  typedef struct D2D1_SIZE_U {
    UINT32 width;
    UINT32 height;
  } D2D1_SIZE_U;
  typedef UINT D2D1_ALPHA_MODE; //Alias
  static const D2D1_ALPHA_MODE D2D1_ALPHA_MODE_UNKNOWN = 0;
  static const D2D1_ALPHA_MODE D2D1_ALPHA_MODE_PREMULTIPLIED = 1;
  static const D2D1_ALPHA_MODE D2D1_ALPHA_MODE_STRAIGHT = 2;
  static const D2D1_ALPHA_MODE D2D1_ALPHA_MODE_IGNORE = 3;
  typedef struct D2D1_PIXEL_FORMAT {
    DXGI_FORMAT format;
    D2D1_ALPHA_MODE alphaMode;
  } D2D1_PIXEL_FORMAT;
  typedef struct D2D1_POINT_2U {
    UINT32 x;
    UINT32 y;
  } D2D1_POINT_2U;
  typedef struct D2D1_RECT_U {
    UINT32 left;
    UINT32 top;
    UINT32 right;
    UINT32 bottom;
  } D2D1_RECT_U;
  typedef UINT D2D1_EXTEND_MODE; //Alias
  static const D2D1_EXTEND_MODE D2D1_EXTEND_MODE_CLAMP = 0;
  static const D2D1_EXTEND_MODE D2D1_EXTEND_MODE_WRAP = 1;
  static const D2D1_EXTEND_MODE D2D1_EXTEND_MODE_MIRROR = 2;
  typedef UINT D2D1_BITMAP_INTERPOLATION_MODE; //Alias
  static const D2D1_BITMAP_INTERPOLATION_MODE D2D1_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR = 0;
  static const D2D1_BITMAP_INTERPOLATION_MODE D2D1_BITMAP_INTERPOLATION_MODE_LINEAR = 1;
  typedef struct D2D1_BITMAP_PROPERTIES {
    D2D1_PIXEL_FORMAT pixelFormat;
    FLOAT dpiX;
    FLOAT dpiY;
  } D2D1_BITMAP_PROPERTIES;
  typedef struct D2D1_BITMAP_BRUSH_PROPERTIES {
    D2D1_EXTEND_MODE extendModeX;
    D2D1_EXTEND_MODE extendModeY;
    D2D1_BITMAP_INTERPOLATION_MODE interpolationMode;
  } D2D1_BITMAP_BRUSH_PROPERTIES;
  typedef struct D2D1_GRADIENT_STOP {
    FLOAT position;
    D2D1_COLOR_F color;
  } D2D1_GRADIENT_STOP;
  typedef struct D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES {
    D2D1_POINT_2F startPoint;
    D2D1_POINT_2F endPoint;
  } D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES;
  typedef struct D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES {
    D2D1_POINT_2F center;
    D2D1_POINT_2F gradientOriginOffset;
    FLOAT radiusX;
    FLOAT radiusY;
  } D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES;
  typedef struct D2D1_RECT_F {
    FLOAT left;
    FLOAT top;
    FLOAT right;
    FLOAT bottom;
  } D2D1_RECT_F;
  typedef struct D2D1_ROUNDED_RECT {
    D2D1_RECT_F rect;
    FLOAT radiusX;
    FLOAT radiusY;
  } D2D1_ROUNDED_RECT;
  typedef struct D2D1_ELLIPSE {
    D2D1_POINT_2F point;
    FLOAT radiusX;
    FLOAT radiusY;
  } D2D1_ELLIPSE;
  typedef UINT D2D1_OPACITY_MASK_CONTENT; //Alias
  static const D2D1_OPACITY_MASK_CONTENT D2D1_OPACITY_MASK_CONTENT_GRAPHICS = 0;
  static const D2D1_OPACITY_MASK_CONTENT D2D1_OPACITY_MASK_CONTENT_TEXT_NATURAL = 1;
  static const D2D1_OPACITY_MASK_CONTENT D2D1_OPACITY_MASK_CONTENT_TEXT_GDI_COMPATIBLE = 2;
  typedef UINT D2D1_ANTIALIAS_MODE; //Alias
  static const D2D1_ANTIALIAS_MODE D2D1_ANTIALIAS_MODE_PER_PRIMITIVE = 0;
  static const D2D1_ANTIALIAS_MODE D2D1_ANTIALIAS_MODE_ALIASED = 1;
  typedef UINT D2D1_TEXT_ANTIALIAS_MODE; //Alias
  static const D2D1_TEXT_ANTIALIAS_MODE D2D1_TEXT_ANTIALIAS_MODE_DEFAULT = 0;
  static const D2D1_TEXT_ANTIALIAS_MODE D2D1_TEXT_ANTIALIAS_MODE_CLEARTYPE = 1;
  static const D2D1_TEXT_ANTIALIAS_MODE D2D1_TEXT_ANTIALIAS_MODE_GRAYSCALE = 2;
  static const D2D1_TEXT_ANTIALIAS_MODE D2D1_TEXT_ANTIALIAS_MODE_ALIASED = 3;
  typedef UINT D2D1_LAYER_OPTIONS; //Alias
  typedef struct D2D1_LAYER_PARAMETERS {
    D2D1_RECT_F contentBounds;
    ID2D1Geometry* geometricMask;
    D2D1_ANTIALIAS_MODE maskAntialiasMode;
    D2D1_MATRIX_3X2_F maskTransform;
    FLOAT opacity;
    ID2D1Brush* opacityBrush;
    D2D1_LAYER_OPTIONS layerOptions;
  } D2D1_LAYER_PARAMETERS;
  typedef UINT D2D1_RENDER_TARGET_TYPE; //Alias
  static const D2D1_RENDER_TARGET_TYPE D2D1_RENDER_TARGET_TYPE_DEFAULT = 0;
  static const D2D1_RENDER_TARGET_TYPE D2D1_RENDER_TARGET_TYPE_SOFTWARE = 1;
  static const D2D1_RENDER_TARGET_TYPE D2D1_RENDER_TARGET_TYPE_HARDWARE = 2;
  typedef UINT D2D1_RENDER_TARGET_USAGE; //Alias
  typedef UINT D2D1_FEATURE_LEVEL; //Alias
  static const D2D1_FEATURE_LEVEL D2D1_FEATURE_LEVEL_DEFAULT = 0;
  static const D2D1_FEATURE_LEVEL D2D1_FEATURE_LEVEL_9 = 0x9100;
  static const D2D1_FEATURE_LEVEL D2D1_FEATURE_LEVEL_10 = 0xa000;
  typedef struct D2D1_RENDER_TARGET_PROPERTIES {
    D2D1_RENDER_TARGET_TYPE type;
    D2D1_PIXEL_FORMAT pixelFormat;
    FLOAT dpiX;
    FLOAT dpiY;
    D2D1_RENDER_TARGET_USAGE usage;
    D2D1_FEATURE_LEVEL minLevel;
  } D2D1_RENDER_TARGET_PROPERTIES;
  typedef struct D2D1_DRAWING_STATE_DESCRIPTION {
    D2D1_ANTIALIAS_MODE antialiasMode;
    D2D1_TEXT_ANTIALIAS_MODE textAntialiasMode;
    D2D1_TAG tag1;
    D2D1_TAG tag2;
    D2D1_MATRIX_3X2_F transform;
  } D2D1_DRAWING_STATE_DESCRIPTION;
  typedef UINT D2D1_DEBUG_LEVEL; //Alias
  static const D2D1_DEBUG_LEVEL D2D1_DEBUG_LEVEL_NONE = 0;
  static const D2D1_DEBUG_LEVEL D2D1_DEBUG_LEVEL_ERROR = 1;
  static const D2D1_DEBUG_LEVEL D2D1_DEBUG_LEVEL_WARNING = 2;
  static const D2D1_DEBUG_LEVEL D2D1_DEBUG_LEVEL_INFORMATION = 3;
  typedef struct D2D1_FACTORY_OPTIONS {
    D2D1_DEBUG_LEVEL debugLevel;
  } D2D1_FACTORY_OPTIONS;
  typedef struct D2D1_BRUSH_PROPERTIES {
    FLOAT opacity;
    D2D1_MATRIX_3X2_F transform;
  } D2D1_BRUSH_PROPERTIES;
  typedef UINT D2D1_GEOMETRY_RELATION; //Alias
  static const D2D1_GEOMETRY_RELATION D2D1_GEOMETRY_RELATION_UNKNOWN = 0;
  static const D2D1_GEOMETRY_RELATION D2D1_GEOMETRY_RELATION_DISJOINT = 1;
  static const D2D1_GEOMETRY_RELATION D2D1_GEOMETRY_RELATION_IS_CONTAINED = 2;
  static const D2D1_GEOMETRY_RELATION D2D1_GEOMETRY_RELATION_CONTAINS = 3;
  static const D2D1_GEOMETRY_RELATION D2D1_GEOMETRY_RELATION_OVERLAP = 4;
  typedef UINT D2D1_GEOMETRY_SIMPLIFICATION_OPTION; //Alias
  static const D2D1_GEOMETRY_SIMPLIFICATION_OPTION D2D1_GEOMETRY_SIMPLIFICATION_OPTION_CUBICS_AND_LINES = 0;
  static const D2D1_GEOMETRY_SIMPLIFICATION_OPTION D2D1_GEOMETRY_SIMPLIFICATION_OPTION_LINES = 1;
  typedef UINT D2D1_GAMMA; //Alias
  static const D2D1_GAMMA D2D1_GAMMA_2_2 = 0;
  static const D2D1_GAMMA D2D1_GAMMA_1_0 = 1;
  typedef UINT D2D1_COMBINE_MODE; //Alias
  static const D2D1_COMBINE_MODE D2D1_COMBINE_MODE_UNION = 0;
  static const D2D1_COMBINE_MODE D2D1_COMBINE_MODE_INTERSECT = 1;
  static const D2D1_COMBINE_MODE D2D1_COMBINE_MODE_XOR = 2;
  static const D2D1_COMBINE_MODE D2D1_COMBINE_MODE_EXCLUDE = 3;
  typedef UINT D2D1_CAP_STYLE; //Alias
  static const D2D1_CAP_STYLE D2D1_CAP_STYLE_FLAT = 0;
  static const D2D1_CAP_STYLE D2D1_CAP_STYLE_SQUARE = 1;
  static const D2D1_CAP_STYLE D2D1_CAP_STYLE_ROUND = 2;
  static const D2D1_CAP_STYLE D2D1_CAP_STYLE_TRIANGLE = 3;
  typedef UINT D2D1_LINE_JOIN; //Alias
  static const D2D1_LINE_JOIN D2D1_LINE_JOIN_MITER = 0;
  static const D2D1_LINE_JOIN D2D1_LINE_JOIN_BEVEL = 1;
  static const D2D1_LINE_JOIN D2D1_LINE_JOIN_ROUND = 2;
  static const D2D1_LINE_JOIN D2D1_LINE_JOIN_MITER_OR_BEVEL = 3;
  typedef UINT D2D1_DASH_STYLE; //Alias
  static const D2D1_DASH_STYLE D2D1_DASH_STYLE_SOLID = 0;
  static const D2D1_DASH_STYLE D2D1_DASH_STYLE_DASH = 1;
  static const D2D1_DASH_STYLE D2D1_DASH_STYLE_DOT = 2;
  static const D2D1_DASH_STYLE D2D1_DASH_STYLE_DASH_DOT = 3;
  static const D2D1_DASH_STYLE D2D1_DASH_STYLE_DASH_DOT_DOT = 4;
  static const D2D1_DASH_STYLE D2D1_DASH_STYLE_CUSTOM = 5;
  typedef struct D2D1_STROKE_STYLE_PROPERTIES {
    D2D1_CAP_STYLE startCap;
    D2D1_CAP_STYLE endCap;
    D2D1_CAP_STYLE dashCap;
    D2D1_LINE_JOIN lineJoin;
    FLOAT miterLimit;
    D2D1_DASH_STYLE dashStyle;
    FLOAT dashOffset;
  } D2D1_STROKE_STYLE_PROPERTIES;
  typedef UINT D2D1_FILL_MODE; //Alias
  static const D2D1_FILL_MODE D2D1_FILL_MODE_ALTERNATE = 0;
  static const D2D1_FILL_MODE D2D1_FILL_MODE_WINDING = 1;
  typedef UINT D2D1_PRESENT_OPTIONS; //Alias
  typedef UINT D2D1_PATH_SEGMENT; //Alias
  typedef struct D2D1_HWND_RENDER_TARGET_PROPERTIES {
    HWND hwnd;
    D2D1_SIZE_U pixelSize;
    D2D1_PRESENT_OPTIONS presentOptions;
  } D2D1_HWND_RENDER_TARGET_PROPERTIES;
  typedef DWORD D2D1_FIGURE_BEGIN; //Alias
  typedef UINT D2D1_FIGURE_END; //Alias
  static const D2D1_FIGURE_END D2D1_FIGURE_END_OPEN = 0;
  static const D2D1_FIGURE_END D2D1_FIGURE_END_CLOSED = 1;
  typedef struct D2D1_BEZIER_SEGMENT {
    D2D1_POINT_2F point1;
    D2D1_POINT_2F point2;
    D2D1_POINT_2F point3;
  } D2D1_BEZIER_SEGMENT;
  typedef struct D2D1_QUADRATIC_BEZIER_SEGMENT {
    D2D1_POINT_2F point1;
    D2D1_POINT_2F point2;
  } D2D1_QUADRATIC_BEZIER_SEGMENT;
  typedef UINT D2D1_SWEEP_DIRECTION; //Alias
  static const D2D1_SWEEP_DIRECTION D2D1_SWEEP_DIRECTION_COUNTER_CLOCKWISE = 0;
  static const D2D1_SWEEP_DIRECTION D2D1_SWEEP_DIRECTION_CLOCKWISE = 1;
  typedef UINT D2D1_ARC_SIZE; //Alias
  static const D2D1_ARC_SIZE D2D1_ARC_SIZE_SMALL = 0;
  static const D2D1_ARC_SIZE D2D1_ARC_SIZE_LARGE = 1;
  typedef struct D2D1_ARC_SEGMENT {
    D2D1_POINT_2F point;
    D2D1_SIZE_F size;
    FLOAT rotationAngle;
    D2D1_SWEEP_DIRECTION sweepDirection;
    D2D1_ARC_SIZE arcSize;
  } D2D1_ARC_SEGMENT;
  typedef UINT D2D1_WINDOW_STATE; //Alias
  typedef struct D2D1_TRIANGLE {
    D2D1_POINT_2F point1;
    D2D1_POINT_2F point2;
    D2D1_POINT_2F point3;
  } D2D1_TRIANGLE;
  typedef UINT D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS; //Alias
  typedef UINT D2D1_DC_INITIALIZE_MODE; //Alias
  static const D2D1_DC_INITIALIZE_MODE D2D1_DC_INITIALIZE_MODE_COPY = 0;
  static const D2D1_DC_INITIALIZE_MODE D2D1_DC_INITIALIZE_MODE_CLEAR = 1;
  typedef UINT D2D1_DRAW_TEXT_OPTIONS; //Alias
  D2D_HRESULT D2D1CreateFactory(      D2D1_FACTORY_TYPE factoryType, REFIID riid, D2D1_FACTORY_OPTIONS* pFactoryOptions, void** ppIFactory);
  void        D2D1MakeRotateMatrix(   FLOAT angle, D2D1_POINT_2F center, D2D1_MATRIX_3X2_F* matrix);
  void        D2D1MakeSkewMatrix(     FLOAT angleX, FLOAT angleY, D2D1_POINT_2F center, D2D1_MATRIX_3X2_F* matrix);
  BOOL        D2D1IsMatrixInvertible( D2D1_MATRIX_3X2_F* matrix);
  BOOL        D2D1InvertMatrix(       D2D1_MATRIX_3X2_F* matrix);
]]
ffi.load( 'd2d1.dll' )

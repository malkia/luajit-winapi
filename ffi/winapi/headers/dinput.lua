require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  typedef IDirectInputDeviceA* LPDIRECTINPUTDEVICEA;
  typedef IDirectInputDeviceW* LPDIRECTINPUTDEVICEW;
  typedef IDirectInputDevice8A* LPDIRECTINPUTDEVICE8A;
  typedef IDirectInputDevice8W* LPDIRECTINPUTDEVICE8W;
  typedef IDirectInputA* LPDIRECTINPUTA;
  typedef IDirectInputW* LPDIRECTINPUTW;
  typedef IDirectInputEffect* LPDIRECTINPUTEFFECT;
  typedef LPVOID LPDIENUMDEVICESCALLBACKA;
  typedef LPVOID LPDIENUMDEVICESCALLBACKW;
  typedef LPVOID LPDICONFIGUREDEVICESCALLBACK;
  typedef LPVOID LPDIENUMDEVICEOBJECTSCALLBACKA;
  typedef LPVOID LPDIENUMDEVICEOBJECTSCALLBACKW;
  typedef LPVOID LPDIENUMCREATEDEFFECTOBJECTSCALLBACK;
  typedef LPVOID LPDIENUMEFFECTSCALLBACKA;
  typedef LPVOID LPDIENUMEFFECTSCALLBACKW;
  typedef LPVOID LPDIENUMEFFECTSINFILECALLBACK;
  typedef LPVOID LPDIENUMDEVICESBYSEMANTICSCBA;
  typedef LPVOID LPDIENUMDEVICESBYSEMANTICSCBW;
  typedef enum WINAPI_DI_HRESULT {
    DI_OK = 0x00000000,
    E_ABORT = 0x80004004,
    E_HANDLE = 0x80070006,
    E_OUTOFMEMORY = 0x8007000E,
    E_POINTER = 0x80004003,
    E_UNEXPECTED = 0x8000FFFF,
    DI_POLLEDDEVICE = 0x00000002,
    DI_DOWNLOADSKIPPED = 0x00000003,
    DI_EFFECTRESTARTED = 0x00000004,
    DI_TRUNCATED = 0x00000008,
    DI_SETTINGSNOTSAVED = 0x0000000b,
    DI_TRUNCATEDANDRESTARTED = 0x0000000c,
    DI_WRITEPROTECT = 0x00000013,
    DIERR_OLDDIRECTINPUTVERSION = 0x8007047e,
    DIERR_BETADIRECTINPUTVERSION = 0x80070481,
    DIERR_BADDRIVERVER = 0x80070077,
    DIERR_DEVICENOTREG = 0x80040154,
    DIERR_NOTFOUND = 0x80070002,
    DIERR_INVALIDPARAM = 0x80070057,
    DIERR_NOINTERFACE = 0x80004002,
    DIERR_GENERIC = 0x80004005,
    DIERR_OUTOFMEMORY = 0x8007000e,
    DIERR_UNSUPPORTED = 0x80004001,
    DIERR_NOTINITIALIZED = 0x80070015,
    DIERR_ALREADYINITIALIZED = 0x800704df,
    DIERR_NOAGGREGATION = 0x80040110,
    DIERR_INPUTLOST = 0x8007001e,
    DIERR_ACQUIRED = 0x800700aa,
    DIERR_NOTACQUIRED = 0x8007000c,
    E_PENDING = 0x8000000a,
    DIERR_INSUFFICIENTPRIVS = 0x80040200,
    DIERR_DEVICEFULL = 0x80040201,
    DIERR_MOREDATA = 0x80040202,
    DIERR_NOTDOWNLOADED = 0x80040203,
    DIERR_HASEFFECTS = 0x80040204,
    DIERR_NOTEXCLUSIVEACQUIRED = 0x80040205,
    DIERR_INCOMPLETEEFFECT = 0x80040206,
    DIERR_NOTBUFFERED = 0x80040207,
    DIERR_EFFECTPLAYING = 0x80040208,
    DIERR_UNPLUGGED = 0x80040209,
    DIERR_REPORTFULL = 0x8004020a,
    DIERR_MAPFILEFAIL = 0x8004020b,
  } WINAPI_DI_HRESULT;
  typedef union WINAPI_DIACTIONA_u {
    LPCSTR lptszActionName,
    UINT uResIdString,
  } WINAPI_DIACTIONA_u;

  typedef DWORD WINAPI_DIA_Flags;
  typedef enum WINAPI_DIAH_Enum {
    DIAH_UNMAPPED = 0x00000000,
    DIAH_USERCONFIG = 0x00000001,
    DIAH_APPREQUESTED = 0x00000002,
    DIAH_HWAPP = 0x00000004,
    DIAH_HWDEFAULT = 0x00000008,
    DIAH_DEFAULT = 0x00000020,
    DIAH_ERROR = 0x80000000,
  } WINAPI_DIAH_Enum;
  typedef DWORD WINAPI_DIDFT_Flags;
  typedef struct DIACTIONA {
    UINT_PTR uAppData,
    DWORD dwSemantic,
    WINAPI_DIA_Flags dwFlags,
    WINAPI_DIACTIONA_u ,
    GUID guidInstance,
    WINAPI_DIDFT_Flags dwObjID,
    WINAPI_DIAH_Enum dwHow,
  } DIACTIONA;

  typedef DIACTIONA LPDIACTIONA;
  typedef struct DIACTIONFORMATA {
    DWORD dwSize,
    DWORD dwActionSize,
    DWORD dwDataSize,
    DWORD dwNumActions,
    LPDIACTIONA rgoAction,
    GUID guidActionMap,
    DWORD dwGenre,
    DWORD dwBufferSize,
    LONG lAxisMin,
    LONG lAxisMax,
    HINSTANCE hInstString,
    FILETIME ftTimeStamp,
    DWORD dwCRC,
    CHAR [MAX_PATH] tszActionMap,
  } DIACTIONFORMATA;

  typedef DIACTIONFORMATA LPDIACTIONFORMATA;
  typedef union WINAPI_DIACTIONW_u {
    LPCWSTR lptszActionName,
    UINT uResIdString,
  } WINAPI_DIACTIONW_u;

  typedef struct DIACTIONW {
    UINT_PTR uAppData,
    DWORD dwSemantic,
    WINAPI_DIA_Flags dwFlags,
    WINAPI_DIACTIONW_u ,
    GUID guidInstance,
    WINAPI_DIDFT_Flags dwObjID,
    WINAPI_DIAH_Enum dwHow,
  } DIACTIONW;

  typedef DIACTIONW LPDIACTIONW;
  typedef struct DIACTIONFORMATW {
    DWORD dwSize,
    DWORD dwActionSize,
    DWORD dwDataSize,
    DWORD dwNumActions,
    LPDIACTIONW rgoAction,
    GUID guidActionMap,
    DWORD dwGenre,
    DWORD dwBufferSize,
    LONG lAxisMin,
    LONG lAxisMax,
    HINSTANCE hInstString,
    FILETIME ftTimeStamp,
    DWORD dwCRC,
    WCHAR [MAX_PATH] tszActionMap,
  } DIACTIONFORMATW;

  typedef DIACTIONFORMATW LPDIACTIONFORMATW;
  typedef DWORD WINAPI_DIDC_Flags;
  typedef struct DIDEVCAPS {
    DWORD dwSize,
    WINAPI_DIDC_Flags dwFlags,
    DWORD dwDevType,
    DWORD dwAxes,
    DWORD dwButtons,
    DWORD dwPOVs,
    DWORD dwFFSamplePeriod,
    DWORD dwFFMinTimeResolution,
    DWORD dwFirmwareRevision,
    DWORD dwHardwareRevision,
    DWORD dwFFDriverVersion,
  } DIDEVCAPS;

  typedef DIDEVCAPS LPDIDEVCAPS;
  typedef struct DICOLORSET {
    DWORD dwSize,
    D3DCOLOR cTextFore,
    D3DCOLOR cTextHighlight,
    D3DCOLOR cCalloutLine,
    D3DCOLOR cCalloutHighlight,
    D3DCOLOR cBorder,
    D3DCOLOR cControlFill,
    D3DCOLOR cHighlightFill,
    D3DCOLOR cAreaFill,
  } DICOLORSET;

  typedef struct DICONFIGUREDEVICESPARAMSA {
    DWORD dwSize,
    DWORD dwcUsers,
    LPSTR lptszUserNames,
    DWORD dwcFormats,
    LPDIACTIONFORMATA lprgFormats,
    HWND hwnd,
    DICOLORSET dics,
    IUnknown* lpUnkDDSTarget,
  } DICONFIGUREDEVICESPARAMSA;

  typedef DICONFIGUREDEVICESPARAMSA LPDICONFIGUREDEVICESPARAMSA;
  typedef struct DICONFIGUREDEVICESPARAMSW {
    DWORD dwSize,
    DWORD dwcUsers,
    LPSTR lptszUserNames,
    DWORD dwcFormats,
    LPDIACTIONFORMATW lprgFormats,
    HWND hwnd,
    DICOLORSET dics,
    IUnknown* lpUnkDDSTarget,
  } DICONFIGUREDEVICESPARAMSW;

  typedef DICONFIGUREDEVICESPARAMSW LPDICONFIGUREDEVICESPARAMSW;
  typedef enum WINAPI_DIPH_Enum {
    DIPH_DEVICE = 0,
    DIPH_BYOFFSET = 1,
    DIPH_BYID = 2,
    DIPH_BYUSAGE = 3,
  } WINAPI_DIPH_Enum;
  typedef struct DIPROPHEADER {
    DWORD dwSize,
    DWORD dwHeaderSize,
    DWORD dwObj,
    WINAPI_DIPH_Enum dwHow,
  } DIPROPHEADER;

  typedef DIPROPHEADER LPDIPROPHEADER;
  typedef DIPROPHEADER LPCDIPROPHEADER;
  typedef struct DIDEVICEOBJECTDATA {
    DWORD dwOfs,
    DWORD dwData,
    DWORD dwTimeStamp,
    DWORD dwSequence,
    UINT_PTR uAppData,
  } DIDEVICEOBJECTDATA;

  typedef DIDEVICEOBJECTDATA LPDIDEVICEOBJECTDATA;
  typedef DIDEVICEOBJECTDATA LPCDIDEVICEOBJECTDATA;
  typedef DWORD WINAPI_DIDOI_Flags;
  typedef struct DIOBJECTDATAFORMAT {
    GUID* pguid,
    DWORD dwOfs,
    WINAPI_DIDFT_Flags dwType,
    WINAPI_DIDOI_Flags dwFlags,
  } DIOBJECTDATAFORMAT;

  typedef DIOBJECTDATAFORMAT LPDIOBJECTDATAFORMAT;
  typedef enum WINAPI_DIDATAFORMAT_Enum {
    DIDFT_RELAXIS = 0x00000001,
    DIDFT_ABSAXIS = 0x00000002,
  } WINAPI_DIDATAFORMAT_Enum;
  typedef struct DIDATAFORMAT {
    DWORD dwSize,
    DWORD dwObjSize,
    WINAPI_DIDATAFORMAT_Enum dwFlags,
    DWORD dwDataSize,
    DWORD dwNumObjs,
    LPDIOBJECTDATAFORMAT rgodf,
  } DIDATAFORMAT;

  typedef DIDATAFORMAT LPCDIDATAFORMAT;
  typedef struct DIDEVICEOBJECTINSTANCEA {
    DWORD dwSize,
    GUID guidType,
    DWORD dwOfs,
    WINAPI_DIDFT_Flags dwType,
    WINAPI_DIDOI_Flags dwFlags,
    CHAR [MAX_PATH] tszName,
    DWORD dwFFMaxForce,
    DWORD dwFFForceResolution,
    WORD wCollectionNumber,
    WORD wDesignatorIndex,
    WORD wUsagePage,
    WORD wUsage,
    DWORD dwDimension,
    WORD wExponent,
    WORD wReportId,
  } DIDEVICEOBJECTINSTANCEA;

  typedef DIDEVICEOBJECTINSTANCEA LPDIDEVICEOBJECTINSTANCEA;
  typedef struct DIDEVICEOBJECTINSTANCEW {
    DWORD dwSize,
    GUID guidType,
    DWORD dwOfs,
    WINAPI_DIDFT_Flags dwType,
    WINAPI_DIDOI_Flags dwFlags,
    WCHAR [MAX_PATH] tszName,
    DWORD dwFFMaxForce,
    DWORD dwFFForceResolution,
    WORD wCollectionNumber,
    WORD wDesignatorIndex,
    WORD wUsagePage,
    WORD wUsage,
    DWORD dwDimension,
    WORD wExponent,
    WORD wReportId,
  } DIDEVICEOBJECTINSTANCEW;

  typedef DIDEVICEOBJECTINSTANCEW LPDIDEVICEOBJECTINSTANCEW;
  typedef struct DIDEVICEINSTANCEA {
    DWORD dwSize,
    GUID guidInstance,
    GUID guidProduct,
    DWORD dwDevType,
    CHAR [MAX_PATH] tszInstanceName,
    CHAR [MAX_PATH] tszProductName,
    GUID guidFFDriver,
    WORD wUsagePage,
    WORD wUsage,
  } DIDEVICEINSTANCEA;

  typedef DIDEVICEINSTANCEA LPDIDEVICEINSTANCEA;
  typedef struct DIDEVICEINSTANCEW {
    DWORD dwSize,
    GUID guidInstance,
    GUID guidProduct,
    DWORD dwDevType,
    WCHAR [MAX_PATH] tszInstanceName,
    WCHAR [MAX_PATH] tszProductName,
    GUID guidFFDriver,
    WORD wUsagePage,
    WORD wUsage,
  } DIDEVICEINSTANCEW;

  typedef DIDEVICEINSTANCEW LPDIDEVICEINSTANCEW;
  typedef struct DIENVELOPE {
    DWORD dwSize,
    DWORD dwAttackLevel,
    DWORD dwAttackTime,
    DWORD dwFadeLevel,
    DWORD dwFadeTime,
  } DIENVELOPE;

  typedef DIENVELOPE LPDIENVELOPE;
  typedef DWORD WINAPI_DIEFF_Flags;
  typedef enum WINAPI_DIEB_Enum {
    DIEB_NOTRIGGER = 0xFFFFFFFF,
  } WINAPI_DIEB_Enum;
  typedef struct DIEFFECT {
    DWORD dwSize,
    WINAPI_DIEFF_Flags dwFlags,
    DWORD dwDuration,
    DWORD dwSamplePeriod,
    DWORD dwGain,
    WINAPI_DIEB_Enum dwTriggerButton,
    DWORD dwTriggerRepeatInterval,
    DWORD cAxes,
    LPDWORD rgdwAxes,
    LPLONG rglDirection,
    LPDIENVELOPE lpEnvelope,
    DWORD cbTypeSpecificParams,
    LPVOID lpvTypeSpecificParams,
    DWORD dwStartDelay,
  } DIEFFECT;

  typedef DIEFFECT LPDIEFFECT;
  typedef DIEFFECT LPCDIEFFECT;
  typedef DWORD WINAPI_DIEFT_Flags;
  typedef DWORD WINAPI_DIEP_Flags;
  typedef struct DIEFFECTINFOA {
    DWORD dwSize,
    GUID guid,
    WINAPI_DIEFT_Flags dwEffType,
    WINAPI_DIEP_Flags dwStaticParams,
    WINAPI_DIEP_Flags dwDynamicParams,
    CHAR [MAX_PATH] tszName,
  } DIEFFECTINFOA;

  typedef DIEFFECTINFOA LPDIEFFECTINFOA;
  typedef struct DIEFFECTINFOW {
    DWORD dwSize,
    GUID guid,
    WINAPI_DIEFT_Flags dwEffType,
    WINAPI_DIEP_Flags dwStaticParams,
    WINAPI_DIEP_Flags dwDynamicParams,
    WCHAR [MAX_PATH] tszName,
  } DIEFFECTINFOW;

  typedef DIEFFECTINFOW LPDIEFFECTINFOW;
  typedef struct DIEFFESCAPE {
    DWORD dwSize,
    DWORD dwCommand,
    LPVOID lpvInBuffer,
    DWORD cbInBuffer,
    LPVOID lpvOutBuffer,
    DWORD cbOutBuffer,
  } DIEFFESCAPE;

  typedef DIEFFESCAPE LPDIEFFESCAPE;
  typedef struct DIFILEEFFECT {
    DWORD dwSize,
    GUID GuidEffect,
    LPCDIEFFECT lpDiEffect,
    CHAR [MAX_PATH] szFriendlyName,
  } DIFILEEFFECT;

  typedef DIFILEEFFECT LPDIFILEEFFECT;
  typedef DWORD WINAPI_DIDIFT_Flags;
  typedef DWORD WINAPI_DIDAL_Flags;
  typedef struct DIDEVICEIMAGEINFOA {
    CHAR [MAX_PATH] tszImagePath,
    WINAPI_DIDIFT_Flags dwFlags,
    DWORD dwViewID,
    RECT rcOverlay,
    WINAPI_DIDFT_Flags dwObjID,
    DWORD dwcValidPts,
    POINT [5] rgptCalloutLine,
    RECT rcCalloutRect,
    WINAPI_DIDAL_Flags dwTextAlign,
  } DIDEVICEIMAGEINFOA;

  typedef DIDEVICEIMAGEINFOA LPDIDEVICEIMAGEINFOA;
  typedef struct DIDEVICEIMAGEINFOHEADERA {
    DWORD dwSize,
    DWORD dwSizeImageInfo,
    DWORD dwcViews,
    DWORD dwcButtons,
    DWORD dwcAxes,
    DWORD dwcPOVs,
    DWORD dwBufferSize,
    DWORD dwBufferUsed,
    LPDIDEVICEIMAGEINFOA lprgImageInfoArray,
  } DIDEVICEIMAGEINFOHEADERA;

  typedef DIDEVICEIMAGEINFOHEADERA LPDIDEVICEIMAGEINFOHEADERA;
  typedef struct DIDEVICEIMAGEINFOW {
    WCHAR [MAX_PATH] tszImagePath,
    WINAPI_DIDIFT_Flags dwFlags,
    DWORD dwViewID,
    RECT rcOverlay,
    WINAPI_DIDFT_Flags dwObjID,
    DWORD dwcValidPts,
    POINT [5] rgptCalloutLine,
    RECT rcCalloutRect,
    WINAPI_DIDAL_Flags dwTextAlign,
  } DIDEVICEIMAGEINFOW;

  typedef DIDEVICEIMAGEINFOW LPDIDEVICEIMAGEINFOW;
  typedef struct DIDEVICEIMAGEINFOHEADERW {
    DWORD dwSize,
    DWORD dwSizeImageInfo,
    DWORD dwcViews,
    DWORD dwcButtons,
    DWORD dwcAxes,
    DWORD dwcPOVs,
    DWORD dwBufferSize,
    DWORD dwBufferUsed,
    LPDIDEVICEIMAGEINFOW lprgImageInfoArray,
  } DIDEVICEIMAGEINFOHEADERW;

  typedef DIDEVICEIMAGEINFOHEADERW LPDIDEVICEIMAGEINFOHEADERW;
  typedef enum WINAPI_DIPROP {
    DIPROP_BUFFERSIZE = 1,
    DIPROP_AXISMODE = 2,
    DIPROP_GRANULARITY = 3,
    DIPROP_RANGE = 4,
    DIPROP_DEADZONE = 5,
    DIPROP_SATURATION = 6,
    DIPROP_FFGAIN = 7,
    DIPROP_FFLOAD = 8,
    DIPROP_AUTOCENTER = 9,
    DIPROP_CALIBRATIONMODE = 10,
    DIPROP_CALIBRATION = 11,
    DIPROP_GUIDANDPATH = 12,
    DIPROP_INSTANCENAME = 13,
    DIPROP_PRODUCTNAME = 14,
    DIPROP_JOYSTICKID = 15,
    DIPROP_GETPORTDISPLAYNAME = 16,
    DIPROP_PHYSICALRANGE = 18,
    DIPROP_LOGICALRANGE = 19,
    DIPROP_KEYNAME = 20,
    DIPROP_CPOINTS = 21,
    DIPROP_APPDATA = 22,
    DIPROP_SCANCODE = 23,
    DIPROP_VIDPID = 24,
    DIPROP_USERNAME = 25,
    DIPROP_TYPENAME = 26,
  } WINAPI_DIPROP;
  typedef enum WINAPI_DI8DEV_FILTER {
    DI8DEVCLASS_ALL = 0,
    DI8DEVCLASS_DEVICE = 1,
    DI8DEVCLASS_POINTER = 2,
    DI8DEVCLASS_KEYBOARD = 3,
    DI8DEVCLASS_GAMECTRL = 4,
    DI8DEVTYPE_DEVICE = 0x11,
    DI8DEVTYPE_MOUSE = 0x12,
    DI8DEVTYPE_KEYBOARD = 0x13,
    DI8DEVTYPE_JOYSTICK = 0x14,
    DI8DEVTYPE_GAMEPAD = 0x15,
    DI8DEVTYPE_DRIVING = 0x16,
    DI8DEVTYPE_FLIGHT = 0x17,
    DI8DEVTYPE_1STPERSON = 0x18,
    DI8DEVTYPE_DEVICECTRL = 0x19,
    DI8DEVTYPE_SCREENPOINTER = 0x1A,
    DI8DEVTYPE_REMOTE = 0x1B,
    DI8DEVTYPE_SUPPLEMENTAL = 0x1C,
  } WINAPI_DI8DEV_FILTER;
  typedef DWORD WINAPI_DIEDFL_Flags;
  typedef DWORD WINAPI_DIEDBSFL_Flags;
  typedef enum WINAPI_DICD_Enum {
    DICD_DEFAULT = 0x00000000,
    DICD_EDIT = 0x00000001,
  } WINAPI_DICD_Enum;
  typedef DWORD WINAPI_DIGFFS_Flags;
  typedef DWORD WINAPI_DISFFC_Flags;
  typedef DWORD WINAPI_DIFEF_Flags;
  typedef DWORD WINAPI_DIDBAM_Flags;
  typedef DWORD WINAPI_DIDSAM_Flags;
  typedef DWORD WINAPI_DIES_Flags;
  typedef DWORD WINAPI_DIEGES_Flags;
  typedef DWORD WINAPI_DISCL_Flags;
  typedef DWORD WINAPI_DIGDD_Flags;
]]

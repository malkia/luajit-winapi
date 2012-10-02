require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IDirectInput2A; //Interface
  typedef void* IDirectInput2W; //Interface
  typedef void* IDirectInput7A; //Interface
  typedef void* IDirectInput7W; //Interface
  typedef void* IDirectInput8A; //Interface
  typedef void* IDirectInput8W; //Interface
  typedef void* IDirectInputA; //Interface
  typedef void* IDirectInputDevice2A; //Interface
  typedef void* IDirectInputDevice2W; //Interface
  typedef void* IDirectInputDevice7A; //Interface
  typedef void* IDirectInputDevice7W; //Interface
  typedef void* IDirectInputDevice8A; //Interface
  typedef void* IDirectInputDevice8W; //Interface
  typedef void* IDirectInputDeviceA; //Interface
  typedef void* IDirectInputDeviceW; //Interface
  typedef void* IDirectInputEffect; //Interface
  typedef void* IDirectInputW; //Interface
  typedef IDirectInputDeviceA* LPDIRECTINPUTDEVICEA; //Alias
  typedef IDirectInputDeviceW* LPDIRECTINPUTDEVICEW; //Alias
  typedef IDirectInputDevice8A* LPDIRECTINPUTDEVICE8A; //Alias
  typedef IDirectInputDevice8W* LPDIRECTINPUTDEVICE8W; //Alias
  typedef IDirectInputA* LPDIRECTINPUTA; //Alias
  typedef IDirectInputW* LPDIRECTINPUTW; //Alias
  typedef IDirectInputEffect* LPDIRECTINPUTEFFECT; //Alias
  typedef LPVOID LPDIENUMDEVICESCALLBACKA; //Alias
  typedef LPVOID LPDIENUMDEVICESCALLBACKW; //Alias
  typedef LPVOID LPDICONFIGUREDEVICESCALLBACK; //Alias
  typedef LPVOID LPDIENUMDEVICEOBJECTSCALLBACKA; //Alias
  typedef LPVOID LPDIENUMDEVICEOBJECTSCALLBACKW; //Alias
  typedef LPVOID LPDIENUMCREATEDEFFECTOBJECTSCALLBACK; //Alias
  typedef LPVOID LPDIENUMEFFECTSCALLBACKA; //Alias
  typedef LPVOID LPDIENUMEFFECTSCALLBACKW; //Alias
  typedef LPVOID LPDIENUMEFFECTSINFILECALLBACK; //Alias
  typedef LPVOID LPDIENUMDEVICESBYSEMANTICSCBA; //Alias
  typedef LPVOID LPDIENUMDEVICESBYSEMANTICSCBW; //Alias
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
    LPCSTR lptszActionName;
    UINT uResIdString;
  } WINAPI_DIACTIONA_u;
  typedef DWORD WINAPI_DIA_Flags; //Alias
  typedef enum WINAPI_DIAH_Enum {
    DIAH_UNMAPPED = 0x00000000,
    DIAH_USERCONFIG = 0x00000001,
    DIAH_APPREQUESTED = 0x00000002,
    DIAH_HWAPP = 0x00000004,
    DIAH_HWDEFAULT = 0x00000008,
    DIAH_DEFAULT = 0x00000020,
    DIAH_ERROR = 0x80000000,
  } WINAPI_DIAH_Enum;
  typedef DWORD WINAPI_DIDFT_Flags; //Alias
  typedef struct DIACTIONA {
    UINT_PTR uAppData;
    DWORD dwSemantic;
    WINAPI_DIA_Flags dwFlags;
    WINAPI_DIACTIONA_u ;
    GUID guidInstance;
    WINAPI_DIDFT_Flags dwObjID;
    WINAPI_DIAH_Enum dwHow;
  } DIACTIONA;
  typedef DIACTIONA *LPDIACTIONA; //Pointer
  typedef struct DIACTIONFORMATA {
    DWORD dwSize;
    DWORD dwActionSize;
    DWORD dwDataSize;
    DWORD dwNumActions;
    LPDIACTIONA rgoAction;
    GUID guidActionMap;
    DWORD dwGenre;
    DWORD dwBufferSize;
    LONG lAxisMin;
    LONG lAxisMax;
    HINSTANCE hInstString;
    FILETIME ftTimeStamp;
    DWORD dwCRC;
    CHAR tszActionMap[MAX_PATH];
  } DIACTIONFORMATA;
  typedef DIACTIONFORMATA *LPDIACTIONFORMATA; //Pointer
  typedef union WINAPI_DIACTIONW_u {
    LPCWSTR lptszActionName;
    UINT uResIdString;
  } WINAPI_DIACTIONW_u;
  typedef struct DIACTIONW {
    UINT_PTR uAppData;
    DWORD dwSemantic;
    WINAPI_DIA_Flags dwFlags;
    WINAPI_DIACTIONW_u ;
    GUID guidInstance;
    WINAPI_DIDFT_Flags dwObjID;
    WINAPI_DIAH_Enum dwHow;
  } DIACTIONW;
  typedef DIACTIONW *LPDIACTIONW; //Pointer
  typedef struct DIACTIONFORMATW {
    DWORD dwSize;
    DWORD dwActionSize;
    DWORD dwDataSize;
    DWORD dwNumActions;
    LPDIACTIONW rgoAction;
    GUID guidActionMap;
    DWORD dwGenre;
    DWORD dwBufferSize;
    LONG lAxisMin;
    LONG lAxisMax;
    HINSTANCE hInstString;
    FILETIME ftTimeStamp;
    DWORD dwCRC;
    WCHAR tszActionMap[MAX_PATH];
  } DIACTIONFORMATW;
  typedef DIACTIONFORMATW *LPDIACTIONFORMATW; //Pointer
  typedef DWORD WINAPI_DIDC_Flags; //Alias
  typedef struct DIDEVCAPS {
    DWORD dwSize;
    WINAPI_DIDC_Flags dwFlags;
    DWORD dwDevType;
    DWORD dwAxes;
    DWORD dwButtons;
    DWORD dwPOVs;
    DWORD dwFFSamplePeriod;
    DWORD dwFFMinTimeResolution;
    DWORD dwFirmwareRevision;
    DWORD dwHardwareRevision;
    DWORD dwFFDriverVersion;
  } DIDEVCAPS;
  typedef DIDEVCAPS *LPDIDEVCAPS; //Pointer
  typedef struct DICOLORSET {
    DWORD dwSize;
    D3DCOLOR cTextFore;
    D3DCOLOR cTextHighlight;
    D3DCOLOR cCalloutLine;
    D3DCOLOR cCalloutHighlight;
    D3DCOLOR cBorder;
    D3DCOLOR cControlFill;
    D3DCOLOR cHighlightFill;
    D3DCOLOR cAreaFill;
  } DICOLORSET;
  typedef struct DICONFIGUREDEVICESPARAMSA {
    DWORD dwSize;
    DWORD dwcUsers;
    LPSTR lptszUserNames;
    DWORD dwcFormats;
    LPDIACTIONFORMATA lprgFormats;
    HWND hwnd;
    DICOLORSET dics;
    IUnknown* lpUnkDDSTarget;
  } DICONFIGUREDEVICESPARAMSA;
  typedef DICONFIGUREDEVICESPARAMSA *LPDICONFIGUREDEVICESPARAMSA; //Pointer
  typedef struct DICONFIGUREDEVICESPARAMSW {
    DWORD dwSize;
    DWORD dwcUsers;
    LPSTR lptszUserNames;
    DWORD dwcFormats;
    LPDIACTIONFORMATW lprgFormats;
    HWND hwnd;
    DICOLORSET dics;
    IUnknown* lpUnkDDSTarget;
  } DICONFIGUREDEVICESPARAMSW;
  typedef DICONFIGUREDEVICESPARAMSW *LPDICONFIGUREDEVICESPARAMSW; //Pointer
  typedef enum WINAPI_DIPH_Enum {
    DIPH_DEVICE = 0,
    DIPH_BYOFFSET = 1,
    DIPH_BYID = 2,
    DIPH_BYUSAGE = 3,
  } WINAPI_DIPH_Enum;
  typedef struct DIPROPHEADER {
    DWORD dwSize;
    DWORD dwHeaderSize;
    DWORD dwObj;
    WINAPI_DIPH_Enum dwHow;
  } DIPROPHEADER;
  typedef DIPROPHEADER *LPDIPROPHEADER; //Pointer
  typedef DIPROPHEADER *LPCDIPROPHEADER; //Pointer
  typedef struct DIDEVICEOBJECTDATA {
    DWORD dwOfs;
    DWORD dwData;
    DWORD dwTimeStamp;
    DWORD dwSequence;
    UINT_PTR uAppData;
  } DIDEVICEOBJECTDATA;
  typedef DIDEVICEOBJECTDATA *LPDIDEVICEOBJECTDATA; //Pointer
  typedef DIDEVICEOBJECTDATA *LPCDIDEVICEOBJECTDATA; //Pointer
  typedef DWORD WINAPI_DIDOI_Flags; //Alias
  typedef struct DIOBJECTDATAFORMAT {
    WINAPI_GUID* pguid;
    DWORD dwOfs;
    WINAPI_DIDFT_Flags dwType;
    WINAPI_DIDOI_Flags dwFlags;
  } DIOBJECTDATAFORMAT;
  typedef DIOBJECTDATAFORMAT *LPDIOBJECTDATAFORMAT; //Pointer
  typedef enum WINAPI_DIDATAFORMAT_Enum {
    DIDFT_RELAXIS = 0x00000001,
    DIDFT_ABSAXIS = 0x00000002,
  } WINAPI_DIDATAFORMAT_Enum;
  typedef struct DIDATAFORMAT {
    DWORD dwSize;
    DWORD dwObjSize;
    WINAPI_DIDATAFORMAT_Enum dwFlags;
    DWORD dwDataSize;
    DWORD dwNumObjs;
    LPDIOBJECTDATAFORMAT rgodf;
  } DIDATAFORMAT;
  typedef DIDATAFORMAT *LPCDIDATAFORMAT; //Pointer
  typedef struct DIDEVICEOBJECTINSTANCEA {
    DWORD dwSize;
    GUID guidType;
    DWORD dwOfs;
    WINAPI_DIDFT_Flags dwType;
    WINAPI_DIDOI_Flags dwFlags;
    CHAR tszName[MAX_PATH];
    DWORD dwFFMaxForce;
    DWORD dwFFForceResolution;
    WORD wCollectionNumber;
    WORD wDesignatorIndex;
    WORD wUsagePage;
    WORD wUsage;
    DWORD dwDimension;
    WORD wExponent;
    WORD wReportId;
  } DIDEVICEOBJECTINSTANCEA;
  typedef DIDEVICEOBJECTINSTANCEA *LPDIDEVICEOBJECTINSTANCEA; //Pointer
  typedef struct DIDEVICEOBJECTINSTANCEW {
    DWORD dwSize;
    GUID guidType;
    DWORD dwOfs;
    WINAPI_DIDFT_Flags dwType;
    WINAPI_DIDOI_Flags dwFlags;
    WCHAR tszName[MAX_PATH];
    DWORD dwFFMaxForce;
    DWORD dwFFForceResolution;
    WORD wCollectionNumber;
    WORD wDesignatorIndex;
    WORD wUsagePage;
    WORD wUsage;
    DWORD dwDimension;
    WORD wExponent;
    WORD wReportId;
  } DIDEVICEOBJECTINSTANCEW;
  typedef DIDEVICEOBJECTINSTANCEW *LPDIDEVICEOBJECTINSTANCEW; //Pointer
  typedef struct DIDEVICEINSTANCEA {
    DWORD dwSize;
    GUID guidInstance;
    GUID guidProduct;
    DWORD dwDevType;
    CHAR tszInstanceName[MAX_PATH];
    CHAR tszProductName[MAX_PATH];
    GUID guidFFDriver;
    WORD wUsagePage;
    WORD wUsage;
  } DIDEVICEINSTANCEA;
  typedef DIDEVICEINSTANCEA *LPDIDEVICEINSTANCEA; //Pointer
  typedef struct DIDEVICEINSTANCEW {
    DWORD dwSize;
    GUID guidInstance;
    GUID guidProduct;
    DWORD dwDevType;
    WCHAR tszInstanceName[MAX_PATH];
    WCHAR tszProductName[MAX_PATH];
    GUID guidFFDriver;
    WORD wUsagePage;
    WORD wUsage;
  } DIDEVICEINSTANCEW;
  typedef DIDEVICEINSTANCEW *LPDIDEVICEINSTANCEW; //Pointer
  typedef struct DIENVELOPE {
    DWORD dwSize;
    DWORD dwAttackLevel;
    DWORD dwAttackTime;
    DWORD dwFadeLevel;
    DWORD dwFadeTime;
  } DIENVELOPE;
  typedef DIENVELOPE *LPDIENVELOPE; //Pointer
  typedef DWORD WINAPI_DIEFF_Flags; //Alias
  typedef enum WINAPI_DIEB_Enum {
    DIEB_NOTRIGGER = 0xFFFFFFFF,
  } WINAPI_DIEB_Enum;
  typedef struct DIEFFECT {
    DWORD dwSize;
    WINAPI_DIEFF_Flags dwFlags;
    DWORD dwDuration;
    DWORD dwSamplePeriod;
    DWORD dwGain;
    WINAPI_DIEB_Enum dwTriggerButton;
    DWORD dwTriggerRepeatInterval;
    DWORD cAxes;
    LPDWORD rgdwAxes;
    LPLONG rglDirection;
    LPDIENVELOPE lpEnvelope;
    DWORD cbTypeSpecificParams;
    LPVOID lpvTypeSpecificParams;
    DWORD dwStartDelay;
  } DIEFFECT;
  typedef DIEFFECT *LPDIEFFECT; //Pointer
  typedef DIEFFECT *LPCDIEFFECT; //Pointer
  typedef DWORD WINAPI_DIEFT_Flags; //Alias
  typedef DWORD WINAPI_DIEP_Flags; //Alias
  typedef struct DIEFFECTINFOA {
    DWORD dwSize;
    GUID guid;
    WINAPI_DIEFT_Flags dwEffType;
    WINAPI_DIEP_Flags dwStaticParams;
    WINAPI_DIEP_Flags dwDynamicParams;
    CHAR tszName[MAX_PATH];
  } DIEFFECTINFOA;
  typedef DIEFFECTINFOA *LPDIEFFECTINFOA; //Pointer
  typedef struct DIEFFECTINFOW {
    DWORD dwSize;
    GUID guid;
    WINAPI_DIEFT_Flags dwEffType;
    WINAPI_DIEP_Flags dwStaticParams;
    WINAPI_DIEP_Flags dwDynamicParams;
    WCHAR tszName[MAX_PATH];
  } DIEFFECTINFOW;
  typedef DIEFFECTINFOW *LPDIEFFECTINFOW; //Pointer
  typedef struct DIEFFESCAPE {
    DWORD dwSize;
    DWORD dwCommand;
    LPVOID lpvInBuffer;
    DWORD cbInBuffer;
    LPVOID lpvOutBuffer;
    DWORD cbOutBuffer;
  } DIEFFESCAPE;
  typedef DIEFFESCAPE *LPDIEFFESCAPE; //Pointer
  typedef struct DIFILEEFFECT {
    DWORD dwSize;
    GUID GuidEffect;
    LPCDIEFFECT lpDiEffect;
    CHAR szFriendlyName[MAX_PATH];
  } DIFILEEFFECT;
  typedef DIFILEEFFECT *LPDIFILEEFFECT; //Pointer
  typedef DWORD WINAPI_DIDIFT_Flags; //Alias
  typedef DWORD WINAPI_DIDAL_Flags; //Alias
  typedef struct DIDEVICEIMAGEINFOA {
    CHAR tszImagePath[MAX_PATH];
    WINAPI_DIDIFT_Flags dwFlags;
    DWORD dwViewID;
    RECT rcOverlay;
    WINAPI_DIDFT_Flags dwObjID;
    DWORD dwcValidPts;
    POINT rgptCalloutLine[5];
    RECT rcCalloutRect;
    WINAPI_DIDAL_Flags dwTextAlign;
  } DIDEVICEIMAGEINFOA;
  typedef DIDEVICEIMAGEINFOA *LPDIDEVICEIMAGEINFOA; //Pointer
  typedef struct DIDEVICEIMAGEINFOHEADERA {
    DWORD dwSize;
    DWORD dwSizeImageInfo;
    DWORD dwcViews;
    DWORD dwcButtons;
    DWORD dwcAxes;
    DWORD dwcPOVs;
    DWORD dwBufferSize;
    DWORD dwBufferUsed;
    LPDIDEVICEIMAGEINFOA lprgImageInfoArray;
  } DIDEVICEIMAGEINFOHEADERA;
  typedef DIDEVICEIMAGEINFOHEADERA *LPDIDEVICEIMAGEINFOHEADERA; //Pointer
  typedef struct DIDEVICEIMAGEINFOW {
    WCHAR tszImagePath[MAX_PATH];
    WINAPI_DIDIFT_Flags dwFlags;
    DWORD dwViewID;
    RECT rcOverlay;
    WINAPI_DIDFT_Flags dwObjID;
    DWORD dwcValidPts;
    POINT rgptCalloutLine[5];
    RECT rcCalloutRect;
    WINAPI_DIDAL_Flags dwTextAlign;
  } DIDEVICEIMAGEINFOW;
  typedef DIDEVICEIMAGEINFOW *LPDIDEVICEIMAGEINFOW; //Pointer
  typedef struct DIDEVICEIMAGEINFOHEADERW {
    DWORD dwSize;
    DWORD dwSizeImageInfo;
    DWORD dwcViews;
    DWORD dwcButtons;
    DWORD dwcAxes;
    DWORD dwcPOVs;
    DWORD dwBufferSize;
    DWORD dwBufferUsed;
    LPDIDEVICEIMAGEINFOW lprgImageInfoArray;
  } DIDEVICEIMAGEINFOHEADERW;
  typedef DIDEVICEIMAGEINFOHEADERW *LPDIDEVICEIMAGEINFOHEADERW; //Pointer
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
  typedef DWORD WINAPI_DIEDFL_Flags; //Alias
  typedef DWORD WINAPI_DIEDBSFL_Flags; //Alias
  typedef enum WINAPI_DICD_Enum {
    DICD_DEFAULT = 0x00000000,
    DICD_EDIT = 0x00000001,
  } WINAPI_DICD_Enum;
  typedef DWORD WINAPI_DIGFFS_Flags; //Alias
  typedef DWORD WINAPI_DISFFC_Flags; //Alias
  typedef DWORD WINAPI_DIFEF_Flags; //Alias
  typedef DWORD WINAPI_DIDBAM_Flags; //Alias
  typedef DWORD WINAPI_DIDSAM_Flags; //Alias
  typedef DWORD WINAPI_DIES_Flags; //Alias
  typedef DWORD WINAPI_DIEGES_Flags; //Alias
  typedef DWORD WINAPI_DISCL_Flags; //Alias
  typedef DWORD WINAPI_DIGDD_Flags; //Alias
]]

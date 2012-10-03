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
  typedef HRESULT WINAPI_DI_HRESULT; //Alias
  static const HRESULT DI_OK = 0x00000000;
  static const HRESULT E_ABORT = 0x80004004;
  static const HRESULT E_HANDLE = 0x80070006;
  static const HRESULT E_OUTOFMEMORY = 0x8007000E;
  static const HRESULT E_POINTER = 0x80004003;
  static const HRESULT E_UNEXPECTED = 0x8000FFFF;
  static const HRESULT DI_POLLEDDEVICE = 0x00000002;
  static const HRESULT DI_DOWNLOADSKIPPED = 0x00000003;
  static const HRESULT DI_EFFECTRESTARTED = 0x00000004;
  static const HRESULT DI_TRUNCATED = 0x00000008;
  static const HRESULT DI_SETTINGSNOTSAVED = 0x0000000b;
  static const HRESULT DI_TRUNCATEDANDRESTARTED = 0x0000000c;
  static const HRESULT DI_WRITEPROTECT = 0x00000013;
  static const HRESULT DIERR_OLDDIRECTINPUTVERSION = 0x8007047e;
  static const HRESULT DIERR_BETADIRECTINPUTVERSION = 0x80070481;
  static const HRESULT DIERR_BADDRIVERVER = 0x80070077;
  static const HRESULT DIERR_DEVICENOTREG = 0x80040154;
  static const HRESULT DIERR_NOTFOUND = 0x80070002;
  static const HRESULT DIERR_INVALIDPARAM = 0x80070057;
  static const HRESULT DIERR_NOINTERFACE = 0x80004002;
  static const HRESULT DIERR_GENERIC = 0x80004005;
  static const HRESULT DIERR_OUTOFMEMORY = 0x8007000e;
  static const HRESULT DIERR_UNSUPPORTED = 0x80004001;
  static const HRESULT DIERR_NOTINITIALIZED = 0x80070015;
  static const HRESULT DIERR_ALREADYINITIALIZED = 0x800704df;
  static const HRESULT DIERR_NOAGGREGATION = 0x80040110;
  static const HRESULT DIERR_INPUTLOST = 0x8007001e;
  static const HRESULT DIERR_ACQUIRED = 0x800700aa;
  static const HRESULT DIERR_NOTACQUIRED = 0x8007000c;
  static const HRESULT E_PENDING = 0x8000000a;
  static const HRESULT DIERR_INSUFFICIENTPRIVS = 0x80040200;
  static const HRESULT DIERR_DEVICEFULL = 0x80040201;
  static const HRESULT DIERR_MOREDATA = 0x80040202;
  static const HRESULT DIERR_NOTDOWNLOADED = 0x80040203;
  static const HRESULT DIERR_HASEFFECTS = 0x80040204;
  static const HRESULT DIERR_NOTEXCLUSIVEACQUIRED = 0x80040205;
  static const HRESULT DIERR_INCOMPLETEEFFECT = 0x80040206;
  static const HRESULT DIERR_NOTBUFFERED = 0x80040207;
  static const HRESULT DIERR_EFFECTPLAYING = 0x80040208;
  static const HRESULT DIERR_UNPLUGGED = 0x80040209;
  static const HRESULT DIERR_REPORTFULL = 0x8004020a;
  static const HRESULT DIERR_MAPFILEFAIL = 0x8004020b;
  typedef union WINAPI_DIACTIONA_u {
    LPCSTR lptszActionName;
    UINT uResIdString;
  } WINAPI_DIACTIONA_u;
  typedef DWORD WINAPI_DIA_Flags; //Alias
  typedef DWORD WINAPI_DIAH_Enum; //Alias
  static const DWORD DIAH_UNMAPPED = 0x00000000;
  static const DWORD DIAH_USERCONFIG = 0x00000001;
  static const DWORD DIAH_APPREQUESTED = 0x00000002;
  static const DWORD DIAH_HWAPP = 0x00000004;
  static const DWORD DIAH_HWDEFAULT = 0x00000008;
  static const DWORD DIAH_DEFAULT = 0x00000020;
  static const DWORD DIAH_ERROR = 0x80000000;
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
  typedef DWORD WINAPI_DIPH_Enum; //Alias
  static const DWORD DIPH_DEVICE = 0;
  static const DWORD DIPH_BYOFFSET = 1;
  static const DWORD DIPH_BYID = 2;
  static const DWORD DIPH_BYUSAGE = 3;
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
  typedef DWORD WINAPI_DIDATAFORMAT_Enum; //Alias
  static const DWORD DIDFT_RELAXIS = 0x00000001;
  static const DWORD DIDFT_ABSAXIS = 0x00000002;
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
  typedef DWORD WINAPI_DIEB_Enum; //Alias
  static const DWORD DIEB_NOTRIGGER = 0xFFFFFFFF;
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
  typedef REFGUID WINAPI_DIPROP; //Alias
  static const REFGUID DIPROP_BUFFERSIZE = 1;
  static const REFGUID DIPROP_AXISMODE = 2;
  static const REFGUID DIPROP_GRANULARITY = 3;
  static const REFGUID DIPROP_RANGE = 4;
  static const REFGUID DIPROP_DEADZONE = 5;
  static const REFGUID DIPROP_SATURATION = 6;
  static const REFGUID DIPROP_FFGAIN = 7;
  static const REFGUID DIPROP_FFLOAD = 8;
  static const REFGUID DIPROP_AUTOCENTER = 9;
  static const REFGUID DIPROP_CALIBRATIONMODE = 10;
  static const REFGUID DIPROP_CALIBRATION = 11;
  static const REFGUID DIPROP_GUIDANDPATH = 12;
  static const REFGUID DIPROP_INSTANCENAME = 13;
  static const REFGUID DIPROP_PRODUCTNAME = 14;
  static const REFGUID DIPROP_JOYSTICKID = 15;
  static const REFGUID DIPROP_GETPORTDISPLAYNAME = 16;
  static const REFGUID DIPROP_PHYSICALRANGE = 18;
  static const REFGUID DIPROP_LOGICALRANGE = 19;
  static const REFGUID DIPROP_KEYNAME = 20;
  static const REFGUID DIPROP_CPOINTS = 21;
  static const REFGUID DIPROP_APPDATA = 22;
  static const REFGUID DIPROP_SCANCODE = 23;
  static const REFGUID DIPROP_VIDPID = 24;
  static const REFGUID DIPROP_USERNAME = 25;
  static const REFGUID DIPROP_TYPENAME = 26;
  typedef DWORD WINAPI_DI8DEV_FILTER; //Alias
  static const DWORD DI8DEVCLASS_ALL = 0;
  static const DWORD DI8DEVCLASS_DEVICE = 1;
  static const DWORD DI8DEVCLASS_POINTER = 2;
  static const DWORD DI8DEVCLASS_KEYBOARD = 3;
  static const DWORD DI8DEVCLASS_GAMECTRL = 4;
  static const DWORD DI8DEVTYPE_DEVICE = 0x11;
  static const DWORD DI8DEVTYPE_MOUSE = 0x12;
  static const DWORD DI8DEVTYPE_KEYBOARD = 0x13;
  static const DWORD DI8DEVTYPE_JOYSTICK = 0x14;
  static const DWORD DI8DEVTYPE_GAMEPAD = 0x15;
  static const DWORD DI8DEVTYPE_DRIVING = 0x16;
  static const DWORD DI8DEVTYPE_FLIGHT = 0x17;
  static const DWORD DI8DEVTYPE_1STPERSON = 0x18;
  static const DWORD DI8DEVTYPE_DEVICECTRL = 0x19;
  static const DWORD DI8DEVTYPE_SCREENPOINTER = 0x1A;
  static const DWORD DI8DEVTYPE_REMOTE = 0x1B;
  static const DWORD DI8DEVTYPE_SUPPLEMENTAL = 0x1C;
  typedef DWORD WINAPI_DIEDFL_Flags; //Alias
  typedef DWORD WINAPI_DIEDBSFL_Flags; //Alias
  typedef DWORD WINAPI_DICD_Enum; //Alias
  static const DWORD DICD_DEFAULT = 0x00000000;
  static const DWORD DICD_EDIT = 0x00000001;
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

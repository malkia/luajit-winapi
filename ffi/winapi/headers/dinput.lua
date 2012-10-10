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
  typedef HRESULT DI_HRESULT; //Alias
  static const DI_HRESULT DI_OK = 0x00000000;
  static const DI_HRESULT E_ABORT = 0x80004004;
  static const DI_HRESULT E_OUTOFMEMORY = 0x8007000E;
  static const DI_HRESULT DI_POLLEDDEVICE = 0x00000002;
  static const DI_HRESULT DI_DOWNLOADSKIPPED = 0x00000003;
  static const DI_HRESULT DI_EFFECTRESTARTED = 0x00000004;
  static const DI_HRESULT DI_TRUNCATED = 0x00000008;
  static const DI_HRESULT DI_SETTINGSNOTSAVED = 0x0000000b;
  static const DI_HRESULT DI_TRUNCATEDANDRESTARTED = 0x0000000c;
  static const DI_HRESULT DI_WRITEPROTECT = 0x00000013;
  static const DI_HRESULT DIERR_OLDDIRECTINPUTVERSION = 0x8007047e;
  static const DI_HRESULT DIERR_BETADIRECTINPUTVERSION = 0x80070481;
  static const DI_HRESULT DIERR_BADDRIVERVER = 0x80070077;
  static const DI_HRESULT DIERR_DEVICENOTREG = 0x80040154;
  static const DI_HRESULT DIERR_NOTFOUND = 0x80070002;
  static const DI_HRESULT DIERR_INVALIDPARAM = 0x80070057;
  static const DI_HRESULT DIERR_NOINTERFACE = 0x80004002;
  static const DI_HRESULT DIERR_GENERIC = 0x80004005;
  static const DI_HRESULT DIERR_OUTOFMEMORY = 0x8007000e;
  static const DI_HRESULT DIERR_UNSUPPORTED = 0x80004001;
  static const DI_HRESULT DIERR_NOTINITIALIZED = 0x80070015;
  static const DI_HRESULT DIERR_ALREADYINITIALIZED = 0x800704df;
  static const DI_HRESULT DIERR_NOAGGREGATION = 0x80040110;
  static const DI_HRESULT DIERR_INPUTLOST = 0x8007001e;
  static const DI_HRESULT DIERR_ACQUIRED = 0x800700aa;
  static const DI_HRESULT DIERR_NOTACQUIRED = 0x8007000c;
  static const DI_HRESULT E_PENDING = 0x8000000a;
  static const DI_HRESULT DIERR_INSUFFICIENTPRIVS = 0x80040200;
  static const DI_HRESULT DIERR_DEVICEFULL = 0x80040201;
  static const DI_HRESULT DIERR_MOREDATA = 0x80040202;
  static const DI_HRESULT DIERR_NOTDOWNLOADED = 0x80040203;
  static const DI_HRESULT DIERR_HASEFFECTS = 0x80040204;
  static const DI_HRESULT DIERR_NOTEXCLUSIVEACQUIRED = 0x80040205;
  static const DI_HRESULT DIERR_INCOMPLETEEFFECT = 0x80040206;
  static const DI_HRESULT DIERR_NOTBUFFERED = 0x80040207;
  static const DI_HRESULT DIERR_EFFECTPLAYING = 0x80040208;
  static const DI_HRESULT DIERR_UNPLUGGED = 0x80040209;
  static const DI_HRESULT DIERR_REPORTFULL = 0x8004020a;
  static const DI_HRESULT DIERR_MAPFILEFAIL = 0x8004020b;
  typedef union DIACTIONA_u {
    LPCSTR lptszActionName;
    UINT uResIdString;
  } DIACTIONA_u;
  typedef DWORD DIA_Flags; //Alias
  typedef DWORD DIAH_Enum; //Alias
  static const DIAH_Enum DIAH_UNMAPPED = 0x00000000;
  static const DIAH_Enum DIAH_USERCONFIG = 0x00000001;
  static const DIAH_Enum DIAH_APPREQUESTED = 0x00000002;
  static const DIAH_Enum DIAH_HWAPP = 0x00000004;
  static const DIAH_Enum DIAH_HWDEFAULT = 0x00000008;
  static const DIAH_Enum DIAH_DEFAULT = 0x00000020;
  static const DIAH_Enum DIAH_ERROR = 0x80000000;
  typedef DWORD DIDFT_Flags; //Alias
  typedef struct DIACTIONA {
    UINT_PTR uAppData;
    DWORD dwSemantic;
    DIA_Flags dwFlags;
    DIACTIONA_u ;
    GUID guidInstance;
    DIDFT_Flags dwObjID;
    DIAH_Enum dwHow;
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
    CHAR tszActionMap_MAX_PATH_;
  } DIACTIONFORMATA;
  typedef DIACTIONFORMATA *LPDIACTIONFORMATA; //Pointer
  typedef union DIACTIONW_u {
    LPCWSTR lptszActionName;
    UINT uResIdString;
  } DIACTIONW_u;
  typedef struct DIACTIONW {
    UINT_PTR uAppData;
    DWORD dwSemantic;
    DIA_Flags dwFlags;
    DIACTIONW_u ;
    GUID guidInstance;
    DIDFT_Flags dwObjID;
    DIAH_Enum dwHow;
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
    WCHAR tszActionMap_MAX_PATH_;
  } DIACTIONFORMATW;
  typedef DIACTIONFORMATW *LPDIACTIONFORMATW; //Pointer
  typedef DWORD DIDC_Flags; //Alias
  typedef struct DIDEVCAPS {
    DWORD dwSize;
    DIDC_Flags dwFlags;
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
  typedef DWORD DIPH_Enum; //Alias
  static const DIPH_Enum DIPH_DEVICE = 0;
  static const DIPH_Enum DIPH_BYOFFSET = 1;
  static const DIPH_Enum DIPH_BYID = 2;
  static const DIPH_Enum DIPH_BYUSAGE = 3;
  typedef struct DIPROPHEADER {
    DWORD dwSize;
    DWORD dwHeaderSize;
    DWORD dwObj;
    DIPH_Enum dwHow;
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
  typedef DWORD DIDOI_Flags; //Alias
  typedef struct DIOBJECTDATAFORMAT {
    GUID* pguid;
    DWORD dwOfs;
    DIDFT_Flags dwType;
    DIDOI_Flags dwFlags;
  } DIOBJECTDATAFORMAT;
  typedef DIOBJECTDATAFORMAT *LPDIOBJECTDATAFORMAT; //Pointer
  typedef DWORD DIDATAFORMAT_Enum; //Alias
  static const DIDATAFORMAT_Enum DIDFT_RELAXIS = 0x00000001;
  static const DIDATAFORMAT_Enum DIDFT_ABSAXIS = 0x00000002;
  typedef struct DIDATAFORMAT {
    DWORD dwSize;
    DWORD dwObjSize;
    DIDATAFORMAT_Enum dwFlags;
    DWORD dwDataSize;
    DWORD dwNumObjs;
    LPDIOBJECTDATAFORMAT rgodf;
  } DIDATAFORMAT;
  typedef DIDATAFORMAT *LPCDIDATAFORMAT; //Pointer
  typedef struct DIDEVICEOBJECTINSTANCEA {
    DWORD dwSize;
    GUID guidType;
    DWORD dwOfs;
    DIDFT_Flags dwType;
    DIDOI_Flags dwFlags;
    CHAR tszName_MAX_PATH_;
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
    DIDFT_Flags dwType;
    DIDOI_Flags dwFlags;
    WCHAR tszName_MAX_PATH_;
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
    CHAR tszInstanceName_MAX_PATH_;
    CHAR tszProductName_MAX_PATH_;
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
    WCHAR tszInstanceName_MAX_PATH_;
    WCHAR tszProductName_MAX_PATH_;
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
  typedef DWORD DIEFF_Flags; //Alias
  typedef DWORD DIEB_Enum; //Alias
  static const DIEB_Enum DIEB_NOTRIGGER = 0xFFFFFFFF;
  typedef struct DIEFFECT {
    DWORD dwSize;
    DIEFF_Flags dwFlags;
    DWORD dwDuration;
    DWORD dwSamplePeriod;
    DWORD dwGain;
    DIEB_Enum dwTriggerButton;
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
  typedef DWORD DIEFT_Flags; //Alias
  typedef DWORD DIEP_Flags; //Alias
  typedef struct DIEFFECTINFOA {
    DWORD dwSize;
    GUID guid;
    DIEFT_Flags dwEffType;
    DIEP_Flags dwStaticParams;
    DIEP_Flags dwDynamicParams;
    CHAR tszName_MAX_PATH_;
  } DIEFFECTINFOA;
  typedef DIEFFECTINFOA *LPDIEFFECTINFOA; //Pointer
  typedef struct DIEFFECTINFOW {
    DWORD dwSize;
    GUID guid;
    DIEFT_Flags dwEffType;
    DIEP_Flags dwStaticParams;
    DIEP_Flags dwDynamicParams;
    WCHAR tszName_MAX_PATH_;
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
    CHAR szFriendlyName_MAX_PATH_;
  } DIFILEEFFECT;
  typedef DIFILEEFFECT *LPDIFILEEFFECT; //Pointer
  typedef DWORD DIDIFT_Flags; //Alias
  typedef DWORD DIDAL_Flags; //Alias
  typedef struct DIDEVICEIMAGEINFOA {
    CHAR tszImagePath_MAX_PATH_;
    DIDIFT_Flags dwFlags;
    DWORD dwViewID;
    RECT rcOverlay;
    DIDFT_Flags dwObjID;
    DWORD dwcValidPts;
    POINT rgptCalloutLine_5_;
    RECT rcCalloutRect;
    DIDAL_Flags dwTextAlign;
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
    WCHAR tszImagePath_MAX_PATH_;
    DIDIFT_Flags dwFlags;
    DWORD dwViewID;
    RECT rcOverlay;
    DIDFT_Flags dwObjID;
    DWORD dwcValidPts;
    POINT rgptCalloutLine_5_;
    RECT rcCalloutRect;
    DIDAL_Flags dwTextAlign;
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
  typedef REFGUID DIPROP; //Alias
  static const DIPROP DIPROP_BUFFERSIZE = 1;
  static const DIPROP DIPROP_AXISMODE = 2;
  static const DIPROP DIPROP_GRANULARITY = 3;
  static const DIPROP DIPROP_RANGE = 4;
  static const DIPROP DIPROP_DEADZONE = 5;
  static const DIPROP DIPROP_SATURATION = 6;
  static const DIPROP DIPROP_FFGAIN = 7;
  static const DIPROP DIPROP_FFLOAD = 8;
  static const DIPROP DIPROP_AUTOCENTER = 9;
  static const DIPROP DIPROP_CALIBRATIONMODE = 10;
  static const DIPROP DIPROP_CALIBRATION = 11;
  static const DIPROP DIPROP_GUIDANDPATH = 12;
  static const DIPROP DIPROP_INSTANCENAME = 13;
  static const DIPROP DIPROP_PRODUCTNAME = 14;
  static const DIPROP DIPROP_JOYSTICKID = 15;
  static const DIPROP DIPROP_GETPORTDISPLAYNAME = 16;
  static const DIPROP DIPROP_PHYSICALRANGE = 18;
  static const DIPROP DIPROP_LOGICALRANGE = 19;
  static const DIPROP DIPROP_KEYNAME = 20;
  static const DIPROP DIPROP_CPOINTS = 21;
  static const DIPROP DIPROP_APPDATA = 22;
  static const DIPROP DIPROP_SCANCODE = 23;
  static const DIPROP DIPROP_VIDPID = 24;
  static const DIPROP DIPROP_USERNAME = 25;
  static const DIPROP DIPROP_TYPENAME = 26;
  typedef DWORD DI8DEV_FILTER; //Alias
  static const DI8DEV_FILTER DI8DEVCLASS_ALL = 0;
  static const DI8DEV_FILTER DI8DEVCLASS_DEVICE = 1;
  static const DI8DEV_FILTER DI8DEVCLASS_POINTER = 2;
  static const DI8DEV_FILTER DI8DEVCLASS_KEYBOARD = 3;
  static const DI8DEV_FILTER DI8DEVCLASS_GAMECTRL = 4;
  static const DI8DEV_FILTER DI8DEVTYPE_DEVICE = 0x11;
  static const DI8DEV_FILTER DI8DEVTYPE_MOUSE = 0x12;
  static const DI8DEV_FILTER DI8DEVTYPE_KEYBOARD = 0x13;
  static const DI8DEV_FILTER DI8DEVTYPE_JOYSTICK = 0x14;
  static const DI8DEV_FILTER DI8DEVTYPE_GAMEPAD = 0x15;
  static const DI8DEV_FILTER DI8DEVTYPE_DRIVING = 0x16;
  static const DI8DEV_FILTER DI8DEVTYPE_FLIGHT = 0x17;
  static const DI8DEV_FILTER DI8DEVTYPE_1STPERSON = 0x18;
  static const DI8DEV_FILTER DI8DEVTYPE_DEVICECTRL = 0x19;
  static const DI8DEV_FILTER DI8DEVTYPE_SCREENPOINTER = 0x1A;
  static const DI8DEV_FILTER DI8DEVTYPE_REMOTE = 0x1B;
  static const DI8DEV_FILTER DI8DEVTYPE_SUPPLEMENTAL = 0x1C;
  typedef DWORD DIEDFL_Flags; //Alias
  typedef DWORD DIEDBSFL_Flags; //Alias
  typedef DWORD DICD_Enum; //Alias
  static const DICD_Enum DICD_DEFAULT = 0x00000000;
  static const DICD_Enum DICD_EDIT = 0x00000001;
  typedef DWORD DIGFFS_Flags; //Alias
  typedef DWORD DISFFC_Flags; //Alias
  typedef DWORD DIFEF_Flags; //Alias
  typedef DWORD DIDBAM_Flags; //Alias
  typedef DWORD DIDSAM_Flags; //Alias
  typedef DWORD DIES_Flags; //Alias
  typedef DWORD DIEGES_Flags; //Alias
  typedef DWORD DISCL_Flags; //Alias
  typedef DWORD DIGDD_Flags; //Alias
]]

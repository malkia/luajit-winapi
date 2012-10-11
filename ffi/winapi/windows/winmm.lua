require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/multimedia' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UINT MCIDEVICEID; //Alias
  typedef LPVOID YIELDPROC; //Alias
  typedef HANDLE HMIDI; //Alias
  typedef HANDLE HMIDIOUT; //Alias
  typedef HMIDIOUT *LPHMIDIOUT; //Pointer
  typedef HANDLE HMIDIIN; //Alias
  typedef HMIDIIN *LPHMIDIIN; //Pointer
  typedef HANDLE HMIDISTRM; //Alias
  typedef HMIDISTRM *LPHMIDISTRM; //Pointer
  typedef HANDLE HMIXER; //Alias
  typedef HMIXER *LPHMIXER; //Pointer
  typedef HMIXER HMIXEROBJ; //Alias
  typedef HANDLE HMMIO; //Alias
  typedef LPVOID LPMMIOPROC; //Alias
  typedef LPVOID HPSTR; //Alias
  typedef HANDLE HWAVEIN; //Alias
  typedef HWAVEIN *LPHWAVEIN; //Pointer
  typedef HANDLE HWAVEOUT; //Alias
  typedef HWAVEOUT *LPHWAVEOUT; //Pointer
  typedef LPVOID LPTIMECALLBACK; //Alias
  typedef UINT MMVERSION; //Alias
  enum { MAXPNAMELEN = 32 };
  enum { MIXER_SHORT_NAME_CHARS = 16 };
  enum { MIXER_LONG_NAME_CHARS = 64 };
  enum { MAX_JOYSTICKOEMVXDNAME = 260 };
  typedef DWORD WAVE_FORMAT; //Alias
  typedef WORD AUXCAPS_TECH; //Alias
  static const AUXCAPS_TECH AUXCAPS_CDAUDIO = 1;
  static const AUXCAPS_TECH AUXCAPS_AUXIN = 2;
  typedef DWORD AUXCAPS_SUPPORT; //Alias
# pragma pack( push, 1 )
  typedef struct AUXCAPS {
    WORD wMid;
    WORD wPid;
    MMVERSION vDriverVersion;
    TCHAR szPname[MAXPNAMELEN];
    AUXCAPS_TECH wTechnology;
    WORD wReserved1;
    AUXCAPS_SUPPORT dwSupport;
  } AUXCAPS;
# pragma pack( pop )
  typedef AUXCAPS *LPAUXCAPS; //Pointer
  typedef UINT JOYCAPS_FLAGS; //Alias
# pragma pack( push, 1 )
  typedef struct JOYCAPS {
    WORD wMid;
    WORD wPid;
    TCHAR szPname[MAXPNAMELEN];
    UINT wXmin;
    UINT wXmax;
    UINT wYmin;
    UINT wYmax;
    UINT wZmin;
    UINT wZmax;
    UINT wNumButtons;
    UINT wPeriodMin;
    UINT wPeriodMax;
    UINT wRmin;
    UINT wRmax;
    UINT wUmin;
    UINT wUmax;
    UINT wVmin;
    UINT wVmax;
    JOYCAPS_FLAGS wCaps;
    UINT wMaxAxes;
    UINT wNumAxes;
    UINT wMaxButtons;
    TCHAR szRegKey[MAXPNAMELEN];
    TCHAR szOEMVxD[MAX_JOYSTICKOEMVXDNAME];
  } JOYCAPS;
# pragma pack( pop )
  typedef JOYCAPS *LPJOYCAPS; //Pointer
  typedef DWORD MIDIHDR_FLAGS; //Alias
# pragma pack( push, 1 )
  typedef struct MIDIHDR {
    LPVOID lpData;
    DWORD dwBufferLength;
    DWORD dwBytesRecorded;
    DWORD_PTR dwUser;
    MIDIHDR_FLAGS dwFlags;
    LPVOID lpNext;
    DWORD_PTR reserved;
    DWORD dwOffset;
    DWORD_PTR dwReserved[8];
  } MIDIHDR;
# pragma pack( pop )
  typedef MIDIHDR *LPMIDIHDR; //Pointer
# pragma pack( push, 1 )
  typedef struct MIDIINCAPS {
    WORD wMid;
    WORD wPid;
    MMVERSION vDriverVersion;
    TCHAR szPname[MAXPNAMELEN];
    DWORD dwSupport;
  } MIDIINCAPS;
# pragma pack( pop )
  typedef MIDIINCAPS *LPMIDIINCAPS; //Pointer
  typedef WORD MIDIOUTCAPS_TECH; //Alias
  static const MIDIOUTCAPS_TECH MOD_MIDIPORT = 1;
  static const MIDIOUTCAPS_TECH MOD_SYNTH = 2;
  static const MIDIOUTCAPS_TECH MOD_SQSYNTH = 3;
  static const MIDIOUTCAPS_TECH MOD_FMSYNTH = 4;
  static const MIDIOUTCAPS_TECH MOD_MAPPER = 5;
  static const MIDIOUTCAPS_TECH MOD_WAVETABLE = 6;
  static const MIDIOUTCAPS_TECH MOD_SWSYNTH = 7;
  typedef DWORD MIDICAPS_FLAGS; //Alias
# pragma pack( push, 1 )
  typedef struct MIDIOUTCAPS {
    WORD wMid;
    WORD wPid;
    MMVERSION vDriverVersion;
    TCHAR szPname[MAXPNAMELEN];
    MIDIOUTCAPS_TECH wTechnology;
    WORD wVoices;
    WORD wNotes;
    WORD wChannelMask;
    MIDICAPS_FLAGS dwSupport;
  } MIDIOUTCAPS;
# pragma pack( pop )
  typedef MIDIOUTCAPS *LPMIDIOUTCAPS; //Pointer
# pragma pack( push, 1 )
  typedef union MIXERCONTROLDETAILS_u {
    HWND hwndOwner;
    DWORD cMultipleItems;
  } MIXERCONTROLDETAILS_u;
# pragma pack( pop )
# pragma pack( push, 1 )
  typedef struct MIXERCONTROLDETAILS {
    DWORD cbStruct;
    DWORD dwControlID;
    DWORD cChannels;
    MIXERCONTROLDETAILS_u ;
    DWORD cbDetails;
    LPVOID paDetails;
  } MIXERCONTROLDETAILS;
# pragma pack( pop )
  typedef MIXERCONTROLDETAILS *LPMIXERCONTROLDETAILS; //Pointer
# pragma pack( push, 1 )
  typedef struct MIXERCAPS {
    WORD wMid;
    WORD wPid;
    MMVERSION vDriverVersion;
    TCHAR szPname[MAXPNAMELEN];
    DWORD fdwSupport;
    DWORD cDestinations;
  } MIXERCAPS;
# pragma pack( pop )
  typedef MIXERCAPS *LPMIXERCAPS; //Pointer
# pragma pack( push, 1 )
  typedef union MIXERLINECONTROLS_u {
    DWORD dwControlID;
    DWORD dwControlType;
  } MIXERLINECONTROLS_u;
# pragma pack( pop )
# pragma pack( push, 1 )
  typedef struct MIXERCONTROL_u1_s1 {
    LONG lMinimum;
    LONG lMaximum;
  } MIXERCONTROL_u1_s1;
# pragma pack( pop )
# pragma pack( push, 1 )
  typedef struct MIXERCONTROL_u1_s2 {
    DWORD dwMinimum;
    DWORD dwMaximum;
  } MIXERCONTROL_u1_s2;
# pragma pack( pop )
# pragma pack( push, 1 )
  typedef union MIXERCONTROL_u1 {
    MIXERCONTROL_u1_s1 ;
    MIXERCONTROL_u1_s2 ;
    DWORD dwReserved[6];
  } MIXERCONTROL_u1;
# pragma pack( pop )
# pragma pack( push, 1 )
  typedef union MIXERCONTROL_u2 {
    DWORD cSteps;
    DWORD cbCustomData;
    DWORD dwReserved[6];
  } MIXERCONTROL_u2;
# pragma pack( pop )
  typedef DWORD MIXERCONTROL_CT_CLASS; //Alias
  static const MIXERCONTROL_CT_CLASS MIXERCONTROL_CT_CLASS_CUSTOM = 0x00000000;
  static const MIXERCONTROL_CT_CLASS MIXERCONTROL_CT_CLASS_METER = 0x10000000;
  static const MIXERCONTROL_CT_CLASS MIXERCONTROL_CT_CLASS_SWITCH = 0x20000000;
  static const MIXERCONTROL_CT_CLASS MIXERCONTROL_CT_CLASS_NUMBER = 0x30000000;
  static const MIXERCONTROL_CT_CLASS MIXERCONTROL_CT_CLASS_SLIDER = 0x40000000;
  static const MIXERCONTROL_CT_CLASS MIXERCONTROL_CT_CLASS_FADER = 0x50000000;
  static const MIXERCONTROL_CT_CLASS MIXERCONTROL_CT_CLASS_TIME = 0x60000000;
  static const MIXERCONTROL_CT_CLASS MIXERCONTROL_CT_CLASS_LIST = 0x70000000;
  typedef DWORD MIXERCONTROL_CONTROLF; //Alias
# pragma pack( push, 1 )
  typedef struct MIXERCONTROL {
    DWORD cbStruct;
    DWORD dwControlID;
    MIXERCONTROL_CT_CLASS dwControlType;
    MIXERCONTROL_CONTROLF fdwControl;
    DWORD cMultipleItems;
    TCHAR szShortName[MIXER_SHORT_NAME_CHARS];
    TCHAR szName[MIXER_LONG_NAME_CHARS];
    MIXERCONTROL_u1 Bounds;
    MIXERCONTROL_u2 Metrics;
  } MIXERCONTROL;
# pragma pack( pop )
  typedef MIXERCONTROL *LPMIXERCONTROL; //Pointer
# pragma pack( push, 1 )
  typedef struct MIXERLINECONTROLS {
    DWORD cbStruct;
    DWORD dwLineID;
    MIXERLINECONTROLS_u ;
    DWORD cControls;
    DWORD cbmxctrl;
    LPMIXERCONTROL pamxctrl;
  } MIXERLINECONTROLS;
# pragma pack( pop )
  typedef MIXERLINECONTROLS *LPMIXERLINECONTROLS; //Pointer
  typedef DWORD MIXERLINE_LINEF; //Alias
  typedef DWORD MIXERLINE_COMPONENTTYPE; //Alias
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_DST_UNDEFINED = 0;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_DST_DIGITAL = 1;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_DST_LINE = 2;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_DST_MONITOR = 3;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_DST_SPEAKERS = 4;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_DST_HEADPHONES = 5;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_DST_TELEPHONE = 6;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_DST_WAVEIN = 7;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_DST_VOICEIN = 8;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_SRC_UNDEFINED = 0x00001000;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_SRC_DIGITAL = 0x00001001;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_SRC_LINE = 0x00001002;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_SRC_MICROPHONE = 0x00001003;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_SRC_SYNTHESIZER = 0x00001004;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_SRC_COMPACTDISC = 0x00001005;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_SRC_TELEPHONE = 0x00001006;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_SRC_PCSPEAKER = 0x00001007;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_SRC_WAVEOUT = 0x00001008;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_SRC_AUXILIARY = 0x00001009;
  static const MIXERLINE_COMPONENTTYPE MIXERLINE_COMPONENTTYPE_SRC_ANALOG = 0x0000100A;
  typedef DWORD MIXERLINE_TARGETTYPE; //Alias
  static const MIXERLINE_TARGETTYPE MIXERLINE_TARGETTYPE_UNDEFINED = 0;
  static const MIXERLINE_TARGETTYPE MIXERLINE_TARGETTYPE_WAVEOUT = 1;
  static const MIXERLINE_TARGETTYPE MIXERLINE_TARGETTYPE_WAVEIN = 2;
  static const MIXERLINE_TARGETTYPE MIXERLINE_TARGETTYPE_MIDIOUT = 3;
  static const MIXERLINE_TARGETTYPE MIXERLINE_TARGETTYPE_MIDIIN = 4;
  static const MIXERLINE_TARGETTYPE MIXERLINE_TARGETTYPE_AUX = 5;
# pragma pack( push, 1 )
  typedef struct MIXERLINE_s {
    MIXERLINE_TARGETTYPE dwType;
    DWORD dwDeviceID;
    WORD wMid;
    WORD wPid;
    MMVERSION vDriverVersion;
    TCHAR szPname[MAXPNAMELEN];
  } MIXERLINE_s;
# pragma pack( pop )
# pragma pack( push, 1 )
  typedef struct MIXERLINE {
    DWORD cbStruct;
    DWORD dwDestination;
    DWORD dwSource;
    DWORD dwLineID;
    MIXERLINE_LINEF fdwLine;
    DWORD_PTR dwUser;
    MIXERLINE_COMPONENTTYPE dwComponentType;
    DWORD cChannels;
    DWORD cConnections;
    DWORD cControls;
    TCHAR szShortName[MIXER_SHORT_NAME_CHARS];
    TCHAR szName[MIXER_LONG_NAME_CHARS];
    MIXERLINE_s Target;
  } MIXERLINE;
# pragma pack( pop )
  typedef MIXERLINE *LPMIXERLINE; //Pointer
  typedef DWORD MMIOINFO_FLAGS; //Alias
# pragma pack( push, 1 )
  typedef struct MMIOINFO {
    MMIOINFO_FLAGS dwFlags;
    FOURCC fccIOProc;
    LPMMIOPROC pIOProc;
    UINT wErrorRet;
    HTASK htask;
    LONG cchBuffer;
    HPSTR pchBuffer;
    HPSTR pchNext;
    HPSTR pchEndRead;
    HPSTR pchEndWrite;
    LONG lBufOffset;
    LONG lDiskOffset;
    DWORD adwInfo[3];
    DWORD dwReserved1;
    DWORD dwReserved2;
    HMMIO hmmio;
  } MMIOINFO;
# pragma pack( pop )
  typedef MMIOINFO *LPMMIOINFO; //Pointer
  typedef MMIOINFO *LPMMIOINFO; //Pointer
  typedef DWORD WHDR_FLAGS; //Alias
# pragma pack( push, 1 )
  typedef struct WAVEHDR {
    LPVOID lpData;
    DWORD dwBufferLength;
    DWORD dwBytesRecorded;
    DWORD_PTR dwUser;
    WHDR_FLAGS dwFlags;
    DWORD dwLoops;
    LPVOID lpNext;
    DWORD_PTR reserved;
  } WAVEHDR;
# pragma pack( pop )
  typedef WAVEHDR *LPWAVEHDR; //Pointer
# pragma pack( push, 1 )
  typedef struct WAVEINCAPS {
    WORD wMid;
    WORD wPid;
    MMVERSION vDriverVersion;
    TCHAR szPname[MAXPNAMELEN];
    WAVE_FORMAT dwFormats;
    WORD wChannels;
    WORD wReserved1;
  } WAVEINCAPS;
# pragma pack( pop )
  typedef WAVEINCAPS *LPWAVEINCAPS; //Pointer
  typedef DWORD WAVEOUTCAPS_SUPPORT; //Alias
# pragma pack( push, 1 )
  typedef struct WAVEOUTCAPS {
    WORD wMid;
    WORD wPid;
    MMVERSION vDriverVersion;
    TCHAR szPname[MAXPNAMELEN];
    WAVE_FORMAT dwFormats;
    WORD wChannels;
    WORD wReserved1;
    WAVEOUTCAPS_SUPPORT dwSupport;
  } WAVEOUTCAPS;
# pragma pack( pop )
  typedef WAVEOUTCAPS *LPWAVEOUTCAPS; //Pointer
  typedef UINT JoyButton; //Alias
# pragma pack( push, 1 )
  typedef struct JOYINFO {
    UINT wXpos;
    UINT wYpos;
    UINT wZpos;
    JoyButton wButtons;
  } JOYINFO;
# pragma pack( pop )
  typedef JOYINFO *LPJOYINFO; //Pointer
  typedef DWORD JoyPov; //Alias
  static const JoyPov JOY_POVCENTERED = 0xFFFF;
  static const JoyPov JOY_POVFORWARD = 0;
  static const JoyPov JOY_POVRIGHT = 9000;
  static const JoyPov JOY_POVBACKWARD = 18000;
  static const JoyPov JOY_POVLEFT = 27000;
  typedef DWORD JoyButtonAll; //Alias
  typedef DWORD JOYINFOEX_Flags; //Alias
# pragma pack( push, 1 )
  typedef struct JOYINFOEX {
    DWORD dwSize;
    JOYINFOEX_Flags dwFlags;
    DWORD dwXpos;
    DWORD dwYpos;
    DWORD dwZpos;
    DWORD dwRpos;
    DWORD dwUpos;
    DWORD dwVpos;
    JoyButtonAll dwButtons;
    DWORD dwButtonNumber;
    JoyPov dwPOV;
    DWORD dwReserved1;
    DWORD dwReserved2;
  } JOYINFOEX;
# pragma pack( pop )
  typedef JOYINFOEX *LPJOYINFOEX; //Pointer
  typedef DWORD MMCKINFO_Flags; //Alias
# pragma pack( push, 1 )
  typedef struct MMCKINFO {
    FOURCC ckid;
    DWORD cksize;
    FOURCC fccType;
    DWORD dwDataOffset;
    MMCKINFO_Flags dwFlags;
  } MMCKINFO;
# pragma pack( pop )
  typedef MMCKINFO *LPMMCKINFO; //Pointer
# pragma pack( push, 1 )
  typedef struct TIMECAPS {
    UINT wPeriodMin;
    UINT wPeriodMax;
  } TIMECAPS;
# pragma pack( pop )
  typedef TIMECAPS *LPTIMECAPS; //Pointer
  typedef DWORD MCIERROR; //Alias
  static const MCIERROR MCIERR_INVALID_DEVICE_ID = 257;
  static const MCIERROR MCIERR_UNRECOGNIZED_KEYWORD = 259;
  static const MCIERROR MCIERR_UNRECOGNIZED_COMMAND = 261;
  static const MCIERROR MCIERR_HARDWARE = 262;
  static const MCIERROR MCIERR_INVALID_DEVICE_NAME = 263;
  static const MCIERROR MCIERR_OUT_OF_MEMORY = 264;
  static const MCIERROR MCIERR_DEVICE_OPEN = 265;
  static const MCIERROR MCIERR_CANNOT_LOAD_DRIVER = 266;
  static const MCIERROR MCIERR_MISSING_COMMAND_STRING = 267;
  static const MCIERROR MCIERR_PARAM_OVERFLOW = 268;
  static const MCIERROR MCIERR_MISSING_STRING_ARGUMENT = 269;
  static const MCIERROR MCIERR_BAD_INTEGER = 270;
  static const MCIERROR MCIERR_PARSER_INTERNAL = 271;
  static const MCIERROR MCIERR_DRIVER_INTERNAL = 272;
  static const MCIERROR MCIERR_MISSING_PARAMETER = 273;
  static const MCIERROR MCIERR_UNSUPPORTED_FUNCTION = 274;
  static const MCIERROR MCIERR_FILE_NOT_FOUND = 275;
  static const MCIERROR MCIERR_DEVICE_NOT_READY = 276;
  static const MCIERROR MCIERR_INTERNAL = 277;
  static const MCIERROR MCIERR_DRIVER = 278;
  static const MCIERROR MCIERR_CANNOT_USE_ALL = 279;
  static const MCIERROR MCIERR_MULTIPLE = 280;
  static const MCIERROR MCIERR_EXTENSION_NOT_FOUND = 281;
  static const MCIERROR MCIERR_OUTOFRANGE = 282;
  static const MCIERROR MCIERR_FLAGS_NOT_COMPATIBLE = 284;
  static const MCIERROR MCIERR_FILE_NOT_SAVED = 286;
  static const MCIERROR MCIERR_DEVICE_TYPE_REQUIRED = 287;
  static const MCIERROR MCIERR_DEVICE_LOCKED = 288;
  static const MCIERROR MCIERR_DUPLICATE_ALIAS = 289;
  static const MCIERROR MCIERR_BAD_CONSTANT = 290;
  static const MCIERROR MCIERR_MUST_USE_SHAREABLE = 291;
  static const MCIERROR MCIERR_MISSING_DEVICE_NAME = 292;
  static const MCIERROR MCIERR_BAD_TIME_FORMAT = 293;
  static const MCIERROR MCIERR_NO_CLOSING_QUOTE = 294;
  static const MCIERROR MCIERR_DUPLICATE_FLAGS = 295;
  static const MCIERROR MCIERR_INVALID_FILE = 296;
  static const MCIERROR MCIERR_NULL_PARAMETER_BLOCK = 297;
  static const MCIERROR MCIERR_UNNAMED_RESOURCE = 298;
  static const MCIERROR MCIERR_NEW_REQUIRES_ALIAS = 299;
  static const MCIERROR MCIERR_NOTIFY_ON_AUTO_OPEN = 300;
  static const MCIERROR MCIERR_NO_ELEMENT_ALLOWED = 301;
  static const MCIERROR MCIERR_NONAPPLICABLE_FUNCTION = 302;
  static const MCIERROR MCIERR_ILLEGAL_FOR_AUTO_OPEN = 303;
  static const MCIERROR MCIERR_FILENAME_REQUIRED = 304;
  static const MCIERROR MCIERR_EXTRA_CHARACTERS = 305;
  static const MCIERROR MCIERR_DEVICE_NOT_INSTALLED = 306;
  static const MCIERROR MCIERR_GET_CD = 307;
  static const MCIERROR MCIERR_SET_CD = 308;
  static const MCIERROR MCIERR_SET_DRIVE = 309;
  static const MCIERROR MCIERR_DEVICE_LENGTH = 310;
  static const MCIERROR MCIERR_DEVICE_ORD_LENGTH = 311;
  static const MCIERROR MCIERR_NO_INTEGER = 312;
  static const MCIERROR MCIERR_WAVE_OUTPUTSINUSE = 320;
  static const MCIERROR MCIERR_WAVE_SETOUTPUTINUSE = 321;
  static const MCIERROR MCIERR_WAVE_INPUTSINUSE = 322;
  static const MCIERROR MCIERR_WAVE_SETINPUTINUSE = 323;
  static const MCIERROR MCIERR_WAVE_OUTPUTUNSPECIFIED = 324;
  static const MCIERROR MCIERR_WAVE_INPUTUNSPECIFIED = 325;
  static const MCIERROR MCIERR_WAVE_OUTPUTSUNSUITABLE = 326;
  static const MCIERROR MCIERR_WAVE_SETOUTPUTUNSUITABLE = 327;
  static const MCIERROR MCIERR_WAVE_INPUTSUNSUITABLE = 328;
  static const MCIERROR MCIERR_WAVE_SETINPUTUNSUITABLE = 329;
  static const MCIERROR MCIERR_SEQ_DIV_INCOMPATIBLE = 336;
  static const MCIERROR MCIERR_SEQ_PORT_INUSE = 337;
  static const MCIERROR MCIERR_SEQ_PORT_NONEXISTENT = 338;
  static const MCIERROR MCIERR_SEQ_PORT_MAPNODEVICE = 339;
  static const MCIERROR MCIERR_SEQ_PORT_MISCERROR = 340;
  static const MCIERROR MCIERR_SEQ_TIMER = 341;
  static const MCIERROR MCIERR_SEQ_PORTUNSPECIFIED = 342;
  static const MCIERROR MCIERR_SEQ_NOMIDIPRESENT = 343;
  static const MCIERROR MCIERR_NO_WINDOW = 346;
  static const MCIERROR MCIERR_CREATEWINDOW = 347;
  static const MCIERROR MCIERR_FILE_READ = 348;
  static const MCIERROR MCIERR_FILE_WRITE = 349;
  static const MCIERROR MCIERR_NO_IDENTITY = 350;
  typedef DWORD waveInOutOpenFlags; //Alias
  typedef DWORD midiInOutOpenFlags; //Alias
  typedef DWORD mmioInstallIOProcFlags; //Alias
  typedef UINT mmioCloseFlags; //Alias
  typedef UINT mmioFlushFlags; //Alias
  typedef UINT mmioStringToFOURCCFlags; //Alias
  typedef UINT mmioDescendFlags; //Alias
  typedef UINT mmioCreateChunkFlags; //Alias
  typedef int mmioSeekOffset; //Alias
  typedef struct MMTIME_u_s1 {
    BYTE hour;
    BYTE min;
    BYTE sec;
    BYTE frame;
    BYTE fps;
    BYTE dummy;
    BYTE pad[2];
  } MMTIME_u_s1;
  typedef struct MMTIME_u_s2 {
    DWORD songptrpos;
  } MMTIME_u_s2;
  typedef union MMTIME_u {
    DWORD ms;
    DWORD sample;
    DWORD cb;
    DWORD ticks;
    MMTIME_u_s1 smpte;
    MMTIME_u_s2 midi;
  } MMTIME_u;
  typedef UINT MMTIME_TYPE; //Alias
  static const MMTIME_TYPE TIME_MS = 0x0001;
  static const MMTIME_TYPE TIME_SAMPLES = 0x0002;
  static const MMTIME_TYPE TIME_BYTES = 0x0004;
  static const MMTIME_TYPE TIME_SMPTE = 0x0008;
  static const MMTIME_TYPE TIME_MIDI = 0x0010;
  static const MMTIME_TYPE TIME_TICKS = 0x0020;
  typedef struct MMTIME {
    MMTIME_TYPE wType;
    MMTIME_u u;
  } MMTIME;
  typedef MMTIME *LPMMTIME; //Pointer
  MMRESULT    auxGetDevCaps(               UINT_PTR uDeviceID, LPAUXCAPS lpCaps, UINT cbCaps);
  UINT        auxGetNumDevs(               );
  MMRESULT    auxGetVolume(                UINT uDeviceID, LPDWORD lpdwVolume);
  MMRESULT    auxOutMessage(               UINT uDeviceID, UINT uMsg, DWORD_PTR dwParam1, DWORD_PTR dwParam2);
  MMRESULT    auxSetVolume(                UINT uDeviceID, DWORD dwVolume);
  MMRESULT    joyConfigChanged(            DWORD dwFlags);
  MMRESULT    joyGetDevCaps(               UINT_PTR uJoyID, LPJOYCAPS pjc, UINT cbjc);
  UINT        joyGetNumDevs(               );
  MMRESULT    joyGetPos(                   UINT uJoyID, LPJOYINFO pji);
  MMRESULT    joyGetPosEx(                 UINT uJoyID, LPJOYINFOEX pji);
  MMRESULT    joyGetThreshold(             UINT uJoyID, LPUINT puThreshold);
  MMRESULT    joyReleaseCapture(           UINT uJoyID);
  MMRESULT    joySetCapture(               HWND hwnd, UINT uJoyID, UINT uPeriod, BOOL fChanged);
  MMRESULT    joySetThreshold(             UINT uJoyID, UINT uThreshold);
  BOOL        mciExecute(                  LPCSTR pszCommand);
  HANDLE      mciGetCreatorTask(           MCIDEVICEID IDDevice);
  MCIDEVICEID mciGetDeviceID(              LPCTSTR lpszDevice);
  MCIDEVICEID mciGetDeviceIDFromElementID( DWORD dwElementID, LPCTSTR lpstrType);
  BOOL        mciGetErrorString(           DWORD fdwError, LPTSTR lpszErrorText, UINT cchErrorText);
  YIELDPROC   mciGetYieldProc(             MCIDEVICEID IDDevice, LPDWORD lpdwYieldData);
  MCIERROR    mciSendCommand(              MCIDEVICEID IDDevice, UINT uMsg, DWORD fdwCommand, DWORD_PTR dwParam);
  MCIERROR    mciSendString(               LPCTSTR lpszCommand, LPTSTR lpszReturnString, UINT cchReturn, HANDLE hwndCallback);
  UINT        mciSetYieldProc(             MCIDEVICEID IDDevice, YIELDPROC yp, DWORD dwYieldData);
  MMRESULT    midiConnect(                 HMIDI hMidi, HMIDIOUT hmo, LPVOID pReserved);
  MMRESULT    midiDisconnect(              HMIDI hMidi, HMIDIOUT hmo, LPVOID pReserved);
  MMRESULT    midiInAddBuffer(             HMIDIIN hMidiIn, LPMIDIHDR lpMidiInHdr, UINT cbMidiInHdr);
  MMRESULT    midiInClose(                 HMIDIIN hMidiIn);
  MMRESULT    midiInGetDevCaps(            UINT_PTR uDeviceID, LPMIDIINCAPS lpMidiInCaps, UINT cbMidiInCaps);
  MMRESULT    midiInGetErrorText(          MMRESULT wError, LPTSTR lpText, UINT cchText);
  MMRESULT    midiInGetID(                 HMIDIIN hmi, LPUINT puDeviceID);
  UINT        midiInGetNumDevs(            );
  MMRESULT    midiInMessage(               HMIDIIN deviceID, UINT msg, DWORD_PTR dw1, DWORD_PTR dw2);
  MMRESULT    midiInOpen(                  LPHMIDIIN lphMidiIn, UINT_PTR uDeviceID, DWORD_PTR dwCallback, DWORD_PTR dwCallbackInstance, midiInOutOpenFlags dwFlags);
  MMRESULT    midiInPrepareHeader(         HMIDIIN hMidiIn, LPMIDIHDR lpMidiInHdr, UINT cbMidiInHdr);
  MMRESULT    midiInReset(                 HMIDIIN hMidiIn);
  MMRESULT    midiInStart(                 HMIDIIN hMidiIn);
  MMRESULT    midiInStop(                  HMIDIIN hMidiIn);
  MMRESULT    midiInUnprepareHeader(       HMIDIIN hMidiIn, LPMIDIHDR lpMidiInHdr, UINT cbMidiInHdr);
  MMRESULT    midiOutCacheDrumPatches(     HMIDIOUT hmo, UINT wPatch, WORD* lpKeyArray, UINT wFlags);
  MMRESULT    midiOutCachePatches(         HMIDIOUT hmo, UINT wBank, WORD* lpPatchArray, UINT wFlags);
  MMRESULT    midiOutClose(                HMIDIOUT hmo);
  MMRESULT    midiOutGetDevCaps(           UINT_PTR uDeviceID, LPMIDIOUTCAPS lpMidiOutCaps, UINT cbMidiOutCaps);
  UINT        midiOutGetErrorText(         MMRESULT mmrError, LPTSTR lpText, UINT cchText);
  MMRESULT    midiOutGetID(                HMIDIOUT hmo, LPUINT puDeviceID);
  UINT        midiOutGetNumDevs(           );
  MMRESULT    midiOutGetVolume(            HMIDIOUT hmo, LPDWORD lpdwVolume);
  MMRESULT    midiOutLongMsg(              HMIDIOUT hmo, LPMIDIHDR lpMidiOutHdr, UINT cbMidiOutHdr);
  MMRESULT    midiOutMessage(              HMIDIOUT deviceID, UINT msg, DWORD_PTR dw1, DWORD_PTR dw2);
  MMRESULT    midiOutOpen(                 LPHMIDIOUT lphmo, UINT_PTR uDeviceID, DWORD_PTR dwCallback, DWORD_PTR dwCallbackInstance, midiInOutOpenFlags dwFlags);
  MMRESULT    midiOutPrepareHeader(        HMIDIOUT hmo, LPMIDIHDR lpMidiOutHdr, UINT cbMidiOutHdr);
  MMRESULT    midiOutReset(                HMIDIOUT hmo);
  MMRESULT    midiOutSetVolume(            HMIDIOUT hmo, DWORD dwVolume);
  MMRESULT    midiOutShortMsg(             HMIDIOUT hmo, DWORD dwMsg);
  MMRESULT    midiOutUnprepareHeader(      HMIDIOUT hmo, LPMIDIHDR lpMidiOutHdr, UINT cbMidiOutHdr);
  MMRESULT    midiStreamClose(             HMIDISTRM hStream);
  MMRESULT    midiStreamOpen(              LPHMIDISTRM lphStream, LPUINT puDeviceID, DWORD cMidi, DWORD_PTR dwCallback, DWORD_PTR dwInstance, DWORD fdwOpen);
  MMRESULT    midiStreamOut(               HMIDISTRM hMidiStream, LPMIDIHDR lpMidiHdr, UINT cbMidiHdr);
  MMRESULT    midiStreamPause(             HMIDISTRM hms);
  MMRESULT    midiStreamPosition(          HMIDISTRM hms, LPMMTIME pmmt, UINT cbmmt);
  MMRESULT    midiStreamProperty(          HMIDISTRM hm, LPBYTE lppropdata, DWORD dwProperty);
  MMRESULT    midiStreamRestart(           HMIDISTRM hms);
  MMRESULT    midiStreamStop(              HMIDISTRM hms);
  MMRESULT    mixerClose(                  HMIXER hmx);
  MMRESULT    mixerGetControlDetails(      HMIXEROBJ hmxobj, LPMIXERCONTROLDETAILS pmxcd, DWORD fdwDetails);
  MMRESULT    mixerGetDevCaps(             UINT_PTR uMxId, LPMIXERCAPS pmxcaps, UINT cbmxcaps);
  MMRESULT    mixerGetID(                  HMIXEROBJ hmxobj, UINT* puMxId, DWORD fdwId);
  MMRESULT    mixerGetLineControls(        HMIXEROBJ hmxobj, LPMIXERLINECONTROLS pmxlc, DWORD fdwControls);
  MMRESULT    mixerGetLineInfo(            HMIXEROBJ hmxobj, LPMIXERLINE pmxl, DWORD fdwInfo);
  UINT        mixerGetNumDevs(             );
  DWORD       mixerMessage(                HMIXER driverID, UINT uMsg, DWORD_PTR dwParam1, DWORD_PTR dwParam2);
  MMRESULT    mixerOpen(                   LPHMIXER phmx, UINT uMxId, DWORD_PTR dwCallback, DWORD_PTR dwInstance, DWORD fdwOpen);
  MMRESULT    mixerSetControlDetails(      HMIXEROBJ hmxobj, LPMIXERCONTROLDETAILS pmxcd, DWORD fdwDetails);
  MMRESULT    mmioAdvance(                 HMMIO hmmio, LPMMIOINFO lpmmioinfo, UINT wFlags);
  MMRESULT    mmioAscend(                  HMMIO hmmio, LPMMCKINFO lpck, UINT wFlags);
  MMRESULT    mmioClose(                   HMMIO hmmio, mmioCloseFlags wFlags);
  MMRESULT    mmioCreateChunk(             HMMIO hmmio, LPMMCKINFO lpck, mmioCreateChunkFlags wFlags);
  MMRESULT    mmioDescend(                 HMMIO hmmio, LPMMCKINFO lpck, LPMMCKINFO lpckParent, mmioDescendFlags wFlags);
  MMRESULT    mmioFlush(                   HMMIO hmmio, mmioFlushFlags fuFlush);
  MMRESULT    mmioGetInfo(                 HMMIO hmmio, LPMMIOINFO lpmmioinfo, UINT wFlags);
  LPMMIOPROC  mmioInstallIOProc(           FOURCC fccIOProc, LPMMIOPROC pIOProc, mmioInstallIOProcFlags dwFlags);
  HMMIO       mmioOpen(                    LPTSTR szFilename, LPMMIOINFO lpmmioinfo, DWORD dwOpenFlags);
  LONG        mmioRead(                    HMMIO hmmio, HPSTR pch, LONG cch);
  MMRESULT    mmioRename(                  LPCTSTR szFilename, LPCTSTR szNewFilename, LPMMIOINFO lpmmioinfo, DWORD dwRenameFlags);
  LONG        mmioSeek(                    HMMIO hmmio, LONG lOffset, mmioSeekOffset iOrigin);
  LRESULT     mmioSendMessage(             HMMIO hmmio, UINT wMsg, LPARAM lParam1, LPARAM lParam2);
  MMRESULT    mmioSetBuffer(               HMMIO hmmio, LPSTR pchBuffer, LONG cchBuffer, UINT wFlags);
  MMRESULT    mmioSetInfo(                 HMMIO hmmio, LPMMIOINFO lpmmioinfo, UINT wFlags);
  FOURCC      mmioStringToFOURCC(          LPCTSTR sz, mmioStringToFOURCCFlags wFlags);
  LONG        mmioWrite(                   HMMIO hmmio, LPVOID_char* pch, LONG cch);
  BOOL        PlaySound(                   LPCTSTR pszSound, HMODULE hmod, DWORD fdwSound);
  BOOL        sndPlaySound(                LPCTSTR lpszSound, UINT fuSound);
  MMRESULT    timeBeginPeriod(             UINT uPeriod);
  MMRESULT    timeEndPeriod(               UINT uPeriod);
  MMRESULT    timeGetDevCaps(              LPTIMECAPS ptc, UINT cbtc);
  MMRESULT    timeGetSystemTime(           LPMMTIME pmmt, UINT cbmmt);
  DWORD       timeGetTime(                 );
  MMRESULT    timeKillEvent(               UINT uTimerID);
  MMRESULT    timeSetEvent(                UINT uDelay, UINT uResolution, LPTIMECALLBACK lpTimeProc, DWORD_PTR dwUser, UINT fuEvent);
  MMRESULT    waveInAddBuffer(             HWAVEIN hwi, LPWAVEHDR pwh, UINT cbwh);
  MMRESULT    waveInClose(                 HWAVEIN hwi);
  MMRESULT    waveInGetDevCaps(            UINT_PTR uDeviceID, LPWAVEINCAPS pwic, UINT cbwic);
  MMRESULT    waveInGetErrorText(          MMRESULT mmrError, LPTSTR pszText, UINT cchText);
  MMRESULT    waveInGetID(                 HWAVEIN hwi, LPUINT puDeviceID);
  UINT        waveInGetNumDevs(            );
  MMRESULT    waveInGetPosition(           HWAVEIN hwi, LPMMTIME pmmt, UINT cbmmt);
  MMRESULT    waveInMessage(               HWAVEIN deviceID, UINT uMsg, DWORD_PTR dwParam1, DWORD_PTR dwParam2);
  MMRESULT    waveInOpen(                  LPHWAVEIN phwi, UINT_PTR uDeviceID, LPWAVEFORMATEX pwfx, DWORD_PTR dwCallback, DWORD_PTR dwCallbackInstance, waveInOutOpenFlags fdwOpen);
  MMRESULT    waveInPrepareHeader(         HWAVEIN hwi, LPWAVEHDR pwh, UINT cbwh);
  MMRESULT    waveInReset(                 HWAVEIN hwi);
  MMRESULT    waveInStart(                 HWAVEIN hwi);
  MMRESULT    waveInStop(                  HWAVEIN hwi);
  MMRESULT    waveInUnprepareHeader(       HWAVEIN hwi, LPWAVEHDR pwh, UINT cbwh);
  MMRESULT    waveOutBreakLoop(            HWAVEOUT hwo);
  MMRESULT    waveOutClose(                HWAVEOUT hwo);
  MMRESULT    waveOutGetDevCaps(           UINT_PTR uDeviceID, LPWAVEOUTCAPS pwoc, UINT cbwoc);
  MMRESULT    waveOutGetErrorText(         MMRESULT mmrError, LPTSTR pszText, UINT cchText);
  MMRESULT    waveOutGetID(                HWAVEOUT hwo, LPUINT puDeviceID);
  UINT        waveOutGetNumDevs(           );
  MMRESULT    waveOutGetPitch(             HWAVEOUT hwo, LPDWORD pdwPitch);
  MMRESULT    waveOutGetPlaybackRate(      HWAVEOUT hwo, LPDWORD pdwRate);
  MMRESULT    waveOutGetPosition(          HWAVEOUT hwo, LPMMTIME pmmt, UINT cbmmt);
  MMRESULT    waveOutGetVolume(            HWAVEOUT hwo, LPDWORD pdwVolume);
  MMRESULT    waveOutMessage(              HWAVEOUT deviceID, UINT uMsg, DWORD_PTR dwParam1, DWORD_PTR dwParam2);
  MMRESULT    waveOutOpen(                 LPHWAVEOUT phwo, UINT_PTR uDeviceID, LPWAVEFORMATEX pwfx, DWORD_PTR dwCallback, DWORD_PTR dwCallbackInstance, waveInOutOpenFlags fdwOpen);
  MMRESULT    waveOutPause(                HWAVEOUT hwo);
  MMRESULT    waveOutPrepareHeader(        HWAVEOUT hwo, LPWAVEHDR pwh, UINT cbwh);
  MMRESULT    waveOutReset(                HWAVEOUT hwo);
  MMRESULT    waveOutRestart(              HWAVEOUT hwo);
  MMRESULT    waveOutSetPitch(             HWAVEOUT hwo, DWORD dwPitch);
  MMRESULT    waveOutSetPlaybackRate(      HWAVEOUT hwo, DWORD dwRate);
  MMRESULT    waveOutSetVolume(            HWAVEOUT hwo, DWORD dwVolume);
  MMRESULT    waveOutUnprepareHeader(      HWAVEOUT hwo, LPWAVEHDR pwh, UINT cbwh);
  MMRESULT    waveOutWrite(                HWAVEOUT hwo, LPWAVEHDR pwh, UINT cbwh);
]]
ffi.load( 'Winmm.dll' )

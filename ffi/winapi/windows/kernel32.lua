require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/processes' )
require( 'ffi/winapi/headers/native' )
require( 'ffi/winapi/headers/gdi' )
require( 'ffi/winapi/headers/ioctl' )
require( 'ffi/winapi/headers/registry' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UINT_PTR DLL_DIRECTORY_COOKIE; //Alias
  typedef LPVOID PKNONVOLATILE_CONTEXT_POINTERS; //Alias
  typedef LPVOID LPCONTEXT; //Alias
  typedef LPVOID PCONTEXT_EX; //Alias
  typedef LPVOID LPCOMSTAT; //Alias
  typedef LPVOID LPLDT_ENTRY; //Alias
  typedef LPVOID PWOW64_LDT_ENTRY; //Alias
  typedef HANDLE HLOCAL; //Alias
  typedef LPVOID APPLICATION_RECOVERY_CALLBACK; //Alias
  typedef LPVOID LPPROGRESS_ROUTINE; //Alias
  typedef LPVOID LPOVERLAPPED_COMPLETION_ROUTINE; //Alias
  typedef LPVOID PSECURE_MEMORY_CACHE_CALLBACK; //Alias
  typedef LPVOID LPTHREAD_START_ROUTINE; //Alias
  typedef LPVOID PTP_CALLBACK_INSTANCE; //Alias
  typedef LPVOID PTP_IO; //Alias
  typedef LPVOID PTP_POOL; //Alias
  typedef LPVOID PTP_CLEANUP_GROUP; //Alias
  typedef LPVOID PTP_CLEANUP_GROUP_CANCEL_CALLBACK; //Alias
  typedef LPVOID PTP_TIMER; //Alias
  typedef LPVOID PTP_WAIT; //Alias
  typedef LPVOID PTP_WORK; //Alias
  typedef LPVOID PTP_WIN32_IO_CALLBACK; //Alias
  typedef LPVOID PTP_TIMER_CALLBACK; //Alias
  typedef LPVOID PTP_WAIT_CALLBACK; //Alias
  typedef LPVOID PTP_WORK_CALLBACK; //Alias
  typedef LPVOID PTP_SIMPLE_CALLBACK; //Alias
  typedef LPVOID LPFIBER_START_ROUTINE; //Alias
  typedef LPVOID PFLS_CALLBACK_FUNCTION; //Alias
  typedef LPVOID PUMS_CONTEXT; //Alias
  typedef LPVOID PHANDLER_ROUTINE; //Alias
  typedef LPVOID CALINFO_ENUMPROC; //Alias
  typedef LPVOID CALINFO_ENUMPROCEX; //Alias
  typedef LPVOID CALINFO_ENUMPROCEXEX; //Alias
  typedef LPVOID DATEFMT_ENUMPROC; //Alias
  typedef LPVOID DATEFMT_ENUMPROCEX; //Alias
  typedef LPVOID DATEFMT_ENUMPROCEXEX; //Alias
  typedef LPVOID LANGGROUPLOCALE_ENUMPROC; //Alias
  typedef LPVOID CODEPAGE_ENUMPROC; //Alias
  typedef LPVOID GEO_ENUMPROC; //Alias
  typedef LPVOID LANGUAGEGROUP_ENUMPROC; //Alias
  typedef LPVOID LOCALE_ENUMPROC; //Alias
  typedef LPVOID LOCALE_ENUMPROCEX; //Alias
  typedef LPVOID TIMEFMT_ENUMPROC; //Alias
  typedef LPVOID TIMEFMT_ENUMPROCEX; //Alias
  typedef LPVOID ENUMRESLANGPROC; //Alias
  typedef LPVOID ENUMRESNAMEPROC; //Alias
  typedef LPVOID ENUMRESTYPEPROC; //Alias
  typedef LPVOID LPTOP_LEVEL_EXCEPTION_FILTER; //Alias
  typedef LPVOID PGET_RUNTIME_FUNCTION_CALLBACK; //Alias
  typedef LPVOID PAPCFUNC; //Alias
  typedef LPVOID PSRWLOCK; //Alias
  typedef LPVOID PCONDITION_VARIABLE; //Alias
  typedef LPVOID LPINIT_ONCE; //Alias
  typedef LPINIT_ONCE PINIT_ONCE; //Alias
  typedef LPVOID PINIT_ONCE_FN; //Alias
  typedef LPVOID WAITORTIMERCALLBACK; //Alias
  typedef LPVOID PTIMERAPCROUTINE; //Alias
  typedef PRTL_CRITICAL_SECTION LPCRITICAL_SECTION; //Alias
  typedef PRTL_CRITICAL_SECTION PCRITICAL_SECTION; //Alias
  typedef DWORD TP_VERSION; //Alias
  typedef void ACTIVATION_CONTEXT; //Alias
  enum { MAX_DEFAULTCHAR = 2 };
  enum { MAX_LEADBYTES = 12 };
  enum { WOW64_MAXIMUM_SUPPORTED_EXTENSION = 512 };
  enum { WOW64_SIZE_OF_80387_REGISTERS = 80 };
  enum { MAX_MODULE_NAME32_plus_1 = 256 };
  typedef WORD WINAPI_ConsoleAttribute; //Alias
  typedef UINT GEOID; //Alias
  static const GEOID Antigua_and_Barbuda = 0x2;
  static const GEOID Afghanistan = 0x3;
  static const GEOID Algeria = 0x4;
  static const GEOID Azerbaijan = 0x5;
  static const GEOID Albania = 0x6;
  static const GEOID Armenia = 0x7;
  static const GEOID Andorra = 0x8;
  static const GEOID Angola = 0x9;
  static const GEOID American_Samoa = 0xA;
  static const GEOID Argentina = 0xB;
  static const GEOID Australia = 0xC;
  static const GEOID Austria = 0xE;
  static const GEOID Bahrain = 0x11;
  static const GEOID Barbados = 0x12;
  static const GEOID Botswana = 0x13;
  static const GEOID Bermuda = 0x14;
  static const GEOID Belgium = 0x15;
  static const GEOID Bahamas__The = 0x16;
  static const GEOID Bangladesh = 0x17;
  static const GEOID Belize = 0x18;
  static const GEOID Bosnia_and_Herzegovina = 0x19;
  static const GEOID Bolivia = 0x1A;
  static const GEOID Myanmar = 0x1B;
  static const GEOID Benin = 0x1C;
  static const GEOID Belarus = 0x1D;
  static const GEOID Solomon_Islands = 0x1E;
  static const GEOID Brazil = 0x20;
  static const GEOID Bhutan = 0x22;
  static const GEOID Bulgaria = 0x23;
  static const GEOID Brunei = 0x25;
  static const GEOID Burundi = 0x26;
  static const GEOID Canada = 0x27;
  static const GEOID Cambodia = 0x28;
  static const GEOID Chad = 0x29;
  static const GEOID Sri_Lanka = 0x2A;
  static const GEOID Congo = 0x2B;
  static const GEOID Congo_DRC = 0x2C;
  static const GEOID China = 0x2D;
  static const GEOID Chile = 0x2E;
  static const GEOID Cameroon = 0x31;
  static const GEOID Comoros = 0x32;
  static const GEOID Colombia = 0x33;
  static const GEOID Costa_Rica = 0x36;
  static const GEOID Central_African_Republic = 0x37;
  static const GEOID Cuba = 0x38;
  static const GEOID Cape_Verde = 0x39;
  static const GEOID Cyprus = 0x3B;
  static const GEOID Denmark = 0x3D;
  static const GEOID Djibouti = 0x3E;
  static const GEOID Dominica = 0x3F;
  static const GEOID Dominican_Republic = 0x41;
  static const GEOID Ecuador = 0x42;
  static const GEOID Egypt = 0x43;
  static const GEOID Ireland = 0x44;
  static const GEOID Equatorial_Guinea = 0x45;
  static const GEOID Estonia = 0x46;
  static const GEOID Eritrea = 0x47;
  static const GEOID El_Salvador = 0x48;
  static const GEOID Ethiopia = 0x49;
  static const GEOID Czech_Republic = 0x4B;
  static const GEOID Finland = 0x4D;
  static const GEOID Fiji_Islands = 0x4E;
  static const GEOID Micronesia = 0x50;
  static const GEOID Faroe_Islands = 0x51;
  static const GEOID France = 0x54;
  static const GEOID Gambia__The = 0x56;
  static const GEOID Gabon = 0x57;
  static const GEOID Georgia = 0x58;
  static const GEOID Ghana = 0x59;
  static const GEOID Gibraltar = 0x5A;
  static const GEOID Grenada = 0x5B;
  static const GEOID Greenland = 0x5D;
  static const GEOID Germany = 0x5E;
  static const GEOID Greece = 0x62;
  static const GEOID Guatemala = 0x63;
  static const GEOID Guinea = 0x64;
  static const GEOID Guyana = 0x65;
  static const GEOID Haiti = 0x67;
  static const GEOID Hong_Kong_SAR = 0x68;
  static const GEOID Honduras = 0x6A;
  static const GEOID Croatia = 0x6C;
  static const GEOID Hungary = 0x6D;
  static const GEOID Iceland = 0x6E;
  static const GEOID Indonesia = 0x6F;
  static const GEOID India = 0x71;
  static const GEOID British_Indian_Ocean_Territory = 0x72;
  static const GEOID Iran = 0x74;
  static const GEOID Israel = 0x75;
  static const GEOID Italy = 0x76;
  static const GEOID C__te_d_Ivoire = 0x77;
  static const GEOID Iraq = 0x79;
  static const GEOID Japan = 0x7A;
  static const GEOID Jamaica = 0x7C;
  static const GEOID Jan_Mayen = 0x7D;
  static const GEOID Jordan = 0x7E;
  static const GEOID Johnston_Atoll = 0x7F;
  static const GEOID Kenya = 0x81;
  static const GEOID Kyrgyzstan = 0x82;
  static const GEOID North_Korea = 0x83;
  static const GEOID Kiribati = 0x85;
  static const GEOID Korea = 0x86;
  static const GEOID Kuwait = 0x88;
  static const GEOID Kazakhstan = 0x89;
  static const GEOID Laos = 0x8A;
  static const GEOID Lebanon = 0x8B;
  static const GEOID Latvia = 0x8C;
  static const GEOID Lithuania = 0x8D;
  static const GEOID Liberia = 0x8E;
  static const GEOID Slovakia = 0x8F;
  static const GEOID Liechtenstein = 0x91;
  static const GEOID Lesotho = 0x92;
  static const GEOID Luxembourg = 0x93;
  static const GEOID Libya = 0x94;
  static const GEOID Madagascar = 0x95;
  static const GEOID Macao_SAR = 0x97;
  static const GEOID Moldova = 0x98;
  static const GEOID Mongolia = 0x9A;
  static const GEOID Malawi = 0x9C;
  static const GEOID Mali = 0x9D;
  static const GEOID Monaco = 0x9E;
  static const GEOID Morocco = 0x9F;
  static const GEOID Mauritius = 0xA0;
  static const GEOID Mauritania = 0xA2;
  static const GEOID Malta = 0xA3;
  static const GEOID Oman = 0xA4;
  static const GEOID Maldives = 0xA5;
  static const GEOID Mexico = 0xA6;
  static const GEOID Malaysia = 0xA7;
  static const GEOID Mozambique = 0xA8;
  static const GEOID Niger = 0xAD;
  static const GEOID Vanuatu = 0xAE;
  static const GEOID Nigeria = 0xAF;
  static const GEOID Netherlands = 0xB0;
  static const GEOID Norway = 0xB1;
  static const GEOID Nepal = 0xB2;
  static const GEOID Nauru = 0xB4;
  static const GEOID Suriname = 0xB5;
  static const GEOID Nicaragua = 0xB6;
  static const GEOID New_Zealand = 0xB7;
  static const GEOID Palestinian_Authority = 0xB8;
  static const GEOID Paraguay = 0xB9;
  static const GEOID Peru = 0xBB;
  static const GEOID Pakistan = 0xBE;
  static const GEOID Poland = 0xBF;
  static const GEOID Panama = 0xC0;
  static const GEOID Portugal = 0xC1;
  static const GEOID Papua_New_Guinea = 0xC2;
  static const GEOID Palau = 0xC3;
  static const GEOID Guinea_Bissau = 0xC4;
  static const GEOID Qatar = 0xC5;
  static const GEOID Reunion = 0xC6;
  static const GEOID Marshall_Islands = 0xC7;
  static const GEOID Romania = 0xC8;
  static const GEOID Philippines = 0xC9;
  static const GEOID Puerto_Rico = 0xCA;
  static const GEOID Russia = 0xCB;
  static const GEOID Rwanda = 0xCC;
  static const GEOID Saudi_Arabia = 0xCD;
  static const GEOID St__Pierre_and_Miquelon = 0xCE;
  static const GEOID St__Kitts_and_Nevis = 0xCF;
  static const GEOID Seychelles = 0xD0;
  static const GEOID South_Africa = 0xD1;
  static const GEOID Senegal = 0xD2;
  static const GEOID Slovenia = 0xD4;
  static const GEOID Sierra_Leone = 0xD5;
  static const GEOID San_Marino = 0xD6;
  static const GEOID Singapore = 0xD7;
  static const GEOID Somalia = 0xD8;
  static const GEOID Spain = 0xD9;
  static const GEOID St__Lucia = 0xDA;
  static const GEOID Sudan = 0xDB;
  static const GEOID Svalbard = 0xDC;
  static const GEOID Sweden = 0xDD;
  static const GEOID Syria = 0xDE;
  static const GEOID Switzerland = 0xDF;
  static const GEOID United_Arab_Emirates = 0xE0;
  static const GEOID Trinidad_and_Tobago = 0xE1;
  static const GEOID Thailand = 0xE3;
  static const GEOID Tajikistan = 0xE4;
  static const GEOID Tonga = 0xE7;
  static const GEOID Togo = 0xE8;
  static const GEOID S__o_Tom___and_Pr__ncipe = 0xE9;
  static const GEOID Tunisia = 0xEA;
  static const GEOID Turkey = 0xEB;
  static const GEOID Tuvalu = 0xEC;
  static const GEOID Taiwan = 0xED;
  static const GEOID Turkmenistan = 0xEE;
  static const GEOID Tanzania = 0xEF;
  static const GEOID Uganda = 0xF0;
  static const GEOID Ukraine = 0xF1;
  static const GEOID United_Kingdom = 0xF2;
  static const GEOID United_States = 0xF4;
  static const GEOID Burkina_Faso = 0xF5;
  static const GEOID Uruguay = 0xF6;
  static const GEOID Uzbekistan = 0xF7;
  static const GEOID St__Vincent_and_the_Grenadines = 0xF8;
  static const GEOID Venezuela = 0xF9;
  static const GEOID Vietnam = 0xFB;
  static const GEOID Virgin_Islands = 0xFC;
  static const GEOID Vatican_City = 0xFD;
  static const GEOID Namibia = 0xFE;
  static const GEOID Wake_Island = 0x102;
  static const GEOID Samoa = 0x103;
  static const GEOID Swaziland = 0x104;
  static const GEOID Yemen = 0x105;
  static const GEOID Zambia = 0x107;
  static const GEOID Zimbabwe = 0x108;
  static const GEOID Serbia = 0x10D;
  static const GEOID Anguilla = 0x12C;
  static const GEOID Antarctica = 0x12D;
  static const GEOID Aruba = 0x12E;
  static const GEOID Ascension_Island = 0x12F;
  static const GEOID Ashmore_and_Cartier_Islands = 0x130;
  static const GEOID Baker_Island = 0x131;
  static const GEOID Bouvet_Island = 0x132;
  static const GEOID Cayman_Islands = 0x133;
  static const GEOID Channel_Islands = 0x134;
  static const GEOID Christmas_Island = 0x135;
  static const GEOID Clipperton_Island = 0x136;
  static const GEOID Cocos_Keeling_Islands = 0x137;
  static const GEOID Cook_Islands = 0x138;
  static const GEOID Coral_Sea_Islands = 0x139;
  static const GEOID Diego_Garcia = 0x13A;
  static const GEOID Falkland_Islands_Islas_Malvinas = 0x13B;
  static const GEOID French_Guiana = 0x13D;
  static const GEOID French_Polynesia = 0x13E;
  static const GEOID French_Southern_and_Antarctic_Lands = 0x13F;
  static const GEOID Guadeloupe = 0x141;
  static const GEOID Guam = 0x142;
  static const GEOID Guantanamo_Bay = 0x143;
  static const GEOID Guernsey = 0x144;
  static const GEOID Heard_Island_and_McDonald_Islands = 0x145;
  static const GEOID Howland_Island = 0x146;
  static const GEOID Jarvis_Island = 0x147;
  static const GEOID Jersey = 0x148;
  static const GEOID Kingman_Reef = 0x149;
  static const GEOID Martinique = 0x14A;
  static const GEOID Mayotte = 0x14B;
  static const GEOID Montserrat = 0x14C;
  static const GEOID Netherlands_Antilles = 0x14D;
  static const GEOID New_Caledonia = 0x14E;
  static const GEOID Niue = 0x14F;
  static const GEOID Norfolk_Island = 0x150;
  static const GEOID Northern_Mariana_Islands = 0x151;
  static const GEOID Palmyra_Atoll = 0x152;
  static const GEOID Pitcairn_Islands = 0x153;
  static const GEOID Rota_Island = 0x154;
  static const GEOID Saipan = 0x155;
  static const GEOID South_Georgia_and_the_South_Sandwich_Islands = 0x156;
  static const GEOID St__Helena = 0x157;
  static const GEOID Tinian_Island = 0x15A;
  static const GEOID Tokelau = 0x15B;
  static const GEOID Tristan_da_Cunha = 0x15C;
  static const GEOID Turks_and_Caicos_Islands = 0x15D;
  static const GEOID Virgin_Islands__British = 0x15F;
  static const GEOID Wallis_and_Futuna = 0x160;
  static const GEOID Isle_of_Man = 0x3B16;
  static const GEOID Macedonia__FYROM = 0x4CA2;
  static const GEOID Midway_Islands = 0x52FA;
  static const GEOID Timor_Leste = 0x6F60E7;
  typedef UINT STREAM_INFO_LEVELS; //Alias
  static const STREAM_INFO_LEVELS FindStreamInfoStandard = 0;
  typedef UINT HFILE; //Alias
  static const HFILE HFILE_ERROR = -1;
  typedef UINT DEP_SYSTEM_POLICY_TYPE; //Alias
  static const DEP_SYSTEM_POLICY_TYPE AlwaysOff = 0;
  static const DEP_SYSTEM_POLICY_TYPE AlwaysOn = 1;
  static const DEP_SYSTEM_POLICY_TYPE OptIn = 2;
  static const DEP_SYSTEM_POLICY_TYPE OptOut = 3;
  typedef UINT TP_CALLBACK_PRIORITY; //Alias
  static const TP_CALLBACK_PRIORITY TP_CALLBACK_PRIORITY_HIGH = 0;
  static const TP_CALLBACK_PRIORITY TP_CALLBACK_PRIORITY_LOW = 1;
  static const TP_CALLBACK_PRIORITY TP_CALLBACK_PRIORITY_NORMAL = 2;
  static const TP_CALLBACK_PRIORITY TP_CALLBACK_PRIORITY_INVALID = 3;
  typedef UINT UMS_THREAD_INFO_CLASS; //Alias
  static const UMS_THREAD_INFO_CLASS UmsThreadInvalidInfoClass = 0;
  static const UMS_THREAD_INFO_CLASS UmsThreadUserContext = 1;
  static const UMS_THREAD_INFO_CLASS UmsThreadPriority = 2;
  static const UMS_THREAD_INFO_CLASS UmsThreadAffinity = 3;
  static const UMS_THREAD_INFO_CLASS UmsThreadTeb = 4;
  static const UMS_THREAD_INFO_CLASS UmsThreadIsSuspended = 5;
  static const UMS_THREAD_INFO_CLASS UmsThreadIsTerminated = 6;
  typedef UINT GEOCLASS; //Alias
  static const GEOCLASS GEOCLASS_NATION = 16;
  static const GEOCLASS GEOCLASS_REGION = 14;
  typedef UINT FILE_INFO_BY_HANDLE_CLASS; //Alias
  static const FILE_INFO_BY_HANDLE_CLASS FileBasicInfo = 0;
  static const FILE_INFO_BY_HANDLE_CLASS FileStandardInfo = 1;
  static const FILE_INFO_BY_HANDLE_CLASS FileNameInfo = 2;
  static const FILE_INFO_BY_HANDLE_CLASS FileRenameInfo = 3;
  static const FILE_INFO_BY_HANDLE_CLASS FileDispositionInfo = 4;
  static const FILE_INFO_BY_HANDLE_CLASS FileAllocationInfo = 5;
  static const FILE_INFO_BY_HANDLE_CLASS FileEndOfFileInfo = 6;
  static const FILE_INFO_BY_HANDLE_CLASS FileStreamInfo = 7;
  static const FILE_INFO_BY_HANDLE_CLASS FileCompressionInfo = 8;
  static const FILE_INFO_BY_HANDLE_CLASS FileAttributeTagInfo = 9;
  static const FILE_INFO_BY_HANDLE_CLASS FileIdBothDirectoryInfo = 10;
  static const FILE_INFO_BY_HANDLE_CLASS FileIdBothDirectoryRestartInfo = 11;
  static const FILE_INFO_BY_HANDLE_CLASS FileIoPriorityHintInfo = 12;
  static const FILE_INFO_BY_HANDLE_CLASS FileRemoteProtocolInfo = 13;
  static const FILE_INFO_BY_HANDLE_CLASS FileFullDirectoryInfo = 14;
  static const FILE_INFO_BY_HANDLE_CLASS FileFullDirectoryRestartInfo = 15;
  static const FILE_INFO_BY_HANDLE_CLASS FileStorageInfo = 16;
  static const FILE_INFO_BY_HANDLE_CLASS FileAlignmentInfo = 17;
  typedef UINT MEMORY_RESOURCE_NOTIFICATION_TYPE; //Alias
  static const MEMORY_RESOURCE_NOTIFICATION_TYPE LowMemoryResourceNotification = 0;
  static const MEMORY_RESOURCE_NOTIFICATION_TYPE HighMemoryResourceNotification = 1;
  static const MEMORY_RESOURCE_NOTIFICATION_TYPE PendingBadMemoryNotification = 2;
  typedef UINT HEAP_INFORMATION_CLASS; //Alias
  static const HEAP_INFORMATION_CLASS HeapCompatibilityInformation = 0;
  static const HEAP_INFORMATION_CLASS HeapEnableTerminationOnCorruption = 1;
  static const HEAP_INFORMATION_CLASS HeapExtendedInformation = 2;
  typedef UINT LOGICAL_PROCESSOR_RELATIONSHIP; //Alias
  static const LOGICAL_PROCESSOR_RELATIONSHIP RelationProcessorCore = 0;
  static const LOGICAL_PROCESSOR_RELATIONSHIP RelationNumaNode = 1;
  static const LOGICAL_PROCESSOR_RELATIONSHIP RelationCache = 2;
  static const LOGICAL_PROCESSOR_RELATIONSHIP RelationProcessorPackage = 3;
  static const LOGICAL_PROCESSOR_RELATIONSHIP RelationGroup = 4;
  static const LOGICAL_PROCESSOR_RELATIONSHIP RelationAll = 0xffff;
  typedef UINT CALDATETIME_DATEUNIT; //Alias
  static const CALDATETIME_DATEUNIT EraUnit = 0;
  static const CALDATETIME_DATEUNIT YearUnit = 1;
  static const CALDATETIME_DATEUNIT MonthUnit = 2;
  static const CALDATETIME_DATEUNIT WeekUnit = 3;
  static const CALDATETIME_DATEUNIT DayUnit = 4;
  static const CALDATETIME_DATEUNIT HourUnit = 5;
  static const CALDATETIME_DATEUNIT MinuteUnit = 6;
  static const CALDATETIME_DATEUNIT SecondUnit = 7;
  static const CALDATETIME_DATEUNIT TickUnit = 8;
  typedef DWORD CALID; //Alias
  static const CALID CAL_GREGORIAN = 1;
  static const CALID CAL_GREGORIAN_US = 2;
  static const CALID CAL_JAPAN = 3;
  static const CALID CAL_TAIWAN = 4;
  static const CALID CAL_KOREA = 5;
  static const CALID CAL_HIJRI = 6;
  static const CALID CAL_THAI = 7;
  static const CALID CAL_HEBREW = 8;
  static const CALID CAL_GREGORIAN_ME_FRENCH = 9;
  static const CALID CAL_GREGORIAN_ARABIC = 10;
  static const CALID CAL_GREGORIAN_XLIT_ENGLISH = 11;
  static const CALID CAL_GREGORIAN_XLIT_FRENCH = 12;
  static const CALID CAL_UMALQURA = 23;
  static const CALID ENUM_ALL_CALENDARS = 0xffffffff;
  typedef DWORD CALTYPE; //Alias
  typedef DWORD LGRPID; //Alias
  static const LGRPID LGRPID_WESTERN_EUROPE = 0x0001;
  static const LGRPID LGRPID_CENTRAL_EUROPE = 0x0002;
  static const LGRPID LGRPID_BALTIC = 0x0003;
  static const LGRPID LGRPID_GREEK = 0x0004;
  static const LGRPID LGRPID_CYRILLIC = 0x0005;
  static const LGRPID LGRPID_TURKIC = 0x0006;
  static const LGRPID LGRPID_TURKISH = 0x0006;
  static const LGRPID LGRPID_JAPANESE = 0x0007;
  static const LGRPID LGRPID_KOREAN = 0x0008;
  static const LGRPID LGRPID_TRADITIONAL_CHINESE = 0x0009;
  static const LGRPID LGRPID_SIMPLIFIED_CHINESE = 0x000a;
  static const LGRPID LGRPID_THAI = 0x000b;
  static const LGRPID LGRPID_HEBREW = 0x000c;
  static const LGRPID LGRPID_ARABIC = 0x000d;
  static const LGRPID LGRPID_VIETNAMESE = 0x000e;
  static const LGRPID LGRPID_INDIC = 0x000f;
  static const LGRPID LGRPID_GEORGIAN = 0x0010;
  static const LGRPID LGRPID_ARMENIAN = 0x0011;
  typedef DWORD GEOTYPE; //Alias
  static const GEOTYPE GEO_NATION = 0x0001;
  static const GEOTYPE GEO_LATITUDE = 0x0002;
  static const GEOTYPE GEO_LONGITUDE = 0x0003;
  static const GEOTYPE GEO_ISO2 = 0x0004;
  static const GEOTYPE GEO_ISO3 = 0x0005;
  static const GEOTYPE GEO_RFC1766 = 0x0006;
  static const GEOTYPE GEO_LCID = 0x0007;
  static const GEOTYPE GEO_FRIENDLYNAME = 0x0008;
  static const GEOTYPE GEO_OFFICIALNAME = 0x0009;
  static const GEOTYPE GEO_TIMEZONES = 0x000A;
  static const GEOTYPE GEO_OFFICIALLANGUAGES = 0x000B;
  static const GEOTYPE GEO_ISO_UN_NUMBER = 0x000C;
  static const GEOTYPE GEO_PARENT = 0x000D;
  typedef DWORD LCTYPE; //Alias
  typedef DWORD NLS_FUNCTION; //Alias
  static const NLS_FUNCTION COMPARE_STRING = 0x0001;
  typedef DWORD EXECUTION_STATE; //Alias
  typedef DWORD WER_REGISTER_FILE_TYPE; //Alias
  static const WER_REGISTER_FILE_TYPE WerRegFileTypeUserDocument = 1;
  static const WER_REGISTER_FILE_TYPE WerRegFileTypeOther = 2;
  typedef DWORD WINAPI_CreationDisposition; //Alias
  static const WINAPI_CreationDisposition CREATE_NEW = 1;
  static const WINAPI_CreationDisposition CREATE_ALWAYS = 2;
  static const WINAPI_CreationDisposition OPEN_EXISTING = 3;
  static const WINAPI_CreationDisposition OPEN_ALWAYS = 4;
  static const WINAPI_CreationDisposition TRUNCATE_EXISTING = 5;
  typedef DWORD WINAPI_FlagsAndAttributes; //Alias
  typedef DWORD WINAPI_FormatMessageFlags; //Alias
  typedef DWORD WINAPI_ProcessorFeatureEnum; //Alias
  static const WINAPI_ProcessorFeatureEnum PF_FLOATING_POINT_PRECISION_ERRATA = 0;
  static const WINAPI_ProcessorFeatureEnum PF_FLOATING_POINT_EMULATED = 1;
  static const WINAPI_ProcessorFeatureEnum PF_COMPARE_EXCHANGE_DOUBLE = 2;
  static const WINAPI_ProcessorFeatureEnum PF_MMX_INSTRUCTIONS_AVAILABLE = 3;
  static const WINAPI_ProcessorFeatureEnum PF_PPC_MOVEMEM_64BIT_OK = 4;
  static const WINAPI_ProcessorFeatureEnum PF_ALPHA_BYTE_INSTRUCTIONS = 5;
  static const WINAPI_ProcessorFeatureEnum PF_XMMI_INSTRUCTIONS_AVAILABLE = 6;
  static const WINAPI_ProcessorFeatureEnum PF_3DNOW_INSTRUCTIONS_AVAILABLE = 7;
  static const WINAPI_ProcessorFeatureEnum PF_RDTSC_INSTRUCTION_AVAILABLE = 8;
  static const WINAPI_ProcessorFeatureEnum PF_PAE_ENABLED = 9;
  static const WINAPI_ProcessorFeatureEnum PF_XMMI64_INSTRUCTIONS_AVAILABLE = 10;
  static const WINAPI_ProcessorFeatureEnum PF_SSE_DAZ_MODE_AVAILABLE = 11;
  static const WINAPI_ProcessorFeatureEnum PF_NX_ENABLED = 12;
  static const WINAPI_ProcessorFeatureEnum PF_SSE3_INSTRUCTIONS_AVAILABLE = 13;
  static const WINAPI_ProcessorFeatureEnum PF_COMPARE_EXCHANGE128 = 14;
  static const WINAPI_ProcessorFeatureEnum PF_COMPARE64_EXCHANGE128 = 15;
  static const WINAPI_ProcessorFeatureEnum PF_CHANNELS_ENABLED = 16;
  static const WINAPI_ProcessorFeatureEnum PF_XSAVE_ENABLED = 17;
  typedef DWORD WINAPI_CharacterTypeFlag; //Alias
  typedef UINT WINAPI_LocalMemoryFlag; //Alias
  typedef UINT WINAPI_GlobalMemoryFlag; //Alias
  typedef DWORD WINAPI_WideCharFlags; //Alias
  typedef DWORD WINAPI_MultiByteFlags; //Alias
  typedef DWORD WINAPI_MoveMethodEnum; //Alias
  static const WINAPI_MoveMethodEnum FILE_BEGIN = 0;
  static const WINAPI_MoveMethodEnum FILE_CURRENT = 1;
  static const WINAPI_MoveMethodEnum FILE_END = 2;
  typedef DWORD WINAPI_MapAccessFlags; //Alias
  typedef DWORD WINAPI_ThreadCreationFlags; //Alias
  typedef DWORD WINAPI_LocaleEnumerationFlags; //Alias
  typedef DWORD WINAPI_EnumSystemLocalesExFlags; //Alias
  typedef DWORD WINAPI_CodePageEnumerationFlags; //Alias
  typedef DWORD WINAPI_StringFlags; //Alias
  typedef DWORD WINAPI_MappingFlags; //Alias
  typedef DWORD WINAPI_DeactivateActCtxFlags; //Alias
  typedef UINT WINAPI_SEM_FLAGS; //Alias
  typedef WINAPI_SEM_FLAGS WINAPI_SEM_FLAGS_DWORD; //Alias
  typedef DWORD WINAPI_GetNumberFormatFlags; //Alias
  typedef DWORD WINAPI_DuplicateHandleFlags; //Alias
  typedef DWORD WINAPI_StandardAccessRights; //Alias
  typedef DWORD WINAPI_EventAccessRights; //Alias
  typedef DWORD WINAPI_MutexAccessRights; //Alias
  typedef DWORD WINAPI_SemaphoreAccessRights; //Alias
  typedef DWORD WINAPI_TimerAccessRights; //Alias
  typedef DWORD WINAPI_QueryActCtxFlags; //Alias
  typedef ULONG WINAPI_ActivationContextInfoClass; //Alias
  static const WINAPI_ActivationContextInfoClass ActivationContextBasicInformation = 1;
  static const WINAPI_ActivationContextInfoClass ActivationContextDetailedInformation = 2;
  static const WINAPI_ActivationContextInfoClass AssemblyDetailedInformationInActivationContext = 3;
  static const WINAPI_ActivationContextInfoClass FileInformationInAssemblyOfAssemblyInActivationContext = 4;
  static const WINAPI_ActivationContextInfoClass RunlevelInformationInActivationContext = 5;
  static const WINAPI_ActivationContextInfoClass CompatibilityInformationInActivationContext = 6;
  static const WINAPI_ActivationContextInfoClass ActivationContextManifestResourceName = 7;
  typedef DWORD WINAPI_ResourceEnumFlags; //Alias
  typedef ULONG WINAPI_WorkItemFlags; //Alias
  typedef BYTE WINAPI_VerOperator; //Alias
  static const WINAPI_VerOperator VER_EQUAL = 1;
  static const WINAPI_VerOperator VER_GREATER = 2;
  static const WINAPI_VerOperator VER_GREATER_EQUAL = 3;
  static const WINAPI_VerOperator VER_LESS = 4;
  static const WINAPI_VerOperator VER_LESS_EQUAL = 5;
  static const WINAPI_VerOperator VER_AND = 6;
  static const WINAPI_VerOperator VER_OR = 7;
  typedef DWORD WINAPI_ExceptionFlags; //Alias
  typedef DWORD WINAPI_GetDateFormatFlags; //Alias
  typedef DWORD WINAPI_GetTimeFormatFlags; //Alias
  typedef DWORD WINAPI_StdHandle; //Alias
  static const WINAPI_StdHandle STD_INPUT_HANDLE = -10;
  static const WINAPI_StdHandle STD_OUTPUT_HANDLE = -11;
  static const WINAPI_StdHandle STD_ERROR_HANDLE = -12;
  typedef int WINAPI_ThreadPriority; //Alias
  static const WINAPI_ThreadPriority THREAD_PRIORITY_LOWEST = -2;
  static const WINAPI_ThreadPriority THREAD_PRIORITY_BELOW_NORMAL = -1;
  static const WINAPI_ThreadPriority THREAD_PRIORITY_NORMAL = 0;
  static const WINAPI_ThreadPriority THREAD_PRIORITY_HIGHEST = 2;
  static const WINAPI_ThreadPriority THREAD_PRIORITY_ABOVE_NORMAL = 1;
  static const WINAPI_ThreadPriority THREAD_PRIORITY_TIME_CRITICAL = 15;
  static const WINAPI_ThreadPriority THREAD_PRIORITY_IDLE = -15;
  static const WINAPI_ThreadPriority THREAD_MODE_BACKGROUND_BEGIN = 0x00010000;
  static const WINAPI_ThreadPriority THREAD_MODE_BACKGROUND_END = 0x00020000;
  typedef DWORD WINAPI_ConsoleModeFlags; //Alias
  typedef DWORD WINAPI_HandleFlags; //Alias
  typedef ULONG WINAPI_PrivateNamespaceFlag; //Alias
  typedef DWORD WINAPI_GetFinalPathNameByHandleFlags; //Alias
  typedef DWORD WINAPI_LockFileFlags; //Alias
  typedef DWORD WINAPI_ProductType; //Alias
  static const WINAPI_ProductType PRODUCT_UNDEFINED = 0x00000000;
  static const WINAPI_ProductType PRODUCT_ULTIMATE = 0x00000001;
  static const WINAPI_ProductType PRODUCT_HOME_BASIC = 0x00000002;
  static const WINAPI_ProductType PRODUCT_HOME_PREMIUM = 0x00000003;
  static const WINAPI_ProductType PRODUCT_ENTERPRISE = 0x00000004;
  static const WINAPI_ProductType PRODUCT_HOME_BASIC_N = 0x00000005;
  static const WINAPI_ProductType PRODUCT_BUSINESS = 0x00000006;
  static const WINAPI_ProductType PRODUCT_STANDARD_SERVER = 0x00000007;
  static const WINAPI_ProductType PRODUCT_DATACENTER_SERVER = 0x00000008;
  static const WINAPI_ProductType PRODUCT_SMALLBUSINESS_SERVER = 0x00000009;
  static const WINAPI_ProductType PRODUCT_ENTERPRISE_SERVER = 0x0000000A;
  static const WINAPI_ProductType PRODUCT_STARTER = 0x0000000B;
  static const WINAPI_ProductType PRODUCT_DATACENTER_SERVER_CORE = 0x0000000C;
  static const WINAPI_ProductType PRODUCT_STANDARD_SERVER_CORE = 0x0000000D;
  static const WINAPI_ProductType PRODUCT_ENTERPRISE_SERVER_CORE = 0x0000000E;
  static const WINAPI_ProductType PRODUCT_ENTERPRISE_SERVER_IA64 = 0x0000000F;
  static const WINAPI_ProductType PRODUCT_BUSINESS_N = 0x00000010;
  static const WINAPI_ProductType PRODUCT_WEB_SERVER = 0x00000011;
  static const WINAPI_ProductType PRODUCT_CLUSTER_SERVER = 0x00000012;
  static const WINAPI_ProductType PRODUCT_HOME_SERVER = 0x00000013;
  static const WINAPI_ProductType PRODUCT_STORAGE_EXPRESS_SERVER = 0x00000014;
  static const WINAPI_ProductType PRODUCT_STORAGE_STANDARD_SERVER = 0x00000015;
  static const WINAPI_ProductType PRODUCT_STORAGE_WORKGROUP_SERVER = 0x00000016;
  static const WINAPI_ProductType PRODUCT_STORAGE_ENTERPRISE_SERVER = 0x00000017;
  static const WINAPI_ProductType PRODUCT_SERVER_FOR_SMALLBUSINESS = 0x00000018;
  static const WINAPI_ProductType PRODUCT_SMALLBUSINESS_SERVER_PREMIUM = 0x00000019;
  static const WINAPI_ProductType PRODUCT_UNLICENSED = 0xABCDABCD;
  typedef DWORD WINAPI_MoveFileFlags; //Alias
  typedef DWORD WINAPI_LanguageGroupFlags; //Alias
  typedef DWORD WINAPI_ApplicationRestartFlags; //Alias
  typedef DWORD WINAPI_ProcessShutdownFlags; //Alias
  typedef UINT FINDEX_INFO_LEVELS; //Alias
  static const FINDEX_INFO_LEVELS FindExInfoStandard = 0;
  static const FINDEX_INFO_LEVELS FindExInfoBasic = 1;
  typedef UINT FINDEX_SEARCH_OPS; //Alias
  static const FINDEX_SEARCH_OPS FindExSearchNameMatch = 0;
  static const FINDEX_SEARCH_OPS FindExSearchLimitToDirectories = 1;
  static const FINDEX_SEARCH_OPS FindExSearchLimitToDevices = 2;
  typedef DWORD WINAPI_FindFirstFileExFlags; //Alias
  typedef DWORD WINAPI_QueryFullProcessImageNameFlags; //Alias
  typedef DWORD WINAPI_WerFileFlags; //Alias
  typedef DWORD WINAPI_GetBinaryTypeResult; //Alias
  static const WINAPI_GetBinaryTypeResult SCS_32BIT_BINARY = 0;
  static const WINAPI_GetBinaryTypeResult SCS_DOS_BINARY = 1;
  static const WINAPI_GetBinaryTypeResult SCS_WOW_BINARY = 2;
  static const WINAPI_GetBinaryTypeResult SCS_PIF_BINARY = 3;
  static const WINAPI_GetBinaryTypeResult SCS_POSIX_BINARY = 4;
  static const WINAPI_GetBinaryTypeResult SCS_OS216_BINARY = 5;
  static const WINAPI_GetBinaryTypeResult SCS_64BIT_BINARY = 6;
  typedef UINT WINAPI_OpenFileFlags; //Alias
  typedef DWORD WINAPI_PriorityClass; //Alias
  typedef DWORD WINAPI_ContinueStatusFlag; //Alias
  typedef int WINAPI_lcreatAttribute; //Alias
  static const WINAPI_lcreatAttribute Normal = 0;
  static const WINAPI_lcreatAttribute Read_only = 1;
  static const WINAPI_lcreatAttribute Hidden = 2;
  static const WINAPI_lcreatAttribute System = 3;
  typedef DWORD WINAPI_CreateSymbolicLinkFlags; //Alias
  typedef DWORD WINAPI_FileType; //Alias
  static const WINAPI_FileType FILE_TYPE_UNKNOWN = 0x0000;
  static const WINAPI_FileType FILE_TYPE_DISK = 0x0001;
  static const WINAPI_FileType FILE_TYPE_CHAR = 0x0002;
  static const WINAPI_FileType FILE_TYPE_PIPE = 0x0003;
  static const WINAPI_FileType FILE_TYPE_REMOTE = 0x8000;
  typedef UINT POWER_REQUEST_TYPE; //Alias
  static const POWER_REQUEST_TYPE PowerRequestDisplayRequired = 0;
  static const POWER_REQUEST_TYPE PowerRequestSystemRequired = 1;
  static const POWER_REQUEST_TYPE PowerRequestAwayModeRequired = 2;
  static const POWER_REQUEST_TYPE PowerRequestExecutionRequired = 3;
  typedef UINT LATENCY_TIME; //Alias
  static const LATENCY_TIME LT_DONT_CARE = 0;
  static const LATENCY_TIME LT_LOWEST_LATENCY = 1;
  typedef UINT COMPUTER_NAME_FORMAT; //Alias
  static const COMPUTER_NAME_FORMAT ComputerNameNetBIOS = 0;
  static const COMPUTER_NAME_FORMAT ComputerNameDnsHostname = 1;
  static const COMPUTER_NAME_FORMAT ComputerNameDnsDomain = 2;
  static const COMPUTER_NAME_FORMAT ComputerNameDnsFullyQualified = 3;
  static const COMPUTER_NAME_FORMAT ComputerNamePhysicalNetBIOS = 4;
  static const COMPUTER_NAME_FORMAT ComputerNamePhysicalDnsHostname = 5;
  static const COMPUTER_NAME_FORMAT ComputerNamePhysicalDnsDomain = 6;
  static const COMPUTER_NAME_FORMAT ComputerNamePhysicalDnsFullyQualified = 7;
  typedef struct COORD {
    SHORT X;
    SHORT Y;
  } COORD;
  typedef COORD *PCOORD; //Pointer
  typedef struct SMALL_RECT {
    SHORT Left;
    SHORT Top;
    SHORT Right;
    SHORT Bottom;
  } SMALL_RECT;
  typedef SMALL_RECT *PSMALL_RECT; //Pointer
  typedef struct CHAR_INFO {
    SHORT Char;
    WINAPI_ConsoleAttribute Attributes;
  } CHAR_INFO;
  typedef CHAR_INFO *PCHAR_INFO; //Pointer
  typedef DWORD WINAPI_HeapEntryFlags; //Alias
  static const WINAPI_HeapEntryFlags LF32_FIXED = 0x00000001;
  static const WINAPI_HeapEntryFlags LF32_FREE = 0x00000002;
  static const WINAPI_HeapEntryFlags LF32_MOVEABLE = 0x00000004;
  typedef struct HEAPENTRY32 {
    SIZE_T dwSize;
    HANDLE hHandle;
    ULONG_PTR dwAddress;
    SIZE_T dwBlockSize;
    WINAPI_HeapEntryFlags dwFlags;
    DWORD dwLockCount;
    DWORD dwResvd;
    DWORD th32ProcessID;
    ULONG_PTR th32HeapID;
  } HEAPENTRY32;
  typedef HEAPENTRY32 *LPHEAPENTRY32; //Pointer
  typedef DWORD WINAPI_HeapListFlags; //Alias
  static const WINAPI_HeapListFlags HF32_DEFAULT = 1;
  static const WINAPI_HeapListFlags HF32_SHARED = 2;
  typedef struct HEAPLIST32 {
    SIZE_T dwSize;
    DWORD th32ProcessID;
    ULONG_PTR th32HeapID;
    WINAPI_HeapListFlags dwFlags;
  } HEAPLIST32;
  typedef HEAPLIST32 *LPHEAPLIST32; //Pointer
  typedef struct THREADENTRY32 {
    DWORD dwSize;
    DWORD cntUsage;
    DWORD th32ThreadID;
    DWORD th32OwnerProcessID;
    LONG tpBasePri;
    LONG tpDeltaPri;
    DWORD dwFlags;
  } THREADENTRY32;
  typedef THREADENTRY32 *LPTHREADENTRY32; //Pointer
  typedef struct BY_HANDLE_FILE_INFORMATION {
    DWORD dwFileAttributes;
    FILETIME ftCreationTime;
    FILETIME ftLastAccessTime;
    FILETIME ftLastWriteTime;
    DWORD dwVolumeSerialNumber;
    DWORD nFileSizeHigh;
    DWORD nFileSizeLow;
    DWORD nNumberOfLinks;
    DWORD nFileIndexHigh;
    DWORD nFileIndexLow;
  } BY_HANDLE_FILE_INFORMATION;
  typedef BY_HANDLE_FILE_INFORMATION *LPBY_HANDLE_FILE_INFORMATION; //Pointer
  typedef struct OVERLAPPED_ENTRY {
    ULONG_PTR lpCompletionKey;
    LPOVERLAPPED lpOverlapped;
    ULONG_PTR Internal;
    DWORD dwNumberOfBytesTransferred;
  } OVERLAPPED_ENTRY;
  typedef OVERLAPPED_ENTRY *LPOVERLAPPED_ENTRY; //Pointer
  typedef struct MEMORYSTATUSEX {
    DWORD dwLength;
    DWORD dwMemoryLoad;
    DWORDLONG ullTotalPhys;
    DWORDLONG ullAvailPhys;
    DWORDLONG ullTotalPageFile;
    DWORDLONG ullAvailPageFile;
    DWORDLONG ullTotalVirtual;
    DWORDLONG ullAvailVirtual;
    DWORDLONG ullAvailExtendedVirtual;
  } MEMORYSTATUSEX;
  typedef MEMORYSTATUSEX *LPMEMORYSTATUSEX; //Pointer
  typedef struct MEMORY_BASIC_INFORMATION {
    PVOID BaseAddress;
    PVOID AllocationBase;
    WINAPI_MemoryProtection AllocationProtect;
    SIZE_T RegionSize;
    WINAPI_MemoryAllocationFlags State;
    WINAPI_MemoryProtection Protect;
    WINAPI_MemoryType Type;
  } MEMORY_BASIC_INFORMATION;
  typedef MEMORY_BASIC_INFORMATION *PMEMORY_BASIC_INFORMATION; //Pointer
  typedef struct MEMORYSTATUS {
    DWORD dwLength;
    DWORD dwMemoryLoad;
    SIZE_T dwTotalPhys;
    SIZE_T dwAvailPhys;
    SIZE_T dwTotalPageFile;
    SIZE_T dwAvailPageFile;
    SIZE_T dwTotalVirtual;
    SIZE_T dwAvailVirtual;
  } MEMORYSTATUS;
  typedef MEMORYSTATUS *LPMEMORYSTATUS; //Pointer
  typedef struct IO_COUNTERS {
    ULONGLONG ReadOperationCount;
    ULONGLONG WriteOperationCount;
    ULONGLONG OtherOperationCount;
    ULONGLONG ReadTransferCount;
    ULONGLONG WriteTransferCount;
    ULONGLONG OtherTransferCount;
  } IO_COUNTERS;
  typedef IO_COUNTERS *PIO_COUNTERS; //Pointer
  typedef struct SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION {
    DWORD64 CycleTime;
  } SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION;
  typedef SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION *PSYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION; //Pointer
  typedef struct TP_POOL_STACK_INFORMATION {
    SIZE_T StackReserve;
    SIZE_T StackCommit;
  } TP_POOL_STACK_INFORMATION;
  typedef TP_POOL_STACK_INFORMATION *PTP_POOL_STACK_INFORMATION; //Pointer
  typedef LPVOID PUMS_COMPLETION_LIST; //Alias
  typedef PUMS_COMPLETION_LIST *PUMS_SCHEDULER_ENTRY_POINT; //Pointer
  typedef struct UMS_SCHEDULER_STARTUP_INFO {
    ULONG UmsVersion;
    PUMS_COMPLETION_LIST CompletionList;
    PUMS_SCHEDULER_ENTRY_POINT SchedulerProc;
    PVOID SchedulerParam;
  } UMS_SCHEDULER_STARTUP_INFO;
  typedef UMS_SCHEDULER_STARTUP_INFO *PUMS_SCHEDULER_STARTUP_INFO; //Pointer
  typedef struct ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA {
    PVOID lpInformation;
    PVOID lpSectionBase;
    ULONG ulSectionLength;
    PVOID lpSectionGlobalDataBase;
    ULONG ulSectionGlobalDataLength;
  } ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA;
  typedef struct ACTCTX_SECTION_KEYED_DATA {
    ULONG cbSize;
    ULONG ulDataFormatVersion;
    PVOID lpData;
    ULONG ulLength;
    PVOID lpSectionGlobalData;
    ULONG ulSectionGlobalDataLength;
    PVOID lpSectionBase;
    ULONG ulSectionTotalLength;
    HANDLE hActCtx;
    ULONG ulAssemblyRosterIndex;
    ULONG ulFlags;
    ACTCTX_SECTION_KEYED_DATA_ASSEMBLY_METADATA AssemblyMetadata;
  } ACTCTX_SECTION_KEYED_DATA;
  typedef ACTCTX_SECTION_KEYED_DATA *PACTCTX_SECTION_KEYED_DATA; //Pointer
  typedef struct COMMTIMEOUTS {
    DWORD ReadIntervalTimeout;
    DWORD ReadTotalTimeoutMultiplier;
    DWORD ReadTotalTimeoutConstant;
    DWORD WriteTotalTimeoutMultiplier;
    DWORD WriteTotalTimeoutConstant;
  } COMMTIMEOUTS;
  typedef COMMTIMEOUTS *LPCOMMTIMEOUTS; //Pointer
  typedef struct CONSOLE_CURSOR_INFO {
    DWORD dwSize;
    BOOL bVisible;
  } CONSOLE_CURSOR_INFO;
  typedef CONSOLE_CURSOR_INFO *PCONSOLE_CURSOR_INFO; //Pointer
  typedef struct CONSOLE_HISTORY_INFO {
    UINT cbSize;
    UINT HistoryBufferSize;
    UINT NumberOfHistoryBuffers;
    DWORD dwFlags;
  } CONSOLE_HISTORY_INFO;
  typedef CONSOLE_HISTORY_INFO *PCONSOLE_HISTORY_INFO; //Pointer
  typedef struct CONSOLE_SCREEN_BUFFER_INFO {
    COORD dwSize;
    COORD dwCursorPosition;
    WORD wAttributes;
    SMALL_RECT srWindow;
    COORD dwMaximumWindowSize;
  } CONSOLE_SCREEN_BUFFER_INFO;
  typedef CONSOLE_SCREEN_BUFFER_INFO *PCONSOLE_SCREEN_BUFFER_INFO; //Pointer
  typedef struct CONSOLE_SELECTION_INFO {
    DWORD dwFlags;
    COORD dwSelectionAnchor;
    SMALL_RECT srSelection;
  } CONSOLE_SELECTION_INFO;
  typedef CONSOLE_SELECTION_INFO *PCONSOLE_SELECTION_INFO; //Pointer
  typedef struct CONSOLE_FONT_INFO {
    DWORD nFont;
    COORD dwFontSize;
  } CONSOLE_FONT_INFO;
  typedef CONSOLE_FONT_INFO *PCONSOLE_FONT_INFO; //Pointer
  typedef struct FRAME_POINTERS {
    ULONGLONG MemoryStackFp;
    ULONGLONG BackingStoreFp;
  } FRAME_POINTERS;
  typedef FRAME_POINTERS *PFRAME_POINTERS; //Pointer
  typedef struct RUNTIME_FUNCTION {
    DWORD BeginAddress;
    DWORD EndAddress;
    DWORD UnwindData;
  } RUNTIME_FUNCTION;
  typedef RUNTIME_FUNCTION *PRUNTIME_FUNCTION; //Pointer
  typedef struct CALDATETIME {
    CALID CalId;
    UINT Era;
    UINT Year;
    UINT Month;
    UINT Day;
    UINT DayOfWeek;
    UINT Hour;
    UINT Minute;
    UINT Second;
    ULONG Tick;
  } CALDATETIME;
  typedef CALDATETIME *LPCALDATETIME; //Pointer
  typedef LPCALDATETIME LPCALDATETIME; //Alias
  typedef struct NLSVERSIONINFO {
    DWORD dwNLSVersionInfoSize;
    DWORD dwNLSVersion;
    DWORD dwDefinedVersion;
  } NLSVERSIONINFO;
  typedef NLSVERSIONINFO *LPNLSVERSIONINFO; //Pointer
  typedef struct NLSVERSIONINFOEX {
    DWORD dwNLSVersionInfoSize;
    DWORD dwNLSVersion;
    DWORD dwDefinedVersion;
    DWORD dwEffectiveId;
    GUID guidCustomVersion;
  } NLSVERSIONINFOEX;
  typedef NLSVERSIONINFOEX *LPNLSVERSIONINFOEX; //Pointer
  typedef struct CURRENCYFMT {
    UINT NumDigits;
    UINT LeadingZero;
    UINT Grouping;
    LPTSTR lpDecimalSep;
    LPTSTR lpThousandSep;
    UINT NegativeOrder;
    UINT PositiveOrder;
    LPTSTR lpCurrencySymbol;
  } CURRENCYFMT;
  typedef struct SYSTEM_POWER_STATUS {
    BYTE ACLineStatus;
    BYTE BatteryFlag;
    BYTE BatteryLifePercent;
    BYTE Reserved1;
    DWORD BatteryLifeTime;
    DWORD BatteryFullLifeTime;
  } SYSTEM_POWER_STATUS;
  typedef SYSTEM_POWER_STATUS *LPSYSTEM_POWER_STATUS; //Pointer
  typedef DWORD WINAPI_PROCESSOR_TYPE; //Alias
  static const WINAPI_PROCESSOR_TYPE PROCESSOR_INTEL_386 = 386;
  static const WINAPI_PROCESSOR_TYPE PROCESSOR_INTEL_486 = 486;
  static const WINAPI_PROCESSOR_TYPE PROCESSOR_INTEL_PENTIUM = 586;
  static const WINAPI_PROCESSOR_TYPE PROCESSOR_INTEL_IA64 = 2200;
  static const WINAPI_PROCESSOR_TYPE PROCESSOR_AMD_X8664 = 8664;
  typedef struct SYSTEM_INFO {
    WINAPI_PROCESSOR_ARCHITECTURE wProcessorArchitecture;
    WORD wReserved;
    DWORD dwPageSize;
    LPVOID lpMinimumApplicationAddress;
    LPVOID lpMaximumApplicationAddress;
    DWORD_PTR dwActiveProcessorMask;
    DWORD dwNumberOfProcessors;
    WINAPI_PROCESSOR_TYPE dwProcessorType;
    DWORD dwAllocationGranularity;
    WORD wProcessorLevel;
    WORD wProcessorRevision;
  } SYSTEM_INFO;
  typedef SYSTEM_INFO *LPSYSTEM_INFO; //Pointer
  typedef DWORD WINAPI_SET_LAST_ERROR_EX_TYPE; //Alias
  static const WINAPI_SET_LAST_ERROR_EX_TYPE SLE_ERROR = 0x00000001;
  static const WINAPI_SET_LAST_ERROR_EX_TYPE SLE_MINORERROR = 0x00000002;
  static const WINAPI_SET_LAST_ERROR_EX_TYPE SLE_WARNING = 0x00000003;
  typedef DWORD WINAPI_DEBUG_EVENT_CODE; //Alias
  static const WINAPI_DEBUG_EVENT_CODE EXCEPTION_DEBUG_EVENT = 1;
  static const WINAPI_DEBUG_EVENT_CODE CREATE_THREAD_DEBUG_EVENT = 2;
  static const WINAPI_DEBUG_EVENT_CODE CREATE_PROCESS_DEBUG_EVENT = 3;
  static const WINAPI_DEBUG_EVENT_CODE EXIT_THREAD_DEBUG_EVENT = 4;
  static const WINAPI_DEBUG_EVENT_CODE EXIT_PROCESS_DEBUG_EVENT = 5;
  static const WINAPI_DEBUG_EVENT_CODE LOAD_DLL_DEBUG_EVENT = 6;
  static const WINAPI_DEBUG_EVENT_CODE UNLOAD_DLL_DEBUG_EVENT = 7;
  static const WINAPI_DEBUG_EVENT_CODE OUTPUT_DEBUG_STRING_EVENT = 8;
  static const WINAPI_DEBUG_EVENT_CODE RIP_EVENT = 9;
  typedef struct EXCEPTION_DEBUG_INFO {
    EXCEPTION_RECORD ExceptionRecord;
    DWORD dwFirstChance;
  } EXCEPTION_DEBUG_INFO;
  typedef struct CREATE_THREAD_DEBUG_INFO {
    HANDLE hThread;
    LPVOID lpThreadLocalBase;
    LPTHREAD_START_ROUTINE lpStartAddress;
  } CREATE_THREAD_DEBUG_INFO;
  typedef struct CREATE_PROCESS_DEBUG_INFO {
    HANDLE hFile;
    HANDLE hProcess;
    HANDLE hThread;
    LPVOID lpBaseOfImage;
    DWORD dwDebugInfoFileOffset;
    DWORD nDebugInfoSize;
    LPVOID lpThreadLocalBase;
    LPTHREAD_START_ROUTINE lpStartAddress;
    LPVOID lpImageName;
    WORD fUnicode;
  } CREATE_PROCESS_DEBUG_INFO;
  typedef struct EXIT_THREAD_DEBUG_INFO {
    DWORD dwExitCode;
  } EXIT_THREAD_DEBUG_INFO;
  typedef struct EXIT_PROCESS_DEBUG_INFO {
    DWORD dwExitCode;
  } EXIT_PROCESS_DEBUG_INFO;
  typedef struct LOAD_DLL_DEBUG_INFO {
    HANDLE hFile;
    LPVOID lpBaseOfDll;
    DWORD dwDebugInfoFileOffset;
    DWORD nDebugInfoSize;
    LPVOID lpImageName;
    WORD fUnicode;
  } LOAD_DLL_DEBUG_INFO;
  typedef struct UNLOAD_DLL_DEBUG_INFO {
    LPVOID lpBaseOfDll;
  } UNLOAD_DLL_DEBUG_INFO;
  typedef struct OUTPUT_DEBUG_STRING_INFO {
    LPSTR lpDebugStringData;
    WORD fUnicode;
    WORD nDebugStringLength;
  } OUTPUT_DEBUG_STRING_INFO;
  typedef struct RIP_INFO {
    DWORD dwError;
    WINAPI_SET_LAST_ERROR_EX_TYPE dwType;
  } RIP_INFO;
  typedef union WINAPI_DEBUG_EVENT_u {
    EXCEPTION_DEBUG_INFO Exception;
    CREATE_THREAD_DEBUG_INFO CreateThread;
    CREATE_PROCESS_DEBUG_INFO CreateProcessInfo;
    EXIT_THREAD_DEBUG_INFO ExitThread;
    EXIT_PROCESS_DEBUG_INFO ExitProcess;
    LOAD_DLL_DEBUG_INFO LoadDll;
    UNLOAD_DLL_DEBUG_INFO UnloadDll;
    OUTPUT_DEBUG_STRING_INFO DebugString;
    RIP_INFO RipInfo;
  } WINAPI_DEBUG_EVENT_u;
  typedef struct DEBUG_EVENT {
    WINAPI_DEBUG_EVENT_CODE dwDebugEventCode;
    DWORD dwProcessId;
    DWORD dwThreadId;
    WINAPI_DEBUG_EVENT_u u;
  } DEBUG_EVENT;
  typedef DEBUG_EVENT *LPDEBUG_EVENT; //Pointer
  typedef struct WOW64_FLOATING_SAVE_AREA {
    DWORD ControlWord;
    DWORD StatusWord;
    DWORD TagWord;
    DWORD ErrorOffset;
    DWORD ErrorSelector;
    DWORD DataOffset;
    DWORD DataSelector;
    BYTE RegisterArea[WOW64_SIZE_OF_80387_REGISTERS];
    DWORD Cr0NpxState;
  } WOW64_FLOATING_SAVE_AREA;
  typedef DWORD WINAPI_WOW64_CONTEXT_FLAGS; //Alias
# pragma pack( push, 4 )
  typedef struct WOW64_CONTEXT {
    WINAPI_WOW64_CONTEXT_FLAGS ContextFlags;
    DWORD Dr0;
    DWORD Dr1;
    DWORD Dr2;
    DWORD Dr3;
    DWORD Dr6;
    DWORD Dr7;
    WOW64_FLOATING_SAVE_AREA FloatSave;
    DWORD SegGs;
    DWORD SegFs;
    DWORD SegEs;
    DWORD SegDs;
    DWORD Edi;
    DWORD Esi;
    DWORD Ebx;
    DWORD Edx;
    DWORD Ecx;
    DWORD Eax;
    DWORD Ebp;
    DWORD Eip;
    DWORD SegCs;
    DWORD EFlags;
    DWORD Esp;
    DWORD SegSs;
    BYTE ExtendedRegisters[WOW64_MAXIMUM_SUPPORTED_EXTENSION];
  } WOW64_CONTEXT;
# pragma pack( pop )
  typedef WOW64_CONTEXT *PWOW64_CONTEXT; //Pointer
  typedef struct MODULEENTRY32 {
    DWORD dwSize;
    DWORD th32ModuleID;
    DWORD th32ProcessID;
    DWORD GlblcntUsage;
    DWORD ProccntUsage;
    BYTE* modBaseAddr;
    DWORD modBaseSize;
    HMODULE hModule;
    TCHAR szModule[MAX_MODULE_NAME32_plus_1];
    TCHAR szExePath[MAX_PATH];
  } MODULEENTRY32;
  typedef MODULEENTRY32 *LPMODULEENTRY32; //Pointer
  typedef struct PROCESSENTRY32 {
    DWORD dwSize;
    DWORD cntUsage;
    DWORD th32ProcessID;
    ULONG_PTR th32DefaultHeapID;
    DWORD th32ModuleID;
    DWORD cntThreads;
    DWORD th32ParentProcessID;
    LONG pcPriClassBase;
    DWORD dwFlags;
    TCHAR szExeFile[MAX_PATH];
  } PROCESSENTRY32;
  typedef PROCESSENTRY32 *LPPROCESSENTRY32; //Pointer
  typedef UINT FILE_ID_TYPE; //Alias
  static const FILE_ID_TYPE FileIdType = 0;
  static const FILE_ID_TYPE ObjectIdType = 1;
  typedef union WINAPI_FILE_ID_DESCRIPTOR_u {
    LARGE_INTEGER FileId;
    GUID ObjectId;
  } WINAPI_FILE_ID_DESCRIPTOR_u;
  typedef struct FILE_ID_DESCRIPTOR {
    DWORD dwSize;
    FILE_ID_TYPE Type;
    WINAPI_FILE_ID_DESCRIPTOR_u ;
  } FILE_ID_DESCRIPTOR;
  typedef FILE_ID_DESCRIPTOR *LPFILE_ID_DESCRIPTOR; //Pointer
  typedef UINT PROCESSOR_CACHE_TYPE; //Alias
  static const PROCESSOR_CACHE_TYPE CacheUnified = 0;
  static const PROCESSOR_CACHE_TYPE CacheInstruction = 1;
  static const PROCESSOR_CACHE_TYPE CacheData = 2;
  static const PROCESSOR_CACHE_TYPE CacheTrace = 3;
  typedef BYTE WINAPI_CACHE_ASSOCIATIVITY; //Alias
  typedef struct CACHE_DESCRIPTOR {
    BYTE Level;
    WINAPI_CACHE_ASSOCIATIVITY Associativity;
    WORD LineSize;
    DWORD Size;
    PROCESSOR_CACHE_TYPE Type;
  } CACHE_DESCRIPTOR;
  typedef struct WINAPI_SYSTEM_LOGICAL_PROCESSOR_INFORMATION_u_s1 {
    BYTE Flags;
  } WINAPI_SYSTEM_LOGICAL_PROCESSOR_INFORMATION_u_s1;
  typedef struct WINAPI_SYSTEM_LOGICAL_PROCESSOR_INFORMATION_u_s2 {
    DWORD NodeNumber;
  } WINAPI_SYSTEM_LOGICAL_PROCESSOR_INFORMATION_u_s2;
  typedef union WINAPI_SYSTEM_LOGICAL_PROCESSOR_INFORMATION_u {
    WINAPI_SYSTEM_LOGICAL_PROCESSOR_INFORMATION_u_s1 ProcessorCore;
    WINAPI_SYSTEM_LOGICAL_PROCESSOR_INFORMATION_u_s2 NumaNode;
    CACHE_DESCRIPTOR Cache;
    ULONGLONG Reserved[2];
  } WINAPI_SYSTEM_LOGICAL_PROCESSOR_INFORMATION_u;
  typedef struct SYSTEM_LOGICAL_PROCESSOR_INFORMATION {
    ULONG_PTR ProcessorMask;
    LOGICAL_PROCESSOR_RELATIONSHIP Relationship;
    WINAPI_SYSTEM_LOGICAL_PROCESSOR_INFORMATION_u ;
  } SYSTEM_LOGICAL_PROCESSOR_INFORMATION;
  typedef SYSTEM_LOGICAL_PROCESSOR_INFORMATION *PSYSTEM_LOGICAL_PROCESSOR_INFORMATION; //Pointer
  typedef struct GROUP_AFFINITY {
    KAFFINITY Mask;
    WORD Group;
    WORD Reserved[3];
  } GROUP_AFFINITY;
  typedef GROUP_AFFINITY *PGROUP_AFFINITY; //Pointer
  typedef struct PROCESSOR_GROUP_INFO {
    BYTE MaximumProcessorCount;
    BYTE ActiveProcessorCount;
    BYTE Reserved[38];
    KAFFINITY ActiveProcessorMask;
  } PROCESSOR_GROUP_INFO;
  typedef struct GROUP_RELATIONSHIP {
    WORD MaximumGroupCount;
    WORD ActiveGroupCount;
    BYTE Reserved[20];
    PROCESSOR_GROUP_INFO GroupInfo[ANYSIZE_ARRAY];
  } GROUP_RELATIONSHIP;
  typedef struct CACHE_RELATIONSHIP {
    BYTE Level;
    WINAPI_CACHE_ASSOCIATIVITY Associativity;
    WORD LineSize;
    DWORD CacheSize;
    PROCESSOR_CACHE_TYPE Type;
    BYTE Reserved[20];
    GROUP_AFFINITY GroupMask;
  } CACHE_RELATIONSHIP;
  typedef struct NUMA_NODE_RELATIONSHIP {
    DWORD NodeNumber;
    BYTE Reserved[20];
    GROUP_AFFINITY GroupMask;
  } NUMA_NODE_RELATIONSHIP;
  typedef BYTE WINAPI_PROCESSOR_RELATIONSHIP_FLAGS; //Alias
  static const WINAPI_PROCESSOR_RELATIONSHIP_FLAGS LTP_PC_SMT = 0x1;
  typedef struct PROCESSOR_RELATIONSHIP {
    WINAPI_PROCESSOR_RELATIONSHIP_FLAGS Flags;
    BYTE Reserved[21];
    WORD GroupCount;
    GROUP_AFFINITY GroupMask[ANYSIZE_ARRAY];
  } PROCESSOR_RELATIONSHIP;
  typedef union WINAPI_SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX_u {
    PROCESSOR_RELATIONSHIP Processor;
    NUMA_NODE_RELATIONSHIP NumaNode;
    CACHE_RELATIONSHIP Cache;
    GROUP_RELATIONSHIP Group;
  } WINAPI_SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX_u;
  typedef struct SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX {
    LOGICAL_PROCESSOR_RELATIONSHIP Relationship;
    DWORD Size;
    WINAPI_SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX_u ;
  } SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX;
  typedef SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX *PSYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX; //Pointer
  typedef BYTE WINAPI_DCB_PARITY; //Alias
  static const WINAPI_DCB_PARITY NOPARITY = 0;
  static const WINAPI_DCB_PARITY ODDPARITY = 1;
  static const WINAPI_DCB_PARITY EVENPARITY = 2;
  static const WINAPI_DCB_PARITY MARKPARITY = 3;
  static const WINAPI_DCB_PARITY SPACEPARITY = 4;
  typedef BYTE WINAPI_DCB_STOPBITS; //Alias
  static const WINAPI_DCB_STOPBITS ONESTOPBIT = 0;
  static const WINAPI_DCB_STOPBITS ONE5STOPBITS = 1;
  static const WINAPI_DCB_STOPBITS TWOSTOPBITS = 2;
  typedef struct DCB {
    DWORD DCBlength;
    DWORD BaudRate;
    DWORD fDummy2;
    WORD wReserved;
    WORD XonLim;
    WORD XoffLim;
    BYTE ByteSize;
    WINAPI_DCB_PARITY Parity;
    WINAPI_DCB_STOPBITS StopBits;
    char XonChar;
    char XoffChar;
    char ErrorChar;
    char EofChar;
    char EvtChar;
    WORD wReserved1;
  } DCB;
  typedef DCB *LPDCB; //Pointer
  typedef DWORD WINAPI_SERIAL_PROVIDER_TYPE; //Alias
  typedef DWORD WINAPI_BAUD_FLAGS; //Alias
  typedef DWORD WINAPI_PROVIDER_SUB_TYPE; //Alias
  static const WINAPI_PROVIDER_SUB_TYPE PST_UNSPECIFIED = 0x00000000;
  static const WINAPI_PROVIDER_SUB_TYPE PST_RS232 = 0x00000001;
  static const WINAPI_PROVIDER_SUB_TYPE PST_PARALLELPORT = 0x00000002;
  static const WINAPI_PROVIDER_SUB_TYPE PST_RS422 = 0x00000003;
  static const WINAPI_PROVIDER_SUB_TYPE PST_RS423 = 0x00000004;
  static const WINAPI_PROVIDER_SUB_TYPE PST_RS449 = 0x00000005;
  static const WINAPI_PROVIDER_SUB_TYPE PST_MODEM = 0x00000006;
  static const WINAPI_PROVIDER_SUB_TYPE PST_FAX = 0x00000021;
  static const WINAPI_PROVIDER_SUB_TYPE PST_SCANNER = 0x00000022;
  static const WINAPI_PROVIDER_SUB_TYPE PST_NETWORK_BRIDGE = 0x00000100;
  static const WINAPI_PROVIDER_SUB_TYPE PST_LAT = 0x00000101;
  static const WINAPI_PROVIDER_SUB_TYPE PST_TCPIP_TELNET = 0x00000102;
  static const WINAPI_PROVIDER_SUB_TYPE PST_X25 = 0x00000103;
  typedef DWORD WINAPI_PROVIDER_CAPABILITIES; //Alias
  typedef DWORD WINAPI_SETTABLE_PARAMS; //Alias
  typedef WORD WINAPI_DATABITS_FLAGS; //Alias
  typedef WORD WINAPI_STOPBITS_PARITY_FLAGS; //Alias
  typedef DWORD WINAPI_COMMPROP_SPEC; //Alias
  static const WINAPI_COMMPROP_SPEC COMMPROP_INITIALIZED = 0xE73CF52E;
  typedef struct COMMPROP {
    WORD wPacketLength;
    WORD wPacketVersion;
    WINAPI_SERIAL_PROVIDER_TYPE dwServiceMask;
    DWORD dwReserved1;
    DWORD dwMaxTxQueue;
    DWORD dwMaxRxQueue;
    WINAPI_BAUD_FLAGS dwMaxBaud;
    WINAPI_PROVIDER_SUB_TYPE dwProvSubType;
    WINAPI_PROVIDER_CAPABILITIES dwProvCapabilities;
    WINAPI_SETTABLE_PARAMS dwSettableParams;
    WINAPI_BAUD_FLAGS dwSettableBaud;
    WINAPI_DATABITS_FLAGS wSettableData;
    WINAPI_STOPBITS_PARITY_FLAGS wSettableStopParity;
    DWORD dwCurrentTxQueue;
    DWORD dwCurrentRxQueue;
    WINAPI_COMMPROP_SPEC dwProvSpec1;
    DWORD dwProvSpec2;
    WCHAR wcProvChar[1];
  } COMMPROP;
  typedef COMMPROP *LPCOMMPROP; //Pointer
  typedef struct COMMCONFIG {
    DWORD dwSize;
    WORD wVersion;
    WORD wReserved;
    DCB dcb;
    WINAPI_PROVIDER_SUB_TYPE dwProviderSubType;
    DWORD dwProviderOffset;
    DWORD dwProviderSize;
    WCHAR wcProviderData[1];
  } COMMCONFIG;
  typedef COMMCONFIG *LPCOMMCONFIG; //Pointer
  typedef struct CONSOLE_SCREEN_BUFFER_INFOEX {
    ULONG cbSize;
    COORD dwSize;
    COORD dwCursorPosition;
    WINAPI_ConsoleAttribute wAttributes;
    SMALL_RECT srWindow;
    COORD dwMaximumWindowSize;
    WORD wPopupAttributes;
    BOOL bFullscreenSupported;
    COLORREF ColorTable[16];
  } CONSOLE_SCREEN_BUFFER_INFOEX;
  typedef CONSOLE_SCREEN_BUFFER_INFOEX *PCONSOLE_SCREEN_BUFFER_INFOEX; //Pointer
  typedef UINT WINAPI_FONT_FAMILY; //Alias
  typedef struct CONSOLE_FONT_INFOEX {
    ULONG cbSize;
    DWORD nFont;
    COORD dwFontSize;
    WINAPI_FONT_FAMILY FontFamily;
    UINT FontWeight;
    WCHAR FaceName[LF_FACESIZE];
  } CONSOLE_FONT_INFOEX;
  typedef CONSOLE_FONT_INFOEX *PCONSOLE_FONT_INFOEX; //Pointer
  typedef WORD WINAPI_INPUT_RECORD_TYPE; //Alias
  static const WINAPI_INPUT_RECORD_TYPE KEY_EVENT = 0x0001;
  static const WINAPI_INPUT_RECORD_TYPE MOUSE_EVENT = 0x0002;
  static const WINAPI_INPUT_RECORD_TYPE WINDOW_BUFFER_SIZE_EVENT = 0x0004;
  static const WINAPI_INPUT_RECORD_TYPE MENU_EVENT = 0x0008;
  static const WINAPI_INPUT_RECORD_TYPE FOCUS_EVENT = 0x0010;
  typedef union WINAPI_KEY_EVENT_RECORD_u {
    WCHAR UnicodeChar;
    CHAR AsciiChar;
  } WINAPI_KEY_EVENT_RECORD_u;
  typedef DWORD WINAPI_ControlKeyState; //Alias
  typedef struct KEY_EVENT_RECORD {
    BOOL bKeyDown;
    WORD wRepeatCount;
    WINAPI_VirtKeyCode wVirtualKeyCode;
    WORD wVirtualScanCode;
    WINAPI_KEY_EVENT_RECORD_u uChar;
    WINAPI_ControlKeyState dwControlKeyState;
  } KEY_EVENT_RECORD;
  typedef DWORD WINAPI_MOUSE_EVENT_STATE; //Alias
  typedef DWORD WINAPI_MOUSE_EVENT_FLAGS; //Alias
  typedef struct MOUSE_EVENT_RECORD {
    COORD dwMousePosition;
    WINAPI_MOUSE_EVENT_STATE dwButtonState;
    DWORD dwControlKeyState;
    WINAPI_MOUSE_EVENT_FLAGS dwEventFlags;
  } MOUSE_EVENT_RECORD;
  typedef struct WINDOW_BUFFER_SIZE_RECORD {
    COORD dwSize;
  } WINDOW_BUFFER_SIZE_RECORD;
  typedef struct MENU_EVENT_RECORD {
    UINT dwCommandId;
  } MENU_EVENT_RECORD;
  typedef struct FOCUS_EVENT_RECORD {
    BOOL bSetFocus;
  } FOCUS_EVENT_RECORD;
  typedef union WINAPI_INPUT_RECORD_u {
    KEY_EVENT_RECORD KeyEvent;
    MOUSE_EVENT_RECORD MouseEvent;
    WINDOW_BUFFER_SIZE_RECORD WindowBufferSizeEvent;
    MENU_EVENT_RECORD MenuEvent;
    FOCUS_EVENT_RECORD FocusEvent;
  } WINAPI_INPUT_RECORD_u;
  typedef struct INPUT_RECORD {
    WINAPI_INPUT_RECORD_TYPE EventType;
    WINAPI_INPUT_RECORD_u Event;
  } INPUT_RECORD;
  typedef INPUT_RECORD *PINPUT_RECORD; //Pointer
  typedef struct UNWIND_HISTORY_TABLE_ENTRY {
    DWORD64 ImageBase;
    PRUNTIME_FUNCTION FunctionEntry;
  } UNWIND_HISTORY_TABLE_ENTRY;
  enum { UNWIND_HISTORY_TABLE_SIZE = 12 };
  typedef struct UNWIND_HISTORY_TABLE {
    DWORD Count;
    BYTE LocalHint;
    BYTE GlobalHint;
    BYTE Search;
    BYTE Once;
    DWORD64 LowAddress;
    DWORD64 HighAddress;
    UNWIND_HISTORY_TABLE_ENTRY Entry[UNWIND_HISTORY_TABLE_SIZE];
  } UNWIND_HISTORY_TABLE;
  typedef UNWIND_HISTORY_TABLE *PUNWIND_HISTORY_TABLE; //Pointer
  typedef struct CPINFOEX {
    UINT MaxCharSize;
    BYTE DefaultChar[MAX_DEFAULTCHAR];
    BYTE LeadByte[MAX_LEADBYTES];
    WCHAR UnicodeDefaultChar;
    UINT CodePage;
    TCHAR CodePageName[MAX_PATH];
  } CPINFOEX;
  typedef CPINFOEX *LPCPINFOEX; //Pointer
  typedef struct CPINFO {
    UINT MaxCharSize;
    BYTE DefaultChar[MAX_DEFAULTCHAR];
    BYTE LeadByte[MAX_LEADBYTES];
  } CPINFO;
  typedef CPINFO *LPCPINFO; //Pointer
  typedef struct WINAPI_REASON_CONTEXT_u_s {
    HMODULE LocalizedReasonModule;
    ULONG LocalizedReasonId;
    ULONG ReasonStringCount;
    LPWSTR* ReasonStrings;
  } WINAPI_REASON_CONTEXT_u_s;
  typedef union WINAPI_REASON_CONTEXT_u {
    WINAPI_REASON_CONTEXT_u_s Detailed;
    LPWSTR SimpleReasonString;
  } WINAPI_REASON_CONTEXT_u;
  typedef DWORD WINAPI_POWER_REQUEST_CONTEXT_FLAGS; //Alias
  static const WINAPI_POWER_REQUEST_CONTEXT_FLAGS POWER_REQUEST_CONTEXT_SIMPLE_STRING = 0x00000001;
  static const WINAPI_POWER_REQUEST_CONTEXT_FLAGS POWER_REQUEST_CONTEXT_DETAILED_STRING = 0x00000002;
  typedef struct REASON_CONTEXT {
    ULONG Version;
    WINAPI_POWER_REQUEST_CONTEXT_FLAGS Flags;
    WINAPI_REASON_CONTEXT_u Reason;
  } REASON_CONTEXT;
  typedef REASON_CONTEXT *PREASON_CONTEXT; //Pointer
  typedef struct DYNAMIC_TIME_ZONE_INFORMATION {
    LONG Bias;
    WCHAR StandardName[32];
    SYSTEMTIME StandardDate;
    LONG StandardBias;
    WCHAR DaylightName[32];
    SYSTEMTIME DaylightDate;
    LONG DaylightBias;
    WCHAR TimeZoneKeyName[128];
    BOOLEAN DynamicDaylightTimeDisabled;
  } DYNAMIC_TIME_ZONE_INFORMATION;
  typedef DYNAMIC_TIME_ZONE_INFORMATION *PDYNAMIC_TIME_ZONE_INFORMATION; //Pointer
  typedef union WINAPI_TP_CALLBACK_ENVIRON_V3_u {
    DWORD Flags;
  } WINAPI_TP_CALLBACK_ENVIRON_V3_u;
  typedef struct TP_CALLBACK_ENVIRON_V3 {
    TP_VERSION Version;
    PTP_POOL Pool;
    PTP_CLEANUP_GROUP CleanupGroup;
    PTP_CLEANUP_GROUP_CANCEL_CALLBACK CleanupGroupCancelCallback;
    PVOID RaceDll;
    ACTIVATION_CONTEXT* ActivationContext;
    PTP_SIMPLE_CALLBACK FinalizationCallback;
    WINAPI_TP_CALLBACK_ENVIRON_V3_u u;
    TP_CALLBACK_PRIORITY CallbackPriority;
    DWORD Size;
  } TP_CALLBACK_ENVIRON_V3;
  typedef TP_CALLBACK_ENVIRON_V3 *PTP_CALLBACK_ENVIRON; //Pointer
  typedef struct WINAPI_PROCESS_HEAP_ENTRY_u_s1 {
    HANDLE hMem;
    DWORD dwReserved[3];
  } WINAPI_PROCESS_HEAP_ENTRY_u_s1;
  typedef struct WINAPI_PROCESS_HEAP_ENTRY_u_s2 {
    DWORD dwCommittedSize;
    DWORD dwUnCommittedSize;
    LPVOID lpFirstBlock;
    LPVOID lpLastBlock;
  } WINAPI_PROCESS_HEAP_ENTRY_u_s2;
  typedef union WINAPI_PROCESS_HEAP_ENTRY_u {
    WINAPI_PROCESS_HEAP_ENTRY_u_s1 Block;
    WINAPI_PROCESS_HEAP_ENTRY_u_s2 Region;
  } WINAPI_PROCESS_HEAP_ENTRY_u;
  typedef WORD WINAPI_PROCESS_HEAP_FLAGS; //Alias
  typedef struct PROCESS_HEAP_ENTRY {
    PVOID lpData;
    DWORD cbData;
    BYTE cbOverhead;
    BYTE iRegionIndex;
    WINAPI_PROCESS_HEAP_FLAGS wFlags;
    WINAPI_PROCESS_HEAP_ENTRY_u ;
  } PROCESS_HEAP_ENTRY;
  typedef PROCESS_HEAP_ENTRY *LPPROCESS_HEAP_ENTRY; //Pointer
  typedef UINT HARDWARE_COUNTER_TYPE; //Alias
  static const HARDWARE_COUNTER_TYPE PMCCounter = 0;
  typedef struct HARDWARE_COUNTER_DATA {
    HARDWARE_COUNTER_TYPE Type;
    DWORD Reserved;
    DWORD64 Value;
  } HARDWARE_COUNTER_DATA;
  enum { MAX_HW_COUNTERS = 16 };
  typedef struct PERFORMANCE_DATA {
    WORD Size;
    BYTE Version;
    BYTE HwCountersCount;
    DWORD ContextSwitchCount;
    DWORD64 WaitReasonBitMap;
    DWORD64 CycleTime;
    DWORD RetryCount;
    DWORD Reserved;
    HARDWARE_COUNTER_DATA HwCounters[MAX_HW_COUNTERS];
  } PERFORMANCE_DATA;
  typedef PERFORMANCE_DATA *PPERFORMANCE_DATA; //Pointer
  typedef DWORD WINAPI_DDD_FLAGS; //Alias
  typedef UINT WINAPI_DRIVE_TYPE; //Alias
  static const WINAPI_DRIVE_TYPE DRIVE_UNKNOWN = 0;
  static const WINAPI_DRIVE_TYPE DRIVE_NO_ROOT_DIR = 1;
  static const WINAPI_DRIVE_TYPE DRIVE_REMOVABLE = 2;
  static const WINAPI_DRIVE_TYPE DRIVE_FIXED = 3;
  static const WINAPI_DRIVE_TYPE DRIVE_REMOTE = 4;
  static const WINAPI_DRIVE_TYPE DRIVE_CDROM = 5;
  static const WINAPI_DRIVE_TYPE DRIVE_RAMDISK = 6;
  typedef DWORD WINAPI_FILE_SYSTEM_FLAGS; //Alias
  typedef WINAPI_FILE_SYSTEM_FLAGS *WINAPI_LPFILE_SYSTEM_FLAGS; //Pointer
  typedef DWORD WINAPI_NMPWAIT; //Alias
  static const WINAPI_NMPWAIT NMPWAIT_WAIT_FOREVER = 0xffffffff;
  static const WINAPI_NMPWAIT NMPWAIT_NOWAIT = 0x00000001;
  static const WINAPI_NMPWAIT NMPWAIT_USE_DEFAULT_WAIT = 0x00000000;
  typedef DWORD WINAPI_PIPE_ACCESS; //Alias
  typedef DWORD WINAPI_PIPE_MODE; //Alias
  typedef DWORD WINAPI_PIPE_STATE; //Alias
  typedef DWORD WINAPI_PIPE_TYPE; //Alias
  typedef DWORD WINAPI_GetModuleHandleExFlags; //Alias
  typedef DWORD WINAPI_LoadLibraryExFlags; //Alias
  typedef DWORD WINAPI_CreateToolhelp32SnapshotFlags; //Alias
  typedef DWORD WINAPI_LOAD_LIBRARY_SEARCH_FLAGS; //Alias
  typedef WINAPI_ProcessHandle WINAPI_PROCESS_THREAD_HANDLE; //Alias
  BOOL                         CheckRemoteDebuggerPresent(              WINAPI_ProcessHandle hProcess, PBOOL pbDebuggerPresent);
  BOOL                         ContinueDebugEvent(                      DWORD dwProcessId, DWORD dwThreadId, WINAPI_ContinueStatusFlag dwContinueStatus);
  BOOL                         CopyExtendedContext(                     PCONTEXT_EX Destination, DWORD ContextFlags, PCONTEXT_EX Source);
  BOOL                         DebugActiveProcess(                      DWORD dwProcessId);
  BOOL                         DebugActiveProcessStop(                  DWORD dwProcessId);
  VOID                         DebugBreak(                              );
  BOOL                         DebugBreakProcess(                       HANDLE Process);
  BOOL                         DebugSetProcessKillOnExit(               BOOL KillOnExit);
  VOID                         FatalExit(                               int ExitCode);
  BOOL                         FlushInstructionCache(                   WINAPI_ProcessHandle hProcess, LPCVOID lpBaseAddress, SIZE_T dwSize);
  DWORD64                      GetEnabledExtendedFeatures(              DWORD64 FeatureMask);
  BOOL                         GetExtendedContextLength(                DWORD ContextFlags, PDWORD ContextLength);
  DWORD64                      GetExtendedFeaturesMask(                 PCONTEXT_EX ContextEx);
  BOOL                         GetThreadContext(                        WINAPI_ThreadHandle hThread, LPCONTEXT lpContext);
  BOOL                         GetThreadSelectorEntry(                  WINAPI_ThreadHandle hThread, DWORD dwSelector, LPLDT_ENTRY lpSelectorEntry);
  BOOL                         InitializeExtendedContext(               PVOID Context, DWORD ContextFlags, PCONTEXT_EX* ContextEx);
  BOOL                         IsDebuggerPresent(                       );
  PVOID                        LocateExtendedFeature(                   PCONTEXT_EX ContextEx, DWORD FeatureId, PDWORD Length);
  PCONTEXT                     LocateLegacyContext(                     PCONTEXT_EX ContextEx, PDWORD Length);
  void                         OutputDebugString(                       LPCTSTR lpOutputString);
  BOOL                         ReadProcessMemory(                       WINAPI_ProcessHandle hProcess, LPCVOID lpBaseAddress, LPVOID lpBuffer, SIZE_T nSize, SIZE_T* lpNumberOfBytesRead);
  VOID                         SetExtendedFeaturesMask(                 PCONTEXT_EX ContextEx, DWORD64 FeatureMask);
  BOOL                         SetThreadContext(                        WINAPI_ThreadHandle hThread, CONTEXT* lpContext);
  BOOL                         WaitForDebugEvent(                       LPDEBUG_EVENT lpDebugEvent, WINAPI_WaitTimeout dwMilliseconds);
  BOOL                         Wow64GetThreadContext(                   WINAPI_ThreadHandle hThread, PWOW64_CONTEXT lpContext);
  BOOL                         Wow64GetThreadSelectorEntry(             WINAPI_ThreadHandle hThread, DWORD dwSelector, PWOW64_LDT_ENTRY lpSelectorEntry);
  BOOL                         Wow64SetThreadContext(                   WINAPI_ThreadHandle hThread, WOW64_CONTEXT* lpContext);
  BOOL                         WriteProcessMemory(                      WINAPI_ProcessHandle hProcess, LPVOID lpBaseAddress, LPCVOID lpBuffer, SIZE_T nSize, SIZE_T* lpNumberOfBytesWritten);
  BOOL                         DisableThreadLibraryCalls(               HMODULE hModule);
  BOOL                         FreeLibrary(                             HMODULE hModule);
  VOID                         FreeLibraryAndExitThread(                HMODULE hModule, DWORD dwExitCode);
  DWORD                        GetDllDirectory(                         DWORD nBufferLength, LPTSTR lpBuffer);
  DWORD                        GetModuleFileName(                       HMODULE hModule, LPTSTR lpFilename, DWORD nSize);
  HMODULE                      GetModuleHandle(                         LPCTSTR lpModuleName);
  BOOL                         GetModuleHandleEx(                       WINAPI_GetModuleHandleExFlags dwFlags, LPCTSTR lpModuleName, HMODULE* phModule);
  FARPROC                      GetProcAddress(                          HMODULE hModule, LPCSTR lpProcName);
  HMODULE                      LoadLibrary(                             LPCTSTR lpFileName);
  HMODULE                      LoadLibraryEx(                           LPCTSTR lpFileName, HANDLE hFile, WINAPI_LoadLibraryExFlags dwFlags);
  DWORD                        LoadModule(                              LPCSTR lpModuleName, LPVOID lpParameterBlock);
  BOOL                         SetDllDirectory(                         LPCTSTR lpPathName);
  DLL_DIRECTORY_COOKIE         AddDllDirectory(                         PCWSTR NewDirectory);
  BOOL                         RemoveDllDirectory(                      DLL_DIRECTORY_COOKIE Cookie);
  BOOL                         SetDefaultDllDirectories(                WINAPI_LOAD_LIBRARY_SEARCH_FLAGS DirectoryFlags);
  WINAPI_FILE_HANDLE           CreateToolhelp32Snapshot(                WINAPI_CreateToolhelp32SnapshotFlags dwFlags, DWORD th32ProcessID);
  BOOL                         Heap32First(                             LPHEAPENTRY32 lphe, DWORD th32ProcessID, ULONG_PTR th32HeapID);
  BOOL                         Heap32ListFirst(                         HANDLE hSnapshot, LPHEAPLIST32 lphl);
  BOOL                         Heap32ListNext(                          HANDLE hSnapshot, LPHEAPLIST32 lphl);
  BOOL                         Heap32Next(                              LPHEAPENTRY32 lphe);
  BOOL                         Module32First(                           HANDLE hSnapshot, LPMODULEENTRY32 lpme);
  BOOL                         Module32Next(                            HANDLE hSnapshot, LPMODULEENTRY32 lpme);
  BOOL                         Process32First(                          HANDLE hSnapshot, LPPROCESSENTRY32 lppe);
  BOOL                         Process32Next(                           HANDLE hSnapshot, LPPROCESSENTRY32 lppe);
  BOOL                         Thread32First(                           HANDLE hSnapshot, LPTHREADENTRY32 lpte);
  BOOL                         Thread32Next(                            HANDLE hSnapshot, LPTHREADENTRY32 lpte);
  BOOL                         Toolhelp32ReadProcessMemory(             DWORD th32ProcessID, LPCVOID lpBaseAddress, LPVOID lpBuffer, SIZE_T cbRead, SIZE_T lpNumberOfBytesRead);
  VOID                         ApplicationRecoveryFinished(             BOOL bSuccess);
  HRESULT                      ApplicationRecoveryInProgress(           PBOOL pbCanceled);
  HRESULT                      GetApplicationRecoveryCallback(          WINAPI_ProcessHandle hProcess, APPLICATION_RECOVERY_CALLBACK* pRecoveryCallback, PVOID* ppvParameter, DWORD dwPingInterval, DWORD dwFlags);
  HRESULT                      GetApplicationRestartSettings(           WINAPI_ProcessHandle hProcess, PWSTR pwzCommandline, PDWORD pcchSize, PDWORD pdwFlags);
  HRESULT                      RegisterApplicationRecoveryCallback(     APPLICATION_RECOVERY_CALLBACK pRecoveryCallback, PVOID pvParameter, DWORD dwPingInterval, WINAPI_ApplicationRestartFlags dwFlags);
  HRESULT                      RegisterApplicationRestart(              PCWSTR pwzCommandline, WINAPI_ApplicationRestartFlags dwFlags);
  HRESULT                      UnregisterApplicationRecoveryCallback(   );
  HRESULT                      UnregisterApplicationRestart(            );
  UINT                         GetPrivateProfileInt(                    LPCTSTR lpAppName, LPCTSTR lpKeyName, INT nDefault, LPCTSTR lpFileName);
  DWORD                        GetPrivateProfileSection(                LPCTSTR lpAppName, LPTSTR lpReturnedString, DWORD nSize, LPCTSTR lpFileName);
  DWORD                        GetPrivateProfileSectionNames(           LPTSTR lpszReturnBuffer, DWORD nSize, LPCTSTR lpFileName);
  DWORD                        GetPrivateProfileString(                 LPCTSTR lpAppName, LPCTSTR lpKeyName, LPCTSTR lpDefault, LPTSTR lpReturnedString, DWORD nSize, LPCTSTR lpFileName);
  BOOL                         GetPrivateProfileStruct(                 LPCTSTR lpszSection, LPCTSTR lpszKey, LPVOID lpStruct, UINT uSizeStruct, LPCTSTR szFile);
  UINT                         GetProfileInt(                           LPCTSTR lpAppName, LPCTSTR lpKeyName, INT nDefault);
  DWORD                        GetProfileSection(                       LPCTSTR lpAppName, LPTSTR lpReturnedString, DWORD nSize);
  DWORD                        GetProfileString(                        LPCTSTR lpAppName, LPCTSTR lpKeyName, LPCTSTR lpDefault, LPTSTR lpReturnedString, DWORD nSize);
  BOOL                         WritePrivateProfileSection(              LPCTSTR lpAppName, LPCTSTR lpString, LPCTSTR lpFileName);
  BOOL                         WritePrivateProfileString(               LPCTSTR lpAppName, LPCTSTR lpKeyName, LPCTSTR lpString, LPCTSTR lpFileName);
  BOOL                         WritePrivateProfileStruct(               LPCTSTR lpszSection, LPCTSTR lpszKey, LPVOID lpStruct, UINT uSizeStruct, LPCTSTR szFile);
  BOOL                         WriteProfileSection(                     LPCTSTR lpAppName, LPCTSTR lpString);
  BOOL                         WriteProfileString(                      LPCTSTR lpAppName, LPCTSTR lpKeyName, LPCTSTR lpString);
  HFILE                        _lopen(                                  LPCSTR lpPathName, int iReadWrite);
  HFILE                        _lcreat(                                 LPCSTR lpPathName, WINAPI_lcreatAttribute iAttribute);
  UINT                         _lread(                                  HFILE hFile, LPVOID lpBuffer, UINT uBytes);
  UINT                         _lwrite(                                 HFILE hFile, LPVOID lpBuffer, UINT uBytes);
  long                         _hread(                                  HFILE hFile, LPVOID lpBuffer, LONG lBytes);
  long                         _hwrite(                                 HFILE hFile, LPVOID lpBuffer, LONG lBytes);
  HFILE                        _lclose(                                 HFILE hFile);
  LONG                         _llseek(                                 HFILE hFile, LONG lOffset, WINAPI_SEEK_TYPE iOrigin);
  BOOL                         AreFileApisANSI(                         );
  BOOL                         CheckNameLegalDOS8Dot3(                  LPCTSTR lpName, LPSTR lpOemName, DWORD OemNameSize, PBOOL pbNameContainsSpaces, PBOOL pbNameLegal);
  BOOL                         CopyFile(                                LPCTSTR lpExistingFileName, LPCTSTR lpNewFileName, BOOL bFailIfExists);
  BOOL                         CopyFileEx(                              LPCTSTR lpExistingFileName, LPCTSTR lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, LPVOID lpData, LPBOOL pbCancel, DWORD dwCopyFlags);
  BOOL                         CopyFileTransacted(                      LPCTSTR lpExistingFileName, LPCTSTR lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, LPVOID lpData, LPBOOL pbCancel, DWORD dwCopyFlags, HANDLE hTransaction);
  WINAPI_FILE_HANDLE           CreateFile(                              LPCTSTR lpFileName, WINAPI_FILE_ACCESS_MASK dwDesiredAccess, WINAPI_FileShareMode dwShareMode, LPSECURITY_ATTRIBUTES lpSecurityAttributes, WINAPI_CreationDisposition dwCreationDisposition, WINAPI_FlagsAndAttributes dwFlagsAndAttributes, HANDLE hTemplateFile);
  WINAPI_FILE_HANDLE           CreateFileTransacted(                    LPCTSTR lpFileName, WINAPI_FILE_ACCESS_MASK dwDesiredAccess, WINAPI_FileShareMode dwShareMode, LPSECURITY_ATTRIBUTES lpSecurityAttributes, WINAPI_CreationDisposition dwCreationDisposition, WINAPI_FlagsAndAttributes dwFlagsAndAttributes, HANDLE hTemplateFile, HANDLE hTransaction, PUSHORT pusMiniVersion, PVOID pExtendedParameter);
  BOOL                         CreateHardLink(                          LPCTSTR lpFileName, LPCTSTR lpExistingFileName, LPSECURITY_ATTRIBUTES lpSecurityAttributes);
  BOOL                         CreateHardLinkTransacted(                LPCTSTR lpFileName, LPCTSTR lpExistingFileName, LPSECURITY_ATTRIBUTES lpSecurityAttributes, HANDLE hTransaction);
  BOOLEAN                      CreateSymbolicLink(                      LPTSTR lpSymlinkFileName, LPTSTR lpTargetFileName, WINAPI_CreateSymbolicLinkFlags dwFlags);
  BOOLEAN                      CreateSymbolicLinkTransacted(            LPTSTR lpSymlinkFileName, LPTSTR lpTargetFileName, WINAPI_CreateSymbolicLinkFlags dwFlags, HANDLE hTransaction);
  BOOL                         DeleteFile(                              LPCTSTR lpFileName);
  BOOL                         DeleteFileTransacted(                    LPCTSTR lpFileName, HANDLE hTransaction);
  BOOL                         FindClose(                               HANDLE hFindFile);
  WINAPI_FILE_HANDLE           FindFirstFile(                           LPCTSTR lpFileName, LPWIN32_FIND_DATA lpFindFileData);
  WINAPI_FILE_HANDLE           FindFirstFileEx(                         LPCTSTR lpFileName, FINDEX_INFO_LEVELS fInfoLevelId, LPVOID lpFindFileData, FINDEX_SEARCH_OPS fSearchOp, LPVOID lpSearchFilter, WINAPI_FindFirstFileExFlags dwAdditionalFlags);
  WINAPI_FILE_HANDLE           FindFirstFileNameTransactedW(            LPCWSTR lpFileName, DWORD dwFlags, LPDWORD StringLength, PWCHAR LinkName, HANDLE hTransaction);
  WINAPI_FILE_HANDLE           FindFirstFileNameW(                      LPCWSTR lpFileName, DWORD dwFlags, LPDWORD StringLength, PWCHAR LinkName);
  WINAPI_FILE_HANDLE           FindFirstFileTransacted(                 LPCTSTR lpFileName, FINDEX_INFO_LEVELS fInfoLevelId, LPVOID lpFindFileData, FINDEX_SEARCH_OPS fSearchOp, LPVOID lpSearchFilter, WINAPI_FindFirstFileExFlags dwAdditionalFlags, HANDLE hTransaction);
  WINAPI_FILE_HANDLE           FindFirstStreamTransactedW(              LPCWSTR lpFileName, STREAM_INFO_LEVELS InfoLevel, LPVOID lpFindStreamData, DWORD dwFlags, HANDLE hTransaction);
  WINAPI_FILE_HANDLE           FindFirstStreamW(                        LPCWSTR lpFileName, STREAM_INFO_LEVELS InfoLevel, LPVOID lpFindStreamData, DWORD dwFlags);
  BOOL                         FindNextFile(                            HANDLE hFindFile, LPWIN32_FIND_DATA lpFindFileData);
  BOOL                         FindNextFileNameW(                       HANDLE hFindStream, LPDWORD StringLength, PWCHAR LinkName);
  BOOL                         FindNextStreamW(                         HANDLE hFindStream, LPVOID lpFindStreamData);
  BOOL                         GetBinaryType(                           LPCTSTR lpApplicationName, WINAPI_GetBinaryTypeResult* lpBinaryType);
  DWORD                        GetCompressedFileSize(                   LPCTSTR lpFileName, LPDWORD lpFileSizeHigh);
  DWORD                        GetCompressedFileSizeTransacted(         LPCTSTR lpFileName, LPDWORD lpFileSizeHigh, HANDLE hTransaction);
  WINAPI_FileAttributes        GetFileAttributes(                       LPCTSTR lpFileName);
  BOOL                         GetFileAttributesEx(                     LPCTSTR lpFileName, GET_FILEEX_INFO_LEVELS fInfoLevelId, LPVOID lpFileInformation);
  BOOL                         GetFileAttributesTransacted(             LPCTSTR lpFileName, GET_FILEEX_INFO_LEVELS fInfoLevelId, LPVOID lpFileInformation, HANDLE hTransaction);
  BOOL                         GetFileBandwidthReservation(             HANDLE hFile, LPDWORD lpPeriodMilliseconds, LPDWORD lpBytesPerPeriod, LPBOOL pDiscardable, LPDWORD lpTransferSize, LPDWORD lpNumOutstandingRequests);
  BOOL                         GetFileInformationByHandle(              HANDLE hFile, LPBY_HANDLE_FILE_INFORMATION lpFileInformation);
  BOOL                         GetFileInformationByHandleEx(            HANDLE hFile, FILE_INFO_BY_HANDLE_CLASS FileInformationClass, LPVOID lpFileInformation, DWORD dwBufferSize);
  DWORD                        GetFileSize(                             HANDLE hFile, LPDWORD lpFileSizeHigh);
  BOOL                         GetFileSizeEx(                           HANDLE hFile, PLARGE_INTEGER lpFileSize);
  WINAPI_FileType              GetFileType(                             HANDLE hFile);
  DWORD                        GetFinalPathNameByHandle(                HANDLE hFile, LPTSTR lpszFilePath, DWORD cchFilePath, WINAPI_GetFinalPathNameByHandleFlags dwFlags);
  DWORD                        GetFullPathName(                         LPCTSTR lpFileName, DWORD nBufferLength, LPTSTR lpBuffer, LPTSTR* lpFilePart);
  DWORD                        GetFullPathNameTransacted(               LPCTSTR lpFileName, DWORD nBufferLength, LPTSTR lpBuffer, LPTSTR* lpFilePart, HANDLE hTransaction);
  DWORD                        GetLongPathName(                         LPCTSTR lpszShortPath, LPTSTR lpszLongPath, DWORD cchBuffer);
  DWORD                        GetLongPathNameTransacted(               LPCTSTR lpszShortPath, LPTSTR lpszLongPath, DWORD cchBuffer, HANDLE hTransaction);
  DWORD                        GetShortPathName(                        LPCTSTR lpszLongPath, LPTSTR lpszShortPath, DWORD cchBuffer);
  UINT                         GetTempFileName(                         LPCTSTR lpPathName, LPCTSTR lpPrefixString, UINT uUnique, LPTSTR lpTempFileName);
  DWORD                        GetTempPath(                             DWORD nBufferLength, LPTSTR lpBuffer);
  BOOL                         MoveFile(                                LPCTSTR lpExistingFileName, LPCTSTR lpNewFileName);
  BOOL                         MoveFileEx(                              LPCTSTR lpExistingFileName, LPCTSTR lpNewFileName, WINAPI_MoveFileFlags dwFlags);
  BOOL                         MoveFileTransacted(                      LPCTSTR lpExistingFileName, LPCTSTR lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, LPVOID lpData, DWORD dwFlags, HANDLE hTransaction);
  BOOL                         MoveFileWithProgress(                    LPCTSTR lpExistingFileName, LPCTSTR lpNewFileName, LPPROGRESS_ROUTINE lpProgressRoutine, LPVOID lpData, DWORD dwFlags);
  HFILE                        OpenFile(                                LPCSTR lpFileName, LPOFSTRUCT lpReOpenBuff, WINAPI_OpenFileFlags uStyle);
  WINAPI_FILE_HANDLE           OpenFileById(                            HANDLE hFile, LPFILE_ID_DESCRIPTOR lpFileID, WINAPI_FILE_ACCESS_MASK dwDesiredAccess, WINAPI_FileShareMode dwShareMode, LPSECURITY_ATTRIBUTES lpSecurityAttributes, WINAPI_FlagsAndAttributes dwFlags);
  WINAPI_FILE_HANDLE           ReOpenFile(                              HANDLE hOriginalFile, WINAPI_FILE_ACCESS_MASK dwDesiredAccess, WINAPI_FileShareMode dwShareMode, WINAPI_FlagsAndAttributes dwFlags);
  BOOL                         ReplaceFile(                             LPCTSTR lpReplacedFileName, LPCTSTR lpReplacementFileName, LPCTSTR lpBackupFileName, DWORD dwReplaceFlags, LPVOID lpExclude, LPVOID lpReserved);
  DWORD                        SearchPath(                              LPCTSTR lpPath, LPCTSTR lpFileName, LPCTSTR lpExtension, DWORD nBufferLength, LPTSTR lpBuffer, LPTSTR* lpFilePart);
  void                         SetFileApisToANSI(                       );
  void                         SetFileApisToOEM(                        );
  BOOL                         SetFileAttributes(                       LPCTSTR lpFileName, WINAPI_FileAttributes dwFileAttributes);
  BOOL                         SetFileAttributesTransacted(             LPCTSTR lpFileName, WINAPI_FileAttributes dwFileAttributes, HANDLE hTransaction);
  BOOL                         SetFileBandwidthReservation(             HANDLE hFile, DWORD nPeriodMilliseconds, DWORD nBytesPerPeriod, BOOL bDiscardable, LPDWORD lpTransferSize, LPDWORD lpNumOutstandingRequests);
  BOOL                         SetFileInformationByHandle(              HANDLE hFile, FILE_INFO_BY_HANDLE_CLASS FileInformationClass, LPVOID lpFileInformation, DWORD dwBufferSize);
  BOOL                         SetFileShortName(                        HANDLE hFile, LPCTSTR lpShortName);
  BOOL                         SetFileValidData(                        HANDLE hFile, LONGLONG ValidDataLength);
  BOOL                         SetSearchPathMode(                       DWORD Flags);
  BOOL                         CancelIo(                                HANDLE hFile);
  BOOL                         CancelIoEx(                              HANDLE hFile, LPOVERLAPPED lpOverlapped);
  BOOL                         CancelSynchronousIo(                     WINAPI_ThreadHandle hThread);
  HANDLE                       CreateIoCompletionPort(                  HANDLE FileHandle, HANDLE ExistingCompletionPort, ULONG_PTR CompletionKey, DWORD NumberOfConcurrentThreads);
  BOOL                         FlushFileBuffers(                        HANDLE hFile);
  BOOL                         GetQueuedCompletionStatus(               HANDLE CompletionPort, LPDWORD lpNumberOfBytes, PULONG_PTR lpCompletionKey, LPOVERLAPPED* lpOverlapped, WINAPI_WaitTimeout dwMilliseconds);
  BOOL                         GetQueuedCompletionStatusEx(             HANDLE CompletionPort, LPOVERLAPPED_ENTRY lpCompletionPortEntries, ULONG ulCount, PULONG ulNumEntriesRemoved, WINAPI_WaitTimeout dwMilliseconds, BOOL fAlertable);
  BOOL                         LockFile(                                HANDLE hFile, DWORD dwFileOffsetLow, DWORD dwFileOffsetHigh, DWORD nNumberOfBytesToLockLow, DWORD nNumberOfBytesToLockHigh);
  BOOL                         LockFileEx(                              HANDLE hFile, WINAPI_LockFileFlags dwFlags, DWORD dwReserved, DWORD nNumberOfBytesToLockLow, DWORD nNumberOfBytesToLockHigh, LPOVERLAPPED lpOverlapped);
  BOOL                         PostQueuedCompletionStatus(              HANDLE CompletionPort, DWORD dwNumberOfBytesTransferred, ULONG_PTR dwCompletionKey, LPOVERLAPPED lpOverlapped);
  BOOL                         ReadFile(                                HANDLE hFile, LPVOID lpBuffer, DWORD nNumberOfBytesToRead, LPDWORD lpNumberOfBytesRead, LPOVERLAPPED lpOverlapped);
  BOOL                         ReadFileEx(                              HANDLE hFile, LPVOID lpBuffer, DWORD nNumberOfBytesToRead, LPOVERLAPPED lpOverlapped, LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
  BOOL                         ReadFileScatter(                         HANDLE hFile, FILE_SEGMENT_ELEMENT* aSegmentArray, DWORD nNumberOfBytesToRead, LPDWORD lpReserved, LPOVERLAPPED lpOverlapped);
  BOOL                         SetEndOfFile(                            HANDLE hFile);
  BOOL                         SetFileCompletionNotificationModes(      HANDLE FileHandle, UCHAR Flags);
  BOOL                         SetFileIoOverlappedRange(                HANDLE FileHandle, PUCHAR OverlappedRangeStart, ULONG Length);
  DWORD                        SetFilePointer(                          HANDLE hFile, LONG lDistanceToMove, PLONG lpDistanceToMoveHigh, WINAPI_MoveMethodEnum dwMoveMethod);
  BOOL                         SetFilePointerEx(                        HANDLE hFile, LARGE_INTEGER liDistanceToMove, PLARGE_INTEGER lpNewFilePointer, WINAPI_MoveMethodEnum dwMoveMethod);
  BOOL                         UnlockFile(                              HANDLE hFile, DWORD dwFileOffsetLow, DWORD dwFileOffsetHigh, DWORD nNumberOfBytesToUnlockLow, DWORD nNumberOfBytesToUnlockHigh);
  BOOL                         UnlockFileEx(                            HANDLE hFile, DWORD dwReserved, DWORD nNumberOfBytesToUnlockLow, DWORD nNumberOfBytesToUnlockHigh, LPOVERLAPPED lpOverlapped);
  BOOL                         WriteFile(                               HANDLE hFile, LPCVOID lpBuffer, DWORD nNumberOfBytesToWrite, LPDWORD lpNumberOfBytesWritten, LPOVERLAPPED lpOverlapped);
  BOOL                         WriteFileEx(                             HANDLE hFile, LPCVOID lpBuffer, DWORD nNumberOfBytesToWrite, LPOVERLAPPED lpOverlapped, LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
  BOOL                         WriteFileGather(                         HANDLE hFile, FILE_SEGMENT_ELEMENT* aSegmentArray, DWORD nNumberOfBytesToWrite, LPDWORD lpReserved, LPOVERLAPPED lpOverlapped);
  BOOL                         Wow64DisableWow64FsRedirection(          PVOID* OldValue);
  BOOLEAN                      Wow64EnableWow64FsRedirection(           BOOLEAN Wow64FsEnableRedirection);
  BOOL                         Wow64RevertWow64FsRedirection(           PVOID OldValue);
  BOOL                         AddSecureMemoryCacheCallback(            PSECURE_MEMORY_CACHE_CALLBACK pfnCallBack);
  HANDLE                       CreateMemoryResourceNotification(        MEMORY_RESOURCE_NOTIFICATION_TYPE NotificationType);
  SIZE_T                       GetLargePageMinimum(                     );
  BOOL                         GetPhysicallyInstalledSystemMemory(      PULONGLONG TotalMemoryInKilobytes);
  BOOL                         GetSystemFileCacheSize(                  PSIZE_T lpMinimumFileCacheSize, PSIZE_T lpMaximumFileCacheSize, PDWORD lpFlags);
  UINT                         GetWriteWatch(                           DWORD dwFlags, PVOID lpBaseAddress, SIZE_T dwRegionSize, PVOID* lpAddresses, PULONG_PTR lpdwCount, PULONG lpdwGranularity);
  BOOL                         GlobalMemoryStatusEx(                    LPMEMORYSTATUSEX lpBuffer);
  BOOL                         QueryMemoryResourceNotification(         HANDLE ResourceNotificationHandle, PBOOL ResourceState);
  BOOL                         RemoveSecureMemoryCacheCallback(         PSECURE_MEMORY_CACHE_CALLBACK pfnCallBack);
  UINT                         ResetWriteWatch(                         LPVOID lpBaseAddress, SIZE_T dwRegionSize);
  BOOL                         SetSystemFileCacheSize(                  SIZE_T MinimumFileCacheSize, SIZE_T MaximumFileCacheSize, DWORD Flags);
  BOOL                         GetProcessDEPPolicy(                     WINAPI_ProcessHandle hProcess, LPDWORD lpFlags, PBOOL lpPermanent);
  DEP_SYSTEM_POLICY_TYPE       GetSystemDEPPolicy(                      );
  BOOL                         SetProcessDEPPolicy(                     DWORD dwFlags);
  HANDLE                       CreateFileMapping(                       WINAPI_FILE_HANDLE hFile, LPSECURITY_ATTRIBUTES lpAttributes, WINAPI_MemoryProtection flProtect, DWORD dwMaximumSizeHigh, DWORD dwMaximumSizeLow, LPCTSTR lpName);
  HANDLE                       CreateFileMappingNuma(                   WINAPI_FILE_HANDLE hFile, LPSECURITY_ATTRIBUTES lpFileMappingAttributes, WINAPI_MemoryProtection flProtect, DWORD dwMaximumSizeHigh, DWORD dwMaximumSizeLow, LPCTSTR lpName, DWORD nndPreferred);
  BOOL                         FlushViewOfFile(                         LPCVOID lpBaseAddress, SIZE_T dwNumberOfBytesToFlush);
  LPVOID                       MapViewOfFile(                           HANDLE hFileMappingObject, WINAPI_MapAccessFlags dwDesiredAccess, DWORD dwFileOffsetHigh, DWORD dwFileOffsetLow, SIZE_T dwNumberOfBytesToMap);
  LPVOID                       MapViewOfFileEx(                         HANDLE hFileMappingObject, WINAPI_MapAccessFlags dwDesiredAccess, DWORD dwFileOffsetHigh, DWORD dwFileOffsetLow, SIZE_T dwNumberOfBytesToMap, LPVOID lpBaseAddress);
  LPVOID                       MapViewOfFileExNuma(                     HANDLE hFileMappingObject, DWORD dwDesiredAccess, DWORD dwFileOffsetHigh, DWORD dwFileOffsetLow, SIZE_T dwNumberOfBytesToMap, LPVOID lpBaseAddress, DWORD nndPreferred);
  HANDLE                       OpenFileMapping(                         WINAPI_MapAccessFlags dwDesiredAccess, BOOL bInheritHandle, LPCTSTR lpName);
  BOOL                         UnmapViewOfFile(                         LPCVOID lpBaseAddress);
  BOOL                         AllocateUserPhysicalPages(               WINAPI_ProcessHandle hProcess, PULONG_PTR NumberOfPages, PULONG_PTR UserPfnArray);
  BOOL                         FreeUserPhysicalPages(                   WINAPI_ProcessHandle hProcess, PULONG_PTR NumberOfPages, PULONG_PTR UserPfnArray);
  BOOL                         MapUserPhysicalPages(                    PVOID lpAddress, ULONG_PTR NumberOfPages, PULONG_PTR UserPfnArray);
  BOOL                         MapUserPhysicalPagesScatter(             PVOID* VirtualAddresses, ULONG_PTR NumberOfPages, PULONG_PTR PageArray);
  HANDLE                       GetProcessHeap(                          );
  DWORD                        GetProcessHeaps(                         DWORD NumberOfHeaps, PHANDLE ProcessHeaps);
  LPVOID                       HeapAlloc(                               HANDLE hHeap, WINAPI_HEAP_FLAGS dwFlags, SIZE_T dwBytes);
  SIZE_T                       HeapCompact(                             HANDLE hHeap, WINAPI_HEAP_FLAGS dwFlags);
  HANDLE                       HeapCreate(                              WINAPI_HEAP_FLAGS flOptions, SIZE_T dwInitialSize, SIZE_T dwMaximumSize);
  BOOL                         HeapDestroy(                             HANDLE hHeap);
  BOOL                         HeapFree(                                HANDLE hHeap, WINAPI_HEAP_FLAGS dwFlags, LPVOID lpMem);
  BOOL                         HeapLock(                                HANDLE hHeap);
  BOOL                         HeapQueryInformation(                    HANDLE HeapHandle, HEAP_INFORMATION_CLASS HeapInformationClass, PVOID HeapInformation, SIZE_T HeapInformationLength, PSIZE_T ReturnLength);
  LPVOID                       HeapReAlloc(                             HANDLE hHeap, WINAPI_HEAP_FLAGS dwFlags, LPVOID lpMem, SIZE_T dwBytes);
  BOOL                         HeapSetInformation(                      HANDLE HeapHandle, HEAP_INFORMATION_CLASS HeapInformationClass, PVOID HeapInformation, SIZE_T HeapInformationLength);
  SIZE_T                       HeapSize(                                HANDLE hHeap, WINAPI_HEAP_FLAGS dwFlags, LPCVOID lpMem);
  BOOL                         HeapUnlock(                              HANDLE hHeap);
  BOOL                         HeapValidate(                            HANDLE hHeap, WINAPI_HEAP_FLAGS dwFlags, LPCVOID lpMem);
  BOOL                         HeapWalk(                                HANDLE hHeap, LPPROCESS_HEAP_ENTRY lpEntry);
  LPVOID                       VirtualAlloc(                            LPVOID lpAddress, SIZE_T dwSize, WINAPI_MemoryAllocationFlags flAllocationType, WINAPI_MemoryProtection flProtect);
  LPVOID                       VirtualAllocEx(                          WINAPI_ProcessHandle hProcess, LPVOID lpAddress, SIZE_T dwSize, WINAPI_MemoryAllocationFlags flAllocationType, WINAPI_MemoryProtection flProtect);
  LPVOID                       VirtualAllocExNuma(                      WINAPI_ProcessHandle hProcess, LPVOID lpAddress, SIZE_T dwSize, DWORD flAllocationType, WINAPI_MemoryProtection flProtect, DWORD nndPreferred);
  BOOL                         VirtualFree(                             LPVOID lpAddress, SIZE_T dwSize, WINAPI_MemoryAllocationFlags dwFreeType);
  BOOL                         VirtualFreeEx(                           WINAPI_ProcessHandle hProcess, LPVOID lpAddress, SIZE_T dwSize, WINAPI_MemoryAllocationFlags dwFreeType);
  BOOL                         VirtualLock(                             LPVOID lpAddress, SIZE_T dwSize);
  BOOL                         VirtualProtect(                          LPVOID lpAddress, SIZE_T dwSize, WINAPI_MemoryProtection flNewProtect, WINAPI_MemoryProtection* lpflOldProtect);
  BOOL                         VirtualProtectEx(                        WINAPI_ProcessHandle hProcess, LPVOID lpAddress, SIZE_T dwSize, WINAPI_MemoryProtection flNewProtect, WINAPI_MemoryProtection* lpflOldProtect);
  SIZE_T                       VirtualQuery(                            LPCVOID lpAddress, PMEMORY_BASIC_INFORMATION lpBuffer, SIZE_T dwLength);
  SIZE_T                       VirtualQueryEx(                          WINAPI_ProcessHandle hProcess, LPCVOID lpAddress, PMEMORY_BASIC_INFORMATION lpBuffer, SIZE_T dwLength);
  BOOL                         VirtualUnlock(                           LPVOID lpAddress, SIZE_T dwSize);
  HGLOBAL                      GlobalAlloc(                             WINAPI_GlobalMemoryFlag uFlags, SIZE_T dwBytes);
  HLOCAL                       LocalAlloc(                              WINAPI_LocalMemoryFlag uFlags, SIZE_T uBytes);
  UINT                         GlobalFlags(                             HGLOBAL hMem);
  UINT                         LocalFlags(                              HLOCAL hMem);
  HGLOBAL                      GlobalFree(                              HGLOBAL hMem);
  HLOCAL                       LocalFree(                               HLOCAL hMem);
  HGLOBAL                      GlobalHandle(                            LPCVOID pMem);
  HLOCAL                       LocalHandle(                             LPCVOID pMem);
  LPVOID                       GlobalLock(                              HGLOBAL hMem);
  LPVOID                       LocalLock(                               HLOCAL hMem);
  HGLOBAL                      GlobalReAlloc(                           HGLOBAL hMem, SIZE_T dwBytes, WINAPI_GlobalMemoryFlag uFlags);
  HLOCAL                       LocalReAlloc(                            HLOCAL hMem, SIZE_T uBytes, WINAPI_LocalMemoryFlag uFlags);
  SIZE_T                       GlobalSize(                              HGLOBAL hMem);
  UINT                         LocalSize(                               HLOCAL hMem);
  BOOL                         GlobalUnlock(                            HGLOBAL hMem);
  BOOL                         LocalUnlock(                             HLOCAL hMem);
  BOOL                         IsBadCodePtr(                            FARPROC lpfn);
  BOOL                         IsBadReadPtr(                            VOID* lp, UINT_PTR ucb);
  BOOL                         IsBadStringPtr(                          LPCTSTR lpsz, UINT_PTR ucchMax);
  BOOL                         IsBadWritePtr(                           LPVOID lp, UINT_PTR ucb);
  void                         GlobalMemoryStatus(                      LPMEMORYSTATUS lpBuffer);
  BOOL                         CreateProcess(                           LPCTSTR lpApplicationName, LPTSTR lpCommandLine, LPSECURITY_ATTRIBUTES lpProcessAttributes, LPSECURITY_ATTRIBUTES lpThreadAttributes, BOOL bInheritHandles, WINAPI_CreateProcessFlags dwCreationFlags, LPVOID lpEnvironment, LPCTSTR lpCurrentDirectory, LPSTARTUPINFO lpStartupInfo, LPPROCESS_INFORMATION lpProcessInformation);
  VOID                         ExitProcess(                             UINT uExitCode);
  VOID                         FlushProcessWriteBuffers(                );
  BOOL                         FreeEnvironmentStrings(                  LPTCH lpszEnvironmentBlock);
  LPTSTR                       GetCommandLine(                          );
  WINAPI_ProcessHandle         GetCurrentProcess(                       );
  DWORD                        GetCurrentProcessId(                     );
  DWORD                        GetCurrentProcessorNumber(               );
  LPTCH                        GetEnvironmentStrings(                   );
  DWORD                        GetEnvironmentVariable(                  LPCTSTR lpName, LPTSTR lpBuffer, DWORD nSize);
  BOOL                         GetExitCodeProcess(                      WINAPI_ProcessHandle hProcess, LPDWORD lpExitCode);
  DWORD                        GetPriorityClass(                        WINAPI_ProcessHandle hProcess);
  BOOL                         GetProcessAffinityMask(                  WINAPI_ProcessHandle hProcess, PDWORD_PTR lpProcessAffinityMask, PDWORD_PTR lpSystemAffinityMask);
  BOOL                         GetProcessGroupAffinity(                 WINAPI_ProcessHandle hProcess, PUSHORT GroupCount, PUSHORT GroupArray);
  BOOL                         GetProcessHandleCount(                   WINAPI_ProcessHandle hProcess, PDWORD pdwHandleCount);
  DWORD                        GetProcessId(                            HANDLE Process);
  DWORD                        GetProcessIdOfThread(                    HANDLE Thread);
  BOOL                         GetProcessIoCounters(                    WINAPI_ProcessHandle hProcess, PIO_COUNTERS lpIoCounters);
  BOOL                         GetProcessPriorityBoost(                 WINAPI_ProcessHandle hProcess, PBOOL pDisablePriorityBoost);
  BOOL                         GetProcessShutdownParameters(            LPDWORD lpdwLevel, LPDWORD lpdwFlags);
  BOOL                         GetProcessTimes(                         WINAPI_ProcessHandle hProcess, LPFILETIME lpCreationTime, LPFILETIME lpExitTime, LPFILETIME lpKernelTime, LPFILETIME lpUserTime);
  DWORD                        GetProcessVersion(                       DWORD ProcessId);
  BOOL                         GetProcessWorkingSetSize(                WINAPI_ProcessHandle hProcess, PSIZE_T lpMinimumWorkingSetSize, PSIZE_T lpMaximumWorkingSetSize);
  BOOL                         GetProcessWorkingSetSizeEx(              WINAPI_ProcessHandle hProcess, PSIZE_T lpMinimumWorkingSetSize, PSIZE_T lpMaximumWorkingSetSize, PDWORD Flags);
  BOOL                         GetProcessorSystemCycleTime(             USHORT Group, PSYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION Buffer, PDWORD ReturnedLength);
  VOID                         GetStartupInfo(                          LPSTARTUPINFO lpStartupInfo);
  BOOL                         NeedCurrentDirectoryForExePath(          LPCTSTR ExeName);
  HANDLE                       OpenProcess(                             WINAPI_PROCESS_ACCESS_MASK dwDesiredAccess, BOOL bInheritHandle, DWORD dwProcessId);
  BOOL                         QueryFullProcessImageName(               WINAPI_ProcessHandle hProcess, WINAPI_QueryFullProcessImageNameFlags dwFlags, LPTSTR lpExeName, PDWORD lpdwSize);
  BOOL                         QueryProcessAffinityUpdateMode(          HANDLE ProcessHandle, DWORD lpdwFlags);
  BOOL                         QueryProcessCycleTime(                   HANDLE ProcessHandle, PULONG64 CycleTime);
  BOOL                         SetEnvironmentVariable(                  LPCTSTR lpName, LPCTSTR lpValue);
  BOOL                         SetPriorityClass(                        WINAPI_ProcessHandle hProcess, WINAPI_PriorityClass dwPriorityClass);
  BOOL                         SetProcessAffinityMask(                  WINAPI_ProcessHandle hProcess, DWORD_PTR dwProcessAffinityMask);
  BOOL                         SetProcessAffinityUpdateMode(            HANDLE ProcessHandle, DWORD dwFlags);
  BOOL                         SetProcessPriorityBoost(                 WINAPI_ProcessHandle hProcess, BOOL DisablePriorityBoost);
  BOOL                         SetProcessShutdownParameters(            DWORD dwLevel, WINAPI_ProcessShutdownFlags dwFlags);
  BOOL                         SetProcessWorkingSetSize(                WINAPI_ProcessHandle hProcess, SIZE_T dwMinimumWorkingSetSize, SIZE_T dwMaximumWorkingSetSize);
  BOOL                         SetProcessWorkingSetSizeEx(              WINAPI_ProcessHandle hProcess, SIZE_T dwMinimumWorkingSetSize, SIZE_T dwMaximumWorkingSetSize, DWORD Flags);
  BOOL                         TerminateProcess(                        WINAPI_ProcessHandle hProcess, UINT uExitCode);
  HANDLE                       CreateRemoteThread(                      WINAPI_ProcessHandle hProcess, LPSECURITY_ATTRIBUTES lpThreadAttributes, SIZE_T dwStackSize, LPTHREAD_START_ROUTINE lpStartAddress, LPVOID lpParameter, DWORD dwCreationFlags, LPDWORD lpThreadId);
  HANDLE                       CreateRemoteThreadEx(                    WINAPI_ProcessHandle hProcess, LPSECURITY_ATTRIBUTES lpThreadAttributes, SIZE_T dwStackSize, LPTHREAD_START_ROUTINE lpStartAddress, LPVOID lpParameter, DWORD dwCreationFlags, LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList, LPDWORD lpThreadId);
  HANDLE                       CreateThread(                            LPSECURITY_ATTRIBUTES lpThreadAttributes, SIZE_T dwStackSize, LPTHREAD_START_ROUTINE lpStartAddress, LPVOID lpParameter, WINAPI_ThreadCreationFlags dwCreationFlags, LPDWORD lpThreadId);
  VOID                         ExitThread(                              DWORD dwExitCode);
  WINAPI_ThreadHandle          GetCurrentThread(                        );
  DWORD                        GetCurrentThreadId(                      );
  BOOL                         GetExitCodeThread(                       WINAPI_ThreadHandle hThread, LPDWORD lpExitCode);
  BOOL                         GetThreadGroupAffinity(                  WINAPI_ThreadHandle hThread, PGROUP_AFFINITY GroupAffinity);
  DWORD                        GetThreadId(                             HANDLE Thread);
  BOOL                         GetThreadIdealProcessorEx(               WINAPI_ThreadHandle hThread, PPROCESSOR_NUMBER lpIdealProcessor);
  BOOL                         GetThreadIOPendingFlag(                  WINAPI_ThreadHandle hThread, PBOOL lpIOIsPending);
  int                          GetThreadPriority(                       WINAPI_ThreadHandle hThread);
  BOOL                         GetThreadPriorityBoost(                  WINAPI_ThreadHandle hThread, PBOOL pDisablePriorityBoost);
  BOOL                         GetThreadTimes(                          WINAPI_ThreadHandle hThread, LPFILETIME lpCreationTime, LPFILETIME lpExitTime, LPFILETIME lpKernelTime, LPFILETIME lpUserTime);
  HANDLE                       OpenThread(                              WINAPI_THREAD_ACCESS_MASK dwDesiredAccess, BOOL bInheritHandle, DWORD dwThreadId);
  BOOL                         QueryThreadCycleTime(                    HANDLE ThreadHandle, PULONG64 CycleTime);
  DWORD                        ResumeThread(                            WINAPI_ThreadHandle hThread);
  DWORD_PTR                    SetThreadAffinityMask(                   WINAPI_ThreadHandle hThread, DWORD_PTR dwThreadAffinityMask);
  BOOL                         SetThreadGroupAffinity(                  WINAPI_ThreadHandle hThread, GROUP_AFFINITY* GroupAffinity);
  DWORD                        SetThreadIdealProcessor(                 WINAPI_ThreadHandle hThread, DWORD dwIdealProcessor);
  BOOL                         SetThreadIdealProcessorEx(               WINAPI_ThreadHandle hThread, PPROCESSOR_NUMBER lpIdealProcessor, PPROCESSOR_NUMBER lpPreviousIdealProcessor);
  BOOL                         SetThreadPriority(                       WINAPI_ThreadHandle hThread, WINAPI_ThreadPriority nPriority);
  BOOL                         SetThreadPriorityBoost(                  WINAPI_ThreadHandle hThread, BOOL DisablePriorityBoost);
  BOOL                         SetThreadStackGuarantee(                 PULONG StackSizeInBytes);
  VOID                         Sleep(                                   WINAPI_WaitTimeout dwMilliseconds);
  DWORD                        SleepEx(                                 WINAPI_WaitTimeout dwMilliseconds, BOOL bAlertable);
  DWORD                        SuspendThread(                           WINAPI_ThreadHandle hThread);
  BOOL                         SwitchToThread(                          );
  BOOL                         TerminateThread(                         WINAPI_ThreadHandle hThread, DWORD dwExitCode);
  DWORD                        TlsAlloc(                                );
  BOOL                         TlsFree(                                 DWORD dwTlsIndex);
  LPVOID                       TlsGetValue(                             DWORD dwTlsIndex);
  BOOL                         TlsSetValue(                             DWORD dwTlsIndex, LPVOID lpTlsValue);
  VOID                         DeleteProcThreadAttributeList(           LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList);
  BOOL                         InitializeProcThreadAttributeList(       LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList, DWORD dwAttributeCount, DWORD dwFlags, PSIZE_T lpSize);
  BOOL                         UpdateProcThreadAttribute(               LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList, DWORD dwFlags, WINAPI_ProcThreadAttribute Attribute, PVOID lpValue, SIZE_T cbSize, PVOID lpPreviousValue, PSIZE_T lpReturnSize);
  BOOL                         IsWow64Process(                          WINAPI_ProcessHandle hProcess, PBOOL Wow64Process);
  DWORD                        Wow64SuspendThread(                      WINAPI_ThreadHandle hThread);
  BOOL                         AssignProcessToJobObject(                HANDLE hJob, WINAPI_ProcessHandle hProcess);
  HANDLE                       CreateJobObject(                         LPSECURITY_ATTRIBUTES lpJobAttributes, LPCTSTR lpName);
  BOOL                         IsProcessInJob(                          HANDLE ProcessHandle, HANDLE JobHandle, PBOOL Result);
  HANDLE                       OpenJobObject(                           DWORD dwDesiredAccess, BOOL bInheritHandles, LPCTSTR lpName);
  BOOL                         QueryInformationJobObject(               HANDLE hJob, JOBOBJECTINFOCLASS JobObjectInfoClass, LPVOID lpJobObjectInfo, DWORD cbJobObjectInfoLength, LPDWORD lpReturnLength);
  BOOL                         SetInformationJobObject(                 HANDLE hJob, JOBOBJECTINFOCLASS JobObjectInfoClass, LPVOID lpJobObjectInfo, DWORD cbJobObjectInfoLength);
  BOOL                         TerminateJobObject(                      HANDLE hJob, UINT uExitCode);
  BOOL                         CallbackMayRunLong(                      PTP_CALLBACK_INSTANCE pci);
  VOID                         CancelThreadpoolIo(                      PTP_IO pio);
  VOID                         StartThreadpoolIo(                       PTP_IO pio);
  VOID                         CloseThreadpool(                         PTP_POOL ptpp);
  VOID                         CloseThreadpoolCleanupGroup(             PTP_CLEANUP_GROUP ptpcg);
  VOID                         CloseThreadpoolCleanupGroupMembers(      PTP_CLEANUP_GROUP ptpcg, BOOL fCancelPendingCallbacks, PVOID pvCleanupContext);
  VOID                         CloseThreadpoolIo(                       PTP_IO pio);
  VOID                         CloseThreadpoolTimer(                    PTP_TIMER pti);
  VOID                         CloseThreadpoolWait(                     PTP_WAIT pwa);
  VOID                         CloseThreadpoolWork(                     PTP_WORK pwk);
  PTP_POOL                     CreateThreadpool(                        PVOID reserved);
  PTP_CLEANUP_GROUP            CreateThreadpoolCleanupGroup(            );
  PTP_IO                       CreateThreadpoolIo(                      HANDLE fl, PTP_WIN32_IO_CALLBACK pfnio, PVOID pv, PTP_CALLBACK_ENVIRON pcbe);
  PTP_TIMER                    CreateThreadpoolTimer(                   PTP_TIMER_CALLBACK pfnti, PVOID pv, PTP_CALLBACK_ENVIRON pcbe);
  PTP_WAIT                     CreateThreadpoolWait(                    PTP_WAIT_CALLBACK pfnwa, PVOID pv, PTP_CALLBACK_ENVIRON pcbe);
  PTP_WORK                     CreateThreadpoolWork(                    PTP_WORK_CALLBACK pfnwk, PVOID pv, PTP_CALLBACK_ENVIRON pcbe);
  VOID                         DisassociateCurrentThreadFromCallback(   PTP_CALLBACK_INSTANCE pci);
  VOID                         FreeLibraryWhenCallbackReturns(          PTP_CALLBACK_INSTANCE pci, HMODULE mod);
  BOOL                         IsThreadpoolTimerSet(                    PTP_TIMER pti);
  VOID                         LeaveCriticalSectionWhenCallbackReturns( PTP_CALLBACK_INSTANCE pci, PCRITICAL_SECTION pcs);
  BOOL                         QueryThreadpoolStackInformation(         PTP_POOL ptpp, PTP_POOL_STACK_INFORMATION ptpsi);
  VOID                         ReleaseMutexWhenCallbackReturns(         PTP_CALLBACK_INSTANCE pci, HANDLE mut);
  VOID                         ReleaseSemaphoreWhenCallbackReturns(     PTP_CALLBACK_INSTANCE pci, HANDLE sem, DWORD crel);
  VOID                         SetEventWhenCallbackReturns(             PTP_CALLBACK_INSTANCE pci, HANDLE evt);
  VOID                         SetThreadpoolCallbackPriority(           PTP_CALLBACK_ENVIRON pcbe, TP_CALLBACK_PRIORITY Priority);
  BOOL                         SetThreadpoolStackInformation(           PTP_POOL ptpp, PTP_POOL_STACK_INFORMATION ptpsi);
  VOID                         SetThreadpoolThreadMaximum(              PTP_POOL ptpp, DWORD cthrdMost);
  BOOL                         SetThreadpoolThreadMinimum(              PTP_POOL ptpp, DWORD cthrdMic);
  VOID                         SetThreadpoolTimer(                      PTP_TIMER pti, PFILETIME pftDueTime, DWORD msPeriod, DWORD msWindowLength);
  VOID                         SetThreadpoolWait(                       PTP_WAIT pwa, HANDLE h, PFILETIME pftTimeout);
  VOID                         SubmitThreadpoolWork(                    PTP_WORK pwk);
  BOOL                         TrySubmitThreadpoolCallback(             PTP_SIMPLE_CALLBACK pfns, PVOID pv, PTP_CALLBACK_ENVIRON pcbe);
  VOID                         WaitForThreadpoolIoCallbacks(            PTP_IO pio, BOOL fCancelPendingCallbacks);
  VOID                         WaitForThreadpoolTimerCallbacks(         PTP_TIMER pti, BOOL fCancelPendingCallbacks);
  VOID                         WaitForThreadpoolWaitCallbacks(          PTP_WAIT pwa, BOOL fCancelPendingCallbacks);
  VOID                         WaitForThreadpoolWorkCallbacks(          PTP_WORK pwk, BOOL fCancelPendingCallbacks);
  BOOL                         BindIoCompletionCallback(                HANDLE FileHandle, LPOVERLAPPED_COMPLETION_ROUTINE Function, ULONG Flags);
  BOOL                         QueueUserWorkItem(                       LPTHREAD_START_ROUTINE Function, PVOID Context, WINAPI_WorkItemFlags Flags);
  BOOL                         ConvertFiberToThread(                    );
  LPVOID                       ConvertThreadToFiber(                    LPVOID lpParameter);
  LPVOID                       ConvertThreadToFiberEx(                  LPVOID lpParameter, DWORD dwFlags);
  LPVOID                       CreateFiber(                             SIZE_T dwStackSize, LPFIBER_START_ROUTINE lpStartAddress, LPVOID lpParameter);
  LPVOID                       CreateFiberEx(                           SIZE_T dwStackCommitSize, SIZE_T dwStackReserveSize, DWORD dwFlags, LPFIBER_START_ROUTINE lpStartAddress, LPVOID lpParameter);
  VOID                         DeleteFiber(                             LPVOID lpFiber);
  DWORD                        FlsAlloc(                                PFLS_CALLBACK_FUNCTION lpCallback);
  BOOL                         FlsFree(                                 DWORD dwFlsIndex);
  PVOID                        FlsGetValue(                             DWORD dwFlsIndex);
  BOOL                         FlsSetValue(                             DWORD dwFlsIndex, PVOID lpFlsData);
  BOOL                         IsThreadAFiber(                          );
  VOID                         SwitchToFiber(                           LPVOID lpFiber);
  BOOL                         AllocateUserPhysicalPagesNuma(           WINAPI_ProcessHandle hProcess, PULONG_PTR NumberOfPages, PULONG_PTR PageArray, DWORD nndPreferred);
  BOOL                         GetNumaAvailableMemoryNode(              UCHAR Node, PULONGLONG AvailableBytes);
  BOOL                         GetNumaAvailableMemoryNodeEx(            USHORT Node, PULONGLONG AvailableBytes);
  BOOL                         GetNumaHighestNodeNumber(                PULONG HighestNodeNumber);
  BOOL                         GetNumaNodeNumberFromHandle(             HANDLE hFile, PUSHORT NodeNumber);
  BOOL                         GetNumaNodeProcessorMask(                UCHAR Node, PULONGLONG ProcessorMask);
  BOOL                         GetNumaNodeProcessorMaskEx(              USHORT Node, PGROUP_AFFINITY ProcessorMask);
  BOOL                         GetNumaProcessorNode(                    UCHAR Processor, PUCHAR NodeNumber);
  BOOL                         GetNumaProcessorNodeEx(                  PPROCESSOR_NUMBER Processor, PUSHORT NodeNumber);
  BOOL                         GetNumaProximityNode(                    ULONG ProximityId, PUCHAR NodeNumber);
  BOOL                         GetNumaProximityNodeEx(                  ULONG ProximityId, PUSHORT NodeNumber);
  DWORD                        GetActiveProcessorCount(                 WORD GroupNumber);
  WORD                         GetActiveProcessorGroupCount(            );
  VOID                         GetCurrentProcessorNumberEx(             PPROCESSOR_NUMBER ProcNumber);
  BOOL                         GetLogicalProcessorInformation(          PSYSTEM_LOGICAL_PROCESSOR_INFORMATION Buffer, PDWORD ReturnLength);
  BOOL                         GetLogicalProcessorInformationEx(        LOGICAL_PROCESSOR_RELATIONSHIP RelationshipType, PSYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX Buffer, PDWORD ReturnedLength);
  DWORD                        GetMaximumProcessorCount(                WORD GroupNumber);
  WORD                         GetMaximumProcessorGroupCount(           );
  BOOL                         QueryIdleProcessorCycleTime(             PULONG BufferLength, PULONG64 ProcessorIdleCycleTime);
  BOOL                         QueryIdleProcessorCycleTimeEx(           USHORT Group, PULONG BufferLength, PULONG64 ProcessorIdleCycleTime);
  BOOL                         CreateUmsCompletionList(                 PUMS_COMPLETION_LIST* UmsCompletionList);
  BOOL                         CreateUmsThreadContext(                  PUMS_CONTEXT* lpUmsThread);
  BOOL                         DeleteUmsCompletionList(                 PUMS_COMPLETION_LIST UmsCompletionList);
  BOOL                         DeleteUmsThreadContext(                  PUMS_CONTEXT UmsThread);
  BOOL                         DequeueUmsCompletionListItems(           PUMS_COMPLETION_LIST UmsCompletionList, DWORD WaitTimeOut, PUMS_CONTEXT* UmsThreadList);
  BOOL                         EnterUmsSchedulingMode(                  PUMS_SCHEDULER_STARTUP_INFO SchedulerStartupInfo);
  BOOL                         ExecuteUmsThread(                        PUMS_CONTEXT UmsThread);
  PUMS_CONTEXT                 GetCurrentUmsThread(                     );
  PUMS_CONTEXT                 GetNextUmsListItem(                      PUMS_CONTEXT UmsContext);
  BOOL                         GetUmsCompletionListEvent(               PUMS_COMPLETION_LIST UmsCompletionList, PHANDLE UmsCompletionEvent);
  BOOL                         QueryUmsThreadInformation(               PUMS_CONTEXT UmsThread, UMS_THREAD_INFO_CLASS UmsThreadInfoClass, PVOID UmsThreadInformation, ULONG UmsThreadInformationLength, PULONG ReturnLength);
  BOOL                         SetUmsThreadInformation(                 PUMS_CONTEXT UmsThread, UMS_THREAD_INFO_CLASS UmsThreadInfoClass, PVOID UmsThreadInformation, ULONG UmsThreadInformationLength);
  BOOL                         UmsThreadYield(                          PVOID SchedulerParam);
  UINT                         WinExec(                                 LPCSTR lpCmdLine, UINT uCmdShow);
  BOOL                         ActivateActCtx(                          HANDLE hActCtx, ULONG_PTR* lpCookie);
  void                         AddRefActCtx(                            HANDLE hActCtx);
  HANDLE                       CreateActCtx(                            PACTCTX pActCtx);
  BOOL                         DeactivateActCtx(                        WINAPI_DeactivateActCtxFlags dwFlags, ULONG_PTR ulCookie);
  BOOL                         FindActCtxSectionGuid(                   WINAPI_FIND_ACTCTX_SECTION_FLAGS dwFlags, GUID* lpExtensionGuid, WINAPI_ACTIVATION_CONTEXT_SECTION ulSectionId, GUID* lpGuidToFind, PACTCTX_SECTION_KEYED_DATA ReturnedData);
  BOOL                         FindActCtxSectionString(                 WINAPI_FIND_ACTCTX_SECTION_FLAGS dwFlags, GUID* lpExtensionGuid, WINAPI_ACTIVATION_CONTEXT_SECTION ulSectionId, LPCTSTR lpStringToFind, PACTCTX_SECTION_KEYED_DATA ReturnedData);
  BOOL                         GetCurrentActCtx(                        HANDLE* lphActCtx);
  BOOL                         QueryActCtxW(                            WINAPI_QueryActCtxFlags dwFlags, HANDLE hActCtx, PVOID pvSubInstance, WINAPI_ActivationContextInfoClass ulInfoClass, PVOID pvBuffer, SIZE_T cbBuffer, SIZE_T* pcbWrittenOrRequired);
  BOOL                         QueryActCtxSettingsW(                    DWORD dwFlags, HANDLE hActCtx, PCWSTR settingsNameSpace, PCWSTR settingName, PWSTR pvBuffer, SIZE_T dwBuffer, SIZE_T* pdwWrittenOrRequired);
  void                         ReleaseActCtx(                           HANDLE hActCtx);
  BOOL                         ZombifyActCtx(                           HANDLE hActCtx);
  ATOM                         AddAtom(                                 LPCTSTR lpString);
  ATOM                         DeleteAtom(                              ATOM nAtom);
  ATOM                         FindAtom(                                LPCTSTR lpString);
  UINT                         GetAtomName(                             ATOM nAtom, LPTSTR lpBuffer, int nSize);
  ATOM                         GlobalAddAtom(                           LPCTSTR lpString);
  ATOM                         GlobalDeleteAtom(                        ATOM nAtom);
  ATOM                         GlobalFindAtom(                          LPCTSTR lpString);
  UINT                         GlobalGetAtomName(                       ATOM nAtom, LPTSTR lpBuffer, int nSize);
  BOOL                         InitAtomTable(                           DWORD nSize);
  BOOL                         BuildCommDCB(                            LPCTSTR lpDef, LPDCB lpDCB);
  BOOL                         BuildCommDCBAndTimeouts(                 LPCTSTR lpDef, LPDCB lpDCB, LPCOMMTIMEOUTS lpCommTimeouts);
  BOOL                         ClearCommBreak(                          HANDLE hFile);
  BOOL                         ClearCommError(                          HANDLE hFile, LPDWORD lpErrors, LPCOMSTAT lpStat);
  BOOL                         CommConfigDialog(                        LPCTSTR lpszName, HWND hWnd, LPCOMMCONFIG lpCC);
  BOOL                         EscapeCommFunction(                      HANDLE hFile, DWORD dwFunc);
  BOOL                         GetCommConfig(                           HANDLE hCommDev, LPCOMMCONFIG lpCC, LPDWORD lpdwSize);
  BOOL                         GetCommMask(                             HANDLE hFile, LPDWORD lpEvtMask);
  BOOL                         GetCommModemStatus(                      HANDLE hFile, LPDWORD lpModemStat);
  BOOL                         GetCommProperties(                       HANDLE hFile, LPCOMMPROP lpCommProp);
  BOOL                         GetCommState(                            HANDLE hFile, LPDCB lpDCB);
  BOOL                         GetCommTimeouts(                         HANDLE hFile, LPCOMMTIMEOUTS lpCommTimeouts);
  BOOL                         GetDefaultCommConfig(                    LPCTSTR lpszName, LPCOMMCONFIG lpCC, LPDWORD lpdwSize);
  BOOL                         PurgeComm(                               HANDLE hFile, DWORD dwFlags);
  BOOL                         SetCommBreak(                            HANDLE hFile);
  BOOL                         SetCommConfig(                           HANDLE hCommDev, LPCOMMCONFIG lpCC, DWORD dwSize);
  BOOL                         SetCommMask(                             HANDLE hFile, DWORD dwEvtMask);
  BOOL                         SetCommState(                            HANDLE hFile, LPDCB lpDCB);
  BOOL                         SetCommTimeouts(                         HANDLE hFile, LPCOMMTIMEOUTS lpCommTimeouts);
  BOOL                         SetDefaultCommConfig(                    LPCTSTR lpszName, LPCOMMCONFIG lpCC, DWORD dwSize);
  BOOL                         SetupComm(                               HANDLE hFile, DWORD dwInQueue, DWORD dwOutQueue);
  BOOL                         TransmitCommChar(                        HANDLE hFile, char cChar);
  BOOL                         WaitCommEvent(                           HANDLE hFile, LPDWORD lpEvtMask, LPOVERLAPPED lpOverlapped);
  BOOL                         AddConsoleAlias(                         LPCTSTR Source, LPCTSTR Target, LPCTSTR ExeName);
  BOOL                         AllocConsole(                            );
  BOOL                         AttachConsole(                           DWORD dwProcessId);
  HANDLE                       CreateConsoleScreenBuffer(               DWORD dwDesiredAccess, DWORD dwShareMode, SECURITY_ATTRIBUTES* lpSecurityAttributes, DWORD dwFlags, LPVOID lpScreenBufferData);
  BOOL                         FillConsoleOutputAttribute(              HANDLE hConsoleOutput, WINAPI_ConsoleAttribute wAttribute, DWORD nLength, COORD dwWriteCoord, LPDWORD lpNumberOfAttrsWritten);
  BOOL                         FillConsoleOutputCharacter(              HANDLE hConsoleOutput, TCHAR cCharacter, DWORD nLength, COORD dwWriteCoord, LPDWORD lpNumberOfCharsWritten);
  BOOL                         FlushConsoleInputBuffer(                 HANDLE hConsoleInput);
  BOOL                         FreeConsole(                             );
  BOOL                         GenerateConsoleCtrlEvent(                DWORD dwCtrlEvent, DWORD dwProcessGroupId);
  DWORD                        GetConsoleAlias(                         LPTSTR lpSource, LPTSTR lpTargetBuffer, DWORD TargetBufferLength, LPTSTR lpExeName);
  DWORD                        GetConsoleAliases(                       LPTSTR lpAliasBuffer, DWORD AliasBufferLength, LPTSTR lpExeName);
  DWORD                        GetConsoleAliasesLength(                 LPTSTR lpExeName);
  DWORD                        GetConsoleAliasExes(                     LPTSTR lpExeNameBuffer, DWORD ExeNameBufferLength);
  DWORD                        GetConsoleAliasExesLength(               );
  WINAPI_CodePageEnum          GetConsoleCP(                            );
  BOOL                         GetConsoleCursorInfo(                    HANDLE hConsoleOutput, PCONSOLE_CURSOR_INFO lpConsoleCursorInfo);
  BOOL                         GetConsoleDisplayMode(                   LPDWORD lpModeFlags);
  COORD                        GetConsoleFontSize(                      HANDLE hConsoleOutput, DWORD nFont);
  BOOL                         GetConsoleHistoryInfo(                   PCONSOLE_HISTORY_INFO lpConsoleHistoryInfo);
  BOOL                         GetConsoleMode(                          HANDLE hConsoleHandle, WINAPI_ConsoleModeFlags* lpMode);
  DWORD                        GetConsoleOriginalTitle(                 LPTSTR lpConsoleTitle, DWORD nSize);
  UINT                         GetConsoleOutputCP(                      );
  DWORD                        GetConsoleProcessList(                   LPDWORD lpdwProcessList, DWORD dwProcessCount);
  BOOL                         GetConsoleScreenBufferInfo(              HANDLE hConsoleOutput, PCONSOLE_SCREEN_BUFFER_INFO lpConsoleScreenBufferInfo);
  BOOL                         GetConsoleScreenBufferInfoEx(            HANDLE hConsoleOutput, PCONSOLE_SCREEN_BUFFER_INFOEX lpConsoleScreenBufferInfoEx);
  BOOL                         GetConsoleSelectionInfo(                 PCONSOLE_SELECTION_INFO lpConsoleSelectionInfo);
  DWORD                        GetConsoleTitle(                         LPTSTR lpConsoleTitle, DWORD nSize);
  HWND                         GetConsoleWindow(                        );
  BOOL                         GetCurrentConsoleFont(                   HANDLE hConsoleOutput, BOOL bMaximumWindow, PCONSOLE_FONT_INFO lpConsoleCurrentFont);
  BOOL                         GetCurrentConsoleFontEx(                 HANDLE hConsoleOutput, BOOL bMaximumWindow, PCONSOLE_FONT_INFOEX lpConsoleCurrentFontEx);
  COORD                        GetLargestConsoleWindowSize(             HANDLE hConsoleOutput);
  BOOL                         GetNumberOfConsoleInputEvents(           HANDLE hConsoleInput, LPDWORD lpcNumberOfEvents);
  BOOL                         GetNumberOfConsoleMouseButtons(          LPDWORD lpNumberOfMouseButtons);
  WINAPI_FILE_HANDLE           GetStdHandle(                            WINAPI_StdHandle nStdHandle);
  BOOL                         PeekConsoleInput(                        HANDLE hConsoleInput, PINPUT_RECORD lpBuffer, DWORD nLength, LPDWORD lpNumberOfEventsRead);
  BOOL                         ReadConsole(                             HANDLE hConsoleInput, LPVOID lpBuffer, DWORD nNumberOfCharsToRead, LPDWORD lpNumberOfCharsRead, LPVOID pInputControl);
  BOOL                         ReadConsoleInput(                        HANDLE hConsoleInput, PINPUT_RECORD lpBuffer, DWORD nLength, LPDWORD lpNumberOfEventsRead);
  BOOL                         ReadConsoleOutput(                       HANDLE hConsoleOutput, PCHAR_INFO lpBuffer, COORD dwBufferSize, COORD dwBufferCoord, PSMALL_RECT lpReadRegion);
  BOOL                         ReadConsoleOutputAttribute(              HANDLE hConsoleOutput, WINAPI_ConsoleAttribute* lpAttribute, DWORD nLength, COORD dwReadCoord, LPDWORD lpNumberOfAttrsRead);
  BOOL                         ReadConsoleOutputCharacter(              HANDLE hConsoleOutput, LPTSTR lpCharacter, DWORD nLength, COORD dwReadCoord, LPDWORD lpNumberOfCharsRead);
  BOOL                         ScrollConsoleScreenBuffer(               HANDLE hConsoleOutput, SMALL_RECT* lpScrollRectangle, SMALL_RECT* lpClipRectangle, COORD dwDestinationOrigin, CHAR_INFO* lpFill);
  BOOL                         SetConsoleActiveScreenBuffer(            HANDLE hConsoleOutput);
  BOOL                         SetConsoleCP(                            WINAPI_CodePageEnum wCodePageID);
  BOOL                         SetConsoleCtrlHandler(                   PHANDLER_ROUTINE HandlerRoutine, BOOL Add);
  BOOL                         SetConsoleCursorInfo(                    HANDLE hConsoleOutput, CONSOLE_CURSOR_INFO* lpConsoleCursorInfo);
  BOOL                         SetConsoleCursorPosition(                HANDLE hConsoleOutput, COORD dwCursorPosition);
  BOOL                         SetConsoleDisplayMode(                   HANDLE hConsoleOutput, DWORD dwFlags, PCOORD lpNewScreenBufferDimensions);
  BOOL                         SetConsoleHistoryInfo(                   PCONSOLE_HISTORY_INFO lpConsoleHistoryInfo);
  BOOL                         SetConsoleMode(                          HANDLE hConsoleHandle, WINAPI_ConsoleModeFlags dwMode);
  BOOL                         SetConsoleOutputCP(                      WINAPI_CodePageEnum wCodePageID);
  BOOL                         SetConsoleScreenBufferInfoEx(            HANDLE hConsoleOutput, PCONSOLE_SCREEN_BUFFER_INFOEX lpConsoleScreenBufferInfoEx);
  BOOL                         SetConsoleScreenBufferSize(              HANDLE hConsoleOutput, COORD dwSize);
  BOOL                         SetConsoleTextAttribute(                 HANDLE hConsoleOutput, WINAPI_ConsoleAttribute wAttributes);
  BOOL                         SetConsoleTitle(                         LPCTSTR lpConsoleTitle);
  BOOL                         SetConsoleWindowInfo(                    HANDLE hConsoleOutput, BOOL bAbsolute, SMALL_RECT* lpConsoleWindow);
  BOOL                         SetCurrentConsoleFontEx(                 HANDLE hConsoleOutput, BOOL bMaximumWindow, PCONSOLE_FONT_INFOEX lpConsoleCurrentFontEx);
  BOOL                         SetStdHandle(                            WINAPI_StdHandle nStdHandle, HANDLE hHandle);
  BOOL                         WriteConsole(                            HANDLE hConsoleOutput, LPCTSTR lpBuffer, DWORD nNumberOfCharsToWrite, LPDWORD lpNumberOfCharsWritten, LPVOID lpReserved);
  BOOL                         WriteConsoleInput(                       HANDLE hConsoleInput, INPUT_RECORD* lpBuffer, DWORD nLength, LPDWORD lpNumberOfEventsWritten);
  BOOL                         WriteConsoleOutput(                      HANDLE hConsoleOutput, CHAR_INFO* lpBuffer, COORD dwBufferSize, COORD dwBufferCoord, PSMALL_RECT lpWriteRegion);
  BOOL                         WriteConsoleOutputAttribute(             HANDLE hConsoleOutput, WINAPI_ConsoleAttribute* lpAttribute, DWORD nLength, COORD dwWriteCoord, LPDWORD lpNumberOfAttrsWritten);
  BOOL                         WriteConsoleOutputCharacter(             HANDLE hConsoleOutput, LPCTSTR lpCharacter, DWORD nLength, COORD dwWriteCoord, LPDWORD lpNumberOfCharsWritten);
  BOOL                         DeviceIoControl(                         HANDLE hDevice, WINAPI_IOCTL dwIoControlCode, LPVOID lpInBuffer, DWORD nInBufferSize, LPVOID lpOutBuffer, DWORD nOutBufferSize, LPDWORD lpBytesReturned, LPOVERLAPPED lpOverlapped);
  BOOL                         Beep(                                    DWORD dwFreq, DWORD dwDuration);
  USHORT                       RtlCaptureStackBackTrace(                ULONG FramesToSkip, ULONG FramesToCapture, PVOID* BackTrace, PULONG BackTraceHash);
  void                         FatalAppExit(                            UINT uAction, LPCTSTR lpMessageText);
  DWORD                        FormatMessage(                           WINAPI_FormatMessageFlags dwFlags, LPCVOID lpSource, DWORD dwMessageId, DWORD dwLanguageId, LPTSTR lpBuffer, DWORD nSize, va_list* Arguments);
  WINAPI_SEM_FLAGS             GetErrorMode(                            );
  WINAPI_ERROR_CODE            GetLastError(                            );
  WINAPI_SEM_FLAGS_DWORD       GetThreadErrorMode(                      );
  PVOID                        RtlLookupFunctionEntry(                  ULONGLONG ControlPC, PULONGLONG ImageBase, PULONGLONG TargetGp);
  PVOID                        RtlPcToFileHeader(                       PVOID PcValue, PVOID* BaseOfImage);
  WINAPI_SEM_FLAGS             SetErrorMode(                            WINAPI_SEM_FLAGS uMode);
  void                         SetLastError(                            WINAPI_ERROR_CODE dwErrCode);
  BOOL                         SetThreadErrorMode(                      WINAPI_SEM_FLAGS_DWORD dwNewMode, WINAPI_SEM_FLAGS_DWORD* lpOldMode);
  BOOL                         CloseHandle(                             HANDLE hObject);
  BOOL                         DuplicateHandle(                         WINAPI_ProcessHandle hSourceProcessHandle, WINAPI_PROCESS_THREAD_HANDLE hSourceHandle, WINAPI_ProcessHandle hTargetProcessHandle, LPHANDLE lpTargetHandle, WINAPI_StandardAccessRights dwDesiredAccess, BOOL bInheritHandle, WINAPI_DuplicateHandleFlags dwOptions);
  BOOL                         GetHandleInformation(                    HANDLE hObject, LPDWORD lpdwFlags);
  BOOL                         SetHandleInformation(                    HANDLE hObject, WINAPI_HandleFlags dwMask, WINAPI_HandleFlags dwFlags);
  HANDLE                       CreateMailslot(                          LPCTSTR lpName, DWORD nMaxMessageSize, DWORD lReadTimeout, LPSECURITY_ATTRIBUTES lpSecurityAttributes);
  BOOL                         GetMailslotInfo(                         HANDLE hMailslot, LPDWORD lpMaxMessageSize, LPDWORD lpNextSize, LPDWORD lpMessageCount, LPDWORD lpReadTimeout);
  BOOL                         SetMailslotInfo(                         HANDLE hMailslot, DWORD lReadTimeout);
  BOOL                         AdjustCalendarDate(                      LPCALDATETIME lpCalDateTime, CALDATETIME_DATEUNIT calUnit, INT amount);
  int                          CompareStringOrdinal(                    LPCWSTR lpString1, int cchCount1, LPCWSTR lpString2, int cchCount2, BOOL bIgnoreCase);
  BOOL                         ConvertCalDateTimeToSystemTime(          LPCALDATETIME lpCalDateTime, SYSTEMTIME* lpSysTime);
  LCID                         ConvertDefaultLocale(                    LCID Locale);
  BOOL                         ConvertSystemTimeToCalDateTime(          SYSTEMTIME lpSysTime, CALID calId, LPCALDATETIME lpCalDateTime);
  BOOL                         EnumCalendarInfo(                        CALINFO_ENUMPROC pCalInfoEnumProc, LCID Locale, CALID Calendar, CALTYPE CalType);
  BOOL                         EnumCalendarInfoEx(                      CALINFO_ENUMPROCEX pCalInfoEnumProcEx, LCID Locale, CALID Calendar, CALTYPE CalType);
  BOOL                         EnumCalendarInfoExEx(                    CALINFO_ENUMPROCEXEX pCalInfoEnumProcExEx, LPCWSTR lpLocaleName, CALID Calendar, LPCWSTR lpReserved, CALTYPE CalType, LPARAM lParam);
  BOOL                         EnumDateFormats(                         DATEFMT_ENUMPROC lpDateFmtEnumProc, LCID Locale, WINAPI_GetDateFormatFlags dwFlags);
  BOOL                         EnumDateFormatsEx(                       DATEFMT_ENUMPROCEX lpDateFmtEnumProcEx, LCID Locale, WINAPI_GetDateFormatFlags dwFlags);
  BOOL                         EnumDateFormatsExEx(                     DATEFMT_ENUMPROCEXEX lpDateFmtEnumProcExEx, LPCWSTR lpLocaleName, WINAPI_GetDateFormatFlags dwFlags, LPARAM lParam);
  BOOL                         EnumLanguageGroupLocales(                LANGGROUPLOCALE_ENUMPROC lpLangGroupLocaleEnumProc, LGRPID LanguageGroup, DWORD dwFlags, LONG_PTR lParam);
  BOOL                         EnumSystemCodePages(                     CODEPAGE_ENUMPROC lpCodePageEnumProc, WINAPI_CodePageEnumerationFlags dwFlags);
  BOOL                         EnumSystemGeoID(                         GEOCLASS GeoClass, GEOID ParentGeoId, GEO_ENUMPROC lpGeoEnumProc);
  BOOL                         EnumSystemLanguageGroups(                LANGUAGEGROUP_ENUMPROC lpLanguageGroupEnumProc, DWORD dwFlags, LONG_PTR lParam);
  BOOL                         EnumSystemLocales(                       LOCALE_ENUMPROC lpLocaleEnumProc, WINAPI_LocaleEnumerationFlags dwFlags);
  BOOL                         EnumSystemLocalesEx(                     LOCALE_ENUMPROCEX lpLocaleEnumProcEx, WINAPI_EnumSystemLocalesExFlags dwFlags, LPARAM lParam, LPVOID lpReserved);
  BOOL                         EnumTimeFormats(                         TIMEFMT_ENUMPROC lpTimeFmtEnumProc, LCID Locale, WINAPI_GetTimeFormatFlags dwFlags);
  BOOL                         EnumTimeFormatsEx(                       TIMEFMT_ENUMPROCEX lpTimeFmtEnumProcEx, LPCWSTR lpLocaleName, WINAPI_GetTimeFormatFlags dwFlags, LPARAM lParam);
  int                          FindNLSString(                           LCID Locale, DWORD dwFindNLSStringFlags, LPCWSTR lpStringSource, int cchSource, LPCWSTR lpStringValue, int cchValue, LPINT pcchFound);
  int                          FindNLSStringEx(                         LPCWSTR lpLocaleName, DWORD dwFindNLSStringFlags, LPCWSTR lpStringSource, int cchSource, LPCWSTR lpStringValue, int cchValue, LPINT pcchFound, LPNLSVERSIONINFO lpVersionInformation, LPVOID lpReserved, LPARAM lParam);
  int                          FindStringOrdinal(                       DWORD dwFindStringOrdinalFlags, LPCWSTR lpStringSource, int cchSource, LPCWSTR lpStringValue, int cchValue, BOOL bIgnoreCase);
  int                          FoldString(                              WINAPI_MappingFlags dwMapFlags, LPCTSTR lpSrcStr, int cchSrc, LPTSTR lpDestStr, int cchDest);
  UINT                         GetACP(                                  );
  BOOL                         GetCalendarDateFormatEx(                 LPCWSTR lpszLocale, DWORD dwFlags, LPCALDATETIME lpCalDateTime, LPCWSTR lpFormat, LPWSTR lpDateStr, int cchDate);
  int                          GetCalendarInfo(                         LCID Locale, CALID Calendar, CALTYPE CalType, LPTSTR lpCalData, int cchData, LPDWORD lpValue);
  int                          GetCalendarInfoEx(                       LPCWSTR lpLocaleName, CALID Calendar, LPCWSTR lpReserved, CALTYPE CalType, LPWSTR lpCalData, int cchData, LPDWORD lpValue);
  BOOL                         GetCalendarSupportedDateRange(           CALID Calendar, LPCALDATETIME lpCalMinDateTime, LPCALDATETIME lpCalMaxDateTime);
  BOOL                         GetCPInfo(                               WINAPI_CodePageEnum CodePage, LPCPINFO lpCPInfo);
  BOOL                         GetCPInfoEx(                             WINAPI_CodePageEnum CodePage, DWORD dwFlags, LPCPINFOEX lpCPInfoEx);
  int                          GetCurrencyFormat(                       LCID Locale, DWORD dwFlags, LPCTSTR lpValue, CURRENCYFMT* lpFormat, LPTSTR lpCurrencyStr, int cchCurrency);
  int                          GetCurrencyFormatEx(                     LPCWSTR lpLocaleName, DWORD dwFlags, LPCWSTR lpValue, CURRENCYFMT* lpFormat, LPWSTR lpCurrencyStr, int cchCurrency);
  int                          GetDateFormat(                           LCID Locale, WINAPI_GetDateFormatFlags dwFlags, SYSTEMTIME* lpDate, LPCTSTR lpFormat, LPTSTR lpDateStr, int cchDate);
  int                          GetDateFormatEx(                         LPCWSTR lpLocaleName, WINAPI_GetDateFormatFlags dwFlags, SYSTEMTIME* lpDate, LPCWSTR lpFormat, LPWSTR lpDateStr, int cchDate, LPCWSTR lpCalendar);
  int                          GetDurationFormat(                       LCID Locale, DWORD dwFlags, SYSTEMTIME* lpDuration, ULONGLONG ullDuration, LPCWSTR lpFormat, LPWSTR lpDurationStr, int cchDuration);
  int                          GetDurationFormatEx(                     LPCWSTR lpLocaleName, DWORD dwFlags, SYSTEMTIME* lpDuration, ULONGLONG ullDuration, LPCWSTR lpFormat, LPWSTR lpDurationStr, int cchDuration);
  int                          GetGeoInfo(                              GEOID Location, GEOTYPE GeoType, LPTSTR lpGeoData, int cchData, LANGID LangId);
  int                          GetLocaleInfo(                           LCID Locale, LCTYPE LCType, LPTSTR lpLCData, int cchData);
  int                          GetLocaleInfoEx(                         LPCWSTR lpLocaleName, LCTYPE LCType, LPWSTR lpLCData, int cchData);
  BOOL                         GetNLSVersion(                           NLS_FUNCTION Function, LCID Locale, LPNLSVERSIONINFO lpVersionInformation);
  BOOL                         GetNLSVersionEx(                         NLS_FUNCTION function, LPCWSTR lpLocaleName, LPNLSVERSIONINFOEX lpVersionInformation);
  int                          GetNumberFormat(                         LCID Locale, WINAPI_GetNumberFormatFlags dwFlags, LPCTSTR lpValue, NUMBERFMT* lpFormat, LPTSTR lpNumberStr, int cchNumber);
  int                          GetNumberFormatEx(                       LPCWSTR lpLocaleName, WINAPI_GetNumberFormatFlags dwFlags, LPCWSTR lpValue, NUMBERFMT* lpFormat, LPWSTR lpNumberStr, int cchNumber);
  UINT                         GetOEMCP(                                );
  int                          GetStringScripts(                        DWORD dwFlags, LPCWSTR lpString, int cchString, LPWSTR lpScripts, int cchScripts);
  LANGID                       GetSystemDefaultLangID(                  );
  LCID                         GetSystemDefaultLCID(                    );
  int                          GetSystemDefaultLocaleName(              LPWSTR lpLocaleName, int cchLocaleName);
  LCID                         GetThreadLocale(                         );
  int                          GetTimeFormat(                           LCID Locale, WINAPI_GetTimeFormatFlags dwFlags, SYSTEMTIME* lpTime, LPCTSTR lpFormat, LPTSTR lpTimeStr, int cchTime);
  int                          GetTimeFormatEx(                         LPCWSTR lpLocaleName, WINAPI_GetTimeFormatFlags dwFlags, SYSTEMTIME* lpTime, LPCWSTR lpFormat, LPWSTR lpTimeStr, int cchTime);
  LANGID                       GetUserDefaultLangID(                    );
  LCID                         GetUserDefaultLCID(                      );
  int                          GetUserDefaultLocaleName(                LPWSTR lpLocaleName, int cchLocaleName);
  GEOID                        GetUserGeoID(                            GEOCLASS GeoClass);
  BOOL                         IsCalendarLeapYear(                      CALID calId, UINT year, UINT era);
  BOOL                         IsNLSDefinedString(                      NLS_FUNCTION Function, DWORD dwFlags, LPNLSVERSIONINFO lpVersionInformation, LPCWSTR lpString, INT cchStr);
  BOOL                         IsValidCodePage(                         WINAPI_CodePageEnum CodePage);
  BOOL                         IsValidLanguageGroup(                    LGRPID LanguageGroup, WINAPI_LanguageGroupFlags dwFlags);
  BOOL                         IsValidLocale(                           LCID Locale, WINAPI_LocaleEnumerationFlags dwFlags);
  BOOL                         IsValidLocaleName(                       LPCWSTR lpLocaleName);
  int                          LCIDToLocaleName(                        LCID Locale, LPWSTR lpName, int cchName, DWORD dwFlags);
  int                          LCMapString(                             LCID Locale, WINAPI_LocaleMappingFlags dwMapFlags, LPCTSTR lpSrcStr, int cchSrc, LPTSTR lpDestStr, int cchDest);
  int                          LCMapStringEx(                           LPCWSTR lpLocaleName, WINAPI_LocaleMappingFlags dwMapFlags, LPCWSTR lpSrcStr, int cchSrc, LPWSTR lpDestStr, int cchDest, LPNLSVERSIONINFO lpVersionInformation, LPVOID lpReserved, LPARAM lParam);
  LCID                         LocaleNameToLCID(                        LPCWSTR lpName, DWORD dwFlags);
  int                          ResolveLocaleName(                       LPCWSTR lpNameToResolve, LPWSTR lpLocaleName, int cchLocaleName);
  BOOL                         RtlIsValidLocaleName(                    LPCWSTR LocaleName, ULONG Flags);
  BOOL                         SetCalendarInfo(                         LCID Locale, CALID Calendar, CALTYPE CalType, LPCTSTR lpCalData);
  BOOL                         SetLocaleInfo(                           LCID Locale, LCTYPE LCType, LPCTSTR lpLCData);
  BOOL                         SetThreadLocale(                         LCID Locale);
  BOOL                         SetUserGeoID(                            GEOID GeoId);
  BOOL                         UpdateCalendarDayOfWeek(                 LPCALDATETIME lpCalDateTime);
  BOOL                         VerifyScripts(                           DWORD dwFlags, LPCWSTR lpLocaleScripts, int cchLocaleScripts, LPCWSTR lpTestScripts, int cchTestScripts);
  BOOL                         GetDevicePowerState(                     HANDLE hDevice, BOOL* pfOn);
  BOOL                         GetSystemPowerStatus(                    LPSYSTEM_POWER_STATUS lpSystemPowerStatus);
  BOOL                         IsSystemResumeAutomatic(                 );
  BOOL                         PowerClearRequest(                       HANDLE PowerRequest, POWER_REQUEST_TYPE RequestType);
  HANDLE                       PowerCreateRequest(                      PREASON_CONTEXT Context);
  BOOL                         PowerSetRequest(                         HANDLE PowerRequest, POWER_REQUEST_TYPE RequestType);
  BOOL                         QueryUnbiasedInterruptTime(              PULONGLONG UnbiasedTime);
  EXECUTION_STATE              SetThreadExecutionState(                 EXECUTION_STATE esFlags);
  BOOL                         RequestWakeupLatency(                    LATENCY_TIME latency);
  BOOL                         SetSystemPowerState(                     BOOL fSuspend, BOOL fForce);
  HANDLE                       BeginUpdateResource(                     LPCTSTR pFileName, BOOL bDeleteExistingResources);
  BOOL                         EndUpdateResource(                       HANDLE hUpdate, BOOL fDiscard);
  BOOL                         EnumResourceLanguages(                   HMODULE hModule, LPCTSTR lpType, LPCTSTR lpName, ENUMRESLANGPROC lpEnumFunc, LONG_PTR lParam);
  BOOL                         EnumResourceLanguagesEx(                 HMODULE hModule, LPCTSTR lpType, LPCTSTR lpName, ENUMRESLANGPROC lpEnumFunc, LONG_PTR lParam, DWORD dwFlags, LANGID LangId);
  BOOL                         EnumResourceNames(                       HMODULE hModule, LPCTSTR lpszType, ENUMRESNAMEPROC lpEnumFunc, LONG_PTR lParam);
  BOOL                         EnumResourceNamesEx(                     HMODULE hModule, LPCTSTR lpszType, ENUMRESNAMEPROC lpEnumFunc, LONG_PTR lParam, WINAPI_ResourceEnumFlags dwFlags, LANGID LangId);
  BOOL                         EnumResourceTypes(                       HMODULE hModule, ENUMRESTYPEPROC lpEnumFunc, LONG_PTR lParam);
  BOOL                         EnumResourceTypesEx(                     HMODULE hModule, ENUMRESTYPEPROC lpEnumFunc, LONG_PTR lParam, DWORD dwFlags, LANGID LangId);
  HRSRC                        FindResource(                            HMODULE hModule, LPCTSTR lpName, LPCTSTR lpType);
  HRSRC                        FindResourceEx(                          HMODULE hModule, LPCTSTR lpType, LPCTSTR lpName, WORD wLanguage);
  BOOL                         FreeResource(                            HGLOBAL hglbResource);
  HGLOBAL                      LoadResource(                            HMODULE hModule, HRSRC hResInfo);
  LPVOID                       LockResource(                            HGLOBAL hResData);
  DWORD                        SizeofResource(                          HMODULE hModule, HRSRC hResInfo);
  BOOL                         UpdateResource(                          HANDLE hUpdate, LPCTSTR lpType, LPCTSTR lpName, WORD wLanguage, LPVOID lpData, DWORD cbData);
  int                          CompareString(                           LCID Locale, WINAPI_StringFlags dwCmpFlags, LPCTSTR lpString1, int cchCount1, LPCTSTR lpString2, int cchCount2);
  int                          CompareStringEx(                         LPCWSTR lpLocaleName, WINAPI_StringFlags dwCmpFlags, LPCWSTR lpString1, int cchCount1, LPCWSTR lpString2, int cchCount2, LPNLSVERSIONINFO lpVersionInformation, LPVOID lpReserved, LPARAM lParam);
  BOOL                         GetStringTypeA(                          LCID Locale, WINAPI_CharacterTypeFlag dwInfoType, LPCSTR lpSrcStr, int cchSrc, LPWORD lpCharType);
  BOOL                         GetStringTypeEx(                         LCID Locale, WINAPI_CharacterTypeFlag dwInfoType, LPCTSTR lpSrcStr, int cchSrc, LPWORD lpCharType);
  BOOL                         GetStringTypeW(                          WINAPI_CharacterTypeFlag dwInfoType, LPCWSTR lpSrcStr, int cchSrc, LPWORD lpCharType);
  LPSTR                        lstrcat(                                 LPSTR lpString1, LPSTR lpString2);
  LPTSTR                       lstrcat(                                 LPTSTR lpString1, LPTSTR lpString2);
  int                          lstrcmp(                                 LPCSTR lpString1, LPCSTR lpString2);
  int                          lstrcmp(                                 LPCTSTR lpString1, LPCTSTR lpString2);
  int                          lstrcmpi(                                LPCSTR lpString1, LPCSTR lpString2);
  int                          lstrcmpi(                                LPCTSTR lpString1, LPCTSTR lpString2);
  LPSTR                        lstrcpy(                                 LPSTR lpString1, LPSTR lpString2);
  LPTSTR                       lstrcpy(                                 LPTSTR lpString1, LPTSTR lpString2);
  LPSTR                        lstrcpyn(                                LPSTR lpString1, LPCSTR lpString2, int iMaxLength);
  LPTSTR                       lstrcpyn(                                LPTSTR lpString1, LPCTSTR lpString2, int iMaxLength);
  int                          lstrlen(                                 LPCSTR lpString);
  int                          lstrlen(                                 LPCTSTR lpString);
  PVOID                        AddVectoredContinueHandler(              ULONG FirstHandler, PVECTORED_EXCEPTION_HANDLER VectoredHandler);
  PVOID                        AddVectoredExceptionHandler(             ULONG FirstHandler, PVECTORED_EXCEPTION_HANDLER VectoredHandler);
  ULONG                        RemoveVectoredContinueHandler(           PVOID Handler);
  ULONG                        RemoveVectoredExceptionHandler(          PVOID Handler);
  LPTOP_LEVEL_EXCEPTION_FILTER SetUnhandledExceptionFilter(             LPTOP_LEVEL_EXCEPTION_FILTER lpTopLevelExceptionFilter);
  LONG                         UnhandledExceptionFilter(                EXCEPTION_POINTERS* ExceptionInfo);
  BOOLEAN                      RtlAddFunctionTable(                     PRUNTIME_FUNCTION FunctionTable, DWORD EntryCount, DWORD64 BaseAddress);
  VOID                         RtlCaptureContext(                       PCONTEXT ContextRecord);
  BOOLEAN                      RtlDeleteFunctionTable(                  PRUNTIME_FUNCTION FunctionTable);
  BOOLEAN                      RtlInstallFunctionTableCallback(         DWORD64 TableIdentifier, DWORD64 BaseAddress, DWORD Length, PGET_RUNTIME_FUNCTION_CALLBACK Callback, PVOID Context, PCWSTR OutOfProcessCallbackDll);
  VOID                         RtlRestoreContext(                       PCONTEXT ContextRecord, PEXCEPTION_RECORD ExceptionRecord);
  DWORD                        QueueUserAPC(                            PAPCFUNC pfnAPC, WINAPI_ThreadHandle hThread, ULONG_PTR dwData);
  BOOL                         GetOverlappedResult(                     HANDLE hFile, LPOVERLAPPED lpOverlapped, LPDWORD lpNumberOfBytesTransferred, BOOL bWait);
  VOID                         AcquireSRWLockExclusive(                 PSRWLOCK SRWLock);
  VOID                         AcquireSRWLockShared(                    PSRWLOCK SRWLock);
  VOID                         InitializeConditionVariable(             PCONDITION_VARIABLE ConditionVariable);
  VOID                         InitializeSRWLock(                       PSRWLOCK SRWLock);
  VOID                         ReleaseSRWLockExclusive(                 PSRWLOCK SRWLock);
  VOID                         ReleaseSRWLockShared(                    PSRWLOCK SRWLock);
  BOOL                         SleepConditionVariableCS(                PCONDITION_VARIABLE ConditionVariable, PCRITICAL_SECTION CriticalSection, WINAPI_WaitTimeout dwMilliseconds);
  BOOL                         SleepConditionVariableSRW(               PCONDITION_VARIABLE ConditionVariable, PSRWLOCK SRWLock, WINAPI_WaitTimeout dwMilliseconds, ULONG Flags);
  BOOLEAN                      TryAcquireSRWLockExclusive(              PSRWLOCK SRWLock);
  BOOLEAN                      TryAcquireSRWLockShared(                 PSRWLOCK SRWLock);
  VOID                         WakeAllConditionVariable(                PCONDITION_VARIABLE ConditionVariable);
  VOID                         WakeConditionVariable(                   PCONDITION_VARIABLE ConditionVariable);
  void                         DeleteCriticalSection(                   LPCRITICAL_SECTION lpCriticalSection);
  void                         EnterCriticalSection(                    LPCRITICAL_SECTION lpCriticalSection);
  void                         InitializeCriticalSection(               LPCRITICAL_SECTION lpCriticalSection);
  BOOL                         InitializeCriticalSectionAndSpinCount(   LPCRITICAL_SECTION lpCriticalSection, DWORD dwSpinCount);
  BOOL                         InitializeCriticalSectionEx(             LPCRITICAL_SECTION lpCriticalSection, DWORD dwSpinCount, DWORD Flags);
  void                         LeaveCriticalSection(                    LPCRITICAL_SECTION lpCriticalSection);
  DWORD                        SetCriticalSectionSpinCount(             LPCRITICAL_SECTION lpCriticalSection, DWORD dwSpinCount);
  BOOL                         TryEnterCriticalSection(                 LPCRITICAL_SECTION lpCriticalSection);
  HANDLE                       CreateEvent(                             LPSECURITY_ATTRIBUTES lpEventAttributes, BOOL bManualReset, BOOL bInitialState, LPCTSTR lpName);
  HANDLE                       CreateEventEx(                           LPSECURITY_ATTRIBUTES lpEventAttributes, LPCTSTR lpName, DWORD dwFlags, WINAPI_EventAccessRights dwDesiredAccess);
  HANDLE                       OpenEvent(                               WINAPI_EventAccessRights dwDesiredAccess, BOOL bInheritHandle, LPCTSTR lpName);
  BOOL                         PulseEvent(                              HANDLE hEvent);
  BOOL                         ResetEvent(                              HANDLE hEvent);
  BOOL                         SetEvent(                                HANDLE hEvent);
  BOOL                         InitOnceBeginInitialize(                 LPINIT_ONCE lpInitOnce, DWORD dwFlags, PBOOL fPending, LPVOID* lpContext);
  BOOL                         InitOnceComplete(                        LPINIT_ONCE lpInitOnce, DWORD dwFlags, LPVOID lpContext);
  BOOL                         InitOnceExecuteOnce(                     PINIT_ONCE InitOnce, PINIT_ONCE_FN InitFn, PVOID Parameter, LPVOID* Context);
  VOID                         InitOnceInitialize(                      PINIT_ONCE InitOnce);
  LONG                         InterlockedCompareExchange(              LONG volatile* Destination, LONG Exchange, LONG Comparand);
  LONGLONG                     InterlockedCompareExchange64(            LONGLONG volatile* Destination, LONGLONG Exchange, LONGLONG Comparand);
  LONG                         InterlockedDecrement(                    LONG volatile* Addend);
  LONG                         InterlockedExchange(                     LONG volatile* Target, LONG Value);
  LONG                         InterlockedExchangeAdd(                  LONG volatile* Addend, LONG Value);
  LONG                         InterlockedIncrement(                    LONG volatile* Addend);
  HANDLE                       CreateMutex(                             LPSECURITY_ATTRIBUTES lpMutexAttributes, BOOL bInitialOwner, LPCTSTR lpName);
  HANDLE                       CreateMutexEx(                           LPSECURITY_ATTRIBUTES lpMutexAttributes, LPCTSTR lpName, DWORD dwFlags, WINAPI_MutexAccessRights dwDesiredAccess);
  HANDLE                       OpenMutex(                               WINAPI_MutexAccessRights dwDesiredAccess, BOOL bInheritHandle, LPCTSTR lpName);
  BOOL                         ReleaseMutex(                            HANDLE hMutex);
  BOOL                         AddSIDToBoundaryDescriptor(              HANDLE* BoundaryDescriptor, PSID RequiredSid);
  BOOLEAN                      ClosePrivateNamespace(                   HANDLE Handle, WINAPI_PrivateNamespaceFlag Flags);
  HANDLE                       CreateBoundaryDescriptor(                LPCTSTR Name, ULONG Flags);
  HANDLE                       CreatePrivateNamespace(                  LPSECURITY_ATTRIBUTES lpPrivateNamespaceAttributes, LPVOID lpBoundaryDescriptor, LPCTSTR lpAliasPrefix);
  VOID                         DeleteBoundaryDescriptor(                HANDLE BoundaryDescriptor);
  HANDLE                       OpenPrivateNamespace(                    LPVOID lpBoundaryDescriptor, LPCTSTR lpAliasPrefix);
  HANDLE                       CreateSemaphore(                         LPSECURITY_ATTRIBUTES lpSemaphoreAttributes, LONG lInitialCount, LONG lMaximumCount, LPCTSTR lpName);
  HANDLE                       CreateSemaphoreEx(                       LPSECURITY_ATTRIBUTES lpSemaphoreAttributes, LONG lInitialCount, LONG lMaximumCount, LPCTSTR lpName, DWORD dwFlags, WINAPI_SemaphoreAccessRights dwDesiredAccess);
  HANDLE                       OpenSemaphore(                           WINAPI_SemaphoreAccessRights dwDesiredAccess, BOOL bInheritHandle, LPCTSTR lpName);
  BOOL                         ReleaseSemaphore(                        HANDLE hSemaphore, LONG lReleaseCount, LPLONG lpPreviousCount);
  void                         InitializeSListHead(                     PSLIST_HEADER ListHead);
  PSLIST_ENTRY                 InterlockedFlushSList(                   PSLIST_HEADER ListHead);
  PSLIST_ENTRY                 InterlockedPopEntrySList(                PSLIST_HEADER ListHead);
  PSLIST_ENTRY                 InterlockedPushEntrySList(               PSLIST_HEADER ListHead, PSLIST_ENTRY ListEntry);
  USHORT                       QueryDepthSList(                         PSLIST_HEADER ListHead);
  BOOL                         ChangeTimerQueueTimer(                   HANDLE TimerQueue, HANDLE Timer, ULONG DueTime, ULONG Period);
  HANDLE                       CreateTimerQueue(                        );
  BOOL                         CreateTimerQueueTimer(                   PHANDLE phNewTimer, HANDLE TimerQueue, WAITORTIMERCALLBACK Callback, PVOID Parameter, DWORD DueTime, DWORD Period, WINAPI_WorkItemFlags Flags);
  BOOL                         DeleteTimerQueue(                        HANDLE TimerQueue);
  BOOL                         DeleteTimerQueueEx(                      HANDLE TimerQueue, HANDLE CompletionEvent);
  BOOL                         DeleteTimerQueueTimer(                   HANDLE TimerQueue, HANDLE Timer, HANDLE CompletionEvent);
  BOOL                         RegisterWaitForSingleObject(             PHANDLE phNewWaitObject, HANDLE hObject, WAITORTIMERCALLBACK Callback, PVOID Context, WINAPI_WaitTimeout dwMilliseconds, WINAPI_WorkItemFlags dwFlags);
  DWORD                        SignalObjectAndWait(                     HANDLE hObjectToSignal, HANDLE hObjectToWaitOn, WINAPI_WaitTimeout dwMilliseconds, BOOL bAlertable);
  BOOL                         UnregisterWait(                          HANDLE WaitHandle);
  BOOL                         UnregisterWaitEx(                        HANDLE WaitHandle, HANDLE CompletionEvent);
  WINAPI_WAIT_RESULT           WaitForMultipleObjects(                  DWORD nCount, HANDLE* lpHandles, BOOL bWaitAll, WINAPI_WaitTimeout dwMilliseconds);
  WINAPI_WAIT_RESULT           WaitForMultipleObjectsEx(                DWORD nCount, HANDLE* lpHandles, BOOL bWaitAll, WINAPI_WaitTimeout dwMilliseconds, BOOL bAlertable);
  WINAPI_WAIT_RESULT           WaitForSingleObject(                     HANDLE hHandle, WINAPI_WaitTimeout dwMilliseconds);
  WINAPI_WAIT_RESULT           WaitForSingleObjectEx(                   HANDLE hHandle, WINAPI_WaitTimeout dwMilliseconds, BOOL bAlertable);
  BOOL                         CancelWaitableTimer(                     HANDLE hTimer);
  HANDLE                       CreateWaitableTimer(                     LPSECURITY_ATTRIBUTES lpTimerAttributes, BOOL bManualReset, LPCTSTR lpTimerName);
  HANDLE                       CreateWaitableTimerEx(                   LPSECURITY_ATTRIBUTES lpTimerAttributes, LPCTSTR lpTimerName, DWORD dwFlags, WINAPI_TimerAccessRights dwDesiredAccess);
  HANDLE                       OpenWaitableTimer(                       WINAPI_TimerAccessRights dwDesiredAccess, BOOL bInheritHandle, LPCTSTR lpTimerName);
  BOOL                         SetWaitableTimer(                        HANDLE hTimer, LARGE_INTEGER* pDueTime, LONG lPeriod, PTIMERAPCROUTINE pfnCompletionRoutine, LPVOID lpArgToCompletionRoutine, BOOL fResume);
  BOOL                         SetWaitableTimerEx(                      HANDLE hTimer, LARGE_INTEGER* lpDueTime, LONG lPeriod, PTIMERAPCROUTINE pfnCompletionRoutine, LPVOID lpArgToCompletionRoutine, PREASON_CONTEXT WakeContext, ULONG TolerableDelay);
  BOOL                         DnsHostnameToComputerName(               LPCTSTR Hostname, LPTSTR ComputerName, LPDWORD nSize);
  UINT                         EnumSystemFirmwareTables(                DWORD FirmwareTableProviderSignature, PVOID pFirmwareTableBuffer, DWORD BufferSize);
  DWORD                        ExpandEnvironmentStrings(                LPCTSTR lpSrc, LPTSTR lpDst, DWORD nSize);
  BOOL                         GetComputerName(                         LPTSTR lpBuffer, LPDWORD lpnSize);
  BOOL                         GetComputerNameEx(                       COMPUTER_NAME_FORMAT NameType, LPTSTR lpBuffer, LPDWORD lpnSize);
  DWORD                        GetFirmwareEnvironmentVariable(          LPCTSTR lpName, LPCTSTR lpGuid, PVOID pBuffer, DWORD nSize);
  void                         GetNativeSystemInfo(                     LPSYSTEM_INFO lpSystemInfo);
  BOOL                         GetProductInfo(                          DWORD dwOSMajorVersion, DWORD dwOSMinorVersion, DWORD dwSpMajorVersion, DWORD dwSpMinorVersion, WINAPI_ProductType* pdwReturnedProductType);
  UINT                         GetSystemDirectory(                      LPTSTR lpBuffer, UINT uSize);
  UINT                         GetSystemFirmwareTable(                  DWORD FirmwareTableProviderSignature, DWORD FirmwareTableID, PVOID pFirmwareTableBuffer, DWORD BufferSize);
  void                         GetSystemInfo(                           LPSYSTEM_INFO lpSystemInfo);
  BOOL                         GetSystemRegistryQuota(                  PDWORD pdwQuotaAllowed, PDWORD pdwQuotaUsed);
  UINT                         GetSystemWindowsDirectory(               LPTSTR lpBuffer, UINT uSize);
  UINT                         GetSystemWow64Directory(                 LPTSTR lpBuffer, UINT uSize);
  DWORD                        GetVersion(                              );
  BOOL                         GetVersionEx(                            LPOSVERSIONINFO lpVersionInfo);
  UINT                         GetWindowsDirectory(                     LPTSTR lpBuffer, UINT uSize);
  BOOL                         IsProcessorFeaturePresent(               WINAPI_ProcessorFeatureEnum ProcessorFeature);
  BOOL                         SetComputerName(                         LPCTSTR lpComputerName);
  BOOL                         SetComputerNameEx(                       COMPUTER_NAME_FORMAT NameType, LPCTSTR lpBuffer);
  BOOL                         SetFirmwareEnvironmentVariable(          LPCTSTR lpName, LPCTSTR lpGuid, PVOID pBuffer, DWORD nSize);
  BOOL                         VerifyVersionInfo(                       LPOSVERSIONINFOEX lpVersionInfo, WINAPI_NtVerType dwTypeMask, DWORDLONG dwlConditionMask);
  ULONGLONG                    VerSetConditionMask(                     ULONGLONG dwlConditionMask, WINAPI_NtVerType dwTypeBitMask, WINAPI_VerOperator dwConditionMask);
  BOOL                         BackupRead(                              HANDLE hFile, LPBYTE lpBuffer, DWORD nNumberOfBytesToRead, LPDWORD lpNumberOfBytesRead, BOOL bAbort, BOOL bProcessSecurity, LPVOID* lpContext);
  BOOL                         BackupSeek(                              HANDLE hFile, DWORD dwLowBytesToSeek, DWORD dwHighBytesToSeek, LPDWORD lpdwLowByteSeeked, LPDWORD lpdwHighByteSeeked, LPVOID* lpContext);
  BOOL                         BackupWrite(                             HANDLE hFile, LPBYTE lpBuffer, DWORD nNumberOfBytesToWrite, LPDWORD lpNumberOfBytesWritten, BOOL bAbort, BOOL bProcessSecurity, LPVOID* lpContext);
  DWORD                        CreateTapePartition(                     HANDLE hDevice, DWORD dwPartitionMethod, DWORD dwCount, DWORD dwSize);
  DWORD                        EraseTape(                               HANDLE hDevice, DWORD dwEraseType, BOOL bImmediate);
  DWORD                        GetTapeParameters(                       HANDLE hDevice, DWORD dwOperation, LPDWORD lpdwSize, LPVOID lpTapeInformation);
  DWORD                        GetTapePosition(                         HANDLE hDevice, DWORD dwPositionType, LPDWORD lpdwPartition, LPDWORD lpdwOffsetLow, LPDWORD lpdwOffsetHigh);
  DWORD                        GetTapeStatus(                           HANDLE hDevice);
  DWORD                        PrepareTape(                             HANDLE hDevice, DWORD dwOperation, BOOL bImmediate);
  DWORD                        SetTapeParameters(                       HANDLE hDevice, DWORD dwOperation, LPVOID lpTapeInformation);
  DWORD                        SetTapePosition(                         HANDLE hDevice, DWORD dwPositionMethod, DWORD dwPartition, DWORD dwOffsetLow, DWORD dwOffsetHigh, BOOL bImmediate);
  DWORD                        WriteTapemark(                           HANDLE hDevice, DWORD dwTapemarkType, DWORD dwTapemarkCount, BOOL bImmediate);
  BOOL                         ProcessIdToSessionId(                    DWORD dwProcessId, DWORD* pSessionId);
  DWORD                        WTSGetActiveConsoleSessionId(            );
  void                         GetSystemTime(                           LPSYSTEMTIME lpSystemTime);
  BOOL                         GetSystemTimeAdjustment(                 PDWORD lpTimeAdjustment, PDWORD lpTimeIncrement, PBOOL lpTimeAdjustmentDisabled);
  BOOL                         SetSystemTime(                           SYSTEMTIME* lpSystemTime);
  BOOL                         SetSystemTimeAdjustment(                 DWORD dwTimeAdjustment, BOOL bTimeAdjustmentDisabled);
  BOOL                         FileTimeToLocalFileTime(                 FILETIME* lpFileTime, LPFILETIME lpLocalFileTime);
  DWORD                        GetDynamicTimeZoneInformation(           PDYNAMIC_TIME_ZONE_INFORMATION pTimeZoneInformation);
  void                         GetLocalTime(                            LPSYSTEMTIME lpSystemTime);
  DWORD                        GetTimeZoneInformation(                  LPTIME_ZONE_INFORMATION lpTimeZoneInformation);
  BOOL                         GetTimeZoneInformationForYear(           USHORT wYear, PDYNAMIC_TIME_ZONE_INFORMATION pdtzi, LPTIME_ZONE_INFORMATION ptzi);
  BOOL                         SetDynamicTimeZoneInformation(           DYNAMIC_TIME_ZONE_INFORMATION* lpTimeZoneInformation);
  BOOL                         SetLocalTime(                            SYSTEMTIME* lpSystemTime);
  BOOL                         SetTimeZoneInformation(                  TIME_ZONE_INFORMATION* lpTimeZoneInformation);
  BOOL                         SystemTimeToTzSpecificLocalTime(         LPTIME_ZONE_INFORMATION lpTimeZone, LPSYSTEMTIME lpUniversalTime, LPSYSTEMTIME lpLocalTime);
  BOOL                         TzSpecificLocalTimeToSystemTime(         LPTIME_ZONE_INFORMATION lpTimeZoneInformation, LPSYSTEMTIME lpLocalTime, LPSYSTEMTIME lpUniversalTime);
  LONG                         CompareFileTime(                         FILETIME* lpFileTime1, FILETIME* lpFileTime2);
  BOOL                         FileTimeToSystemTime(                    FILETIME* lpFileTime, LPSYSTEMTIME lpSystemTime);
  BOOL                         GetFileTime(                             HANDLE hFile, LPFILETIME lpCreationTime, LPFILETIME lpLastAccessTime, LPFILETIME lpLastWriteTime);
  void                         GetSystemTimeAsFileTime(                 LPFILETIME lpSystemTimeAsFileTime);
  BOOL                         LocalFileTimeToFileTime(                 FILETIME* lpLocalFileTime, LPFILETIME lpFileTime);
  BOOL                         SetFileTime(                             HANDLE hFile, FILETIME* lpCreationTime, FILETIME* lpLastAccessTime, FILETIME* lpLastWriteTime);
  BOOL                         SystemTimeToFileTime(                    SYSTEMTIME* lpSystemTime, LPFILETIME lpFileTime);
  BOOL                         DosDateTimeToFileTime(                   WORD wFatDate, WORD wFatTime, LPFILETIME lpFileTime);
  BOOL                         FileTimeToDosDateTime(                   FILETIME* lpFileTime, LPWORD lpFatDate, LPWORD lpFatTime);
  BOOL                         GetSystemTimes(                          LPFILETIME lpIdleTime, LPFILETIME lpKernelTime, LPFILETIME lpUserTime);
  DWORD                        GetTickCount(                            );
  ULONGLONG                    GetTickCount64(                          );
  BOOL                         QueryPerformanceCounter(                 LARGE_INTEGER* lpPerformanceCount);
  BOOL                         QueryPerformanceFrequency(               LARGE_INTEGER* lpFrequency);
  BOOL                         IsDBCSLeadByte(                          BYTE TestChar);
  BOOL                         IsDBCSLeadByteEx(                        WINAPI_CodePageEnum CodePage, BYTE TestChar);
  int                          MultiByteToWideChar(                     WINAPI_CodePageEnum CodePage, WINAPI_MultiByteFlags dwFlags, LPCSTR lpMultiByteStr, int cbMultiByte, LPWSTR lpWideCharStr, int cchWideChar);
  int                          WideCharToMultiByte(                     WINAPI_CodePageEnum CodePage, WINAPI_WideCharFlags dwFlags, LPCWSTR lpWideCharStr, int cchWideChar, LPSTR lpMultiByteStr, int cbMultiByte, LPCSTR lpDefaultChar, LPBOOL lpUsedDefaultChar);
  DWORD                        VerLanguageName(                         DWORD wLang, LPTSTR szLang, DWORD cchLang);
  VOID                         RaiseFailFastException(                  PEXCEPTION_RECORD pExceptionRecord, PCONTEXT pContextRecord, DWORD dwFlags);
  HRESULT                      WerGetFlags(                             WINAPI_ProcessHandle hProcess, PDWORD pdwFlags);
  HRESULT                      WerRegisterFile(                         PCWSTR pwzFile, WER_REGISTER_FILE_TYPE regFileType, WINAPI_WerFileFlags dwFlags);
  HRESULT                      WerRegisterMemoryBlock(                  PVOID pvAddress, DWORD dwSize);
  HRESULT                      WerRegisterRuntimeExceptionModule(       PCWSTR pwszOutOfProcessCallbackDll, PVOID pContext);
  HRESULT                      WerSetFlags(                             DWORD dwFlags);
  HRESULT                      WerUnregisterFile(                       PCWSTR pwzFilePath);
  HRESULT                      WerUnregisterMemoryBlock(                PVOID pvAddress);
  HRESULT                      WerUnregisterRuntimeExceptionModule(     PCWSTR pwszOutOfProcessCallbackDll, PVOID pContext);
  BOOL                         CreateDirectory(                         LPCTSTR lpPathName, LPSECURITY_ATTRIBUTES lpSecurityAttributes);
  BOOL                         CreateDirectoryEx(                       LPCTSTR lpTemplateDirectory, LPCTSTR lpNewDirectory, LPSECURITY_ATTRIBUTES lpSecurityAttributes);
  BOOL                         CreateDirectoryTransacted(               LPCTSTR lpTemplateDirectory, LPCTSTR lpNewDirectory, LPSECURITY_ATTRIBUTES lpSecurityAttributes, HANDLE hTransaction);
  BOOL                         FindCloseChangeNotification(             HANDLE hChangeHandle);
  HANDLE                       FindFirstChangeNotification(             LPCTSTR lpPathName, BOOL bWatchSubtree, WINAPI_FILE_NOTIFY_CHANGE_FLAGS dwNotifyFilter);
  BOOL                         FindNextChangeNotification(              HANDLE hChangeHandle);
  DWORD                        GetCurrentDirectory(                     DWORD nBufferLength, LPTSTR lpBuffer);
  BOOL                         ReadDirectoryChangesW(                   HANDLE hDirectory, LPVOID lpBuffer, DWORD nBufferLength, BOOL bWatchSubtree, WINAPI_FILE_NOTIFY_CHANGE_FLAGS dwNotifyFilter, LPDWORD lpBytesReturned, LPOVERLAPPED lpOverlapped, LPOVERLAPPED_COMPLETION_ROUTINE lpCompletionRoutine);
  BOOL                         RemoveDirectory(                         LPCTSTR lpPathName);
  BOOL                         RemoveDirectoryTransacted(               LPCTSTR lpPathName, HANDLE hTransaction);
  BOOL                         SetCurrentDirectory(                     LPCTSTR lpPathName);
  BOOL                         GetDiskFreeSpace(                        LPCTSTR lpRootPathName, LPDWORD lpSectorsPerCluster, LPDWORD lpBytesPerSector, LPDWORD lpNumberOfFreeClusters, LPDWORD lpTotalNumberOfClusters);
  BOOL                         GetDiskFreeSpaceEx(                      LPCTSTR lpDirectoryName, PULARGE_INTEGER lpFreeBytesAvailable, PULARGE_INTEGER lpTotalNumberOfBytes, PULARGE_INTEGER lpTotalNumberOfFreeBytes);
  BOOL                         DefineDosDevice(                         WINAPI_DDD_FLAGS dwFlags, LPCTSTR lpDeviceName, LPCTSTR lpTargetPath);
  BOOL                         DeleteVolumeMountPoint(                  LPCTSTR lpszVolumeMountPoint);
  HANDLE                       FindFirstVolume(                         LPTSTR lpszVolumeName, DWORD cchBufferLength);
  BOOL                         FindNextVolume(                          HANDLE hFindVolume, LPTSTR lpszVolumeName, DWORD cchBufferLength);
  BOOL                         FindNextVolumeMountPoint(                HANDLE hFindVolumeMountPoint, LPTSTR lpszVolumeMountPoint, DWORD cchBufferLength);
  BOOL                         FindVolumeClose(                         HANDLE hFindVolume);
  BOOL                         FindVolumeMountPointClose(               HANDLE hFindVolumeMountPoint);
  WINAPI_DRIVE_TYPE            GetDriveType(                            LPCTSTR lpRootPathName);
  DWORD                        GetLogicalDrives(                        );
  DWORD                        GetLogicalDriveStrings(                  DWORD nBufferLength, LPTSTR lpBuffer);
  BOOL                         GetVolumeInformation(                    LPCTSTR lpRootPathName, LPTSTR lpVolumeNameBuffer, DWORD nVolumeNameSize, LPDWORD lpVolumeSerialNumber, LPDWORD lpMaximumComponentLength, WINAPI_LPFILE_SYSTEM_FLAGS lpFileSystemFlags, LPTSTR lpFileSystemNameBuffer, DWORD nFileSystemNameSize);
  BOOL                         GetVolumeInformationByHandleW(           HANDLE hFile, LPTSTR lpVolumeNameBuffer, DWORD nVolumeNameSize, LPDWORD lpVolumeSerialNumber, LPDWORD lpMaximumComponentLength, WINAPI_LPFILE_SYSTEM_FLAGS lpFileSystemFlags, LPTSTR lpFileSystemNameBuffer, DWORD nFileSystemNameSize);
  BOOL                         GetVolumeNameForVolumeMountPoint(        LPCTSTR lpszVolumeMountPoint, LPTSTR lpszVolumeName, DWORD cchBufferLength);
  BOOL                         GetVolumePathName(                       LPCTSTR lpszFileName, LPTSTR lpszVolumePathName, DWORD cchBufferLength);
  BOOL                         GetVolumePathNamesForVolumeName(         LPCTSTR lpszVolumeName, LPTSTR lpszVolumePathNames, DWORD cchBufferLength, PDWORD lpcchReturnLength);
  DWORD                        QueryDosDevice(                          LPCTSTR lpDeviceName, LPTSTR lpTargetPath, DWORD ucchMax);
  BOOL                         SetVolumeLabel(                          LPCTSTR lpRootPathName, LPCTSTR lpVolumeName);
  HANDLE                       FindFirstVolumeMountPoint(               LPTSTR lpszRootPathName, LPTSTR lpszVolumeMountPoint, DWORD cchBufferLength);
  BOOL                         SetVolumeMountPoint(                     LPCTSTR lpszVolumeMountPoint, LPCTSTR lpszVolumeName);
  BOOL                         CreatePipe(                              PHANDLE hReadPipe, PHANDLE hWritePipe, LPSECURITY_ATTRIBUTES lpPipeAttributes, DWORD nSize);
  BOOL                         CallNamedPipe(                           LPCTSTR lpNamedPipeName, LPVOID lpInBuffer, DWORD nInBufferSize, LPVOID lpOutBuffer, DWORD nOutBufferSize, LPDWORD lpBytesRead, WINAPI_NMPWAIT nTimeOut);
  BOOL                         ConnectNamedPipe(                        HANDLE hNamedPipe, LPOVERLAPPED lpOverlapped);
  HANDLE                       CreateNamedPipe(                         LPCTSTR lpName, WINAPI_PIPE_ACCESS dwOpenMode, WINAPI_PIPE_MODE dwPipeMode, DWORD nMaxInstances, DWORD nOutBufferSize, DWORD nInBufferSize, DWORD nDefaultTimeOut, LPSECURITY_ATTRIBUTES lpSecurityAttributes);
  BOOL                         DisconnectNamedPipe(                     HANDLE hNamedPipe);
  BOOL                         GetNamedPipeClientComputerName(          HANDLE Pipe, LPTSTR ClientComputerName, ULONG ClientComputerNameLength);
  BOOL                         GetNamedPipeClientProcessId(             HANDLE Pipe, PULONG ClientProcessId);
  BOOL                         GetNamedPipeClientSessionId(             HANDLE Pipe, PULONG ClientSessionId);
  BOOL                         GetNamedPipeHandleState(                 HANDLE hNamedPipe, WINAPI_PIPE_STATE* lpState, LPDWORD lpCurInstances, LPDWORD lpMaxCollectionCount, LPDWORD lpCollectDataTimeout, LPTSTR lpUserName, DWORD nMaxUserNameSize);
  BOOL                         GetNamedPipeInfo(                        HANDLE hNamedPipe, WINAPI_PIPE_TYPE* lpFlags, LPDWORD lpOutBufferSize, LPDWORD lpInBufferSize, LPDWORD lpMaxInstances);
  BOOL                         GetNamedPipeServerProcessId(             HANDLE Pipe, PULONG ServerProcessId);
  BOOL                         GetNamedPipeServerSessionId(             HANDLE Pipe, PULONG ServerSessionId);
  BOOL                         PeekNamedPipe(                           HANDLE hNamedPipe, LPVOID lpBuffer, DWORD nBufferSize, LPDWORD lpBytesRead, LPDWORD lpTotalBytesAvail, LPDWORD lpBytesLeftThisMessage);
  BOOL                         SetNamedPipeHandleState(                 HANDLE hNamedPipe, WINAPI_PIPE_MODE* lpMode, LPDWORD lpMaxCollectionCount, LPDWORD lpCollectDataTimeout);
  BOOL                         TransactNamedPipe(                       HANDLE hNamedPipe, LPVOID lpInBuffer, DWORD nInBufferSize, LPVOID lpOutBuffer, DWORD nOutBufferSize, LPDWORD lpBytesRead, LPOVERLAPPED lpOverlapped);
  BOOL                         WaitNamedPipe(                           LPCTSTR lpNamedPipeName, WINAPI_NMPWAIT nTimeOut);
  DWORD                        DisableThreadProfiling(                  HANDLE PerformanceDataHandle);
  DWORD                        EnableThreadProfiling(                   HANDLE ThreadHandle, DWORD Flags, DWORD64 HardwareCounters, HANDLE PerformanceDataHandle);
  DWORD                        QueryThreadProfiling(                    HANDLE ThreadHandle, PBOOLEAN Enabled);
  DWORD                        ReadThreadProfilingData(                 HANDLE PerformanceDataHandle, DWORD Flags, PPERFORMANCE_DATA PerformanceData);
  LARGE_INTEGER*               BaseFormatTimeOut(                       LARGE_INTEGER* pLITimeout, DWORD dwMillis);
  NTSTATUS                     BaseGetNamedObjectDirectory(             HANDLE* phDir);
  BOOL                         Basep8BitStringToDynamicUnicodeString(   PUNICODE_STRING pConvertedStr, LPCSTR pszAnsiStr);
  DWORD                        CheckElevationEnabled(                   BOOL* pResult);
  BOOL                         SetConsoleCursor(                        HANDLE hConsole, HCURSOR hCursor);
  BOOL                         SetConsoleMaximumWindowSize(             HANDLE hConsole, DWORD dwUnk);
  BOOL                         SetStdHandleEx(                          WINAPI_StdHandle dwStdHandle, HANDLE hNewHandle, HANDLE* phOldHandle);
  int                          ShowConsoleCursor(                       HANDLE hConsoleOutput, BOOL bShow);
  DWORD                        AddLocalAlternateComputerName(           LPCTSTR lpDnsFQHostname, ULONG ulFlags);
  FARPROC                      DelayLoadFailureHook(                    LPCSTR pszDllName, LPCSTR pszProcName);
  PVOID                        DecodePointer(                           PVOID Ptr);
  PVOID                        DecodeSystemPointer(                     PVOID Ptr);
  PVOID                        EncodePointer(                           PVOID Ptr);
  PVOID                        EncodeSystemPointer(                     PVOID Ptr);
  int                          MulDiv(                                  int nNumber, int nNumerator, int nDenominator);
]]
ffi.load( 'Kernel32.dll' )

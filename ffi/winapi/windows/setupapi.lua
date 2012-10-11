require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/setup' )
require( 'ffi/winapi/headers/gdi' )
require( 'ffi/winapi/headers/registry' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef TCHAR* DEVINSTID; //Alias
  typedef PVOID HDSKSPC; //Alias
  typedef PVOID HINF; //Alias
  typedef PVOID HSPFILEQ; //Alias
  typedef LPVOID PSP_FILE_CALLBACK; //Alias
  typedef PVOID HSPFILELOG; //Alias
  typedef GUID DEVPROPGUID; //Alias
  typedef ULONG DEVPROPID; //Alias
  typedef LPVOID PSP_DETSIG_CMPPROC; //Alias
  typedef DWORDLONG SP_LOG_TOKEN; //Alias
  typedef DWORD_PTR LOG_CONF; //Alias
  typedef LOG_CONF *PLOG_CONF; //Pointer
  typedef DWORD DEVINST; //Alias
  typedef DWORD *PDEVINST; //Pointer
  typedef ULONG PRIORITY; //Alias
  typedef PRIORITY *PPRIORITY; //Pointer
  typedef DWORD CONFIGRET; //Alias
  typedef DWORD_PTR RES_DES; //Alias
  typedef RES_DES *PRES_DES; //Pointer
  typedef ULONG RESOURCEID; //Alias
  typedef RESOURCEID *PRESOURCEID; //Pointer
  typedef HANDLE HMACHINE; //Alias
  typedef HMACHINE *PHMACHINE; //Pointer
  typedef ULONG_PTR CONFLICT_LIST; //Alias
  typedef CONFLICT_LIST *PCONFLICT_LIST; //Pointer
  enum { SP_MAX_MACHINENAME_LENGTH = 263 };
  typedef DWORD WINAPI_InfStyle; //Alias
  typedef struct SP_INF_INFORMATION {
    WINAPI_InfStyle InfStyle;
    DWORD InfCount;
    BYTE VersionData[ANYSIZE_ARRAY];
  } SP_INF_INFORMATION;
  typedef SP_INF_INFORMATION *PSP_INF_INFORMATION; //Pointer
  typedef struct SP_ALTPLATFORM_INFO {
    DWORD cbSize;
    WINAPI_VER_PLATFORM Platform;
    DWORD MajorVersion;
    DWORD MinorVersion;
    WINAPI_PROCESSOR_ARCHITECTURE ProcessorArchitecture;
    WORD Flags;
    DWORD FirstValidatedMajorVersion;
    DWORD FirstValidatedMinorVersion;
  } SP_ALTPLATFORM_INFO;
  typedef SP_ALTPLATFORM_INFO *PSP_ALTPLATFORM_INFO; //Pointer
  typedef struct SP_ORIGINAL_FILE_INFO {
    DWORD cbSize;
    TCHAR OriginalInfName[MAX_PATH];
    TCHAR OriginalCatalogName[MAX_PATH];
  } SP_ORIGINAL_FILE_INFO;
  typedef SP_ORIGINAL_FILE_INFO *PSP_ORIGINAL_FILE_INFO; //Pointer
  typedef struct SP_INF_SIGNER_INFO {
    DWORD cbSize;
    TCHAR CatalogFile[MAX_PATH];
    TCHAR DigitalSigner[MAX_PATH];
    TCHAR DigitalSignerVersion[MAX_PATH];
    DWORD SignerScore;
  } SP_INF_SIGNER_INFO;
  typedef SP_INF_SIGNER_INFO *PSP_INF_SIGNER_INFO; //Pointer
  typedef struct SP_DEVINFO_LIST_DETAIL_DATA {
    DWORD cbSize;
    GUID ClassGuid;
    HANDLE RemoteMachineHandle;
    TCHAR RemoteMachineName[SP_MAX_MACHINENAME_LENGTH];
  } SP_DEVINFO_LIST_DETAIL_DATA;
  typedef SP_DEVINFO_LIST_DETAIL_DATA *PSP_DEVINFO_LIST_DETAIL_DATA; //Pointer
  typedef DWORD WINAPI_DI_FLAGS; //Alias
  typedef DWORD WINAPI_DI_FLAGSEX; //Alias
  typedef struct SP_DEVINSTALL_PARAMS {
    DWORD cbSize;
    WINAPI_DI_FLAGS Flags;
    WINAPI_DI_FLAGSEX FlagsEx;
    HWND hwndParent;
    PSP_FILE_CALLBACK InstallMsgHandler;
    PVOID InstallMsgHandlerContext;
    HSPFILEQ FileQueue;
    ULONG_PTR ClassInstallReserved;
    DWORD Reserved;
    TCHAR DriverPath[MAX_PATH];
  } SP_DEVINSTALL_PARAMS;
  typedef SP_DEVINSTALL_PARAMS *PSP_DEVINSTALL_PARAMS; //Pointer
  typedef struct SP_DEVICE_INTERFACE_DETAIL_DATA {
    DWORD cbSize;
    TCHAR DevicePath[ANYSIZE_ARRAY];
  } SP_DEVICE_INTERFACE_DETAIL_DATA;
  typedef SP_DEVICE_INTERFACE_DETAIL_DATA *PSP_DEVICE_INTERFACE_DETAIL_DATA; //Pointer
  typedef struct SP_DRVINFO_DETAIL_DATA {
    DWORD cbSize;
    FILETIME InfDate;
    DWORD CompatIDsOffset;
    DWORD CompatIDsLength;
    ULONG_PTR Reserved;
    TCHAR SectionName[LINE_LEN];
    TCHAR InfFileName[MAX_PATH];
    TCHAR DrvDescription[LINE_LEN];
    TCHAR HardwareID[ANYSIZE_ARRAY];
  } SP_DRVINFO_DETAIL_DATA;
  typedef SP_DRVINFO_DETAIL_DATA *PSP_DRVINFO_DETAIL_DATA; //Pointer
  typedef ULONG WINAPI_CM_CDMASK; //Alias
  typedef ULONG WINAPI_CM_CDFLAGS; //Alias
  typedef struct CONFLICT_DETAILS {
    ULONG CD_ulSize;
    WINAPI_CM_CDMASK CD_ulMask;
    DEVINST CD_dnDevInst;
    RES_DES CD_rdResDes;
    WINAPI_CM_CDFLAGS CD_ulFlags;
    TCHAR CD_szDescription[MAX_PATH];
  } CONFLICT_DETAILS;
  typedef CONFLICT_DETAILS *PCONFLICT_DETAILS; //Pointer
  typedef struct INFCONTEXT {
    PVOID Inf;
    PVOID CurrentInf;
    UINT Section;
    UINT Line;
  } INFCONTEXT;
  typedef INFCONTEXT *PINFCONTEXT; //Pointer
  typedef struct SP_FILE_COPY_PARAMS {
    DWORD cbSize;
    HSPFILEQ QueueHandle;
    PCTSTR SourceRootPath;
    PCTSTR SourcePath;
    PCTSTR SourceFilename;
    PCTSTR SourceDescription;
    PCTSTR SourceTagfile;
    PCTSTR TargetDirectory;
    PCTSTR TargetFilename;
    DWORD CopyStyle;
    HINF LayoutInf;
    PCTSTR SecurityDescriptor;
  } SP_FILE_COPY_PARAMS;
  typedef SP_FILE_COPY_PARAMS *PSP_FILE_COPY_PARAMS; //Pointer
  typedef struct SP_DEVICE_INTERFACE_DATA {
    DWORD cbSize;
    GUID InterfaceClassGuid;
    DWORD Flags;
    ULONG_PTR Reserved;
  } SP_DEVICE_INTERFACE_DATA;
  typedef SP_DEVICE_INTERFACE_DATA *PSP_DEVICE_INTERFACE_DATA; //Pointer
  typedef struct SP_CLASSIMAGELIST_DATA {
    DWORD cbSize;
    HIMAGELIST ImageList;
    ULONG_PTR Reserved;
  } SP_CLASSIMAGELIST_DATA;
  typedef SP_CLASSIMAGELIST_DATA *PSP_CLASSIMAGELIST_DATA; //Pointer
  typedef UINT DI_FUNCTION; //Alias
  static const DI_FUNCTION DIF_SELECTDEVICE = 0x00000001;
  static const DI_FUNCTION DIF_INSTALLDEVICE = 0x00000002;
  static const DI_FUNCTION DIF_ASSIGNRESOURCES = 0x00000003;
  static const DI_FUNCTION DIF_PROPERTIES = 0x00000004;
  static const DI_FUNCTION DIF_REMOVE = 0x00000005;
  static const DI_FUNCTION DIF_FIRSTTIMESETUP = 0x00000006;
  static const DI_FUNCTION DIF_FOUNDDEVICE = 0x00000007;
  static const DI_FUNCTION DIF_SELECTCLASSDRIVERS = 0x00000008;
  static const DI_FUNCTION DIF_VALIDATECLASSDRIVERS = 0x00000009;
  static const DI_FUNCTION DIF_INSTALLCLASSDRIVERS = 0x0000000A;
  static const DI_FUNCTION DIF_CALCDISKSPACE = 0x0000000B;
  static const DI_FUNCTION DIF_DESTROYPRIVATEDATA = 0x0000000C;
  static const DI_FUNCTION DIF_VALIDATEDRIVER = 0x0000000D;
  static const DI_FUNCTION DIF_DETECT = 0x0000000F;
  static const DI_FUNCTION DIF_INSTALLWIZARD = 0x00000010;
  static const DI_FUNCTION DIF_DESTROYWIZARDDATA = 0x00000011;
  static const DI_FUNCTION DIF_PROPERTYCHANGE = 0x00000012;
  static const DI_FUNCTION DIF_ENABLECLASS = 0x00000013;
  static const DI_FUNCTION DIF_DETECTVERIFY = 0x00000014;
  static const DI_FUNCTION DIF_INSTALLDEVICEFILES = 0x00000015;
  static const DI_FUNCTION DIF_UNREMOVE = 0x00000016;
  static const DI_FUNCTION DIF_SELECTBESTCOMPATDRV = 0x00000017;
  static const DI_FUNCTION DIF_ALLOW_INSTALL = 0x00000018;
  static const DI_FUNCTION DIF_REGISTERDEVICE = 0x00000019;
  static const DI_FUNCTION DIF_NEWDEVICEWIZARD_PRESELECT = 0x0000001A;
  static const DI_FUNCTION DIF_NEWDEVICEWIZARD_SELECT = 0x0000001B;
  static const DI_FUNCTION DIF_NEWDEVICEWIZARD_PREANALYZE = 0x0000001C;
  static const DI_FUNCTION DIF_NEWDEVICEWIZARD_POSTANALYZE = 0x0000001D;
  static const DI_FUNCTION DIF_NEWDEVICEWIZARD_FINISHINSTALL = 0x0000001E;
  static const DI_FUNCTION DIF_UNUSED1 = 0x0000001F;
  static const DI_FUNCTION DIF_INSTALLINTERFACES = 0x00000020;
  static const DI_FUNCTION DIF_DETECTCANCEL = 0x00000021;
  static const DI_FUNCTION DIF_REGISTER_COINSTALLERS = 0x00000022;
  static const DI_FUNCTION DIF_ADDPROPERTYPAGE_ADVANCED = 0x00000023;
  static const DI_FUNCTION DIF_ADDPROPERTYPAGE_BASIC = 0x00000024;
  static const DI_FUNCTION DIF_RESERVED1 = 0x00000025;
  static const DI_FUNCTION DIF_TROUBLESHOOTER = 0x00000026;
  static const DI_FUNCTION DIF_POWERMESSAGEWAKE = 0x00000027;
  static const DI_FUNCTION DIF_ADDREMOTEPROPERTYPAGE_ADVANCED = 0x00000028;
  static const DI_FUNCTION DIF_UPDATEDRIVER_UI = 0x00000029;
  static const DI_FUNCTION DIF_FINISHINSTALL_ACTION = 0x0000002A;
  static const DI_FUNCTION DIF_RESERVED2 = 0x00000030;
  static const DI_FUNCTION DIF_MOVEDEVICE = 0x0000000E;
  typedef struct SP_CLASSINSTALL_HEADER {
    DWORD cbSize;
    DI_FUNCTION InstallFunction;
  } SP_CLASSINSTALL_HEADER;
  typedef SP_CLASSINSTALL_HEADER *PSP_CLASSINSTALL_HEADER; //Pointer
  typedef struct DEVPROPKEY {
    DEVPROPGUID fmtid;
    DEVPROPID pid;
  } DEVPROPKEY;
  typedef struct SP_DRVINSTALL_PARAMS {
    DWORD cbSize;
    DWORD Rank;
    DWORD Flags;
    DWORD_PTR PrivateData;
    DWORD Reserved;
  } SP_DRVINSTALL_PARAMS;
  typedef SP_DRVINSTALL_PARAMS *PSP_DRVINSTALL_PARAMS; //Pointer
  typedef DWORD WINAPI_DeviceInfoGetFlags; //Alias
  typedef DWORD WINAPI_OpenDeviceInterfaceFlags; //Alias
  typedef DWORD WINAPI_OpenDeviceInfoFlags; //Alias
  typedef DWORD WINAPI_GetCustomDevicePropertyFlags; //Alias
  typedef DWORD WINAPI_DeviceInfoScope; //Alias
  typedef DWORD WINAPI_DeviceInfoKeyType; //Alias
  typedef DWORD WINAPI_SetupDiBuildClassInfoListFlags; //Alias
  typedef DWORD WINAPI_DiClassPropertyFlags; //Alias
  typedef ULONG WINAPI_CM_Locate_DevNode_Flags; //Alias
  typedef ULONG WINAPI_CsConfigFlags; //Alias
  typedef DWORD WINAPI_DiGetClassDevPropertySheetsType; //Alias
  static const WINAPI_DiGetClassDevPropertySheetsType DIGCDP_FLAG_BASIC = 0x00000001;
  static const WINAPI_DiGetClassDevPropertySheetsType DIGCDP_FLAG_ADVANCED = 0x00000002;
  static const WINAPI_DiGetClassDevPropertySheetsType DIGCDP_FLAG_REMOTE_BASIC = 0x00000003;
  static const WINAPI_DiGetClassDevPropertySheetsType DIGCDP_FLAG_REMOTE_ADVANCED = 0x00000004;
  typedef ULONG WINAPI_LogicalConfigFlags; //Alias
  static const WINAPI_LogicalConfigFlags BASIC_LOG_CONF = 0x00000000;
  static const WINAPI_LogicalConfigFlags FILTERED_LOG_CONF = 0x00000001;
  static const WINAPI_LogicalConfigFlags ALLOC_LOG_CONF = 0x00000002;
  static const WINAPI_LogicalConfigFlags BOOT_LOG_CONF = 0x00000003;
  static const WINAPI_LogicalConfigFlags FORCED_LOG_CONF = 0x00000004;
  static const WINAPI_LogicalConfigFlags OVERRIDE_LOG_CONF = 0x00000005;
  typedef ULONG WINAPI_CmProblemNumber; //Alias
  static const WINAPI_CmProblemNumber CM_PROB_NOT_CONFIGURED = 0x00000001;
  static const WINAPI_CmProblemNumber CM_PROB_DEVLOADER_FAILED = 0x00000002;
  static const WINAPI_CmProblemNumber CM_PROB_OUT_OF_MEMORY = 0x00000003;
  static const WINAPI_CmProblemNumber CM_PROB_ENTRY_IS_WRONG_TYPE = 0x00000004;
  static const WINAPI_CmProblemNumber CM_PROB_LACKED_ARBITRATOR = 0x00000005;
  static const WINAPI_CmProblemNumber CM_PROB_BOOT_CONFIG_CONFLICT = 0x00000006;
  static const WINAPI_CmProblemNumber CM_PROB_FAILED_FILTER = 0x00000007;
  static const WINAPI_CmProblemNumber CM_PROB_DEVLOADER_NOT_FOUND = 0x00000008;
  static const WINAPI_CmProblemNumber CM_PROB_INVALID_DATA = 0x00000009;
  static const WINAPI_CmProblemNumber CM_PROB_FAILED_START = 0x0000000A;
  static const WINAPI_CmProblemNumber CM_PROB_LIAR = 0x0000000B;
  static const WINAPI_CmProblemNumber CM_PROB_NORMAL_CONFLICT = 0x0000000C;
  static const WINAPI_CmProblemNumber CM_PROB_NOT_VERIFIED = 0x0000000D;
  static const WINAPI_CmProblemNumber CM_PROB_NEED_RESTART = 0x0000000E;
  static const WINAPI_CmProblemNumber CM_PROB_REENUMERATION = 0x0000000F;
  static const WINAPI_CmProblemNumber CM_PROB_PARTIAL_LOG_CONF = 0x00000010;
  static const WINAPI_CmProblemNumber CM_PROB_UNKNOWN_RESOURCE = 0x00000011;
  static const WINAPI_CmProblemNumber CM_PROB_REINSTALL = 0x00000012;
  static const WINAPI_CmProblemNumber CM_PROB_REGISTRY = 0x00000013;
  static const WINAPI_CmProblemNumber CM_PROB_VXDLDR = 0x00000014;
  static const WINAPI_CmProblemNumber CM_PROB_WILL_BE_REMOVED = 0x00000015;
  static const WINAPI_CmProblemNumber CM_PROB_DISABLED = 0x00000016;
  static const WINAPI_CmProblemNumber CM_PROB_DEVLOADER_NOT_READY = 0x00000017;
  static const WINAPI_CmProblemNumber CM_PROB_DEVICE_NOT_THERE = 0x00000018;
  static const WINAPI_CmProblemNumber CM_PROB_MOVED = 0x00000019;
  static const WINAPI_CmProblemNumber CM_PROB_TOO_EARLY = 0x0000001A;
  static const WINAPI_CmProblemNumber CM_PROB_NO_VALID_LOG_CONF = 0x0000001B;
  static const WINAPI_CmProblemNumber CM_PROB_FAILED_INSTALL = 0x0000001C;
  static const WINAPI_CmProblemNumber CM_PROB_HARDWARE_DISABLED = 0x0000001D;
  static const WINAPI_CmProblemNumber CM_PROB_CANT_SHARE_IRQ = 0x0000001E;
  static const WINAPI_CmProblemNumber CM_PROB_FAILED_ADD = 0x0000001F;
  static const WINAPI_CmProblemNumber CM_PROB_DISABLED_SERVICE = 0x00000020;
  static const WINAPI_CmProblemNumber CM_PROB_TRANSLATION_FAILED = 0x00000021;
  static const WINAPI_CmProblemNumber CM_PROB_NO_SOFTCONFIG = 0x00000022;
  static const WINAPI_CmProblemNumber CM_PROB_BIOS_TABLE = 0x00000023;
  static const WINAPI_CmProblemNumber CM_PROB_IRQ_TRANSLATION_FAILED = 0x00000024;
  static const WINAPI_CmProblemNumber CM_PROB_FAILED_DRIVER_ENTRY = 0x00000025;
  static const WINAPI_CmProblemNumber CM_PROB_DRIVER_FAILED_PRIOR_UNLOAD = 0x00000026;
  static const WINAPI_CmProblemNumber CM_PROB_DRIVER_FAILED_LOAD = 0x00000027;
  static const WINAPI_CmProblemNumber CM_PROB_DRIVER_SERVICE_KEY_INVALID = 0x00000028;
  static const WINAPI_CmProblemNumber CM_PROB_LEGACY_SERVICE_NO_DEVICES = 0x00000029;
  static const WINAPI_CmProblemNumber CM_PROB_DUPLICATE_DEVICE = 0x0000002A;
  static const WINAPI_CmProblemNumber CM_PROB_FAILED_POST_START = 0x0000002B;
  static const WINAPI_CmProblemNumber CM_PROB_HALTED = 0x0000002C;
  static const WINAPI_CmProblemNumber CM_PROB_PHANTOM = 0x0000002D;
  static const WINAPI_CmProblemNumber CM_PROB_SYSTEM_SHUTDOWN = 0x0000002E;
  static const WINAPI_CmProblemNumber CM_PROB_HELD_FOR_EJECT = 0x0000002F;
  static const WINAPI_CmProblemNumber CM_PROB_DRIVER_BLOCKED = 0x00000030;
  static const WINAPI_CmProblemNumber CM_PROB_REGISTRY_TOO_LARGE = 0x00000031;
  static const WINAPI_CmProblemNumber CM_PROB_SETPROPERTIES_FAILED = 0x00000032;
  typedef DWORD WINAPI_SetupDiCreateDeviceInfoFlags; //Alias
  typedef DWORD WINAPI_SetupDeviceRegistryProperty; //Alias
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_DEVICEDESC = 0x00000000;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_HARDWAREID = 0x00000001;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_COMPATIBLEIDS = 0x00000002;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_UNUSED0 = 0x00000003;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_SERVICE = 0x00000004;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_UNUSED1 = 0x00000005;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_UNUSED2 = 0x00000006;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_CLASS = 0x00000007;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_CLASSGUID = 0x00000008;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_DRIVER = 0x00000009;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_CONFIGFLAGS = 0x0000000A;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_MFG = 0x0000000B;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_FRIENDLYNAME = 0x0000000C;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_LOCATION_INFORMATION = 0x0000000D;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_PHYSICAL_DEVICE_OBJECT_NAME = 0x0000000E;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_CAPABILITIES = 0x0000000F;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_UI_NUMBER = 0x00000010;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_UPPERFILTERS = 0x00000011;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_LOWERFILTERS = 0x00000012;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_BUSTYPEGUID = 0x00000013;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_LEGACYBUSTYPE = 0x00000014;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_BUSNUMBER = 0x00000015;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_ENUMERATOR_NAME = 0x00000016;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_SECURITY = 0x00000017;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_SECURITY_SDS = 0x00000018;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_DEVTYPE = 0x00000019;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_EXCLUSIVE = 0x0000001A;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_CHARACTERISTICS = 0x0000001B;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_ADDRESS = 0x0000001C;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_UI_NUMBER_DESC_FORMAT = 0X0000001D;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_DEVICE_POWER_DATA = 0x0000001E;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_REMOVAL_POLICY = 0x0000001F;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_REMOVAL_POLICY_HW_DEFAULT = 0x00000020;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_REMOVAL_POLICY_OVERRIDE = 0x00000021;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_INSTALL_STATE = 0x00000022;
  static const WINAPI_SetupDeviceRegistryProperty SPDRP_LOCATION_PATHS = 0x00000023;
  typedef DWORD LogSeverity; //Alias
  static const LogSeverity LogSevInformation = 0x00000000;
  static const LogSeverity LogSevWarning = 0x00000001;
  static const LogSeverity LogSevError = 0x00000002;
  static const LogSeverity LogSevFatalError = 0x00000003;
  static const LogSeverity LogSevMaximum = 0x00000004;
  typedef UINT SetupFileLogInfo; //Alias
  static const SetupFileLogInfo SetupFileLogSourceFilename = 0;
  static const SetupFileLogInfo SetupFileLogChecksum = 1;
  static const SetupFileLogInfo SetupFileLogDiskTagfile = 2;
  static const SetupFileLogInfo SetupFileLogDiskDescription = 3;
  static const SetupFileLogInfo SetupFileLogOtherInfo = 4;
  typedef ULONG DEVPROPTYPE; //Alias
  static const DEVPROPTYPE DEVPROP_TYPE_EMPTY = 0x00000000;
  static const DEVPROPTYPE DEVPROP_TYPE_NULL = 0x00000001;
  static const DEVPROPTYPE DEVPROP_TYPE_SBYTE = 0x00000002;
  static const DEVPROPTYPE DEVPROP_TYPE_BYTE = 0x00000003;
  static const DEVPROPTYPE DEVPROP_TYPE_INT16 = 0x00000004;
  static const DEVPROPTYPE DEVPROP_TYPE_UINT16 = 0x00000005;
  static const DEVPROPTYPE DEVPROP_TYPE_INT32 = 0x00000006;
  static const DEVPROPTYPE DEVPROP_TYPE_UINT32 = 0x00000007;
  static const DEVPROPTYPE DEVPROP_TYPE_INT64 = 0x00000008;
  static const DEVPROPTYPE DEVPROP_TYPE_UINT64 = 0x00000009;
  static const DEVPROPTYPE DEVPROP_TYPE_FLOAT = 0x0000000A;
  static const DEVPROPTYPE DEVPROP_TYPE_DOUBLE = 0x0000000B;
  static const DEVPROPTYPE DEVPROP_TYPE_DECIMAL = 0x0000000C;
  static const DEVPROPTYPE DEVPROP_TYPE_GUID = 0x0000000D;
  static const DEVPROPTYPE DEVPROP_TYPE_CURRENCY = 0x0000000E;
  static const DEVPROPTYPE DEVPROP_TYPE_DATE = 0x0000000F;
  static const DEVPROPTYPE DEVPROP_TYPE_FILETIME = 0x00000010;
  static const DEVPROPTYPE DEVPROP_TYPE_BOOLEAN = 0x00000011;
  static const DEVPROPTYPE DEVPROP_TYPE_STRING = 0x00000012;
  static const DEVPROPTYPE DEVPROP_TYPE_STRING_LIST = 0x00002012;
  static const DEVPROPTYPE DEVPROP_TYPE_SECURITY_DESCRIPTOR = 0x00000013;
  static const DEVPROPTYPE DEVPROP_TYPE_SECURITY_DESCRIPTOR_STRING = 0x00000014;
  static const DEVPROPTYPE DEVPROP_TYPE_DEVPROPKEY = 0x00000015;
  static const DEVPROPTYPE DEVPROP_TYPE_DEVPROPTYPE = 0x00000016;
  static const DEVPROPTYPE DEVPROP_TYPE_BINARY = 0x00001003;
  static const DEVPROPTYPE DEVPROP_TYPE_ERROR = 0x00000017;
  static const DEVPROPTYPE DEVPROP_TYPE_NTSTATUS = 0x00000018;
  static const DEVPROPTYPE DEVPROP_TYPE_STRING_INDIRECT = 0x00000019;
  typedef UINT PPNP_VETO_TYPE; //Alias
  static const PPNP_VETO_TYPE PNP_VetoTypeUnknown = 0;
  static const PPNP_VETO_TYPE PNP_VetoLegacyDevice = 1;
  static const PPNP_VETO_TYPE PNP_VetoPendingClose = 2;
  static const PPNP_VETO_TYPE PNP_VetoWindowsApp = 3;
  static const PPNP_VETO_TYPE PNP_VetoWindowsService = 4;
  static const PPNP_VETO_TYPE PNP_VetoOutstandingOpen = 5;
  static const PPNP_VETO_TYPE PNP_VetoDevice = 6;
  static const PPNP_VETO_TYPE PNP_VetoDriver = 7;
  static const PPNP_VETO_TYPE PNP_VetoIllegalDeviceRequest = 8;
  static const PPNP_VETO_TYPE PNP_VetoInsufficientPower = 9;
  static const PPNP_VETO_TYPE PNP_VetoNonDisableable = 10;
  static const PPNP_VETO_TYPE PNP_VetoLegacyDriver = 11;
  static const PPNP_VETO_TYPE PNP_VetoInsufficientRights = 12;
  typedef UINT WINAPI_SPDSL_FLAGS; //Alias
  typedef UINT WINAPI_SPINST_FLAGS; //Alias
  VOID         InstallHinfSection(                         HWND hwnd, HINSTANCE ModuleHandle, PCTSTR CmdLineBuffer, INT nCmdShow);
  BOOL         SetupAddInstallSectionToDiskSpaceList(      HDSKSPC DiskSpace, HINF InfHandle, HINF LayoutInfHandle, PCTSTR SectionName, PVOID Reserved1, UINT Reserved2);
  BOOL         SetupAddSectionToDiskSpaceList(             HDSKSPC DiskSpace, HINF InfHandle, HINF ListInfHandle, PCTSTR SectionName, UINT Operation, PVOID Reserved1, UINT Reserved2);
  BOOL         SetupAddToDiskSpaceList(                    HDSKSPC DiskSpace, PCTSTR TargetFilespec, LONGLONG FileSize, UINT Operation, PVOID Reserved1, UINT Reserved2);
  BOOL         SetupAddToSourceList(                       DWORD Flags, PCTSTR Source);
  BOOL         SetupAdjustDiskSpaceList(                   HDSKSPC DiskSpace, LPCTSTR DriveRoot, LONGLONG Amount, PVOID Reserved1, UINT Reserved2);
  UINT         SetupBackupError(                           HWND hwndParent, PCTSTR DialogTitle, PCTSTR SourceFile, PCTSTR TargetFile, UINT Win32ErrorCode, DWORD Style);
  BOOL         SetupCancelTemporarySourceList(             );
  void         SetupCloseFileQueue(                        HSPFILEQ QueueHandle);
  void         SetupCloseInfFile(                          HINF InfHandle);
  BOOL         SetupCommitFileQueue(                       HWND Owner, HSPFILEQ QueueHandle, PSP_FILE_CALLBACK MsgHandler, PVOID Context);
  BOOL         SetupConfigureWmiFromInfSection(            HINF InfHandle, PCWSTR SectionName, DWORD Flags);
  UINT         SetupCopyError(                             HWND hwndParent, PCTSTR DialogTitle, PCTSTR DiskName, PCTSTR PathToSource, PCTSTR SourceFile, PCTSTR TargetPathFile, UINT Win32ErrorCode, DWORD Style, PTSTR PathBuffer, DWORD PathBufferSize, PDWORD PathRequiredSize);
  BOOL         SetupCopyOEMInf(                            PCTSTR SourceInfFileName, PCTSTR OEMSourceMediaLocation, DWORD OEMSourceMediaType, DWORD CopyStyle, PTSTR DestinationInfFileName, DWORD DestinationInfFileNameSize, PDWORD RequiredSize, PTSTR DestinationInfFileNameComponent);
  HDSKSPC      SetupCreateDiskSpaceList(                   PVOID Reserved1, DWORD Reserved2, WINAPI_SPDSL_FLAGS Flags);
  DWORD        SetupDecompressOrCopyFile(                  PCTSTR SourceFileName, PCTSTR TargetFileName, PUINT CompressionType);
  UINT         SetupDefaultQueueCallback(                  PVOID Context, UINT Notification, UINT Param1, UINT Param2);
  UINT         SetupDeleteError(                           HWND hwndParent, PCTSTR DialogTitle, PCTSTR File, UINT Win32ErrorCode, DWORD Style);
  BOOL         SetupDestroyDiskSpaceList(                  HDSKSPC DiskSpace);
  HDSKSPC      SetupDuplicateDiskSpaceList(                HDSKSPC DiskSpace, PVOID Reserved1, DWORD Reserved2, UINT Flags);
  BOOL         SetupEnumInfSections(                       HINF InfHandle, UINT EnumerationIndex, PTSTR ReturnBuffer, DWORD ReturnBufferSize, PDWORD RequiredSize);
  BOOL         SetupFindFirstLine(                         HINF InfHandle, PCTSTR Section, PCTSTR Key, PINFCONTEXT Context);
  BOOL         SetupFindNextLine(                          PINFCONTEXT ContextIn, PINFCONTEXT ContextOut);
  BOOL         SetupFindNextMatchLine(                     PINFCONTEXT ContextIn, PCTSTR Key, PINFCONTEXT ContextOut);
  BOOL         SetupFreeSourceList(                        PCTSTR** List, UINT Count);
  BOOL         SetupGetBinaryField(                        PINFCONTEXT Context, DWORD FieldIndex, BYTE* ReturnBuffer, DWORD ReturnBufferSize, LPDWORD RequiredSize);
  DWORD        SetupGetFieldCount(                         PINFCONTEXT Context);
  DWORD        SetupGetFileCompressionInfo(                PCTSTR SourceFileName, PTSTR* ActualSourceFileName, PDWORD SourceFileSize, PDWORD TargetFileSize, PUINT CompressionType);
  BOOL         SetupGetFileCompressionInfoEx(              PCTSTR SourceFileName, PTSTR ActualSourceFileNameBuffer, DWORD ActualSourceFileNameLen, PDWORD RequiredBufferLen, PDWORD SourceFileSize, PDWORD TargetFileSize, PUINT CompressionType);
  BOOL         SetupGetFileQueueCount(                     HSPFILEQ FileQueue, UINT SubQueueFileOp, PUINT NumOperations);
  BOOL         SetupGetFileQueueFlags(                     HSPFILEQ FileQueue, PDWORD Flags);
  BOOL         SetupGetInfFileList(                        PCTSTR DirectoryPath, WINAPI_InfStyle InfStyle, PTSTR ReturnBuffer, DWORD ReturnBufferSize, PDWORD RequiredSize);
  BOOL         SetupGetInfInformation(                     LPCVOID InfSpec, DWORD SearchControl, PSP_INF_INFORMATION ReturnBuffer, DWORD ReturnBufferSize, PDWORD RequiredSize);
  BOOL         SetupGetIntField(                           PINFCONTEXT Context, DWORD FieldIndex, PINT IntegerValue);
  BOOL         SetupGetLineByIndex(                        HINF InfHandle, PCTSTR Section, DWORD Index, PINFCONTEXT Context);
  LONG         SetupGetLineCount(                          HINF InfHandle, PCTSTR Section);
  BOOL         SetupGetLineText(                           PINFCONTEXT Context, HINF InfHandle, PCTSTR Section, PCTSTR Key, PTSTR ReturnBuffer, DWORD ReturnBufferSize, PDWORD RequiredSize);
  BOOL         SetupGetMultiSzField(                       PINFCONTEXT Context, DWORD FieldIndex, PTSTR ReturnBuffer, DWORD ReturnBufferSize, LPDWORD RequiredSize);
  BOOL         SetupGetSourceFileLocation(                 HINF InfHandle, PINFCONTEXT InfContext, PCTSTR FileName, PUINT SourceId, PTSTR ReturnBuffer, DWORD ReturnBufferSize, PDWORD RequiredSize);
  BOOL         SetupGetSourceFileSize(                     HINF InfHandle, PINFCONTEXT InfContext, PCTSTR FileName, PCTSTR Section, PDWORD FileSize, UINT RoundingFactor);
  BOOL         SetupGetSourceInfo(                         HINF InfHandle, UINT SourceId, UINT InfoDesired, PTSTR ReturnBuffer, DWORD ReturnBufferSize, LPDWORD RequiredSize);
  BOOL         SetupGetStringField(                        PINFCONTEXT Context, DWORD FieldIndex, PTSTR ReturnBuffer, DWORD ReturnBufferSize, PDWORD RequiredSize);
  BOOL         SetupGetTargetPath(                         HINF InfHandle, PINFCONTEXT InfContext, PCTSTR Section, PTSTR ReturnBuffer, DWORD ReturnBufferSize, PDWORD RequiredSize);
  PVOID        SetupInitDefaultQueueCallback(              HWND OwnerWindow);
  PVOID        SetupInitDefaultQueueCallbackEx(            HWND OwnerWindow, HWND AlternateProgressWindow, UINT ProgressMessage, DWORD Reserved1, PVOID Reserved2);
  HSPFILELOG   SetupInitializeFileLog(                     PCTSTR LogFileName, DWORD Flags);
  BOOL         SetupInstallFile(                           HINF InfHandle, PINFCONTEXT InfContext, PCTSTR SourceFile, PCTSTR SourcePathRoot, PCTSTR DestinationName, DWORD CopyStyle, PSP_FILE_CALLBACK CopyMsgHandler, PVOID Context);
  BOOL         SetupInstallFileEx(                         HINF InfHandle, PINFCONTEXT InfContext, PCTSTR SourceFile, PCTSTR SourcePathRoot, PCTSTR DestinationName, DWORD CopyStyle, PSP_FILE_CALLBACK CopyMsgHandler, PVOID Context, PBOOL FileWasInUse);
  BOOL         SetupInstallFilesFromInfSection(            HINF InfHandle, HINF LayoutInfHandle, HSPFILEQ FileQueue, PCTSTR SectionName, PCTSTR SourceRootPath, UINT CopyFlags);
  BOOL         SetupInstallFromInfSection(                 HWND Owner, HINF InfHandle, PCTSTR SectionName, WINAPI_SPINST_FLAGS Flags, HKEY RelativeKeyRoot, PCTSTR SourceRootPath, UINT CopyFlags, PSP_FILE_CALLBACK MsgHandler, PVOID Context, HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupInstallServicesFromInfSection(         HINF InfHandle, PCTSTR SectionName, DWORD Flags);
  BOOL         SetupInstallServicesFromInfSectionEx(       HINF InfHandle, PCTSTR SectionName, DWORD Flags, HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, PVOID Reserved1, PVOID Reserved2);
  BOOL         SetupIterateCabinet(                        PCTSTR CabinetFile, DWORD Reserved, PSP_FILE_CALLBACK MsgHandler, PVOID Context);
  BOOL         SetupLogFile(                               HSPFILELOG FileLogHandle, PCTSTR LogSectionName, PCTSTR SourceFileName, PCTSTR TargetFileName, DWORD Checksum, PCTSTR DiskTagfile, PCTSTR DiskDescription, PCTSTR OtherInfo, DWORD Flags);
  BOOL         SetupLogError(                              PCTSTR MessageString, LogSeverity Severity);
  BOOL         SetupOpenAppendInfFile(                     PCTSTR FileName, HINF InfHandle, PUINT ErrorLine);
  HSPFILEQ     SetupOpenFileQueue(                         );
  HINF         SetupOpenInfFile(                           PCTSTR FileName, PCTSTR InfClass, WINAPI_InfStyle InfStyle, PUINT ErrorLine);
  HINF         SetupOpenMasterInf(                         );
  UINT         SetupPromptForDisk(                         HWND hwndParent, PCTSTR DialogTitle, PCTSTR DiskName, PCTSTR PathToSource, PCTSTR FileSought, PCTSTR TagFile, DWORD DiskPromptStyle, PTSTR PathBuffer, DWORD PathBufferSize, PDWORD PathRequiredSize);
  INT          SetupPromptReboot(                          HSPFILEQ FileQueue, HWND Owner, BOOL ScanOnly);
  BOOL         SetupQueryDrivesInDiskSpaceList(            HDSKSPC DiskSpace, PSTR ReturnBuffer, DWORD ReturnBufferSize, PDWORD RequiredSize);
  BOOL         SetupQueryFileLog(                          HSPFILELOG FileLogHandle, PCTSTR LogSectionName, PCTSTR TargetFileName, SetupFileLogInfo DesiredInfo, PTSTR DataOut, DWORD ReturnBufferSize, PDWORD RequiredSize);
  BOOL         SetupQueryInfFileInformation(               PSP_INF_INFORMATION InfInformation, UINT InfIndex, PTSTR ReturnBuffer, DWORD ReturnBufferSize, PDWORD RequiredSize);
  BOOL         SetupQueryInfOriginalFileInformation(       PSP_INF_INFORMATION InfInformation, UINT InfIndex, PSP_ALTPLATFORM_INFO AlternatePlatformInfo, PSP_ORIGINAL_FILE_INFO OriginalFileInfo);
  BOOL         SetupQueryInfVersionInformation(            PSP_INF_INFORMATION InfInformation, UINT InfIndex, PCTSTR Key, PTSTR ReturnBuffer, DWORD ReturnBufferSize, PDWORD RequiredSize);
  BOOL         SetupQuerySourceList(                       DWORD Flags, PCTSTR** List, PUINT Count);
  BOOL         SetupQuerySpaceRequiredOnDrive(             HDSKSPC DiskSpace, PCTSTR DriveSpec, LONGLONG* SpaceRequired, PVOID Reserved1, UINT Reserved2);
  BOOL         SetupQueueCopy(                             HSPFILEQ QueueHandle, PCTSTR SourceRootPath, PCTSTR SourcePath, PCTSTR SourceFileName, PCTSTR SourceDescription, PCTSTR SourceTagFile, PCTSTR TargetDirectory, PCTSTR TargetFileName, DWORD CopyStyle);
  BOOL         SetupQueueCopyIndirect(                     PSP_FILE_COPY_PARAMS CopyParams);
  BOOL         SetupQueueCopySection(                      HSPFILEQ QueueHandle, PCTSTR SourceRootPath, HINF InfHandle, HINF ListInfHandle, PCTSTR Section, DWORD CopyStyle);
  BOOL         SetupQueueDefaultCopy(                      HSPFILEQ QueueHandle, HINF InfHandle, PCTSTR SourceRootPath, PCTSTR SourceFileName, PCTSTR TargetFileName, DWORD CopyStyle);
  BOOL         SetupQueueDelete(                           HSPFILEQ QueueHandle, PCTSTR PathPart1, PCTSTR PathPart2);
  BOOL         SetupQueueDeleteSection(                    HSPFILEQ QueueHandle, HINF InfHandle, HINF ListInfHandle, PCTSTR Section);
  BOOL         SetupQueueRename(                           HSPFILEQ QueueHandle, PCTSTR SourcePath, PCTSTR SourceFileName, PCTSTR TargetPath, PCTSTR TargetFileName);
  BOOL         SetupQueueRenameSection(                    HSPFILEQ QueueHandle, HINF InfHandle, HINF ListInfHandle, PCTSTR Section);
  BOOL         SetupRemoveFileLogEntry(                    HSPFILELOG FileLogHandle, PCTSTR LogSectionName, PCTSTR TargetFileName);
  BOOL         SetupRemoveFromDiskSpaceList(               HDSKSPC DiskSpace, PCTSTR TargetFilespec, UINT Operation, PVOID Reserved1, UINT Reserved2);
  BOOL         SetupRemoveFromSourceList(                  DWORD Flags, PCTSTR Source);
  BOOL         SetupRemoveInstallSectionFromDiskSpaceList( HDSKSPC DiskSpace, HINF InfHandle, HINF LayoutInfHandle, PCTSTR SectionName, PVOID Reserved1, UINT Reserved2);
  BOOL         SetupRemoveSectionFromDiskSpaceList(        HDSKSPC DiskSpace, HINF InfHandle, HINF ListInfHandle, PCTSTR SectionName, UINT Operation, PVOID Reserved1, UINT Reserved2);
  UINT         SetupRenameError(                           HWND hwndParent, PCTSTR DialogTitle, PCTSTR SourceFile, PCTSTR TargetFile, UINT Win32ErrorCode, DWORD Style);
  BOOL         SetupScanFileQueue(                         HSPFILEQ FileQueue, DWORD Flags, HWND Window, PSP_FILE_CALLBACK CallbackRoutine, PVOID CallbackContext, PDWORD Result);
  BOOL         SetupSetDirectoryId(                        HINF InfHandle, DWORD Id, PCTSTR Directory);
  BOOL         SetupSetDirectoryIdEx(                      HINF InfHandle, DWORD Id, PCTSTR Directory, DWORD Flags, DWORD Reserved1, PVOID Reserved2);
  BOOL         SetupSetFileQueueAlternatePlatform(         HSPFILEQ QueueHandle, PSP_ALTPLATFORM_INFO AlternatePlatformInfo, PCWSTR AlternateDefaultCatalogFile);
  BOOL         SetupSetFileQueueFlags(                     HSPFILEQ FileQueue, DWORD FlagMask, DWORD Flags);
  BOOL         SetupSetPlatformPathOverride(               PCTSTR Override);
  BOOL         SetupSetSourceList(                         DWORD Flags, PCTSTR* SourceList, UINT SourceCount);
  void         SetupTermDefaultQueueCallback(              PVOID Context);
  BOOL         SetupTerminateFileLog(                      HSPFILELOG FileLogHandle);
  BOOL         SetupUninstallNewlyCopiedInfs(              HSPFILEQ QueueHandle, DWORD Flags, PVOID Reserved);
  BOOL         SetupUninstallOEMInf(                       PCWSTR InfFileName, DWORD Flags, PVOID Reserved);
  BOOL         SetupVerifyInfFile(                         PCWSTR InfName, PSP_ALTPLATFORM_INFO AltPlatformInfo, PSP_INF_SIGNER_INFO InfFileName);
  BOOL         SetupGetInfDriverStoreLocation(             PCTSTR FileName, PSP_ALTPLATFORM_INFO AlternatePlatformInfo, PCTSTR LocaleName, PTSTR ReturnBuffer, DWORD ReturnBufferSize, PDWORD RequiredSize);
  BOOL         SetupGetInfPublishedName(                   PCTSTR DriverStoreLocation, PTSTR ReturnBuffer, DWORD ReturnBufferSize, PDWORD RequiredSize);
  BOOL         SetupGetNonInteractiveMode(                 );
  BOOL         SetupSetNonInteractiveMode(                 BOOL NonInteractiveFlag);
  BOOL         SetupDiAskForOEMDisk(                       HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupDiBuildClassInfoList(                  WINAPI_SetupDiBuildClassInfoListFlags Flags, LPGUID ClassGuidList, DWORD ClassGuidListSize, PDWORD RequiredSize);
  BOOL         SetupDiBuildClassInfoListEx(                WINAPI_SetupDiBuildClassInfoListFlags Flags, LPGUID ClassGuidList, DWORD ClassGuidListSize, PDWORD RequiredSize, PCTSTR MachineName, PVOID Reserved);
  BOOL         SetupDiBuildDriverInfoList(                 HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, WINAPI_DiDriverType DriverType);
  BOOL         SetupDiCallClassInstaller(                  DI_FUNCTION InstallFunction, HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupDiCancelDriverInfoSearch(              HDEVINFO DeviceInfoSet);
  BOOL         SetupDiChangeState(                         HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupDiClassGuidsFromName(                  PCTSTR ClassName, LPGUID ClassGuidList, DWORD ClassGuidListSize, PDWORD RequiredSize);
  BOOL         SetupDiClassGuidsFromNameEx(                PCTSTR ClassName, LPGUID ClassGuidList, DWORD ClassGuidListSize, PDWORD RequiredSize, PCTSTR MachineName, PVOID Reserved);
  BOOL         SetupDiClassNameFromGuid(                   LPGUID ClassGuid, PTSTR ClassName, DWORD ClassNameSize, PDWORD RequiredSize);
  BOOL         SetupDiClassNameFromGuidEx(                 LPGUID ClassGuid, PTSTR ClassName, DWORD ClassNameSize, PDWORD RequiredSize, PCTSTR MachineName, PVOID Reserved);
  BOOL         SetupDiCreateDeviceInfo(                    HDEVINFO DeviceInfoSet, PCTSTR DeviceName, LPGUID ClassGuid, PCTSTR DeviceDescription, HWND hwndParent, WINAPI_SetupDiCreateDeviceInfoFlags CreationFlags, PSP_DEVINFO_DATA DeviceInfoData);
  HDEVINFO     SetupDiCreateDeviceInfoList(                LPGUID ClassGuid, HWND hwndParent);
  HDEVINFO     SetupDiCreateDeviceInfoListEx(              LPGUID ClassGuid, HWND hwndParent, PCTSTR MachineName, PVOID Reserved);
  BOOL         SetupDiCreateDeviceInterface(               HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, LPGUID InterfaceClassGuid, PCTSTR ReferenceString, DWORD CreationFlags, PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData);
  HKEY         SetupDiCreateDeviceInterfaceRegKey(         HDEVINFO DeviceInfoSet, PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData, DWORD Reserved, REGSAM samDesired, HINF InfHandle, PCTSTR InfSectionName);
  HKEY         SetupDiCreateDevRegKey(                     HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, WINAPI_DeviceInfoScope Scope, DWORD HwProfile, WINAPI_DeviceInfoKeyType KeyType, HINF InfHandle, PCTSTR InfSectionName);
  BOOL         SetupDiDeleteDeviceInfo(                    HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupDiDeleteDeviceInterfaceData(           HDEVINFO DeviceInfoSet, PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData);
  BOOL         SetupDiDeleteDeviceInterfaceRegKey(         HDEVINFO DeviceInfoSet, PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData, DWORD Reserved);
  BOOL         SetupDiDeleteDevRegKey(                     HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, WINAPI_DeviceInfoScope Scope, DWORD HwProfile, WINAPI_DeviceInfoKeyType KeyType);
  BOOL         SetupDiDestroyClassImageList(               PSP_CLASSIMAGELIST_DATA ClassImageListData);
  BOOL         SetupDiDestroyDeviceInfoList(               HDEVINFO DeviceInfoSet);
  BOOL         SetupDiDestroyDriverInfoList(               HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, WINAPI_DiDriverType DriverType);
  INT          SetupDiDrawMiniIcon(                        HDC hdc, RECT rc, INT MiniIconIndex, DWORD Flags);
  BOOL         SetupDiEnumDeviceInfo(                      HDEVINFO DeviceInfoSet, DWORD MemberIndex, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupDiEnumDeviceInterfaces(                HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, LPGUID InterfaceClassGuid, DWORD MemberIndex, PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData);
  BOOL         SetupDiEnumDriverInfo(                      HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, WINAPI_DiDriverType DriverType, DWORD MemberIndex, PSP_DRVINFO_DATA DriverInfoData);
  BOOL         SetupDiGetActualModelsSection(              PINFCONTEXT Context, PSP_ALTPLATFORM_INFO AlternatePlatformInfo, PTSTR DecoratedModelsSection, DWORD DecoratedModelsSectionSize, PDWORD RequiredSize, PVOID Reserved);
  BOOL         SetupDiGetActualSectionToInstall(           HINF InfHandle, PCTSTR InfSectionName, PTSTR InfSectionWithExt, DWORD InfSectionWithExtSize, PDWORD RequiredSize, PTSTR* Extension);
  BOOL         SetupDiGetActualSectionToInstallEx(         HINF InfHandle, PCTSTR InfSectionName, PSP_ALTPLATFORM_INFO AlternatePlatformInfo, PTSTR InfSectionWithExt, DWORD InfSectionWithExtSize, PDWORD RequiredSize, PTSTR* Extension, PVOID Reserved);
  BOOL         SetupDiGetClassBitmapIndex(                 LPGUID ClassGuid, PINT MiniIconIndex);
  BOOL         SetupDiGetClassDescription(                 LPGUID ClassGuid, PTSTR ClassDescription, DWORD ClassDescriptionSize, PDWORD RequiredSize);
  BOOL         SetupDiGetClassDescriptionEx(               LPGUID ClassGuid, PTSTR ClassDescription, DWORD ClassDescriptionSize, PDWORD RequiredSize, PCTSTR MachineName, PVOID Reserved);
  BOOL         SetupDiGetClassDevPropertySheets(           HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, LPPROPSHEETHEADER PropertySheetHeader, DWORD PropertySheetHeaderPageListSize, PDWORD RequiredSize, WINAPI_DiGetClassDevPropertySheetsType PropertySheetType);
  HDEVINFO     SetupDiGetClassDevs(                        LPGUID ClassGuid, PCTSTR Enumerator, HWND hwndParent, WINAPI_DeviceInfoGetFlags Flags);
  HDEVINFO     SetupDiGetClassDevsEx(                      LPGUID ClassGuid, PCTSTR Enumerator, HWND hwndParent, WINAPI_DeviceInfoGetFlags Flags, HDEVINFO DeviceInfoSet, PCTSTR MachineName, PVOID Reserved);
  BOOL         SetupDiGetClassImageIndex(                  PSP_CLASSIMAGELIST_DATA ClassImageListData, LPGUID ClassGuid, PINT ImageIndex);
  BOOL         SetupDiGetClassImageList(                   PSP_CLASSIMAGELIST_DATA ClassImageListData);
  BOOL         SetupDiGetClassImageListEx(                 PSP_CLASSIMAGELIST_DATA ClassImageListData, PCTSTR MachineName, PVOID Reserved);
  BOOL         SetupDiGetClassInstallParams(               HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, PSP_CLASSINSTALL_HEADER ClassInstallParams, DWORD ClassInstallParamsSize, PDWORD RequiredSize);
  BOOL         SetupDiGetClassPropertyW(                   GUID* ClassGuid, DEVPROPKEY* PropertyKey, DEVPROPTYPE* PropertyType, PBYTE PropertyBuffer, DWORD PropertyBufferSize, PDWORD RequiredSize, WINAPI_DiClassPropertyFlags Flags);
  BOOL         SetupDiGetClassPropertyExW(                 GUID* ClassGuid, DEVPROPKEY* PropertyKey, DEVPROPTYPE* PropertyType, PBYTE PropertyBuffer, DWORD PropertyBufferSize, PDWORD RequiredSize, WINAPI_DiClassPropertyFlags Flags, PCWSTR MachineName, PVOID Reserved);
  BOOL         SetupDiGetClassPropertyKeys(                GUID* ClassGuid, DEVPROPKEY* PropertyKeyArray, DWORD PropertyKeyCount, PDWORD RequiredPropertyKeyCount, WINAPI_DiClassPropertyFlags Flags);
  BOOL         SetupDiGetClassPropertyKeysExW(             GUID* ClassGuid, DEVPROPKEY* PropertyKeyArray, DWORD PropertyKeyCount, PDWORD RequiredPropertyKeyCount, WINAPI_DiClassPropertyFlags Flags, PCWSTR MachineName, PVOID Reserved);
  BOOL         SetupDiGetClassRegistryProperty(            LPGUID ClassGuid, DWORD Property, WINAPI_RegType* PropertyRegDataType, PBYTE PropertyBuffer, DWORD PropertyBufferSize, PDWORD RequiredSize, PCTSTR MachineName, PVOID Reserved);
  BOOL         SetupDiGetCustomDeviceProperty(             HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, PCTSTR CustomPropertyName, WINAPI_GetCustomDevicePropertyFlags Flags, WINAPI_RegType* PropertyRegDataType, PBYTE PropertyBuffer, DWORD PropertyBufferSize, PDWORD RequiredSize);
  BOOL         SetupDiGetDeviceInfoListClass(              HDEVINFO DeviceInfoSet, LPGUID ClassGuid);
  BOOL         SetupDiGetDeviceInfoListDetail(             HDEVINFO DeviceInfoSet, PSP_DEVINFO_LIST_DETAIL_DATA DeviceInfoSetDetailData);
  BOOL         SetupDiGetDeviceInstallParams(              HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, PSP_DEVINSTALL_PARAMS DeviceInstallParams);
  BOOL         SetupDiGetDeviceInstanceId(                 HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, PTSTR DeviceInstanceId, DWORD DeviceInstanceIdSize, PDWORD RequiredSize);
  BOOL         SetupDiGetDeviceInterfaceAlias(             HDEVINFO DeviceInfoSet, PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData, LPGUID AliasInterfaceClassGuid, PSP_DEVICE_INTERFACE_DATA AliasDeviceInterfaceData);
  BOOL         SetupDiGetDeviceInterfaceDetail(            HDEVINFO DeviceInfoSet, PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData, PSP_DEVICE_INTERFACE_DETAIL_DATA DeviceInterfaceDetailData, DWORD DeviceInterfaceDetailDataSize, PDWORD RequiredSize, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupDiGetDeviceInterfacePropertyW(         HDEVINFO DeviceInfoSet, PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData, DEVPROPKEY* PropertyKey, DEVPROPTYPE* PropertyType, PBYTE PropertyBuffer, DWORD PropertyBufferSize, PDWORD RequiredSize, DWORD Flags);
  BOOL         SetupDiGetDeviceInterfacePropertyKeys(      HDEVINFO DeviceInfoSet, PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData, DEVPROPKEY* PropertyKeyArray, DWORD PropertyKeyCount, PDWORD RequiredPropertyKeyCount, DWORD Flags);
  BOOL         SetupDiGetDevicePropertyW(                  HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, DEVPROPKEY* PropertyKey, DEVPROPTYPE* PropertyType, PBYTE PropertyBuffer, DWORD PropertyBufferSize, PDWORD RequiredSize, DWORD Flags);
  BOOL         SetupDiGetDevicePropertyKeys(               HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, DEVPROPKEY* PropertyKeyArray, DWORD PropertyKeyCount, PDWORD RequiredPropertyKeyCount, DWORD Flags);
  BOOL         SetupDiGetDeviceRegistryProperty(           HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, WINAPI_SetupDeviceRegistryProperty Property, WINAPI_RegType* PropertyRegDataType, PBYTE PropertyBuffer, DWORD PropertyBufferSize, PDWORD RequiredSize);
  BOOL         SetupDiGetDriverInfoDetail(                 HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, PSP_DRVINFO_DATA DriverInfoData, PSP_DRVINFO_DETAIL_DATA DriverInfoDetailData, DWORD DriverInfoDetailDataSize, PDWORD RequiredSize);
  BOOL         SetupDiGetDriverInstallParams(              HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, PSP_DRVINFO_DATA DriverInfoData, PSP_DRVINSTALL_PARAMS DriverInstallParams);
  BOOL         SetupDiGetHwProfileFriendlyName(            DWORD HwProfile, PTSTR FriendlyName, DWORD FriendlyNameSize, PDWORD RequiredSize);
  BOOL         SetupDiGetHwProfileFriendlyNameEx(          DWORD HwProfile, PTSTR FriendlyName, DWORD FriendlyNameSize, PDWORD RequiredSize, PCTSTR MachineName, PVOID Reserved);
  BOOL         SetupDiGetHwProfileList(                    PDWORD HwProfileList, DWORD HwProfileListSize, PDWORD RequiredSize, PDWORD CurrentlyActiveIndex);
  BOOL         SetupDiGetHwProfileListEx(                  PDWORD HwProfileList, DWORD HwProfileListSize, PDWORD RequiredSize, PDWORD CurrentlyActiveIndex, PCTSTR MachineName, PVOID Reserved);
  BOOL         SetupDiGetINFClass(                         PCTSTR InfName, LPGUID ClassGuid, PTSTR ClassName, DWORD ClassNameSize, PDWORD RequiredSize);
  BOOL         SetupDiGetSelectedDevice(                   HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupDiGetSelectedDriver(                   HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, PSP_DRVINFO_DATA DriverInfoData);
  BOOL         SetupDiInstallClass(                        HWND hwndParent, PCTSTR InfFileName, DWORD Flags, HSPFILEQ FileQueue);
  BOOL         SetupDiInstallClassEx(                      HWND hwndParent, PCTSTR InfFileName, DWORD Flags, HSPFILEQ FileQueue, LPGUID InterfaceClassGuid, PVOID Reserved1, PVOID Reserved2);
  BOOL         SetupDiInstallDevice(                       HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupDiInstallDeviceInterfaces(             HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupDiInstallDriverFiles(                  HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupDiLoadClassIcon(                       LPGUID ClassGuid, HICON* LargeIcon, LPINT MiniIconIndex);
  BOOL         SetupDiLoadDeviceIcon(                      HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, UINT cxIcon, UINT cyIcon, DWORD Flags, HICON* hIcon);
  HKEY         SetupDiOpenClassRegKey(                     LPGUID ClassGuid, REGSAM samDesired);
  HKEY         SetupDiOpenClassRegKeyEx(                   LPGUID ClassGuid, REGSAM samDesired, DWORD Flags, PCTSTR MachineName, PVOID Reserved);
  BOOL         SetupDiOpenDeviceInfo(                      HDEVINFO DeviceInfoSet, PCTSTR DeviceInstanceId, HWND hwndParent, WINAPI_OpenDeviceInfoFlags OpenFlags, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupDiOpenDeviceInterface(                 HDEVINFO DeviceInfoSet, PCTSTR DevicePath, WINAPI_OpenDeviceInterfaceFlags OpenFlags, PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData);
  HKEY         SetupDiOpenDeviceInterfaceRegKey(           HDEVINFO DeviceInfoSet, PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData, DWORD Reserved, REGSAM samDesired);
  HKEY         SetupDiOpenDevRegKey(                       HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, WINAPI_DeviceInfoScope Scope, DWORD HwProfile, WINAPI_DeviceInfoKeyType KeyType, REGSAM samDesired);
  BOOL         SetupDiRegisterCoDeviceInstallers(          HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupDiRegisterDeviceInfo(                  HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, DWORD Flags, PSP_DETSIG_CMPPROC CompareProc, PVOID CompareContext, PSP_DEVINFO_DATA DupDeviceInfoData);
  BOOL         SetupDiRemoveDevice(                        HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupDiRemoveDeviceInterface(               HDEVINFO DeviceInfoSet, PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData);
  BOOL         SetupDiRestartDevices(                      HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupDiSelectBestCompatDrv(                 HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupDiSelectDevice(                        HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupDiSelectOEMDrv(                        HWND hwndParent, HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupDiSetClassInstallParams(               HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, PSP_CLASSINSTALL_HEADER ClassInstallParams, DWORD ClassInstallParamsSize);
  BOOL         SetupDiSetClassPropertyW(                   GUID* ClassGuid, DEVPROPKEY* PropertyKey, DEVPROPTYPE PropertyType, PBYTE PropertyBuffer, DWORD PropertyBufferSize, WINAPI_DiClassPropertyFlags Flags);
  BOOL         SetupDiSetClassPropertyExW(                 GUID* ClassGuid, DEVPROPKEY* PropertyKey, DEVPROPTYPE PropertyType, BYTE PropertyBuffer, DWORD PropertyBufferSize, DWORD Flags, PVOID Reserved);
  BOOL         SetupDiSetClassRegistryProperty(            LPGUID ClassGuid, DWORD Property, BYTE* PropertyBuffer, DWORD PropertyBufferSize, PCTSTR MachineName, PVOID Reserved);
  BOOL         SetupDiSetDeviceInstallParams(              HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, PSP_DEVINSTALL_PARAMS DeviceInstallParams);
  BOOL         SetupDiSetDeviceInterfaceDefault(           HDEVINFO DeviceInfoSet, PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData, DWORD Flags, PVOID Reserved);
  BOOL         SetupDiSetDeviceInterfacePropertyW(         HDEVINFO DeviceInfoSet, PSP_DEVICE_INTERFACE_DATA DeviceInterfaceData, DEVPROPKEY* PropertyKey, DEVPROPTYPE PropertyType, PBYTE PropertyBuffer, DWORD PropertyBufferSize, DWORD Flags);
  BOOL         SetupDiSetDevicePropertyW(                  HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, DEVPROPKEY* PropertyKey, DEVPROPTYPE PropertyType, PBYTE PropertyBuffer, DWORD PropertyBufferSize, DWORD Flags);
  BOOL         SetupDiSetDeviceRegistryProperty(           HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, WINAPI_SetupDeviceRegistryProperty Property, BYTE* PropertyBuffer, DWORD PropertyBufferSize);
  BOOL         SetupDiSetDriverInstallParams(              HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, PSP_DRVINFO_DATA DriverInfoData, PSP_DRVINSTALL_PARAMS DriverInstallParams);
  BOOL         SetupDiSetSelectedDevice(                   HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData);
  BOOL         SetupDiSetSelectedDriver(                   HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData, PSP_DRVINFO_DATA DriverInfoData);
  BOOL         SetupDiUnremoveDevice(                      HDEVINFO DeviceInfoSet, PSP_DEVINFO_DATA DeviceInfoData);
  SP_LOG_TOKEN SetupGetThreadLogToken(                     );
  VOID         SetupSetThreadLogToken(                     SP_LOG_TOKEN LogToken);
  VOID         SetupWriteTextLog(                          SP_LOG_TOKEN LogToken, DWORD Category, DWORD Flags, PCTSTR MessageStr);
  VOID         SetupWriteTextLogError(                     SP_LOG_TOKEN LogToken, DWORD Category, DWORD LogFlags, DWORD Error, PCSTR MessageStr);
  VOID         SetupWriteTextLogInfLine(                   SP_LOG_TOKEN LogToken, DWORD Flags, HINF InfHandle, PINFCONTEXT Context);
  CONFIGRET    CM_Add_Empty_Log_Conf(                      PLOG_CONF plcLogConf, DEVINST dnDevInst, PRIORITY Priority, ULONG ulFlags);
  CONFIGRET    CM_Add_Empty_Log_Conf_Ex(                   PLOG_CONF plcLogConf, DEVINST dnDevInst, PRIORITY Priority, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Add_ID(                                  DEVINST dnDevInst, PTSTR pszID, ULONG ulFlags);
  CONFIGRET    CM_Add_ID_Ex(                               DEVINST dnDevInst, PTSTR pszID, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Add_Res_Des(                             PRES_DES prdResDes, LOG_CONF lcLogConf, RESOURCEID ResourceID, PCVOID ResourceData, ULONG ResourceLen, ULONG ulFlags);
  CONFIGRET    CM_Add_Res_Des_Ex(                          PRES_DES prdResDes, LOG_CONF lcLogConf, RESOURCEID ResourceID, PCVOID ResourceData, ULONG ResourceLen, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Connect_Machine(                         PCTSTR UNCServerName, PHMACHINE phMachine);
  CONFIGRET    CM_Disconnect_Machine(                      HMACHINE hMachine);
  CONFIGRET    CM_Enumerate_Classes(                       ULONG ulClassIndex, LPGUID ClassGuid, ULONG ulFlags);
  CONFIGRET    CM_Enumerate_Classes_Ex(                    ULONG ulClassIndex, LPGUID ClassGuid, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Enumerate_Enumerators(                   ULONG ulEnumIndex, PTCHAR Buffer, PULONG pulLength, ULONG ulFlags);
  CONFIGRET    CM_Enumerate_Enumerators_Ex(                ULONG ulEnumIndex, PTCHAR Buffer, PULONG pulLength, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Free_Log_Conf(                           LOG_CONF lcLogConfToBeFreed, ULONG ulFlags);
  CONFIGRET    CM_Free_Log_Conf_Ex(                        LOG_CONF lcLogConfToBeFreed, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Free_Log_Conf_Handle(                    LOG_CONF lcLogConf);
  CONFIGRET    CM_Free_Res_Des(                            PRES_DES prdResDes, RES_DES rdResDes, ULONG ulFlags);
  CONFIGRET    CM_Free_Res_Des_Ex(                         PRES_DES prdResDes, RES_DES rdResDes, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Free_Res_Des_Handle(                     RES_DES rdResDes);
  CONFIGRET    CM_Free_Resource_Conflict_Handle(           CONFLICT_LIST clConflictList);
  CONFIGRET    CM_Get_Child(                               PDEVINST pdnDevInst, DEVINST dnDevInst, ULONG ulFlags);
  CONFIGRET    CM_Get_Child_Ex(                            PDEVINST pdnDevInst, DEVINST dnDevInst, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Get_Class_Registry_Property(             LPGUID ClassGuid, ULONG ulProperty, PULONG pulRegDataType, PVOID Buffer, PULONG pulLength, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Get_Depth(                               PULONG pulDepth, DEVINST dnDevInst, ULONG ulFlags);
  CONFIGRET    CM_Get_Depth_Ex(                            PULONG pulDepth, DEVINST dnDevInst, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Get_Device_ID(                           DEVINST dnDevInst, PTCHAR Buffer, ULONG BufferLen, ULONG ulFlags);
  CONFIGRET    CM_Get_Device_ID_Ex(                        DEVINST dnDevInst, PTCHAR Buffer, ULONG BufferLen, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Get_Device_ID_List(                      PCTSTR pszFilter, PTCHAR Buffer, ULONG BufferLen, ULONG ulFlags);
  CONFIGRET    CM_Get_Device_ID_List_Ex(                   PCTSTR pszFilter, PTCHAR Buffer, ULONG BufferLen, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Get_Device_ID_List_Size(                 PULONG pulLen, PCTSTR pszFilter, ULONG ulFlags);
  CONFIGRET    CM_Get_Device_ID_List_Size_Ex(              PULONG pulLen, PCTSTR pszFilter, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Get_Device_ID_Size(                      PULONG pulLen, DEVINST dnDevInst, ULONG ulFlags);
  CONFIGRET    CM_Get_Device_ID_Size_Ex(                   PULONG pulLen, DEVINST dnDevInst, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Get_Device_Interface_List(               LPGUID InterfaceClassGuid, DEVINSTID pDeviceID, PTCHAR Buffer, ULONG BufferLen, ULONG ulFlags);
  CONFIGRET    CM_Get_Device_Interface_List_Size(          PULONG pulLen, LPGUID InterfaceClassGuid, DEVINSTID pDeviceID, ULONG ulFlags);
  CONFIGRET    CM_Get_DevNode_Status(                      PULONG pulStatus, WINAPI_CmProblemNumber* pulProblemNumber, DEVINST dnDevInst, ULONG ulFlags);
  CONFIGRET    CM_Get_DevNode_Status_Ex(                   PULONG pulStatus, WINAPI_CmProblemNumber* pulProblemNumber, DEVINST dnDevInst, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Get_First_Log_Conf(                      PLOG_CONF plcLogConf, DEVINST dnDevInst, WINAPI_LogicalConfigFlags ulFlags);
  CONFIGRET    CM_Get_First_Log_Conf_Ex(                   PLOG_CONF plcLogConf, DEVINST dnDevInst, WINAPI_LogicalConfigFlags ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Get_HW_Prof_Flags(                       DEVINSTID pDeviceID, WINAPI_CsConfigFlags* pulValue, ULONG ulFlags);
  CONFIGRET    CM_Get_HW_Prof_Flags_Ex(                    DEVINSTID pDeviceID, ULONG ulHardwareProfile, WINAPI_CsConfigFlags* pulValue, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Get_Log_Conf_Priority(                   LOG_CONF lcLogConf, PPRIORITY pPriority, ULONG ulFlags);
  CONFIGRET    CM_Get_Log_Conf_Priority_Ex(                LOG_CONF lcLogConf, PPRIORITY pPriority, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Get_Next_Log_Conf(                       PLOG_CONF plcLogConf, LOG_CONF lcLogConf, ULONG ulFlags);
  CONFIGRET    CM_Get_Next_Log_Conf_Ex(                    PLOG_CONF plcLogConf, LOG_CONF lcLogConf, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Get_Next_Res_Des(                        PRES_DES prdResDes, RES_DES rdResDes, RESOURCEID ForResource, PRESOURCEID pResourceID, ULONG ulFlags);
  CONFIGRET    CM_Get_Next_Res_Des_Ex(                     PRES_DES prdResDes, RES_DES rdResDes, RESOURCEID ForResource, PRESOURCEID pResourceID, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Get_Parent(                              PDEVINST pdnDevInst, DEVINST dnDevInst, ULONG ulFlags);
  CONFIGRET    CM_Get_Parent_Ex(                           PDEVINST pdnDevInst, DEVINST dnDevInst, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Get_Res_Des_Data(                        RES_DES rdResDes, PVOID Buffer, ULONG BufferLen, ULONG ulFlags);
  CONFIGRET    CM_Get_Res_Des_Data_Ex(                     RES_DES rdResDes, PVOID Buffer, ULONG BufferLen, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Get_Res_Des_Data_Size(                   PULONG pulSize, RES_DES rdResDes, ULONG ulFlags);
  CONFIGRET    CM_Get_Res_Des_Data_Size_Ex(                PULONG pulSize, RES_DES rdResDes, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Get_Resource_Conflict_Count(             CONFLICT_LIST clConflictList, PULONG pulCount);
  CONFIGRET    CM_Get_Resource_Conflict_Details(           CONFLICT_LIST clConflictList, ULONG ulIndex, PCONFLICT_DETAILS pConflictDetails);
  CONFIGRET    CM_Get_Sibling(                             PDEVINST pdnDevInst, DEVINST DevInst, ULONG ulFlags);
  CONFIGRET    CM_Get_Sibling_Ex(                          PDEVINST pdnDevInst, DEVINST DevInst, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Get_Version(                             );
  CONFIGRET    CM_Get_Version_Ex(                          HMACHINE hMachine);
  CONFIGRET    CM_Is_Dock_Station_Present(                 PBOOL pbPresent);
  CONFIGRET    CM_Is_Dock_Station_Present_Ex(              PBOOL pbPresent, HMACHINE hMachine);
  CONFIGRET    CM_Is_Version_Available(                    WORD wVersion);
  CONFIGRET    CM_Is_Version_Available_Ex(                 WORD wVersion, HMACHINE hMachine);
  CONFIGRET    CM_Locate_DevNode(                          PDEVINST pdnDevInst, DEVINSTID pDeviceID, WINAPI_CM_Locate_DevNode_Flags ulFlags);
  CONFIGRET    CM_Locate_DevNode_Ex(                       PDEVINST pdnDevInst, DEVINSTID pDeviceID, WINAPI_CM_Locate_DevNode_Flags ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Modify_Res_Des(                          PRES_DES prdResDes, RES_DES rdResDes, RESOURCEID ResourceID, PCVOID ResourceData, ULONG ResourceLen, ULONG ulFlags);
  CONFIGRET    CM_Modify_Res_Des_Ex(                       PRES_DES prdResDes, RES_DES rdResDes, RESOURCEID ResourceID, PCVOID ResourceData, ULONG ResourceLen, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Query_And_Remove_SubTree(                DEVINST dnAncestor, PPNP_VETO_TYPE pVetoType, LPTSTR pszVetoName, ULONG ulNameLength, ULONG ulFlags);
  CONFIGRET    CM_Query_And_Remove_SubTree_Ex(             DEVINST dnAncestor, PPNP_VETO_TYPE pVetoType, LPTSTR pszVetoName, ULONG ulNameLength, ULONG ulFlags);
  CONFIGRET    CM_Query_Resource_Conflict_List(            PCONFLICT_LIST pclConflictList, DEVINST dnDevInst, RESOURCEID ResourceID, PCVOID ResourceData, ULONG ResourceLen, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Reenumerate_DevNode(                     DEVINST dnDevInst, ULONG ulFlags);
  CONFIGRET    CM_Reenumerate_DevNode_Ex(                  DEVINST dnDevInst, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Request_Device_Eject(                    DEVINST dnDevInst, PPNP_VETO_TYPE pVetoType, LPTSTR pszVetoName, ULONG ulNameLength, ULONG ulFlags);
  CONFIGRET    CM_Request_Device_Eject_Ex(                 DEVINST dnDevInst, PPNP_VETO_TYPE pVetoType, LPTSTR pszVetoName, ULONG ulNameLength, ULONG ulFlags);
  CONFIGRET    CM_Request_Eject_PC(                        );
  CONFIGRET    CM_Request_Eject_PC_Ex(                     HMACHINE hMachine);
  CONFIGRET    CM_Set_Class_Registry_Property(             LPGUID ClassGuid, ULONG ulProperty, PCVOID Buffer, ULONG ulLength, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Set_DevNode_Problem(                     DEVINST dnDevInst, WINAPI_CmProblemNumber ulProblem, ULONG ulFlags);
  CONFIGRET    CM_Set_DevNode_Problem_Ex(                  DEVINST dnDevInst, WINAPI_CmProblemNumber ulProblem, ULONG ulFlags, HMACHINE hMachine);
  CONFIGRET    CM_Setup_DevNode(                           DEVINST dnDevInst, ULONG ulFlags);
  DWORD        CMP_WaitNoPendingInstallEvents(             DWORD dwTimeout);
]]
ffi.load( 'Setupapi.dll' )

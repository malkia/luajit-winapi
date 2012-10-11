require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/native' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IDebugAdvanced; //Interface
  typedef void* IDebugAdvanced2; //Interface
  typedef void* IDebugAdvanced3; //Interface
  typedef void* IDebugBreakpoint; //Interface
  typedef void* IDebugBreakpoint2; //Interface
  typedef void* IDebugClient; //Interface
  typedef void* IDebugClient2; //Interface
  typedef void* IDebugClient3; //Interface
  typedef void* IDebugClient4; //Interface
  typedef void* IDebugClient5; //Interface
  typedef void* IDebugControl; //Interface
  typedef void* IDebugControl2; //Interface
  typedef void* IDebugControl3; //Interface
  typedef void* IDebugControl4; //Interface
  typedef void* IDebugDataSpaces; //Interface
  typedef void* IDebugDataSpaces2; //Interface
  typedef void* IDebugDataSpaces3; //Interface
  typedef void* IDebugDataSpaces4; //Interface
  typedef void* IDebugEventCallbacks; //Interface
  typedef void* IDebugEventCallbacksWide; //Interface
  typedef void* IDebugInputCallbacks; //Interface
  typedef void* IDebugOutputCallbacks; //Interface
  typedef void* IDebugOutputCallbacks2; //Interface
  typedef void* IDebugOutputCallbacksWide; //Interface
  typedef void* IDebugRegisters; //Interface
  typedef void* IDebugRegisters2; //Interface
  typedef void* IDebugSymbolGroup; //Interface
  typedef void* IDebugSymbolGroup2; //Interface
  typedef void* IDebugSymbols; //Interface
  typedef void* IDebugSymbols2; //Interface
  typedef void* IDebugSymbols3; //Interface
  typedef void* IDebugSystemObjects; //Interface
  typedef void* IDebugSystemObjects2; //Interface
  typedef void* IDebugSystemObjects3; //Interface
  typedef void* IDebugSystemObjects4; //Interface
  typedef IDebugClient* PDEBUG_CLIENT; //Alias
  typedef IDebugInputCallbacks* PDEBUG_INPUT_CALLBACKS; //Alias
  typedef IDebugEventCallbacks* PDEBUG_EVENT_CALLBACKS; //Alias
  typedef IDebugEventCallbacksWide* PDEBUG_EVENT_CALLBACKS_WIDE; //Alias
  typedef IDebugBreakpoint* PDEBUG_BREAKPOINT; //Alias
  typedef IDebugBreakpoint2* PDEBUG_BREAKPOINT2; //Alias
  typedef IDebugOutputCallbacks* PDEBUG_OUTPUT_CALLBACKS; //Alias
  typedef IDebugOutputCallbacksWide* PDEBUG_OUTPUT_CALLBACKS_WIDE; //Alias
  typedef IDebugSymbolGroup* PDEBUG_SYMBOL_GROUP; //Alias
  typedef IDebugSymbolGroup2* PDEBUG_SYMBOL_GROUP2; //Alias
  typedef LPVOID PWINDBG_EXTENSION_APIS32; //Alias
  typedef LPVOID PWINDBG_EXTENSION_APIS64; //Alias
  typedef ULONG WINAPI_DEBUG_VALUE_TYPE; //Alias
  static const WINAPI_DEBUG_VALUE_TYPE DEBUG_VALUE_INVALID = 0;
  static const WINAPI_DEBUG_VALUE_TYPE DEBUG_VALUE_INT8 = 1;
  static const WINAPI_DEBUG_VALUE_TYPE DEBUG_VALUE_INT16 = 2;
  static const WINAPI_DEBUG_VALUE_TYPE DEBUG_VALUE_INT32 = 3;
  static const WINAPI_DEBUG_VALUE_TYPE DEBUG_VALUE_INT64 = 4;
  static const WINAPI_DEBUG_VALUE_TYPE DEBUG_VALUE_FLOAT32 = 5;
  static const WINAPI_DEBUG_VALUE_TYPE DEBUG_VALUE_FLOAT64 = 6;
  static const WINAPI_DEBUG_VALUE_TYPE DEBUG_VALUE_FLOAT80 = 7;
  static const WINAPI_DEBUG_VALUE_TYPE DEBUG_VALUE_FLOAT82 = 8;
  static const WINAPI_DEBUG_VALUE_TYPE DEBUG_VALUE_FLOAT128 = 9;
  static const WINAPI_DEBUG_VALUE_TYPE DEBUG_VALUE_VECTOR64 = 10;
  static const WINAPI_DEBUG_VALUE_TYPE DEBUG_VALUE_VECTOR128 = 11;
  typedef struct WINAPI_DEBUG_VALUE_u_s1 {
    ULONG64 I64;
    BOOL Nat;
  } WINAPI_DEBUG_VALUE_u_s1;
  typedef struct WINAPI_DEBUG_VALUE_u_s2 {
    ULONG LowPart;
    ULONG HighPart;
  } WINAPI_DEBUG_VALUE_u_s2;
  typedef struct WINAPI_DEBUG_VALUE_u_s3 {
    ULONG64 LowPart;
    LONG64 HighPart;
  } WINAPI_DEBUG_VALUE_u_s3;
  typedef union WINAPI_DEBUG_VALUE_u {
    UCHAR I8;
    USHORT I16;
    ULONG I32;
    WINAPI_DEBUG_VALUE_u_s1 ;
    float F32;
    double F64;
    UCHAR F80Bytes[10];
    UCHAR F82Bytes[11];
    UCHAR F128Bytes[16];
    UCHAR VI8[16];
    USHORT VI16[8];
    ULONG VI32[4];
    ULONG64 VI64[2];
    float VF32[4];
    double VF64[2];
    WINAPI_DEBUG_VALUE_u_s2 I64Parts32;
    WINAPI_DEBUG_VALUE_u_s3 F128Parts64;
    UCHAR RawBytes[24];
  } WINAPI_DEBUG_VALUE_u;
  typedef struct DEBUG_VALUE {
    WINAPI_DEBUG_VALUE_u ;
    ULONG TailOfRawBytes;
    WINAPI_DEBUG_VALUE_TYPE Type;
  } DEBUG_VALUE;
  typedef DEBUG_VALUE *PDEBUG_VALUE; //Pointer
  typedef ULONG WINAPI_DEBUG_ANY; //Alias
  static const WINAPI_DEBUG_ANY DEBUG_ANY_ID = 0xffffffff;
  typedef ULONG64 WINAPI_DEBUG_OFFSET; //Alias
  static const WINAPI_DEBUG_OFFSET DEBUG_INVALID_OFFSET = -1;
  typedef ULONG WINAPI_DEBUG_MODULE_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_SYMTYPE; //Alias
  static const WINAPI_DEBUG_SYMTYPE DEBUG_SYMTYPE_NONE = 0;
  static const WINAPI_DEBUG_SYMTYPE DEBUG_SYMTYPE_COFF = 1;
  static const WINAPI_DEBUG_SYMTYPE DEBUG_SYMTYPE_CODEVIEW = 2;
  static const WINAPI_DEBUG_SYMTYPE DEBUG_SYMTYPE_PDB = 3;
  static const WINAPI_DEBUG_SYMTYPE DEBUG_SYMTYPE_EXPORT = 4;
  static const WINAPI_DEBUG_SYMTYPE DEBUG_SYMTYPE_DEFERRED = 5;
  static const WINAPI_DEBUG_SYMTYPE DEBUG_SYMTYPE_SYM = 6;
  static const WINAPI_DEBUG_SYMTYPE DEBUG_SYMTYPE_DIA = 7;
  typedef ULONG WINAPI_DEBUG_BREAKPOINT_TYPE; //Alias
  static const WINAPI_DEBUG_BREAKPOINT_TYPE DEBUG_BREAKPOINT_CODE = 0;
  static const WINAPI_DEBUG_BREAKPOINT_TYPE DEBUG_BREAKPOINT_DATA = 1;
  static const WINAPI_DEBUG_BREAKPOINT_TYPE DEBUG_BREAKPOINT_TIME = 2;
  typedef WINAPI_DEBUG_BREAKPOINT_TYPE *WINAPI_PDEBUG_BREAKPOINT_TYPE; //Pointer
  typedef ULONG WINAPI_DEBUG_BREAKPOINT_FLAGS; //Alias
  typedef WINAPI_DEBUG_BREAKPOINT_FLAGS *WINAPI_PDEBUG_BREAKPOINT_FLAGS; //Pointer
  typedef ULONG WINAPI_DEBUG_ACCESS_TYPE; //Alias
  typedef WINAPI_DEBUG_ACCESS_TYPE *WINAPI_PDEBUG_ACCESS_TYPE; //Pointer
  typedef ULONG WINAPI_DEBUG_FILTER_BREAK_STATUS; //Alias
  static const WINAPI_DEBUG_FILTER_BREAK_STATUS DEBUG_FILTER_BREAK = 0x00000000;
  static const WINAPI_DEBUG_FILTER_BREAK_STATUS DEBUG_FILTER_SECOND_CHANCE_BREAK = 0x00000001;
  static const WINAPI_DEBUG_FILTER_BREAK_STATUS DEBUG_FILTER_OUTPUT = 0x00000002;
  static const WINAPI_DEBUG_FILTER_BREAK_STATUS DEBUG_FILTER_IGNORE = 0x00000003;
  static const WINAPI_DEBUG_FILTER_BREAK_STATUS DEBUG_FILTER_REMOVE = 0x00000004;
  typedef ULONG WINAPI_DEBUG_FILTER_HANDLING_STATUS; //Alias
  static const WINAPI_DEBUG_FILTER_HANDLING_STATUS DEBUG_FILTER_GO_HANDLED = 0x00000000;
  static const WINAPI_DEBUG_FILTER_HANDLING_STATUS DEBUG_FILTER_GO_NOT_HANDLED = 0x00000001;
  typedef struct EXCEPTION_RECORD64 {
    WINAPI_ExceptionCode ExceptionCode;
    DWORD ExceptionFlags;
    DWORD64 ExceptionRecord;
    DWORD64 ExceptionAddress;
    DWORD NumberParameters;
    DWORD __unusedAlignment;
    DWORD64 ExceptionInformation[EXCEPTION_MAXIMUM_PARAMETERS];
  } EXCEPTION_RECORD64;
  typedef EXCEPTION_RECORD64 *PEXCEPTION_RECORD64; //Pointer
  typedef struct DEBUG_EXCEPTION_FILTER_PARAMETERS {
    WINAPI_DEBUG_FILTER_BREAK_STATUS ExecutionOption;
    WINAPI_DEBUG_FILTER_HANDLING_STATUS ContinueOption;
    ULONG TextSize;
    ULONG CommandSize;
    ULONG SecondCommandSize;
    ULONG ExceptionCode;
  } DEBUG_EXCEPTION_FILTER_PARAMETERS;
  typedef DEBUG_EXCEPTION_FILTER_PARAMETERS *PDEBUG_EXCEPTION_FILTER_PARAMETERS; //Pointer
  typedef struct DEBUG_SPECIFIC_FILTER_PARAMETERS {
    WINAPI_DEBUG_FILTER_BREAK_STATUS ExecutionOption;
    WINAPI_DEBUG_FILTER_HANDLING_STATUS ContinueOption;
    ULONG TextSize;
    ULONG CommandSize;
    ULONG ArgumentSize;
  } DEBUG_SPECIFIC_FILTER_PARAMETERS;
  typedef DEBUG_SPECIFIC_FILTER_PARAMETERS *PDEBUG_SPECIFIC_FILTER_PARAMETERS; //Pointer
  typedef struct DEBUG_BREAKPOINT_PARAMETERS {
    WINAPI_DEBUG_OFFSET Offset;
    ULONG Id;
    WINAPI_DEBUG_BREAKPOINT_TYPE BreakType;
    ULONG ProcType;
    WINAPI_DEBUG_BREAKPOINT_FLAGS Flags;
    ULONG DataSize;
    WINAPI_DEBUG_ACCESS_TYPE DataAccessType;
    ULONG PassCount;
    ULONG CurrentPassCount;
    WINAPI_DEBUG_ANY MatchThread;
    ULONG CommandSize;
    ULONG OffsetExpressionSize;
  } DEBUG_BREAKPOINT_PARAMETERS;
  typedef DEBUG_BREAKPOINT_PARAMETERS *PDEBUG_BREAKPOINT_PARAMETERS; //Pointer
  typedef struct DEBUG_STACK_FRAME {
    ULONG64 InstructionOffset;
    ULONG64 ReturnOffset;
    ULONG64 FrameOffset;
    ULONG64 StackOffset;
    ULONG64 FuncTableEntry;
    ULONG64 Params[4];
    ULONG64 Reserved[6];
    BOOL Virtual;
    ULONG FrameNumber;
  } DEBUG_STACK_FRAME;
  typedef DEBUG_STACK_FRAME *PDEBUG_STACK_FRAME; //Pointer
  typedef ULONG WINAPI_DEBUG_REGISTER_FLAGS; //Alias
  typedef struct DEBUG_REGISTER_DESCRIPTION {
    WINAPI_DEBUG_VALUE_TYPE Type;
    WINAPI_DEBUG_REGISTER_FLAGS Flags;
    ULONG SubregMaster;
    ULONG SubregLength;
    ULONG64 SubregMask;
    ULONG SubregShift;
    ULONG Reserved0;
  } DEBUG_REGISTER_DESCRIPTION;
  typedef DEBUG_REGISTER_DESCRIPTION *PDEBUG_REGISTER_DESCRIPTION; //Pointer
  typedef ULONG WINAPI_DEBUG_SYMBOL_FLAGS; //Alias
  typedef struct DEBUG_SYMBOL_PARAMETERS {
    ULONG64 Module;
    ULONG TypeId;
    WINAPI_DEBUG_ANY ParentSymbol;
    ULONG SubElements;
    WINAPI_DEBUG_SYMBOL_FLAGS Flags;
    ULONG64 Reserved;
  } DEBUG_SYMBOL_PARAMETERS;
  typedef DEBUG_SYMBOL_PARAMETERS *PDEBUG_SYMBOL_PARAMETERS; //Pointer
  typedef struct DEBUG_SYMBOL_ENTRY {
    ULONG64 ModuleBase;
    ULONG64 Offset;
    WINAPI_DEBUG_OFFSET Id;
    ULONG64 Arg64;
    ULONG Size;
    ULONG Flags;
    ULONG TypeId;
    ULONG NameSize;
    ULONG Token;
    WINAPI_SymTagEnum_ULONG Tag;
    ULONG Arg32;
    ULONG Reserved;
  } DEBUG_SYMBOL_ENTRY;
  typedef DEBUG_SYMBOL_ENTRY *PDEBUG_SYMBOL_ENTRY; //Pointer
  typedef struct DEBUG_MODULE_PARAMETERS {
    WINAPI_DEBUG_OFFSET Base;
    ULONG Size;
    ULONG TimeDateStamp;
    ULONG Checksum;
    WINAPI_DEBUG_MODULE_FLAGS Flags;
    WINAPI_DEBUG_SYMTYPE SymbolType;
    ULONG ImageNameSize;
    ULONG ModuleNameSize;
    ULONG LoadedImageNameSize;
    ULONG SymbolFileNameSize;
    ULONG MappedImageNameSize;
    ULONG64 Reserved[2];
  } DEBUG_MODULE_PARAMETERS;
  typedef DEBUG_MODULE_PARAMETERS *PDEBUG_MODULE_PARAMETERS; //Pointer
  typedef struct DEBUG_MODULE_AND_ID {
    ULONG64 ModuleBase;
    ULONG64 Id;
  } DEBUG_MODULE_AND_ID;
  typedef DEBUG_MODULE_AND_ID *PDEBUG_MODULE_AND_ID; //Pointer
  typedef struct DEBUG_SYMBOL_SOURCE_ENTRY {
    ULONG64 ModuleBase;
    ULONG64 Offset;
    ULONG64 FileNameId;
    ULONG64 EngineInternal;
    ULONG Size;
    ULONG Flags;
    ULONG FileNameSize;
    WINAPI_DEBUG_ANY StartLine;
    WINAPI_DEBUG_ANY EndLine;
    WINAPI_DEBUG_ANY StartColumn;
    WINAPI_DEBUG_ANY EndColumn;
    ULONG Reserved;
  } DEBUG_SYMBOL_SOURCE_ENTRY;
  typedef DEBUG_SYMBOL_SOURCE_ENTRY *PDEBUG_SYMBOL_SOURCE_ENTRY; //Pointer
  typedef struct DEBUG_OFFSET_REGION {
    ULONG64 Base;
    ULONG64 Size;
  } DEBUG_OFFSET_REGION;
  typedef DEBUG_OFFSET_REGION *PDEBUG_OFFSET_REGION; //Pointer
  typedef struct MEMORY_BASIC_INFORMATION64 {
    ULONGLONG BaseAddress;
    ULONGLONG AllocationBase;
    DWORD AllocationProtect;
    DWORD __alignment1;
    ULONGLONG RegionSize;
    WINAPI_MemoryAllocationFlags State;
    WINAPI_NtProtectionFlags Protect;
    WINAPI_MemoryType Type;
    DWORD __alignment2;
  } MEMORY_BASIC_INFORMATION64;
  typedef MEMORY_BASIC_INFORMATION64 *PMEMORY_BASIC_INFORMATION64; //Pointer
  typedef struct IMAGE_NT_HEADERS64 {
    DWORD Signature;
    IMAGE_FILE_HEADER FileHeader;
    IMAGE_OPTIONAL_HEADER64 OptionalHeader;
  } IMAGE_NT_HEADERS64;
  typedef IMAGE_NT_HEADERS64 *PIMAGE_NT_HEADERS64; //Pointer
  typedef ULONG WINAPI_DEBUG_SRCFILE_TYPE; //Alias
  static const WINAPI_DEBUG_SRCFILE_TYPE DEBUG_SRCFILE_SYMBOL_TOKEN = 0;
  static const WINAPI_DEBUG_SRCFILE_TYPE DEBUG_SRCFILE_SYMBOL_TOKEN_SOURCE_COMMAND_WIDE = 1;
  typedef ULONG WINAPI_DEBUG_SYMINFO_TYPE; //Alias
  static const WINAPI_DEBUG_SYMINFO_TYPE DEBUG_SYMINFO_BREAKPOINT_SOURCE_LINE = 0;
  static const WINAPI_DEBUG_SYMINFO_TYPE DEBUG_SYMINFO_IMAGEHLP_MODULEW64 = 1;
  static const WINAPI_DEBUG_SYMINFO_TYPE DEBUG_SYMINFO_GET_SYMBOL_NAME_BY_OFFSET_AND_TAG_WIDE = 2;
  static const WINAPI_DEBUG_SYMINFO_TYPE DEBUG_SYMINFO_GET_MODULE_SYMBOL_NAMES_AND_OFFSETS = 3;
  typedef ULONG WINAPI_DEBUG_SYSOBJINFO_TYPE; //Alias
  static const WINAPI_DEBUG_SYSOBJINFO_TYPE DEBUG_SYSOBJINFO_THREAD_BASIC_INFORMATION = 0;
  static const WINAPI_DEBUG_SYSOBJINFO_TYPE DEBUG_SYSOBJINFO_THREAD_NAME_WIDE = 1;
  static const WINAPI_DEBUG_SYSOBJINFO_TYPE DEBUG_SYSOBJINFO_CURRENT_PROCESS_COOKIE = 2;
  typedef ULONG WINAPI_DEBUG_ATTACH_KERNEL_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_GET_PROC_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_PROC_DESC_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_CONNECT_SESSION_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_ATTACH_PROC_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_CREATE_PROCESS_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_SERVERS_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_END_TYPE; //Alias
  static const WINAPI_DEBUG_END_TYPE DEBUG_END_PASSIVE = 0x00000000;
  static const WINAPI_DEBUG_END_TYPE DEBUG_END_ACTIVE_TERMINATE = 0x00000001;
  static const WINAPI_DEBUG_END_TYPE DEBUG_END_ACTIVE_DETACH = 0x00000002;
  static const WINAPI_DEBUG_END_TYPE DEBUG_END_REENTRANT = 0x00000003;
  static const WINAPI_DEBUG_END_TYPE DEBUG_END_DISCONNECT = 0x00000004;
  typedef ULONG WINAPI_DEBUG_OUTPUT_FLAGS; //Alias
  typedef WINAPI_DEBUG_OUTPUT_FLAGS *WINAPI_PDEBUG_OUTPUT_FLAGS; //Pointer
  typedef ULONG WINAPI_DEBUG_OUTCTL_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_FORMAT_FLAGS; //Alias
  typedef WINAPI_DEBUG_FORMAT_FLAGS *WINAPI_PDEBUG_FORMAT_FLAGS; //Pointer
  typedef ULONG WINAPI_DEBUG_DUMP_FILE_INDEX; //Alias
  static const WINAPI_DEBUG_DUMP_FILE_INDEX DEBUG_DUMP_FILE_LOAD_FAILED_INDEX = 0xffffffff;
  static const WINAPI_DEBUG_DUMP_FILE_INDEX DEBUG_DUMP_FILE_ORIGINAL_CAB_INDEX = 0xfffffffe;
  typedef ULONG WINAPI_DEBUG_CURRENT_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_DISASM_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_ENGOPT_FLAGS; //Alias
  typedef WINAPI_DEBUG_ENGOPT_FLAGS *WINAPI_PDEBUG_ENGOPT_FLAGS; //Pointer
  typedef ULONG WINAPI_DEBUG_STACK_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_EXECUTE_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_EINDEX_RELATION; //Alias
  typedef ULONG WINAPI_DEBUG_MANAGED_FLAGS; //Alias
  typedef WINAPI_DEBUG_MANAGED_FLAGS *WINAPI_PDEBUG_MANAGED_FLAGS; //Pointer
  typedef ULONG WINAPI_DEBUG_MANSTR_TYPE; //Alias
  static const WINAPI_DEBUG_MANSTR_TYPE DEBUG_MANSTR_NONE = 0x00000000;
  static const WINAPI_DEBUG_MANSTR_TYPE DEBUG_MANSTR_LOADED_SUPPORT_DLL = 0x00000001;
  static const WINAPI_DEBUG_MANSTR_TYPE DEBUG_MANSTR_LOAD_STATUS = 0x00000002;
  typedef ULONG WINAPI_DEBUG_MANRESET_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_DATA_INDEX; //Alias
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_KernBase = 24;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_BreakpointWithStatusAddr = 32;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_SavedContextAddr = 40;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_KiCallUserModeAddr = 56;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_KeUserCallbackDispatcherAddr = 64;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_PsLoadedModuleListAddr = 72;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_PsActiveProcessHeadAddr = 80;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_PspCidTableAddr = 88;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_ExpSystemResourcesListAddr = 96;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_ExpPagedPoolDescriptorAddr = 104;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_ExpNumberOfPagedPoolsAddr = 112;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_KeTimeIncrementAddr = 120;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_KeBugCheckCallbackListHeadAddr = 128;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_KiBugcheckDataAddr = 136;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_IopErrorLogListHeadAddr = 144;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_ObpRootDirectoryObjectAddr = 152;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_ObpTypeObjectTypeAddr = 160;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmSystemCacheStartAddr = 168;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmSystemCacheEndAddr = 176;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmSystemCacheWsAddr = 184;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmPfnDatabaseAddr = 192;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmSystemPtesStartAddr = 200;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmSystemPtesEndAddr = 208;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmSubsectionBaseAddr = 216;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmNumberOfPagingFilesAddr = 224;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmLowestPhysicalPageAddr = 232;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmHighestPhysicalPageAddr = 240;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmNumberOfPhysicalPagesAddr = 248;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmMaximumNonPagedPoolInBytesAddr = 256;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmNonPagedSystemStartAddr = 264;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmNonPagedPoolStartAddr = 272;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmNonPagedPoolEndAddr = 280;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmPagedPoolStartAddr = 288;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmPagedPoolEndAddr = 296;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmPagedPoolInformationAddr = 304;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmPageSize = 312;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmSizeOfPagedPoolInBytesAddr = 320;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmTotalCommitLimitAddr = 328;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmTotalCommittedPagesAddr = 336;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmSharedCommitAddr = 344;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmDriverCommitAddr = 352;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmProcessCommitAddr = 360;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmPagedPoolCommitAddr = 368;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmExtendedCommitAddr = 376;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmZeroedPageListHeadAddr = 384;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmFreePageListHeadAddr = 392;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmStandbyPageListHeadAddr = 400;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmModifiedPageListHeadAddr = 408;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmModifiedNoWritePageListHeadAddr = 416;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmAvailablePagesAddr = 424;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmResidentAvailablePagesAddr = 432;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_PoolTrackTableAddr = 440;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_NonPagedPoolDescriptorAddr = 448;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmHighestUserAddressAddr = 456;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmSystemRangeStartAddr = 464;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmUserProbeAddressAddr = 472;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_KdPrintCircularBufferAddr = 480;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_KdPrintCircularBufferEndAddr = 488;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_KdPrintWritePointerAddr = 496;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_KdPrintRolloverCountAddr = 504;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmLoadedUserImageListAddr = 512;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_NtBuildLabAddr = 520;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_KiNormalSystemCall = 528;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_KiProcessorBlockAddr = 536;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmUnloadedDriversAddr = 544;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmLastUnloadedDriverAddr = 552;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmTriageActionTakenAddr = 560;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmSpecialPoolTagAddr = 568;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_KernelVerifierAddr = 576;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmVerifierDataAddr = 584;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmAllocatedNonPagedPoolAddr = 592;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmPeakCommitmentAddr = 600;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmTotalCommitLimitMaximumAddr = 608;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_CmNtCSDVersionAddr = 616;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmPhysicalMemoryBlockAddr = 624;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmSessionBase = 632;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmSessionSize = 640;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmSystemParentTablePage = 648;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmVirtualTranslationBase = 656;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_OffsetKThreadNextProcessor = 664;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_OffsetKThreadTeb = 666;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_OffsetKThreadKernelStack = 668;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_OffsetKThreadInitialStack = 670;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_OffsetKThreadApcProcess = 672;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_OffsetKThreadState = 674;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_OffsetKThreadBStore = 676;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_OffsetKThreadBStoreLimit = 678;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_SizeEProcess = 680;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_OffsetEprocessPeb = 682;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_OffsetEprocessParentCID = 684;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_OffsetEprocessDirectoryTableBase = 686;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_SizePrcb = 688;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_OffsetPrcbDpcRoutine = 690;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_OffsetPrcbCurrentThread = 692;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_OffsetPrcbMhz = 694;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_OffsetPrcbCpuType = 696;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_OffsetPrcbVendorString = 698;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_OffsetPrcbProcessorState = 700;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_OffsetPrcbNumber = 702;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_SizeEThread = 704;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_KdPrintCircularBufferPtrAddr = 712;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_KdPrintBufferSizeAddr = 720;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_MmBadPagesDetected = 800;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_EtwpDebuggerData = 816;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_PaeEnabled = 100000;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_SharedUserData = 100008;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_ProductType = 100016;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_SuiteMask = 100024;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_DumpWriterStatus = 100032;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_DumpFormatVersion = 100040;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_DumpWriterVersion = 100048;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_DumpPowerState = 100056;
  static const WINAPI_DEBUG_DATA_INDEX DEBUG_DATA_DumpMmStorage = 100064;
  typedef ULONG WINAPI_DEBUG_DATA_INDEX_PROCESSOR; //Alias
  static const WINAPI_DEBUG_DATA_INDEX_PROCESSOR DEBUG_DATA_KPCR_OFFSET = 0;
  static const WINAPI_DEBUG_DATA_INDEX_PROCESSOR DEBUG_DATA_KPRCB_OFFSET = 1;
  static const WINAPI_DEBUG_DATA_INDEX_PROCESSOR DEBUG_DATA_KTHREAD_OFFSET = 2;
  static const WINAPI_DEBUG_DATA_INDEX_PROCESSOR DEBUG_DATA_BASE_TRANSLATION_VIRTUAL_OFFSET = 3;
  static const WINAPI_DEBUG_DATA_INDEX_PROCESSOR DEBUG_DATA_PROCESSOR_IDENTIFICATION = 4;
  static const WINAPI_DEBUG_DATA_INDEX_PROCESSOR DEBUG_DATA_PROCESSOR_SPEED = 5;
  typedef ULONG WINAPI_DEBUG_VSEARCH_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_PHYSICAL_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_EVENT_FLAGS; //Alias
  typedef WINAPI_DEBUG_EVENT_FLAGS *WINAPI_PDEBUG_EVENT_FLAGS; //Pointer
  typedef ULONG WINAPI_DEBUG_SESSION_STATUS; //Alias
  static const WINAPI_DEBUG_SESSION_STATUS DEBUG_SESSION_ACTIVE = 0x00000000;
  static const WINAPI_DEBUG_SESSION_STATUS DEBUG_SESSION_END_SESSION_ACTIVE_TERMINATE = 0x00000001;
  static const WINAPI_DEBUG_SESSION_STATUS DEBUG_SESSION_END_SESSION_ACTIVE_DETACH = 0x00000002;
  static const WINAPI_DEBUG_SESSION_STATUS DEBUG_SESSION_END_SESSION_PASSIVE = 0x00000003;
  static const WINAPI_DEBUG_SESSION_STATUS DEBUG_SESSION_END = 0x00000004;
  static const WINAPI_DEBUG_SESSION_STATUS DEBUG_SESSION_REBOOT = 0x00000005;
  static const WINAPI_DEBUG_SESSION_STATUS DEBUG_SESSION_HIBERNATE = 0x00000006;
  static const WINAPI_DEBUG_SESSION_STATUS DEBUG_SESSION_FAILURE = 0x00000007;
  typedef ULONG WINAPI_DEBUG_CDS_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_CES_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_CSS_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_OUTCB_INTEREST; //Alias
  typedef WINAPI_DEBUG_OUTCB_INTEREST *WINAPI_PDEBUG_OUTCB_INTEREST; //Pointer
  typedef ULONG WINAPI_DEBUG_OUTCB_TYPE; //Alias
  static const WINAPI_DEBUG_OUTCB_TYPE DEBUG_OUTCB_TEXT = 0;
  static const WINAPI_DEBUG_OUTCB_TYPE DEBUG_OUTCB_DML = 1;
  static const WINAPI_DEBUG_OUTCB_TYPE DEBUG_OUTCB_EXPLICIT_FLUSH = 2;
  typedef ULONG WINAPI_DEBUG_OUTCB_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_REGSRC; //Alias
  static const WINAPI_DEBUG_REGSRC DEBUG_REGSRC_DEBUGGEE = 0x00000000;
  static const WINAPI_DEBUG_REGSRC DEBUG_REGSRC_EXPLICIT = 0x00000001;
  static const WINAPI_DEBUG_REGSRC DEBUG_REGSRC_FRAME = 0x00000002;
  typedef ULONG WINAPI_DEBUG_OUTPUT_SYMBOLS_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_FIND_SOURCE_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_MODNAME; //Alias
  static const WINAPI_DEBUG_MODNAME DEBUG_MODNAME_IMAGE = 0x00000000;
  static const WINAPI_DEBUG_MODNAME DEBUG_MODNAME_MODULE = 0x00000001;
  static const WINAPI_DEBUG_MODNAME DEBUG_MODNAME_LOADED_IMAGE = 0x00000002;
  static const WINAPI_DEBUG_MODNAME DEBUG_MODNAME_SYMBOL_FILE = 0x00000003;
  static const WINAPI_DEBUG_MODNAME DEBUG_MODNAME_MAPPED_IMAGE = 0x00000004;
  typedef ULONG WINAPI_DEBUG_TYPEOPTS; //Alias
  typedef WINAPI_DEBUG_TYPEOPTS *WINAPI_PDEBUG_TYPEOPTS; //Pointer
  typedef ULONG WINAPI_DEBUG_GETMOD_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_OUTSYM_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_GETFNENT_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_GSEL_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_TIMEOUT; //Alias
//static const WINAPI_DEBUG_TIMEOUT INFINITE = 0xFFFFFFFF;
  typedef ULONG WINAPI_DEBUG_LOG_FLAGS; //Alias
  typedef WINAPI_DEBUG_LOG_FLAGS *WINAPI_PDEBUG_LOG_FLAGS; //Pointer
  typedef ULONG WINAPI_DEBUG_EXPR; //Alias
  static const WINAPI_DEBUG_EXPR DEBUG_EXPR_MASM = 0x00000000;
  static const WINAPI_DEBUG_EXPR DEBUG_EXPR_CPLUSPLUS = 0x00000001;
  typedef WINAPI_DEBUG_EXPR *WINAPI_PDEBUG_EXPR; //Pointer
  typedef ULONG WINAPI_DEBUG_CLASS; //Alias
  static const WINAPI_DEBUG_CLASS DEBUG_CLASS_UNINITIALIZED = 0;
  static const WINAPI_DEBUG_CLASS DEBUG_CLASS_KERNEL = 1;
  static const WINAPI_DEBUG_CLASS DEBUG_CLASS_USER_WINDOWS = 2;
  static const WINAPI_DEBUG_CLASS DEBUG_CLASS_IMAGE_FILE = 3;
  typedef ULONG WINAPI_DEBUG_INTERRUPT_TYPE; //Alias
  static const WINAPI_DEBUG_INTERRUPT_TYPE DEBUG_INTERRUPT_ACTIVE = 0;
  static const WINAPI_DEBUG_INTERRUPT_TYPE DEBUG_INTERRUPT_PASSIVE = 1;
  static const WINAPI_DEBUG_INTERRUPT_TYPE DEBUG_INTERRUPT_EXIT = 2;
  typedef ULONG WINAPI_DEBUG_REGISTERS_FLAGS; //Alias
  typedef ULONG WINAPI_DEBUG_SCOPE_GROUP_FLAGS; //Alias
  HRESULT DebugCreate(      REFIID InterfaceId, PVOID* Interface);
  HRESULT DebugConnect(     PCSTR RemoteOptions, REFIID InterfaceId, PVOID* Interface);
  HRESULT DebugConnectWide( PCWSTR RemoteOptions, REFIID InterfaceId, PVOID* Interface);
]]
return ffi.load( 'DbgEng.dll' )

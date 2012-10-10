require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/events' )
require( 'ffi/winapi/headers/power' )
require( 'ffi/winapi/headers/security' )
require( 'ffi/winapi/headers/registry' )
require( 'ffi/winapi/headers/native' )
require( 'ffi/winapi/headers/sockets' )
require( 'ffi/winapi/headers/ioctl' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PPLUGPLAY_EVENT_BLOCK; //Alias
  typedef LPVOID PDBGUI_WAIT_STATE_CHANGE; //Alias
  typedef LPVOID PRTL_TRACE_DATABASE; //Alias
  typedef LPVOID PRTL_TRACE_BLOCK; //Alias
  typedef LPVOID PRTL_TRACE_ENUM; //Alias
  typedef USHORT RTL_ATOM; //Alias
  typedef RTL_ATOM *PRTL_ATOM; //Pointer
  typedef short CSHORT; //Alias
  typedef ULONG CLONG; //Alias
  typedef CHAR* PCCH; //Alias
  typedef CHAR* PCH; //Alias
  typedef char* PCSZ; //Alias
  typedef LPVOID PTHREAD_START_ROUTINE; //Alias
  typedef LPVOID WORKERCALLBACKFUNC; //Alias
  typedef LPVOID WAITORTIMERCALLBACKFUNC; //Alias
  typedef SIZE_T LPC_SIZE_T; //Alias
  typedef PVOID LPC_PVOID; //Alias
  typedef HANDLE LPC_HANDLE; //Alias
  typedef LPVOID PTIMER_APC_ROUTINE; //Alias
  typedef LPVOID PHEAP_ENUMERATION_ROUTINE; //Alias
  typedef LPVOID PRTL_HEAP_COMMIT_ROUTINE; //Alias
  typedef LPVOID PRTL_AVL_COMPARE_ROUTINE; //Alias
  typedef LPVOID PRTL_AVL_ALLOCATE_ROUTINE; //Alias
  typedef LPVOID PRTL_AVL_FREE_ROUTINE; //Alias
  typedef LPVOID PRTL_SECURE_MEMORY_CACHE_CALLBACK; //Alias
  typedef LPVOID PRTL_QUERY_REGISTRY_ROUTINE; //Alias
  typedef LPVOID PRTL_GENERIC_COMPARE_ROUTINE; //Alias
  typedef LPVOID PRTL_GENERIC_ALLOCATE_ROUTINE; //Alias
  typedef LPVOID PRTL_GENERIC_FREE_ROUTINE; //Alias
  typedef LPVOID PEXCEPTION_ROUTINE; //Alias
  typedef HANDLE *HANDLE []; //Pointer
  typedef LPVOID PRTL_TRACE_HASH_FUNCTION; //Alias
  typedef LPVOID PLDR_DLL_NOTIFICATION_FUNCTION; //Alias
  typedef PWCHAR PWCH; //Alias
  enum { MAXIMUM_LEADBYTES = 12 };
  enum { GDI_BATCH_BUFFER_SIZE = 310 };
  typedef ULONG RTL_DEBUG_QUERY_FLAGS; //Alias
  typedef struct CURDIR {
    UNICODE_STRING DosPath;
    HANDLE Handle;
  } CURDIR;
  typedef struct CSR_CAPTURE_BUFFER {
    ULONG Size;
    LPVOID PreviousCaptureBuffer;
    ULONG PointerCount;
    ULONG_PTR BufferEnd;
    ULONG_PTR PointerArray_1_;
  } CSR_CAPTURE_BUFFER;
  typedef ULONG LDRP_FLAGS; //Alias
  typedef struct LDR_DATA_TABLE_ENTRY_u1_s {
    PVOID SectionPointer;
    ULONG CheckSum;
  } LDR_DATA_TABLE_ENTRY_u1_s;
  typedef union LDR_DATA_TABLE_ENTRY_u1 {
    LIST_ENTRY HashLinks;
    LDR_DATA_TABLE_ENTRY_u1_s ;
  } LDR_DATA_TABLE_ENTRY_u1;
  typedef union LDR_DATA_TABLE_ENTRY_u2 {
    ULONG TimeDateStamp;
    PVOID LoadedImports;
  } LDR_DATA_TABLE_ENTRY_u2;
  typedef struct LDR_DATA_TABLE_ENTRY {
    LIST_ENTRY InLoadOrderLinks;
    LIST_ENTRY InMemoryOrderModuleList;
    LIST_ENTRY InInitializationOrderModuleList;
    PVOID DllBase;
    PVOID EntryPoint;
    ULONG SizeOfImage;
    UNICODE_STRING FullDllName;
    UNICODE_STRING BaseDllName;
    LDRP_FLAGS Flags;
    USHORT LoadCount;
    USHORT TlsIndex;
    LDR_DATA_TABLE_ENTRY_u1 ;
    LDR_DATA_TABLE_ENTRY_u2 ;
    PVOID EntryPointActivationContext;
    PVOID PatchInformation;
  } LDR_DATA_TABLE_ENTRY;
  typedef LDR_DATA_TABLE_ENTRY *PLDR_DATA_TABLE_ENTRY; //Pointer
  typedef struct IMAGE_BASE_RELOCATION {
    ULONG VirtualAddress;
    ULONG SizeOfBlock;
  } IMAGE_BASE_RELOCATION;
  typedef IMAGE_BASE_RELOCATION *PIMAGE_BASE_RELOCATION; //Pointer
  typedef UINT KPROFILE_SOURCE; //Alias
  static const KPROFILE_SOURCE ProfileTime = 0;
  static const KPROFILE_SOURCE ProfileAlignmentFixup = 1;
  static const KPROFILE_SOURCE ProfileTotalIssues = 2;
  static const KPROFILE_SOURCE ProfilePipelineDry = 3;
  static const KPROFILE_SOURCE ProfileLoadInstructions = 4;
  static const KPROFILE_SOURCE ProfilePipelineFrozen = 5;
  static const KPROFILE_SOURCE ProfileBranchInstructions = 6;
  static const KPROFILE_SOURCE ProfileTotalNonissues = 7;
  static const KPROFILE_SOURCE ProfileDcacheMisses = 8;
  static const KPROFILE_SOURCE ProfileIcacheMisses = 9;
  static const KPROFILE_SOURCE ProfileCacheMisses = 10;
  static const KPROFILE_SOURCE ProfileBranchMispredictions = 11;
  static const KPROFILE_SOURCE ProfileStoreInstructions = 12;
  static const KPROFILE_SOURCE ProfileFpInstructions = 13;
  static const KPROFILE_SOURCE ProfileIntegerInstructions = 14;
  static const KPROFILE_SOURCE Profile2Issue = 15;
  static const KPROFILE_SOURCE Profile3Issue = 16;
  static const KPROFILE_SOURCE Profile4Issue = 17;
  static const KPROFILE_SOURCE ProfileSpecialInstructions = 18;
  static const KPROFILE_SOURCE ProfileTotalCycles = 19;
  static const KPROFILE_SOURCE ProfileIcacheIssues = 20;
  static const KPROFILE_SOURCE ProfileDcacheAccesses = 21;
  static const KPROFILE_SOURCE ProfileMemoryBarrierCycles = 22;
  static const KPROFILE_SOURCE ProfileLoadLinkedIssues = 23;
  typedef struct RTL_DRIVE_LETTER_CURDIR {
    USHORT Flags;
    USHORT Length;
    ULONG TimeStamp;
    UNICODE_STRING DosPath;
  } RTL_DRIVE_LETTER_CURDIR;
  typedef ULONG RTL_USER_PROCESS_PARAMETERS_FLAGS; //Alias
  static const RTL_USER_PROCESS_PARAMETERS_FLAGS RTL_USER_PROCESS_PARAMETERS_NORMALIZED = 0x01;
  static const RTL_USER_PROCESS_PARAMETERS_FLAGS RTL_USER_PROCESS_PARAMETERS_PROFILE_USER = 0x02;
  static const RTL_USER_PROCESS_PARAMETERS_FLAGS RTL_USER_PROCESS_PARAMETERS_PROFILE_SERVER = 0x04;
  static const RTL_USER_PROCESS_PARAMETERS_FLAGS RTL_USER_PROCESS_PARAMETERS_PROFILE_KERNEL = 0x08;
  static const RTL_USER_PROCESS_PARAMETERS_FLAGS RTL_USER_PROCESS_PARAMETERS_UNKNOWN = 0x10;
  static const RTL_USER_PROCESS_PARAMETERS_FLAGS RTL_USER_PROCESS_PARAMETERS_RESERVE_1MB = 0x20;
  static const RTL_USER_PROCESS_PARAMETERS_FLAGS RTL_USER_PROCESS_PARAMETERS_DISABLE_HEAP_CHECKS = 0x100;
  static const RTL_USER_PROCESS_PARAMETERS_FLAGS RTL_USER_PROCESS_PARAMETERS_PROCESS_OR_1 = 0x200;
  static const RTL_USER_PROCESS_PARAMETERS_FLAGS RTL_USER_PROCESS_PARAMETERS_PROCESS_OR_2 = 0x400;
  static const RTL_USER_PROCESS_PARAMETERS_FLAGS RTL_USER_PROCESS_PARAMETERS_PRIVATE_DLL_PATH = 0x1000;
  static const RTL_USER_PROCESS_PARAMETERS_FLAGS RTL_USER_PROCESS_PARAMETERS_LOCAL_DLL_PATH = 0x2000;
  static const RTL_USER_PROCESS_PARAMETERS_FLAGS RTL_USER_PROCESS_PARAMETERS_NX = 0x20000;
  typedef struct RTL_USER_PROCESS_PARAMETERS {
    ULONG MaximumLength;
    ULONG Length;
    RTL_USER_PROCESS_PARAMETERS_FLAGS Flags;
    ULONG DebugFlags;
    HANDLE ConsoleHandle;
    ULONG ConsoleFlags;
    HANDLE StandardInput;
    HANDLE StandardOutput;
    HANDLE StandardError;
    CURDIR CurrentDirectory;
    UNICODE_STRING DllPath;
    UNICODE_STRING ImagePathName;
    UNICODE_STRING CommandLine;
    PWSTR Environment;
    ULONG StartingX;
    ULONG StartingY;
    ULONG CountX;
    ULONG CountY;
    ULONG CountCharsX;
    ULONG CountCharsY;
    ULONG FillAttribute;
    STARTUPINFO_Flags WindowFlags;
    ShowWindowCmd ShowWindowFlags;
    UNICODE_STRING WindowTitle;
    UNICODE_STRING DesktopInfo;
    UNICODE_STRING ShellInfo;
    UNICODE_STRING RuntimeData;
    RTL_DRIVE_LETTER_CURDIR CurrentDirectories_32_;
  } RTL_USER_PROCESS_PARAMETERS;
  typedef RTL_USER_PROCESS_PARAMETERS *PRTL_USER_PROCESS_PARAMETERS; //Pointer
  typedef struct SECTION_IMAGE_INFORMATION {
    PVOID EntryPoint;
    ULONG StackZeroBits;
    ULONG StackReserved;
    ULONG StackCommit;
    ULONG ImageSubsystem;
    WORD SubsystemVersionLow;
    WORD SubsystemVersionHigh;
    ULONG Unknown1;
    IMAGE_FILE_CHARACTERISTICS_ULONG ImageCharacteristics;
    ULONG ImageMachineType;
    ULONG Unknown2_3_;
  } SECTION_IMAGE_INFORMATION;
  typedef struct RTL_USER_PROCESS_INFORMATION {
    ULONG Size;
    HANDLE ProcessHandle;
    HANDLE ThreadHandle;
    CLIENT_ID ClientId;
    SECTION_IMAGE_INFORMATION ImageInformation;
  } RTL_USER_PROCESS_INFORMATION;
  typedef RTL_USER_PROCESS_INFORMATION *PRTL_USER_PROCESS_INFORMATION; //Pointer
  typedef struct INITIAL_TEB {
    PVOID StackBase;
    PVOID StackLimit;
    PVOID StackCommit;
    PVOID StackCommitMax;
    PVOID StackReserved;
  } INITIAL_TEB;
  typedef INITIAL_TEB *PINITIAL_TEB; //Pointer
  typedef UINT RTL_PATH_TYPE; //Alias
  static const RTL_PATH_TYPE RtlPathTypeUnknown = 0;
  static const RTL_PATH_TYPE RtlPathTypeUncAbsolute = 1;
  static const RTL_PATH_TYPE RtlPathTypeDriveAbsolute = 2;
  static const RTL_PATH_TYPE RtlPathTypeDriveRelative = 3;
  static const RTL_PATH_TYPE RtlPathTypeRooted = 4;
  static const RTL_PATH_TYPE RtlPathTypeRelative = 5;
  static const RTL_PATH_TYPE RtlPathTypeLocalDevice = 6;
  static const RTL_PATH_TYPE RtlPathTypeRootLocalDevice = 7;
  typedef struct RTL_RESOURCE {
    RTL_CRITICAL_SECTION Lock;
    HANDLE SharedSemaphore;
    ULONG SharedWaiters;
    HANDLE ExclusiveSemaphore;
    ULONG ExclusiveWaiters;
    LONG NumberActive;
    HANDLE OwningThread;
    ULONG TimeoutBoost;
    PVOID DebugInfo;
  } RTL_RESOURCE;
  typedef RTL_RESOURCE *PRTL_RESOURCE; //Pointer
  typedef struct RTL_PROCESS_VERIFIER_OPTIONS {
    ULONG SizeStruct;
    ULONG Option;
    UCHAR OptionData_1_;
  } RTL_PROCESS_VERIFIER_OPTIONS;
  typedef RTL_PROCESS_VERIFIER_OPTIONS *PRTL_PROCESS_VERIFIER_OPTIONS; //Pointer
  typedef struct RTL_PROCESS_LOCK_INFORMATION {
    PVOID Address;
    USHORT Type;
    USHORT CreatorBackTraceIndex;
    ULONG OwnerThreadId;
    ULONG ActiveCount;
    ULONG ContentionCount;
    ULONG EntryCount;
    ULONG RecursionCount;
    ULONG NumberOfSharedWaiters;
    ULONG NumberOfExclusiveWaiters;
  } RTL_PROCESS_LOCK_INFORMATION;
  typedef struct RTL_PROCESS_LOCKS {
    ULONG NumberOfLocks;
    RTL_PROCESS_LOCK_INFORMATION Locks_1_;
  } RTL_PROCESS_LOCKS;
  typedef RTL_PROCESS_LOCKS *PRTL_PROCESS_LOCKS; //Pointer
  typedef struct RTL_HEAP_INFORMATION {
    PVOID BaseAddress;
    ULONG Flags;
    USHORT EntryOverhead;
    USHORT CreatorBackTraceIndex;
    ULONG BytesAllocated;
    ULONG BytesCommitted;
    ULONG NumberOfTags;
    ULONG NumberOfEntries;
    ULONG NumberOfPseudoTags;
    ULONG PseudoTagGranularity;
    ULONG Reserved_4_;
    PVOID Tags;
    PVOID Entries;
  } RTL_HEAP_INFORMATION;
  typedef struct RTL_PROCESS_HEAPS {
    ULONG NumberOfHeaps;
    RTL_HEAP_INFORMATION Heaps_1_;
  } RTL_PROCESS_HEAPS;
  typedef RTL_PROCESS_HEAPS *PRTL_PROCESS_HEAPS; //Pointer
  typedef struct RTL_PROCESS_BACKTRACE_INFORMATION {
    PVOID SymbolicBackTrace;
    ULONG TraceCount;
    USHORT Index;
    USHORT Depth;
    PVOID BackTrace_16_;
  } RTL_PROCESS_BACKTRACE_INFORMATION;
  typedef struct RTL_PROCESS_BACKTRACES {
    ULONG CommittedMemory;
    ULONG ReservedMemory;
    ULONG NumberOfBackTraceLookups;
    ULONG NumberOfBackTraces;
    RTL_PROCESS_BACKTRACE_INFORMATION BackTraces_1_;
  } RTL_PROCESS_BACKTRACES;
  typedef RTL_PROCESS_BACKTRACES *PRTL_PROCESS_BACKTRACES; //Pointer
  typedef struct RTL_PROCESS_MODULE_INFORMATION {
    ULONG Section;
    PVOID MappedBase;
    PVOID ImageBase;
    ULONG ImageSize;
    ULONG Flags;
    USHORT LoadOrderIndex;
    USHORT InitOrderIndex;
    USHORT LoadCount;
    USHORT OffsetToFileName;
    CHAR FullPathName_256_;
  } RTL_PROCESS_MODULE_INFORMATION;
  typedef struct RTL_PROCESS_MODULES {
    ULONG NumberOfModules;
    RTL_PROCESS_MODULE_INFORMATION Modules_1_;
  } RTL_PROCESS_MODULES;
  typedef RTL_PROCESS_MODULES *PRTL_PROCESS_MODULES; //Pointer
  typedef struct RTL_PROCESS_MODULE_INFORMATION_EX {
    ULONG NextOffset;
    RTL_PROCESS_MODULE_INFORMATION BaseInfo;
    ULONG ImageCheckSum;
    ULONG TimeDateStamp;
    PVOID DefaultBase;
  } RTL_PROCESS_MODULE_INFORMATION_EX;
  typedef RTL_PROCESS_MODULE_INFORMATION_EX *PRTL_PROCESS_MODULE_INFORMATION_EX; //Pointer
  typedef union RTL_DEBUG_INFORMATION_u {
    PRTL_PROCESS_MODULES Modules;
    PRTL_PROCESS_MODULE_INFORMATION_EX ModulesEx;
  } RTL_DEBUG_INFORMATION_u;
  typedef struct RTL_DEBUG_INFORMATION {
    HANDLE SectionHandleClient;
    PVOID ViewBaseClient;
    PVOID ViewBaseTarget;
    ULONG ViewBaseDelta;
    HANDLE EventPairClient;
    PVOID EventPairTarget;
    HANDLE TargetProcessId;
    HANDLE TargetThreadHandle;
    RTL_DEBUG_QUERY_FLAGS Flags;
    ULONG_PTR OffsetFree;
    ULONG_PTR CommitSize;
    ULONG_PTR ViewSize;
    RTL_DEBUG_INFORMATION_u ;
    PRTL_PROCESS_BACKTRACES BackTraces;
    PRTL_PROCESS_HEAPS Heaps;
    PRTL_PROCESS_LOCKS Locks;
    HANDLE SpecificHeap;
    HANDLE TargetProcessHandle;
    PRTL_PROCESS_VERIFIER_OPTIONS VerifierOptions;
    HANDLE ProcessHeap;
    HANDLE CriticalSectionHandle;
    HANDLE CriticalSectionOwnerThread;
    PVOID Reserved_4_;
  } RTL_DEBUG_INFORMATION;
  typedef RTL_DEBUG_INFORMATION *PRTL_DEBUG_INFORMATION; //Pointer
  typedef struct RTL_BITMAP {
    ULONG SizeOfBitMap;
    PULONG Buffer;
  } RTL_BITMAP;
  typedef RTL_BITMAP *PRTL_BITMAP; //Pointer
  typedef struct RTL_RANGE_LIST {
    LIST_ENTRY ListHead;
    ULONG Flags;
    ULONG Count;
    ULONG Stamp;
  } RTL_RANGE_LIST;
  typedef RTL_RANGE_LIST *PRTL_RANGE_LIST; //Pointer
  typedef struct RTL_SPLAY_LINKS {
    LPVOID Parent;
    LPVOID LeftChild;
    LPVOID RightChild;
  } RTL_SPLAY_LINKS;
  typedef RTL_SPLAY_LINKS *PRTL_SPLAY_LINKS; //Pointer
  typedef struct RTL_GENERIC_TABLE {
    PRTL_SPLAY_LINKS TableRoot;
    LIST_ENTRY InsertOrderList;
    PLIST_ENTRY OrderedPointer;
    ULONG WhichOrderedElement;
    ULONG NumberGenericTableElements;
    PRTL_GENERIC_COMPARE_ROUTINE CompareRoutine;
    PRTL_GENERIC_ALLOCATE_ROUTINE AllocateRoutine;
    PRTL_GENERIC_FREE_ROUTINE FreeRoutine;
    PVOID TableContext;
  } RTL_GENERIC_TABLE;
  typedef RTL_GENERIC_TABLE *PRTL_GENERIC_TABLE; //Pointer
  typedef UINT TABLE_SEARCH_RESULT; //Alias
  static const TABLE_SEARCH_RESULT TableEmptyTree = 0;
  static const TABLE_SEARCH_RESULT TableFoundNode = 1;
  static const TABLE_SEARCH_RESULT TableInsertAsLeft = 2;
  static const TABLE_SEARCH_RESULT TableInsertAsRight = 3;
  typedef union RTL_HANDLE_TABLE_ENTRY {
    ULONG Flags;
    LPVOID NextFree;
  } RTL_HANDLE_TABLE_ENTRY;
  typedef RTL_HANDLE_TABLE_ENTRY *PRTL_HANDLE_TABLE_ENTRY; //Pointer
  typedef struct RTL_HANDLE_TABLE {
    ULONG MaximumNumberOfHandles;
    ULONG SizeOfHandleTableEntry;
    ULONG Reserved_2_;
    PRTL_HANDLE_TABLE_ENTRY FreeHandles;
    PRTL_HANDLE_TABLE_ENTRY CommittedHandles;
    PRTL_HANDLE_TABLE_ENTRY UnCommittedHandles;
    PRTL_HANDLE_TABLE_ENTRY MaxReservedHandles;
  } RTL_HANDLE_TABLE;
  typedef RTL_HANDLE_TABLE *PRTL_HANDLE_TABLE; //Pointer
  typedef struct RTL_MESSAGE_RESOURCE_ENTRY {
    USHORT Length;
    USHORT Flags;
    CHAR Text_1_;
  } RTL_MESSAGE_RESOURCE_ENTRY;
  typedef RTL_MESSAGE_RESOURCE_ENTRY *PRTL_MESSAGE_RESOURCE_ENTRY; //Pointer
  typedef ULONG RTL_QUERY_REGISTRY_FLAGS; //Alias
  typedef struct RTL_QUERY_REGISTRY_TABLE {
    PRTL_QUERY_REGISTRY_ROUTINE QueryRoutine;
    RTL_QUERY_REGISTRY_FLAGS Flags;
    PWSTR Name;
    PVOID EntryContext;
    ULONG DefaultType;
    PVOID DefaultData;
    ULONG DefaultLength;
  } RTL_QUERY_REGISTRY_TABLE;
  typedef RTL_QUERY_REGISTRY_TABLE *PRTL_QUERY_REGISTRY_TABLE; //Pointer
  typedef struct CPTABLEINFO {
    USHORT CodePage;
    USHORT MaximumCharacterSize;
    USHORT DefaultChar;
    USHORT UniDefaultChar;
    USHORT TransDefaultChar;
    USHORT TransUniDefaultChar;
    USHORT DBCSCodePage;
    UCHAR LeadByte_MAXIMUM_LEADBYTES_;
    PUSHORT MultiByteTable;
    PVOID WideCharTable;
    PUSHORT DBCSRanges;
    PUSHORT DBCSOffsets;
  } CPTABLEINFO;
  typedef CPTABLEINFO *PCPTABLEINFO; //Pointer
  typedef struct NLSTABLEINFO {
    CPTABLEINFO OemTableInfo;
    CPTABLEINFO AnsiTableInfo;
    PUSHORT UpperCaseTable;
    PUSHORT LowerCaseTable;
  } NLSTABLEINFO;
  typedef NLSTABLEINFO *PNLSTABLEINFO; //Pointer
  typedef struct RTL_SYSTEM_TIME {
    WORD wYear;
    WORD wMonth;
    WORD wDayOfWeek;
    WORD wDay;
    WORD wHour;
    WORD wMinute;
    WORD wSecond;
    WORD wMilliseconds;
  } RTL_SYSTEM_TIME;
  typedef struct RTL_TIME_ZONE_INFORMATION {
    LONG Bias;
    WCHAR StandardName_32_;
    RTL_SYSTEM_TIME StandardDate;
    LONG StandardBias;
    WCHAR DaylightName_32_;
    RTL_SYSTEM_TIME DaylightDate;
    LONG DaylightBias;
  } RTL_TIME_ZONE_INFORMATION;
  typedef RTL_TIME_ZONE_INFORMATION *PRTL_TIME_ZONE_INFORMATION; //Pointer
  typedef struct TIME_FIELDS {
    CSHORT Year;
    CSHORT Month;
    CSHORT Day;
    CSHORT Hour;
    CSHORT Minute;
    CSHORT Second;
    CSHORT Milliseconds;
    CSHORT Weekday;
  } TIME_FIELDS;
  typedef TIME_FIELDS *PTIME_FIELDS; //Pointer
  typedef UINT NT_PRODUCT_TYPE; //Alias
  static const NT_PRODUCT_TYPE NtProductWinNt = 1;
  static const NT_PRODUCT_TYPE NtProductLanManNt = 2;
  static const NT_PRODUCT_TYPE NtProductServer = 3;
  typedef NT_PRODUCT_TYPE *PNT_PRODUCT_TYPE; //Pointer
  typedef struct RTL_BALANCED_LINKS {
    LPVOID Parent;
    LPVOID LeftChild;
    LPVOID RightChild;
    CHAR Balance;
    UCHAR Reserved_3_;
  } RTL_BALANCED_LINKS;
  typedef RTL_BALANCED_LINKS *PRTL_BALANCED_LINKS; //Pointer
  typedef struct RTL_AVL_TABLE {
    RTL_BALANCED_LINKS BalancedRoot;
    PVOID OrderedPointer;
    ULONG WhichOrderedElement;
    ULONG NumberGenericTableElements;
    ULONG DepthOfTree;
    PRTL_BALANCED_LINKS RestartKey;
    ULONG DeleteCount;
    PRTL_AVL_COMPARE_ROUTINE CompareRoutine;
    PRTL_AVL_ALLOCATE_ROUTINE AllocateRoutine;
    PRTL_AVL_FREE_ROUTINE FreeRoutine;
    PVOID TableContext;
  } RTL_AVL_TABLE;
  typedef RTL_AVL_TABLE *PRTL_AVL_TABLE; //Pointer
  typedef struct COMPRESSED_DATA_INFO {
    USHORT CompressionFormatAndEngine;
    UCHAR CompressionUnitShift;
    UCHAR ChunkShift;
    UCHAR ClusterShift;
    UCHAR Reserved;
    USHORT NumberOfChunks;
    ULONG CompressedChunkSizes_ANYSIZE_ARRAY_;
  } COMPRESSED_DATA_INFO;
  typedef COMPRESSED_DATA_INFO *PCOMPRESSED_DATA_INFO; //Pointer
  typedef struct GENERATE_NAME_CONTEXT {
    USHORT Checksum;
    BOOLEAN CheckSumInserted;
    UCHAR NameLength;
    WCHAR NameBuffer_8_;
    ULONG ExtensionLength;
    WCHAR ExtensionBuffer_4_;
    ULONG LastIndexValue;
  } GENERATE_NAME_CONTEXT;
  typedef GENERATE_NAME_CONTEXT *PGENERATE_NAME_CONTEXT; //Pointer
  typedef struct RTL_HEAP_PARAMETERS {
    ULONG Length;
    SIZE_T SegmentReserve;
    SIZE_T SegmentCommit;
    SIZE_T DeCommitFreeBlockThreshold;
    SIZE_T DeCommitTotalFreeThreshold;
    SIZE_T MaximumAllocationSize;
    SIZE_T VirtualMemoryThreshold;
    SIZE_T InitialCommit;
    SIZE_T InitialReserve;
    PRTL_HEAP_COMMIT_ROUTINE CommitRoutine;
    SIZE_T Reserved_2_;
  } RTL_HEAP_PARAMETERS;
  typedef RTL_HEAP_PARAMETERS *PRTL_HEAP_PARAMETERS; //Pointer
  typedef struct RTL_HEAP_TAG_INFO {
    ULONG NumberOfAllocations;
    ULONG NumberOfFrees;
    ULONG BytesAllocated;
  } RTL_HEAP_TAG_INFO;
  typedef RTL_HEAP_TAG_INFO *PRTL_HEAP_TAG_INFO; //Pointer
  typedef struct RTL_HEAP_USAGE_ENTRY {
    LPVOID Next;
  } RTL_HEAP_USAGE_ENTRY;
  typedef RTL_HEAP_USAGE_ENTRY *PRTL_HEAP_USAGE_ENTRY; //Pointer
  typedef struct RTL_HEAP_USAGE {
    ULONG Length;
    ULONG BytesAllocated;
    ULONG BytesCommitted;
    ULONG BytesReserved;
    ULONG BytesReservedMaximum;
    PRTL_HEAP_USAGE_ENTRY Entries;
    PRTL_HEAP_USAGE_ENTRY AddedEntries;
    PRTL_HEAP_USAGE_ENTRY RemovedEntries;
    UCHAR Reserved_32_;
  } RTL_HEAP_USAGE;
  typedef RTL_HEAP_USAGE *PRTL_HEAP_USAGE; //Pointer
  typedef union IO_STATUS_BLOCK_u {
    NTSTATUS Status;
    PVOID Pointer;
  } IO_STATUS_BLOCK_u;
  typedef struct IO_STATUS_BLOCK {
    IO_STATUS_BLOCK_u ;
    ULONG_PTR Information;
  } IO_STATUS_BLOCK;
  typedef IO_STATUS_BLOCK *PIO_STATUS_BLOCK; //Pointer
  typedef struct KEY_VALUE_ENTRY {
    PUNICODE_STRING ValueName;
    ULONG DataLength;
    ULONG DataOffset;
    ULONG Type;
  } KEY_VALUE_ENTRY;
  typedef KEY_VALUE_ENTRY *PKEY_VALUE_ENTRY; //Pointer
  typedef struct EFI_DRIVER_ENTRY {
    ULONG Version;
    ULONG Length;
    ULONG Id;
    ULONG Attributes;
    ULONG FriendlyNameOffset;
    ULONG DriverFilePathOffset;
  } EFI_DRIVER_ENTRY;
  typedef EFI_DRIVER_ENTRY *PEFI_DRIVER_ENTRY; //Pointer
  typedef FileAttributes FILE_ATTRIBUTES_ULONG; //Alias
  typedef struct FILE_BASIC_INFORMATION {
    LARGE_INTEGER CreationTime;
    LARGE_INTEGER LastAccessTime;
    LARGE_INTEGER LastWriteTime;
    LARGE_INTEGER ChangeTime;
    FILE_ATTRIBUTES_ULONG FileAttributes;
  } FILE_BASIC_INFORMATION;
  typedef FILE_BASIC_INFORMATION *PFILE_BASIC_INFORMATION; //Pointer
  typedef struct FILE_NETWORK_OPEN_INFORMATION {
    LARGE_INTEGER CreationTime;
    LARGE_INTEGER LastAccessTime;
    LARGE_INTEGER LastWriteTime;
    LARGE_INTEGER ChangeTime;
    LARGE_INTEGER AllocationSize;
    LARGE_INTEGER EndOfFile;
    ULONG FileAttributes;
  } FILE_NETWORK_OPEN_INFORMATION;
  typedef FILE_NETWORK_OPEN_INFORMATION *PFILE_NETWORK_OPEN_INFORMATION; //Pointer
  typedef struct BOOT_ENTRY {
    ULONG Version;
    ULONG Length;
    ULONG Id;
    ULONG Attributes;
    ULONG FriendlyNameOffset;
    ULONG BootFilePathOffset;
    ULONG OsOptionsLength;
    CHAR OsOptions_1_;
  } BOOT_ENTRY;
  typedef BOOT_ENTRY *PBOOT_ENTRY; //Pointer
  typedef struct BOOT_OPTIONS {
    ULONG Version;
    ULONG Length;
    ULONG Timeout;
    ULONG CurrentBootEntryId;
    ULONG NextBootEntryId;
    WCHAR HeadlessRedirection_1_;
  } BOOT_OPTIONS;
  typedef BOOT_OPTIONS *PBOOT_OPTIONS; //Pointer
  typedef struct FILE_PATH {
    ULONG Version;
    ULONG Length;
    ULONG Type;
    CHAR FilePath_1_;
  } FILE_PATH;
  typedef FILE_PATH *PFILE_PATH; //Pointer
  typedef struct LDR_RESOURCE_INFO {
    ULONG_PTR Type;
    ULONG_PTR Name;
    ULONG Language;
  } LDR_RESOURCE_INFO;
  typedef LDR_RESOURCE_INFO *PLDR_RESOURCE_INFO; //Pointer
  typedef struct PORT_VIEW {
    ULONG Length;
    LPC_HANDLE SectionHandle;
    ULONG SectionOffset;
    LPC_SIZE_T ViewSize;
    LPC_PVOID ViewBase;
    LPC_PVOID ViewRemoteBase;
  } PORT_VIEW;
  typedef PORT_VIEW *PPORT_VIEW; //Pointer
  typedef struct REMOTE_PORT_VIEW {
    ULONG Length;
    LPC_SIZE_T ViewSize;
    LPC_PVOID ViewBase;
  } REMOTE_PORT_VIEW;
  typedef REMOTE_PORT_VIEW *PREMOTE_PORT_VIEW; //Pointer
  typedef struct JOB_SET_ARRAY {
    HANDLE JobHandle;
    DWORD MemberLevel;
    DWORD Flags;
  } JOB_SET_ARRAY;
  typedef JOB_SET_ARRAY *PJOB_SET_ARRAY; //Pointer
  typedef struct TOKEN_USER {
    SID_AND_ATTRIBUTES User;
  } TOKEN_USER;
  typedef TOKEN_USER *PTOKEN_USER; //Pointer
  typedef struct TOKEN_OWNER {
    PSID Owner;
  } TOKEN_OWNER;
  typedef TOKEN_OWNER *PTOKEN_OWNER; //Pointer
  typedef struct TOKEN_PRIMARY_GROUP {
    PSID PrimaryGroup;
  } TOKEN_PRIMARY_GROUP;
  typedef TOKEN_PRIMARY_GROUP *PTOKEN_PRIMARY_GROUP; //Pointer
  typedef struct TOKEN_DEFAULT_DACL {
    PACL DefaultDacl;
  } TOKEN_DEFAULT_DACL;
  typedef TOKEN_DEFAULT_DACL *PTOKEN_DEFAULT_DACL; //Pointer
  typedef struct IMAGE_RESOURCE_DATA_ENTRY {
    DWORD OffsetToData;
    DWORD Size;
    CodePageEnum CodePage;
    DWORD Reserved;
  } IMAGE_RESOURCE_DATA_ENTRY;
  typedef IMAGE_RESOURCE_DATA_ENTRY *PIMAGE_RESOURCE_DATA_ENTRY; //Pointer
  typedef struct IMAGE_RESOURCE_DIRECTORY {
    DWORD Characteristics;
    DWORD TimeDateStamp;
    WORD MajorVersion;
    WORD MinorVersion;
    WORD NumberOfNamedEntries;
    WORD NumberOfIdEntries;
  } IMAGE_RESOURCE_DIRECTORY;
  typedef IMAGE_RESOURCE_DIRECTORY *PIMAGE_RESOURCE_DIRECTORY; //Pointer
  typedef UINT KEY_INFORMATION_CLASS; //Alias
  static const KEY_INFORMATION_CLASS KeyBasicInformation = 0;
  static const KEY_INFORMATION_CLASS KeyNodeInformation = 1;
  static const KEY_INFORMATION_CLASS KeyFullInformation = 2;
  static const KEY_INFORMATION_CLASS KeyNameInformation = 3;
  static const KEY_INFORMATION_CLASS KeyCachedInformation = 4;
  static const KEY_INFORMATION_CLASS KeyFlagsInformation = 5;
  static const KEY_INFORMATION_CLASS KeyVirtualizationInformation = 6;
  static const KEY_INFORMATION_CLASS KeyHandleTagsInformation = 7;
  typedef UINT KEY_VALUE_INFORMATION_CLASS; //Alias
  static const KEY_VALUE_INFORMATION_CLASS KeyValueBasicInformation = 0;
  static const KEY_VALUE_INFORMATION_CLASS KeyValueFullInformation = 1;
  static const KEY_VALUE_INFORMATION_CLASS KeyValuePartialInformation = 2;
  static const KEY_VALUE_INFORMATION_CLASS KeyValueFullInformationAlign64 = 2;
  static const KEY_VALUE_INFORMATION_CLASS KeyValuePartialInformationAlign64 = 2;
  typedef UINT PLUGPLAY_CONTROL_CLASS; //Alias
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlEnumerateDevice = 0;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlRegisterNewDevice = 1;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlDeregisterDevice = 2;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlInitializeDevice = 3;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlStartDevice = 4;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlUnlockDevice = 5;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlQueryAndRemoveDevice = 6;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlUserResponse = 7;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlGenerateLegacyDevice = 8;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlGetInterfaceDeviceList = 9;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlProperty = 10;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlDeviceClassAssociation = 11;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlGetRelatedDevice = 12;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlGetInterfaceDeviceAlias = 13;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlDeviceStatus = 14;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlGetDeviceDepth = 15;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlQueryDeviceRelations = 16;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlTargetDeviceRelation = 17;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlQueryConflictList = 18;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlRetrieveDock = 19;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlResetDevice = 20;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlHaltDevice = 21;
  static const PLUGPLAY_CONTROL_CLASS PlugPlayControlGetBlockedDriverList = 22;
  typedef UINT KEY_SET_INFORMATION_CLASS; //Alias
  static const KEY_SET_INFORMATION_CLASS KeyWriteTimeInformation = 0;
  static const KEY_SET_INFORMATION_CLASS KeyWow64FlagsInformation = 1;
  static const KEY_SET_INFORMATION_CLASS KeyControlFlagsInformation = 2;
  static const KEY_SET_INFORMATION_CLASS KeySetVirtualizationInformation = 3;
  static const KEY_SET_INFORMATION_CLASS KeySetDebugInformation = 4;
  static const KEY_SET_INFORMATION_CLASS KeySetHandleTagsInformation = 5;
  typedef UINT DEBUGOBJECTINFOCLASS; //Alias
  static const DEBUGOBJECTINFOCLASS DebugObjectUnusedInformation = 0;
  static const DEBUGOBJECTINFOCLASS DebugObjectKillProcessOnExitInformation = 1;
  typedef UINT TIMER_TYPE; //Alias
  static const TIMER_TYPE NotificationTimer = 0;
  static const TIMER_TYPE SynchronizationTimer = 1;
  typedef UINT EVENT_INFORMATION_CLASS; //Alias
  static const EVENT_INFORMATION_CLASS EventBasicInformation = 0;
  typedef UINT ATOM_INFORMATION_CLASS; //Alias
  static const ATOM_INFORMATION_CLASS AtomBasicInformation = 0;
  static const ATOM_INFORMATION_CLASS AtomTableInformation = 0;
  typedef UINT MUTANT_INFORMATION_CLASS; //Alias
  static const MUTANT_INFORMATION_CLASS MutantBasicInformation = 0;
  static const MUTANT_INFORMATION_CLASS MutantOwnerInformation = 0;
  typedef UINT SEMAPHORE_INFORMATION_CLASS; //Alias
  static const SEMAPHORE_INFORMATION_CLASS SemaphoreBasicInformation = 0;
  typedef UINT TIMER_INFORMATION_CLASS; //Alias
  static const TIMER_INFORMATION_CLASS TimerBasicInformation = 0;
  typedef UINT SHUTDOWN_ACTION; //Alias
  static const SHUTDOWN_ACTION ShutdownNoReboot = 0;
  static const SHUTDOWN_ACTION ShutdownReboot = 1;
  static const SHUTDOWN_ACTION ShutdownPowerOff = 2;
  typedef UINT FILE_INFORMATION_CLASS; //Alias
  static const FILE_INFORMATION_CLASS FileDirectoryInformation = 1;
  static const FILE_INFORMATION_CLASS FileFullDirectoryInformation = 2;
  static const FILE_INFORMATION_CLASS FileBothDirectoryInformation = 3;
  static const FILE_INFORMATION_CLASS FileBasicInformation = 4;
  static const FILE_INFORMATION_CLASS FileStandardInformation = 5;
  static const FILE_INFORMATION_CLASS FileInternalInformation = 6;
  static const FILE_INFORMATION_CLASS FileEaInformation = 7;
  static const FILE_INFORMATION_CLASS FileAccessInformation = 8;
  static const FILE_INFORMATION_CLASS FileNameInformation = 9;
  static const FILE_INFORMATION_CLASS FileRenameInformation = 10;
  static const FILE_INFORMATION_CLASS FileLinkInformation = 11;
  static const FILE_INFORMATION_CLASS FileNamesInformation = 12;
  static const FILE_INFORMATION_CLASS FileDispositionInformation = 13;
  static const FILE_INFORMATION_CLASS FilePositionInformation = 14;
  static const FILE_INFORMATION_CLASS FileFullEaInformation = 15;
  static const FILE_INFORMATION_CLASS FileModeInformation = 16;
  static const FILE_INFORMATION_CLASS FileAlignmentInformation = 17;
  static const FILE_INFORMATION_CLASS FileAllInformation = 18;
  static const FILE_INFORMATION_CLASS FileAllocationInformation = 19;
  static const FILE_INFORMATION_CLASS FileEndOfFileInformation = 20;
  static const FILE_INFORMATION_CLASS FileAlternateNameInformation = 21;
  static const FILE_INFORMATION_CLASS FileStreamInformation = 22;
  static const FILE_INFORMATION_CLASS FilePipeInformation = 23;
  static const FILE_INFORMATION_CLASS FilePipeLocalInformation = 24;
  static const FILE_INFORMATION_CLASS FilePipeRemoteInformation = 25;
  static const FILE_INFORMATION_CLASS FileMailslotQueryInformation = 26;
  static const FILE_INFORMATION_CLASS FileMailslotSetInformation = 27;
  static const FILE_INFORMATION_CLASS FileCompressionInformation = 28;
  static const FILE_INFORMATION_CLASS FileObjectIdInformation = 29;
  static const FILE_INFORMATION_CLASS FileCompletionInformation = 30;
  static const FILE_INFORMATION_CLASS FileMoveClusterInformation = 31;
  static const FILE_INFORMATION_CLASS FileQuotaInformation = 32;
  static const FILE_INFORMATION_CLASS FileReparsePointInformation = 33;
  static const FILE_INFORMATION_CLASS FileNetworkOpenInformation = 34;
  static const FILE_INFORMATION_CLASS FileAttributeTagInformation = 35;
  static const FILE_INFORMATION_CLASS FileTrackingInformation = 36;
  static const FILE_INFORMATION_CLASS FileIdBothDirectoryInformation = 37;
  static const FILE_INFORMATION_CLASS FileIdFullDirectoryInformation = 38;
  static const FILE_INFORMATION_CLASS FileValidDataLengthInformation = 39;
  static const FILE_INFORMATION_CLASS FileShortNameInformation = 40;
  static const FILE_INFORMATION_CLASS FileIoCompletionNotificationInformation = 41;
  static const FILE_INFORMATION_CLASS FileIoStatusBlockRangeInformation = 42;
  static const FILE_INFORMATION_CLASS FileIoPriorityHintInformation = 43;
  static const FILE_INFORMATION_CLASS FileSfioReserveInformation = 44;
  static const FILE_INFORMATION_CLASS FileSfioVolumeInformation = 45;
  static const FILE_INFORMATION_CLASS FileHardLinkInformation = 46;
  static const FILE_INFORMATION_CLASS FileProcessIdsUsingFileInformation = 47;
  static const FILE_INFORMATION_CLASS FileNormalizedNameInformation = 48;
  static const FILE_INFORMATION_CLASS FileNetworkPhysicalNameInformation = 49;
  static const FILE_INFORMATION_CLASS FileIdGlobalTxDirectoryInformation = 50;
  static const FILE_INFORMATION_CLASS FileIsRemoteDeviceInformation = 51;
  static const FILE_INFORMATION_CLASS FileAttributeCacheInformation = 52;
  static const FILE_INFORMATION_CLASS FileNumaNodeInformation = 53;
  static const FILE_INFORMATION_CLASS FileStandardLinkInformation = 54;
  static const FILE_INFORMATION_CLASS FileRemoteProtocolInformation = 55;
  static const FILE_INFORMATION_CLASS FileRenameInformationBypassAccessCheck = 56;
  static const FILE_INFORMATION_CLASS FileLinkInformationBypassAccessCheck = 57;
  static const FILE_INFORMATION_CLASS FileIntegrityStreamInformation = 58;
  static const FILE_INFORMATION_CLASS FileVolumeNameInformation = 59;
  typedef UINT IO_COMPLETION_INFORMATION_CLASS; //Alias
  static const IO_COMPLETION_INFORMATION_CLASS IoCompletionBasicInformation = 0;
  typedef UINT FS_INFORMATION_CLASS; //Alias
  static const FS_INFORMATION_CLASS FileFsVolumeInformation = 1;
  static const FS_INFORMATION_CLASS FileFsLabelInformation = 2;
  static const FS_INFORMATION_CLASS FileFsSizeInformation = 3;
  static const FS_INFORMATION_CLASS FileFsDeviceInformation = 4;
  static const FS_INFORMATION_CLASS FileFsAttributeInformation = 5;
  static const FS_INFORMATION_CLASS FileFsControlInformation = 6;
  static const FS_INFORMATION_CLASS FileFsFullSizeInformation = 7;
  static const FS_INFORMATION_CLASS FileFsObjectIdInformation = 8;
  static const FS_INFORMATION_CLASS FileFsDriverPathInformation = 9;
  static const FS_INFORMATION_CLASS FileFsVolumeFlagsInformation = 10;
  static const FS_INFORMATION_CLASS FileFsSectorSizeInformation = 11;
  typedef UINT SYSDBG_COMMAND; //Alias
  static const SYSDBG_COMMAND SysDbgQueryModuleInformation = 0;
  static const SYSDBG_COMMAND SysDbgQueryTraceInformation = 1;
  static const SYSDBG_COMMAND SysDbgSetTracepoint = 2;
  static const SYSDBG_COMMAND SysDbgSetSpecialCall = 3;
  static const SYSDBG_COMMAND SysDbgClearSpecialCalls = 4;
  static const SYSDBG_COMMAND SysDbgQuerySpecialCalls = 5;
  static const SYSDBG_COMMAND SysDbgBreakPoint = 6;
  static const SYSDBG_COMMAND SysDbgQueryVersion = 7;
  static const SYSDBG_COMMAND SysDbgReadVirtual = 8;
  static const SYSDBG_COMMAND SysDbgWriteVirtual = 9;
  static const SYSDBG_COMMAND SysDbgReadPhysical = 10;
  static const SYSDBG_COMMAND SysDbgWritePhysical = 11;
  static const SYSDBG_COMMAND SysDbgReadControlSpace = 12;
  static const SYSDBG_COMMAND SysDbgWriteControlSpace = 13;
  static const SYSDBG_COMMAND SysDbgReadIoSpace = 14;
  static const SYSDBG_COMMAND SysDbgWriteIoSpace = 15;
  static const SYSDBG_COMMAND SysDbgReadMsr = 16;
  static const SYSDBG_COMMAND SysDbgWriteMsr = 17;
  static const SYSDBG_COMMAND SysDbgReadBusData = 18;
  static const SYSDBG_COMMAND SysDbgWriteBusData = 19;
  static const SYSDBG_COMMAND SysDbgCheckLowMemory = 20;
  static const SYSDBG_COMMAND SysDbgEnableKernelDebugger = 21;
  static const SYSDBG_COMMAND SysDbgDisableKernelDebugger = 22;
  static const SYSDBG_COMMAND SysDbgGetAutoKdEnable = 23;
  static const SYSDBG_COMMAND SysDbgSetAutoKdEnable = 24;
  static const SYSDBG_COMMAND SysDbgGetPrintBufferSize = 25;
  static const SYSDBG_COMMAND SysDbgSetPrintBufferSize = 26;
  static const SYSDBG_COMMAND SysDbgGetKdUmExceptionEnable = 27;
  static const SYSDBG_COMMAND SysDbgSetKdUmExceptionEnable = 28;
  static const SYSDBG_COMMAND SysDbgGetTriageDump = 29;
  static const SYSDBG_COMMAND SysDbgGetKdBlockEnable = 30;
  static const SYSDBG_COMMAND SysDbgSetKdBlockEnable = 31;
  static const SYSDBG_COMMAND SysDbgRegisterForUmBreakInfo = 32;
  static const SYSDBG_COMMAND SysDbgGetUmBreakPid = 33;
  static const SYSDBG_COMMAND SysDbgClearUmBreakPid = 34;
  static const SYSDBG_COMMAND SysDbgGetUmAttachPid = 35;
  static const SYSDBG_COMMAND SysDbgClearUmAttachPid = 36;
  typedef UINT PORT_INFORMATION_CLASS; //Alias
  static const PORT_INFORMATION_CLASS PortBasicInformation = 0;
  static const PORT_INFORMATION_CLASS PortDumpInformation = 1;
  typedef UINT SECTION_INHERIT; //Alias
  static const SECTION_INHERIT ViewShare = 1;
  static const SECTION_INHERIT ViewUnmap = 2;
  typedef UINT SECTION_INFORMATION_CLASS; //Alias
  static const SECTION_INFORMATION_CLASS SectionBasicInformation = 0;
  static const SECTION_INFORMATION_CLASS SectionImageInformation = 1;
  static const SECTION_INFORMATION_CLASS SectionRelocationInformation = 2;
  typedef UINT MEMORY_INFORMATION_CLASS; //Alias
  static const MEMORY_INFORMATION_CLASS MemoryBasicInformation = 0;
  static const MEMORY_INFORMATION_CLASS MemoryWorkingSetInformation = 1;
  static const MEMORY_INFORMATION_CLASS MemoryMappedFilenameInformation = 2;
  static const MEMORY_INFORMATION_CLASS MemoryRegionInformation = 3;
  static const MEMORY_INFORMATION_CLASS MemoryWorkingSetExInformation = 4;
  typedef UINT OBJECT_INFORMATION_CLASS; //Alias
  static const OBJECT_INFORMATION_CLASS ObjectBasicInformation = 0;
  static const OBJECT_INFORMATION_CLASS ObjectNameInformation = 1;
  static const OBJECT_INFORMATION_CLASS ObjectTypeInformation = 2;
  static const OBJECT_INFORMATION_CLASS ObjectAllTypesInformation = 3;
  static const OBJECT_INFORMATION_CLASS ObjectHandleFlagInformation = 4;
  static const OBJECT_INFORMATION_CLASS ObjectSessionInformation = 5;
  typedef UINT WAIT_TYPE; //Alias
  static const WAIT_TYPE WaitAll = 0;
  static const WAIT_TYPE WaitAny = 1;
  typedef UINT APPHELPCACHESERVICECLASS; //Alias
  static const APPHELPCACHESERVICECLASS ApphelpCacheServiceLookup = 0;
  static const APPHELPCACHESERVICECLASS ApphelpCacheServiceRemove = 1;
  static const APPHELPCACHESERVICECLASS ApphelpCacheServiceUpdate = 2;
  static const APPHELPCACHESERVICECLASS ApphelpCacheServiceFlush = 3;
  static const APPHELPCACHESERVICECLASS ApphelpCacheServiceDump = 4;
  typedef UINT SYSTEM_INFORMATION_CLASS; //Alias
  static const SYSTEM_INFORMATION_CLASS SystemBasicInformation = 0;
  static const SYSTEM_INFORMATION_CLASS SystemProcessorInformation = 1;
  static const SYSTEM_INFORMATION_CLASS SystemPerformanceInformation = 2;
  static const SYSTEM_INFORMATION_CLASS SystemTimeOfDayInformation = 3;
  static const SYSTEM_INFORMATION_CLASS SystemPathInformation = 4;
  static const SYSTEM_INFORMATION_CLASS SystemProcessInformation = 5;
  static const SYSTEM_INFORMATION_CLASS SystemCallCountInformation = 6;
  static const SYSTEM_INFORMATION_CLASS SystemDeviceInformation = 7;
  static const SYSTEM_INFORMATION_CLASS SystemProcessorPerformanceInformation = 8;
  static const SYSTEM_INFORMATION_CLASS SystemFlagsInformation = 9;
  static const SYSTEM_INFORMATION_CLASS SystemCallTimeInformation = 10;
  static const SYSTEM_INFORMATION_CLASS SystemModuleInformation = 11;
  static const SYSTEM_INFORMATION_CLASS SystemLocksInformation = 12;
  static const SYSTEM_INFORMATION_CLASS SystemStackTraceInformation = 13;
  static const SYSTEM_INFORMATION_CLASS SystemPagedPoolInformation = 14;
  static const SYSTEM_INFORMATION_CLASS SystemNonPagedPoolInformation = 15;
  static const SYSTEM_INFORMATION_CLASS SystemHandleInformation = 16;
  static const SYSTEM_INFORMATION_CLASS SystemObjectInformation = 17;
  static const SYSTEM_INFORMATION_CLASS SystemPageFileInformation = 18;
  static const SYSTEM_INFORMATION_CLASS SystemVdmInstemulInformation = 19;
  static const SYSTEM_INFORMATION_CLASS SystemVdmBopInformation = 20;
  static const SYSTEM_INFORMATION_CLASS SystemFileCacheInformation = 21;
  static const SYSTEM_INFORMATION_CLASS SystemPoolTagInformation = 22;
  static const SYSTEM_INFORMATION_CLASS SystemInterruptInformation = 23;
  static const SYSTEM_INFORMATION_CLASS SystemDpcBehaviorInformation = 24;
  static const SYSTEM_INFORMATION_CLASS SystemFullMemoryInformation = 25;
  static const SYSTEM_INFORMATION_CLASS SystemLoadGdiDriverInformation = 26;
  static const SYSTEM_INFORMATION_CLASS SystemUnloadGdiDriverInformation = 27;
  static const SYSTEM_INFORMATION_CLASS SystemTimeAdjustmentInformation = 28;
  static const SYSTEM_INFORMATION_CLASS SystemSummaryMemoryInformation = 29;
  static const SYSTEM_INFORMATION_CLASS SystemMirrorMemoryInformation = 30;
  static const SYSTEM_INFORMATION_CLASS SystemPerformanceTraceInformation = 31;
  static const SYSTEM_INFORMATION_CLASS SystemObsolete0 = 32;
  static const SYSTEM_INFORMATION_CLASS SystemExceptionInformation = 33;
  static const SYSTEM_INFORMATION_CLASS SystemCrashDumpStateInformation = 34;
  static const SYSTEM_INFORMATION_CLASS SystemKernelDebuggerInformation = 35;
  static const SYSTEM_INFORMATION_CLASS SystemContextSwitchInformation = 36;
  static const SYSTEM_INFORMATION_CLASS SystemRegistryQuotaInformation = 37;
  static const SYSTEM_INFORMATION_CLASS SystemExtendServiceTableInformation = 38;
  static const SYSTEM_INFORMATION_CLASS SystemPrioritySeperation = 39;
  static const SYSTEM_INFORMATION_CLASS SystemVerifierAddDriverInformation = 40;
  static const SYSTEM_INFORMATION_CLASS SystemVerifierRemoveDriverInformation = 41;
  static const SYSTEM_INFORMATION_CLASS SystemProcessorIdleInformation = 42;
  static const SYSTEM_INFORMATION_CLASS SystemLegacyDriverInformation = 43;
  static const SYSTEM_INFORMATION_CLASS SystemCurrentTimeZoneInformation = 44;
  static const SYSTEM_INFORMATION_CLASS SystemLookasideInformation = 45;
  static const SYSTEM_INFORMATION_CLASS SystemTimeSlipNotification = 46;
  static const SYSTEM_INFORMATION_CLASS SystemSessionCreate = 47;
  static const SYSTEM_INFORMATION_CLASS SystemSessionDetach = 48;
  static const SYSTEM_INFORMATION_CLASS SystemSessionInformation = 49;
  static const SYSTEM_INFORMATION_CLASS SystemRangeStartInformation = 50;
  static const SYSTEM_INFORMATION_CLASS SystemVerifierInformation = 51;
  static const SYSTEM_INFORMATION_CLASS SystemVerifierThunkExtend = 52;
  static const SYSTEM_INFORMATION_CLASS SystemSessionProcessInformation = 53;
  static const SYSTEM_INFORMATION_CLASS SystemLoadGdiDriverInSystemSpace = 54;
  static const SYSTEM_INFORMATION_CLASS SystemNumaProcessorMap = 55;
  static const SYSTEM_INFORMATION_CLASS SystemPrefetcherInformation = 56;
  static const SYSTEM_INFORMATION_CLASS SystemExtendedProcessInformation = 57;
  static const SYSTEM_INFORMATION_CLASS SystemRecommendedSharedDataAlignment = 58;
  static const SYSTEM_INFORMATION_CLASS SystemComPlusPackage = 59;
  static const SYSTEM_INFORMATION_CLASS SystemNumaAvailableMemory = 60;
  static const SYSTEM_INFORMATION_CLASS SystemProcessorPowerInformation = 61;
  static const SYSTEM_INFORMATION_CLASS SystemEmulationBasicInformation = 62;
  static const SYSTEM_INFORMATION_CLASS SystemEmulationProcessorInformation = 63;
  static const SYSTEM_INFORMATION_CLASS SystemExtendedHandleInformation = 64;
  static const SYSTEM_INFORMATION_CLASS SystemLostDelayedWriteInformation = 65;
  static const SYSTEM_INFORMATION_CLASS SystemBigPoolInformation = 66;
  static const SYSTEM_INFORMATION_CLASS SystemSessionPoolTagInformation = 67;
  static const SYSTEM_INFORMATION_CLASS SystemSessionMappedViewInformation = 68;
  static const SYSTEM_INFORMATION_CLASS SystemHotpatchInformation = 69;
  static const SYSTEM_INFORMATION_CLASS SystemObjectSecurityMode = 70;
  static const SYSTEM_INFORMATION_CLASS SystemWatchdogTimerHandler = 71;
  static const SYSTEM_INFORMATION_CLASS SystemWatchdogTimerInformation = 72;
  static const SYSTEM_INFORMATION_CLASS SystemLogicalProcessorInformation = 73;
  static const SYSTEM_INFORMATION_CLASS SystemWow64SharedInformationObsolete = 74;
  static const SYSTEM_INFORMATION_CLASS SystemRegisterFirmwareTableInformationHandler = 75;
  static const SYSTEM_INFORMATION_CLASS SystemFirmwareTableInformation = 76;
  static const SYSTEM_INFORMATION_CLASS SystemModuleInformationEx = 77;
  static const SYSTEM_INFORMATION_CLASS SystemVerifierTriageInformation = 78;
  static const SYSTEM_INFORMATION_CLASS SystemSuperfetchInformation = 79;
  static const SYSTEM_INFORMATION_CLASS SystemMemoryListInformation = 80;
  static const SYSTEM_INFORMATION_CLASS SystemFileCacheInformationEx = 81;
  static const SYSTEM_INFORMATION_CLASS SystemThreadPriorityClientIdInformation = 82;
  static const SYSTEM_INFORMATION_CLASS SystemProcessorIdleCycleTimeInformation = 83;
  static const SYSTEM_INFORMATION_CLASS SystemVerifierCancellationInformation = 84;
  static const SYSTEM_INFORMATION_CLASS SystemProcessorPowerInformationEx = 85;
  static const SYSTEM_INFORMATION_CLASS SystemRefTraceInformation = 86;
  static const SYSTEM_INFORMATION_CLASS SystemSpecialPoolInformation = 87;
  static const SYSTEM_INFORMATION_CLASS SystemProcessIdInformation = 88;
  static const SYSTEM_INFORMATION_CLASS SystemErrorPortInformation = 89;
  static const SYSTEM_INFORMATION_CLASS SystemBootEnvironmentInformation = 90;
  static const SYSTEM_INFORMATION_CLASS SystemHypervisorInformation = 91;
  static const SYSTEM_INFORMATION_CLASS SystemVerifierInformationEx = 92;
  static const SYSTEM_INFORMATION_CLASS SystemTimeZoneInformation = 93;
  static const SYSTEM_INFORMATION_CLASS SystemImageFileExecutionOptionsInformation = 94;
  static const SYSTEM_INFORMATION_CLASS SystemCoverageInformation = 95;
  static const SYSTEM_INFORMATION_CLASS SystemPrefetchPatchInformation = 96;
  static const SYSTEM_INFORMATION_CLASS SystemVerifierFaultsInformation = 97;
  static const SYSTEM_INFORMATION_CLASS SystemSystemPartitionInformation = 98;
  static const SYSTEM_INFORMATION_CLASS SystemSystemDiskInformation = 99;
  static const SYSTEM_INFORMATION_CLASS SystemProcessorPerformanceDistribution = 100;
  static const SYSTEM_INFORMATION_CLASS SystemNumaProximityNodeInformation = 101;
  static const SYSTEM_INFORMATION_CLASS SystemDynamicTimeZoneInformation = 102;
  static const SYSTEM_INFORMATION_CLASS SystemCodeIntegrityInformation = 103;
  static const SYSTEM_INFORMATION_CLASS SystemProcessorMicrocodeUpdateInformation = 104;
  static const SYSTEM_INFORMATION_CLASS SystemProcessorBrandString = 105;
  static const SYSTEM_INFORMATION_CLASS SystemVirtualAddressInformation = 106;
  static const SYSTEM_INFORMATION_CLASS SystemLogicalProcessorAndGroupInformation = 107;
  static const SYSTEM_INFORMATION_CLASS SystemProcessorCycleTimeInformation = 108;
  static const SYSTEM_INFORMATION_CLASS SystemStoreInformation = 109;
  static const SYSTEM_INFORMATION_CLASS SystemRegistryAppendString = 110;
  static const SYSTEM_INFORMATION_CLASS SystemAitSamplingValue = 111;
  static const SYSTEM_INFORMATION_CLASS SystemVhdBootInformation = 112;
  static const SYSTEM_INFORMATION_CLASS SystemCpuQuotaInformation = 113;
  static const SYSTEM_INFORMATION_CLASS SystemNativeBasicInformation = 114;
  static const SYSTEM_INFORMATION_CLASS SystemErrorPortTimeouts = 115;
  static const SYSTEM_INFORMATION_CLASS SystemLowPriorityIoInformation = 116;
  static const SYSTEM_INFORMATION_CLASS SystemBootEntropyInformation = 117;
  static const SYSTEM_INFORMATION_CLASS SystemVerifierCountersInformation = 118;
  static const SYSTEM_INFORMATION_CLASS SystemPagedPoolInformationEx = 119;
  static const SYSTEM_INFORMATION_CLASS SystemSystemPtesInformationEx = 120;
  static const SYSTEM_INFORMATION_CLASS SystemNodeDistanceInformation = 121;
  static const SYSTEM_INFORMATION_CLASS SystemAcpiAuditInformation = 122;
  static const SYSTEM_INFORMATION_CLASS SystemBasicPerformanceInformation = 123;
  static const SYSTEM_INFORMATION_CLASS SystemQueryPerformanceCounterInformation = 124;
  static const SYSTEM_INFORMATION_CLASS SystemSessionBigPoolInformation = 125;
  static const SYSTEM_INFORMATION_CLASS SystemBootGraphicsInformation = 126;
  static const SYSTEM_INFORMATION_CLASS SystemScrubPhysicalMemoryInformation = 127;
  static const SYSTEM_INFORMATION_CLASS SystemBadPageInformation = 128;
  static const SYSTEM_INFORMATION_CLASS SystemProcessorProfileControlArea = 129;
  static const SYSTEM_INFORMATION_CLASS SystemCombinePhysicalMemoryInformation = 130;
  static const SYSTEM_INFORMATION_CLASS SystemEntropyInterruptTimingCallback = 131;
  static const SYSTEM_INFORMATION_CLASS SystemConsoleInformation = 132;
  static const SYSTEM_INFORMATION_CLASS SystemPlatformBinaryInformation = 133;
  static const SYSTEM_INFORMATION_CLASS SystemThrottleNotificationInformation = 134;
  static const SYSTEM_INFORMATION_CLASS SystemHypervisorProcessorCountInformation = 135;
  static const SYSTEM_INFORMATION_CLASS SystemDeviceDataInformation = 136;
  static const SYSTEM_INFORMATION_CLASS SystemDeviceDataEnumerationInformation = 137;
  static const SYSTEM_INFORMATION_CLASS SystemMemoryTopologyInformation = 138;
  static const SYSTEM_INFORMATION_CLASS SystemMemoryChannelInformation = 139;
  static const SYSTEM_INFORMATION_CLASS SystemBootLogoInformation = 140;
  typedef ULONG NtCreateDisposition; //Alias
  static const NtCreateDisposition FILE_SUPERSEDE = 0x00000000;
  static const NtCreateDisposition FILE_OPEN = 0x00000001;
  static const NtCreateDisposition FILE_CREATE = 0x00000002;
  static const NtCreateDisposition FILE_OPEN_IF = 0x00000003;
  static const NtCreateDisposition FILE_OVERWRITE = 0x00000004;
  static const NtCreateDisposition FILE_OVERWRITE_IF = 0x00000005;
  typedef ULONG NtCreateOptions; //Alias
]]
if ffi.arch == 'x86' then ffi.cdef[[
]]
end
ffi.cdef[[
]]
if ffi.arch == 'x64' then ffi.cdef[[
]]
end
ffi.cdef[[
  typedef struct PEB_LDR_DATA {
    ULONG Length;
    BOOLEAN Initialized;
    HANDLE SsHandle;
    LIST_ENTRY InLoadOrderModuleList;
    LIST_ENTRY InMemoryOrderModuleList;
    LIST_ENTRY InInitializationOrderModuleList;
    PVOID EntryInProgress;
    BOOLEAN ShutdownInProgress;
    HANDLE ShutdownThreadId;
  } PEB_LDR_DATA;
  typedef PEB_LDR_DATA *PPEB_LDR_DATA; //Pointer
  typedef union PEB_u1 {
    ULONG CrossProcessFlags;
    ULONG EnvironmentUpdateCount;
  } PEB_u1;
  typedef union PEB_u2 {
    PVOID KernelCallbackTable;
    PVOID UserSharedInfoPtr;
  } PEB_u2;
  typedef struct PEB {
    BOOLEAN InheritedAddressSpace;
    BOOLEAN ReadImageFileExecOptions;
    BOOLEAN BeingDebugged;
    BOOLEAN BitField;
    HANDLE Mutant;
    HMODULE ImageBaseAddress;
    PPEB_LDR_DATA LdrData;
    RTL_USER_PROCESS_PARAMETERS* ProcessParameters;
    PVOID SubSystemData;
    HANDLE ProcessHeap;
    PRTL_CRITICAL_SECTION FastPebLock;
    PVOID AtlThunkSListPtr;
    PVOID IFEOKey;
    PEB_u1 ;
    PEB_u2 ;
    ULONG SystemReserved_1_;
    ULONG AtlThunkSListPtr32;
    PVOID ApiSetMap;
    ULONG TlsExpansionCounter;
    PRTL_BITMAP TlsBitmap;
    ULONG TlsBitmapBits_2_;
    PVOID ReadOnlySharedMemoryBase;
    PVOID HotpatchInformation;
    PVOID* ReadOnlyStaticServerData;
    PVOID AnsiCodePageData;
    PVOID OemCodePageData;
    PVOID UnicodeCaseTableData;
    ULONG NumberOfProcessors;
    ULONG NtGlobalFlag;
    LARGE_INTEGER CriticalSectionTimeout;
    SIZE_T HeapSegmentReserve;
    SIZE_T HeapSegmentCommit;
    SIZE_T HeapDeCommitTotalFreeThreshold;
    SIZE_T HeapDeCommitFreeBlockThreshold;
    ULONG NumberOfHeaps;
    ULONG MaximumNumberOfHeaps;
    PVOID* ProcessHeaps;
    PVOID GdiSharedHandleTable;
    PVOID ProcessStarterHelper;
    ULONG GdiDCAttributeList;
    PRTL_CRITICAL_SECTION LoaderLock;
    ULONG OSMajorVersion;
    ULONG OSMinorVersion;
    USHORT OSBuildNumber;
    USHORT OSCSDVersion;
    ULONG OSPlatformId;
    ULONG ImageSubSystem;
    ULONG ImageSubSystemMajorVersion;
    ULONG ImageSubSystemMinorVersion;
    ULONG_PTR ImageProcessAffinityMask;
    GDI_HANDLE_BUFFER GdiHandleBuffer;
    PVOID PostProcessInitRoutine;
    PRTL_BITMAP TlsExpansionBitmap;
    ULONG TlsExpansionBitmapBits_32_;
    ULONG SessionId;
    ULARGE_INTEGER AppCompatFlags;
    ULARGE_INTEGER AppCompatFlagsUser;
    PVOID pShimData;
    PVOID AppCompatInfo;
    UNICODE_STRING CSDVersion;
    PVOID ActivationContextData;
    PVOID ProcessAssemblyStorageMap;
    PVOID SystemDefaultActivationContextData;
    PVOID SystemAssemblyStorageMap;
    SIZE_T MinimumStackCommit;
    PVOID* FlsCallback;
    LIST_ENTRY FlsListHead;
    PVOID FlsBitmap;
    ULONG FlsBitmapBits_4_;
    ULONG FlsHighIndex;
    PVOID WerRegistrationData;
    PVOID WerShipAssertPtr;
    PVOID pContextData;
    PVOID pImageHeaderHash;
    ULONG TracingFlags;
    ULONG SpareTracingBits;
  } PEB;
  typedef PEB *PPEB; //Pointer
  typedef struct EXCEPTION_REGISTRATION_RECORD {
    LPVOID Next;
    PEXCEPTION_ROUTINE Handler;
  } EXCEPTION_REGISTRATION_RECORD;
  typedef union NT_TIB_u {
    PVOID FiberData;
    DWORD Version;
  } NT_TIB_u;
  typedef struct NT_TIB {
    EXCEPTION_REGISTRATION_RECORD* ExceptionList;
    PVOID StackBase;
    PVOID StackLimit;
    PVOID SubSystemTib;
    NT_TIB_u ;
    PVOID ArbitraryUserPointer;
    LPVOID Self;
  } NT_TIB;
  typedef struct GDI_TEB_BATCH {
    ULONG Offset;
    HANDLE HDC;
    ULONG Buffer_GDI_BATCH_BUFFER_SIZE_;
  } GDI_TEB_BATCH;
  typedef struct TEB_ACTIVE_FRAME_CONTEXT {
    ULONG Flags;
    PSTR FrameName;
  } TEB_ACTIVE_FRAME_CONTEXT;
  typedef TEB_ACTIVE_FRAME_CONTEXT *PTEB_ACTIVE_FRAME_CONTEXT; //Pointer
  typedef struct TEB_ACTIVE_FRAME {
    ULONG Flags;
    LPVOID Previous;
    PTEB_ACTIVE_FRAME_CONTEXT Context;
  } TEB_ACTIVE_FRAME;
  typedef TEB_ACTIVE_FRAME *PTEB_ACTIVE_FRAME; //Pointer
  typedef struct TEB_u1_s {
    UCHAR ReservedPad0;
    UCHAR ReservedPad2;
    UCHAR ReservedPad2;
    UCHAR IdealProcessor;
  } TEB_u1_s;
  typedef union TEB_u1 {
    PROCESSOR_NUMBER CurrentIdealProcessor;
    ULONG IdealProcessorValue;
    TEB_u1_s ;
  } TEB_u1;
]]
if ffi.arch == 'x86' then ffi.cdef[[
  typedef struct TEB {
    NT_TIB Tib;
    PVOID EnvironmentPointer;
    CLIENT_ID ClientId;
    PVOID ActiveRpcHandle;
    PVOID ThreadLocalStoragePointer;
    PPEB Peb;
    ULONG LastErrorValue;
    ULONG CountOfOwnedCriticalSections;
    PVOID CsrClientThread;
    PVOID Win32ThreadInfo;
    ULONG User32Reserved_26_;
    ULONG UserReserved_5_;
    PVOID WOW32Reserved;
    LCID CurrentLocale;
    ULONG FpSoftwareStatusRegister;
    PVOID SystemReserved1_54_;
    NTSTATUS ExceptionCode;
    PVOID ActivationContextStackPointer;
    UCHAR SpareBytes_36_;
    ULONG TxFsContext;
    GDI_TEB_BATCH GdiTebBatch;
    CLIENT_ID RealClientId;
    HANDLE GdiCachedProcessHandle;
    ULONG GdiClientPID;
    ULONG GdiClientTID;
    PVOID GdiThreadLocaleInfo;
    ULONG_PTR Win32ClientInfo_62_;
    PVOID glDispatchTable_233_;
    ULONG_PTR glReserved1_29_;
    PVOID glReserved2;
    PVOID glSectionInfo;
    PVOID glSection;
    PVOID glTable;
    PVOID glCurrentRC;
    PVOID glContext;
    NTSTATUS LastStatusValue;
    UNICODE_STRING StaticUnicodeString;
    WCHAR StaticUnicodeBuffer_261_;
    PVOID DeallocationStack;
    PVOID TlsSlots_64_;
    LIST_ENTRY TlsLinks;
    PVOID Vdm;
    PVOID ReservedForNtRpc;
    PVOID DbgSsReserved_2_;
    ULONG HardErrorMode;
    PVOID Instrumentation_9_;
    GUID ActivityId;
    PVOID SubProcessTag;
    PVOID EtwLocalData;
    PVOID EtwTraceData;
    PVOID WinSockData;
    ULONG GdiBatchCount;
    TEB_u1 ;
    ULONG GuaranteedStackBytes;
    PVOID ReservedForPerf;
    PVOID ReservedForOle;
    ULONG WaitingOnLoaderLock;
    PVOID SavedPriorityState;
    ULONG_PTR ReservedForCodeCoverage;
    PVOID ThreadPoolData;
    PVOID* TlsExpansionSlots;
    ULONG MuiGeneration;
    ULONG IsImpersonating;
    PVOID NlsCache;
    PVOID pShimData;
    ULONG HeapVirtualAffinity;
    HANDLE CurrentTransactionHandle;
    PTEB_ACTIVE_FRAME ActiveFrame;
    PVOID FlsData;
    PVOID PreferredLanguages;
    PVOID UserPrefLanguages;
    PVOID MergedPrefLanguages;
    ULONG MuiImpersonation;
    USHORT CrossTebFlags;
    USHORT SameTebFlags;
    PVOID TxnScopeEnterCallback;
    PVOID TxnScopeExitCallback;
    PVOID TxnScopeContext;
    ULONG LockCount;
    ULONG SpareUlong0;
    PVOID ResourceRetValue;
    PVOID ReservedForWdf;
  } TEB;
]]
end
ffi.cdef[[
]]
if ffi.arch == 'x64' then ffi.cdef[[
  typedef struct TEB {
    NT_TIB Tib;
    PVOID EnvironmentPointer;
    CLIENT_ID ClientId;
    PVOID ActiveRpcHandle;
    PVOID ThreadLocalStoragePointer;
    PPEB Peb;
    ULONG LastErrorValue;
    ULONG CountOfOwnedCriticalSections;
    PVOID CsrClientThread;
    PVOID Win32ThreadInfo;
    ULONG User32Reserved_26_;
    ULONG UserReserved_5_;
    PVOID WOW32Reserved;
    LCID CurrentLocale;
    ULONG FpSoftwareStatusRegister;
    PVOID SystemReserved1_54_;
    NTSTATUS ExceptionCode;
    PVOID ActivationContextStackPointer;
    UCHAR SpareBytes_24_;
    ULONG TxFsContext;
    GDI_TEB_BATCH GdiTebBatch;
    CLIENT_ID RealClientId;
    HANDLE GdiCachedProcessHandle;
    ULONG GdiClientPID;
    ULONG GdiClientTID;
    PVOID GdiThreadLocaleInfo;
    ULONG_PTR Win32ClientInfo_62_;
    PVOID glDispatchTable_233_;
    ULONG_PTR glReserved1_29_;
    PVOID glReserved2;
    PVOID glSectionInfo;
    PVOID glSection;
    PVOID glTable;
    PVOID glCurrentRC;
    PVOID glContext;
    NTSTATUS LastStatusValue;
    UNICODE_STRING StaticUnicodeString;
    WCHAR StaticUnicodeBuffer_261_;
    PVOID DeallocationStack;
    PVOID TlsSlots_64_;
    LIST_ENTRY TlsLinks;
    PVOID Vdm;
    PVOID ReservedForNtRpc;
    PVOID DbgSsReserved_2_;
    ULONG HardErrorMode;
    PVOID Instrumentation_11_;
    GUID ActivityId;
    PVOID SubProcessTag;
    PVOID EtwLocalData;
    PVOID EtwTraceData;
    PVOID WinSockData;
    ULONG GdiBatchCount;
    TEB_u1 ;
    ULONG GuaranteedStackBytes;
    PVOID ReservedForPerf;
    PVOID ReservedForOle;
    ULONG WaitingOnLoaderLock;
    PVOID SavedPriorityState;
    ULONG_PTR ReservedForCodeCoverage;
    PVOID ThreadPoolData;
    PVOID* TlsExpansionSlots;
    PVOID DeallocationBStore;
    PVOID BStoreLimit;
    ULONG MuiGeneration;
    ULONG IsImpersonating;
    PVOID NlsCache;
    PVOID pShimData;
    ULONG HeapVirtualAffinity;
    HANDLE CurrentTransactionHandle;
    PTEB_ACTIVE_FRAME ActiveFrame;
    PVOID FlsData;
    PVOID PreferredLanguages;
    PVOID UserPrefLanguages;
    PVOID MergedPrefLanguages;
    ULONG MuiImpersonation;
    USHORT CrossTebFlags;
    USHORT SameTebFlags;
    PVOID TxnScopeEnterCallback;
    PVOID TxnScopeExitCallback;
    PVOID TxnScopeContext;
    ULONG LockCount;
    ULONG SpareUlong0;
    PVOID ResourceRetValue;
    PVOID ReservedForWdf;
  } TEB;
]]
end
ffi.cdef[[
  typedef TEB *PTEB; //Pointer
  typedef struct RTL_ATOM_TABLE_ENTRY {
    LPVOID HashLink;
    USHORT HandleIndex;
    USHORT Atom;
    USHORT ReferenceCount;
    UCHAR Flags;
    UCHAR NameLength;
    WCHAR Name_1_;
  } RTL_ATOM_TABLE_ENTRY;
  typedef RTL_ATOM_TABLE_ENTRY *PRTL_ATOM_TABLE_ENTRY; //Pointer
  typedef struct RTL_ATOM_TABLE {
    ULONG Signature;
    RTL_CRITICAL_SECTION CriticalSection;
    RTL_HANDLE_TABLE RtlHandleTable;
    ULONG NumberOfBuckets;
    PRTL_ATOM_TABLE_ENTRY Buckets_1_;
  } RTL_ATOM_TABLE;
  typedef RTL_ATOM_TABLE *PRTL_ATOM_TABLE; //Pointer
  typedef USHORT LPC_TYPE; //Alias
  static const LPC_TYPE LPC_NEW_MESSAGE = 0;
  static const LPC_TYPE LPC_REQUEST = 1;
  static const LPC_TYPE LPC_REPLY = 2;
  static const LPC_TYPE LPC_DATAGRAM = 3;
  static const LPC_TYPE LPC_LOST_REPLY = 4;
  static const LPC_TYPE LPC_PORT_CLOSED = 5;
  static const LPC_TYPE LPC_CLIENT_DIED = 6;
  static const LPC_TYPE LPC_EXCEPTION = 7;
  static const LPC_TYPE LPC_DEBUG_EVENT = 8;
  static const LPC_TYPE LPC_ERROR_EVENT = 9;
  static const LPC_TYPE LPC_CONNECTION_REQUEST = 10;
  static const LPC_TYPE LPC_CONNECTION_REFUSED = 11;
  typedef struct PORT_MESSAGE {
    USHORT DataSize;
    USHORT MessageSize;
    LPC_TYPE MessageType;
    USHORT VirtualRangesOffset;
    CLIENT_ID ClientId;
    ULONG MessageId;
    ULONG SectionSize;
  } PORT_MESSAGE;
  typedef PORT_MESSAGE *PPORT_MESSAGE; //Pointer
  typedef DWORD ElevationFlags; //Alias
  typedef struct THREADEX_DATA {
    SIZE_T cbSize;
    UINT_PTR Unknown1;
    SIZE_T cbClientId;
    PCLIENT_ID ClientId;
    UINT_PTR Unknown2;
    UINT_PTR Unknown3;
    SIZE_T cbppTEB;
    PTEB* ppTeb;
    UINT_PTR Unknown4;
  } THREADEX_DATA;
  typedef THREADEX_DATA *PTHREADEX_DATA; //Pointer
  typedef ULONG REG_NOTIFY_CHANGE_FLAGS; //Alias
  typedef struct RTL_UNLOAD_EVENT_TRACE {
    PVOID BaseAddress;
    SIZE_T SizeOfImage;
    ULONG Sequence;
    ULONG TimeDateStamp;
    ULONG CheckSum;
    WCHAR ImageName_32_;
  } RTL_UNLOAD_EVENT_TRACE;
  enum { RTL_UNLOAD_EVENT_TRACE_NUMBER = 64 };
  typedef HMODULE HMODULE_PVOID; //Alias
  typedef ULONG LDR_LOCK_LOADER_LOCK_FLAG; //Alias
  typedef ULONG LDR_UNLOCK_LOADER_LOCK_FLAG; //Alias
  typedef ULONG LDR_LOCK_LOADER_LOCK_DISPOSITION; //Alias
  static const LDR_LOCK_LOADER_LOCK_DISPOSITION LDR_LOCK_LOADER_LOCK_DISPOSITION_INVALID = 0;
  static const LDR_LOCK_LOADER_LOCK_DISPOSITION LDR_LOCK_LOADER_LOCK_DISPOSITION_LOCK_ACQUIRED = 1;
  static const LDR_LOCK_LOADER_LOCK_DISPOSITION LDR_LOCK_LOADER_LOCK_DISPOSITION_LOCK_NOT_ACQUIRED = 2;
  typedef DWORD LDR_DLL_CHARACTERISTICS; //Alias
  typedef ULONG LDR_ADDREF_DLL_FLAGS; //Alias
  typedef ULONG LDR_GET_DLL_HANDLE_EX_FLAGS; //Alias
  typedef NTSTATUS NT_WAIT_RESULT; //Alias
  typedef REGSAM REGISTRY_ACCESS_MASK; //Alias
  typedef ACCESS_MASK EVENT_ACCESS_MASK; //Alias
  typedef ACCESS_MASK SEMAPHORE_ACCESS_MASK; //Alias
  typedef ACCESS_MASK MUTANT_ACCESS_MASK; //Alias
  typedef ACCESS_MASK IO_COMPLETION_ACCESS_MASK; //Alias
  typedef ACCESS_MASK SECTION_ACCESS_MASK; //Alias
  typedef ACCESS_MASK DIRECTORY_ACCESS_MASK; //Alias
  typedef ACCESS_MASK DEBUG_OBJECT_ACCESS_MASK; //Alias
  typedef ACCESS_MASK PIPE_ACCESS_MASK; //Alias
  typedef ULONG SECTION_ALLOCATION; //Alias
  NTSTATUS                                               NtClearEvent(                                       HANDLE EventHandle);
  NTSTATUS                                               NtCreateEvent(                                      PHANDLE EventHandle, EVENT_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, EVENT_TYPE EventType, BOOLEAN InitialState);
  NTSTATUS                                               NtCreateEventPair(                                  PHANDLE EventPairHandle, ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes);
  NTSTATUS                                               NtCreateKeyedEvent(                                 PHANDLE KeyedEventHandle, EVENT_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, ULONG Flags);
  NTSTATUS                                               NtCreateMutant(                                     PHANDLE MutantHandle, MUTANT_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, BOOLEAN InitialOwner);
  NTSTATUS                                               NtCreateSemaphore(                                  PHANDLE SemaphoreHandle, SEMAPHORE_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, LONG InitialCount, LONG MaximumCount);
  NTSTATUS                                               NtCreateTimer(                                      PHANDLE TimerHandle, ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, TIMER_TYPE TimerType);
  NTSTATUS                                               NtOpenEvent(                                        PHANDLE EventHandle, EVENT_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes);
  NTSTATUS                                               NtOpenKeyedEvent(                                   PHANDLE EventHandle, EVENT_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes);
  NTSTATUS                                               NtOpenEventPair(                                    PHANDLE EventPairHandle, ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes);
  NTSTATUS                                               NtOpenMutant(                                       PHANDLE MutantHandle, MUTANT_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes);
  NTSTATUS                                               NtOpenSemaphore(                                    PHANDLE SemaphoreHandle, SEMAPHORE_ACCESS_MASK DesiredAcces, POBJECT_ATTRIBUTES ObjectAttributes);
  NTSTATUS                                               NtOpenTimer(                                        PHANDLE TimerHandle, ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes);
  NTSTATUS                                               NtPulseEvent(                                       HANDLE EventHandle, PLONG PulseCount);
  NTSTATUS                                               NtQueryEvent(                                       HANDLE EventHandle, EVENT_INFORMATION_CLASS EventInformationClass, PVOID EventInformation, ULONG EventInformationLength, PULONG ReturnLength);
  NTSTATUS                                               NtQueryMutant(                                      HANDLE MutantHandle, MUTANT_INFORMATION_CLASS MutantInformationClass, PVOID MutantInformation, ULONG Length, PULONG ResultLength);
  NTSTATUS                                               NtQuerySemaphore(                                   HANDLE SemaphoreHandle, SEMAPHORE_INFORMATION_CLASS SemaphoreInformationClass, PVOID SemaphoreInformation, ULONG Length, PULONG ReturnLength);
  NTSTATUS                                               NtQueryTimer(                                       HANDLE TimerHandle, TIMER_INFORMATION_CLASS TimerInformationClass, PVOID TimerInformation, ULONG Length, PULONG ResultLength);
  NTSTATUS                                               NtReleaseMutant(                                    HANDLE MutantHandle, PLONG ReleaseCount);
  NTSTATUS                                               NtReleaseKeyedEvent(                                HANDLE EventHandle, PVOID Key, BOOLEAN Alertable, PLARGE_INTEGER Timeout);
  NTSTATUS                                               NtReleaseSemaphore(                                 HANDLE SemaphoreHandle, LONG ReleaseCount, PLONG PreviousCount);
  NTSTATUS                                               NtResetEvent(                                       HANDLE EventHandle, PLONG NumberOfWaitingThreads);
  NTSTATUS                                               NtSetEvent(                                         HANDLE EventHandle, PLONG PreviousState);
  NTSTATUS                                               NtSetEventBoostPriority(                            HANDLE EventHandle);
  NTSTATUS                                               NtSetHighEventPair(                                 HANDLE EventPairHandle);
  NTSTATUS                                               NtSetHighWaitLowEventPair(                          HANDLE EventPairHandle);
  NTSTATUS                                               NtSetLowEventPair(                                  HANDLE EventPair);
  NTSTATUS                                               NtSetLowWaitHighEventPair(                          HANDLE EventPair);
  NTSTATUS                                               NtSetTimer(                                         HANDLE TimerHandle, PLARGE_INTEGER DueTime, PTIMER_APC_ROUTINE TimerApcRoutine, PVOID TimerContext, BOOLEAN WakeTimer, LONG Period, PBOOLEAN PreviousState);
  NTSTATUS                                               NtCancelTimer(                                      HANDLE TimerHandle, PBOOLEAN CurrentState);
  NTSTATUS                                               NtWaitForKeyedEvent(                                HANDLE EventHandle, PVOID Key, BOOLEAN Alertable, PLARGE_INTEGER Timeout);
  NTSTATUS                                               NtWaitHighEventPair(                                HANDLE EventPairHandle);
  NTSTATUS                                               NtWaitLowEventPair(                                 HANDLE EventPairHandle);
  NTSTATUS                                               NtTraceEvent(                                       ULONG TraceHandle, ULONG Flags, ULONG TraceHeaderLength, PEVENT_TRACE_HEADER TraceHeader);
  NT_WAIT_RESULT                                         NtSignalAndWaitForSingleObject(                     HANDLE SignalObject, HANDLE WaitObject, BOOLEAN Alertable, PLARGE_INTEGER Time);
  NT_WAIT_RESULT                                         NtWaitForMultipleObjects(                           ULONG Count, HANDLE [] Object, WAIT_TYPE WaitType, BOOLEAN Alertable, PLARGE_INTEGER Time);
  NT_WAIT_RESULT                                         NtWaitForMultipleObjects32(                         ULONG ObjectCount, PLONG Handles, WAIT_TYPE WaitType, BOOLEAN Alertable, PLARGE_INTEGER TimeOut);
  NT_WAIT_RESULT                                         NtWaitForSingleObject(                              HANDLE Object, BOOLEAN Alertable, PLARGE_INTEGER Time);
  NTSTATUS                                               NtCompressKey(                                      HANDLE Key);
  NTSTATUS                                               NtCreateKey(                                        PHANDLE KeyHandle, REGISTRY_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, ULONG TitleIndex, PUNICODE_STRING Class, ULONG CreateOptions, RegDisposition_PULONG Disposition);
  NTSTATUS                                               NtCreateKeyTransacted(                              PHANDLE KeyHandle, REGISTRY_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, ULONG TitleIndex, PUNICODE_STRING Class, ULONG CreateOptions, HANDLE TransactionHandle, RegDisposition_PULONG Disposition);
  NTSTATUS                                               NtDeleteKey(                                        HANDLE KeyHandle);
  NTSTATUS                                               NtDeleteValueKey(                                   HANDLE KeyHandle, PUNICODE_STRING ValueName);
  NTSTATUS                                               NtEnumerateKey(                                     HANDLE KeyHandle, ULONG Index, KEY_INFORMATION_CLASS KeyInformationClass, PVOID KeyInformation, ULONG Length, PULONG ResultLength);
  NTSTATUS                                               NtEnumerateValueKey(                                HANDLE KeyHandle, ULONG Index, KEY_VALUE_INFORMATION_CLASS KeyValueInformationClass, PVOID KeyValueInformation, ULONG Length, PULONG ResultLength);
  NTSTATUS                                               NtFlushKey(                                         HANDLE KeyHandle);
  NTSTATUS                                               NtInitializeRegistry(                               USHORT Flag);
  NTSTATUS                                               NtLoadKey(                                          POBJECT_ATTRIBUTES KeyObjectAttributes, POBJECT_ATTRIBUTES FileObjectAttributes);
  NTSTATUS                                               NtLoadKey2(                                         POBJECT_ATTRIBUTES KeyObjectAttributes, POBJECT_ATTRIBUTES FileObjectAttributes, ULONG Flags);
  NTSTATUS                                               NtLoadKeyEx(                                        POBJECT_ATTRIBUTES TargetKey, POBJECT_ATTRIBUTES SourceFile, ULONG Flags, HANDLE TrustClassKey);
  NTSTATUS                                               NtLockRegistryKey(                                  HANDLE KeyHandle);
  NTSTATUS                                               NtNotifyChangeKey(                                  HANDLE KeyHandle, HANDLE Event, PIO_APC_ROUTINE ApcRoutine, PVOID ApcContext, PIO_STATUS_BLOCK IoStatusBlock, REG_NOTIFY_CHANGE_FLAGS CompletionFilter, BOOLEAN Asynchroneous, PVOID ChangeBuffer, ULONG Length, BOOLEAN WatchSubtree);
  NTSTATUS                                               NtNotifyChangeMultipleKeys(                         HANDLE MasterKeyHandle, ULONG Count, POBJECT_ATTRIBUTES SubordinateObjects, HANDLE Event, PIO_APC_ROUTINE ApcRoutine, PVOID ApcContext, PIO_STATUS_BLOCK IoStatusBlock, REG_NOTIFY_CHANGE_FLAGS CompletionFilter, BOOLEAN WatchTree, PVOID Buffer, ULONG Length, BOOLEAN Asynchronous);
  NTSTATUS                                               NtOpenKey(                                          PHANDLE KeyHandle, REGISTRY_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes);
  NTSTATUS                                               NtOpenKeyEx(                                        PHANDLE KeyHandle, REGISTRY_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, ULONG OpenOptions);
  NTSTATUS                                               NtOpenKeyTransacted(                                PHANDLE KeyHandle, REGISTRY_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, HANDLE TransactionHandle);
  NTSTATUS                                               NtOpenKeyTransactedEx(                              PHANDLE KeyHandle, REGISTRY_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, ULONG OpenOptions, HANDLE TransactionHandle);
  NTSTATUS                                               NtQueryKey(                                         HANDLE KeyHandle, KEY_INFORMATION_CLASS KeyInformationClass, PVOID KeyInformation, ULONG Length, PULONG ResultLength);
  NTSTATUS                                               NtQueryMultipleValueKey(                            HANDLE KeyHandle, PKEY_VALUE_ENTRY ValueList, ULONG NumberOfValues, PVOID Buffer, PULONG Length, PULONG ReturnLength);
  NTSTATUS                                               NtQueryOpenSubKeys(                                 POBJECT_ATTRIBUTES TargetKey, PULONG HandleCount);
  NTSTATUS                                               NtQueryOpenSubKeysEx(                               POBJECT_ATTRIBUTES TargetKey, ULONG BufferLength, PVOID Buffer, PULONG RequiredSize);
  NTSTATUS                                               NtQueryValueKey(                                    HANDLE KeyHandle, PUNICODE_STRING ValueName, KEY_VALUE_INFORMATION_CLASS KeyValueInformationClass, PVOID KeyValueInformation, ULONG Length, PULONG ResultLength);
  NTSTATUS                                               NtRenameKey(                                        HANDLE KeyHandle, PUNICODE_STRING ReplacementName);
  NTSTATUS                                               NtReplaceKey(                                       POBJECT_ATTRIBUTES ObjectAttributes, HANDLE Key, POBJECT_ATTRIBUTES ReplacedObjectAttributes);
  NTSTATUS                                               NtRestoreKey(                                       HANDLE KeyHandle, HANDLE FileHandle, ULONG RestoreFlags);
  NTSTATUS                                               NtSaveKey(                                          HANDLE KeyHandle, HANDLE FileHandle);
  NTSTATUS                                               NtSaveKeyEx(                                        HANDLE KeyHandle, HANDLE FileHandle, ULONG Flags);
  NTSTATUS                                               NtSaveMergedKeys(                                   HANDLE HighPrecedenceKeyHandle, HANDLE LowPrecedenceKeyHandle, HANDLE FileHandle);
  NTSTATUS                                               NtSetInformationKey(                                HANDLE KeyHandle, KEY_SET_INFORMATION_CLASS KeyInformationClass, PVOID KeyInformation, ULONG KeyInformationLength);
  NTSTATUS                                               NtSetValueKey(                                      HANDLE KeyHandle, PUNICODE_STRING ValueName, ULONG TitleIndex, ULONG Type, PVOID Data, ULONG DataSize);
  NTSTATUS                                               NtUnloadKey(                                        POBJECT_ATTRIBUTES KeyObjectAttributes);
  NTSTATUS                                               NtUnloadKey2(                                       POBJECT_ATTRIBUTES TargetKey, ULONG Flags);
  NTSTATUS                                               NtUnloadKeyEx(                                      POBJECT_ATTRIBUTES TargetKey, HANDLE Event);
  NTSTATUS                                               NtCompactKeys(                                      ULONG NrOfKeys, HANDLE KeysArray);
  NTSTATUS                                               NtFreezeRegistry(                                   USHORT TimeOutInSeconds);
  NTSTATUS                                               NtThawRegistry(                                     );
  NTSTATUS                                               NtAddAtom(                                          PWSTR AtomName, ULONG AtomNameLength, PRTL_ATOM Atom);
  NTSTATUS                                               NtDeleteAtom(                                       RTL_ATOM Atom);
  NTSTATUS                                               NtFindAtom(                                         PWSTR AtomName, ULONG AtomNameLength, PRTL_ATOM Atom);
  NTSTATUS                                               NtQueryInformationAtom(                             RTL_ATOM Atom, ATOM_INFORMATION_CLASS AtomInformationClass, PVOID AtomInformation, ULONG AtomInformationLength, PULONG ReturnLength);
  NTSTATUS                                               NtQueryDefaultLocale(                               BOOLEAN UserProfile, PLCID DefaultLocaleId);
  NTSTATUS                                               NtQueryDefaultUILanguage(                           LANGID* LanguageId);
  NTSTATUS                                               NtQueryInstallUILanguage(                           LANGID* LanguageId);
  NTSTATUS                                               NtSetDefaultLocale(                                 BOOLEAN UserProfile, LCID DefaultLocaleId);
  NTSTATUS                                               NtSetDefaultUILanguage(                             LANGID LanguageId);
  PVOID                                                  CsrAllocateCaptureBuffer(                           ULONG ArgumentCount, ULONG BufferSize);
  ULONG                                                  CsrAllocateMessagePointer(                          CSR_CAPTURE_BUFFER* CaptureBuffer, ULONG MessageLength, PVOID* CaptureData);
  VOID                                                   CsrCaptureMessageBuffer(                            CSR_CAPTURE_BUFFER* CaptureBuffer, PVOID MessageString, ULONG StringLength, PVOID* CapturedData);
  NTSTATUS                                               CsrClientConnectToServer(                           PWSTR ObjectDirectory, ULONG ServerId, PVOID ConnectionInfo, PULONG ConnectionInfoSize, PBOOLEAN ServerToServerCall);
  NTSTATUS                                               CsrClientCallServer(                                CSR_API_MESSAGE* Request, CSR_CAPTURE_BUFFER* CaptureBuffer, ULONG ApiNumber, ULONG RequestLength);
  NTSTATUS                                               CsrIdentifyAlertableThread(                         );
  VOID                                                   CsrFreeCaptureBuffer(                               CSR_CAPTURE_BUFFER* CaptureBuffer);
  HANDLE                                                 CsrGetProcessId(                                    );
  NTSTATUS                                               CsrNewThread(                                       );
  NTSTATUS                                               CsrSetPriorityClass(                                HANDLE Process, PULONG PriorityClass);
  VOID                                                   CsrProbeForRead(                                    PVOID Address, ULONG Length, ULONG Alignment);
  VOID                                                   CsrProbeForWrite(                                   PVOID Address, ULONG Length, ULONG Alignment);
  ULONG                                                  DbgPrint(                                           PCCH Format);
  ULONG                                                  DbgPrintEx(                                         ULONG ComponentId, ULONG Level, PCCH Format);
  ULONG                                                  DbgPrompt(                                          PCCH Prompt, PCH Response, ULONG MaximumResponseLength);
  VOID                                                   DbgBreakPoint(                                      );
  NTSTATUS                                               DbgLoadImageSymbols(                                PANSI_STRING Name, PVOID Base, ULONG_PTR ProcessId);
  VOID                                                   DbgUnLoadImageSymbols(                              PANSI_STRING Name, PVOID Base, ULONG_PTR ProcessId);
  VOID                                                   DbgBreakPointWithStatus(                            ULONG Status);
  NTSTATUS                                               DbgUiConnectToDbg(                                  );
  NTSTATUS                                               DbgUiContinue(                                      PCLIENT_ID ClientId, NTSTATUS ContinueStatus);
  NTSTATUS                                               DbgUiDebugActiveProcess(                            HANDLE Process);
  NTSTATUS                                               DbgUiStopDebugging(                                 HANDLE Process);
  NTSTATUS                                               DbgUiWaitStateChange(                               PDBGUI_WAIT_STATE_CHANGE DbgUiWaitStateCange, PLARGE_INTEGER TimeOut);
  NTSTATUS                                               DbgUiConvertStateChangeStructure(                   PDBGUI_WAIT_STATE_CHANGE WaitStateChange, PVOID DebugEvent);
  VOID                                                   DbgUiRemoteBreakin(                                 );
  NTSTATUS                                               DbgUiIssueRemoteBreakin(                            HANDLE Process);
  HANDLE                                                 DbgUiGetThreadDebugObject(                          );
  NTSTATUS                                               LdrAccessResource(                                  HMODULE_PVOID BaseAddress, PIMAGE_RESOURCE_DATA_ENTRY ResourceDataEntry, PVOID* Resource, PULONG Size);
  NTSTATUS                                               LdrFindResource_U(                                  HMODULE_PVOID BaseAddress, PLDR_RESOURCE_INFO ResourceInfo, ULONG Level, PIMAGE_RESOURCE_DATA_ENTRY* ResourceDataEntry);
  NTSTATUS                                               LdrFindResourceDirectory_U(                         HMODULE_PVOID BaseAddress, PLDR_RESOURCE_INFO ResourceInfo, ULONG Level, PIMAGE_RESOURCE_DIRECTORY* ResourceDirectory);
  BOOLEAN                                                LdrUnloadAlternateResourceModule(                   HMODULE_PVOID BaseAddress);
  ULONG                                                  LdrRelocateImage(                                   PVOID NewBase, PUCHAR LoaderName, ULONG Success, ULONG Conflict, ULONG Invalid);
  NTSTATUS                                               LdrLockLoaderLock(                                  LDR_LOCK_LOADER_LOCK_FLAG Flags, LDR_LOCK_LOADER_LOCK_DISPOSITION* Disposition, PULONG Cookie);
  NTSTATUS                                               LdrUnlockLoaderLock(                                LDR_UNLOCK_LOADER_LOCK_FLAG Flags, ULONG Cookie);
  BOOLEAN                                                LdrVerifyMappedImageMatchesChecksum(                HMODULE_PVOID BaseAddress, ULONG NumberOfBytes, ULONG FileLength);
  NTSTATUS                                               LdrAddRefDll(                                       LDR_ADDREF_DLL_FLAGS Flags, HMODULE_PVOID BaseAddress);
  NTSTATUS                                               LdrDisableThreadCalloutsForDll(                     HMODULE_PVOID BaseAddress);
  NTSTATUS                                               LdrGetDllHandle(                                    PWSTR DllPath, PULONG DllCharacteristics, PUNICODE_STRING DllName, HMODULE* DllHandle);
  NTSTATUS                                               LdrGetDllHandleEx(                                  LDR_GET_DLL_HANDLE_EX_FLAGS Flags, PWSTR DllPath, PULONG DllCharacteristics, PUNICODE_STRING DllName, HMODULE* DllHandle);
  NTSTATUS                                               LdrFindEntryForAddress(                             PVOID Address, PLDR_DATA_TABLE_ENTRY* Module);
  NTSTATUS                                               LdrGetProcedureAddress(                             HMODULE BaseAddress, PANSI_STRING Name, ULONG Ordinal, PVOID* ProcedureAddress);
  VOID                                                   LdrInitializeThunk(                                 ULONG Unknown1, ULONG Unknown2, ULONG Unknown3, ULONG Unknown4);
  NTSTATUS                                               LdrLoadDll(                                         PWSTR SearchPath, IMAGE_FILE_CHARACTERISTICS_ULONG* DllCharacteristics, PUNICODE_STRING Name, HMODULE_PVOID* BaseAddress);
  PIMAGE_BASE_RELOCATION                                 LdrProcessRelocationBlock(                          ULONG_PTR Address, ULONG Count, PUSHORT TypeOffset, LONG_PTR Delta);
  NTSTATUS                                               LdrQueryImageFileExecutionOptions(                  PUNICODE_STRING SubKey, PCWSTR ValueName, ULONG ValueSize, PVOID Buffer, ULONG BufferSize, PULONG RetunedLength);
  NTSTATUS                                               LdrQueryProcessModuleInformation(                   PRTL_PROCESS_MODULES ModuleInformation, ULONG Size, PULONG ReturnedSize);
  NTSTATUS                                               LdrShutdownThread(                                  );
  NTSTATUS                                               LdrUnloadDll(                                       HMODULE_PVOID BaseAddress);
  NTSTATUS                                               LdrVerifyImageMatchesChecksum(                      HANDLE FileHandle, ULONG Unknown1, ULONG Unknown2, ULONG Unknown3);
  ULONG                                                  LdrRelocateImageWithBias(                           PVOID NewAddress, LONGLONG AdditionalBias, PCCH LoaderName, ULONG Success, ULONG Conflict, ULONG Invalid);
  NTSTATUS                                               LdrResFindResourceDirectory(                        HMODULE_PVOID BaseAddress, PVOID Unknown1, PVOID Unknown2, PVOID* ResourceDirectory, PVOID Unknown3, PVOID Unknown4, PVOID Unknown5);
  NTSTATUS                                               RtlAbsoluteToSelfRelativeSD(                        PSECURITY_DESCRIPTOR AbsoluteSecurityDescriptor, PSECURITY_DESCRIPTOR_RELATIVE SelfRelativeSecurityDescriptor, PULONG BufferLength);
  NTSTATUS                                               RtlAddAccessAllowedAce(                             PACL Acl, AclRevision AceRevision, ACCESS_MASK AccessMask, PSID Sid);
  NTSTATUS                                               RtlAddAccessAllowedAceEx(                           PACL pAcl, ULONG AceRevision, ULONG AceFlags, ACCESS_MASK AccessMask, PSID Sid);
  NTSTATUS                                               RtlAddAccessAllowedObjectAce(                       PACL pAcl, ULONG dwAceRevision, ULONG AceFlags, ACCESS_MASK AccessMask, GUID* ObjectTypeGuid, GUID* InheritedObjectTypeGuid, PSID pSid);
  NTSTATUS                                               RtlAddAccessDeniedAce(                              PACL Acl, AclRevision Revision, ACCESS_MASK AccessMask, PSID Sid);
  NTSTATUS                                               RtlAddAccessDeniedAceEx(                            PACL Acl, AclRevision Revision, ULONG Flags, ACCESS_MASK AccessMask, PSID Sid);
  NTSTATUS                                               RtlAddAccessDeniedObjectAce(                        PACL pAcl, ULONG dwAceRevision, ULONG AceFlags, ACCESS_MASK AccessMask, GUID* ObjectTypeGuid, GUID* InheritedObjectTypeGuid, PSID pSid);
  NTSTATUS                                               RtlAddAce(                                          PACL Acl, ULONG AceRevision, ULONG StartingAceIndex, PVOID AceList, ULONG AceListLength);
  NTSTATUS                                               RtlAddAuditAccessAce(                               PACL Acl, AclRevision Revision, ACCESS_MASK AccessMask, PSID Sid, BOOLEAN Success, BOOLEAN Failure);
  NTSTATUS                                               RtlAcquirePrivilege(                                PULONG Privilege, ULONG NumPriv, ULONG Flags, PVOID* ReturnedState);
  NTSTATUS                                               RtlAddAuditAccessAceEx(                             PACL Acl, AclRevision Revision, ULONG Flags, ACCESS_MASK AccessMask, PSID Sid, BOOLEAN Success, BOOLEAN Failure);
  NTSTATUS                                               RtlAddAuditAccessObjectAce(                         PACL Acl, AclRevision Revision, ULONG Flags, ACCESS_MASK AccessMask, GUID* ObjectTypeGuid, GUID* InheritedObjectTypeGuid, PSID Sid, BOOLEAN Success, BOOLEAN Failure);
  NTSTATUS                                               RtlAddMandatoryAce(                                 PACL Acl, AclRevision Revision, ULONG Flags, ULONG MandatoryFlags, ULONG AceType, PSID LabelSid);
  NTSTATUS                                               RtlAdjustPrivilege(                                 ULONG Privilege, BOOLEAN NewValue, BOOLEAN ForThread, PBOOLEAN OldValue);
  NTSTATUS                                               RtlAllocateAndInitializeSid(                        PSID_IDENTIFIER_AUTHORITY IdentifierAuthority, UCHAR SubAuthorityCount, ULONG SubAuthority0, ULONG SubAuthority1, ULONG SubAuthority2, ULONG SubAuthority3, ULONG SubAuthority4, ULONG SubAuthority5, ULONG SubAuthority6, ULONG SubAuthority7, PSID* Sid);
  BOOLEAN                                                RtlAreAllAccessesGranted(                           ACCESS_MASK GrantedAccess, ACCESS_MASK DesiredAccess);
  BOOLEAN                                                RtlAreAnyAccessesGranted(                           ACCESS_MASK GrantedAccess, ACCESS_MASK DesiredAccess);
  VOID                                                   RtlCopyLuid(                                        PLUID LuidDest, PLUID LuidSrc);
  VOID                                                   RtlCopyLuidAndAttributesArray(                      ULONG Count, PLUID_AND_ATTRIBUTES Src, PLUID_AND_ATTRIBUTES Dest);
  NTSTATUS                                               RtlCopySidAndAttributesArray(                       ULONG Count, PSID_AND_ATTRIBUTES Src, ULONG SidAreaSize, PSID_AND_ATTRIBUTES Dest, PVOID SidArea, PVOID* RemainingSidArea, PULONG RemainingSidAreaSize);
  NTSTATUS                                               RtlConvertSidToUnicodeString(                       PUNICODE_STRING DestinationString, PSID Sid, BOOLEAN AllocateDestinationString);
  NTSTATUS                                               RtlCopySid(                                         ULONG Length, PSID Destination, PSID Source);
  NTSTATUS                                               RtlCreateAcl(                                       PACL Acl, ULONG AclSize, AclRevision AclRevision);
  NTSTATUS                                               RtlCreateSecurityDescriptor(                        PSECURITY_DESCRIPTOR SecurityDescriptor, ULONG Revision);
  NTSTATUS                                               RtlCreateSecurityDescriptorRelative(                PISECURITY_DESCRIPTOR_RELATIVE SecurityDescriptor, ULONG Revision);
  NTSTATUS                                               RtlCopySecurityDescriptor(                          PSECURITY_DESCRIPTOR pSourceSecurityDescriptor, PSECURITY_DESCRIPTOR pDestinationSecurityDescriptor);
  NTSTATUS                                               RtlDeleteAce(                                       PACL Acl, ULONG AceIndex);
  BOOLEAN                                                RtlEqualPrefixSid(                                  PSID Sid1, PSID Sid2);
  BOOLEAN                                                RtlEqualSid(                                        PSID Sid1, PSID Sid2);
  BOOLEAN                                                RtlFirstFreeAce(                                    PACL Acl, PACE* Ace);
  PVOID                                                  RtlFreeSid(                                         PSID Sid);
  NTSTATUS                                               RtlGetAce(                                          PACL Acl, ULONG AceIndex, PACE* Ace);
  NTSTATUS                                               RtlGetControlSecurityDescriptor(                    PSECURITY_DESCRIPTOR SecurityDescriptor, PSECURITY_DESCRIPTOR_CONTROL Control, PULONG Revision);
  NTSTATUS                                               RtlGetDaclSecurityDescriptor(                       PSECURITY_DESCRIPTOR SecurityDescriptor, PBOOLEAN DaclPresent, PACL* Dacl, PBOOLEAN DaclDefaulted);
  NTSTATUS                                               RtlGetSaclSecurityDescriptor(                       PSECURITY_DESCRIPTOR SecurityDescriptor, PBOOLEAN SaclPresent, PACL* Sacl, PBOOLEAN SaclDefaulted);
  NTSTATUS                                               RtlGetGroupSecurityDescriptor(                      PSECURITY_DESCRIPTOR SecurityDescriptor, PSID* Group, PBOOLEAN GroupDefaulted);
  NTSTATUS                                               RtlGetOwnerSecurityDescriptor(                      PSECURITY_DESCRIPTOR SecurityDescriptor, PSID* Owner, PBOOLEAN OwnerDefaulted);
  BOOLEAN                                                RtlGetSecurityDescriptorRMControl(                  PSECURITY_DESCRIPTOR SecurityDescriptor, PUCHAR RMControl);
  PSID_IDENTIFIER_AUTHORITY                              RtlIdentifierAuthoritySid(                          PSID Sid);
  NTSTATUS                                               RtlImpersonateSelf(                                 SECURITY_IMPERSONATION_LEVEL ImpersonationLevel);
  NTSTATUS                                               RtlInitializeSid(                                   PSID Sid, PSID_IDENTIFIER_AUTHORITY IdentifierAuthority, UCHAR SubAuthorityCount);
  ULONG                                                  RtlLengthRequiredSid(                               ULONG SubAuthorityCount);
  ULONG                                                  RtlLengthSid(                                       PSID Sid);
  NTSTATUS                                               RtlMakeSelfRelativeSD(                              PSECURITY_DESCRIPTOR AbsoluteSD, PSECURITY_DESCRIPTOR_RELATIVE SelfRelativeSD, PULONG BufferLength);
  VOID                                                   RtlMapGenericMask(                                  PACCESS_MASK AccessMask, PGENERIC_MAPPING GenericMapping);
  NTSTATUS                                               RtlQueryInformationAcl(                             PACL Acl, PVOID Information, ULONG InformationLength, ACL_INFORMATION_CLASS InformationClass);
  VOID                                                   RtlReleasePrivilege(                                PVOID ReturnedState);
  NTSTATUS                                               RtlSelfRelativeToAbsoluteSD(                        PSECURITY_DESCRIPTOR_RELATIVE SelfRelativeSD, PSECURITY_DESCRIPTOR AbsoluteSD, PULONG AbsoluteSDSize, PACL Dacl, PULONG DaclSize, PACL Sacl, PULONG SaclSize, PSID Owner, PULONG OwnerSize, PSID PrimaryGroup, PULONG PrimaryGroupSize);
  NTSTATUS                                               RtlSelfRelativeToAbsoluteSD2(                       PSECURITY_DESCRIPTOR_RELATIVE SelfRelativeSD, PULONG BufferSize);
  NTSTATUS                                               RtlSetAttributesSecurityDescriptor(                 PSECURITY_DESCRIPTOR SecurityDescriptor, SECURITY_DESCRIPTOR_CONTROL Control, PULONG Revision);
  NTSTATUS                                               RtlSetControlSecurityDescriptor(                    PSECURITY_DESCRIPTOR SecurityDescriptor, SECURITY_DESCRIPTOR_CONTROL ControlBitsOfInterest, SECURITY_DESCRIPTOR_CONTROL ControlBitsToSet);
  NTSTATUS                                               RtlSetDaclSecurityDescriptor(                       PSECURITY_DESCRIPTOR SecurityDescriptor, BOOLEAN DaclPresent, PACL Dacl, BOOLEAN DaclDefaulted);
  NTSTATUS                                               RtlSetGroupSecurityDescriptor(                      PSECURITY_DESCRIPTOR SecurityDescriptor, PSID Group, BOOLEAN GroupDefaulted);
  NTSTATUS                                               RtlSetInformationAcl(                               PACL Acl, PVOID Information, ULONG InformationLength, ACL_INFORMATION_CLASS InformationClass);
  NTSTATUS                                               RtlSetOwnerSecurityDescriptor(                      PSECURITY_DESCRIPTOR SecurityDescriptor, PSID Owner, BOOLEAN OwnerDefaulted);
  NTSTATUS                                               RtlSetSaclSecurityDescriptor(                       PSECURITY_DESCRIPTOR SecurityDescriptor, BOOLEAN SaclPresent, PACL Sacl, BOOLEAN SaclDefaulted);
  VOID                                                   RtlSetSecurityDescriptorRMControl(                  PSECURITY_DESCRIPTOR SecurityDescriptor, PUCHAR RMControl);
  PUCHAR                                                 RtlSubAuthorityCountSid(                            PSID Sid);
  PULONG                                                 RtlSubAuthoritySid(                                 PSID Sid, ULONG SubAuthority);
  BOOLEAN                                                RtlValidRelativeSecurityDescriptor(                 PSECURITY_DESCRIPTOR_RELATIVE SecurityDescriptorInput, ULONG SecurityDescriptorLength, SECURITY_INFORMATION RequiredInformation);
  BOOLEAN                                                RtlValidSecurityDescriptor(                         PSECURITY_DESCRIPTOR SecurityDescriptor);
  BOOLEAN                                                RtlValidSid(                                        PSID Sid);
  BOOLEAN                                                RtlValidAcl(                                        PACL Acl);
  NTSTATUS                                               RtlDeleteSecurityObject(                            PSECURITY_DESCRIPTOR* ObjectDescriptor);
  NTSTATUS                                               RtlNewSecurityObject(                               PSECURITY_DESCRIPTOR ParentDescriptor, PSECURITY_DESCRIPTOR CreatorDescriptor, PSECURITY_DESCRIPTOR* NewDescriptor, BOOLEAN IsDirectoryObject, HANDLE Token, PGENERIC_MAPPING GenericMapping);
  NTSTATUS                                               RtlQuerySecurityObject(                             PSECURITY_DESCRIPTOR ObjectDescriptor, SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR ResultantDescriptor, ULONG DescriptorLength, PULONG ReturnLength);
  NTSTATUS                                               RtlSetSecurityObject(                               SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR ModificationDescriptor, PSECURITY_DESCRIPTOR* ObjectsSecurityDescriptor, PGENERIC_MAPPING GenericMapping, HANDLE Token);
  NTSTATUS                                               RtlLargeIntegerToChar(                              PLARGE_INTEGER Value, ULONG Base, ULONG Length, PCHAR String);
  CHAR                                                   RtlUpperChar(                                       CHAR Source);
  WCHAR                                                  RtlUpcaseUnicodeChar(                               WCHAR Source);
  WCHAR                                                  RtlDowncaseUnicodeChar(                             WCHAR Source);
  NTSTATUS                                               RtlIntegerToChar(                                   ULONG Value, ULONG Base, ULONG Length, PCHAR String);
  NTSTATUS                                               RtlIntegerToUnicode(                                ULONG Value, ULONG Base, ULONG Length, LPWSTR String);
  NTSTATUS                                               RtlIntegerToUnicodeString(                          ULONG Value, ULONG Base, PUNICODE_STRING String);
  NTSTATUS                                               RtlCharToInteger(                                   PCSZ String, ULONG Base, PULONG Value);
  ULONG                                                  RtlxUnicodeStringToAnsiSize(                        PCUNICODE_STRING UnicodeString);
  NTSTATUS                                               RtlUnicodeStringToAnsiString(                       PANSI_STRING DestinationString, PCUNICODE_STRING SourceString, BOOLEAN AllocateDestinationString);
  NTSTATUS                                               RtlUpcaseUnicodeStringToOemString(                  POEM_STRING DestinationString, PCUNICODE_STRING SourceString, BOOLEAN AllocateDestinationString);
  NTSTATUS                                               RtlUpcaseUnicodeStringToCountedOemString(           POEM_STRING DestinationString, PCUNICODE_STRING SourceString, BOOLEAN AllocateDestinationString);
  NTSTATUS                                               RtlUnicodeStringToOemString(                        POEM_STRING DestinationString, PCUNICODE_STRING SourceString, BOOLEAN AllocateDestinationString);
  NTSTATUS                                               RtlUpcaseUnicodeToOemN(                             PCHAR OemString, ULONG OemSize, PULONG ResultSize, PWCHAR UnicodeString, ULONG UnicodeSize);
  ULONG                                                  RtlxUnicodeStringToOemSize(                         PCUNICODE_STRING UnicodeString);
  NTSTATUS                                               RtlUnicodeToOemN(                                   PCHAR OemString, ULONG OemSize, PULONG ResultSize, PWCHAR UnicodeString, ULONG UnicodeSize);
  NTSTATUS                                               RtlUnicodeToMultiByteN(                             PCHAR MbString, ULONG MbSize, PULONG ResultSize, PWCHAR UnicodeString, ULONG UnicodeSize);
  NTSTATUS                                               RtlUpcaseUnicodeToMultiByteN(                       PCHAR MbString, ULONG MbSize, PULONG ResultSize, PWCHAR UnicodeString, ULONG UnicodeSize);
  NTSTATUS                                               RtlUnicodeToMultiByteSize(                          PULONG MbSize, PWCHAR UnicodeString, ULONG UnicodeSize);
  ULONG                                                  RtlxOemStringToUnicodeSize(                         PCOEM_STRING OemString);
  NTSTATUS                                               RtlOemStringToUnicodeString(                        PUNICODE_STRING DestinationString, PCOEM_STRING SourceString, BOOLEAN AllocateDestinationString);
  NTSTATUS                                               RtlOemToUnicodeN(                                   PWSTR UnicodeString, ULONG MaxBytesInUnicodeString, PULONG BytesInUnicodeString, PCHAR OemString, ULONG BytesInOemString);
  ULONG                                                  RtlxAnsiStringToUnicodeSize(                        PCANSI_STRING AnsiString);
  NTSTATUS                                               RtlAnsiStringToUnicodeString(                       PUNICODE_STRING DestinationString, PCANSI_STRING SourceString, BOOLEAN AllocateDestinationString);
  BOOLEAN                                                RtlCreateUnicodeStringFromAsciiz(                   PUNICODE_STRING Destination, PCSZ Source);
  NTSTATUS                                               RtlAppendUnicodeToString(                           PUNICODE_STRING Destination, PCWSTR Source);
  NTSTATUS                                               RtlAppendUnicodeStringToString(                     PUNICODE_STRING Destination, PCUNICODE_STRING Source);
  LONG                                                   RtlCompareUnicodeString(                            PCUNICODE_STRING String1, PCUNICODE_STRING String2, BOOLEAN CaseInsensitive);
  VOID                                                   RtlCopyUnicodeString(                               PUNICODE_STRING DestinationString, PCUNICODE_STRING SourceString);
  BOOLEAN                                                RtlCreateUnicodeString(                             PUNICODE_STRING DestinationString, PCWSTR SourceString);
  NTSTATUS                                               RtlDowncaseUnicodeString(                           PUNICODE_STRING UniDest, PCUNICODE_STRING UniSource, BOOLEAN AllocateDestinationString);
  NTSTATUS                                               RtlDuplicateUnicodeString(                          ULONG Flags, PCUNICODE_STRING SourceString, PUNICODE_STRING DestinationString);
  BOOLEAN                                                RtlEqualUnicodeString(                              PCUNICODE_STRING String1, PCUNICODE_STRING String2, BOOLEAN CaseInsensitive);
  NTSTATUS                                               RtlFindCharInUnicodeString(                         ULONG Flags, PUNICODE_STRING SearchString, PCUNICODE_STRING MatchString, PUSHORT Position);
  VOID                                                   RtlFreeUnicodeString(                               PUNICODE_STRING UnicodeString);
  NTSTATUS                                               RtlHashUnicodeString(                               UNICODE_STRING* String, BOOLEAN CaseInSensitive, ULONG HashAlgorithm, PULONG HashValue);
  VOID                                                   RtlInitUnicodeString(                               PUNICODE_STRING DestinationString, PCWSTR SourceString);
  NTSTATUS                                               RtlInitUnicodeStringEx(                             PUNICODE_STRING DestinationString, PCWSTR SourceString);
  BOOLEAN                                                RtlIsTextUnicode(                                   PVOID Buffer, INT Length, IsTextUnicodeFlags* Flags);
  BOOLEAN                                                RtlPrefixString(                                    PCANSI_STRING String1, PCANSI_STRING String2, BOOLEAN CaseInsensitive);
  BOOLEAN                                                RtlPrefixUnicodeString(                             PCUNICODE_STRING String1, PCUNICODE_STRING String2, BOOLEAN CaseInsensitive);
  NTSTATUS                                               RtlUpcaseUnicodeString(                             PUNICODE_STRING DestinationString, PCUNICODE_STRING SourceString, BOOLEAN AllocateDestinationString);
  NTSTATUS                                               RtlUnicodeStringToInteger(                          PCUNICODE_STRING String, ULONG Base, PULONG Value);
  NTSTATUS                                               RtlValidateUnicodeString(                           ULONG Flags, PCUNICODE_STRING String);
  VOID                                                   RtlFreeAnsiString(                                  PANSI_STRING AnsiString);
  VOID                                                   RtlInitAnsiString(                                  PANSI_STRING DestinationString, PCSZ SourceString);
  NTSTATUS                                               RtlInitAnsiStringEx(                                PANSI_STRING DestinationString, PCSZ SourceString);
  VOID                                                   RtlFreeOemString(                                   POEM_STRING OemString);
  NTSTATUS                                               RtlMultiByteToUnicodeN(                             PWCHAR UnicodeString, ULONG UnicodeSize, PULONG ResultSize, PCSTR MbString, ULONG MbSize);
  NTSTATUS                                               RtlMultiByteToUnicodeSize(                          PULONG UnicodeSize, PCSTR MbString, ULONG MbSize);
  NTSTATUS                                               RtlAddAtomToAtomTable(                              PRTL_ATOM_TABLE AtomTable, PWSTR AtomName, PRTL_ATOM Atom);
  NTSTATUS                                               RtlCreateAtomTable(                                 ULONG TableSize, PRTL_ATOM_TABLE* AtomTable);
  NTSTATUS                                               RtlDeleteAtomFromAtomTable(                         PRTL_ATOM_TABLE AtomTable, RTL_ATOM Atom);
  NTSTATUS                                               RtlDestroyAtomTable(                                PRTL_ATOM_TABLE AtomTable);
  NTSTATUS                                               RtlQueryAtomInAtomTable(                            PRTL_ATOM_TABLE AtomTable, RTL_ATOM Atom, PULONG RefCount, PULONG PinCount, PWSTR AtomName, PULONG NameLength);
  NTSTATUS                                               RtlPinAtomInAtomTable(                              PRTL_ATOM_TABLE AtomTable, RTL_ATOM Atom);
  NTSTATUS                                               RtlLookupAtomInAtomTable(                           PRTL_ATOM_TABLE AtomTable, PWSTR AtomName, PRTL_ATOM Atom);
  VOID                                                   RtlFillMemoryUlong(                                 PVOID Destination, ULONG Length, ULONG Fill);
  PPEB                                                   RtlGetCurrentPeb(                                   );
  VOID                                                   RtlAcquirePebLock(                                  );
  NTSTATUS                                               RtlCreateProcessParameters(                         PRTL_USER_PROCESS_PARAMETERS* ProcessParameters, PUNICODE_STRING ImagePathName, PUNICODE_STRING DllPath, PUNICODE_STRING CurrentDirectory, PUNICODE_STRING CommandLine, PWSTR Environment, PUNICODE_STRING WindowTitle, PUNICODE_STRING DesktopInfo, PUNICODE_STRING ShellInfo, PUNICODE_STRING RuntimeInfo);
  NTSTATUS                                               RtlCreateUserProcess(                               PUNICODE_STRING ImageFileName, ULONG Attributes, PRTL_USER_PROCESS_PARAMETERS ProcessParameters, PSECURITY_DESCRIPTOR ProcessSecutityDescriptor, PSECURITY_DESCRIPTOR ThreadSecurityDescriptor, HANDLE ParentProcess, BOOLEAN CurrentDirectory, HANDLE DebugPort, HANDLE ExceptionPort, PRTL_USER_PROCESS_INFORMATION ProcessInfo);
  NTSTATUS                                               RtlCreateUserThread(                                ProcessHandle ProcessHandle, PSECURITY_DESCRIPTOR SecurityDescriptor, BOOLEAN CreateSuspended, ULONG StackZeroBits, SIZE_T StackReserve, SIZE_T StackCommit, PTHREAD_START_ROUTINE StartAddress, PVOID Parameter, PHANDLE ThreadHandle, PCLIENT_ID ClientId);
  PRTL_USER_PROCESS_PARAMETERS                           RtlDeNormalizeProcessParams(                        PRTL_USER_PROCESS_PARAMETERS ProcessParameters);
  NTSTATUS                                               RtlDestroyProcessParameters(                        PRTL_USER_PROCESS_PARAMETERS ProcessParameters);
  VOID                                                   RtlExitUserThread(                                  NTSTATUS Status);
  VOID                                                   RtlInitializeContext(                               ProcessHandle ProcessHandle, PCONTEXT ThreadContext, PVOID ThreadStartParam, PTHREAD_START_ROUTINE ThreadStartAddress, PINITIAL_TEB InitialTeb);
  PRTL_USER_PROCESS_PARAMETERS                           RtlNormalizeProcessParams(                          PRTL_USER_PROCESS_PARAMETERS ProcessParameters);
  VOID                                                   RtlReleasePebLock(                                  );
  NTSTATUS                                               RtlRemoteCall(                                      HANDLE Process, HANDLE Thread, PVOID CallSite, ULONG ArgumentCount, PULONG Arguments, BOOLEAN PassContext, BOOLEAN AlreadySuspended);
  VOID                                                   RtlSetProcessIsCritical(                            BOOLEAN NewValue, PBOOLEAN OldValue, BOOLEAN IsWinlogon);
  ULONG                                                  RtlGetCurrentProcessorNumber(                       );
  NTSTATUS                                               RtlDeregisterWaitEx(                                HANDLE hWaitHandle, HANDLE hCompletionEvent);
  NTSTATUS                                               RtlDeregisterWait(                                  HANDLE hWaitHandle);
  NTSTATUS                                               RtlQueueWorkItem(                                   WORKERCALLBACKFUNC Function, PVOID Context, ULONG Flags);
  NTSTATUS                                               RtlSetIoCompletionCallback(                         HANDLE FileHandle, PIO_APC_ROUTINE Callback, ULONG Flags);
  NTSTATUS                                               RtlRegisterWait(                                    PHANDLE phNewWaitObject, HANDLE hObject, WAITORTIMERCALLBACKFUNC Callback, PVOID pvContext, ULONG ulMilliseconds, ULONG ulFlags);
  NTSTATUS                                               RtlCreateEnvironment(                               BOOLEAN Inherit, PWSTR* Environment);
  NTSTATUS                                               RtlComputePrivatizedDllName_U(                      PUNICODE_STRING DllName, PUNICODE_STRING RealName, PUNICODE_STRING LocalName);
  VOID                                                   RtlDestroyEnvironment(                              PWSTR Environment);
  BOOLEAN                                                RtlDoesFileExists_U(                                PCWSTR FileName);
  BOOLEAN                                                RtlDoesFileExists_UstrEx(                           PCUNICODE_STRING FileName, BOOLEAN SucceedIfBusy);
  ULONG                                                  RtlDetermineDosPathNameType_U(                      PCWSTR Path);
  ULONG                                                  RtlDetermineDosPathNameType_Ustr(                   PCUNICODE_STRING Path);
  ULONG                                                  RtlDosSearchPath_U(                                 PCWSTR Path, PCWSTR FileName, PCWSTR Extension, ULONG BufferSize, PWSTR Buffer, PWSTR* PartName);
  BOOLEAN                                                RtlDosPathNameToNtPathName_U(                       PCWSTR DosPathName, PUNICODE_STRING NtPathName, PCWSTR* NtFileNamePart, CURDIR* DirectoryInfo);
  NTSTATUS                                               RtlExpandEnvironmentStrings_U(                      PWSTR Environment, PUNICODE_STRING Source, PUNICODE_STRING Destination, PULONG Length);
  ULONG                                                  RtlGetCurrentDirectory_U(                           ULONG MaximumLength, PWSTR Buffer);
  ULONG                                                  RtlGetFullPathName_U(                               PCWSTR FileName, ULONG Size, PWSTR Buffer, PWSTR* ShortName);
  ULONG                                                  RtlGetFullPathName_Ustr(                            PUNICODE_STRING FileName, ULONG Size, PWSTR Buffer, PWSTR* ShortName, PBOOLEAN InvalidName, RTL_PATH_TYPE* PathType);
  ULONG                                                  RtlIsDosDeviceName_U(                               PWSTR Name);
  ULONG                                                  RtlIsDosDeviceName_Ustr(                            PUNICODE_STRING Name);
  BOOLEAN                                                RtlIsNameLegalDOS8Dot3(                             PCUNICODE_STRING Name, POEM_STRING OemName, PBOOLEAN NameContainsSpaces);
  NTSTATUS                                               RtlQueryEnvironmentVariable_U(                      PWSTR Environment, PUNICODE_STRING Name, PUNICODE_STRING Value);
  NTSTATUS                                               RtlSetCurrentDirectory_U(                           PUNICODE_STRING name);
  NTSTATUS                                               RtlSetEnvironmentVariable(                          PWSTR* Environment, PUNICODE_STRING Name, PUNICODE_STRING Value);
  NTSTATUS                                               RtlDeleteCriticalSection(                           PRTL_CRITICAL_SECTION CriticalSection);
  NTSTATUS                                               RtlEnterCriticalSection(                            PRTL_CRITICAL_SECTION CriticalSection);
  NTSTATUS                                               RtlInitializeCriticalSection(                       PRTL_CRITICAL_SECTION CriticalSection);
  NTSTATUS                                               RtlInitializeCriticalSectionAndSpinCount(           PRTL_CRITICAL_SECTION CriticalSection, ULONG SpinCount);
  NTSTATUS                                               RtlLeaveCriticalSection(                            PRTL_CRITICAL_SECTION CriticalSection);
  BOOLEAN                                                RtlTryEnterCriticalSection(                         PRTL_CRITICAL_SECTION CriticalSection);
  VOID                                                   RtlpUnWaitCriticalSection(                          PRTL_CRITICAL_SECTION CriticalSection);
  NTSTATUS                                               RtlpWaitForCriticalSection(                         PRTL_CRITICAL_SECTION CriticalSection);
  VOID                                                   RtlConvertExclusiveToShared(                        PRTL_RESOURCE Resource);
  VOID                                                   RtlConvertSharedToExclusive(                        PRTL_RESOURCE Resource);
  NTSTATUS                                               RtlCompressBuffer(                                  USHORT CompressionFormatAndEngine, PUCHAR UncompressedBuffer, ULONG UncompressedBufferSize, PUCHAR CompressedBuffer, ULONG CompressedBufferSize, ULONG UncompressedChunkSize, PULONG FinalCompressedSize, PVOID WorkSpace);
  NTSTATUS                                               RtlDecompressBuffer(                                USHORT CompressionFormat, PUCHAR UncompressedBuffer, ULONG UncompressedBufferSize, PUCHAR CompressedBuffer, ULONG CompressedBufferSize, PULONG FinalUncompressedSize);
  NTSTATUS                                               RtlGetCompressionWorkSpaceSize(                     USHORT CompressionFormatAndEngine, PULONG CompressBufferWorkSpaceSize, PULONG CompressFragmentWorkSpaceSize);
  PRTL_DEBUG_INFORMATION                                 RtlCreateQueryDebugBuffer(                          ULONG Size, BOOLEAN EventPair);
  NTSTATUS                                               RtlDestroyQueryDebugBuffer(                         PRTL_DEBUG_INFORMATION DebugBuffer);
  NTSTATUS                                               RtlQueryProcessDebugInformation(                    ULONG ProcessId, RTL_DEBUG_QUERY_FLAGS DebugInfoClassMask, PRTL_DEBUG_INFORMATION DebugBuffer);
  BOOLEAN                                                RtlAreBitsClear(                                    PRTL_BITMAP BitMapHeader, ULONG StartingIndex, ULONG Length);
  BOOLEAN                                                RtlAreBitsSet(                                      PRTL_BITMAP BitMapHeader, ULONG StartingIndex, ULONG Length);
  VOID                                                   RtlClearBits(                                       PRTL_BITMAP BitMapHeader, ULONG StartingIndex, ULONG NumberToClear);
  ULONG                                                  RtlFindClearBits(                                   PRTL_BITMAP BitMapHeader, ULONG NumberToFind, ULONG HintIndex);
  ULONG                                                  RtlFindClearBitsAndSet(                             PRTL_BITMAP BitMapHeader, ULONG NumberToFind, ULONG HintIndex);
  ULONG                                                  RtlFindNextForwardRunClear(                         PRTL_BITMAP BitMapHeader, ULONG FromIndex, PULONG StartingRunIndex);
  VOID                                                   RtlInitializeBitMap(                                PRTL_BITMAP BitMapHeader, PULONG BitMapBuffer, ULONG SizeOfBitMap);
  ULONG                                                  RtlNumberOfSetBits(                                 PRTL_BITMAP BitMapHeader);
  VOID                                                   RtlSetBit(                                          PRTL_BITMAP BitMapHeader, ULONG BitNumber);
  VOID                                                   RtlSetBits(                                         PRTL_BITMAP BitMapHeader, ULONG StartingIndex, ULONG NumberToSet);
  VOID                                                   RtlSetAllBits(                                      PRTL_BITMAP BitMapHeader);
  BOOLEAN                                                RtlTestBit(                                         PRTL_BITMAP BitMapHeader, ULONG BitNumber);
  NTSTATUS                                               RtlCreateTimer(                                     HANDLE TimerQueue, PHANDLE phNewTimer, WAITORTIMERCALLBACKFUNC Callback, PVOID Parameter, ULONG DueTime, ULONG Period, ULONG Flags);
  NTSTATUS                                               RtlCreateTimerQueue(                                PHANDLE TimerQueue);
  NTSTATUS                                               RtlDeleteTimer(                                     HANDLE TimerQueue, HANDLE Timer, HANDLE CompletionEvent);
  NTSTATUS                                               RtlUpdateTimer(                                     HANDLE TimerQueue, HANDLE Timer, ULONG DueTime, ULONG Period);
  NTSTATUS                                               RtlDeleteTimerQueueEx(                              HANDLE TimerQueue, HANDLE CompletionEvent);
  NTSTATUS                                               RtlDeleteTimerQueue(                                HANDLE TimerQueue);
  VOID                                                   RtlFreeRangeList(                                   PRTL_RANGE_LIST RangeList);
  PVOID                                                  RtlInsertElementGenericTable(                       PRTL_GENERIC_TABLE Table, PVOID Buffer, ULONG BufferSize, PBOOLEAN NewElement);
  PVOID                                                  RtlInsertElementGenericTableFull(                   PRTL_GENERIC_TABLE Table, PVOID Buffer, ULONG BufferSize, PBOOLEAN NewElement, PVOID NodeOrParent, TABLE_SEARCH_RESULT SearchResult);
  BOOLEAN                                                RtlIsGenericTableEmpty(                             PRTL_GENERIC_TABLE Table);
  PVOID                                                  RtlLookupElementGenericTableFull(                   PRTL_GENERIC_TABLE Table, PVOID Buffer, PVOID* NodeOrParent, TABLE_SEARCH_RESULT* SearchResult);
  PRTL_HANDLE_TABLE_ENTRY                                RtlAllocateHandle(                                  PRTL_HANDLE_TABLE HandleTable, PULONG Index);
  VOID                                                   RtlDestroyHandleTable(                              PRTL_HANDLE_TABLE HandleTable);
  BOOLEAN                                                RtlFreeHandle(                                      PRTL_HANDLE_TABLE HandleTable, PRTL_HANDLE_TABLE_ENTRY Handle);
  VOID                                                   RtlInitializeHandleTable(                           ULONG TableSize, ULONG HandleSize, PRTL_HANDLE_TABLE HandleTable);
  BOOLEAN                                                RtlIsValidHandle(                                   PRTL_HANDLE_TABLE HandleTable, PRTL_HANDLE_TABLE_ENTRY Handle);
  BOOLEAN                                                RtlIsValidIndexHandle(                              PRTL_HANDLE_TABLE HandleTable, ULONG Index, PRTL_HANDLE_TABLE_ENTRY* Handle);
  NTSTATUS                                               RtlFindMessage(                                     PVOID BaseAddress, ULONG Type, ULONG Language, ULONG MessageId, PRTL_MESSAGE_RESOURCE_ENTRY* MessageResourceEntry);
  ULONG                                                  RtlGetNtGlobalFlags(                                );
  PVOID                                                  RtlImageDirectoryEntryToData(                       PVOID BaseAddress, BOOLEAN MappedAsImage, USHORT Directory, PULONG Size);
  PVOID                                                  RtlImageRvaToVa(                                    PIMAGE_NT_HEADERS NtHeader, PVOID BaseAddress, ULONG Rva, PIMAGE_SECTION_HEADER* SectionHeader);
  PIMAGE_NT_HEADERS                                      RtlImageNtHeader(                                   HMODULE_PVOID BaseAddress);
  NTSTATUS                                               RtlImageNtHeaderEx(                                 ULONG Flags, HMODULE_PVOID BaseAddress, ULONGLONG Size, PIMAGE_NT_HEADERS* NtHeader);
  PIMAGE_SECTION_HEADER                                  RtlImageRvaToSection(                               PIMAGE_NT_HEADERS NtHeader, PVOID BaseAddress, ULONG Rva);
  NTSTATUS                                               RtlActivateActivationContext(                       ULONG Unknown, HANDLE Handle, PULONG_PTR Cookie);
  VOID                                                   RtlAddRefActivationContext(                         PVOID Context);
  NTSTATUS                                               RtlAllocateActivationContextStack(                  PVOID* Context);
  NTSTATUS                                               RtlCreateActivationContext(                         DWORD dwFlags, PVOID ActivationContextData, ULONG ExtraBytes, PVOID NotificationRoutine, PVOID NotificationContext, PHANDLE ActCtx);
  NTSTATUS                                               RtlGetActiveActivationContext(                      PVOID* Context);
  VOID                                                   RtlReleaseActivationContext(                        PVOID* Context);
  LONG                                                   RtlDeactivateActivationContext(                     DWORD dwFlags, ULONG_PTR ulCookie);
  NTSTATUS                                               RtlDosApplyFileIsolationRedirection_Ustr(           BOOLEAN Unknown, PUNICODE_STRING OriginalName, PUNICODE_STRING Extension, PUNICODE_STRING RedirectedName, PUNICODE_STRING RedirectedName2, PUNICODE_STRING* OriginalName2, PVOID Unknown1, PVOID Unknown2, PVOID Unknown3);
  NTSTATUS                                               RtlFindActivationContextSectionString(              FIND_ACTCTX_SECTION_FLAGS dwFlags, GUID* ExtensionGuid, ACTIVATION_CONTEXT_SECTION SectionType, PUNICODE_STRING SectionName, PVOID ReturnedData);
  NTSTATUS                                               RtlQueryInformationActivationContext(               DWORD dwFlags, PVOID Context, PVOID pvSubInstance, ULONG ulInfoClass, PVOID pvBuffer, SIZE_T cbBuffer, SIZE_T* pcbWrittenOrRequired);
  NTSTATUS                                               RtlZombifyActivationContext(                        PVOID Context);
  NTSTATUS                                               RtlCheckRegistryKey(                                ULONG RelativeTo, PWSTR Path);
  NTSTATUS                                               RtlCreateRegistryKey(                               ULONG RelativeTo, PWSTR Path);
  NTSTATUS                                               RtlFormatCurrentUserKeyPath(                        PUNICODE_STRING KeyPath);
  NTSTATUS                                               RtlpNtOpenKey(                                      HANDLE KeyHandle, ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, ULONG Unused);
  NTSTATUS                                               RtlOpenCurrentUser(                                 ACCESS_MASK DesiredAccess, PHANDLE KeyHandle);
  NTSTATUS                                               RtlQueryRegistryValues(                             ULONG RelativeTo, PCWSTR Path, PRTL_QUERY_REGISTRY_TABLE QueryTable, PVOID Context, PVOID Environment);
  NTSTATUS                                               RtlWriteRegistryValue(                              ULONG RelativeTo, PCWSTR Path, PCWSTR ValueName, ULONG ValueType, PVOID ValueData, ULONG ValueLength);
  VOID                                                   RtlGetDefaultCodePage(                              PUSHORT AnsiCodePage, PUSHORT OemCodePage);
  VOID                                                   RtlInitNlsTables(                                   PUSHORT AnsiTableBase, PUSHORT OemTableBase, PUSHORT CaseTableBase, PNLSTABLEINFO NlsTable);
  VOID                                                   RtlInitCodePageTable(                               PUSHORT TableBase, PCPTABLEINFO CodePageTable);
  VOID                                                   RtlResetRtlTranslations(                            PNLSTABLEINFO NlsTable);
  ULONG                                                  RtlUniform(                                         PULONG Seed);
  ULONG                                                  RtlRandom(                                          PULONG Seed);
  ULONG                                                  RtlComputeCrc32(                                    USHORT PartialCrc, PUCHAR Buffer, ULONG Length);
  NTSTATUS                                               RtlQueryTimeZoneInformation(                        PRTL_TIME_ZONE_INFORMATION TimeZoneInformation);
  VOID                                                   RtlSecondsSince1970ToTime(                          ULONG SecondsSince1970, PLARGE_INTEGER Time);
  NTSTATUS                                               RtlSetTimeZoneInformation(                          PRTL_TIME_ZONE_INFORMATION TimeZoneInformation);
  BOOLEAN                                                RtlTimeFieldsToTime(                                PTIME_FIELDS TimeFields, PLARGE_INTEGER Time);
  BOOLEAN                                                RtlTimeToSecondsSince1970(                          PLARGE_INTEGER Time, PULONG SecondsSince1970);
  VOID                                                   RtlTimeToTimeFields(                                PLARGE_INTEGER Time, PTIME_FIELDS TimeFields);
  NTSTATUS                                               RtlSystemTimeToLocalTime(                           PLARGE_INTEGER SystemTime, PLARGE_INTEGER LocalTime);
  NTSTATUS                                               RtlVerifyVersionInfo(                               PRTL_OSVERSIONINFOEXW VersionInfo, NtVerType TypeMask, ULONGLONG ConditionMask);
  NTSTATUS                                               RtlGetVersion(                                      PRTL_OSVERSIONINFOW lpVersionInformation);
  BOOLEAN                                                RtlGetNtProductType(                                PNT_PRODUCT_TYPE ProductType);
  NTSTATUS                                               RtlRegisterSecureMemoryCacheCallback(               PRTL_SECURE_MEMORY_CACHE_CALLBACK Callback);
  BOOLEAN                                                RtlFlushSecureMemoryCache(                          PVOID MemoryCache, SIZE_T MemoryLength);
  VOID                                                   RtlInitializeGenericTableAvl(                       PRTL_AVL_TABLE Table, PRTL_AVL_COMPARE_ROUTINE CompareRoutine, PRTL_AVL_ALLOCATE_ROUTINE AllocateRoutine, PRTL_AVL_FREE_ROUTINE FreeRoutine, PVOID TableContext);
  PVOID                                                  RtlInsertElementGenericTableAvl(                    PRTL_AVL_TABLE Table, PVOID Buffer, CLONG BufferSize, PBOOLEAN NewElement);
  BOOLEAN                                                RtlDeleteElementGenericTableAvl(                    PRTL_AVL_TABLE Table, PVOID Buffer);
  PVOID                                                  RtlLookupElementGenericTableAvl(                    PRTL_AVL_TABLE Table, PVOID Buffer);
  PVOID                                                  RtlEnumerateGenericTableWithoutSplayingAvl(         PRTL_AVL_TABLE Table, PVOID* RestartKey);
  NTSTATUS                                               RtlAppendStringToString(                            PSTRING Destination, STRING* Source);
  USHORT                                                 RtlCaptureStackBackTrace(                           ULONG FramesToSkip, ULONG FramesToCapture, PVOID* BackTrace, PULONG BackTraceHash);
  SIZE_T                                                 RtlCompareMemoryUlong(                              PVOID Source, SIZE_T Length, ULONG Pattern);
  NTSTATUS                                               RtlCompressChunks(                                  PUCHAR UncompressedBuffer, ULONG UncompressedBufferSize, PUCHAR CompressedBuffer, ULONG CompressedBufferSize, PCOMPRESSED_DATA_INFO CompressedDataInfo, ULONG CompressedDataInfoLength, PVOID WorkSpace);
  NTSTATUS                                               RtlDecompressChunks(                                PUCHAR UncompressedBuffer, ULONG UncompressedBufferSize, PUCHAR CompressedBuffer, ULONG CompressedBufferSize, PUCHAR CompressedTail, ULONG CompressedTailSize, PCOMPRESSED_DATA_INFO CompressedDataInfo);
  NTSTATUS                                               RtlDecompressFragment(                              USHORT CompressionFormat, PUCHAR UncompressedFragment, ULONG UncompressedFragmentSize, PUCHAR CompressedBuffer, ULONG CompressedBufferSize, ULONG FragmentOffset, PULONG FinalUncompressedSize, PVOID WorkSpace);
  NTSTATUS                                               RtlDescribeChunk(                                   USHORT CompressionFormat, PUCHAR* CompressedBuffer, PUCHAR EndOfCompressedBufferPlus1, PUCHAR* ChunkBuffer, PULONG ChunkSize);
  VOID                                                   RtlGenerate8dot3Name(                               PUNICODE_STRING Name, BOOLEAN AllowExtendedCharacters, PGENERATE_NAME_CONTEXT Context, PUNICODE_STRING Name8dot3);
  NTSTATUS                                               RtlOemStringToCountedUnicodeString(                 PUNICODE_STRING DestinationString, PCOEM_STRING SourceString, BOOLEAN AllocateDestinationString);
  NTSTATUS                                               RtlUnicodeStringToCountedOemString(                 POEM_STRING DestinationString, PCUNICODE_STRING SourceString, BOOLEAN AllocateDestinationString);
  NTSTATUS                                               RtlReserveChunk(                                    USHORT CompressionFormat, PUCHAR* CompressedBuffer, PUCHAR EndOfCompressedBufferPlus1, PUCHAR* ChunkBuffer, ULONG ChunkSize);
  BOOLEAN                                                RtlTimeToSecondsSince1980(                          PLARGE_INTEGER Time, PULONG ElapsedSeconds);
  VOID                                                   RtlSecondsSince1980ToTime(                          ULONG ElapsedSeconds, PLARGE_INTEGER Time);
  PRTL_SPLAY_LINKS                                       RtlSplay(                                           PRTL_SPLAY_LINKS Links);
  PRTL_SPLAY_LINKS                                       RtlDelete(                                          PRTL_SPLAY_LINKS Links);
  VOID                                                   RtlDeleteNoSplay(                                   PRTL_SPLAY_LINKS Links, PRTL_SPLAY_LINKS* Root);
  PRTL_SPLAY_LINKS                                       RtlSubtreeSuccessor(                                PRTL_SPLAY_LINKS Links);
  PRTL_SPLAY_LINKS                                       RtlSubtreePredecessor(                              PRTL_SPLAY_LINKS Links);
  PRTL_SPLAY_LINKS                                       RtlRealSuccessor(                                   PRTL_SPLAY_LINKS Links);
  PRTL_SPLAY_LINKS                                       RtlRealPredecessor(                                 PRTL_SPLAY_LINKS Links);
  PVOID                                                  RtlAddVectoredExceptionHandler(                     ULONG FirstHandler, PVECTORED_EXCEPTION_HANDLER VectoredHandler);
  VOID                                                   RtlAssert(                                          PVOID FailedAssertion, PVOID FileName, ULONG LineNumber, PCHAR Message);
  PVOID                                                  RtlSetUnhandledExceptionFilter(                     PVOID TopLevelExceptionFilter);
  VOID                                                   RtlCaptureContext(                                  PCONTEXT ContextRecord);
  PVOID                                                  RtlEncodePointer(                                   PVOID Pointer);
  PVOID                                                  RtlDecodePointer(                                   PVOID Pointer);
  PVOID                                                  RtlEncodeSystemPointer(                             PVOID Pointer);
  PVOID                                                  RtlDecodeSystemPointer(                             PVOID Pointer);
  BOOLEAN                                                RtlDispatchException(                               PEXCEPTION_RECORD ExceptionRecord, PCONTEXT Context);
  ERROR_CODE_ULONG                                       RtlNtStatusToDosError(                              NTSTATUS Status);
  ERROR_CODE_ULONG                                       RtlNtStatusToDosErrorNoTeb(                         NTSTATUS Status);
  VOID                                                   RtlSetLastWin32ErrorAndNtStatusFromNtStatus(        NTSTATUS Status);
  VOID                                                   RtlRaiseStatus(                                     NTSTATUS Status);
  LONG                                                   RtlUnhandledExceptionFilter(                        EXCEPTION_POINTERS* ExceptionInfo);
  ULONG                                                  RtlWalkFrameChain(                                  PVOID* Callers, ULONG Count, ULONG Flags);
  USHORT                                                 RtlLogStackBackTrace(                               );
  PVOID                                                  RtlAllocateHeap(                                    HANDLE HeapHandle, HEAP_FLAGS_ULONG Flags, SIZE_T Size);
  PVOID                                                  RtlCreateHeap(                                      HEAP_FLAGS_ULONG Flags, PVOID BaseAddress, SIZE_T SizeToReserve, SIZE_T SizeToCommit, PVOID Lock, PRTL_HEAP_PARAMETERS Parameters);
  ULONG                                                  RtlCreateTagHeap(                                   HANDLE HeapHandle, ULONG Flags, PWSTR TagName, PWSTR TagSubName);
  ULONG                                                  RtlCompactHeap(                                     HANDLE Heap, HEAP_FLAGS_ULONG Flags);
  PVOID                                                  RtlDebugCreateHeap(                                 HEAP_FLAGS_ULONG Flags, PVOID BaseAddress, SIZE_T SizeToReserve, SIZE_T SizeToCommit, PVOID Lock, PRTL_HEAP_PARAMETERS Parameters);
  HANDLE                                                 RtlDestroyHeap(                                     HANDLE Heap);
  ULONG                                                  RtlExtendHeap(                                      HANDLE Heap, HEAP_FLAGS_ULONG Flags, PVOID P, SIZE_T Size);
  BOOLEAN                                                RtlFreeHeap(                                        HANDLE HeapHandle, HEAP_FLAGS_ULONG Flags, PVOID HeapBase);
  ULONG                                                  RtlGetProcessHeaps(                                 ULONG HeapCount, HANDLE* HeapArray);
  BOOLEAN                                                RtlGetUserInfoHeap(                                 PVOID HeapHandle, ULONG Flags, PVOID BaseAddress, PVOID* UserValue, PULONG UserFlags);
  PVOID                                                  RtlProtectHeap(                                     PVOID HeapHandle, BOOLEAN Protect);
  PWSTR                                                  RtlQueryTagHeap(                                    PVOID HeapHandle, ULONG Flags, USHORT TagIndex, BOOLEAN ResetCounters, PRTL_HEAP_TAG_INFO HeapTagInfo);
  PVOID                                                  RtlReAllocateHeap(                                  HANDLE Heap, HEAP_FLAGS_ULONG Flags, PVOID Ptr, SIZE_T Size);
  BOOLEAN                                                RtlLockHeap(                                        HANDLE Heap);
  NTSTATUS                                               RtlUsageHeap(                                       HANDLE Heap, HEAP_FLAGS_ULONG Flags, PRTL_HEAP_USAGE Usage);
  BOOLEAN                                                RtlUnlockHeap(                                      HANDLE Heap);
  BOOLEAN                                                RtlSetUserValueHeap(                                PVOID HeapHandle, ULONG Flags, PVOID BaseAddress, PVOID UserValue);
  BOOLEAN                                                RtlSetUserFlagsHeap(                                PVOID HeapHandle, ULONG Flags, PVOID BaseAddress, ULONG UserFlags);
  SIZE_T                                                 RtlSizeHeap(                                        PVOID HeapHandle, HEAP_FLAGS_ULONG Flags, PVOID MemoryPointer);
  BOOLEAN                                                RtlValidateHeap(                                    HANDLE Heap, HEAP_FLAGS_ULONG Flags, PVOID P);
  NTSTATUS                                               RtlWalkHeap(                                        HANDLE HeapHandle, PVOID HeapEntry);
  PSLIST_ENTRY                                           RtlFirstEntrySList(                                 PSLIST_HEADER ListHead);
  void                                                   RtlInitializeSListHead(                             PSLIST_HEADER ListHead);
  PSLIST_ENTRY                                           RtlInterlockedFlushSList(                           PSLIST_HEADER ListHead);
  PSLIST_ENTRY                                           RtlInterlockedPopEntrySList(                        PSLIST_HEADER ListHead);
  PSLIST_ENTRY                                           RtlInterlockedPushEntrySList(                       PSLIST_HEADER ListHead, PSLIST_ENTRY ListEntry);
  WORD                                                   RtlQueryDepthSList(                                 PSLIST_HEADER ListHead);
  NTSTATUS                                               RtlEnumProcessHeaps(                                PHEAP_ENUMERATION_ROUTINE HeapEnumerationRoutine, PVOID Param);
  PVOID                                                  RtlGetCallersAddress(                               PVOID* CallersAddress, PVOID* CallersCaller);
  VOID                                                   RtlSetCurrentEnvironment(                           PVOID NewEnvironment, PVOID* OldEnvironment);
  BOOLEAN                                                RtlValidateProcessHeaps(                            );
  NTSTATUS                                               RtlLocalTimeToSystemTime(                           PLARGE_INTEGER LocalTime, PLARGE_INTEGER SystemTime);
  LPTSTR                                                 RtlIpv4AddressToString(                             IN_ADDR* Addr, LPTSTR S);
  NTSTATUS                                               RtlIpv4AddressToStringEx(                           IN_ADDR* Address, USHORT Port, LPTSTR AddressString, PULONG AddressStringLength);
  NTSTATUS                                               RtlIpv4StringToAddress(                             PCTSTR String, BOOLEAN Strict, LPTSTR* Terminator, IN_ADDR* Addr);
  NTSTATUS                                               RtlIpv4StringToAddressEx(                           PCTSTR AddressString, BOOLEAN Strict, IN_ADDR* Address, PUSHORT Port);
  LPTSTR                                                 RtlIpv6AddressToString(                             IN6_ADDR* Addr, LPTSTR S);
  NTSTATUS                                               RtlIpv6AddressToStringEx(                           IN6_ADDR* Address, ULONG ScopeId, USHORT Port, LPTSTR AddressString, PULONG AddressStringLength);
  NTSTATUS                                               RtlIpv6StringToAddress(                             PCTSTR String, PCTSTR* Terminator, IN6_ADDR* Addr);
  NTSTATUS                                               RtlIpv6StringToAddressEx(                           PCTSTR AddressString, IN6_ADDR* Address, PULONG ScopeId, PUSHORT Port);
  NTSTATUS                                               RtlGetLastNtStatus(                                 );
  ERROR_CODE                                             RtlGetLastWin32Error(                               );
  void                                                   RtlSetLastWin32Error(                               ERROR_CODE err);
  NTSTATUS                                               NtAccessCheck(                                      PSECURITY_DESCRIPTOR SecurityDescriptor, HANDLE ClientToken, ACCESS_MASK DesiredAccess, PGENERIC_MAPPING GenericMapping, PPRIVILEGE_SET PrivilegeSet, PULONG ReturnLength, PACCESS_MASK GrantedAccess, PNTSTATUS AccessStatus);
  NTSTATUS                                               NtAccessCheckByType(                                PSECURITY_DESCRIPTOR SecurityDescriptor, PSID PrincipalSelfSid, HANDLE ClientToken, ACCESS_MASK DesiredAccess, POBJECT_TYPE_LIST ObjectTypeList, ULONG ObjectTypeLength, PGENERIC_MAPPING GenericMapping, PPRIVILEGE_SET PrivilegeSet, ULONG PrivilegeSetLength, PACCESS_MASK GrantedAccess, PNTSTATUS AccessStatus);
  NTSTATUS                                               NtAccessCheckByTypeResultList(                      PSECURITY_DESCRIPTOR SecurityDescriptor, PSID PrincipalSelfSid, HANDLE ClientToken, ACCESS_MASK DesiredAccess, POBJECT_TYPE_LIST ObjectTypeList, ULONG ObjectTypeLength, PGENERIC_MAPPING GenericMapping, PPRIVILEGE_SET PrivilegeSet, ULONG PrivilegeSetLength, PACCESS_MASK GrantedAccess, PNTSTATUS AccessStatus);
  NTSTATUS                                               NtAccessCheckAndAuditAlarm(                         PUNICODE_STRING SubsystemName, PVOID HandleId, PUNICODE_STRING ObjectTypeName, PUNICODE_STRING ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, ACCESS_MASK DesiredAccess, PGENERIC_MAPPING GenericMapping, BOOLEAN ObjectCreation, PACCESS_MASK GrantedAccess, PNTSTATUS AccessStatus, PBOOLEAN GenerateOnClose);
  NTSTATUS                                               NtOpenThreadToken(                                  ThreadHandle ThreadHandle, TOKEN_ACCESS_MASK DesiredAccess, BOOLEAN OpenAsSelf, PHANDLE TokenHandle);
  NTSTATUS                                               NtOpenThreadTokenEx(                                ThreadHandle ThreadHandle, TOKEN_ACCESS_MASK DesiredAccess, BOOLEAN OpenAsSelf, ULONG HandleAttributes, PHANDLE TokenHandle);
  NTSTATUS                                               NtAdjustGroupsToken(                                HANDLE TokenHandle, BOOLEAN ResetToDefault, PTOKEN_GROUPS NewState, ULONG BufferLength, PTOKEN_GROUPS PreviousState, PULONG ReturnLength);
  NTSTATUS                                               NtAdjustPrivilegesToken(                            HANDLE TokenHandle, BOOLEAN DisableAllPrivileges, PTOKEN_PRIVILEGES NewState, ULONG BufferLength, PTOKEN_PRIVILEGES PreviousState, PULONG ReturnLength);
  NTSTATUS                                               NtCompareTokens(                                    HANDLE FirstTokenHandle, HANDLE SecondTokenHandle, PBOOLEAN Equal);
  NTSTATUS                                               NtCreateToken(                                      PHANDLE TokenHandle, TOKEN_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, TOKEN_TYPE TokenType, PLUID AuthenticationId, PLARGE_INTEGER ExpirationTime, PTOKEN_USER TokenUser, PTOKEN_GROUPS TokenGroups, PTOKEN_PRIVILEGES TokenPrivileges, PTOKEN_OWNER TokenOwner, PTOKEN_PRIMARY_GROUP TokenPrimaryGroup, PTOKEN_DEFAULT_DACL TokenDefaultDacl, PTOKEN_SOURCE TokenSource);
  NTSTATUS                                               NtDuplicateToken(                                   HANDLE ExistingTokenHandle, TOKEN_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, BOOLEAN EffectiveOnly, TOKEN_TYPE TokenType, PHANDLE NewTokenHandle);
  NTSTATUS                                               NtImpersonateAnonymousToken(                        HANDLE Thread);
  NTSTATUS                                               NtOpenObjectAuditAlarm(                             PUNICODE_STRING SubsystemName, PVOID HandleId, PUNICODE_STRING ObjectTypeName, PUNICODE_STRING ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, HANDLE ClientToken, ULONG DesiredAccess, ULONG GrantedAccess, PPRIVILEGE_SET Privileges, BOOLEAN ObjectCreation, BOOLEAN AccessGranted, PBOOLEAN GenerateOnClose);
  NTSTATUS                                               NtCloseObjectAuditAlarm(                            PUNICODE_STRING SubsystemName, PVOID HandleId, BOOLEAN GenerateOnClose);
  NTSTATUS                                               NtDeleteObjectAuditAlarm(                           PUNICODE_STRING SubsystemName, PVOID HandleId, BOOLEAN GenerateOnClose);
  NTSTATUS                                               NtOpenProcessToken(                                 ProcessHandle ProcessHandle, TOKEN_ACCESS_MASK DesiredAccess, PHANDLE TokenHandle);
  NTSTATUS                                               NtOpenProcessTokenEx(                               ProcessHandle ProcessHandle, TOKEN_ACCESS_MASK DesiredAccess, ULONG HandleAttributes, PHANDLE TokenHandle);
  NTSTATUS                                               NtPrivilegeCheck(                                   HANDLE ClientToken, PPRIVILEGE_SET RequiredPrivileges, PBOOLEAN Result);
  NTSTATUS                                               NtPrivilegedServiceAuditAlarm(                      PUNICODE_STRING SubsystemName, PUNICODE_STRING ServiceName, HANDLE ClientToken, PPRIVILEGE_SET Privileges, BOOLEAN AccessGranted);
  NTSTATUS                                               NtPrivilegeObjectAuditAlarm(                        PUNICODE_STRING SubsystemName, PVOID HandleId, HANDLE ClientToken, ULONG DesiredAccess, PPRIVILEGE_SET Privileges, BOOLEAN AccessGranted);
  NTSTATUS                                               NtQueryInformationToken(                            HANDLE TokenHandle, TOKEN_INFORMATION_CLASS TokenInformationClass, PVOID TokenInformation, ULONG TokenInformationLength, PULONG ReturnLength);
  NTSTATUS                                               NtAccessCheckByTypeAndAuditAlarm(                   PUNICODE_STRING SubsystemName, HANDLE HandleId, PUNICODE_STRING ObjectTypeName, PUNICODE_STRING ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, PSID PrincipalSelfSid, ACCESS_MASK DesiredAccess, AUDIT_EVENT_TYPE AuditType, ULONG Flags, POBJECT_TYPE_LIST ObjectTypeList, ULONG ObjectTypeLength, PGENERIC_MAPPING GenericMapping, BOOLEAN ObjectCreation, PACCESS_MASK GrantedAccess, PNTSTATUS AccessStatus, PBOOLEAN GenerateOnClose);
  NTSTATUS                                               NtAccessCheckByTypeResultListAndAuditAlarm(         PUNICODE_STRING SubsystemName, HANDLE HandleId, PUNICODE_STRING ObjectTypeName, PUNICODE_STRING ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, PSID PrincipalSelfSid, ACCESS_MASK DesiredAccess, AUDIT_EVENT_TYPE AuditType, ULONG Flags, POBJECT_TYPE_LIST ObjectTypeList, ULONG ObjectTypeLength, PGENERIC_MAPPING GenericMapping, BOOLEAN ObjectCreation, PACCESS_MASK GrantedAccess, PNTSTATUS AccessStatus, PBOOLEAN GenerateOnClose);
  NTSTATUS                                               NtAccessCheckByTypeResultListAndAuditAlarmByHandle( PUNICODE_STRING SubsystemName, HANDLE HandleId, HANDLE ClientToken, PUNICODE_STRING ObjectTypeName, PUNICODE_STRING ObjectName, PSECURITY_DESCRIPTOR SecurityDescriptor, PSID PrincipalSelfSid, ACCESS_MASK DesiredAccess, AUDIT_EVENT_TYPE AuditType, ULONG Flags, POBJECT_TYPE_LIST ObjectTypeList, ULONG ObjectTypeLength, PGENERIC_MAPPING GenericMapping, BOOLEAN ObjectCreation, PACCESS_MASK GrantedAccess, PNTSTATUS AccessStatus, PBOOLEAN GenerateOnClose);
  NTSTATUS                                               NtSetInformationToken(                              HANDLE TokenHandle, TOKEN_INFORMATION_CLASS TokenInformationClass, PVOID TokenInformation, ULONG TokenInformationLength);
  NTSTATUS                                               NtImpersonateThread(                                ThreadHandle ThreadHandle, HANDLE ThreadToImpersonate, PSECURITY_QUALITY_OF_SERVICE SecurityQualityOfService);
  NTSTATUS                                               NtCreateProcess(                                    PHANDLE ProcessHandle, ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, HANDLE ParentProcess, BOOLEAN InheritObjectTable, HANDLE SectionHandle, HANDLE DebugPort, HANDLE ExceptionPort);
  NTSTATUS                                               NtCreateProcessEx(                                  PHANDLE ProcessHandle, ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, HANDLE ParentProcess, ULONG Flags, HANDLE SectionHandle, HANDLE DebugPort, HANDLE ExceptionPort, BOOLEAN InJob);
  NTSTATUS                                               NtCreateThread(                                     PHANDLE ThreadHandle, THREAD_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, ProcessHandle ProcessHandle, PCLIENT_ID ClientId, PCONTEXT ThreadContext, PINITIAL_TEB UserStack, BOOLEAN CreateSuspended);
  NTSTATUS                                               NtCreateThreadEx(                                   PHANDLE ThreadHandle, THREAD_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, ProcessHandle ProcessHandle, PTHREAD_START_ROUTINE StartAddress, PVOID Parameter, BOOLEAN CreateSuspended, ULONG StackZeroBits, SIZE_T StackCommit, SIZE_T StackReserve, PTHREADEX_DATA pThreadExData);
  NTSTATUS                                               NtOpenJobObject(                                    PHANDLE JobHandle, ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes);
  NTSTATUS                                               NtAssignProcessToJobObject(                         HANDLE JobHandle, ProcessHandle ProcessHandle);
  NTSTATUS                                               NtCreateJobObject(                                  PHANDLE JobHandle, ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes);
  NTSTATUS                                               NtCreateJobSet(                                     ULONG NumJob, PJOB_SET_ARRAY UserJobSet, ULONG Flags);
  NTSTATUS                                               NtQueryInformationJobObject(                        HANDLE JobHandle, JOBOBJECTINFOCLASS JobInformationClass, PVOID JobInformation, ULONG JobInformationLength, PULONG ReturnLength);
  NTSTATUS                                               NtQueryInformationProcess(                          ProcessHandle ProcessHandle, PROCESSINFOCLASS ProcessInformationClass, PVOID ProcessInformation, ULONG ProcessInformationLength, PULONG ReturnLength);
  NTSTATUS                                               NtQueryInformationThread(                           ThreadHandle ThreadHandle, THREADINFOCLASS ThreadInformationClass, PVOID ThreadInformation, ULONG ThreadInformationLength, PULONG ReturnLength);
  NTSTATUS                                               NtSetInformationJobObject(                          HANDLE JobHandle, JOBOBJECTINFOCLASS JobInformationClass, PVOID JobInformation, ULONG JobInformationLength);
  NTSTATUS                                               NtSetInformationProcess(                            ProcessHandle ProcessHandle, PROCESSINFOCLASS ProcessInformationClass, PVOID ProcessInformation, ULONG ProcessInformationLength);
  NTSTATUS                                               NtSetInformationThread(                             ThreadHandle ThreadHandle, THREADINFOCLASS ThreadInformationClass, PVOID ThreadInformation, ULONG ThreadInformationLength);
  NTSTATUS                                               NtSuspendProcess(                                   ProcessHandle ProcessHandle);
  NTSTATUS                                               NtSuspendThread(                                    ThreadHandle ThreadHandle, PULONG PreviousSuspendCount);
  NTSTATUS                                               NtTerminateThread(                                  ThreadHandle ThreadHandle, NTSTATUS ExitStatus);
  NTSTATUS                                               NtTerminateJobObject(                               HANDLE JobHandle, NTSTATUS ExitStatus);
  NTSTATUS                                               NtIsProcessInJob(                                   ProcessHandle ProcessHandle, HANDLE JobHandle);
  NTSTATUS                                               NtOpenProcess(                                      PHANDLE ProcessHandle, PROCESS_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, PCLIENT_ID ClientId);
  NTSTATUS                                               NtOpenThread(                                       PHANDLE ThreadHandle, THREAD_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, PCLIENT_ID ClientId);
  NTSTATUS                                               NtResumeThread(                                     ThreadHandle ThreadHandle, PULONG SuspendCount);
  NTSTATUS                                               NtResumeProcess(                                    ProcessHandle ProcessHandle);
  NTSTATUS                                               NtDelayExecution(                                   BOOLEAN Alertable, PLARGE_INTEGER DelayInterval);
  NTSTATUS                                               NtYieldExecution(                                   );
  NTSTATUS                                               NtAlertResumeThread(                                ThreadHandle ThreadHandle, PULONG SuspendCount);
  NTSTATUS                                               NtAlertThread(                                      ThreadHandle ThreadHandle);
  NTSTATUS                                               NtQueueApcThread(                                   ThreadHandle ThreadHandle, PIO_APC_ROUTINE ApcRoutine, PVOID ApcRoutineContext, PIO_STATUS_BLOCK ApcStatusBlock, ULONG ApcReserved);
  PTEB                                                   NtCurrentTeb(                                       );
  NTSTATUS                                               NtSetHighWaitLowThread(                             );
  NTSTATUS                                               NtSetLowWaitHighThread(                             );
  ULONG                                                  NtGetCurrentProcessorNumber(                        );
  NTSTATUS                                               NtTestAlert(                                        );
  NTSTATUS                                               NtCreateUserProcess(                                PHANDLE ProcessHandle, PHANDLE ThreadHandle, PROCESS_ACCESS_MASK ProcessDesiredAccess, THREAD_ACCESS_MASK ThreadDesiredAccess, POBJECT_ATTRIBUTES ProcessObjectAttributes, POBJECT_ATTRIBUTES ThreadObjectAttributes, ULONG CreateProcessFlags, ULONG CreateThreadFlags, PRTL_USER_PROCESS_PARAMETERS ProcessParameters, PVOID Unknown, PVOID AttributeList);
  NTSTATUS                                               NtEnumerateSystemEnvironmentValuesEx(               ULONG InformationClass, PVOID Buffer, ULONG BufferLength);
  NTSTATUS                                               NtQuerySystemEnvironmentValue(                      PUNICODE_STRING Name, PWSTR Value, ULONG Length, PULONG ReturnLength);
  NTSTATUS                                               NtQuerySystemEnvironmentValueEx(                    PUNICODE_STRING VariableName, LPGUID VendorGuid, PVOID Value, PULONG ReturnLength, PULONG Attributes);
  NTSTATUS                                               NtSetSystemEnvironmentValue(                        PUNICODE_STRING VariableName, PUNICODE_STRING Value);
  NTSTATUS                                               NtSetSystemEnvironmentValueEx(                      PUNICODE_STRING VariableName, LPGUID VendorGuid);
  NTSTATUS                                               NtAllocateVirtualMemory(                            ProcessHandle ProcessHandle, PVOID* BaseAddress, ULONG_PTR ZeroBits, PSIZE_T RegionSize, MemoryAllocationFlags AllocationType, NtProtectionFlags Protect);
  NTSTATUS                                               NtFlushVirtualMemory(                               ProcessHandle ProcessHandle, PVOID* BaseAddress, PSIZE_T RegionSize, PIO_STATUS_BLOCK IoStatus);
  NTSTATUS                                               NtFreeVirtualMemory(                                ProcessHandle ProcessHandle, PVOID* BaseAddress, PSIZE_T RegionSize, MemoryAllocationFlags FreeType);
  NTSTATUS                                               NtLockVirtualMemory(                                ProcessHandle ProcessHandle, PVOID BaseAddress, SIZE_T NumberOfBytesToLock, PSIZE_T NumberOfBytesLocked);
  NTSTATUS                                               NtProtectVirtualMemory(                             ProcessHandle ProcessHandle, PVOID* BaseAddress, SIZE_T* NumberOfBytesToProtect, NtProtectionFlags NewAccessProtection, NtProtectionFlags* OldAccessProtection);
  NTSTATUS                                               NtQueryVirtualMemory(                               ProcessHandle ProcessHandle, PVOID Address, MEMORY_INFORMATION_CLASS VirtualMemoryInformationClass, PVOID VirtualMemoryInformation, SIZE_T Length, PSIZE_T ResultLength);
  NTSTATUS                                               NtReadVirtualMemory(                                ProcessHandle ProcessHandle, PVOID BaseAddress, PVOID Buffer, SIZE_T NumberOfBytesToRead, PSIZE_T NumberOfBytesRead);
  NTSTATUS                                               NtUnlockVirtualMemory(                              ProcessHandle ProcessHandle, PVOID BaseAddress, SIZE_T NumberOfBytesToUnlock, PSIZE_T NumberOfBytesUnlocked);
  NTSTATUS                                               NtWriteVirtualMemory(                               ProcessHandle ProcessHandle, PVOID BaseAddress, PVOID Buffer, SIZE_T NumberOfBytesToWrite, PSIZE_T NumberOfBytesWritten);
  NTSTATUS                                               NtAllocateUserPhysicalPages(                        ProcessHandle ProcessHandle, PULONG_PTR NumberOfPages, PULONG_PTR UserPfnArray);
  NTSTATUS                                               NtFreeUserPhysicalPages(                            ProcessHandle ProcessHandle, PULONG_PTR NumberOfPages, PULONG_PTR UserPfnArray);
  NTSTATUS                                               NtMapUserPhysicalPages(                             PVOID VirtualAddresses, ULONG_PTR NumberOfPages, PULONG_PTR UserPfnArray);
  NTSTATUS                                               NtMapUserPhysicalPagesScatter(                      PVOID* VirtualAddresses, ULONG_PTR NumberOfPages, PULONG_PTR UserPfnArray);
  NTSTATUS                                               NtGetWriteWatch(                                    ProcessHandle ProcessHandle, ULONG Flags, PVOID BaseAddress, SIZE_T RegionSize, PVOID* UserAddressArray, PULONG_PTR EntriesInUserAddressArray, PULONG Granularity);
  NTSTATUS                                               NtResetWriteWatch(                                  ProcessHandle ProcessHandle, PVOID BaseAddress, SIZE_T RegionSize);
  NTSTATUS                                               NtCancelIoFile(                                     HANDLE FileHandle, PIO_STATUS_BLOCK IoStatusBlock);
  NTSTATUS                                               NtCreateFile(                                       PHANDLE FileHandle, FILE_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, PIO_STATUS_BLOCK IoStatusBlock, PLARGE_INTEGER AllocationSize, FILE_ATTRIBUTES_ULONG FileAttributes, FileShareMode ShareAccess, NtCreateDisposition CreateDisposition, NtCreateOptions CreateOptions, PVOID EaBuffer, ULONG EaLength);
  NTSTATUS                                               NtCreateIoCompletion(                               PHANDLE IoCompletionHandle, IO_COMPLETION_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, ULONG NumberOfConcurrentThreads);
  NTSTATUS                                               NtOpenFile(                                         PHANDLE FileHandle, FILE_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, PIO_STATUS_BLOCK IoStatusBlock, FileShareMode ShareAccess, NtCreateOptions OpenOptions);
  NTSTATUS                                               NtOpenIoCompletion(                                 PHANDLE CompetionPort, IO_COMPLETION_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes);
  NTSTATUS                                               NtQueryIoCompletion(                                HANDLE IoCompletionHandle, IO_COMPLETION_INFORMATION_CLASS IoCompletionInformationClass, PVOID IoCompletionInformation, ULONG IoCompletionInformationLength, PULONG ResultLength);
  NTSTATUS                                               NtRemoveIoCompletion(                               HANDLE IoCompletionHandle, PVOID* CompletionKey, PVOID* CompletionContext, PIO_STATUS_BLOCK IoStatusBlock, PLARGE_INTEGER Timeout);
  NTSTATUS                                               NtSetIoCompletion(                                  HANDLE IoCompletionPortHandle, PVOID CompletionKey, PVOID CompletionContext, NTSTATUS CompletionStatus, ULONG CompletionInformation);
  NTSTATUS                                               NtCreateSymbolicLinkObject(                         PHANDLE SymbolicLinkHandle, ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, PUNICODE_STRING Name);
  NTSTATUS                                               NtOpenSymbolicLinkObject(                           PHANDLE SymbolicLinkHandle, ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes);
  NTSTATUS                                               NtQuerySymbolicLinkObject(                          HANDLE SymLinkObjHandle, PUNICODE_STRING LinkTarget, PULONG DataWritten);
  NTSTATUS                                               NtDeleteFile(                                       POBJECT_ATTRIBUTES ObjectAttributes);
  NTSTATUS                                               NtQueryFullAttributesFile(                          POBJECT_ATTRIBUTES ObjectAttributes, PFILE_NETWORK_OPEN_INFORMATION FileInformation);
  NTSTATUS                                               NtQueryInformationFile(                             HANDLE FileHandle, PIO_STATUS_BLOCK IoStatusBlock, PVOID FileInformation, ULONG Length, FILE_INFORMATION_CLASS FileInformationClass);
  NTSTATUS                                               NtLockFile(                                         HANDLE FileHandle, HANDLE Event, PIO_APC_ROUTINE ApcRoutine, PVOID ApcContext, PIO_STATUS_BLOCK IoStatusBlock, PLARGE_INTEGER ByteOffset, PLARGE_INTEGER Length, ULONG Key, BOOLEAN FailImmediatedly, BOOLEAN ExclusiveLock);
  NTSTATUS                                               NtUnlockFile(                                       HANDLE FileHandle, PIO_STATUS_BLOCK IoStatusBlock, PLARGE_INTEGER ByteOffset, PLARGE_INTEGER Lenght, ULONG Key);
  NTSTATUS                                               NtWriteFile(                                        HANDLE FileHandle, HANDLE Event, PIO_APC_ROUTINE ApcRoutine, PVOID ApcContext, PIO_STATUS_BLOCK IoStatusBlock, PVOID Buffer, ULONG Length, PLARGE_INTEGER ByteOffset, PULONG Key);
  NTSTATUS                                               NtWriteFileGather(                                  HANDLE FileHandle, HANDLE Event, PIO_APC_ROUTINE ApcRoutine, PVOID ApcContext, PIO_STATUS_BLOCK IoStatusBlock, FILE_SEGMENT_ELEMENT[] BufferDescription, ULONG BufferLength, PLARGE_INTEGER ByteOffset, PULONG Key);
  NTSTATUS                                               NtReadFile(                                         HANDLE FileHandle, HANDLE Event, PIO_APC_ROUTINE UserApcRoutine, PVOID UserApcContext, PIO_STATUS_BLOCK IoStatusBlock, PVOID Buffer, ULONG BufferLength, PLARGE_INTEGER ByteOffset, PULONG Key);
  NTSTATUS                                               NtReadFileScatter(                                  HANDLE FileHandle, HANDLE Event, PIO_APC_ROUTINE UserApcRoutine, PVOID UserApcContext, PIO_STATUS_BLOCK UserIoStatusBlock, FILE_SEGMENT_ELEMENT[] BufferDescription, ULONG BufferLength, PLARGE_INTEGER ByteOffset, PULONG Key);
  NTSTATUS                                               NtFlushBuffersFile(                                 HANDLE FileHandle, PIO_STATUS_BLOCK IoStatusBlock);
  NTSTATUS                                               NtSetInformationFile(                               HANDLE FileHandle, PIO_STATUS_BLOCK IoStatusBlock, PVOID FileInformation, ULONG Length, FILE_INFORMATION_CLASS FileInformationClass);
  NTSTATUS                                               NtQueryAttributesFile(                              POBJECT_ATTRIBUTES ObjectAttributes, PFILE_BASIC_INFORMATION FileInformation);
  NTSTATUS                                               NtQueryEaFile(                                      HANDLE FileHandle, PIO_STATUS_BLOCK IoStatusBlock, PVOID Buffer, ULONG Length, BOOLEAN ReturnSingleEntry, PVOID EaList, ULONG EaListLength, PULONG EaIndex, BOOLEAN RestartScan);
  NTSTATUS                                               NtSetEaFile(                                        HANDLE FileHandle, PIO_STATUS_BLOCK IoStatusBlock, PVOID EaBuffer, ULONG EaBufferSize);
  NTSTATUS                                               NtQueryQuotaInformationFile(                        HANDLE FileHandle, PIO_STATUS_BLOCK IoStatusBlock, PVOID Buffer, ULONG Length, BOOLEAN ReturnSingleEntry, PVOID SidList, ULONG SidListLength, PSID StartSid, BOOLEAN RestartScan);
  NTSTATUS                                               NtSetQuotaInformationFile(                          HANDLE FileHandle, PIO_STATUS_BLOCK IoStatusBlock, PVOID Buffer, ULONG BufferLength);
  NTSTATUS                                               NtCreatePagingFile(                                 PUNICODE_STRING FileName, PLARGE_INTEGER InitialSize, PLARGE_INTEGER MaxiumSize, ULONG Reserved);
  NTSTATUS                                               NtTranslateFilePath(                                PFILE_PATH InputFilePath, ULONG OutputType, PFILE_PATH OutputFilePath, ULONG OutputFilePathLength);
  NTSTATUS                                               NtCreateDirectoryObject(                            PHANDLE DirectoryHandle, DIRECTORY_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes);
  NTSTATUS                                               NtOpenDirectoryObject(                              PHANDLE FileHandle, DIRECTORY_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes);
  NTSTATUS                                               NtQueryDirectoryObject(                             HANDLE DirectoryHandle, PVOID Buffer, ULONG BufferLength, BOOLEAN ReturnSingleEntry, BOOLEAN RestartScan, PULONG Context, PULONG ReturnLength);
  NTSTATUS                                               NtNotifyChangeDirectoryFile(                        HANDLE FileHandle, HANDLE Event, PIO_APC_ROUTINE ApcRoutine, PVOID ApcContext, PIO_STATUS_BLOCK IoStatusBlock, PVOID Buffer, ULONG BufferSize, FILE_NOTIFY_CHANGE_FLAGS CompletionFilter, BOOLEAN WatchTree);
  NTSTATUS                                               NtQueryDirectoryFile(                               HANDLE FileHandle, HANDLE Event, PIO_APC_ROUTINE ApcRoutine, PVOID ApcContext, PIO_STATUS_BLOCK IoStatusBlock, PVOID FileInformation, ULONG Length, FILE_INFORMATION_CLASS FileInformationClass, BOOLEAN ReturnSingleEntry, PUNICODE_STRING FileName, BOOLEAN RestartScan);
  NTSTATUS                                               NtQueryOleDirectoryFile(                            HANDLE FileHandle, HANDLE Event, PIO_APC_ROUTINE ApcRoutine, PVOID ApcContext, PIO_STATUS_BLOCK IoStatusBlock, PVOID FileInformation, ULONG Length, FILE_INFORMATION_CLASS FileInformationClass, BOOLEAN ReturnSingleEntry, PUNICODE_STRING FileMask, BOOLEAN RestartScan);
  NTSTATUS                                               NtQueryVolumeInformationFile(                       HANDLE FileHandle, PIO_STATUS_BLOCK IoStatusBlock, PVOID FsInformation, ULONG Length, FS_INFORMATION_CLASS FsInformationClass);
  NTSTATUS                                               NtSetVolumeInformationFile(                         HANDLE FileHandle, PIO_STATUS_BLOCK IoStatusBlock, PVOID FsInformation, ULONG Length, FS_INFORMATION_CLASS FsInformationClass);
  NTSTATUS                                               NtCreateSection(                                    PHANDLE SectionHandle, SECTION_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, PLARGE_INTEGER MaximumSize, NtProtectionFlags SectionPageProtection, SECTION_ALLOCATION AllocationAttributes, HANDLE FileHandle);
  NTSTATUS                                               NtExtendSection(                                    HANDLE SectionHandle, PLARGE_INTEGER NewMaximumSize);
  NTSTATUS                                               NtMapViewOfSection(                                 HANDLE SectionHandle, ProcessHandle ProcessHandle, PVOID* BaseAddress, ULONG_PTR ZeroBits, SIZE_T CommitSize, PLARGE_INTEGER SectionOffset, PSIZE_T ViewSize, SECTION_INHERIT InheritDisposition, MemoryAllocationFlags AllocationType, NtProtectionFlags AccessProtection);
  NTSTATUS                                               NtOpenSection(                                      PHANDLE SectionHandle, SECTION_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes);
  NTSTATUS                                               NtQuerySection(                                     HANDLE SectionHandle, SECTION_INFORMATION_CLASS SectionInformationClass, PVOID SectionInformation, SIZE_T Length, PSIZE_T ResultLength);
  NTSTATUS                                               NtUnmapViewOfSection(                               ProcessHandle ProcessHandle, PVOID BaseAddress);
  NTSTATUS                                               NtAcceptConnectPort(                                PHANDLE PortHandle, PVOID PortContext, PPORT_MESSAGE ConnectionRequest, BOOLEAN AcceptConnection, PPORT_VIEW ServerView, PREMOTE_PORT_VIEW ClientView);
  NTSTATUS                                               NtCompleteConnectPort(                              HANDLE PortHandle);
  NTSTATUS                                               NtConnectPort(                                      PHANDLE PortHandle, PUNICODE_STRING PortName, PSECURITY_QUALITY_OF_SERVICE SecurityQos, PPORT_VIEW ClientView, PREMOTE_PORT_VIEW ServerView, PULONG MaxMessageLength, PVOID ConnectionInformation, PULONG ConnectionInformationLength);
  NTSTATUS                                               NtCreatePort(                                       PHANDLE PortHandle, POBJECT_ATTRIBUTES ObjectAttributes, ULONG MaxConnectionInfoLength, ULONG MaxMessageLength, ULONG MaxPoolUsage);
  NTSTATUS                                               NtCreateWaitablePort(                               PHANDLE PortHandle, POBJECT_ATTRIBUTES ObjectAttributes, ULONG MaxConnectInfoLength, ULONG MaxDataLength, ULONG NPMessageQueueSize);
  NTSTATUS                                               NtImpersonateClientOfPort(                          HANDLE PortHandle, PPORT_MESSAGE ClientMessage);
  NTSTATUS                                               NtListenPort(                                       HANDLE PortHandle, PPORT_MESSAGE ConnectionRequest);
  NTSTATUS                                               NtQueryInformationPort(                             HANDLE PortHandle, PORT_INFORMATION_CLASS PortInformationClass, PVOID PortInformation, ULONG PortInformationLength, PULONG ReturnLength);
  NTSTATUS                                               NtQueryPortInformationProcess(                      );
  NTSTATUS                                               NtReadRequestData(                                  HANDLE PortHandle, PPORT_MESSAGE Message, ULONG Index, PVOID Buffer, ULONG BufferLength, PULONG ReturnLength);
  NTSTATUS                                               NtReplyPort(                                        HANDLE PortHandle, PPORT_MESSAGE LpcReply);
  NTSTATUS                                               NtReplyWaitReceivePort(                             HANDLE PortHandle, PVOID* PortContext, PPORT_MESSAGE ReplyMessage, PPORT_MESSAGE ReceiveMessage);
  NTSTATUS                                               NtReplyWaitReceivePortEx(                           HANDLE PortHandle, PVOID* PortContext, PPORT_MESSAGE ReplyMessage, PPORT_MESSAGE ReceiveMessage, PLARGE_INTEGER Timeout);
  NTSTATUS                                               NtReplyWaitReplyPort(                               HANDLE PortHandle, PPORT_MESSAGE ReplyMessage);
  NTSTATUS                                               NtRequestPort(                                      HANDLE PortHandle, PPORT_MESSAGE LpcMessage);
  NTSTATUS                                               NtRequestWaitReplyPort(                             HANDLE PortHandle, PPORT_MESSAGE LpcReply, PPORT_MESSAGE LpcRequest);
  NTSTATUS                                               NtSecureConnectPort(                                PHANDLE PortHandle, PUNICODE_STRING PortName, PSECURITY_QUALITY_OF_SERVICE SecurityQos, PPORT_VIEW ClientView, PSID Sid, PREMOTE_PORT_VIEW ServerView, PULONG MaxMessageLength, PVOID ConnectionInformation, PULONG ConnectionInformationLength);
  NTSTATUS                                               NtWriteRequestData(                                 HANDLE PortHandle, PPORT_MESSAGE Message, ULONG Index, PVOID Buffer, ULONG BufferLength, PULONG ReturnLength);
  NTSTATUS                                               NtSetDefaultHardErrorPort(                          HANDLE PortHandle);
  NTSTATUS                                               NtRegisterThreadTerminatePort(                      HANDLE TerminationPort);
  NTSTATUS                                               NtAddBootEntry(                                     PBOOT_ENTRY BootEntry, ULONG Id);
  NTSTATUS                                               NtAddDriverEntry(                                   PEFI_DRIVER_ENTRY BootEntry, ULONG Id);
  NTSTATUS                                               NtDeleteDriverEntry(                                ULONG Id);
  NTSTATUS                                               NtDeleteBootEntry(                                  ULONG Id);
  NTSTATUS                                               NtEnumerateBootEntries(                             PVOID Buffer, PULONG BufferLength);
  NTSTATUS                                               NtEnumerateDriverEntries(                           PVOID Buffer, PULONG BufferLength);
  NTSTATUS                                               NtLoadDriver(                                       PUNICODE_STRING DriverServiceName);
  NTSTATUS                                               NtModifyBootEntry(                                  PBOOT_ENTRY BootEntry);
  NTSTATUS                                               NtModifyDriverEntry(                                PEFI_DRIVER_ENTRY DriverEntry);
  NTSTATUS                                               NtQueryDriverEntryOrder(                            PULONG Ids, PULONG Count);
  NTSTATUS                                               NtQueryBootEntryOrder(                              PULONG Ids, PULONG Count);
  NTSTATUS                                               NtQueryBootOptions(                                 PBOOT_OPTIONS BootOptions, PULONG BootOptionsLength);
  NTSTATUS                                               NtSetBootEntryOrder(                                PULONG Ids, PULONG Count);
  NTSTATUS                                               NtSetBootOptions(                                   PBOOT_OPTIONS BootOptions, ULONG FieldsToChange);
  NTSTATUS                                               NtSetDriverEntryOrder(                              PULONG Ids, PULONG Count);
  NTSTATUS                                               NtUnloadDriver(                                     PUNICODE_STRING DriverServiceName);
  NTSTATUS                                               NtCreateProfile(                                    PHANDLE ProfileHandle, HANDLE Process, PVOID ImageBase, ULONG ImageSize, ULONG BucketSize, PVOID Buffer, ULONG BufferSize, KPROFILE_SOURCE ProfileSource, KAFFINITY Affinity);
  NTSTATUS                                               NtQueryIntervalProfile(                             KPROFILE_SOURCE ProfileSource, PULONG Interval);
  NTSTATUS                                               NtSetIntervalProfile(                               ULONG Interval, KPROFILE_SOURCE Source);
  NTSTATUS                                               NtStartProfile(                                     HANDLE ProfileHandle);
  NTSTATUS                                               NtStopProfile(                                      HANDLE ProfileHandle);
  NTSTATUS                                               NtDebugActiveProcess(                               HANDLE Process, HANDLE DebugObject);
  NTSTATUS                                               NtDebugContinue(                                    HANDLE DebugObject, PCLIENT_ID AppClientId, NTSTATUS ContinueStatus);
  NTSTATUS                                               NtWaitForDebugEvent(                                HANDLE DebugObject, BOOLEAN Alertable, PLARGE_INTEGER Timeout, PDBGUI_WAIT_STATE_CHANGE StateChange);
  NTSTATUS                                               NtRemoveProcessDebug(                               HANDLE Process, HANDLE DebugObject);
  NTSTATUS                                               NtSetInformationDebugObject(                        HANDLE DebugObject, DEBUGOBJECTINFOCLASS InformationClass, PVOID Information, ULONG InformationLength, PULONG ReturnLength);
  NTSTATUS                                               NtCreateDebugObject(                                PHANDLE DebugHandle, DEBUG_OBJECT_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, BOOLEAN KillProcessOnExit);
  NTSTATUS                                               NtGetContextThread(                                 ThreadHandle ThreadHandle, PCONTEXT pContext);
  NTSTATUS                                               NtSetContextThread(                                 ThreadHandle ThreadHandle, PCONTEXT Context);
  NTSTATUS                                               NtContinue(                                         PCONTEXT ThreadContext, BOOLEAN RaiseAlert);
  NTSTATUS                                               NtFlushInstructionCache(                            ProcessHandle ProcessHandle, PVOID BaseAddress, ULONG NumberOfBytesToFlush);
  NTSTATUS                                               NtFlushWriteBuffer(                                 );
  NTSTATUS                                               NtSystemDebugControl(                               SYSDBG_COMMAND ControlCode, PVOID InputBuffer, ULONG InputBufferLength, PVOID OutputBuffer, ULONG OutputBufferLength, PULONG ReturnLength);
  NTSTATUS                                               NtQuerySystemTime(                                  PLARGE_INTEGER SystemTime);
  NTSTATUS                                               NtSetSystemTime(                                    PLARGE_INTEGER SystemTime, PLARGE_INTEGER PreviousTime);
  ULONG                                                  NtGetTickCount(                                     );
  NTSTATUS                                               NtAllocateLocallyUniqueId(                          LUID* LocallyUniqueId);
  NTSTATUS                                               NtAllocateUuids(                                    PULARGE_INTEGER Time, PULONG Range, PULONG Sequence, PUCHAR Seed);
  NTSTATUS                                               NtSetUuidSeed(                                      PUCHAR UuidSeed);
  NTSTATUS                                               NtQueryDebugFilterState(                            ULONG ComponentId, ULONG Level);
  NTSTATUS                                               NtSetDebugFilterState(                              ULONG ComponentId, ULONG Level, BOOLEAN State);
  NTSTATUS                                               NtApphelpCacheControl(                              APPHELPCACHESERVICECLASS Service, PVOID ServiceData);
  NTSTATUS                                               NtAreMappedFilesTheSame(                            PVOID File1MappedAsAnImage, PVOID File2MappedAsFile);
  NTSTATUS                                               NtShutdownSystem(                                   SHUTDOWN_ACTION Action);
  NTSTATUS                                               NtPowerInformation(                                 POWER_INFORMATION_LEVEL PowerInformationLevel, PVOID InputBuffer, ULONG InputBufferLength, PVOID OutputBuffer, ULONG OutputBufferLength);
  NTSTATUS                                               NtSetSystemPowerState(                              POWER_ACTION SystemAction, SYSTEM_POWER_STATE MinSystemState, ULONG Flags);
  NTSTATUS                                               NtDisplayString(                                    PUNICODE_STRING DisplayString);
  NTSTATUS                                               NtInitiatePowerAction(                              POWER_ACTION SystemAction, SYSTEM_POWER_STATE MinSystemState, ULONG Flags, BOOLEAN Asynchronous);
  NTSTATUS                                               NtQueryPerformanceCounter(                          PLARGE_INTEGER PerformanceCounter, PLARGE_INTEGER PerformanceFrequency);
  NTSTATUS                                               NtQueryTimerResolution(                             PULONG MinimumResolution, PULONG MaximumResolution, PULONG CurrentResolution);
  NTSTATUS                                               NtCreateMailslotFile(                               PHANDLE MailSlotFileHandle, ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, PIO_STATUS_BLOCK IoStatusBlock, ULONG FileAttributes, FileShareMode ShareAccess, ULONG MaxMessageSize, PLARGE_INTEGER TimeOut);
  NTSTATUS                                               NtCreateNamedPipeFile(                              PHANDLE NamedPipeFileHandle, PIPE_ACCESS_MASK DesiredAccess, POBJECT_ATTRIBUTES ObjectAttributes, PIO_STATUS_BLOCK IoStatusBlock, FileShareMode ShareAccess, NtCreateDisposition CreateDisposition, NtCreateOptions CreateOptions, ULONG WriteModeMessage, ULONG ReadModeMessage, ULONG NonBlocking, ULONG MaxInstances, ULONG InBufferSize, ULONG OutBufferSize, PLARGE_INTEGER DefaultTimeOut);
  NTSTATUS                                               NtDeviceIoControlFile(                              HANDLE DeviceHandle, HANDLE Event, PIO_APC_ROUTINE UserApcRoutine, PVOID UserApcContext, PIO_STATUS_BLOCK IoStatusBlock, IOCTL IoControlCode, PVOID InputBuffer, ULONG InputBufferSize, PVOID OutputBuffer, ULONG OutputBufferSize);
  NTSTATUS                                               NtFsControlFile(                                    HANDLE DeviceHandle, HANDLE Event, PIO_APC_ROUTINE ApcRoutine, PVOID ApcContext, PIO_STATUS_BLOCK IoStatusBlock, ULONG IoControlCode, PVOID InputBuffer, ULONG InputBufferSize, PVOID OutputBuffer, ULONG OutputBufferSize);
  NTSTATUS                                               NtPlugPlayControl(                                  PLUGPLAY_CONTROL_CLASS PlugPlayControlClass, PVOID Buffer, ULONG BufferSize);
  NTSTATUS                                               NtGetPlugPlayEvent(                                 ULONG Reserved1, ULONG Reserved2, PPLUGPLAY_EVENT_BLOCK Buffer, ULONG BufferSize);
  NTSTATUS                                               NtLockProductActivationKeys(                        PULONG pPrivateVer, PULONG pSafeMode);
  NTSTATUS                                               NtSetTimerResolution(                               ULONG DesiredResolution, BOOLEAN SetResolution, PULONG CurrentResolution);
  NTSTATUS                                               NtQuerySystemInformation(                           SYSTEM_INFORMATION_CLASS SystemInformationClass, PVOID SystemInformation, ULONG Length, PULONG ResultLength);
  NTSTATUS                                               NtSetSystemInformation(                             SYSTEM_INFORMATION_CLASS SystemInformationClass, PVOID SystemInformation, ULONG SystemInformationLength);
  NTSTATUS                                               NtRaiseHardError(                                   NTSTATUS ErrorStatus, ULONG NumberOfParameters, ULONG UnicodeStringParameterMask, PULONG_PTR Parameters, ULONG ValidResponseOptions, PULONG Response);
  NTSTATUS                                               NtClose(                                            HANDLE Handle);
  NTSTATUS                                               NtDuplicateObject(                                  ProcessHandle SourceProcessHandle, HANDLE SourceHandle, ProcessHandle TargetProcessHandle, PHANDLE TargetHandle, ACCESS_MASK DesiredAccess, ULONG HandleAttributes, ULONG Options);
  NTSTATUS                                               NtMakePermanentObject(                              HANDLE Object);
  NTSTATUS                                               NtMakeTemporaryObject(                              HANDLE Handle);
  NTSTATUS                                               NtQueryObject(                                      HANDLE ObjectHandle, OBJECT_INFORMATION_CLASS ObjectInformationClass, PVOID ObjectInformation, ULONG Length, PULONG ResultLength);
  NTSTATUS                                               NtQuerySecurityObject(                              HANDLE Handle, SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR SecurityDescriptor, ULONG Length, PULONG ResultLength);
  NTSTATUS                                               NtSetInformationObject(                             HANDLE ObjectHandle, OBJECT_INFORMATION_CLASS ObjectInformationClass, PVOID ObjectInformation, ULONG Length);
  NTSTATUS                                               NtSetSecurityObject(                                HANDLE Handle, SECURITY_INFORMATION SecurityInformation, PSECURITY_DESCRIPTOR SecurityDescriptor);
  BOOLEAN                                                RtlAcquireResourceExclusive(                        PRTL_RESOURCE pResource, BOOLEAN bWaitForAccess);
  BOOLEAN                                                RtlAcquireResourceShared(                           PRTL_RESOURCE pResource, BOOLEAN bWaitForAccess);
  VOID                                                   RtlDeleteResource(                                  PRTL_RESOURCE pResource);
  VOID                                                   RtlDumpResource(                                    PRTL_RESOURCE pResource);
  VOID                                                   RtlInitializeResource(                              PRTL_RESOURCE pResource);
  NTSTATUS                                               RtlLockCurrentThread(                               );
  NTSTATUS                                               RtlQueryElevationFlags(                             ElevationFlags* pFlags);
  VOID                                                   RtlReleaseResource(                                 PRTL_RESOURCE pResource);
  BOOLEAN                                                RtlTraceDatabaseAdd(                                PRTL_TRACE_DATABASE pDatabase, ULONG numFrames, PVOID* ppFrames, PRTL_TRACE_BLOCK* ppBlock);
  PRTL_TRACE_DATABASE                                    RtlTraceDatabaseCreate(                             ULONG buckets, SIZE_T maximumSize, ULONG flags, ULONG tag, PRTL_TRACE_HASH_FUNCTION pfnHash);
  BOOLEAN                                                RtlTraceDatabaseDestroy(                            PRTL_TRACE_DATABASE pDatabase);
  BOOLEAN                                                RtlTraceDatabaseEnumerate(                          PRTL_TRACE_DATABASE pDatabase, PRTL_TRACE_ENUM pEnumData, PRTL_TRACE_BLOCK* ppBlock);
  BOOLEAN                                                RtlTraceDatabaseFind(                               PRTL_TRACE_DATABASE pDatabase, ULONG numFrames, PVOID* ppFrames, PRTL_TRACE_BLOCK* ppBlock);
  BOOLEAN                                                RtlTraceDatabaseLock(                               PRTL_TRACE_DATABASE pDatabase);
  BOOLEAN                                                RtlTraceDatabaseUnlock(                             PRTL_TRACE_DATABASE pDatabase);
  BOOLEAN                                                RtlTraceDatabaseValidate(                           PRTL_TRACE_DATABASE pDatabase);
  NTSTATUS                                               RtlUnlockCurrentThread(                             );
  NTSTATUS                                               LdrRegisterDllNotification(                         ULONG Flags, PLDR_DLL_NOTIFICATION_FUNCTION NotificationFunction, PVOID Context, PVOID* Cookie);
  NTSTATUS                                               LdrUnregisterDllNotification(                       PVOID Cookie);
  LARGE_INTEGER                                          RtlExtendedIntegerMultiply(                         LARGE_INTEGER Multiplicand, LONG Multiplier);
  LARGE_INTEGER                                          RtlExtendedLargeIntegerDivide(                      LARGE_INTEGER Dividend, ULONG Divisor, PULONG Remainder);
  PLIST_ENTRY                                            RtlGetFunctionTableListHead(                        );
  RTL_UNLOAD_EVENT_TRACE [RTL_UNLOAD_EVENT_TRACE_NUMBER] RtlGetUnloadEventTrace(                             );
  VOID                                                   RtlGetUnloadEventTraceEx(                           PULONG* ElementSize, PULONG* ElementCount, PVOID* EventTrace);
  BOOLEAN                                                RtlIsNameInExpression(                              PUNICODE_STRING Expression, PUNICODE_STRING Name, BOOLEAN IgnoreCase, PWCH UpcaseTable);
]]
ffi.load( 'Ntdll.dll' )

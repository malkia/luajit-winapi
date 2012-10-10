require( 'ffi/winapi/headers/security' )
require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  enum { IMAGE_SIZEOF_SHORT_NAME = 8 };
  typedef union IMAGE_SECTION_HEADER_u {
    DWORD PhysicalAddress;
    DWORD VirtualSize;
  } IMAGE_SECTION_HEADER_u;
  typedef struct IMAGE_SECTION_HEADER {
    BYTE Name_IMAGE_SIZEOF_SHORT_NAME_;
    IMAGE_SECTION_HEADER_u Misc;
    DWORD VirtualAddress;
    DWORD SizeOfRawData;
    DWORD PointerToRawData;
    DWORD PointerToRelocations;
    DWORD PointerToLinenumbers;
    WORD NumberOfRelocations;
    WORD NumberOfLinenumbers;
    DWORD Characteristics;
  } IMAGE_SECTION_HEADER;
  typedef IMAGE_SECTION_HEADER *PIMAGE_SECTION_HEADER; //Pointer
  typedef UINT EVENT_TYPE; //Alias
  static const EVENT_TYPE NotificationEvent = 0;
  static const EVENT_TYPE SynchronizationEvent = 1;
  typedef DWORD FileShareMode; //Alias
  typedef DWORD MemoryType; //Alias
  typedef DWORD MemoryAllocationFlags; //Alias
  typedef DWORD MemoryProtection; //Alias
  typedef DWORD AclRevision; //Alias
  static const AclRevision ACL_REVISION = 2;
  static const AclRevision ACL_REVISION_DS = 4;
  typedef DWORD NtVerType; //Alias
  typedef DWORD TOKEN_ACCESS_MASK; //Alias
  typedef ULONG ObjectAttributes; //Alias
  typedef struct OBJECT_ATTRIBUTES {
    ULONG Length;
    HANDLE RootDirectory;
    PUNICODE_STRING ObjectName;
    ObjectAttributes Attributes;
    PSECURITY_DESCRIPTOR SecurityDescriptor;
    PSECURITY_QUALITY_OF_SERVICE SecurityQualityOfService;
  } OBJECT_ATTRIBUTES;
  typedef OBJECT_ATTRIBUTES *POBJECT_ATTRIBUTES; //Pointer
  typedef struct RTL_CRITICAL_SECTION_DEBUG {
    USHORT Type;
    USHORT CreatorBackTraceIndex;
    LPVOID CriticalSection;
    LIST_ENTRY ProcessLocksList;
    ULONG EntryCount;
    ULONG ContentionCount;
    ULONG Spare_2_;
  } RTL_CRITICAL_SECTION_DEBUG;
  typedef RTL_CRITICAL_SECTION_DEBUG *PRTL_CRITICAL_SECTION_DEBUG; //Pointer
# pragma pack( push, 8 )
  typedef struct RTL_CRITICAL_SECTION {
    PRTL_CRITICAL_SECTION_DEBUG DebugInfo;
    LONG LockCount;
    LONG RecursionCount;
    HANDLE OwningThread;
    HANDLE LockSemaphore;
    ULONG_PTR SpinCount;
  } RTL_CRITICAL_SECTION;
# pragma pack( pop )
  typedef RTL_CRITICAL_SECTION *PRTL_CRITICAL_SECTION; //Pointer
  typedef ULONG NtProtectionFlags; //Alias
  typedef DWORD_PTR ProcThreadAttribute; //Alias
  static const ProcThreadAttribute PROC_THREAD_ATTRIBUTE_PARENT_PROCESS = 0x00020000;
  static const ProcThreadAttribute PROC_THREAD_ATTRIBUTE_EXTENDED_FLAGS = 0x00060001;
  static const ProcThreadAttribute PROC_THREAD_ATTRIBUTE_HANDLE_LIST = 0x00020002;
  static const ProcThreadAttribute PROC_THREAD_ATTRIBUTE_IDEAL_PROCESSOR = 0x00030005;
  static const ProcThreadAttribute PROC_THREAD_ATTRIBUTE_MITIGATION_POLICY = 0x00020007;
  static const ProcThreadAttribute PROC_THREAD_ATTRIBUTE_PREFERRED_NODE = 0x00020004;
  static const ProcThreadAttribute PROC_THREAD_ATTRIBUTE_UMS_THREAD = 0x00030006;
  static const ProcThreadAttribute PROC_THREAD_ATTRIBUTE_GROUP_AFFINITY = 0x00030003;
  typedef DWORD ProcThreadAttributeFlags; //Alias
  typedef struct PROC_THREAD_ATTRIBUTE_ENTRY {
    ProcThreadAttribute Attribute;
    SIZE_T cbSize;
    PVOID lpValue;
  } PROC_THREAD_ATTRIBUTE_ENTRY;
  typedef struct PROC_THREAD_ATTRIBUTE_LIST {
    ProcThreadAttributeFlags dwFlags;
    ULONG Size;
    ULONG Count;
    ULONG Reserved;
    PULONG Unknown;
    PROC_THREAD_ATTRIBUTE_ENTRY Entries_ANYSIZE_ARRAY_;
  } PROC_THREAD_ATTRIBUTE_LIST;
  typedef PROC_THREAD_ATTRIBUTE_LIST *LPPROC_THREAD_ATTRIBUTE_LIST; //Pointer
  typedef UINT_PTR HANDLE_NO_HEX; //Alias
  typedef struct CLIENT_ID {
    HANDLE_NO_HEX UniqueProcess;
    HANDLE_NO_HEX UniqueThread;
  } CLIENT_ID;
  typedef CLIENT_ID *PCLIENT_ID; //Pointer
]]

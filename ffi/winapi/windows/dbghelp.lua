require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/native' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PFPO_DATA; //Alias
  typedef DWORD RVA; //Alias
  typedef LPVOID PENUMDIRTREE_CALLBACK; //Alias
  typedef LPVOID PENUMLOADED_MODULES_CALLBACK64; //Alias
  typedef LPVOID PENUMLOADED_MODULES_CALLBACKW64; //Alias
  typedef LPVOID PFIND_DEBUG_FILE_CALLBACK; //Alias
  typedef LPVOID PFIND_EXE_FILE_CALLBACK; //Alias
  typedef LPVOID PREAD_PROCESS_MEMORY_ROUTINE64; //Alias
  typedef LPVOID PFUNCTION_TABLE_ACCESS_ROUTINE64; //Alias
  typedef LPVOID PGET_MODULE_BASE_ROUTINE64; //Alias
  typedef LPVOID PTRANSLATE_ADDRESS_ROUTINE64; //Alias
  typedef LPVOID PSYM_ENUMLINES_CALLBACK; //Alias
  typedef LPVOID PSYM_ENUMPROCESSES_CALLBACK; //Alias
  typedef LPVOID PSYM_ENUMSOURCEFILES_CALLBACK; //Alias
  typedef LPVOID PSYM_ENUMERATESYMBOLS_CALLBACK; //Alias
  typedef LPVOID PFINDFILEINPATHCALLBACK; //Alias
  typedef LPVOID PSYMBOL_REGISTERED_CALLBACK64; //Alias
  typedef LPVOID PSYMBOL_REGISTERED_CALLBACKW64; //Alias
  typedef LPVOID PSYMBOL_FUNCENTRY_CALLBACK64; //Alias
  typedef LPVOID PSYM_ENUMSYMBOLS_CALLBACK64; //Alias
  typedef LPVOID PSYM_ENUMSYMBOLS_CALLBACKW64; //Alias
  typedef LPVOID MINIDUMP_CALLBACK_ROUTINE; //Alias
  typedef LPVOID PIMAGEHLP_CONTEXT; //Alias
  enum { MAX_PATH_mult_3 = 780 };
# pragma pack( push, 8 )
  typedef struct API_VERSION {
    USHORT MajorVersion;
    USHORT MinorVersion;
    USHORT Revision;
    USHORT Reserved;
  } API_VERSION;
# pragma pack( pop )
  typedef API_VERSION *LPAPI_VERSION; //Pointer
# pragma pack( push, 8 )
  typedef struct IMAGEHLP_LINE64 {
    DWORD SizeOfStruct;
    PVOID Key;
    DWORD LineNumber;
    PCHAR FileName;
    DWORD64 Address;
  } IMAGEHLP_LINE64;
# pragma pack( pop )
  typedef IMAGEHLP_LINE64 *PIMAGEHLP_LINE64; //Pointer
# pragma pack( push, 8 )
  typedef struct IMAGEHLP_LINEW64 {
    DWORD SizeOfStruct;
    PVOID Key;
    DWORD LineNumber;
    PWSTR FileName;
    DWORD64 Address;
  } IMAGEHLP_LINEW64;
# pragma pack( pop )
  typedef IMAGEHLP_LINEW64 *PIMAGEHLP_LINEW64; //Pointer
# pragma pack( push, 8 )
  typedef struct OMAP {
    ULONG rva;
    ULONG rvaTo;
  } OMAP;
# pragma pack( pop )
  typedef OMAP *POMAP; //Pointer
  typedef UINT IMAGEHLP_SYMBOL_TYPE_INFO; //Alias
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_SYMTAG = 0;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_SYMNAME = 1;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_LENGTH = 2;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_TYPE = 3;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_TYPEID = 4;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_BASETYPE = 5;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_ARRAYINDEXTYPEID = 6;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_FINDCHILDREN = 7;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_DATAKIND = 8;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_ADDRESSOFFSET = 9;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_OFFSET = 10;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_VALUE = 11;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_COUNT = 12;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_CHILDRENCOUNT = 13;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_BITPOSITION = 14;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_VIRTUALBASECLASS = 15;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_VIRTUALTABLESHAPEID = 16;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_VIRTUALBASEPOINTEROFFSET = 17;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_CLASSPARENTID = 18;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_NESTED = 19;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_SYMINDEX = 20;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_LEXICALPARENT = 21;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_ADDRESS = 22;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_THISADJUST = 23;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_UDTKIND = 24;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_IS_EQUIV_TO = 25;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_CALLING_CONVENTION = 26;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_IS_CLOSE_EQUIV_TO = 27;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GTIEX_REQS_VALID = 28;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_VIRTUALBASEOFFSET = 29;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_VIRTUALBASEDISPINDEX = 30;
  static const IMAGEHLP_SYMBOL_TYPE_INFO TI_GET_IS_REFERENCE = 31;
# pragma pack( push, 8 )
  typedef struct IMAGEHLP_GET_TYPE_INFO_PARAMS {
    ULONG SizeOfStruct;
    ULONG Flags;
    ULONG NumIds;
    PULONG TypeIds;
    ULONG64 TagFilter;
    ULONG NumReqs;
    IMAGEHLP_SYMBOL_TYPE_INFO* ReqKinds;
    PULONG_PTR ReqOffsets;
    PULONG ReqSizes;
    ULONG_PTR ReqStride;
    ULONG_PTR BufferSize;
    PVOID Buffer;
    ULONG EntriesMatched;
    ULONG EntriesFilled;
    ULONG64 TagsFound;
    ULONG64 AllReqsValid;
    ULONG NumReqsValid;
    PULONG64 ReqsValid;
  } IMAGEHLP_GET_TYPE_INFO_PARAMS;
# pragma pack( pop )
  typedef IMAGEHLP_GET_TYPE_INFO_PARAMS *PIMAGEHLP_GET_TYPE_INFO_PARAMS; //Pointer
# pragma pack( push, 8 )
  typedef struct MODLOAD_DATA {
    DWORD ssize;
    DWORD ssig;
    PVOID data;
    DWORD size;
    DWORD flags;
  } MODLOAD_DATA;
# pragma pack( pop )
  typedef MODLOAD_DATA *PMODLOAD_DATA; //Pointer
# pragma pack( push, 4 )
  typedef struct MINIDUMP_LOCATION_DESCRIPTOR {
    ULONG32 DataSize;
    RVA Rva;
  } MINIDUMP_LOCATION_DESCRIPTOR;
# pragma pack( pop )
# pragma pack( push, 4 )
  typedef struct MINIDUMP_DIRECTORY {
    ULONG32 StreamType;
    MINIDUMP_LOCATION_DESCRIPTOR Location;
  } MINIDUMP_DIRECTORY;
# pragma pack( pop )
  typedef MINIDUMP_DIRECTORY *PMINIDUMP_DIRECTORY; //Pointer
# pragma pack( push, 4 )
  typedef struct MINIDUMP_EXCEPTION_INFORMATION {
    DWORD ThreadId;
    PEXCEPTION_POINTERS ExceptionPointers;
    BOOL ClientPointers;
  } MINIDUMP_EXCEPTION_INFORMATION;
# pragma pack( pop )
  typedef MINIDUMP_EXCEPTION_INFORMATION *PMINIDUMP_EXCEPTION_INFORMATION; //Pointer
# pragma pack( push, 4 )
  typedef struct MINIDUMP_USER_STREAM {
    ULONG32 Type;
    ULONG BufferSize;
    PVOID Buffer;
  } MINIDUMP_USER_STREAM;
# pragma pack( pop )
  typedef MINIDUMP_USER_STREAM *PMINIDUMP_USER_STREAM; //Pointer
# pragma pack( push, 4 )
  typedef struct MINIDUMP_USER_STREAM_INFORMATION {
    ULONG UserStreamCount;
    PMINIDUMP_USER_STREAM UserStreamArray;
  } MINIDUMP_USER_STREAM_INFORMATION;
# pragma pack( pop )
  typedef MINIDUMP_USER_STREAM_INFORMATION *PMINIDUMP_USER_STREAM_INFORMATION; //Pointer
# pragma pack( push, 4 )
  typedef struct MINIDUMP_CALLBACK_INFORMATION {
    MINIDUMP_CALLBACK_ROUTINE CallbackRoutine;
    PVOID CallbackParam;
  } MINIDUMP_CALLBACK_INFORMATION;
# pragma pack( pop )
  typedef MINIDUMP_CALLBACK_INFORMATION *PMINIDUMP_CALLBACK_INFORMATION; //Pointer
  typedef UINT SYM_TYPE; //Alias
  static const SYM_TYPE SymNone = 0;
  static const SYM_TYPE SymCoff = 1;
  static const SYM_TYPE SymCv = 2;
  static const SYM_TYPE SymPdb = 3;
  static const SYM_TYPE SymExport = 4;
  static const SYM_TYPE SymDeferred = 5;
  static const SYM_TYPE SymSym = 6;
  static const SYM_TYPE SymDia = 7;
  static const SYM_TYPE SymVirtual = 8;
  typedef struct IMAGEHLP_MODULE64 {
    DWORD SizeOfStruct;
    DWORD64 BaseOfImage;
    DWORD ImageSize;
    DWORD TimeDateStamp;
    DWORD CheckSum;
    DWORD NumSyms;
    SYM_TYPE SymType;
    TCHAR ModuleName[32];
    TCHAR ImageName[256];
    TCHAR LoadedImageName[256];
    TCHAR LoadedPdbName[256];
    DWORD CVSig;
    TCHAR CVData[MAX_PATH_mult_3];
    DWORD PdbSig;
    GUID PdbSig70;
    DWORD PdbAge;
    BOOL PdbUnmatched;
    BOOL DbgUnmatched;
    BOOL LineNumbers;
    BOOL GlobalSymbols;
    BOOL TypeInfo;
    BOOL SourceIndexed;
    BOOL Publics;
  } IMAGEHLP_MODULE64;
  typedef IMAGEHLP_MODULE64 *PIMAGEHLP_MODULE64; //Pointer
  typedef struct IMAGEHLP_MODULEW64 {
    DWORD SizeOfStruct;
    DWORD64 BaseOfImage;
    DWORD ImageSize;
    DWORD TimeDateStamp;
    DWORD CheckSum;
    DWORD NumSyms;
    SYM_TYPE SymType;
    WCHAR ModuleName[32];
    WCHAR ImageName[256];
    WCHAR LoadedImageName[256];
    WCHAR LoadedPdbName[256];
    DWORD CVSig;
    WCHAR CVData[MAX_PATH_mult_3];
    DWORD PdbSig;
    GUID PdbSig70;
    DWORD PdbAge;
    BOOL PdbUnmatched;
    BOOL DbgUnmatched;
    BOOL LineNumbers;
    BOOL GlobalSymbols;
    BOOL TypeInfo;
    BOOL SourceIndexed;
    BOOL Publics;
  } IMAGEHLP_MODULEW64;
  typedef IMAGEHLP_MODULEW64 *PIMAGEHLP_MODULEW64; //Pointer
  typedef UINT ADDRESS_MODE; //Alias
  static const ADDRESS_MODE AddrMode1616 = 0;
  static const ADDRESS_MODE AddrMode1632 = 1;
  static const ADDRESS_MODE AddrModeReal = 2;
  static const ADDRESS_MODE AddrModeFlat = 3;
  typedef struct ADDRESS64 {
    DWORD64 Offset;
    WORD Segment;
    ADDRESS_MODE Mode;
  } ADDRESS64;
  typedef struct KDHELP64 {
    DWORD64 Thread;
    DWORD ThCallbackStack;
    DWORD ThCallbackBStore;
    DWORD NextCallback;
    DWORD FramePointer;
    DWORD64 KiCallUserMode;
    DWORD64 KeUserCallbackDispatcher;
    DWORD64 SystemRangeStart;
    DWORD64 KiUserExceptionDispatcher;
    DWORD64 StackBase;
    DWORD64 StackLimit;
    DWORD64 Reserved[5];
  } KDHELP64;
  typedef struct STACKFRAME64 {
    ADDRESS64 AddrPC;
    ADDRESS64 AddrReturn;
    ADDRESS64 AddrFrame;
    ADDRESS64 AddrStack;
    ADDRESS64 AddrBStore;
    PVOID FuncTableEntry;
    DWORD64 Params[4];
    BOOL Far;
    BOOL Virtual;
    DWORD64 Reserved[3];
    KDHELP64 KdHelp;
  } STACKFRAME64;
  typedef STACKFRAME64 *LPSTACKFRAME64; //Pointer
  typedef struct IMAGEHLP_STACK_FRAME {
    ULONG64 InstructionOffset;
    ULONG64 ReturnOffset;
    ULONG64 FrameOffset;
    ULONG64 StackOffset;
    ULONG64 BackingStoreOffset;
    ULONG64 FuncTableEntry;
    ULONG64 Params[4];
    ULONG64 Reserved[5];
    BOOL Virtual;
    ULONG Reserved2;
  } IMAGEHLP_STACK_FRAME;
  typedef IMAGEHLP_STACK_FRAME *PIMAGEHLP_STACK_FRAME; //Pointer
  typedef ULONG WINAPI_SYMFLAG; //Alias
  typedef struct SYMBOL_INFO {
    ULONG SizeOfStruct;
    ULONG TypeIndex;
    ULONG64 Reserved[2];
    ULONG Index;
    ULONG Size;
    ULONG64 ModBase;
    WINAPI_SYMFLAG Flags;
    ULONG64 Value;
    ULONG64 Address;
    ULONG Register;
    ULONG Scope;
    WINAPI_SymTagEnum_ULONG Tag;
    ULONG NameLen;
    ULONG MaxNameLen;
    TCHAR Name[1];
  } SYMBOL_INFO;
  typedef SYMBOL_INFO *PSYMBOL_INFO; //Pointer
  typedef struct IMAGEHLP_SYMBOL64 {
    DWORD SizeOfStruct;
    DWORD64 Address;
    DWORD Size;
    DWORD Flags;
    DWORD MaxNameLength;
    TCHAR Name[1];
  } IMAGEHLP_SYMBOL64;
  typedef IMAGEHLP_SYMBOL64 *PIMAGEHLP_SYMBOL64; //Pointer
  typedef struct SYMSRV_INDEX_INFO {
    DWORD sizeofstruct;
    TCHAR file[MAX_PATH_plus_1];
    BOOL stripped;
    DWORD timestamp;
    DWORD size;
    TCHAR dbgfile[MAX_PATH_plus_1];
    TCHAR pdbfile[MAX_PATH_plus_1];
    GUID guid;
    DWORD sig;
    DWORD age;
  } SYMSRV_INDEX_INFO;
  typedef SYMSRV_INDEX_INFO *PSYMSRV_INDEX_INFO; //Pointer
  typedef struct IMAGE_FUNCTION_ENTRY {
    DWORD StartingAddress;
    DWORD EndingAddress;
    DWORD EndOfPrologue;
  } IMAGE_FUNCTION_ENTRY;
  typedef IMAGE_FUNCTION_ENTRY *PIMAGE_FUNCTION_ENTRY; //Pointer
  typedef struct IMAGE_COFF_SYMBOLS_HEADER {
    DWORD NumberOfSymbols;
    DWORD LvaToFirstSymbol;
    DWORD NumberOfLinenumbers;
    DWORD LvaToFirstLinenumber;
    DWORD RvaToFirstByteOfCode;
    DWORD RvaToLastByteOfCode;
    DWORD RvaToFirstByteOfData;
    DWORD RvaToLastByteOfData;
  } IMAGE_COFF_SYMBOLS_HEADER;
  typedef IMAGE_COFF_SYMBOLS_HEADER *PIMAGE_COFF_SYMBOLS_HEADER; //Pointer
  typedef DWORD WINAPI_IMAGE_DEBUG_TYPE; //Alias
  static const WINAPI_IMAGE_DEBUG_TYPE IMAGE_DEBUG_TYPE_UNKNOWN = 0;
  static const WINAPI_IMAGE_DEBUG_TYPE IMAGE_DEBUG_TYPE_COFF = 1;
  static const WINAPI_IMAGE_DEBUG_TYPE IMAGE_DEBUG_TYPE_CODEVIEW = 2;
  static const WINAPI_IMAGE_DEBUG_TYPE IMAGE_DEBUG_TYPE_FPO = 3;
  static const WINAPI_IMAGE_DEBUG_TYPE IMAGE_DEBUG_TYPE_MISC = 4;
  static const WINAPI_IMAGE_DEBUG_TYPE IMAGE_DEBUG_TYPE_EXCEPTION = 5;
  static const WINAPI_IMAGE_DEBUG_TYPE IMAGE_DEBUG_TYPE_FIXUP = 6;
  static const WINAPI_IMAGE_DEBUG_TYPE IMAGE_DEBUG_TYPE_OMAP_TO_SRC = 7;
  static const WINAPI_IMAGE_DEBUG_TYPE IMAGE_DEBUG_TYPE_OMAP_FROM_SRC = 8;
  static const WINAPI_IMAGE_DEBUG_TYPE IMAGE_DEBUG_TYPE_BORLAND = 9;
  static const WINAPI_IMAGE_DEBUG_TYPE IMAGE_DEBUG_TYPE_RESERVED10 = 10;
  static const WINAPI_IMAGE_DEBUG_TYPE IMAGE_DEBUG_TYPE_CLSID = 11;
  typedef struct IMAGE_DEBUG_DIRECTORY {
    DWORD Characteristics;
    DWORD TimeDateStamp;
    WORD MajorVersion;
    WORD MinorVersion;
    WINAPI_IMAGE_DEBUG_TYPE Type;
    DWORD SizeOfData;
    DWORD AddressOfRawData;
    DWORD PointerToRawData;
  } IMAGE_DEBUG_DIRECTORY;
  typedef IMAGE_DEBUG_DIRECTORY *PIMAGE_DEBUG_DIRECTORY; //Pointer
  typedef struct IMAGE_DEBUG_INFORMATION {
    LIST_ENTRY List;
    DWORD ReservedSize;
    PVOID ReservedMappedBase;
    USHORT ReservedMachine;
    USHORT ReservedCharacteristics;
    DWORD ReservedCheckSum;
    DWORD ImageBase;
    DWORD SizeOfImage;
    DWORD ReservedNumberOfSections;
    PIMAGE_SECTION_HEADER ReservedSections;
    DWORD ReservedExportedNamesSize;
    PSTR ReservedExportedNames;
    DWORD ReservedNumberOfFunctionTableEntries;
    PIMAGE_FUNCTION_ENTRY ReservedFunctionTableEntries;
    DWORD ReservedLowestFunctionStartingAddress;
    DWORD ReservedHighestFunctionEndingAddress;
    DWORD ReservedNumberOfFpoTableEntries;
    PFPO_DATA ReservedFpoTableEntries;
    DWORD SizeOfCoffSymbols;
    PIMAGE_COFF_SYMBOLS_HEADER CoffSymbols;
    DWORD ReservedSizeOfCodeViewSymbols;
    PVOID ReservedCodeViewSymbols;
    PSTR ImageFilePath;
    PSTR ImageFileName;
    PSTR ReservedDebugFilePath;
    DWORD ReservedTimeDateStamp;
    BOOL ReservedRomImage;
    PIMAGE_DEBUG_DIRECTORY ReservedDebugDirectory;
    DWORD ReservedNumberOfDebugDirectories;
    DWORD ReservedOriginalFunctionTableBaseAddress;
    DWORD Reserved[2];
  } IMAGE_DEBUG_INFORMATION;
  typedef IMAGE_DEBUG_INFORMATION *PIMAGE_DEBUG_INFORMATION; //Pointer
  typedef DWORD WINAPI_UNDNAME_FLAGS; //Alias
  typedef DWORD WINAPI_ESLFLAG; //Alias
  typedef DWORD WINAPI_SSRVOPT; //Alias
  typedef DWORD WINAPI_SYMSEARCH_FLAGS; //Alias
  typedef DWORD WINAPI_SYMOPT_FLAGS; //Alias
  BOOL                     EnumDirTree(                        WINAPI_ProcessHandle hProcess, PCTSTR RootPath, PCTSTR InputPathName, PTSTR OutputPathBuffer, PENUMDIRTREE_CALLBACK Callback, PVOID CallbackData);
  LPAPI_VERSION            ImagehlpApiVersion(                 );
  LPAPI_VERSION            ImagehlpApiVersionEx(               LPAPI_VERSION AppVersion);
  BOOL                     MakeSureDirectoryPathExists(        PCSTR DirPath);
  BOOL                     SearchTreeForFile(                  PCTSTR RootPath, PCTSTR InputPathName, PTSTR OutputPathBuffer);
  BOOL                     EnumerateLoadedModules64(           WINAPI_ProcessHandle hProcess, PENUMLOADED_MODULES_CALLBACK64 EnumLoadedModulesCallback, PVOID UserContext);
  BOOL                     EnumerateLoadedModulesW64(          WINAPI_ProcessHandle hProcess, PENUMLOADED_MODULES_CALLBACKW64 EnumLoadedModulesCallback, PVOID UserContext);
  BOOL                     EnumerateLoadedModulesEx(           WINAPI_ProcessHandle hProcess, PENUMLOADED_MODULES_CALLBACK64 EnumLoadedModulesCallback, PVOID UserContext);
  HANDLE                   FindDebugInfoFile(                  PCSTR FileName, PCSTR SymbolPath, PSTR DebugFilePath);
  HANDLE                   FindDebugInfoFileEx(                PCTSTR FileName, PCTSTR SymbolPath, PTSTR DebugFilePath, PFIND_DEBUG_FILE_CALLBACK Callback, PVOID CallerData);
  HANDLE                   FindExecutableImage(                PCSTR FileName, PCSTR SymbolPath, PSTR ImageFilePath);
  HANDLE                   FindExecutableImageEx(              PCTSTR FileName, PCTSTR SymbolPath, PTSTR ImageFilePath, PFIND_EXE_FILE_CALLBACK Callback, PVOID CallerData);
  BOOL                     StackWalk64(                        DWORD MachineType, WINAPI_ProcessHandle hProcess, WINAPI_ThreadHandle hThread, LPSTACKFRAME64 StackFrame, PVOID ContextRecord, PREAD_PROCESS_MEMORY_ROUTINE64 ReadMemoryRoutine, PFUNCTION_TABLE_ACCESS_ROUTINE64 FunctionTableAccessRoutine, PGET_MODULE_BASE_ROUTINE64 GetModuleBaseRoutine, PTRANSLATE_ADDRESS_ROUTINE64 TranslateAddress);
  BOOL                     SymSetParentWindow(                 HWND hwnd);
  DWORD                    UnDecorateSymbolName(               PCTSTR DecoratedName, PTSTR UnDecoratedName, DWORD UndecoratedLength, WINAPI_UNDNAME_FLAGS Flags);
  DWORD                    GetTimestampForLoadedLibrary(       HMODULE ImageBase);
  PVOID                    ImageDirectoryEntryToData(          PVOID Base, BOOLEAN MappedAsImage, USHORT DirectoryEntry, PULONG Size);
  PVOID                    ImageDirectoryEntryToDataEx(        PVOID Base, BOOLEAN MappedAsImage, USHORT DirectoryEntry, PULONG Size, PIMAGE_SECTION_HEADER* FoundHeader);
  PIMAGE_NT_HEADERS        ImageNtHeader(                      PVOID ImageBase);
  PIMAGE_SECTION_HEADER    ImageRvaToSection(                  PIMAGE_NT_HEADERS NtHeaders, PVOID Base, ULONG Rva);
  PVOID                    ImageRvaToVa(                       PIMAGE_NT_HEADERS NtHeaders, PVOID Base, ULONG Rva, PIMAGE_SECTION_HEADER* LastRvaSection);
  BOOL                     SymAddSourceStream(                 WINAPI_ProcessHandle hProcess, ULONG64 Base, PCTSTR StreamFile, PBYTE Buffer, size_t Size);
  BOOL                     SymAddSymbol(                       WINAPI_ProcessHandle hProcess, ULONG64 BaseOfDll, PCTSTR Name, DWORD64 Address, DWORD Size, DWORD Flags);
  BOOL                     SymCleanup(                         WINAPI_ProcessHandle hProcess);
  BOOL                     SymDeleteSymbol(                    WINAPI_ProcessHandle hProcess, ULONG64 BaseOfDll, PCTSTR Name, DWORD64 Address, DWORD Flags);
  BOOL                     SymEnumLines(                       WINAPI_ProcessHandle hProcess, ULONG64 Base, PCTSTR Obj, PCTSTR File, PSYM_ENUMLINES_CALLBACK EnumLinesCallback, PVOID UserContext);
  BOOL                     SymEnumProcesses(                   PSYM_ENUMPROCESSES_CALLBACK EnumProcessesCallback, PVOID UserContext);
  BOOL                     SymEnumSourceFiles(                 WINAPI_ProcessHandle hProcess, ULONG64 ModBase, PCTSTR Mask, PSYM_ENUMSOURCEFILES_CALLBACK EnumSymbolsCallback, PVOID UserContext);
  BOOL                     SymEnumSourceLines(                 WINAPI_ProcessHandle hProcess, ULONG64 Base, PCTSTR Obj, PCTSTR File, DWORD Line, WINAPI_ESLFLAG Flags, PSYM_ENUMLINES_CALLBACK EnumLinesCallback, PVOID UserContext);
  BOOL                     SymEnumSymbols(                     WINAPI_ProcessHandle hProcess, ULONG64 BaseOfDll, PCTSTR Mask, PSYM_ENUMERATESYMBOLS_CALLBACK EnumSymbolsCallback, PVOID UserContext);
  BOOL                     SymEnumSymbolsForAddr(              WINAPI_ProcessHandle hProcess, DWORD64 Address, PSYM_ENUMERATESYMBOLS_CALLBACK EnumSymbolsCallback, PVOID UserContext);
  BOOL                     SymEnumTypes(                       WINAPI_ProcessHandle hProcess, ULONG64 BaseOfDll, PSYM_ENUMERATESYMBOLS_CALLBACK EnumSymbolsCallback, PVOID UserContext);
  BOOL                     SymEnumTypesByName(                 WINAPI_ProcessHandle hProcess, ULONG64 BaseOfDll, PCSTR mask, PSYM_ENUMERATESYMBOLS_CALLBACK EnumSymbolsCallback, PVOID UserContext);
  HANDLE                   SymFindDebugInfoFile(               WINAPI_ProcessHandle hProcess, PCTSTR FileName, PTSTR DebugFilePath, PFIND_DEBUG_FILE_CALLBACK Callback, PVOID CallerData);
  HANDLE                   SymFindExecutableImage(             WINAPI_ProcessHandle hProcess, PCTSTR FileName, PTSTR ImageFilePath, PFIND_EXE_FILE_CALLBACK Callback, PVOID CallerData);
  BOOL                     SymFindFileInPath(                  WINAPI_ProcessHandle hProcess, PCTSTR SearchPath, PCTSTR FileName, PVOID id, DWORD two, DWORD three, WINAPI_SSRVOPT flags, PTSTR FilePath, PFINDFILEINPATHCALLBACK callback, PVOID context);
  BOOL                     SymFromAddr(                        WINAPI_ProcessHandle hProcess, DWORD64 Address, PDWORD64 Displacement, PSYMBOL_INFO Symbol);
  BOOL                     SymFromIndex(                       WINAPI_ProcessHandle hProcess, ULONG64 BaseOfDll, DWORD Index, PSYMBOL_INFO Symbol);
  BOOL                     SymFromName(                        WINAPI_ProcessHandle hProcess, PCTSTR Name, PSYMBOL_INFO Symbol);
  BOOL                     SymFromToken(                       WINAPI_ProcessHandle hProcess, DWORD64 Base, DWORD Token, PSYMBOL_INFO Symbol);
  PVOID                    SymFunctionTableAccess64(           WINAPI_ProcessHandle hProcess, DWORD64 AddrBase);
  ULONG                    SymGetFileLineOffsets64(            WINAPI_ProcessHandle hProcess, PCSTR ModuleName, PCSTR FileName, PDWORD64 Buffer, ULONG BufferLines);
  PTCHAR                   SymGetHomeDirectory(                DWORD type, PTSTR dir, size_t size);
  BOOL                     SymGetLineFromAddr64(               WINAPI_ProcessHandle hProcess, DWORD64 dwAddr, PDWORD pdwDisplacement, PIMAGEHLP_LINE64 Line);
  BOOL                     SymGetLineFromAddrW64(              WINAPI_ProcessHandle hProcess, DWORD64 dwAddr, PDWORD pdwDisplacement, PIMAGEHLP_LINEW64 Line);
  BOOL                     SymGetLineFromName64(               WINAPI_ProcessHandle hProcess, PCSTR ModuleName, PCSTR FileName, DWORD dwLineNumber, PLONG lpDisplacement, PIMAGEHLP_LINE64 Line);
  BOOL                     SymGetLineFromNameW64(              WINAPI_ProcessHandle hProcess, PCWSTR ModuleName, PCWSTR FileName, DWORD dwLineNumber, PLONG lpDisplacement, PIMAGEHLP_LINEW64 Line);
  BOOL                     SymGetLineNext64(                   WINAPI_ProcessHandle hProcess, PIMAGEHLP_LINE64 Line);
  BOOL                     SymGetLineNextW64(                  WINAPI_ProcessHandle hProcess, PIMAGEHLP_LINEW64 Line);
  BOOL                     SymGetLinePrev64(                   WINAPI_ProcessHandle hProcess, PIMAGEHLP_LINE64 Line);
  BOOL                     SymGetLinePrevW64(                  WINAPI_ProcessHandle hProcess, PIMAGEHLP_LINEW64 Line);
  DWORD64                  SymGetModuleBase64(                 WINAPI_ProcessHandle hProcess, DWORD64 dwAddr);
  BOOL                     SymGetModuleInfo64(                 WINAPI_ProcessHandle hProcess, DWORD64 dwAddr, PIMAGEHLP_MODULE64 ModuleInfo);
  BOOL                     SymGetModuleInfoW64(                WINAPI_ProcessHandle hProcess, DWORD64 dwAddr, PIMAGEHLP_MODULEW64 ModuleInfo);
  BOOL                     SymGetOmaps(                        WINAPI_ProcessHandle hProcess, ULONG64 BaseOfDll, POMAP* OmapTo, PDWORD64 cOmapTo, POMAP* OmapFrom, PDWORD64 cOmapFrom);
  WINAPI_SYMOPT_FLAGS      SymGetOptions(                      );
  BOOL                     SymGetScope(                        WINAPI_ProcessHandle hProcess, ULONG64 BaseOfDll, DWORD Index, PSYMBOL_INFO Symbol);
  BOOL                     SymGetSearchPath(                   WINAPI_ProcessHandle hProcess, PTSTR SearchPath, DWORD SearchPathLength);
  BOOL                     SymGetSymbolFile(                   WINAPI_ProcessHandle hProcess, PCTSTR SymPath, PCTSTR ImageFile, DWORD Type, PTSTR SymbolFile, size_t cSymbolFile, PTSTR DbgFile, size_t cDbgFile);
  BOOL                     SymGetTypeFromName(                 WINAPI_ProcessHandle hProcess, ULONG64 BaseOfDll, PCTSTR Name, PSYMBOL_INFO Symbol);
  BOOL                     SymGetTypeInfo(                     WINAPI_ProcessHandle hProcess, DWORD64 ModBase, ULONG TypeId, IMAGEHLP_SYMBOL_TYPE_INFO GetType, PVOID pInfo);
  BOOL                     SymGetTypeInfoEx(                   WINAPI_ProcessHandle hProcess, DWORD64 ModBase, PIMAGEHLP_GET_TYPE_INFO_PARAMS Params);
  BOOL                     SymInitialize(                      WINAPI_ProcessHandle hProcess, PCTSTR UserSearchPath, BOOL fInvadeProcess);
  DWORD64                  SymLoadModule64(                    WINAPI_ProcessHandle hProcess, HANDLE hFile, PCSTR ImageName, PCSTR ModuleName, DWORD64 BaseOfDll, DWORD SizeOfDll);
  DWORD64                  SymLoadModuleEx(                    WINAPI_ProcessHandle hProcess, HANDLE hFile, PCTSTR ImageName, PCTSTR ModuleName, DWORD64 BaseOfDll, DWORD DllSize, PMODLOAD_DATA Data, DWORD Flags);
  BOOL                     SymMatchFileName(                   PCTSTR FileName, PCTSTR Match, PTSTR* FileNameStop, PTSTR* MatchStop);
  BOOL                     SymMatchString(                     PCTSTR string, PCTSTR expression, BOOL fCase);
  BOOL                     SymNext(                            WINAPI_ProcessHandle hProcess, PSYMBOL_INFO Symbol);
  BOOL                     SymPrev(                            WINAPI_ProcessHandle hProcess, PSYMBOL_INFO Symbol);
  BOOL                     SymRefreshModuleList(               WINAPI_ProcessHandle hProcess);
  BOOL                     SymRegisterCallback64(              WINAPI_ProcessHandle hProcess, PSYMBOL_REGISTERED_CALLBACK64 CallbackFunction, ULONG64 UserContext);
  BOOL                     SymRegisterCallbackW64(             WINAPI_ProcessHandle hProcess, PSYMBOL_REGISTERED_CALLBACKW64 CallbackFunction, ULONG64 UserContext);
  BOOL                     SymRegisterFunctionEntryCallback64( WINAPI_ProcessHandle hProcess, PSYMBOL_FUNCENTRY_CALLBACK64 CallbackFunction, ULONG64 UserContext);
  BOOL                     SymSearch(                          WINAPI_ProcessHandle hProcess, ULONG64 BaseOfDll, DWORD Index, DWORD SymTag, PCTSTR Mask, DWORD64 Address, PSYM_ENUMERATESYMBOLS_CALLBACK EnumSymbolsCallback, PVOID UserContext, WINAPI_SYMSEARCH_FLAGS Options);
  BOOL                     SymSetContext(                      WINAPI_ProcessHandle hProcess, PIMAGEHLP_STACK_FRAME StackFrame, PIMAGEHLP_CONTEXT Context);
  PTCHAR                   SymSetHomeDirectory(                WINAPI_ProcessHandle hProcess, PCTSTR dir);
  DWORD                    SymSetOptions(                      WINAPI_SYMOPT_FLAGS SymOptions);
  BOOL                     SymSetScopeFromAddr(                WINAPI_ProcessHandle hProcess, ULONG64 Address);
  BOOL                     SymSetScopeFromIndex(               WINAPI_ProcessHandle hProcess, ULONG64 BaseOfDll, DWORD Index);
  BOOL                     SymSetSearchPath(                   WINAPI_ProcessHandle hProcess, PCTSTR SearchPath);
  BOOL                     SymUnDName64(                       PIMAGEHLP_SYMBOL64 sym, PSTR UnDecName, DWORD UnDecNameLength);
  BOOL                     SymUnloadModule64(                  WINAPI_ProcessHandle hProcess, DWORD64 BaseOfDll);
  PCTSTR                   SymSrvDeltaName(                    WINAPI_ProcessHandle hProcess, PCTSTR SymPath, PCTSTR Type, PCTSTR File1, PCTSTR File2);
  BOOL                     SymSrvGetFileIndexes(               PCTSTR File, GUID* Id, DWORD* Val1, DWORD* Val2, DWORD Flags);
  BOOL                     SymSrvGetFileIndexInfo(             PCTSTR File, PSYMSRV_INDEX_INFO Info, DWORD Flags);
  BOOL                     SymSrvGetFileIndexString(           WINAPI_ProcessHandle hProcess, PCTSTR SrvPath, PCTSTR File, PTSTR Index, size_t Size, DWORD Flags);
  PCTSTR                   SymSrvGetSupplement(                WINAPI_ProcessHandle hProcess, PCTSTR SymPath, PCTSTR Node, PCTSTR File);
  BOOL                     SymSrvIsStore(                      WINAPI_ProcessHandle hProcess, PCTSTR path);
  PCTSTR                   SymSrvStoreFile(                    WINAPI_ProcessHandle hProcess, PCTSTR SrvPath, PCTSTR File, DWORD Flags);
  PCTSTR                   SymSrvStoreSupplement(              WINAPI_ProcessHandle hProcess, PCTSTR SymPath, PCTSTR Node, PCTSTR File, DWORD Flags);
  BOOL                     MiniDumpReadDumpStream(             PVOID BaseOfDump, ULONG StreamNumber, PMINIDUMP_DIRECTORY* Dir, PVOID* StreamPointer, ULONG* StreamSize);
  BOOL                     MiniDumpWriteDump(                  WINAPI_ProcessHandle hProcess, DWORD ProcessId, HANDLE hFile, MINIDUMP_TYPE DumpType, PMINIDUMP_EXCEPTION_INFORMATION ExceptionParam, PMINIDUMP_USER_STREAM_INFORMATION UserStreamParam, PMINIDUMP_CALLBACK_INFORMATION CallbackParam);
  BOOL                     SymGetSourceFile(                   WINAPI_ProcessHandle hProcess, ULONG64 Base, PCTSTR Params, PCTSTR FileSpec, PTSTR FilePath, DWORD Size);
  BOOL                     SymGetSourceFileFromToken(          WINAPI_ProcessHandle hProcess, PVOID Token, PCTSTR Params, PTSTR FilePath, DWORD Size);
  BOOL                     SymGetSourceFileToken(              WINAPI_ProcessHandle hProcess, ULONG64 Base, PCTSTR FileSpec, PVOID* Token, DWORD* Size);
  BOOL                     SymGetSourceVarFromToken(           WINAPI_ProcessHandle hProcess, PVOID Token, PCTSTR Params, PCTSTR VarName, PTSTR Value, DWORD Size);
  PIMAGE_DEBUG_INFORMATION MapDebugInformation(                HANDLE FileHandle, PCSTR FileName, PCSTR SymbolPath, ULONG ImageBase);
  BOOL                     SymEnumerateSymbols64(              WINAPI_ProcessHandle hProcess, ULONG64 BaseOfDll, PSYM_ENUMSYMBOLS_CALLBACK64 EnumSymbolsCallback, PVOID UserContext);
  BOOL                     SymEnumerateSymbolsW64(             WINAPI_ProcessHandle hProcess, ULONG64 BaseOfDll, PSYM_ENUMSYMBOLS_CALLBACKW64 EnumSymbolsCallback, PVOID UserContext);
  BOOL                     SymGetSymFromAddr64(                WINAPI_ProcessHandle hProcess, DWORD64 Address, PDWORD64 Displacement, PIMAGEHLP_SYMBOL64 Symbol);
  BOOL                     SymGetSymFromName64(                WINAPI_ProcessHandle hProcess, PCSTR Name, PIMAGEHLP_SYMBOL64 Symbol);
  BOOL                     SymGetSymNext64(                    WINAPI_ProcessHandle hProcess, PIMAGEHLP_SYMBOL64 Symbol);
  BOOL                     SymGetSymPrev64(                    WINAPI_ProcessHandle hProcess, PIMAGEHLP_SYMBOL64 Symbol);
  BOOL                     UnmapDebugInformation(              PIMAGE_DEBUG_INFORMATION DebugInfo);
]]
ffi.load( 'DbgHelp.dll' )

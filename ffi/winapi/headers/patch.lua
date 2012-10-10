require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PPATCH_PROGRESS_CALLBACK; //Alias
  typedef LPVOID PPATCH_SYMLOAD_CALLBACK; //Alias
  typedef struct PATCH_INTERLEAVE_MAP_s {
    ULONG OldOffset;
    ULONG OldLength;
    ULONG NewLength;
  } PATCH_INTERLEAVE_MAP_s;
  enum {  = 1 };
  typedef struct PATCH_INTERLEAVE_MAP {
    ULONG CountRanges;
    PATCH_INTERLEAVE_MAP_s] Range[1;
  } PATCH_INTERLEAVE_MAP;
  typedef PATCH_INTERLEAVE_MAP *PPATCH_INTERLEAVE_MAP; //Pointer
  typedef struct PATCH_IGNORE_RANGE {
    ULONG OffsetInOldFile;
    ULONG LengthInBytes;
  } PATCH_IGNORE_RANGE;
  typedef PATCH_IGNORE_RANGE *PPATCH_IGNORE_RANGE; //Pointer
  typedef struct PATCH_RETAIN_RANGE {
    ULONG OffsetInOldFile;
    ULONG LengthInBytes;
    ULONG OffsetInNewFile;
  } PATCH_RETAIN_RANGE;
  typedef PATCH_RETAIN_RANGE *PPATCH_RETAIN_RANGE; //Pointer
  typedef ULONG PatchSymbolOptions; //Alias
  typedef ULONG PatchExtendedOptions; //Alias
  typedef struct PATCH_OPTION_DATA {
    ULONG SizeOfThisStruct;
    PatchSymbolOptions SymbolOptionFlags;
    LPCSTR NewFileSymbolPath;
    LPCSTR* OldFileSymbolPathArray;
    PatchExtendedOptions ExtendedOptionFlags;
    PPATCH_SYMLOAD_CALLBACK SymLoadCallback;
    PVOID SymLoadContext;
    PPATCH_INTERLEAVE_MAP* InterleaveMapArray;
    ULONG MaxLzxWindowSize;
  } PATCH_OPTION_DATA;
  typedef PATCH_OPTION_DATA *PPATCH_OPTION_DATA; //Pointer
  typedef struct PATCH_OLD_FILE_INFO_H {
    ULONG SizeOfThisStruct;
    HANDLE OldFileHandle;
    ULONG IgnoreRangeCount;
    PPATCH_IGNORE_RANGE IgnoreRangeArray;
    ULONG RetainRangeCount;
    PPATCH_RETAIN_RANGE RetainRangeArray;
  } PATCH_OLD_FILE_INFO_H;
  typedef PATCH_OLD_FILE_INFO_H *PPATCH_OLD_FILE_INFO_H; //Pointer
  typedef struct PATCH_OLD_FILE_INFO {
    ULONG SizeOfThisStruct;
    LPCTSTR OldFileName;
    ULONG IgnoreRangeCount;
    PPATCH_IGNORE_RANGE IgnoreRangeArray;
    ULONG RetainRangeCount;
    PPATCH_RETAIN_RANGE RetainRangeArray;
  } PATCH_OLD_FILE_INFO;
  typedef PATCH_OLD_FILE_INFO *PPATCH_OLD_FILE_INFO; //Pointer
  typedef ULONG PatchOptionFlags; //Alias
]]

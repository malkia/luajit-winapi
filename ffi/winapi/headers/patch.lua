require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PPATCH_PROGRESS_CALLBACK; //Alias
  typedef LPVOID PPATCH_SYMLOAD_CALLBACK; //Alias
  typedef struct WINAPI_PATCH_INTERLEAVE_MAP_s {
    ULONG OldOffset;
    ULONG OldLength;
    ULONG NewLength;
  } WINAPI_PATCH_INTERLEAVE_MAP_s;
  typedef WINAPI_PATCH_INTERLEAVE_MAP_s WINAPI_PATCH_INTERLEAVE_MAP_s] [1; //Array 1
  typedef struct PATCH_INTERLEAVE_MAP {
    ULONG CountRanges;
    WINAPI_PATCH_INTERLEAVE_MAP_s] Range[1;
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
  typedef ULONG WINAPI_PatchSymbolOptions; //Alias
  typedef ULONG WINAPI_PatchExtendedOptions; //Alias
  typedef struct PATCH_OPTION_DATA {
    ULONG SizeOfThisStruct;
    WINAPI_PatchSymbolOptions SymbolOptionFlags;
    LPCSTR NewFileSymbolPath;
    LPCSTR* OldFileSymbolPathArray;
    WINAPI_PatchExtendedOptions ExtendedOptionFlags;
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
  typedef ULONG WINAPI_PatchOptionFlags; //Alias
]]

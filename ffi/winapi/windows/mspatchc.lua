require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/patch" )
local ffi = require( "ffi" )
ffi.cdef [[
  BOOL CreatePatchFile(                   LPCTSTR OldFileName, LPCTSTR NewFileName, LPCTSTR PatchFileName, WINAPI_PatchOptionFlags OptionFlags, PPATCH_OPTION_DATA OptionData);
  BOOL CreatePatchFileByHandles(          HANDLE OldFileHandle, HANDLE NewFileHandle, HANDLE PatchFileHandle, WINAPI_PatchOptionFlags OptionFlags, PPATCH_OPTION_DATA OptionData);
  BOOL CreatePatchFileByHandlesEx(        ULONG OldFileCount, PPATCH_OLD_FILE_INFO_H OldFileInfoArray, HANDLE NewFileHandle, HANDLE PatchFileHandle, WINAPI_PatchOptionFlags OptionFlags, PPATCH_OPTION_DATA OptionData, PPATCH_PROGRESS_CALLBACK ProgressCallback, PVOID CallbackContext);
  BOOL CreatePatchFileEx(                 ULONG OldFileCount, PPATCH_OLD_FILE_INFO OldFileInfoArray, LPCTSTR NewFileName, LPCTSTR PatchFileName, WINAPI_PatchOptionFlags OptionFlags, PPATCH_OPTION_DATA OptionData, PPATCH_PROGRESS_CALLBACK ProgressCallback, PVOID CallbackContext);
  BOOL ExtractPatchHeaderToFile(          LPCTSTR PatchFileName, LPCTSTR PatchHeaderFileName);
  BOOL ExtractPatchHeaderToFileByHandles( HANDLE PatchFileHandle, HANDLE PatchHeaderFileHandle);
  BOOL GetFilePatchSignature(             LPCTSTR FileName, WINAPI_PatchOptionFlags OptionFlags, PVOID OptionData, ULONG IgnoreRangeCount, PPATCH_IGNORE_RANGE IgnoreRangeArray, ULONG RetainRangeCount, PPATCH_RETAIN_RANGE RetainRangeArray, ULONG SignatureBufferSize, PVOID SignatureBuffer);
  BOOL GetFilePatchSignatureByBuffer(     PBYTE FileBufferWritable, ULONG FileSize, ULONG OptionFlags, PVOID OptionData, ULONG IgnoreRangeCount, PPATCH_IGNORE_RANGE IgnoreRangeArray, ULONG RetainRangeCount, PPATCH_RETAIN_RANGE RetainRangeArray, ULONG SignatureBufferSize);
  BOOL GetFilePatchSignatureByHandle(     HANDLE FileHandle, WINAPI_PatchOptionFlags OptionFlags, PVOID OptionData, ULONG IgnoreRangeCount, PPATCH_IGNORE_RANGE IgnoreRangeArray, ULONG RetainRangeCount, PPATCH_RETAIN_RANGE RetainRangeArray, ULONG SignatureBufferSize, PVOID SignatureBuffer);
  BOOL NormalizeFileForPatchSignature(    PVOID FileBuffer, ULONG FileSize, ULONG OptionFlags, PATCH_OPTION_DATA* OptionData, ULONG NewFileCoffBase, ULONG NewFileCoffTime, ULONG IgnoreRangeCount, PPATCH_IGNORE_RANGE IgnoreRangeArray, ULONG RetainRangeCount, PPATCH_RETAIN_RANGE RetainRangeArray);
]]
return ffi.load( "mspatchc.dll" )

require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/patch' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef ULONG WINAPI_ApplyOptionFlags; //Alias
  BOOL ApplyPatchToFile(               LPCTSTR PatchFileName, LPCTSTR OldFileName, LPCTSTR NewFileName, WINAPI_ApplyOptionFlags ApplyOptionFlags);
  BOOL ApplyPatchToFileByBuffers(      PBYTE PatchFileMapped, ULONG PatchFileSize, PBYTE OldFileMapped, ULONG OldFileSize, PBYTE* NewFileBuffer, ULONG NewFileBufferSize, ULONG* NewFileActualSize, FILETIME* NewFileTime, WINAPI_ApplyOptionFlags ApplyOptionFlags, PPATCH_PROGRESS_CALLBACK ProgressCallback, PVOID CallbackContext);
  BOOL ApplyPatchToFileByHandles(      HANDLE PatchFileHandle, HANDLE OldFileHandle, HANDLE NewFileHandle, WINAPI_ApplyOptionFlags ApplyOptionFlags);
  BOOL ApplyPatchToFileByHandlesEx(    HANDLE PatchFileHandle, HANDLE OldFileHandle, HANDLE NewFileHandle, WINAPI_ApplyOptionFlags ApplyOptionFlags, PPATCH_PROGRESS_CALLBACK ProgressCallback, PVOID CallbackContext);
  BOOL ApplyPatchToFileEx(             LPCTSTR PatchFileName, LPCTSTR OldFileName, LPCTSTR NewFileName, WINAPI_ApplyOptionFlags ApplyOptionFlags, PPATCH_PROGRESS_CALLBACK ProgressCallback, PVOID CallbackContext);
  BOOL GetFilePatchSignature(          LPCTSTR FileName, WINAPI_PatchOptionFlags OptionFlags, PVOID OptionData, ULONG IgnoreRangeCount, PPATCH_IGNORE_RANGE IgnoreRangeArray, ULONG RetainRangeCount, PPATCH_RETAIN_RANGE RetainRangeArray, ULONG SignatureBufferSize, PVOID SignatureBuffer);
  BOOL GetFilePatchSignatureByBuffer(  PBYTE FileBufferWritable, ULONG FileSize, ULONG OptionFlags, PVOID OptionData, ULONG IgnoreRangeCount, PPATCH_IGNORE_RANGE IgnoreRangeArray, ULONG RetainRangeCount, PPATCH_RETAIN_RANGE RetainRangeArray, ULONG SignatureBufferSize);
  BOOL GetFilePatchSignatureByHandle(  HANDLE FileHandle, WINAPI_PatchOptionFlags OptionFlags, PVOID OptionData, ULONG IgnoreRangeCount, PPATCH_IGNORE_RANGE IgnoreRangeArray, ULONG RetainRangeCount, PPATCH_RETAIN_RANGE RetainRangeArray, ULONG SignatureBufferSize, PVOID SignatureBuffer);
  BOOL NormalizeFileForPatchSignature( PVOID FileBuffer, ULONG FileSize, ULONG OptionFlags, PATCH_OPTION_DATA* OptionData, ULONG NewFileCoffBase, ULONG NewFileCoffTime, ULONG IgnoreRangeCount, PPATCH_IGNORE_RANGE IgnoreRangeArray, ULONG RetainRangeCount, PPATCH_RETAIN_RANGE RetainRangeArray);
  BOOL TestApplyPatchToFile(           LPCTSTR PatchFileName, LPCTSTR OldFileName, WINAPI_ApplyOptionFlags ApplyOptionFlags);
  BOOL TestApplyPatchToFileByBuffers(  PBYTE PatchFileBuffer, ULONG PatchFileSize, PBYTE OldFileBuffer, ULONG OldFileSize, ULONG* NewFileSize);
  BOOL TestApplyPatchToFileByHandles(  HANDLE PatchFileHandle, HANDLE OldFileHandle, WINAPI_ApplyOptionFlags ApplyOptionFlags);
]]
return ffi.load( 'mspatcha.dll' )

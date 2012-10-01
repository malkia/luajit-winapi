require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/native" )
local ffi = require( "ffi" )
ffi.cdef [[
  BOOL              GetImageConfigInformation(  PLOADED_IMAGE LoadedImage, PIMAGE_LOAD_CONFIG_DIRECTORY ImageConfigInformation);
  DWORD             GetImageUnusedHeaderBytes(  PLOADED_IMAGE LoadedImage, PDWORD SizeUnusedHeaderBytes);
  PLOADED_IMAGE     ImageLoad(                  PSTR DllName, PSTR DllPath);
  BOOL              ImageUnload(                PLOADED_IMAGE LoadedImage);
  BOOL              MapAndLoad(                 PSTR ImageName, PSTR DllPath, PLOADED_IMAGE LoadedImage, BOOL DotDll, BOOL ReadOnly);
  BOOL              SetImageConfigInformation(  PLOADED_IMAGE LoadedImage, PIMAGE_LOAD_CONFIG_DIRECTORY ImageConfigInformation);
  BOOL              UnMapAndLoad(               PLOADED_IMAGE LoadedImage);
  BOOL              ImageAddCertificate(        HANDLE FileHandle, LPWIN_CERTIFICATE Certificate, PDWORD Index);
  BOOL              ImageEnumerateCertificates( HANDLE FileHandle, WORD TypeFilter, PDWORD CertificateCount, PDWORD Indices, DWORD IndexCount);
  BOOL              ImageGetCertificateData(    HANDLE FileHandle, DWORD CertificateIndex, LPWIN_CERTIFICATE Certificate, PDWORD RequiredLength);
  BOOL              ImageGetCertificateHeader(  HANDLE FileHandle, DWORD CertificateIndex, LPWIN_CERTIFICATE CertificateHeader);
  BOOL              ImageGetDigestStream(       HANDLE FileHandle, DWORD DigestLevel, DIGEST_FUNCTION DigestFunction, DIGEST_HANDLE DigestHandle);
  BOOL              ImageRemoveCertificate(     HANDLE FileHandle, DWORD Index);
  BOOL              BindImage(                  PSTR ImageName, PSTR DllPath, PSTR SymbolPath);
  BOOL              BindImageEx(                DWORD Flags, PSTR ImageName, PSTR DllPath, PSTR SymbolPath, PIMAGEHLP_STATUS_ROUTINE StatusRoutine);
  PIMAGE_NT_HEADERS CheckSumMappedFile(         PVOID BaseAddress, DWORD FileLength, PDWORD HeaderSum, PDWORD CheckSum);
  DWORD             MapFileAndCheckSum(         PTSTR Filename, PDWORD HeaderSum, PDWORD CheckSum);
  BOOL              ReBaseImage(                PCSTR CurrentImageName, PCSTR SymbolPath, BOOL fReBase, BOOL fRebaseSysfileOk, BOOL fGoingDown, ULONG CheckImageSize, ULONG* OldImageSize, ULONG_PTR* OldImageBase, ULONG* NewImageSize, ULONG_PTR* NewImageBase, ULONG TimeStamp);
  BOOL              SplitSymbols(               PSTR ImageName, PSTR SymbolsPath, PSTR SymbolFilePath, DWORD Flags);
  BOOL              TouchFileTimes(             HANDLE FileHandle, PSYSTEMTIME pSystemTime);
  BOOL              UpdateDebugInfoFile(        PSTR ImageFileName, PSTR SymbolPath, PSTR DebugFilePath, PIMAGE_NT_HEADERS NtHeaders);
  BOOL              UpdateDebugInfoFileEx(      PSTR ImageFileName, PSTR SymbolPath, PSTR DebugFilePath, PIMAGE_NT_HEADERS NtHeaders, DWORD OldChecksum);
]]
return ffi.load( "ImageHlp.dll" )

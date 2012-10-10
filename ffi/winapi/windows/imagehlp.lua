require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/native' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID DIGEST_FUNCTION; //Alias
  typedef PVOID DIGEST_HANDLE; //Alias
  typedef LPVOID PIMAGEHLP_STATUS_ROUTINE; //Alias
]]
if ffi.arch == 'x86' then ffi.cdef[[
  typedef struct IMAGE_LOAD_CONFIG_DIRECTORY {
    DWORD Size;
    DWORD TimeDateStamp;
    WORD MajorVersion;
    WORD MinorVersion;
    DWORD GlobalFlagsClear;
    DWORD GlobalFlagsSet;
    DWORD CriticalSectionDefaultTimeout;
    DWORD DeCommitFreeBlockThreshold;
    DWORD DeCommitTotalFreeThreshold;
    DWORD LockPrefixTable;
    DWORD MaximumAllocationSize;
    DWORD VirtualMemoryThreshold;
    HEAP_FLAGS ProcessHeapFlags;
    DWORD ProcessAffinityMask;
    WORD CSDVersion;
    WORD Reserved1;
    DWORD EditList;
    DWORD SecurityCookie;
    DWORD SEHandlerTable;
    DWORD SEHandlerCount;
  } IMAGE_LOAD_CONFIG_DIRECTORY;
]]
end
ffi.cdef[[
]]
if ffi.arch == 'x64' then ffi.cdef[[
  typedef struct IMAGE_LOAD_CONFIG_DIRECTORY {
    DWORD Size;
    DWORD TimeDateStamp;
    WORD MajorVersion;
    WORD MinorVersion;
    DWORD GlobalFlagsClear;
    DWORD GlobalFlagsSet;
    DWORD CriticalSectionDefaultTimeout;
    ULONGLONG DeCommitFreeBlockThreshold;
    ULONGLONG DeCommitTotalFreeThreshold;
    ULONGLONG LockPrefixTable;
    ULONGLONG MaximumAllocationSize;
    ULONGLONG VirtualMemoryThreshold;
    ULONGLONG ProcessAffinityMask;
    HEAP_FLAGS ProcessHeapFlags;
    WORD CSDVersion;
    WORD Reserved1;
    ULONGLONG EditList;
    ULONGLONG SecurityCookie;
    ULONGLONG SEHandlerTable;
    ULONGLONG SEHandlerCount;
  } IMAGE_LOAD_CONFIG_DIRECTORY;
]]
end
ffi.cdef[[
  typedef IMAGE_LOAD_CONFIG_DIRECTORY *PIMAGE_LOAD_CONFIG_DIRECTORY; //Pointer
  typedef WORD WIN_CERT_TYPE; //Alias
  typedef struct WIN_CERTIFICATE {
    DWORD dwLength;
    WORD wRevision;
    WIN_CERT_TYPE wCertificateType;
    BYTE bCertificate[ANYSIZE_ARRAY];
  } WIN_CERTIFICATE;
  typedef WIN_CERTIFICATE *LPWIN_CERTIFICATE; //Pointer
  typedef struct LOADED_IMAGE {
    PSTR ModuleName;
    HANDLE hFile;
    PUCHAR MappedAddress;
    PIMAGE_NT_HEADERS FileHeader;
    PIMAGE_SECTION_HEADER LastRvaSection;
    ULONG NumberOfSections;
    PIMAGE_SECTION_HEADER Sections;
    IMAGE_FILE_CHARACTERISTICS_ULONG Characteristics;
    BOOLEAN fSystemImage;
    BOOLEAN fDOSImage;
    BOOLEAN fReadOnly;
    UCHAR Version;
    LIST_ENTRY Links;
    ULONG SizeOfImage;
  } LOADED_IMAGE;
  typedef LOADED_IMAGE *PLOADED_IMAGE; //Pointer
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
ffi.load( 'ImageHlp.dll' )

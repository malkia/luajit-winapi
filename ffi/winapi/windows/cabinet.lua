require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* HFCI; //Alias
  typedef LPVOID PFNFCIGETNEXTCABINET; //Alias
  typedef LPVOID PFNFCISTATUS; //Alias
  typedef LPVOID PFNFCIGETOPENINFO; //Alias
  typedef LPVOID PFNFCIFILEPLACED; //Alias
  typedef LPVOID PFNFCIALLOC; //Alias
  typedef LPVOID PFNFCIFREE; //Alias
  typedef LPVOID PFNFCIOPEN; //Alias
  typedef LPVOID PFNFCIREAD; //Alias
  typedef LPVOID PFNFCIWRITE; //Alias
  typedef LPVOID PFNFCICLOSE; //Alias
  typedef LPVOID PFNFCISEEK; //Alias
  typedef LPVOID PFNFCIDELETE; //Alias
  typedef LPVOID PFNFCIGETTEMPFILE; //Alias
  typedef void* HFDI; //Alias
  typedef LPVOID PFNFDINOTIFY; //Alias
  typedef LPVOID PFNFDIDECRYPT; //Alias
  typedef LPVOID PFNALLOC; //Alias
  typedef LPVOID PFNFREE; //Alias
  typedef LPVOID PFNOPEN; //Alias
  typedef LPVOID PFNREAD; //Alias
  typedef LPVOID PFNWRITE; //Alias
  typedef LPVOID PFNCLOSE; //Alias
  typedef LPVOID PFNSEEK; //Alias
  typedef void* HFILELIST; //Alias
  enum { CB_MAX_DISK_NAME = 256 };
  enum { CB_MAX_CABINET_NAME = 256 };
  enum { CB_MAX_CAB_PATH = 256 };
  enum { cMAX_CAB_FILE_OPEN = 2 };
  enum { cbMAX_LINE = 512 };
  typedef USHORT TCOMP; //Alias
  typedef int FCIERROR; //Alias
  static const int FCIERR_NONE = 0;
  static const int FCIERR_OPEN_SRC = 1;
  static const int FCIERR_READ_SRC = 2;
  static const int FCIERR_ALLOC_FAIL = 3;
  static const int FCIERR_TEMP_FILE = 4;
  static const int FCIERR_BAD_COMPR_TYPE = 5;
  static const int FCIERR_CAB_FILE = 6;
  static const int FCIERR_USER_ABORT = 7;
  static const int FCIERR_MCI_FAIL = 8;
  static const int FCIERR_CAB_FORMAT_LIMIT = 9;
  typedef int FDIERROR; //Alias
  static const int FDIERROR_NONE = 0;
  static const int FDIERROR_CABINET_NOT_FOUND = 1;
  static const int FDIERROR_NOT_A_CABINET = 2;
  static const int FDIERROR_UNKNOWN_CABINET_VERSION = 3;
  static const int FDIERROR_CORRUPT_CABINET = 4;
  static const int FDIERROR_ALLOC_FAIL = 5;
  static const int FDIERROR_BAD_COMPR_TYPE = 6;
  static const int FDIERROR_MDI_FAIL = 7;
  static const int FDIERROR_TARGET_FILE = 8;
  static const int FDIERROR_RESERVE_MISMATCH = 9;
  static const int FDIERROR_WRONG_CABINET = 10;
  static const int FDIERROR_USER_ABORT = 11;
  typedef struct WINAPI_ERF_FCI {
    FCIERROR erfOper;
    int erfType;
    BOOL fError;
  } WINAPI_ERF_FCI;
  typedef WINAPI_ERF_FCI *WINAPI_PERF_FCI; //Pointer
  typedef struct WINAPI_ERF_FDI {
    FDIERROR erfOper;
    int erfType;
    BOOL fError;
  } WINAPI_ERF_FDI;
  typedef WINAPI_ERF_FDI *WINAPI_PERF_FDI; //Pointer
  typedef struct CCAB {
    ULONG cb;
    ULONG cbFolderThresh;
    UINT cbReserveCFHeader;
    UINT cbReserveCFFolder;
    UINT cbReserveCFData;
    int iCab;
    int iDisk;
    int fFailOnIncompressible;
    USHORT setID;
    char szDisk[CB_MAX_DISK_NAME];
    char szCab[CB_MAX_CABINET_NAME];
    char szCabPath[CB_MAX_CAB_PATH];
  } CCAB;
  typedef CCAB *PCCAB; //Pointer
  typedef struct FDICABINETINFO {
    long cbCabinet;
    USHORT cFolders;
    USHORT cFiles;
    USHORT setID;
    USHORT iCabinet;
    BOOL fReserve;
    BOOL hasprev;
    BOOL hasnext;
  } FDICABINETINFO;
  typedef FDICABINETINFO *PFDICABINETINFO; //Pointer
  typedef LPVOID PSESSION; //Alias
  typedef struct CABINETDLLVERSIONINFO {
    DWORD cbStruct;
    DWORD dwReserved1;
    DWORD dwReserved2;
    DWORD dwFileVersionMS;
    DWORD dwFileVersionLS;
  } CABINETDLLVERSIONINFO;
  typedef CABINETDLLVERSIONINFO *PCABINETDLLVERSIONINFO; //Pointer
  BOOL    FCIAddFile(           HFCI hfci, LPSTR pszSourceFile, LPSTR pszFileName, BOOL fExecute, PFNFCIGETNEXTCABINET GetNextCab, PFNFCISTATUS pfnProgress, PFNFCIGETOPENINFO pfnOpenInfo, TCOMP typeCompress);
  HFCI    FCICreate(            WINAPI_PERF_FCI perf, PFNFCIFILEPLACED pfnfiledest, PFNFCIALLOC pfnalloc, PFNFCIFREE pfnfree, PFNFCIOPEN pfnopen, PFNFCIREAD pfnread, PFNFCIWRITE pfnwrite, PFNFCICLOSE pfnclose, PFNFCISEEK pfnseek, PFNFCIDELETE pfndelete, PFNFCIGETTEMPFILE pfnfcigtf, PCCAB pccab, void* pv);
  BOOL    FCIDestroy(           HFCI hfci);
  BOOL    FCIFlushCabinet(      HFCI hfci, BOOL fGetNextCab, PFNFCIGETNEXTCABINET GetNextCab, PFNFCISTATUS pfnProgress);
  BOOL    FCIFlushFolder(       HFCI hfci, PFNFCIGETNEXTCABINET GetNextCab, PFNFCISTATUS pfnProgress);
  BOOL    FDICopy(              HFDI hfdi, LPSTR pszCabinet, LPSTR pszCabPath, INT flags, PFNFDINOTIFY pfnfdin, PFNFDIDECRYPT pfnfdid, void* pvUser);
  HFDI    FDICreate(            PFNALLOC pfnalloc, PFNFREE pfnfree, PFNOPEN pfnopen, PFNREAD pfnread, PFNWRITE pfnwrite, PFNCLOSE pfnclose, PFNSEEK pfnseek, int cpuType, WINAPI_PERF_FDI perf);
  BOOL    FDIDestroy(           BOOL hfdi);
  BOOL    FDIIsCabinet(         HFDI hfdi, INT_PTR hf, PFDICABINETINFO pfdici);
  BOOL    FDITruncateCabinet(   HFDI hfdi, LPSTR* pszCabinetName, USHORT iFolderToDelete);
  VOID    DeleteExtractedFiles( PSESSION ps);
  VOID    DllGetVersion(        PCABINETDLLVERSIONINFO pcdvi);
  HRESULT Extract(              PSESSION ps, LPCSTR lpCabName);
  LPCSTR  GetDllVersion(        );
]]
return ffi.load( 'Cabinet.dll' )

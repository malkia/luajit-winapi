require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/multimedia' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef HANDLE HACMSTREAM; //Alias
  typedef HACMSTREAM *LPHACMSTREAM; //Pointer
  typedef HANDLE HACMOBJ; //Alias
  typedef HANDLE HACMDRIVER; //Alias
  typedef HACMDRIVER *LPHACMDRIVER; //Pointer
  typedef HANDLE HACMDRIVERID; //Alias
  typedef HACMDRIVERID *LPHACMDRIVERID; //Pointer
  typedef LPVOID ACMDRIVERENUMCB; //Alias
  typedef LPVOID ACMFILTERENUMCB; //Alias
  typedef LPVOID ACMFILTERTAGENUMCB; //Alias
  typedef LPVOID ACMFORMATENUMCB; //Alias
  typedef LPVOID ACMFORMATTAGENUMCB; //Alias
  typedef LPVOID ACMFORMATCHOOSEHOOKPROC; //Alias
  typedef LPVOID ACMFILTERCHOOSEHOOKPROC; //Alias
  enum { ACMFORMATTAGDETAILS_FORMATTAG_CHARS = 48 };
  enum { ACMFILTERTAGDETAILS_FILTERTAG_CHARS = 48 };
  enum { ACMFORMATDETAILS_FORMAT_CHARS = 128 };
  enum { ACMFILTERDETAILS_FILTER_CHARS = 128 };
  enum { ACMDRIVERDETAILS_SHORTNAME_CHARS = 32 };
  enum { ACMDRIVERDETAILS_LONGNAME_CHARS = 128 };
  enum { ACMDRIVERDETAILS_COPYRIGHT_CHARS = 80 };
  enum { ACMDRIVERDETAILS_LICENSING_CHARS = 128 };
  enum { ACMDRIVERDETAILS_FEATURES_CHARS = 512 };
# pragma pack( push, 1 )
  typedef struct WAVEFILTER {
    DWORD cbStruct;
    DWORD dwFilterTag;
    DWORD fdwFilter;
    DWORD dwReserved[5];
  } WAVEFILTER;
# pragma pack( pop )
  typedef WAVEFILTER *LPWAVEFILTER; //Pointer
  typedef DWORD WINAPI_ACMDRIVERDETAILS_SUPPORTF; //Alias
# pragma pack( push, 1 )
  typedef struct ACMDRIVERDETAILS {
    DWORD cbStruct;
    FOURCC fccType;
    FOURCC fccComp;
    WORD wMid;
    WORD wPid;
    DWORD vdwACM;
    DWORD vdwDriver;
    WINAPI_ACMDRIVERDETAILS_SUPPORTF fdwSupport;
    DWORD cFormatTags;
    DWORD cFilterTags;
    HICON hicon;
    TCHAR szShortName[ACMDRIVERDETAILS_SHORTNAME_CHARS];
    TCHAR szLongName[ACMDRIVERDETAILS_LONGNAME_CHARS];
    TCHAR szCopyright[ACMDRIVERDETAILS_COPYRIGHT_CHARS];
    TCHAR szLicensing[ACMDRIVERDETAILS_LICENSING_CHARS];
    TCHAR szFeatures[ACMDRIVERDETAILS_FEATURES_CHARS];
  } ACMDRIVERDETAILS;
# pragma pack( pop )
  typedef ACMDRIVERDETAILS *LPACMDRIVERDETAILS; //Pointer
# pragma pack( push, 1 )
  typedef struct ACMFILTERDETAILS {
    DWORD cbStruct;
    DWORD dwFilterIndex;
    DWORD dwFilterTag;
    WINAPI_ACMDRIVERDETAILS_SUPPORTF fdwSupport;
    LPWAVEFILTER pwfltr;
    DWORD cbwfltr;
    TCHAR szFilter[ACMFILTERDETAILS_FILTER_CHARS];
  } ACMFILTERDETAILS;
# pragma pack( pop )
  typedef ACMFILTERDETAILS *LPACMFILTERDETAILS; //Pointer
  typedef DWORD WINAPI_ACMFILTERCHOOSE_STYLEF; //Alias
  typedef DWORD WINAPI_ACM_FILTERENUMF; //Alias
# pragma pack( push, 1 )
  typedef struct ACMFILTERCHOOSE {
    DWORD cbStruct;
    WINAPI_ACMFILTERCHOOSE_STYLEF fdwStyle;
    HWND hwndOwner;
    LPWAVEFILTER pwfltr;
    DWORD cbwfltr;
    LPCTSTR pszTitle;
    TCHAR szFilterTag[ACMFILTERTAGDETAILS_FILTERTAG_CHARS];
    TCHAR szFilter[ACMFILTERDETAILS_FILTER_CHARS];
    LPTSTR pszName;
    DWORD cchName;
    WINAPI_ACM_FILTERENUMF fdwEnum;
    LPWAVEFILTER pwfltrEnum;
    HINSTANCE hInstance;
    LPCTSTR pszTemplateName;
    LPARAM lCustData;
    ACMFILTERCHOOSEHOOKPROC pfnHook;
  } ACMFILTERCHOOSE;
# pragma pack( pop )
  typedef ACMFILTERCHOOSE *LPACMFILTERCHOOSE; //Pointer
# pragma pack( push, 1 )
  typedef struct ACMFILTERTAGDETAILS {
    DWORD cbStruct;
    DWORD dwFilterTagIndex;
    DWORD dwFilterTag;
    DWORD cbFilterSize;
    WINAPI_ACMDRIVERDETAILS_SUPPORTF fdwSupport;
    DWORD cStandardFilters;
    TCHAR szFilterTag[ACMFILTERTAGDETAILS_FILTERTAG_CHARS];
  } ACMFILTERTAGDETAILS;
# pragma pack( pop )
  typedef ACMFILTERTAGDETAILS *LPACMFILTERTAGDETAILS; //Pointer
  typedef DWORD WINAPI_ACMFORMATCHOOSE_STYLEF; //Alias
  typedef DWORD WINAPI_ACM_FORMATENUMF; //Alias
# pragma pack( push, 1 )
  typedef struct ACMFORMATCHOOSE {
    DWORD cbStruct;
    WINAPI_ACMFORMATCHOOSE_STYLEF fdwStyle;
    HWND hwndOwner;
    LPWAVEFORMATEX pwfx;
    DWORD cbwfx;
    LPCWSTR pszTitle;
    TCHAR szFormatTag[ACMFORMATTAGDETAILS_FORMATTAG_CHARS];
    TCHAR szFormat[ACMFORMATDETAILS_FORMAT_CHARS];
    LPTSTR pszName;
    DWORD cchName;
    WINAPI_ACM_FORMATENUMF fdwEnum;
    LPWAVEFORMATEX pwfxEnum;
    HINSTANCE hInstance;
    LPCTSTR pszTemplateName;
    LPARAM lCustData;
    ACMFORMATCHOOSEHOOKPROC pfnHook;
  } ACMFORMATCHOOSE;
# pragma pack( pop )
  typedef ACMFORMATCHOOSE *LPACMFORMATCHOOSE; //Pointer
# pragma pack( push, 1 )
  typedef struct ACMFORMATDETAILS {
    DWORD cbStruct;
    DWORD dwFormatIndex;
    DWORD dwFormatTag;
    WINAPI_ACMDRIVERDETAILS_SUPPORTF fdwSupport;
    LPWAVEFORMATEX pwfx;
    DWORD cbwfx;
    TCHAR szFormat[ACMFORMATDETAILS_FORMAT_CHARS];
  } ACMFORMATDETAILS;
# pragma pack( pop )
  typedef ACMFORMATDETAILS *LPACMFORMATDETAILS; //Pointer
# pragma pack( push, 1 )
  typedef struct ACMFORMATTAGDETAILS {
    DWORD cbStruct;
    DWORD dwFormatTagIndex;
    DWORD dwFormatTag;
    DWORD cbFormatSize;
    WINAPI_ACMDRIVERDETAILS_SUPPORTF fdwSupport;
    DWORD cStandardFormats;
    TCHAR szFormatTag[ACMFORMATTAGDETAILS_FORMATTAG_CHARS];
  } ACMFORMATTAGDETAILS;
# pragma pack( pop )
  typedef ACMFORMATTAGDETAILS *LPACMFORMATTAGDETAILS; //Pointer
  typedef DWORD WINAPI_ACMSTREAMHEADER_STATUSF; //Alias
]]
if ffi.arch == 'x86' then ffi.cdef[[
  enum { _DRVRESERVED = 10 };
]]
end
ffi.cdef[[
]]
if ffi.arch == 'x64' then ffi.cdef[[
]]
end
ffi.cdef[[
# pragma pack( push, 1 )
  typedef struct ACMSTREAMHEADER {
    DWORD cbStruct;
    WINAPI_ACMSTREAMHEADER_STATUSF fdwStatus;
    DWORD_PTR dwUser;
    LPBYTE pbSrc;
    DWORD cbSrcLength;
    DWORD cbSrcLengthUsed;
    DWORD_PTR dwSrcUser;
    LPBYTE pbDst;
    DWORD cbDstLength;
    DWORD cbDstLengthUsed;
    DWORD_PTR dwDstUser;
    DWORD dwReservedDriver[_DRVRESERVED];
  } ACMSTREAMHEADER;
# pragma pack( pop )
  typedef ACMSTREAMHEADER *LPACMSTREAMHEADER; //Pointer
  MMRESULT acmDriverAdd(             LPHACMDRIVERID phadid, HINSTANCE hinstModule, LPARAM lParam, DWORD dwPriority, DWORD fdwAdd);
  MMRESULT acmDriverClose(           HACMDRIVER had, DWORD fdwClose);
  MMRESULT acmDriverDetails(         HACMDRIVERID hadid, LPACMDRIVERDETAILS padd, DWORD fdwDetails);
  MMRESULT acmDriverEnum(            ACMDRIVERENUMCB fnCallback, DWORD_PTR dwInstance, DWORD fdwEnum);
  MMRESULT acmDriverID(              HACMOBJ hao, LPHACMDRIVERID phadid, DWORD fdwDriverID);
  LRESULT  acmDriverMessage(         HACMDRIVER had, UINT uMsg, LPARAM lParam1, LPARAM lParam2);
  MMRESULT acmDriverOpen(            LPHACMDRIVER phad, HACMDRIVERID hadid, DWORD fdwOpen);
  MMRESULT acmDriverPriority(        HACMDRIVERID hadid, DWORD dwPriority, DWORD fdwPriority);
  MMRESULT acmDriverRemove(          HACMDRIVERID hadid, DWORD fdwRemove);
  MMRESULT acmFilterChoose(          LPACMFILTERCHOOSE pafltrc);
  MMRESULT acmFilterDetails(         HACMDRIVER had, LPACMFILTERDETAILS pafd, DWORD fdwDetails);
  MMRESULT acmFilterEnum(            HACMDRIVER had, LPACMFILTERDETAILS pafd, ACMFILTERENUMCB fnCallback, DWORD_PTR dwInstance, WINAPI_ACM_FILTERENUMF fdwEnum);
  MMRESULT acmFilterTagDetails(      HACMDRIVER had, LPACMFILTERTAGDETAILS paftd, DWORD_PTR fdwDetails);
  MMRESULT acmFilterTagEnum(         HACMDRIVER had, LPACMFILTERTAGDETAILS paftd, ACMFILTERTAGENUMCB fnCallback, DWORD_PTR dwInstance, DWORD fdwEnum);
  MMRESULT acmFormatChoose(          LPACMFORMATCHOOSE pfmtc);
  MMRESULT acmFormatDetails(         HACMDRIVER had, LPACMFORMATDETAILS pafd, DWORD fdwDetails);
  MMRESULT acmFormatEnum(            HACMDRIVER had, LPACMFORMATDETAILS pafd, ACMFORMATENUMCB fnCallback, DWORD_PTR dwInstance, DWORD fdwEnum);
  MMRESULT acmFormatSuggest(         HACMDRIVER had, LPWAVEFORMATEX pwfxSrc, LPWAVEFORMATEX pwfxDst, DWORD cbwfxDst, DWORD fdwSuggest);
  MMRESULT acmFormatTagDetails(      HACMDRIVER had, LPACMFORMATTAGDETAILS paftd, DWORD fdwDetails);
  MMRESULT acmFormatTagEnum(         HACMDRIVER had, LPACMFORMATTAGDETAILS paftd, ACMFORMATTAGENUMCB fnCallback, DWORD_PTR dwInstance, DWORD fdwEnum);
  DWORD    acmGetVersion(            );
  MMRESULT acmMetrics(               HACMOBJ hao, UINT uMetric, LPVOID pMetric);
  MMRESULT acmStreamClose(           HACMSTREAM has, DWORD fdwClose);
  MMRESULT acmStreamConvert(         HACMSTREAM has, LPACMSTREAMHEADER pash, DWORD fdwConvert);
  MMRESULT acmStreamMessage(         HACMSTREAM has, UINT uMsg, LPARAM lParam1, LPARAM lParam2);
  MMRESULT acmStreamOpen(            LPHACMSTREAM phas, HACMDRIVER had, LPWAVEFORMATEX pwfxSrc, LPWAVEFORMATEX pwfxDst, LPWAVEFILTER pwfltr, DWORD_PTR dwCallback, DWORD_PTR dwInstance, DWORD fdwOpen);
  MMRESULT acmStreamPrepareHeader(   HACMSTREAM has, LPACMSTREAMHEADER pash, DWORD fdwPrepare);
  MMRESULT acmStreamReset(           HACMSTREAM has, DWORD fdwReset);
  MMRESULT acmStreamSize(            HACMSTREAM has, DWORD cbInput, LPDWORD pdwOutputBytes, DWORD fdwSize);
  MMRESULT acmStreamUnprepareHeader( HACMSTREAM has, LPACMSTREAMHEADER pash, DWORD fdwUnprepare);
]]
return ffi.load( 'msacm32.dll' )

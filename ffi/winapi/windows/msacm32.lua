require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/multimedia' )
local ffi = require( 'ffi' )
ffi.cdef [[
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

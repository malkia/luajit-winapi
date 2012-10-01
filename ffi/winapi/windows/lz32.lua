require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  INT  GetExpandedName( LPTSTR lpszSource, LPTSTR lpszBuffer);
  void LZClose(         INT hFile);
  LONG LZCopy(          INT hfSource, INT hfDest);
  INT  LZInit(          INT hfSource);
  INT  LZOpenFile(      LPTSTR lpFileName, LPOFSTRUCT lpReOpenBuf, WINAPI_OpenFlags wStyle);
  INT  LZRead(          INT hFile, LPBYTE lpBuffer, INT cbRead);
  LONG LZSeek(          INT hFile, LONG lOffset, INT iOrigin);
]]
return ffi.load( "Lz32.dll" )

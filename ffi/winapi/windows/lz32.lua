require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef WORD OpenFlags; //Alias
  INT  GetExpandedName( LPTSTR lpszSource, LPTSTR lpszBuffer);
  void LZClose(         INT hFile);
  LONG LZCopy(          INT hfSource, INT hfDest);
  INT  LZInit(          INT hfSource);
  INT  LZOpenFile(      LPTSTR lpFileName, LPOFSTRUCT lpReOpenBuf, OpenFlags wStyle);
  INT  LZRead(          INT hFile, LPBYTE lpBuffer, INT cbRead);
  LONG LZSeek(          INT hFile, LONG lOffset, INT iOrigin);
]]
ffi.load( 'Lz32.dll' )

require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/windows/clfsw32' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef struct TXF_ID {
    LONGLONG LowPart;
    LONGLONG HighPart;
  } TXF_ID;
  typedef TXF_ID *PTXF_ID; //Pointer
  BOOL TxfLogCreateFileReadContext( LPCWSTR LogPath, CLFS_LSN BeginningLsn, CLFS_LSN EndingLSN, PTXF_ID TxfFileId, PVOID* TxfLogContext);
  BOOL TxfLogDestroyReadContext(    PVOID TxfLogContext);
  BOOL TxfLogReadRecords(           PVOID TxfLogContext, ULONG BufferLength, PVOID Buffer, PULONG BytesUsed, PULONG RecordCount);
]]
ffi.load( 'TxfW32.dll' )

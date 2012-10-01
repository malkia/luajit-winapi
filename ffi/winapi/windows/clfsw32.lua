require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  BOOL              AlignReservedLog(              PVOID pvMarshal, ULONG cReservedRecords, LONGLONG [] rgcbReservation, PLONGLONG pcbAlignReservation);
  BOOL              AllocReservedLog(              PVOID pvMarshal, ULONG cReservedRecords, PLONGLONG pcbAdjustment);
  BOOL              CloseAndResetLogFile(          HANDLE hLog);
  HANDLE            CreateLogFile(                 LPCWSTR pszLogFileName, ACCESS_MASK fDesiredAccess, DWORD dwShareMode, LPSECURITY_ATTRIBUTES psaLogFile, ULONG fCreateDisposition, ULONG fFlagsAndAttributes);
  BOOL              DeleteLogByHandle(             HANDLE hLog);
  BOOL              DeleteLogFile(                 LPCWSTR pszLogFileName, PVOID pvReserved);
  BOOL              DumpLogRecords(                PWSTR pwszLogFileName, CLFS_RECORD_TYPE fRecordType, PCLFS_LSN plsnStart, PCLFS_LSN plsnEnd, PFILE pstrmOut, CLFS_PRINT_RECORD_ROUTINE pfnPrintRecord, CLFS_BLOCK_ALLOCATION pfnAllocBlock, CLFS_BLOCK_DEALLOCATION pfnFreeBlock, PVOID pvBlockAllocContext, ULONG cbBlock, ULONG cMaxBlocks);
  BOOL              FlushLogBuffers(               PVOID pvMarshal, LPOVERLAPPED pOverlapped);
  BOOL              FlushLogToLsn(                 PVOID pvMarshalContext, PCLFS_LSN plsnFlush, PCLFS_LSN plsnLastFlushed, LPOVERLAPPED pOverlapped);
  BOOL              FreeReservedLog(               PVOID pvMarshal, ULONG cReservedRecords, PLONGLONG pcbAdjustment);
  BOOL              ReserveAndAppendLog(           PVOID pvMarshal, PCLFS_WRITE_ENTRY rgWriteEntries, ULONG cWriteEntries, PCLFS_LSN plsnUndoNext, PCLFS_LSN plsnPrevious, ULONG cReserveRecords, LONGLONG [] rgcbReservation, ULONG fFlags, PCLFS_LSN plsn, LPOVERLAPPED pOverlapped);
  BOOL              ReserveAndAppendLogAligned(    PVOID pvMarshal, PCLFS_WRITE_ENTRY rgWriteEntries, ULONG cWriteEntries, ULONG cbEntryAlignment, PCLFS_LSN plsnUndoNext, PCLFS_LSN plsnPrevious, ULONG cReserveRecords, LONGLONG [] rgcbReservation, ULONG fFlags, PCLFS_LSN plsn, LPOVERLAPPED overlapped);
  BOOL              GetLogFileInformation(         HANDLE hLog, PCLFS_INFORMATION pinfoBuffer, PULONG cbBuffer);
  BOOL              GetLogIoStatistics(            HANDLE hLog, PVOID pvStatsBuffer, ULONG cbStatsBuffer, CLFS_IOSTATS_CLASS eStatsClass, PULONG pcbStatsWritten);
  BOOL              ReadLogRecord(                 PVOID pvMarshal, PCLFS_LSN plsnFirst, CLFS_CONTEXT_MODE eContextMode, PVOID* ppvReadBuffer, PULONG pcbReadBuffer, PCLFS_RECORD_TYPE peRecordType, PCLFS_LSN plsnUndoNext, PCLFS_LSN plsnPrevious, PVOID* ppvReadContext, LPOVERLAPPED pOverlapped);
  BOOL              ReadNextLogRecord(             PVOID pvReadContext, PVOID* ppvBuffer, PULONG pcbBuffer, PCLFS_RECORD_TYPE peRecordType, PCLFS_LSN plsnUser, PCLFS_LSN plsnUndoNext, PCLFS_LSN plsnPrevious, PCLFS_LSN plsnRecord, LPOVERLAPPED pOverlapped);
  BOOL              SetEndOfLog(                   HANDLE hLog, PCLFS_LSN plsnEnd, LPOVERLAPPED lpOverlapped);
  BOOL              TruncateLog(                   PVOID pvMarshal, PCLFS_LSN plsnEnd, LPOVERLAPPED lpOverlapped);
  BOOL              TerminateReadLog(              PVOID pvCursorContext);
  BOOL              AddLogContainer(               HANDLE hLog, PULONGLONG pcbContainer, LPWSTR pwszContainerPath, LPVOID pReserved);
  BOOL              AddLogContainerSet(            HANDLE hLog, USHORT cContainers, PULONGLONG pcbContainer, LPWSTR* rgwszContainerPath, PVOID Reserved);
  BOOL              CreateLogContainerScanContext( HANDLE hLog, ULONG cFromContainer, ULONG cContainers, CLFS_SCAN_MODE eScanMode, PCLFS_SCAN_CONTEXT pcxScan, LPOVERLAPPED pOverlapped);
  BOOL              ScanLogContainers(             PCLFS_SCAN_CONTEXT pcxScan, CLFS_SCAN_MODE eScanMode, LPVOID pReserved);
  BOOL              GetLogContainerName(           HANDLE hLog, CLFS_CONTAINER_ID cidLogicalContainer, LPCWSTR pwstrContainerName, ULONG cLenContainerName, PULONG pcActualLenContainerName);
  BOOL              RemoveLogContainer(            HANDLE hLog, LPWSTR pwszContainerPath, BOOL fForce, LPVOID pReserved);
  BOOL              RemoveLogContainerSet(         HANDLE hLog, USHORT cContainers, LPWSTR* rgwszContainerPath, BOOL fForce, LPVOID pReserved);
  BOOL              AdvanceLogBase(                PVOID pvMarshal, PCLFS_LSN plsnBase, ULONG fFlags, LPOVERLAPPED pOverlapped);
  BOOL              ReadLogRestartArea(            PVOID pvMarshal, PVOID* ppvRestartBuffer, PULONG pcbRestartBuffer, PCLFS_LSN plsn, PVOID* ppvContext, LPOVERLAPPED pOverlapped);
  BOOL              ReadPreviousLogRestartArea(    PVOID pvReadContext, PVOID* ppvRestartBuffer, PULONG pcbRestartBuffer, PCLFS_LSN plsnRestart, LPOVERLAPPED pOverlapped);
  BOOL              WriteLogRestartArea(           PVOID pvMarshal, PVOID pvRestartBuffer, ULONG cbRestartBuffer, PCLFS_LSN plsnBase, ULONG fFlags, PULONG pcbWritten, PCLFS_LSN plsnNext, LPOVERLAPPED pOverlapped);
  BOOL              GetNextLogArchiveExtent(       CLFS_LOG_ARCHIVE_CONTEXT pvArchiveContext, CLFS_ARCHIVE_DESCRIPTOR [] rgadExtent, ULONG cDescriptors, PULONG pcDescriptorsReturned);
  BOOL              PrepareLogArchive(             HANDLE hLog, PWSTR pszBaseLogFileName, ULONG cLen, PCLFS_LSN plsnLow, PCLFS_LSN plsnHigh, PULONG pcActualLength, PULONGLONG poffBaseLogFileData, PULONGLONG pcbBaseLogFileLength, PCLFS_LSN plsnBase, PCLFS_LSN plsnLast, PCLFS_LSN plsnCurrentArchiveTail, PCLFS_LOG_ARCHIVE_CONTEXT ppvArchiveContext);
  BOOL              ReadLogArchiveMetadata(        CLFS_LOG_ARCHIVE_CONTEXT pvArchiveContext, ULONG cbOffset, ULONG cbBytesToRead, PBYTE pbReadBuffer, PULONG pcbBytesRead);
  BOOL              SetLogArchiveMode(             HANDLE hLog, CLFS_LOG_ARCHIVE_MODE eMode);
  BOOL              SetLogArchiveTail(             HANDLE hLog, PCLFS_LSN plsnArchiveTail, LPVOID pReserved);
  BOOL              TerminateLogArchive(           CLFS_LOG_ARCHIVE_CONTEXT pvArchiveContext);
  BOOL              ValidateLog(                   LPCWSTR pszLogFileName, LPSECURITY_ATTRIBUTES psaLogFile, PCLFS_INFORMATION pinfoBuffer, PULONG pcbBuffer);
  BOOL              CreateLogMarshallingArea(      HANDLE hLog, CLFS_BLOCK_ALLOCATION pfnAllocBuffer, CLFS_BLOCK_DEALLOCATION pfnFreeBuffer, PVOID pvBlockAllocContext, ULONG cbMarshallingBuffer, ULONG cMaxWriteBuffers, ULONG cMaxReadBuffers, PVOID* ppvMarshal);
  BOOL              DeleteLogMarshallingArea(      PVOID pvMarshal);
  ULONG             LsnBlockOffset(                CLFS_LSN* plsn);
  CLFS_CONTAINER_ID LsnContainer(                  CLFS_LSN* plsn);
  CLFS_LSN          LsnCreate(                     CLFS_CONTAINER_ID cidContainer, ULONG offBlock, ULONG cRecord);
  BOOL              LsnEqual(                      CLFS_LSN* plsn1, CLFS_LSN* plsn2);
  BOOL              LsnGreater(                    CLFS_LSN* plsn1, CLFS_LSN* plsn2);
  BOOL              LsnLess(                       CLFS_LSN* plsn1, CLFS_LSN* plsn2);
  BOOL              LsnNull(                       CLFS_LSN* plsn);
  ULONG             LsnRecordSequence(             CLFS_LSN* plsn);
]]
return ffi.load( "Clfsw32.dll" )

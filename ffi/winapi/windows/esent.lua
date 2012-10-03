require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef unsigned long JET_GRBIT; //Alias
  typedef JET_GRBIT WINAPI_JET_GRBIT; //Alias
  typedef LPCTSTR JET_PCSTR; //Alias
  typedef LPCTSTR JET_PSTR; //Alias
  typedef LPCTSTR JET_PCTSTR; //Alias
  typedef UINT_PTR JET_API_PTR; //Alias
  typedef JET_API_PTR JET_SESID; //Alias
  typedef JET_API_PTR JET_TABLEID; //Alias
  typedef unsigned long JET_COLUMNID; //Alias
  typedef JET_API_PTR JET_INSTANCE; //Alias
  typedef unsigned long JET_DBID; //Alias
  typedef JET_API_PTR JET_HANDLE; //Alias
  typedef LPVOID JET_PFNSTATUS; //Alias
  typedef LPVOID JET_CALLBACK; //Alias
  typedef JET_API_PTR JET_LS; //Alias
  typedef unsigned long JET_CBTYP; //Alias
  typedef unsigned long JET_OBJTYP; //Alias
  typedef JET_API_PTR JET_OSSNAPID; //Alias
  typedef JET_OSSNAPID WINAPI_JET_OSSNAPID; //Alias
  typedef LPVOID JET_PFNREALLOC; //Alias
  typedef unsigned long JET_COLTYP; //Alias
  enum { JET_BASE_NAME_LENGTH = 4 };
  typedef long JET_ERR; //Alias
  static const long JET_errSuccess = 0;
  static const long JET_wrnNyi = -1;
  static const long JET_errRfsFailure = -100;
  static const long JET_errRfsNotArmed = -101;
  static const long JET_errFileClose = -102;
  static const long JET_errOutOfThreads = -103;
  static const long JET_errTooManyIO = -105;
  static const long JET_errTaskDropped = -106;
  static const long JET_errInternalError = -107;
  static const long JET_errDatabaseBufferDependenciesCorrupted = -255;
  static const long JET_wrnRemainingVersions = 321;
  static const long JET_errPreviousVersion = -322;
  static const long JET_errPageBoundary = -323;
  static const long JET_errKeyBoundary = -324;
  static const long JET_errBadPageLink = -327;
  static const long JET_errBadBookmark = -328;
  static const long JET_errNTSystemCallFailed = -334;
  static const long JET_errBadParentPageLink = -338;
  static const long JET_errSPAvailExtCacheOutOfSync = -340;
  static const long JET_errSPAvailExtCorrupted = -341;
  static const long JET_errSPAvailExtCacheOutOfMemory = -342;
  static const long JET_errSPOwnExtCorrupted = -343;
  static const long JET_errDbTimeCorrupted = -344;
  static const long JET_wrnUniqueKey = 345;
  static const long JET_errKeyTruncated = -346;
  static const long JET_wrnSeparateLongValue = 406;
  static const long JET_errKeyTooBig = -408;
  static const long JET_errInvalidLoggedOperation = -500;
  static const long JET_errLogFileCorrupt = -501;
  static const long JET_errNoBackupDirectory = -503;
  static const long JET_errBackupDirectoryNotEmpty = -504;
  static const long JET_errBackupInProgress = -505;
  static const long JET_errRestoreInProgress = -506;
  static const long JET_errMissingPreviousLogFile = -509;
  static const long JET_errLogWriteFail = -510;
  static const long JET_errLogDisabledDueToRecoveryFailure = -511;
  static const long JET_errCannotLogDuringRecoveryRedo = -512;
  static const long JET_errLogGenerationMismatch = -513;
  static const long JET_errBadLogVersion = -514;
  static const long JET_errInvalidLogSequence = -515;
  static const long JET_errLoggingDisabled = -516;
  static const long JET_errLogBufferTooSmall = -517;
  static const long JET_errLogSequenceEnd = -519;
  static const long JET_errNoBackup = -520;
  static const long JET_errInvalidBackupSequence = -521;
  static const long JET_errBackupNotAllowedYet = -523;
  static const long JET_errDeleteBackupFileFail = -524;
  static const long JET_errMakeBackupDirectoryFail = -525;
  static const long JET_errInvalidBackup = -526;
  static const long JET_errRecoveredWithErrors = -527;
  static const long JET_errMissingLogFile = -528;
  static const long JET_errLogDiskFull = -529;
  static const long JET_errBadLogSignature = -530;
  static const long JET_errBadDbSignature = -531;
  static const long JET_errBadCheckpointSignature = -532;
  static const long JET_errCheckpointCorrupt = -533;
  static const long JET_errMissingPatchPage = -534;
  static const long JET_errBadPatchPage = -535;
  static const long JET_errRedoAbruptEnded = -536;
  static const long JET_errBadSLVSignature = -537;
  static const long JET_errPatchFileMissing = -538;
  static const long JET_errDatabaseLogSetMismatch = -539;
  static const long JET_errDatabaseStreamingFileMismatch = -540;
  static const long JET_errLogFileSizeMismatch = -541;
  static const long JET_errCheckpointFileNotFound = -542;
  static const long JET_errRequiredLogFilesMissing = -543;
  static const long JET_errSoftRecoveryOnBackupDatabase = -544;
  static const long JET_errLogFileSizeMismatchDatabasesConsistent = -545;
  static const long JET_errLogSectorSizeMismatch = -546;
  static const long JET_errLogSectorSizeMismatchDatabasesConsistent = -547;
  static const long JET_errLogSequenceEndDatabasesConsistent = -548;
  static const long JET_errStreamingDataNotLogged = -549;
  static const long JET_errDatabaseDirtyShutdown = -550;
  static const long JET_errConsistentTimeMismatch = -551;
  static const long JET_errDatabasePatchFileMismatch = -552;
  static const long JET_errEndingRestoreLogTooLow = -553;
  static const long JET_errStartingRestoreLogTooHigh = -554;
  static const long JET_errGivenLogFileHasBadSignature = -555;
  static const long JET_errGivenLogFileIsNotContiguous = -556;
  static const long JET_errMissingRestoreLogFiles = -557;
  static const long JET_wrnExistingLogFileHasBadSignature = 558;
  static const long JET_wrnExistingLogFileIsNotContiguous = 559;
  static const long JET_errMissingFullBackup = -560;
  static const long JET_errBadBackupDatabaseSize = -561;
  static const long JET_errDatabaseAlreadyUpgraded = -562;
  static const long JET_errDatabaseIncompleteUpgrade = -563;
  static const long JET_wrnSkipThisRecord = 564;
  static const long JET_errMissingCurrentLogFiles = -565;
  static const long JET_errDbTimeTooOld = -566;
  static const long JET_errDbTimeTooNew = -567;
  static const long JET_errMissingFileToBackup = -569;
  static const long JET_errLogTornWriteDuringHardRestore = -570;
  static const long JET_errLogTornWriteDuringHardRecovery = -571;
  static const long JET_errLogCorruptDuringHardRestore = -573;
  static const long JET_errLogCorruptDuringHardRecovery = -574;
  static const long JET_errMustDisableLoggingForDbUpgrade = -575;
  static const long JET_errBadRestoreTargetInstance = -577;
  static const long JET_wrnTargetInstanceRunning = 578;
  static const long JET_errRecoveredWithoutUndo = -579;
  static const long JET_errDatabasesNotFromSameSnapshot = -580;
  static const long JET_errSoftRecoveryOnSnapshot = -581;
  static const long JET_errSectorSizeNotSupported = -583;
  static const long JET_wrnDatabaseRepaired = 595;
  static const long JET_errUnicodeTranslationBufferTooSmall = -601;
  static const long JET_errUnicodeTranslationFail = -602;
  static const long JET_errUnicodeNormalizationNotSupported = -603;
  static const long JET_errExistingLogFileHasBadSignature = -610;
  static const long JET_errExistingLogFileIsNotContiguous = -611;
  static const long JET_errLogReadVerifyFailure = -612;
  static const long JET_errSLVReadVerifyFailure = -613;
  static const long JET_errCheckpointDepthTooDeep = -614;
  static const long JET_errRestoreOfNonBackupDatabase = -615;
  static const long JET_errLogFileNotCopied = -616;
  static const long JET_errInvalidGrbit = -900;
  static const long JET_errTermInProgress = -1000;
  static const long JET_errFeatureNotAvailable = -1001;
  static const long JET_errInvalidName = -1002;
  static const long JET_errInvalidParameter = -1003;
  static const long JET_wrnColumnNull = 1004;
  static const long JET_wrnBufferTruncated = 1006;
  static const long JET_wrnDatabaseAttached = 1007;
  static const long JET_errDatabaseFileReadOnly = -1008;
  static const long JET_wrnSortOverflow = 1009;
  static const long JET_errInvalidDatabaseId = -1010;
  static const long JET_errOutOfMemory = -1011;
  static const long JET_errOutOfDatabaseSpace = -1012;
  static const long JET_errOutOfCursors = -1013;
  static const long JET_errOutOfBuffers = -1014;
  static const long JET_errTooManyIndexes = -1015;
  static const long JET_errTooManyKeys = -1016;
  static const long JET_errRecordDeleted = -1017;
  static const long JET_errReadVerifyFailure = -1018;
  static const long JET_errPageNotInitialized = -1019;
  static const long JET_errOutOfFileHandles = -1020;
  static const long JET_errDiskIO = -1022;
  static const long JET_errInvalidPath = -1023;
  static const long JET_errInvalidSystemPath = -1024;
  static const long JET_errInvalidLogDirectory = -1025;
  static const long JET_errRecordTooBig = -1026;
  static const long JET_errTooManyOpenDatabases = -1027;
  static const long JET_errInvalidDatabase = -1028;
  static const long JET_errNotInitialized = -1029;
  static const long JET_errAlreadyInitialized = -1030;
  static const long JET_errInitInProgress = -1031;
  static const long JET_errFileAccessDenied = -1032;
  static const long JET_errBufferTooSmall = -1038;
  static const long JET_wrnSeekNotEqual = 1039;
  static const long JET_errTooManyColumns = -1040;
  static const long JET_errContainerNotEmpty = -1043;
  static const long JET_errInvalidFilename = -1044;
  static const long JET_errInvalidBookmark = -1045;
  static const long JET_errColumnInUse = -1046;
  static const long JET_errInvalidBufferSize = -1047;
  static const long JET_errColumnNotUpdatable = -1048;
  static const long JET_errIndexInUse = -1051;
  static const long JET_errLinkNotSupported = -1052;
  static const long JET_errNullKeyDisallowed = -1053;
  static const long JET_errNotInTransaction = -1054;
  static const long JET_wrnNoErrorInfo = 1055;
  static const long JET_wrnNoIdleActivity = 1058;
  static const long JET_errTooManyActiveUsers = -1059;
  static const long JET_errInvalidCountry = -1061;
  static const long JET_errInvalidLanguageId = -1062;
  static const long JET_errInvalidCodePage = -1063;
  static const long JET_errInvalidLCMapStringFlags = -1064;
  static const long JET_errVersionStoreEntryTooBig = -1065;
  static const long JET_errVersionStoreOutOfMemoryAndCleanupTimedOut = -1066;
  static const long JET_wrnNoWriteLock = 1067;
  static const long JET_wrnColumnSetNull = 1068;
  static const long JET_errVersionStoreOutOfMemory = -1069;
  static const long JET_errCannotIndex = -1071;
  static const long JET_errRecordNotDeleted = -1072;
  static const long JET_errTooManyMempoolEntries = -1073;
  static const long JET_errOutOfObjectIDs = -1074;
  static const long JET_errOutOfLongValueIDs = -1075;
  static const long JET_errOutOfAutoincrementValues = -1076;
  static const long JET_errOutOfDbtimeValues = -1077;
  static const long JET_errOutOfSequentialIndexValues = -1078;
  static const long JET_errRunningInOneInstanceMode = -1080;
  static const long JET_errRunningInMultiInstanceMode = -1081;
  static const long JET_errSystemParamsAlreadySet = -1082;
  static const long JET_errSystemPathInUse = -1083;
  static const long JET_errLogFilePathInUse = -1084;
  static const long JET_errTempPathInUse = -1085;
  static const long JET_errInstanceNameInUse = -1086;
  static const long JET_errInstanceUnavailable = -1090;
  static const long JET_errDatabaseUnavailable = -1091;
  static const long JET_errInstanceUnavailableDueToFatalLogDiskFull = -1092;
  static const long JET_errOutOfSessions = -1101;
  static const long JET_errWriteConflict = -1102;
  static const long JET_errTransTooDeep = -1103;
  static const long JET_errInvalidSesid = -1104;
  static const long JET_errWriteConflictPrimaryIndex = -1105;
  static const long JET_errInTransaction = -1108;
  static const long JET_errRollbackRequired = -1109;
  static const long JET_errTransReadOnly = -1110;
  static const long JET_errSessionWriteConflict = -1111;
  static const long JET_errRecordTooBigForBackwardCompatibility = -1112;
  static const long JET_errCannotMaterializeForwardOnlySort = -1113;
  static const long JET_errSesidTableIdMismatch = -1114;
  static const long JET_errInvalidInstance = -1115;
  static const long JET_errDatabaseDuplicate = -1201;
  static const long JET_errDatabaseInUse = -1202;
  static const long JET_errDatabaseNotFound = -1203;
  static const long JET_errDatabaseInvalidName = -1204;
  static const long JET_errDatabaseInvalidPages = -1205;
  static const long JET_errDatabaseCorrupted = -1206;
  static const long JET_errDatabaseLocked = -1207;
  static const long JET_errCannotDisableVersioning = -1208;
  static const long JET_errInvalidDatabaseVersion = -1209;
  static const long JET_errDatabase200Format = -1210;
  static const long JET_errDatabase400Format = -1211;
  static const long JET_errDatabase500Format = -1212;
  static const long JET_errPageSizeMismatch = -1213;
  static const long JET_errTooManyInstances = -1214;
  static const long JET_errDatabaseSharingViolation = -1215;
  static const long JET_errAttachedDatabaseMismatch = -1216;
  static const long JET_errDatabaseInvalidPath = -1217;
  static const long JET_errDatabaseIdInUse = -1218;
  static const long JET_errForceDetachNotAllowed = -1219;
  static const long JET_errCatalogCorrupted = -1220;
  static const long JET_errPartiallyAttachedDB = -1221;
  static const long JET_errDatabaseSignInUse = -1222;
  static const long JET_errDatabaseCorruptedNoRepair = -1224;
  static const long JET_errInvalidCreateDbVersion = -1225;
  static const long JET_wrnTableEmpty = 1301;
  static const long JET_errTableLocked = -1302;
  static const long JET_errTableDuplicate = -1303;
  static const long JET_errTableInUse = -1304;
  static const long JET_errObjectNotFound = -1305;
  static const long JET_errDensityInvalid = -1307;
  static const long JET_errTableNotEmpty = -1308;
  static const long JET_errInvalidTableId = -1310;
  static const long JET_errTooManyOpenTables = -1311;
  static const long JET_errIllegalOperation = -1312;
  static const long JET_errTooManyOpenTablesAndCleanupTimedOut = -1313;
  static const long JET_errObjectDuplicate = -1314;
  static const long JET_errInvalidObject = -1316;
  static const long JET_errCannotDeleteTempTable = -1317;
  static const long JET_errCannotDeleteSystemTable = -1318;
  static const long JET_errCannotDeleteTemplateTable = -1319;
  static const long JET_errExclusiveTableLockRequired = -1322;
  static const long JET_errFixedDDL = -1323;
  static const long JET_errFixedInheritedDDL = -1324;
  static const long JET_errCannotNestDDL = -1325;
  static const long JET_errDDLNotInheritable = -1326;
  static const long JET_wrnTableInUseBySystem = 1327;
  static const long JET_errInvalidSettings = -1328;
  static const long JET_errClientRequestToStopJetService = -1329;
  static const long JET_errCannotAddFixedVarColumnToDerivedTable = -1330;
  static const long JET_errIndexCantBuild = -1401;
  static const long JET_errIndexHasPrimary = -1402;
  static const long JET_errIndexDuplicate = -1403;
  static const long JET_errIndexNotFound = -1404;
  static const long JET_errIndexMustStay = -1405;
  static const long JET_errIndexInvalidDef = -1406;
  static const long JET_errInvalidCreateIndex = -1409;
  static const long JET_errTooManyOpenIndexes = -1410;
  static const long JET_errMultiValuedIndexViolation = -1411;
  static const long JET_errIndexBuildCorrupted = -1412;
  static const long JET_errPrimaryIndexCorrupted = -1413;
  static const long JET_errSecondaryIndexCorrupted = -1414;
  static const long JET_wrnCorruptIndexDeleted = 1415;
  static const long JET_errInvalidIndexId = -1416;
  static const long JET_errIndexTuplesSecondaryIndexOnly = -1430;
  static const long JET_errIndexTuplesTooManyColumns = -1431;
  static const long JET_errIndexTuplesNonUniqueOnly = -1432;
  static const long JET_errIndexTuplesTextBinaryColumnsOnly = -1433;
  static const long JET_errIndexTuplesVarSegMacNotAllowed = -1434;
  static const long JET_errIndexTuplesInvalidLimits = -1435;
  static const long JET_errIndexTuplesCannotRetrieveFromIndex = -1436;
  static const long JET_errIndexTuplesKeyTooSmall = -1437;
  static const long JET_errColumnLong = -1501;
  static const long JET_errColumnNoChunk = -1502;
  static const long JET_errColumnDoesNotFit = -1503;
  static const long JET_errNullInvalid = -1504;
  static const long JET_errColumnIndexed = -1505;
  static const long JET_errColumnTooBig = -1506;
  static const long JET_errColumnNotFound = -1507;
  static const long JET_errColumnDuplicate = -1508;
  static const long JET_errMultiValuedColumnMustBeTagged = -1509;
  static const long JET_errColumnRedundant = -1510;
  static const long JET_errInvalidColumnType = -1511;
  static const long JET_wrnColumnMaxTruncated = 1512;
  static const long JET_errTaggedNotNULL = -1514;
  static const long JET_errNoCurrentIndex = -1515;
  static const long JET_errKeyIsMade = -1516;
  static const long JET_errBadColumnId = -1517;
  static const long JET_errBadItagSequence = -1518;
  static const long JET_errColumnInRelationship = -1519;
  static const long JET_wrnCopyLongValue = 1520;
  static const long JET_errCannotBeTagged = -1521;
  static const long JET_errDefaultValueTooBig = -1524;
  static const long JET_errMultiValuedDuplicate = -1525;
  static const long JET_errLVCorrupted = -1526;
  static const long JET_errMultiValuedDuplicateAfterTruncation = -1528;
  static const long JET_errDerivedColumnCorruption = -1529;
  static const long JET_errInvalidPlaceholderColumn = -1530;
  static const long JET_wrnColumnSkipped = 1531;
  static const long JET_wrnColumnNotLocal = 1532;
  static const long JET_wrnColumnMoreTags = 1533;
  static const long JET_wrnColumnTruncated = 1534;
  static const long JET_wrnColumnPresent = 1535;
  static const long JET_wrnColumnSingleValue = 1536;
  static const long JET_wrnColumnDefault = 1537;
  static const long JET_errRecordNotFound = -1601;
  static const long JET_errRecordNoCopy = -1602;
  static const long JET_errNoCurrentRecord = -1603;
  static const long JET_errRecordPrimaryChanged = -1604;
  static const long JET_errKeyDuplicate = -1605;
  static const long JET_errAlreadyPrepared = -1607;
  static const long JET_errKeyNotMade = -1608;
  static const long JET_errUpdateNotPrepared = -1609;
  static const long JET_wrnDataHasChanged = 1610;
  static const long JET_errDataHasChanged = -1611;
  static const long JET_wrnKeyChanged = 1618;
  static const long JET_errLanguageNotSupported = -1619;
  static const long JET_errTooManySorts = -1701;
  static const long JET_errInvalidOnSort = -1702;
  static const long JET_errTempFileOpenError = -1803;
  static const long JET_errTooManyAttachedDatabases = -1805;
  static const long JET_errDiskFull = -1808;
  static const long JET_errPermissionDenied = -1809;
  static const long JET_errFileNotFound = -1811;
  static const long JET_errFileInvalidType = -1812;
  static const long JET_wrnFileOpenReadOnly = 1813;
  static const long JET_errAfterInitialization = -1850;
  static const long JET_errLogCorrupted = -1852;
  static const long JET_errInvalidOperation = -1906;
  static const long JET_errAccessDenied = -1907;
  static const long JET_wrnIdleFull = 1908;
  static const long JET_errTooManySplits = -1909;
  static const long JET_errSessionSharingViolation = -1910;
  static const long JET_errEntryPointNotFound = -1911;
  static const long JET_errSessionContextAlreadySet = -1912;
  static const long JET_errSessionContextNotSetByThisThread = -1913;
  static const long JET_errSessionInUse = -1914;
  static const long JET_errRecordFormatConversionFailed = -1915;
  static const long JET_errOneDatabasePerSession = -1916;
  static const long JET_errRollbackError = -1917;
  static const long JET_wrnDefragAlreadyRunning = 2000;
  static const long JET_wrnDefragNotRunning = 2001;
  static const long JET_wrnCallbackNotRegistered = 2100;
  static const long JET_errCallbackFailed = -2101;
  static const long JET_errCallbackNotResolved = -2102;
  static const long JET_errOSSnapshotInvalidSequence = -2401;
  static const long JET_errOSSnapshotTimeOut = -2402;
  static const long JET_errOSSnapshotNotAllowed = -2403;
  static const long JET_errOSSnapshotInvalidSnapId = -2404;
  static const long JET_errLSCallbackNotSpecified = -3000;
  static const long JET_errLSAlreadySet = -3001;
  static const long JET_errLSNotSet = -3002;
  static const long JET_errFileIOSparse = -4000;
  static const long JET_errFileIOBeyondEOF = -4001;
  static const long JET_errFileIOAbort = -4002;
  static const long JET_errFileIORetry = -4003;
  static const long JET_errFileIOFail = -4004;
  static const long JET_errFileCompressed = -4005;
  typedef unsigned long WINAPI_JET_UNICODEINDEX_FLAGS; //Alias
  typedef struct JET_UNICODEINDEX {
    unsigned long lcid;
    WINAPI_JET_UNICODEINDEX_FLAGS dwMapFlags;
  } JET_UNICODEINDEX;
  typedef struct JET_COLUMNDEF {
    unsigned long cbStruct;
    JET_COLUMNID columnid;
    JET_COLTYP coltyp;
    unsigned short wCountry;
    unsigned short langid;
    unsigned short cp;
    unsigned short wCollate;
    unsigned long cbMax;
    JET_GRBIT grbit;
  } JET_COLUMNDEF;
  typedef struct JET_CONVERT {
    TCHAR* szOldDll;
    unsigned long fFlags;
  } JET_CONVERT;
  typedef union WINAPI_JET_INDEXCREATE_u1 {
    unsigned long lcid;
    JET_UNICODEINDEX* pidxunicode;
  } WINAPI_JET_INDEXCREATE_u1;
  typedef struct JET_TUPLELIMITS {
    unsigned long chLengthMin;
    unsigned long chLengthMax;
    unsigned long chToIndexMax;
    unsigned long cchIncrement;
    unsigned long ichStart;
  } JET_TUPLELIMITS;
  typedef union WINAPI_JET_INDEXCREATE_u2 {
    unsigned long cbVarSegMac;
    JET_TUPLELIMITS* ptuplelimits;
  } WINAPI_JET_INDEXCREATE_u2;
  typedef struct JET_CONDITIONALCOLUMN {
    unsigned long cbStruct;
    TCHAR* szColumnName;
    JET_GRBIT grbit;
  } JET_CONDITIONALCOLUMN;
  typedef struct JET_INDEXCREATE {
    unsigned long cbStruct;
    TCHAR* szIndexName;
    TCHAR* szKey;
    unsigned long cbKey;
    JET_GRBIT grbit;
    unsigned long ulDensity;
    WINAPI_JET_INDEXCREATE_u1 ;
    WINAPI_JET_INDEXCREATE_u2 ;
    JET_CONDITIONALCOLUMN* rgconditionalcolumn;
    unsigned long cConditionalColumn;
    JET_ERR err;
    unsigned long cbKeyMost;
  } JET_INDEXCREATE;
  typedef struct JET_COLUMNCREATE {
    unsigned long cbStruct;
    TCHAR* szColumnName;
    JET_COLTYP coltyp;
    unsigned long cbMax;
    JET_GRBIT grbit;
    void* pvDefault;
    unsigned long cbDefault;
    unsigned long cp;
    JET_COLUMNID columnid;
    JET_ERR err;
  } JET_COLUMNCREATE;
  typedef struct JET_TABLECREATE {
    unsigned long cbStruct;
    TCHAR* szTableName;
    TCHAR* szTemplateTableName;
    unsigned long ulPages;
    unsigned long ulDensity;
    JET_COLUMNCREATE* rgcolumncreate;
    unsigned long cColumns;
    JET_INDEXCREATE* rgindexcreate;
    unsigned long cIndexes;
    JET_GRBIT grbit;
    JET_TABLEID tableid;
    unsigned long cCreated;
  } JET_TABLECREATE;
  typedef struct JET_TABLECREATE2 {
    unsigned long cbStruct;
    TCHAR* szTableName;
    TCHAR* szTemplateTableName;
    unsigned long ulPages;
    unsigned long ulDensity;
    JET_COLUMNCREATE* rgcolumncreate;
    unsigned long cColumns;
    JET_INDEXCREATE* rgindexcreate;
    unsigned long cIndexes;
    TCHAR* szCallback;
    JET_CBTYP cbtyp;
    JET_GRBIT grbit;
    JET_TABLEID tableid;
    unsigned long cCreated;
  } JET_TABLECREATE2;
  typedef struct JET_SETSYSPARAM {
    unsigned long paramid;
    JET_API_PTR lParam;
    WINAPI_TCHAR* sz;
    JET_ERR err;
  } JET_SETSYSPARAM;
  typedef struct JET_ENUMCOLUMNID {
    JET_COLUMNID columnid;
    unsigned long ctagSequence;
    unsigned long* rgtagSequence;
  } JET_ENUMCOLUMNID;
  typedef struct JET_ENUMCOLUMNVALUE {
    unsigned long itagSequence;
    JET_ERR err;
    unsigned long cbData;
    void* pvData;
  } JET_ENUMCOLUMNVALUE;
  typedef struct WINAPI_JET_ENUMCOLUMN_u_s1 {
    unsigned long cEnumColumnValue;
    JET_ENUMCOLUMNVALUE* rgEnumColumnValue;
  } WINAPI_JET_ENUMCOLUMN_u_s1;
  typedef struct WINAPI_JET_ENUMCOLUMN_u_s2 {
    unsigned long cbData;
    void* pvData;
  } WINAPI_JET_ENUMCOLUMN_u_s2;
  typedef union WINAPI_JET_ENUMCOLUMN_u {
    WINAPI_JET_ENUMCOLUMN_u_s1 ;
    WINAPI_JET_ENUMCOLUMN_u_s2 ;
  } WINAPI_JET_ENUMCOLUMN_u;
  typedef struct JET_ENUMCOLUMN {
    JET_COLUMNID columnid;
    JET_ERR err;
    WINAPI_JET_ENUMCOLUMN_u ;
  } JET_ENUMCOLUMN;
  typedef struct JET_LOGINFO {
    unsigned long cbSize;
    unsigned long ulGenLow;
    unsigned long ulGenHigh;
    TCHAR szBaseName[JET_BASE_NAME_LENGTH + 1];
  } JET_LOGINFO;
  typedef struct JET_INSTANCE_INFO {
    JET_INSTANCE hInstanceId;
    TCHAR* szInstanceName;
    JET_API_PTR cDatabases;
    TCHAR** szDatabaseFileName;
    TCHAR** szDatabaseDisplayName;
    TCHAR** szDatabaseSLVFileName;
  } JET_INSTANCE_INFO;
  typedef struct JET_RECPOS {
    unsigned long cbStruct;
    unsigned long centriesLT;
    unsigned long centriesInRange;
    unsigned long centriesTotal;
  } JET_RECPOS;
  typedef struct JET_RECSIZE {
    unsigned __int64 cbData;
    unsigned __int64 cbLongValueData;
    unsigned __int64 cbOverhead;
    unsigned __int64 cbLongValueOverhead;
    unsigned __int64 cNonTaggedColumns;
    unsigned __int64 cTaggedColumns;
    unsigned __int64 cLongValues;
    unsigned __int64 cMultiValues;
  } JET_RECSIZE;
  typedef struct JET_RSTMAP {
    TCHAR* szDatabaseName;
    TCHAR* szNewDatabaseName;
  } JET_RSTMAP;
  typedef struct JET_LGPOS {
    unsigned short ib;
    unsigned short isec;
    long lGeneration;
  } JET_LGPOS;
  typedef struct JET_LOGTIME {
    char bSeconds;
    char bMinutes;
    char bHours;
    char bDay;
    char bMonth;
    char bYear;
    char bFiller1;
    char bFiller2;
  } JET_LOGTIME;
  typedef struct JET_RSTINFO {
    unsigned long cbStruct;
    JET_RSTMAP* rgrstmap;
    long crstmap;
    JET_LGPOS lgposStop;
    JET_LOGTIME logtimeStop;
    JET_PFNSTATUS pfnStatus;
  } JET_RSTINFO;
  typedef struct JET_INDEXRANGE {
    unsigned long cbStruct;
    JET_TABLEID tableid;
    JET_GRBIT grbit;
  } JET_INDEXRANGE;
  typedef struct JET_RECORDLIST {
    unsigned long cbStruct;
    JET_TABLEID tableid;
    unsigned long cRecord;
    JET_COLUMNID columnidBookmark;
  } JET_RECORDLIST;
  typedef struct JET_OPENTEMPORARYTABLE {
    unsigned long cbStruct;
    WINAPI_JET_COLUMNDEF* prgcolumndef;
    unsigned long ccolumn;
    JET_UNICODEINDEX* pidxunicode;
    JET_GRBIT grbit;
    JET_COLUMNID* prgcolumnid;
    unsigned long cbKeyMost;
    unsigned long cbVarSegMac;
    JET_TABLEID tableid;
  } JET_OPENTEMPORARYTABLE;
  typedef struct JET_RETINFO {
    unsigned long cbStruct;
    unsigned long ibLongValue;
    unsigned long itagSequence;
    JET_COLUMNID columnidNextTagged;
  } JET_RETINFO;
  typedef struct JET_RETRIEVECOLUMN {
    JET_COLUMNID columnid;
    void* pvData;
    unsigned long cbData;
    unsigned long cbActual;
    JET_GRBIT grbit;
    unsigned long ibLongValue;
    unsigned long itagSequence;
    JET_COLUMNID columnidNextTagged;
    JET_ERR err;
  } JET_RETRIEVECOLUMN;
  typedef struct JET_SETINFO {
    unsigned long cbStruct;
    unsigned long ibLongValue;
    unsigned long itagSequence;
  } JET_SETINFO;
  typedef struct JET_SETCOLUMN {
    JET_COLUMNID columnid;
    WINAPI_void* pvData;
    unsigned long cbData;
    JET_GRBIT grbit;
    unsigned long ibLongValue;
    unsigned long itagSequence;
    JET_ERR err;
  } JET_SETCOLUMN;
  typedef long WINAPI_JetMoveRow; //Alias
  static const long JET_MoveFirst = 0x80000000;
  static const long JET_MovePrevious = -1;
  static const long JET_MoveNext = 1;
  static const long JET_MoveLast = 0x7fffffff;
  typedef JET_GRBIT WINAPI_JetMoveFlags; //Alias
  typedef JET_GRBIT WINAPI_JetMakeKeyFlags; //Alias
  typedef JET_GRBIT WINAPI_JetSeekFlags; //Alias
  typedef JET_GRBIT WINAPI_JetCommitTransactionFlags; //Alias
  typedef JET_GRBIT WINAPI_JetSetIndexRangeFlags; //Alias
  typedef JET_GRBIT WINAPI_JetGetLockFlags; //Alias
  typedef JET_GRBIT WINAPI_JetGotoSecondaryIndexBookmarkFlags; //Alias
  typedef JET_GRBIT WINAPI_JetCreateIndexFlags; //Alias
  typedef JET_GRBIT WINAPI_JetOpenTableFlags; //Alias
  typedef JET_GRBIT WINAPI_JetOpenTempTableFlags; //Alias
  typedef JET_GRBIT WINAPI_JetSetColumnFlags; //Alias
  typedef JET_GRBIT WINAPI_JetBackupFlags; //Alias
  typedef JET_GRBIT WINAPI_JetOpenDatabaseFlags; //Alias
  typedef JET_GRBIT WINAPI_JetDetachDatabase2Flags; //Alias
  typedef JET_GRBIT WINAPI_JetCreateDatabaseFlags; //Alias
  typedef JET_GRBIT WINAPI_JetBeginTransaction2Flags; //Alias
  typedef JET_GRBIT WINAPI_JetCompactFlags; //Alias
  typedef JET_GRBIT WINAPI_JetDefragmentFlags; //Alias
  typedef JET_GRBIT WINAPI_JetEndExternalBackupInstance2Flags; //Alias
  typedef JET_GRBIT WINAPI_JetEnumerateColumnsFlags; //Alias
  typedef JET_GRBIT WINAPI_JetEscrowUpdateFlags; //Alias
  typedef JET_GRBIT WINAPI_JetGetLSFlags; //Alias
  typedef JET_GRBIT WINAPI_JetIdleFlags; //Alias
  typedef JET_GRBIT WINAPI_JetInitFlags; //Alias
  typedef JET_GRBIT WINAPI_JetTerm2Flags; //Alias
  typedef JET_GRBIT WINAPI_JetRetrieveColumnFlags; //Alias
  typedef JET_GRBIT WINAPI_JetRollbackFlags; //Alias
  typedef JET_GRBIT WINAPI_JetSetCurrentIndexFlags; //Alias
  typedef JET_GRBIT WINAPI_JetUpdateFlags; //Alias
  typedef unsigned long WINAPI_JetPrepareUpdateOption; //Alias
  static const unsigned long JET_prepInsert = 0;
  static const unsigned long JET_prepReplace = 2;
  static const unsigned long JET_prepCancel = 3;
  static const unsigned long JET_prepReplaceNoLock = 4;
  static const unsigned long JET_prepInsertCopy = 5;
  static const unsigned long JET_prepInsertCopyDeleteOriginal = 7;
  JET_ERR JetAddColumn(                     JET_SESID sesid, JET_TABLEID tableid, JET_PCSTR szColumnName, WINAPI_JET_COLUMNDEF* pcolumndef, WINAPI_void* pvDefault, unsigned long cbDefault, JET_COLUMNID* pcolumnid);
  JET_ERR JetAttachDatabase(                JET_SESID sesid, JET_PCTSTR szFilename, WINAPI_JetOpenDatabaseFlags grbit);
  JET_ERR JetAttachDatabase2(               JET_SESID sesid, JET_PCTSTR szFilename, WINAPI_unsigned long cpgDatabaseSizeMax, WINAPI_JetOpenDatabaseFlags grbit);
  JET_ERR JetBackup(                        JET_PCSTR szBackupPath, WINAPI_JetBackupFlags grbit, JET_PFNSTATUS pfnStatus);
  JET_ERR JetBackupInstance(                JET_INSTANCE instance, JET_PCSTR szBackupPath, WINAPI_JetBackupFlags grbit, JET_PFNSTATUS pfnStatus);
  JET_ERR JetBeginExternalBackup(           WINAPI_JetBackupFlags grbit);
  JET_ERR JetBeginExternalBackupInstance(   JET_INSTANCE instance, WINAPI_JetBackupFlags grbit);
  JET_ERR JetBeginSession(                  JET_INSTANCE instance, JET_SESID* psesid, JET_PCSTR szUserName, JET_PCSTR szPassword);
  JET_ERR JetBeginTransaction(              JET_SESID sesid);
  JET_ERR JetBeginTransaction2(             JET_SESID sesid, WINAPI_JetBeginTransaction2Flags grbit);
  JET_ERR JetCloseDatabase(                 JET_SESID sesid, JET_DBID dbid, JET_GRBIT grbit);
  JET_ERR JetCloseFile(                     JET_HANDLE hfFile);
  JET_ERR JetCloseFileInstance(             JET_INSTANCE instance, JET_HANDLE hfFile);
  JET_ERR JetCloseTable(                    JET_SESID sesid, JET_TABLEID tableid);
  JET_ERR JetCommitTransaction(             JET_SESID sesid, WINAPI_JetCommitTransactionFlags grbit);
  JET_ERR JetCompact(                       JET_SESID sesid, JET_PCSTR szDatabaseSrc, JET_PCSTR szDatabaseDest, JET_PFNSTATUS pfnStatus, JET_CONVERT* pconvert, WINAPI_JetCompactFlags grbit);
  JET_ERR JetComputeStats(                  JET_SESID sesid, JET_TABLEID tableid);
  JET_ERR JetCreateDatabase(                JET_SESID sesid, JET_PCSTR szFilename, JET_PCSTR szConnect, JET_DBID* pdbid, WINAPI_JetCreateDatabaseFlags grbit);
  JET_ERR JetCreateDatabase2(               JET_SESID sesid, JET_PCTSTR szFilename, WINAPI_unsigned long cpgDatabaseSizeMax, JET_DBID* pdbid, WINAPI_JetCreateDatabaseFlags grbit);
  JET_ERR JetCreateIndex(                   JET_SESID sesid, JET_TABLEID tableid, JET_PCSTR szIndexName, WINAPI_JetCreateIndexFlags grbit, JET_PCTSTR szKey, unsigned long cbKey, unsigned long lDensity);
  JET_ERR JetCreateIndex2(                  JET_SESID sesid, JET_TABLEID tableid, JET_INDEXCREATE* pindexcreate, unsigned long cIndexCreate);
  JET_ERR JetCreateInstance(                JET_INSTANCE* pinstance, JET_PCTSTR szInstanceName);
  JET_ERR JetCreateInstance2(               JET_INSTANCE* pinstance, JET_PCTSTR szInstanceName, JET_PCTSTR szDisplayName, JET_GRBIT grbit);
  JET_ERR JetCreateTable(                   JET_SESID sesid, JET_DBID dbid, JET_PCTSTR szTableName, unsigned long lPages, unsigned long lDensity, JET_TABLEID* ptableid);
  JET_ERR JetCreateTableColumnIndex(        JET_SESID sesid, JET_DBID dbid, JET_TABLECREATE* ptablecreate);
  JET_ERR JetCreateTableColumnIndex2(       JET_SESID sesid, JET_DBID dbid, JET_TABLECREATE2* ptablecreate);
  JET_ERR JetDefragment(                    JET_SESID sesid, JET_DBID dbid, JET_PCSTR szTableName, unsigned long* pcPasses, unsigned long* pcSeconds, WINAPI_JetDefragmentFlags grbit);
  JET_ERR JetDefragment2(                   JET_SESID sesid, JET_DBID dbid, JET_PCSTR szTableName, unsigned long* pcPasses, unsigned long* pcSeconds, JET_CALLBACK callback, WINAPI_JetDefragmentFlags grbit);
  JET_ERR JetDelete(                        JET_SESID sesid, JET_TABLEID tableid);
  JET_ERR JetDeleteColumn(                  JET_SESID sesid, JET_TABLEID tableid, JET_PCTSTR szColumnName);
  JET_ERR JetDeleteColumn2(                 JET_SESID sesid, JET_TABLEID tableid, JET_PCTSTR szColumnName, WINAPI_JET_GRBIT grbit);
  JET_ERR JetDeleteIndex(                   JET_SESID sesid, JET_TABLEID tableid, JET_PCSTR szIndexName);
  JET_ERR JetDeleteTable(                   JET_SESID sesid, JET_DBID dbid, JET_PCTSTR szTableName);
  JET_ERR JetDetachDatabase(                JET_SESID sesid, JET_PCTSTR szFilename);
  JET_ERR JetDetachDatabase2(               JET_SESID sesid, JET_PCTSTR szFilename, WINAPI_JetDetachDatabase2Flags grbit);
  JET_ERR JetDupCursor(                     JET_SESID sesid, JET_TABLEID tableid, JET_TABLEID* ptableid, JET_GRBIT grbit);
  JET_ERR JetDupSession(                    JET_SESID sesid, JET_SESID* psesid);
  JET_ERR JetEnableMultiInstance(           JET_SETSYSPARAM* psetsysparam, unsigned long csetsysparam, unsigned long* pcsetsucceed);
  JET_ERR JetEndExternalBackup(             );
  JET_ERR JetEndExternalBackupInstance(     JET_INSTANCE instance);
  JET_ERR JetEndExternalBackupInstance2(    JET_INSTANCE instance, WINAPI_JetEndExternalBackupInstance2Flags grbit);
  JET_ERR JetEndSession(                    JET_SESID sesid, JET_GRBIT grbit);
  JET_ERR JetEnumerateColumns(              JET_SESID sesid, JET_TABLEID tableid, unsigned long cEnumColumnId, JET_ENUMCOLUMNID* rgEnumColumnId, unsigned long* pcEnumColumn, JET_ENUMCOLUMN** prgEnumColumn, JET_PFNREALLOC pfnRealloc, void* pvReallocContext, unsigned long cbDataMost, WINAPI_JetEnumerateColumnsFlags grbit);
  JET_ERR JetEscrowUpdate(                  JET_SESID sesid, JET_TABLEID tableid, JET_COLUMNID columnid, void* pv, unsigned long cbMax, void* pvOld, unsigned long cbOldMax, unsigned long* pcbOldActual, WINAPI_JetEscrowUpdateFlags grbit);
  JET_ERR JetExternalRestore(               JET_PSTR szCheckpointFilePath, JET_PSTR szLogPath, JET_RSTMAP* rgrstmap, long crstfilemap, JET_PSTR szBackupLogPath, long genLow, long genHigh, JET_PFNSTATUS pfn);
  JET_ERR JetExternalRestore2(              JET_PSTR szCheckpointFilePath, JET_PSTR szLogPath, JET_RSTMAP* rgrstmap, long crstfilemap, JET_PSTR szBackupLogPath, JET_LOGINFO* pLogInfo, JET_PSTR szTargetInstanceName, JET_PSTR szTargetInstanceLogPath, JET_PSTR szTargetInstanceCheckpointPath, JET_PFNSTATUS pfn);
  JET_ERR JetFreeBuffer(                    char* pbBuf);
  JET_ERR JetGetAttachInfo(                 tchar* szz, unsigned long cbMax, unsigned long* pcbActual);
  JET_ERR JetGetAttachInfoInstance(         JET_INSTANCE instance, tchar* szz, unsigned long cbMax, unsigned long* pcbActual);
  JET_ERR JetGetBookmark(                   JET_SESID sesid, JET_TABLEID tableid, void* pvBookmark, unsigned long cbMax, unsigned long* pcbActual);
  JET_ERR JetGetColumnInfo(                 JET_SESID sesid, JET_DBID dbid, JET_PCTSTR szTableName, JET_PCTSTR szColumnName, void* pvResult, unsigned long cbMax, unsigned long InfoLevel);
  JET_ERR JetGetCurrentIndex(               JET_SESID sesid, JET_TABLEID tableid, JET_PSTR szIndexName, unsigned long cchIndexName);
  JET_ERR JetGetCursorInfo(                 JET_SESID sesid, JET_TABLEID tableid, void* pvResult, unsigned long cbMax, unsigned long InfoLevel);
  JET_ERR JetGetDatabaseFileInfo(           JET_PCTSTR szDatabaseName, void* pvResult, unsigned long cbMax, unsigned long InfoLevel);
  JET_ERR JetGetDatabaseInfo(               JET_SESID sesid, JET_DBID dbid, void* pvResult, unsigned long cbMax, unsigned long InfoLevel);
  JET_ERR JetGetIndexInfo(                  JET_SESID sesid, JET_DBID dbid, JET_PCTSTR szTableName, JET_PCTSTR szIndexName, void* pvResult, unsigned long cbResult, unsigned long InfoLevel);
  JET_ERR JetGetInstanceInfo(               unsigned long* pcInstanceInfo, JET_INSTANCE_INFO** paInstanceInfo);
  JET_ERR JetGetInstanceMiscInfo(           JET_INSTANCE instance, void* pvResult, unsigned long cbMax, unsigned long InfoLevel);
  JET_ERR JetGetLock(                       JET_SESID sesid, JET_TABLEID tableid, WINAPI_JetGetLockFlags grbit);
  JET_ERR JetGetLogInfo(                    tchar* szz, unsigned long cbMax, unsigned long* pcbActual);
  JET_ERR JetGetLogInfoInstance(            JET_INSTANCE instance, tchar* szz, unsigned long cbMax, unsigned long* pcbActual);
  JET_ERR JetGetLogInfoInstance2(           JET_INSTANCE instance, tchar* szz, unsigned long cbMax, unsigned long* pcbActual, JET_LOGINFO* pLogInfo);
  JET_ERR JetGetLS(                         JET_SESID sesid, JET_TABLEID tableid, JET_LS* pls, WINAPI_JetGetLSFlags grbit);
  JET_ERR JetGetObjectInfo(                 JET_SESID sesid, JET_DBID dbid, JET_OBJTYP objtyp, JET_PCTSTR szContainerName, JET_PCTSTR szObjectName, void* pvResult, unsigned long cbMax, unsigned long InfoLevel);
  JET_ERR JetGetRecordPosition(             JET_SESID sesid, JET_TABLEID tableid, JET_RECPOS* precpos, unsigned long cbRecpos);
  JET_ERR JetGetRecordSize(                 JET_SESID sesid, JET_TABLEID tableid, JET_RECSIZE* precsize, WINAPI_JET_GRBIT grbit);
  JET_ERR JetGetSecondaryIndexBookmark(     JET_SESID sesid, JET_TABLEID tableid, void* pvSecondaryKey, unsigned long cbSecondaryKeyMax, unsigned long* pcbSecondaryKeyActual, void* pvPrimaryBookmark, unsigned long cbPrimaryBookmarkMax, unsigned long* pcbPrimaryKeyActual, WINAPI_JET_GRBIT grbit);
  JET_ERR JetGetSystemParameter(            JET_INSTANCE instance, JET_SESID sesid, unsigned long paramid, JET_API_PTR* plParam, JET_PSTR szParam, unsigned long cbMax);
  JET_ERR JetGetTableColumnInfo(            JET_SESID sesid, JET_TABLEID tableid, JET_PCTSTR szColumnName, void* pvResult, unsigned long cbMax, unsigned long InfoLevel);
  JET_ERR JetGetTableIndexInfo(             JET_SESID sesid, JET_TABLEID tableid, JET_PCTSTR szIndexName, void* pvResult, unsigned long cbResult, unsigned long InfoLevel);
  JET_ERR JetGetTableInfo(                  JET_SESID sesid, JET_TABLEID tableid, void* pvResult, unsigned long cbMax, unsigned long InfoLevel);
  JET_ERR JetGetThreadStats(                void* pvResult, unsigned long cbMax);
  JET_ERR JetGetTruncateLogInfoInstance(    JET_INSTANCE instance, tchar* szz, unsigned long cbMax, unsigned long* pcbActual);
  JET_ERR JetGetVersion(                    JET_SESID sesid, unsigned long* pwVersion);
  JET_ERR JetGotoBookmark(                  JET_SESID sesid, JET_TABLEID tableid, void* pvBookmark, unsigned long cbBookmark);
  JET_ERR JetGotoPosition(                  JET_SESID sesid, JET_TABLEID tableid, JET_RECPOS* precpos);
  JET_ERR JetGotoSecondaryIndexBookmark(    JET_SESID sesid, JET_TABLEID tableid, void* pvSecondaryKey, unsigned long cbSecondaryKey, void* pvPrimaryBookmark, unsigned long cbPrimaryBookmark, WINAPI_JetGotoSecondaryIndexBookmarkFlags grbit);
  JET_ERR JetGrowDatabase(                  JET_SESID sesid, JET_DBID dbid, unsigned long cpg, unsigned long* pcpgReal);
  JET_ERR JetIdle(                          JET_SESID sesid, WINAPI_JetIdleFlags grbit);
  JET_ERR JetIndexRecordCount(              JET_SESID sesid, JET_TABLEID tableid, unsigned long* pcrec, unsigned long crecMax);
  JET_ERR JetInit(                          JET_INSTANCE* pinstance);
  JET_ERR JetInit2(                         JET_INSTANCE* pinstance, WINAPI_JetInitFlags grbit);
  JET_ERR JetInit3(                         JET_INSTANCE* pinstance, JET_RSTINFO* prstInfo, WINAPI_JetInitFlags grbit);
  JET_ERR JetIntersectIndexes(              JET_SESID sesid, JET_INDEXRANGE* rgindexrange, unsigned long cindexrange, JET_RECORDLIST* precordlist, JET_GRBIT grbit);
  JET_ERR JetMakeKey(                       JET_SESID sesid, JET_TABLEID tableid, WINAPI_void* pvData, unsigned long cbData, WINAPI_JetMakeKeyFlags grbit);
  JET_ERR JetMove(                          JET_SESID sesid, JET_TABLEID tableid, WINAPI_JetMoveRow cRow, WINAPI_JetMoveFlags grbit);
  JET_ERR JetOpenDatabase(                  JET_SESID sesid, JET_PCTSTR szFilename, JET_PCTSTR szConnect, JET_DBID* pdbid, WINAPI_JetOpenDatabaseFlags grbit);
  JET_ERR JetOpenFile(                      JET_PCTSTR szFileName, JET_HANDLE* phfFile, unsigned long* pulFileSizeLow, unsigned long* pulFileSizeHigh);
  JET_ERR JetOpenFileInstance(              JET_INSTANCE instance, JET_PCSTR szFileName, JET_HANDLE* phfFile, unsigned long* pulFileSizeLow, unsigned long* pulFileSizeHigh);
  JET_ERR JetOpenTable(                     JET_SESID sesid, JET_DBID dbid, JET_PCTSTR szTableName, WINAPI_void* pvParameters, unsigned long cbParameters, WINAPI_JetOpenTableFlags grbit, JET_TABLEID* ptableid);
  JET_ERR JetOpenTemporaryTable(            JET_SESID sesid, JET_OPENTEMPORARYTABLE* popentemporarytable);
  JET_ERR JetOpenTempTable(                 JET_SESID sesid, WINAPI_JET_COLUMNDEF* prgcolumndef, unsigned long ccolumn, WINAPI_JetOpenTempTableFlags grbit, JET_TABLEID* ptableid, JET_COLUMNID* prgcolumnid);
  JET_ERR JetOpenTempTable2(                JET_SESID sesid, WINAPI_JET_COLUMNDEF* prgcolumndef, unsigned long ccolumn, unsigned long lcid, WINAPI_JetOpenTempTableFlags grbit, JET_TABLEID* ptableid, JET_COLUMNID* prgcolumnid);
  JET_ERR JetOpenTempTable3(                JET_SESID sesid, WINAPI_JET_COLUMNDEF* prgcolumndef, unsigned long ccolumn, JET_UNICODEINDEX* pidxunicode, WINAPI_JetOpenTempTableFlags grbit, JET_TABLEID* ptableid, JET_COLUMNID* prgcolumnid);
  JET_ERR JetOSSnapshotAbort(               WINAPI_JET_OSSNAPID snapId, WINAPI_JET_GRBIT grbit);
  JET_ERR JetOSSnapshotEnd(                 WINAPI_JET_OSSNAPID snapId, WINAPI_JET_GRBIT grbit);
  JET_ERR JetOSSnapshotFreeze(              WINAPI_JET_OSSNAPID snapId, unsigned long* pcInstanceInfo, JET_INSTANCE_INFO** paInstanceInfo, WINAPI_JET_GRBIT grbit);
  JET_ERR JetOSSnapshotGetFreezeInfo(       WINAPI_JET_OSSNAPID snapId, unsigned long* pcInstanceInfo, JET_INSTANCE_INFO** paInstanceInfo, WINAPI_JET_GRBIT grbit);
  JET_ERR JetOSSnapshotPrepare(             JET_OSSNAPID* psnapId, WINAPI_JET_GRBIT grbit);
  JET_ERR JetOSSnapshotPrepareInstance(     JET_OSSNAPID snapId, JET_INSTANCE instance, WINAPI_JET_GRBIT grbit);
  JET_ERR JetOSSnapshotThaw(                WINAPI_JET_OSSNAPID snapId, WINAPI_JET_GRBIT grbit);
  JET_ERR JetOSSnapshotTruncateLog(         WINAPI_JET_OSSNAPID snapId, WINAPI_JET_GRBIT grbit);
  JET_ERR JetOSSnapshotTruncateLogInstance( WINAPI_JET_OSSNAPID snapId, JET_INSTANCE instance, WINAPI_JET_GRBIT grbit);
  JET_ERR JetPrepareUpdate(                 JET_SESID sesid, JET_TABLEID tableid, WINAPI_JetPrepareUpdateOption prep);
  JET_ERR JetReadFile(                      JET_HANDLE hfFile, void* pv, unsigned long cb, unsigned long* pcbActual);
  JET_ERR JetReadFileInstance(              JET_INSTANCE instance, JET_HANDLE hfFile, void* pv, unsigned long cb, unsigned long* pcb);
  JET_ERR JetRegisterCallback(              JET_SESID sesid, JET_TABLEID tableid, JET_CBTYP cbtyp, JET_CALLBACK pCallback, void* pvContext, JET_HANDLE* phCallbackId);
  JET_ERR JetRenameColumn(                  JET_SESID sesid, JET_TABLEID tableid, JET_PCSTR szName, JET_PCSTR szNameNew, JET_GRBIT grbit);
  JET_ERR JetRenameTable(                   JET_SESID sesid, JET_DBID dbid, JET_PCTSTR szName, JET_PCTSTR szNameNew);
  JET_ERR JetResetSessionContext(           JET_SESID sesid);
  JET_ERR JetResetTableSequential(          JET_SESID sesid, JET_TABLEID tableid, JET_GRBIT grbit);
  JET_ERR JetRestore(                       JET_PCSTR sz, JET_PFNSTATUS pfn);
  JET_ERR JetRestore2(                      JET_PCSTR sz, JET_PCSTR szDest, JET_PFNSTATUS pfn);
  JET_ERR JetRestoreInstance(               JET_INSTANCE instance, JET_PCSTR sz, JET_PCSTR szDest, JET_PFNSTATUS pfn);
  JET_ERR JetRetrieveColumn(                JET_SESID sesid, JET_TABLEID tableid, JET_COLUMNID columnid, void* pvData, unsigned long cbData, unsigned long* pcbActual, WINAPI_JetRetrieveColumnFlags grbit, JET_RETINFO* pretinfo);
  JET_ERR JetRetrieveColumns(               JET_SESID sesid, JET_TABLEID tableid, JET_RETRIEVECOLUMN* pretrievecolumn, unsigned long cretrievecolumn);
  JET_ERR JetRetrieveKey(                   JET_SESID sesid, JET_TABLEID tableid, void* pvData, unsigned long cbMax, unsigned long* pcbActual, JET_GRBIT grbit);
  JET_ERR JetRollback(                      JET_SESID sesid, WINAPI_JetRollbackFlags grbit);
  JET_ERR JetSeek(                          JET_SESID sesid, JET_TABLEID tableid, WINAPI_JetSeekFlags grbit);
  JET_ERR JetSetColumn(                     JET_SESID sesid, JET_TABLEID tableid, JET_COLUMNID columnid, WINAPI_void* pvData, unsigned long cbData, WINAPI_JetSetColumnFlags grbit, JET_SETINFO* psetinfo);
  JET_ERR JetSetColumnDefaultValue(         JET_SESID sesid, JET_DBID dbid, JET_PCSTR szTableName, JET_PCSTR szColumnName, WINAPI_void* pvData, WINAPI_unsigned long cbData, WINAPI_JET_GRBIT grbit);
  JET_ERR JetSetColumns(                    JET_SESID sesid, JET_TABLEID tableid, JET_SETCOLUMN* psetcolumn, unsigned long csetcolumn);
  JET_ERR JetSetCurrentIndex(               JET_SESID sesid, JET_TABLEID tableid, JET_PCTSTR szIndexName);
  JET_ERR JetSetCurrentIndex2(              JET_SESID sesid, JET_TABLEID tableid, JET_PCSTR szIndexName, WINAPI_JetSetCurrentIndexFlags grbit);
  JET_ERR JetSetCurrentIndex3(              JET_SESID sesid, JET_TABLEID tableid, JET_PCSTR szIndexName, WINAPI_JetSetCurrentIndexFlags grbit, unsigned long itagSequence);
  JET_ERR JetSetCurrentIndex4(              JET_SESID sesid, JET_TABLEID tableid, JET_PCSTR szIndexName, JET_INDEXID* pindexid, WINAPI_JetSetCurrentIndexFlags grbit, unsigned long itagSequence);
  JET_ERR JetSetDatabaseSize(               JET_SESID sesid, JET_PCSTR szDatabaseName, unsigned long cpg, unsigned long* pcpgReal);
  JET_ERR JetSetIndexRange(                 JET_SESID sesid, JET_TABLEID tableidSrc, WINAPI_JetSetIndexRangeFlags grbit);
  JET_ERR JetSetLS(                         JET_SESID sesid, JET_TABLEID tableid, JET_LS ls, JET_GRBIT grbit);
  JET_ERR JetSetSessionContext(             JET_SESID sesid, JET_API_PTR ulContext);
  JET_ERR JetSetSystemParameter(            JET_INSTANCE* pinstance, JET_SESID sesid, unsigned long paramid, JET_API_PTR lParam, JET_PCSTR szParam);
  JET_ERR JetSetTableSequential(            JET_SESID sesid, JET_TABLEID tableid, JET_GRBIT grbit);
  JET_ERR JetStopBackup(                    );
  JET_ERR JetStopBackupInstance(            JET_INSTANCE instance);
  JET_ERR JetStopService(                   );
  JET_ERR JetStopServiceInstance(           JET_INSTANCE instance);
  JET_ERR JetTerm(                          JET_INSTANCE instance);
  JET_ERR JetTerm2(                         JET_INSTANCE instance, WINAPI_JetTerm2Flags grbit);
  JET_ERR JetTruncateLog(                   );
  JET_ERR JetTruncateLogInstance(           JET_INSTANCE instance);
  JET_ERR JetUnregisterCallback(            JET_SESID sesid, JET_TABLEID tableid, JET_CBTYP cbtyp, JET_HANDLE hCallbackId);
  JET_ERR JetUpdate(                        JET_SESID sesid, JET_TABLEID tableid, void* pvBookmark, unsigned long cbBookmark, unsigned long* pcbActual);
  JET_ERR JetUpdate2(                       JET_SESID sesid, JET_TABLEID tableid, void* pvBookmark, unsigned long cbBookmark, unsigned long* pcbActual, WINAPI_JetUpdateFlags grbit);
]]
return ffi.load( 'esent.dll' )

require( 'ffi/winapi/headers/odbc' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef short SQLSMALLINT; //Alias
  typedef unsigned short SQLUSMALLINT; //Alias
  typedef void* SQLPOINTER; //Alias
  typedef long SQLINTEGER; //Alias
  typedef INT_PTR SQLLEN; //Alias
  typedef UINT_PTR SQLULEN; //Alias
  typedef UINT_PTR SQLSETPOSIROW; //Alias
  typedef HWND SQLHWND; //Alias
  typedef void* SQLHANDLE; //Alias
  typedef SQLHANDLE SQLHENV; //Alias
  typedef SQLHANDLE SQLHDBC; //Alias
  typedef SQLHANDLE SQLHSTMT; //Alias
  typedef SQLHANDLE SQLHDESC; //Alias
  typedef unsigned char SQLCHAR; //Alias
  typedef TCHAR SQLTCHAR; //Alias
  typedef LPTSTR SQLTCHAR; //Pointer
  typedef SQLSMALLINT SQLRETURN; //Alias
  static const SQLRETURN SQL_SUCCESS = 0;
  static const SQLRETURN SQL_SUCCESS_WITH_INFO = 1;
  static const SQLRETURN SQL_NO_DATA = 100;
  static const SQLRETURN SQL_PARAM_DATA_AVAILABLE = 101;
  static const SQLRETURN SQL_ERROR = -1;
  static const SQLRETURN SQL_INVALID_HANDLE = -2;
  static const SQLRETURN SQL_STILL_EXECUTING = 2;
  static const SQLRETURN SQL_NEED_DATA = 99;
  typedef SQLUSMALLINT WINAPI_SQL_DRIVER_COMPLETION; //Alias
  static const WINAPI_SQL_DRIVER_COMPLETION SQL_DRIVER_NOPROMPT = 0;
  static const WINAPI_SQL_DRIVER_COMPLETION SQL_DRIVER_COMPLETE = 1;
  static const WINAPI_SQL_DRIVER_COMPLETION SQL_DRIVER_PROMPT = 2;
  static const WINAPI_SQL_DRIVER_COMPLETION SQL_DRIVER_COMPLETE_REQUIRED = 3;
  typedef SQLSMALLINT WINAPI_SQL_ENDTRAN_OPTION; //Alias
  static const WINAPI_SQL_ENDTRAN_OPTION SQL_COMMIT = 0;
  static const WINAPI_SQL_ENDTRAN_OPTION SQL_ROLLBACK = 1;
  typedef SQLSMALLINT WINAPI_SQL_FETCH_TYPE; //Alias
  static const WINAPI_SQL_FETCH_TYPE SQL_FETCH_NEXT = 1;
  static const WINAPI_SQL_FETCH_TYPE SQL_FETCH_FIRST = 2;
  static const WINAPI_SQL_FETCH_TYPE SQL_FETCH_LAST = 3;
  static const WINAPI_SQL_FETCH_TYPE SQL_FETCH_PRIOR = 4;
  static const WINAPI_SQL_FETCH_TYPE SQL_FETCH_ABSOLUTE = 5;
  static const WINAPI_SQL_FETCH_TYPE SQL_FETCH_RELATIVE = 6;
  typedef SQLSMALLINT WINAPI_SQL_HANDLE_TYPE; //Alias
  static const WINAPI_SQL_HANDLE_TYPE SQL_HANDLE_ENV = 1;
  static const WINAPI_SQL_HANDLE_TYPE SQL_HANDLE_DBC = 2;
  static const WINAPI_SQL_HANDLE_TYPE SQL_HANDLE_STMT = 3;
  static const WINAPI_SQL_HANDLE_TYPE SQL_HANDLE_DESC = 4;
  typedef SQLUSMALLINT WINAPI_SQL_FREESTMT_OPTION; //Alias
  static const WINAPI_SQL_FREESTMT_OPTION SQL_CLOSE = 0;
  static const WINAPI_SQL_FREESTMT_OPTION SQL_DROP = 1;
  static const WINAPI_SQL_FREESTMT_OPTION SQL_UNBIND = 2;
  static const WINAPI_SQL_FREESTMT_OPTION SQL_RESET_PARAMS = 3;
  SQLRETURN SQLAllocConnect(     SQLHENV EnvironmentHandle, SQLHDBC* ConnectionHandle);
  SQLRETURN SQLAllocEnv(         SQLHENV* EnvironmentHandle);
  SQLRETURN SQLAllocHandle(      WINAPI_SQL_HANDLE_TYPE HandleType, SQLHANDLE InputHandle, SQLHANDLE* OutputHandlePtr);
  SQLRETURN SQLAllocStmt(        SQLHDBC ConnectionHandle, SQLHSTMT* StatementHandle);
  SQLRETURN SQLBindCol(          SQLHSTMT StatementHandle, SQLUSMALLINT ColumnNumber, SQLSMALLINT TargetType, SQLPOINTER TargetValuePtr, SQLLEN BufferLength, SQLLEN* StrLen_or_Ind);
  SQLRETURN SQLBindParam(        SQLHSTMT StatementHandle, SQLUSMALLINT ParameterNumber, SQLSMALLINT ValueType, SQLSMALLINT ParameterType, SQLULEN LengthPrecision, SQLSMALLINT ParameterScale, SQLPOINTER ParameterValue, SQLLEN* StrLen_or_IndPtr);
  SQLRETURN SQLBindParameter(    SQLHSTMT StatementHandle, SQLUSMALLINT ParameterNumber, SQLSMALLINT InputOutputType, SQLSMALLINT ValueType, SQLSMALLINT ParameterType, SQLULEN ColumnSize, SQLSMALLINT DecimalDigits, SQLPOINTER ParameterValuePtr, SQLLEN BufferLength, SQLLEN* StrLen_or_IndPtr);
  SQLRETURN SQLBrowseConnect(    SQLHDBC ConnectionHandle, SQLCHAR* InConnectionString, SQLSMALLINT StringLength1, SQLCHAR* OutConnectionString, SQLSMALLINT BufferLength, SQLSMALLINT* StringLength2Ptr);
  SQLRETURN SQLBrowseConnect(    SQLHDBC ConnectionHandle, SQLTCHAR* InConnectionString, SQLSMALLINT StringLength1, SQLTCHAR* OutConnectionString, SQLSMALLINT BufferLength, SQLSMALLINT* StringLength2Ptr);
  SQLRETURN SQLBulkOperations(   SQLHSTMT StatementHandle, SQLUSMALLINT Operation);
  SQLRETURN SQLCancel(           SQLHSTMT StatementHandle);
  SQLRETURN SQLCancelHandle(     WINAPI_SQL_HANDLE_TYPE HandleType, SQLHANDLE Handle);
  SQLRETURN SQLCloseCursor(      SQLHSTMT StatementHandle);
  SQLRETURN SQLColAttribute(     SQLHSTMT StatementHandle, SQLUSMALLINT ColumnNumber, SQLUSMALLINT FieldIdentifier, SQLPOINTER CharacterAttributePtr, SQLSMALLINT BufferLength, SQLSMALLINT* StringLengthPtr, SQLLEN* NumericAttributePtr);
  SQLRETURN SQLColAttribute(     SQLHSTMT StatementHandle, SQLUSMALLINT ColumnNumber, SQLUSMALLINT FieldIdentifier, SQLPOINTER CharacterAttributePtr, SQLSMALLINT BufferLength, SQLSMALLINT* StringLengthPtr, SQLLEN* NumericAttributePtr);
  SQLRETURN SQLColAttributes(    SQLHSTMT hstmt, SQLUSMALLINT icol, SQLUSMALLINT fDescType, SQLPOINTER rgbDesc, SQLSMALLINT cbDescMax, SQLSMALLINT* pcbDesc, SQLLEN* pfDesc);
  SQLRETURN SQLColAttributes(    SQLHSTMT hstmt, SQLUSMALLINT icol, SQLUSMALLINT fDescType, SQLPOINTER rgbDesc, SQLSMALLINT cbDescMax, SQLSMALLINT* pcbDesc, SQLLEN* pfDesc);
  SQLRETURN SQLColumnPrivileges( SQLHSTMT StatementHandle, SQLCHAR* CatalogName, SQLSMALLINT NameLength1, SQLCHAR* SchemaName, SQLSMALLINT NameLength2, SQLCHAR* TableName, SQLSMALLINT NameLength3, SQLCHAR* ColumnName, SQLSMALLINT NameLength4);
  SQLRETURN SQLColumnPrivileges( SQLHSTMT StatementHandle, SQLTCHAR* CatalogName, SQLSMALLINT NameLength1, SQLTCHAR* SchemaName, SQLSMALLINT NameLength2, SQLTCHAR* TableName, SQLSMALLINT NameLength3, SQLTCHAR* ColumnName, SQLSMALLINT NameLength4);
  SQLRETURN SQLColumns(          SQLHSTMT StatementHandle, SQLCHAR* CatalogName, SQLSMALLINT NameLength1, SQLCHAR* SchemaName, SQLSMALLINT NameLength2, SQLCHAR* TableName, SQLSMALLINT NameLength3, SQLCHAR* ColumnName, SQLSMALLINT NameLength4);
  SQLRETURN SQLColumns(          SQLHSTMT StatementHandle, SQLTCHAR* CatalogName, SQLSMALLINT NameLength1, SQLTCHAR* SchemaName, SQLSMALLINT NameLength2, SQLTCHAR* TableName, SQLSMALLINT NameLength3, SQLTCHAR* ColumnName, SQLSMALLINT NameLength4);
  SQLRETURN SQLCompleteAsync(    SQLSMALLINT HandleType, SQLHANDLE Handle, RETCODE* AsyncRetCodePtr);
  SQLRETURN SQLConnect(          SQLHDBC ConnectionHandle, SQLCHAR* ServerName, SQLSMALLINT NameLength1, SQLCHAR* UserName, SQLSMALLINT NameLength2, SQLCHAR* Authentication, SQLSMALLINT NameLength3);
  SQLRETURN SQLConnect(          SQLHDBC ConnectionHandle, SQLTCHAR* ServerName, SQLSMALLINT NameLength1, SQLTCHAR* UserName, SQLSMALLINT NameLength2, SQLTCHAR* Authentication, SQLSMALLINT NameLength3);
  SQLRETURN SQLCopyDesc(         SQLHDESC SourceDescHandle, SQLHDESC TargetDescHandle);
  SQLRETURN SQLDataSources(      SQLHENV EnvironmentHandle, SQLUSMALLINT Direction, SQLCHAR* ServerName, SQLSMALLINT BufferLength1, SQLSMALLINT* NameLength1Ptr, SQLCHAR* Description, SQLSMALLINT BufferLength2, SQLSMALLINT* NameLength2Ptr);
  SQLRETURN SQLDataSources(      SQLHENV EnvironmentHandle, SQLUSMALLINT Direction, SQLTCHAR* ServerName, SQLSMALLINT BufferLength1, SQLSMALLINT* NameLength1Ptr, SQLTCHAR* Description, SQLSMALLINT BufferLength2, SQLSMALLINT* NameLength2Ptr);
  SQLRETURN SQLDescribeCol(      SQLHSTMT StatementHandle, SQLUSMALLINT ColumnNumber, SQLCHAR* ColumnName, SQLSMALLINT BufferLength, SQLSMALLINT* NameLengthPtr, SQLSMALLINT* DataTypePtr, SQLULEN* ColumnSizePtr, SQLSMALLINT* DecimalDigitsPtr, SQLSMALLINT* NullablePtr);
  SQLRETURN SQLDescribeCol(      SQLHSTMT StatementHandle, SQLUSMALLINT ColumnNumber, SQLTCHAR* ColumnName, SQLSMALLINT BufferLength, SQLSMALLINT* NameLengthPtr, SQLSMALLINT* DataTypePtr, SQLULEN* ColumnSizePtr, SQLSMALLINT* DecimalDigitsPtr, SQLSMALLINT* NullablePtr);
  SQLRETURN SQLDescribeParam(    SQLHSTMT StatementHandle, SQLUSMALLINT ParameterNumber, SQLSMALLINT* DataTypePtr, SQLULEN* ParameterSizePtr, SQLSMALLINT* DecimalDigitsPtr, SQLSMALLINT* NullablePtr);
  SQLRETURN SQLDisconnect(       SQLHDBC ConnectionHandle);
  SQLRETURN SQLDriverConnect(    SQLHDBC ConnectionHandle, SQLHWND WindowHandle, SQLCHAR* InConnectionString, SQLSMALLINT StringLength1, SQLCHAR* OutConnectionString, SQLSMALLINT BufferLength, SQLSMALLINT* StringLength2Ptr, WINAPI_SQL_DRIVER_COMPLETION DriverCompletion);
  SQLRETURN SQLDriverConnect(    SQLHDBC ConnectionHandle, SQLHWND WindowHandle, SQLTCHAR* InConnectionString, SQLSMALLINT StringLength1, SQLTCHAR* OutConnectionString, SQLSMALLINT BufferLength, SQLSMALLINT* StringLength2Ptr, WINAPI_SQL_DRIVER_COMPLETION DriverCompletion);
  SQLRETURN SQLDrivers(          SQLHENV EnvironmentHandle, SQLUSMALLINT Direction, SQLCHAR* DriverDescription, SQLSMALLINT BufferLength1, SQLSMALLINT* DescriptionLengthPtr, SQLCHAR* DriverAttributes, SQLSMALLINT BufferLength2, SQLSMALLINT* AttributesLengthPtr);
  SQLRETURN SQLDrivers(          SQLHENV EnvironmentHandle, SQLUSMALLINT Direction, SQLTCHAR* DriverDescription, SQLSMALLINT BufferLength1, SQLSMALLINT* DescriptionLengthPtr, SQLTCHAR* DriverAttributes, SQLSMALLINT BufferLength2, SQLSMALLINT* AttributesLengthPtr);
  SQLRETURN SQLEndTran(          WINAPI_SQL_HANDLE_TYPE HandleType, SQLHANDLE Handle, WINAPI_SQL_ENDTRAN_OPTION CompletionType);
  SQLRETURN SQLError(            SQLHENV EnvironmentHandle, SQLHDBC ConnectionHandle, SQLHSTMT StatementHandle, SQLCHAR* SQLState, SQLINTEGER* NativeError, SQLCHAR* MessageText, SQLSMALLINT BufferLength, SQLSMALLINT* TextLength);
  SQLRETURN SQLError(            SQLHENV EnvironmentHandle, SQLHDBC ConnectionHandle, SQLHSTMT StatementHandle, SQLTCHAR* SQLState, SQLINTEGER* NativeError, SQLTCHAR* MessageText, SQLSMALLINT BufferLength, SQLSMALLINT* TextLength);
  SQLRETURN SQLExecDirect(       SQLHSTMT StatementHandle, SQLCHAR* StatementText, SQLINTEGER TextLength);
  SQLRETURN SQLExecDirect(       SQLHSTMT StatementHandle, SQLTCHAR* StatementText, SQLINTEGER TextLength);
  SQLRETURN SQLExecute(          SQLHSTMT StatementHandle);
  SQLRETURN SQLExtendedFetch(    SQLHSTMT StatementHandle, SQLUSMALLINT FetchOrientation, SQLLEN FetchOffset, SQLULEN* RowCountPtr, SQLUSMALLINT* RowStatusArray);
  SQLRETURN SQLFetch(            SQLHSTMT StatementHandle);
  SQLRETURN SQLFetchScroll(      SQLHSTMT StatementHandle, WINAPI_SQL_FETCH_TYPE FetchOrientation, SQLLEN FetchOffset);
  SQLRETURN SQLForeignKeys(      SQLHSTMT StatementHandle, SQLCHAR* PKCatalogName, SQLSMALLINT NameLength1, SQLCHAR* PKSchemaName, SQLSMALLINT NameLength2, SQLCHAR* PKTableName, SQLSMALLINT NameLength3, SQLCHAR* FKCatalogName, SQLSMALLINT NameLength4, SQLCHAR* FKSchemaName, SQLSMALLINT NameLength5, SQLCHAR* FKTableName, SQLSMALLINT NameLength6);
  SQLRETURN SQLForeignKeys(      SQLHSTMT StatementHandle, SQLTCHAR* PKCatalogName, SQLSMALLINT NameLength1, SQLTCHAR* PKSchemaName, SQLSMALLINT NameLength2, SQLTCHAR* PKTableName, SQLSMALLINT NameLength3, SQLTCHAR* FKCatalogName, SQLSMALLINT NameLength4, SQLTCHAR* FKSchemaName, SQLSMALLINT NameLength5, SQLTCHAR* FKTableName, SQLSMALLINT NameLength6);
  SQLRETURN SQLFreeConnect(      SQLHDBC ConnectionHandle);
  SQLRETURN SQLFreeEnv(          SQLHENV EnvironmentHandle);
  SQLRETURN SQLFreeHandle(       WINAPI_SQL_HANDLE_TYPE HandleType, SQLHANDLE Handle);
  SQLRETURN SQLFreeStmt(         SQLHSTMT StatementHandle, WINAPI_SQL_FREESTMT_OPTION Option);
  SQLRETURN SQLGetConnectAttr(   SQLHDBC ConnectionHandle, SQLINTEGER Attribute, SQLPOINTER ValuePtr, SQLINTEGER BufferLength, SQLINTEGER* StringLengthPtr);
  SQLRETURN SQLGetConnectAttr(   SQLHDBC ConnectionHandle, SQLINTEGER Attribute, SQLPOINTER ValuePtr, SQLINTEGER BufferLength, SQLINTEGER* StringLengthPtr);
  SQLRETURN SQLGetConnectOption( SQLHDBC ConnectionHandle, SQLUSMALLINT Option, SQLPOINTER Value);
  SQLRETURN SQLGetConnectOption( SQLHDBC ConnectionHandle, SQLUSMALLINT Option, SQLPOINTER Value);
  SQLRETURN SQLGetCursorName(    SQLHSTMT StatementHandle, SQLCHAR* CursorName, SQLSMALLINT BufferLength, SQLSMALLINT* NameLengthPtr);
  SQLRETURN SQLGetCursorName(    SQLHSTMT StatementHandle, SQLTCHAR* CursorName, SQLSMALLINT BufferLength, SQLSMALLINT* NameLengthPtr);
  SQLRETURN SQLGetData(          SQLHSTMT StatementHandle, SQLUSMALLINT Col_or_Param_Num, SQLSMALLINT TargetType, SQLPOINTER TargetValuePtr, SQLLEN BufferLength, SQLLEN* StrLen_or_IndPtr);
  SQLRETURN SQLGetDescField(     SQLHDESC DescriptorHandle, SQLSMALLINT RecNumber, SQLSMALLINT FieldIdentifier, SQLPOINTER ValuePtr, SQLINTEGER BufferLength, SQLINTEGER* StringLengthPtr);
  SQLRETURN SQLGetDescField(     SQLHDESC DescriptorHandle, SQLSMALLINT RecNumber, SQLSMALLINT FieldIdentifier, SQLPOINTER ValuePtr, SQLINTEGER BufferLength, SQLINTEGER* StringLengthPtr);
  SQLRETURN SQLGetDescRec(       SQLHDESC DescriptorHandle, SQLSMALLINT RecNumber, SQLCHAR* Name, SQLSMALLINT BufferLength, SQLSMALLINT* StringLengthPtr, SQLSMALLINT* TypePtr, SQLSMALLINT* SubTypePtr, SQLLEN* LengthPtr, SQLSMALLINT* PrecisionPtr, SQLSMALLINT* ScalePtr, SQLSMALLINT* NullablePtr);
  SQLRETURN SQLGetDescRec(       SQLHDESC DescriptorHandle, SQLSMALLINT RecNumber, SQLTCHAR* Name, SQLSMALLINT BufferLength, SQLSMALLINT* StringLengthPtr, SQLSMALLINT* TypePtr, SQLSMALLINT* SubTypePtr, SQLLEN* LengthPtr, SQLSMALLINT* PrecisionPtr, SQLSMALLINT* ScalePtr, SQLSMALLINT* NullablePtr);
  SQLRETURN SQLGetDiagField(     WINAPI_SQL_HANDLE_TYPE HandleType, SQLHANDLE Handle, SQLSMALLINT RecNumber, SQLSMALLINT DiagIdentifier, SQLPOINTER DiagInfoPtr, SQLSMALLINT BufferLength, SQLSMALLINT* StringLengthPtr);
  SQLRETURN SQLGetDiagField(     WINAPI_SQL_HANDLE_TYPE HandleType, SQLHANDLE Handle, SQLSMALLINT RecNumber, SQLSMALLINT DiagIdentifier, SQLPOINTER DiagInfoPtr, SQLSMALLINT BufferLength, SQLSMALLINT* StringLengthPtr);
  SQLRETURN SQLGetDiagRec(       WINAPI_SQL_HANDLE_TYPE HandleType, SQLHANDLE Handle, SQLSMALLINT RecNumber, SQLCHAR* SQLState, SQLINTEGER* NativeErrorPtr, SQLCHAR* MessageText, SQLSMALLINT BufferLength, SQLSMALLINT* TextLengthPtr);
  SQLRETURN SQLGetDiagRec(       WINAPI_SQL_HANDLE_TYPE HandleType, SQLHANDLE Handle, SQLSMALLINT RecNumber, SQLTCHAR* SQLState, SQLINTEGER* NativeErrorPtr, SQLTCHAR* MessageText, SQLSMALLINT BufferLength, SQLSMALLINT* TextLengthPtr);
  SQLRETURN SQLGetEnvAttr(       SQLHENV EnvironmentHandle, SQLINTEGER Attribute, SQLPOINTER ValuePtr, SQLINTEGER BufferLength, SQLINTEGER* StringLengthPtr);
  SQLRETURN SQLGetFunctions(     SQLHDBC ConnectionHandle, SQLUSMALLINT FunctionId, SQLUSMALLINT* SupportedPtr);
  SQLRETURN SQLGetInfo(          SQLHDBC ConnectionHandle, SQLUSMALLINT InfoType, SQLPOINTER InfoValuePtr, SQLSMALLINT BufferLength, SQLSMALLINT* StringLengthPtr);
  SQLRETURN SQLGetInfo(          SQLHDBC ConnectionHandle, SQLUSMALLINT InfoType, SQLPOINTER InfoValuePtr, SQLSMALLINT BufferLength, SQLSMALLINT* StringLengthPtr);
  SQLRETURN SQLGetStmtAttr(      SQLHSTMT StatementHandle, SQLINTEGER Attribute, SQLPOINTER ValuePtr, SQLINTEGER BufferLength, SQLINTEGER* StringLengthPtr);
  SQLRETURN SQLGetStmtAttr(      SQLHSTMT StatementHandle, SQLINTEGER Attribute, SQLPOINTER ValuePtr, SQLINTEGER BufferLength, SQLINTEGER* StringLengthPtr);
  SQLRETURN SQLGetStmtOption(    SQLHSTMT StatementHandle, SQLUSMALLINT Option, SQLPOINTER Value);
  SQLRETURN SQLGetTypeInfo(      SQLHSTMT StatementHandle, SQLSMALLINT DataType);
  SQLRETURN SQLGetTypeInfo(      SQLHSTMT StatementHandle, SQLSMALLINT DataType);
  SQLRETURN SQLMoreResults(      SQLHSTMT StatementHandle);
  SQLRETURN SQLNativeSql(        SQLHDBC ConnectionHandle, SQLCHAR* InStatementText, SQLINTEGER TextLength1, SQLCHAR* OutStatementText, SQLINTEGER BufferLength, SQLINTEGER* TextLength2Ptr);
  SQLRETURN SQLNativeSql(        SQLHDBC ConnectionHandle, SQLTCHAR* InStatementText, SQLINTEGER TextLength1, SQLTCHAR* OutStatementText, SQLINTEGER BufferLength, SQLINTEGER* TextLength2Ptr);
  SQLRETURN SQLNumParams(        SQLHSTMT StatementHandle, SQLSMALLINT* ParameterCountPtr);
  SQLRETURN SQLNumResultCols(    SQLHSTMT StatementHandle, SQLSMALLINT* ColumnCountPtr);
  SQLRETURN SQLParamData(        SQLHSTMT StatementHandle, SQLPOINTER* ValuePtrPtr);
  SQLRETURN SQLParamOptions(     SQLHSTMT hstmt, SQLULEN crow, SQLULEN* pirow);
  SQLRETURN SQLPrepare(          SQLHSTMT StatementHandle, SQLCHAR* StatementText, SQLINTEGER TextLength);
  SQLRETURN SQLPrepare(          SQLHSTMT StatementHandle, SQLTCHAR* StatementText, SQLINTEGER TextLength);
  SQLRETURN SQLPrimaryKeys(      SQLHSTMT StatementHandle, SQLCHAR* CatalogName, SQLSMALLINT NameLength1, SQLCHAR* SchemaName, SQLSMALLINT NameLength2, SQLCHAR* TableName, SQLSMALLINT NameLength3);
  SQLRETURN SQLPrimaryKeys(      SQLHSTMT StatementHandle, SQLTCHAR* CatalogName, SQLSMALLINT NameLength1, SQLTCHAR* SchemaName, SQLSMALLINT NameLength2, SQLTCHAR* TableName, SQLSMALLINT NameLength3);
  SQLRETURN SQLProcedureColumns( SQLHSTMT StatementHandle, SQLCHAR* CatalogName, SQLSMALLINT NameLength1, SQLCHAR* SchemaName, SQLSMALLINT NameLength2, SQLCHAR* ProcName, SQLSMALLINT NameLength3, SQLCHAR* ColumnName, SQLSMALLINT NameLength4);
  SQLRETURN SQLProcedureColumns( SQLHSTMT StatementHandle, SQLTCHAR* CatalogName, SQLSMALLINT NameLength1, SQLTCHAR* SchemaName, SQLSMALLINT NameLength2, SQLTCHAR* ProcName, SQLSMALLINT NameLength3, SQLTCHAR* ColumnName, SQLSMALLINT NameLength4);
  SQLRETURN SQLProcedures(       SQLHSTMT StatementHandle, SQLCHAR* CatalogName, SQLSMALLINT NameLength1, SQLCHAR* SchemaName, SQLSMALLINT NameLength2, SQLCHAR* ProcName, SQLSMALLINT NameLength3);
  SQLRETURN SQLProcedures(       SQLHSTMT StatementHandle, SQLTCHAR* CatalogName, SQLSMALLINT NameLength1, SQLTCHAR* SchemaName, SQLSMALLINT NameLength2, SQLTCHAR* ProcName, SQLSMALLINT NameLength3);
  SQLRETURN SQLPutData(          SQLHSTMT StatementHandle, SQLPOINTER DataPtr, SQLLEN StrLen_or_Ind);
  SQLRETURN SQLRowCount(         SQLHSTMT StatementHandle, SQLLEN* RowCountPtr);
  SQLRETURN SQLSetConnectAttr(   SQLHDBC ConnectionHandle, SQLINTEGER Attribute, SQLPOINTER ValuePtr, SQLINTEGER StringLength);
  SQLRETURN SQLSetConnectAttr(   SQLHDBC ConnectionHandle, SQLINTEGER Attribute, SQLPOINTER ValuePtr, SQLINTEGER StringLength);
  SQLRETURN SQLSetConnectOption( SQLHDBC ConnectionHandle, SQLUSMALLINT Option, SQLULEN Value);
  SQLRETURN SQLSetConnectOption( SQLHDBC ConnectionHandle, SQLUSMALLINT Option, SQLULEN Value);
  SQLRETURN SQLSetCursorName(    SQLHSTMT StatementHandle, SQLCHAR* CursorName, SQLSMALLINT NameLength);
  SQLRETURN SQLSetCursorName(    SQLHSTMT StatementHandle, SQLTCHAR* CursorName, SQLSMALLINT NameLength);
  SQLRETURN SQLSetDescField(     SQLHDESC DescriptorHandle, SQLSMALLINT RecNumber, SQLSMALLINT FieldIdentifier, SQLPOINTER ValuePtr, SQLINTEGER BufferLength);
  SQLRETURN SQLSetDescField(     SQLHDESC DescriptorHandle, SQLSMALLINT RecNumber, SQLSMALLINT FieldIdentifier, SQLPOINTER ValuePtr, SQLINTEGER BufferLength);
  SQLRETURN SQLSetDescRec(       SQLHDESC DescriptorHandle, SQLSMALLINT RecNumber, SQLSMALLINT Type, SQLSMALLINT SubType, SQLLEN Length, SQLSMALLINT Precision, SQLSMALLINT Scale, SQLPOINTER DataPtr, SQLLEN* StringLengthPtr, SQLLEN* IndicatorPtr);
  SQLRETURN SQLSetEnvAttr(       SQLHENV EnvironmentHandle, SQLINTEGER Attribute, SQLPOINTER ValuePtr, SQLINTEGER StringLength);
  SQLRETURN SQLSetParam(         SQLHSTMT StatementHandle, SQLUSMALLINT ParameterNumber, SQLSMALLINT ValueType, SQLSMALLINT ParameterType, SQLULEN LengthPrecision, SQLSMALLINT ParameterScale, SQLPOINTER ParameterValue, SQLLEN* StrLen_or_Ind);
  SQLRETURN SQLSetPos(           SQLHSTMT StatementHandle, SQLSETPOSIROW RowNumber, SQLUSMALLINT Operation, SQLUSMALLINT LockType);
  SQLRETURN SQLSetScrollOptions( SQLHSTMT hstmt, SQLUSMALLINT fConcurrency, SQLLEN crowKeyset, SQLUSMALLINT crowRowset);
  SQLRETURN SQLSetStmtAttr(      SQLHSTMT StatementHandle, SQLINTEGER Attribute, SQLPOINTER ValuePtr, SQLINTEGER StringLength);
  SQLRETURN SQLSetStmtAttr(      SQLHSTMT StatementHandle, SQLINTEGER Attribute, SQLPOINTER ValuePtr, SQLINTEGER StringLength);
  SQLRETURN SQLSetStmtOption(    SQLHSTMT StatementHandle, SQLUSMALLINT Option, SQLULEN Value);
  SQLRETURN SQLSpecialColumns(   SQLHSTMT StatementHandle, SQLSMALLINT IdentifierType, SQLCHAR* CatalogName, SQLSMALLINT NameLength1, SQLCHAR* SchemaName, SQLSMALLINT NameLength2, SQLCHAR* TableName, SQLSMALLINT NameLength3, SQLSMALLINT Scope, SQLSMALLINT Nullable);
  SQLRETURN SQLSpecialColumns(   SQLHSTMT StatementHandle, SQLSMALLINT IdentifierType, SQLTCHAR* CatalogName, SQLSMALLINT NameLength1, SQLTCHAR* SchemaName, SQLSMALLINT NameLength2, SQLTCHAR* TableName, SQLSMALLINT NameLength3, SQLSMALLINT Scope, SQLSMALLINT Nullable);
  SQLRETURN SQLStatistics(       SQLHSTMT StatementHandle, SQLCHAR* CatalogName, SQLSMALLINT NameLength1, SQLCHAR* SchemaName, SQLSMALLINT NameLength2, SQLCHAR* TableName, SQLSMALLINT NameLength3, SQLUSMALLINT Unique, SQLUSMALLINT Reserved);
  SQLRETURN SQLStatistics(       SQLHSTMT StatementHandle, SQLTCHAR* CatalogName, SQLSMALLINT NameLength1, SQLTCHAR* SchemaName, SQLSMALLINT NameLength2, SQLTCHAR* TableName, SQLSMALLINT NameLength3, SQLUSMALLINT Unique, SQLUSMALLINT Reserved);
  SQLRETURN SQLTablePrivileges(  SQLHSTMT StatementHandle, SQLCHAR* CatalogName, SQLSMALLINT NameLength1, SQLCHAR* SchemaName, SQLSMALLINT NameLength2, SQLCHAR* TableName, SQLSMALLINT NameLength3);
  SQLRETURN SQLTablePrivileges(  SQLHSTMT StatementHandle, SQLTCHAR* CatalogName, SQLSMALLINT NameLength1, SQLTCHAR* SchemaName, SQLSMALLINT NameLength2, SQLTCHAR* TableName, SQLSMALLINT NameLength3);
  SQLRETURN SQLTables(           SQLHSTMT StatementHandle, SQLCHAR* CatalogName, SQLSMALLINT NameLength1, SQLCHAR* SchemaName, SQLSMALLINT NameLength2, SQLCHAR* TableName, SQLSMALLINT NameLength3, SQLCHAR* TableType, SQLSMALLINT NameLength4);
  SQLRETURN SQLTables(           SQLHSTMT StatementHandle, SQLTCHAR* CatalogName, SQLSMALLINT NameLength1, SQLTCHAR* SchemaName, SQLSMALLINT NameLength2, SQLTCHAR* TableName, SQLSMALLINT NameLength3, SQLTCHAR* TableType, SQLSMALLINT NameLength4);
  SQLRETURN SQLTransact(         SQLHENV EnvironmentHandle, SQLHDBC ConnectionHandle, SQLUSMALLINT CompletionType);
]]
return ffi.load( 'ODBC32.DLL' )

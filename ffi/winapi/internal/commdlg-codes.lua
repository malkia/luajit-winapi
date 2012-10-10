local ffi = require( 'ffi' )
ffi.cdef [[
  typedef DWORD CommDlgErrorCode; //Alias
  static const CommDlgErrorCode CDERR_DIALOGFAILURE = 0xFFFF;
  static const CommDlgErrorCode CDERR_STRUCTSIZE = 0x0001;
  static const CommDlgErrorCode CDERR_INITIALIZATION = 0x0002;
  static const CommDlgErrorCode CDERR_NOTEMPLATE = 0x0003;
  static const CommDlgErrorCode CDERR_NOHINSTANCE = 0x0004;
  static const CommDlgErrorCode CDERR_LOADSTRFAILURE = 0x0005;
  static const CommDlgErrorCode CDERR_FINDRESFAILURE = 0x0006;
  static const CommDlgErrorCode CDERR_LOADRESFAILURE = 0x0007;
  static const CommDlgErrorCode CDERR_LOCKRESFAILURE = 0x0008;
  static const CommDlgErrorCode CDERR_MEMALLOCFAILURE = 0x0009;
  static const CommDlgErrorCode CDERR_MEMLOCKFAILURE = 0x000A;
  static const CommDlgErrorCode CDERR_NOHOOKL = 0x000B;
  static const CommDlgErrorCode CDERR_REGISTERMSGFAIL = 0x000C;
  static const CommDlgErrorCode PDERR_SETUPFAILURE = 0x1001;
  static const CommDlgErrorCode PDERR_PARSEFAILURE = 0x1002;
  static const CommDlgErrorCode PDERR_RETDEFFAILURE = 0x1003;
  static const CommDlgErrorCode PDERR_LOADDRVFAILURE = 0x1004;
  static const CommDlgErrorCode PDERR_GETDEVMODEFAIL = 0x1005;
  static const CommDlgErrorCode PDERR_INITFAILURE = 0x1006;
  static const CommDlgErrorCode PDERR_NODEVICES = 0x1007;
  static const CommDlgErrorCode PDERR_NODEFAULTPRN = 0x1008;
  static const CommDlgErrorCode PDERR_DNDMMISMATCH = 0x1009;
  static const CommDlgErrorCode PDERR_CREATEICFAILURE = 0x100A;
  static const CommDlgErrorCode PDERR_PRINTERNOTFOUND = 0x100B;
  static const CommDlgErrorCode PDERR_DEFAULTDIFFERENT = 0x100C;
  static const CommDlgErrorCode CFERR_NOFONTS = 0x2001;
  static const CommDlgErrorCode CFERR_MAXLESSTHANMIN = 0x2002;
  static const CommDlgErrorCode FNERR_SUBCLASSFAILURE = 0x3001;
  static const CommDlgErrorCode FNERR_BUFFERTOOSMALL = 0x3003;
  static const CommDlgErrorCode FNERR_INVALIDFILENAME = 0x3002;
  static const CommDlgErrorCode FRERR_BUFFERLENGTHZERO = 0x4001;
]]

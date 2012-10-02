require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef enum CompareMethod {
    BinaryCompare = 0,
    TextCompare = 1,
    DatabaseCompare = 2,
  } CompareMethod;
  typedef enum IOMode {
    ForReading = 1,
    ForWriting = 2,
    ForAppending = 8,
  } IOMode;
  typedef enum Tristate {
    TristateTrue = WINAPI__1,
    TristateFalse = 0,
    TristateUseDefault = WINAPI__2,
  } Tristate;
  typedef UINT FileAttribute; //Alias
  typedef enum SpecialFolderConst {
    WindowsFolder = 0,
    SystemFolder = 1,
    TemporaryFolder = 2,
  } SpecialFolderConst;
  typedef enum DriveTypeConst {
    UnknownType = 0,
    Removable = 1,
    Fixed = 2,
    Remote = 3,
    CDRom = 4,
    RamDisk = 5,
  } DriveTypeConst;
  typedef enum StandardStreamTypes {
    StdIn = 0,
    StdOut = 1,
    StdErr = 2,
  } StandardStreamTypes;
]]

require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IDictionary; //Interface
  typedef void* IDrive; //Interface
  typedef void* IDriveCollection; //Interface
  typedef void* IFile; //Interface
  typedef void* IFileCollection; //Interface
  typedef void* IFileSystem; //Interface
  typedef void* IFileSystem3; //Interface
  typedef void* IFolder; //Interface
  typedef void* IFolderCollection; //Interface
  typedef void* IScriptEncoder; //Interface
  typedef void* ITextStream; //Interface
  typedef UINT CompareMethod; //Alias
  static const UINT BinaryCompare = 0;
  static const UINT TextCompare = 1;
  static const UINT DatabaseCompare = 2;
  typedef UINT IOMode; //Alias
  static const UINT ForReading = 1;
  static const UINT ForWriting = 2;
  static const UINT ForAppending = 8;
  typedef UINT Tristate; //Alias
  static const UINT TristateTrue = -1;
  static const UINT TristateFalse = 0;
  static const UINT TristateUseDefault = -2;
  typedef UINT FileAttribute; //Alias
  typedef UINT SpecialFolderConst; //Alias
  static const UINT WindowsFolder = 0;
  static const UINT SystemFolder = 1;
  static const UINT TemporaryFolder = 2;
  typedef UINT DriveTypeConst; //Alias
  static const UINT UnknownType = 0;
  static const UINT Removable = 1;
  static const UINT Fixed = 2;
  static const UINT Remote = 3;
  static const UINT CDRom = 4;
  static const UINT RamDisk = 5;
  typedef UINT StandardStreamTypes; //Alias
  static const UINT StdIn = 0;
  static const UINT StdOut = 1;
  static const UINT StdErr = 2;
]]

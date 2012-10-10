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
  static const CompareMethod BinaryCompare = 0;
  static const CompareMethod TextCompare = 1;
  static const CompareMethod DatabaseCompare = 2;
  typedef UINT IOMode; //Alias
  static const IOMode ForReading = 1;
  static const IOMode ForWriting = 2;
  static const IOMode ForAppending = 8;
  typedef UINT Tristate; //Alias
  static const Tristate TristateTrue = -1;
  static const Tristate TristateFalse = 0;
  static const Tristate TristateUseDefault = -2;
  typedef UINT FileAttribute; //Alias
  typedef UINT SpecialFolderConst; //Alias
  static const SpecialFolderConst WindowsFolder = 0;
  static const SpecialFolderConst SystemFolder = 1;
  static const SpecialFolderConst TemporaryFolder = 2;
  typedef UINT DriveTypeConst; //Alias
  static const DriveTypeConst UnknownType = 0;
  static const DriveTypeConst Removable = 1;
  static const DriveTypeConst Fixed = 2;
  static const DriveTypeConst Remote = 3;
  static const DriveTypeConst CDRom = 4;
  static const DriveTypeConst RamDisk = 5;
  typedef UINT StandardStreamTypes; //Alias
  static const StandardStreamTypes StdIn = 0;
  static const StandardStreamTypes StdOut = 1;
  static const StandardStreamTypes StdErr = 2;
]]

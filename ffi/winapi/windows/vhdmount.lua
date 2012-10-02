require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  ULONG GetSCSIAddress( PWCHAR VHDFileName, ULONG Flags, ULONG SCSIAddressLength, PWCHAR SCSIAddress);
  ULONG MountVHD(       PWCHAR VHDFileName, ULONG Flags);
  ULONG UnmountVHD(     PWCHAR VHDFileName, ULONG Flags);
]]
return ffi.load( 'VHDMount.dll' )

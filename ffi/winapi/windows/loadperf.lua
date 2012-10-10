require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  DWORD LoadPerfCounterTextStrings(   LPCTSTR commandLine, BOOL bQuietModeArg);
  DWORD UnloadPerfCounterTextStrings( LPCTSTR commandLine, BOOL bQuietModeArg);
]]
ffi.load( 'Loadperf.dll' )

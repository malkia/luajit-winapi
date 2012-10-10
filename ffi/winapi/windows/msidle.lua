require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID _IDLECALLBACK; //Alias
  DWORD BeginIdleDetection( _IDLECALLBACK pfnCallback, DWORD dwIdleMin, DWORD dwReserved);
  BOOL  EndIdleDetection(   DWORD dwReserved);
  DWORD GetIdleMinutes(     DWORD dwReserved);
]]
ffi.load( 'Msidle.dll' )

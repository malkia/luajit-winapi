require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  HRESULT InitLocalMsCtfMonitor(   DWORD dwFlags);
  HRESULT UninitLocalMsCtfMonitor( );
]]
return ffi.load( "MsCtfMonitor.dll" )

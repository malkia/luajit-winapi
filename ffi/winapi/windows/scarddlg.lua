require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  LONG GetOpenCardName(      LPOPENCARDNAME pDlgStruc);
  LONG SCardUIDlgSelectCard( LPOPENCARDNAME_EX pDlgStruc);
]]
return ffi.load( 'Scarddlg.dll' )

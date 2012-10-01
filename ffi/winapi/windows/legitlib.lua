require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  HRESULT GetLastErrors(    WCHAR** ppwszTrace);
  bool    IsAlreadyGenuine( );
  int     LegitCheck(       );
  HRESULT SetPartnerID(     int nPartnerID);
]]
return ffi.load( "LegitLib.dll" )

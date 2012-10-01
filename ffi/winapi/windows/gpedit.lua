require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/ole" )
local ffi = require( "ffi" )
ffi.cdef [[
  HRESULT BrowseForGPO(      LPGPOBROWSEINFO lpBrowseInfo);
  HRESULT CreateGPOLink(     LPOLESTR lpGPO, LPOLESTR lpContainer, BOOL fHighPriority);
  HRESULT DeleteAllGPOLinks( LPOLESTR lpContainer);
  HRESULT DeleteGPOLink(     LPOLESTR lpGPO, LPOLESTR lpContainer);
  HRESULT ExportRSoPData(    LPOLESTR lpNameSpace, LPOLESTR lpFileName);
  HRESULT ImportRSoPData(    LPOLESTR lpNameSpace, LPOLESTR lpFileName);
]]
return ffi.load( "Gpedit.dll" )

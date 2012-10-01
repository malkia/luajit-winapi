require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/ole" )
local ffi = require( "ffi" )
ffi.cdef [[
  BOOL    ADsPropCheckIfWritable(  PWSTR pwzAttr, PADS_ATTR_INFO pWritableAttrs);
  HRESULT ADsPropCreateNotifyObj(  LPDATAOBJECT pAppThdDataObj, PWSTR pwzADsObjName, HWND* phNotifyObj);
  BOOL    ADsPropGetInitInfo(      HWND hNotifyObject, PADSPROPINITPARAMS pInitParams);
  BOOL    ADsPropSendErrorMessage( HWND hNotifyObject, PADSPROPERROR pError);
  BOOL    ADsPropSetHwnd(          HWND hNotifyObject, HWND hPage);
  BOOL    ADsPropSetHwndWithTitle( HWND hNotifyObject, HWND hPage, PTSTR ptzTitle);
  BOOL    ADsPropShowErrorDialog(  HWND hNotifyObject, HWND hPage);
]]
return ffi.load( "Dsprop.dll" )

require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IDirectoryObject; //Interface
  typedef LPVOID PADSVALUE; //Alias
  typedef UINT ADSTYPE; //Alias
  static const UINT ADSTYPE_INVALID = 0;
  static const UINT ADSTYPE_DN_STRING = 1;
  static const UINT ADSTYPE_CASE_EXACT_STRING = 2;
  static const UINT ADSTYPE_CASE_IGNORE_STRING = 3;
  static const UINT ADSTYPE_PRINTABLE_STRING = 4;
  static const UINT ADSTYPE_NUMERIC_STRING = 5;
  static const UINT ADSTYPE_BOOLEAN = 6;
  static const UINT ADSTYPE_INTEGER = 7;
  static const UINT ADSTYPE_OCTET_STRING = 8;
  static const UINT ADSTYPE_UTC_TIME = 9;
  static const UINT ADSTYPE_LARGE_INTEGER = 10;
  static const UINT ADSTYPE_PROV_SPECIFIC = 11;
  static const UINT ADSTYPE_OBJECT_CLASS = 12;
  static const UINT ADSTYPE_CASEIGNORE_LIST = 13;
  static const UINT ADSTYPE_OCTET_LIST = 14;
  static const UINT ADSTYPE_PATH = 15;
  static const UINT ADSTYPE_POSTALADDRESS = 16;
  static const UINT ADSTYPE_TIMESTAMP = 17;
  static const UINT ADSTYPE_BACKLINK = 18;
  static const UINT ADSTYPE_TYPEDNAME = 19;
  static const UINT ADSTYPE_HOLD = 20;
  static const UINT ADSTYPE_NETADDRESS = 21;
  static const UINT ADSTYPE_REPLICAPOINTER = 22;
  static const UINT ADSTYPE_FAXNUMBER = 23;
  static const UINT ADSTYPE_EMAIL = 24;
  static const UINT ADSTYPE_NT_SECURITY_DESCRIPTOR = 25;
  static const UINT ADSTYPE_UNKNOWN = 26;
  static const UINT ADSTYPE_DN_WITH_BINARY = 27;
  static const UINT ADSTYPE_DN_WITH_STRING = 28;
  typedef struct ADS_ATTR_INFO {
    LPWSTR pszAttrName;
    DWORD dwControlCode;
    ADSTYPE dwADsType;
    PADSVALUE pADsValues;
    DWORD dwNumValues;
  } ADS_ATTR_INFO;
  typedef ADS_ATTR_INFO *PADS_ATTR_INFO; //Pointer
  typedef ADS_ATTR_INFO *WINAPI_PADS_ATTR_INFO; //Pointer
  typedef struct ADSPROPINITPARAMS {
    DWORD dwSize;
    DWORD dwFlags;
    HRESULT hr;
    IDirectoryObject* pDsObj;
    LPWSTR pwzCN;
    PADS_ATTR_INFO pWritableAttrs;
  } ADSPROPINITPARAMS;
  typedef ADSPROPINITPARAMS *PADSPROPINITPARAMS; //Pointer
  typedef struct ADSPROPERROR {
    HWND hwndPage;
    PWSTR pszPageTitle;
    PWSTR pszObjPath;
    PWSTR pszObjClass;
    HRESULT hr;
    PWSTR pszError;
  } ADSPROPERROR;
  typedef ADSPROPERROR *PADSPROPERROR; //Pointer
  BOOL    ADsPropCheckIfWritable(  WINAPI_PWSTR pwzAttr, WINAPI_PADS_ATTR_INFO pWritableAttrs);
  HRESULT ADsPropCreateNotifyObj(  LPDATAOBJECT pAppThdDataObj, PWSTR pwzADsObjName, HWND* phNotifyObj);
  BOOL    ADsPropGetInitInfo(      HWND hNotifyObject, PADSPROPINITPARAMS pInitParams);
  BOOL    ADsPropSendErrorMessage( HWND hNotifyObject, PADSPROPERROR pError);
  BOOL    ADsPropSetHwnd(          HWND hNotifyObject, HWND hPage);
  BOOL    ADsPropSetHwndWithTitle( HWND hNotifyObject, HWND hPage, PTSTR ptzTitle);
  BOOL    ADsPropShowErrorDialog(  HWND hNotifyObject, HWND hPage);
]]
return ffi.load( 'Dsprop.dll' )

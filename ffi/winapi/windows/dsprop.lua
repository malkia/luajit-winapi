require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IDirectoryObject; //Interface
  typedef LPVOID PADSVALUE; //Alias
  typedef UINT ADSTYPE; //Alias
  static const ADSTYPE ADSTYPE_INVALID = 0;
  static const ADSTYPE ADSTYPE_DN_STRING = 1;
  static const ADSTYPE ADSTYPE_CASE_EXACT_STRING = 2;
  static const ADSTYPE ADSTYPE_CASE_IGNORE_STRING = 3;
  static const ADSTYPE ADSTYPE_PRINTABLE_STRING = 4;
  static const ADSTYPE ADSTYPE_NUMERIC_STRING = 5;
  static const ADSTYPE ADSTYPE_BOOLEAN = 6;
  static const ADSTYPE ADSTYPE_INTEGER = 7;
  static const ADSTYPE ADSTYPE_OCTET_STRING = 8;
  static const ADSTYPE ADSTYPE_UTC_TIME = 9;
  static const ADSTYPE ADSTYPE_LARGE_INTEGER = 10;
  static const ADSTYPE ADSTYPE_PROV_SPECIFIC = 11;
  static const ADSTYPE ADSTYPE_OBJECT_CLASS = 12;
  static const ADSTYPE ADSTYPE_CASEIGNORE_LIST = 13;
  static const ADSTYPE ADSTYPE_OCTET_LIST = 14;
  static const ADSTYPE ADSTYPE_PATH = 15;
  static const ADSTYPE ADSTYPE_POSTALADDRESS = 16;
  static const ADSTYPE ADSTYPE_TIMESTAMP = 17;
  static const ADSTYPE ADSTYPE_BACKLINK = 18;
  static const ADSTYPE ADSTYPE_TYPEDNAME = 19;
  static const ADSTYPE ADSTYPE_HOLD = 20;
  static const ADSTYPE ADSTYPE_NETADDRESS = 21;
  static const ADSTYPE ADSTYPE_REPLICAPOINTER = 22;
  static const ADSTYPE ADSTYPE_FAXNUMBER = 23;
  static const ADSTYPE ADSTYPE_EMAIL = 24;
  static const ADSTYPE ADSTYPE_NT_SECURITY_DESCRIPTOR = 25;
  static const ADSTYPE ADSTYPE_UNKNOWN = 26;
  static const ADSTYPE ADSTYPE_DN_WITH_BINARY = 27;
  static const ADSTYPE ADSTYPE_DN_WITH_STRING = 28;
  typedef struct ADS_ATTR_INFO {
    LPWSTR pszAttrName;
    DWORD dwControlCode;
    ADSTYPE dwADsType;
    PADSVALUE pADsValues;
    DWORD dwNumValues;
  } ADS_ATTR_INFO;
  typedef ADS_ATTR_INFO *PADS_ATTR_INFO; //Pointer
  typedef ADS_ATTR_INFO *PADS_ATTR_INFO; //Pointer
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
  BOOL    ADsPropCheckIfWritable(  PWSTR pwzAttr, PADS_ATTR_INFO pWritableAttrs);
  HRESULT ADsPropCreateNotifyObj(  LPDATAOBJECT pAppThdDataObj, PWSTR pwzADsObjName, HWND* phNotifyObj);
  BOOL    ADsPropGetInitInfo(      HWND hNotifyObject, PADSPROPINITPARAMS pInitParams);
  BOOL    ADsPropSendErrorMessage( HWND hNotifyObject, PADSPROPERROR pError);
  BOOL    ADsPropSetHwnd(          HWND hNotifyObject, HWND hPage);
  BOOL    ADsPropSetHwndWithTitle( HWND hNotifyObject, HWND hPage, PTSTR ptzTitle);
  BOOL    ADsPropShowErrorDialog(  HWND hNotifyObject, HWND hPage);
]]
ffi.load( 'Dsprop.dll' )

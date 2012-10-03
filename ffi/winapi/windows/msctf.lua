require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/ole' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* ITfThreadMgr; //Interface
  typedef void* ITfLangBarMgr; //Interface
  typedef void* ITfCategoryMgr; //Interface
  typedef void* ITfLangBarItemMgr; //Interface
  typedef void* ITfDisplayAttributeMgr; //Interface
  typedef void* ITfInputProcessorProfiles; //Interface
  typedef UINT InputScope; //Alias
  static const UINT IS_DEFAULT = 0;
  static const UINT IS_URL = 1;
  static const UINT IS_FILE_FULLFILEPATH = 2;
  static const UINT IS_FILE_FILENAME = 3;
  static const UINT IS_EMAIL_USERNAME = 4;
  static const UINT IS_EMAIL_SMTPEMAILADDRESS = 5;
  static const UINT IS_LOGINNAME = 6;
  static const UINT IS_PERSONALNAME_FULLNAME = 7;
  static const UINT IS_PERSONALNAME_PREFIX = 8;
  static const UINT IS_PERSONALNAME_GIVENNAME = 9;
  static const UINT IS_PERSONALNAME_MIDDLENAME = 10;
  static const UINT IS_PERSONALNAME_SURNAME = 11;
  static const UINT IS_PERSONALNAME_SUFFIX = 12;
  static const UINT IS_ADDRESS_FULLPOSTALADDRESS = 13;
  static const UINT IS_ADDRESS_POSTALCODE = 14;
  static const UINT IS_ADDRESS_STREET = 15;
  static const UINT IS_ADDRESS_STATEORPROVINCE = 16;
  static const UINT IS_ADDRESS_CITY = 17;
  static const UINT IS_ADDRESS_COUNTRYNAME = 18;
  static const UINT IS_ADDRESS_COUNTRYSHORTNAME = 19;
  static const UINT IS_CURRENCY_AMOUNTANDSYMBOL = 20;
  static const UINT IS_CURRENCY_AMOUNT = 21;
  static const UINT IS_DATE_FULLDATE = 22;
  static const UINT IS_DATE_MONTH = 23;
  static const UINT IS_DATE_DAY = 24;
  static const UINT IS_DATE_YEAR = 25;
  static const UINT IS_DATE_MONTHNAME = 26;
  static const UINT IS_DATE_DAYNAME = 27;
  static const UINT IS_DIGITS = 28;
  static const UINT IS_NUMBER = 29;
  static const UINT IS_ONECHAR = 30;
  static const UINT IS_PASSWORD = 31;
  static const UINT IS_TELEPHONE_FULLTELEPHONENUMBER = 32;
  static const UINT IS_TELEPHONE_COUNTRYCODE = 33;
  static const UINT IS_TELEPHONE_AREACODE = 34;
  static const UINT IS_TELEPHONE_LOCALNUMBER = 35;
  static const UINT IS_TIME_FULLTIME = 36;
  static const UINT IS_TIME_HOUR = 37;
  static const UINT IS_TIME_MINORSEC = 38;
  static const UINT IS_NUMBER_FULLWIDTH = 39;
  static const UINT IS_ALPHANUMERIC_HALFWIDTH = 40;
  static const UINT IS_ALPHANUMERIC_FULLWIDTH = 41;
  static const UINT IS_CURRENCY_CHINESE = 42;
  static const UINT IS_BOPOMOFO = 43;
  static const UINT IS_HIRAGANA = 44;
  static const UINT IS_KATAKANA_HALFWIDTH = 45;
  static const UINT IS_KATAKANA_FULLWIDTH = 46;
  static const UINT IS_HANJA = 47;
  static const UINT IS_HANGUL_HALFWIDTH = 48;
  static const UINT IS_HANGUL_FULLWIDTH = 49;
  static const UINT IS_PHRASELIST = -1;
  static const UINT IS_REGULAREXPRESSION = -2;
  static const UINT IS_SRGS = -3;
  static const UINT IS_XML = -4;
  static const UINT IS_ENUMSTRING = -5;
  HRESULT SetInputScope(                      HWND hwnd, InputScope inputscope);
  HRESULT SetInputScopes(                     HWND hwnd, WINAPI_InputScope* pInputScopes, UINT cInputScopes, WCHAR** ppszPhraseList, UINT cPhrases, WCHAR* pszRegExp, WCHAR* pszSRGS);
  HRESULT SetInputScopes2(                    HWND hwnd, WINAPI_InputScope* pInputScopes, UINT cInputScopes, IEnumString* pEnumString, WCHAR* pszRegExp, WCHAR* pszSRGS);
  void    SetInputScopeXML(                   );
  HRESULT TF_CreateCategoryMgr(               ITfCategoryMgr** ppcat);
  HRESULT TF_CreateDisplayAttributeMgr(       ITfDisplayAttributeMgr** ppdam);
  HRESULT TF_CreateInputProcessorProfiles(    ITfInputProcessorProfiles** ppipr);
  HRESULT TF_CreateLangBarItemMgr(            ITfLangBarItemMgr** pplbim);
  HRESULT TF_CreateLangBarMgr(                ITfLangBarMgr** pppbm);
  HRESULT TF_CreateThreadMgr(                 ITfThreadMgr** pptim);
  HRESULT TF_GetThreadMgr(                    ITfThreadMgr** pptim);
  HRESULT TF_InvalidAssemblyListCacheIfExist( );
  BOOL    MsimtfIsWindowFiltered(             HWND hwnd);
]]
return ffi.load( 'msctf.dll' )

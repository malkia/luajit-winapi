require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/shell' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IPropertyChange; //Interface
  typedef void* IPropertyChangeArray; //Interface
  typedef void* IPropertyDescription; //Interface
  typedef void* IPropertyDescription2; //Interface
  typedef void* IPropertyDescriptionAliasInfo; //Interface
  typedef void* IPropertyDescriptionList; //Interface
  typedef void* IPropertyDescriptionRelatedPropertyInfo; //Interface
  typedef void* IPropertyDescriptionSearchInfo; //Interface
  typedef void* IPropertyEnumType; //Interface
  typedef void* IPropertyEnumType2; //Interface
  typedef void* IPropertyEnumTypeList; //Interface
  typedef void* IPropertyStore; //Interface
  typedef void* IPropertyStoreCache; //Interface
  typedef void* IPropertyStoreCapabilities; //Interface
  typedef void* IPropertyStoreFactory; //Interface
  typedef void* IPropertySystem; //Interface
  typedef void* IPropertyUI; //Interface
  typedef HRESULT PSSTDAPI; //Alias
  typedef LPVOID PCUSERIALIZEDPROPSTORAGE; //Alias
  typedef UINT PROPENUMTYPE; //Alias
  static const UINT PET_DISCRETEVALUE = 0;
  static const UINT PET_RANGEDVALUE = 1;
  static const UINT PET_DEFAULTVALUE = 2;
  static const UINT PET_ENDRANGE = 3;
  typedef UINT PROPDESC_DISPLAYTYPE; //Alias
  static const UINT PDDT_STRING = 0;
  static const UINT PDDT_NUMBER = 1;
  static const UINT PDDT_BOOLEAN = 2;
  static const UINT PDDT_DATETIME = 3;
  static const UINT PDDT_ENUMERATED = 4;
  typedef UINT PROPDESC_GROUPING_RANGE; //Alias
  static const UINT PDGR_DISCRETE = 0;
  static const UINT PDGR_ALPHANUMERIC = 1;
  static const UINT PDGR_SIZE = 2;
  static const UINT PDGR_DYNAMIC = 3;
  static const UINT PDGR_DATE = 4;
  static const UINT PDGR_PERCENT = 5;
  static const UINT PDGR_ENUMERATED = 6;
  typedef UINT PROPDESC_RELATIVEDESCRIPTION_TYPE; //Alias
  static const UINT PDRDT_GENERAL = 0;
  static const UINT PDRDT_DATE = 1;
  static const UINT PDRDT_SIZE = 2;
  static const UINT PDRDT_COUNT = 3;
  static const UINT PDRDT_REVISION = 4;
  static const UINT PDRDT_LENGTH = 5;
  static const UINT PDRDT_DURATION = 6;
  static const UINT PDRDT_SPEED = 7;
  static const UINT PDRDT_RATE = 8;
  static const UINT PDRDT_RATING = 9;
  static const UINT PDRDT_PRIORITY = 10;
  typedef UINT PROPDESC_SORTDESCRIPTION; //Alias
  static const UINT PDSD_GENERAL = 0;
  static const UINT PDSD_A_Z = 1;
  static const UINT PDSD_LOWEST_HIGHEST = 2;
  static const UINT PDSD_SMALLEST_BIGGEST = 3;
  static const UINT PDSD_OLDEST_NEWEST = 4;
  typedef UINT PROPDESC_AGGREGATION_TYPE; //Alias
  static const UINT PDAT_DEFAULT = 0;
  static const UINT PDAT_FIRST = 1;
  static const UINT PDAT_SUM = 2;
  static const UINT PDAT_AVERAGE = 3;
  static const UINT PDAT_DATERANGE = 4;
  static const UINT PDAT_UNION = 5;
  static const UINT PDAT_MAX = 6;
  static const UINT PDAT_MIN = 7;
  typedef UINT PROPDESC_CONDITION_TYPE; //Alias
  static const UINT PDCOT_NONE = 0;
  static const UINT PDCOT_STRING = 1;
  static const UINT PDCOT_SIZE = 2;
  static const UINT PDCOT_DATETIME = 3;
  static const UINT PDCOT_BOOLEAN = 4;
  static const UINT PDCOT_NUMBER = 5;
  typedef DWORD PROPDESC_TYPE_FLAGS; //Alias
  typedef DWORD PERSIST_SPROPSTORE_FLAGS; //Alias
  typedef UINT CONDITION_OPERATION; //Alias
  static const UINT COP_IMPLICIT = 0;
  static const UINT COP_EQUAL = 1;
  static const UINT COP_NOTEQUAL = 2;
  static const UINT COP_LESSTHAN = 3;
  static const UINT COP_GREATERTHAN = 4;
  static const UINT COP_LESSTHANOREQUAL = 5;
  static const UINT COP_GREATERTHANOREQUAL = 6;
  static const UINT COP_VALUE_STARTSWITH = 7;
  static const UINT COP_VALUE_ENDSWITH = 8;
  static const UINT COP_VALUE_CONTAINS = 9;
  static const UINT COP_VALUE_NOTCONTAINS = 10;
  static const UINT COP_DOSWILDCARDS = 11;
  static const UINT COP_WORD_EQUAL = 12;
  static const UINT COP_WORD_STARTSWITH = 13;
  static const UINT COP_APPLICATION_SPECIFIC = 14;
  typedef UINT PROPDESC_COLUMNINDEX_TYPE; //Alias
  static const UINT PDCIT_NONE = 0;
  static const UINT PDCIT_ONDISK = 1;
  static const UINT PDCIT_INMEMORY = 2;
  static const UINT PDCIT_ONDEMAND = 3;
  static const UINT PDCIT_ONDISKALL = 4;
  static const UINT PDCIT_ONDISKVECTOR = 5;
  typedef UINT PSC_STATE; //Alias
  static const UINT PSC_NORMAL = 0;
  static const UINT PSC_NOTINSOURCE = 1;
  static const UINT PSC_DIRTY = 2;
  static const UINT PSC_READONLY = 3;
  typedef UINT PROPDESC_ENUMFILTER; //Alias
  static const UINT PDEF_ALL = 0;
  static const UINT PDEF_SYSTEM = 1;
  static const UINT PDEF_NONSYSTEM = 2;
  static const UINT PDEF_VIEWABLE = 3;
  static const UINT PDEF_QUERYABLE = 4;
  static const UINT PDEF_INFULLTEXTQUERY = 5;
  static const UINT PDEF_COLUMN = 6;
  typedef DWORD PROPDESC_SEARCHINFO_FLAGS; //Alias
  typedef DWORD PROPDESC_VIEW_FLAGS; //Alias
  typedef DWORD PROPDESC_FORMAT_FLAGS; //Alias
  typedef UINT PKA_FLAGS; //Alias
  static const UINT PKA_SET = 0;
  static const UINT PKA_APPEND = 1;
  static const UINT PKA_DELETE = 2;
]]

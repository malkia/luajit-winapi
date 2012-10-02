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
  typedef enum PROPENUMTYPE {
    PET_DISCRETEVALUE = 0,
    PET_RANGEDVALUE = 1,
    PET_DEFAULTVALUE = 2,
    PET_ENDRANGE = 3,
  } PROPENUMTYPE;
  typedef enum PROPDESC_DISPLAYTYPE {
    PDDT_STRING = 0,
    PDDT_NUMBER = 1,
    PDDT_BOOLEAN = 2,
    PDDT_DATETIME = 3,
    PDDT_ENUMERATED = 4,
  } PROPDESC_DISPLAYTYPE;
  typedef enum PROPDESC_GROUPING_RANGE {
    PDGR_DISCRETE = 0,
    PDGR_ALPHANUMERIC = 1,
    PDGR_SIZE = 2,
    PDGR_DYNAMIC = 3,
    PDGR_DATE = 4,
    PDGR_PERCENT = 5,
    PDGR_ENUMERATED = 6,
  } PROPDESC_GROUPING_RANGE;
  typedef enum PROPDESC_RELATIVEDESCRIPTION_TYPE {
    PDRDT_GENERAL = 0,
    PDRDT_DATE = 1,
    PDRDT_SIZE = 2,
    PDRDT_COUNT = 3,
    PDRDT_REVISION = 4,
    PDRDT_LENGTH = 5,
    PDRDT_DURATION = 6,
    PDRDT_SPEED = 7,
    PDRDT_RATE = 8,
    PDRDT_RATING = 9,
    PDRDT_PRIORITY = 10,
  } PROPDESC_RELATIVEDESCRIPTION_TYPE;
  typedef enum PROPDESC_SORTDESCRIPTION {
    PDSD_GENERAL = 0,
    PDSD_A_Z = 1,
    PDSD_LOWEST_HIGHEST = 2,
    PDSD_SMALLEST_BIGGEST = 3,
    PDSD_OLDEST_NEWEST = 4,
  } PROPDESC_SORTDESCRIPTION;
  typedef enum PROPDESC_AGGREGATION_TYPE {
    PDAT_DEFAULT = 0,
    PDAT_FIRST = 1,
    PDAT_SUM = 2,
    PDAT_AVERAGE = 3,
    PDAT_DATERANGE = 4,
    PDAT_UNION = 5,
    PDAT_MAX = 6,
    PDAT_MIN = 7,
  } PROPDESC_AGGREGATION_TYPE;
  typedef enum PROPDESC_CONDITION_TYPE {
    PDCOT_NONE = 0,
    PDCOT_STRING = 1,
    PDCOT_SIZE = 2,
    PDCOT_DATETIME = 3,
    PDCOT_BOOLEAN = 4,
    PDCOT_NUMBER = 5,
  } PROPDESC_CONDITION_TYPE;
  typedef DWORD PROPDESC_TYPE_FLAGS; //Alias
  typedef DWORD PERSIST_SPROPSTORE_FLAGS; //Alias
  typedef enum CONDITION_OPERATION {
    COP_IMPLICIT = 0,
    COP_EQUAL = 1,
    COP_NOTEQUAL = 2,
    COP_LESSTHAN = 3,
    COP_GREATERTHAN = 4,
    COP_LESSTHANOREQUAL = 5,
    COP_GREATERTHANOREQUAL = 6,
    COP_VALUE_STARTSWITH = 7,
    COP_VALUE_ENDSWITH = 8,
    COP_VALUE_CONTAINS = 9,
    COP_VALUE_NOTCONTAINS = 10,
    COP_DOSWILDCARDS = 11,
    COP_WORD_EQUAL = 12,
    COP_WORD_STARTSWITH = 13,
    COP_APPLICATION_SPECIFIC = 14,
  } CONDITION_OPERATION;
  typedef enum PROPDESC_COLUMNINDEX_TYPE {
    PDCIT_NONE = 0,
    PDCIT_ONDISK = 1,
    PDCIT_INMEMORY = 2,
    PDCIT_ONDEMAND = 3,
    PDCIT_ONDISKALL = 4,
    PDCIT_ONDISKVECTOR = 5,
  } PROPDESC_COLUMNINDEX_TYPE;
  typedef enum PSC_STATE {
    PSC_NORMAL = 0,
    PSC_NOTINSOURCE = 1,
    PSC_DIRTY = 2,
    PSC_READONLY = 3,
  } PSC_STATE;
  typedef enum PROPDESC_ENUMFILTER {
    PDEF_ALL = 0,
    PDEF_SYSTEM = 1,
    PDEF_NONSYSTEM = 2,
    PDEF_VIEWABLE = 3,
    PDEF_QUERYABLE = 4,
    PDEF_INFULLTEXTQUERY = 5,
    PDEF_COLUMN = 6,
  } PROPDESC_ENUMFILTER;
  typedef DWORD PROPDESC_SEARCHINFO_FLAGS; //Alias
  typedef DWORD PROPDESC_VIEW_FLAGS; //Alias
  typedef DWORD PROPDESC_FORMAT_FLAGS; //Alias
  typedef enum PKA_FLAGS {
    PKA_SET = 0,
    PKA_APPEND = 1,
    PKA_DELETE = 2,
  } PKA_FLAGS;
]]

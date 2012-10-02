require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IItemEnumerator; //Interface
  typedef void* ISettingsContext; //Interface
  typedef void* ISettingsEngine; //Interface
  typedef void* ISettingsIdentity; //Interface
  typedef void* ISettingsItem; //Interface
  typedef void* ISettingsNamespace; //Interface
  typedef void* ISettingsResult; //Interface
  typedef void* ITargetInfo; //Interface
  typedef enum WcmTargetMode {
    OfflineMode = 1,
    OnlineMode = 2,
  } WcmTargetMode;
  typedef enum WcmNamespaceEnumerationFlags {
    SharedEnumeration = 1,
    UserEnumeration = 2,
    AllEnumeration = 3,
  } WcmNamespaceEnumerationFlags;
  typedef enum WcmDataType {
    dataTypeByte = 1,
    dataTypeSByte = 2,
    dataTypeUInt16 = 3,
    dataTypeInt16 = 4,
    dataTypeUInt32 = 5,
    dataTypeInt32 = 6,
    dataTypeUInt64 = 7,
    dataTypeInt64 = 8,
    dataTypeBoolean = 11,
    dataTypeString = 12,
    dataTypeFlagArray = 0x8000,
  } WcmDataType;
  typedef enum WcmSettingType {
    settingTypeScalar = 1,
    settingTypeComplex = 2,
    settingTypeList = 3,
  } WcmSettingType;
  typedef enum WcmRestrictionFacets {
    restrictionFacetMaxLength = 0x1,
    restrictionFacetEnumeration = 0x2,
    restrictionFacetMaxInclusive = 0x4,
    restrictionFacetMinInclusive = 0x8,
  } WcmRestrictionFacets;
  typedef enum WcmUserStatus {
    UnknownStatus = 0,
    UserRegistered = 1,
    UserUnregistered = 2,
    UserLoaded = 3,
    UserUnloaded = 4,
  } WcmUserStatus;
  typedef enum WcmNamespaceAccess {
    ReadOnlyAccess = 1,
    ReadWriteAccess = 2,
  } WcmNamespaceAccess;
]]

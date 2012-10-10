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
  typedef UINT WcmTargetMode; //Alias
  static const WcmTargetMode OfflineMode = 1;
  static const WcmTargetMode OnlineMode = 2;
  typedef UINT WcmNamespaceEnumerationFlags; //Alias
  static const WcmNamespaceEnumerationFlags SharedEnumeration = 1;
  static const WcmNamespaceEnumerationFlags UserEnumeration = 2;
  static const WcmNamespaceEnumerationFlags AllEnumeration = 3;
  typedef UINT WcmDataType; //Alias
  static const WcmDataType dataTypeByte = 1;
  static const WcmDataType dataTypeSByte = 2;
  static const WcmDataType dataTypeUInt16 = 3;
  static const WcmDataType dataTypeInt16 = 4;
  static const WcmDataType dataTypeUInt32 = 5;
  static const WcmDataType dataTypeInt32 = 6;
  static const WcmDataType dataTypeUInt64 = 7;
  static const WcmDataType dataTypeInt64 = 8;
  static const WcmDataType dataTypeBoolean = 11;
  static const WcmDataType dataTypeString = 12;
  static const WcmDataType dataTypeFlagArray = 0x8000;
  typedef UINT WcmSettingType; //Alias
  static const WcmSettingType settingTypeScalar = 1;
  static const WcmSettingType settingTypeComplex = 2;
  static const WcmSettingType settingTypeList = 3;
  typedef UINT WcmRestrictionFacets; //Alias
  static const WcmRestrictionFacets restrictionFacetMaxLength = 0x1;
  static const WcmRestrictionFacets restrictionFacetEnumeration = 0x2;
  static const WcmRestrictionFacets restrictionFacetMaxInclusive = 0x4;
  static const WcmRestrictionFacets restrictionFacetMinInclusive = 0x8;
  typedef UINT WcmUserStatus; //Alias
  static const WcmUserStatus UnknownStatus = 0;
  static const WcmUserStatus UserRegistered = 1;
  static const WcmUserStatus UserUnregistered = 2;
  static const WcmUserStatus UserLoaded = 3;
  static const WcmUserStatus UserUnloaded = 4;
  typedef UINT WcmNamespaceAccess; //Alias
  static const WcmNamespaceAccess ReadOnlyAccess = 1;
  static const WcmNamespaceAccess ReadWriteAccess = 2;
]]

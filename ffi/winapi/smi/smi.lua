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
  static const UINT OfflineMode = 1;
  static const UINT OnlineMode = 2;
  typedef UINT WcmNamespaceEnumerationFlags; //Alias
  static const UINT SharedEnumeration = 1;
  static const UINT UserEnumeration = 2;
  static const UINT AllEnumeration = 3;
  typedef UINT WcmDataType; //Alias
  static const UINT dataTypeByte = 1;
  static const UINT dataTypeSByte = 2;
  static const UINT dataTypeUInt16 = 3;
  static const UINT dataTypeInt16 = 4;
  static const UINT dataTypeUInt32 = 5;
  static const UINT dataTypeInt32 = 6;
  static const UINT dataTypeUInt64 = 7;
  static const UINT dataTypeInt64 = 8;
  static const UINT dataTypeBoolean = 11;
  static const UINT dataTypeString = 12;
  static const UINT dataTypeFlagArray = 0x8000;
  typedef UINT WcmSettingType; //Alias
  static const UINT settingTypeScalar = 1;
  static const UINT settingTypeComplex = 2;
  static const UINT settingTypeList = 3;
  typedef UINT WcmRestrictionFacets; //Alias
  static const UINT restrictionFacetMaxLength = 0x1;
  static const UINT restrictionFacetEnumeration = 0x2;
  static const UINT restrictionFacetMaxInclusive = 0x4;
  static const UINT restrictionFacetMinInclusive = 0x8;
  typedef UINT WcmUserStatus; //Alias
  static const UINT UnknownStatus = 0;
  static const UINT UserRegistered = 1;
  static const UINT UserUnregistered = 2;
  static const UINT UserLoaded = 3;
  static const UINT UserUnloaded = 4;
  typedef UINT WcmNamespaceAccess; //Alias
  static const UINT ReadOnlyAccess = 1;
  static const UINT ReadWriteAccess = 2;
]]

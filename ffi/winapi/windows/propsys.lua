require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/shell' )
require( 'ffi/winapi/headers/ole' )
require( 'ffi/winapi/headers/propsys' )
local ffi = require( 'ffi' )
ffi.cdef [[
  WINOLEAPI StgDeserializePropVariant(                   SERIALIZEDPROPERTYVALUE* pprop, SERIALIZEDPROPERTYVALUE* cbMax, PROPVARIANT* pvar);
  WINOLEAPI StgSerializePropVariant(                     PROPVARIANT* pVar, SERIALIZEDPROPERTYVALUE** ppProp, SERIALIZEDPROPERTYVALUE* pcb);
  HRESULT   PSCoerceToCanonicalValue(                    REFPROPERTYKEY key, PROPVARIANT* ppropvar);
  HRESULT   PSCreateAdapterFromPropertyStore(            IPropertyStore* pps, REFIID riid, void** ppv);
  HRESULT   PSCreateDelayedMultiplexPropertyStore(       GETPROPERTYSTOREFLAGS flags, IDelayedPropertyStoreFactory* pdpsf, const DWORD* rgStoreIds, DWORD cStores, REFIID riid, void** ppv);
  HRESULT   PSCreateMemoryPropertyStore(                 REFIID riid, void** ppv);
  HRESULT   PSCreateMultiplexPropertyStore(              IUnknown** prgpunkStores, DWORD cStores, REFIID riid, void** ppv);
  HRESULT   PSCreatePropertyChangeArray(                 const PROPERTYKEY* rgpropkey, const PKA_FLAGS* rgflags, const PROPVARIANT* rgpropvar, UINT cChanges, REFIID riid, void** ppv);
  HRESULT   PSCreatePropertyStoreFromObject(             IUnknown* punk, WINAPI_STGM_FLAGS grfMode, REFIID riid, void** ppv);
  HRESULT   PSCreatePropertyStoreFromPropertySetStorage( IPropertySetStorage* ppss, WINAPI_STGM_FLAGS grfMode, REFIID riid, void** ppv);
  HRESULT   PSCreateSimplePropertyChange(                PKA_FLAGS flags, REFPROPERTYKEY key, REFPROPVARIANT propvar, REFIID riid, void** ppv);
  PSSTDAPI  PSEnumeratePropertyDescriptions(             PROPDESC_ENUMFILTER filterOn, REFIID riid, void** ppv);
  HRESULT   PSFormatForDisplay(                          REFPROPERTYKEY propkey, REFPROPVARIANT propvar, PROPDESC_FORMAT_FLAGS pdfFlags, LPWSTR pwszText, DWORD cchText);
  HRESULT   PSFormatForDisplayAlloc(                     REFPROPERTYKEY key, REFPROPVARIANT propvar, PROPDESC_FORMAT_FLAGS pdfFlags, PWSTR* ppszDisplay);
  HRESULT   PSFormatPropertyValue(                       IPropertyStore* pps, IPropertyDescription* ppd, PROPDESC_FORMAT_FLAGS pdff, LPWSTR* ppszDisplay);
  PSSTDAPI  PSGetItemPropertyHandler(                    IUnknown* punkItem, BOOL fReadWrite, REFIID riid, void** ppv);
  PSSTDAPI  PSGetItemPropertyHandlerWithCreateObject(    IUnknown* punkItem, BOOL fReadWrite, IUnknown* punkCreateObject, REFIID riid, void** ppv);
  PSSTDAPI  PSGetNamedPropertyFromPropertyStorage(       PCUSERIALIZEDPROPSTORAGE psps, DWORD cb, LPCWSTR pszName, PROPVARIANT* ppropvar);
  HRESULT   PSGetNameFromPropertyKey(                    REFPROPERTYKEY propkey, PWSTR* ppszCanonicalName);
  PSSTDAPI  PSGetPropertyDescription(                    REFPROPERTYKEY propkey, REFIID riid, void** ppv);
  PSSTDAPI  PSGetPropertyDescriptionByName(              LPCWSTR pszCanonicalName, REFIID riid, void** ppv);
  PSSTDAPI  PSGetPropertyDescriptionListFromString(      LPCWSTR pszPropList, REFIID riid, void** ppv);
  PSSTDAPI  PSGetPropertyFromPropertyStorage(            PCUSERIALIZEDPROPSTORAGE psps, DWORD cb, REFPROPERTYKEY rpkey, PROPVARIANT** ppropvar);
  HRESULT   PSGetPropertyKeyFromName(                    PCWSTR pszName, PROPERTYKEY* ppropkey);
  PSSTDAPI  PSGetPropertySystem(                         REFIID riid, void** ppv);
  HRESULT   PSGetPropertyValue(                          IPropertyStore* pps, IPropertyDescription* ppd, PROPVARIANT* ppropvar);
  PSSTDAPI  PSLookupPropertyHandlerCLSID(                PCWSTR pszFilePath, CLSID* pclsid);
  HRESULT   PSPropertyKeyFromString(                     LPCWSTR pszString, PROPERTYKEY* pkey);
  HRESULT   PSRegisterPropertySchema(                    PCWSTR pszPath);
  HRESULT   PSSetPropertyValue(                          IPropertyStore* pps, IPropertyDescription* ppd, REFPROPVARIANT propvar);
  HRESULT   PSStringFromPropertyKey(                     REFPROPERTYKEY pkey, LPWSTR psz, UINT cch);
  HRESULT   PSUnregisterPropertySchema(                  PCWSTR pszPath);
  HRESULT   InitPropVariantFromGUIDAsBuffer(             REFGUID guid, PROPVARIANT* ppropvar);
  HRESULT   InitPropVariantFromGUIDAsString(             REFGUID guid, PROPVARIANT* ppropvar);
  HRESULT   InitVariantFromGUIDAsBuffer(                 REFGUID guid, VARIANT* pvar);
  HRESULT   InitVariantFromGUIDAsString(                 REFGUID guid, VARIANT* pvar);
]]
return ffi.load( 'propsys.dll' )

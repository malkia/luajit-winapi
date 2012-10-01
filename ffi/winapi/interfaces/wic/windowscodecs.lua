require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  WINAPI_WIC_HRESULT WICConvertBitmapSource(       REFWICPixelFormatGUID dstFormat, IWICBitmapSource* pISrc, IWICBitmapSource** ppIDst);
  WINAPI_WIC_HRESULT WICCreateBitmapFromSection(   UINT width, UINT height, REFWICPixelFormatGUID pixelFormat, HANDLE hSection, UINT stride, UINT offset, IWICBitmap** pIBitmap);
  WINAPI_WIC_HRESULT WICCreateBitmapFromSectionEx( UINT width, UINT height, REFWICPixelFormatGUID pixelFormat, HANDLE hSection, UINT stride, UINT offset, WICSectionAccessLevel desiredAccessLevel, IWICBitmap** pIBitmap);
  WINAPI_WIC_HRESULT WICGetMetadataContentSize(    REFGUID guidContainerFormat, IWICMetadataWriter* pIWriter, ULARGE_INTEGER* pcbSize);
  WINAPI_WIC_HRESULT WICMapSchemaToName(           REFGUID guidMetadataFormat, LPWSTR pwzSchema, UINT cchName, WCHAR* wzName, UINT pcchActual);
  WINAPI_WIC_HRESULT WICMapGuidToShortName(        REFGUID guid, UINT cchName, WCHAR* wzName, UINT* pcchActual);
  WINAPI_WIC_HRESULT WICMapShortNameToGuid(        WCHAR* wzName, GUID* pguid);
  WINAPI_WIC_HRESULT WICMatchMetadataContent(      REFGUID guidContainerFormat, GUID* pguidVendor, IStream* pIStream, GUID* pguidMetadataFormat);
  WINAPI_WIC_HRESULT WICSerializeMetadataContent(  REFGUID guidContainerFormat, IWICMetadataWriter* pIWriter, DWORD dwPersistOptions, IStream* pIStream);
]]
return ffi.load( "WindowsCodecs.dll" )

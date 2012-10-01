require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  ULONG TdhEnumerateProviderFieldInformation( LPGUID pGuid, EVENT_FIELD_TYPE EventFieldType, PPROVIDER_FIELD_INFOARRAY pBuffer, ULONG* pBufferSize);
  ULONG TdhEnumerateProviderFilters(          LPGUID pGuid, ULONG TdhContextCount, PTDH_CONTEXT pTdhContext, ULONG* FilterCount, PPROVIDER_FILTER_INFO* pBuffer, ULONG* pBufferSize);
  ULONG TdhEnumerateProviders(                PPROVIDER_ENUMERATION_INFO pBuffer, ULONG* pBufferSize);
  ULONG TdhFormatProperty(                    PTRACE_EVENT_INFO EventInfo, PEVENT_MAP_INFO MapInfo, ULONG PointerSize, USHORT PropertyInType, USHORT PropertyOutType, USHORT PropertyLength, USHORT UserDataLength, PBYTE UserData, PULONG BufferSize, PWCHAR Buffer, PUSHORT UserDataConsumed);
  ULONG TdhGetEventInformation(               PEVENT_RECORD pEvent, ULONG TdhContextCount, PTDH_CONTEXT pTdhContext, PTRACE_EVENT_INFO pBuffer, ULONG* pBufferSize);
  ULONG TdhGetEventMapInformation(            PEVENT_RECORD pEvent, LPWSTR pMapName, PEVENT_MAP_INFO pBuffer, ULONG* pBufferSize);
  ULONG TdhGetPropertySize(                   PEVENT_RECORD pEvent, ULONG TdhContextCount, PTDH_CONTEXT pTdhContext, ULONG PropertyDataCount, PPROPERTY_DATA_DESCRIPTOR pPropertyData, ULONG* pPropertySize);
  ULONG TdhGetProperty(                       PEVENT_RECORD pEvent, ULONG TdhContextCount, PTDH_CONTEXT pTdhContext, ULONG PropertyDataCount, PPROPERTY_DATA_DESCRIPTOR pPropertyData, ULONG BufferSize, PBYTE pBuffer);
  ULONG TdhLoadManifest(                      PWSTR Manifest);
  ULONG TdhQueryProviderFieldInformation(     LPGUID pGuid, ULONGLONG EventFieldValue, EVENT_FIELD_TYPE EventFieldType, PPROVIDER_FIELD_INFOARRAY pBuffer, ULONG* pBufferSize);
  ULONG TdhUnloadManifest(                    PWSTR Manifest);
]]
return ffi.load( "Tdh.dll" )

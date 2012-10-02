require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/security' )
local ffi = require( 'ffi' )
ffi.cdef [[
  BOOL AuthzAccessCheck(                       WINAPI_AuthzAccessCheckFlags flags, AUTHZ_CLIENT_CONTEXT_HANDLE AuthzClientContext, PAUTHZ_ACCESS_REQUEST pRequest, AUTHZ_AUDIT_EVENT_HANDLE AuditInfo, PSECURITY_DESCRIPTOR pSecurityDescriptor, PSECURITY_DESCRIPTOR* OptionalSecurityDescriptorArray, DWORD OptionalSecurityDescriptorCount, PAUTHZ_ACCESS_REPLY pReply, PAUTHZ_ACCESS_CHECK_RESULTS_HANDLE pAuthzHandle);
  BOOL AuthzAddSidsToContext(                  AUTHZ_CLIENT_CONTEXT_HANDLE OrigClientContext, PSID_AND_ATTRIBUTES Sids, DWORD SidCount, PSID_AND_ATTRIBUTES RestrictedSids, DWORD RestrictedSidCount, PAUTHZ_CLIENT_CONTEXT_HANDLE pNewClientContext);
  BOOL AuthzCachedAccessCheck(                 DWORD Flags, AUTHZ_ACCESS_CHECK_RESULTS_HANDLE AuthzHandle, PAUTHZ_ACCESS_REQUEST pRequest, AUTHZ_AUDIT_EVENT_HANDLE AuditInfo, PAUTHZ_ACCESS_REPLY pReply);
  BOOL AuthzEnumerateSecurityEventSources(     DWORD dwFlags, PAUTHZ_SOURCE_SCHEMA_REGISTRATION Buffer, PDWORD pdwCount, PDWORD pdwLength);
  BOOL AuthzFreeAuditEvent(                    AUTHZ_AUDIT_EVENT_HANDLE pAuditEventInfo);
  BOOL AuthzFreeContext(                       AUTHZ_CLIENT_CONTEXT_HANDLE AuthzClientContext);
  BOOL AuthzFreeHandle(                        AUTHZ_ACCESS_CHECK_RESULTS_HANDLE AuthzHandle);
  BOOL AuthzFreeResourceManager(               AUTHZ_RESOURCE_MANAGER_HANDLE AuthzResourceManager);
  BOOL AuthzGetInformationFromContext(         AUTHZ_CLIENT_CONTEXT_HANDLE hAuthzClientContext, AUTHZ_CONTEXT_INFORMATION_CLASS InfoClass, DWORD BufferSize, PDWORD pSizeRequired, PVOID Buffer);
  BOOL AuthzInitializeContextFromAuthzContext( DWORD flags, AUTHZ_CLIENT_CONTEXT_HANDLE AuthzHandle, PLARGE_INTEGER ExpirationTime, LUID Identifier, PVOID DynamicGroupArgs, PAUTHZ_CLIENT_CONTEXT_HANDLE phNewAuthzHandle);
  BOOL AuthzInitializeContextFromSid(          WINAPI_AuthzInitContextFlags Flags, PSID UserSid, AUTHZ_RESOURCE_MANAGER_HANDLE hAuthzResourceManager, PLARGE_INTEGER pExpirationTime, LUID Identifier, PVOID DynamicGroupArgs, PAUTHZ_CLIENT_CONTEXT_HANDLE pAuthzClientContext);
  BOOL AuthzInitializeContextFromToken(        DWORD Flags, HANDLE TokenHandle, AUTHZ_RESOURCE_MANAGER_HANDLE AuthzResourceManager, PLARGE_INTEGER pExpirationTime, LUID Identifier, PVOID DynamicGroupArgs, PAUTHZ_CLIENT_CONTEXT_HANDLE pAuthzClientContext);
  BOOL AuthzInitializeObjectAccessAuditEvent(  DWORD Flags, AUTHZ_AUDIT_EVENT_TYPE_HANDLE hAuditEventType, PWSTR szOperationType, PWSTR szObjectType, PWSTR szObjectName, PWSTR szAdditionalInfo, PAUTHZ_AUDIT_EVENT_HANDLE phAuditEvent, DWORD dwAdditionalParamCount);
  BOOL AuthzInitializeObjectAccessAuditEvent2( WINAPI_AUTHZ_INITOBJAUDITEVENT_FLAGS Flags, AUTHZ_AUDIT_EVENT_TYPE_HANDLE hAuditEventType, PWSTR szOperationType, PWSTR szObjectType, PWSTR szObjectName, PWSTR szAdditionalInfo, PWSTR szAdditionalInfo2, PAUTHZ_AUDIT_EVENT_HANDLE phAuditEvent, DWORD dwAdditionalParameterCount);
  BOOL AuthzInitializeResourceManager(         WINAPI_AuthzInitRMFlags flags, PFN_AUTHZ_DYNAMIC_ACCESS_CHECK pfnAccessCheck, PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS pfnComputeDynamicGroups, PFN_AUTHZ_FREE_DYNAMIC_GROUPS pfnFreeDynamicGroups, PCWSTR ResourceManagerName, PAUTHZ_RESOURCE_MANAGER_HANDLE pAuthzResourceManager);
  BOOL AuthzOpenObjectAudit(                   DWORD Flags, AUTHZ_CLIENT_CONTEXT_HANDLE hAuthzClientContext, PAUTHZ_ACCESS_REQUEST pRequest, AUTHZ_AUDIT_EVENT_HANDLE hAuditEvent, PSECURITY_DESCRIPTOR pSecurityDescriptor, PSECURITY_DESCRIPTOR* SecurityDescriptorArray, DWORD SecurityDescriptorCount, PAUTHZ_ACCESS_REPLY pReply);
  BOOL AuthzRegisterSecurityEventSource(       DWORD dwFlags, PCWSTR szEventSourceName, PAUTHZ_SECURITY_EVENT_PROVIDER_HANDLE phEventProvider);
  BOOL AuthzReportSecurityEvent(               WINAPI_APF_TYPE dwFlags, AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE hEventProvider, DWORD dwAuditId, PSID pUserSid, DWORD dwCount);
  BOOL AuthzReportSecurityEventFromParams(     DWORD dwFlags, AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE hEventProvider, DWORD dwAuditId, PSID pUserSid, PAUDIT_PARAMS pParams);
  BOOL AuthzInstallSecurityEventSource(        DWORD dwFlags, PAUTHZ_SOURCE_SCHEMA_REGISTRATION pRegistration);
  BOOL AuthzUnregisterSecurityEventSource(     DWORD dwFlags, PAUTHZ_SECURITY_EVENT_PROVIDER_HANDLE phEventProvider);
  BOOL AuthzModifySecurityAttributes(          AUTHZ_CLIENT_CONTEXT_HANDLE AuthzClientContext, PAUTHZ_SECURITY_ATTRIBUTE_OPERATION pOperations, PAUTHZ_SECURITY_ATTRIBUTES_INFORMATION pAttributes);
]]
return ffi.load( 'Authz.dll' )

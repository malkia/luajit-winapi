require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  DNS_STATUS  DnsAcquireContextHandle_(       BOOL CredentialFlags, PVOID Credentials, PHANDLE pContext);
  DNS_STATUS  DnsExtractRecordsFromMessage_W( PDNS_MESSAGE_BUFFER pDnsBuffer, WORD wMessageLength, PDNS_RECORD* ppRecord);
  void        DnsFree(                        PVOID pData, DNS_FREE_TYPE FreeType);
  void        DnsFreeProxyName(               PWSTR proxyName);
  DNS_STATUS  DnsGetProxyInformation(         PCWSTR hostName, DNS_PROXY_INFORMATION* proxyInformation, DNS_PROXY_INFORMATION* defaultProxyInformation, DNS_PROXY_COMPLETION_ROUTINE completionRoutine, void* completionContext);
  DNS_STATUS  DnsModifyRecordsInSet_(         PDNS_RECORD pAddRecords, PDNS_RECORD pDeleteRecords, DWORD Options, HANDLE hContext, PVOID pExtraList, PVOID pReserved);
  BOOL        DnsNameCompare_(                PCTSTR pName1, PCTSTR pName2);
  DNS_STATUS  DnsQuery_(                      PCTSTR lpstrName, WINAPI_DnsRecordType wType, WINAPI_DnsQueryOptions Options, PVOID pExtra, PDNS_RECORD* ppQueryResultsSet, PVOID* pReserved);
  DNS_STATUS  DnsQueryConfig(                 DNS_CONFIG_TYPE Config, WINAPI_DnsConfigFlags Flag, PCWSTR pwsAdapterName, PVOID pReserved, PVOID pBuffer, PDWORD pBufferLength);
  BOOL        DnsRecordCompare(               PDNS_RECORD pRecord1, PDNS_RECORD pRecord2);
  PDNS_RECORD DnsRecordCopyEx(                PDNS_RECORD pRecord, DNS_CHARSET CharSetIn, DNS_CHARSET CharSetOut);
  void        DnsRecordListFree(              PDNS_RECORD pRecordList, DNS_FREE_TYPE FreeType);
  BOOL        DnsRecordSetCompare(            PDNS_RECORD pRR1, PDNS_RECORD pRR2, PDNS_RECORD* ppDiff1, PDNS_RECORD* ppDiff2);
  PDNS_RECORD DnsRecordSetCopyEx(             PDNS_RECORD pRecordSet, DNS_CHARSET CharSetIn, DNS_CHARSET CharSetOut);
  PDNS_RECORD DnsRecordSetDetach(             PDNS_RECORD pRR);
  void        DnsReleaseContextHandle(        HANDLE ContextHandle);
  DNS_STATUS  DnsReplaceRecordSet(            PDNS_RECORD pNewSet, WINAPI_DnsUpdateFlags Options, HANDLE hContext, PVOID pExtraInfo, PVOID pReserved);
  DNS_STATUS  DnsValidateName_(               PCTSTR pszName, DNS_NAME_FORMAT Format);
  BOOL        DnsWriteQuestionToBuffer_W(     PDNS_MESSAGE_BUFFER pDnsBuffer, PDWORD pdwBufferSize, PCWSTR pszName, WINAPI_DnsRecordType wType, WORD Xid, BOOL fRecursionDesired);
]]
return ffi.load( 'Dnsapi.dll' )

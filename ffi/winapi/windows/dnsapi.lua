require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PDNS_MESSAGE_BUFFER; //Alias
  typedef PVOID PDNS_RECORD; //Alias
  typedef ERROR_CODE DNS_STATUS; //Alias
  typedef LPVOID DNS_PROXY_COMPLETION_ROUTINE; //Alias
  typedef UINT DNS_PROXY_INFORMATION_TYPE; //Alias
  static const DNS_PROXY_INFORMATION_TYPE DNS_PROXY_INFORMATION_DIRECT = 0;
  static const DNS_PROXY_INFORMATION_TYPE DNS_PROXY_INFORMATION_DEFAULT_SETTINGS = 1;
  static const DNS_PROXY_INFORMATION_TYPE DNS_PROXY_INFORMATION_PROXY_NAME = 2;
  static const DNS_PROXY_INFORMATION_TYPE DNS_PROXY_INFORMATION_DOES_NOT_EXIST = 3;
  typedef struct DNS_PROXY_INFORMATION {
    ULONG version;
    DNS_PROXY_INFORMATION_TYPE proxyInformationType;
    PWSTR proxyName;
  } DNS_PROXY_INFORMATION;
  typedef UINT DNS_FREE_TYPE; //Alias
  static const DNS_FREE_TYPE DnsFreeFlat = 0;
  static const DNS_FREE_TYPE DnsFreeRecordList = 1;
  static const DNS_FREE_TYPE DnsFreeParsedMessageFields = 2;
  typedef WORD DnsRecordType; //Alias
  static const DnsRecordType DNS_TYPE_A = 0x0001;
  static const DnsRecordType DNS_TYPE_NS = 0x0002;
  static const DnsRecordType DNS_TYPE_MD = 0x0003;
  static const DnsRecordType DNS_TYPE_MF = 0x0004;
  static const DnsRecordType DNS_TYPE_CNAME = 0x0005;
  static const DnsRecordType DNS_TYPE_SOA = 0x0006;
  static const DnsRecordType DNS_TYPE_MB = 0x0007;
  static const DnsRecordType DNS_TYPE_MG = 0x0008;
  static const DnsRecordType DNS_TYPE_MR = 0x0009;
  static const DnsRecordType DNS_TYPE_NULL = 0x000a;
  static const DnsRecordType DNS_TYPE_WKS = 0x000b;
  static const DnsRecordType DNS_TYPE_PTR = 0x000c;
  static const DnsRecordType DNS_TYPE_HINFO = 0x000d;
  static const DnsRecordType DNS_TYPE_MINFO = 0x000e;
  static const DnsRecordType DNS_TYPE_MX = 0x000f;
  static const DnsRecordType DNS_TYPE_TEXT = 0x0010;
  static const DnsRecordType DNS_TYPE_RP = 0x0011;
  static const DnsRecordType DNS_TYPE_AFSDB = 0x0012;
  static const DnsRecordType DNS_TYPE_X25 = 0x0013;
  static const DnsRecordType DNS_TYPE_ISDN = 0x0014;
  static const DnsRecordType DNS_TYPE_RT = 0x0015;
  static const DnsRecordType DNS_TYPE_NSAP = 0x0016;
  static const DnsRecordType DNS_TYPE_NSAPPTR = 0x0017;
  static const DnsRecordType DNS_TYPE_SIG = 0x0018;
  static const DnsRecordType DNS_TYPE_KEY = 0x0019;
  static const DnsRecordType DNS_TYPE_PX = 0x001a;
  static const DnsRecordType DNS_TYPE_GPOS = 0x001b;
  static const DnsRecordType DNS_TYPE_AAAA = 0x001c;
  static const DnsRecordType DNS_TYPE_LOC = 0x001d;
  static const DnsRecordType DNS_TYPE_NXT = 0x001e;
  static const DnsRecordType DNS_TYPE_EID = 0x001f;
  static const DnsRecordType DNS_TYPE_NIMLOC = 0x0020;
  static const DnsRecordType DNS_TYPE_SRV = 0x0021;
  static const DnsRecordType DNS_TYPE_ATMA = 0x0022;
  static const DnsRecordType DNS_TYPE_NAPTR = 0x0023;
  static const DnsRecordType DNS_TYPE_KX = 0x0024;
  static const DnsRecordType DNS_TYPE_CERT = 0x0025;
  static const DnsRecordType DNS_TYPE_A6 = 0x0026;
  static const DnsRecordType DNS_TYPE_DNAME = 0x0027;
  static const DnsRecordType DNS_TYPE_SINK = 0x0028;
  static const DnsRecordType DNS_TYPE_OPT = 0x0029;
  static const DnsRecordType DNS_TYPE_UINFO = 0x0064;
  static const DnsRecordType DNS_TYPE_UID = 0x0065;
  static const DnsRecordType DNS_TYPE_GID = 0x0066;
  static const DnsRecordType DNS_TYPE_UNSPEC = 0x0067;
  static const DnsRecordType DNS_TYPE_ADDRS = 0x00f8;
  static const DnsRecordType DNS_TYPE_TKEY = 0x00f9;
  static const DnsRecordType DNS_TYPE_TSIG = 0x00fa;
  static const DnsRecordType DNS_TYPE_IXFR = 0x00fb;
  static const DnsRecordType DNS_TYPE_AXFR = 0x00fc;
  static const DnsRecordType DNS_TYPE_MAILB = 0x00fd;
  static const DnsRecordType DNS_TYPE_MAILA = 0x00fe;
  static const DnsRecordType DNS_TYPE_ALL = 0x00ff;
  static const DnsRecordType DNS_TYPE_ANY = 0x00ff;
  static const DnsRecordType DNS_TYPE_WINS = 0xff01;
  static const DnsRecordType DNS_TYPE_WINSR = 0xff02;
  static const DnsRecordType DNS_TYPE_NBSTAT = 0xff02;
  typedef DWORD DnsQueryOptions; //Alias
  typedef UINT DNS_NAME_FORMAT; //Alias
  static const DNS_NAME_FORMAT DnsNameDomain = 0;
  static const DNS_NAME_FORMAT DnsNameDomainLabel = 1;
  static const DNS_NAME_FORMAT DnsNameHostnameFull = 2;
  static const DNS_NAME_FORMAT DnsNameHostnameLabel = 3;
  static const DNS_NAME_FORMAT DnsNameWildcard = 4;
  static const DNS_NAME_FORMAT DnsNameSrvRecord = 5;
  static const DNS_NAME_FORMAT DnsNameValidateTld = 6;
  typedef UINT DNS_CONFIG_TYPE; //Alias
  static const DNS_CONFIG_TYPE DnsConfigPrimaryDomainName_W = 0;
  static const DNS_CONFIG_TYPE DnsConfigPrimaryDomainName_A = 1;
  static const DNS_CONFIG_TYPE DnsConfigPrimaryDomainName_UTF8 = 2;
  static const DNS_CONFIG_TYPE DnsConfigAdapterDomainName_W = 3;
  static const DNS_CONFIG_TYPE DnsConfigAdapterDomainName_A = 4;
  static const DNS_CONFIG_TYPE DnsConfigAdapterDomainName_UTF8 = 5;
  static const DNS_CONFIG_TYPE DnsConfigDnsServerList = 6;
  static const DNS_CONFIG_TYPE DnsConfigSearchList = 7;
  static const DNS_CONFIG_TYPE DnsConfigAdapterInfo = 8;
  static const DNS_CONFIG_TYPE DnsConfigPrimaryHostNameRegistrationEnabled = 9;
  static const DNS_CONFIG_TYPE DnsConfigAdapterHostNameRegistrationEnabled = 10;
  static const DNS_CONFIG_TYPE DnsConfigAddressRegistrationMaxCount = 11;
  static const DNS_CONFIG_TYPE DnsConfigHostName_W = 12;
  static const DNS_CONFIG_TYPE DnsConfigHostName_A = 13;
  static const DNS_CONFIG_TYPE DnsConfigHostName_UTF8 = 14;
  static const DNS_CONFIG_TYPE DnsConfigFullHostName_W = 15;
  static const DNS_CONFIG_TYPE DnsConfigFullHostName_A = 16;
  static const DNS_CONFIG_TYPE DnsConfigFullHostName_UTF8 = 17;
  typedef DWORD DnsConfigFlags; //Alias
  typedef DWORD DnsUpdateFlags; //Alias
  typedef UINT DNS_CHARSET; //Alias
  static const DNS_CHARSET DnsCharSetUnknown = 0;
  static const DNS_CHARSET DnsCharSetUnicode = 1;
  static const DNS_CHARSET DnsCharSetUtf8 = 2;
  static const DNS_CHARSET DnsCharSetAnsi = 3;
  DNS_STATUS  DnsAcquireContextHandle_(       BOOL CredentialFlags, PVOID Credentials, PHANDLE pContext);
  DNS_STATUS  DnsExtractRecordsFromMessage_W( PDNS_MESSAGE_BUFFER pDnsBuffer, WORD wMessageLength, PDNS_RECORD* ppRecord);
  void        DnsFree(                        PVOID pData, DNS_FREE_TYPE FreeType);
  void        DnsFreeProxyName(               PWSTR proxyName);
  DNS_STATUS  DnsGetProxyInformation(         PCWSTR hostName, DNS_PROXY_INFORMATION* proxyInformation, DNS_PROXY_INFORMATION* defaultProxyInformation, DNS_PROXY_COMPLETION_ROUTINE completionRoutine, void* completionContext);
  DNS_STATUS  DnsModifyRecordsInSet_(         PDNS_RECORD pAddRecords, PDNS_RECORD pDeleteRecords, DWORD Options, HANDLE hContext, PVOID pExtraList, PVOID pReserved);
  BOOL        DnsNameCompare_(                PCTSTR pName1, PCTSTR pName2);
  DNS_STATUS  DnsQuery_(                      PCTSTR lpstrName, DnsRecordType wType, DnsQueryOptions Options, PVOID pExtra, PDNS_RECORD* ppQueryResultsSet, PVOID* pReserved);
  DNS_STATUS  DnsQueryConfig(                 DNS_CONFIG_TYPE Config, DnsConfigFlags Flag, PCWSTR pwsAdapterName, PVOID pReserved, PVOID pBuffer, PDWORD pBufferLength);
  BOOL        DnsRecordCompare(               PDNS_RECORD pRecord1, PDNS_RECORD pRecord2);
  PDNS_RECORD DnsRecordCopyEx(                PDNS_RECORD pRecord, DNS_CHARSET CharSetIn, DNS_CHARSET CharSetOut);
  void        DnsRecordListFree(              PDNS_RECORD pRecordList, DNS_FREE_TYPE FreeType);
  BOOL        DnsRecordSetCompare(            PDNS_RECORD pRR1, PDNS_RECORD pRR2, PDNS_RECORD* ppDiff1, PDNS_RECORD* ppDiff2);
  PDNS_RECORD DnsRecordSetCopyEx(             PDNS_RECORD pRecordSet, DNS_CHARSET CharSetIn, DNS_CHARSET CharSetOut);
  PDNS_RECORD DnsRecordSetDetach(             PDNS_RECORD pRR);
  void        DnsReleaseContextHandle(        HANDLE ContextHandle);
  DNS_STATUS  DnsReplaceRecordSet(            PDNS_RECORD pNewSet, DnsUpdateFlags Options, HANDLE hContext, PVOID pExtraInfo, PVOID pReserved);
  DNS_STATUS  DnsValidateName_(               PCTSTR pszName, DNS_NAME_FORMAT Format);
  BOOL        DnsWriteQuestionToBuffer_W(     PDNS_MESSAGE_BUFFER pDnsBuffer, PDWORD pdwBufferSize, PCWSTR pszName, DnsRecordType wType, WORD Xid, BOOL fRecursionDesired);
]]
ffi.load( 'Dnsapi.dll' )

require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/snmp" )
local ffi = require( "ffi" )
ffi.cdef [[
  DWORD   SnmpSvcGetUptime(        );
  void    SnmpSvcSetLogLevel(      INT nLogLevel);
  void    SnmpSvcSetLogType(       INT nLogType);
  SNMPAPI SnmpUtilAsnAnyCpy(       AsnAny* pAnyDst, AsnAny* pAnySrc);
  void    SnmpUtilAsnAnyFree(      AsnAny* pAny);
  void    SnmpUtilDbgPrint(        INT nLogLevel, LPSTR szFormat);
  LPSTR   SnmpUtilIdsToA(          UINT* Ids, UINT IdLength);
  LPVOID  SnmpUtilMemAlloc(        UINT nBytes);
  void    SnmpUtilMemFree(         LPVOID pMem);
  LPVOID  SnmpUtilMemReAlloc(      LPVOID pMem, UINT nBytes);
  SNMPAPI SnmpUtilOctetsCmp(       AsnOctetString* pOctets1, AsnOctetString* pOctets2);
  SNMPAPI SnmpUtilOctetsCpy(       AsnOctetString* pOctetsDst, AsnOctetString* pOctetsSrc);
  void    SnmpUtilOctetsFree(      AsnOctetString* pOctets);
  SNMPAPI SnmpUtilOctetsNCmp(      AsnOctetString* pOctets1, AsnOctetString* pOctets2, UINT nChars);
  SNMPAPI SnmpUtilOidAppend(       AsnObjectIdentifier* pOidDst, AsnObjectIdentifier* pOidSrc);
  SNMPAPI SnmpUtilOidCmp(          AsnObjectIdentifier* pOid1, AsnObjectIdentifier* pOid2);
  SNMPAPI SnmpUtilOidCpy(          AsnObjectIdentifier* pOidDst, AsnObjectIdentifier* pOidSrc);
  void    SnmpUtilOidFree(         AsnObjectIdentifier* pOid);
  SNMPAPI SnmpUtilOidNCmp(         AsnObjectIdentifier* pOid1, AsnObjectIdentifier* pOid2, UINT nSubIds);
  LPSTR   SnmpUtilOidToA(          AsnObjectIdentifier* Oid);
  void    SnmpUtilPrintAsnAny(     AsnAny* pAny);
  void    SnmpUtilPrintOid(        AsnObjectIdentifier* Oid);
  SNMPAPI SnmpUtilVarBindCpy(      SnmpVarBind* pVbDst, SnmpVarBind* pVbSrc);
  SNMPAPI SnmpUtilVarBindListCpy(  SnmpVarBindList* pVblDst, SnmpVarBindList* pVblSrc);
  void    SnmpUtilVarBindFree(     SnmpVarBind* pVb);
  void    SnmpUtilVarBindListFree( SnmpVarBindList* pVbl);
]]
return ffi.load( "Snmpapi.dll" )

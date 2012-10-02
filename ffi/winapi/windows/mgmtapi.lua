require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/snmp' )
local ffi = require( 'ffi' )
ffi.cdef [[
  BOOL               SnmpMgrClose(      LPSNMP_MGR_SESSION session);
  BOOL               SnmpMgrCtl(        LPSNMP_MGR_SESSION session, DWORD dwCtlCode, LPVOID lpvInBuffer, DWORD cbInBuffer, LPVOID lpvOutBuffer, DWORD cbOutBuffer, LPDWORD lpcbBytesReturned);
  BOOL               SnmpMgrGetTrap(    AsnObjectIdentifier* enterprise, AsnNetworkAddress* IPAddress, AsnInteger* genericTrap, AsnInteger* specificTrap, AsnTimeticks* timeStamp, SnmpVarBindList* variableBindings);
  BOOL               SnmpMgrGetTrapEx(  AsnObjectIdentifier* enterprise, AsnNetworkAddress* agentAddress, AsnNetworkAddress* sourceAddress, AsnInteger* genericTrap, AsnInteger* specificTrap, AsnOctetString* community, AsnTimeticks* timeStamp, SnmpVarBindList* variableBindings);
  BOOL               SnmpMgrOidToStr(   AsnObjectIdentifier* oid, LPSTR* string);
  LPSNMP_MGR_SESSION SnmpMgrOpen(       LPSTR lpAgentAddress, LPSTR lpAgentCommunity, INT nTimeOut, INT nRetries);
  SNMPAPI            SnmpMgrRequest(    LPSNMP_MGR_SESSION session, BYTE requestType, SnmpVarBindList* variableBindings, AsnInteger* errorStatus, AsnInteger* errorIndex);
  BOOL               SnmpMgrStrToOid(   LPSTR string, AsnObjectIdentifier* oid);
  BOOL               SnmpMgrTrapListen( HANDLE* phTrapAvailable);
]]
return ffi.load( 'Mgmtapi.dll' )

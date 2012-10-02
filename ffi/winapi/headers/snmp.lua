require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef INT SNMPAPI; //Alias
  typedef PVOID LPSNMP_MGR_SESSION; //Alias
  typedef LONG AsnInteger; //Alias
  typedef ULONG AsnTimeticks; //Alias
  typedef LONG AsnInteger32; //Alias
  typedef ULONG AsnUnsigned32; //Alias
  typedef ULARGE_INTEGER AsnCounter64; //Alias
  typedef AsnUnsigned32 AsnCounter32; //Alias
  typedef AsnUnsigned32 AsnGauge32; //Alias
  typedef struct AsnObjectIdentifier {
    UINT idLength,
    UINT* ids,
  } AsnObjectIdentifier;
  typedef AsnObjectIdentifier AsnObjectName; //Alias
  typedef struct AsnOctetString {
    BYTE* stream,
    UINT length,
    BOOL dynamic,
  } AsnOctetString;
  typedef AsnOctetString AsnNetworkAddress; //Alias
  typedef AsnOctetString AsnBits; //Alias
  typedef AsnOctetString AsnSequence; //Alias
  typedef AsnOctetString AsnIPAddress; //Alias
  typedef AsnOctetString AsnOpaque; //Alias
  typedef enum WINAPI_ASN_TYPE {
    ASN_INTEGER = 0x02,
    ASN_BITS = 0x03,
    ASN_OCTETSTRING = 0x04,
    ASN_NULL = 0x05,
    ASN_OBJECTIDENTIFIER = 0x06,
    ASN_SEQUENCE = 0x30,
    ASN_IPADDRESS = 0x40,
    ASN_COUNTER32 = 0x41,
    ASN_GAUGE32 = 0x42,
    ASN_TIMETICKS = 0x43,
    ASN_OPAQUE = 0x44,
    ASN_COUNTER64 = 0x46,
    ASN_UINTEGER32 = 0x47,
    SNMP_EXCEPTION_NOSUCHOBJECT = 0x80,
    SNMP_EXCEPTION_NOSUCHINSTANCE = 0x81,
    SNMP_EXCEPTION_ENDOFMIBVIEW = 0x82,
  } WINAPI_ASN_TYPE;
  typedef union WINAPI_AsnAny_u {
    AsnInteger32 number,
    AsnUnsigned32 unsigned32,
    AsnCounter64 counter64,
    AsnOctetString string,
    AsnBits bits,
    AsnObjectIdentifier object,
    AsnSequence sequence,
    AsnIPAddress address,
    AsnCounter32 counter,
    AsnGauge32 gauge,
    AsnTimeticks ticks,
    AsnOpaque arbitrary,
  } WINAPI_AsnAny_u;
  typedef struct AsnAny {
    WINAPI_ASN_TYPE asnType,
    WINAPI_AsnAny_u asnValue,
  } AsnAny;
  typedef AsnAny AsnObjectSyntax; //Alias
  typedef struct SnmpVarBind {
    AsnObjectName name,
    AsnObjectSyntax value,
  } SnmpVarBind;
  typedef struct SnmpVarBindList {
    SnmpVarBind* list,
    UINT len,
  } SnmpVarBindList;
]]

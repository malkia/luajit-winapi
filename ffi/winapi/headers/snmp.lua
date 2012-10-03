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
# pragma pack( push, 4 )
  typedef struct AsnObjectIdentifier {
    UINT idLength;
    UINT* ids;
  } AsnObjectIdentifier;
# pragma pack( pop )
  typedef AsnObjectIdentifier AsnObjectName; //Alias
# pragma pack( push, 4 )
  typedef struct AsnOctetString {
    BYTE* stream;
    UINT length;
    BOOL dynamic;
  } AsnOctetString;
# pragma pack( pop )
  typedef AsnOctetString AsnNetworkAddress; //Alias
  typedef AsnOctetString AsnBits; //Alias
  typedef AsnOctetString AsnSequence; //Alias
  typedef AsnOctetString AsnIPAddress; //Alias
  typedef AsnOctetString AsnOpaque; //Alias
  typedef BYTE WINAPI_ASN_TYPE; //Alias
  static const BYTE ASN_INTEGER = 0x02;
  static const BYTE ASN_BITS = 0x03;
  static const BYTE ASN_OCTETSTRING = 0x04;
  static const BYTE ASN_NULL = 0x05;
  static const BYTE ASN_OBJECTIDENTIFIER = 0x06;
  static const BYTE ASN_SEQUENCE = 0x30;
  static const BYTE ASN_IPADDRESS = 0x40;
  static const BYTE ASN_COUNTER32 = 0x41;
  static const BYTE ASN_GAUGE32 = 0x42;
  static const BYTE ASN_TIMETICKS = 0x43;
  static const BYTE ASN_OPAQUE = 0x44;
  static const BYTE ASN_COUNTER64 = 0x46;
  static const BYTE ASN_UINTEGER32 = 0x47;
  static const BYTE SNMP_EXCEPTION_NOSUCHOBJECT = 0x80;
  static const BYTE SNMP_EXCEPTION_NOSUCHINSTANCE = 0x81;
  static const BYTE SNMP_EXCEPTION_ENDOFMIBVIEW = 0x82;
# pragma pack( push, 4 )
  typedef union WINAPI_AsnAny_u {
    AsnInteger32 number;
    AsnUnsigned32 unsigned32;
    AsnCounter64 counter64;
    AsnOctetString string;
    AsnBits bits;
    AsnObjectIdentifier object;
    AsnSequence sequence;
    AsnIPAddress address;
    AsnCounter32 counter;
    AsnGauge32 gauge;
    AsnTimeticks ticks;
    AsnOpaque arbitrary;
  } WINAPI_AsnAny_u;
# pragma pack( pop )
# pragma pack( push, 4 )
  typedef struct AsnAny {
    WINAPI_ASN_TYPE asnType;
    WINAPI_AsnAny_u asnValue;
  } AsnAny;
# pragma pack( pop )
  typedef AsnAny AsnObjectSyntax; //Alias
# pragma pack( push, 4 )
  typedef struct SnmpVarBind {
    AsnObjectName name;
    AsnObjectSyntax value;
  } SnmpVarBind;
# pragma pack( pop )
# pragma pack( push, 4 )
  typedef struct SnmpVarBindList {
    SnmpVarBind* list;
    UINT len;
  } SnmpVarBindList;
# pragma pack( pop )
]]

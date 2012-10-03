require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef UINT_PTR PRUword; //Alias
  typedef UINT PRUintn; //Alias
  typedef INT PRIntn; //Alias
  typedef UINT16 PRUint16; //Alias
  typedef UINT32 PRUint32; //Alias
  typedef BOOL PRBool; //Alias
  typedef INT8 PRInt8; //Alias
  typedef INT16 PRInt16; //Alias
  typedef INT32 PRInt32; //Alias
  typedef INT64 PRInt64; //Alias
  typedef double PRFloat64; //Alias
  typedef size_t PRSize; //Alias
  typedef LPVOID PRThreadPrivateDTOR; //Alias
  typedef PRInt32 PROffset32; //Alias
  typedef PRInt64 PROffset64; //Alias
  typedef PRInt64 PRTime; //Alias
  typedef LPVOID PRTimeParamFn; //Alias
  typedef LPVOID SSLHandshakeCallback; //Alias
  typedef ULONG CK_OBJECT_HANDLE; //Alias
  typedef LPVOID SSLGetClientAuthData; //Alias
  typedef LPVOID SSLBadCertHandler; //Alias
  typedef LPVOID SSLAuthCertificate; //Alias
  typedef PRInt32 PRErrorCode; //Alias
  typedef struct PLArena {
    LPVOID next;
    PRUword base;
    PRUword limit;
    PRUword avail;
  } PLArena;
  typedef struct PLArenaStats {
    LPVOID next;
    char* name;
    PRUint32 narenas;
    PRUint32 nallocs;
    PRUint32 nreclaims;
    PRUint32 nmallocs;
    PRUint32 ndeallocs;
    PRUint32 ngrows;
    PRUint32 ninplace;
    PRUint32 nreleases;
    PRUint32 nfastrels;
    PRUint32 nbytes;
    PRUint32 maxalloc;
    PRFloat64 variance;
  } PLArenaStats;
  typedef struct PLArenaPool {
    PLArena first;
    PLArena* current;
    PRUint32 arenasize;
    PRUword mask;
    PLArenaStats stats;
  } PLArenaPool;
  typedef UINT KeyType; //Alias
  static const UINT nullKey = 0;
  static const UINT rsaKey = 1;
  static const UINT dsaKey = 2;
  static const UINT fortezzaKey = 3;
  static const UINT dhKey = 4;
  static const UINT keaKey = 5;
  static const UINT ecKey = 6;
  static const UINT rsaPssKey = 7;
  static const UINT rsaOaepKey = 8;
  typedef struct SECKEYPrivateKeyStr {
    PLArenaPool* arena;
    KeyType keyType;
    PK11SlotInfo* pkcs11Slot;
    CK_OBJECT_HANDLE pkcs11ID;
    PRBool pkcs11IsTemp;
    void* wincx;
    PRUint32 staticflags;
  } SECKEYPrivateKeyStr;
  typedef SECKEYPrivateKeyStr SECKEYPrivateKey; //Alias
  typedef UINT SECItemType; //Alias
  static const UINT siBuffer = 0;
  static const UINT siClearDataBuffer = 1;
  static const UINT siCipherDataBuffer = 2;
  static const UINT siDERCertBuffer = 3;
  static const UINT siEncodedCertBuffer = 4;
  static const UINT siDERNameBuffer = 5;
  static const UINT siEncodedNameBuffer = 6;
  static const UINT siAsciiNameString = 7;
  static const UINT siAsciiString = 8;
  static const UINT siDEROID = 9;
  static const UINT siUnsignedInteger = 10;
  static const UINT siUTCTime = 11;
  static const UINT siGeneralizedTime = 12;
  static const UINT siVisibleString = 13;
  static const UINT siUTF8String = 14;
  static const UINT siBMPString = 15;
  typedef struct SECItem {
    SECItemType type;
    unsigned char* data;
    unsigned int len;
  } SECItem;
  typedef struct CERTDistNamesStr {
    PLArenaPool* arena;
    int nnames;
    SECItem* names;
    void* head;
  } CERTDistNamesStr;
  typedef UINT PRFileType; //Alias
  static const UINT PR_FILE_FILE = 1;
  static const UINT PR_FILE_DIRECTORY = 2;
  static const UINT PR_FILE_OTHER = 3;
  typedef struct PRFileInfo {
    PRFileType type;
    PROffset32 size;
    PRTime creationTime;
    PRTime modifyTime;
  } PRFileInfo;
  typedef struct PRFileInfo64 {
    PRFileType type;
    PROffset64 size;
    PRTime creationTime;
    PRTime modifyTime;
  } PRFileInfo64;
  typedef struct PRIOVec {
    void* iov_base;
    int iov_len;
  } PRIOVec;
  typedef struct PRDirEntry {
    WINAPI_char* name;
  } PRDirEntry;
  typedef PRUint16 WINAPI_PRPollDesc_Flags; //Alias
  typedef struct PRPollDesc {
    PRFileDesc* fd;
    WINAPI_PRPollDesc_Flags in_flags;
    WINAPI_PRPollDesc_Flags out_flags;
  } PRPollDesc;
  typedef struct PRHostEnt {
    char* h_name;
    char** h_aliases;
    PRInt16 h_addrtype;
    PRInt16 h_length;
    char** h_addr_list;
  } PRHostEnt;
  typedef struct PRProtoEnt {
    char* p_name;
    char** p_aliases;
    PRInt16 p_num;
  } PRProtoEnt;
  typedef int PRStatus; //Alias
  static const int PR_FAILURE = -1;
  static const int PR_SUCCESS = 0;
  typedef int SECStatus; //Alias
  static const int SECWouldBlock = -2;
  static const int SECFailure = -1;
  static const int SECSuccess = 0;
  typedef int SSLKEAType; //Alias
  static const int ssl_kea_null = 0;
  static const int ssl_kea_rsa = 1;
  static const int ssl_kea_dh = 2;
  static const int ssl_kea_fortezza = 3;
  static const int ssl_kea_ecdh = 4;
  static const int ssl_kea_size = 5;
  typedef UINT PRThreadType; //Alias
  static const UINT PR_USER_THREAD = 0;
  static const UINT PR_SYSTEM_THREAD = 1;
  typedef UINT PRThreadPriority; //Alias
  static const UINT PR_PRIORITY_LOW = 0;
  static const UINT PR_PRIORITY_NORMAL = 1;
  static const UINT PR_PRIORITY_HIGH = 2;
  static const UINT PR_PRIORITY_URGENT = 3;
  typedef UINT PRThreadScope; //Alias
  static const UINT PR_LOCAL_THREAD = 0;
  static const UINT PR_GLOBAL_THREAD = 1;
  static const UINT PR_GLOBAL_BOUND_THREAD = 2;
  typedef UINT PRThreadState; //Alias
  static const UINT PR_JOINABLE_THREAD = 0;
  static const UINT PR_UNJOINABLE_THREAD = 1;
  typedef UINT PRAccessHow; //Alias
  static const UINT PR_ACCESS_EXISTS = 1;
  static const UINT PR_ACCESS_WRITE_OK = 2;
  static const UINT PR_ACCESS_READ_OK = 3;
  typedef UINT PRSeekWhence; //Alias
  static const UINT PR_SEEK_SET = 0;
  static const UINT PR_SEEK_CUR = 1;
  static const UINT PR_SEEK_END = 2;
  typedef UINT PRDescType; //Alias
  static const UINT PR_DESC_FILE = 1;
  static const UINT PR_DESC_SOCKET_TCP = 2;
  static const UINT PR_DESC_SOCKET_UDP = 3;
  static const UINT PR_DESC_LAYERED = 4;
  static const UINT PR_DESC_PIPE = 5;
  typedef UINT PRDirFlags; //Alias
  typedef UINT PRShutdownHow; //Alias
  static const UINT PR_SHUTDOWN_RCV = 0;
  static const UINT PR_SHUTDOWN_SEND = 1;
  static const UINT PR_SHUTDOWN_BOTH = 2;
  typedef UINT PRTransmitFileFlags; //Alias
  static const UINT PR_TRANSMITFILE_KEEP_OPEN = 0x0;
  static const UINT PR_TRANSMITFILE_CLOSE_SOCKET = 0x1;
  typedef UINT PRFileMapProtect; //Alias
  static const UINT PR_PROT_READONLY = 0;
  static const UINT PR_PROT_READWRITE = 1;
  static const UINT PR_PROT_WRITECOPY = 2;
  typedef UINT PRNetAddrValue; //Alias
  static const UINT PR_IpAddrNull = 0;
  static const UINT PR_IpAddrAny = 1;
  static const UINT PR_IpAddrLoopback = 2;
  static const UINT PR_IpAddrV4Mapped = 3;
  typedef UINT PRIntervalTime; //Alias
  static const UINT PR_INTERVAL_NO_WAIT = 0;
  static const UINT PR_INTERVAL_NO_TIMEOUT = 0xffffffff;
  typedef UINT PRSpecialFD; //Alias
  static const UINT PR_StandardInput = 0;
  static const UINT PR_StandardOutput = 1;
  static const UINT PR_StandardError = 2;
  typedef PRIntn PRDescIdentity; //Alias
  static const PRIntn PR_NSPR_IO_LAYER = 0;
  static const PRIntn PR_INVALID_IO_LAYER = -1;
  static const PRIntn PR_TOP_IO_LAYER = -2;
  static const PRIntn PR_IO_LAYER_HEAD = -3;
  typedef struct PRTimeParameters {
    PRInt32 tp_gmt_offset;
    PRInt32 tp_dst_offset;
  } PRTimeParameters;
  typedef struct PRExplodedTime {
    PRInt32 tm_usec;
    PRInt32 tm_sec;
    PRInt32 tm_min;
    PRInt32 tm_hour;
    PRInt32 tm_mday;
    PRInt32 tm_month;
    PRInt16 tm_year;
    PRInt8 tm_wday;
    PRInt16 tm_yday;
    PRTimeParameters tm_params;
  } PRExplodedTime;
]]

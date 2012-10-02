require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID WINAPI_PRIOMethods*; //Alias
  typedef LPVOID PRSocketOptionData*; //Alias
  typedef LPVOID PRNetAddr*; //Alias
  typedef LPVOID WINAPI_PRNetAddr*; //Alias
  typedef LPVOID PRFileDesc*; //Alias
  typedef UINT_PTR PRUword; //Alias
  typedef LPVOID PK11SlotInfo*; //Alias
  typedef LPVOID CERTCertificateStr*; //Alias
  typedef LPVOID CERTCertificate*; //Alias
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
  typedef LPVOID PRThread*; //Alias
  typedef LPVOID PRThreadStack*; //Alias
  typedef LPVOID PRLibrary*; //Alias
  typedef LPVOID PRLock*; //Alias
  typedef LPVOID PRCondVar*; //Alias
  typedef LPVOID PRMonitor*; //Alias
  typedef LPVOID PRThreadPrivateDTOR; //Alias
  typedef PRInt32 PROffset32; //Alias
  typedef PRInt64 PROffset64; //Alias
  typedef PRInt64 PRTime; //Alias
  typedef LPVOID PRFileMap*; //Alias
  typedef LPVOID PRDir*; //Alias
  typedef LPVOID PRTimeParamFn; //Alias
  typedef LPVOID PRSharedMemory*; //Alias
  typedef LPVOID PRProcessAttr*; //Alias
  typedef LPVOID WINAPI_PRProcessAttr*; //Alias
  typedef LPVOID PRSem*; //Alias
  typedef LPVOID PRStack*; //Alias
  typedef LPVOID PRStackElem*; //Alias
  typedef LPVOID PRProcess*; //Alias
  typedef char** char* const*; //Alias
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
  typedef enum KeyType {
    nullKey = 0,
    rsaKey = 1,
    dsaKey = 2,
    fortezzaKey = 3,
    dhKey = 4,
    keaKey = 5,
    ecKey = 6,
    rsaPssKey = 7,
    rsaOaepKey = 8,
  } KeyType;
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
  typedef enum SECItemType {
    siBuffer = 0,
    siClearDataBuffer = 1,
    siCipherDataBuffer = 2,
    siDERCertBuffer = 3,
    siEncodedCertBuffer = 4,
    siDERNameBuffer = 5,
    siEncodedNameBuffer = 6,
    siAsciiNameString = 7,
    siAsciiString = 8,
    siDEROID = 9,
    siUnsignedInteger = 10,
    siUTCTime = 11,
    siGeneralizedTime = 12,
    siVisibleString = 13,
    siUTF8String = 14,
    siBMPString = 15,
  } SECItemType;
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
  typedef enum PRFileType {
    PR_FILE_FILE = 1,
    PR_FILE_DIRECTORY = 2,
    PR_FILE_OTHER = 3,
  } PRFileType;
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
  typedef PRPollDesc *WINAPI_PRPollDesc*; //Pointer
  typedef struct PRHostEnt {
    char* h_name;
    char** h_aliases;
    PRInt16 h_addrtype;
    PRInt16 h_length;
    char** h_addr_list;
  } PRHostEnt;
  typedef PRHostEnt *WINAPI_PRHostEnt*; //Pointer
  typedef struct PRProtoEnt {
    char* p_name;
    char** p_aliases;
    PRInt16 p_num;
  } PRProtoEnt;
  typedef enum PRStatus {
    PR_FAILURE = -1,
    PR_SUCCESS = 0,
  } PRStatus;
  typedef enum SECStatus {
    SECWouldBlock = -2,
    SECFailure = -1,
    SECSuccess = 0,
  } SECStatus;
  typedef enum SSLKEAType {
    ssl_kea_null = 0,
    ssl_kea_rsa = 1,
    ssl_kea_dh = 2,
    ssl_kea_fortezza = 3,
    ssl_kea_ecdh = 4,
    ssl_kea_size = 5,
  } SSLKEAType;
  typedef enum PRThreadType {
    PR_USER_THREAD = 0,
    PR_SYSTEM_THREAD = 1,
  } PRThreadType;
  typedef enum PRThreadPriority {
    PR_PRIORITY_LOW = 0,
    PR_PRIORITY_NORMAL = 1,
    PR_PRIORITY_HIGH = 2,
    PR_PRIORITY_URGENT = 3,
  } PRThreadPriority;
  typedef enum PRThreadScope {
    PR_LOCAL_THREAD = 0,
    PR_GLOBAL_THREAD = 1,
    PR_GLOBAL_BOUND_THREAD = 2,
  } PRThreadScope;
  typedef enum PRThreadState {
    PR_JOINABLE_THREAD = 0,
    PR_UNJOINABLE_THREAD = 1,
  } PRThreadState;
  typedef enum PRAccessHow {
    PR_ACCESS_EXISTS = 1,
    PR_ACCESS_WRITE_OK = 2,
    PR_ACCESS_READ_OK = 3,
  } PRAccessHow;
  typedef enum PRSeekWhence {
    PR_SEEK_SET = 0,
    PR_SEEK_CUR = 1,
    PR_SEEK_END = 2,
  } PRSeekWhence;
  typedef enum PRDescType {
    PR_DESC_FILE = 1,
    PR_DESC_SOCKET_TCP = 2,
    PR_DESC_SOCKET_UDP = 3,
    PR_DESC_LAYERED = 4,
    PR_DESC_PIPE = 5,
  } PRDescType;
  typedef UINT PRDirFlags; //Alias
  typedef enum PRShutdownHow {
    PR_SHUTDOWN_RCV = 0,
    PR_SHUTDOWN_SEND = 1,
    PR_SHUTDOWN_BOTH = 2,
  } PRShutdownHow;
  typedef enum PRTransmitFileFlags {
    PR_TRANSMITFILE_KEEP_OPEN = 0x0,
    PR_TRANSMITFILE_CLOSE_SOCKET = 0x1,
  } PRTransmitFileFlags;
  typedef enum PRFileMapProtect {
    PR_PROT_READONLY = 0,
    PR_PROT_READWRITE = 1,
    PR_PROT_WRITECOPY = 2,
  } PRFileMapProtect;
  typedef enum PRNetAddrValue {
    PR_IpAddrNull = 0,
    PR_IpAddrAny = 1,
    PR_IpAddrLoopback = 2,
    PR_IpAddrV4Mapped = 3,
  } PRNetAddrValue;
  typedef enum PRIntervalTime {
    PR_INTERVAL_NO_WAIT = 0,
    PR_INTERVAL_NO_TIMEOUT = 0xffffffff,
  } PRIntervalTime;
  typedef enum PRSpecialFD {
    PR_StandardInput = 0,
    PR_StandardOutput = 1,
    PR_StandardError = 2,
  } PRSpecialFD;
  typedef enum PRDescIdentity {
    PR_NSPR_IO_LAYER = 0,
    PR_INVALID_IO_LAYER = -1,
    PR_TOP_IO_LAYER = -2,
    PR_IO_LAYER_HEAD = -3,
  } PRDescIdentity;
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
  typedef PRExplodedTime *WINAPI_PRExplodedTime*; //Pointer
]]

local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* HMODULE; //ModuleHandle
  typedef void VOID; //Alias
  typedef VOID *LPVOID; //Pointer
  typedef LPVOID LPCVOID; //Alias
  typedef LPVOID PVOID; //Alias
  typedef LPVOID VOID*; //Alias
  typedef LPVOID PCVOID; //Alias
  typedef VOID* WINAPI_VOID*; //Alias
  typedef PVOID WINAPI_PVOID; //Alias
  typedef VOID* WINAPI_VOID*; //Alias
  typedef void* WINAPI_void*; //Alias
  typedef void* *WINAPI_void**; //Pointer
  typedef void* WINAPI_void*; //Alias
  typedef LPVOID WINAPI_LPVOID_char*; //Alias
  typedef uint64_t PVOID64; //Integer
  typedef uint8_t BYTE; //Integer
  typedef BYTE WINAPI_BYTE; //Alias
  typedef BYTE *LPBYTE; //Pointer
  typedef LPBYTE BYTE*; //Alias
  typedef LPBYTE PBYTE; //Alias
  typedef PBYTE WINAPI_PBYTE; //Alias
  typedef PBYTE WINAPI_PBYTE; //Alias
  typedef BYTE* WINAPI_BYTE*; //Alias
  typedef BYTE* *WINAPI_BYTE**; //Pointer
  typedef LPBYTE LPCBYTE; //Alias
  typedef LPBYTE WINAPI_LPBYTE; //Alias
  typedef BYTE byte; //Alias
  typedef byte *WINAPI_byte*; //Pointer
  typedef uint8_t UCHAR; //Integer
  typedef UCHAR *PUCHAR; //Pointer
  typedef UCHAR unsigned char; //Alias
  typedef uint8_t UINT8; //Integer
  typedef UINT8 *PUINT8; //Pointer
  typedef int8_t INT8; //Integer
  typedef int16_t INT16; //Integer
  typedef uint16_t UINT16; //Integer
  typedef UINT16 WORD; //Alias
  typedef WORD *PWORD; //Pointer
  typedef WORD* WINAPI_WORD*; //Alias
  typedef WORD* LPWORD; //Alias
  typedef UINT16 USHORT; //Alias
  typedef USHORT *PUSHORT; //Pointer
  typedef PUSHORT USHORT*; //Alias
  typedef PUSHORT WINAPI_USHORT*; //Alias
  typedef USHORT unsigned short; //Alias
  typedef USHORT u_short; //Alias
  typedef PUSHORT u_short*; //Alias
  typedef int16_t SHORT; //Integer
  typedef SHORT short; //Alias
  typedef UINT_PTR *PUINT_PTR; //Pointer
  typedef UINT_PTR ULONG_PTR; //Alias
  typedef ULONG_PTR* PULONG_PTR; //Alias
  typedef ULONG_PTR* WINAPI_ULONG_PTR*; //Alias
  typedef ULONG_PTR DWORD_PTR; //Alias
  typedef DWORD_PTR* PDWORD_PTR; //Alias
  typedef INT_PTR LONG_PTR; //Alias
  typedef int32_t BOOL; //Integer
  const   int32_t BOOL_TRUE = 1;
  const   int32_t BOOL_FALSE = 0;
  typedef BOOL *PBOOL; //Pointer
  typedef PBOOL LPBOOL; //Alias
  typedef BOOL bool; //Alias
  typedef BOOL Bool; //Alias
  typedef BOOL WINAPI_BOOL; //Alias
  typedef BOOL* WINAPI_BOOL*; //Alias
  typedef BOOL BOOLAPI; //Alias
  typedef int8_t BOOLEAN; //Integer
  const   int8_t BOOLEAN_TRUE = 1;
  const   int8_t BOOLEAN_FALSE = 0;
  typedef BOOLEAN *PBOOLEAN; //Pointer
  typedef uint32_t UINT32; //Integer
  typedef UINT32 *PUINT32; //Pointer
  typedef UINT32 unsigned long; //Alias
  typedef unsigned long WINAPI_unsigned long; //Alias
  typedef UINT32 u_long; //Alias
  typedef UINT32 ULONG; //Alias
  typedef ULONG *PULONG; //Pointer
  typedef UINT32 Ulong; //Alias
  typedef UINT32 UINT; //Alias
  typedef UINT *PUINT; //Pointer
  typedef PUINT UINT*; //Alias
  typedef UINT* WINAPI_UINT*; //Alias
  typedef UINT unsigned int; //Alias
  typedef PUINT unsigned int*; //Alias
  typedef PUINT LPUINT; //Alias
  typedef ULONG ULONG32; //Alias
  typedef int32_t INT32; //Integer
  typedef INT32 long; //Alias
  typedef long LONG; //Alias
  typedef LONG* PLONG; //Alias
  typedef LONG* LPLONG; //Alias
  typedef LONG* LONG volatile*; //Alias
  typedef INT32 int; //Alias
  typedef int INT; //Alias
  typedef int* WINAPI_int*; //Alias
  typedef int* WINAPI_int*; //Alias
  typedef INT* WINAPI_INT*; //Alias
  typedef INT *PINT; //Pointer
  typedef PINT LPINT; //Alias
  typedef LPINT WINAPI_LPINT; //Alias
  typedef int signed int; //Alias
  typedef INT32 __int32; //Alias
  typedef int64_t INT64; //Integer
  typedef INT64 LONGLONG; //Alias
  typedef LONGLONG* LONGLONG volatile*; //Alias
  typedef LONGLONG *PLONGLONG; //Pointer
  typedef INT64 LONG64; //Alias
  typedef LONG64 *PLONG64; //Pointer
  typedef INT64 __int64; //Alias
  typedef uint64_t UINT64; //Integer
  typedef UINT64 *PUINT64; //Pointer
  typedef UINT64 ULONGLONG; //Alias
  typedef ULONGLONG *PULONGLONG; //Pointer
  typedef UINT64 ULONG64; //Alias
  typedef ULONG64 *PULONG64; //Pointer
  typedef UINT64 DWORD64; //Alias
  typedef DWORD64 *PDWORD64; //Pointer
  typedef ULONGLONG DWORDLONG; //Alias
  typedef UINT64 unsigned __int64; //Alias
  typedef uint32_t DWORD; //Integer
  typedef DWORD *PDWORD; //Pointer
  typedef PDWORD DWORD*; //Alias
  typedef PDWORD LPDWORD; //Alias
  typedef PDWORD WINAPI_DWORD*; //Alias
  typedef DWORD* WINAPI_DWORD*; //Alias
  typedef DWORD* DWORD const*; //Alias
  typedef char CHAR;  typedef CHAR *LPSTR; //Pointer
  typedef LPSTR LPCSTR; //Alias
  typedef LPSTR PCSTR; //Alias
  typedef LPSTR PSTR; //Alias
  typedef LPSTR PCHAR; //Alias
  typedef CHAR char; //Alias
  typedef char* WINAPI_char*; //Alias
  typedef PCHAR WINAPI_PCHAR; //Alias
  typedef wchar_t WCHAR;  typedef WCHAR *LPWSTR; //Pointer
  typedef LPWSTR PWSTR; //Alias
  typedef PWSTR PCWSTR; //Alias
  typedef PWSTR LPCWSTR; //Alias
  typedef LPCWSTR *WINAPI_LPCWSTR*; //Pointer
  typedef PWSTR WINAPI_WCHAR*; //Alias
  typedef PWSTR WINAPI_WCHAR*; //Alias
  typedef PWSTR WCHAR*; //Alias
  typedef PWSTR WINAPI_PWSTR; //Alias
  typedef PWSTR PWCHAR; //Alias
  typedef PWSTR* PCWSTR*; //Alias
  typedef WCHAR* WCHAR const*; //Alias
  typedef WCHAR wchar_t; //Alias
  typedef wchar_t *WINAPI_wchar_t*; //Pointer
  typedef char TCHAR;  typedef TCHAR *LPTSTR; //Pointer
  typedef LPTSTR LPCTSTR; //Alias
  typedef LPTSTR PTSTR; //Alias
  typedef LPTSTR WINAPI_PCTSTR; //Alias
  typedef LPTSTR tchar*; //Alias
  typedef LPTSTR PCTSTR; //Alias
  typedef LPTSTR TCHAR*; //Alias
  typedef LPTSTR PTCHAR; //Alias
  typedef LPTSTR LPTCH; //Alias
  typedef LPTSTR LPCTCH; //Alias
  typedef INT_PTR size_t; //Alias
  typedef size_t SIZE_T; //Alias
  typedef SIZE_T* PSIZE_T; //Alias
  typedef INT64 time_t; //Alias
  typedef time_t *WINAPI_time_t*; //Pointer
  typedef float FLOAT; //Alias
  typedef FLOAT *PFLOAT; //Pointer
  typedef float* WINAPI_float*; //Alias
  typedef FLOAT *WINAPI_FLOAT*; //Pointer
  typedef float WINAPI_float; //Alias
  typedef double DOUBLE; //Alias
  typedef LPVOID va_list; //Alias
  typedef CHAR CHAR [14]; //Array 14
  typedef CHAR CHAR [MAX_PATH]; //Array 260
  typedef WCHAR WCHAR [1]; //Array 1
  typedef WCHAR WCHAR [14]; //Array 14
  typedef WCHAR WCHAR [128]; //Array 128
  typedef WCHAR WCHAR [256]; //Array 256
  typedef WCHAR WCHAR [MAX_PATH]; //Array 260
  typedef TCHAR TCHAR [ANYSIZE_ARRAY]; //Array 1
  typedef TCHAR TCHAR [14]; //Array 14
  typedef TCHAR TCHAR [32]; //Array 32
  typedef TCHAR TCHAR [64]; //Array 64
  typedef TCHAR TCHAR [128]; //Array 128
  typedef TCHAR TCHAR [256]; //Array 256
  typedef TCHAR TCHAR [MAX_PATH]; //Array 260
  typedef TCHAR TCHAR [MAX_PATH + 1]; //Array 261
  typedef UCHAR UCHAR [1]; //Array 1
  typedef UCHAR UCHAR [2]; //Array 2
  typedef UCHAR UCHAR [16]; //Array 16
  typedef UCHAR UCHAR [24]; //Array 24
  typedef DWORD DWORD [1]; //Array 1
  typedef DWORD DWORD [2]; //Array 2
  typedef DWORD DWORD [3]; //Array 3
  typedef DWORD DWORD [4]; //Array 4
  typedef BYTE BYTE [1]; //Array 1
  typedef BYTE BYTE [ANYSIZE_ARRAY]; //Array 1
  typedef BYTE BYTE [2]; //Array 2
  typedef BYTE BYTE [6]; //Array 6
  typedef BYTE BYTE [8]; //Array 8
  typedef BYTE BYTE [16]; //Array 16
  typedef ULONG ULONG [2]; //Array 2
  typedef ULONG ULONG [4]; //Array 4
  typedef float float [4]; //Array 4
  typedef ULONG64 ULONG64 [2]; //Array 2
  typedef ULONG64 ULONG64 [4]; //Array 4
  typedef USHORT USHORT [8]; //Array 8
  typedef WORD WORD [256]; //Array 256
  typedef char char [260]; //Array 260
  typedef union Stack {
    UINT_PTR uintp;
    INT_PTR intp;
    LPSTR psz;
    LPWSTR pwsz;
    LPVOID* ppv;
  } Stack;
]]

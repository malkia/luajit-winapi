local ffi = require( 'ffi' )
ffi.cdef [[
]]
if ffi.arch == 'x86' then ffi.cdef[[
  typedef int32_t INT_PTR; //Integer
]]
end
ffi.cdef[[
]]
if ffi.arch == 'x86' then ffi.cdef[[
  typedef uint32_t UINT_PTR; //Integer
]]
end
ffi.cdef[[
]]
if ffi.arch == 'x64' then ffi.cdef[[
  typedef int64_t INT_PTR; //Integer
]]
end
ffi.cdef[[
]]
if ffi.arch == 'x64' then ffi.cdef[[
  typedef uint64_t UINT_PTR; //Integer
]]
end
ffi.cdef[[
  typedef void* HMODULE; //ModuleHandle
  typedef void VOID; //Alias
  typedef VOID *LPVOID; //Pointer
  typedef LPVOID LPCVOID; //Alias
  typedef LPVOID PVOID; //Alias
//typedef LPVOID VOID*; //Alias
  typedef LPVOID PCVOID; //Alias
//typedef VOID* VOID*; //Alias
//typedef PVOID PVOID; //Alias
//typedef VOID* VOID*; //Alias
//typedef void* void*; //Alias
//typedef void* void*; //Alias
//typedef LPVOID WINAPI_LPVOID_char*; //Alias
  typedef uint64_t PVOID64; //Integer
  typedef uint8_t BYTE; //Integer
//typedef BYTE BYTE; //Alias
  typedef BYTE *LPBYTE; //Pointer
//typedef LPBYTE BYTE*; //Alias
  typedef LPBYTE PBYTE; //Alias
//typedef PBYTE PBYTE; //Alias
//typedef PBYTE PBYTE; //Alias
//typedef BYTE* BYTE*; //Alias
  typedef LPBYTE LPCBYTE; //Alias
//typedef LPBYTE LPBYTE; //Alias
  typedef BYTE byte; //Alias
  typedef uint8_t UCHAR; //Integer
  typedef UCHAR *PUCHAR; //Pointer
//typedef UCHAR unsigned char; //Alias
  typedef uint8_t UINT8; //Integer
  typedef UINT8 *PUINT8; //Pointer
  typedef int8_t INT8; //Integer
  typedef int16_t INT16; //Integer
  typedef uint16_t UINT16; //Integer
  typedef UINT16 WORD; //Alias
  typedef WORD *PWORD; //Pointer
//typedef WORD* WORD*; //Alias
  typedef WORD* LPWORD; //Alias
  typedef UINT16 USHORT; //Alias
  typedef USHORT *PUSHORT; //Pointer
//typedef PUSHORT USHORT*; //Alias
//typedef PUSHORT USHORT*; //Alias
//typedef USHORT unsigned short; //Alias
  typedef USHORT u_short; //Alias
//typedef PUSHORT u_short*; //Alias
  typedef int16_t SHORT; //Integer
//typedef SHORT short; //Alias
  typedef UINT_PTR *PUINT_PTR; //Pointer
  typedef UINT_PTR ULONG_PTR; //Alias
  typedef ULONG_PTR* PULONG_PTR; //Alias
//typedef ULONG_PTR* ULONG_PTR*; //Alias
  typedef ULONG_PTR DWORD_PTR; //Alias
  typedef DWORD_PTR* PDWORD_PTR; //Alias
  typedef INT_PTR LONG_PTR; //Alias
  typedef int32_t BOOL; //Integer
  static const BOOL BOOL_TRUE = 1;
  static const BOOL BOOL_FALSE = 0;
  typedef BOOL *PBOOL; //Pointer
  typedef PBOOL LPBOOL; //Alias
//typedef BOOL bool; //Alias
  typedef BOOL Bool; //Alias
//typedef BOOL BOOL; //Alias
//typedef BOOL* BOOL*; //Alias
  typedef BOOL BOOLAPI; //Alias
  typedef int8_t BOOLEAN; //Integer
  static const BOOLEAN BOOLEAN_TRUE = 1;
  static const BOOLEAN BOOLEAN_FALSE = 0;
  typedef BOOLEAN *PBOOLEAN; //Pointer
  typedef uint32_t UINT32; //Integer
  typedef UINT32 *PUINT32; //Pointer
//typedef UINT32 unsigned long; //Alias
//typedef unsigned long unsigned long; //Alias
  typedef UINT32 u_long; //Alias
  typedef UINT32 ULONG; //Alias
  typedef ULONG *PULONG; //Pointer
  typedef UINT32 Ulong; //Alias
  typedef UINT32 UINT; //Alias
  typedef UINT *PUINT; //Pointer
//typedef PUINT UINT*; //Alias
//typedef UINT* UINT*; //Alias
//typedef UINT unsigned int; //Alias
//typedef PUINT unsigned int*; //Alias
  typedef PUINT LPUINT; //Alias
  typedef ULONG ULONG32; //Alias
  typedef int32_t INT32; //Integer
//typedef INT32 long; //Alias
  typedef long LONG; //Alias
  typedef LONG* PLONG; //Alias
  typedef LONG* LPLONG; //Alias
//typedef LONG* LONG volatile*; //Alias
//typedef INT32 int; //Alias
  typedef int INT; //Alias
//typedef int* int*; //Alias
//typedef int* int*; //Alias
//typedef INT* INT*; //Alias
  typedef INT *PINT; //Pointer
  typedef PINT LPINT; //Alias
//typedef LPINT LPINT; //Alias
//typedef int signed int; //Alias
//typedef INT32 __int32; //Alias
  typedef int64_t INT64; //Integer
  typedef INT64 LONGLONG; //Alias
//typedef LONGLONG* LONGLONG volatile*; //Alias
  typedef LONGLONG *PLONGLONG; //Pointer
  typedef INT64 LONG64; //Alias
  typedef LONG64 *PLONG64; //Pointer
//typedef INT64 __int64; //Alias
  typedef uint64_t UINT64; //Integer
  typedef UINT64 *PUINT64; //Pointer
  typedef UINT64 ULONGLONG; //Alias
  typedef ULONGLONG *PULONGLONG; //Pointer
  typedef UINT64 ULONG64; //Alias
  typedef ULONG64 *PULONG64; //Pointer
  typedef UINT64 DWORD64; //Alias
  typedef DWORD64 *PDWORD64; //Pointer
  typedef ULONGLONG DWORDLONG; //Alias
//typedef UINT64 unsigned __int64; //Alias
  typedef uint32_t DWORD; //Integer
  typedef DWORD *PDWORD; //Pointer
//typedef PDWORD DWORD*; //Alias
  typedef PDWORD LPDWORD; //Alias
//typedef PDWORD DWORD*; //Alias
//typedef DWORD* DWORD*; //Alias
//typedef DWORD* DWORD*; //Alias
  typedef char CHAR;
  typedef CHAR *LPSTR; //Pointer
  typedef LPSTR LPCSTR; //Alias
  typedef LPSTR PCSTR; //Alias
  typedef LPSTR PSTR; //Alias
  typedef LPSTR PCHAR; //Alias
//typedef CHAR char; //Alias
//typedef char* char*; //Alias
//typedef PCHAR PCHAR; //Alias
  typedef wchar_t WCHAR;
  typedef WCHAR *LPWSTR; //Pointer
  typedef LPWSTR PWSTR; //Alias
  typedef PWSTR PCWSTR; //Alias
  typedef PWSTR LPCWSTR; //Alias
//typedef PWSTR WCHAR*; //Alias
//typedef PWSTR WCHAR*; //Alias
//typedef PWSTR WCHAR*; //Alias
//typedef PWSTR PWSTR; //Alias
  typedef PWSTR PWCHAR; //Alias
//typedef PWSTR* PCWSTR*; //Alias
//typedef WCHAR* WCHAR*; //Alias
//typedef WCHAR wchar_t; //Alias
  typedef char TCHAR;
  typedef TCHAR *LPTSTR; //Pointer
  typedef LPTSTR LPCTSTR; //Alias
  typedef LPTSTR PTSTR; //Alias
  typedef LPTSTR PCTSTR; //Alias
//typedef LPTSTR tchar*; //Alias
  typedef LPTSTR PCTSTR; //Alias
//typedef LPTSTR TCHAR*; //Alias
  typedef LPTSTR PTCHAR; //Alias
  typedef LPTSTR LPTCH; //Alias
  typedef LPTSTR LPCTCH; //Alias
//typedef INT_PTR size_t; //Alias
  typedef size_t SIZE_T; //Alias
  typedef SIZE_T* PSIZE_T; //Alias
  typedef INT64 time_t; //Alias
  typedef float FLOAT; //Alias
  typedef FLOAT *PFLOAT; //Pointer
//typedef float* float*; //Alias
//typedef float float; //Alias
  typedef double DOUBLE; //Alias
//typedef LPVOID va_list; //Alias
  enum { MAX_PATH = 260 };
  enum { ANYSIZE_ARRAY = 1 };
  enum { MAX_PATH_plus_1 = 261 };
  typedef union Stack {
    UINT_PTR uintp;
    INT_PTR intp;
    LPSTR psz;
    LPWSTR pwsz;
    LPVOID* ppv;
  } Stack;
]]

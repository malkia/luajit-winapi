local ffi = require( "ffi" )
ffi.cdef [[
  typedef void VOID;
  typedef VOID LPVOID;
  typedef LPVOID LPCVOID;
  typedef LPVOID PVOID;
  typedef LPVOID VOID*;
  typedef LPVOID PCVOID;
  typedef VOID* VOID*;
  typedef PVOID PVOID;
  typedef VOID* CONST VOID*;
  typedef void* void*;
  typedef void* CONST void*;
  typedef LPVOID WINAPI_LPVOID_char*;
  typedef BYTE CONST BYTE;
  typedef BYTE LPBYTE;
  typedef LPBYTE BYTE*;
  typedef LPBYTE PBYTE;
  typedef PBYTE PBYTE;
  typedef PBYTE CONST PBYTE;
  typedef BYTE* BYTE*;
  typedef LPBYTE LPCBYTE;
  typedef LPBYTE LPBYTE;
  typedef BYTE byte;
  typedef UCHAR PUCHAR;
  typedef UCHAR unsigned char;
  typedef UINT8 PUINT8;
  typedef UINT16 WORD;
  typedef WORD PWORD;
  typedef WORD* WORD*;
  typedef WORD* LPWORD;
  typedef UINT16 USHORT;
  typedef USHORT PUSHORT;
  typedef PUSHORT USHORT*;
  typedef PUSHORT USHORT*;
  typedef USHORT unsigned short;
  typedef USHORT u_short;
  typedef PUSHORT u_short*;
  typedef SHORT short;
  typedef UINT_PTR PUINT_PTR;
  typedef UINT_PTR ULONG_PTR;
  typedef ULONG_PTR* PULONG_PTR;
  typedef ULONG_PTR* ULONG_PTR*;
  typedef ULONG_PTR DWORD_PTR;
  typedef DWORD_PTR* PDWORD_PTR;
  typedef INT_PTR LONG_PTR;
  typedef enum BOOL {
    TRUE = 1,
    FALSE = 0,
  } BOOL;
  typedef BOOL PBOOL;
  typedef PBOOL LPBOOL;
  typedef BOOL bool;
  typedef BOOL Bool;
  typedef BOOL BOOL;
  typedef BOOL* CONST BOOL*;
  typedef BOOL BOOLAPI;
  typedef enum BOOLEAN {
    TRUE = 1,
    FALSE = 0,
  } BOOLEAN;
  typedef BOOLEAN PBOOLEAN;
  typedef UINT32 PUINT32;
  typedef UINT32 unsigned long;
  typedef unsigned long unsigned long;
  typedef UINT32 u_long;
  typedef UINT32 ULONG;
  typedef ULONG PULONG;
  typedef UINT32 Ulong;
  typedef UINT32 UINT;
  typedef UINT PUINT;
  typedef PUINT UINT*;
  typedef UINT* UINT*;
  typedef UINT unsigned int;
  typedef PUINT unsigned int*;
  typedef PUINT LPUINT;
  typedef ULONG ULONG32;
  typedef INT32 long;
  typedef long LONG;
  typedef LONG* PLONG;
  typedef LONG* LPLONG;
  typedef LONG* LONG volatile*;
  typedef INT32 int;
  typedef int INT;
  typedef int* CONST int*;
  typedef int* int*;
  typedef INT* INT*;
  typedef INT PINT;
  typedef PINT LPINT;
  typedef LPINT LPINT;
  typedef int signed int;
  typedef INT32 __int32;
  typedef INT64 LONGLONG;
  typedef LONGLONG* LONGLONG volatile*;
  typedef LONGLONG PLONGLONG;
  typedef INT64 LONG64;
  typedef LONG64 PLONG64;
  typedef INT64 __int64;
  typedef UINT64 PUINT64;
  typedef UINT64 ULONGLONG;
  typedef ULONGLONG PULONGLONG;
  typedef UINT64 ULONG64;
  typedef ULONG64 PULONG64;
  typedef UINT64 DWORD64;
  typedef DWORD64 PDWORD64;
  typedef ULONGLONG DWORDLONG;
  typedef UINT64 unsigned __int64;
  typedef DWORD PDWORD;
  typedef PDWORD DWORD*;
  typedef PDWORD LPDWORD;
  typedef PDWORD DWORD*;
  typedef DWORD* CONST DWORD*;
  typedef DWORD* DWORD const*;
  typedef CHAR LPSTR;
  typedef LPSTR LPCSTR;
  typedef LPSTR PCSTR;
  typedef LPSTR PSTR;
  typedef LPSTR PCHAR;
  typedef CHAR char;
  typedef char* char*;
  typedef PCHAR PCHAR;
  typedef WCHAR LPWSTR;
  typedef LPWSTR PWSTR;
  typedef PWSTR PCWSTR;
  typedef PWSTR LPCWSTR;
  typedef PWSTR WCHAR*;
  typedef PWSTR CONST WCHAR*;
  typedef PWSTR WCHAR*;
  typedef PWSTR PWSTR;
  typedef PWSTR PWCHAR;
  typedef PWSTR* PCWSTR*;
  typedef WCHAR* WCHAR const*;
  typedef WCHAR wchar_t;
  typedef TCHAR LPTSTR;
  typedef LPTSTR LPCTSTR;
  typedef LPTSTR PTSTR;
  typedef LPTSTR PCTSTR;
  typedef LPTSTR tchar*;
  typedef LPTSTR PCTSTR;
  typedef LPTSTR TCHAR*;
  typedef LPTSTR PTCHAR;
  typedef LPTSTR LPTCH;
  typedef LPTSTR LPCTCH;
  typedef INT_PTR size_t;
  typedef size_t SIZE_T;
  typedef SIZE_T* PSIZE_T;
  typedef INT64 time_t;
  typedef float FLOAT;
  typedef FLOAT PFLOAT;
  typedef float* CONST float*;
  typedef FLOAT CONST FLOAT*;
  typedef float float;
  typedef double DOUBLE;
  typedef LPVOID va_list;
  typedef union Stack {
    UINT_PTR uintp,
    INT_PTR intp,
    LPSTR psz,
    LPWSTR pwsz,
    LPVOID* ppv,
  } Stack;

]]

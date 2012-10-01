require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  typedef ULONG IPAddr;
  typedef UCHAR WINAPI_IpOptionFlags;
  typedef struct IP_OPTION_INFORMATION {
    UCHAR Ttl,
    UCHAR Tos,
    WINAPI_IpOptionFlags Flags,
    UCHAR OptionsSize,
    PUCHAR OptionsData,
  } IP_OPTION_INFORMATION;

  typedef IP_OPTION_INFORMATION PIP_OPTION_INFORMATION;
]]

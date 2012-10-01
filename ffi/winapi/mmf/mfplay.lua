require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/mmf/mmfdefs" )
local ffi = require( "ffi" )
ffi.cdef [[
  HRESULT MFPCreateMediaPlayer( LPCWSTR pwszURL, BOOL fStartPlayback, MFP_CREATION_OPTIONS creationOptions, IMFPMediaPlayerCallback* pCallback, HWND hWnd, IMFPMediaPlayer** ppMediaPlayer);
]]
return ffi.load( "Mfplay.dll" )

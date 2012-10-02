require( 'ffi/winapi/headers/windows' )
local ffi = require( 'ffi' )
ffi.cdef [[
  DWORD SRRemoveRestorePoint(      DWORD dwRPNum);
  BOOL  SRSetRestorePointA(        PRESTOREPOINTINFOA pRestorePtSpec, PSTATEMGRSTATUS pSMgrStatus);
  BOOL  SRSetRestorePointW(        PRESTOREPOINTINFOW pRestorePtSpec, PSTATEMGRSTATUS pSMgrStatus);
  BOOL  SRSetRestorePointInternal( PRESTOREPOINTINFOW pRestorePtSpec, PSTATEMGRSTATUS pSMgrStatus, BOOL fForceSurrogate);
]]
return ffi.load( 'SrClient.dll' )

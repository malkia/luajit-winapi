require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  BOOL   AvQuerySystemResponsiveness(     HANDLE AvrtHandle, PULONG SystemResponsivenessValue);
  BOOL   AvRtCreateThreadOrderingGroup(   PHANDLE Context, PLARGE_INTEGER Period, GUID* ThreadOrderingGuid, PLARGE_INTEGER Timeout);
  BOOL   AvRtCreateThreadOrderingGroupEx( PHANDLE Context, PLARGE_INTEGER Period, GUID* ThreadOrderingGuid, PLARGE_INTEGER Timeout, LPCTSTR TaskName);
  BOOL   AvRtDeleteThreadOrderingGroup(   HANDLE Context);
  BOOL   AvRtJoinThreadOrderingGroup(     PHANDLE Context, GUID* ThreadOrderingGuid, BOOL Before);
  BOOL   AvRtLeaveThreadOrderingGroup(    HANDLE Context);
  BOOL   AvRtWaitOnThreadOrderingGroup(   HANDLE Context);
  BOOL   AvRevertMmThreadCharacteristics( HANDLE AvrtHandle);
  HANDLE AvSetMmMaxThreadCharacteristics( LPCTSTR FirstTask, LPCTSTR SecondTask, LPDWORD TaskIndex);
  HANDLE AvSetMmThreadCharacteristics(    LPCTSTR TaskName, LPDWORD TaskIndex);
  BOOL   AvSetMmThreadPriority(           HANDLE AvrtHandle, AVRT_PRIORITY Priority);
]]
return ffi.load( "Avrt.dll" )

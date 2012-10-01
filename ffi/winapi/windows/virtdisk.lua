require( "ffi/winapi/headers/windows" )
local ffi = require( "ffi" )
ffi.cdef [[
  WINAPI_ERROR_CODE AttachVirtualDisk(               HANDLE VirtualDiskHandle, PSECURITY_DESCRIPTOR SecurityDescriptor, ATTACH_VIRTUAL_DISK_FLAG Flags, ULONG ProviderSpecificFlags, PATTACH_VIRTUAL_DISK_PARAMETERS Parameters, LPOVERLAPPED Overlapped);
  WINAPI_ERROR_CODE CompactVirtualDisk(              HANDLE VirtualDiskHandle, COMPACT_VIRTUAL_DISK_FLAG Flags, PCOMPACT_VIRTUAL_DISK_PARAMETERS Parameters, LPOVERLAPPED Overlapped);
  WINAPI_ERROR_CODE CreateVirtualDisk(               PVIRTUAL_STORAGE_TYPE VirtualStorageType, PCWSTR Path, VIRTUAL_DISK_ACCESS_MASK VirtualDiskAccessMask, PSECURITY_DESCRIPTOR SecurityDescriptor, CREATE_VIRTUAL_DISK_FLAG Flags, ULONG ProviderSpecificFlags, PCREATE_VIRTUAL_DISK_PARAMETERS Parameters, LPOVERLAPPED Overlapped, PHANDLE Handle);
  WINAPI_ERROR_CODE DetachVirtualDisk(               HANDLE VirtualDiskHandle, DETACH_VIRTUAL_DISK_FLAG Flags, ULONG ProviderSpecificFlags);
  WINAPI_ERROR_CODE ExpandVirtualDisk(               HANDLE VirtualDiskHandle, EXPAND_VIRTUAL_DISK_FLAG Flags, PEXPAND_VIRTUAL_DISK_PARAMETERS Parameters, LPOVERLAPPED Overlapped);
  WINAPI_ERROR_CODE GetStorageDependencyInformation( HANDLE ObjectHandle, GET_STORAGE_DEPENDENCY_FLAG Flags, ULONG StorageDependencyInfoSize, PSTORAGE_DEPENDENCY_INFO StorageDependencyInfo, PULONG SizeUsed);
  WINAPI_ERROR_CODE GetVirtualDiskInformation(       HANDLE VirtualDiskHandle, PULONG VirtualDiskInfoSize, PGET_VIRTUAL_DISK_INFO VirtualDiskInfo, PULONG SizeUsed);
  WINAPI_ERROR_CODE GetVirtualDiskOperationProgress( HANDLE VirtualDiskHandle, LPOVERLAPPED Overlapped, PVIRTUAL_DISK_PROGRESS Progress);
  WINAPI_ERROR_CODE GetVirtualDiskPhysicalPath(      HANDLE VirtualDiskHandle, PULONG DiskPathSizeInBytes, PWSTR DiskPath);
  WINAPI_ERROR_CODE MergeVirtualDisk(                HANDLE VirtualDiskHandle, MERGE_VIRTUAL_DISK_FLAG Flags, PMERGE_VIRTUAL_DISK_PARAMETERS Parameters, LPOVERLAPPED Overlapped);
  WINAPI_ERROR_CODE OpenVirtualDisk(                 PVIRTUAL_STORAGE_TYPE VirtualStorageType, PCWSTR Path, VIRTUAL_DISK_ACCESS_MASK VirtualDiskAccessMask, OPEN_VIRTUAL_DISK_FLAG Flags, POPEN_VIRTUAL_DISK_PARAMETERS Parameters, PHANDLE Handle);
  WINAPI_ERROR_CODE SetVirtualDiskInformation(       HANDLE VirtualDiskHandle, PSET_VIRTUAL_DISK_INFO VirtualDiskInfo);
]]
return ffi.load( "VirtDisk.dll" )

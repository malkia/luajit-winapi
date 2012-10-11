require( 'ffi/winapi/vss/vss' )
local ffi = require( 'ffi' )
ffi.cdef [[
  WINAPI_VSS_HRESULT CreateVssBackupComponentsInternal(                                            IVssBackupComponents** ppBackup);
  WINAPI_VSS_HRESULT CreateVssExamineWriterMetadataInternal(                                       BSTR bstrXML, IVssExamineWriterMetadata** ppMetadata);
  WINAPI_VSS_HRESULT CreateVssExpressWriterInternal(                                               IVssExpressWriter** ppWriter);
  WINAPI_VSS_HRESULT CreateWriter(                                                                 CVssWriter* pWriter, IVssWriterImpl** pWriterImpl);
  WINAPI_VSS_HRESULT CreateWriterEx(                                                               CVssWriterEx* pWriter, IVssWriterImpl** pWriterImpl);
  WINAPI_VSS_HRESULT IsVolumeSnapshotted(                                                          VSS_PWSZ pwszVolumeName, BOOL* pbSnapshotsPresent, LONG* plSnapshotCapability);
  WINAPI_VSS_HRESULT IsVolumeSnapshottedInternal(                                                  VSS_PWSZ pwszVolumeName, BOOL* pbSnapshotsPresent, LONG* plSnapshotCapability);
  WINAPI_VSS_HRESULT ShouldBlockRevert(                                                            LPCWSTR wszVolumeName, bool* pbBlock);
  WINAPI_VSS_HRESULT ShouldBlockRevertInternal(                                                    LPCWSTR wszVolumeName, bool* pbBlock);
  void               VssFreeSnapshotProperties(                                                    VSS_SNAPSHOT_PROP* pProp);
  void               VssFreeSnapshotPropertiesInternal(                                            VSS_SNAPSHOT_PROP* pProp);
  WINAPI_VSS_HRESULT ?CreateVssBackupComponents@@YAJPEAPEAVIVssBackupComponents@@@Z(               IVssBackupComponents** ppBackup);
  WINAPI_VSS_HRESULT ?CreateVssExamineWriterMetadata@@YAJPEAGPEAPEAVIVssExamineWriterMetadata@@@Z( BSTR bstrXML, IVssExamineWriterMetadata** ppMetadata);
  WINAPI_VSS_HRESULT ?CreateVssBackupComponents@@YGJPAPAVIVssBackupComponents@@@Z(                 IVssBackupComponents** ppBackup);
  WINAPI_VSS_HRESULT ?CreateVssExamineWriterMetadata@@YGJPAGPAPAVIVssExamineWriterMetadata@@@Z(    BSTR bstrXML, IVssExamineWriterMetadata** ppMetadata);
]]
ffi.load( 'VssApi.dll' )

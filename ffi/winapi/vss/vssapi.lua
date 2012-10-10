require( 'ffi/winapi/vss/vss' )
local ffi = require( 'ffi' )
ffi.cdef [[
  VSS_HRESULT CreateVssBackupComponentsInternal(                                            IVssBackupComponents** ppBackup);
  VSS_HRESULT CreateVssExamineWriterMetadataInternal(                                       BSTR bstrXML, IVssExamineWriterMetadata** ppMetadata);
  VSS_HRESULT CreateVssExpressWriterInternal(                                               IVssExpressWriter** ppWriter);
  VSS_HRESULT CreateWriter(                                                                 CVssWriter* pWriter, IVssWriterImpl** pWriterImpl);
  VSS_HRESULT CreateWriterEx(                                                               CVssWriterEx* pWriter, IVssWriterImpl** pWriterImpl);
  VSS_HRESULT IsVolumeSnapshotted(                                                          VSS_PWSZ pwszVolumeName, BOOL* pbSnapshotsPresent, LONG* plSnapshotCapability);
  VSS_HRESULT IsVolumeSnapshottedInternal(                                                  VSS_PWSZ pwszVolumeName, BOOL* pbSnapshotsPresent, LONG* plSnapshotCapability);
  VSS_HRESULT ShouldBlockRevert(                                                            LPCWSTR wszVolumeName, bool* pbBlock);
  VSS_HRESULT ShouldBlockRevertInternal(                                                    LPCWSTR wszVolumeName, bool* pbBlock);
  void        VssFreeSnapshotProperties(                                                    VSS_SNAPSHOT_PROP* pProp);
  void        VssFreeSnapshotPropertiesInternal(                                            VSS_SNAPSHOT_PROP* pProp);
  VSS_HRESULT ?CreateVssBackupComponents@@YAJPEAPEAVIVssBackupComponents@@@Z(               IVssBackupComponents** ppBackup);
  VSS_HRESULT ?CreateVssExamineWriterMetadata@@YAJPEAGPEAPEAVIVssExamineWriterMetadata@@@Z( BSTR bstrXML, IVssExamineWriterMetadata** ppMetadata);
  VSS_HRESULT ?CreateVssBackupComponents@@YGJPAPAVIVssBackupComponents@@@Z(                 IVssBackupComponents** ppBackup);
  VSS_HRESULT ?CreateVssExamineWriterMetadata@@YGJPAGPAPAVIVssExamineWriterMetadata@@@Z(    BSTR bstrXML, IVssExamineWriterMetadata** ppMetadata);
]]
ffi.load( 'VssApi.dll' )

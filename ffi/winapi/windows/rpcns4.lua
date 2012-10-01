require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/rpc" )
local ffi = require( "ffi" )
ffi.cdef [[
  RPC_STATUS RpcNsBindingExport(       unsigned long EntryNameSyntax, unsigned char* EntryName, RPC_IF_HANDLE IfSpec, RPC_BINDING_VECTOR* BindingVec, UUID_VECTOR* ObjectUuidVec);
  RPC_STATUS RpcNsBindingExportPnP(    unsigned long EntryNameSyntax, unsigned char* EntryName, RPC_IF_HANDLE IfSpec, UUID_VECTOR* ObjectUuidVec);
  RPC_STATUS RpcNsBindingImportBegin(  unsigned long EntryNameSyntax, unsigned char* EntryName, RPC_IF_HANDLE IfSpec, UUID* ObjUuid, RPC_NS_HANDLE* ImportContext);
  RPC_STATUS RpcNsBindingImportDone(   RPC_NS_HANDLE* ImportContext);
  RPC_STATUS RpcNsBindingImportNext(   RPC_NS_HANDLE ImportContext, RPC_BINDING_HANDLE* Binding);
  RPC_STATUS RpcNsBindingLookupBegin(  unsigned long EntryNameSyntax, unsigned char* EntryName, RPC_IF_HANDLE IfSpec, UUID* ObjUuid, unsigned long BindingMaxCount, RPC_NS_HANDLE* LookupContext);
  RPC_STATUS RpcNsBindingLookupDone(   RPC_NS_HANDLE* LookupContext);
  RPC_STATUS RpcNsBindingLookupNext(   RPC_NS_HANDLE LookupContext, RPC_BINDING_VECTOR** BindingVec);
  RPC_STATUS RpcNsBindingSelect(       RPC_BINDING_VECTOR* BindingVec, RPC_BINDING_HANDLE* Binding);
  RPC_STATUS RpcNsBindingUnexport(     unsigned long EntryNameSyntax, unsigned char* EntryName, RPC_IF_HANDLE IfSpec, UUID_VECTOR* ObjectUuidVec);
  RPC_STATUS RpcNsBindingUnexportPnP(  unsigned long EntryNameSyntax, unsigned char* EntryName, RPC_IF_HANDLE IfSpec, UUID_VECTOR* ObjectUuidVec);
  RPC_STATUS RpcNsEntryExpandName(     unsigned long EntryNameSyntax, unsigned char* EntryName, unsigned char** ExpandedName);
  RPC_STATUS RpcNsEntryObjectInqBegin( unsigned long EntryNameSyntax, unsigned char* EntryName, RPC_NS_HANDLE* InquiryContext);
  RPC_STATUS RpcNsEntryObjectInqDone(  RPC_NS_HANDLE* InquiryContext);
  RPC_STATUS RpcNsEntryObjectInqNext(  RPC_NS_HANDLE InquiryContext, UUID* ObjUuid);
  RPC_STATUS RpcNsGroupDelete(         unsigned long GroupNameSyntax, unsigned char* GroupName);
  RPC_STATUS RpcNsGroupMbrAdd(         unsigned long GroupNameSyntax, unsigned char* GroupName, unsigned long MemberNameSyntax, unsigned char* MemberName);
  RPC_STATUS RpcNsGroupMbrInqBegin(    unsigned long GroupNameSyntax, unsigned char* GroupName, unsigned long MemberNameSyntax, RPC_NS_HANDLE* InquiryContext);
  RPC_STATUS RpcNsGroupMbrInqDone(     RPC_NS_HANDLE* InquiryContext);
  RPC_STATUS RpcNsGroupMbrInqNext(     RPC_NS_HANDLE InquiryContext, unsigned char** MemberName);
  RPC_STATUS RpcNsGroupMbrRemove(      unsigned long GroupNameSyntax, unsigned char* GroupName, unsigned long MemberNameSyntax, unsigned char* MemberName);
  RPC_STATUS RpcNsMgmtBindingUnexport( unsigned long EntryNameSyntax, unsigned char* EntryName, RPC_IF_ID* IfId, unsigned long VersOption, UUID_VECTOR* ObjectUuidVec);
  RPC_STATUS RpcNsMgmtEntryCreate(     unsigned long EntryNameSyntax, unsigned char* EntryName);
  RPC_STATUS RpcNsMgmtEntryDelete(     unsigned long EntryNameSyntax, unsigned char* EntryName);
  RPC_STATUS RpcNsMgmtEntryInqIfIds(   unsigned long EntryNameSyntax, unsigned char* EntryName, RPC_IF_ID_VECTOR** IfIdVec);
  RPC_STATUS RpcNsMgmtHandleSetExpAge( RPC_NS_HANDLE NsHandle, unsigned long ExpirationAge);
  RPC_STATUS RpcNsMgmtInqExpAge(       unsigned long* ExpirationAge);
  RPC_STATUS RpcNsMgmtSetExpAge(       unsigned long ExpirationAge);
  RPC_STATUS RpcNsProfileDelete(       unsigned long ProfileNameSyntax, unsigned char* ProfileName);
  RPC_STATUS RpcNsProfileEltAdd(       unsigned long ProfileNameSyntax, unsigned char* ProfileName, RPC_IF_ID* IfId, unsigned long MemberNameSyntax, unsigned char* MemberName, unsigned long Priority, unsigned char* Annotation);
  RPC_STATUS RpcNsProfileEltInqBegin(  unsigned long ProfileNameSyntax, unsigned char* ProfileName, unsigned long InquiryType, RPC_IF_ID* IfId, unsigned long VersOption, unsigned long MemberNameSyntax, unsigned char* MemberName, RPC_NS_HANDLE* InquiryContext);
  RPC_STATUS RpcNsProfileEltInqDone(   RPC_NS_HANDLE* InquiryContext);
  RPC_STATUS RpcNsProfileEltInqNext(   RPC_NS_HANDLE InquiryContext, RPC_IF_ID* IfId, unsigned char** MemberName, unsigned long* Priority, unsigned char** Annotation);
  RPC_STATUS RpcNsProfileEltRemove(    unsigned long ProfileNameSyntax, unsigned char* ProfileName, RPC_IF_ID* IfId, unsigned long MemberNameSyntax, unsigned char* MemberName);
]]
return ffi.load( "Rpcns4.dll" )

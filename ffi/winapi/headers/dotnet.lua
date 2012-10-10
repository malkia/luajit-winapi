local ffi = require( 'ffi' )
ffi.cdef [[
  typedef void* IAssembly; //Interface
  typedef void* IAssemblyCache; //Interface
  typedef void* IAssemblyName; //Interface
  typedef void* IAssemblyEnum; //Interface
  typedef void* IHistoryReader; //Interface
  typedef void* IInstallReferenceEnum; //Interface
  typedef void* IAppIdAuthority; //Interface
  typedef void* IIdentityAuthority; //Interface
  typedef void* IApplicationContext; //Interface
  typedef IAssemblyName* LPASSEMBLYNAME; //Alias
  typedef IApplicationContext* LPPAPPLICATIONCONTEXT; //Alias
]]

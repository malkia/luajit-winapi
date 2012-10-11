require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/cryptography' )
require( 'ffi/winapi/headers/registry' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef unsigned long MSIHANDLE; //Alias
  typedef LPVOID INSTALLUI_HANDLER; //Alias
  typedef LPVOID PINSTALLUI_HANDLER_RECORD; //Alias
  typedef WINAPI_ERROR_CODE WINAPI_MSI_ERROR; //Alias
  typedef UINT MSIPATCHDATATYPE; //Alias
  static const MSIPATCHDATATYPE MSIPATCH_DATATYPE_PATCHFILE = 0;
  static const MSIPATCHDATATYPE MSIPATCH_DATATYPE_XMLPATH = 1;
  static const MSIPATCHDATATYPE MSIPATCH_DATATYPE_XMLBLOB = 2;
  typedef struct MSIPATCHSEQUENCEINFO {
    LPCTSTR szPatchData;
    MSIPATCHDATATYPE ePatchDataType;
    DWORD dwOrder;
    UINT uStatus;
  } MSIPATCHSEQUENCEINFO;
  typedef MSIPATCHSEQUENCEINFO *PMSIPATCHSEQUENCEINFO; //Pointer
  typedef struct MSIFILEHASHINFO {
    ULONG dwFileHashInfoSize;
    ULONG dwData[4];
  } MSIFILEHASHINFO;
  typedef MSIFILEHASHINFO *PMSIFILEHASHINFO; //Pointer
  typedef int USERINFOSTATE; //Alias
  static const USERINFOSTATE USERINFOSTATE_MOREDATA = -3;
  static const USERINFOSTATE USERINFOSTATE_INVALIDARG = -2;
  static const USERINFOSTATE USERINFOSTATE_UNKNOWN = -1;
  static const USERINFOSTATE USERINFOSTATE_ABSENT = 0;
  static const USERINFOSTATE USERINFOSTATE_PRESENT = 1;
  typedef UINT INSTALLUILEVEL; //Alias
  typedef DWORD MSIINSTALLCONTEXT; //Alias
  typedef UINT INSTALLSTATE; //Alias
  static const INSTALLSTATE INSTALLSTATE_NOTUSED = -7;
  static const INSTALLSTATE INSTALLSTATE_BADCONFIG = -6;
  static const INSTALLSTATE INSTALLSTATE_INCOMPLETE = -5;
  static const INSTALLSTATE INSTALLSTATE_SOURCEABSENT = -4;
  static const INSTALLSTATE INSTALLSTATE_MOREDATA = -3;
  static const INSTALLSTATE INSTALLSTATE_INVALIDARG = -2;
  static const INSTALLSTATE INSTALLSTATE_UNKNOWN = -1;
  static const INSTALLSTATE INSTALLSTATE_BROKEN = 0;
  static const INSTALLSTATE INSTALLSTATE_ADVERTISED = 1;
  static const INSTALLSTATE INSTALLSTATE_ABSENT = 2;
  static const INSTALLSTATE INSTALLSTATE_LOCAL = 3;
  static const INSTALLSTATE INSTALLSTATE_SOURCE = 4;
  static const INSTALLSTATE INSTALLSTATE_DEFAULT = 5;
  typedef INSTALLSTATE WINAPI_INSTALLSTATE_DWORD; //Alias
  typedef int WINAPI_MsiInstallLevel; //Alias
  static const WINAPI_MsiInstallLevel INSTALLLEVEL_DEFAULT = 0;
  static const WINAPI_MsiInstallLevel INSTALLLEVEL_MINIMUM = 1;
  static const WINAPI_MsiInstallLevel INSTALLLEVEL_MAXIMUM = 0xFFFF;
  typedef DWORD WINAPI_MsiReinstallMode; //Alias
  typedef DWORD WINAPI_MsiInstallMode; //Alias
  static const WINAPI_MsiInstallMode INSTALLMODE_NODETECTION_ANY = -4;
  static const WINAPI_MsiInstallMode INSTALLMODE_NOSOURCERESOLUTION = -3;
  static const WINAPI_MsiInstallMode INSTALLMODE_NODETECTION = -2;
  static const WINAPI_MsiInstallMode INSTALLMODE_EXISTING = -1;
  static const WINAPI_MsiInstallMode INSTALLMODE_DEFAULT = 0;
  typedef UINT INSTALLTYPE; //Alias
  typedef DWORD WINAPI_MsiInstallLogMode; //Alias
  typedef DWORD WINAPI_MsiInstallLogAttributes; //Alias
  typedef DWORD WINAPI_MsiArchFlags; //Alias
  typedef DWORD WINAPI_MsiAdOptions; //Alias
  typedef DWORD WINAPI_MsiSourceType; //Alias
  typedef DWORD WINAPI_MsiCode; //Alias
  typedef DWORD WINAPI_MsiAssemblyInfo; //Alias
  typedef DWORD WINAPI_MsiOpenPackageFlags; //Alias
  typedef DWORD WINAPI_MsiPatchState; //Alias
  typedef DWORD WINAPI_MsiHashFlags; //Alias
  typedef DWORD WINAPI_MsiTransactionAttributes; //Alias
  typedef DWORD WINAPI_MsiScriptFlags; //Alias
  typedef DWORD WINAPI_MsiInstallFeatureAttr; //Alias
  typedef DWORD WINAPI_MsiTransactionState; //Alias
  static const WINAPI_MsiTransactionState MSITRANSACTIONSTATE_ROLLBACK = 0;
  static const WINAPI_MsiTransactionState MSITRANSACTIONSTATE_COMMIT = 1;
  typedef UINT MSIMODIFY; //Alias
  static const MSIMODIFY MSIMODIFY_SEEK = -1;
  static const MSIMODIFY MSIMODIFY_REFRESH = 0;
  static const MSIMODIFY MSIMODIFY_INSERT = 1;
  static const MSIMODIFY MSIMODIFY_UPDATE = 2;
  static const MSIMODIFY MSIMODIFY_ASSIGN = 3;
  static const MSIMODIFY MSIMODIFY_REPLACE = 4;
  static const MSIMODIFY MSIMODIFY_MERGE = 5;
  static const MSIMODIFY MSIMODIFY_DELETE = 6;
  static const MSIMODIFY MSIMODIFY_INSERT_TEMPORARY = 7;
  static const MSIMODIFY MSIMODIFY_VALIDATE = 8;
  static const MSIMODIFY MSIMODIFY_VALIDATE_NEW = 9;
  static const MSIMODIFY MSIMODIFY_VALIDATE_FIELD = 10;
  static const MSIMODIFY MSIMODIFY_VALIDATE_DELETE = 11;
  typedef UINT MSICOLINFO; //Alias
  static const MSICOLINFO MSICOLINFO_NAMES = 0;
  static const MSICOLINFO MSICOLINFO_TYPES = 1;
  typedef UINT MSICONDITION; //Alias
  static const MSICONDITION MSICONDITION_FALSE = 0;
  static const MSICONDITION MSICONDITION_TRUE = 1;
  static const MSICONDITION MSICONDITION_NONE = 2;
  static const MSICONDITION MSICONDITION_ERROR = 3;
  typedef UINT MSIDBERROR; //Alias
  static const MSIDBERROR MSIDBERROR_INVALIDARG = -3;
  static const MSIDBERROR MSIDBERROR_MOREDATA = -2;
  static const MSIDBERROR MSIDBERROR_FUNCTIONERROR = -1;
  static const MSIDBERROR MSIDBERROR_NOERROR = 0;
  static const MSIDBERROR MSIDBERROR_DUPLICATEKEY = 1;
  static const MSIDBERROR MSIDBERROR_REQUIRED = 2;
  static const MSIDBERROR MSIDBERROR_BADLINK = 3;
  static const MSIDBERROR MSIDBERROR_OVERFLOW = 4;
  static const MSIDBERROR MSIDBERROR_UNDERFLOW = 5;
  static const MSIDBERROR MSIDBERROR_NOTINSET = 6;
  static const MSIDBERROR MSIDBERROR_BADVERSION = 7;
  static const MSIDBERROR MSIDBERROR_BADCASE = 8;
  static const MSIDBERROR MSIDBERROR_BADGUID = 9;
  static const MSIDBERROR MSIDBERROR_BADWILDCARD = 10;
  static const MSIDBERROR MSIDBERROR_BADIDENTIFIER = 11;
  static const MSIDBERROR MSIDBERROR_BADLANGUAGE = 12;
  static const MSIDBERROR MSIDBERROR_BADFILENAME = 13;
  static const MSIDBERROR MSIDBERROR_BADPATH = 14;
  static const MSIDBERROR MSIDBERROR_BADCONDITION = 15;
  static const MSIDBERROR MSIDBERROR_BADFORMATTED = 16;
  static const MSIDBERROR MSIDBERROR_BADTEMPLATE = 17;
  static const MSIDBERROR MSIDBERROR_BADDEFAULTDIR = 18;
  static const MSIDBERROR MSIDBERROR_BADREGPATH = 19;
  static const MSIDBERROR MSIDBERROR_BADCUSTOMSOURCE = 20;
  static const MSIDBERROR MSIDBERROR_BADPROPERTY = 21;
  static const MSIDBERROR MSIDBERROR_MISSINGDATA = 22;
  static const MSIDBERROR MSIDBERROR_BADCATEGORY = 23;
  static const MSIDBERROR MSIDBERROR_BADKEYTABLE = 24;
  static const MSIDBERROR MSIDBERROR_BADMAXMINVALUES = 25;
  static const MSIDBERROR MSIDBERROR_BADCABINET = 26;
  static const MSIDBERROR MSIDBERROR_BADSHORTCUT = 27;
  static const MSIDBERROR MSIDBERROR_STRINGOVERFLOW = 28;
  static const MSIDBERROR MSIDBERROR_BADLOCALIZEATTRIB = 29;
  typedef UINT MSICOSTTREE; //Alias
  static const MSICOSTTREE MSICOSTTREE_SELFONLY = 0;
  static const MSICOSTTREE MSICOSTTREE_CHILDREN = 1;
  static const MSICOSTTREE MSICOSTTREE_PARENTS = 2;
  static const MSICOSTTREE MSICOSTTREE_RESERVED = 3;
  typedef UINT INSTALLMESSAGE; //Alias
  static const INSTALLMESSAGE INSTALLMESSAGE_FATALEXIT = 0x00000000;
  static const INSTALLMESSAGE INSTALLMESSAGE_ERROR = 0x01000000;
  static const INSTALLMESSAGE INSTALLMESSAGE_WARNING = 0x02000000;
  static const INSTALLMESSAGE INSTALLMESSAGE_USER = 0x03000000;
  static const INSTALLMESSAGE INSTALLMESSAGE_INFO = 0x04000000;
  static const INSTALLMESSAGE INSTALLMESSAGE_FILESINUSE = 0x05000000;
  static const INSTALLMESSAGE INSTALLMESSAGE_RESOLVESOURCE = 0x06000000;
  static const INSTALLMESSAGE INSTALLMESSAGE_OUTOFDISKSPACE = 0x07000000;
  static const INSTALLMESSAGE INSTALLMESSAGE_ACTIONSTART = 0x08000000;
  static const INSTALLMESSAGE INSTALLMESSAGE_ACTIONDATA = 0x09000000;
  static const INSTALLMESSAGE INSTALLMESSAGE_PROGRESS = 0x0A000000;
  static const INSTALLMESSAGE INSTALLMESSAGE_COMMONDATA = 0x0B000000;
  static const INSTALLMESSAGE INSTALLMESSAGE_INITIALIZE = 0x0C000000;
  static const INSTALLMESSAGE INSTALLMESSAGE_TERMINATE = 0x0D000000;
  static const INSTALLMESSAGE INSTALLMESSAGE_SHOWDIALOG = 0x0E000000;
  static const INSTALLMESSAGE INSTALLMESSAGE_PERFORMANCE = 0x0F000000;
  static const INSTALLMESSAGE INSTALLMESSAGE_RMFILESINUSE = 0x19000000;
  static const INSTALLMESSAGE INSTALLMESSAGE_INSTALLSTART = 0x1A000000;
  static const INSTALLMESSAGE INSTALLMESSAGE_INSTALLEND = 0x1B000000;
  typedef UINT MSIRUNMODE; //Alias
  static const MSIRUNMODE MSIRUNMODE_ADMIN = 0;
  static const MSIRUNMODE MSIRUNMODE_ADVERTISE = 1;
  static const MSIRUNMODE MSIRUNMODE_MAINTENANCE = 2;
  static const MSIRUNMODE MSIRUNMODE_ROLLBACKENABLED = 3;
  static const MSIRUNMODE MSIRUNMODE_LOGENABLED = 4;
  static const MSIRUNMODE MSIRUNMODE_OPERATIONS = 5;
  static const MSIRUNMODE MSIRUNMODE_REBOOTATEND = 6;
  static const MSIRUNMODE MSIRUNMODE_REBOOTNOW = 7;
  static const MSIRUNMODE MSIRUNMODE_CABINET = 8;
  static const MSIRUNMODE MSIRUNMODE_SOURCESHORTNAMES = 9;
  static const MSIRUNMODE MSIRUNMODE_TARGETSHORTNAMES = 10;
  static const MSIRUNMODE MSIRUNMODE_RESERVED11 = 11;
  static const MSIRUNMODE MSIRUNMODE_WINDOWS9X = 12;
  static const MSIRUNMODE MSIRUNMODE_ZAWENABLED = 13;
  static const MSIRUNMODE MSIRUNMODE_RESERVED14 = 14;
  static const MSIRUNMODE MSIRUNMODE_RESERVED15 = 15;
  static const MSIRUNMODE MSIRUNMODE_SCHEDULED = 16;
  static const MSIRUNMODE MSIRUNMODE_ROLLBACK = 17;
  static const MSIRUNMODE MSIRUNMODE_COMMIT = 18;
  typedef UINT MSIDBSTATE; //Alias
  static const MSIDBSTATE MSIDBSTATE_ERROR = -1;
  static const MSIDBSTATE MSIDBSTATE_READ = 0;
  static const MSIDBSTATE MSIDBSTATE_WRITE = 1;
  typedef UINT MSITRANSFORM_ERROR; //Alias
  typedef UINT MSITRANSFORM_VALIDATE; //Alias
  typedef UINT WINAPI_MSI_PID; //Alias
  static const WINAPI_MSI_PID PID_DICTIONARY = 0;
  static const WINAPI_MSI_PID PID_CODEPAGE = 1;
  static const WINAPI_MSI_PID PID_TITLE = 2;
  static const WINAPI_MSI_PID PID_SUBJECT = 3;
  static const WINAPI_MSI_PID PID_AUTHOR = 4;
  static const WINAPI_MSI_PID PID_KEYWORDS = 5;
  static const WINAPI_MSI_PID PID_COMMENTS = 6;
  static const WINAPI_MSI_PID PID_TEMPLATE = 7;
  static const WINAPI_MSI_PID PID_LASTAUTHOR = 8;
  static const WINAPI_MSI_PID PID_REVNUMBER = 9;
  static const WINAPI_MSI_PID PID_EDITTIME = 10;
  static const WINAPI_MSI_PID PID_LASTPRINTED = 11;
  static const WINAPI_MSI_PID PID_CREATE_DTM = 12;
  static const WINAPI_MSI_PID PID_LASTSAVE_DTM = 13;
  static const WINAPI_MSI_PID PID_PAGECOUNT = 14;
  static const WINAPI_MSI_PID PID_WORDCOUNT = 15;
  static const WINAPI_MSI_PID PID_CHARCOUNT = 16;
  static const WINAPI_MSI_PID PID_THUMBNAIL = 17;
  static const WINAPI_MSI_PID PID_APPNAME = 18;
  static const WINAPI_MSI_PID PID_SECURITY = 19;
  typedef VARTYPE WINAPI_MSI_DATA_TYPE; //Alias
  INSTALLUILEVEL    MsiSetInternalUI(               INSTALLUILEVEL dwUILevel, HWND* phWnd);
  INSTALLUI_HANDLER MsiSetExternalUI(               INSTALLUI_HANDLER puiHandler, WINAPI_MsiInstallLogMode dwMessageFilter, LPVOID pvContext);
  WINAPI_MSI_ERROR  MsiSetExternalUIRecord(         PINSTALLUI_HANDLER_RECORD puiHandler, WINAPI_MsiInstallLogMode dwMessageFilter, LPVOID pvContext, PINSTALLUI_HANDLER_RECORD ppuiPrevHandler);
  WINAPI_MSI_ERROR  MsiEnableLog(                   WINAPI_MsiInstallLogMode dwLogMode, LPCTSTR szLogFile, WINAPI_MsiInstallLogAttributes dwLogAttributes);
  WINAPI_MSI_ERROR  MsiCloseHandle(                 MSIHANDLE hAny);
  UINT              MsiCloseAllHandles(             );
  WINAPI_MSI_ERROR  MsiAdvertiseProduct(            LPCTSTR szPackagePath, LPCTSTR szScriptfilePath, LPCTSTR szTransforms, LANGID lgidLanguage);
  WINAPI_MSI_ERROR  MsiAdvertiseProductEx(          LPCTSTR szPackagePath, LPCTSTR szScriptfilePath, LPCTSTR szTransforms, LANGID lgidLanguage, WINAPI_MsiArchFlags dwPlatform, WINAPI_MsiAdOptions dwOptions);
  WINAPI_MSI_ERROR  MsiAdvertiseScript(             LPCTSTR szScriptFile, WINAPI_MsiScriptFlags dwFlags, PHKEY phRegData, BOOL fRemoveItems);
  WINAPI_MSI_ERROR  MsiInstallProduct(              LPCTSTR szPackagePath, LPCTSTR szCommandLine);
  WINAPI_MSI_ERROR  MsiConfigureProduct(            LPCTSTR szProduct, WINAPI_MsiInstallLevel iInstallLevel, INSTALLSTATE eInstallState);
  WINAPI_MSI_ERROR  MsiConfigureProductEx(          LPCTSTR szProduct, WINAPI_MsiInstallLevel iInstallLevel, INSTALLSTATE eInstallState, LPCTSTR szCommandLine);
  WINAPI_MSI_ERROR  MsiReinstallProduct(            LPCTSTR szProduct, WINAPI_MsiReinstallMode dwReinstallMode);
  WINAPI_MSI_ERROR  MsiConfigureFeature(            LPCTSTR szProduct, LPCTSTR szFeature, INSTALLSTATE eInstallState);
  WINAPI_MSI_ERROR  MsiReinstallFeature(            LPCTSTR szProduct, LPCTSTR szFeature, WINAPI_MsiReinstallMode dwReinstallMode);
  WINAPI_MSI_ERROR  MsiInstallMissingComponent(     LPCTSTR szProduct, LPCTSTR szComponent, INSTALLSTATE eInstallState);
  WINAPI_MSI_ERROR  MsiInstallMissingFile(          LPCTSTR szProduct, LPCTSTR szFile);
  WINAPI_MSI_ERROR  MsiNotifySidChange(             LPCTSTR szOldSid, LPCTSTR szNewSid);
  WINAPI_MSI_ERROR  MsiProcessAdvertiseScript(      LPCTSTR szScriptFile, LPCTSTR szIconFolder, HKEY hRegData, BOOL fShortcuts, BOOL fRemoveItems);
  WINAPI_MSI_ERROR  MsiSourceListAddSource(         LPCTSTR szProduct, LPCTSTR szUserName, DWORD dwReserved, LPCTSTR szSource);
  WINAPI_MSI_ERROR  MsiSourceListAddSourceEx(       LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, WINAPI_MsiSourceType dwOptions, LPCTSTR szSource, DWORD dwIndex);
  WINAPI_MSI_ERROR  MsiSourceListClearSource(       LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, WINAPI_MsiSourceType dwOptions, LPCTSTR szSource);
  WINAPI_MSI_ERROR  MsiSourceListClearAll(          LPCTSTR szProduct, LPCTSTR szUserName, DWORD dwReserved);
  WINAPI_MSI_ERROR  MsiSourceListClearAllEx(        LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, WINAPI_MsiSourceType dwOptions);
  WINAPI_MSI_ERROR  MsiSourceListForceResolution(   LPCTSTR szProduct, LPCTSTR szUserName, DWORD dwReserved);
  WINAPI_MSI_ERROR  MsiSourceListForceResolutionEx( LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, WINAPI_MsiCode dwOptions);
  WINAPI_MSI_ERROR  MsiSourceListGetInfo(           LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, WINAPI_MsiCode dwOptions, LPCTSTR szProperty, LPTSTR szValue, LPDWORD pcchValue);
  WINAPI_MSI_ERROR  MsiSourceListSetInfo(           LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, WINAPI_MsiSourceType dwOptions, LPCTSTR szProperty, LPCTSTR szValue);
  WINAPI_MSI_ERROR  MsiSourceListEnumMediaDisks(    LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSID, MSIINSTALLCONTEXT dwContext, WINAPI_MsiCode dwOptions, DWORD dwIndex, LPWORD pdwDiskId, LPTSTR szVolumeLabel, LPDWORD pcchVolumeLabel, LPTSTR szDiskPrompt, LPDWORD pcchDiskPrompt);
  WINAPI_MSI_ERROR  MsiSourceListAddMediaDisk(      LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, WINAPI_MsiCode dwOptions, DWORD dwDiskId, LPCTSTR szVolumeLabel, LPCTSTR szDiskPrompt);
  WINAPI_MSI_ERROR  MsiSourceListClearMediaDisk(    LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, WINAPI_MsiCode dwOptions, DWORD dwDiskID);
  WINAPI_MSI_ERROR  MsiSourceListEnumSources(       LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, WINAPI_MsiSourceType dwOptions, DWORD dwIndex, LPTSTR szSource, LPDWORD pcchSource);
  WINAPI_MSI_ERROR  MsiProvideAssembly(             LPCTSTR szAssemblyName, LPCTSTR szAppContext, WINAPI_MsiInstallMode dwInstallMode, WINAPI_MsiAssemblyInfo dwAssemblyInfo, LPTSTR lpPathBuf, DWORD* pcchPathBuf);
  WINAPI_MSI_ERROR  MsiProvideComponent(            LPCTSTR szProduct, LPCTSTR szFeature, LPCTSTR szComponent, WINAPI_MsiInstallMode dwInstallMode, LPTSTR lpPathBuf, DWORD* pcchPathBuf);
  WINAPI_MSI_ERROR  MsiProvideQualifiedComponent(   LPCTSTR szComponent, LPCTSTR szQualifier, WINAPI_MsiInstallMode dwInstallMode, LPTSTR lpPathBuf, DWORD* pcchPathBuf);
  WINAPI_MSI_ERROR  MsiProvideQualifiedComponentEx( LPCTSTR szComponent, LPCTSTR szQualifier, WINAPI_MsiInstallMode dwInstallMode, LPTSTR szProduct, DWORD dwUnused1, DWORD dwUnused2, LPTSTR lpPathBuf, DWORD* pcchPathBuf);
  INSTALLSTATE      MsiGetComponentPath(            LPCTSTR szProduct, LPCTSTR szComponent, LPTSTR lpPathBuf, DWORD* pcchBuf);
  INSTALLSTATE      MsiGetComponentPathEx(          LPCTSTR szProductCode, LPCTSTR szComponentCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, LPTSTR szPathBuf, LPDWORD pcchBuf);
  INSTALLSTATE      MsiLocateComponent(             LPCTSTR szComponent, LPTSTR lpPathBuf, DWORD* pcchBuf);
  WINAPI_MSI_ERROR  MsiQueryComponentState(         LPTSTR szProductCode, LPTSTR szUserSid, MSIINSTALLCONTEXT dwContext, LPCTSTR szComponent, INSTALLSTATE* pdwState);
  WINAPI_MSI_ERROR  MsiCollectUserInfo(             LPCTSTR szProduct);
  INSTALLSTATE      MsiUseFeature(                  LPCTSTR szProduct, LPCTSTR szFeature);
  INSTALLSTATE      MsiUseFeatureEx(                LPCTSTR szProduct, LPCTSTR szFeature, WINAPI_MsiInstallMode dwInstallMode, DWORD dwReserved);
  WINAPI_MSI_ERROR  MsiGetProductCode(              LPCTSTR szComponent, LPTSTR lpProductBuf);
  WINAPI_MSI_ERROR  MsiEnumProducts(                DWORD iProductIndex, LPTSTR lpProductBuf);
  WINAPI_MSI_ERROR  MsiEnumProductsEx(              LPCTSTR szProductCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, DWORD dwIndex, TCHAR [39] szInstalledProductCode, MSIINSTALLCONTEXT* pdwInstalledContext, LPTSTR szSid, LPDWORD pcchSid);
  WINAPI_MSI_ERROR  MsiEnumRelatedProducts(         LPCTSTR lpUpgradeCode, DWORD dwReserved, DWORD iProductIndex, LPTSTR lpProductBuf);
  WINAPI_MSI_ERROR  MsiEnumFeatures(                LPCTSTR szProduct, DWORD iFeatureIndex, LPTSTR lpFeatureBuf, LPTSTR lpParentBuf);
  WINAPI_MSI_ERROR  MsiEnumComponents(              DWORD iComponentIndex, LPTSTR lpComponentBuf);
  WINAPI_MSI_ERROR  MsiEnumComponentsEx(            LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, DWORD dwIndex, TCHAR [39] szInstalledComponentCode, MSIINSTALLCONTEXT* pdwInstalledContext, LPTSTR szSid, LPDWORD pcchSid);
  WINAPI_MSI_ERROR  MsiEnumClients(                 LPCTSTR szComponent, DWORD iProductIndex, LPTSTR lpProductBuf);
  WINAPI_MSI_ERROR  MsiEnumClientsEx(               LPCTSTR szComponent, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, DWORD dwProductIndex, TCHAR [39] szProductBuf, MSIINSTALLCONTEXT* pdwInstalledContext, LPTSTR szSid, LPDWORD pcchSid);
  WINAPI_MSI_ERROR  MsiEnumComponentQualifiers(     LPTSTR szComponent, DWORD iIndex, LPTSTR lpQualifierBuf, DWORD* pcchQualifierBuf, LPTSTR lpApplicationDataBuf, DWORD* pcchApplicationDataBuf);
  INSTALLSTATE      MsiQueryFeatureState(           LPCTSTR szProduct, LPCTSTR szFeature);
  WINAPI_MSI_ERROR  MsiQueryFeatureStateEx(         LPTSTR szProductCode, LPTSTR szUserSid, MSIINSTALLCONTEXT dwContext, LPCTSTR szFeature, INSTALLSTATE* pdwState);
  INSTALLSTATE      MsiQueryProductState(           LPCTSTR szProduct);
  WINAPI_MSI_ERROR  MsiGetFeatureUsage(             LPCTSTR szProduct, LPCTSTR szFeature, DWORD* pdwUseCount, WORD* pwDateUsed);
  WINAPI_MSI_ERROR  MsiGetProductInfo(              LPCTSTR szProduct, LPCTSTR szProperty, LPTSTR lpValueBuf, DWORD* pcchValueBuf);
  WINAPI_MSI_ERROR  MsiGetProductInfoEx(            LPCTSTR szProductCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, LPCTSTR szProperty, LPTSTR lpValue, LPDWORD pcchValue);
  USERINFOSTATE     MsiGetUserInfo(                 LPCTSTR szProduct, LPTSTR lpUserNameBuf, DWORD* pcchUserNameBuf, LPTSTR lpOrgNameBuf, DWORD* pcchOrgNameBuf, LPTSTR lpSerialBuf, DWORD* pcchSerialBuf);
  WINAPI_MSI_ERROR  MsiOpenProduct(                 LPCTSTR szProduct, MSIHANDLE* hProduct);
  WINAPI_MSI_ERROR  MsiOpenPackage(                 LPCTSTR szPackagePath, MSIHANDLE* hProduct);
  WINAPI_MSI_ERROR  MsiOpenPackageEx(               LPCTSTR szPackagePath, WINAPI_MsiOpenPackageFlags dwOptions, MSIHANDLE* hProduct);
  WINAPI_MSI_ERROR  MsiIsProductElevated(           LPCTSTR szProductCode, BOOL* pfElevated);
  WINAPI_MSI_ERROR  MsiGetProductInfoFromScript(    LPCTSTR szScriptFile, LPTSTR lpProductBuf39, LANGID* plgidLanguage, DWORD* pdwVersion, LPTSTR lpNameBuf, DWORD* pcchNameBuf, LPTSTR lpPackageBuf, DWORD* pcchPackageBuf);
  WINAPI_MSI_ERROR  MsiGetProductProperty(          MSIHANDLE hProduct, LPCTSTR szProperty, LPTSTR lpValueBuf, DWORD* pcchValueBuf);
  WINAPI_MSI_ERROR  MsiGetShortcutTarget(           LPCTSTR szShortcutTarget, LPTSTR szProductCode, LPTSTR szFeatureId, LPTSTR szComponentCode);
  WINAPI_MSI_ERROR  MsiGetFeatureInfo(              MSIHANDLE hProduct, LPCTSTR szFeature, WINAPI_MsiInstallFeatureAttr* lpAttributes, LPTSTR lpTitleBuf, LPDWORD pcchTitleBuf, LPTSTR lpHelpBuf, LPDWORD pcchHelpBuf);
  WINAPI_MSI_ERROR  MsiVerifyPackage(               LPCTSTR szPackagePath);
  WINAPI_MSI_ERROR  MsiApplyPatch(                  LPCTSTR szPatchPackage, LPCTSTR szInstallPackage, INSTALLTYPE eInstallType, LPCTSTR szCommandLine);
  WINAPI_MSI_ERROR  MsiEnumPatches(                 LPCTSTR szProduct, DWORD iPatchIndex, LPTSTR lpPatchBuf, LPTSTR lpTransformsBuf, DWORD* pcchTransformsBuf);
  WINAPI_MSI_ERROR  MsiGetPatchInfo(                LPCTSTR szPatch, LPCTSTR szAttribute, LPTSTR lpValueBuf, DWORD* pcchValueBuf);
  WINAPI_MSI_ERROR  MsiRemovePatches(               LPCTSTR szPatchList, LPCTSTR szProductCode, INSTALLTYPE eUninstallType, LPCTSTR szPropertyList);
  WINAPI_MSI_ERROR  MsiDeterminePatchSequence(      LPCTSTR szProductCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, DWORD cPatchInfo, PMSIPATCHSEQUENCEINFO pPatchInfo);
  WINAPI_MSI_ERROR  MsiApplyMultiplePatches(        LPCTSTR szPatchPackages, LPCTSTR szProductCode, LPCTSTR szPropertiesList);
  WINAPI_MSI_ERROR  MsiEnumPatchesEx(               LPCTSTR szProductCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, WINAPI_MsiPatchState dwFilter, DWORD dwIndex, TCHAR [39] szPatchCode, TCHAR [39] szTargetProductCode, MSIINSTALLCONTEXT* pdwTargetProductContext, LPTSTR szTargetUserSid, LPDWORD pcchTargetUserSid);
  WINAPI_MSI_ERROR  MsiGetPatchFileList(            LPCTSTR szProductCode, LPCTSTR szPatchList, LPDWORD pcFiles, MSIHANDLE** pphFileRecords);
  WINAPI_MSI_ERROR  MsiGetPatchInfoEx(              LPCTSTR szPatchCode, LPCTSTR szProductCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, LPCTSTR szProperty, LPTSTR lpValue, DWORD* pcchValue);
  WINAPI_MSI_ERROR  MsiExtractPatchXMLData(         LPCTSTR szPatchPath, DWORD dwReserved, LPTSTR szXMLData, DWORD* pcchXMLData);
  WINAPI_MSI_ERROR  MsiDetermineApplicablePatches(  LPCTSTR szProductPackagePath, DWORD cPatchInfo, PMSIPATCHSEQUENCEINFO pPatchInfo);
  WINAPI_MSI_ERROR  MsiGetFileHash(                 LPCTSTR szFilePath, DWORD dwOptions, PMSIFILEHASHINFO pHash);
  HRESULT           MsiGetFileSignatureInformation( LPCTSTR szSignedObjectPath, WINAPI_MsiHashFlags dwFlags, PCCERT_CONTEXT* ppcCertContext, BYTE* pbHashData, DWORD* pcbHashData);
  WINAPI_MSI_ERROR  MsiGetFileVersion(              LPCTSTR szFilePath, LPTSTR lpVersionBuf, DWORD* pcchVersionBuf, LPTSTR lpLangBuf, DWORD* pcchLangBuf);
  WINAPI_MSI_ERROR  MsiBeginTransaction(            LPCWSTR szTransactionName, WINAPI_MsiTransactionAttributes dwTransactionAttributes, MSIHANDLE* hTransactionID, HANDLE* phChangeOfOwnerEvent);
  WINAPI_MSI_ERROR  MsiJoinTransaction(             MSIHANDLE hTransactionID, WINAPI_MsiTransactionAttributes dwTransactionAttributes, HANDLE* phChangeOfOwnerEvent);
  WINAPI_MSI_ERROR  MsiEndTransaction(              WINAPI_MsiTransactionState dwTransactionState);
  WINAPI_MSI_ERROR  MsiDatabaseCommit(              MSIHANDLE hDatabase);
  WINAPI_MSI_ERROR  MsiDatabaseGetPrimaryKeys(      MSIHANDLE hDatabase, LPCTSTR szTableName, MSIHANDLE* phRecord);
  MSICONDITION      MsiDatabaseIsTablePersistent(   MSIHANDLE hDatabase, LPCTSTR szTableName);
  WINAPI_MSI_ERROR  MsiDatabaseOpenView(            MSIHANDLE hDatabase, LPCTSTR szQuery, MSIHANDLE* phView);
  MSIHANDLE         MsiGetActiveDatabase(           MSIHANDLE hInstall);
  WINAPI_MSI_ERROR  MsiViewGetColumnInfo(           MSIHANDLE hView, MSICOLINFO eColumnInfo, MSIHANDLE* phRecord);
  WINAPI_MSI_ERROR  MsiOpenDatabase(                LPCTSTR szDatabasePath, LPCTSTR szPersist, MSIHANDLE* phDatabase);
  WINAPI_MSI_ERROR  MsiViewClose(                   MSIHANDLE hView);
  WINAPI_MSI_ERROR  MsiViewExecute(                 MSIHANDLE hView, MSIHANDLE hRecord);
  WINAPI_MSI_ERROR  MsiViewFetch(                   MSIHANDLE hView, MSIHANDLE* phRecord);
  MSIDBERROR        MsiViewGetError(                MSIHANDLE hView, LPTSTR szColumnNameBuffer, DWORD* pcchBuf);
  WINAPI_MSI_ERROR  MsiViewModify(                  MSIHANDLE hView, MSIMODIFY eModifyMode, MSIHANDLE hRecord);
  WINAPI_MSI_ERROR  MsiCreateTransformSummaryInfo(  MSIHANDLE hDatabase, MSIHANDLE hDatabaseReference, LPCTSTR szTransformFile, MSITRANSFORM_ERROR iErrorConditions, MSITRANSFORM_VALIDATE iValidation);
  WINAPI_MSI_ERROR  MsiDatabaseApplyTransform(      MSIHANDLE hDatabase, LPCTSTR szTransformFile, MSITRANSFORM_ERROR iErrorConditions);
  WINAPI_MSI_ERROR  MsiDatabaseExport(              MSIHANDLE hDatabase, LPCTSTR szTableName, LPCTSTR szFolderPath, LPCTSTR szFileName);
  WINAPI_MSI_ERROR  MsiDatabaseGenerateTransform(   MSIHANDLE hDatabase, MSIHANDLE hDatabaseReference, LPCTSTR szTransformFile, int iReserved1, int iReserved2);
  WINAPI_MSI_ERROR  MsiDatabaseImport(              MSIHANDLE hDatabase, LPCTSTR szFolderPath, LPCTSTR szFileName);
  WINAPI_MSI_ERROR  MsiDatabaseMerge(               MSIHANDLE hDatabase, MSIHANDLE hDatabaseMerge, LPCTSTR szTableName);
  MSIDBSTATE        MsiGetDatabaseState(            MSIHANDLE hDatabase);
  MSIHANDLE         MsiCreateRecord(                unsigned int cParams);
  WINAPI_MSI_ERROR  MsiFormatRecord(                MSIHANDLE hInstall, MSIHANDLE hRecord, LPTSTR szResultBuf, DWORD* pcchResultBuf);
  WINAPI_MSI_ERROR  MsiRecordClearData(             MSIHANDLE hRecord);
  WINAPI_MSI_ERROR  MsiRecordDataSize(              MSIHANDLE hRecord, unsigned int iField);
  WINAPI_MSI_ERROR  MsiRecordGetFieldCount(         MSIHANDLE hRecord);
  int               MsiRecordGetInteger(            MSIHANDLE hRecord, unsigned int iField);
  WINAPI_MSI_ERROR  MsiRecordGetString(             MSIHANDLE hRecord, unsigned int iField, LPTSTR szValueBuf, DWORD* pcchValueBuf);
  BOOL              MsiRecordIsNull(                MSIHANDLE hRecord, unsigned int iField);
  WINAPI_MSI_ERROR  MsiRecordReadStream(            MSIHANDLE hRecord, UINT iField, char* szDataBuf, DWORD* pcbDataBuf);
  WINAPI_MSI_ERROR  MsiRecordSetInteger(            MSIHANDLE hRecord, unsigned int iField, int iValue);
  WINAPI_MSI_ERROR  MsiRecordSetStream(             MSIHANDLE hRecord, UINT iField, LPCTSTR szFilePath);
  WINAPI_MSI_ERROR  MsiRecordSetString(             MSIHANDLE hRecord, unsigned int iField, LPCTSTR szValue);
  WINAPI_MSI_ERROR  MsiGetSummaryInformation(       MSIHANDLE hDatabase, LPCTSTR szDatabasePath, UINT uiUpdateCount, MSIHANDLE* phSummaryInfo);
  WINAPI_MSI_ERROR  MsiSummaryInfoGetProperty(      MSIHANDLE hSummaryInfo, WINAPI_MSI_PID uiProperty, WINAPI_MSI_DATA_TYPE* puiDataType, INT* piValue, FILETIME* pftValue, LPTSTR szValueBuf, DWORD* pcchValueBuf);
  WINAPI_MSI_ERROR  MsiSummaryInfoGetPropertyCount( MSIHANDLE hSummaryInfo, UINT* puiPropertyCount);
  WINAPI_MSI_ERROR  MsiSummaryInfoPersist(          MSIHANDLE hSummaryInfo);
  WINAPI_MSI_ERROR  MsiSummaryInfoSetProperty(      MSIHANDLE hSummaryInfo, WINAPI_MSI_PID uiProperty, WINAPI_MSI_DATA_TYPE uiDataType, INT iValue, FILETIME* pftValue, LPTSTR szValue);
  LANGID            MsiGetLanguage(                 MSIHANDLE hInstall);
  MSIHANDLE         MsiGetLastErrorRecord(          );
  BOOL              MsiGetMode(                     MSIHANDLE hInstall, MSIRUNMODE iRunMode);
  WINAPI_MSI_ERROR  MsiGetProperty(                 MSIHANDLE hInstall, LPCTSTR szName, LPTSTR szValueBuf, DWORD* pchValueBuf);
  WINAPI_MSI_ERROR  MsiSetProperty(                 MSIHANDLE hInstall, LPCTSTR szName, LPCTSTR szValue);
  WINAPI_MSI_ERROR  MsiSetMode(                     MSIHANDLE hInstall, unsigned int iRunMode, BOOL fState);
  WINAPI_MSI_ERROR  MsiDoAction(                    MSIHANDLE hInstall, LPCTSTR szAction);
  MSICONDITION      MsiEvaluateCondition(           MSIHANDLE hInstall, LPCTSTR szCondition);
  int               MsiProcessMessage(              MSIHANDLE hInstall, INSTALLMESSAGE eMessageType, MSIHANDLE hRecord);
  WINAPI_MSI_ERROR  MsiSequence(                    MSIHANDLE hInstall, LPCTSTR szTable, INT iSequenceMode);
  WINAPI_MSI_ERROR  MsiGetSourcePath(               MSIHANDLE hInstall, LPCTSTR szFolder, LPTSTR szPathBuf, DWORD* pcchPathBuf);
  WINAPI_MSI_ERROR  MsiGetTargetPath(               MSIHANDLE hInstall, LPCTSTR szFolder, LPTSTR szPathBuf, DWORD* pcchPathBuf);
  WINAPI_MSI_ERROR  MsiSetTargetPath(               MSIHANDLE hInstall, LPCTSTR szFolder, LPCTSTR szFolderPath);
  WINAPI_MSI_ERROR  MsiEnumComponentCosts(          MSIHANDLE hInstall, LPCTSTR szComponent, DWORD dwIndex, INSTALLSTATE iState, LPTSTR lpDriveBuf, DWORD* pcchDriveBuf, int* piCost, int* pTempCost);
  WINAPI_MSI_ERROR  MsiGetComponentState(           MSIHANDLE hInstall, LPCTSTR szComponent, INSTALLSTATE* piInstalled, INSTALLSTATE* piAction);
  WINAPI_MSI_ERROR  MsiGetFeatureCost(              MSIHANDLE hInstall, LPCTSTR szFeature, MSICOSTTREE iCostTree, INSTALLSTATE iState, INT* piCost);
  WINAPI_MSI_ERROR  MsiGetFeatureState(             MSIHANDLE hInstall, LPCTSTR szFeature, INSTALLSTATE* piInstalled, INSTALLSTATE* piAction);
  WINAPI_MSI_ERROR  MsiGetFeatureValidStates(       MSIHANDLE hInstall, LPCTSTR szFeature, WINAPI_INSTALLSTATE_DWORD* pInstallState);
  WINAPI_MSI_ERROR  MsiSetComponentState(           MSIHANDLE hInstall, LPCTSTR szComponent, INSTALLSTATE iState);
  WINAPI_MSI_ERROR  MsiSetFeatureAttributes(        MSIHANDLE hInstall, LPCTSTR szFeature, WINAPI_MsiInstallFeatureAttr dwAttributes);
  WINAPI_MSI_ERROR  MsiSetFeatureState(             MSIHANDLE hInstall, LPCTSTR szFeature, INSTALLSTATE iState);
  WINAPI_MSI_ERROR  MsiSetInstallLevel(             MSIHANDLE hInstall, int iInstallLevel);
  WINAPI_MSI_ERROR  MsiVerifyDiskSpace(             MSIHANDLE hInstall);
  WINAPI_MSI_ERROR  MsiEnableUIPreview(             MSIHANDLE hDatabase, MSIHANDLE* phPreview);
  WINAPI_MSI_ERROR  MsiPreviewBillboard(            MSIHANDLE hPreview, LPCTSTR szControlName, LPCTSTR szBillboard);
  WINAPI_MSI_ERROR  MsiPreviewDialog(               MSIHANDLE hPreview, LPCTSTR szDialogName);
]]
return ffi.load( 'Msi.dll' )

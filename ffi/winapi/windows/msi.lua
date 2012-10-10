require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/cryptography' )
require( 'ffi/winapi/headers/registry' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef unsigned long MSIHANDLE; //Alias
  typedef LPVOID INSTALLUI_HANDLER; //Alias
  typedef LPVOID PINSTALLUI_HANDLER_RECORD; //Alias
  typedef ERROR_CODE MSI_ERROR; //Alias
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
  typedef INSTALLSTATE INSTALLSTATE_DWORD; //Alias
  typedef int MsiInstallLevel; //Alias
  static const MsiInstallLevel INSTALLLEVEL_DEFAULT = 0;
  static const MsiInstallLevel INSTALLLEVEL_MINIMUM = 1;
  static const MsiInstallLevel INSTALLLEVEL_MAXIMUM = 0xFFFF;
  typedef DWORD MsiReinstallMode; //Alias
  typedef DWORD MsiInstallMode; //Alias
  static const MsiInstallMode INSTALLMODE_NODETECTION_ANY = -4;
  static const MsiInstallMode INSTALLMODE_NOSOURCERESOLUTION = -3;
  static const MsiInstallMode INSTALLMODE_NODETECTION = -2;
  static const MsiInstallMode INSTALLMODE_EXISTING = -1;
  static const MsiInstallMode INSTALLMODE_DEFAULT = 0;
  typedef UINT INSTALLTYPE; //Alias
  typedef DWORD MsiInstallLogMode; //Alias
  typedef DWORD MsiInstallLogAttributes; //Alias
  typedef DWORD MsiArchFlags; //Alias
  typedef DWORD MsiAdOptions; //Alias
  typedef DWORD MsiSourceType; //Alias
  typedef DWORD MsiCode; //Alias
  typedef DWORD MsiAssemblyInfo; //Alias
  typedef DWORD MsiOpenPackageFlags; //Alias
  typedef DWORD MsiPatchState; //Alias
  typedef DWORD MsiHashFlags; //Alias
  typedef DWORD MsiTransactionAttributes; //Alias
  typedef DWORD MsiScriptFlags; //Alias
  typedef DWORD MsiInstallFeatureAttr; //Alias
  typedef DWORD MsiTransactionState; //Alias
  static const MsiTransactionState MSITRANSACTIONSTATE_ROLLBACK = 0;
  static const MsiTransactionState MSITRANSACTIONSTATE_COMMIT = 1;
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
  typedef UINT MSI_PID; //Alias
  static const MSI_PID PID_DICTIONARY = 0;
  static const MSI_PID PID_CODEPAGE = 1;
  static const MSI_PID PID_TITLE = 2;
  static const MSI_PID PID_SUBJECT = 3;
  static const MSI_PID PID_AUTHOR = 4;
  static const MSI_PID PID_KEYWORDS = 5;
  static const MSI_PID PID_COMMENTS = 6;
  static const MSI_PID PID_TEMPLATE = 7;
  static const MSI_PID PID_LASTAUTHOR = 8;
  static const MSI_PID PID_REVNUMBER = 9;
  static const MSI_PID PID_EDITTIME = 10;
  static const MSI_PID PID_LASTPRINTED = 11;
  static const MSI_PID PID_CREATE_DTM = 12;
  static const MSI_PID PID_LASTSAVE_DTM = 13;
  static const MSI_PID PID_PAGECOUNT = 14;
  static const MSI_PID PID_WORDCOUNT = 15;
  static const MSI_PID PID_CHARCOUNT = 16;
  static const MSI_PID PID_THUMBNAIL = 17;
  static const MSI_PID PID_APPNAME = 18;
  static const MSI_PID PID_SECURITY = 19;
  typedef VARTYPE MSI_DATA_TYPE; //Alias
  INSTALLUILEVEL    MsiSetInternalUI(               INSTALLUILEVEL dwUILevel, HWND* phWnd);
  INSTALLUI_HANDLER MsiSetExternalUI(               INSTALLUI_HANDLER puiHandler, MsiInstallLogMode dwMessageFilter, LPVOID pvContext);
  MSI_ERROR         MsiSetExternalUIRecord(         PINSTALLUI_HANDLER_RECORD puiHandler, MsiInstallLogMode dwMessageFilter, LPVOID pvContext, PINSTALLUI_HANDLER_RECORD ppuiPrevHandler);
  MSI_ERROR         MsiEnableLog(                   MsiInstallLogMode dwLogMode, LPCTSTR szLogFile, MsiInstallLogAttributes dwLogAttributes);
  MSI_ERROR         MsiCloseHandle(                 MSIHANDLE hAny);
  UINT              MsiCloseAllHandles(             );
  MSI_ERROR         MsiAdvertiseProduct(            LPCTSTR szPackagePath, LPCTSTR szScriptfilePath, LPCTSTR szTransforms, LANGID lgidLanguage);
  MSI_ERROR         MsiAdvertiseProductEx(          LPCTSTR szPackagePath, LPCTSTR szScriptfilePath, LPCTSTR szTransforms, LANGID lgidLanguage, MsiArchFlags dwPlatform, MsiAdOptions dwOptions);
  MSI_ERROR         MsiAdvertiseScript(             LPCTSTR szScriptFile, MsiScriptFlags dwFlags, PHKEY phRegData, BOOL fRemoveItems);
  MSI_ERROR         MsiInstallProduct(              LPCTSTR szPackagePath, LPCTSTR szCommandLine);
  MSI_ERROR         MsiConfigureProduct(            LPCTSTR szProduct, MsiInstallLevel iInstallLevel, INSTALLSTATE eInstallState);
  MSI_ERROR         MsiConfigureProductEx(          LPCTSTR szProduct, MsiInstallLevel iInstallLevel, INSTALLSTATE eInstallState, LPCTSTR szCommandLine);
  MSI_ERROR         MsiReinstallProduct(            LPCTSTR szProduct, MsiReinstallMode dwReinstallMode);
  MSI_ERROR         MsiConfigureFeature(            LPCTSTR szProduct, LPCTSTR szFeature, INSTALLSTATE eInstallState);
  MSI_ERROR         MsiReinstallFeature(            LPCTSTR szProduct, LPCTSTR szFeature, MsiReinstallMode dwReinstallMode);
  MSI_ERROR         MsiInstallMissingComponent(     LPCTSTR szProduct, LPCTSTR szComponent, INSTALLSTATE eInstallState);
  MSI_ERROR         MsiInstallMissingFile(          LPCTSTR szProduct, LPCTSTR szFile);
  MSI_ERROR         MsiNotifySidChange(             LPCTSTR szOldSid, LPCTSTR szNewSid);
  MSI_ERROR         MsiProcessAdvertiseScript(      LPCTSTR szScriptFile, LPCTSTR szIconFolder, HKEY hRegData, BOOL fShortcuts, BOOL fRemoveItems);
  MSI_ERROR         MsiSourceListAddSource(         LPCTSTR szProduct, LPCTSTR szUserName, DWORD dwReserved, LPCTSTR szSource);
  MSI_ERROR         MsiSourceListAddSourceEx(       LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, MsiSourceType dwOptions, LPCTSTR szSource, DWORD dwIndex);
  MSI_ERROR         MsiSourceListClearSource(       LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, MsiSourceType dwOptions, LPCTSTR szSource);
  MSI_ERROR         MsiSourceListClearAll(          LPCTSTR szProduct, LPCTSTR szUserName, DWORD dwReserved);
  MSI_ERROR         MsiSourceListClearAllEx(        LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, MsiSourceType dwOptions);
  MSI_ERROR         MsiSourceListForceResolution(   LPCTSTR szProduct, LPCTSTR szUserName, DWORD dwReserved);
  MSI_ERROR         MsiSourceListForceResolutionEx( LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, MsiCode dwOptions);
  MSI_ERROR         MsiSourceListGetInfo(           LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, MsiCode dwOptions, LPCTSTR szProperty, LPTSTR szValue, LPDWORD pcchValue);
  MSI_ERROR         MsiSourceListSetInfo(           LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, MsiSourceType dwOptions, LPCTSTR szProperty, LPCTSTR szValue);
  MSI_ERROR         MsiSourceListEnumMediaDisks(    LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSID, MSIINSTALLCONTEXT dwContext, MsiCode dwOptions, DWORD dwIndex, LPWORD pdwDiskId, LPTSTR szVolumeLabel, LPDWORD pcchVolumeLabel, LPTSTR szDiskPrompt, LPDWORD pcchDiskPrompt);
  MSI_ERROR         MsiSourceListAddMediaDisk(      LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, MsiCode dwOptions, DWORD dwDiskId, LPCTSTR szVolumeLabel, LPCTSTR szDiskPrompt);
  MSI_ERROR         MsiSourceListClearMediaDisk(    LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, MsiCode dwOptions, DWORD dwDiskID);
  MSI_ERROR         MsiSourceListEnumSources(       LPCTSTR szProductCodeOrPatchCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, MsiSourceType dwOptions, DWORD dwIndex, LPTSTR szSource, LPDWORD pcchSource);
  MSI_ERROR         MsiProvideAssembly(             LPCTSTR szAssemblyName, LPCTSTR szAppContext, MsiInstallMode dwInstallMode, MsiAssemblyInfo dwAssemblyInfo, LPTSTR lpPathBuf, DWORD* pcchPathBuf);
  MSI_ERROR         MsiProvideComponent(            LPCTSTR szProduct, LPCTSTR szFeature, LPCTSTR szComponent, MsiInstallMode dwInstallMode, LPTSTR lpPathBuf, DWORD* pcchPathBuf);
  MSI_ERROR         MsiProvideQualifiedComponent(   LPCTSTR szComponent, LPCTSTR szQualifier, MsiInstallMode dwInstallMode, LPTSTR lpPathBuf, DWORD* pcchPathBuf);
  MSI_ERROR         MsiProvideQualifiedComponentEx( LPCTSTR szComponent, LPCTSTR szQualifier, MsiInstallMode dwInstallMode, LPTSTR szProduct, DWORD dwUnused1, DWORD dwUnused2, LPTSTR lpPathBuf, DWORD* pcchPathBuf);
  INSTALLSTATE      MsiGetComponentPath(            LPCTSTR szProduct, LPCTSTR szComponent, LPTSTR lpPathBuf, DWORD* pcchBuf);
  INSTALLSTATE      MsiGetComponentPathEx(          LPCTSTR szProductCode, LPCTSTR szComponentCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, LPTSTR szPathBuf, LPDWORD pcchBuf);
  INSTALLSTATE      MsiLocateComponent(             LPCTSTR szComponent, LPTSTR lpPathBuf, DWORD* pcchBuf);
  MSI_ERROR         MsiQueryComponentState(         LPTSTR szProductCode, LPTSTR szUserSid, MSIINSTALLCONTEXT dwContext, LPCTSTR szComponent, INSTALLSTATE* pdwState);
  MSI_ERROR         MsiCollectUserInfo(             LPCTSTR szProduct);
  INSTALLSTATE      MsiUseFeature(                  LPCTSTR szProduct, LPCTSTR szFeature);
  INSTALLSTATE      MsiUseFeatureEx(                LPCTSTR szProduct, LPCTSTR szFeature, MsiInstallMode dwInstallMode, DWORD dwReserved);
  MSI_ERROR         MsiGetProductCode(              LPCTSTR szComponent, LPTSTR lpProductBuf);
  MSI_ERROR         MsiEnumProducts(                DWORD iProductIndex, LPTSTR lpProductBuf);
  MSI_ERROR         MsiEnumProductsEx(              LPCTSTR szProductCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, DWORD dwIndex, TCHAR [39] szInstalledProductCode, MSIINSTALLCONTEXT* pdwInstalledContext, LPTSTR szSid, LPDWORD pcchSid);
  MSI_ERROR         MsiEnumRelatedProducts(         LPCTSTR lpUpgradeCode, DWORD dwReserved, DWORD iProductIndex, LPTSTR lpProductBuf);
  MSI_ERROR         MsiEnumFeatures(                LPCTSTR szProduct, DWORD iFeatureIndex, LPTSTR lpFeatureBuf, LPTSTR lpParentBuf);
  MSI_ERROR         MsiEnumComponents(              DWORD iComponentIndex, LPTSTR lpComponentBuf);
  MSI_ERROR         MsiEnumComponentsEx(            LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, DWORD dwIndex, TCHAR [39] szInstalledComponentCode, MSIINSTALLCONTEXT* pdwInstalledContext, LPTSTR szSid, LPDWORD pcchSid);
  MSI_ERROR         MsiEnumClients(                 LPCTSTR szComponent, DWORD iProductIndex, LPTSTR lpProductBuf);
  MSI_ERROR         MsiEnumClientsEx(               LPCTSTR szComponent, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, DWORD dwProductIndex, TCHAR [39] szProductBuf, MSIINSTALLCONTEXT* pdwInstalledContext, LPTSTR szSid, LPDWORD pcchSid);
  MSI_ERROR         MsiEnumComponentQualifiers(     LPTSTR szComponent, DWORD iIndex, LPTSTR lpQualifierBuf, DWORD* pcchQualifierBuf, LPTSTR lpApplicationDataBuf, DWORD* pcchApplicationDataBuf);
  INSTALLSTATE      MsiQueryFeatureState(           LPCTSTR szProduct, LPCTSTR szFeature);
  MSI_ERROR         MsiQueryFeatureStateEx(         LPTSTR szProductCode, LPTSTR szUserSid, MSIINSTALLCONTEXT dwContext, LPCTSTR szFeature, INSTALLSTATE* pdwState);
  INSTALLSTATE      MsiQueryProductState(           LPCTSTR szProduct);
  MSI_ERROR         MsiGetFeatureUsage(             LPCTSTR szProduct, LPCTSTR szFeature, DWORD* pdwUseCount, WORD* pwDateUsed);
  MSI_ERROR         MsiGetProductInfo(              LPCTSTR szProduct, LPCTSTR szProperty, LPTSTR lpValueBuf, DWORD* pcchValueBuf);
  MSI_ERROR         MsiGetProductInfoEx(            LPCTSTR szProductCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, LPCTSTR szProperty, LPTSTR lpValue, LPDWORD pcchValue);
  USERINFOSTATE     MsiGetUserInfo(                 LPCTSTR szProduct, LPTSTR lpUserNameBuf, DWORD* pcchUserNameBuf, LPTSTR lpOrgNameBuf, DWORD* pcchOrgNameBuf, LPTSTR lpSerialBuf, DWORD* pcchSerialBuf);
  MSI_ERROR         MsiOpenProduct(                 LPCTSTR szProduct, MSIHANDLE* hProduct);
  MSI_ERROR         MsiOpenPackage(                 LPCTSTR szPackagePath, MSIHANDLE* hProduct);
  MSI_ERROR         MsiOpenPackageEx(               LPCTSTR szPackagePath, MsiOpenPackageFlags dwOptions, MSIHANDLE* hProduct);
  MSI_ERROR         MsiIsProductElevated(           LPCTSTR szProductCode, BOOL* pfElevated);
  MSI_ERROR         MsiGetProductInfoFromScript(    LPCTSTR szScriptFile, LPTSTR lpProductBuf39, LANGID* plgidLanguage, DWORD* pdwVersion, LPTSTR lpNameBuf, DWORD* pcchNameBuf, LPTSTR lpPackageBuf, DWORD* pcchPackageBuf);
  MSI_ERROR         MsiGetProductProperty(          MSIHANDLE hProduct, LPCTSTR szProperty, LPTSTR lpValueBuf, DWORD* pcchValueBuf);
  MSI_ERROR         MsiGetShortcutTarget(           LPCTSTR szShortcutTarget, LPTSTR szProductCode, LPTSTR szFeatureId, LPTSTR szComponentCode);
  MSI_ERROR         MsiGetFeatureInfo(              MSIHANDLE hProduct, LPCTSTR szFeature, MsiInstallFeatureAttr* lpAttributes, LPTSTR lpTitleBuf, LPDWORD pcchTitleBuf, LPTSTR lpHelpBuf, LPDWORD pcchHelpBuf);
  MSI_ERROR         MsiVerifyPackage(               LPCTSTR szPackagePath);
  MSI_ERROR         MsiApplyPatch(                  LPCTSTR szPatchPackage, LPCTSTR szInstallPackage, INSTALLTYPE eInstallType, LPCTSTR szCommandLine);
  MSI_ERROR         MsiEnumPatches(                 LPCTSTR szProduct, DWORD iPatchIndex, LPTSTR lpPatchBuf, LPTSTR lpTransformsBuf, DWORD* pcchTransformsBuf);
  MSI_ERROR         MsiGetPatchInfo(                LPCTSTR szPatch, LPCTSTR szAttribute, LPTSTR lpValueBuf, DWORD* pcchValueBuf);
  MSI_ERROR         MsiRemovePatches(               LPCTSTR szPatchList, LPCTSTR szProductCode, INSTALLTYPE eUninstallType, LPCTSTR szPropertyList);
  MSI_ERROR         MsiDeterminePatchSequence(      LPCTSTR szProductCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, DWORD cPatchInfo, PMSIPATCHSEQUENCEINFO pPatchInfo);
  MSI_ERROR         MsiApplyMultiplePatches(        LPCTSTR szPatchPackages, LPCTSTR szProductCode, LPCTSTR szPropertiesList);
  MSI_ERROR         MsiEnumPatchesEx(               LPCTSTR szProductCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, MsiPatchState dwFilter, DWORD dwIndex, TCHAR [39] szPatchCode, TCHAR [39] szTargetProductCode, MSIINSTALLCONTEXT* pdwTargetProductContext, LPTSTR szTargetUserSid, LPDWORD pcchTargetUserSid);
  MSI_ERROR         MsiGetPatchFileList(            LPCTSTR szProductCode, LPCTSTR szPatchList, LPDWORD pcFiles, MSIHANDLE** pphFileRecords);
  MSI_ERROR         MsiGetPatchInfoEx(              LPCTSTR szPatchCode, LPCTSTR szProductCode, LPCTSTR szUserSid, MSIINSTALLCONTEXT dwContext, LPCTSTR szProperty, LPTSTR lpValue, DWORD* pcchValue);
  MSI_ERROR         MsiExtractPatchXMLData(         LPCTSTR szPatchPath, DWORD dwReserved, LPTSTR szXMLData, DWORD* pcchXMLData);
  MSI_ERROR         MsiDetermineApplicablePatches(  LPCTSTR szProductPackagePath, DWORD cPatchInfo, PMSIPATCHSEQUENCEINFO pPatchInfo);
  MSI_ERROR         MsiGetFileHash(                 LPCTSTR szFilePath, DWORD dwOptions, PMSIFILEHASHINFO pHash);
  HRESULT           MsiGetFileSignatureInformation( LPCTSTR szSignedObjectPath, MsiHashFlags dwFlags, PCCERT_CONTEXT* ppcCertContext, BYTE* pbHashData, DWORD* pcbHashData);
  MSI_ERROR         MsiGetFileVersion(              LPCTSTR szFilePath, LPTSTR lpVersionBuf, DWORD* pcchVersionBuf, LPTSTR lpLangBuf, DWORD* pcchLangBuf);
  MSI_ERROR         MsiBeginTransaction(            LPCWSTR szTransactionName, MsiTransactionAttributes dwTransactionAttributes, MSIHANDLE* hTransactionID, HANDLE* phChangeOfOwnerEvent);
  MSI_ERROR         MsiJoinTransaction(             MSIHANDLE hTransactionID, MsiTransactionAttributes dwTransactionAttributes, HANDLE* phChangeOfOwnerEvent);
  MSI_ERROR         MsiEndTransaction(              MsiTransactionState dwTransactionState);
  MSI_ERROR         MsiDatabaseCommit(              MSIHANDLE hDatabase);
  MSI_ERROR         MsiDatabaseGetPrimaryKeys(      MSIHANDLE hDatabase, LPCTSTR szTableName, MSIHANDLE* phRecord);
  MSICONDITION      MsiDatabaseIsTablePersistent(   MSIHANDLE hDatabase, LPCTSTR szTableName);
  MSI_ERROR         MsiDatabaseOpenView(            MSIHANDLE hDatabase, LPCTSTR szQuery, MSIHANDLE* phView);
  MSIHANDLE         MsiGetActiveDatabase(           MSIHANDLE hInstall);
  MSI_ERROR         MsiViewGetColumnInfo(           MSIHANDLE hView, MSICOLINFO eColumnInfo, MSIHANDLE* phRecord);
  MSI_ERROR         MsiOpenDatabase(                LPCTSTR szDatabasePath, LPCTSTR szPersist, MSIHANDLE* phDatabase);
  MSI_ERROR         MsiViewClose(                   MSIHANDLE hView);
  MSI_ERROR         MsiViewExecute(                 MSIHANDLE hView, MSIHANDLE hRecord);
  MSI_ERROR         MsiViewFetch(                   MSIHANDLE hView, MSIHANDLE* phRecord);
  MSIDBERROR        MsiViewGetError(                MSIHANDLE hView, LPTSTR szColumnNameBuffer, DWORD* pcchBuf);
  MSI_ERROR         MsiViewModify(                  MSIHANDLE hView, MSIMODIFY eModifyMode, MSIHANDLE hRecord);
  MSI_ERROR         MsiCreateTransformSummaryInfo(  MSIHANDLE hDatabase, MSIHANDLE hDatabaseReference, LPCTSTR szTransformFile, MSITRANSFORM_ERROR iErrorConditions, MSITRANSFORM_VALIDATE iValidation);
  MSI_ERROR         MsiDatabaseApplyTransform(      MSIHANDLE hDatabase, LPCTSTR szTransformFile, MSITRANSFORM_ERROR iErrorConditions);
  MSI_ERROR         MsiDatabaseExport(              MSIHANDLE hDatabase, LPCTSTR szTableName, LPCTSTR szFolderPath, LPCTSTR szFileName);
  MSI_ERROR         MsiDatabaseGenerateTransform(   MSIHANDLE hDatabase, MSIHANDLE hDatabaseReference, LPCTSTR szTransformFile, int iReserved1, int iReserved2);
  MSI_ERROR         MsiDatabaseImport(              MSIHANDLE hDatabase, LPCTSTR szFolderPath, LPCTSTR szFileName);
  MSI_ERROR         MsiDatabaseMerge(               MSIHANDLE hDatabase, MSIHANDLE hDatabaseMerge, LPCTSTR szTableName);
  MSIDBSTATE        MsiGetDatabaseState(            MSIHANDLE hDatabase);
  MSIHANDLE         MsiCreateRecord(                unsigned int cParams);
  MSI_ERROR         MsiFormatRecord(                MSIHANDLE hInstall, MSIHANDLE hRecord, LPTSTR szResultBuf, DWORD* pcchResultBuf);
  MSI_ERROR         MsiRecordClearData(             MSIHANDLE hRecord);
  MSI_ERROR         MsiRecordDataSize(              MSIHANDLE hRecord, unsigned int iField);
  MSI_ERROR         MsiRecordGetFieldCount(         MSIHANDLE hRecord);
  int               MsiRecordGetInteger(            MSIHANDLE hRecord, unsigned int iField);
  MSI_ERROR         MsiRecordGetString(             MSIHANDLE hRecord, unsigned int iField, LPTSTR szValueBuf, DWORD* pcchValueBuf);
  BOOL              MsiRecordIsNull(                MSIHANDLE hRecord, unsigned int iField);
  MSI_ERROR         MsiRecordReadStream(            MSIHANDLE hRecord, UINT iField, char* szDataBuf, DWORD* pcbDataBuf);
  MSI_ERROR         MsiRecordSetInteger(            MSIHANDLE hRecord, unsigned int iField, int iValue);
  MSI_ERROR         MsiRecordSetStream(             MSIHANDLE hRecord, UINT iField, LPCTSTR szFilePath);
  MSI_ERROR         MsiRecordSetString(             MSIHANDLE hRecord, unsigned int iField, LPCTSTR szValue);
  MSI_ERROR         MsiGetSummaryInformation(       MSIHANDLE hDatabase, LPCTSTR szDatabasePath, UINT uiUpdateCount, MSIHANDLE* phSummaryInfo);
  MSI_ERROR         MsiSummaryInfoGetProperty(      MSIHANDLE hSummaryInfo, MSI_PID uiProperty, MSI_DATA_TYPE* puiDataType, INT* piValue, FILETIME* pftValue, LPTSTR szValueBuf, DWORD* pcchValueBuf);
  MSI_ERROR         MsiSummaryInfoGetPropertyCount( MSIHANDLE hSummaryInfo, UINT* puiPropertyCount);
  MSI_ERROR         MsiSummaryInfoPersist(          MSIHANDLE hSummaryInfo);
  MSI_ERROR         MsiSummaryInfoSetProperty(      MSIHANDLE hSummaryInfo, MSI_PID uiProperty, MSI_DATA_TYPE uiDataType, INT iValue, FILETIME* pftValue, LPTSTR szValue);
  LANGID            MsiGetLanguage(                 MSIHANDLE hInstall);
  MSIHANDLE         MsiGetLastErrorRecord(          );
  BOOL              MsiGetMode(                     MSIHANDLE hInstall, MSIRUNMODE iRunMode);
  MSI_ERROR         MsiGetProperty(                 MSIHANDLE hInstall, LPCTSTR szName, LPTSTR szValueBuf, DWORD* pchValueBuf);
  MSI_ERROR         MsiSetProperty(                 MSIHANDLE hInstall, LPCTSTR szName, LPCTSTR szValue);
  MSI_ERROR         MsiSetMode(                     MSIHANDLE hInstall, unsigned int iRunMode, BOOL fState);
  MSI_ERROR         MsiDoAction(                    MSIHANDLE hInstall, LPCTSTR szAction);
  MSICONDITION      MsiEvaluateCondition(           MSIHANDLE hInstall, LPCTSTR szCondition);
  int               MsiProcessMessage(              MSIHANDLE hInstall, INSTALLMESSAGE eMessageType, MSIHANDLE hRecord);
  MSI_ERROR         MsiSequence(                    MSIHANDLE hInstall, LPCTSTR szTable, INT iSequenceMode);
  MSI_ERROR         MsiGetSourcePath(               MSIHANDLE hInstall, LPCTSTR szFolder, LPTSTR szPathBuf, DWORD* pcchPathBuf);
  MSI_ERROR         MsiGetTargetPath(               MSIHANDLE hInstall, LPCTSTR szFolder, LPTSTR szPathBuf, DWORD* pcchPathBuf);
  MSI_ERROR         MsiSetTargetPath(               MSIHANDLE hInstall, LPCTSTR szFolder, LPCTSTR szFolderPath);
  MSI_ERROR         MsiEnumComponentCosts(          MSIHANDLE hInstall, LPCTSTR szComponent, DWORD dwIndex, INSTALLSTATE iState, LPTSTR lpDriveBuf, DWORD* pcchDriveBuf, int* piCost, int* pTempCost);
  MSI_ERROR         MsiGetComponentState(           MSIHANDLE hInstall, LPCTSTR szComponent, INSTALLSTATE* piInstalled, INSTALLSTATE* piAction);
  MSI_ERROR         MsiGetFeatureCost(              MSIHANDLE hInstall, LPCTSTR szFeature, MSICOSTTREE iCostTree, INSTALLSTATE iState, INT* piCost);
  MSI_ERROR         MsiGetFeatureState(             MSIHANDLE hInstall, LPCTSTR szFeature, INSTALLSTATE* piInstalled, INSTALLSTATE* piAction);
  MSI_ERROR         MsiGetFeatureValidStates(       MSIHANDLE hInstall, LPCTSTR szFeature, INSTALLSTATE_DWORD* pInstallState);
  MSI_ERROR         MsiSetComponentState(           MSIHANDLE hInstall, LPCTSTR szComponent, INSTALLSTATE iState);
  MSI_ERROR         MsiSetFeatureAttributes(        MSIHANDLE hInstall, LPCTSTR szFeature, MsiInstallFeatureAttr dwAttributes);
  MSI_ERROR         MsiSetFeatureState(             MSIHANDLE hInstall, LPCTSTR szFeature, INSTALLSTATE iState);
  MSI_ERROR         MsiSetInstallLevel(             MSIHANDLE hInstall, int iInstallLevel);
  MSI_ERROR         MsiVerifyDiskSpace(             MSIHANDLE hInstall);
  MSI_ERROR         MsiEnableUIPreview(             MSIHANDLE hDatabase, MSIHANDLE* phPreview);
  MSI_ERROR         MsiPreviewBillboard(            MSIHANDLE hPreview, LPCTSTR szControlName, LPCTSTR szBillboard);
  MSI_ERROR         MsiPreviewDialog(               MSIHANDLE hPreview, LPCTSTR szDialogName);
]]
ffi.load( 'Msi.dll' )

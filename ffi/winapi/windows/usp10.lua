require( "ffi/winapi/headers/windows" )
require( "ffi/winapi/headers/gdi" )
local ffi = require( "ffi" )
ffi.cdef [[
  HRESULT         ScriptApplyDigitSubstitution(  SCRIPT_DIGITSUBSTITUTE* psds, SCRIPT_CONTROL* psc, SCRIPT_STATE* pss);
  HRESULT         ScriptApplyLogicalWidth(       int* piDx, int cChars, int cGlyphs, WORD* pwLogClust, SCRIPT_VISATTR* psva, int* piAdvance, SCRIPT_ANALYSIS* psa, ABC* pABC, int* piJustify);
  HRESULT         ScriptBreak(                   WCHAR* pwcChars, int cChars, SCRIPT_ANALYSIS* psa, SCRIPT_LOGATTR* psla);
  HRESULT         ScriptCacheGetHeight(          HDC hdc, SCRIPT_CACHE* psc, long* tmHeight);
  HRESULT         ScriptCPtoX(                   int iCP, BOOL fTrailing, int cChars, int cGlyphs, WORD* pwLogClust, SCRIPT_VISATTR* psva, int* piAdvance, SCRIPT_ANALYSIS* psa, int* piX);
  HRESULT         ScriptFreeCache(               SCRIPT_CACHE* psc);
  HRESULT         ScriptGetCMap(                 HDC hdc, SCRIPT_CACHE* psc, WCHAR* pwcInChars, int cChars, WINAPI_SGCM_FLAGS dwFlags, WORD* pwOutGlyphs);
  HRESULT         ScriptGetFontAlternateGlyphs(  HDC hdc, SCRIPT_CACHE* psc, SCRIPT_ANALYSIS* psa, OPENTYPE_TAG tagScript, OPENTYPE_TAG tagLangSys, OPENTYPE_TAG tagFeature, WORD wGlyphId, int cMaxAlternates, WORD* pAlternateGlyphs, int* pcAlternates);
  HRESULT         ScriptGetFontFeatureTags(      HDC hdc, SCRIPT_CACHE* psc, SCRIPT_ANALYSIS* psa, OPENTYPE_TAG tagScript, OPENTYPE_TAG tagLangSys, int cMaxTags, OPENTYPE_TAG* pFeatureTags, int* pcTags);
  HRESULT         ScriptGetFontLanguageTags(     HDC hdc, SCRIPT_CACHE* psc, SCRIPT_ANALYSIS* psa, OPENTYPE_TAG tagScript, int cMaxTags, OPENTYPE_TAG* pLangSysTags, int* pcTags);
  HRESULT         ScriptGetFontProperties(       HDC hdc, SCRIPT_CACHE* psc, SCRIPT_FONTPROPERTIES* sfp);
  HRESULT         ScriptGetFontScriptTags(       HDC hdc, SCRIPT_CACHE* psc, SCRIPT_ANALYSIS* psa, int cMaxTags, OPENTYPE_TAG* pScriptTags, int* pcTags);
  HRESULT         ScriptGetGlyphABCWidth(        HDC hdc, SCRIPT_CACHE* psc, WORD wGlyph, ABC* pABC);
  HRESULT         ScriptGetLogicalWidths(        SCRIPT_ANALYSIS* psa, int cChars, int cGlyphs, int* piGlyphWidth, WORD* pwLogClust, SCRIPT_VISATTR* psva, int* piDx);
  HRESULT         ScriptGetProperties(           SCRIPT_PROPERTIES*** ppSp, int* piNumScripts);
  HRESULT         ScriptIsComplex(               WCHAR* pwcInChars, int cInChars, WINAPI_SIC_FLAGS dwFlags);
  HRESULT         ScriptItemize(                 WCHAR* pwcInChars, int cInChars, int cMaxItems, SCRIPT_CONTROL* psControl, SCRIPT_STATE* psState, SCRIPT_ITEM* pItems, int* pcItems);
  HRESULT         ScriptItemizeOpenType(         WCHAR* pwcInChars, int cInChars, int cMaxItems, SCRIPT_CONTROL* psControl, SCRIPT_STATE* psState, SCRIPT_ITEM* pItems, OPENTYPE_TAG* pScriptTags, int* pcItems);
  HRESULT         ScriptJustify(                 SCRIPT_VISATTR* psva, int* piAdvance, int cGlyphs, int iDx, int iMinKashida, int* piJustify);
  HRESULT         ScriptLayout(                  int cRuns, BYTE* pbLevel, int* piVisualToLogical, int* piLogicalToVisual);
  HRESULT         ScriptPlace(                   HDC hdc, SCRIPT_CACHE* psc, WORD* pwGlyphs, int cGlyphs, SCRIPT_VISATTR* psva, SCRIPT_ANALYSIS* psa, int* piAdvance, GOFFSET* pGoffset, ABC* pABC);
  HRESULT         ScriptPlaceOpenType(           HDC hdc, SCRIPT_CACHE* psc, SCRIPT_ANALYSIS* psa, OPENTYPE_TAG tagScript, OPENTYPE_TAG tagLangSys, int* rcRangeChars, TEXTRANGE_PROPERTIES** rpRangeProperties, int cRanges, WCHAR* pwcChars, WORD* pwLogClust, SCRIPT_CHARPROP* pCharProps, int cChars, WORD* pwGlyphs, SCRIPT_GLYPHPROP* pGlyphProps, int cGlyphs, int* piAdvance, GOFFSET* pGoffset, ABC* pABC);
  HRESULT         ScriptPositionSingleGlyph(     HDC hdc, SCRIPT_CACHE* psc, SCRIPT_ANALYSIS* psa, OPENTYPE_TAG tagScript, OPENTYPE_TAG tagLangSys, OPENTYPE_TAG tagFeature, LONG lParameter, WORD wGlyphId, int iAdvance, GOFFSET Goffset, int* piOutAdvance, GOFFSET* pOutGoffset);
  HRESULT         ScriptRecordDigitSubstitution( LCID Locale, SCRIPT_DIGITSUBSTITUTE* psds);
  HRESULT         ScriptShape(                   HDC hdc, SCRIPT_CACHE* psc, WCHAR* pwcChars, int cChars, int cMaxGlyphs, SCRIPT_ANALYSIS* psa, WORD* pwOutGlyphs, WORD* pwLogClust, SCRIPT_VISATTR* psva, int* pcGlyphs);
  HRESULT         ScriptShapeOpenType(           HDC hdc, SCRIPT_CACHE* psc, SCRIPT_ANALYSIS* psa, OPENTYPE_TAG tagScript, OPENTYPE_TAG tagLangSys, int* rcRangeChars, TEXTRANGE_PROPERTIES** rpRangeProperties, int cRanges, WCHAR* pwcChars, int cChars, int cMaxGlyphs, WORD* pwLogClust, SCRIPT_CHARPROP* pCharProps, WORD* pwOutGlyphs, SCRIPT_GLYPHPROP* pOutGlyphProps, int* pcGlyphs);
  HRESULT         ScriptStringAnalyse(           HDC hdc, void* pString, int cString, int cGlyphs, int iCharset, WINAPI_SSA_FLAGS dwFlags, int iReqWidth, SCRIPT_CONTROL* psControl, SCRIPT_STATE* psState, int* piDx, SCRIPT_TABDEF* pTabdef, BYTE* pbInClass, SCRIPT_STRING_ANALYSIS* pssa);
  HRESULT         ScriptStringCPtoX(             SCRIPT_STRING_ANALYSIS ssa, int icp, BOOL fTrailing, int* pX);
  HRESULT         ScriptStringFree(              SCRIPT_STRING_ANALYSIS* pssa);
  HRESULT         ScriptStringGetLogicalWidths(  SCRIPT_STRING_ANALYSIS ssa, int* piDx);
  HRESULT         ScriptStringGetOrder(          SCRIPT_STRING_ANALYSIS ssa, UINT* puOrder);
  HRESULT         ScriptStringOut(               SCRIPT_STRING_ANALYSIS ssa, int iX, int iY, WINAPI_ExtTextOutFlags uOptions, RECT* prc, int iMinSel, int iMaxSel, BOOL fDisabled);
  int*            ScriptString_pcOutChars(       SCRIPT_STRING_ANALYSIS ssa);
  SCRIPT_LOGATTR* ScriptString_pLogAttr(         SCRIPT_STRING_ANALYSIS ssa);
  SIZE*           ScriptString_pSize(            SCRIPT_STRING_ANALYSIS ssa);
  HRESULT         ScriptStringValidate(          SCRIPT_STRING_ANALYSIS ssa);
  HRESULT         ScriptStringXtoCP(             SCRIPT_STRING_ANALYSIS ssa, int iX, int* piCh, int* piTrailing);
  HRESULT         ScriptSubstituteSingleGlyph(   HDC hdc, SCRIPT_CACHE* psc, SCRIPT_ANALYSIS* psa, OPENTYPE_TAG tagScript, OPENTYPE_TAG tagLangSys, OPENTYPE_TAG tagFeature, LONG lParameter, WORD wGlyphId, WORD* pwOutGlyphId);
  HRESULT         ScriptTextOut(                 HDC hdc, SCRIPT_CACHE* psc, int x, int y, WINAPI_ExtTextOutFlags fuOptions, RECT* lprc, SCRIPT_ANALYSIS* psa, WCHAR* pwcReserved, int iReserved, WORD* pwGlyphs, int cGlyphs, int* piAdvance, int* piJustify, GOFFSET* pGoffset);
  HRESULT         ScriptXtoCP(                   int iX, int cChars, int cGlyphs, WORD* pwLogClust, SCRIPT_VISATTR* psva, int* piAdvance, SCRIPT_ANALYSIS* psa, int* piCP, int* piTrailing);
]]
return ffi.load( "Usp10.dll" )

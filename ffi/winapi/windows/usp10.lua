require( 'ffi/winapi/headers/windows' )
require( 'ffi/winapi/headers/gdi' )
local ffi = require( 'ffi' )
ffi.cdef [[
  HRESULT                ScriptApplyDigitSubstitution(  WINAPI_SCRIPT_DIGITSUBSTITUTE* psds, SCRIPT_CONTROL* psc, SCRIPT_STATE* pss);
  HRESULT                ScriptApplyLogicalWidth(       WINAPI_int* piDx, int cChars, int cGlyphs, WINAPI_WORD* pwLogClust, WINAPI_SCRIPT_VISATTR* psva, WINAPI_int* piAdvance, WINAPI_SCRIPT_ANALYSIS* psa, ABC* pABC, int* piJustify);
  HRESULT                ScriptBreak(                   WINAPI_WCHAR* pwcChars, int cChars, WINAPI_SCRIPT_ANALYSIS* psa, SCRIPT_LOGATTR* psla);
  HRESULT                ScriptCacheGetHeight(          HDC hdc, SCRIPT_CACHE* psc, long* tmHeight);
  HRESULT                ScriptCPtoX(                   int iCP, BOOL fTrailing, int cChars, int cGlyphs, WINAPI_WORD* pwLogClust, WINAPI_SCRIPT_VISATTR* psva, WINAPI_int* piAdvance, WINAPI_SCRIPT_ANALYSIS* psa, int* piX);
  HRESULT                ScriptFreeCache(               SCRIPT_CACHE* psc);
  HRESULT                ScriptGetCMap(                 HDC hdc, SCRIPT_CACHE* psc, WINAPI_WCHAR* pwcInChars, int cChars, WINAPI_SGCM_FLAGS dwFlags, WORD* pwOutGlyphs);
  HRESULT                ScriptGetFontAlternateGlyphs(  HDC hdc, SCRIPT_CACHE* psc, SCRIPT_ANALYSIS* psa, OPENTYPE_TAG tagScript, OPENTYPE_TAG tagLangSys, OPENTYPE_TAG tagFeature, WORD wGlyphId, int cMaxAlternates, WORD* pAlternateGlyphs, int* pcAlternates);
  HRESULT                ScriptGetFontFeatureTags(      HDC hdc, SCRIPT_CACHE* psc, SCRIPT_ANALYSIS* psa, OPENTYPE_TAG tagScript, OPENTYPE_TAG tagLangSys, int cMaxTags, OPENTYPE_TAG* pFeatureTags, int* pcTags);
  HRESULT                ScriptGetFontLanguageTags(     HDC hdc, SCRIPT_CACHE* psc, SCRIPT_ANALYSIS* psa, OPENTYPE_TAG tagScript, int cMaxTags, OPENTYPE_TAG* pLangSysTags, int* pcTags);
  HRESULT                ScriptGetFontProperties(       HDC hdc, SCRIPT_CACHE* psc, SCRIPT_FONTPROPERTIES* sfp);
  HRESULT                ScriptGetFontScriptTags(       HDC hdc, SCRIPT_CACHE* psc, SCRIPT_ANALYSIS* psa, int cMaxTags, OPENTYPE_TAG* pScriptTags, int* pcTags);
  HRESULT                ScriptGetGlyphABCWidth(        HDC hdc, SCRIPT_CACHE* psc, WORD wGlyph, ABC* pABC);
  HRESULT                ScriptGetLogicalWidths(        WINAPI_SCRIPT_ANALYSIS* psa, int cChars, int cGlyphs, WINAPI_int* piGlyphWidth, WINAPI_WORD* pwLogClust, WINAPI_SCRIPT_VISATTR* psva, int* piDx);
  HRESULT                ScriptGetProperties(           WINAPI_SCRIPT_PROPERTIES*** ppSp, int* piNumScripts);
  HRESULT                ScriptIsComplex(               WINAPI_WCHAR* pwcInChars, int cInChars, WINAPI_SIC_FLAGS dwFlags);
  HRESULT                ScriptItemize(                 WINAPI_WCHAR* pwcInChars, int cInChars, int cMaxItems, WINAPI_SCRIPT_CONTROL* psControl, WINAPI_SCRIPT_STATE* psState, SCRIPT_ITEM* pItems, int* pcItems);
  HRESULT                ScriptItemizeOpenType(         WINAPI_WCHAR* pwcInChars, int cInChars, int cMaxItems, WINAPI_SCRIPT_CONTROL* psControl, WINAPI_SCRIPT_STATE* psState, SCRIPT_ITEM* pItems, OPENTYPE_TAG* pScriptTags, int* pcItems);
  HRESULT                ScriptJustify(                 WINAPI_SCRIPT_VISATTR* psva, WINAPI_int* piAdvance, int cGlyphs, int iDx, int iMinKashida, int* piJustify);
  HRESULT                ScriptLayout(                  int cRuns, WINAPI_BYTE* pbLevel, int* piVisualToLogical, int* piLogicalToVisual);
  HRESULT                ScriptPlace(                   HDC hdc, SCRIPT_CACHE* psc, WINAPI_WORD* pwGlyphs, int cGlyphs, WINAPI_SCRIPT_VISATTR* psva, SCRIPT_ANALYSIS* psa, int* piAdvance, GOFFSET* pGoffset, ABC* pABC);
  HRESULT                ScriptPlaceOpenType(           HDC hdc, SCRIPT_CACHE* psc, SCRIPT_ANALYSIS* psa, OPENTYPE_TAG tagScript, OPENTYPE_TAG tagLangSys, int* rcRangeChars, TEXTRANGE_PROPERTIES** rpRangeProperties, int cRanges, WINAPI_WCHAR* pwcChars, WORD* pwLogClust, SCRIPT_CHARPROP* pCharProps, int cChars, WINAPI_WORD* pwGlyphs, WINAPI_SCRIPT_GLYPHPROP* pGlyphProps, int cGlyphs, int* piAdvance, GOFFSET* pGoffset, ABC* pABC);
  HRESULT                ScriptPositionSingleGlyph(     HDC hdc, SCRIPT_CACHE* psc, SCRIPT_ANALYSIS* psa, OPENTYPE_TAG tagScript, OPENTYPE_TAG tagLangSys, OPENTYPE_TAG tagFeature, LONG lParameter, WORD wGlyphId, int iAdvance, GOFFSET Goffset, int* piOutAdvance, GOFFSET* pOutGoffset);
  HRESULT                ScriptRecordDigitSubstitution( LCID Locale, SCRIPT_DIGITSUBSTITUTE* psds);
  HRESULT                ScriptShape(                   HDC hdc, SCRIPT_CACHE* psc, WINAPI_WCHAR* pwcChars, int cChars, int cMaxGlyphs, SCRIPT_ANALYSIS* psa, WORD* pwOutGlyphs, WORD* pwLogClust, SCRIPT_VISATTR* psva, int* pcGlyphs);
  HRESULT                ScriptShapeOpenType(           HDC hdc, SCRIPT_CACHE* psc, SCRIPT_ANALYSIS* psa, OPENTYPE_TAG tagScript, OPENTYPE_TAG tagLangSys, int* rcRangeChars, TEXTRANGE_PROPERTIES** rpRangeProperties, int cRanges, WINAPI_WCHAR* pwcChars, int cChars, int cMaxGlyphs, WORD* pwLogClust, SCRIPT_CHARPROP* pCharProps, WORD* pwOutGlyphs, SCRIPT_GLYPHPROP* pOutGlyphProps, int* pcGlyphs);
  HRESULT                ScriptStringAnalyse(           HDC hdc, WINAPI_void* pString, int cString, int cGlyphs, int iCharset, WINAPI_SSA_FLAGS dwFlags, int iReqWidth, SCRIPT_CONTROL* psControl, SCRIPT_STATE* psState, WINAPI_int* piDx, SCRIPT_TABDEF* pTabdef, WINAPI_BYTE* pbInClass, SCRIPT_STRING_ANALYSIS* pssa);
  HRESULT                ScriptStringCPtoX(             SCRIPT_STRING_ANALYSIS ssa, int icp, BOOL fTrailing, int* pX);
  HRESULT                ScriptStringFree(              SCRIPT_STRING_ANALYSIS* pssa);
  HRESULT                ScriptStringGetLogicalWidths(  SCRIPT_STRING_ANALYSIS ssa, int* piDx);
  HRESULT                ScriptStringGetOrder(          SCRIPT_STRING_ANALYSIS ssa, UINT* puOrder);
  HRESULT                ScriptStringOut(               SCRIPT_STRING_ANALYSIS ssa, int iX, int iY, WINAPI_ExtTextOutFlags uOptions, WINAPI_RECT* prc, int iMinSel, int iMaxSel, BOOL fDisabled);
  WINAPI_int*            ScriptString_pcOutChars(       SCRIPT_STRING_ANALYSIS ssa);
  WINAPI_SCRIPT_LOGATTR* ScriptString_pLogAttr(         SCRIPT_STRING_ANALYSIS ssa);
  WINAPI_SIZE*           ScriptString_pSize(            SCRIPT_STRING_ANALYSIS ssa);
  HRESULT                ScriptStringValidate(          SCRIPT_STRING_ANALYSIS ssa);
  HRESULT                ScriptStringXtoCP(             SCRIPT_STRING_ANALYSIS ssa, int iX, int* piCh, int* piTrailing);
  HRESULT                ScriptSubstituteSingleGlyph(   HDC hdc, SCRIPT_CACHE* psc, SCRIPT_ANALYSIS* psa, OPENTYPE_TAG tagScript, OPENTYPE_TAG tagLangSys, OPENTYPE_TAG tagFeature, LONG lParameter, WORD wGlyphId, WORD* pwOutGlyphId);
  HRESULT                ScriptTextOut(                 WINAPI_HDC hdc, SCRIPT_CACHE* psc, int x, int y, WINAPI_ExtTextOutFlags fuOptions, WINAPI_RECT* lprc, WINAPI_SCRIPT_ANALYSIS* psa, WINAPI_WCHAR* pwcReserved, int iReserved, WINAPI_WORD* pwGlyphs, int cGlyphs, WINAPI_int* piAdvance, WINAPI_int* piJustify, WINAPI_GOFFSET* pGoffset);
  HRESULT                ScriptXtoCP(                   int iX, int cChars, int cGlyphs, WINAPI_WORD* pwLogClust, WINAPI_SCRIPT_VISATTR* psva, WINAPI_int* piAdvance, WINAPI_SCRIPT_ANALYSIS* psa, int* piCP, int* piTrailing);
]]
return ffi.load( 'Usp10.dll' )

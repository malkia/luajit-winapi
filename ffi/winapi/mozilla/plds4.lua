require( 'ffi/winapi/mozilla/nspr' )
local ffi = require( 'ffi' )
ffi.cdef [[
  PLHashTable* PL_NewHashTable(              PRUint32 numBuckets, PLHashFunction keyHash, PLHashComparator keyCompare, PLHashComparator valueCompare, WINAPI_PLHashAllocOps* allocOps, void* allocPriv);
  void         PL_HashTableDestroy(          PLHashTable* ht);
  PLHashEntry* PL_HashTableAdd(              PLHashTable* ht, WINAPI_void* key, void* value);
  PRBool       PL_HashTableRemove(           PLHashTable* ht, WINAPI_void* key);
  void*        PL_HashTableLookup(           PLHashTable* ht, WINAPI_void* key);
  PRIntn       PL_HashTableEnumerateEntries( PLHashTable* ht, PLHashEnumerator f, void* arg);
  PLHashNumber PL_HashString(                WINAPI_void* key);
  PRIntn       PL_CompareStrings(            WINAPI_char* v1, WINAPI_char* v2);
  PRIntn       PL_CompareValues(             void* v1, WINAPI_void* v2);
]]
return ffi.load( 'plds4.dll' )

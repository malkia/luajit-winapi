require( "ffi/winapi/mozilla/nspr" )
local ffi = require( "ffi" )
ffi.cdef [[
  PLHashTable* PL_NewHashTable(              PRUint32 numBuckets, PLHashFunction keyHash, PLHashComparator keyCompare, PLHashComparator valueCompare, PLHashAllocOps* allocOps, void* allocPriv);
  void         PL_HashTableDestroy(          PLHashTable* ht);
  PLHashEntry* PL_HashTableAdd(              PLHashTable* ht, void* key, void* value);
  PRBool       PL_HashTableRemove(           PLHashTable* ht, void* key);
  void*        PL_HashTableLookup(           PLHashTable* ht, void* key);
  PRIntn       PL_HashTableEnumerateEntries( PLHashTable* ht, PLHashEnumerator f, void* arg);
  PLHashNumber PL_HashString(                void* key);
  PRIntn       PL_CompareStrings(            char* v1, char* v2);
  PRIntn       PL_CompareValues(             void* v1, void* v2);
]]
return ffi.load( "plds4.dll" )

require( 'ffi/winapi/mozilla/nspr' )
local ffi = require( 'ffi' )
ffi.cdef [[
  typedef LPVOID PLHashFunction; //Alias
  typedef LPVOID PLHashComparator; //Alias
  typedef LPVOID PLHashEnumerator; //Alias
  typedef PRUint32 PLHashNumber; //Alias
//typedef LPVOID PLHashAllocOps*; //Alias
  typedef struct PLHashEntry {
    LPVOID next;
    PLHashNumber keyHash;
    void* key;
    void* value;
  } PLHashEntry;
  typedef struct PLHashTable {
    PLHashEntry** buckets;
    PRUint32 nentries;
    PRUint32 shift;
    PLHashFunction keyHash;
    PLHashComparator keyCompare;
    PLHashComparator valueCompare;
    PLHashAllocOps* allocOps;
    void* allocPriv;
    PRUint32 nlookups;
    PRUint32 nsteps;
    PRUint32 ngrows;
    PRUint32 nshrinks;
  } PLHashTable;
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
return ffi.load( 'plds4.dll' )

# Date Serialization Challenge in Next.js API Routes

## Problem Statement

When Date objects are returned from database queries through Next.js API routes, they undergo automatic JSON serialization which converts them to ISO 8601 strings. This causes runtime errors when client-side code expects Date objects and calls Date methods like `.getTime()`.

### The Flow

```
1. DB Query (PostgreSQL) → Returns timestamp as Date object ✅
2. API Route Handler → Receives Date object ✅
3. Next.js JSON Serialization → Converts Date → ISO string (automatic)
4. Client Receives Response → Has ISO string, not Date ❌
5. Component Uses .getTime() → TypeError: getTime is not a function ❌
```

### Example Error

```javascript
// VerifyGroupModal.tsx:24
const canVerify = !groupData?.lastVerifiedAt ||
  Date.now() - groupData.lastVerifiedAt.getTime() > GROUP_VERIFICATION_COOLDOWN_MS;
//               ^^^^^^^^^^^^^^^^^^^^^^^^^^
// TypeError: groupData.lastVerifiedAt.getTime is not a function
```

## Current Solution (As of 2025-11-13)

**Location:** `apps/quilombo/query/group.ts`

Convert ISO strings back to Date objects after receiving API responses:

```typescript
const fetchGroup = async (id: string): Promise<Group> =>
  axios.get(`/api/groups/${id}`).then((response) => {
    const data = response.data;
    // Convert lastVerifiedAt from ISO string to Date object
    if (data.lastVerifiedAt) {
      data.lastVerifiedAt = new Date(data.lastVerifiedAt);
    }
    return data;
  });

const searchGroups = async ({ offset, pageSize, searchTerm }: SearchParams): Promise<GroupSearchResult> => {
  // ... query params
  return axios.get(`/api/groups${queryParams}`).then((response) => {
    const result = response.data;
    // Convert lastVerifiedAt from ISO string to Date object for each group
    result.data = result.data.map((group: Group) => ({
      ...group,
      lastVerifiedAt: group.lastVerifiedAt ? new Date(group.lastVerifiedAt) : null,
    }));
    return result;
  });
};
```

### Why This is Acceptable (For Now)

- **Only one Date field is actively used:** `lastVerifiedAt` in VerifyGroupModal
- **Other Date fields exist but are unused:** `createdAt`, `claimedAt` are sent to client but never accessed
- **Manual conversion is explicit:** Easy to understand and debug
- **No additional dependencies:** Keeps bundle size small

### Limitations

- **Not scalable:** Every new Date field usage requires manual conversion
- **Error-prone:** Easy to forget conversion when adding new queries
- **Inconsistent:** Some queries convert dates, others don't (if they don't need to)
- **Duplicated code:** Same conversion logic repeated across multiple query functions

## Future Solutions (When More Date Fields Are Used)

### Option 2: Global Axios Response Interceptor

Create a centralized interceptor that automatically converts all ISO date strings to Date objects.

**Implementation:**

```typescript
// apps/quilombo/lib/axios.ts
import axios from 'axios';

// ISO 8601 date string regex (simplified)
const ISO_DATE_REGEX = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(\.\d{3})?Z?$/;

function convertDates(obj: any): any {
  if (obj === null || obj === undefined) return obj;

  // Handle arrays
  if (Array.isArray(obj)) {
    return obj.map(convertDates);
  }

  // Handle objects
  if (typeof obj === 'object') {
    const converted: any = {};
    for (const [key, value] of Object.entries(obj)) {
      // Convert string values that match ISO date format
      if (typeof value === 'string' && ISO_DATE_REGEX.test(value)) {
        converted[key] = new Date(value);
      } else {
        converted[key] = convertDates(value);
      }
    }
    return converted;
  }

  return obj;
}

// Add response interceptor
axios.interceptors.response.use(
  (response) => {
    // Only process JSON responses
    if (response.headers['content-type']?.includes('application/json')) {
      response.data = convertDates(response.data);
    }
    return response;
  },
  (error) => Promise.reject(error)
);

export default axios;
```

**Usage:**

```typescript
// apps/quilombo/query/group.ts
import axios from '@/lib/axios'; // Use custom axios instance

// No manual conversion needed - interceptor handles it
const fetchGroup = async (id: string): Promise<Group> =>
  axios.get(`/api/groups/${id}`).then((response) => response.data);
```

**Pros:**
- ✅ Automatic conversion everywhere
- ✅ DRY - write once, works for all queries
- ✅ Consistent behavior across entire app
- ✅ Future-proof - works with new Date fields automatically

**Cons:**
- ❌ Magic behavior - less explicit
- ❌ Potential false positives (strings that look like dates but aren't)
- ❌ Performance overhead on every response
- ❌ Harder to debug date-related issues
- ❌ Must replace all `axios` imports with custom instance

**Best For:**
- Apps with many Date fields across multiple models
- When consistency is more important than explicitness
- Teams that prefer convention over configuration

### Option 3: SuperJSON for Automatic Serialization/Deserialization

Use [superjson](https://github.com/blitz-js/superjson) library to handle complex data types including Date, Map, Set, undefined, BigInt, etc.

**Installation:**

```bash
pnpm add superjson
```

**Implementation:**

```typescript
// apps/quilombo/lib/api.ts
import superjson from 'superjson';
import axios from 'axios';

// Custom axios instance with superjson transformation
const api = axios.create();

api.interceptors.response.use(
  (response) => {
    if (response.headers['content-type']?.includes('application/json')) {
      // superjson.parse handles Date conversion automatically
      response.data = superjson.parse(JSON.stringify(response.data));
    }
    return response;
  }
);

export default api;
```

**API Route Changes Required:**

```typescript
// apps/quilombo/app/api/groups/[groupId]/route.ts
import superjson from 'superjson';

export async function GET(request: NextRequest, { params }: RouteParamsGroup) {
  const group = await fetchGroup(groupId);

  // Instead of NextResponse.json(group)
  return new Response(superjson.stringify(group), {
    headers: { 'Content-Type': 'application/json' },
  });
}
```

**Pros:**
- ✅ Handles Date and other complex types (Map, Set, BigInt, etc.)
- ✅ Type-safe - works with TypeScript
- ✅ Explicit - uses special JSON format with metadata
- ✅ Battle-tested - used by Blitz.js framework
- ✅ No regex false positives

**Cons:**
- ❌ Requires changes to both client AND server
- ❌ Additional dependency (~7KB gzipped)
- ❌ Custom JSON format (not standard JSON)
- ❌ Requires team to understand superjson conventions
- ❌ All API routes must be updated to use superjson.stringify

**Best For:**
- Apps that need to serialize complex types beyond just Date
- Monorepo/full-stack TypeScript projects
- When you control both client and server
- Teams already using Blitz.js or similar frameworks

## Recommendation

### Short Term (Current Approach)
Continue with **manual conversion in query layer** for `lastVerifiedAt`:
- Only one Date field is actively used
- Simple, explicit, easy to understand
- No dependencies or architectural changes

### Medium Term (If 3-5 Date Fields Become Active)
Consider **Option 2: Axios Interceptor**:
- Provides automatic conversion without changing API routes
- Can be implemented incrementally
- Lower barrier to adoption than superjson

### Long Term (If Using Many Complex Types)
Evaluate **Option 3: SuperJSON**:
- Best for apps with Date, Map, Set, BigInt, etc.
- Requires coordinated rollout across API routes
- Consider when building new features or major refactors

## Related Files

- Current implementation: `apps/quilombo/query/group.ts`
- Date conversion in DB layer: `apps/quilombo/db/queries/groups.ts` (lines 81-84, 138-147)
- Type definitions: `apps/quilombo/types/model.ts`
- Affected component: `apps/quilombo/components/groups/GroupProfile/VerifyGroupModal.tsx`

## References

- [superjson GitHub](https://github.com/blitz-js/superjson)
- [Axios Interceptors Documentation](https://axios-http.com/docs/interceptors)
- [Next.js JSON Serialization](https://nextjs.org/docs/app/building-your-application/rendering/server-components#how-are-server-components-rendered)
- Related commit: `3a3a608 - fix: convert lastVerifiedAt from string to Date object in group queries`

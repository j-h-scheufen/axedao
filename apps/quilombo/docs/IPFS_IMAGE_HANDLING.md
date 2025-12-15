# IPFS Image Handling

This document describes how images are stored and managed using IPFS via Pinata.

## Overview

Images (avatars, logos, banners, portraits, event images) are uploaded to IPFS via Pinata and stored as CIDs (Content Identifiers) in the database.

**Key insight**: IPFS is content-addressed, meaning the same file content always produces the same CID. This has important implications for how we handle unpinning.

## The Problem

Since identical files produce identical CIDs:

1. **Cross-user sharing**: User A and User B upload the same photo → both reference `CID-X`
2. **Same-user multi-reference**: User syncs avatar to portrait → `users.avatar` and `person_profiles.portrait` both reference `CID-X`

If we naively unpin when a user deletes their avatar, we'd break references for other users or other columns.

## Solution: Check-Before-Unpin

Before unpinning any CID, we check if it's still referenced anywhere in the database.

### CID Columns Checked

| Table | Column(s) |
|-------|-----------|
| `users` | `avatar` |
| `groups` | `logo`, `banner` |
| `events` | `image` |
| `genealogy.person_profiles` | `portrait` |
| `genealogy.group_profiles` | `logo` |

### Key Functions

```typescript
// db/queries/images.ts
isCidReferenced(cid: string): Promise<boolean>
countCidReferences(cid: string): Promise<{...}>

// utils/pinata.ts
pinToGroup(buffer, name): Promise<{cid, error}>  // Upload only, no unpin
unpinIfNotReferenced(cid): Promise<boolean>       // Safe unpin
unpin(cid): Promise<void>                         // Direct unpin (use carefully)
```

## Correct Sequence for Replacing Images

The order of operations is critical. **Update the database BEFORE attempting to unpin.**

```typescript
// ✅ CORRECT
const oldCid = record.image;
const { cid: newCid } = await pinToGroup(buffer, filename);
await updateRecord({ image: newCid });  // DB no longer references oldCid
await unpinIfNotReferenced(oldCid);     // Safe to check now

// ❌ WRONG - Don't unpin before DB update
const oldCid = record.image;
const { cid: newCid } = await pinToGroup(buffer, filename);
await unpinIfNotReferenced(oldCid);     // Will find oldCid still in DB!
await updateRecord({ image: newCid });
```

**Why?** `isCidReferenced()` queries the database. If you check before updating, it will find the old CID still referenced and skip the unpin.

## Example: Avatar Update

```typescript
// api/profile/avatar/route.ts - POST handler
const oldAvatar = user.avatar;

const imageBuffer = await createImageBuffer(file, 'userAvatar');
const { cid } = await pinToGroup(imageBuffer, filename);

// 1. Update user record (removes reference to old CID)
const updatedUser = await updateUser({ ...user, avatar: cid });

// 2. Safely unpin old CID (only if not referenced elsewhere)
if (oldAvatar && oldAvatar !== cid) {
  await unpinIfNotReferenced(oldAvatar).catch((err) => {
    console.error('Failed to unpin old avatar:', err.message);
  });
}
```

## Scenarios

| Scenario | What Happens |
|----------|--------------|
| User replaces avatar | Old CID unpinned (if not used elsewhere) |
| User syncs avatar to portrait, then replaces avatar | Old CID NOT unpinned (still in portrait) |
| User A and B upload same file, A deletes | CID NOT unpinned (still used by B) |
| User deletes genealogy profile with portrait | Portrait CID unpinned (if not used elsewhere) |

## Routes Using This Pattern

All image-handling routes follow this pattern:

- `api/profile/avatar` (POST, DELETE)
- `api/groups/[groupId]/logo` (POST, DELETE)
- `api/groups/[groupId]/banner` (POST, DELETE)
- `api/events/[eventId]` (PATCH, DELETE)
- `api/profile/genealogy` (PATCH, DELETE)

## Adding New Image Columns

If you add a new image CID column:

1. Add it to `isCidReferenced()` in `db/queries/images.ts`
2. Add it to `countCidReferences()` for debugging
3. Follow the same update-then-unpin pattern in your route handlers

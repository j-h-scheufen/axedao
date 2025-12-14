# Flow 1: Publish Profile to Genealogy

## Overview

This flow allows app users to opt-in to the public Capoeira Genealogy by creating a `genealogy.person_profiles` entry and linking it to their `public.users` account via `profile_id`.

**Key Principle**: User profile data (`public.users`) is private; genealogy data (`genealogy.person_profiles`) is public. Publishing is a conscious decision with explicit field syncing.

## CRITICAL: User Education & Consent

### The Explainer Box (REQUIRED)

Every first-time visitor to `/profile/genealogy` (user without `profileId`) MUST see a prominent explainer box before the form. This is not optional - users need to understand what they're opting into.

#### Explainer Content

**Heading**: "Join the Capoeira Genealogy"

**Body Text**:
> The Capoeira Genealogy is a **publicly accessible database** documenting the history, lineages, and connections within the global Capoeira community.
>
> By publishing your profile, you are contributing to this living historical record. The information you share here will be:
>
> - **Publicly visible** to anyone browsing the genealogy (including non-registered users)
> - **Searchable** as part of the lineage network
> - **Permanent** (though you can delete your profile later, cached copies may exist)
>
> **What gets published:**
> - Your Capoeira name (apelido), title, and portrait
> - Your biography and style
> - Your declared relationships (mestre, students, group affiliations)
>
> **What stays private:**
> - Your email, phone, and personal contact information
> - Your wallet address
> - Your private social media links

**Actions**:
- "I understand, continue" → Shows the form
- "Cancel" → Returns to `/profile`

#### Visual Design

```
┌─────────────────────────────────────────────────────────────────────────┐
│ 🌍 JOIN THE CAPOEIRA GENEALOGY                                          │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  The Capoeira Genealogy is a publicly accessible database               │
│  documenting the history, lineages, and connections within              │
│  the global Capoeira community.                                         │
│                                                                         │
│  By publishing your profile, you are contributing to this               │
│  living historical record.                                              │
│                                                                         │
│  ┌───────────────────────────────────────────────────────────────────┐  │
│  │ ⚠️  IMPORTANT: The information you share will be:                 │  │
│  │                                                                   │  │
│  │  • Publicly visible to anyone (including non-registered users)   │  │
│  │  • Searchable as part of the lineage network                      │  │
│  │  • Part of the permanent historical record                        │  │
│  └───────────────────────────────────────────────────────────────────┘  │
│                                                                         │
│  ✅ What gets published:                                                │
│     • Your Capoeira name (apelido), title, and portrait                │
│     • Your biography and style                                          │
│     • Your declared relationships (mestres, groups)                     │
│                                                                         │
│  🔒 What stays private:                                                 │
│     • Your email, phone, and contact information                        │
│     • Your wallet address                                               │
│     • Your personal social media links                                  │
│                                                                         │
├─────────────────────────────────────────────────────────────────────────┤
│                    [Cancel]  [I Understand, Continue →]                 │
└─────────────────────────────────────────────────────────────────────────┘
```

#### Implementation Notes

- Use a Card component with `bg-warning-50` or similar attention-grabbing but not alarming color
- The explainer should NOT appear for returning users (those with existing `profileId`)
- Store consent acknowledgment in form state, not separately tracked
- Make the "I Understand" button primary, "Cancel" secondary

## User Journey

### Entry Point

**Profile Actions Dropdown** (similar to `GroupActionsDropdown`):
- Add `ProfileActionsDropdown` component to `/profile` page
- Menu items:
  - "Edit Profile" → `/profile/edit` (existing private profile)
  - "Genealogy Profile" → `/profile/genealogy` (new page)
    - Label changes based on state:
      - No `profileId`: "Publish to Genealogy"
      - Has `profileId`: "Edit Genealogy Profile"

### Page: `/profile/genealogy`

A dedicated page for managing the user's genealogy presence.

#### Layout Structure

```
┌─────────────────────────────────────────────────────────────┐
│ PageHeading: "Genealogy Profile" (back → /profile)          │
├─────────────────────────────────────────────────────────────┤
│ SYNC SECTION (side-by-side)                                 │
│ ┌─────────────────┬──────────┬─────────────────┐            │
│ │ Your Profile    │  Sync    │ Genealogy       │            │
│ ├─────────────────┼──────────┼─────────────────┤            │
│ │ [Avatar]        │ [Switch] │ [Portrait]      │            │
│ │ nickname        │ [Switch] │ apelido *       │            │
│ │                 │          │ apelidoContext  │  (if needed)
│ │ name            │ [Switch] │ name            │            │
│ │ title           │ [Switch] │ title           │            │
│ └─────────────────┴──────────┴─────────────────┘            │
├─────────────────────────────────────────────────────────────┤
│ GENEALOGY-ONLY FIELDS (enabled after initial publish)       │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ Style: [Select]                                         │ │
│ │ Bio (EN): [Textarea]                                    │ │
│ │ Bio (PT): [Textarea]                                    │ │
│ │ Public Links: [LinksArray]                              │ │
│ └─────────────────────────────────────────────────────────┘ │
├─────────────────────────────────────────────────────────────┤
│ RELATIONSHIPS SECTION (enabled after initial publish)       │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │ [+ Add Relationship]                                    │ │
│ │                                                         │ │
│ │ ┌─────────────────────────────────────────────────────┐ │ │
│ │ │ student_of → Mestre X          [unverified] [Delete]│ │ │
│ │ │ member_of → Group Y            [unverified] [Delete]│ │ │
│ │ └─────────────────────────────────────────────────────┘ │ │
│ └─────────────────────────────────────────────────────────┘ │
├─────────────────────────────────────────────────────────────┤
│ ACTIONS                                                     │
│ [Save/Publish]                    [Delete Genealogy Profile]│
└─────────────────────────────────────────────────────────────┘
```

#### Sync Section Behavior

**Switch States:**
- OFF: Genealogy field is editable independently
- ON: Genealogy field mirrors user data (read-only, grayed out)

**On Toggle ON:**
- Copy current user value to genealogy field
- Genealogy field becomes read-only

**On Toggle OFF:**
- Genealogy field becomes editable
- Value remains (not cleared)

**Apelido Uniqueness Check:**
- On blur/change of apelido field, check if apelido exists in `person_profiles`
- If exists: Show `apelidoContext` field with message "This apelido already exists. Please provide context to distinguish yourself."
- If unique: Hide `apelidoContext` field

#### Person-to-Person Predicates (for relationships)
- `student_of` - "I am/was a student of..."
- `trained_under` - "I train/trained under..."
- `influenced_by` - "I am/was influenced by..."
- `family_of` - "I am family of..."

#### Person-to-Group Predicates (for relationships)
- `member_of` - "I am/was a member of..."
- `associated_with` - "I am/was associated with..."
- `departed_from` - "I departed from..."

**Note**: Leadership predicates (`teaches_at`, `founded`, `co_founded`, `leads`, `regional_coordinator_of`, `cultural_pioneer_of`) are managed from the Group side when group admins designate teachers and leaders. Users should not self-declare these relationships.

#### Confidence Level
- All self-declared relationships are created with `confidence: 'unverified'`

## Technical Implementation

### New Files

```
apps/quilombo/
├── app/(main)/profile/
│   └── genealogy/
│       └── page.tsx                    # New page
├── components/
│   ├── Profile/
│   │   ├── ProfileActionsDropdown.tsx  # New (similar to GroupActionsDropdown)
│   │   └── index.ts                    # Update exports
│   └── genealogy/
│       └── profile/
│           ├── GenealogyProfileForm.tsx    # Main Formik form
│           ├── SyncSection.tsx             # Side-by-side sync UI
│           ├── SyncField.tsx               # Individual sync row
│           ├── GenealogyFieldsSection.tsx  # Bio, style, links
│           ├── RelationshipsSection.tsx    # Manage relationships
│           ├── AddRelationshipModal.tsx    # Modal to add relationship
│           ├── DeleteProfileModal.tsx      # Confirmation modal
│           └── index.ts
├── query/
│   └── genealogyProfile.ts             # React Query hooks
└── config/
    └── validation-schema.ts            # Add genealogy form schema
```

### Database Operations

```sql
-- Create new person profile (on first publish)
INSERT INTO genealogy.person_profiles (
  apelido, apelido_context, name, title, portrait, style, bio_en, bio_pt, public_links
) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
RETURNING id;

-- Link to user
UPDATE public.users SET profile_id = $profileId WHERE id = $userId;

-- Add relationship
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id, confidence, created_by
) VALUES ('person', $profileId, $predicate, $objectType, $objectId, 'unverified', $userId);

-- Delete profile (handled by deletePersonProfile in db/queries/genealogy.ts)
-- Already deletes related statements
```

### API Endpoints

#### POST /api/profile/genealogy
Create or update the current user's genealogy profile.

**Request:**
```typescript
interface GenealogyProfileRequest {
  // Syncable fields
  portrait?: string;
  apelido: string;  // required
  apelidoContext?: string;
  name?: string;
  title?: Title;
  // Genealogy-only fields
  style?: Style;
  bioEn?: string;
  bioPt?: string;
  publicLinks?: SocialLink[];
}
```

**Response:**
```typescript
interface GenealogyProfileResponse {
  profileId: string;
  message: string;
}
```

#### DELETE /api/profile/genealogy
Delete the current user's genealogy profile.

#### GET /api/genealogy/persons/check-apelido?apelido=X
Check if apelido exists.

**Response:**
```typescript
{ exists: boolean; profiles?: { id: string; name: string; apelidoContext?: string }[] }
```

#### POST /api/profile/genealogy/relationships
Add a relationship.

**Request:**
```typescript
interface AddRelationshipRequest {
  predicate: Predicate;
  objectType: 'person' | 'group';
  objectId: string;
  properties?: StatementProperties;
  startedAt?: string;
  endedAt?: string;
}
```

#### DELETE /api/profile/genealogy/relationships/[statementId]
Delete a relationship.

#### GET /api/profile/genealogy/relationships
Get current user's genealogy relationships (where they are the subject).

### State Management

**User data access:** Use same pattern as `/profile/edit`:
```typescript
const { data: user } = useAtomValue(currentUserAtom);
```

**Genealogy profile:** Use React Query:
```typescript
// Fetch genealogy profile if user has profileId
const { data: genealogyProfile } = useQuery({
  queryKey: ['genealogy', 'profile', user?.profileId],
  queryFn: () => fetchPersonProfile(user!.profileId!),
  enabled: !!user?.profileId,
});
```

### Form State (Formik)

```typescript
interface GenealogyProfileFormValues {
  // Sync toggles
  syncPortrait: boolean;
  syncApelido: boolean;
  syncName: boolean;
  syncTitle: boolean;
  // Profile data
  portrait?: string;
  apelido: string;
  apelidoContext?: string;
  name?: string;
  title?: Title;
  style?: Style;
  bioEn?: string;
  bioPt?: string;
  publicLinks: SocialLink[];
}
```

### Validation Schema

```typescript
export const genealogyProfileSchema = object().shape({
  apelido: string().required('Apelido is required'),
  apelidoContext: string().when('apelidoExists', {
    is: true,
    then: (schema) => schema.required('Context is required when apelido already exists'),
  }),
  name: string().nullable(),
  title: string().oneOf([...titles, undefined]).nullable(),
  style: string().oneOf([...styles, undefined]).nullable(),
  bioEn: string().max(5000, 'Bio must be less than 5000 characters').nullable(),
  bioPt: string().max(5000, 'Bio must be less than 5000 characters').nullable(),
  publicLinks: array().of(socialLinkSchema),
});
```

## User's Public Profile Enhancement

On `/users/[userId]` page, if the viewed user has a `profileId`:
- Show "View Genealogy Profile" button
- Opens `FullDetailsModal` component (already exists and handles sparse data)

## Edge Cases

### Apelido Already Exists
- Auto-detect on blur
- Show `apelidoContext` field
- Validate that context is provided before save

### User Deletes Genealogy Profile
- Confirmation modal with warning
- Deletes `person_profiles` entry and all related statements
- Sets `users.profile_id` to null
- User can re-publish later

### Portrait Sync
- Uses same `ImageUpload` component as profile edit
- When synced, displays user's avatar
- When unsynced, can upload different image

## Implementation Order

1. **Phase 1: Core Structure**
   - Create `ProfileActionsDropdown` component
   - Create `/profile/genealogy` page skeleton
   - Add route and navigation

2. **Phase 2: Sync Section**
   - Implement `SyncSection` and `SyncField` components
   - Apelido uniqueness check API
   - Basic form with Formik

3. **Phase 3: Save/Publish**
   - API endpoint for create/update
   - Link `profileId` to user
   - Success/error handling

4. **Phase 4: Genealogy Fields**
   - Style selector
   - Bio textareas (EN/PT)
   - Public links array

5. **Phase 5: Relationships**
   - Relationships list component
   - Add relationship modal with person/group search
   - Predicate selector (filtered by object type)
   - Delete relationship

6. **Phase 6: Delete Profile**
   - Delete confirmation modal
   - API endpoint
   - Cleanup and redirect

7. **Phase 7: Public Profile Enhancement**
   - Add "View Genealogy Profile" button to `/users/[userId]`
   - Integrate `FullDetailsModal`

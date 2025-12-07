# Flow 1: Publish Profile to Genealogy

## Overview

This flow allows app users to opt-in to the public Capoeira Genealogy by creating a `genealogy.person_profiles` entry and linking it to their `public.users` account via `profile_id`.

**Key Principle**: User profile data (`public.users`) is private; genealogy data (`genealogy.person_profiles`) is public. Publishing is a conscious, one-time decision with explicit field selection.

## User Journey

### Entry Points

1. **Account Settings**: "Join Capoeira Genealogy" button in profile/settings
2. **Genealogy Page**: "Publish Your Profile" CTA when viewing the genealogy tree
3. **Onboarding**: Optional step during new user registration

### Flow Steps

#### Step 1: Introduction Screen

**Purpose**: Explain what publishing means

**Content**:
```
Join the Capoeira Genealogy

The Capoeira Genealogy is a public historical record of our community's
lineages and traditions. By publishing your profile, you become part
of this living documentation.

What gets published:
- Your capoeira name (apelido) and title
- Your training lineage (who taught you)
- Group affiliations
- A public portrait (optional)
- Public references (Wikipedia, articles, not personal social media)

What stays private:
- Your email and phone
- Your personal social media links
- Your wallet address
- All other account settings

[Continue] [Cancel]
```

#### Step 2: Profile Information

**Purpose**: Collect/confirm genealogy-specific data

**Form Fields**:

| Field | Source | Required | Notes |
|-------|--------|----------|-------|
| Name (fullname) | User input (can prefill from users.name) | No | "How you want to appear in historical records" |
| Apelido | User input (can prefill from users.nickname) | Yes | "Your capoeira name" |
| Title | Dropdown (genealogy.title enum) | No | Pre-selected from users.title if set |
| Portrait | Upload new | No | "A public-facing image for the genealogy (can differ from your profile avatar)" |
| Bio | Textarea | No | "Brief biography for the genealogy record" |
| Public Links | URL list | No | "Wikipedia, articles, group websites - not personal social media" |

**Validation**:
- Apelido required (this is the primary identifier in genealogy)
- Portrait must be image (max 2MB)
- Public links must be valid URLs, suggest filtering out social media domains

#### Step 3: Lineage Declaration (Optional)

**Purpose**: Connect to training lineage

**UI**: Searchable person selector

```
Who taught you capoeira?

Search for your mestre/teacher in the genealogy...
[Search field with autocomplete]

Found: Mestre [Name]
- Not found? You can add this later

Your primary group:
[Search field for groups]

[Skip for now] [Continue]
```

**Backend**:
- If teacher selected: Create `student_of` predicate with `confidence: 'unverified'`
- If group selected: Create `member_of` predicate with `confidence: 'unverified'`

#### Step 4: Review & Confirm

**Purpose**: Final review before publishing

```
Review Your Genealogy Profile

Name: [displayed name]
Apelido: [apelido]
Title: [title]
Portrait: [thumbnail]
Bio: [bio preview]
Links: [list of links]

Teacher: [teacher name or "Not specified"]
Primary Group: [group name or "Not specified"]

This information will be publicly visible in the Capoeira Genealogy.

[Edit] [Cancel] [Publish Profile]
```

#### Step 5: Success

```
Welcome to the Genealogy!

Your profile has been published. You can now:
- View your genealogy profile
- Add more lineage connections
- Update your genealogy data anytime

[View My Genealogy Profile] [Return to Dashboard]
```

## Technical Implementation

### Database Operations

```sql
-- Transaction: Create profile and link to user
BEGIN;

-- 1. Insert person_profile
INSERT INTO genealogy.person_profiles (
  name, apelido, title, portrait, public_links, bio
) VALUES (
  $name, $apelido, $title, $portrait, $publicLinks, $bio
) RETURNING id;

-- 2. Link to user
UPDATE public.users
SET profile_id = $profileId
WHERE id = $userId;

-- 3. Create lineage predicates if provided
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id, confidence, created_by
) VALUES
  ('person', $profileId, 'student_of', 'person', $teacherId, 'unverified', $userId),
  ('person', $profileId, 'member_of', 'group', $groupId, 'unverified', $userId);

COMMIT;
```

### API Endpoints

#### POST /api/genealogy/publish-profile

**Request**:
```typescript
interface PublishProfileRequest {
  name?: string;
  apelido: string;  // required
  title?: Title;
  portrait?: string;  // URL from image upload
  bio?: string;
  publicLinks?: string[];
  teacherId?: string;  // UUID of teacher's person_profile
  groupId?: string;    // UUID of group_profile
}
```

**Response**:
```typescript
interface PublishProfileResponse {
  profileId: string;
  message: string;
}
```

**Validation**:
- User must be authenticated
- User must NOT already have a profile_id (use claim flow instead)
- Apelido required and non-empty
- Portrait URL must be valid if provided
- Teacher/group IDs must exist if provided

### Frontend Components

```
/components/genealogy/
  PublishWizard/
    index.tsx           # Main wizard container
    IntroStep.tsx       # Step 1
    ProfileInfoStep.tsx # Step 2 (with form)
    LineageStep.tsx     # Step 3
    ReviewStep.tsx      # Step 4
    SuccessStep.tsx     # Step 5
    types.ts            # Shared types
```

### State Management

Use Formik for multi-step form with persistence:

```typescript
interface PublishWizardState {
  currentStep: 1 | 2 | 3 | 4 | 5;
  profileData: {
    name?: string;
    apelido: string;
    title?: Title;
    portrait?: File | string;
    bio?: string;
    publicLinks: string[];
  };
  lineageData: {
    teacherId?: string;
    teacherName?: string;
    groupId?: string;
    groupName?: string;
  };
}
```

## Edge Cases

### User Already Has profile_id

If user already has `users.profile_id` set:
- Redirect to genealogy profile edit page
- Show message: "You've already published your genealogy profile"

### Duplicate Apelido Check

Before publishing:
- Search for existing person_profiles with same apelido
- If found, warn user: "There's already a profile with this name. Is this you?"
- Offer to claim instead (redirect to claim flow)

### Portrait Upload Failure

- Allow continuing without portrait
- Save progress and retry option
- Don't block the publish flow

## Security Considerations

1. **Authentication Required**: All endpoints require valid session
2. **Rate Limiting**: Limit profile creation to prevent spam
3. **Input Sanitization**: Sanitize bio and links for XSS
4. **Image Validation**: Validate uploaded images (type, size, dimensions)

## Success Metrics

- Conversion rate: Users who start wizard → complete publishing
- Drop-off points: Which step has highest abandonment
- Lineage completeness: % of published profiles with teacher/group connections

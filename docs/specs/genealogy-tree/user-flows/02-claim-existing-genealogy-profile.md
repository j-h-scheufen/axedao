# Flow 2: Claim Existing Genealogy Profile

## Overview

This flow allows app users to claim ownership of an existing `genealogy.person_profiles` entry that was created by community curation (not by the user themselves). This is how a mestre who joins the app connects to their pre-existing genealogy profile.

**Key Principle**: Claims require verification to prevent impersonation. Deceased persons cannot be claimed (their profiles are managed differently). Claims use the existing group claims mechanism as a model.

## Claim Scenarios

### Scenario A: Living Person, Unclaimed Profile
- Profile exists in genealogy (community-created)
- `public.users.profile_id` is NULL for all users → not yet claimed
- User claims: "This is me"
- Requires admin verification

### Scenario B: Living Person, Already Claimed
- Profile already linked to another user
- Should be rare (duplicate accounts?)
- Requires admin intervention to resolve

### Scenario C: Deceased Person
- Profile has `death_year` set
- Cannot be claimed
- Managed via genealogy curation (separate flow)

## User Journey

### Entry Point

User browses genealogy and finds their profile:

```
Mestre [Apelido]
[Portrait]
Style: Angola
Teacher: Mestre [Teacher Name]
...

[Is this you? Claim this profile]
```

### Step 1: Verification Check

**System checks**:
1. Is profile already claimed? → Show "Already linked to an account"
2. Is person deceased? → Hide claim button, show "Historical profile"
3. Is current user already linked to a profile? → Show "You already have a genealogy profile"

### Step 2: Claim Confirmation

```
Claim This Profile

You're about to claim the genealogy profile for:
Mestre [Apelido]

This will link your Quilombo account to this genealogy profile,
allowing you to:
- Edit your genealogy information
- Add lineage connections
- Appear as a verified member in the genealogy

Your claim will be reviewed by an administrator before approval.

[Cancel] [Submit Claim]
```

### Step 3: Claim Details (Optional)

```
Help Us Verify Your Claim

To help administrators verify your claim, please provide any
supporting information:

[ ] I am a member of [Group Name] (detected from user's group membership)
[ ] I can provide verification through [dropdown: group admin, fellow mestre, other]

Additional notes (optional):
[Textarea: "I've been teaching at [location] since [year]..."]

[Submit Claim]
```

### Step 4: Pending State

```
Claim Submitted

Your claim for the profile "Mestre [Apelido]" has been submitted
for review.

You'll receive a notification when an administrator reviews your claim.

[View Genealogy] [Return to Profile]
```

### Admin Review (Backend)

Administrators see pending claims in `/admin/claims`:

```
Person Profile Claim

Claimant: [User Name] ([email])
Claimed Profile: Mestre [Apelido]
Submitted: [date]

Claimant's Account Info:
- Member since: [date]
- Group membership: [group name]
- Verified email: Yes/No

Claim Details:
- Verification method: [selected method]
- Notes: [user's notes]

[Approve] [Reject] [Request More Info]
```

### Step 5a: Claim Approved

```
Claim Approved!

Your claim for "Mestre [Apelido]" has been approved.

Your Quilombo account is now linked to your genealogy profile.
You can edit your genealogy information anytime.

[View My Genealogy Profile] [Edit Profile]
```

### Step 5b: Claim Rejected

```
Claim Not Approved

Your claim for "Mestre [Apelido]" was not approved.

Reason: [admin's reason]

If you believe this is an error, please contact support.

[Contact Support] [Return to Genealogy]
```

## Technical Implementation

### Database Schema

Reuse existing `person_claims` table pattern (analogous to group claims):

```sql
CREATE TABLE genealogy.person_claims (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES public.users(id),
  person_profile_id uuid NOT NULL REFERENCES genealogy.person_profiles(id),
  status claim_status NOT NULL DEFAULT 'pending',
  verification_method text,
  notes text,
  admin_notes text,
  reviewed_by uuid REFERENCES public.users(id),
  reviewed_at timestamp,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NOT NULL DEFAULT now(),

  UNIQUE(user_id, person_profile_id)  -- One claim per user-profile pair
);

CREATE TYPE claim_status AS ENUM ('pending', 'approved', 'rejected');
```

### API Endpoints

#### POST /api/genealogy/persons/:personId/claim

**Request**:
```typescript
interface ClaimPersonRequest {
  verificationMethod?: 'group_admin' | 'fellow_mestre' | 'other';
  notes?: string;
}
```

**Response**:
```typescript
interface ClaimPersonResponse {
  claimId: string;
  status: 'pending';
  message: string;
}
```

**Validation**:
- User must be authenticated
- User must NOT already have a profile_id
- Person profile must exist
- Person profile must NOT be already claimed
- Person profile must NOT have death_year set

#### GET /api/admin/person-claims

**Response**:
```typescript
interface PersonClaimListResponse {
  claims: {
    id: string;
    userId: string;
    userName: string;
    userEmail: string;
    personProfileId: string;
    personName: string;
    personApelido: string;
    status: ClaimStatus;
    verificationMethod?: string;
    notes?: string;
    createdAt: string;
  }[];
}
```

#### PUT /api/admin/person-claims/:claimId/approve

**Request**:
```typescript
interface ApproveClaimRequest {
  adminNotes?: string;
}
```

**Backend Actions**:
1. Update claim status to 'approved'
2. Set `users.profile_id` to claimed `person_profile_id`
3. Record reviewer and timestamp
4. (Optional) Send notification email to user

#### PUT /api/admin/person-claims/:claimId/reject

**Request**:
```typescript
interface RejectClaimRequest {
  reason: string;  // Required for rejection
}
```

### Frontend Components

```
/components/genealogy/
  ClaimProfile/
    ClaimButton.tsx        # Button shown on person profile
    ClaimModal.tsx         # Confirmation modal
    ClaimDetailsForm.tsx   # Verification details form
    ClaimPendingBanner.tsx # Shows on profile when claim pending

/app/admin/
  person-claims/
    page.tsx               # Admin claims list
    [claimId]/
      page.tsx             # Individual claim review
```

### Claim Status Display

On person profile pages:

```typescript
function getClaimStatus(profile: PersonProfile, currentUser: User | null) {
  if (profile.deathYear) {
    return { type: 'historical', message: 'Historical profile' };
  }

  if (isProfileClaimed(profile.id)) {
    if (isClaimedByUser(profile.id, currentUser?.id)) {
      return { type: 'owned', message: 'This is your profile' };
    }
    return { type: 'claimed', message: 'Profile linked to an account' };
  }

  const pendingClaim = getPendingClaim(profile.id, currentUser?.id);
  if (pendingClaim) {
    return { type: 'pending', message: 'Your claim is under review' };
  }

  return { type: 'unclaimed', message: null };  // Show claim button
}
```

## Edge Cases

### User Already Has Profile

If user tries to claim but already has `users.profile_id`:
- Reject with message: "You already have a genealogy profile"
- Offer: "Is this a duplicate? Contact support"

### Profile Already Claimed

If profile is already linked to another user:
- Hide claim button
- Show: "This profile is already linked to an account"
- Admin can manually merge/reassign if needed

### Concurrent Claims

If multiple users claim same profile:
- All claims go to admin
- Admin decides which is legitimate
- Rejected claimants can be offered to create new profiles

### Claim + Publish Conflict

User might try both flows:
1. Start publish flow (creates new profile)
2. Also submit claim for existing profile

Resolution:
- If claim approved: Delete the new profile, use claimed one
- If publish completed first: Reject claim with "You already have a profile"

## Security Considerations

1. **Rate Limiting**: Limit claims per user (e.g., 1 per day)
2. **Admin-Only Approval**: No auto-approval to prevent impersonation
3. **Audit Trail**: Log all claim actions with timestamps
4. **Notification**: Email admin on new claims

## Integration with Existing Group Claims

The person claims system should mirror the existing group claims:

- Same admin UI patterns
- Same status workflow (pending → approved/rejected)
- Same notification system
- Potentially same database patterns (adapt `group_claims` structure)

## Success Metrics

- Claim approval rate
- Average time from claim to decision
- Rejected claims that escalate to support
- Duplicate profile merges required

# Onboarding Wizard & Ancestry Graph Enhancement Specification

## Overview

This specification documents three interconnected features for the Quilombo app:
1. **Title-Level Filtering Utility** - Reusable function to filter persons by capoeira rank
2. **"Show Yourself" Ancestry Graph Feature** - Display logged-in user on the genealogy graph
3. **Multi-Page Onboarding Wizard** - Replace simple welcome modal with comprehensive flow

---

## 1. Title-Level Filtering Utility

### Purpose
Create a reusable utility to filter `person_profiles` by capoeira title level (e.g., "contra-mestre or above").

### Title Hierarchy

The `titles` array in `config/constants.ts` is ordered from highest rank to lowest. Feminine/masculine variants share the same level:

| Level | Titles | Description |
|-------|--------|-------------|
| 0 | mestra, mestre | Master |
| 1 | contra-mestra, contra-mestre | Counter-Master |
| 2 | mestranda, mestrando | Master Candidate |
| 3 | professora, professor | Professor |
| 4 | instrutora, instrutor | Instructor |
| 5 | graduada, graduado | Graduate |
| 6 | formada, formado | Formed |
| 7 | estagiaria, estagiario | Intern |
| 8 | estagianda, estagiando | Intern Candidate |
| 9 | monitora, monitor | Monitor |
| 10 | treinel | Trainee |
| 11 | aluna, aluno | Student |
| 12 | iniciante | Beginner |

### API

```typescript
// Location: /apps/quilombo/utils/genealogy/titleFilter.ts

/**
 * Maps each title to its normalized level (0-12).
 * Lower number = higher rank.
 */
export const TITLE_LEVELS: Record<Title, number>;

/**
 * Human-readable labels for title levels (for UI dropdowns).
 */
export const TITLE_LEVEL_OPTIONS: Array<{ level: number; label: string }>;

/**
 * Gets the normalized level for a title.
 * Returns null for undefined/null/unknown titles.
 */
export function getTitleLevel(title: string | null | undefined): number | null;

/**
 * Filters items by title level.
 * @param items - Array of items to filter
 * @param maxLevel - Maximum level to include (lower = higher rank)
 * @param getTitleFn - Function to extract title from each item
 * @returns Filtered array with only items at or above the specified level
 */
export function filterByTitleLevel<T>(
  items: T[],
  maxLevel: number,
  getTitleFn: (item: T) => string | null | undefined
): T[];
```

### Usage Examples

```typescript
// Filter person profiles to contra-mestre and above
const highRankPersons = filterByTitleLevel(
  personProfiles,
  1, // contra-mestre level
  (p) => p.title
);

// Filter for professor and above
const professors = filterByTitleLevel(
  personProfiles,
  3, // professor level
  (p) => p.title
);
```

---

## 2. "Show Yourself" Ancestry Graph Feature

### Purpose
Allow logged-in users to see themselves on the genealogy ancestry graph along with their filtered ancestors.

### User Stories

1. **As a user with a genealogy profile**, I want to see my node on the ancestry graph so I can visualize my place in the capoeira lineage.

2. **As a user without a genealogy profile**, I want to understand that I need to publish my profile to appear on the graph.

### Requirements

#### Toggle Control
- Location: GraphControls panel, only visible in "Student Ancestry" view mode
- Label: "Show Yourself"
- Disabled state: When user has no genealogy profile (`profileId` is null)
- Tooltip (when disabled): "Publish your genealogy profile to appear on the graph"

#### Filtering Behavior
- When toggled ON:
  - Show the user's node regardless of other filters
  - Show ancestors filtered to **contra-mestre and above** (level 0-1)
  - Include connecting links (student_of, trained_under relationships)
- Default title filter: contra-mestre (level 1)

### API Endpoint

```
GET /api/public/genealogy/persons/{personId}/ancestors
```

**Response:**
```json
{
  "ancestorIds": ["uuid-1", "uuid-2", "uuid-3"]
}
```

**Query Parameters:**
- `maxDepth` (optional): Maximum traversal depth (default: 50)

**Implementation:**
- Uses recursive CTE to traverse `student_of` and `trained_under` relationships
- Returns all ancestor person IDs in the lineage chain

### Database Query

```sql
WITH RECURSIVE ancestors AS (
  -- Base case: direct ancestors of the starting person
  SELECT s.object_id as person_id, 1 as depth
  FROM genealogy.statements s
  WHERE s.subject_id = $personId
    AND s.subject_type = 'person'
    AND s.object_type = 'person'
    AND s.predicate IN ('student_of', 'trained_under')

  UNION

  -- Recursive case: ancestors of ancestors
  SELECT s.object_id, a.depth + 1
  FROM genealogy.statements s
  JOIN ancestors a ON s.subject_id = a.person_id
  WHERE s.subject_type = 'person'
    AND s.object_type = 'person'
    AND s.predicate IN ('student_of', 'trained_under')
    AND a.depth < $maxDepth
)
SELECT DISTINCT person_id FROM ancestors;
```

### State Management

```typescript
// Location: /apps/quilombo/components/genealogy/state/atoms.ts

// Toggle state for showing user on graph
export const showYourselfAtom = atom<boolean>(false);

// Minimum title level filter for ancestors (default: 1 = contra-mestre)
export const ancestryMinTitleLevelAtom = atom<number>(1);
```

### URL Parameters

The genealogy page (`/genealogy`) supports these URL parameters for deep-linking:

| Parameter | Type | Description |
|-----------|------|-------------|
| `view` | `'general'` \| `'student-ancestry'` | View mode selection |
| `node` | `string` (UUID) | Auto-select and zoom to this node on load |
| `showYourself` | `'true'` | Enable "Show Yourself" toggle on load |

**Example URLs:**
```
/genealogy?view=student-ancestry&node=abc123&showYourself=true
/genealogy?node=abc123
```

---

## 3. Multi-Page Onboarding Wizard

### Purpose
Replace the simple welcome modal with a comprehensive onboarding flow that guides users through profile setup and genealogy integration.

### Trigger Conditions

The wizard shows when EITHER condition is true:
1. User has no name AND no nickname → `mode: 'new-user'`
2. User has basic profile but no genealogy profile (`profileId` is null) → `mode: 'genealogy-only'`

Page 1 messaging adapts based on mode.

### Suppression Logic

**Cookies (reuse existing pattern from OnboardingModal):**
- `quilombo.skipOnboarding` - 24hr expiry, set on "Maybe Later" or early close
- `quilombo.wizardCompleted` - Permanent, set when user completes full wizard

**Behavior:**
- If `wizardCompleted` is set → Never show wizard again
- If `skipOnboarding` is set → Suppress for 24hrs, then re-show
- After 24hrs with incomplete wizard → Wizard shows again

### Flow Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│ Page 1: Basic Profile                                           │
│   Fields: avatar, title, apelido, style (all optional)          │
│   Buttons: Next, Skip                                           │
│   Action: AUTO-SAVE profile to DB on Next                       │
└────────────────────────┬────────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────────┐
│ Page 2: Join Genealogy Explainer                                │
│   Content: Value proposition for genealogy feature              │
│   Buttons: "Publish Profile", "Maybe Later"                     │
└────────────┬──────────────────────────────┬─────────────────────┘
             │ Publish                      │ Maybe Later
             ▼                              ▼
┌────────────────────────────┐    ┌────────────────────────────────┐
│ Page 3: Genealogy Sync     │    │ Page 5: Final                  │
│   - Sync checkboxes        │    │   (skip genealogy path)        │
│   - Birth year widget      │    └────────────────────────────────┘
│   - Style field            │
│   - Anonymous warning      │
└────────────┬───────────────┘
             │
             ▼
┌─────────────────────────────────────────────────────────────────┐
│ Page 3b: Group or Teacher Selection                             │
│   Cards: "Find My Group" / "Find My Teacher"                    │
│   Button: "Skip for now"                                        │
└──────┬─────────────────────────────────────────┬────────────────┘
       │                                         │
       ▼                                         ▼
┌──────────────────────┐               ┌──────────────────────────┐
│ Page 4a: Find Group  │               │ Page 4b: Find Teacher    │
│   - Group search     │               │   - Person search        │
│   - member_of decl.  │               │   - Relationship select  │
└──────────┬───────────┘               └──────────┬───────────────┘
           │                                      │
           └──────────────┬───────────────────────┘
                          ▼
┌─────────────────────────────────────────────────────────────────┐
│ Add More Step                                                   │
│   Question: "Add more relations?"                               │
│   Cards: "Find Another Group" / "Find Another Teacher"          │
│   Button: "Continue to Finish"                                  │
└────────────────────────┬────────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────────────┐
│ Page 5: Final                                                   │
│   Title: "Enjoy Quilombo!"                                      │
│   Suggestion cards: Search people, groups, events               │
│   IF PUBLISHED: "See your position in the Genealogy" card       │
│     → Links to ancestry or general graph based on relations     │
└─────────────────────────────────────────────────────────────────┘
```

### Page Specifications

#### Page 1: Basic Profile

**Context-aware intro message:**
- New user: "Welcome! Let's set up your profile so the community knows who you are."
- Genealogy-only: "Welcome back! Ready to join the Capoeira genealogy?"

**Fields:**
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| avatar | ImageUpload | No | Profile picture |
| title | Select | No | Capoeira title (from titles enum) |
| apelido | Text | No | Capoeira nickname |
| style | Select | No | angola, regional, contemporanea |

**Buttons:**
- "Next" - Auto-saves profile to DB, proceeds to Page 2
- "Skip" - Skips all fields, proceeds to Page 2

#### Page 2: Join Genealogy Explainer

**Content:**
```
This app features a genealogy of Capoeira with mestres, groups & rodas
catalogued starting in the 1800s.

We want this ancestry tree to connect all the way to anyone involved
in Capoeira today!

By publishing your profile to the Genealogy (anonymously, if you like),
you help build a *public* dataset that is freely available, e.g. for
research, and you can see your connections with mestres and groups
all over the world.
```

**Buttons:**
- "Publish Profile" → Page 3
- "Maybe Later" → Page 5 (set skipOnboarding cookie)

#### Page 3: Genealogy Profile Sync

**Pre-filled from Page 1:**
- Portrait (avatar) - sync checkbox
- Apelido (nickname) - sync checkbox
- Title - sync checkbox
- Style

**Additional fields:**
- Birth year widget (year, precision)

**Anonymous Warning Modal:**
- Triggered when: User clicks Next with blank apelido
- Message: "Your profile will appear as 'Anonymous' in the genealogy."
- Buttons: "OK, Continue" / "Back"

#### Page 3b: Group or Teacher Selection

**Card options:**
| Card | Icon | Title | Description |
|------|------|-------|-------------|
| Group | Building2 | Find My Group | Search for and join your Capoeira group |
| Teacher | User | Find My Teacher | Declare your relationship to a mestre |

**Button:** "Skip for now" → Page 5

#### Page 4a: Find Group

Embeds logic from `GroupAssociationWizard`:
- Group search (genealogy database)
- Member declaration (member_of relationship)
- Completion → Add More Step

#### Page 4b: Find Teacher

**Person search:** Search genealogy person_profiles

**Relationship selection (with explainers):**
| Predicate | Label | Description |
|-----------|-------|-------------|
| `student_of` | Student of | Your primary mestre who gave you your apelido and title |
| `trained_under` | Trained under | A mestre you trained with but is not your primary lineage |
| `influenced_by` | Influenced by | A mestre whose style or philosophy strongly influenced your practice |

#### Add More Step

**Content:**
```
Relationship Added!

Would you like to add more connections?

You can always add more later in Profile > Edit Genealogy Profile
```

**Cards:** Same as Page 3b (Find Group, Find Teacher)

**Button:** "Continue to Finish" → Page 5

#### Page 5: Final

**Title:** "Enjoy Quilombo!"

**Suggestion cards:**
| Card | Icon | Title | Description | Link |
|------|------|-------|-------------|------|
| People | Users | Search People | Find mestres and capoeiristas | /search |
| Groups | Building2 | Search Groups | Find groups and training locations | /search |
| Events | Calendar | Events Near You | Find rodas and workshops | /events |

**Conditional card (if published genealogy):**
| Card | Icon | Title | Description | Link |
|------|------|-------|-------------|------|
| Genealogy | Network | See Your Position | View yourself in the Capoeira genealogy | (dynamic) |

**Genealogy link routing:**
- If user added `student_of` or `trained_under`: `/genealogy?view=student-ancestry&node={profileId}&showYourself=true`
- Otherwise: `/genealogy?node={profileId}`

### Component Architecture

```
/apps/quilombo/components/onboarding/
├── index.ts                           # Re-exports
├── OnboardingWizard.tsx               # Main controller with step routing
├── OnboardingContainer.tsx            # Responsive layout (modal vs full-screen)
├── WizardProgress.tsx                 # Step indicator dots/progress bar
├── contexts/
│   └── OnboardingContext.tsx          # State management with useReducer
├── steps/
│   ├── index.ts                       # Re-exports
│   ├── BasicProfileStep.tsx           # Page 1
│   ├── GenealogyExplainerStep.tsx     # Page 2
│   ├── GenealogyProfileStep.tsx       # Page 3
│   ├── GroupOrTeacherStep.tsx         # Page 3b
│   ├── FindGroupFlow.tsx              # Page 4a
│   ├── FindTeacherFlow.tsx            # Page 4b
│   ├── AddMoreStep.tsx                # Add more relations
│   └── FinalStep.tsx                  # Page 5
└── shared/
    ├── AnonymousWarningModal.tsx      # Blank apelido confirmation
    ├── WizardNavigationFooter.tsx     # Back/Next/Skip buttons
    └── RelationshipExplainer.tsx      # Predicate descriptions
```

### State Management

```typescript
// OnboardingContext state shape
type OnboardingState = {
  mode: 'new-user' | 'genealogy-only';
  currentStep: OnboardingStep;
  stepHistory: OnboardingStep[];

  // Draft data
  draftProfile: {
    avatar?: File | string;
    title?: string;
    nickname?: string;
    style?: string;
  };

  // Genealogy decisions
  publishGenealogy: boolean;
  draftGenealogyProfile: {
    syncPortrait: boolean;
    syncApelido: boolean;
    syncTitle: boolean;
    apelidoContext?: string;
    birthYear?: string;
    birthYearPrecision?: string;
  };

  // Track relationships for Page 5 routing
  addedRelationships: Array<{
    type: 'group' | 'person';
    predicate: string;
    objectId: string;
    objectName: string;
  }>;
};

type OnboardingStep =
  | 'basic-profile'
  | 'genealogy-explainer'
  | 'genealogy-profile'
  | 'group-or-teacher'
  | 'find-group'
  | 'find-teacher'
  | 'add-more'
  | 'final';
```

### Data Persistence Points

| Step | Trigger | Action |
|------|---------|--------|
| Page 1 | Click "Next" | Save profile fields to `users` table |
| Page 3 | Click "Next" | Create/update `genealogy.person_profiles` |
| Page 4a | Complete group | Add `member_of` statement |
| Page 4b | Complete teacher | Add relationship statement |

### Responsive Layout

**Mobile (< 768px):**
- Full-screen page layout
- Fixed position, z-50
- Scroll-enabled body

**Desktop (>= 768px):**
- HeroUI Modal (size="2xl")
- Non-dismissable (`isDismissable={false}`)
- Scroll inside modal

### Validation Schemas

```typescript
// Basic profile step
const basicProfileStepSchema = object({
  avatar: string().nullable(),
  title: string().nullable().oneOf([...titles, null, '']),
  nickname: string().nullable(),
  style: string().nullable().oneOf([...styles, null, '']),
});

// Genealogy profile step (extends existing schema)
// Uses existing genealogyProfileFormSchema from config/validation-schema.ts
```

---

## Implementation Phases

### Phase 0: Documentation
- [x] Create this specification document

### Phase 1: Title Filter Utility
- [ ] Create `utils/genealogy/titleFilter.ts`
- [ ] Add unit tests
- [ ] Export from utils index

### Phase 2: Ancestry Graph "Show Yourself"
- [ ] Add `fetchAncestorIds` query
- [ ] Create `/ancestors` API endpoint
- [ ] Add Jotai atoms
- [ ] Add `useUserAncestry` hook
- [ ] Modify GraphControls
- [ ] Modify GenealogyGraph filtering
- [ ] Add URL param support

### Phase 3: Onboarding Wizard Foundation
- [ ] Create directory structure
- [ ] Implement OnboardingContext
- [ ] Create OnboardingContainer
- [ ] Create WizardProgress
- [ ] Create WizardNavigationFooter
- [ ] Add validation schemas

### Phase 4: Extract Reusable Components
- [ ] Extract SyncCheckboxes
- [ ] Extract GenealogyPreviewCard
- [ ] Create RelationshipExplainer

### Phase 5: Wizard Steps
- [ ] BasicProfileStep (Page 1)
- [ ] GenealogyExplainerStep (Page 2)
- [ ] GenealogyProfileStep (Page 3)
- [ ] AnonymousWarningModal
- [ ] GroupOrTeacherStep (Page 3b)
- [ ] FindGroupFlow (Page 4a)
- [ ] FindTeacherFlow (Page 4b)
- [ ] AddMoreStep
- [ ] FinalStep (Page 5)

### Phase 6: Integration
- [ ] Implement OnboardingWizard with step routing
- [ ] Add trigger conditions logic
- [ ] Wire up cookie handling
- [ ] Replace OnboardingModal import
- [ ] Test all flows

### Phase 7: Polish
- [ ] Add transitions between steps
- [ ] Refine copy/messaging
- [ ] Accessibility review
- [ ] Mobile/desktop testing

---

## Related Files

### Files to Create
- `/apps/quilombo/utils/genealogy/titleFilter.ts`
- `/apps/quilombo/utils/genealogy/index.ts`
- `/apps/quilombo/app/api/public/genealogy/persons/[personId]/ancestors/route.ts`
- `/apps/quilombo/components/onboarding/*` (see component architecture)

### Files to Modify
- `/apps/quilombo/config/constants.ts` - Add predicate descriptions
- `/apps/quilombo/config/validation-schema.ts` - Add onboarding schemas
- `/apps/quilombo/db/queries/genealogy.ts` - Add fetchAncestorIds
- `/apps/quilombo/hooks/useGenealogyData.ts` - Add useUserAncestry hook
- `/apps/quilombo/components/genealogy/state/atoms.ts` - Add new atoms
- `/apps/quilombo/components/genealogy/ui/GraphControls.tsx` - Add toggle
- `/apps/quilombo/components/genealogy/graphs/GenealogyGraph.tsx` - Extend filtering
- `/apps/quilombo/app/genealogy/page.tsx` - Add URL param support
- `/apps/quilombo/components/OnboardingModal.tsx` - Replace with wizard
- `/apps/quilombo/components/genealogy/profile/SyncSection.tsx` - Extract components

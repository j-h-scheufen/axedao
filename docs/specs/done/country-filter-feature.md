# Country Filter Feature Specification

## Overview

Add a country filter to the group search interface that allows users to filter groups by one or more countries. The filter uses a visual flag-based selector with a distinct UX for mobile (drawer) and desktop (dropdown).

## UX Answer: Show Only Countries with Groups

**Recommendation: YES - Only show countries that have registered groups**

**Reasoning:**
1. **Reduces cognitive load**: Users see 5-10 relevant flags instead of 180+ irrelevant ones
2. **Faster selection**: No scrolling through empty options
3. **Implicit discovery**: Shows geographic distribution at a glance
4. **Prevents disappointment**: Users won't select a country only to find zero results
5. **Scales gracefully**: As the platform grows, new flags naturally appear

**Trade-off acknowledged**: Users can't "explore" where groups *don't* exist, but this is acceptable since the primary goal is finding groups, not discovering data gaps.

**Implementation**: Requires new API endpoint `/api/groups/countries` that returns distinct country codes where groups exist.

---

## Visual Design Recommendations

### Color Palette (Using Existing Theme)

Based on the HeroUI theme configuration:

- **Primary Green**: `#7FD92A` (light) / `#79D91F` (dark) - for active states
- **Secondary Brown**: `#D4A373` (light) / `#aa825c` (dark) - for subtle accents
- **Default Gray**: HeroUI default tokens for inactive/disabled states

### Flag Component States

#### 1. Inactive State (Default)
```
┌─────────┐
│         │
│  🇧🇷    │  ← Flag icon at 48px × 32px (3:2 aspect ratio)
│   BR    │  ← Country code in text-xs text-default-500
└─────────┘
```

**Styling:**
- Background: `bg-default-100` (subtle gray)
- Border: `border border-default-200`
- Shadow: None
- Opacity: 100%
- Transition: All properties 150ms ease
- Cursor: `cursor-pointer`
- Hover: `bg-default-200 scale-105` (subtle lift)

#### 2. Active/Selected State
```
┌─────────┐
│  ┌───┐  │
│  │🇧🇷 │  │  ← Flag with prominent border and glow
│  └───┘  │
│   BR    │  ← Country code in primary color
└─────────┘
```

**Styling:**
- Background: `bg-primary-50/20` (very subtle primary tint)
- Border: `border-2 border-primary` (2px primary green border)
- Shadow: `shadow-md` + `ring-2 ring-primary/30` (glow effect)
- Scale: `scale-110` (slightly larger)
- Country code: `text-primary font-semibold`
- Transform: `translate-y-[-2px]` (lifted appearance)

#### 3. Hover State (Inactive)
```
┌─────────┐
│         │
│  🇧🇷    │  ← Slightly scaled up
│   BR    │
└─────────┘
```

**Styling:**
- Background: `bg-default-200`
- Border: `border-default-300`
- Shadow: `shadow-sm`
- Scale: `scale-105`
- Transition: Smooth 150ms ease

#### 4. World Icon States (No Badge)

**Inactive State (No countries selected):**
- Icon color: `text-default-400` (greyed out)
- Opacity: 60%
- No hover effect

**Active State (Countries selected):**
- Icon color: `text-primary` (active green)
- Opacity: 100%
- No badge (filter state shown via chip below search bar instead)

### Flag Grid Layout

**Desktop:**
```
Grid: 6 columns (grid-cols-6)
Gap: gap-3 (12px)
Padding: p-4
Max height: max-h-[400px] overflow-y-auto
```

**Mobile:**
```
Grid: 3 columns (grid-cols-3)
Gap: gap-2 (8px)
Padding: p-3
Max height: max-h-[60vh] overflow-y-auto
```

### Flag Component Dimensions

**Desktop:**
- Flag width: 64px
- Flag height: 43px (maintains 3:2 ratio)
- Total card size: 80px × 80px (provides padding around flag)

**Mobile:**
- Flag width: 48px
- Flag height: 32px (maintains 3:2 ratio)
- Total card size: 64px × 64px

### Country Selector Panel

#### Desktop: Popover
```
┌─────────────────────────────────────┐
│  Select Countries                   │
│  ─────────────────────────────────  │
│                                     │
│  🇧🇷  🇺🇸  🇵🇹  🇫🇷  🇪🇸  🇮🇹    │
│  BR  US  PT  FR  ES  IT          │
│                                     │
│  🇩🇪  🇬🇧  🇯🇵  🇨🇦  🇦🇺  🇲🇽    │
│  DE  GB  JP  CA  AU  MX          │
│                                     │
│  ─────────────────────────────────  │
│  [Clear]              [Apply]      │
└─────────────────────────────────────┘
```

**Component**: HeroUI `Popover` with `placement="bottom-start"`

**Styling:**
- Width: `w-[480px]` (fits 6 flags comfortably)
- Background: `bg-content1` (HeroUI semantic token)
- Border: `border border-divider`
- Shadow: `shadow-lg`
- Border radius: `rounded-lg`

**Header:**
- Text: "Select Countries"
- Styling: `text-lg font-semibold mb-3`

**Footer:**
- Clear button: `<Button variant="bordered" size="sm">Clear</Button>`
- Apply button: `<Button color="primary" size="sm" isDisabled={!hasChanges}>Apply</Button>`
- Layout: `flex justify-between gap-2`

#### Mobile: Drawer (Modal)
```
╔═════════════════════════════════╗
║  Select Countries        [×]    ║
║  ───────────────────────────    ║
║                                 ║
║   🇧🇷    🇺🇸    🇵🇹              ║
║   BR    US    PT              ║
║                                 ║
║   🇫🇷    🇪🇸    🇮🇹              ║
║   FR    ES    IT              ║
║                                 ║
║   🇩🇪    🇬🇧    🇯🇵              ║
║   DE    GB    JP              ║
║                                 ║
║  ───────────────────────────    ║
║  [Clear]          [Apply]      ║
╚═════════════════════════════════╝
```

**Component**: HeroUI `Modal` with `placement="bottom"` and slide-up animation

**Styling:**
- Width: `w-full`
- Max height: `max-h-[80vh]`
- Background: `bg-content1`
- Border radius: `rounded-t-2xl` (rounded top corners only)

### Active Filter Chip (Below Search Bar)

When countries are selected, display a **single consolidated chip** showing the active filter. This approach:
- Scales gracefully (works with 1 or 20 selected countries)
- Maintains clean UI (no chip clutter)
- Provides quick removal (click X on chip)
- Extends to other filters later (verification, style, etc.)

#### Chip Display Logic

**1-3 Countries Selected:**
```
┌─────────────────────────────────────┐
│ Countries: 🇧🇷 🇩🇪 🇫🇷        [×]  │
└─────────────────────────────────────┘
```
Shows emoji flags for all selected countries

**4+ Countries Selected:**
```
┌─────────────────────────────────────┐
│ Countries: 🇧🇷 🇩🇪 🇫🇷 +2      [×]  │
└─────────────────────────────────────┘
```
Shows first 3 flags + count of remaining

**Alternative (Country Codes):**
```
┌─────────────────────────────────────┐
│ Countries: BR | DE | FR        [×]  │
└─────────────────────────────────────┘

┌─────────────────────────────────────┐
│ Countries: BR | DE | FR | ...  [×]  │
└─────────────────────────────────────┘
```
Shows country codes separated by pipes

**Recommendation**: Use emoji flags for visual consistency with the selector, fallback to codes if flags cause rendering issues.

#### Chip Styling

```tsx
<Chip
  onClose={handleClearCountryFilter}
  variant="flat"
  color="primary"
  size="sm"
  className="gap-1"
>
  <span className="font-medium">Countries:</span>
  <span className="flex items-center gap-1">
    {visibleFlags.map(code => (
      <span key={code} className="text-base leading-none">
        {getCountryFlag(code)}
      </span>
    ))}
    {remainingCount > 0 && (
      <span className="text-xs font-semibold">+{remainingCount}</span>
    )}
  </span>
</Chip>
```

**HeroUI Chip Properties:**
- `variant="flat"`: Subtle background
- `color="primary"`: Uses primary green theme
- `size="sm"`: Compact size
- `onClose`: Shows X button, triggers clear action

#### Desktop: Tooltip on Hover

When hovering over the chip (desktop only), show a tooltip with all selected countries:

```tsx
<Tooltip
  content={
    <div className="flex flex-wrap gap-1 max-w-xs">
      {selectedCountries.map(code => (
        <span key={code} className="inline-flex items-center gap-1">
          {getCountryFlag(code)}
          <span className="text-xs">{code}</span>
        </span>
      ))}
    </div>
  }
  placement="bottom"
>
  {/* Chip component */}
</Tooltip>
```

**Tooltip Styling:**
- Background: `bg-content2`
- Max width: `max-w-xs` (320px)
- Layout: Flex wrap for multiple countries
- Shows: Flag emoji + country code for each

#### Mobile: No Tooltip

On mobile, tapping the chip could:
- Option A: Open the country selector (allows editing)
- Option B: Do nothing (X button is for removal only)

**Recommendation**: Option A - tapping chip reopens selector for easy editing.

#### Multi-Filter Future Design

When other filters are added (verification, style), display multiple chips:

```
Applied Filters:
┌─────────────────────┐ ┌──────────────────┐ ┌──────────┐
│ Countries: 🇧🇷 🇩🇪 × │ │ Verified only  × │ │ Style: … │
└─────────────────────┘ └──────────────────┘ └──────────┘

[Clear all filters]
```

**Layout:**
- Flex wrap: `flex flex-wrap gap-2 items-center`
- Label: "Applied Filters:" in `text-sm text-default-500`
- Clear all button: `<Button size="sm" variant="light">Clear all filters</Button>`

### World Icon in Search Bar

**Placement**: Inside the Input component as `startContent`, combined with search icon

**Combined Icon Approach (Overlaid Icons)**
```
┌──────────────────────────────────────┐
│ 🌍🔍  Search by group name...     × │
└──────────────────────────────────────┘
  ↑ World icon with tiny search icon overlay
```

**Implementation:**
```tsx
<Input
  startContent={
    <button
      onClick={handleCountryFilterClick}
      className="cursor-pointer focus:outline-none"
      aria-label="Filter by country"
    >
      <div className="relative inline-flex items-center justify-center w-5 h-5">
        <Globe className={cn(
          "h-5 w-5 transition-colors",
          isCountryFilterActive ? "text-primary" : "text-default-400"
        )} />
        <Search className="h-2.5 w-2.5 absolute bottom-0 right-0 text-default-600" />
      </div>
    </button>
  }
  // ... other props
/>
```

**States:**
- No selection: Globe in `text-default-400` (grey)
- Has selection: Globe in `text-primary` (active green)
- Search overlay: Always `text-default-600` for visibility

**Icons to Use:**
- From `lucide-react`: `Globe` and `Search` components
- Main icon: `h-5 w-5`
- Overlay icon: `h-2.5 w-2.5` positioned bottom-right
- Interactive: `cursor-pointer` to indicate clickability

---

## Technical Implementation

### 0. Utility Functions

#### Country Flag Emoji Helper

**File**: `apps/quilombo/utils/country.ts`

```typescript
/**
 * Convert ISO 3166-1 alpha-2 country code to emoji flag.
 * Uses Unicode Regional Indicator Symbols (U+1F1E6 - U+1F1FF).
 *
 * @param countryCode - Two-letter country code (e.g., 'BR', 'US', 'us')
 * @returns Unicode emoji flag (e.g., '🇧🇷', '🇺🇸')
 *
 * @example
 * getCountryFlag('BR') // Returns '🇧🇷'
 * getCountryFlag('us') // Returns '🇺🇸' (case-insensitive)
 */
export const getCountryFlag = (countryCode: string): string => {
  const codePoints = countryCode
    .toUpperCase()
    .split('')
    .map(char => 127397 + char.charCodeAt(0));
  return String.fromCodePoint(...codePoints);
};

/**
 * Format country filter chip label.
 * Shows up to 3 flags/codes, with +N for remaining.
 *
 * @param countryCodes - Array of selected country codes
 * @param maxVisible - Maximum number of flags to show (default: 3)
 * @param useFlags - Use emoji flags (true) or country codes (false)
 * @returns Formatted label parts { visible, remaining }
 *
 * @example
 * formatCountryChipLabel(['BR', 'US', 'PT'])
 * // Returns { visible: ['🇧🇷', '🇺🇸', '🇵🇹'], remaining: 0 }
 *
 * formatCountryChipLabel(['BR', 'US', 'PT', 'FR', 'DE'], 3, false)
 * // Returns { visible: ['BR', 'US', 'PT'], remaining: 2 }
 */
export const formatCountryChipLabel = (
  countryCodes: string[],
  maxVisible: number = 3,
  useFlags: boolean = true
): { visible: string[]; remaining: number } => {
  const visible = countryCodes.slice(0, maxVisible);
  const remaining = Math.max(0, countryCodes.length - maxVisible);

  return {
    visible: useFlags ? visible.map(getCountryFlag) : visible,
    remaining,
  };
};
```

**Export from utils index:**
```typescript
// apps/quilombo/utils/index.ts
export { getCountryFlag, formatCountryChipLabel } from './country';
```

### 1. New API Endpoint

**Endpoint**: `GET /api/groups/countries`

**Purpose**: Fetch list of country codes where groups are registered

**Response:**
```typescript
{
  countryCodes: string[]; // e.g., ['BR', 'US', 'PT', 'FR']
}
```

**Implementation:**
```typescript
// apps/quilombo/app/api/groups/countries/route.ts

/**
 * @openapi
 * /api/groups/countries:
 *   get:
 *     summary: Get list of country codes where groups exist
 *     tags: [Groups]
 *     responses:
 *       200:
 *         description: List of ISO 3166-1 alpha-2 country codes
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 countryCodes:
 *                   type: array
 *                   items:
 *                     type: string
 *                     pattern: ^[A-Z]{2}$
 *                   example: ['BR', 'US', 'PT']
 */
export async function GET() {
  const countryCodes = await getDistinctCountryCodes();
  return Response.json({ countryCodes });
}
```

**Database Query:**
```typescript
// apps/quilombo/db/queries/groups.ts

/**
 * Get distinct country codes from group locations.
 * Only returns countries that have at least one group.
 * Results are sorted alphabetically.
 */
export async function getDistinctCountryCodes(): Promise<string[]> {
  const results = await db
    .selectDistinct({ countryCode: schema.groupLocations.countryCode })
    .from(schema.groupLocations)
    .where(sql`${schema.groupLocations.countryCode} IS NOT NULL`)
    .orderBy(schema.groupLocations.countryCode);

  return results.map(r => r.countryCode).filter(Boolean) as string[];
}
```

### 2. Update Existing API Endpoint

**Endpoint**: `GET /api/groups` (existing search endpoint)

**Add Parameter**: `countryCodes` (comma-separated string or array)

**Updated Schema:**
```typescript
// apps/quilombo/config/validation-schema.ts

export const groupSearchSchema = object({
  pageSize: number().min(1).max(100).default(20),
  offset: number().min(0).default(0),
  searchTerm: string().optional(),
  verified: boolean().optional(),
  countryCodes: array().of(string().length(2)).optional(), // NEW
});

export type GroupSearchParams = InferType<typeof groupSearchSchema>;
```

**Query Parameter Parsing:**
```typescript
// apps/quilombo/app/api/groups/route.ts (GET handler)

const searchParams = request.nextUrl.searchParams;
const pageSize = Number(searchParams.get('pageSize')) || QUERY_DEFAULT_PAGE_SIZE;
const offset = Number(searchParams.get('offset'));
const searchTerm = searchParams.get('searchTerm');
const verified = searchParams.get('verified');
const countryCodesParam = searchParams.get('countryCodes'); // NEW

let countryCodes: string[] | undefined;
if (countryCodesParam) {
  countryCodes = countryCodesParam.split(',').map(c => c.trim().toUpperCase());
}

// Validate
const searchOptions = groupSearchSchema.validateSync({
  pageSize,
  offset,
  ...omitBy({ searchTerm, verified, countryCodes }, isNil),
});
```

**Database Filter:**
```typescript
// apps/quilombo/db/queries/groups.ts (searchGroups function)

export async function searchGroups(options: GroupSearchParams) {
  const { pageSize, offset, searchTerm, verified, countryCodes } = options;

  const filters: (SQLWrapper | undefined)[] = [];

  if (searchTerm) {
    filters.push(ilike(schema.groups.name, `%${searchTerm}%`));
  }

  if (typeof verified === 'boolean') {
    // ... existing verification filter
  }

  // NEW: Filter by country codes
  if (countryCodes && countryCodes.length > 0) {
    filters.push(sql`EXISTS (
      SELECT 1 FROM ${schema.groupLocations}
      WHERE ${schema.groupLocations.groupId} = ${schema.groups.id}
        AND ${schema.groupLocations.countryCode} IN (${sql.join(countryCodes.map(c => sql`${c}`), sql`, `)})
    )`);
  }

  // ... rest of query
}
```

### 3. Frontend Components

#### Component Structure
```
apps/quilombo/components/groups/
├── CountryFilter.tsx          # Main country filter component (selector modal/popover)
├── CountryFlagButton.tsx      # Individual flag button
├── CountryFilterChip.tsx      # Consolidated filter chip (NEW)
└── Groups.tsx                 # Updated to use CountryFilter + CountryFilterChip
```

#### CountryFilter Component

**File**: `apps/quilombo/components/groups/CountryFilter.tsx`

**Props:**
```typescript
type CountryFilterProps = {
  selectedCountries: string[];
  onCountriesChange: (countries: string[]) => void;
  isActive: boolean; // Whether any countries are selected
};
```

**State Management:**
```typescript
const [localSelection, setLocalSelection] = useState<string[]>(selectedCountries);
const [isOpen, setIsOpen] = useState(false);
const { data: availableCountries, isLoading } = useFetchAvailableCountries();
```

**Key Features:**
- Responsive design (Popover on desktop, Modal on mobile)
- Local state for pending selection (only applies on "Apply" click)
- "Clear" button to reset selection
- "Apply" button disabled when selection hasn't changed
- Flag grid with visual feedback

**Responsive Implementation:**

Returns different UI based on screen size using HeroUI's responsive utilities:

```tsx
const CountryFilter = ({ selectedCountries, onCountriesChange, isActive }: CountryFilterProps) => {
  const [localSelection, setLocalSelection] = useState<string[]>(selectedCountries);
  const [isOpen, setIsOpen] = useState(false);
  const { data: countryCodes, isLoading } = useFetchAvailableCountries();

  const hasChanges = !isEqual(localSelection.sort(), selectedCountries.sort());

  const handleApply = () => {
    onCountriesChange(localSelection);
    setIsOpen(false);
  };

  const handleClear = () => {
    setLocalSelection([]);
  };

  const handleToggle = (code: string) => {
    setLocalSelection(prev =>
      prev.includes(code) ? prev.filter(c => c !== code) : [...prev, code]
    );
  };

  // Trigger button (used in SearchBar startContent)
  const trigger = (
    <button
      onClick={() => setIsOpen(true)}
      className="cursor-pointer focus:outline-none"
      aria-label="Filter by country"
    >
      <div className="relative inline-flex items-center justify-center w-5 h-5">
        <Globe className={cn(
          "h-5 w-5 transition-colors",
          isActive ? "text-primary" : "text-default-400"
        )} />
        <Search className="h-2.5 w-2.5 absolute bottom-0 right-0 text-default-600" />
      </div>
    </button>
  );

  // Flag grid (shared between desktop/mobile)
  const flagGrid = (
    <div className="grid grid-cols-3 sm:grid-cols-6 gap-2 sm:gap-3 p-3 sm:p-4">
      {countryCodes?.map(code => (
        <CountryFlagButton
          key={code}
          countryCode={code}
          isSelected={localSelection.includes(code)}
          onToggle={handleToggle}
          size={isMobile ? 'sm' : 'md'}
        />
      ))}
    </div>
  );

  // Footer buttons (shared)
  const footer = (
    <div className="flex justify-between gap-2 p-3 sm:p-4 border-t border-divider">
      <Button variant="bordered" size="sm" onPress={handleClear}>
        Clear
      </Button>
      <Button color="primary" size="sm" isDisabled={!hasChanges} onPress={handleApply}>
        Apply
      </Button>
    </div>
  );

  // Desktop: Popover
  // Mobile: Modal (bottom drawer)
  return (
    <>
      {/* Desktop */}
      <div className="hidden sm:block">
        <Popover placement="bottom-start" isOpen={isOpen} onOpenChange={setIsOpen}>
          <PopoverTrigger>{trigger}</PopoverTrigger>
          <PopoverContent className="w-[480px] p-0">
            <div className="p-4 pb-0">
              <h3 className="text-lg font-semibold">Select Countries</h3>
            </div>
            {isLoading ? <Spinner /> : flagGrid}
            {footer}
          </PopoverContent>
        </Popover>
      </div>

      {/* Mobile */}
      <div className="sm:hidden">
        {trigger}
        <Modal
          isOpen={isOpen}
          onOpenChange={setIsOpen}
          placement="bottom"
          className="rounded-t-2xl"
        >
          <ModalContent>
            <ModalHeader>Select Countries</ModalHeader>
            <ModalBody className="max-h-[60vh] overflow-y-auto p-0">
              {isLoading ? <Spinner /> : flagGrid}
            </ModalBody>
            <ModalFooter className="p-0">{footer}</ModalFooter>
          </ModalContent>
        </Modal>
      </div>
    </>
  );
};
```

#### CountryFlagButton Component

**File**: `apps/quilombo/components/groups/CountryFlagButton.tsx`

**Purpose**: Reusable flag button with consistent styling across mobile/desktop

**Props:**
```typescript
type CountryFlagButtonProps = {
  countryCode: string;
  isSelected: boolean;
  onToggle: (countryCode: string) => void;
  size?: 'sm' | 'md'; // sm for mobile, md for desktop
};
```

**Implementation:**
```tsx
import { getCountryFlag } from '@/utils';

const CountryFlagButton = ({ countryCode, isSelected, onToggle, size = 'md' }: CountryFlagButtonProps) => {
  const sizeClasses = size === 'sm'
    ? 'w-16 h-16' // 64px × 64px for mobile
    : 'w-20 h-20'; // 80px × 80px for desktop

  const flagSize = size === 'sm' ? 'text-3xl' : 'text-4xl';

  return (
    <button
      onClick={() => onToggle(countryCode)}
      className={cn(
        "flex flex-col items-center justify-center gap-1 rounded-lg transition-all duration-150",
        sizeClasses,
        isSelected
          ? "bg-primary-50/20 border-2 border-primary shadow-md ring-2 ring-primary/30 scale-110 -translate-y-0.5"
          : "bg-default-100 border border-default-200 hover:bg-default-200 hover:border-default-300 hover:shadow-sm hover:scale-105"
      )}
      aria-label={`${isSelected ? 'Deselect' : 'Select'} ${countryCode}`}
      aria-pressed={isSelected}
    >
      <span className={flagSize} role="img" aria-label={`${countryCode} flag`}>
        {getCountryFlag(countryCode)}
      </span>
      <span className={cn(
        "text-xs",
        isSelected ? "text-primary font-semibold" : "text-default-500"
      )}>
        {countryCode}
      </span>
    </button>
  );
};
```

#### CountryFilterChip Component

**File**: `apps/quilombo/components/groups/CountryFilterChip.tsx`

**Purpose**: Display consolidated filter chip showing selected countries with tooltip

**Props:**
```typescript
type CountryFilterChipProps = {
  selectedCountries: string[];
  onClear: () => void;
  onChipClick?: () => void; // Optional: reopen selector on click
};
```

**Implementation:**
```tsx
import { Chip, Tooltip } from '@heroui/react';
import { formatCountryChipLabel, getCountryFlag } from '@/utils';

const CountryFilterChip = ({ selectedCountries, onClear, onChipClick }: CountryFilterChipProps) => {
  if (selectedCountries.length === 0) return null;

  const { visible, remaining } = formatCountryChipLabel(selectedCountries, 3, true);

  // Tooltip content showing all selected countries
  const tooltipContent = (
    <div className="flex flex-wrap gap-1.5 max-w-xs p-1">
      {selectedCountries.map(code => (
        <span key={code} className="inline-flex items-center gap-1 text-xs">
          <span role="img" aria-label={`${code} flag`}>
            {getCountryFlag(code)}
          </span>
          <span>{code}</span>
        </span>
      ))}
    </div>
  );

  const chipContent = (
    <Chip
      onClose={onClear}
      variant="flat"
      color="primary"
      size="sm"
      className="gap-1.5 cursor-pointer"
      onClick={onChipClick}
    >
      <span className="font-medium text-xs">Countries:</span>
      <span className="flex items-center gap-1">
        {visible.map((flag, idx) => (
          <span key={idx} className="text-base leading-none" role="img">
            {flag}
          </span>
        ))}
        {remaining > 0 && (
          <span className="text-xs font-semibold text-primary">+{remaining}</span>
        )}
      </span>
    </Chip>
  );

  // Wrap with tooltip on desktop only
  return (
    <div className="hidden sm:block">
      <Tooltip content={tooltipContent} placement="bottom" delay={300}>
        {chipContent}
      </Tooltip>
    </div>
    // Mobile: no tooltip, just chip
    <div className="sm:hidden">{chipContent}</div>
  );
};

export default CountryFilterChip;
```

**Features:**
- Shows up to 3 flag emojis, then "+N" for remaining
- Desktop: Tooltip on hover shows all selected countries
- Mobile: Tapping chip reopens selector (via onChipClick)
- X button clears all country filters
- Conditionally renders (returns null if no selection)

#### Updated Groups Component

**File**: `apps/quilombo/components/groups/Groups.tsx`

**Changes:**
1. Import CountryFilter and CountryFilterChip
2. Add countryCodes state management via URL params
3. Pass countryCodes to search hook
4. Integrate CountryFilter into SearchBar startContent
5. Display CountryFilterChip below SearchBar

```tsx
import CountryFilter from '@/components/groups/CountryFilter';
import CountryFilterChip from '@/components/groups/CountryFilterChip';

// ... inside Groups component

// State management
const [{ view, gq, countries }, setQueryStates] = useQueryStates({
  view: parseAsString.withDefault('list'),
  [PARAM_KEY_GROUP_QUERY]: parseAsString.withDefault(''),
  countries: parseAsString.withDefault(''), // NEW: comma-separated country codes
});

const selectedCountries = countries ? countries.split(',').filter(Boolean) : [];

const handleCountriesChange = (newCountries: string[]) => {
  setQueryStates({
    countries: newCountries.length > 0 ? newCountries.join(',') : null
  });
};

const handleClearCountries = () => {
  setQueryStates({ countries: null });
};

// Updated search hook
const { setSearchTerm, groups, totalCount, isLoading, scrollerRef } =
  useGroupSearchWithInfiniteScroll({
    countryCodes: selectedCountries.length > 0 ? selectedCountries : undefined
  });

// Component JSX
return (
  <div className="flex flex-col gap-2 sm:gap-4 mt-1 sm:mt-3">
    {/* Search Bar with Country Filter Icon */}
    <SearchBar
      placeholder="Search by group name"
      searchTerm={inputValue}
      onSearchChange={handleSearchChange}
      onClear={handleClear}
      leftContent={
        <CountryFilter
          selectedCountries={selectedCountries}
          onCountriesChange={handleCountriesChange}
          isActive={selectedCountries.length > 0}
        />
      }
      filterContent={<FilterButton onPress={handleFilterClick} />}
    />

    {/* Active Filter Chip (if countries selected) */}
    {selectedCountries.length > 0 && (
      <CountryFilterChip
        selectedCountries={selectedCountries}
        onClear={handleClearCountries}
        onChipClick={() => {/* Open country selector */}}
      />
    )}

    {/* Tabs for List/Map view */}
    <Tabs {...tabProps}>
      {/* ... existing tab content */}
    </Tabs>
  </div>
);
```

**Update SearchBar Component:**

Add `leftContent` prop to inject the world icon:

```tsx
// apps/quilombo/components/SearchBar.tsx

type Props = {
  // ... existing props
  leftContent?: ReactNode; // NEW
};

<Input
  startContent={
    <div className="flex items-center gap-1">
      {leftContent}
      <Search className="h-4 w-4 text-default-400" />
    </div>
  }
  // ... rest of props
/>
```

### 4. React Query Integration

**File**: `apps/quilombo/query/group.ts`

**New Hook:**
```typescript
const fetchAvailableCountries = async (): Promise<{ countryCodes: string[] }> =>
  axios.get('/api/groups/countries').then((response) => response.data);

export const fetchAvailableCountriesOptions = {
  queryKey: [QUERY_KEYS.group.getAvailableCountries],
  queryFn: fetchAvailableCountries,
  staleTime: QueryConfig.staleTimeDefault, // 5 minutes
} as const;

export const useFetchAvailableCountries = () =>
  useQuery(queryOptions(fetchAvailableCountriesOptions));
```

**Update QUERY_KEYS:**
```typescript
// apps/quilombo/query/index.ts

export const QUERY_KEYS = {
  group: {
    // ... existing keys
    getAvailableCountries: 'getAvailableCountries', // NEW
  },
  // ...
};
```

**Update Search Hook:**
```typescript
// apps/quilombo/query/group.ts

const searchGroups = async ({
  offset,
  pageSize,
  searchTerm,
  countryCodes
}: SearchParams): Promise<GroupSearchResult> => {
  let queryParams = `?offset=${offset}`;
  queryParams += searchTerm ? `&searchTerm=${searchTerm}` : '';
  queryParams += pageSize ? `&pageSize=${pageSize}` : '';
  queryParams += countryCodes?.length ? `&countryCodes=${countryCodes.join(',')}` : ''; // NEW

  return axios.get(`/api/groups${queryParams}`).then(/* ... */);
};

export const searchGroupsOptions = ({ offset, pageSize, searchTerm, countryCodes }: SearchParams) => {
  return {
    queryKey: [QUERY_KEYS.group.searchGroups, searchTerm, countryCodes], // Updated key
    // ... rest
  } as const;
};
```

**Update SearchParams Type:**
```typescript
// apps/quilombo/config/validation-schema.ts or types/model.ts

export type SearchParams = {
  offset: number;
  pageSize: number;
  searchTerm?: string;
  countryCodes?: string[]; // NEW
};
```

---

## Implementation Checklist

### Backend Tasks

- [ ] Create `GET /api/groups/countries` endpoint
  - [ ] Add route file: `apps/quilombo/app/api/groups/countries/route.ts`
  - [ ] Add OpenAPI JSDoc comments
  - [ ] Implement handler using `getDistinctCountryCodes()`

- [ ] Add `getDistinctCountryCodes()` database query
  - [ ] Add function to `apps/quilombo/db/queries/groups.ts`
  - [ ] Use `selectDistinct` on `groupLocations.countryCode`
  - [ ] Filter out NULL values
  - [ ] Sort alphabetically

- [ ] Update `GET /api/groups` search endpoint
  - [ ] Add `countryCodes` parameter parsing
  - [ ] Update OpenAPI docs

- [ ] Update `groupSearchSchema` validation
  - [ ] Add `countryCodes: array().of(string().length(2)).optional()`
  - [ ] Export updated `GroupSearchParams` type

- [ ] Update `searchGroups()` database query
  - [ ] Add country filter using EXISTS subquery
  - [ ] Use `IN` clause for multiple countries

### Frontend Tasks

- [ ] Create utility functions
  - [ ] Add `utils/country.ts` with `getCountryFlag()` helper
  - [ ] Add `formatCountryChipLabel()` helper
  - [ ] Export from `utils/index.ts`

- [ ] Create `CountryFlagButton` component
  - [ ] Implement flag rendering using emoji via `getCountryFlag()`
  - [ ] Implement selected/unselected states with animations
  - [ ] Add hover effects (scale, shadow)
  - [ ] Support size prop (sm/md for mobile/desktop)
  - [ ] Add accessibility (ARIA labels, keyboard support)

- [ ] Create `CountryFilter` component
  - [ ] Implement combined world+search icon trigger
  - [ ] Implement responsive design (Popover on desktop, Modal on mobile)
  - [ ] Fetch available countries via React Query
  - [ ] Manage local selection state (apply on "Apply" click)
  - [ ] Implement "Clear" button
  - [ ] Implement "Apply" button with disabled state when no changes
  - [ ] Render flag grid with proper spacing (3 cols mobile, 6 cols desktop)
  - [ ] Add loading state while fetching countries

- [ ] Create `CountryFilterChip` component
  - [ ] Display up to 3 flag emojis + "+N" for remaining
  - [ ] Implement tooltip on desktop showing all selected countries
  - [ ] Make chip clickable to reopen selector
  - [ ] Add onClose handler for X button
  - [ ] Conditionally render (null if no selection)

- [ ] Update `SearchBar` component
  - [ ] Add `leftContent` prop
  - [ ] Update `startContent` to render leftContent before Search icon

- [ ] Update `Groups` component
  - [ ] Add `countries` URL param via `nuqs`
  - [ ] Parse comma-separated country codes
  - [ ] Pass `selectedCountries` to `CountryFilter`
  - [ ] Handle `onCountriesChange` and `onClearCountries` callbacks
  - [ ] Inject `CountryFilter` into `SearchBar` via `leftContent`
  - [ ] Render `CountryFilterChip` below SearchBar when countries selected

- [ ] Update `useGroupSearch` hook
  - [ ] Accept `countryCodes` parameter
  - [ ] Pass to `useSearchGroups` query

- [ ] Update React Query hooks
  - [ ] Add `useFetchAvailableCountries` hook
  - [ ] Update `searchGroups` to include `countryCodes` query param
  - [ ] Update query key to include `countryCodes` for proper caching
  - [ ] Add `getAvailableCountries` to QUERY_KEYS

### Testing Tasks

- [ ] Backend testing
  - [ ] Test `/api/groups/countries` returns correct distinct codes
  - [ ] Test `/api/groups` with single country filter
  - [ ] Test `/api/groups` with multiple countries filter
  - [ ] Test `/api/groups` with invalid country codes (validation)
  - [ ] Test combined filters (searchTerm + countryCodes + verified)

- [ ] Frontend testing
  - [ ] Test flag button selection/deselection
  - [ ] Test "Clear" button resets selection
  - [ ] Test "Apply" button is disabled when no changes
  - [ ] Test "Apply" button required on mobile (no immediate filter)
  - [ ] Test URL params are updated correctly
  - [ ] Test responsive design (mobile drawer vs desktop popover)
  - [ ] Test world icon active/inactive states (no badge)
  - [ ] Test filter chip displays correctly (up to 3 flags + "+N")
  - [ ] Test chip tooltip on desktop shows all countries
  - [ ] Test chip click reopens selector on mobile
  - [ ] Test chip X button clears all country filters
  - [ ] Test accessibility (keyboard navigation, screen readers, ARIA labels)

### Documentation Tasks

- [ ] Update API documentation
  - [ ] Document `/api/groups/countries` endpoint
  - [ ] Document updated `/api/groups` parameters

- [ ] Update component documentation
  - [ ] Add JSDoc comments to new components
  - [ ] Document props and usage examples

---

## Future Enhancements

### Phase 2: Additional Features

1. **Region/Continent Grouping**
   - Group countries by continent
   - Allow selecting entire regions at once

2. **Search Countries by Name**
   - Add search input above flag grid
   - Filter visible flags by country name

3. **Recently Used Countries**
   - Show user's recently selected countries at top
   - Store in localStorage

4. **Multi-Level Geography**
   - Extend to state/province level
   - Extend to city level
   - Hierarchical selection (Country → State → City)

5. **Map-Based Selection**
   - Interactive world map to select countries
   - Visual heatmap showing group density

### Phase 3: Advanced Filtering

Combine country filter with additional filters in unified modal:
- Verification status
- Capoeira style
- Group size (member count)
- Activity status (last event date)

---

## Design Decisions Summary

All major design questions have been resolved:

1. ✅ **Flag Rendering**: Emoji flags via `getCountryFlag()` utility (no external dependencies)

2. ✅ **World Icon State**: Color change only (no badge)
   - Inactive: `text-default-400` (grey)
   - Active: `text-primary` (green)

3. ✅ **Icon Design**: Combined world + search icon (overlaid)
   - Main icon: Globe at h-5 w-5
   - Overlay: Search icon at h-2.5 w-2.5 (bottom-right)

4. ✅ **Filter Display**: Consolidated chip below search bar
   - Shows up to 3 flags + "+N" for remaining
   - Desktop: Tooltip shows all selected countries
   - Mobile: Tapping chip reopens selector
   - X button clears all

5. ✅ **Mobile Behavior**: "Apply" button required (consistent with desktop)

6. ✅ **Default Selection**: Empty selection = All countries (no explicit "All" option)

7. ✅ **Performance**: No virtual scrolling needed for <20 countries initially
   - Will only add if user feedback indicates performance issues at scale

---

## Design Mockups

### Desktop - Inactive State
```
┌────────────────────────────────────────────────────────┐
│  🌍🔍  Search by group name...                     [≡] │
└────────────────────────────────────────────────────────┘
   ↑ Grey world icon with tiny search overlay (no selection)
```

### Desktop - Active State with Filter Chip
```
┌────────────────────────────────────────────────────────┐
│  🌍🔍  Search by group name...                     [≡] │
└────────────────────────────────────────────────────────┘
   ↑ Green world icon (active)

┌─────────────────────────────────┐
│ Countries: 🇧🇷 🇩🇪 🇫🇷 +2    [×] │  ← Hover shows tooltip with all 5
└─────────────────────────────────┘

Displaying 45 of 120 results
```

### Desktop - Popover Open
```
┌────────────────────────────────────────────────────────┐
│  🌍🔍  Search by group name...                     [≡] │
└────┬───────────────────────────────────────────────────┘
     │
     ▼
┌─────────────────────────────────────────────────┐
│  Select Countries                               │
│  ─────────────────────────────────────────────  │
│                                                 │
│   ┏━━━┓   🇺🇸   🇵🇹   🇫🇷   🇪🇸   🇮🇹          │
│   ┃🇧🇷┃   US   PT   FR   ES   IT          │
│   ┗━━━┛                                        │
│    BR                                          │
│                                                 │
│   🇩🇪   🇬🇧   🇯🇵   🇨🇦   🇦🇺   🇲🇽          │
│   DE   GB   JP   CA   AU   MX          │
│                                                 │
│  ─────────────────────────────────────────────  │
│  [Clear]                        [Apply]        │
└─────────────────────────────────────────────────┘
     ↑ Brazil selected (green border + shadow + glow)
```

### Mobile - With Active Filter
```
╔═════════════════════════════════════╗
║  🌍🔍  Search...             [≡]    ║
╠═════════════════════════════════════╣
║                                     ║
║ ┌─────────────────────────────┐    ║
║ │ Countries: 🇧🇷 🇩🇪 🇫🇷    [×] │    ║  ← Tap to reopen
║ └─────────────────────────────┘    ║
║                                     ║
║ Displaying 12 of 45 results         ║
║                                     ║
╚═════════════════════════════════════╝
```

### Mobile - Drawer Open
```
╔═════════════════════════════════════╗
║  🌍🔍  Search...             [≡]    ║
╠═════════════════════════════════════╣
║                                     ║
║  Select Countries          [×]      ║
║  ─────────────────────────────────  ║
║                                     ║
║    ┏━━━┓     🇺🇸      🇵🇹           ║
║    ┃🇧🇷┃     US      PT           ║
║    ┗━━━┛                            ║
║     BR                              ║
║                                     ║
║     🇫🇷      🇪🇸      🇮🇹           ║
║     FR      ES      IT           ║
║                                     ║
║     🇩🇪      🇬🇧      🇯🇵           ║
║     DE      GB      JP           ║
║                                     ║
║  ─────────────────────────────────  ║
║  [Clear]              [Apply]      ║
╚═════════════════════════════════════╝
     ↑ Drawer slides up from bottom
```

---

## Summary

This specification provides a complete blueprint for implementing a country filter feature with:

1. **Backend**: New `/api/groups/countries` endpoint + updated search with country filtering
2. **Frontend**: Responsive flag-based selector with consolidated filter chip
3. **Visual Design**: Detailed styling for all states using existing HeroUI theme
4. **UX Decision**: Show only countries with registered groups (scalable approach)
5. **Implementation Plan**: Phased checklist for systematic development

### Key Design Decisions (Final)

1. **Emoji Flags**: Native Unicode rendering via `getCountryFlag()` utility (zero dependencies)
2. **Combined Icon**: World globe with tiny search overlay in search bar `startContent`
3. **No Badge**: Icon color change only (grey → primary green when active)
4. **Consolidated Chip**: Single chip showing "Countries: 🇧🇷 🇩🇪 🇫🇷 +2" below search bar
5. **Tooltip on Desktop**: Hover shows all selected countries
6. **Apply Required**: Both mobile and desktop require "Apply" button click
7. **Empty = All**: No countries selected means search across all countries
8. **Future-Proof**: Chip pattern extends to other filters (verification, style, etc.)

### Component Architecture

```
CountryFilter (world icon trigger + modal/popover)
    ↓ opens
CountryFlagButton × N (flag grid)
    ↓ applies selection to
CountryFilterChip (consolidated display)
    ↓ updates
Groups component (URL params + search)
```

### Design Priorities

- **Scalability**: Works with 3 or 30 selected countries
- **Visual clarity**: Emoji flags universally recognizable
- **Responsive design**: Popover (desktop) vs Modal (mobile)
- **Performance**: Only fetch/render countries with groups
- **Consistency**: HeroUI components and existing theme
- **Accessibility**: ARIA labels, keyboard navigation
- **Extensibility**: Filter chip pattern reusable for future filters

### Next Steps

1. ✅ Spec complete and approved
2. Begin implementation following the detailed checklist
3. Test thoroughly across mobile/desktop
4. Iterate based on user feedback

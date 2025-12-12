# Timeline Slider for Student Ancestry Graph

## Overview

Introduce an interactive time slider to the StudentAncestryGraph that reveals nodes and connections progressively as the timeline advances. The visualization shows the growth of capoeira lineages and knowledge transfer over time.

## Core Concept

- A time slider controls a "timeline cursor" (current year)
- The radial layout already positions nodes by birth year (center = older, outer = newer)
- A visual ring/circle at the current year radius expands/contracts with the slider
- Nodes and connections are revealed when the timeline reaches their relevant dates

## Implementation Tiers

### Tier 1: Basic Timeline Reveal (MVP)

**Timeline Ring:**
- Animated circle at current year's radius
- Dynamic year label attached to the ring
- Ring expands/contracts as user moves slider

**Node Reveal:**
- Nodes hidden until timeline reaches their birth year (persons) or founding date (groups)
- Simple fade-in animation when revealed
- Nodes remain visible once revealed

**Connection Reveal:**
- Connections appear when both source and target nodes are visible
- Simple fade-in for connection lines

**UI:**
- Horizontal slider below or beside the graph
- Play/pause button for auto-advance animation
- Speed control for auto-play
- Year display showing current timeline position

### Tier 2: Life Trajectory Lines

**Birth Marker:**
- When a node is first revealed, place a small sphere at the birth radius
- This sphere remains stationary as a birth marker

**Moving Main Sphere:**
- The main node sphere moves outward along its radial line as time advances
- Represents "current age" at the timeline's year
- Creates a trailing line connecting birth marker to current position

**Death Handling:**
- At death date, main sphere stops moving and becomes a death marker
- Line between birth and death markers represents lifespan
- Visual distinction (color/opacity) for deceased vs living nodes

**Unknown Death Dates:**
- If death date unknown, sphere continues moving with timeline
- Could cap at a reasonable age (e.g., 100 years) or timeline end

### Tier 3: Relationship Markers on Life Lines

**Marker Concept:**
- Place small spheres along the life trajectory line to mark when relationships formed
- Connection lines originate from these markers rather than the main sphere

**Marker Placement Rules:**

| Data Available | Marker Placement |
|----------------|------------------|
| Relationship start date known | Place marker at that year on subject's life line |
| Only birth dates known | Heuristic: marker when subject was ~10 years old (student starting training) |
| Subject is the object (e.g., teacher in student_of) | Marker placed based on student's age |

**Connection Rendering:**
- Connection lines go from subject's marker to object's relevant position
- Question: Should object also have a marker? (See Open Questions)

## Open Questions

### 1. Connection Endpoint on Object Side

**Option A: Marker on both ends (horizontal connections)**
- Pro: Clean, consistent visual
- Con: May look artificial, doesn't show temporal flow

**Option B: Connect to object's current position (moving sphere)**
- Pro: Shows the dynamic relationship
- Con: Connections could get crowded as spheres move

**Option C: Connect to object's position at relationship start**
- Pro: Historically accurate representation
- Con: Complex to implement, connections may cross awkwardly

**Recommendation:** Start with Option B, evaluate visually, potentially make configurable.

### 2. Missing Relationship Dates

For `student_of` and `trained_under`:
- If student birth year known: place marker when student was 10
- If only teacher birth year known: estimate relationship at teacher age 30-40?
- If neither known: fall back to simple connection (no marker)

### 3. Concurrent Students

Multiple students of the same teacher at similar times:
- Markers could overlap on teacher's life line
- Consider: slight angular offset for markers, or stacking

### 4. Performance with Many Nodes

- Progressive reveal may help initial render
- Consider LOD (level of detail) - simplified nodes when zoomed out
- Batch animations for smooth playback

## Technical Considerations

### State Management

```typescript
interface TimelineState {
  currentYear: number;
  isPlaying: boolean;
  playbackSpeed: number; // years per second
  minYear: number; // derived from data
  maxYear: number; // derived from data or current year
}

// New atom for timeline state
export const timelineStateAtom = atom<TimelineState>({...});
```

### Node Visibility Computation

```typescript
interface TemporalNode extends ForceNode {
  birthYear: number | null;
  deathYear: number | null;
  isVisible: boolean; // computed from currentYear >= birthYear
  currentRadius: number; // computed based on timeline position
  birthRadius: number; // fixed at birth year radius
}
```

### Three.js Additions

- Timeline ring: `THREE.Line` with `CircleGeometry`
- Year label: Sprite following the ring
- Birth/death markers: Small spheres with lower opacity
- Life trajectory lines: `THREE.Line` connecting markers
- Relationship markers: Small colored spheres on life lines

### Animation Loop Integration

```typescript
// In graph animation frame
function updateTimelineVisuals(currentYear: number) {
  // Update ring radius
  // Update year label position
  // Show/hide nodes based on birth year
  // Update node positions (Tier 2)
  // Update connection visibility
}
```

## UI Components

### TimelineSlider Component

```
[1888]----[====|====]----[2024]  [>] [1x]
           ↑ current year    play  speed
```

- Range: min birth year in data → current year (or latest death)
- Debounced updates for smooth interaction
- Keyboard accessible (arrow keys)

### Integration with GraphControls

- Add timeline section to left panel, or
- Overlay controls on graph bottom edge
- Consider mobile: collapsible panel

## Data Requirements

Current schema fields used:
- `person.birthYear` - primary reveal trigger
- `person.deathYear` - for life trajectory end (often null)
- `group.foundingYear` - reveal trigger for groups
- `statement.startDate` / `endDate` - relationship timing (often null)

New considerations:
- Many records lack death dates - need graceful handling
- Relationship dates rarely available - heuristics needed
- Consider data enrichment as separate initiative

## Future Enhancements

- **Era highlights:** Pulse or highlight during significant periods (Golden Age of Capoeira, etc.)
- **Generation visualization:** Color-code by "generation" from root nodes
- **Path tracing:** Highlight lineage path when node selected
- **Snapshot/share:** Capture timeline at specific year for sharing
- **Comparison mode:** Side-by-side different lineage branches

## Implementation Order

1. Basic slider UI + timeline ring visualization
2. Node visibility based on birth year
3. Connection visibility when both nodes visible
4. Auto-play animation
5. (Tier 2) Birth markers + moving spheres
6. (Tier 2) Life trajectory lines
7. (Tier 3) Relationship markers
8. Polish + performance optimization

## Effort Estimate

- Tier 1 (MVP): Medium complexity, core feature value
- Tier 2: Medium-high complexity, significant visual enhancement
- Tier 3: High complexity, data-dependent value

Recommend starting with Tier 1, evaluating with real data, then iterating.

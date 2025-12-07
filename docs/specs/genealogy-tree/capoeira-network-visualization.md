# Capoeira Network Visualization Feature Specification

**Status:** Planning / Not Implemented
**Created:** 2025-01-19
**Last Updated:** 2025-01-19

## Table of Contents

1. [Overview](#overview)
2. [Problem Statement](#problem-statement)
3. [Goals and Objectives](#goals-and-objectives)
4. [User Stories](#user-stories)
5. [Functional Requirements](#functional-requirements)
6. [Technical Architecture](#technical-architecture)
7. [Data Model](#data-model)
8. [UI/UX Design](#uiux-design)
9. [Performance Considerations](#performance-considerations)
10. [Implementation Phases](#implementation-phases)
11. [Success Metrics](#success-metrics)
12. [Future Enhancements](#future-enhancements)
13. [References](#references)

## Overview

An interactive 3D network visualization system to display the complex relationships within the global Capoeira community, including teacher-student lineages, group affiliations, event participation, and geographic connections.

### Vision

Create an immersive, explorable genealogy tree of Capoeira that reveals:
- **Lineages**: Teacher-student relationships across generations
- **Groups**: Organizational structures and membership networks
- **Geography**: Spatial distribution of practitioners and groups
- **Events**: How gatherings connect the community
- **Influence**: Cultural and stylistic connections

### Inspiration

Similar to network visualizations used in:
- Gitcoin donation networks
- Circles crypto social graphs
- Academic citation networks
- Social network analysis platforms

## Problem Statement

### Current Limitations

1. **Flat Data Presentation**: Existing user/group profiles show isolated information
2. **Hidden Connections**: Relationships between practitioners, groups, and lineages are not visible
3. **Lost History**: Capoeira's oral tradition and genealogical connections are difficult to document
4. **Discovery Challenges**: Users cannot explore how they're connected to the broader community
5. **Limited Context**: New practitioners can't understand their place in Capoeira's history

### Opportunity

Capoeira has a rich, multi-generational history with well-documented lineages (Mestre Bimba → Grupo Senzala → modern schools, etc.). A visual network can:
- Preserve cultural heritage
- Help practitioners understand their lineage
- Facilitate community discovery
- Reveal unexpected connections
- Support academic research

## Goals and Objectives

### Primary Goals

1. **Visualize Lineages**: Show teacher-student relationships across generations
2. **Connect Community**: Reveal how individuals and groups are interconnected
3. **Preserve History**: Document and display Capoeira's genealogical tree
4. **Enable Exploration**: Allow users to navigate and discover connections interactively
5. **Support Research**: Provide data for academic study of Capoeira's spread and evolution

### Non-Goals (v1)

- Real-time collaboration on network editing
- AI-powered relationship suggestions
- Video/multimedia integration in graph nodes
- Mobile VR/AR visualization
- Automatic lineage verification

## User Stories

### As a Practitioner

- I want to see my lineage back to Capoeira's founders
- I want to discover who else trained under my mestre
- I want to understand connections between different groups
- I want to find practitioners in my city who share my lineage

### As a Mestre/Professor

- I want to visualize my students and their progression
- I want to see how my group has spread geographically
- I want to document my own lineage for students
- I want to identify potential collaboration partners

### As a Researcher

- I want to analyze how Capoeira spread globally over time
- I want to study the evolution of different styles (Angola, Regional, Contemporânea)
- I want to export network data for academic analysis
- I want to filter by time period, geography, and style

### As a Newcomer

- I want to understand Capoeira's history visually
- I want to see the difference between major groups/styles
- I want to find local practitioners and their backgrounds
- I want to explore notable mestres and their contributions

## Functional Requirements

### Core Features

#### FR-1: 3D Interactive Graph Visualization

**Description**: Render network as interactive 3D force-directed graph

**Requirements**:
- Users can rotate, zoom, and pan the 3D space
- Nodes represent people, groups, or events
- Links represent relationships (teacher-student, membership, etc.)
- Smooth animations for layout and interactions
- WebGL rendering for performance
- Responsive to window resize

**Acceptance Criteria**:
- Graph renders with 1000+ nodes without lag
- All interactions respond within 100ms
- Mobile users can interact via touch gestures

#### FR-2: Multi-Type Node Support

**Description**: Display different entity types with distinct visual properties

**Node Types**:
- **Person**: Size by influence/students, color by title (mestre, professor, etc.)
- **Group**: Size by membership, color by style (Angola, Regional, etc.)
- **Event**: Size by attendance, color by type (batizado, workshop, etc.)
- **Location**: Geographic anchor points

**Acceptance Criteria**:
- Each node type has distinct visual representation
- User can toggle node type visibility
- Node details appear on hover
- Click navigates to entity profile page

#### FR-3: Relationship Types

**Description**: Visualize different connection types with distinct styling

**Link Types**:
- **Teacher-Student**: Directional arrow, color by strength
- **Member-Of**: Group affiliation, dashed line
- **Trained-At**: Event participation, dotted line
- **Lineage**: Historical connection, thick line
- **Influenced-By**: Cultural/stylistic connection, thin line

**Acceptance Criteria**:
- Each link type has distinct color and style
- Links show direction where relevant
- User can filter by relationship type
- Tooltip shows relationship details on hover

#### FR-4: Filtering and Search

**Description**: Allow users to focus on specific parts of the network

**Filters**:
- **Entity Type**: People, groups, events, locations
- **Relationship Type**: Teacher-student, membership, etc.
- **Time Period**: Slider from 1930s to present
- **Geography**: Country, state/region, city
- **Style**: Angola, Regional, Contemporânea
- **Title**: Mestre, contra-mestre, professor, etc.

**Search**:
- Text search for names
- Highlight matching nodes
- Center view on search result
- Show path between two nodes

**Acceptance Criteria**:
- Filters update graph within 500ms
- Search returns results as user types
- Filter state persists in URL query params
- Can combine multiple filters

#### FR-5: Node Details Panel

**Description**: Display comprehensive information about selected node

**Content**:
- **Person**: Name, title, group, lineage, bio, photo
- **Group**: Name, founder, location, members, style
- **Event**: Name, date, location, participants, photos

**Actions**:
- View full profile page
- See direct connections
- Navigate to connected nodes
- Share specific view

**Acceptance Criteria**:
- Panel slides in on node click
- Loads data without blocking graph
- Responsive on mobile
- Can navigate between connected nodes without closing panel

#### FR-6: Path Finding

**Description**: Find and highlight shortest path between two entities

**Features**:
- Select "from" and "to" nodes
- Calculate shortest path via relationships
- Highlight path in contrasting color
- Show degree of separation
- Display path nodes in sidebar list

**Use Cases**:
- "How am I connected to Mestre Bimba?"
- "What's the connection between these two groups?"
- "Find practitioners with shared lineage"

**Acceptance Criteria**:
- Path calculation completes in <1s for networks with <10k nodes
- Path is highlighted distinctly from other nodes/links
- Can save/share discovered paths
- Works with relationship type filters

#### FR-7: Time-Based Visualization

**Description**: Show network evolution over time

**Features**:
- Timeline slider from 1930s to present
- Animate network growth over time
- Nodes appear when person/group/event was active
- Links appear when relationships formed
- Play/pause animation controls

**Acceptance Criteria**:
- Smooth animation at 30fps
- Can scrub timeline to any point
- Animation speed is adjustable
- Pause and resume without reset

#### FR-8: Geographic Overlay

**Description**: Optionally map network onto geographic space

**Features**:
- Toggle between force-directed and geographic layout
- 3D globe or flat map as base
- Nodes positioned by location
- Links show geographic distribution
- Zoom to specific regions

**Acceptance Criteria**:
- Smooth transition between layouts
- Integrates with existing PostGIS location data
- Can cluster nearby nodes at low zoom
- Preserves filters when switching layouts

### Secondary Features

#### FR-9: Export and Sharing

**Formats**:
- PNG/SVG of current view
- JSON of filtered network data
- CSV of nodes and edges for analysis
- Shareable URL with filter state

**Acceptance Criteria**:
- Exports maintain visual quality
- Data exports include metadata
- Shared URLs restore exact view state

#### FR-10: Statistics and Analytics

**Metrics**:
- Network size (nodes, edges)
- Degree distribution (most connected nodes)
- Average path length (degrees of separation)
- Clustering coefficient
- Geographic distribution

**Acceptance Criteria**:
- Statistics update with filters
- Visualize metrics in charts
- Compare different time periods

#### FR-11: Accessibility

**Requirements**:
- Keyboard navigation support
- Screen reader compatibility for node data
- High contrast mode
- Reduced motion option
- Alternative 2D tree view for lineages

**Acceptance Criteria**:
- WCAG 2.1 AA compliant
- All features accessible via keyboard
- Screen readers announce node selection
- Respects user's motion preferences

## Technical Architecture

### Technology Stack

#### Visualization Library

**Primary Choice: react-force-graph-3d**

**Rationale**:
- React integration (fits Next.js 15 stack)
- 3D WebGL rendering (performant)
- Force-directed layout (natural clustering)
- Active maintenance and community
- Used in similar crypto/social network visualizations

**Alternatives Considered**:
- Cytoscape.js: Better for complex analysis but primarily 2D
- Sigma.js: Great for large networks but less 3D support
- D3.js + Three.js: More control but significant development time

**Dependencies**:
```json
{
  "react-force-graph-3d": "^1.24.0",
  "three": "^0.160.0",
  "3d-force-graph": "^1.73.0"
}
```

#### Component Architecture

```
app/network/
├── page.tsx                          # Main network page
├── components/
│   ├── NetworkVisualization.tsx      # 3D graph container
│   ├── NetworkControls.tsx           # Filters, search, settings
│   ├── NodeDetailsPanel.tsx          # Selected node information
│   ├── TimelineControls.tsx          # Time-based filtering
│   ├── PathFinder.tsx                # Shortest path tool
│   ├── StatisticsPanel.tsx           # Network metrics
│   └── LayoutToggle.tsx              # Force/geographic layout switch
├── hooks/
│   ├── useNetworkData.ts             # Fetch and transform graph data
│   ├── useNetworkFilters.ts          # Filter state management
│   ├── usePathFinding.ts             # Dijkstra/BFS algorithms
│   └── useNetworkStats.ts            # Calculate network metrics
└── utils/
    ├── graphTransform.ts             # DB data → graph format
    ├── graphAlgorithms.ts            # Path finding, centrality, etc.
    └── graphLayouts.ts               # Custom layout algorithms
```

### API Endpoints

#### GET `/api/network/graph`

**Purpose**: Fetch network graph data with filters

**Query Parameters**:
```typescript
{
  nodeTypes?: string[];          // ['person', 'group', 'event']
  linkTypes?: string[];          // ['teacher-student', 'member-of']
  startDate?: string;            // ISO date
  endDate?: string;              // ISO date
  country?: string;
  style?: string;                // 'angola' | 'regional' | 'contemporânea'
  centerNode?: string;           // UUID - load graph centered on this node
  depth?: number;                // 1-5 - how many hops from centerNode
  limit?: number;                // Max nodes to return
}
```

**Response**:
```typescript
{
  nodes: Array<{
    id: string;
    name: string;
    type: 'person' | 'group' | 'event' | 'location';
    metadata: {
      title?: string;           // For people
      style?: string;           // For groups
      date?: string;            // For events
      location?: {
        lat: number;
        lng: number;
        country: string;
      };
      avatar?: string;
      memberCount?: number;
      createdAt: string;
    };
  }>;
  links: Array<{
    source: string;             // Node ID
    target: string;             // Node ID
    type: 'teacher-student' | 'member-of' | 'trained-at' | 'lineage' | 'influenced-by';
    metadata: {
      strength?: number;        // 1-10
      startDate?: string;
      endDate?: string;
      verified?: boolean;
    };
  }>;
  stats: {
    totalNodes: number;
    totalLinks: number;
    filteredNodes: number;
    filteredLinks: number;
  };
}
```

**Performance**:
- Cache aggressively (React Query with 15min stale time)
- Implement progressive loading (load nearby nodes, fetch more on demand)
- Use database indexes on foreign keys and filter columns
- Consider materialized views for common queries

#### POST `/api/network/path`

**Purpose**: Find shortest path between two nodes

**Request Body**:
```typescript
{
  fromId: string;
  toId: string;
  relationshipTypes?: string[];  // Filter path by relationship types
  maxDepth?: number;             // Max hops (default: 10)
}
```

**Response**:
```typescript
{
  path: Array<{
    nodeId: string;
    linkType: string;
    direction: 'incoming' | 'outgoing';
  }>;
  degrees: number;               // Degrees of separation
}
```

**Algorithm**: Bidirectional BFS for performance

#### GET `/api/network/stats`

**Purpose**: Calculate network-wide statistics

**Response**:
```typescript
{
  overview: {
    totalPeople: number;
    totalGroups: number;
    totalEvents: number;
    totalRelationships: number;
  };
  distribution: {
    byCountry: Record<string, number>;
    byStyle: Record<string, number>;
    byTitle: Record<string, number>;
    byDecade: Record<string, number>;
  };
  metrics: {
    avgDegree: number;
    maxDegree: number;
    avgPathLength: number;
    clusteringCoefficient: number;
    mostConnectedNodes: Array<{
      id: string;
      name: string;
      connections: number;
    }>;
  };
}
```

### Client-Side Architecture

#### State Management

**Jotai Atoms**:
```typescript
// atoms/networkAtoms.ts

export const networkFiltersAtom = atom({
  nodeTypes: ['person', 'group', 'event'] as const,
  linkTypes: [] as string[],      // Empty = all types
  timeRange: [null, null] as [Date | null, Date | null],
  countries: [] as string[],
  styles: [] as string[],
  searchQuery: '',
});

export const selectedNodeAtom = atom<string | null>(null);

export const pathFindingAtom = atom({
  fromNode: null as string | null,
  toNode: null as string | null,
  path: [] as string[],
});

export const networkLayoutAtom = atom<'force' | 'geographic'>('force');
```

**React Query Integration**:
```typescript
// hooks/useNetworkData.ts

export function useNetworkData() {
  const [filters] = useAtom(networkFiltersAtom);

  return useQuery({
    queryKey: ['network-graph', filters],
    queryFn: async () => {
      const params = new URLSearchParams();
      // Build query params from filters
      const res = await fetch(`/api/network/graph?${params}`);
      return res.json();
    },
    staleTime: 15 * 60 * 1000,    // 15 minutes
    gcTime: 30 * 60 * 1000,        // 30 minutes
  });
}
```

#### Graph Rendering

**Force-Directed Layout Configuration**:
```typescript
// components/NetworkVisualization.tsx

<ForceGraph3D
  graphData={data}

  // Performance
  numDimensions={3}
  dagMode={null}                  // Disable DAG for genealogy
  cooldownTicks={100}

  // Node styling
  nodeAutoColorBy="type"
  nodeVal={(node) => {
    // Size by importance
    if (node.type === 'person') return node.metadata.studentCount || 5;
    if (node.type === 'group') return node.metadata.memberCount || 10;
    return 5;
  }}
  nodeLabel={(node) => `
    <div style="color: white; background: rgba(0,0,0,0.8); padding: 8px; border-radius: 4px;">
      <strong>${node.name}</strong><br/>
      ${node.metadata.title || node.type}
    </div>
  `}

  // Link styling
  linkColor={(link) => LINK_COLORS[link.type]}
  linkWidth={(link) => link.metadata.strength || 1}
  linkDirectionalArrowLength={3.5}
  linkDirectionalArrowRelPos={1}
  linkDirectionalParticles={2}
  linkDirectionalParticleSpeed={0.005}

  // Interaction
  onNodeClick={handleNodeClick}
  onNodeHover={handleNodeHover}
  onBackgroundClick={handleBackgroundClick}

  // Camera
  enableNavigationControls={true}
  showNavInfo={false}
/>
```

## Data Model

### Database Schema Extensions

#### Lineage Relationships Table

```typescript
// db/schema.ts

export const lineageRelationships = pgTable('lineage_relationships', {
  id: uuid('id').primaryKey().defaultRandom(),
  teacherId: uuid('teacher_id')
    .notNull()
    .references(() => users.id, { onDelete: 'cascade' }),
  studentId: uuid('student_id')
    .notNull()
    .references(() => users.id, { onDelete: 'cascade' }),

  relationshipType: varchar('relationship_type', { length: 50 }).notNull(),
  // 'direct' - taught directly
  // 'indirect' - student of student
  // 'influenced' - significant influence but not formal teaching

  strength: integer('strength').default(5),  // 1-10
  verified: boolean('verified').default(false),

  startedAt: timestamp('started_at'),
  endedAt: timestamp('ended_at'),

  location: varchar('location'),
  notes: text('notes'),

  createdAt: timestamp('created_at').notNull().defaultNow(),
  createdBy: uuid('created_by').references(() => users.id),

  metadata: jsonb('metadata'),  // Flexible for future fields
}, (table) => ({
  teacherIdx: index('lineage_teacher_idx').on(table.teacherId),
  studentIdx: index('lineage_student_idx').on(table.studentId),
  typeIdx: index('lineage_type_idx').on(table.relationshipType),
  verifiedIdx: index('lineage_verified_idx').on(table.verified),
}));
```

#### Network Cache Table (Optimization)

```typescript
export const networkCache = pgTable('network_cache', {
  id: uuid('id').primaryKey().defaultRandom(),
  cacheKey: varchar('cache_key', { length: 255 }).notNull().unique(),

  graphData: jsonb('graph_data').notNull(),
  // Pre-computed graph for common queries

  filterHash: varchar('filter_hash', { length: 64 }).notNull(),
  // MD5 of filter parameters

  nodeCount: integer('node_count').notNull(),
  linkCount: integer('link_count').notNull(),

  computedAt: timestamp('computed_at').notNull().defaultNow(),
  expiresAt: timestamp('expires_at').notNull(),

  hitCount: integer('hit_count').default(0),
}, (table) => ({
  keyIdx: index('cache_key_idx').on(table.cacheKey),
  expiryIdx: index('cache_expiry_idx').on(table.expiresAt),
}));
```

#### Event Participation Table (Extension)

```typescript
// Extend existing events table relationships

export const eventParticipants = pgTable('event_participants', {
  id: uuid('id').primaryKey().defaultRandom(),
  eventId: uuid('event_id')
    .notNull()
    .references(() => events.id, { onDelete: 'cascade' }),
  userId: uuid('user_id')
    .notNull()
    .references(() => users.id, { onDelete: 'cascade' }),

  role: varchar('role', { length: 50 }).notNull(),
  // 'organizer', 'instructor', 'participant', 'performer'

  confirmedAt: timestamp('confirmed_at'),

  metadata: jsonb('metadata'),
}, (table) => ({
  eventIdx: index('participant_event_idx').on(table.eventId),
  userIdx: index('participant_user_idx').on(table.userId),
  roleIdx: index('participant_role_idx').on(table.role),
  uniqueParticipant: unique('unique_event_participant').on(table.eventId, table.userId),
}));
```

### Graph Data Queries

#### Build Network Graph

```typescript
// db/queries/network.ts

export async function getNetworkGraph(filters: NetworkFilters) {
  const nodes: NetworkNode[] = [];
  const links: NetworkLink[] = [];
  const nodeIds = new Set<string>();

  // 1. Fetch filtered users (people nodes)
  if (filters.nodeTypes.includes('person')) {
    const users = await db.query.users.findMany({
      where: and(
        filters.countries.length > 0
          ? inArray(users.countryCode, filters.countries)
          : undefined,
        filters.styles.length > 0
          ? exists(
              db.select()
                .from(groups)
                .where(
                  and(
                    eq(groups.id, users.groupId),
                    inArray(groups.style, filters.styles)
                  )
                )
            )
          : undefined,
      ),
      with: {
        group: true,
      },
    });

    for (const user of users) {
      nodeIds.add(user.id);
      nodes.push({
        id: user.id,
        name: user.name || user.nickname || 'Unknown',
        type: 'person',
        metadata: {
          title: user.title,
          avatar: user.avatar,
          groupId: user.groupId,
          groupName: user.group?.name,
          style: user.group?.style,
          createdAt: user.createdAt.toISOString(),
        },
      });
    }
  }

  // 2. Fetch groups (group nodes)
  if (filters.nodeTypes.includes('group')) {
    const groupData = await db.query.groups.findMany({
      where: filters.styles.length > 0
        ? inArray(groups.style, filters.styles)
        : undefined,
      with: {
        locations: true,
      },
    });

    for (const group of groupData) {
      nodeIds.add(group.id);
      nodes.push({
        id: group.id,
        name: group.name,
        type: 'group',
        metadata: {
          style: group.style,
          founder: group.founder,
          logo: group.logo,
          locationCount: group.locations.length,
          createdAt: group.createdAt.toISOString(),
        },
      });
    }
  }

  // 3. Fetch lineage relationships (links)
  if (filters.linkTypes.length === 0 || filters.linkTypes.includes('teacher-student')) {
    const lineages = await db.query.lineageRelationships.findMany({
      where: and(
        filters.verified !== undefined
          ? eq(lineageRelationships.verified, filters.verified)
          : undefined,
        filters.timeRange[0]
          ? gte(lineageRelationships.startedAt, filters.timeRange[0])
          : undefined,
        filters.timeRange[1]
          ? lte(lineageRelationships.startedAt, filters.timeRange[1])
          : undefined,
      ),
    });

    for (const lineage of lineages) {
      // Only include if both nodes are in the graph
      if (nodeIds.has(lineage.teacherId) && nodeIds.has(lineage.studentId)) {
        links.push({
          source: lineage.teacherId,
          target: lineage.studentId,
          type: 'teacher-student',
          metadata: {
            strength: lineage.strength,
            verified: lineage.verified,
            startDate: lineage.startedAt?.toISOString(),
            endDate: lineage.endedAt?.toISOString(),
          },
        });
      }
    }
  }

  // 4. Fetch group memberships (links)
  if (filters.linkTypes.length === 0 || filters.linkTypes.includes('member-of')) {
    const memberships = await db.query.users.findMany({
      where: and(
        isNotNull(users.groupId),
        // Only users already in nodeIds
      ),
      columns: {
        id: true,
        groupId: true,
        createdAt: true,
      },
    });

    for (const membership of memberships) {
      if (
        membership.groupId &&
        nodeIds.has(membership.id) &&
        nodeIds.has(membership.groupId)
      ) {
        links.push({
          source: membership.id,
          target: membership.groupId,
          type: 'member-of',
          metadata: {
            since: membership.createdAt.toISOString(),
          },
        });
      }
    }
  }

  return { nodes, links };
}
```

#### Find Shortest Path (Dijkstra)

```typescript
export async function findShortestPath(
  fromId: string,
  toId: string,
  relationshipTypes?: string[],
  maxDepth: number = 10
): Promise<{ path: string[]; degrees: number } | null> {
  // Build adjacency list from database
  const adjacencyList = new Map<string, Array<{ id: string; type: string }>>();

  // Fetch all relevant relationships
  const relationships = await db.query.lineageRelationships.findMany({
    where: relationshipTypes
      ? inArray(lineageRelationships.relationshipType, relationshipTypes)
      : undefined,
  });

  // Build bidirectional graph
  for (const rel of relationships) {
    if (!adjacencyList.has(rel.teacherId)) {
      adjacencyList.set(rel.teacherId, []);
    }
    if (!adjacencyList.has(rel.studentId)) {
      adjacencyList.set(rel.studentId, []);
    }

    adjacencyList.get(rel.teacherId)!.push({
      id: rel.studentId,
      type: 'teacher-student',
    });
    adjacencyList.get(rel.studentId)!.push({
      id: rel.teacherId,
      type: 'student-teacher',
    });
  }

  // BFS for shortest path
  const queue: Array<{ nodeId: string; path: string[] }> = [
    { nodeId: fromId, path: [fromId] },
  ];
  const visited = new Set<string>([fromId]);

  while (queue.length > 0) {
    const { nodeId, path } = queue.shift()!;

    if (path.length > maxDepth) continue;

    if (nodeId === toId) {
      return {
        path,
        degrees: path.length - 1,
      };
    }

    const neighbors = adjacencyList.get(nodeId) || [];
    for (const neighbor of neighbors) {
      if (!visited.has(neighbor.id)) {
        visited.add(neighbor.id);
        queue.push({
          nodeId: neighbor.id,
          path: [...path, neighbor.id],
        });
      }
    }
  }

  return null; // No path found
}
```

## UI/UX Design

### Page Layout

```
┌─────────────────────────────────────────────────────────────┐
│ Header: Capoeira Network                              [User]│
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  [Filters Panel]           [3D Graph View]         [Details] │
│  ┌──────────────┐         ┌─────────────┐         ┌────────┐│
│  │ Node Types   │         │             │         │Selected││
│  │ ☑ People     │         │             │         │Node    ││
│  │ ☑ Groups     │         │    ●─●─●    │         │Info    ││
│  │ ☑ Events     │         │   ╱ │ ╲    │         │        ││
│  │              │         │  ●  ●  ●   │         │[Photo] ││
│  │ Link Types   │         │   ╲ │ ╱    │         │        ││
│  │ ☑ Teacher    │         │    ●─●     │         │Name    ││
│  │ ☑ Member     │         │            │         │Title   ││
│  │              │         │            │         │Group   ││
│  │ [Search...]  │         │            │         │        ││
│  │              │         │            │         │[View   ││
│  │ Time: ═══○═  │         │            │         │Profile]││
│  │ 1930 - 2025  │         └─────────────┘         │        ││
│  │              │                                  │[Find   ││
│  │ Style:       │         [Force] [Geographic]    │Path]   ││
│  │ ○ All        │                                  │        ││
│  │ ○ Angola     │         [Statistics Panel]      └────────┘│
│  │ ○ Regional   │         ┌─────────────────┐               │
│  │ ○ Contemp.   │         │ Nodes: 1,234    │               │
│  │              │         │ Links: 3,456    │               │
│  │ [Reset]      │         │ Avg Degree: 2.8 │               │
│  └──────────────┘         └─────────────────┘               │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

### Visual Design System

#### Node Styling

**People**:
- Shape: Sphere
- Size: Based on number of students (5-20 units)
- Color by title:
  - Mestre: Gold (#FFD700)
  - Contra-Mestre: Silver (#C0C0C0)
  - Professor: Blue (#4DABF7)
  - Instrutor: Green (#51CF66)
  - Student: Gray (#868E96)

**Groups**:
- Shape: Octahedron (8-sided)
- Size: Based on member count (10-30 units)
- Color by style:
  - Angola: Red (#FA5252)
  - Regional: Blue (#4C6EF5)
  - Contemporânea: Purple (#9775FA)
  - Mixed: Orange (#FD7E14)

**Events**:
- Shape: Tetrahedron (4-sided)
- Size: Based on participant count (5-15 units)
- Color by type:
  - Batizado: Yellow (#FFD43B)
  - Workshop: Cyan (#22B8CF)
  - Roda: Green (#51CF66)
  - Festival: Pink (#F06595)

#### Link Styling

**Teacher-Student**:
- Color: Gradient from teacher to student node color
- Width: Based on relationship strength (1-5px)
- Style: Solid line with directional arrow
- Particles: Animated dots flowing from teacher to student

**Member-Of**:
- Color: Group color at 50% opacity
- Width: 2px
- Style: Dashed line
- Direction: Person → Group

**Trained-At**:
- Color: Event color at 30% opacity
- Width: 1px
- Style: Dotted line
- Direction: None (undirected)

**Lineage** (historical/indirect):
- Color: Gold (#FFD700) at 30% opacity
- Width: 3px
- Style: Solid but translucent
- Direction: Older → Younger generation

### Interaction Patterns

#### Hover States

- **Node Hover**:
  - Enlarge node by 1.5x
  - Show tooltip with name and key info
  - Highlight connected nodes and links
  - Dim unconnected elements

- **Link Hover**:
  - Thicken link by 2x
  - Show tooltip with relationship details
  - Highlight connected nodes

#### Click Actions

- **Node Click**:
  - Open details panel
  - Center camera on node
  - Highlight immediate connections
  - Load full node data

- **Link Click**:
  - Show relationship details in tooltip
  - Option to navigate to source or target node

- **Background Click**:
  - Deselect current node
  - Close details panel
  - Reset highlight state

#### Drag Interactions

- **Node Drag**: Fix node position temporarily
- **Background Drag**: Rotate camera (3D) or pan view (2D)
- **Pinch/Zoom**: Scale view

### Responsive Design

#### Desktop (>1024px)
- Three-column layout
- Full 3D rendering
- All panels visible simultaneously
- Keyboard shortcuts enabled

#### Tablet (768px - 1024px)
- Two-column layout
- Details panel overlays graph
- Collapsible filter panel
- Touch-optimized controls

#### Mobile (<768px)
- Single column layout
- Full-screen graph with floating controls
- Bottom sheet for filters and details
- Simplified 2D view option
- Touch gestures for navigation

## Performance Considerations

### Scalability Targets

| Network Size | Nodes | Links | Performance Target |
|--------------|-------|-------|-------------------|
| Small | <500 | <1,000 | 60fps, <1s load |
| Medium | 500-2,000 | 1,000-5,000 | 30fps, <3s load |
| Large | 2,000-10,000 | 5,000-25,000 | 30fps, <5s load |
| Very Large | >10,000 | >25,000 | Requires pagination |

### Optimization Strategies

#### 1. Progressive Loading

**Approach**: Load nodes in waves based on proximity

```typescript
async function loadNetworkProgressive(
  centerNodeId: string,
  maxDepth: number = 3
) {
  // Load immediate connections first (depth 1)
  const depth1 = await fetchNetwork({ centerNode: centerNodeId, depth: 1 });
  renderGraph(depth1);

  // Load depth 2 in background
  const depth2 = await fetchNetwork({ centerNode: centerNodeId, depth: 2 });
  updateGraph(depth2);

  // Load depth 3 on user interaction
  // Only load when user zooms in or requests
}
```

**Benefits**:
- Faster initial render (500ms vs 3s)
- Reduces memory usage
- Better perceived performance

#### 2. Level of Detail (LOD)

**Approach**: Render different detail levels based on camera distance

```typescript
function getNodeDetail(node: Node, cameraDistance: number) {
  if (cameraDistance < 100) {
    // Close up: Full detail
    return {
      geometry: highResGeometry,
      label: node.fullName,
      texture: node.avatar,
    };
  } else if (cameraDistance < 500) {
    // Medium: Simplified
    return {
      geometry: mediumResGeometry,
      label: node.name,
      texture: null,
    };
  } else {
    // Far: Minimal
    return {
      geometry: lowResGeometry,
      label: null,
      texture: null,
    };
  }
}
```

**Benefits**:
- Maintains 60fps with large networks
- Reduces GPU load
- Smooth zoom transitions

#### 3. Clustering

**Approach**: Group distant/similar nodes into meta-nodes

```typescript
function clusterNodes(nodes: Node[], zoomLevel: number) {
  if (zoomLevel < 0.3) {
    // Zoomed out: Cluster by country
    return clusterByAttribute(nodes, 'country');
  } else if (zoomLevel < 0.6) {
    // Mid zoom: Cluster by group
    return clusterByAttribute(nodes, 'groupId');
  } else {
    // Zoomed in: Show all nodes
    return nodes;
  }
}
```

**Benefits**:
- Handles networks with 50k+ nodes
- Clearer high-level view
- Reduces clutter

#### 4. Web Workers

**Approach**: Offload graph calculations to background threads

```typescript
// workers/graphWorker.ts
self.addEventListener('message', (e) => {
  const { type, data } = e.data;

  switch (type) {
    case 'findPath':
      const path = dijkstra(data.graph, data.from, data.to);
      self.postMessage({ type: 'pathResult', path });
      break;

    case 'calculateStats':
      const stats = computeNetworkMetrics(data.graph);
      self.postMessage({ type: 'statsResult', stats });
      break;

    case 'filterGraph':
      const filtered = applyFilters(data.graph, data.filters);
      self.postMessage({ type: 'filteredGraph', graph: filtered });
      break;
  }
});
```

**Benefits**:
- Keeps UI responsive during heavy computation
- Prevents frame drops
- Enables real-time filtering

#### 5. Database Optimizations

**Indexes**:
```sql
-- Lineage queries
CREATE INDEX lineage_teacher_student_idx
  ON lineage_relationships (teacher_id, student_id);

-- Filter queries
CREATE INDEX users_group_title_idx
  ON users (group_id, title);
CREATE INDEX groups_style_idx
  ON groups (style);

-- Geographic queries
CREATE INDEX users_country_idx
  ON users (country_code);

-- Time-based queries
CREATE INDEX lineage_started_idx
  ON lineage_relationships (started_at);
```

**Materialized View** (for common queries):
```sql
CREATE MATERIALIZED VIEW network_summary AS
SELECT
  u.id,
  u.name,
  u.title,
  u.group_id,
  g.name AS group_name,
  g.style,
  COUNT(DISTINCT lr_teacher.student_id) AS student_count,
  COUNT(DISTINCT lr_student.teacher_id) AS teacher_count
FROM users u
LEFT JOIN groups g ON u.group_id = g.id
LEFT JOIN lineage_relationships lr_teacher ON u.id = lr_teacher.teacher_id
LEFT JOIN lineage_relationships lr_student ON u.id = lr_student.student_id
GROUP BY u.id, g.id;

-- Refresh periodically
REFRESH MATERIALIZED VIEW CONCURRENTLY network_summary;
```

**Benefits**:
- Sub-second query times for large networks
- Reduced database load
- Better cache hit rates

#### 6. Client-Side Caching

**React Query Configuration**:
```typescript
const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 15 * 60 * 1000,        // 15 minutes
      gcTime: 30 * 60 * 1000,            // 30 minutes
      refetchOnWindowFocus: false,       // Don't refetch on focus
      refetchOnReconnect: false,         // Don't refetch on reconnect
    },
  },
});
```

**Benefits**:
- Instant navigation between views
- Reduces server load
- Works offline after initial load

### Performance Monitoring

**Metrics to Track**:
- Initial load time (target: <3s)
- Frame rate (target: >30fps)
- Memory usage (target: <500MB)
- API response time (target: <500ms)
- Graph layout time (target: <1s)

**Instrumentation**:
```typescript
// utils/performance.ts

export function measureGraphRender(graphData: GraphData) {
  const start = performance.now();

  // Track memory
  const memoryBefore = (performance as any).memory?.usedJSHeapSize;

  return {
    complete: () => {
      const end = performance.now();
      const memoryAfter = (performance as any).memory?.usedJSHeapSize;

      console.log({
        renderTime: end - start,
        nodeCount: graphData.nodes.length,
        linkCount: graphData.links.length,
        memoryDelta: memoryAfter - memoryBefore,
      });
    },
  };
}
```

## Implementation Phases

### Phase 1: MVP (4-6 weeks)

**Goal**: Basic 3D visualization with core features

**Deliverables**:
- ✅ 3D force-directed graph rendering
- ✅ Person and Group nodes
- ✅ Teacher-Student and Member-Of links
- ✅ Basic filtering (node types, link types)
- ✅ Node click → details panel
- ✅ Search by name
- ✅ API endpoints for graph data
- ✅ Database schema migrations

**Technical Tasks**:
1. Install react-force-graph-3d and dependencies
2. Create network page and base components
3. Implement database queries for graph data
4. Build API endpoints with caching
5. Create filter UI and state management
6. Implement node details panel
7. Add search functionality
8. Write basic tests

**Success Criteria**:
- Renders networks up to 1,000 nodes at 30fps
- Filters update within 500ms
- All interactions responsive
- Mobile-friendly (responsive layout)

### Phase 2: Enhanced Features (3-4 weeks)

**Goal**: Add advanced visualization and exploration features

**Deliverables**:
- ✅ Event nodes and Trained-At links
- ✅ Geographic layout mode
- ✅ Timeline controls and time-based filtering
- ✅ Path finding tool
- ✅ Network statistics panel
- ✅ Export functionality (PNG, JSON, CSV)
- ✅ Lineage verification system
- ✅ Share view via URL

**Technical Tasks**:
1. Add event participation tracking
2. Implement geographic layout with PostGIS integration
3. Build timeline slider and animation
4. Create path-finding algorithm (BFS/Dijkstra)
5. Calculate network metrics (centrality, clustering)
6. Add export features
7. Implement URL state persistence
8. Create lineage verification workflow

**Success Criteria**:
- Smooth transitions between layouts
- Path finding completes in <1s
- Timeline animation at 30fps
- Exports maintain quality
- URL sharing works correctly

### Phase 3: Performance & Scale (2-3 weeks)

**Goal**: Optimize for large networks and production use

**Deliverables**:
- ✅ Progressive loading system
- ✅ Level of detail rendering
- ✅ Node clustering for large networks
- ✅ Web Worker integration
- ✅ Materialized views and indexes
- ✅ Performance monitoring
- ✅ Accessibility improvements

**Technical Tasks**:
1. Implement progressive loading
2. Add LOD system for nodes and links
3. Create clustering algorithms
4. Move heavy computations to Web Workers
5. Optimize database queries and indexes
6. Add performance instrumentation
7. Implement keyboard navigation
8. Add screen reader support

**Success Criteria**:
- Handles 10,000+ node networks
- Maintains 30fps under load
- Initial load <3s for typical network
- WCAG 2.1 AA compliant
- Memory usage <500MB

### Phase 4: Polish & Documentation (1-2 weeks)

**Goal**: Production-ready release

**Deliverables**:
- ✅ User guide and tutorials
- ✅ Admin tools for lineage verification
- ✅ Analytics integration
- ✅ Error handling and edge cases
- ✅ Performance optimization
- ✅ Security audit

**Technical Tasks**:
1. Write user documentation
2. Create video tutorials
3. Build admin panel for data curation
4. Add analytics tracking
5. Implement error boundaries and fallbacks
6. Security review and fixes
7. Load testing and optimization
8. Beta user testing

**Success Criteria**:
- Documentation complete
- All critical bugs fixed
- Performance targets met
- Security vulnerabilities addressed
- Positive user feedback

## Success Metrics

### Quantitative Metrics

**Adoption**:
- Monthly active users viewing network: >500 (6 months post-launch)
- Average session duration: >5 minutes
- Return rate: >30% of users return within 7 days

**Performance**:
- Page load time: <3s for 90th percentile
- Frame rate: >30fps for 95% of sessions
- API response time: <500ms for 90th percentile
- Error rate: <1% of sessions

**Engagement**:
- Nodes clicked per session: >5
- Paths found per session: >1
- Filters applied per session: >2
- Exports created: >50/month

**Data Quality**:
- Verified lineage relationships: >80% of teacher-student links
- Data completion: >90% of profiles have group affiliation
- Network coverage: >70% of active practitioners represented

### Qualitative Metrics

**User Satisfaction**:
- Survey rating: >4.0/5.0
- Positive comments: >80%
- Feature requests logged: >20

**Community Impact**:
- Lineage discoveries: Users report finding unknown connections
- Research citations: Academic papers reference the network
- Cultural preservation: Mestres use it to document history
- Cross-group collaboration: New connections formed

### Analytics Events

Track key interactions:
```typescript
// analytics/events.ts

export const NetworkEvents = {
  GRAPH_LOADED: 'network_graph_loaded',
  NODE_CLICKED: 'network_node_clicked',
  FILTER_APPLIED: 'network_filter_applied',
  SEARCH_PERFORMED: 'network_search_performed',
  PATH_FOUND: 'network_path_found',
  LAYOUT_SWITCHED: 'network_layout_switched',
  VIEW_EXPORTED: 'network_view_exported',
  LINEAGE_VERIFIED: 'network_lineage_verified',
} as const;

// Example usage
trackEvent(NetworkEvents.PATH_FOUND, {
  from_type: 'person',
  to_type: 'person',
  degrees: 3,
  relationship_types: ['teacher-student'],
  duration_ms: 450,
});
```

## Future Enhancements

### Post-MVP Features

#### 1. Collaborative Editing

Allow users to contribute and verify relationships:
- Propose new teacher-student connections
- Upload supporting evidence (photos, certificates)
- Community voting on unverified connections
- Moderation queue for admins
- Reputation system for contributors

#### 2. Historical Timeline View

Visualize network evolution over time:
- Animated growth from 1930s to present
- See how styles spread geographically
- Track group founding and evolution
- Identify influential periods and events
- Compare different eras

#### 3. Influence Scoring

Calculate and display influence metrics:
- Number of direct students
- Generations of lineage
- Geographic spread
- Event participation
- Community recognition

#### 4. Multimedia Integration

Enhance nodes with rich media:
- Video clips embedded in node details
- Photo galleries of events
- Audio recordings of interviews
- Document archive (certificates, posters)
- Social media integration

#### 5. Mobile VR/AR

Immersive visualization:
- WebXR support for VR headsets
- AR mode to overlay network on physical space
- Gesture controls for navigation
- Spatial audio for node information
- Multi-user exploration

#### 6. AI-Powered Features

Machine learning enhancements:
- Suggest missing connections based on patterns
- Auto-complete lineage trees
- Detect data inconsistencies
- Predict relationship strength
- Recommend connections to explore

#### 7. Academic Research Tools

Support scholarly work:
- Citation export (BibTeX, APA, etc.)
- Statistical analysis toolkit
- Comparative network analysis
- Longitudinal studies support
- Data download for external tools

#### 8. Gamification

Encourage exploration and contribution:
- Achievement badges (discover your lineage, etc.)
- Leaderboards for contributors
- Quest system (find specific connections)
- Network challenges
- Rewards for verification

### Technical Debt & Improvements

#### Performance
- Implement graph database (Neo4j) for complex queries
- GPU-accelerated layout algorithms
- Server-side rendering for initial view
- Edge caching with CDN

#### Features
- Multiple simultaneous path finding
- Real-time collaboration on graph edits
- Version control for network changes
- Conflict resolution for edits
- Automated testing suite

#### UX
- Onboarding tutorial
- Keyboard shortcuts guide
- Customizable color schemes
- Saved views/bookmarks
- Comparison mode (side-by-side networks)

## References

### Technical Documentation

**Libraries**:
- [react-force-graph-3d](https://github.com/vasturiano/react-force-graph) - Primary visualization library
- [Three.js](https://threejs.org/) - 3D rendering engine
- [D3-force](https://github.com/d3/d3-force) - Force simulation algorithms

**Similar Implementations**:
- [Gitcoin Grant Explorer](https://explorer.gitcoin.co/) - Network visualization example
- [Circles UBI Network](https://circles.garden/) - Social network graph
- [Facebook Social Graph](https://developers.facebook.com/docs/graph-api) - Large-scale network
- [LinkedIn Economic Graph](https://economicgraph.linkedin.com/) - Professional network

**Academic Research**:
- [Force-Directed Graph Drawing](https://en.wikipedia.org/wiki/Force-directed_graph_drawing)
- [Network Analysis](https://en.wikipedia.org/wiki/Network_science)
- [Social Network Analysis](https://en.wikipedia.org/wiki/Social_network_analysis)

### Domain Research

**Capoeira History**:
- Mestre Bimba and the Codification of Capoeira Regional
- Grupo Senzala and the spread of Capoeira in Rio de Janeiro
- International expansion of Capoeira (1970s-present)
- Style differences: Angola vs Regional vs Contemporânea

**Genealogy Systems**:
- Family tree visualization best practices
- Martial arts lineage tracking systems
- Academic advisor networks
- Professional mentorship networks

## Appendix

### A. Sample Data Structure

```json
{
  "nodes": [
    {
      "id": "uuid-mestre-bimba",
      "name": "Mestre Bimba",
      "type": "person",
      "metadata": {
        "title": "mestre",
        "birthYear": 1899,
        "deathYear": 1974,
        "style": "regional",
        "location": {
          "lat": -12.9714,
          "lng": -38.5014,
          "country": "BR",
          "city": "Salvador"
        },
        "bio": "Founder of Capoeira Regional",
        "avatar": "/avatars/mestre-bimba.jpg",
        "verified": true
      }
    },
    {
      "id": "uuid-grupo-senzala",
      "name": "Grupo Senzala",
      "type": "group",
      "metadata": {
        "foundedYear": 1963,
        "style": "contemporânea",
        "location": {
          "lat": -22.9068,
          "lng": -43.1729,
          "country": "BR",
          "city": "Rio de Janeiro"
        },
        "founder": "Mestre Gato, Mestre Peixinho, et al.",
        "memberCount": 150,
        "logo": "/logos/senzala.png"
      }
    }
  ],
  "links": [
    {
      "source": "uuid-mestre-bimba",
      "target": "uuid-mestre-gato",
      "type": "teacher-student",
      "metadata": {
        "strength": 10,
        "verified": true,
        "startYear": 1950,
        "endYear": 1960,
        "location": "Salvador, Brazil"
      }
    },
    {
      "source": "uuid-mestre-gato",
      "target": "uuid-grupo-senzala",
      "type": "member-of",
      "metadata": {
        "role": "founder",
        "since": "1963-01-01"
      }
    }
  ]
}
```

### B. Database Migration Example

```sql
-- Migration: Create lineage relationships table

CREATE TABLE lineage_relationships (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  teacher_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  student_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  relationship_type VARCHAR(50) NOT NULL,
  strength INTEGER DEFAULT 5 CHECK (strength BETWEEN 1 AND 10),
  verified BOOLEAN DEFAULT FALSE,
  started_at TIMESTAMP,
  ended_at TIMESTAMP,
  location VARCHAR(255),
  notes TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  created_by UUID REFERENCES users(id),
  metadata JSONB,

  CONSTRAINT different_teacher_student CHECK (teacher_id != student_id)
);

CREATE INDEX lineage_teacher_idx ON lineage_relationships (teacher_id);
CREATE INDEX lineage_student_idx ON lineage_relationships (student_id);
CREATE INDEX lineage_type_idx ON lineage_relationships (relationship_type);
CREATE INDEX lineage_verified_idx ON lineage_relationships (verified);
CREATE INDEX lineage_started_idx ON lineage_relationships (started_at);

-- Add triggers for updated_at timestamp
CREATE TRIGGER update_lineage_timestamp
  BEFORE UPDATE ON lineage_relationships
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();
```

### C. Component Interface Examples

```typescript
// types/network.ts

export interface NetworkNode {
  id: string;
  name: string;
  type: 'person' | 'group' | 'event' | 'location';
  metadata: {
    // Person-specific
    title?: 'mestra' | 'mestre' | 'contra-mestra' | 'contra-mestre' |
            'professora' | 'professor' | 'instrutora' | 'instrutor' |
            'graduada' | 'graduado' | 'aluna' | 'aluno';
    groupId?: string;
    groupName?: string;
    studentCount?: number;

    // Group-specific
    style?: 'angola' | 'regional' | 'contemporânea';
    founder?: string;
    memberCount?: number;

    // Event-specific
    date?: string;
    eventType?: 'general' | 'workshop' | 'batizado' | 'public_roda';
    participantCount?: number;

    // Common
    location?: {
      lat: number;
      lng: number;
      country: string;
      city?: string;
    };
    avatar?: string;
    logo?: string;
    createdAt: string;
    verified?: boolean;
  };
}

export interface NetworkLink {
  source: string;
  target: string;
  type: 'teacher-student' | 'member-of' | 'trained-at' | 'lineage' | 'influenced-by';
  metadata: {
    strength?: number;
    verified?: boolean;
    startDate?: string;
    endDate?: string;
    location?: string;
    notes?: string;
  };
}

export interface NetworkFilters {
  nodeTypes: Array<'person' | 'group' | 'event' | 'location'>;
  linkTypes: string[];
  timeRange: [Date | null, Date | null];
  countries: string[];
  styles: Array<'angola' | 'regional' | 'contemporânea'>;
  titles: string[];
  searchQuery: string;
  verified?: boolean;
}

export interface NetworkGraphData {
  nodes: NetworkNode[];
  links: NetworkLink[];
  stats: {
    totalNodes: number;
    totalLinks: number;
    filteredNodes: number;
    filteredLinks: number;
  };
}
```

---

**End of Specification**

**Next Steps**:
1. Team review and feedback
2. Prioritize features for MVP
3. Create detailed technical design docs
4. Estimate development timeline
5. Begin Phase 1 implementation

**Questions? Contact:** [Your Name/Team]
**Document Version:** 1.0
**Last Review:** 2025-01-19

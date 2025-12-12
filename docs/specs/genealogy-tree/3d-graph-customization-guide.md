# 3D Graph Visualization for Capoeira Genealogy

This document covers the configuration and customization options for rendering the capoeira genealogy tree using `react-force-graph-3d`.

## Library Overview

### Technology Stack

- **react-force-graph-3d**: React wrapper for 3D force-directed graph visualization
- **three.js**: WebGL-based 3D rendering
- **d3-force-3d**: Physics simulation engine (velocity Verlet integration)

### Related Packages (Same API)

| Package | Renderer | Use Case |
|---------|----------|----------|
| `react-force-graph-3d` | WebGL/ThreeJS | Our choice - immersive 3D |
| `react-force-graph-2d` | HTML5 Canvas | Simpler 2D view |
| `react-force-graph-vr` | A-Frame | VR headsets |
| `react-force-graph-ar` | AR.js | Augmented reality |

## Data Format

```typescript
interface GraphData {
  nodes: GraphNode[];
  links: GraphLink[];
}

interface GraphNode {
  id: string;
  name: string;
  type: 'person' | 'group';
  metadata: PersonMetadata | GroupMetadata;
  // Force simulation adds these:
  x?: number;
  y?: number;
  z?: number;
  // Fixed positions (null = force-controlled):
  fx?: number | null;
  fy?: number | null;
  fz?: number | null;
}

interface GraphLink {
  source: string;  // node id
  target: string;  // node id
  type: Predicate; // e.g., 'student_of', 'founded'
  metadata: LinkMetadata;
}
```

## Layout Strategies

### Strategy 1: DAG Mode (Automatic Hierarchy)

The library has built-in Directed Acyclic Graph support that automatically computes levels from link structure.

```tsx
<ForceGraph3D
  graphData={graphData}
  dagMode="td"              // top-down layout
  dagLevelDistance={150}    // vertical spacing between levels
  dagNodeFilter={node => node.type === 'person'}  // optional filtering
  onDagError={(loopNodes) => console.warn('Cycle:', loopNodes)}
/>
```

#### Available DAG Modes

| Mode | Direction | Description | Best For |
|------|-----------|-------------|----------|
| `'td'` | Top → Down | Ancestors above, descendants below | Classic family tree |
| `'bu'` | Bottom → Up | Descendants above, ancestors below | Inverted tree |
| `'lr'` | Left → Right | Horizontal layout | Wide trees |
| `'rl'` | Right → Left | Horizontal (RTL) | RTL layouts |
| `'zout'` | Near → Far | Z-axis depth | 3D depth effect |
| `'zin'` | Far → Near | Z-axis (reverse) | Inverse depth |
| `'radialout'` | Center → Out | Radial starburst | From founding mestres |
| `'radialin'` | Out → Center | Radial inward | Converging to root |

#### Limitations

- **Requires acyclic graph**: Cycles trigger `onDagError` callback
- **Single root assumption**: Works best with clear hierarchy
- **Level computation**: Based purely on link structure, ignores temporal data

### Strategy 2: Fixed Y-Position (Temporal Layout)

Manually fix node positions based on temporal data (`birthYear`, `foundedYear`).

```tsx
const YEAR_BASELINE = 1880;  // Approximate start of modern capoeira
const YEAR_SCALE = 5;        // Units per year
const UNKNOWN_YEAR_OFFSET = 50; // Push unknowns to recent generation

function computeYPosition(node: GraphNode): number {
  if (node.type === 'person') {
    const metadata = node.metadata as PersonMetadata;
    if (metadata.birthYear) {
      return (metadata.birthYear - YEAR_BASELINE) * YEAR_SCALE;
    }
  }
  if (node.type === 'group') {
    const metadata = node.metadata as GroupMetadata;
    if (metadata.foundedYear) {
      return (metadata.foundedYear - YEAR_BASELINE) * YEAR_SCALE;
    }
  }
  // Unknown dates: position in recent generation
  return (new Date().getFullYear() - YEAR_BASELINE - UNKNOWN_YEAR_OFFSET) * YEAR_SCALE;
}

// Pre-process nodes
const processedData = {
  nodes: graphData.nodes.map(node => ({
    ...node,
    fy: computeYPosition(node),  // Fixed Y
    fx: null,  // X controlled by forces
    fz: null,  // Z controlled by forces
  })),
  links: graphData.links,
};
```

#### Handling Unknown Dates

Options for nodes without temporal information:

| Strategy | Implementation | Pros | Cons |
|----------|---------------|------|------|
| **Recent generation** | `fy = currentYear - offset` | Safe assumption for living people | May misplace historical figures |
| **Infer from links** | Compute from connected nodes | More accurate placement | Requires graph traversal |
| **Floating** | `fy = null` (force-controlled) | Natural clustering | May break temporal order |
| **Separate cluster** | Fixed position aside | Clear visibility | Visual separation |

**Recommendation**: For unknown dates, position in recent generation (post-2000) with a visual indicator (different opacity or color tint).

### Strategy 3: Custom d3 Forces

Access the underlying d3-force-3d simulation for fine-grained control.

```tsx
const graphRef = useRef<ForceGraphMethods>();

useEffect(() => {
  if (!graphRef.current) return;

  // Y-axis force: push toward generation level
  const generationForce = forceY<InternalNode>()
    .y(node => computeYPosition(node))
    .strength(0.3);  // 0.1=gentle, 0.5=strong

  graphRef.current.d3Force('generation', generationForce);

  // Adjust link distances by relationship type
  graphRef.current.d3Force('link')
    ?.distance(link => {
      switch (link.type) {
        case 'student_of': return 80;   // Close mentor-student
        case 'founded': return 120;     // Founder near group
        case 'member_of': return 150;   // Members spread out
        default: return 100;
      }
    })
    .strength(0.7);

  // Reduce charge repulsion for tighter clustering
  graphRef.current.d3Force('charge')?.strength(-150);

  // Reheat simulation
  graphRef.current.d3ReheatSimulation();
}, [graphData]);
```

#### Available d3 Forces

| Force | Purpose | Key Parameters |
|-------|---------|----------------|
| `forceLink` | Connect linked nodes | `distance()`, `strength()`, `iterations()` |
| `forceManyBody` | Node repulsion/attraction | `strength()` (negative=repel) |
| `forceCenter` | Center gravity | `x()`, `y()`, `z()` |
| `forceX/Y/Z` | Position toward axis | `x/y/z()`, `strength()` |
| `forceCollide` | Prevent overlap | `radius()`, `strength()` |
| `forceRadial` | Radial positioning | `radius()`, `x()`, `y()`, `z()` |

### Strategy 4: Hybrid Approach (Recommended)

Combine fixed Y-positioning with custom forces for optimal genealogy display.

```tsx
// 1. Pre-process nodes with fixed Y
const processedNodes = graphData.nodes.map(node => ({
  ...node,
  fy: computeYPosition(node),
}));

// 2. Apply custom forces for X/Z spreading
useEffect(() => {
  if (!graphRef.current) return;

  // Spread nodes on X-axis by group affiliation
  const groupForce = forceX<InternalNode>()
    .x(node => {
      // Cluster by primary group or style
      const style = node.metadata?.style;
      if (style === 'angola') return -200;
      if (style === 'regional') return 200;
      return 0;  // Mixed/unknown in center
    })
    .strength(0.1);

  graphRef.current.d3Force('grouping', groupForce);
}, []);

// 3. Use ForceGraph3D without dagMode
<ForceGraph3D
  ref={graphRef}
  graphData={{ nodes: processedNodes, links: graphData.links }}
  // ... other props
/>
```

## Component Configuration

### Essential Props

| Category | Prop | Type | Description |
|----------|------|------|-------------|
| **Data** | `graphData` | `{nodes, links}` | Graph structure |
| | `nodeId` | `string \| fn` | Node ID accessor (default: `'id'`) |
| **Layout** | `dagMode` | `string` | DAG layout mode (see above) |
| | `dagLevelDistance` | `number` | Vertical spacing between levels |
| | `dagNodeFilter` | `fn` | Exclude nodes from DAG layout |
| **Physics** | `d3AlphaDecay` | `number` | Simulation cooling rate (default: 0.0228) |
| | `d3VelocityDecay` | `number` | Friction/damping (default: 0.4) |
| | `warmupTicks` | `number` | Pre-simulation steps (0-300) |
| | `cooldownTime` | `number` | Simulation duration in ms |

### Node Styling Props

| Prop | Type | Description |
|------|------|-------------|
| `nodeVal` | `number \| fn` | Node size |
| `nodeColor` | `string \| fn` | Node color |
| `nodeLabel` | `string \| fn` | Hover tooltip text |
| `nodeOpacity` | `number` | Transparency (0-1) |
| `nodeThreeObject` | `fn` | Custom THREE.js object |
| `nodeThreeObjectExtend` | `boolean` | Extend vs replace default |

### Link Styling Props

| Prop | Type | Description |
|------|------|-------------|
| `linkColor` | `string \| fn` | Line color |
| `linkWidth` | `number \| fn` | Line thickness |
| `linkOpacity` | `number` | Transparency (0-1) |
| `linkCurvature` | `number` | Curve radius (0=straight) |
| `linkDirectionalArrowLength` | `number` | Arrow size |
| `linkDirectionalParticles` | `number` | Animated flow particles |
| `linkDirectionalParticleWidth` | `number` | Particle size |
| `linkDirectionalParticleSpeed` | `number` | Particle speed |

### Interaction Props

| Prop | Type | Description |
|------|------|-------------|
| `onNodeClick` | `fn` | Node click handler |
| `onNodeHover` | `fn` | Node hover handler |
| `onLinkClick` | `fn` | Link click handler |
| `onBackgroundClick` | `fn` | Background click handler |
| `enableNodeDrag` | `boolean` | Allow node dragging |
| `onNodeDragEnd` | `fn` | Drag completion callback |

### Camera Props

| Prop | Type | Description |
|------|------|-------------|
| `controlType` | `string` | `'trackball'`, `'orbit'`, `'fly'` |
| `enableNavigationControls` | `boolean` | Enable camera controls |
| `showNavInfo` | `boolean` | Show control hints |

## Methods (via ref)

```tsx
const graphRef = useRef<ForceGraphMethods>();

// Camera positioning
graphRef.current?.cameraPosition(
  { x: 0, y: -500, z: 800 },  // Camera position
  { x: 0, y: 0, z: 0 },       // Look-at target
  2000                         // Transition duration (ms)
);

// Zoom to fit entire graph
graphRef.current?.zoomToFit(1000, 100);  // duration, padding

// Animation control
graphRef.current?.pauseAnimation();
graphRef.current?.resumeAnimation();

// Force simulation
graphRef.current?.d3Force('forceName', forceInstance);
graphRef.current?.d3ReheatSimulation();

// Scene access (for advanced THREE.js)
const scene = graphRef.current?.scene();
const camera = graphRef.current?.camera();
const renderer = graphRef.current?.renderer();

// Coordinate conversion
const screenCoords = graphRef.current?.graph2ScreenCoords(x, y, z);
const graphCoords = graphRef.current?.screen2GraphCoords(screenX, screenY);

// Graph bounding box
const bbox = graphRef.current?.getGraphBbox();
```

## Performance Optimization

### For Large Graphs (100+ nodes)

```tsx
<ForceGraph3D
  // Faster simulation cooling
  d3AlphaDecay={0.05}
  d3VelocityDecay={0.3}

  // Pre-calculate layout
  warmupTicks={100}
  cooldownTime={2000}

  // Reduce visual complexity
  linkDirectionalParticles={0}  // Disable particles
  nodeOpacity={0.8}

  // Simplify geometry
  nodeThreeObject={node => {
    // Use fewer segments for spheres
    const geometry = new THREE.SphereGeometry(5, 8, 8);  // 8 segments vs 16
    return new THREE.Mesh(geometry, material);
  }}
/>
```

### Reducing Charge Strength

```tsx
// Default charge can cause excessive spreading
graphRef.current?.d3Force('charge')?.strength(-100);  // vs default -300
```

## Visual Design Considerations

### Color Coding

Current implementation in `types.ts`:

**Person Nodes (by title):**
- Mestre: Gold (#FFD700)
- Contra-mestre: Silver (#C0C0C0)
- Professor: Blue (#4DABF7)
- Instrutor: Green (#51CF66)
- Graduado: Gray (#868E96)
- Aluno: Light gray (#ADB5BD)

**Group Nodes (by style):**
- Angola: Red (#FA5252)
- Regional: Blue (#4C6EF5)
- Contemporânea: Purple (#9775FA)
- Mixed: Orange (#FD7E14)

### Size Differentiation

```tsx
nodeVal={node => {
  if (node.type === 'group') return 15;  // Groups larger
  const title = node.metadata?.title;
  if (title === 'mestre') return 12;
  if (title === 'contra-mestre') return 10;
  return 8;  // Default
}}
```

### Link Styling by Relationship

```tsx
linkWidth={link => {
  if (link.type === 'student_of') return 2;
  if (link.type === 'founded') return 3;
  return 1;
}}

linkDirectionalArrowLength={link => {
  // Show direction for hierarchical relationships
  if (['student_of', 'founded', 'leads'].includes(link.type)) return 6;
  return 0;
}}
```

## Initial Camera Position

For genealogy tree (top-down temporal layout), position camera to show the roots:

```tsx
useEffect(() => {
  // Wait for initial layout to stabilize
  const timer = setTimeout(() => {
    if (!graphRef.current) return;

    // Position camera above and behind the oldest generation
    graphRef.current.cameraPosition(
      { x: 0, y: -200, z: 600 },  // Camera position (elevated, pulled back)
      { x: 0, y: 100, z: 0 },     // Look at early generation area
      0                           // Instant (no animation on load)
    );
  }, 500);  // Allow simulation warm-up

  return () => clearTimeout(timer);
}, []);
```

## Handling Cycles

If data contains cycles (e.g., mutual influences), handle gracefully:

```tsx
// Option 1: Use DAG mode with error handler
<ForceGraph3D
  dagMode="td"
  onDagError={(loopNodes) => {
    console.warn('Cycle detected in nodes:', loopNodes.map(n => n.id));
    // Graph continues with best-effort layout
  }}
/>

// Option 2: Pre-process to break cycles
function breakCycles(links: GraphLink[]): GraphLink[] {
  // Implement cycle detection (DFS) and remove back-edges
  // Or mark certain link types as non-hierarchical
  return links.filter(link =>
    // Only use student_of for hierarchy (most likely acyclic)
    link.type !== 'influenced_by'
  );
}
```

## Implementation Checklist

- [ ] Add temporal positioning based on birthYear/foundedYear
- [ ] Handle nodes without dates (position in recent generation)
- [ ] Configure initial camera position for root visibility
- [ ] Add custom d3 forces for group clustering
- [ ] Position groups near their founders
- [ ] Add visual indicator for nodes with unknown dates
- [ ] Optimize for larger datasets (warmup, reduced particles)
- [ ] Test cycle handling with diverse data

## References

- [react-force-graph Documentation](https://vasturiano.github.io/react-force-graph/)
- [3D Force-Directed Graph](https://vasturiano.github.io/3d-force-graph/)
- [GitHub Repository](https://github.com/vasturiano/react-force-graph)
- [d3-force-3d](https://github.com/vasturiano/d3-force-3d)
- [D3 Force Simulation](https://d3js.org/d3-force/simulation)

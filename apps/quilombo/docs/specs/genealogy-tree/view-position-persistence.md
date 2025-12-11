# View Position Persistence

## Overview

Save and restore node positions per graph view, so users can switch between views without losing their exploration state.

## Current Behavior

When switching views (General ↔ Student Ancestry), node positions are recalculated from scratch based on the view's layout algorithm. This is because `graphData` changes trigger the force simulation to recompute.

## Proposed Behavior

Each view maintains its own position state. When switching:
- Outgoing view's positions are saved
- Incoming view's positions are restored (if previously visited)
- First visit to a view runs fresh simulation

## Implementation Plan

### 1. Position State Structure

```typescript
type PositionMap = Map<string, { x: number; y: number; z: number }>;

// In page.tsx or a dedicated hook
const [viewPositions, setViewPositions] = useState<Record<GraphViewMode, PositionMap>>({
  'general': new Map(),
  'student-ancestry': new Map(),
});
```

### 2. Capture Positions on View Switch

In `handleGraphViewChange`:

```typescript
const handleGraphViewChange = useCallback((newView: GraphViewMode) => {
  // Save current positions before switching
  if (graphRef.current) {
    const currentPositions = new Map<string, Position>();
    for (const node of graphRef.current.graphData().nodes) {
      if (node.x !== undefined) {
        currentPositions.set(node.id, { x: node.x, y: node.y, z: node.z });
      }
    }
    setViewPositions(prev => ({
      ...prev,
      [graphView]: currentPositions
    }));
  }

  setGraphView(newView);
  setSelectedNode(null);
}, [graphView]);
```

### 3. Apply Saved Positions

In `GenealogyGraph.tsx`, when processing data:

```typescript
function applyFixedPositions(
  nodes: TemporalForceNode[],
  savedPositions: PositionMap | undefined
): TemporalForceNode[] {
  if (!savedPositions || savedPositions.size === 0) {
    return nodes; // Fresh simulation
  }

  return nodes.map(node => {
    const saved = savedPositions.get(node.id);
    if (saved) {
      return {
        ...node,
        x: saved.x, y: saved.y, z: saved.z,
        fx: saved.x, fy: saved.y, fz: saved.z, // Fix position
      };
    }
    return node;
  });
}
```

### 4. Release Fixed Positions After Restore

After positions are restored, release the `fx/fy/fz` constraints so users can still drag nodes:

```typescript
useEffect(() => {
  if (!graphRef.current || !hasRestoredPositions) return;

  // After a short delay, release fixed positions
  const timer = setTimeout(() => {
    const nodes = graphRef.current.graphData().nodes;
    for (const node of nodes) {
      delete node.fx;
      delete node.fy;
      delete node.fz;
    }
    graphRef.current.d3ReheatSimulation();
  }, 100);

  return () => clearTimeout(timer);
}, [hasRestoredPositions]);
```

### 5. Props Changes

Add to `GenealogyGraph`:

```typescript
interface GenealogyGraphProps {
  // ... existing props
  savedPositions?: PositionMap;
  onPositionsCapture?: (positions: PositionMap) => void;
}
```

## Alternative: Capture on Every Tick

More robust but higher overhead:

```typescript
<ForceGraph3D
  onEngineTick={() => {
    // Debounce this heavily
    capturePositions();
  }}
/>
```

Only consider if users report lost positions due to unexpected unmounts.

## Memory Considerations

- ~24 bytes per node (3 floats × 8 bytes)
- 1000 nodes × 2 views = ~48KB
- Negligible for modern browsers

## UX Considerations

1. **Visual feedback**: Consider a brief "restoring view" indicator
2. **New nodes**: Nodes added since last visit won't have saved positions - they'll simulate normally
3. **Deleted nodes**: Saved positions for removed nodes are harmless (just ignored)

## Related Files

- `app/genealogy/page.tsx` - State management
- `components/genealogy/graphs/GenealogyGraph.tsx` - Position application
- `components/genealogy/core/ForceGraph3DWrapper.tsx` - Graph ref access

## References

- [react-force-graph Issue #188](https://github.com/vasturiano/react-force-graph/issues/188) - Maintaining node coordinates
- [react-force-graph Issue #95](https://github.com/vasturiano/react-force-graph/issues/95) - Fixed node positions

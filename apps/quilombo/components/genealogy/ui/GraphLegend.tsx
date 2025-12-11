'use client';

import { Card, CardBody } from '@heroui/react';
import { useAtomValue } from 'jotai';
import { useMemo } from 'react';

import type { EntityType } from '@/db/schema/genealogy';

import type { LegendCategory } from '@/components/genealogy/config';
import { graphFiltersAtom, viewConfigAtom } from '@/components/genealogy/state';

/** Maps legend category names to the node type they require */
const LEGEND_CATEGORY_REQUIRED_TYPE: Record<string, EntityType> = {
  'Person Titles': 'person',
  'Group Styles': 'group',
  // Lineage Links is person-only but doesn't require filtering (student-ancestry view is person-only)
};

function ColorDot({ color }: { color: string }) {
  return <span className="inline-block h-3 w-3 shrink-0 rounded-full" style={{ backgroundColor: color }} />;
}

function LegendSection({ category }: { category: LegendCategory }) {
  return (
    <div>
      <p className="mb-1 text-tiny font-medium text-default-500">{category.category}</p>
      <div className="grid grid-cols-2 gap-x-3 gap-y-1">
        {category.items.map((item) => (
          <div key={item.label} className="flex items-center gap-1.5">
            <ColorDot color={item.color} />
            <span className="text-tiny">{item.label}</span>
          </div>
        ))}
      </div>
    </div>
  );
}

export function GraphLegend() {
  // Jotai state
  const viewConfig = useAtomValue(viewConfigAtom);
  const filters = useAtomValue(graphFiltersAtom);

  const { nodeCategories, showNodeShapes, nodeShapes } = viewConfig.legend;

  // Filter legend categories based on selected node types
  const visibleCategories = useMemo(() => {
    return nodeCategories.filter((category) => {
      const requiredType = LEGEND_CATEGORY_REQUIRED_TYPE[category.category];
      // If no required type mapping, always show
      if (!requiredType) return true;
      // Only show if the required node type is in the current filter selection
      return filters.nodeTypes.includes(requiredType);
    });
  }, [nodeCategories, filters.nodeTypes]);

  // Filter node shapes based on selected node types
  const visibleNodeShapes = useMemo(() => {
    if (!showNodeShapes || !nodeShapes) return [];
    return nodeShapes.filter((shape) => {
      // Map shape label to entity type
      const typeMap: Record<string, EntityType> = {
        Person: 'person',
        Group: 'group',
      };
      const requiredType = typeMap[shape.label];
      if (!requiredType) return true;
      return filters.nodeTypes.includes(requiredType);
    });
  }, [showNodeShapes, nodeShapes, filters.nodeTypes]);

  // Don't render if no categories visible
  if (visibleCategories.length === 0 && visibleNodeShapes.length === 0) {
    return null;
  }

  return (
    <Card className="absolute bottom-4 left-4 z-10 max-w-xs">
      <CardBody className="gap-3 p-3">
        <h3 className="text-small font-semibold">Legend</h3>

        {visibleCategories.map((category) => (
          <LegendSection key={category.category} category={category} />
        ))}

        {showNodeShapes && visibleNodeShapes.length > 0 && (
          <div>
            <p className="mb-1 text-tiny font-medium text-default-500">Node Shapes</p>
            <div className="flex gap-3 text-tiny">
              {visibleNodeShapes.map((shape) => (
                <span key={shape.label}>
                  {shape.symbol} {shape.label}
                </span>
              ))}
            </div>
          </div>
        )}
      </CardBody>
    </Card>
  );
}

export default GraphLegend;

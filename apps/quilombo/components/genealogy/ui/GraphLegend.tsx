'use client';

import { Button, Card, CardBody } from '@heroui/react';
import { useAtomValue } from 'jotai';
import { ChevronDown, Info } from 'lucide-react';
import { useEffect, useMemo, useState } from 'react';

import type { EntityType, Predicate } from '@/db/schema/genealogy';
import { useResponsiveLayout } from '@/hooks/useResponsiveLayout';

import type { LegendCategory } from '@/components/genealogy/config';
import { graphFiltersAtom, viewConfigAtom } from '@/components/genealogy/state';
import { LINK_COLORS, PREDICATE_LABELS } from '@/components/genealogy/types';

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
  // Responsive layout - collapsed by default on mobile
  const { isMobile } = useResponsiveLayout();
  const [isExpanded, setIsExpanded] = useState(!isMobile);

  // Sync expanded state when screen size changes
  useEffect(() => {
    setIsExpanded(!isMobile);
  }, [isMobile]);

  // Jotai state
  const viewConfig = useAtomValue(viewConfigAtom);
  const filters = useAtomValue(graphFiltersAtom);

  const { nodeCategories, showNodeShapes, nodeShapes, showDynamicRelationships } = viewConfig.legend;

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

  // Generate dynamic relationship legend items based on selected predicates
  const dynamicRelationshipsCategory = useMemo((): LegendCategory | null => {
    if (!showDynamicRelationships || filters.predicates.length === 0) return null;

    const items = filters.predicates.map((predicate: Predicate) => ({
      label: PREDICATE_LABELS[predicate],
      color: LINK_COLORS[predicate] ?? LINK_COLORS.default,
    }));

    return {
      category: 'Relationships',
      items,
    };
  }, [showDynamicRelationships, filters.predicates]);

  // Don't render if nothing to show
  const hasContent =
    visibleCategories.length > 0 || visibleNodeShapes.length > 0 || dynamicRelationshipsCategory !== null;
  if (!hasContent) {
    return null;
  }

  // Collapsed state - just show a small button
  if (!isExpanded) {
    return (
      <Button
        isIconOnly
        size="sm"
        variant="flat"
        className="absolute bottom-4 left-4 z-10"
        onPress={() => setIsExpanded(true)}
        aria-label="Show legend"
      >
        <Info className="h-4 w-4" />
      </Button>
    );
  }

  return (
    <Card className="absolute bottom-4 left-4 z-10 max-w-xs">
      <CardBody className="gap-3 p-3">
        <div className="flex items-center justify-between">
          <h3 className="text-small font-semibold">Legend</h3>
          <Button
            isIconOnly
            size="sm"
            variant="light"
            onPress={() => setIsExpanded(false)}
            aria-label="Collapse legend"
            className="-mr-1"
          >
            <ChevronDown className="h-4 w-4" />
          </Button>
        </div>

        {visibleCategories.map((category) => (
          <LegendSection key={category.category} category={category} />
        ))}

        {dynamicRelationshipsCategory && <LegendSection category={dynamicRelationshipsCategory} />}

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

'use client';

import { Button, Card, CardBody, Checkbox, CheckboxGroup, Divider } from '@heroui/react';
import { useAtom, useAtomValue } from 'jotai';

import type { EntityType, Predicate } from '@/db/schema/genealogy';

import { getFilteredPredicateGroups } from '@/components/genealogy/config';
import { graphFiltersAtom, viewConfigAtom } from '@/components/genealogy/state';
import type { GraphStats } from '@/components/genealogy/types';
import { PREDICATE_LABELS } from '@/components/genealogy/types';

interface GraphControlsProps {
  /** Graph statistics */
  stats: GraphStats | undefined;
  /** Loading state */
  isLoading: boolean;
}

/** Labels for node type checkboxes */
const NODE_TYPE_LABELS: Record<EntityType, string> = {
  person: 'People',
  group: 'Groups',
};

/** Map predicate group names to required node types */
const PREDICATE_GROUP_REQUIRED_TYPES: Record<string, EntityType[]> = {
  'Person → Person': ['person'],
  'Person → Group': ['person', 'group'],
  'Group → Group': ['group'],
};

export function GraphControls({ stats, isLoading }: GraphControlsProps) {
  // Jotai state
  const viewConfig = useAtomValue(viewConfigAtom);
  const [filters, setFilters] = useAtom(graphFiltersAtom);

  // Get predicate groups filtered to this view's allowed predicates
  const viewPredicateGroups = getFilteredPredicateGroups(viewConfig);

  // Further filter predicate groups based on currently selected node types
  const predicateGroups = Object.fromEntries(
    Object.entries(viewPredicateGroups).filter(([groupName]) => {
      const requiredTypes = PREDICATE_GROUP_REQUIRED_TYPES[groupName];
      if (!requiredTypes) return true; // Show unknown groups
      // All required types must be in the current filter selection
      return requiredTypes.every((type) => filters.nodeTypes.includes(type));
    })
  );

  // Get all predicates from currently visible groups
  const visiblePredicates = Object.values(predicateGroups).flat();

  const handleNodeTypesChange = (values: string[]) => {
    // Only allow node types that are valid for this view
    const validTypes = values.filter((v) => viewConfig.allowedNodeTypes.includes(v as EntityType)) as EntityType[];

    setFilters({
      ...filters,
      nodeTypes: validTypes,
    });
  };

  const handlePredicatesChange = (values: string[]) => {
    // Only allow predicates that are valid for this view
    const validPredicates = values.filter((v) => viewConfig.allowedPredicates.includes(v as Predicate)) as Predicate[];

    setFilters({
      ...filters,
      predicates: validPredicates,
    });
  };

  const handleReset = () => {
    setFilters({
      nodeTypes: [...viewConfig.allowedNodeTypes],
      predicates: [...viewConfig.allowedPredicates],
    });
  };

  const handleSelectAllPredicates = () => {
    setFilters({
      ...filters,
      predicates: visiblePredicates,
    });
  };

  const handleClearPredicates = () => {
    setFilters({
      ...filters,
      predicates: [],
    });
  };

  // Check if there are multiple node types available (if not, hide the section)
  const hasMultipleNodeTypes = viewConfig.allowedNodeTypes.length > 1;

  // Check if there are predicates available (based on filtered groups, not view config)
  const hasPredicates = visiblePredicates.length > 0;

  return (
    <Card className="h-full overflow-auto">
      <CardBody className="gap-4">
        {/* Stats */}
        {stats && (
          <div className="space-y-1">
            <h3 className="text-small font-semibold">Statistics</h3>
            <div className="grid grid-cols-2 gap-1 text-tiny text-default-500">
              <span>Nodes: {stats.totalNodes}</span>
              <span>Links: {stats.totalLinks}</span>
              {viewConfig.allowedNodeTypes.includes('person') && <span>People: {stats.personCount}</span>}
              {viewConfig.allowedNodeTypes.includes('group') && <span>Groups: {stats.groupCount}</span>}
            </div>
          </div>
        )}

        {hasMultipleNodeTypes && (
          <>
            <Divider />

            {/* Node Types */}
            <div className="space-y-2">
              <h3 className="text-small font-semibold">Node Types</h3>
              <CheckboxGroup
                value={filters.nodeTypes}
                onValueChange={handleNodeTypesChange}
                size="sm"
                isDisabled={isLoading}
              >
                {viewConfig.allowedNodeTypes.map((nodeType) => (
                  <Checkbox key={nodeType} value={nodeType}>
                    {NODE_TYPE_LABELS[nodeType]}
                  </Checkbox>
                ))}
              </CheckboxGroup>
            </div>
          </>
        )}

        {hasPredicates && (
          <>
            <Divider />

            {/* Relationship Types */}
            <div className="space-y-2">
              <div className="flex items-center justify-between">
                <h3 className="text-small font-semibold">Relationships</h3>
                <div className="flex gap-1">
                  <Button size="sm" variant="light" onPress={handleSelectAllPredicates} isDisabled={isLoading}>
                    All
                  </Button>
                  <Button size="sm" variant="light" onPress={handleClearPredicates} isDisabled={isLoading}>
                    None
                  </Button>
                </div>
              </div>
              <p className="text-tiny text-default-400">{filters.predicates.length} selected</p>

              <CheckboxGroup
                value={filters.predicates}
                onValueChange={handlePredicatesChange}
                size="sm"
                isDisabled={isLoading}
                className="max-h-80 overflow-y-auto"
              >
                {Object.entries(predicateGroups).map(([groupName, groupPredicates]) => (
                  <div key={groupName} className="mb-3">
                    <p className="mb-1 text-tiny font-medium text-default-500">{groupName}</p>
                    {groupPredicates.map((predicate) => (
                      <Checkbox key={predicate} value={predicate} className="block py-0.5">
                        {PREDICATE_LABELS[predicate]}
                      </Checkbox>
                    ))}
                  </div>
                ))}
              </CheckboxGroup>
            </div>
          </>
        )}

        <Divider />

        {/* Reset Button */}
        <Button variant="bordered" size="sm" onPress={handleReset} isDisabled={isLoading} className="w-full">
          Reset Filters
        </Button>
      </CardBody>
    </Card>
  );
}

export default GraphControls;

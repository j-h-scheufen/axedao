'use client';

import { Button, Card, CardBody, Checkbox, CheckboxGroup, Divider } from '@heroui/react';

import { entityTypes, predicates } from '@/config/constants';
import type { EntityType, Predicate } from '@/db/schema/genealogy';

import type { GraphFilters, GraphStats } from '@/components/genealogy/types';
import { PREDICATE_LABELS } from '@/components/genealogy/types';

interface GraphControlsProps {
  filters: GraphFilters;
  onFiltersChange: (filters: GraphFilters) => void;
  stats: GraphStats | undefined;
  isLoading: boolean;
}

// Group predicates by category for better UX
const PREDICATE_GROUPS = {
  'Person → Person': ['student_of', 'trained_under', 'influenced_by', 'granted_title_to', 'baptized_by', 'family_of'],
  'Person → Group': [
    'founded',
    'co_founded',
    'leads',
    'regional_coordinator_of',
    'member_of',
    'teaches_at',
    'cultural_pioneer_of',
    'associated_with',
    'departed_from',
  ],
  'Group → Group': ['part_of', 'split_from_group', 'merged_into', 'evolved_from', 'affiliated_with', 'cooperates_with'],
} as const;

export function GraphControls({ filters, onFiltersChange, stats, isLoading }: GraphControlsProps) {
  const handleNodeTypesChange = (values: string[]) => {
    onFiltersChange({
      ...filters,
      nodeTypes: values as EntityType[],
    });
  };

  const handlePredicatesChange = (values: string[]) => {
    onFiltersChange({
      ...filters,
      predicates: values as Predicate[],
    });
  };

  const handleReset = () => {
    onFiltersChange({
      nodeTypes: [...entityTypes],
      predicates: [],
    });
  };

  const handleSelectAllPredicates = () => {
    onFiltersChange({
      ...filters,
      predicates: [...predicates],
    });
  };

  const handleClearPredicates = () => {
    onFiltersChange({
      ...filters,
      predicates: [],
    });
  };

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
              <span>People: {stats.personCount}</span>
              <span>Groups: {stats.groupCount}</span>
            </div>
          </div>
        )}

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
            <Checkbox value="person">People</Checkbox>
            <Checkbox value="group">Groups</Checkbox>
          </CheckboxGroup>
        </div>

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
          <p className="text-tiny text-default-400">
            {filters.predicates.length === 0 ? 'Showing all relationships' : `${filters.predicates.length} selected`}
          </p>

          <CheckboxGroup
            value={filters.predicates}
            onValueChange={handlePredicatesChange}
            size="sm"
            isDisabled={isLoading}
            className="max-h-80 overflow-y-auto"
          >
            {Object.entries(PREDICATE_GROUPS).map(([groupName, groupPredicates]) => (
              <div key={groupName} className="mb-3">
                <p className="mb-1 text-tiny font-medium text-default-500">{groupName}</p>
                {groupPredicates.map((predicate) => (
                  <Checkbox key={predicate} value={predicate} className="block py-0.5">
                    {PREDICATE_LABELS[predicate as Predicate]}
                  </Checkbox>
                ))}
              </div>
            ))}
          </CheckboxGroup>
        </div>

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

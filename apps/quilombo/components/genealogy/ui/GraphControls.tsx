'use client';

import { Accordion, AccordionItem, Button, Checkbox, CheckboxGroup, Divider, Switch, Tooltip } from '@heroui/react';
import { useAtom, useAtomValue, useSetAtom } from 'jotai';

import type { EntityType, Predicate } from '@/db/schema/genealogy';
import { currentUserProfileIdAtom } from '@/hooks/state/currentUser';

import { getFilteredPredicateGroups } from '@/components/genealogy/config';
import {
  graphFiltersAtom,
  graphSettingsAtom,
  graphViewModeAtom,
  recenterCallbackAtom,
  selectedNodeIdAtom,
  showYourselfAtom,
  viewConfigAtom,
} from '@/components/genealogy/state';
import type { GraphStats } from '@/components/genealogy/types';
import { PREDICATE_LABELS } from '@/components/genealogy/types';

interface GraphControlsProps {
  /** Graph statistics */
  stats: GraphStats | undefined;
  /** Loading state */
  isLoading: boolean;
  /** IDs of nodes currently in the filtered graph (for "Find Me" visibility) */
  nodeIds?: ReadonlySet<string>;
  /** Optional callback when an action that should close the drawer is triggered (e.g., Find Me) */
  onClose?: () => void;
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

export function GraphControls({ stats, isLoading, nodeIds, onClose }: GraphControlsProps) {
  // Jotai state
  const viewMode = useAtomValue(graphViewModeAtom);
  const viewConfig = useAtomValue(viewConfigAtom);
  const [filters, setFilters] = useAtom(graphFiltersAtom);
  const [settings, setSettings] = useAtom(graphSettingsAtom);
  const setSelectedNodeId = useSetAtom(selectedNodeIdAtom);

  // "Show Yourself" feature state
  const [showYourself, setShowYourself] = useAtom(showYourselfAtom);
  const userProfileId = useAtomValue(currentUserProfileIdAtom);
  const hasGenealogyProfile = !!userProfileId;
  const isStudentAncestryView = viewMode === 'student-ancestry';

  // "Find Me" feature - check if user's profile is in the current graph
  const isUserInGraph = hasGenealogyProfile && nodeIds?.has(userProfileId);

  // Re-Center callback from graph component
  const recenterCallback = useAtomValue(recenterCallbackAtom);

  const handleFindMe = () => {
    if (userProfileId) {
      setSelectedNodeId(userProfileId);
      onClose?.(); // Close drawer on mobile so user can see the selected node
    }
  };

  const handleRecenter = () => {
    recenterCallback?.();
    onClose?.(); // Close drawer on mobile so user can see the graph
  };

  // Handle "Highlight Your Lineage" toggle - ensure lineage predicates are enabled when activated
  const handleShowYourselfChange = (enabled: boolean) => {
    setShowYourself(enabled);

    // When enabling, ensure both lineage predicates are active to show the full ancestry tree
    if (enabled) {
      const lineagePredicates: Predicate[] = ['student_of', 'trained_under'];
      const currentPredicates = new Set(filters.predicates);
      const missingPredicates = lineagePredicates.filter((p) => !currentPredicates.has(p));

      if (missingPredicates.length > 0) {
        setFilters({
          ...filters,
          predicates: [...filters.predicates, ...missingPredicates],
        });
      }
    }
  };

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

  // Get accordion keys for predicate groups
  const predicateGroupKeys = Object.keys(predicateGroups);

  return (
    <div className="flex h-full flex-col">
      {/* Scrollable content area */}
      <div className="flex-1 overflow-y-auto p-3">
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
            <Divider className="my-3" />

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
            <Divider className="my-3" />

            {/* Relationship Types - Accordion */}
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
              >
                <Accordion
                  selectionMode="single"
                  defaultExpandedKeys={predicateGroupKeys.length > 0 ? [predicateGroupKeys[0]] : []}
                  isCompact
                  className="-mx-2"
                >
                  {Object.entries(predicateGroups).map(([groupName, groupPredicates]) => (
                    <AccordionItem
                      key={groupName}
                      aria-label={groupName}
                      title={<span className="text-tiny font-medium">{groupName}</span>}
                      classNames={{
                        content: 'pt-0 pb-2',
                        trigger: 'py-2',
                      }}
                    >
                      {groupPredicates.map((predicate) => (
                        <Checkbox key={predicate} value={predicate} className="block py-0.5">
                          {PREDICATE_LABELS[predicate]}
                        </Checkbox>
                      ))}
                    </AccordionItem>
                  ))}
                </Accordion>
              </CheckboxGroup>
            </div>
          </>
        )}

        <Divider className="my-3" />

        {/* Graph Settings */}
        <div className="space-y-2">
          <h3 className="text-small font-semibold">Settings</h3>
          <Switch
            size="sm"
            isSelected={settings.showAnimations}
            onValueChange={(value) => setSettings({ ...settings, showAnimations: value })}
            isDisabled={isLoading}
          >
            Show Animations
          </Switch>
          {isStudentAncestryView && (
            <Tooltip
              content="Link your account to a genealogy profile to see yourself on the graph"
              isDisabled={hasGenealogyProfile}
              placement="bottom"
            >
              <div className="w-fit">
                <Switch
                  size="sm"
                  isSelected={showYourself}
                  onValueChange={handleShowYourselfChange}
                  isDisabled={isLoading || !hasGenealogyProfile}
                >
                  Highlight Your Lineage
                </Switch>
              </div>
            </Tooltip>
          )}
        </div>
      </div>

      {/* Fixed buttons area - never scrolls */}
      <div className="shrink-0 space-y-2 border-t border-default-200 p-3">
        <Button
          variant="flat"
          size="sm"
          onPress={handleRecenter}
          isDisabled={isLoading || !recenterCallback}
          className="w-full"
        >
          Re-Center
        </Button>

        {/* Find Me Button - shown when user's profile is in the current graph */}
        {isUserInGraph && (
          <Button
            variant="flat"
            color="primary"
            size="sm"
            onPress={handleFindMe}
            isDisabled={isLoading}
            className="w-full"
          >
            Find Me
          </Button>
        )}

        <Button variant="bordered" size="sm" onPress={handleReset} isDisabled={isLoading} className="w-full">
          Reset Filters
        </Button>
      </div>
    </div>
  );
}

export default GraphControls;

'use client';

import { Button, Dropdown, DropdownItem, DropdownMenu, DropdownTrigger, Select, SelectItem } from '@heroui/react';
import { Layers } from 'lucide-react';

import { type GraphViewMode, GRAPH_VIEW_OPTIONS } from '@/components/genealogy/config';

interface ViewModeMenuProps {
  /** Current view mode */
  value: GraphViewMode;
  /** Callback when view mode changes */
  onChange: (value: GraphViewMode) => void;
  /** Whether to render as compact icon button (for mobile) */
  isCompact?: boolean;
  /** Disabled state */
  isDisabled?: boolean;
}

/**
 * View mode selector for the genealogy graph.
 * - Desktop: Full select dropdown
 * - Mobile (isCompact): Icon button with dropdown menu
 */
export function ViewModeMenu({ value, onChange, isCompact = false, isDisabled = false }: ViewModeMenuProps) {
  // Compact mode: icon button with dropdown menu
  if (isCompact) {
    return (
      <Dropdown placement="bottom-end">
        <DropdownTrigger>
          <Button
            isIconOnly
            variant="bordered"
            size="sm"
            isDisabled={isDisabled}
            aria-label="Select view mode"
            className="shrink-0"
          >
            <Layers className="h-4 w-4" />
          </Button>
        </DropdownTrigger>
        <DropdownMenu
          aria-label="View mode selection"
          selectionMode="single"
          selectedKeys={new Set([value])}
          onSelectionChange={(keys) => {
            const selected = Array.from(keys)[0] as GraphViewMode;
            if (selected) onChange(selected);
          }}
        >
          {GRAPH_VIEW_OPTIONS.map((view) => (
            <DropdownItem key={view.key}>{view.label}</DropdownItem>
          ))}
        </DropdownMenu>
      </Dropdown>
    );
  }

  // Desktop mode: full select
  return (
    <Select
      label="View"
      selectedKeys={[value]}
      onChange={(e) => onChange(e.target.value as GraphViewMode)}
      size="sm"
      variant="bordered"
      isDisabled={isDisabled}
      className="w-72"
    >
      {GRAPH_VIEW_OPTIONS.map((view) => (
        <SelectItem key={view.key}>{view.label}</SelectItem>
      ))}
    </Select>
  );
}

export default ViewModeMenu;

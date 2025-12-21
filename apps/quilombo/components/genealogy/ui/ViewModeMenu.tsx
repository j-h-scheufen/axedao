'use client';

import { Button, Popover, PopoverContent, PopoverTrigger, Select, SelectItem } from '@heroui/react';
import { Layers } from 'lucide-react';
import { useState } from 'react';

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
 * - Mobile (isCompact): Icon button with popover menu
 */
export function ViewModeMenu({ value, onChange, isCompact = false, isDisabled = false }: ViewModeMenuProps) {
  const [isOpen, setIsOpen] = useState(false);

  const handleSelect = (newValue: GraphViewMode) => {
    onChange(newValue);
    setIsOpen(false);
  };

  // Compact mode: icon button with popover
  if (isCompact) {
    return (
      <Popover isOpen={isOpen} onOpenChange={setIsOpen} placement="bottom-end">
        <PopoverTrigger>
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
        </PopoverTrigger>
        <PopoverContent className="w-56 p-1">
          <div className="flex flex-col gap-0.5">
            {GRAPH_VIEW_OPTIONS.map((view) => (
              <Button
                key={view.key}
                variant={value === view.key ? 'flat' : 'light'}
                color={value === view.key ? 'primary' : 'default'}
                size="sm"
                className="justify-start"
                onPress={() => handleSelect(view.key)}
              >
                {view.label}
              </Button>
            ))}
          </div>
        </PopoverContent>
      </Popover>
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

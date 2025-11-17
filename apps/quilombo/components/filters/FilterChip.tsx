'use client';

import { Chip, Tooltip } from '@heroui/react';
import type { ReactNode } from 'react';

type FilterChipProps<T = string> = {
  label: string;
  items: T[];
  onClear: () => void;
  onChipClick?: () => void;
  maxVisible?: number;
  formatItem?: (item: T) => ReactNode;
  tooltipContent?: ReactNode;
};

/**
 * Generic filter chip component for displaying active filters.
 * Shows up to maxVisible items, then "+ N" for remaining items.
 * Includes tooltip on desktop showing all items.
 */
const FilterChip = <T,>({
  label,
  items,
  onClear,
  onChipClick,
  maxVisible = 3,
  formatItem = (item) => String(item),
  tooltipContent,
}: FilterChipProps<T>) => {
  if (items.length === 0) return null;

  const visibleItems = items.slice(0, maxVisible);
  const remaining = items.length - maxVisible;

  // Default tooltip content showing all items
  const defaultTooltipContent = (
    <div className="flex flex-wrap gap-1.5 max-w-xs p-1">
      {items.map((item) => (
        <span key={String(item)} className="text-xs">
          {formatItem(item)}
        </span>
      ))}
    </div>
  );

  const chipContent = (
    <Chip
      onClose={onClear}
      variant="flat"
      color="primary"
      size="sm"
      className="cursor-pointer pr-1.5"
      onClick={onChipClick}
    >
      <span className="flex items-center gap-1.5 whitespace-nowrap">
        <span className="font-medium text-xs">{label}:</span>
        {visibleItems.map((item, index) => (
          <span key={String(item)} className="text-xs">
            {formatItem(item)}
            {index < visibleItems.length - 1 && ', '}
          </span>
        ))}
        {remaining > 0 && <span className="text-xs font-semibold ml-0.5">+{remaining}</span>}
      </span>
    </Chip>
  );

  // Desktop: Show tooltip on hover
  return (
    <>
      <div className="hidden sm:block">
        <Tooltip content={tooltipContent || defaultTooltipContent} placement="bottom" delay={300}>
          {chipContent}
        </Tooltip>
      </div>
      {/* Mobile: no tooltip, just chip */}
      <div className="sm:hidden">{chipContent}</div>
    </>
  );
};

export default FilterChip;

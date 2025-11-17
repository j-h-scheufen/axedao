'use client';

import { useState, useEffect } from 'react';
import { Button, Checkbox, CheckboxGroup, cn } from '@heroui/react';
import { Filter } from 'lucide-react';
import { isEqual } from 'lodash';

import { styles } from '@/config/constants';
import type { GroupFilters as GroupFilterValues } from '@/config/validation-schema';
import FilterPanel from '@/components/FilterPanel';

export type { GroupFilterValues };

type GroupFiltersProps = {
  filters: Partial<GroupFilterValues>;
  onFiltersChange: (filters: Partial<GroupFilterValues>) => void;
  isActive: boolean; // Whether any filters are selected
};

const GroupFilters = ({ filters, onFiltersChange, isActive }: GroupFiltersProps) => {
  const [localFilters, setLocalFilters] = useState<Partial<GroupFilterValues>>(filters);

  // Sync local filters with prop changes
  useEffect(() => {
    setLocalFilters(filters);
  }, [filters]);

  const hasChanges = !isEqual(localFilters, filters);

  const handleApply = () => {
    onFiltersChange(localFilters);
  };

  const handleClear = () => {
    const clearedFilters = { styles: [], verified: undefined };
    setLocalFilters(clearedFilters);
    onFiltersChange(clearedFilters);
  };

  const handleStylesChange = (selectedStyles: string[]) => {
    setLocalFilters((prev) => ({
      ...prev,
      styles: selectedStyles as Array<'angola' | 'regional' | 'contemporânea'>,
    }));
  };

  const handleVerifiedChange = (checked: boolean) => {
    setLocalFilters((prev) => ({
      ...prev,
      verified: checked ? true : undefined,
    }));
  };

  // Trigger button render function
  const trigger = ({ onPress }: { onPress?: () => void }) => (
    <Button
      isIconOnly
      variant="bordered"
      size="sm"
      className={cn('flex-1 sm:flex-none', isActive && 'border-primary')}
      aria-label="Filter groups"
      {...(onPress ? { onPress } : {})}
    >
      <Filter className={cn('h-4 w-4', isActive ? 'text-primary' : '')} />
    </Button>
  );

  // Prepare checkbox values (filtering out undefined) and cast to string[]
  const selectedStyles = (localFilters.styles || []).filter((s) => s !== undefined) as string[];

  return (
    <FilterPanel
      trigger={trigger}
      title="Filter Groups"
      onApply={handleApply}
      onClear={handleClear}
      hasChanges={hasChanges}
    >
      <div className="flex flex-col gap-4">
        {/* Verification Status */}
        <div>
          <Checkbox isSelected={localFilters.verified === true} onValueChange={handleVerifiedChange}>
            <span className="text-sm">Verified only</span>
          </Checkbox>
        </div>

        {/* Styles */}
        <div>
          <p className="text-sm font-semibold mb-2">Style</p>
          <CheckboxGroup value={selectedStyles} onValueChange={handleStylesChange}>
            {styles.map((style) => (
              <Checkbox key={style} value={style}>
                <span className="text-sm capitalize">{style}</span>
              </Checkbox>
            ))}
          </CheckboxGroup>
        </div>
      </div>
    </FilterPanel>
  );
};

export default GroupFilters;

'use client';

import { useEffect, useState } from 'react';
import { Checkbox, CheckboxGroup } from '@heroui/react';
import { isEqual } from 'lodash';

import { styles } from '@/config/constants';
import type { GroupFilters as GroupFilterValues } from '@/config/validation-schema';
import type { Style } from '@/types/model';
import { FilterPanel, FilterTriggerButton } from '@/components/filters';

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
    const clearedFilters = { styles: [] };
    setLocalFilters(clearedFilters);
    onFiltersChange(clearedFilters);
  };

  const handleStylesChange = (selectedStyles: string[]) => {
    setLocalFilters((prev) => ({
      ...prev,
      styles: selectedStyles as Style[],
    }));
  };

  // Trigger button render function
  const trigger = ({ onPress }: { onPress?: () => void }) => (
    <FilterTriggerButton isActive={isActive} onPress={onPress} label="Filter groups" />
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

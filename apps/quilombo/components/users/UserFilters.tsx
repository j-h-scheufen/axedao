'use client';

import { useState, useEffect } from 'react';
import { Checkbox, CheckboxGroup } from '@heroui/react';
import { isEqual } from 'lodash';

import { titles } from '@/config/constants';
import type { UserFilters as UserFilterValues } from '@/config/validation-schema';
import { FilterPanel, FilterTriggerButton } from '@/components/filters';

export type { UserFilterValues };

type UserFiltersProps = {
  filters: Partial<UserFilterValues>;
  onFiltersChange: (filters: Partial<UserFilterValues>) => void;
  isActive: boolean; // Whether any filters are selected
};

const UserFilters = ({ filters, onFiltersChange, isActive }: UserFiltersProps) => {
  const [localFilters, setLocalFilters] = useState<Partial<UserFilterValues>>(filters);

  // Sync local filters with prop changes
  useEffect(() => {
    setLocalFilters(filters);
  }, [filters]);

  const hasChanges = !isEqual(localFilters, filters);

  const handleApply = () => {
    onFiltersChange(localFilters);
  };

  const handleClear = () => {
    const clearedFilters = { titles: [] };
    setLocalFilters(clearedFilters);
    onFiltersChange(clearedFilters);
  };

  const handleTitlesChange = (selectedTitles: string[]) => {
    setLocalFilters((prev) => ({
      ...prev,
      titles: selectedTitles as Array<(typeof titles)[number]>,
    }));
  };

  // Trigger button render function
  const trigger = ({ onPress }: { onPress?: () => void }) => (
    <FilterTriggerButton isActive={isActive} onPress={onPress} label="Filter users" />
  );

  // Prepare checkbox values (filtering out undefined) and cast to string[]
  const selectedTitles = (localFilters.titles || []).filter((t) => t !== undefined) as string[];

  return (
    <FilterPanel
      trigger={trigger}
      title="Filter Users"
      onApply={handleApply}
      onClear={handleClear}
      hasChanges={hasChanges}
      width="500px"
    >
      <div className="flex flex-col gap-4">
        {/* Titles */}
        <div>
          <p className="text-sm font-semibold mb-2">Title</p>
          <CheckboxGroup value={selectedTitles} onValueChange={handleTitlesChange}>
            <div className="grid grid-cols-2 gap-1">
              {titles.map((title) => (
                <Checkbox key={title} value={title}>
                  <span className="text-sm capitalize">{title}</span>
                </Checkbox>
              ))}
            </div>
          </CheckboxGroup>
        </div>
      </div>
    </FilterPanel>
  );
};

export default UserFilters;

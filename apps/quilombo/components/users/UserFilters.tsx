'use client';

import { useState, useEffect } from 'react';
import { Button, Checkbox, CheckboxGroup, cn } from '@heroui/react';
import { Filter } from 'lucide-react';
import { isEqual } from 'lodash';

import { titles } from '@/config/constants';
import type { UserFilters as UserFilterValues } from '@/config/validation-schema';
import FilterPanel from '@/components/FilterPanel';

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
    <Button
      isIconOnly
      variant="bordered"
      size="sm"
      className={cn('flex-1 sm:flex-none', isActive && 'border-primary')}
      aria-label="Filter users"
      {...(onPress ? { onPress } : {})}
    >
      <Filter className={cn('h-4 w-4', isActive ? 'text-primary' : '')} />
    </Button>
  );

  // Prepare checkbox values (filtering out undefined) and cast to string[]
  const selectedTitles = (localFilters.titles || []).filter((t) => t !== undefined) as string[];

  // Filter content
  const content = (
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
  );

  return (
    <FilterPanel
      trigger={trigger}
      title="Filter Users"
      onApply={handleApply}
      onClear={handleClear}
      hasChanges={hasChanges}
      width="500px"
    >
      {content}
    </FilterPanel>
  );
};

export default UserFilters;

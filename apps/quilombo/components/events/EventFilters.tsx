'use client';

import { useState, useEffect } from 'react';
import { Checkbox, CheckboxGroup } from '@heroui/react';
import { isEqual } from 'lodash';

import { eventTypes } from '@/config/constants';
import type { EventFilters as EventFilterValues } from '@/config/validation-schema';
import { FilterPanel, FilterTriggerButton } from '@/components/filters';

export type { EventFilterValues };

type EventFiltersProps = {
  filters: Partial<EventFilterValues>;
  onFiltersChange: (filters: Partial<EventFilterValues>) => void;
  isActive: boolean; // Whether any filters are selected
};

const EventFilters = ({ filters, onFiltersChange, isActive }: EventFiltersProps) => {
  const [localFilters, setLocalFilters] = useState<Partial<EventFilterValues>>(filters);

  // Sync local filters with prop changes
  useEffect(() => {
    setLocalFilters(filters);
  }, [filters]);

  const hasChanges = !isEqual(localFilters, filters);

  const handleApply = () => {
    onFiltersChange(localFilters);
  };

  const handleClear = () => {
    const clearedFilters = { eventTypes: [], pastEvents: false };
    setLocalFilters(clearedFilters);
    onFiltersChange(clearedFilters);
  };

  const handleEventTypesChange = (selectedEventTypes: string[]) => {
    setLocalFilters((prev) => ({
      ...prev,
      eventTypes: selectedEventTypes as Array<(typeof eventTypes)[number]>,
    }));
  };

  const handlePastEventsChange = (checked: boolean) => {
    setLocalFilters((prev) => ({
      ...prev,
      pastEvents: checked,
    }));
  };

  // Trigger button render function
  const trigger = ({ onPress }: { onPress?: () => void }) => (
    <FilterTriggerButton isActive={isActive} onPress={onPress} label="Filter events" />
  );

  // Prepare checkbox values (filtering out undefined) and cast to string[]
  const selectedEventTypes = (localFilters.eventTypes || []).filter((t) => t !== undefined) as string[];

  // Event type display names
  const eventTypeLabels: Record<string, string> = {
    general: 'General',
    workshop: 'Workshop',
    batizado: 'Batizado',
    public_roda: 'Public Roda',
  };

  return (
    <FilterPanel
      trigger={trigger}
      title="Filter Events"
      onApply={handleApply}
      onClear={handleClear}
      hasChanges={hasChanges}
    >
      <div className="flex flex-col gap-4">
        {/* Past Events Toggle */}
        <div>
          <Checkbox isSelected={localFilters.pastEvents ?? false} onValueChange={handlePastEventsChange}>
            <span className="text-sm">Show Past Events</span>
          </Checkbox>
        </div>

        {/* Event Types */}
        <div>
          <p className="text-sm font-semibold mb-2">Event Type</p>
          <CheckboxGroup value={selectedEventTypes} onValueChange={handleEventTypesChange}>
            {eventTypes.map((type) => (
              <Checkbox key={type} value={type}>
                <span className="text-sm">{eventTypeLabels[type] || type}</span>
              </Checkbox>
            ))}
          </CheckboxGroup>
        </div>
      </div>
    </FilterPanel>
  );
};

export default EventFilters;

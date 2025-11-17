'use client';

import type { eventTypes } from '@/config/constants';
import { FilterChip } from '@/components/filters';

type EventTypesFilterChipProps = {
  selectedEventTypes: Array<(typeof eventTypes)[number]>;
  onClear: () => void;
  onChipClick?: () => void;
};

// Event type display names
const eventTypeLabels: Record<string, string> = {
  general: 'General',
  workshop: 'Workshop',
  batizado: 'Batizado',
  public_roda: 'Public Roda',
};

/**
 * Filter chip for selected event types.
 */
const EventTypesFilterChip = ({ selectedEventTypes, onClear, onChipClick }: EventTypesFilterChipProps) => {
  return (
    <FilterChip
      label="Types"
      items={selectedEventTypes}
      onClear={onClear}
      onChipClick={onChipClick}
      maxVisible={3}
      formatItem={(type) => eventTypeLabels[type] || type}
    />
  );
};

export default EventTypesFilterChip;

'use client';

import { FilterChip } from '@/components/filters';

type PastEventsFilterChipProps = {
  pastEvents: boolean;
  onClear: () => void;
  onChipClick?: () => void;
};

/**
 * Filter chip for past events status.
 */
const PastEventsFilterChip = ({ pastEvents, onClear, onChipClick }: PastEventsFilterChipProps) => {
  return (
    <FilterChip
      label="Show Past Events"
      items={[pastEvents ? 'Yes' : 'No']}
      onClear={onClear}
      onChipClick={onChipClick}
      maxVisible={1}
    />
  );
};

export default PastEventsFilterChip;

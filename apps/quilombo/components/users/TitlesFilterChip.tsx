'use client';

import type { titles } from '@/config/constants';
import { FilterChip } from '@/components/filters';

type TitlesFilterChipProps = {
  selectedTitles: Array<(typeof titles)[number]>;
  onClear: () => void;
  onChipClick?: () => void;
};

/**
 * Filter chip for selected user titles.
 */
const TitlesFilterChip = ({ selectedTitles, onClear, onChipClick }: TitlesFilterChipProps) => {
  return (
    <FilterChip
      label="Titles"
      items={selectedTitles}
      onClear={onClear}
      onChipClick={onChipClick}
      maxVisible={3}
      formatItem={(title) => <span className="capitalize">{title}</span>}
    />
  );
};

export default TitlesFilterChip;

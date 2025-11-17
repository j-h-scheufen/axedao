'use client';

import { FilterChip } from '@/components/filters';

type StylesFilterChipProps = {
  selectedStyles: Array<'angola' | 'regional' | 'contemporânea'>;
  onClear: () => void;
  onChipClick?: () => void;
};

/**
 * Filter chip for selected group styles.
 */
const StylesFilterChip = ({ selectedStyles, onClear, onChipClick }: StylesFilterChipProps) => {
  return (
    <FilterChip
      label="Styles"
      items={selectedStyles}
      onClear={onClear}
      onChipClick={onChipClick}
      maxVisible={3}
      formatItem={(style) => <span className="capitalize">{style}</span>}
    />
  );
};

export default StylesFilterChip;

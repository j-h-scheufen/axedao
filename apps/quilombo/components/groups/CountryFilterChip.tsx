'use client';

import { getFlagEmoji } from '@/utils';
import { FilterChip } from '@/components/filters';

type CountryFilterChipProps = {
  selectedCountries: string[];
  onClear: () => void;
  onChipClick?: () => void;
};

/**
 * Filter chip for selected countries. Uses generic FilterChip component.
 * Displays country flags and shows tooltip with all selected countries on desktop.
 */
const CountryFilterChip = ({ selectedCountries, onClear, onChipClick }: CountryFilterChipProps) => {
  // Tooltip content showing all selected countries
  const tooltipContent = (
    <div className="flex flex-wrap gap-1.5 max-w-xs p-1">
      {selectedCountries.map((code) => (
        <span key={code} className="inline-flex items-center gap-1 text-xs">
          <span role="img" aria-label={`${code} flag`}>
            {getFlagEmoji(code)}
          </span>
          <span>{code}</span>
        </span>
      ))}
    </div>
  );

  return (
    <FilterChip
      label="Countries"
      items={selectedCountries}
      onClear={onClear}
      onChipClick={onChipClick}
      maxVisible={3}
      formatItem={(code) => (
        <span className="text-base leading-none" role="img" aria-label={`${code} flag`}>
          {getFlagEmoji(code)}
        </span>
      )}
      tooltipContent={tooltipContent}
    />
  );
};

export default CountryFilterChip;

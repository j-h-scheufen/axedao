'use client';

import { Chip, Tooltip } from '@heroui/react';

import { formatCountryChipLabel, getFlagEmoji } from '@/utils';

type CountryFilterChipProps = {
  selectedCountries: string[];
  onClear: () => void;
  onChipClick?: () => void; // Optional: reopen selector on click
};

const CountryFilterChip = ({ selectedCountries, onClear, onChipClick }: CountryFilterChipProps) => {
  if (selectedCountries.length === 0) return null;

  const { visible, remaining } = formatCountryChipLabel(selectedCountries, 3, true);

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

  const chipContent = (
    <Chip
      onClose={onClear}
      variant="flat"
      color="primary"
      size="sm"
      className="cursor-pointer pr-1.5"
      onClick={onChipClick}
    >
      <span className="flex items-center gap-1.5 whitespace-nowrap">
        <span className="font-medium text-xs">Countries:</span>
        {visible.map((flag) => (
          <span key={flag} className="text-base leading-none" role="img">
            {flag}
          </span>
        ))}
        {remaining > 0 && <span className="text-xs font-semibold">+{remaining}</span>}
      </span>
    </Chip>
  );

  // Desktop: Show tooltip on hover
  return (
    <>
      <div className="hidden sm:block">
        <Tooltip content={tooltipContent} placement="bottom" delay={300}>
          {chipContent}
        </Tooltip>
      </div>
      {/* Mobile: no tooltip, just chip */}
      <div className="sm:hidden">{chipContent}</div>
    </>
  );
};

export default CountryFilterChip;

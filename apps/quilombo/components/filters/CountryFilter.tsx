'use client';

import { useState, useEffect } from 'react';
import { Button, Spinner, cn } from '@heroui/react';
import { Globe } from 'lucide-react';
import { isEqual } from 'lodash';

import FilterPanel from './FilterPanel';
import CountryFlagButton from './CountryFlagButton';

type CountryFilterProps = {
  selectedCountries: string[];
  onCountriesChange: (countries: string[]) => void;
  isActive: boolean; // Whether any countries are selected
  countryCodes: string[]; // Available country codes to display
  isLoading: boolean; // Loading state for country codes
};

const CountryFilter = ({
  selectedCountries,
  onCountriesChange,
  isActive,
  countryCodes,
  isLoading,
}: CountryFilterProps) => {
  const [localSelection, setLocalSelection] = useState<string[]>(selectedCountries);

  // Sync local selection with prop changes
  useEffect(() => {
    setLocalSelection(selectedCountries);
  }, [selectedCountries]);

  const hasChanges = !isEqual([...localSelection].sort(), [...selectedCountries].sort());

  const handleApply = () => {
    onCountriesChange(localSelection);
  };

  const handleClear = () => {
    const cleared: string[] = [];
    setLocalSelection(cleared);
    onCountriesChange(cleared);
  };

  const handleToggle = (code: string) => {
    setLocalSelection((prev) => (prev.includes(code) ? prev.filter((c) => c !== code) : [...prev, code]));
  };

  // Trigger button render function
  const trigger = ({ onPress }: { onPress?: () => void }) => (
    <Button
      isIconOnly
      variant="bordered"
      size="sm"
      className={cn('flex-1 sm:flex-none', isActive && 'border-primary')}
      aria-label="Filter by country"
      {...(onPress ? { onPress } : {})}
    >
      <Globe className={cn('h-4 w-4', isActive ? 'text-primary' : '')} />
    </Button>
  );

  return (
    <FilterPanel
      trigger={trigger}
      title="Select Countries"
      onApply={handleApply}
      onClear={handleClear}
      hasChanges={hasChanges}
      width="560px"
      placement="bottom-start"
    >
      <div className="grid grid-cols-3 sm:grid-cols-6 gap-3">
        {isLoading ? (
          <div className="col-span-3 sm:col-span-6 flex justify-center py-8">
            <Spinner />
          </div>
        ) : (
          countryCodes.map((code) => (
            <CountryFlagButton
              key={code}
              countryCode={code}
              isSelected={localSelection.includes(code)}
              onToggle={handleToggle}
              size="md"
            />
          ))
        )}
      </div>
    </FilterPanel>
  );
};

export default CountryFilter;

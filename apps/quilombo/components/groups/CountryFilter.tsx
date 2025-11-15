'use client';

import { useState, useEffect } from 'react';
import {
  Button,
  Modal,
  ModalContent,
  ModalHeader,
  ModalBody,
  ModalFooter,
  Popover,
  PopoverTrigger,
  PopoverContent,
  Spinner,
  cn,
} from '@heroui/react';
import { Globe, Search } from 'lucide-react';
import { isEqual } from 'lodash';

import { useFetchAvailableCountries } from '@/query/group';
import CountryFlagButton from './CountryFlagButton';

type CountryFilterProps = {
  selectedCountries: string[];
  onCountriesChange: (countries: string[]) => void;
  isActive: boolean; // Whether any countries are selected
};

const CountryFilter = ({ selectedCountries, onCountriesChange, isActive }: CountryFilterProps) => {
  const [localSelection, setLocalSelection] = useState<string[]>(selectedCountries);
  const [isOpen, setIsOpen] = useState(false);
  const { data, isLoading } = useFetchAvailableCountries();

  const countryCodes = data?.countryCodes || [];

  // Sync local selection with prop changes
  useEffect(() => {
    setLocalSelection(selectedCountries);
  }, [selectedCountries]);

  const hasChanges = !isEqual([...localSelection].sort(), [...selectedCountries].sort());

  const handleApply = () => {
    onCountriesChange(localSelection);
    setIsOpen(false);
  };

  const handleClear = () => {
    setLocalSelection([]);
  };

  const handleToggle = (code: string) => {
    setLocalSelection((prev) => (prev.includes(code) ? prev.filter((c) => c !== code) : [...prev, code]));
  };

  // Trigger button (used in SearchBar startContent)
  const trigger = (
    <button
      type="button"
      onClick={() => setIsOpen(true)}
      className="cursor-pointer focus:outline-none"
      aria-label="Filter by country"
    >
      <div className="relative inline-flex items-center justify-center w-5 h-5">
        <Globe className={cn('h-5 w-5 transition-colors', isActive ? 'text-primary' : 'text-default-400')} />
        <Search className="h-2.5 w-2.5 absolute bottom-0 right-0 text-default-600" />
      </div>
    </button>
  );

  // Flag grid (shared between desktop/mobile)
  const flagGrid = (
    <div className="grid grid-cols-3 sm:grid-cols-6 gap-2 sm:gap-3 p-3 sm:p-4">
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
  );

  // Footer buttons (shared)
  const footer = (
    <div className="flex justify-between gap-2 p-3 sm:p-4 border-t border-divider">
      <Button variant="bordered" size="sm" onPress={handleClear}>
        Clear
      </Button>
      <Button color="primary" size="sm" isDisabled={!hasChanges} onPress={handleApply}>
        Apply
      </Button>
    </div>
  );

  // Desktop: Popover
  // Mobile: Modal (bottom drawer)
  return (
    <>
      {/* Desktop */}
      <div className="hidden sm:block">
        <Popover placement="bottom-start" isOpen={isOpen} onOpenChange={setIsOpen}>
          <PopoverTrigger>{trigger}</PopoverTrigger>
          <PopoverContent className="w-[480px] p-0">
            <div className="p-4 pb-0">
              <h3 className="text-lg font-semibold">Select Countries</h3>
            </div>
            {flagGrid}
            {footer}
          </PopoverContent>
        </Popover>
      </div>

      {/* Mobile */}
      <div className="sm:hidden">
        {trigger}
        <Modal isOpen={isOpen} onOpenChange={setIsOpen} placement="bottom" className="rounded-t-2xl">
          <ModalContent>
            <ModalHeader>Select Countries</ModalHeader>
            <ModalBody className="max-h-[60vh] overflow-y-auto p-0">{flagGrid}</ModalBody>
            <ModalFooter className="p-0">{footer}</ModalFooter>
          </ModalContent>
        </Modal>
      </div>
    </>
  );
};

export default CountryFilter;

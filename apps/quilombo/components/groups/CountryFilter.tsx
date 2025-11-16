'use client';

import { useState, useEffect } from 'react';
import {
  Button,
  Drawer,
  DrawerContent,
  DrawerHeader,
  DrawerBody,
  DrawerFooter,
  Popover,
  PopoverTrigger,
  PopoverContent,
  Spinner,
  cn,
  useDisclosure,
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
  const [desktopOpen, setDesktopOpen] = useState(false);
  const disclosure = useDisclosure();
  const { isOpen, onOpen, onOpenChange } = disclosure;
  const { data, isLoading } = useFetchAvailableCountries();

  const countryCodes = data?.countryCodes || [];

  // Sync local selection with prop changes
  useEffect(() => {
    setLocalSelection(selectedCountries);
  }, [selectedCountries]);

  const hasChanges = !isEqual([...localSelection].sort(), [...selectedCountries].sort());

  const handleApply = () => {
    onCountriesChange(localSelection);
    onOpenChange();
  };

  const handleClear = () => {
    setLocalSelection([]);
  };

  const handleToggle = (code: string) => {
    setLocalSelection((prev) => (prev.includes(code) ? prev.filter((c) => c !== code) : [...prev, code]));
  };

  // Icon content (shared)
  const iconContent = (
    <div className="relative w-full h-full flex items-center justify-center">
      <Globe className={cn('h-4 w-4 transition-colors', isActive ? 'text-primary' : 'text-default-400')} />
      <Search className="h-2 w-2 absolute bottom-0 right-0 text-default-600" />
    </div>
  );

  // Mobile trigger (needs onClick to call onOpen)
  const mobileTrigger = (
    <button
      type="button"
      onClick={(e) => {
        e.stopPropagation();
        if (countryCodes.length > 0) {
          onOpen();
        }
      }}
      className="inline-flex items-center justify-center cursor-pointer focus:outline-none h-4 w-4"
      aria-label="Filter by country"
      disabled={countryCodes.length === 0}
    >
      {iconContent}
    </button>
  );

  // Flag grid for mobile drawer
  const mobileGrid = (
    <div className="grid grid-cols-3 gap-3 p-4">
      {isLoading ? (
        <div className="col-span-3 flex justify-center py-8">
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

  // Flag grid for desktop popover (same spacing as mobile)
  const desktopGrid = (
    <div className="grid grid-cols-6 gap-3 p-4">
      {isLoading ? (
        <div className="col-span-6 flex justify-center py-8">
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

  // Footer buttons for desktop popover
  const desktopFooter = (
    <div className="flex justify-between gap-2">
      <Button variant="bordered" size="sm" onPress={handleClear}>
        Clear
      </Button>
      <Button
        color="primary"
        size="sm"
        isDisabled={!hasChanges}
        onPress={() => {
          onCountriesChange(localSelection);
          setDesktopOpen(false);
        }}
      >
        Apply
      </Button>
    </div>
  );

  // Footer buttons for mobile drawer
  const mobileFooter = (
    <div className="flex justify-between gap-2">
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
        <Popover placement="bottom-start" isOpen={desktopOpen} onOpenChange={setDesktopOpen}>
          <PopoverTrigger>
            <Button isIconOnly variant="light" size="sm" className="min-w-0 w-4 h-4 p-0" aria-label="Filter by country">
              {iconContent}
            </Button>
          </PopoverTrigger>
          <PopoverContent className="w-[560px] p-0">
            <div className="px-4 pt-4 pb-2">
              <h3 className="text-lg font-semibold">Select Countries</h3>
            </div>
            {desktopGrid}
            <div className="px-4 pb-4">{desktopFooter}</div>
          </PopoverContent>
        </Popover>
      </div>

      {/* Mobile */}
      <div className="sm:hidden">
        {mobileTrigger}
        <Drawer isOpen={isOpen} onOpenChange={onOpenChange} placement="bottom">
          <DrawerContent>
            {() => (
              <>
                <DrawerHeader>Select Countries</DrawerHeader>
                <DrawerBody className="overflow-y-auto">{mobileGrid}</DrawerBody>
                <DrawerFooter>{mobileFooter}</DrawerFooter>
              </>
            )}
          </DrawerContent>
        </Drawer>
      </div>
    </>
  );
};

export default CountryFilter;

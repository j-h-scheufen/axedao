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
import { Globe } from 'lucide-react';
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

  // Trigger button (shared between desktop and mobile)
  const triggerButton = (
    <Button
      isIconOnly
      variant="bordered"
      size="sm"
      className={cn('flex-1 sm:flex-none', isActive && 'border-primary')}
      aria-label="Filter by country"
    >
      <Globe className={cn('h-4 w-4', isActive ? 'text-primary' : '')} />
    </Button>
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
          <PopoverTrigger>{triggerButton}</PopoverTrigger>
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
        <Button
          isIconOnly
          variant="bordered"
          size="sm"
          className={cn('flex-1 sm:flex-none', isActive && 'border-primary')}
          aria-label="Filter by country"
          onPress={onOpen}
        >
          <Globe className={cn('h-4 w-4', isActive ? 'text-primary' : '')} />
        </Button>
      </div>
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
    </>
  );
};

export default CountryFilter;

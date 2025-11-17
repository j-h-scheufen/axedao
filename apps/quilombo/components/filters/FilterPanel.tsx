'use client';

import { useState, useEffect } from 'react';
import {
  Drawer,
  DrawerContent,
  DrawerHeader,
  DrawerBody,
  DrawerFooter,
  Popover,
  PopoverTrigger,
  PopoverContent,
  useDisclosure,
  Button,
} from '@heroui/react';
import type { ReactNode } from 'react';

type FilterPanelProps = {
  trigger: (props: { onPress?: () => void }) => ReactNode;
  title: string;
  children: ReactNode;
  onApply: () => void;
  onClear: () => void;
  hasChanges: boolean;
  width?: string; // Popover width (default: 400px)
  placement?: 'bottom-start' | 'bottom-end'; // Popover placement (default: bottom-end)
};

/**
 * Reusable filter panel component that renders as:
 * - Popover on desktop (sm breakpoint and up)
 * - Drawer on mobile
 *
 * Uses conditional rendering to only mount the appropriate version,
 * avoiding state conflicts between Popover and Drawer.
 */
const FilterPanel = ({
  trigger,
  title,
  children,
  onApply,
  onClear,
  hasChanges,
  width = '400px',
  placement = 'bottom-end',
}: FilterPanelProps) => {
  const { isOpen, onOpen, onClose, onOpenChange } = useDisclosure();
  const [isDesktop, setIsDesktop] = useState(false);

  // Detect screen size (sm breakpoint = 640px)
  useEffect(() => {
    const mediaQuery = window.matchMedia('(min-width: 640px)');
    setIsDesktop(mediaQuery.matches);

    const handler = (e: MediaQueryListEvent) => setIsDesktop(e.matches);
    mediaQuery.addEventListener('change', handler);
    return () => mediaQuery.removeEventListener('change', handler);
  }, []);

  const handleApply = () => {
    onApply();
    onClose();
  };

  const handleClear = () => {
    onClear();
    onClose();
  };

  const footer = (
    <div className="flex justify-between gap-2">
      <Button variant="bordered" size="sm" onPress={handleClear}>
        Clear
      </Button>
      <Button color="primary" size="sm" isDisabled={!hasChanges} onPress={handleApply}>
        Apply
      </Button>
    </div>
  );

  // Render desktop version (Popover)
  if (isDesktop) {
    return (
      <Popover placement={placement} isOpen={isOpen} onOpenChange={onOpenChange}>
        <PopoverTrigger>{trigger({})}</PopoverTrigger>
        <PopoverContent className="p-0" style={{ width }}>
          <div className="px-4 pt-4 pb-2">
            <h3 className="text-lg font-semibold">{title}</h3>
          </div>
          <div className="px-4 py-3">{children}</div>
          <div className="px-4 pb-4">{footer}</div>
        </PopoverContent>
      </Popover>
    );
  }

  // Render mobile version (Drawer)
  return (
    <>
      {trigger({ onPress: onOpen })}
      <Drawer isOpen={isOpen} onOpenChange={onOpenChange} placement="bottom">
        <DrawerContent>
          {() => (
            <>
              <DrawerHeader>{title}</DrawerHeader>
              <DrawerBody className="overflow-y-auto">{children}</DrawerBody>
              <DrawerFooter>{footer}</DrawerFooter>
            </>
          )}
        </DrawerContent>
      </Drawer>
    </>
  );
};

export default FilterPanel;

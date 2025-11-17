'use client';

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
 * - Popover on desktop (sm and up)
 * - Drawer on mobile
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
  // Separate disclosure states for desktop and mobile
  const popoverDisclosure = useDisclosure();
  const drawerDisclosure = useDisclosure();

  const handleApply = () => {
    onApply();
    popoverDisclosure.onClose();
    drawerDisclosure.onClose();
  };

  const handleClear = () => {
    onClear();
    popoverDisclosure.onClose();
    drawerDisclosure.onClose();
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

  return (
    <>
      {/* Desktop: Popover (controlled) */}
      <div className="hidden sm:block">
        <Popover placement={placement} isOpen={popoverDisclosure.isOpen} onOpenChange={popoverDisclosure.onOpenChange}>
          <PopoverTrigger>{trigger({})}</PopoverTrigger>
          <PopoverContent className="p-0" style={{ width }}>
            <div className="px-4 pt-4 pb-2">
              <h3 className="text-lg font-semibold">{title}</h3>
            </div>
            <div className="px-4 py-3">{children}</div>
            <div className="px-4 pb-4">{footer}</div>
          </PopoverContent>
        </Popover>
      </div>

      {/* Mobile: Drawer (controlled) */}
      <div className="sm:hidden">{trigger({ onPress: drawerDisclosure.onOpen })}</div>
      <Drawer isOpen={drawerDisclosure.isOpen} onOpenChange={drawerDisclosure.onOpenChange} placement="bottom">
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

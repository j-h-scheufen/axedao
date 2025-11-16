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
} from '@heroui/react';
import type { ReactNode } from 'react';

type FilterPanelProps = {
  trigger: (props: { onPress?: () => void }) => ReactNode;
  title: string;
  children: ReactNode;
  footer: ReactNode;
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
  footer,
  width = '400px',
  placement = 'bottom-end',
}: FilterPanelProps) => {
  // Only need disclosure for mobile drawer (Popover manages its own state)
  const { isOpen, onOpen, onOpenChange } = useDisclosure();

  return (
    <>
      {/* Desktop: Popover (uncontrolled - manages its own state) */}
      <div className="hidden sm:block">
        <Popover placement={placement}>
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

      {/* Mobile: Drawer (controlled with useDisclosure) */}
      <div className="sm:hidden">{trigger({ onPress: onOpen })}</div>
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

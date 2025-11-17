'use client';

import { Button, cn } from '@heroui/react';
import { Filter } from 'lucide-react';
import type { ComponentProps } from 'react';

type FilterTriggerButtonProps = {
  isActive: boolean;
  onPress?: () => void;
  label: string;
} & Omit<ComponentProps<typeof Button>, 'isIconOnly' | 'variant' | 'size' | 'className' | 'aria-label' | 'children'>;

/**
 * Reusable trigger button for filter panels.
 * Shows Filter icon with primary color when active.
 * Forwards all additional props to support PopoverTrigger integration.
 */
const FilterTriggerButton = ({ isActive, onPress, label, ...props }: FilterTriggerButtonProps) => {
  return (
    <Button
      isIconOnly
      variant="bordered"
      size="sm"
      className={cn('flex-1 sm:flex-none', isActive && 'border-primary')}
      aria-label={label}
      {...(onPress ? { onPress } : {})}
      {...props}
    >
      <Filter className={cn('h-4 w-4', isActive ? 'text-primary' : '')} />
    </Button>
  );
};

export default FilterTriggerButton;

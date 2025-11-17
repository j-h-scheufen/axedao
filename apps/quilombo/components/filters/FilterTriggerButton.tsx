'use client';

import { Button, cn } from '@heroui/react';
import { Filter } from 'lucide-react';

type FilterTriggerButtonProps = {
  isActive: boolean;
  onPress?: () => void;
  label: string;
};

/**
 * Reusable trigger button for filter panels.
 * Shows Filter icon with primary color when active.
 */
const FilterTriggerButton = ({ isActive, onPress, label }: FilterTriggerButtonProps) => {
  return (
    <Button
      isIconOnly
      variant="bordered"
      size="sm"
      className={cn('flex-1 sm:flex-none', isActive && 'border-primary')}
      aria-label={label}
      {...(onPress ? { onPress } : {})}
    >
      <Filter className={cn('h-4 w-4', isActive ? 'text-primary' : '')} />
    </Button>
  );
};

export default FilterTriggerButton;

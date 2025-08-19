import { Chip } from '@heroui/react';
import clsx from 'clsx';

import { getEventTypeColor, getEventTypeLabel } from '@/utils';

type Props = {
  type: string;
  className?: string;
  size?: 'sm' | 'md' | 'lg';
};

const EventTypeChip = ({ type, className = '', size = 'md' }: Props) => {
  const sizeClasses = {
    sm: 'px-2 py-1 text-xs',
    md: 'px-3 py-1 text-sm',
    lg: 'px-4 py-2 text-base',
  };

  return (
    <Chip className={clsx(getEventTypeColor(type), sizeClasses[size], 'font-medium', className)} variant="flat">
      {getEventTypeLabel(type)}
    </Chip>
  );
};

export default EventTypeChip;

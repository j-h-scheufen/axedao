import { CalendarIcon, ClockIcon } from 'lucide-react';
import clsx from 'clsx';

import { formatDate, formatTime } from '@/components/_utils';
import type { ZonedDateTime } from '@internationalized/date';

type Props = {
  start: ZonedDateTime;
  end?: ZonedDateTime;
  isAllDay: boolean;
  variant?: 'compact' | 'detailed';
  className?: string;
};

const EventDateTime = ({ start, end, isAllDay, variant = 'compact', className = '' }: Props) => {
  const isCompact = variant === 'compact';

  const iconSize = isCompact ? 'h-4 w-4' : 'h-5 w-5';
  const textSize = isCompact ? 'text-sm' : 'font-medium';
  const textColor = isCompact ? 'text-default-600' : '';
  const layout = isCompact ? 'items-center' : 'items-start';
  const iconMargin = isCompact ? '' : 'mt-0.5';

  return (
    <div className={clsx('flex gap-2', layout, className)}>
      <CalendarIcon className={clsx(iconSize, textColor, iconMargin)} />
      <div className={clsx('flex', isCompact ? '' : 'flex-col')}>
        <span className={clsx(textSize, textColor)}>
          {isAllDay ? (
            <>
              {formatDate(start)}
              {end && start.toDate().toDateString() !== end.toDate().toDateString() && (
                <>
                  {' - '}
                  {formatDate(end)}
                </>
              )}
            </>
          ) : (
            <>
              {formatDate(start)}
              {start.hour !== 0 && ` at ${formatTime(start)}`}
              {end && (
                <>
                  {' - '}
                  {formatDate(end)}
                  {end.hour !== 0 && ` at ${formatTime(end)}`}
                </>
              )}
            </>
          )}
        </span>
      </div>
    </div>
  );
};

export default EventDateTime;

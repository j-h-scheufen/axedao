import { Link, Card, CardBody, CardFooter } from '@heroui/react';
import clsx from 'clsx';
import { CalendarIcon, MapPinIcon, ExternalLinkIcon } from 'lucide-react';
import type { ReactNode } from 'react';

import { PATHS } from '@/config/constants';
import type { Event } from '@/types/model';
import { getFlagEmoji } from '@/utils';

type Props = { event: Event; className?: string; cardFooter?: ReactNode };

const EventCard = ({ event, className = '', cardFooter = null }: Props) => {
  const { name, id, type, start, end, countryCode, url } = event;

  const formatDate = (date: Date) => {
    return new Intl.DateTimeFormat('en-US', {
      month: 'short',
      day: 'numeric',
      year: 'numeric',
    }).format(date);
  };

  const formatTime = (date: Date) => {
    return new Intl.DateTimeFormat('en-US', {
      hour: 'numeric',
      minute: '2-digit',
    }).format(date);
  };

  const getEventTypeColor = (eventType: string) => {
    switch (eventType) {
      case 'workshop':
        return 'bg-blue-100 text-blue-800';
      case 'batizado':
        return 'bg-green-100 text-green-800';
      case 'public_roda':
        return 'bg-purple-100 text-purple-800';
      default:
        return 'bg-gray-100 text-gray-800';
    }
  };

  const getEventTypeLabel = (eventType: string) => {
    switch (eventType) {
      case 'workshop':
        return 'Workshop';
      case 'batizado':
        return 'Batizado';
      case 'public_roda':
        return 'Public Roda';
      default:
        return 'General';
    }
  };

  return (
    <Card as={Link} href={`${PATHS.events}/${id}`}>
      <CardBody className={clsx('flex flex-col gap-3 p-4', className)}>
        <div className="flex items-start justify-between">
          <h3 className="text-lg font-semibold line-clamp-2">{name}</h3>
          <span
            className={clsx('px-2 py-1 text-xs font-medium rounded-full whitespace-nowrap', getEventTypeColor(type))}
          >
            {getEventTypeLabel(type)}
          </span>
        </div>

        <div className="flex flex-col gap-2">
          <div className="flex items-center gap-2 text-sm text-default-600">
            <CalendarIcon className="h-4 w-4" />
            <span>
              {formatDate(start)}
              {start.getHours() !== 0 && ` at ${formatTime(start)}`}
              {end && (
                <>
                  {' - '}
                  {formatDate(end)}
                  {end.getHours() !== 0 && ` at ${formatTime(end)}`}
                </>
              )}
            </span>
          </div>

          {countryCode && (
            <div className="flex items-center gap-2">
              <span className="flex items-center gap-1 text-sm text-default-500">
                <MapPinIcon className="h-3 w-3" />
                <span className="text-lg">{getFlagEmoji(countryCode)}</span>
                <span className="uppercase">{countryCode}</span>
              </span>
            </div>
          )}

          {url && (
            <div className="flex items-center gap-2">
              <ExternalLinkIcon className="h-3 w-3 text-default-400" />
              <span className="text-xs text-default-500 truncate">{url}</span>
            </div>
          )}
        </div>
      </CardBody>
      {cardFooter && <CardFooter className="flex-row">{cardFooter}</CardFooter>}
    </Card>
  );
};

export default EventCard;

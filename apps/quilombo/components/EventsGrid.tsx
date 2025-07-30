import type { RefObject } from 'react';

import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import type { Event } from '@/types/model';
import EventCard from './EventCard';
import EventCardSkeleton from './skeletons/EventCardSkeleton';

type Props = {
  events?: Event[];
  isLoading?: boolean;
  scrollerRef?: RefObject<HTMLElement | null>;
};

const EventsGrid = ({ events = [], isLoading = false, scrollerRef }: Props) => {
  return (
    <div className="w-full">
      <div className="grid w-full grid-cols-1 gap-3 md:gap-4 sm:grid-cols-2 md:grid-cols-3">
        {events.map((event) => {
          return <EventCard key={`event-card-${event.id}`} event={event} className="" />;
        })}
        {isLoading &&
          // biome-ignore lint/suspicious/noArrayIndexKey: safe to use the index for the skeletons
          [...Array(QUERY_DEFAULT_PAGE_SIZE)].map((_, i) => <EventCardSkeleton key={`event-skeleton-${i}`} />)}
      </div>
      {/* Infinite scroll trigger - positioned at the bottom of the grid */}
      {scrollerRef && (
        <div
          ref={scrollerRef as RefObject<HTMLDivElement>}
          className="h-1 w-full mt-4"
          style={{ visibility: 'hidden' }}
          aria-hidden="true"
        />
      )}
    </div>
  );
};
export default EventsGrid;

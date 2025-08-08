import { dehydrate, HydrationBoundary } from '@tanstack/react-query';
import { notFound } from 'next/navigation';

import PageHeading from '@/components/PageHeading';
import { EventDetails, EventDetailsClientState, EventTypeChip } from '@/components/events';
import { QueryConfig } from '@/config/constants';
import { fetchEvent } from '@/db';
import { QUERY_KEYS } from '@/query';
import { createDefaultQueryClient } from '@/utils';
import type { NextPageProps } from '@/app/layout';

const EventDetailsPage = async ({ params }: NextPageProps<{ eventId: string }>) => {
  const { eventId } = await params;
  if (!eventId) throw Error('This page must be placed on a dynamic path containing [eventId]');

  const rawEvent = await fetchEvent(eventId);
  if (!rawEvent) throw notFound();

  const queryClient = createDefaultQueryClient(QueryConfig.staleTimeDefault);
  queryClient.setQueryData([QUERY_KEYS.event.getEvent, eventId], rawEvent);
  const dehydratedState = dehydrate(queryClient);
  queryClient.clear(); // should help with memory usage

  return (
    <HydrationBoundary state={dehydratedState}>
      <EventDetailsClientState eventId={eventId}>
        <PageHeading className="flex gap-2 sm:gap-3 items-center">
          <EventTypeChip type={rawEvent.type} size="md" />
          <span>{rawEvent.name}</span>
        </PageHeading>
        <EventDetails />
      </EventDetailsClientState>
    </HydrationBoundary>
  );
};

export default EventDetailsPage;

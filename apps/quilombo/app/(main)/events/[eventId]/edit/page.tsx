import { EventEdit } from '@/components/forms/event';
import { EventDetailsClientState } from '@/components/events';
import PageHeading from '@/components/PageHeading';
import { PATHS } from '@/config/constants';
import type { NextPageProps } from '@/app/layout';

const EventEditPage = async ({ params }: NextPageProps<{ eventId: string }>) => {
  const { eventId } = await params;

  return (
    <>
      <PageHeading backUrl={`${PATHS.events}/${eventId}`}>Edit event</PageHeading>
      <EventDetailsClientState eventId={eventId}>
        <EventEdit />
      </EventDetailsClientState>
    </>
  );
};

export default EventEditPage;

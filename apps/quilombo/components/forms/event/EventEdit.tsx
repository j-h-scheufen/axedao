'use client';

import { useAtomValue } from 'jotai';
import { useRouter } from 'next/navigation';

import { zonedEventAtom } from '@/hooks/state/event';
import { currentUserIdAtom } from '@/hooks/state/currentUser';
import { useUpdateEventMutation, useDeleteEventMutation } from '@/query/event';
import { PATHS } from '@/config/constants';
import type { UpdateEventForm } from '@/config/validation-schema';

import { EditEventForm } from '.';

const EventEdit = () => {
  const { event, isLoading } = useAtomValue(zonedEventAtom);
  const currentUserId = useAtomValue(currentUserIdAtom);
  const router = useRouter();
  const updateEventMutation = useUpdateEventMutation();
  const deleteEventMutation = useDeleteEventMutation();

  // Check if current user is the event creator
  const isEventCreator = event?.creatorId === currentUserId;

  if (isLoading) {
    return <div>Loading...</div>;
  }

  if (!event) {
    return <div>Event not found</div>;
  }

  if (!isEventCreator) {
    return <div>You don't have permission to edit this event</div>;
  }

  const handleDelete = async () => {
    if (!event?.id) return;

    try {
      await deleteEventMutation.mutateAsync(event.id);
      router.push(`${PATHS.search}?tab=events`);
    } catch (error) {
      console.error('Failed to delete event:', error);
    }
  };

  const handleSubmit = async (data: UpdateEventForm | FormData) => {
    if (!event?.id) return;
    try {
      await updateEventMutation.mutateAsync({ eventId: event.id, data });
      router.push(`${PATHS.events}/${event.id}`);
    } catch (error) {
      console.error('Failed to update event:', error);
    }
  };

  return (
    <div className="flex flex-col">
      <EditEventForm
        initialEvent={event}
        onSubmit={handleSubmit}
        isSubmitting={updateEventMutation.isPending}
        onDelete={handleDelete}
        isDeleting={deleteEventMutation.isPending}
      />
    </div>
  );
};

export default EventEdit;

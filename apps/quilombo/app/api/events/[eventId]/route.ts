import { isUndefined, omitBy } from 'lodash';
import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { updateEventFormSchema, type UpdateEventForm } from '@/config/validation-schema';
import { deleteEvent, fetchEvent, isEventCreator, updateEvent } from '@/db';
import { generateErrorMessage } from '@/utils';

/**
 * Fetches a single event by ID.
 * @param _ - The request object
 * @param params - eventId
 * @returns
 */
export async function GET(_: NextRequest, { params }: { params: Promise<{ eventId: string }> }) {
  try {
    const { eventId } = await params;

    const event = await fetchEvent(eventId);
    if (!event) {
      return NextResponse.json({ error: 'Event not found' }, { status: 404 });
    }

    return NextResponse.json(event);
  } catch (error) {
    console.error('Error fetching event', error);
    return NextResponse.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while fetching event') },
      {
        status: 500,
      }
    );
  }
}

/**
 * Updates an event. Only the creator can update the event.
 * @param request - UpdateEventForm
 * @param params - eventId
 * @returns
 */
export async function PATCH(request: NextRequest, { params }: { params: Promise<{ eventId: string }> }) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const { eventId } = await params;

    // Check if event exists
    const existingEvent = await fetchEvent(eventId);
    if (!existingEvent) {
      return NextResponse.json({ error: 'Event not found' }, { status: 404 });
    }

    // Check if user is the creator
    const isCreator = await isEventCreator(eventId, session.user.id);
    if (!isCreator) {
      return NextResponse.json({ error: 'Only the event creator can update this event' }, { status: 403 });
    }

    const body = await request.json();
    const isValid = await updateEventFormSchema.validate(body);
    if (!isValid) {
      return NextResponse.json({ error: 'Invalid event data' }, { status: 400 });
    }
    const eventData = body as UpdateEventForm;

    // Clean the event data and merge with existing event
    const cleanedEventData = omitBy(eventData, isUndefined);
    const updatedEventData = {
      ...existingEvent,
      ...cleanedEventData,
      // Convert date strings to Date objects if provided
      start: eventData.start ? new Date(eventData.start) : existingEvent.start,
      end: eventData.end ? new Date(eventData.end) : existingEvent.end,
    };

    const updatedEvent = await updateEvent(eventId, updatedEventData);
    if (!updatedEvent) {
      throw new Error('Failed to update event');
    }

    return NextResponse.json(updatedEvent);
  } catch (error) {
    console.error('Error updating event', error);
    return NextResponse.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while updating event') },
      {
        status: 500,
      }
    );
  }
}

/**
 * Deletes an event. Only the creator can delete the event.
 * @param _ - The request object
 * @param params - eventId
 * @returns
 */
export async function DELETE(_: NextRequest, { params }: { params: Promise<{ eventId: string }> }) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const { eventId } = await params;

    // Check if event exists
    const existingEvent = await fetchEvent(eventId);
    if (!existingEvent) {
      return NextResponse.json({ error: 'Event not found' }, { status: 404 });
    }

    // Check if user is the creator
    const isCreator = await isEventCreator(eventId, session.user.id);
    if (!isCreator) {
      return NextResponse.json({ error: 'Only the event creator can delete this event' }, { status: 403 });
    }

    await deleteEvent(eventId);

    return NextResponse.json({ success: true });
  } catch (error) {
    console.error('Error deleting event', error);
    return NextResponse.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while deleting event') },
      {
        status: 500,
      }
    );
  }
}

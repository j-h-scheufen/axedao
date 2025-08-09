import { isUndefined, omitBy } from 'lodash';
import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { FILE_PREFIXES } from '@/config/constants';
import { nextAuthOptions } from '@/config/next-auth-options';
import { updateEventFormSchema, type UpdateEventForm } from '@/config/validation-schema';
import { deleteEvent, fetchEvent, isEventCreator, updateEvent } from '@/db';
import { generateErrorMessage } from '@/utils';
import { pinToGroup } from '@/utils/pinata';
import { createImageBuffer } from '@/utils/images';

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

    const formData = await request.formData();
    const imageFile = formData.get('image') as File | null;

    // Extract form data excluding the file
    const eventData: Record<string, any> = {};
    for (const [key, value] of formData.entries()) {
      if (key !== 'image') {
        eventData[key] = value;
      }
    }

    // Parse JSON fields
    if (eventData.feature) {
      eventData.feature = JSON.parse(eventData.feature as string);
    }
    if (eventData.associatedGroups) {
      eventData.associatedGroups = JSON.parse(eventData.associatedGroups as string);
    }
    if (eventData.associatedUsers) {
      eventData.associatedUsers = JSON.parse(eventData.associatedUsers as string);
    }

    try {
      await updateEventFormSchema.validate(eventData);
    } catch (validationError) {
      console.error('Validation error:', validationError);
      return NextResponse.json({ error: 'Invalid event data', details: validationError }, { status: 400 });
    }

    const validatedEventData = eventData as UpdateEventForm;

    // Clean the event data and merge with existing event
    const cleanedEventData = omitBy(validatedEventData, isUndefined);

    // Remove auto-generated fields that should not be updated directly
    const { location: _location, countryCode: _countryCode, ...updateableFields } = cleanedEventData;

    const updatedEventData: any = {
      ...updateableFields,
      // Convert date strings to Date objects if provided
      start: validatedEventData.start ? new Date(validatedEventData.start) : existingEvent.start,
      end: validatedEventData.end ? new Date(validatedEventData.end) : existingEvent.end,
    };

    // Handle image upload if provided
    if (imageFile) {
      const filename = `${FILE_PREFIXES.eventImage}-${eventId}`;
      const imageBuffer = await createImageBuffer(imageFile, 'eventImage');
      const { cid, error, errorStatus } = await pinToGroup(imageBuffer, filename);

      if (error) {
        return NextResponse.json({ error }, { status: errorStatus ?? 500 });
      }

      updatedEventData.image = cid || null;
    } else if (validatedEventData.image !== undefined) {
      // If no new image but image field is provided, use the existing value
      updatedEventData.image = validatedEventData.image;
    }

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

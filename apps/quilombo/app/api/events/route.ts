import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';
import { v4 as uuidv4 } from 'uuid';
import type { Feature, Geometry } from 'geojson';

import { FILE_PREFIXES } from '@/config/constants';
import { nextAuthOptions } from '@/config/next-auth-options';
import { createEventFormSchema, type CreateEventForm, type EventType } from '@/config/validation-schema';
import { fetchUser, insertEvent } from '@/db';
import { generateErrorMessage } from '@/utils';
import { pinToGroup } from '@/utils/pinata';
import { createImageBuffer } from '@/utils/images';

/**
 * Creates a new event with the logged-in user as the creator.
 * @param request - CreateEventForm
 * @returns
 */
export async function POST(request: NextRequest) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const user = await fetchUser(session.user.id);
    if (!user) {
      throw new Error('No entry for logged-in user in DB. This should not be possible.');
    }

    const formData = await request.formData();
    const imageFile = formData.get('image') as File | null;

    // Extract form data excluding the file
    const eventData: Record<string, unknown> = {};
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

    // Convert boolean fields from string to boolean
    if (eventData.isAllDay !== undefined) {
      eventData.isAllDay = eventData.isAllDay === 'true';
    }
    if (eventData.imageChanged !== undefined) {
      eventData.imageChanged = eventData.imageChanged === 'true';
    }

    try {
      await createEventFormSchema.validate(eventData);
    } catch (validationError) {
      console.error('Validation error:', validationError);
      return NextResponse.json({ error: 'Invalid event data', details: validationError }, { status: 400 });
    }

    const validatedEventData = eventData as CreateEventForm;
    const newEventId = uuidv4();

    // Upload image to Pinata if provided
    let imageUrl: string | undefined;
    if (imageFile) {
      const filename = `${FILE_PREFIXES.eventImage}-${newEventId}`;
      const imageBuffer = await createImageBuffer(imageFile, 'eventImage');
      const { cid, error, errorStatus } = await pinToGroup(imageBuffer, filename);

      if (error) {
        return NextResponse.json({ error }, { status: errorStatus ?? 500 });
      }

      imageUrl = cid;
    }

    const event = await insertEvent({
      ...validatedEventData,
      id: newEventId,
      creatorId: session.user.id,
      image: imageUrl,
      start: new Date(validatedEventData.start), // Convert ISO string to Date for DB
      end: validatedEventData.end ? new Date(validatedEventData.end) : undefined, // Convert ISO string to Date for DB
      isAllDay: validatedEventData.isAllDay,
      type: validatedEventData.type as EventType,
      feature: validatedEventData.feature as Feature<Geometry>,
      associatedGroups: validatedEventData.associatedGroups.filter((id): id is string => id !== undefined),
      associatedUsers: validatedEventData.associatedUsers.filter((id): id is string => id !== undefined),
    });

    // Convert database event to client event with proper Date objects
    const clientEvent = event;

    return NextResponse.json(clientEvent);
  } catch (error) {
    console.error('Error creating event', error);
    return NextResponse.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while creating event') },
      {
        status: 500,
      }
    );
  }
}

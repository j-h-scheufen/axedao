import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';
import { v4 as uuidv4 } from 'uuid';

import { nextAuthOptions } from '@/config/next-auth-options';
import { type CreateNewGroupForm, createNewGroupFormSchema } from '@/config/validation-schema';
import { addGroupAdmin, fetchUser, insertGroup, updateUser } from '@/db';
import { generateErrorMessage } from '@/utils';
import { sendGroupRegisteredEmail } from '@/utils/email';

/**
 * Creates a new group and assigns the logged-in user as the admin of the group.
 * The user must not be a member of any other group.
 * Sets createdBy field. Leaves claimedBy/claimedAt NULL (claiming is only for imported groups).
 * @param request - CreateNewGroupForm
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

    if (user.groupId) {
      return NextResponse.json(
        { error: 'You cannot create a new group while being a member of an existing group' },
        { status: 403 }
      );
    }

    const body = await request.json();
    const isValid = await createNewGroupFormSchema.validate(body);
    if (!isValid) {
      return NextResponse.json({ error: 'Invalid group data' }, { status: 400 });
    }
    const groupData = body as CreateNewGroupForm;

    const newGroupId = uuidv4();
    const group = await insertGroup({
      ...groupData,
      id: newGroupId,
      createdBy: session.user.id,
    });
    if (!group) throw Error('Unable to create the group');

    await updateUser({ id: session.user.id, groupId: newGroupId });
    await addGroupAdmin({ groupId: group.id, userId: session.user.id });

    // Send welcome email (don't block on email failure)
    if (user.email) {
      sendGroupRegisteredEmail(user.email, group.name, group.id, user.name || 'Member').catch((emailError) => {
        console.error('Failed to send group registration email:', emailError);
      });
    }

    return NextResponse.json(group);
  } catch (error) {
    console.error('Error creating group', error);
    return NextResponse.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while creating group') },
      {
        status: 500,
      }
    );
  }
}

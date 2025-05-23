import { isUndefined, omitBy } from 'lodash';
import { getServerSession } from 'next-auth';
import { notFound } from 'next/navigation';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { type ProfileForm, profileFormSchema } from '@/config/validation-schema';
import { fetchUser, updateUser } from '@/db';

/**
 * Returns the User object of the logged-in user, i.e. the user whose session token is passed in the request.
 * @returns the logged-in user
 * @throws 401 if the user is not logged in, 404 if the profile is not found
 */
export async function GET() {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const user = await fetchUser(session.user.id);
  if (!user) return notFound();

  return Response.json(user);
}

/**
 * Updates the current user's record with the data in the request body.
 * It is allowed to send partial data, i.e. only the fields that need to be updated. To 'unset' a field, send it as null.
 * @param request - ProfileForm
 * @returns The updated User
 * @throws 400 if the input data is invalid, 401 if the user is not logged in, 404 if the profile is not found, 500 if an unexpected error occurs.
 */
export async function PATCH(request: NextRequest) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const body = await request.json();
  let formData: ProfileForm;
  try {
    formData = profileFormSchema.validateSync(body);
  } catch (error) {
    console.error('Unable to validate input data', error);
    return NextResponse.json({ error: 'Invalid input data' }, { status: 400 });
  }

  const existingUser = await fetchUser(session.user.id);
  if (!existingUser) return notFound();
  try {
    const profileData = formData as Omit<ProfileForm, 'id' | 'avatar'>;
    const cleanedProfileData = omitBy(profileData, isUndefined);

    const updatedUser = await updateUser({ ...cleanedProfileData, id: session.user.id });
    return Response.json(updatedUser);
  } catch (error) {
    console.error('Error updating user profile', error);
    return NextResponse.json({ error: 'Error updating user profile' }, { status: 500 });
  }
}

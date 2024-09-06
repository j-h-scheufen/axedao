import { isEqual, isNil } from 'lodash';
import { NextRequest, NextResponse } from 'next/server';

import { profileFormSchema, ProfileFormType } from '@/app/dashboard/profile/schema';
import { createLinks, fetchUserProfile, removeLinks, updateLink, updateUser } from '@/db';
import { Link, UserSession } from '@/types/model';
import { getToken, JWT } from 'next-auth/jwt';

/**
 * Returns the Profile of the logged-in user, i.e. the user whose JWT token is passed in the request.
 * @param req
 * @returns a Profile object
 * @throws 401 if the user is not logged in, 404 if the profile is not found
 */
export async function GET(req: NextRequest) {
  const token = (await getToken({ req })) as (JWT & { user: UserSession }) | null;
  if (!token?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const profile = await fetchUserProfile(token.user.id);
  if (!profile) {
    return NextResponse.json({ error: 'Profile was not found' }, { status: 404 });
  }

  return Response.json(profile);
}

export async function PATCH(req: NextRequest) {
  const token = (await getToken({ req })) as (JWT & { user: UserSession }) | null;
  if (!token?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const body = await req.json();
  const isValid = await profileFormSchema.validate(body);
  if (!isValid) {
    return NextResponse.json({ error: 'Invalid profile data' }, { status: 400 });
  }

  const { links: links, ...profileData } = body as Omit<ProfileFormType, 'links' | 'avatar'> & {
    links: Link[];
    avatar: string | null | undefined;
  };
  const profile = await fetchUserProfile(token.user.id);
  if (!profile) {
    return NextResponse.json({ error: 'Could not find user data' }, { status: 404 });
  }
  const { id, links: currentLinks = [] } = profile;

  const linkIds = links.map((link) => link.id);
  const currentLinkIds = currentLinks.map((link) => link.id);
  const removedLinkIds = currentLinkIds.filter((linkId) => !linkIds.includes(linkId));

  if (removedLinkIds.length) {
    await removeLinks(removedLinkIds);
  }

  const unChangedLinks: Link[] = [];
  const newLinks: Link[] = [];
  const updatedLinks = links.filter((link) => {
    const currentLink = link?.id && currentLinks.find((currentLink) => currentLink.id === link.id);
    const isUnChanged = currentLink && isEqual(currentLink, link);
    if (isUnChanged) unChangedLinks.push(link);
    const isUpdated = currentLink && !isUnChanged;
    if (!isUpdated && isNil(link?.id)) newLinks.push(link);
    return isUpdated;
  });

  if (updatedLinks.length) {
    for (const updatedLink of updatedLinks) {
      await updateLink(updatedLink);
    }
  }

  let createdLinks: Link[] = [];
  if (newLinks.length) {
    createdLinks = await createLinks(newLinks);
  }

  const updatedProfile = await updateUser({ id, ...profileData });
  const responseData = { ...updatedProfile, links: [...unChangedLinks, ...updatedLinks, ...createdLinks] };
  return Response.json(responseData);
}

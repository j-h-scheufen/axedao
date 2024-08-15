import { profileFormSchema, ProfileFormType } from '@/app/dashboard/profile/schema';
import { createLinks, fetchProfile, removeLinks, updateLink, updateUser } from '@/db';
import { Link } from '@/types/model';
import { isEqual, isNil } from 'lodash';
import { getServerSession } from 'next-auth/next';
import { NextRequest, NextResponse } from 'next/server';

export async function GET() {
  const session = await getServerSession();
  const email = session?.user?.email;
  if (!email) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const profile = await fetchProfile(email);
  if (!profile) {
    return NextResponse.json({ error: 'Profile was not found' }, { status: 404 });
  }

  return Response.json(profile);
}

export async function PATCH(request: NextRequest) {
  const session = await getServerSession();
  const email = session?.user?.email;
  if (!email) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const body = await request.json();
  const isValid = await profileFormSchema.validate(body);
  if (!isValid) {
    return NextResponse.json({ error: 'Invalid profile data' }, { status: 400 });
  }

  const { links: links, ...profileData } = body as Omit<ProfileFormType, 'links' | 'avatar'> & {
    links: Link[];
    avatar: string | null | undefined;
  };
  const profile = await fetchProfile(email);
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

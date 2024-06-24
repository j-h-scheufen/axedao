import { authOptions } from '@/app/auth';
import { LinkType, ProfileFormType, profileFormSchema } from '@/constants/schemas';
import { addLink, fetchUserProfileByEmail, removeLink, updateLink, updateUser } from '@/db';
import { Link, UserProfile } from '@/types/model';
import { getServerSession } from 'next-auth/next';
import { NextRequest } from 'next/server';

// TODO everything under the api/route must be protected via middleware.ts to check for user session

export async function GET(/* request: NextRequest */) {
  const session = await getServerSession(authOptions);
  if (!session?.user?.email) {
    return Response.json(
      { error: true, message: 'User not authenticated' },
      {
        status: 401,
      },
    );
  }
  const user = await fetchUserProfileByEmail(session?.user?.email);
  return Response.json(user);
}

export async function PATCH(request: NextRequest) {
  const session = await getServerSession();
  if (!session?.user?.email) {
    return Response.json(
      { error: true, message: 'Not authorized' },
      {
        status: 401,
      },
    );
  }

  const body = await request.json();
  const isValid = await profileFormSchema.validate(body);
  if (!isValid) {
    return Response.json(
      { error: true, message: 'Invalid profile data' },
      {
        status: 400,
      },
    );
  }

  const { links, ...profileData } = body as ProfileFormType;
  const user = await fetchUserProfileByEmail(session.user.email);
  if (!user) throw new Error();
  const { id, links: existingLinks } = user;

  for (const link of links) {
    const isNewLink = !link.id;
    let isUpdatedLink = false;

    if (isNewLink) {
      const addedLink = await addLink({
        ...link,
        type: link.type as LinkType,
        ownerId: id,
      });
      link.id = addedLink?.id;
    } else {
      for (const existingLink of existingLinks) {
        if (link.id === existingLink.id && link.url !== existingLink.url) {
          isUpdatedLink = true;
          break;
        }
      }
    }

    if (isUpdatedLink) {
      await updateLink(link as Link);
    }
  }

  const deletedLinkIds: number[] = [];
  for (const existingLink of existingLinks) {
    let isDeletedLink = true;
    for (const link of links) {
      if (link.id === existingLink.id) {
        isDeletedLink = false;
        break;
      }
    }
    if (isDeletedLink) {
      await removeLink(existingLink.id);
      deletedLinkIds.push(existingLink.id);
    }
  }

  const updatedUser = await updateUser({ ...(profileData as UserProfile), id });
  return Response.json({ ...user, ...updatedUser, links });
}

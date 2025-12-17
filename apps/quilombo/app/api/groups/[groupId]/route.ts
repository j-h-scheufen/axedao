import { isUndefined, omitBy } from 'lodash';
import { getServerSession } from 'next-auth';
import { notFound } from 'next/navigation';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { groupEditApiSchema } from '@/config/validation-schema';
import { canUserManageGroup, deleteGroup, fetchGroup, updateGroup, updateGroupProfile } from '@/db';
import { generateErrorMessage } from '@/utils';
import type { RouteParamsGroup } from '@/types/routes';

/**
 * Returns a Group object for a given group ID.
 * The returned data combines identity fields from genealogy.group_profiles
 * with operational fields from public.groups.
 *
 * @param _ - The request object (not used)
 * @returns a Group or 404 if not found
 */
export async function GET(_: NextRequest, { params }: RouteParamsGroup) {
  try {
    const { groupId } = await params;
    const group = await fetchGroup(groupId);
    if (!group) return notFound();

    return NextResponse.json(group);
  } catch (error) {
    console.error(error);
    return NextResponse.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while fetching group') },
      {
        status: 500,
      }
    );
  }
}

/**
 * Updates the group with the specified ID.
 * This endpoint handles updates to both genealogy identity fields and operational fields
 * in a coordinated manner. Supports partial updates - only send fields that need to change.
 *
 * Identity fields (stored in genealogy.group_profiles):
 * - name, style, descriptionEn, descriptionPt, philosophyEn, philosophyPt,
 *   historyEn, historyPt, publicLinks, isActive
 * - foundedYear, foundedYearPrecision, foundedLocation
 *
 * Operational fields (stored in public.groups):
 * - email, links (social links)
 *
 * @param request - Partial GroupEditForm data (all fields optional)
 * @param groupId - PATH parameter. The id of the group
 * @returns the updated Group or 404 if not found
 */
export async function PATCH(request: NextRequest, { params }: RouteParamsGroup) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  const { groupId } = await params;

  // Check if group exists
  const group = await fetchGroup(groupId);
  if (!group) return notFound();

  // Check authorization
  const canManage = await canUserManageGroup(groupId, session.user.id);
  if (!canManage) {
    return Response.json(
      {
        error: true,
        message: 'Unauthorized! Only group admins or global admins (for unmanaged groups) can update a group',
      },
      {
        status: 401,
      }
    );
  }

  const body = await request.json();

  // Validate input (uses partial schema - all fields optional for PATCH)
  try {
    await groupEditApiSchema.validate(body);
  } catch (validationError) {
    const error = validationError as { errors?: string[] };
    return NextResponse.json({ error: error.errors?.[0] || 'Validation failed' }, { status: 400 });
  }

  try {
    // Update genealogy profile (identity fields)
    if (group.profileId) {
      const genealogyData = omitBy(
        {
          name: body.name,
          style: body.style || null,
          descriptionEn: body.descriptionEn,
          descriptionPt: body.descriptionPt,
          philosophyEn: body.philosophyEn,
          philosophyPt: body.philosophyPt,
          historyEn: body.historyEn,
          historyPt: body.historyPt,
          publicLinks: body.publicLinks,
          isActive: body.isActive,
          foundedYear: body.foundedYear,
          foundedYearPrecision: body.foundedYearPrecision || null,
          foundedLocation: body.foundedLocation,
        },
        isUndefined
      );

      await updateGroupProfile(group.profileId, genealogyData);
    }

    // Update operational fields in public.groups
    const operationalData = omitBy(
      {
        email: body.email,
        links: body.links,
        // Keep legacy fields in sync for backwards compatibility
        name: body.name,
        style: body.style || null,
        description: body.descriptionEn || null,
      },
      isUndefined
    );

    await updateGroup({ ...operationalData, id: groupId });

    // Fetch and return the updated group
    const updatedGroup = await fetchGroup(groupId);
    return Response.json(updatedGroup);
  } catch (error) {
    console.error(error);
    return NextResponse.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while updating the group') },
      {
        status: 500,
      }
    );
  }
}

/**
 * Deletes the group with the specified ID.
 * @param _ - The request object (not used)
 * @param groupId - PATH parameter. The id of the group
 * @returns 204 if successful, 404 if not found
 */
export async function DELETE(_: NextRequest, { params }: RouteParamsGroup) {
  const session = await getServerSession(nextAuthOptions);

  if (!session?.user.id) {
    return NextResponse.json({ error: 'Unauthorized, try to login again' }, { status: 401 });
  }

  try {
    const { groupId } = await params;
    const group = await fetchGroup(groupId);
    if (!group) notFound();

    // Check authorization
    const canManage = await canUserManageGroup(groupId, session.user.id);
    if (!canManage) {
      return Response.json(
        { error: true, message: 'Unauthorized to delete the group. Missing admin privileges.' },
        {
          status: 403,
        }
      );
    }

    await deleteGroup(groupId);

    return new NextResponse(null, { status: 204 });
  } catch (error) {
    console.error(error);
    return Response.json(
      { error: true, message: generateErrorMessage(error, 'An unexpected error occurred while deleting group') },
      {
        status: 500,
      }
    );
  }
}

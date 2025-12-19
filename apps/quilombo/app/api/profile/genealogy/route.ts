/**
 * @openapi
 * /api/profile/genealogy:
 *   post:
 *     summary: Create the current user's genealogy profile (first publish)
 *     description: |
 *       Creates a new genealogy profile for a user who doesn't have one yet.
 *       User must NOT have an existing profileId.
 *       Creates person_profiles entry and updates users.profile_id to link them.
 *       Validates apelido uniqueness if provided.
 *     tags:
 *       - Profile
 *       - Genealogy
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               portrait:
 *                 type: string
 *                 nullable: true
 *               apelido:
 *                 type: string
 *                 nullable: true
 *                 description: Optional - beginners may not have received their apelido yet
 *               apelidoContext:
 *                 type: string
 *                 nullable: true
 *               title:
 *                 type: string
 *                 nullable: true
 *               style:
 *                 type: string
 *                 nullable: true
 *               birthYear:
 *                 type: string
 *                 nullable: true
 *               birthYearPrecision:
 *                 type: string
 *                 nullable: true
 *               bioEn:
 *                 type: string
 *                 nullable: true
 *               bioPt:
 *                 type: string
 *                 nullable: true
 *               publicLinks:
 *                 type: array
 *                 items:
 *                   type: string
 *     responses:
 *       200:
 *         description: Profile created successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 profileId:
 *                   type: string
 *                 message:
 *                   type: string
 *       400:
 *         description: Validation error or user already has a profile
 *       401:
 *         description: Unauthorized
 *       409:
 *         description: Apelido already taken
 *       500:
 *         description: Server error
 *
 *   patch:
 *     summary: Update the current user's existing genealogy profile
 *     description: |
 *       Updates an existing genealogy profile.
 *       User MUST have an existing profileId.
 *       Verifies that the user owns the profile being updated.
 *     tags:
 *       - Profile
 *       - Genealogy
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               portrait:
 *                 type: string
 *                 nullable: true
 *               apelido:
 *                 type: string
 *                 nullable: true
 *                 description: Optional - beginners may not have received their apelido yet
 *               apelidoContext:
 *                 type: string
 *                 nullable: true
 *               title:
 *                 type: string
 *                 nullable: true
 *               style:
 *                 type: string
 *                 nullable: true
 *               birthYear:
 *                 type: string
 *                 nullable: true
 *               birthYearPrecision:
 *                 type: string
 *                 nullable: true
 *               bioEn:
 *                 type: string
 *                 nullable: true
 *               bioPt:
 *                 type: string
 *                 nullable: true
 *               publicLinks:
 *                 type: array
 *                 items:
 *                   type: string
 *     responses:
 *       200:
 *         description: Profile updated successfully
 *       400:
 *         description: Validation error or user has no profile
 *       401:
 *         description: Unauthorized
 *       404:
 *         description: Profile not found
 *       409:
 *         description: Apelido already taken
 *       500:
 *         description: Server error
 *
 *   delete:
 *     summary: Delete the current user's genealogy profile
 *     description: |
 *       Deletes the user's genealogy profile and all related statements.
 *       Sets users.profile_id to null.
 *     tags:
 *       - Profile
 *       - Genealogy
 *     responses:
 *       200:
 *         description: Profile deleted successfully
 *       401:
 *         description: Unauthorized
 *       404:
 *         description: Profile not found
 *       500:
 *         description: Server error
 */

import { getServerSession } from 'next-auth';
import { NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { genealogyProfileFormSchema } from '@/config/validation-schema';
import {
  checkApelidoAvailability,
  deletePersonProfile,
  fetchPersonProfile,
  fetchUser,
  insertPersonProfile,
  updatePersonProfile,
  updateUser,
} from '@/db';
import type { InsertPersonProfile } from '@/db/schema/genealogy';
import { unpinIfNotReferenced } from '@/utils/pinata';

/**
 * POST - Create new genealogy profile (first publish only)
 */
export async function POST(request: Request) {
  try {
    const session = await getServerSession(nextAuthOptions);
    if (!session?.user.id) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    const body = await request.json();
    const formData = await genealogyProfileFormSchema.validate(body, { abortEarly: true });

    // Fetch current user to verify they don't have a profile yet
    const user = await fetchUser(session.user.id);
    if (!user) {
      return NextResponse.json({ error: 'User not found' }, { status: 404 });
    }

    // User must NOT have an existing profile for POST (create)
    if (user.profileId) {
      return NextResponse.json(
        { error: 'User already has a genealogy profile. Use PATCH to update.' },
        { status: 400 }
      );
    }

    // Check apelido availability (only if apelido is provided)
    if (formData.apelido) {
      const apelidoCheck = await checkApelidoAvailability(formData.apelido, formData.apelidoContext || null);

      if (!apelidoCheck.isAvailable) {
        return NextResponse.json(
          {
            error: apelidoCheck.requiresContext
              ? 'This apelido is already taken. Please provide context.'
              : 'This apelido with context is already taken',
          },
          { status: 409 }
        );
      }
    }

    // Convert birthYear from string to number if provided
    const birthYear = formData.birthYear ? Number.parseInt(formData.birthYear, 10) : undefined;
    const birthYearParsed = birthYear && !Number.isNaN(birthYear) ? birthYear : undefined;

    // Prepare genealogy profile data
    // Note: formData has been validated by Yup schema, so types are safe
    const profileData: Partial<InsertPersonProfile> = {
      portrait: formData.portrait || undefined,
      apelido: formData.apelido,
      apelidoContext: formData.apelidoContext || undefined,
      title: (formData.title || undefined) as InsertPersonProfile['title'],
      style: (formData.style || undefined) as InsertPersonProfile['style'],
      birthYear: birthYearParsed,
      birthYearPrecision: (formData.birthYearPrecision || undefined) as InsertPersonProfile['birthYearPrecision'],
      bioEn: formData.bioEn || undefined,
      bioPt: formData.bioPt || undefined,
      publicLinks: formData.publicLinks && formData.publicLinks.length > 0 ? formData.publicLinks : undefined,
    };

    // Create new genealogy profile
    const created = await insertPersonProfile(profileData);

    // Link profile to user in public.users table
    await updateUser({ id: session.user.id, profileId: created.id });

    return NextResponse.json({
      profileId: created.id,
      message: 'Profile published successfully',
    });
  } catch (error) {
    console.error('Error creating genealogy profile:', error);
    if (error instanceof Error && error.name === 'ValidationError') {
      return NextResponse.json({ error: error.message }, { status: 400 });
    }
    return NextResponse.json({ error: 'Failed to create profile' }, { status: 500 });
  }
}

/**
 * PATCH - Update existing genealogy profile
 */
export async function PATCH(request: Request) {
  try {
    const session = await getServerSession(nextAuthOptions);
    if (!session?.user.id) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    const body = await request.json();
    const formData = await genealogyProfileFormSchema.validate(body, { abortEarly: true });

    // Fetch current user to get their profileId
    const user = await fetchUser(session.user.id);
    if (!user) {
      return NextResponse.json({ error: 'User not found' }, { status: 404 });
    }

    // User MUST have an existing profile for PATCH (update)
    if (!user.profileId) {
      return NextResponse.json({ error: 'User has no genealogy profile. Use POST to create one.' }, { status: 400 });
    }

    // Verify that the profile belongs to the user
    const existingProfile = await fetchPersonProfile(user.profileId);
    if (!existingProfile) {
      console.error(`Profile ${user.profileId} not found for user ${session.user.id}`);
      return NextResponse.json({ error: 'Profile not found' }, { status: 404 });
    }

    // Additional safety check: verify the profile ID matches
    if (existingProfile.id !== user.profileId) {
      console.error(`Profile ID mismatch: user.profileId=${user.profileId}, profile.id=${existingProfile.id}`);
      return NextResponse.json({ error: 'Profile ownership mismatch' }, { status: 403 });
    }

    // Check apelido availability (excluding current profile, only if apelido is provided)
    if (formData.apelido) {
      const apelidoCheck = await checkApelidoAvailability(
        formData.apelido,
        formData.apelidoContext || null,
        user.profileId
      );

      if (!apelidoCheck.isAvailable) {
        return NextResponse.json(
          {
            error: apelidoCheck.requiresContext
              ? 'This apelido is already taken. Please provide context.'
              : 'This apelido with context is already taken',
          },
          { status: 409 }
        );
      }
    }

    // Convert birthYear from string to number if provided
    const birthYear = formData.birthYear ? Number.parseInt(formData.birthYear, 10) : undefined;
    const birthYearParsed = birthYear && !Number.isNaN(birthYear) ? birthYear : undefined;

    // Save old portrait for potential unpinning
    const oldPortrait = existingProfile.portrait;

    // Prepare genealogy profile data
    // Note: formData has been validated by Yup schema, so types are safe
    const profileData: Partial<InsertPersonProfile> = {
      portrait: formData.portrait || undefined,
      apelido: formData.apelido,
      apelidoContext: formData.apelidoContext || undefined,
      title: (formData.title || undefined) as InsertPersonProfile['title'],
      style: (formData.style || undefined) as InsertPersonProfile['style'],
      birthYear: birthYearParsed,
      birthYearPrecision: (formData.birthYearPrecision || undefined) as InsertPersonProfile['birthYearPrecision'],
      bioEn: formData.bioEn || undefined,
      bioPt: formData.bioPt || undefined,
      publicLinks: formData.publicLinks && formData.publicLinks.length > 0 ? formData.publicLinks : undefined,
    };

    // Update existing profile in genealogy.person_profiles
    const updated = await updatePersonProfile(user.profileId, profileData);
    if (!updated) {
      return NextResponse.json({ error: 'Failed to update profile' }, { status: 500 });
    }

    // Safely unpin old portrait if it changed
    const newPortrait = updated.portrait;
    if (oldPortrait && oldPortrait !== newPortrait) {
      await unpinIfNotReferenced(oldPortrait).catch((err) => {
        console.error('Failed to unpin old portrait:', err.message);
      });
    }

    return NextResponse.json({
      profileId: updated.id,
      message: 'Profile updated successfully',
    });
  } catch (error) {
    console.error('Error updating genealogy profile:', error);
    if (error instanceof Error && error.name === 'ValidationError') {
      return NextResponse.json({ error: error.message }, { status: 400 });
    }
    return NextResponse.json({ error: 'Failed to update profile' }, { status: 500 });
  }
}

/**
 * DELETE - Delete genealogy profile
 */
export async function DELETE() {
  try {
    const session = await getServerSession(nextAuthOptions);
    if (!session?.user.id) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    const user = await fetchUser(session.user.id);
    if (!user) {
      return NextResponse.json({ error: 'User not found' }, { status: 404 });
    }

    if (!user.profileId) {
      return NextResponse.json({ error: 'No genealogy profile to delete' }, { status: 404 });
    }

    // Verify profile exists and belongs to user
    const existingProfile = await fetchPersonProfile(user.profileId);
    if (!existingProfile) {
      return NextResponse.json({ error: 'Profile not found' }, { status: 404 });
    }

    if (existingProfile.id !== user.profileId) {
      console.error(
        `Profile ID mismatch during delete: user.profileId=${user.profileId}, profile.id=${existingProfile.id}`
      );
      return NextResponse.json({ error: 'Profile ownership mismatch' }, { status: 403 });
    }

    // Save portrait CID before deletion
    const portraitCid = existingProfile.portrait;

    // Delete the genealogy profile (also deletes related statements via deletePersonProfile)
    await deletePersonProfile(user.profileId);

    // Unlink from user in public.users table
    await updateUser({ id: session.user.id, profileId: null });

    // Safely unpin portrait (only if not referenced elsewhere)
    if (portraitCid) {
      await unpinIfNotReferenced(portraitCid).catch((err) => {
        console.error('Failed to unpin portrait:', err.message);
      });
    }

    return NextResponse.json({ message: 'Profile deleted successfully' });
  } catch (error) {
    console.error('Error deleting genealogy profile:', error);
    return NextResponse.json({ error: 'Failed to delete profile' }, { status: 500 });
  }
}

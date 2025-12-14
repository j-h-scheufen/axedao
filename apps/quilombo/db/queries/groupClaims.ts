/**
 * GROUP CLAIMS QUERIES
 * Group claiming workflow for genealogy groups and new group registration
 *
 * Two scenarios:
 * 1. Claim existing genealogy group (profileId is set)
 * 2. Register new group (proposedName is set)
 */

import { and, eq } from 'drizzle-orm';

import * as schema from '@/db/schema';
import { groupProfiles, type SelectGroupProfile } from '@/db/schema/genealogy';
import { db } from '@/db';
import { NotFoundError } from '@/utils/errors';
import { addGroupAdmin } from './groups';

// ============================================================================
// TYPES
// ============================================================================

export type GroupClaimType = 'genealogy_group' | 'new_group';

export type GroupClaimWithDetails = schema.SelectGroupClaim & {
  type: GroupClaimType;
  user: Pick<schema.SelectUser, 'id' | 'name' | 'nickname' | 'avatar'> | null;
  groupProfile: SelectGroupProfile | null;
};

// ============================================================================
// CLAIM CREATION
// ============================================================================

/**
 * Creates a claim for an existing genealogy group profile.
 *
 * @param userId - ID of the user claiming the group
 * @param profileId - ID of the genealogy group profile
 * @param message - User's explanation for why they should manage this group
 * @returns The created claim ID
 */
export async function createGenealogyGroupClaim(userId: string, profileId: string, message: string): Promise<string> {
  const result = await db
    .insert(schema.groupClaims)
    .values({
      userId,
      profileId,
      userMessage: message,
      status: 'pending',
      requestedAt: new Date(),
    })
    .returning({ id: schema.groupClaims.id });

  return result[0].id;
}

/**
 * Creates a claim to register a new group (not in genealogy).
 *
 * @param userId - ID of the user registering the group
 * @param data - New group data
 * @returns The created claim ID
 */
export async function createNewGroupClaim(
  userId: string,
  data: {
    proposedName: string;
    proposedStyle?: schema.SelectGroup['style'];
    website?: string;
    userMessage: string;
  }
): Promise<string> {
  const result = await db
    .insert(schema.groupClaims)
    .values({
      userId,
      proposedName: data.proposedName,
      proposedStyle: data.proposedStyle,
      website: data.website,
      userMessage: data.userMessage,
      status: 'pending',
      requestedAt: new Date(),
    })
    .returning({ id: schema.groupClaims.id });

  return result[0].id;
}

// ============================================================================
// CLAIM QUERIES
// ============================================================================

/**
 * Checks if a genealogy group profile can be admin-claimed.
 * A group is admin-claimable if there's no corresponding entry in public.groups
 * (i.e., no one has claimed admin rights yet).
 *
 * Note: This is different from "joinable" - a historical/inactive group
 * may still be admin-claimable even if users shouldn't declare membership.
 *
 * @param profileId - ID of the genealogy group profile
 * @returns True if group can be admin-claimed, false otherwise
 */
export async function isGroupAdminClaimable(profileId: string): Promise<boolean> {
  // Check if a public.groups entry exists that references this profile
  const result = await db
    .select({ id: schema.groups.id })
    .from(schema.groups)
    .where(eq(schema.groups.profileId, profileId))
    .limit(1);

  // Admin-claimable if no groups entry exists
  return result.length === 0;
}

/**
 * @deprecated Use isGroupAdminClaimable instead. This alias exists for backward compatibility.
 */
export const isGenealogyGroupClaimable = isGroupAdminClaimable;

/**
 * Checks if user has a pending claim for a genealogy group profile.
 *
 * @param userId - ID of the user
 * @param profileId - ID of the genealogy group profile
 * @returns True if user has pending claim
 */
export async function hasPendingGenealogyGroupClaim(userId: string, profileId: string): Promise<boolean> {
  const result = await db
    .select({ id: schema.groupClaims.id })
    .from(schema.groupClaims)
    .where(
      and(
        eq(schema.groupClaims.userId, userId),
        eq(schema.groupClaims.profileId, profileId),
        eq(schema.groupClaims.status, 'pending')
      )
    )
    .limit(1);

  return result.length > 0;
}

/**
 * Fetches a single claim by ID with full details.
 *
 * @param claimId - ID of the claim to fetch
 * @returns The claim with details or null if not found
 */
export async function getGroupClaimById(claimId: string): Promise<GroupClaimWithDetails | null> {
  const results = await db
    .select({
      id: schema.groupClaims.id,
      profileId: schema.groupClaims.profileId,
      proposedName: schema.groupClaims.proposedName,
      proposedStyle: schema.groupClaims.proposedStyle,
      website: schema.groupClaims.website,
      userId: schema.groupClaims.userId,
      status: schema.groupClaims.status,
      requestedAt: schema.groupClaims.requestedAt,
      processedAt: schema.groupClaims.processedAt,
      processedBy: schema.groupClaims.processedBy,
      userMessage: schema.groupClaims.userMessage,
      adminNotes: schema.groupClaims.adminNotes,
      userName: schema.users.name,
      userNickname: schema.users.nickname,
      userAvatar: schema.users.avatar,
      groupProfileName: groupProfiles.name,
      groupProfileStyle: groupProfiles.style,
      groupProfileLogo: groupProfiles.logo,
      groupProfileDescriptionEn: groupProfiles.descriptionEn,
    })
    .from(schema.groupClaims)
    .leftJoin(schema.users, eq(schema.groupClaims.userId, schema.users.id))
    .leftJoin(groupProfiles, eq(schema.groupClaims.profileId, groupProfiles.id))
    .where(eq(schema.groupClaims.id, claimId))
    .limit(1);

  if (results.length === 0) return null;

  const r = results[0];
  return {
    id: r.id,
    profileId: r.profileId,
    proposedName: r.proposedName,
    proposedStyle: r.proposedStyle,
    website: r.website,
    userId: r.userId,
    status: r.status,
    requestedAt: r.requestedAt,
    processedAt: r.processedAt,
    processedBy: r.processedBy,
    userMessage: r.userMessage,
    adminNotes: r.adminNotes,
    type: r.profileId ? 'genealogy_group' : 'new_group',
    user: r.userId ? { id: r.userId, name: r.userName, nickname: r.userNickname, avatar: r.userAvatar } : null,
    groupProfile: r.profileId
      ? ({
          id: r.profileId,
          name: r.groupProfileName,
          style: r.groupProfileStyle,
          logo: r.groupProfileLogo,
          descriptionEn: r.groupProfileDescriptionEn,
        } as SelectGroupProfile)
      : null,
  };
}

/**
 * Fetches all pending group claims for admin review.
 *
 * @returns Array of pending claims with details
 */
export async function getPendingGroupClaims(): Promise<GroupClaimWithDetails[]> {
  const results = await db
    .select({
      id: schema.groupClaims.id,
      profileId: schema.groupClaims.profileId,
      proposedName: schema.groupClaims.proposedName,
      proposedStyle: schema.groupClaims.proposedStyle,
      website: schema.groupClaims.website,
      userId: schema.groupClaims.userId,
      status: schema.groupClaims.status,
      requestedAt: schema.groupClaims.requestedAt,
      processedAt: schema.groupClaims.processedAt,
      processedBy: schema.groupClaims.processedBy,
      userMessage: schema.groupClaims.userMessage,
      adminNotes: schema.groupClaims.adminNotes,
      userName: schema.users.name,
      userNickname: schema.users.nickname,
      userAvatar: schema.users.avatar,
      groupProfileName: groupProfiles.name,
      groupProfileStyle: groupProfiles.style,
      groupProfileLogo: groupProfiles.logo,
      groupProfileDescriptionEn: groupProfiles.descriptionEn,
    })
    .from(schema.groupClaims)
    .leftJoin(schema.users, eq(schema.groupClaims.userId, schema.users.id))
    .leftJoin(groupProfiles, eq(schema.groupClaims.profileId, groupProfiles.id))
    .where(eq(schema.groupClaims.status, 'pending'))
    .orderBy(schema.groupClaims.requestedAt);

  return results.map((r) => ({
    id: r.id,
    profileId: r.profileId,
    proposedName: r.proposedName,
    proposedStyle: r.proposedStyle,
    website: r.website,
    userId: r.userId,
    status: r.status,
    requestedAt: r.requestedAt,
    processedAt: r.processedAt,
    processedBy: r.processedBy,
    userMessage: r.userMessage,
    adminNotes: r.adminNotes,
    type: (r.profileId ? 'genealogy_group' : 'new_group') as GroupClaimType,
    user: r.userId ? { id: r.userId, name: r.userName, nickname: r.userNickname, avatar: r.userAvatar } : null,
    groupProfile: r.profileId
      ? ({
          id: r.profileId,
          name: r.groupProfileName,
          style: r.groupProfileStyle,
          logo: r.groupProfileLogo,
          descriptionEn: r.groupProfileDescriptionEn,
        } as SelectGroupProfile)
      : null,
  }));
}

/**
 * Fetches claims submitted by a specific user.
 *
 * @param userId - ID of the user
 * @returns Array of user's claims
 */
export async function getUserGroupClaims(userId: string): Promise<GroupClaimWithDetails[]> {
  const results = await db
    .select({
      id: schema.groupClaims.id,
      profileId: schema.groupClaims.profileId,
      proposedName: schema.groupClaims.proposedName,
      proposedStyle: schema.groupClaims.proposedStyle,
      website: schema.groupClaims.website,
      userId: schema.groupClaims.userId,
      status: schema.groupClaims.status,
      requestedAt: schema.groupClaims.requestedAt,
      processedAt: schema.groupClaims.processedAt,
      processedBy: schema.groupClaims.processedBy,
      userMessage: schema.groupClaims.userMessage,
      adminNotes: schema.groupClaims.adminNotes,
      groupProfileName: groupProfiles.name,
      groupProfileStyle: groupProfiles.style,
      groupProfileLogo: groupProfiles.logo,
      groupProfileDescriptionEn: groupProfiles.descriptionEn,
    })
    .from(schema.groupClaims)
    .leftJoin(groupProfiles, eq(schema.groupClaims.profileId, groupProfiles.id))
    .where(eq(schema.groupClaims.userId, userId))
    .orderBy(schema.groupClaims.requestedAt);

  return results.map((r) => ({
    id: r.id,
    profileId: r.profileId,
    proposedName: r.proposedName,
    proposedStyle: r.proposedStyle,
    website: r.website,
    userId: r.userId,
    status: r.status,
    requestedAt: r.requestedAt,
    processedAt: r.processedAt,
    processedBy: r.processedBy,
    userMessage: r.userMessage,
    adminNotes: r.adminNotes,
    type: (r.profileId ? 'genealogy_group' : 'new_group') as GroupClaimType,
    user: null, // Not needed for user's own claims
    groupProfile: r.profileId
      ? ({
          id: r.profileId,
          name: r.groupProfileName,
          style: r.groupProfileStyle,
          logo: r.groupProfileLogo,
          descriptionEn: r.groupProfileDescriptionEn,
        } as SelectGroupProfile)
      : null,
  }));
}

// ============================================================================
// CLAIM PROCESSING
// ============================================================================

/**
 * Approves a group claim.
 *
 * For genealogy group claims: Creates public.groups entry linked to profile.
 * For new group claims: Creates genealogy.group_profiles AND public.groups.
 *
 * Both cases: Add user as admin, set claimedBy/claimedAt.
 *
 * @param claimId - ID of the claim to approve
 * @param adminId - ID of the admin approving
 * @param adminNotes - Optional admin notes
 * @throws NotFoundError if claim not found
 */
export async function approveGroupClaim(
  claimId: string,
  adminId: string,
  adminNotes?: string
): Promise<{ groupId: string; profileId: string }> {
  const claim = await getGroupClaimById(claimId);
  if (!claim) {
    throw new NotFoundError('Claim', claimId);
  }

  if (claim.status !== 'pending') {
    throw new Error(`Claim is not pending (status: ${claim.status})`);
  }

  let profileId: string;
  let groupId: string;

  if (claim.type === 'genealogy_group') {
    // Claim existing genealogy group - just create public.groups entry
    // profileId is guaranteed to be set when type is 'genealogy_group' (enforced by DB constraint)
    // biome-ignore lint/style/noNonNullAssertion: DB constraint ensures profileId is set for genealogy_group type
    profileId = claim.profileId!;

    const groupResult = await db
      .insert(schema.groups)
      .values({
        id: crypto.randomUUID(),
        profileId,
        createdBy: claim.userId,
        claimedBy: claim.userId,
        claimedAt: new Date(),
        // Legacy fields - will be removed in Flow 4
        name: claim.groupProfile?.name || 'Unknown',
      })
      .returning({ id: schema.groups.id });

    groupId = groupResult[0].id;
  } else {
    // Register new group - create both genealogy profile AND groups entry
    // proposedName is guaranteed to be set when type is 'new_group' (enforced by DB constraint)
    // biome-ignore lint/style/noNonNullAssertion: DB constraint ensures proposedName is set for new_group type
    const proposedName = claim.proposedName!;

    const profileResult = await db
      .insert(groupProfiles)
      .values({
        name: proposedName,
        style: claim.proposedStyle,
        publicLinks: claim.website ? [claim.website] : [],
      })
      .returning({ id: groupProfiles.id });

    profileId = profileResult[0].id;

    const groupResult = await db
      .insert(schema.groups)
      .values({
        id: crypto.randomUUID(),
        profileId,
        createdBy: claim.userId,
        claimedBy: claim.userId,
        claimedAt: new Date(),
        // Legacy fields - will be removed in Flow 4
        name: proposedName,
        style: claim.proposedStyle,
      })
      .returning({ id: schema.groups.id });

    groupId = groupResult[0].id;
  }

  // Add claimant as admin
  await addGroupAdmin({ groupId, userId: claim.userId });

  // Note: Membership is handled via genealogy statements, not users.groupId
  // The user can declare membership separately if desired

  // Update claim status
  await db
    .update(schema.groupClaims)
    .set({
      status: 'approved',
      processedAt: new Date(),
      processedBy: adminId,
      adminNotes,
    })
    .where(eq(schema.groupClaims.id, claimId));

  return { groupId, profileId };
}

/**
 * Rejects a group claim with admin notes.
 *
 * @param claimId - ID of the claim to reject
 * @param adminId - ID of the admin rejecting
 * @param adminNotes - Reason for rejection
 * @throws NotFoundError if claim not found
 */
export async function rejectGroupClaim(claimId: string, adminId: string, adminNotes: string): Promise<void> {
  const claim = await getGroupClaimById(claimId);
  if (!claim) {
    throw new NotFoundError('Claim', claimId);
  }

  if (claim.status !== 'pending') {
    throw new Error(`Claim is not pending (status: ${claim.status})`);
  }

  await db
    .update(schema.groupClaims)
    .set({
      status: 'rejected',
      processedAt: new Date(),
      processedBy: adminId,
      adminNotes,
    })
    .where(eq(schema.groupClaims.id, claimId));
}

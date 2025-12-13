/**
 * PERSON CLAIMS QUERIES
 * Person profile claiming workflow with admin approval.
 * Mirrors the group claims pattern for genealogy person profiles.
 */

import { and, eq } from 'drizzle-orm';

import * as schema from '@/db/schema';
import { personProfiles, type SelectPersonProfile } from '@/db/schema/genealogy';
import { db } from '@/db';
import { NotFoundError } from '@/utils/errors';

/** Threshold for presuming a person is deceased (100 years from current year) */
const PRESUMED_DECEASED_AGE = 100;

/**
 * Checks if a person is presumed deceased based on birth year.
 * Historical figures with birth years > 100 years ago are presumed deceased
 * even if we don't have a recorded death year.
 */
function isPresumedDeceased(birthYear: number | null, deathYear: number | null): boolean {
  if (deathYear !== null) return true;
  if (birthYear === null) return false;
  const currentYear = new Date().getFullYear();
  return birthYear <= currentYear - PRESUMED_DECEASED_AGE;
}

/**
 * Checks if a person profile is claimable.
 * A profile is claimable if:
 * 1. It exists
 * 2. It's not deceased (deathYear is null AND not presumed deceased by age)
 * 3. No user has claimed it yet (no user with this profileId)
 *
 * @param profileId - ID of the person profile to check
 * @returns True if profile is claimable, false otherwise
 */
export async function isPersonProfileClaimable(profileId: string): Promise<boolean> {
  // First check if profile exists and is not deceased
  const profile = await db
    .select({
      id: personProfiles.id,
      birthYear: personProfiles.birthYear,
      deathYear: personProfiles.deathYear,
    })
    .from(personProfiles)
    .where(eq(personProfiles.id, profileId))
    .limit(1);

  if (profile.length === 0) {
    return false;
  }

  // Deceased profiles (explicit or presumed) cannot be claimed
  if (isPresumedDeceased(profile[0].birthYear, profile[0].deathYear)) {
    return false;
  }

  // Check if any user has already claimed this profile
  const claimedByUser = await db
    .select({ id: schema.users.id })
    .from(schema.users)
    .where(eq(schema.users.profileId, profileId))
    .limit(1);

  return claimedByUser.length === 0;
}

/**
 * Gets detailed claimability status for a person profile.
 *
 * @param profileId - ID of the person profile to check
 * @returns Object with claimability status and reason
 */
export async function getPersonProfileClaimStatus(profileId: string): Promise<{
  isClaimable: boolean;
  reason: 'not_found' | 'deceased' | 'already_claimed' | 'claimable';
  claimedByUserId?: string;
}> {
  // First check if profile exists
  const profile = await db
    .select({
      id: personProfiles.id,
      birthYear: personProfiles.birthYear,
      deathYear: personProfiles.deathYear,
    })
    .from(personProfiles)
    .where(eq(personProfiles.id, profileId))
    .limit(1);

  if (profile.length === 0) {
    return { isClaimable: false, reason: 'not_found' };
  }

  // Deceased profiles (explicit or presumed by age) cannot be claimed
  if (isPresumedDeceased(profile[0].birthYear, profile[0].deathYear)) {
    return { isClaimable: false, reason: 'deceased' };
  }

  // Check if any user has already claimed this profile
  const claimedByUser = await db
    .select({ id: schema.users.id })
    .from(schema.users)
    .where(eq(schema.users.profileId, profileId))
    .limit(1);

  if (claimedByUser.length > 0) {
    return { isClaimable: false, reason: 'already_claimed', claimedByUserId: claimedByUser[0].id };
  }

  return { isClaimable: true, reason: 'claimable' };
}

/**
 * Creates a new person profile claim request.
 *
 * @param userId - ID of the user claiming the profile
 * @param profileId - ID of the person profile being claimed
 * @param message - User's explanation for why they are this person
 * @returns The created claim ID
 */
export async function createPersonClaim(userId: string, profileId: string, message: string): Promise<string> {
  const result = await db
    .insert(schema.personClaims)
    .values({
      userId,
      personProfileId: profileId,
      userMessage: message,
      status: 'pending',
      requestedAt: new Date(),
    })
    .returning({ id: schema.personClaims.id });

  return result[0].id;
}

/**
 * Fetches all pending person profile claims for admin review.
 *
 * @returns Array of pending claims with profile and user info
 */
export async function getPendingPersonClaims(): Promise<
  Array<schema.SelectPersonClaim & { profile: SelectPersonProfile | null; user: schema.SelectUser | null }>
> {
  const results = await db
    .select({
      id: schema.personClaims.id,
      personProfileId: schema.personClaims.personProfileId,
      userId: schema.personClaims.userId,
      status: schema.personClaims.status,
      requestedAt: schema.personClaims.requestedAt,
      processedAt: schema.personClaims.processedAt,
      processedBy: schema.personClaims.processedBy,
      userMessage: schema.personClaims.userMessage,
      adminNotes: schema.personClaims.adminNotes,
      profile: personProfiles,
      user: schema.users,
    })
    .from(schema.personClaims)
    .leftJoin(personProfiles, eq(schema.personClaims.personProfileId, personProfiles.id))
    .leftJoin(schema.users, eq(schema.personClaims.userId, schema.users.id))
    .where(eq(schema.personClaims.status, 'pending'))
    .orderBy(schema.personClaims.requestedAt);

  return results.map((r) => ({
    id: r.id,
    personProfileId: r.personProfileId,
    userId: r.userId,
    status: r.status,
    requestedAt: r.requestedAt,
    processedAt: r.processedAt,
    processedBy: r.processedBy,
    userMessage: r.userMessage,
    adminNotes: r.adminNotes,
    profile: r.profile,
    user: r.user,
  }));
}

/**
 * Fetches a single person claim by ID.
 *
 * @param claimId - ID of the claim to fetch
 * @returns The claim or null if not found
 */
export async function getPersonClaim(claimId: string): Promise<schema.SelectPersonClaim | null> {
  const claim = await db.query.personClaims.findFirst({
    where: eq(schema.personClaims.id, claimId),
  });

  return claim || null;
}

/**
 * Gets the pending claim for a user (if any).
 * Users can only have one pending claim at a time.
 *
 * @param userId - ID of the user
 * @returns The pending claim or null if none
 */
export async function getUserPendingPersonClaim(
  userId: string
): Promise<(schema.SelectPersonClaim & { profile: SelectPersonProfile | null }) | null> {
  const result = await db
    .select({
      id: schema.personClaims.id,
      personProfileId: schema.personClaims.personProfileId,
      userId: schema.personClaims.userId,
      status: schema.personClaims.status,
      requestedAt: schema.personClaims.requestedAt,
      processedAt: schema.personClaims.processedAt,
      processedBy: schema.personClaims.processedBy,
      userMessage: schema.personClaims.userMessage,
      adminNotes: schema.personClaims.adminNotes,
      profile: personProfiles,
    })
    .from(schema.personClaims)
    .leftJoin(personProfiles, eq(schema.personClaims.personProfileId, personProfiles.id))
    .where(and(eq(schema.personClaims.userId, userId), eq(schema.personClaims.status, 'pending')))
    .limit(1);

  if (result.length === 0) {
    return null;
  }

  return {
    id: result[0].id,
    personProfileId: result[0].personProfileId,
    userId: result[0].userId,
    status: result[0].status,
    requestedAt: result[0].requestedAt,
    processedAt: result[0].processedAt,
    processedBy: result[0].processedBy,
    userMessage: result[0].userMessage,
    adminNotes: result[0].adminNotes,
    profile: result[0].profile,
  };
}

/**
 * Approves a person profile claim: marks it approved, links user to profile.
 *
 * @param claimId - ID of the claim to approve
 * @param adminId - ID of the admin approving the claim
 * @throws NotFoundError if claim not found
 */
export async function approvePersonClaim(claimId: string, adminId: string): Promise<void> {
  // Get the claim details
  const claim = await getPersonClaim(claimId);

  if (!claim) {
    throw new NotFoundError('Person Claim', claimId);
  }

  // Update claim status
  await db
    .update(schema.personClaims)
    .set({
      status: 'approved',
      processedAt: new Date(),
      processedBy: adminId,
    })
    .where(eq(schema.personClaims.id, claimId));

  // Link user to the person profile
  await db.update(schema.users).set({ profileId: claim.personProfileId }).where(eq(schema.users.id, claim.userId));
}

/**
 * Rejects a person profile claim with admin notes.
 *
 * @param claimId - ID of the claim to reject
 * @param adminId - ID of the admin rejecting the claim
 * @param notes - Admin's reason for rejection
 * @throws NotFoundError if claim not found
 */
export async function rejectPersonClaim(claimId: string, adminId: string, notes: string): Promise<void> {
  // Get the claim details
  const claim = await getPersonClaim(claimId);

  if (!claim) {
    throw new NotFoundError('Person Claim', claimId);
  }

  await db
    .update(schema.personClaims)
    .set({
      status: 'rejected',
      processedAt: new Date(),
      processedBy: adminId,
      adminNotes: notes,
    })
    .where(eq(schema.personClaims.id, claimId));
}

/**
 * Fetches all claims for a specific person profile (for history/audit).
 *
 * @param profileId - ID of the person profile
 * @returns Array of all claims for this profile
 */
export async function getPersonProfileClaims(
  profileId: string
): Promise<Array<schema.SelectPersonClaim & { user: schema.SelectUser | null }>> {
  const results = await db
    .select({
      id: schema.personClaims.id,
      personProfileId: schema.personClaims.personProfileId,
      userId: schema.personClaims.userId,
      status: schema.personClaims.status,
      requestedAt: schema.personClaims.requestedAt,
      processedAt: schema.personClaims.processedAt,
      processedBy: schema.personClaims.processedBy,
      userMessage: schema.personClaims.userMessage,
      adminNotes: schema.personClaims.adminNotes,
      user: schema.users,
    })
    .from(schema.personClaims)
    .leftJoin(schema.users, eq(schema.personClaims.userId, schema.users.id))
    .where(eq(schema.personClaims.personProfileId, profileId))
    .orderBy(schema.personClaims.requestedAt);

  return results.map((r) => ({
    id: r.id,
    personProfileId: r.personProfileId,
    userId: r.userId,
    status: r.status,
    requestedAt: r.requestedAt,
    processedAt: r.processedAt,
    processedBy: r.processedBy,
    userMessage: r.userMessage,
    adminNotes: r.adminNotes,
    user: r.user,
  }));
}

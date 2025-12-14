/**
 * IMAGE/CID QUERIES
 * Utilities for checking CID references across the database
 */

import { eq, or, sql } from 'drizzle-orm';

import { db } from '@/db';
import * as schema from '@/db/schema';
import { groupProfiles, personProfiles } from '@/db/schema/genealogy';

/**
 * Checks if a CID is referenced anywhere in the database.
 * Used to prevent unpinning files that are still in use.
 *
 * Checks the following columns:
 * - users.avatar
 * - groups.logo
 * - groups.banner
 * - events.image
 * - genealogy.person_profiles.portrait
 * - genealogy.group_profiles.logo
 *
 * @param cid - The IPFS CID to check
 * @returns True if the CID is referenced somewhere, false otherwise
 */
export async function isCidReferenced(cid: string): Promise<boolean> {
  // Check public schema tables
  const [usersRef, groupsRef, eventsRef] = await Promise.all([
    // Check users.avatar
    db
      .select({ id: schema.users.id })
      .from(schema.users)
      .where(eq(schema.users.avatar, cid))
      .limit(1),

    // Check groups.logo and groups.banner
    db
      .select({ id: schema.groups.id })
      .from(schema.groups)
      .where(or(eq(schema.groups.logo, cid), eq(schema.groups.banner, cid)))
      .limit(1),

    // Check events.image
    db
      .select({ id: schema.events.id })
      .from(schema.events)
      .where(eq(schema.events.image, cid))
      .limit(1),
  ]);

  if (usersRef.length > 0 || groupsRef.length > 0 || eventsRef.length > 0) {
    return true;
  }

  // Check genealogy schema tables
  const [personProfilesRef, groupProfilesRef] = await Promise.all([
    // Check person_profiles.portrait
    db
      .select({ id: personProfiles.id })
      .from(personProfiles)
      .where(eq(personProfiles.portrait, cid))
      .limit(1),

    // Check group_profiles.logo
    db
      .select({ id: groupProfiles.id })
      .from(groupProfiles)
      .where(eq(groupProfiles.logo, cid))
      .limit(1),
  ]);

  return personProfilesRef.length > 0 || groupProfilesRef.length > 0;
}

/**
 * Counts how many times a CID is referenced in the database.
 * Useful for debugging and understanding reference patterns.
 *
 * @param cid - The IPFS CID to count
 * @returns Object with counts per table and total
 */
export async function countCidReferences(cid: string): Promise<{
  users: number;
  groups: number;
  events: number;
  personProfiles: number;
  groupProfiles: number;
  total: number;
}> {
  const [usersCount, groupsCount, eventsCount, personProfilesCount, groupProfilesCount] = await Promise.all([
    db.select({ count: sql<number>`count(*)` }).from(schema.users).where(eq(schema.users.avatar, cid)),

    db
      .select({ count: sql<number>`count(*)` })
      .from(schema.groups)
      .where(or(eq(schema.groups.logo, cid), eq(schema.groups.banner, cid))),

    db.select({ count: sql<number>`count(*)` }).from(schema.events).where(eq(schema.events.image, cid)),

    db.select({ count: sql<number>`count(*)` }).from(personProfiles).where(eq(personProfiles.portrait, cid)),

    db.select({ count: sql<number>`count(*)` }).from(groupProfiles).where(eq(groupProfiles.logo, cid)),
  ]);

  const users = Number(usersCount[0]?.count ?? 0);
  const groups = Number(groupsCount[0]?.count ?? 0);
  const events = Number(eventsCount[0]?.count ?? 0);
  const personProfilesNum = Number(personProfilesCount[0]?.count ?? 0);
  const groupProfilesNum = Number(groupProfilesCount[0]?.count ?? 0);

  return {
    users,
    groups,
    events,
    personProfiles: personProfilesNum,
    groupProfiles: groupProfilesNum,
    total: users + groups + events + personProfilesNum + groupProfilesNum,
  };
}

/**
 * GROUP LOCATIONS QUERIES
 * Geographic locations and mapping for groups
 */

import { and, count, eq, sql } from 'drizzle-orm';

import * as schema from '@/db/schema';
import { db } from '@/db';

/**
 * Fetches all locations for a specific group.
 *
 * @param groupId - ID of the group
 * @returns List of group locations ordered by name
 */
export async function fetchGroupLocations(groupId: string): Promise<schema.SelectGroupLocation[]> {
  return await db.query.groupLocations.findMany({
    where: (locations, { eq }) => eq(locations.groupId, groupId),
    orderBy: (locations, { asc }) => [asc(locations.name)],
  });
}

/**
 * Fetches a single group location by ID.
 *
 * @param locationId - ID of the location
 * @returns Location record or undefined if not found
 */
export async function fetchGroupLocation(locationId: string): Promise<schema.SelectGroupLocation | undefined> {
  return await db.query.groupLocations.findFirst({
    where: (locations, { eq }) => eq(locations.id, locationId),
  });
}

/**
 * Creates a new group location.
 *
 * @param location - Location data to insert
 * @returns The created location record
 * @throws Error if insertion fails
 */
export async function insertGroupLocation(location: schema.InsertGroupLocation): Promise<schema.SelectGroupLocation> {
  const locations = await db.insert(schema.groupLocations).values(location).returning();
  if (!locations.length) {
    throw new Error('Failed to insert group location');
  }
  return locations[0];
}

/**
 * Updates an existing group location.
 *
 * @param locationId - ID of the location to update
 * @param updates - Partial location data to update
 * @returns Updated location or undefined if not found
 */
export async function updateGroupLocation(
  locationId: string,
  updates: Partial<schema.InsertGroupLocation>
): Promise<schema.SelectGroupLocation | undefined> {
  const locations = await db
    .update(schema.groupLocations)
    .set(updates)
    .where(eq(schema.groupLocations.id, locationId))
    .returning();
  return locations.length ? locations[0] : undefined;
}

/**
 * Deletes a group location.
 *
 * @param locationId - ID of the location to delete
 */
export async function deleteGroupLocation(locationId: string): Promise<void> {
  await db.delete(schema.groupLocations).where(eq(schema.groupLocations.id, locationId));
}

/**
 * Checks if a location belongs to a specific group.
 *
 * @param locationId - ID of the location
 * @param groupId - ID of the group
 * @returns True if location belongs to the group
 */
export async function isLocationInGroup(locationId: string, groupId: string): Promise<boolean> {
  const result = await db
    .select({ value: count() })
    .from(schema.groupLocations)
    .where(and(eq(schema.groupLocations.id, locationId), eq(schema.groupLocations.groupId, groupId)));
  return result.length > 0 && result[0].value > 0;
}

/**
 * Fetches all group locations with their associated group data.
 * Used for map displays and location browsing.
 *
 * @returns List of locations with full group details
 */
export async function fetchAllGroupLocationsWithGroups(): Promise<
  Array<schema.SelectGroupLocation & { group: schema.SelectGroup }>
> {
  return await db
    .select({
      id: schema.groupLocations.id,
      groupId: schema.groupLocations.groupId,
      name: schema.groupLocations.name,
      description: schema.groupLocations.description,
      feature: schema.groupLocations.feature,
      location: schema.groupLocations.location,
      countryCode: schema.groupLocations.countryCode,
      group: {
        id: schema.groups.id,
        createdAt: schema.groups.createdAt,
        updatedAt: schema.groups.updatedAt,
        name: schema.groups.name,
        description: schema.groups.description,
        style: schema.groups.style,
        email: schema.groups.email,
        logo: schema.groups.logo,
        banner: schema.groups.banner,
        leader: schema.groups.leader,
        founder: schema.groups.founder,
        links: schema.groups.links,
        createdBy: schema.groups.createdBy,
        claimedBy: schema.groups.claimedBy,
        claimedAt: schema.groups.claimedAt,
        profileId: schema.groups.profileId,
      },
    })
    .from(schema.groupLocations)
    .innerJoin(schema.groups, eq(schema.groupLocations.groupId, schema.groups.id));
}

/**
 * Get distinct country codes from group locations.
 * Only returns countries that have at least one group.
 * Results are sorted alphabetically.
 *
 * @returns Array of ISO 3166-1 alpha-2 country codes
 */
export async function getDistinctCountryCodes(): Promise<string[]> {
  const results = await db
    .selectDistinct({ countryCode: schema.groupLocations.countryCode })
    .from(schema.groupLocations)
    .where(sql`${schema.groupLocations.countryCode} IS NOT NULL`)
    .orderBy(schema.groupLocations.countryCode);

  return results.map((r) => r.countryCode).filter(Boolean) as string[];
}

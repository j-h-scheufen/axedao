/**
 * GENEALOGY QUERIES
 * Person profiles, group profiles, and statement (relationship) management
 *
 * This module operates on the genealogy schema which is fully self-contained.
 * No foreign keys point from genealogy to public schema.
 */

import { and, eq, gt, inArray, isNull, or, sql, type SQLWrapper } from 'drizzle-orm';

import { QUERY_DEFAULT_PAGE_SIZE } from '@/config/constants';
import { db } from '@/db';
import * as schema from '@/db/schema';
import {
  groupProfiles,
  personProfiles,
  statements,
  type EntityType,
  type InsertGroupProfile,
  type InsertPersonProfile,
  type InsertStatement,
  type Predicate,
  type SelectGroupProfile,
  type SelectPersonProfile,
  type SelectStatement,
} from '@/db/schema/genealogy';

// ============================================================================
// PERSON PROFILE QUERIES
// ============================================================================

/**
 * Fetches a single person profile by ID.
 *
 * @param profileId - ID of the person profile
 * @returns Person profile or undefined if not found
 */
export async function fetchPersonProfile(profileId: string): Promise<SelectPersonProfile | undefined> {
  const results = await db.select().from(personProfiles).where(eq(personProfiles.id, profileId)).limit(1);
  return results[0];
}

/**
 * Searches person profiles with optional filters and pagination.
 *
 * @param options - Search parameters
 * @param options.claimableOnly - If true, excludes deceased profiles and profiles already claimed by a user
 * @returns Paginated list of person profiles with total count
 */
export async function searchPersonProfiles(options: {
  pageSize?: number;
  offset?: number;
  searchTerm?: string;
  style?: string;
  title?: string;
  includeDeceased?: boolean;
  claimableOnly?: boolean;
}): Promise<{ rows: SelectPersonProfile[]; totalCount: number }> {
  const {
    pageSize = QUERY_DEFAULT_PAGE_SIZE,
    offset = 0,
    searchTerm,
    style,
    title,
    includeDeceased = true,
    claimableOnly = false,
  } = options;

  const filters: (SQLWrapper | undefined)[] = [];

  if (searchTerm) {
    // Search on identity fields only (apelido, name) - not bio content
    // Use unaccent() for accent-insensitive search (e.g., "Jose" matches "José")
    const searchPattern = `%${searchTerm}%`;
    filters.push(
      sql`(unaccent(${personProfiles.apelido}) ILIKE unaccent(${searchPattern}) OR unaccent(${personProfiles.name}) ILIKE unaccent(${searchPattern}))`
    );
  }

  if (style) {
    filters.push(sql`${personProfiles.style} = ${style}`);
  }

  if (title) {
    filters.push(sql`${personProfiles.title} = ${title}`);
  }

  // claimableOnly implies not deceased
  if (!includeDeceased || claimableOnly) {
    filters.push(isNull(personProfiles.deathYear));
  }

  // For claimable profiles, apply additional filters
  if (claimableOnly) {
    // Exclude profiles already claimed by a user (users.profileId references them)
    const claimedProfileIds = db
      .select({ profileId: schema.users.profileId })
      .from(schema.users)
      .where(sql`${schema.users.profileId} IS NOT NULL`);
    filters.push(sql`${personProfiles.id} NOT IN (${claimedProfileIds})`);

    // Exclude profiles with birth year > 100 years ago (presumed deceased historical figures)
    // This mirrors the heuristic used in the genealogy graph UI
    const currentYear = new Date().getFullYear();
    const presumedDeceasedThreshold = currentYear - 100;
    filters.push(or(isNull(personProfiles.birthYear), gt(personProfiles.birthYear, presumedDeceasedThreshold)));
  }

  const results = await db
    .select({
      record: personProfiles,
      count: sql<number>`count(*) over()`,
    })
    .from(personProfiles)
    .where(filters.length ? and(...filters) : undefined)
    .orderBy(personProfiles.apelido)
    .limit(pageSize)
    .offset(offset);

  return {
    rows: results.map((r) => r.record),
    totalCount: results[0]?.count ? Number(results[0].count) : 0,
  };
}

/**
 * Creates a new person profile.
 *
 * @param profile - Person profile data to insert
 * @returns The created person profile
 * @throws Error if insertion fails
 */
export async function insertPersonProfile(profile: InsertPersonProfile): Promise<SelectPersonProfile> {
  const profiles = await db.insert(personProfiles).values(profile).returning();
  if (!profiles.length) {
    throw new Error('Failed to insert person profile');
  }
  return profiles[0];
}

/**
 * Updates an existing person profile.
 *
 * @param profileId - ID of the profile to update
 * @param updates - Partial profile data to update
 * @returns Updated profile or undefined if not found
 */
export async function updatePersonProfile(
  profileId: string,
  updates: Partial<InsertPersonProfile>
): Promise<SelectPersonProfile | undefined> {
  const profiles = await db.update(personProfiles).set(updates).where(eq(personProfiles.id, profileId)).returning();
  return profiles.length ? profiles[0] : undefined;
}

/**
 * Deletes a person profile.
 * Note: This will also delete all statements where this profile is subject or object.
 *
 * @param profileId - ID of the profile to delete
 */
export async function deletePersonProfile(profileId: string): Promise<void> {
  // Delete related statements first (no FK cascade in genealogy schema)
  await db
    .delete(statements)
    .where(
      or(
        and(eq(statements.subjectType, 'person'), eq(statements.subjectId, profileId)),
        and(eq(statements.objectType, 'person'), eq(statements.objectId, profileId))
      )
    );

  await db.delete(personProfiles).where(eq(personProfiles.id, profileId));
}

// ============================================================================
// GROUP PROFILE QUERIES
// ============================================================================

/**
 * Fetches a single group profile by ID.
 *
 * @param profileId - ID of the group profile
 * @returns Group profile or undefined if not found
 */
export async function fetchGroupProfile(profileId: string): Promise<SelectGroupProfile | undefined> {
  const results = await db.select().from(groupProfiles).where(eq(groupProfiles.id, profileId)).limit(1);
  return results[0];
}

/**
 * Searches group profiles with optional filters and pagination.
 *
 * @param options - Search parameters
 * @returns Paginated list of group profiles with total count
 */
export async function searchGroupProfiles(options: {
  pageSize?: number;
  offset?: number;
  searchTerm?: string;
  style?: string;
  isActive?: boolean;
}): Promise<{ rows: SelectGroupProfile[]; totalCount: number }> {
  const { pageSize = QUERY_DEFAULT_PAGE_SIZE, offset = 0, searchTerm, style, isActive } = options;

  const filters: (SQLWrapper | undefined)[] = [];

  if (searchTerm) {
    // Search on identity fields: name, nameAliases array, nameHistory JSONB array
    // Use unaccent() for accent-insensitive search (e.g., "Senzala" matches "Senzalã")
    const searchPattern = `%${searchTerm}%`;
    filters.push(
      or(
        sql`unaccent(${groupProfiles.name}) ILIKE unaccent(${searchPattern})`,
        // Search in nameAliases text array (case-insensitive, accent-insensitive)
        sql`EXISTS (SELECT 1 FROM unnest(${groupProfiles.nameAliases}) AS alias WHERE unaccent(alias) ILIKE unaccent(${searchPattern}))`,
        // Search in nameHistory JSONB array's 'name' field (case-insensitive, accent-insensitive)
        sql`EXISTS (SELECT 1 FROM jsonb_array_elements(${groupProfiles.nameHistory}) AS entry WHERE unaccent(entry->>'name') ILIKE unaccent(${searchPattern}))`
      )
    );
  }

  if (style) {
    filters.push(sql`${groupProfiles.style} = ${style}`);
  }

  if (typeof isActive === 'boolean') {
    filters.push(eq(groupProfiles.isActive, isActive));
  }

  const results = await db
    .select({
      record: groupProfiles,
      count: sql<number>`count(*) over()`,
    })
    .from(groupProfiles)
    .where(filters.length ? and(...filters) : undefined)
    .orderBy(groupProfiles.createdAt)
    .limit(pageSize)
    .offset(offset);

  return {
    rows: results.map((r) => r.record),
    totalCount: results[0]?.count ? Number(results[0].count) : 0,
  };
}

/**
 * Creates a new group profile.
 *
 * @param profile - Group profile data to insert
 * @returns The created group profile
 * @throws Error if insertion fails
 */
export async function insertGroupProfile(profile: InsertGroupProfile): Promise<SelectGroupProfile> {
  const profiles = await db.insert(groupProfiles).values(profile).returning();
  if (!profiles.length) {
    throw new Error('Failed to insert group profile');
  }
  return profiles[0];
}

/**
 * Updates an existing group profile.
 *
 * @param profileId - ID of the profile to update
 * @param updates - Partial profile data to update
 * @returns Updated profile or undefined if not found
 */
export async function updateGroupProfile(
  profileId: string,
  updates: Partial<InsertGroupProfile>
): Promise<SelectGroupProfile | undefined> {
  const profiles = await db.update(groupProfiles).set(updates).where(eq(groupProfiles.id, profileId)).returning();
  return profiles.length ? profiles[0] : undefined;
}

/**
 * Deletes a group profile.
 * Note: This will also delete all statements where this profile is subject or object.
 *
 * @param profileId - ID of the profile to delete
 */
export async function deleteGroupProfile(profileId: string): Promise<void> {
  // Delete related statements first (no FK cascade in genealogy schema)
  await db
    .delete(statements)
    .where(
      or(
        and(eq(statements.subjectType, 'group'), eq(statements.subjectId, profileId)),
        and(eq(statements.objectType, 'group'), eq(statements.objectId, profileId))
      )
    );

  await db.delete(groupProfiles).where(eq(groupProfiles.id, profileId));
}

// ============================================================================
// STATEMENT QUERIES
// ============================================================================

/**
 * Fetches a single statement by ID.
 *
 * @param statementId - ID of the statement
 * @returns Statement or undefined if not found
 */
export async function fetchStatement(statementId: string): Promise<SelectStatement | undefined> {
  const results = await db.select().from(statements).where(eq(statements.id, statementId)).limit(1);
  return results[0];
}

/**
 * Fetches all statements for a given subject (outgoing relationships).
 *
 * @param subjectType - Type of subject ('person' or 'group')
 * @param subjectId - ID of the subject
 * @param predicateFilter - Optional filter for specific predicates
 * @returns Array of statements
 */
export async function fetchStatementsBySubject(
  subjectType: EntityType,
  subjectId: string,
  predicateFilter?: Predicate[]
): Promise<SelectStatement[]> {
  const filters: SQLWrapper[] = [eq(statements.subjectType, subjectType), eq(statements.subjectId, subjectId)];

  if (predicateFilter && predicateFilter.length > 0) {
    filters.push(inArray(statements.predicate, predicateFilter));
  }

  return await db
    .select()
    .from(statements)
    .where(and(...filters))
    .orderBy(statements.startedAt);
}

/**
 * Fetches all statements for a given object (incoming relationships).
 *
 * @param objectType - Type of object ('person' or 'group')
 * @param objectId - ID of the object
 * @param predicateFilter - Optional filter for specific predicates
 * @returns Array of statements
 */
export async function fetchStatementsByObject(
  objectType: EntityType,
  objectId: string,
  predicateFilter?: Predicate[]
): Promise<SelectStatement[]> {
  const filters: SQLWrapper[] = [eq(statements.objectType, objectType), eq(statements.objectId, objectId)];

  if (predicateFilter && predicateFilter.length > 0) {
    filters.push(inArray(statements.predicate, predicateFilter));
  }

  return await db
    .select()
    .from(statements)
    .where(and(...filters))
    .orderBy(statements.startedAt);
}

/**
 * Fetches all statements involving an entity (both as subject and object).
 *
 * @param entityType - Type of entity ('person' or 'group')
 * @param entityId - ID of the entity
 * @returns Object with outgoing and incoming statements
 */
export async function fetchStatementsByEntity(
  entityType: EntityType,
  entityId: string
): Promise<{ outgoing: SelectStatement[]; incoming: SelectStatement[] }> {
  const [outgoing, incoming] = await Promise.all([
    fetchStatementsBySubject(entityType, entityId),
    fetchStatementsByObject(entityType, entityId),
  ]);

  return { outgoing, incoming };
}

/**
 * Creates a new statement (relationship).
 *
 * @param statement - Statement data to insert
 * @returns The created statement
 * @throws Error if insertion fails
 */
export async function insertStatement(statement: InsertStatement): Promise<SelectStatement> {
  const stmts = await db.insert(statements).values(statement).returning();
  if (!stmts.length) {
    throw new Error('Failed to insert statement');
  }
  return stmts[0];
}

/**
 * Creates multiple statements in a single transaction.
 *
 * @param statementsData - Array of statement data to insert
 * @returns Array of created statements
 */
export async function insertStatements(statementsData: InsertStatement[]): Promise<SelectStatement[]> {
  if (statementsData.length === 0) return [];
  return await db.insert(statements).values(statementsData).returning();
}

/**
 * Updates an existing statement.
 *
 * @param statementId - ID of the statement to update
 * @param updates - Partial statement data to update
 * @returns Updated statement or undefined if not found
 */
export async function updateStatement(
  statementId: string,
  updates: Partial<InsertStatement>
): Promise<SelectStatement | undefined> {
  const stmts = await db.update(statements).set(updates).where(eq(statements.id, statementId)).returning();
  return stmts.length ? stmts[0] : undefined;
}

/**
 * Deletes a statement.
 *
 * @param statementId - ID of the statement to delete
 */
export async function deleteStatement(statementId: string): Promise<void> {
  await db.delete(statements).where(eq(statements.id, statementId));
}

// ============================================================================
// GRAPH DATA QUERIES (for visualization)
// ============================================================================

/**
 * Graph node representation for visualization.
 */
export interface GraphNode {
  id: string;
  name: string;
  type: EntityType;
  metadata: Record<string, unknown>;
}

/**
 * Graph link representation for visualization.
 */
export interface GraphLink {
  source: string;
  target: string;
  type: Predicate;
  metadata: Record<string, unknown>;
}

/**
 * Fetches all data for graph visualization.
 * Returns nodes (persons and groups) and links (statements).
 *
 * @param options - Filter options
 * @returns Graph data with nodes and links
 */
export async function fetchGraphData(options?: { nodeTypes?: EntityType[]; predicates?: Predicate[] }): Promise<{
  nodes: GraphNode[];
  links: GraphLink[];
  stats: { totalNodes: number; totalLinks: number; personCount: number; groupCount: number };
}> {
  const { nodeTypes = ['person', 'group'], predicates } = options || {};

  const nodes: GraphNode[] = [];
  const nodeIds = new Set<string>();

  // Fetch person profiles
  if (nodeTypes.includes('person')) {
    const personData = await db.select().from(personProfiles);
    for (const person of personData) {
      nodeIds.add(person.id);
      nodes.push({
        id: person.id,
        name: person.apelido || person.name || 'Unknown',
        type: 'person',
        metadata: {
          fullName: person.name,
          apelido: person.apelido,
          title: person.title,
          style: person.style,
          birthYear: person.birthYear,
          deathYear: person.deathYear,
          portrait: person.portrait,
          bioEn: person.bioEn,
          bioPt: person.bioPt,
        },
      });
    }
  }

  // Fetch group profiles
  if (nodeTypes.includes('group')) {
    const groupData = await db.select().from(groupProfiles);
    for (const group of groupData) {
      nodeIds.add(group.id);
      nodes.push({
        id: group.id,
        name: group.name,
        type: 'group',
        metadata: {
          style: group.style,
          foundedYear: group.foundedYear,
          logo: group.logo,
          descriptionEn: group.descriptionEn,
          descriptionPt: group.descriptionPt,
          isActive: group.isActive,
        },
      });
    }
  }

  // Fetch statements (relationships)
  let statementsData: SelectStatement[];
  if (predicates && predicates.length > 0) {
    statementsData = await db.select().from(statements).where(inArray(statements.predicate, predicates));
  } else {
    statementsData = await db.select().from(statements);
  }

  // Filter links to only include nodes that exist in the graph
  const links: GraphLink[] = [];
  for (const stmt of statementsData) {
    if (nodeIds.has(stmt.subjectId) && nodeIds.has(stmt.objectId)) {
      links.push({
        source: stmt.subjectId,
        target: stmt.objectId,
        type: stmt.predicate,
        metadata: {
          confidence: stmt.confidence,
          startedAt: stmt.startedAt,
          endedAt: stmt.endedAt,
          properties: stmt.properties,
          source: stmt.source,
        },
      });
    }
  }

  return {
    nodes,
    links,
    stats: {
      totalNodes: nodes.length,
      totalLinks: links.length,
      personCount: nodes.filter((n) => n.type === 'person').length,
      groupCount: nodes.filter((n) => n.type === 'group').length,
    },
  };
}

// ============================================================================
// ANCESTRY QUERIES (for lineage visualization)
// ============================================================================

/**
 * Fetches all ancestor IDs for a person by traversing student_of and trained_under relationships.
 * Uses a recursive CTE to walk up the lineage chain.
 *
 * @param personId - The starting person's profile ID
 * @param options - Query options
 * @param options.maxDepth - Maximum traversal depth (default: 50)
 * @param options.predicates - Predicates to follow (default: ['student_of', 'trained_under'])
 * @returns Array of unique ancestor person profile IDs (not including the starting person)
 *
 * @example
 * const ancestors = await fetchAncestorIds('person-123');
 * // Returns ['mestre-abc', 'mestre-xyz', ...]
 */
export async function fetchAncestorIds(
  personId: string,
  options?: {
    maxDepth?: number;
    predicates?: ('student_of' | 'trained_under')[];
  }
): Promise<string[]> {
  const { maxDepth = 50, predicates: predicateList = ['student_of', 'trained_under'] } = options || {};

  // Build the recursive CTE query
  // Using raw SQL for the recursive CTE as Drizzle doesn't natively support WITH RECURSIVE
  const result = await db.execute(sql`
    WITH RECURSIVE ancestors AS (
      -- Base case: direct ancestors of the starting person
      SELECT s.object_id as person_id, 1 as depth
      FROM genealogy.statements s
      WHERE s.subject_id = ${personId}
        AND s.subject_type = 'person'
        AND s.object_type = 'person'
        AND s.predicate IN (${sql.join(
          predicateList.map((p) => sql`${p}`),
          sql`, `
        )})

      UNION

      -- Recursive case: ancestors of ancestors
      SELECT s.object_id, a.depth + 1
      FROM genealogy.statements s
      JOIN ancestors a ON s.subject_id = a.person_id
      WHERE s.subject_type = 'person'
        AND s.object_type = 'person'
        AND s.predicate IN (${sql.join(
          predicateList.map((p) => sql`${p}`),
          sql`, `
        )})
        AND a.depth < ${maxDepth}
    )
    SELECT DISTINCT person_id FROM ancestors
  `);

  // Extract the IDs from the result - postgres-js returns an array-like RowList
  return (result as unknown as Array<{ person_id: string }>).map((row) => row.person_id);
}

// ============================================================================
// APELIDO UNIQUENESS CHECK
// ============================================================================

/**
 * Result of apelido uniqueness check.
 */
export type ApelidoCheckResult = {
  /** Whether the apelido (with context) is available */
  isAvailable: boolean;
  /** Whether context is required (apelido exists in genealogy) */
  requiresContext: boolean;
};

/**
 * Checks if an apelido (with optional context) is available for use.
 *
 * The database has a unique constraint on (apelido, COALESCE(apelido_context, '')).
 * This function checks:
 * 1. If the exact combination is already taken
 * 2. If the apelido exists (to suggest user adds context)
 *
 * @param apelido - The apelido to check
 * @param apelidoContext - Optional context to disambiguate
 * @param excludeProfileId - Profile ID to exclude (for edits)
 * @returns Availability status
 */
export async function checkApelidoAvailability(
  apelido: string,
  apelidoContext?: string | null,
  excludeProfileId?: string
): Promise<ApelidoCheckResult> {
  // Find all profiles with the same apelido
  const filters: SQLWrapper[] = [eq(personProfiles.apelido, apelido)];

  if (excludeProfileId) {
    filters.push(sql`${personProfiles.id} != ${excludeProfileId}`);
  }

  const existingProfiles = await db
    .select({
      apelidoContext: personProfiles.apelidoContext,
    })
    .from(personProfiles)
    .where(and(...filters));

  if (existingProfiles.length === 0) {
    // No profiles with this apelido - it's available
    return {
      isAvailable: true,
      requiresContext: false,
    };
  }

  // Check if the exact combination (apelido, context) is taken
  // Using COALESCE to match the database constraint behavior
  const normalizedContext = apelidoContext || '';
  const exactMatch = existingProfiles.find((p) => (p.apelidoContext || '') === normalizedContext);

  if (exactMatch) {
    // Exact combination is taken
    return {
      isAvailable: false,
      requiresContext: !apelidoContext, // If no context provided, suggest adding one
    };
  }

  // Apelido exists but with different context - available but context recommended
  return {
    isAvailable: true,
    requiresContext: !apelidoContext, // Suggest context if not provided
  };
}

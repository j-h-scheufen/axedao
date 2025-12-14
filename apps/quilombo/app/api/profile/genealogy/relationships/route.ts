/**
 * @openapi
 * /api/profile/genealogy/relationships:
 *   post:
 *     summary: Add a relationship for the current user's genealogy profile
 *     description: |
 *       Creates a new statement (relationship) where the user's profile is the subject.
 *       All relationships are created with confidence level 'unverified'.
 *       User must have an existing genealogy profile.
 *     tags:
 *       - Profile
 *       - Genealogy
 *       - Relationships
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - predicate
 *               - objectType
 *               - objectId
 *             properties:
 *               predicate:
 *                 type: string
 *                 enum: [student_of, trained_under, influenced_by, family_of, member_of, associated_with, departed_from]
 *                 description: The relationship type (person-to-person or person-to-group predicates only)
 *               objectType:
 *                 type: string
 *                 enum: [person, group]
 *                 description: The type of entity being related to
 *               objectId:
 *                 type: string
 *                 format: uuid
 *                 description: The ID of the person or group profile
 *               startedAt:
 *                 type: string
 *                 format: date
 *                 nullable: true
 *                 description: When the relationship started (YYYY-MM-DD)
 *               endedAt:
 *                 type: string
 *                 format: date
 *                 nullable: true
 *                 description: When the relationship ended (YYYY-MM-DD)
 *               properties:
 *                 type: object
 *                 nullable: true
 *                 description: Additional predicate-specific properties (e.g., relationship_type for family_of)
 *     responses:
 *       200:
 *         description: Relationship created successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 id:
 *                   type: string
 *                 message:
 *                   type: string
 *       400:
 *         description: Validation error or user has no profile
 *       401:
 *         description: Unauthorized
 *       404:
 *         description: Target person/group not found
 *       500:
 *         description: Server error
 *
 *   get:
 *     summary: Get all relationships for the current user's genealogy profile
 *     description: |
 *       Fetches all statements where the user's profile is the subject (outgoing relationships).
 *       Returns relationships with details about the target person/group.
 *     tags:
 *       - Profile
 *       - Genealogy
 *       - Relationships
 *     responses:
 *       200:
 *         description: List of relationships
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 type: object
 *                 properties:
 *                   id:
 *                     type: string
 *                   predicate:
 *                     type: string
 *                   objectType:
 *                     type: string
 *                   objectId:
 *                     type: string
 *                   objectName:
 *                     type: string
 *                   confidence:
 *                     type: string
 *                   startedAt:
 *                     type: string
 *                   endedAt:
 *                     type: string
 *       401:
 *         description: Unauthorized
 *       404:
 *         description: User has no genealogy profile
 *       500:
 *         description: Server error
 */

import { getServerSession } from 'next-auth';
import { NextResponse } from 'next/server';
import { object, string } from 'yup';

import { nextAuthOptions } from '@/config/next-auth-options';
import { entityTypes, SELF_DECLARED_CONFIDENCE } from '@/config/constants';
import { fetchUser, insertStatement, fetchStatementsBySubject, fetchPersonProfile, fetchGroupProfile } from '@/db';
import type { EntityType, Predicate, StatementProperties } from '@/db/schema/genealogy';

// Person-to-Person and Person-to-Group predicates that users can self-declare
const ALLOWED_PREDICATES: Predicate[] = [
  'student_of',
  'trained_under',
  'influenced_by',
  'family_of',
  'member_of',
  'associated_with',
  'departed_from',
];

const addRelationshipSchema = object().shape({
  predicate: string().oneOf(ALLOWED_PREDICATES, 'Invalid predicate').required('Predicate is required'),
  objectType: string().oneOf(entityTypes, 'Invalid entity type').required('Object type is required'),
  objectId: string().uuid('Invalid object ID').required('Object ID is required'),
  startedAt: string().nullable(),
  endedAt: string().nullable(),
  properties: object().nullable(),
});

/**
 * POST - Add a new relationship
 */
export async function POST(request: Request) {
  try {
    const session = await getServerSession(nextAuthOptions);
    if (!session?.user.id) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    const body = await request.json();
    const data = await addRelationshipSchema.validate(body, { abortEarly: true });

    // Fetch current user to get their profileId
    const user = await fetchUser(session.user.id);
    if (!user || !user.profileId) {
      return NextResponse.json(
        { error: 'User has no genealogy profile. Publish your profile first.' },
        { status: 400 }
      );
    }

    // Verify that the target person/group exists
    if (data.objectType === 'person') {
      const targetPerson = await fetchPersonProfile(data.objectId);
      if (!targetPerson) {
        return NextResponse.json({ error: 'Target person not found' }, { status: 404 });
      }
    } else {
      const targetGroup = await fetchGroupProfile(data.objectId);
      if (!targetGroup) {
        return NextResponse.json({ error: 'Target group not found' }, { status: 404 });
      }
    }

    // Create the statement
    const statement = await insertStatement({
      subjectType: 'person',
      subjectId: user.profileId,
      predicate: data.predicate as Predicate,
      objectType: data.objectType as EntityType,
      objectId: data.objectId,
      startedAt: data.startedAt || null,
      endedAt: data.endedAt || null,
      properties: (data.properties as StatementProperties) || {},
      confidence: SELF_DECLARED_CONFIDENCE,
      createdBy: session.user.id,
    });

    return NextResponse.json({
      id: statement.id,
      message: 'Relationship added successfully',
    });
  } catch (error) {
    console.error('Error adding relationship:', error);
    if (error instanceof Error && error.name === 'ValidationError') {
      return NextResponse.json({ error: error.message }, { status: 400 });
    }
    return NextResponse.json({ error: 'Failed to add relationship' }, { status: 500 });
  }
}

/**
 * GET - Fetch all relationships for current user's profile
 */
export async function GET() {
  try {
    const session = await getServerSession(nextAuthOptions);
    if (!session?.user.id) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    const user = await fetchUser(session.user.id);
    if (!user || !user.profileId) {
      return NextResponse.json({ error: 'User has no genealogy profile' }, { status: 404 });
    }

    // Fetch all statements where user's profile is the subject
    const statements = await fetchStatementsBySubject('person', user.profileId);

    // Enrich with object names
    const enrichedStatements = await Promise.all(
      statements.map(async (stmt) => {
        let objectName = 'Unknown';
        if (stmt.objectType === 'person') {
          const person = await fetchPersonProfile(stmt.objectId);
          objectName = person?.apelido || person?.name || 'Unknown';
        } else if (stmt.objectType === 'group') {
          const group = await fetchGroupProfile(stmt.objectId);
          objectName = group?.name || 'Unknown';
        }

        return {
          ...stmt,
          objectName,
        };
      })
    );

    return NextResponse.json(enrichedStatements);
  } catch (error) {
    console.error('Error fetching relationships:', error);
    return NextResponse.json({ error: 'Failed to fetch relationships' }, { status: 500 });
  }
}

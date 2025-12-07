import { type NextRequest, NextResponse } from 'next/server';

import { fetchPersonProfile, fetchStatementsByEntity } from '@/db';

/**
 * @openapi
 * /api/genealogy/persons/{personId}:
 *   get:
 *     summary: Get a person profile by ID
 *     description: Retrieves a single person profile from the genealogy schema with optional relationships
 *     tags:
 *       - Genealogy
 *     parameters:
 *       - in: path
 *         name: personId
 *         required: true
 *         schema:
 *           type: string
 *           format: uuid
 *         description: The person profile ID
 *       - in: query
 *         name: includeRelationships
 *         required: false
 *         schema:
 *           type: boolean
 *         description: Whether to include relationships (statements) for this person
 *     responses:
 *       200:
 *         description: Person profile found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 data:
 *                   $ref: '#/components/schemas/PersonProfile'
 *                 relationships:
 *                   type: object
 *                   properties:
 *                     outgoing:
 *                       type: array
 *                       items:
 *                         $ref: '#/components/schemas/Statement'
 *                     incoming:
 *                       type: array
 *                       items:
 *                         $ref: '#/components/schemas/Statement'
 *       404:
 *         description: Person profile not found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       500:
 *         description: Server error
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 */
export async function GET(request: NextRequest, { params }: { params: Promise<{ personId: string }> }) {
  try {
    const { personId } = await params;
    const { searchParams } = new URL(request.url);
    const includeRelationships = searchParams.get('includeRelationships') === 'true';

    const person = await fetchPersonProfile(personId);

    if (!person) {
      return NextResponse.json({ error: 'Person profile not found' }, { status: 404 });
    }

    if (includeRelationships) {
      const relationships = await fetchStatementsByEntity('person', personId);
      return Response.json({ data: person, relationships });
    }

    return Response.json({ data: person });
  } catch (error) {
    console.error('Error fetching person profile:', error);
    return NextResponse.json({ error: 'Failed to fetch person profile' }, { status: 500 });
  }
}

/**
 * @openapi
 * /api/profile/genealogy/relationships/{statementId}:
 *   delete:
 *     summary: Delete a relationship from the current user's genealogy profile
 *     description: |
 *       Deletes a statement (relationship) where the user's profile is the subject.
 *       Only the user who created the statement can delete it.
 *     tags:
 *       - Profile
 *       - Genealogy
 *       - Relationships
 *     parameters:
 *       - in: path
 *         name: statementId
 *         required: true
 *         schema:
 *           type: string
 *           format: uuid
 *         description: The ID of the statement to delete
 *     responses:
 *       200:
 *         description: Relationship deleted successfully
 *       401:
 *         description: Unauthorized
 *       403:
 *         description: Not authorized to delete this relationship
 *       404:
 *         description: Relationship not found
 *       500:
 *         description: Server error
 */

import { getServerSession } from 'next-auth';
import { NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { deleteStatement, fetchStatement, fetchUser } from '@/db';

type RouteContext = {
  params: Promise<{ statementId: string }>;
};

/**
 * DELETE - Delete a relationship
 */
export async function DELETE(_request: Request, context: RouteContext) {
  try {
    const session = await getServerSession(nextAuthOptions);
    if (!session?.user.id) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
    }

    const { statementId } = await context.params;

    // Fetch the statement to verify ownership
    const statement = await fetchStatement(statementId);
    if (!statement) {
      return NextResponse.json({ error: 'Relationship not found' }, { status: 404 });
    }

    // Fetch current user to verify they own the subject profile
    const user = await fetchUser(session.user.id);
    if (!user || !user.profileId) {
      return NextResponse.json({ error: 'User has no genealogy profile' }, { status: 404 });
    }

    // Verify that the user owns the subject profile
    if (statement.subjectId !== user.profileId) {
      return NextResponse.json({ error: 'Not authorized to delete this relationship' }, { status: 403 });
    }

    // Delete the statement
    await deleteStatement(statementId);

    return NextResponse.json({ message: 'Relationship deleted successfully' });
  } catch (error) {
    console.error('Error deleting relationship:', error);
    return NextResponse.json({ error: 'Failed to delete relationship' }, { status: 500 });
  }
}

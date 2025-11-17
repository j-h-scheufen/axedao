import { getServerSession } from 'next-auth';
import { type NextRequest, NextResponse } from 'next/server';

import { nextAuthOptions } from '@/config/next-auth-options';
import { getDistinctCountryCodes } from '@/db';

/**
 * @openapi
 * /api/groups/countries:
 *   get:
 *     summary: Get list of country codes where groups exist
 *     description: Returns distinct ISO 3166-1 alpha-2 country codes from group locations
 *     tags:
 *       - Groups
 *     responses:
 *       200:
 *         description: List of country codes
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 countryCodes:
 *                   type: array
 *                   items:
 *                     type: string
 *                     pattern: ^[A-Z]{2}$
 *                   example: ['BR', 'US', 'PT', 'FR', 'DE']
 *       401:
 *         description: Unauthorized - no active session
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
export async function GET(_request: NextRequest) {
  // Check for active session
  const session = await getServerSession(nextAuthOptions);
  if (!session?.user?.id) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  try {
    const countryCodes = await getDistinctCountryCodes();
    return Response.json({ countryCodes });
  } catch (error) {
    console.error('Error fetching country codes:', error);
    return NextResponse.json({ error: 'Failed to fetch country codes' }, { status: 500 });
  }
}

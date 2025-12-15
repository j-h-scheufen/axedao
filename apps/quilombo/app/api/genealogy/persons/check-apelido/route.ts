import { type NextRequest, NextResponse } from 'next/server';
import { object, string } from 'yup';

import { checkApelidoAvailability } from '@/db';

const checkApelidoSchema = object({
  apelido: string().required('Apelido is required'),
  apelidoContext: string().nullable(),
  excludeProfileId: string().uuid('Invalid profile ID').nullable(),
});

/**
 * @openapi
 * /api/genealogy/persons/check-apelido:
 *   post:
 *     summary: Check apelido availability
 *     description: |
 *       Checks if an apelido (with optional context) is available for use.
 *       The database has a unique constraint on (apelido, COALESCE(apelido_context, '')).
 *       This endpoint checks both the exact combination and suggests when context is needed.
 *       Requires authentication.
 *     tags:
 *       - Genealogy
 *     security:
 *       - session: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - apelido
 *             properties:
 *               apelido:
 *                 type: string
 *                 description: The apelido to check
 *                 example: "Mestre Cobra"
 *               apelidoContext:
 *                 type: string
 *                 nullable: true
 *                 description: Optional context to disambiguate (e.g., "Salvador", "Rio de Janeiro")
 *                 example: "Salvador (Senzala)"
 *               excludeProfileId:
 *                 type: string
 *                 format: uuid
 *                 nullable: true
 *                 description: Profile ID to exclude from check (for edits)
 *     responses:
 *       200:
 *         description: Availability check result
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 isAvailable:
 *                   type: boolean
 *                   description: Whether the apelido (with context) is available
 *                 requiresContext:
 *                   type: boolean
 *                   description: Whether context is required (apelido exists in genealogy)
 *       400:
 *         description: Invalid request
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       500:
 *         description: Server error
 */
export async function POST(request: NextRequest) {
  try {
    const body = await request.json();

    // Validate request body
    let params: { apelido: string; apelidoContext?: string | null; excludeProfileId?: string | null };
    try {
      params = await checkApelidoSchema.validate(body);
    } catch (error) {
      console.error('Validation error:', error);
      const message =
        error && typeof error === 'object' && 'errors' in error && Array.isArray(error.errors)
          ? error.errors[0]
          : 'Invalid request';
      return NextResponse.json({ error: message }, { status: 400 });
    }

    const result = await checkApelidoAvailability(
      params.apelido,
      params.apelidoContext,
      params.excludeProfileId || undefined
    );

    return Response.json(result);
  } catch (error) {
    console.error('Error checking apelido availability:', error);
    return NextResponse.json({ error: 'Failed to check apelido availability' }, { status: 500 });
  }
}

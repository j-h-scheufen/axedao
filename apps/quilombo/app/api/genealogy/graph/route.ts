import { type NextRequest, NextResponse } from 'next/server';

import { entityTypes, predicates } from '@/config/constants';
import { fetchGraphData } from '@/db';
import type { EntityType, Predicate } from '@/db/schema/genealogy';

/**
 * @openapi
 * /api/genealogy/graph:
 *   get:
 *     summary: Get graph data for visualization
 *     description: Retrieves all nodes (persons and groups) and links (statements) for graph visualization
 *     tags:
 *       - Genealogy
 *     parameters:
 *       - in: query
 *         name: nodeTypes
 *         required: false
 *         schema:
 *           type: string
 *         description: Comma-separated list of node types to include (person, group). Defaults to both.
 *         example: "person,group"
 *       - in: query
 *         name: predicates
 *         required: false
 *         schema:
 *           type: string
 *         description: Comma-separated list of predicates to filter relationships
 *         example: "student_of,founded,leads"
 *     responses:
 *       200:
 *         description: Graph data
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 nodes:
 *                   type: array
 *                   items:
 *                     type: object
 *                     properties:
 *                       id:
 *                         type: string
 *                       name:
 *                         type: string
 *                       type:
 *                         type: string
 *                         enum: [person, group]
 *                       metadata:
 *                         type: object
 *                 links:
 *                   type: array
 *                   items:
 *                     type: object
 *                     properties:
 *                       source:
 *                         type: string
 *                       target:
 *                         type: string
 *                       type:
 *                         type: string
 *                       metadata:
 *                         type: object
 *                 stats:
 *                   type: object
 *                   properties:
 *                     totalNodes:
 *                       type: number
 *                     totalLinks:
 *                       type: number
 *                     personCount:
 *                       type: number
 *                     groupCount:
 *                       type: number
 *       400:
 *         description: Invalid parameters
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
export async function GET(request: NextRequest) {
  try {
    const { searchParams } = new URL(request.url);

    // Parse nodeTypes from query string
    const nodeTypesParam = searchParams.get('nodeTypes');
    let nodeTypes: EntityType[] | undefined;
    if (nodeTypesParam) {
      const types = nodeTypesParam.split(',').map((t) => t.trim());
      // Validate each type
      for (const type of types) {
        if (!entityTypes.includes(type as EntityType)) {
          return NextResponse.json(
            { error: `Invalid node type: ${type}. Must be one of: ${entityTypes.join(', ')}` },
            { status: 400 }
          );
        }
      }
      nodeTypes = types as EntityType[];
    }

    // Parse predicates from query string
    const predicatesParam = searchParams.get('predicates');
    let predicateFilter: Predicate[] | undefined;
    if (predicatesParam) {
      const preds = predicatesParam.split(',').map((p) => p.trim());
      // Validate each predicate
      for (const pred of preds) {
        if (!predicates.includes(pred as Predicate)) {
          return NextResponse.json(
            { error: `Invalid predicate: ${pred}. Must be one of: ${predicates.join(', ')}` },
            { status: 400 }
          );
        }
      }
      predicateFilter = preds as Predicate[];
    }

    const graphData = await fetchGraphData({
      nodeTypes,
      predicates: predicateFilter,
    });

    return Response.json(graphData);
  } catch (error) {
    console.error('Error fetching graph data:', error);
    return NextResponse.json({ error: 'Failed to fetch graph data' }, { status: 500 });
  }
}

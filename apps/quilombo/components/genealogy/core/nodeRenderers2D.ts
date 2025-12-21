/**
 * Node rendering utilities for 2D graph visualization.
 *
 * Provides functions for drawing nodes to canvas context.
 */

import type { GraphNode, GroupMetadata, PersonMetadata } from '@/components/genealogy/types';
import { NODE_COLORS } from '@/components/genealogy/types';
import type { ForceNode2D } from './types2d';

/** Visual indicator opacity for nodes without known dates */
const UNKNOWN_DATE_OPACITY = 0.6;

/** Opacity multiplier for dimmed nodes (when highlighting lineage) */
const DIMMED_OPACITY_MULTIPLIER = 0.3;

/** Base radius for person nodes */
const PERSON_RADIUS = 4;

/** Base radius for group nodes */
const GROUP_RADIUS = 6;

/**
 * Get node color based on type and style/title.
 */
export function getNodeColor(node: GraphNode): string {
  if (node.type === 'person') {
    const metadata = node.metadata as PersonMetadata;
    const title = metadata.title as keyof (typeof NODE_COLORS)['person'] | undefined;
    return title && NODE_COLORS.person[title] ? NODE_COLORS.person[title] : NODE_COLORS.person.default;
  }

  if (node.type === 'group') {
    const metadata = node.metadata as GroupMetadata;
    const style = metadata.style as keyof (typeof NODE_COLORS)['group'] | undefined;
    return style && NODE_COLORS.group[style] ? NODE_COLORS.group[style] : NODE_COLORS.group.default;
  }

  return '#868E96';
}

/**
 * Get display label for a node (title + apelido for persons, name for groups).
 */
export function getNodeLabel(node: GraphNode): string {
  if (node.type === 'person') {
    const metadata = node.metadata as PersonMetadata;
    const title = metadata.title ? metadata.title.charAt(0).toUpperCase() + metadata.title.slice(1) : '';
    const apelido = metadata.apelido || node.name;
    return title ? `${title} ${apelido}` : apelido;
  }
  return node.name;
}

/**
 * Convert hex color to rgba with alpha.
 */
function hexToRgba(hex: string, alpha: number): string {
  const result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
  if (!result) return `rgba(128, 128, 128, ${alpha})`;

  const r = Number.parseInt(result[1], 16);
  const g = Number.parseInt(result[2], 16);
  const b = Number.parseInt(result[3], 16);
  return `rgba(${r}, ${g}, ${b}, ${alpha})`;
}

/**
 * Options for drawing a node.
 */
export interface DrawNodeOptions {
  /** Whether the node should be dimmed (for lineage highlighting) */
  isDimmed?: boolean;
  /** Scale factor for node size (default: 1.0) */
  scale?: number;
  /** Whether to show the text label */
  showLabel?: boolean;
}

/**
 * Draw a node to the canvas.
 *
 * This is the main node rendering function for 2D graphs.
 * It handles selection state, dimming, and visual indicators.
 */
export function drawNode2D(
  node: ForceNode2D,
  ctx: CanvasRenderingContext2D,
  globalScale: number,
  isSelected: boolean,
  options: DrawNodeOptions = {}
): void {
  const { isDimmed = false, scale = 1.0, showLabel = true } = options;

  if (node.x === undefined || node.y === undefined) return;

  const color = getNodeColor(node);
  const baseRadius = node.type === 'group' ? GROUP_RADIUS : PERSON_RADIUS;
  const radius = baseRadius * scale;
  const hasTemporalData = node.hasTemporalData !== false;

  ctx.save();

  // Calculate opacity
  let baseOpacity = hasTemporalData ? 0.85 : UNKNOWN_DATE_OPACITY;
  if (isDimmed && !isSelected) {
    baseOpacity *= DIMMED_OPACITY_MULTIPLIER;
  }
  const nodeOpacity = isSelected ? 1.0 : baseOpacity;

  // Draw selection glow
  if (isSelected) {
    ctx.beginPath();
    ctx.arc(node.x, node.y, radius * 1.5, 0, 2 * Math.PI);
    ctx.fillStyle = 'rgba(255, 255, 255, 0.3)';
    ctx.fill();
  }

  // Draw ring indicator for nodes without temporal data
  if (!hasTemporalData) {
    ctx.beginPath();
    ctx.arc(node.x, node.y, radius * 1.6, 0, 2 * Math.PI);
    ctx.strokeStyle = hexToRgba('#ffffff', 0.4 * nodeOpacity);
    ctx.lineWidth = 2 / globalScale;
    ctx.stroke();
  }

  // Draw main circle
  ctx.beginPath();
  ctx.arc(node.x, node.y, radius, 0, 2 * Math.PI);
  ctx.fillStyle = hexToRgba(color, nodeOpacity);
  ctx.fill();

  // Draw selection ring
  if (isSelected) {
    ctx.beginPath();
    ctx.arc(node.x, node.y, radius + 2 / globalScale, 0, 2 * Math.PI);
    ctx.strokeStyle = 'rgba(255, 255, 255, 0.8)';
    ctx.lineWidth = 2 / globalScale;
    ctx.stroke();
  }

  // Draw label
  if (showLabel) {
    const label = getNodeLabel(node);
    const fontSize = Math.max(10 / globalScale, 3);
    ctx.font = `bold ${fontSize}px Arial`;
    ctx.textAlign = 'center';
    ctx.textBaseline = 'top';

    // Label background for readability
    const metrics = ctx.measureText(label);
    const labelY = node.y + radius + 4 / globalScale;
    const bgPadding = 2 / globalScale;

    ctx.fillStyle = hexToRgba('#1a1a2e', 0.7 * nodeOpacity);
    ctx.fillRect(
      node.x - metrics.width / 2 - bgPadding,
      labelY - bgPadding,
      metrics.width + bgPadding * 2,
      fontSize + bgPadding * 2
    );

    // Label text
    const labelOpacity = isDimmed && !isSelected ? DIMMED_OPACITY_MULTIPLIER : 1.0;
    ctx.fillStyle = hexToRgba('#ffffff', labelOpacity);
    ctx.fillText(label, node.x, labelY);
  }

  ctx.restore();
}

/**
 * Draw the default node object for react-force-graph-2d.
 *
 * This is the callback function passed to nodeCanvasObject prop.
 * The node parameter already has x, y set by the force simulation.
 */
export function createNodeCanvasObject(
  selectedNodeId: string | null,
  highlightedNodeIds: ReadonlySet<string> | undefined,
  nodeScale: number = 1.0
) {
  return (node: ForceNode2D, ctx: CanvasRenderingContext2D, globalScale: number) => {
    const isSelected = node.id === selectedNodeId;
    const isDimmed = highlightedNodeIds ? !highlightedNodeIds.has(node.id) : false;

    drawNode2D(node, ctx, globalScale, isSelected, {
      isDimmed,
      scale: nodeScale,
      showLabel: true,
    });
  };
}

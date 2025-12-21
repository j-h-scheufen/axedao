/**
 * Era ring rendering utilities for 2D graph visualization.
 *
 * Draws concentric rings representing time periods (decades) on canvas.
 * Used as background layer in the student-ancestry view.
 */

import { ERA_CONFIG, getEraBand, type TemporalLayout } from './temporalLayout';

// ============================================================================
// CONFIGURATION
// ============================================================================

const RING_CONFIG = {
  lineColor: 'rgba(136, 136, 136, 0.5)',
  lineWidth: 1,
  labelFontSize: 12,
  labelColor: 'rgba(200, 200, 200, 0.9)',
  labelBackgroundColor: 'rgba(26, 26, 46, 0.75)',
  labelPadding: 4,
  labelOffset: 12, // Distance from ring to label
  labelAngle: -Math.PI / 6, // 30 degrees counterclockwise from horizontal (top-right)
} as const;

const SLAVERY_ERA_CONFIG = {
  abolitionYear: 1888,
  discColor: 'rgba(61, 40, 23, 0.18)',
  abolitionRingColor: 'rgba(201, 162, 39, 0.85)',
  abolitionRingWidth: 2,
  abolitionLabel: 'Abolição (1888)',
  labelColor: 'rgba(201, 162, 39, 0.95)',
} as const;

// ============================================================================
// ERA RING DATA
// ============================================================================

interface EraRing {
  id: string;
  label: string;
  radius: number;
  band: number;
}

/**
 * Generate era ring definitions from temporal layout.
 */
function generateEraRings(layout: TemporalLayout): EraRing[] {
  const rings: EraRing[] = [];

  // Foundation era rings (1800, 1850, 1875)
  for (const era of ERA_CONFIG.foundation) {
    if (era.startYear === -Infinity) continue; // Skip Pre-1800
    rings.push({
      id: `era-ring-${era.band}`,
      label: era.label,
      radius: layout.computeRadialDistanceForYear(era.startYear),
      band: era.band,
    });
  }

  // Decade rings (1900s-2020s)
  for (let decade = 1900; decade <= 2020; decade += 10) {
    const band = getEraBand(decade);
    rings.push({
      id: `era-ring-${band}`,
      label: `${decade}s`,
      radius: layout.computeRadialDistanceForYear(decade),
      band,
    });
  }

  return rings;
}

// ============================================================================
// CANVAS DRAWING
// ============================================================================

/**
 * Draw a text label with background.
 */
function drawLabel(
  ctx: CanvasRenderingContext2D,
  text: string,
  x: number,
  y: number,
  globalScale: number,
  color: string = RING_CONFIG.labelColor,
  backgroundColor: string = RING_CONFIG.labelBackgroundColor
): void {
  const fontSize = RING_CONFIG.labelFontSize / globalScale;
  const padding = RING_CONFIG.labelPadding / globalScale;

  ctx.font = `bold ${fontSize}px Arial`;
  const metrics = ctx.measureText(text);

  // Draw background
  ctx.fillStyle = backgroundColor;
  ctx.fillRect(x - padding, y - fontSize / 2 - padding, metrics.width + padding * 2, fontSize + padding * 2);

  // Draw text
  ctx.fillStyle = color;
  ctx.textAlign = 'left';
  ctx.textBaseline = 'middle';
  ctx.fillText(text, x, y);
}

/**
 * Draw the slavery era visualization (filled disc + abolition ring).
 */
function drawSlaveryEra(ctx: CanvasRenderingContext2D, layout: TemporalLayout, globalScale: number): void {
  const abolitionRadius = layout.computeRadialDistanceForYear(SLAVERY_ERA_CONFIG.abolitionYear);

  // Draw filled disc for slavery period (1700-1888)
  ctx.beginPath();
  ctx.arc(0, 0, abolitionRadius, 0, 2 * Math.PI);
  ctx.fillStyle = SLAVERY_ERA_CONFIG.discColor;
  ctx.fill();

  // Draw abolition ring (golden circle at 1888)
  ctx.beginPath();
  ctx.arc(0, 0, abolitionRadius, 0, 2 * Math.PI);
  ctx.strokeStyle = SLAVERY_ERA_CONFIG.abolitionRingColor;
  ctx.lineWidth = SLAVERY_ERA_CONFIG.abolitionRingWidth / globalScale;
  ctx.stroke();

  // Draw abolition label along the same angled line as other labels
  const angle = RING_CONFIG.labelAngle;
  const labelDistance = abolitionRadius + RING_CONFIG.labelOffset / globalScale;
  const labelX = labelDistance * Math.cos(angle);
  const labelY = labelDistance * Math.sin(angle);
  drawLabel(ctx, SLAVERY_ERA_CONFIG.abolitionLabel, labelX, labelY, globalScale, SLAVERY_ERA_CONFIG.labelColor);
}

/**
 * Draw era rings (decade circles with labels).
 * Labels are positioned along a diagonal line (bottom-right) to prevent overlap.
 */
function drawEraRingCircles(ctx: CanvasRenderingContext2D, rings: EraRing[], globalScale: number): void {
  const angle = RING_CONFIG.labelAngle;
  const cosAngle = Math.cos(angle);
  const sinAngle = Math.sin(angle);

  for (const ring of rings) {
    // Draw ring circle
    ctx.beginPath();
    ctx.arc(0, 0, ring.radius, 0, 2 * Math.PI);
    ctx.strokeStyle = RING_CONFIG.lineColor;
    ctx.lineWidth = RING_CONFIG.lineWidth / globalScale;
    ctx.stroke();

    // Position label along the angled line from center
    const labelDistance = ring.radius + RING_CONFIG.labelOffset / globalScale;
    const labelX = labelDistance * cosAngle;
    const labelY = labelDistance * sinAngle;
    drawLabel(ctx, ring.label, labelX, labelY, globalScale);
  }
}

/**
 * Main function to draw all era rings and decorations.
 *
 * This should be called in the onRenderFramePre callback of ForceGraph2D
 * so that era rings appear behind nodes and links.
 *
 * @param ctx - Canvas 2D rendering context
 * @param layout - Temporal layout for computing radii
 * @param globalScale - Current zoom scale (for consistent line widths)
 */
export function drawEraRings2D(ctx: CanvasRenderingContext2D, layout: TemporalLayout, globalScale: number): void {
  ctx.save();

  // Draw slavery era first (background)
  drawSlaveryEra(ctx, layout, globalScale);

  // Generate and draw era rings
  const rings = generateEraRings(layout);
  drawEraRingCircles(ctx, rings, globalScale);

  ctx.restore();
}

/**
 * Create a canvas renderer callback for era rings.
 *
 * Use this to create the onRenderFramePre callback for ForceGraph2D.
 *
 * @param layout - Temporal layout for computing radii
 * @returns Callback function for canvas rendering
 */
export function createEraRingsRenderer(layout: TemporalLayout) {
  return (ctx: CanvasRenderingContext2D, globalScale: number) => {
    drawEraRings2D(ctx, layout, globalScale);
  };
}

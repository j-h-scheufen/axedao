/**
 * Node rendering utilities for 3D graph visualization.
 *
 * Provides factory functions for creating THREE.js objects to represent nodes.
 */

import * as THREE from 'three';

import type { GraphNode, GroupMetadata, PersonMetadata } from '@/components/genealogy/types';
import { NODE_COLORS } from '@/components/genealogy/types';
import type { ForceNode } from './types';

/** Visual indicator opacity for nodes without known dates */
const UNKNOWN_DATE_OPACITY = 0.6;

/** Opacity multiplier for dimmed nodes (when highlighting lineage) */
const DIMMED_OPACITY_MULTIPLIER = 0.5;

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
 * Create a text sprite for labels.
 * Uses depthTest: false and high renderOrder to ensure labels render on top of links.
 */
export function createTextSprite(
  text: string,
  fontSize: number = 12,
  textColor: string = 'white',
  backgroundColor?: string,
  opacity: number = 1.0
): THREE.Sprite {
  const canvas = document.createElement('canvas');
  const context = canvas.getContext('2d') as CanvasRenderingContext2D;

  // Set canvas size based on text
  context.font = `bold ${fontSize * 4}px Arial`;
  const metrics = context.measureText(text);
  const textWidth = metrics.width;

  canvas.width = textWidth + 20;
  canvas.height = fontSize * 6;

  // Draw background if specified (for link labels)
  if (backgroundColor) {
    context.fillStyle = backgroundColor;
    context.globalAlpha = 0.7;
    context.fillRect(0, 0, canvas.width, canvas.height);
    context.globalAlpha = 1.0;
  }

  // Draw text
  context.font = `bold ${fontSize * 4}px Arial`;
  context.fillStyle = textColor;
  context.textAlign = 'center';
  context.textBaseline = 'middle';
  context.fillText(text, canvas.width / 2, canvas.height / 2);

  const texture = new THREE.CanvasTexture(canvas);
  texture.needsUpdate = true;

  const material = new THREE.SpriteMaterial({
    map: texture,
    transparent: true,
    opacity,
    depthTest: false, // Always render on top of other objects
    depthWrite: false, // Don't write to depth buffer
  });

  const sprite = new THREE.Sprite(material);
  sprite.scale.set(canvas.width / 10, canvas.height / 10, 1);
  sprite.renderOrder = 999; // Ensure labels render last (on top of links)

  return sprite;
}

/**
 * Options for creating a default node object.
 */
export interface DefaultNodeOptions {
  /** Radius of the sphere (default: 4 for persons, 6 for groups) */
  sphereRadius?: number;
  /** Whether to show the text label below the node */
  showLabel?: boolean;
  /** Font size for the label */
  labelFontSize?: number;
  /** Whether the node should be dimmed (for lineage highlighting) */
  isDimmed?: boolean;
}

/**
 * Create the default node object: sphere with optional text label underneath.
 */
export function createDefaultNodeObject(
  node: ForceNode,
  isSelected: boolean,
  options: DefaultNodeOptions = {}
): THREE.Group {
  const { showLabel = true, labelFontSize = 14, isDimmed = false } = options;

  const color = getNodeColor(node);
  const sphereRadius = options.sphereRadius ?? (node.type === 'group' ? 6 : 4);
  const hasTemporalData = node.hasTemporalData !== false; // Default to true if undefined

  // Create a group to hold sphere and label
  const group = new THREE.Group();

  // Create sphere - reduce opacity for nodes without temporal data
  // Apply additional dimming for lineage highlighting mode
  const geometry = new THREE.SphereGeometry(sphereRadius, 16, 16);
  let baseOpacity = hasTemporalData ? 0.85 : UNKNOWN_DATE_OPACITY;
  if (isDimmed && !isSelected) {
    baseOpacity *= DIMMED_OPACITY_MULTIPLIER;
  }
  const material = new THREE.MeshLambertMaterial({
    color: color,
    transparent: true,
    opacity: isSelected ? 1.0 : baseOpacity,
  });
  const sphere = new THREE.Mesh(geometry, material);

  // Add emissive glow for selected node
  if (isSelected) {
    const glowMaterial = new THREE.MeshBasicMaterial({
      color: 0xffffff,
      transparent: true,
      opacity: 0.3,
    });
    const glowSphere = new THREE.Mesh(new THREE.SphereGeometry(sphereRadius * 1.3, 16, 16), glowMaterial);
    group.add(glowSphere);
  }

  // Add ring indicator for nodes without temporal data
  if (!hasTemporalData) {
    const ringGeometry = new THREE.RingGeometry(sphereRadius * 1.4, sphereRadius * 1.6, 16);
    const ringMaterial = new THREE.MeshBasicMaterial({
      color: 0xffffff,
      transparent: true,
      opacity: 0.4,
      side: THREE.DoubleSide,
    });
    const ring = new THREE.Mesh(ringGeometry, ringMaterial);
    group.add(ring);
  }

  group.add(sphere);

  // Create text label
  if (showLabel) {
    const label = getNodeLabel(node);
    const labelOpacity = isDimmed && !isSelected ? DIMMED_OPACITY_MULTIPLIER : 1.0;
    const textSprite = createTextSprite(label, labelFontSize, 'white', undefined, labelOpacity);
    textSprite.position.set(0, -(sphereRadius + 5), 0); // Position below sphere
    group.add(textSprite);
  }

  return group;
}

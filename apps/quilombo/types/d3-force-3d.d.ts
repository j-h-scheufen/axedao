/**
 * Type declarations for d3-force-3d
 *
 * This module extends d3-force with 3D simulation capabilities.
 * See: https://github.com/vasturiano/d3-force-3d
 */

declare module 'd3-force-3d' {
  // Node interface for 3D simulation
  export interface SimulationNodeDatum {
    index?: number;
    x?: number;
    y?: number;
    z?: number;
    vx?: number;
    vy?: number;
    vz?: number;
    fx?: number | null;
    fy?: number | null;
    fz?: number | null;
  }

  // Link interface for 3D simulation
  export interface SimulationLinkDatum<NodeDatum extends SimulationNodeDatum> {
    source: NodeDatum | string | number;
    target: NodeDatum | string | number;
    index?: number;
  }

  // Force interface
  // biome-ignore lint/correctness/noUnusedVariables: LinkDatum is part of the d3-force API signature
  export interface Force<NodeDatum extends SimulationNodeDatum, LinkDatum extends SimulationLinkDatum<NodeDatum>> {
    (alpha: number): void;
    initialize?(nodes: NodeDatum[], random: () => number): void;
  }

  // Simulation interface
  export interface Simulation<
    NodeDatum extends SimulationNodeDatum,
    LinkDatum extends SimulationLinkDatum<NodeDatum> | undefined,
  > {
    restart(): this;
    stop(): this;
    tick(iterations?: number): this;
    nodes(): NodeDatum[];
    nodes(nodes: NodeDatum[]): this;
    alpha(): number;
    alpha(alpha: number): this;
    alphaMin(): number;
    alphaMin(min: number): this;
    alphaDecay(): number;
    alphaDecay(decay: number): this;
    alphaTarget(): number;
    alphaTarget(target: number): this;
    velocityDecay(): number;
    velocityDecay(decay: number): this;
    force(name: string): Force<NodeDatum, LinkDatum extends undefined ? never : LinkDatum> | undefined;
    force(name: string, force: Force<NodeDatum, LinkDatum extends undefined ? never : LinkDatum> | null): this;
    find(x: number, y: number, z?: number, radius?: number): NodeDatum | undefined;
    randomSource(): () => number;
    randomSource(source: () => number): this;
    on(typenames: string): ((this: this) => void) | undefined;
    on(typenames: string, listener: ((this: this) => void) | null): this;
    numDimensions(): number;
    numDimensions(dimensions: 1 | 2 | 3): this;
  }

  // Force simulation factory
  export function forceSimulation<NodeDatum extends SimulationNodeDatum>(
    nodes?: NodeDatum[]
  ): Simulation<NodeDatum, undefined>;

  // Force: Link
  export interface ForceLink<NodeDatum extends SimulationNodeDatum, LinkDatum extends SimulationLinkDatum<NodeDatum>>
    extends Force<NodeDatum, LinkDatum> {
    links(): LinkDatum[];
    links(links: LinkDatum[]): this;
    id(): (node: NodeDatum, i: number, nodes: NodeDatum[]) => string | number;
    id(id: (node: NodeDatum, i: number, nodes: NodeDatum[]) => string | number): this;
    iterations(): number;
    iterations(iterations: number): this;
    strength(): (link: LinkDatum, i: number, links: LinkDatum[]) => number;
    strength(strength: number | ((link: LinkDatum, i: number, links: LinkDatum[]) => number)): this;
    distance(): (link: LinkDatum, i: number, links: LinkDatum[]) => number;
    distance(distance: number | ((link: LinkDatum, i: number, links: LinkDatum[]) => number)): this;
  }

  export function forceLink<NodeDatum extends SimulationNodeDatum, LinkDatum extends SimulationLinkDatum<NodeDatum>>(
    links?: LinkDatum[]
  ): ForceLink<NodeDatum, LinkDatum>;

  // Force: Many-Body (charge)
  export interface ForceManyBody<NodeDatum extends SimulationNodeDatum>
    extends Force<NodeDatum, SimulationLinkDatum<NodeDatum>> {
    strength(): (node: NodeDatum, i: number, nodes: NodeDatum[]) => number;
    strength(strength: number | ((node: NodeDatum, i: number, nodes: NodeDatum[]) => number)): this;
    theta(): number;
    theta(theta: number): this;
    distanceMin(): number;
    distanceMin(distance: number): this;
    distanceMax(): number;
    distanceMax(distance: number): this;
  }

  export function forceManyBody<NodeDatum extends SimulationNodeDatum>(): ForceManyBody<NodeDatum>;

  // Force: Center
  export interface ForceCenter<NodeDatum extends SimulationNodeDatum>
    extends Force<NodeDatum, SimulationLinkDatum<NodeDatum>> {
    x(): number;
    x(x: number): this;
    y(): number;
    y(y: number): this;
    z(): number;
    z(z: number): this;
    strength(): number;
    strength(strength: number): this;
  }

  export function forceCenter<NodeDatum extends SimulationNodeDatum>(
    x?: number,
    y?: number,
    z?: number
  ): ForceCenter<NodeDatum>;

  // Force: Collision
  export interface ForceCollide<NodeDatum extends SimulationNodeDatum>
    extends Force<NodeDatum, SimulationLinkDatum<NodeDatum>> {
    radius(): (node: NodeDatum, i: number, nodes: NodeDatum[]) => number;
    radius(radius: number | ((node: NodeDatum, i: number, nodes: NodeDatum[]) => number)): this;
    strength(): number;
    strength(strength: number): this;
    iterations(): number;
    iterations(iterations: number): this;
  }

  export function forceCollide<NodeDatum extends SimulationNodeDatum>(
    radius?: number | ((node: NodeDatum, i: number, nodes: NodeDatum[]) => number)
  ): ForceCollide<NodeDatum>;

  // Force: X positioning
  export interface ForceX<NodeDatum extends SimulationNodeDatum>
    extends Force<NodeDatum, SimulationLinkDatum<NodeDatum>> {
    x(): (node: NodeDatum, i: number, nodes: NodeDatum[]) => number;
    x(x: number | ((node: NodeDatum, i: number, nodes: NodeDatum[]) => number)): this;
    strength(): (node: NodeDatum, i: number, nodes: NodeDatum[]) => number;
    strength(strength: number | ((node: NodeDatum, i: number, nodes: NodeDatum[]) => number)): this;
  }

  export function forceX<NodeDatum extends SimulationNodeDatum>(
    x?: number | ((node: NodeDatum, i: number, nodes: NodeDatum[]) => number)
  ): ForceX<NodeDatum>;

  // Force: Y positioning
  export interface ForceY<NodeDatum extends SimulationNodeDatum>
    extends Force<NodeDatum, SimulationLinkDatum<NodeDatum>> {
    y(): (node: NodeDatum, i: number, nodes: NodeDatum[]) => number;
    y(y: number | ((node: NodeDatum, i: number, nodes: NodeDatum[]) => number)): this;
    strength(): (node: NodeDatum, i: number, nodes: NodeDatum[]) => number;
    strength(strength: number | ((node: NodeDatum, i: number, nodes: NodeDatum[]) => number)): this;
  }

  export function forceY<NodeDatum extends SimulationNodeDatum>(
    y?: number | ((node: NodeDatum, i: number, nodes: NodeDatum[]) => number)
  ): ForceY<NodeDatum>;

  // Force: Z positioning
  export interface ForceZ<NodeDatum extends SimulationNodeDatum>
    extends Force<NodeDatum, SimulationLinkDatum<NodeDatum>> {
    z(): (node: NodeDatum, i: number, nodes: NodeDatum[]) => number;
    z(z: number | ((node: NodeDatum, i: number, nodes: NodeDatum[]) => number)): this;
    strength(): (node: NodeDatum, i: number, nodes: NodeDatum[]) => number;
    strength(strength: number | ((node: NodeDatum, i: number, nodes: NodeDatum[]) => number)): this;
  }

  export function forceZ<NodeDatum extends SimulationNodeDatum>(
    z?: number | ((node: NodeDatum, i: number, nodes: NodeDatum[]) => number)
  ): ForceZ<NodeDatum>;

  // Force: Radial
  export interface ForceRadial<NodeDatum extends SimulationNodeDatum>
    extends Force<NodeDatum, SimulationLinkDatum<NodeDatum>> {
    radius(): (node: NodeDatum, i: number, nodes: NodeDatum[]) => number;
    radius(radius: number | ((node: NodeDatum, i: number, nodes: NodeDatum[]) => number)): this;
    x(): number;
    x(x: number): this;
    y(): number;
    y(y: number): this;
    z(): number;
    z(z: number): this;
    strength(): (node: NodeDatum, i: number, nodes: NodeDatum[]) => number;
    strength(strength: number | ((node: NodeDatum, i: number, nodes: NodeDatum[]) => number)): this;
  }

  export function forceRadial<NodeDatum extends SimulationNodeDatum>(
    radius?: number | ((node: NodeDatum, i: number, nodes: NodeDatum[]) => number),
    x?: number,
    y?: number,
    z?: number
  ): ForceRadial<NodeDatum>;
}

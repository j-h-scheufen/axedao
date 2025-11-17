import type { ClusterFeature } from '@/types/model';
import type { Feature, Geometry, Point } from 'geojson';

/**
 * Returns the best display label for a GeoJSON Feature or MapTiler Feature.
 * Priority:
 * - For GroupLocationFeature: locationName > locationDescription
 * - For MapTiler/generic: text > place_name > properties.address > properties.text > properties.name
 * - Fallback: 'Unknown location'
 */
// biome-ignore lint/suspicious/noExplicitAny: any is used on purpose to 'unknown'
export function getGeoJsonFeatureLabel(feature: any): string {
  if (!feature) return 'No address';
  return (
    feature.properties?.locationName ||
    feature.place_name ||
    feature.text ||
    feature.properties?.address ||
    feature.properties?.text ||
    feature.properties?.name ||
    'Unknown location'
  );
}

// TYPE GUARDS

// biome-ignore lint/suspicious/noExplicitAny: any is used on purpose to support different properties
export function isPointFeature(f: Feature<Geometry, any>): f is Feature<Point, any> {
  return f.geometry?.type === 'Point';
}

export const isCluster = <TAgg extends object>(
  // biome-ignore lint/suspicious/noExplicitAny: any is used on purpose to support different properties
  f: Feature<Point, any>
): f is ClusterFeature<TAgg> => f.properties?.cluster === true;

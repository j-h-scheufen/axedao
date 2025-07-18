/**
 * Returns the best display label for a GeoJSON Feature or MapTiler Feature.
 * Priority: text > place_name > properties.address > properties.text > properties.name > 'Unknown location'
 */
// biome-ignore lint/suspicious/noExplicitAny: any is used on purpose
export function getGeoJsonFeatureLabel(feature: any): string {
  if (!feature) return 'No address';
  return (
    feature.place_name ||
    feature.text ||
    feature.properties?.address ||
    feature.properties?.text ||
    feature.properties?.name ||
    'Unknown location'
  );
}

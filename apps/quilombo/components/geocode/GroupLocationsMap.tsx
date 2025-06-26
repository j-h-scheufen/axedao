import type { FeatureCollection, Geometry } from 'geojson';
import BaseMapLibreMap from './BaseMapLibreMap';

interface GroupLocationsMapProps {
  geojsonData: FeatureCollection<Geometry>;
  center?: [number, number];
  zoom?: number;
  // Optionally, add onMarkerClick or similar for extensibility
}

const GroupLocationsMap = ({ geojsonData, center, zoom }: GroupLocationsMapProps) => {
  return <BaseMapLibreMap geojsonData={geojsonData} center={center} zoom={zoom} />;
};

export default GroupLocationsMap;

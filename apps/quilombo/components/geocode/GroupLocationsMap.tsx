import type { FeatureCollection, Geometry } from 'geojson';
import BaseMapLibreMap from './BaseMapLibreMap';

interface GroupLocationsMapProps {
  geojsonData: FeatureCollection<Geometry>;
}

const GroupLocationsMap = ({ geojsonData }: GroupLocationsMapProps) => {
  return <BaseMapLibreMap geojsonData={geojsonData} />;
};

export default GroupLocationsMap;

'use client';

import type { FeatureCollection, Geometry } from 'geojson';
import { useAtomValue } from 'jotai';

import { locationsAtom } from '@/hooks/state/location';
import BaseMapLibreMap from './BaseMapLibreMap';

interface GroupLocationsMapProps {
  geojsonData?: FeatureCollection<Geometry>;
}

const SATELLITE_STYLE_URL = 'https://api.maptiler.com/maps/satellite/style.json';
const INITIAL_CENTER: [number, number] = [0, 20];
const INITIAL_ZOOM = 1.2;

const GroupLocationsMap = ({ geojsonData }: GroupLocationsMapProps) => {
  const { data: locations, isPending, error } = useAtomValue(locationsAtom);

  if (isPending) {
    return (
      <div className="w-full h-96 bg-gray-100 rounded-lg flex items-center justify-center">
        <div className="text-gray-500">Loading map...</div>
      </div>
    );
  }

  if (error) {
    console.error('GroupLocationsMap error:', error);
    return (
      <div className="w-full h-96 bg-red-50 rounded-lg flex items-center justify-center">
        <div className="text-red-500">Error loading map data</div>
      </div>
    );
  }

  // Use provided geojsonData if available, otherwise use locations data
  const mapData = geojsonData || locations;

  if (!mapData || mapData.features.length === 0) {
    return (
      <div className="w-full h-96 bg-gray-50 rounded-lg flex items-center justify-center">
        <div className="text-gray-500">No locations available</div>
      </div>
    );
  }

  return (
    <BaseMapLibreMap mapStyleUrl={SATELLITE_STYLE_URL} initialCenter={INITIAL_CENTER} initialZoom={INITIAL_ZOOM} />
  );
};

export default GroupLocationsMap;

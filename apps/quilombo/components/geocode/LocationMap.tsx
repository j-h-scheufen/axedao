'use client';

import { useEffect, useState } from 'react';
import maplibregl from 'maplibre-gl';
import { createMapLibreGlMapController } from '@maptiler/geocoding-control/maplibregl-controller';
import { GeocodingControl } from '@maptiler/geocoding-control/react';
import type { Feature, MapController } from '@maptiler/geocoding-control/types';
import type { FeatureCollection, Geometry } from 'geojson';
import BaseMapLibreMap from './BaseMapLibreMap';
import ENV from '@/config/environment';

type Props = {
  initialFeature?: Feature | null;
  onSelectionChange: (feature: Feature, coordinates: [number, number]) => void;
};

const LocationMap = ({ initialFeature, onSelectionChange }: Props) => {
  const [selectedFeature, setSelectedFeature] = useState<Feature | null>(initialFeature ?? null);
  const [controller, setController] = useState<MapController | null>(null);

  useEffect(() => {
    setSelectedFeature(initialFeature ?? null);
  }, [initialFeature]);

  const geojsonData: FeatureCollection<Geometry> = selectedFeature
    ? { type: 'FeatureCollection', features: [selectedFeature] }
    : { type: 'FeatureCollection', features: [] };

  return (
    <BaseMapLibreMap
      geojsonData={geojsonData}
      onMapReady={(map) => setController(createMapLibreGlMapController(map, maplibregl))}
    >
      {controller && (
        <div style={{ position: 'absolute', top: 10, left: 10, zIndex: 1 }}>
          <GeocodingControl
            mapController={controller}
            apiKey={ENV.mapTilerKey}
            placeholder="Search address…"
            language="en"
            limit={5}
            debounceSearch={1200}
            onSelect={(f) => {
              if (f.feature?.geometry?.type === 'Point' && Array.isArray(f.feature.geometry.coordinates)) {
                setSelectedFeature(f.feature);
                onSelectionChange(f.feature, f.feature.geometry.coordinates as [number, number]);
              }
            }}
          />
        </div>
      )}
    </BaseMapLibreMap>
  );
};

export default LocationMap;

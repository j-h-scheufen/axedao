'use client';

import { useEffect, useState, useCallback } from 'react';
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
  console.log('LocationMap render');
  const [selectedFeature, setSelectedFeature] = useState<Feature | null>(initialFeature ?? null);
  const [controller, setController] = useState<MapController | null>(null);
  const [mapInstance, setMapInstance] = useState<maplibregl.Map | null>(null);

  const handleStyleReady = useCallback((map: maplibregl.Map) => {
    setMapInstance(map);
    setController(createMapLibreGlMapController(map, maplibregl));
  }, []);

  useEffect(() => {
    console.log('LocationMap: useEffect for initialFeature', initialFeature);
    setSelectedFeature(initialFeature ?? null);
  }, [initialFeature]);

  const geojsonData: FeatureCollection<Geometry> = selectedFeature
    ? { type: 'FeatureCollection', features: [selectedFeature] }
    : { type: 'FeatureCollection', features: [] };

  console.log('controller', controller, 'mapInstance', mapInstance, 'isStyleLoaded', mapInstance?.isStyleLoaded());

  return (
    <BaseMapLibreMap
      geojsonData={geojsonData}
      onStyleReady={handleStyleReady}
      additionalCssUrls={['https://unpkg.com/@maptiler/geocoding-control/style.css']}
    >
      {controller && mapInstance ? (
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
      ) : null}
    </BaseMapLibreMap>
  );
};

export default LocationMap;

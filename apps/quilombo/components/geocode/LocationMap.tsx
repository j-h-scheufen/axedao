'use client';

import { useEffect, useState, useCallback, useRef } from 'react';
import maplibregl from 'maplibre-gl';
import { createMapLibreGlMapController } from '@maptiler/geocoding-control/maplibregl-controller';
import { GeocodingControl } from '@maptiler/geocoding-control/react';
import type { Feature, MapController } from '@maptiler/geocoding-control/types';

import BaseMapLibreMap from './BaseMapLibreMap';
import ENV from '@/config/environment';

type Props = {
  initialFeature?: Feature | null;
  onSelectionChange: (feature: Feature, coordinates: [number, number]) => void;
};

const LocationMap = ({ initialFeature, onSelectionChange }: Props) => {
  const [selectedFeature, setSelectedFeature] = useState<Feature | null>(initialFeature ?? null);
  const [controller, setController] = useState<MapController | null>(null);
  const [mapInstance, setMapInstance] = useState<maplibregl.Map | null>(null);
  const markerRef = useRef<maplibregl.Marker | null>(null);

  const handleMapReady = useCallback((map: maplibregl.Map) => {
    setMapInstance(map);
    setController(createMapLibreGlMapController(map, maplibregl));
  }, []);

  useEffect(() => {
    setSelectedFeature(initialFeature ?? null);
  }, [initialFeature]);

  // Handle marker when selectedFeature or mapInstance changes
  useEffect(() => {
    if (!mapInstance) return;

    // Remove previous marker
    if (markerRef.current) {
      markerRef.current.remove();
      markerRef.current = null;
    }

    if (
      selectedFeature &&
      selectedFeature.geometry.type === 'Point' &&
      Array.isArray(selectedFeature.geometry.coordinates)
    ) {
      const [lng, lat] = selectedFeature.geometry.coordinates as [number, number];

      // Get primary color from CSS custom properties
      const primaryColor =
        getComputedStyle(document.documentElement).getPropertyValue('--color-primary').trim() || '#7DC639'; // fallback to primary-500

      const newMarker = new maplibregl.Marker({ color: primaryColor }).setLngLat([lng, lat]).addTo(mapInstance);
      markerRef.current = newMarker;
      mapInstance.flyTo({ center: [lng, lat], zoom: 14 });
    }
  }, [selectedFeature, mapInstance]);

  return (
    <BaseMapLibreMap
      onMapReady={handleMapReady}
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

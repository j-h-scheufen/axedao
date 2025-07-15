'use client';

import { useState, useCallback, useRef, useEffect } from 'react';
import maplibregl from 'maplibre-gl';
import { createMapLibreGlMapController } from '@maptiler/geocoding-control/maplibregl-controller';
import { GeocodingControl } from '@maptiler/geocoding-control/react';
import type { MapController } from '@maptiler/geocoding-control/types';
import type { Feature, Geometry, GeoJsonProperties } from 'geojson';

import BaseMapLibreMap, { DEFAULT_CENTER, DEFAULT_ZOOM } from './BaseMapLibreMap';
import ENV from '@/config/environment';

type Props = {
  initialFeature?: Feature<Geometry, GeoJsonProperties> | null;
  onSelectionChange: (feature: Feature<Geometry, GeoJsonProperties>, coordinates: [number, number]) => void;
};

const LocationMap = ({ initialFeature, onSelectionChange }: Props) => {
  const [controller, setController] = useState<MapController | null>(null);
  const [mapInstance, setMapInstance] = useState<maplibregl.Map | null>(null);

  const initialMarkerRef = useRef<maplibregl.Marker | null>(null);

  const handleMapReady = useCallback((map: maplibregl.Map) => {
    setMapInstance(map);
    setController(createMapLibreGlMapController(map, maplibregl));
  }, []);

  useEffect(() => {
    if (
      mapInstance &&
      initialFeature &&
      initialFeature.geometry.type === 'Point' &&
      Array.isArray(initialFeature.geometry.coordinates)
    ) {
      // Remove previous marker if any
      if (initialMarkerRef.current) {
        initialMarkerRef.current.remove();
        initialMarkerRef.current = null;
      }
      // Add new marker
      initialMarkerRef.current = new maplibregl.Marker({ color: '#7DC639' })
        .setLngLat(initialFeature.geometry.coordinates as [number, number])
        .addTo(mapInstance);
    }
    // Cleanup marker on unmount or when initialFeature changes
    return () => {
      if (initialMarkerRef.current) {
        initialMarkerRef.current.remove();
        initialMarkerRef.current = null;
      }
    };
  }, [mapInstance, initialFeature]);

  return (
    <BaseMapLibreMap
      onMapReady={handleMapReady}
      additionalCssUrls={['https://unpkg.com/@maptiler/geocoding-control/style.css']}
      initialCenter={
        initialFeature?.geometry.type === 'Point'
          ? (initialFeature.geometry.coordinates as [number, number])
          : DEFAULT_CENTER
      }
      initialZoom={initialFeature ? 14 : DEFAULT_ZOOM}
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
            onPick={(f) => {
              // Remove the initial marker if present
              if (initialMarkerRef.current) {
                initialMarkerRef.current.remove();
                initialMarkerRef.current = null;
              }
              const feature = f?.feature;
              if (feature?.geometry?.type === 'Point' && Array.isArray(feature.geometry.coordinates)) {
                onSelectionChange(feature, feature.geometry.coordinates as [number, number]);
              }
            }}
          />
        </div>
      ) : null}
    </BaseMapLibreMap>
  );
};

export default LocationMap;

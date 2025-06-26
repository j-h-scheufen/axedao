'use client';

import { useEffect, useRef, useState } from 'react';
import { createPortal } from 'react-dom';
import maplibregl from 'maplibre-gl';
import type { Feature, FeatureCollection } from 'geojson';

import ENV from '@/config/environment';

const MAPLIBRE_CSS = 'https://unpkg.com/maplibre-gl@^3/dist/maplibre-gl.css';

interface BaseMapLibreMapProps {
  geojsonData?: Feature | FeatureCollection;
  center?: [number, number];
  zoom?: number;
  onMapReady?: (map: maplibregl.Map) => void;
  children?: React.ReactNode;
}

/**
 * MapLibre map component that implements a shadow root to isolate the map from the rest of the page.
 * This is useful to avoid conflicts with other libraries that might be using the same DOM elements.
 *
 * It also implements a GeoJSON layer to display data on the map.
 *
 * @param geojsonData - GeoJSON data to display on the map
 * @param center - Center of the map
 * @param zoom - Zoom level of the map
 * @param onMapReady - Callback function to be called when the map is ready
 * @param children - Children components to be rendered inside the map
 */
const BaseMapLibreMap = ({
  geojsonData,
  center = [4.35, 50.85],
  zoom = 2,
  onMapReady,
  children,
}: BaseMapLibreMapProps) => {
  const hostRef = useRef<HTMLDivElement>(null);
  const containerRef = useRef<HTMLDivElement>(null);
  const [shadowRoot, setShadowRoot] = useState<ShadowRoot | null>(null);
  const [map, setMap] = useState<maplibregl.Map | null>(null);

  useEffect(() => {
    if (!hostRef.current) return;
    if (hostRef.current.shadowRoot) {
      setShadowRoot(hostRef.current.shadowRoot);
      return;
    }
    const shadow = hostRef.current.attachShadow({ mode: 'open' });
    setShadowRoot(shadow);
    const link = document.createElement('link');
    link.rel = 'stylesheet';
    link.href = MAPLIBRE_CSS;
    shadow.appendChild(link);
  }, []);

  useEffect(() => {
    if (!shadowRoot || !containerRef.current) return;
    const map = new maplibregl.Map({
      container: containerRef.current,
      style: `https://api.maptiler.com/maps/basic/style.json?key=${ENV.mapTilerKey}`,
      center,
      zoom,
      attributionControl: false,
    });
    setMap(map);
    if (onMapReady) onMapReady(map);
    return () => {
      setMap(null);
      setTimeout(() => map.remove(), 0);
    };
  }, [shadowRoot, center, zoom, onMapReady]);

  // Add or update GeoJSON source/layer
  useEffect(() => {
    if (!map || !geojsonData) return;
    if (map.getSource('geojson-points')) {
      (map.getSource('geojson-points') as maplibregl.GeoJSONSource).setData(geojsonData);
    } else {
      map.addSource('geojson-points', {
        type: 'geojson',
        data: geojsonData,
      });
      map.addLayer({
        id: 'geojson-points-layer',
        type: 'symbol',
        source: 'geojson-points',
        layout: {
          'icon-image': 'marker-15',
          'icon-size': 1.5,
        },
      });
    }
  }, [map, geojsonData]);

  const shadowPortal = shadowRoot
    ? createPortal(
        <div style={{ width: '100%', height: '100%', position: 'relative' }}>
          <div style={{ width: '100%', height: '100%' }} ref={containerRef} />
          {children}
        </div>,
        shadowRoot
      )
    : null;

  return (
    <div
      ref={hostRef}
      style={{
        width: '100%',
        height: 400,
        position: 'relative',
        borderRadius: 8,
        overflow: 'hidden',
      }}
    >
      {shadowPortal}
    </div>
  );
};

export default BaseMapLibreMap;

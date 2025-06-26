'use client';

import { useEffect, useRef, useState } from 'react';
import { createPortal } from 'react-dom';
import maplibregl from 'maplibre-gl';
import type { Feature, FeatureCollection } from 'geojson';

import ENV from '@/config/environment';

const MAPLIBRE_CSS = 'https://unpkg.com/maplibre-gl@^3/dist/maplibre-gl.css';

interface BaseMapLibreMapProps {
  geojsonData?: Feature | FeatureCollection;
  onStyleReady?: (map: maplibregl.Map) => void;
  additionalCssUrls?: string[];
  children?: React.ReactNode;
}

/**
 * MapLibre map component that implements a shadow root to isolate the map from the rest of the page.
 * Calls onStyleReady(map) only after the map's style is loaded.
 * Appends any additionalCssUrls as <link rel="stylesheet"> to the shadow root.
 *
 * It also implements a GeoJSON layer to display data on the map.
 *
 * @param geojsonData - GeoJSON data to display on the map
 * @param onStyleReady - Callback function to be called when the map's style is loaded
 * @param additionalCssUrls - Array of CSS URLs to append to the shadow root
 * @param children - Children components to be rendered inside the map
 */
const BaseMapLibreMap = ({ geojsonData, onStyleReady, additionalCssUrls, children }: BaseMapLibreMapProps) => {
  console.log('BaseMapLibreMap render');
  const hostRef = useRef<HTMLDivElement>(null);
  const containerRef = useRef<HTMLDivElement>(null);
  const [shadowRoot, setShadowRoot] = useState<ShadowRoot | null>(null);
  const mapRef = useRef<maplibregl.Map | null>(null);
  const [styleLoaded, setStyleLoaded] = useState(false);
  const styleReadyCalledRef = useRef(false);

  // Shadow DOM setup
  useEffect(() => {
    console.log('BaseMapLibreMap: shadow DOM effect');
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

  // Add additional CSS URLs to shadow root
  useEffect(() => {
    if (!shadowRoot || !additionalCssUrls) return;
    console.log('BaseMapLibreMap: adding additional CSS URLs');
    for (const href of additionalCssUrls) {
      const extraLink = document.createElement('link');
      extraLink.rel = 'stylesheet';
      extraLink.href = href;
      shadowRoot.appendChild(extraLink);
    }
  }, [shadowRoot, additionalCssUrls]);

  // Map creation (once)
  useEffect(() => {
    console.log('BaseMapLibreMap: map creation effect');
    if (!shadowRoot || !containerRef.current) return;
    const map = new maplibregl.Map({
      container: containerRef.current,
      style: `https://api.maptiler.com/maps/basic/style.json?key=${ENV.mapTilerKey}`,
      center: [4.35, 50.85],
      zoom: 2,
      attributionControl: false,
    });
    mapRef.current = map;
    styleReadyCalledRef.current = false;

    const handleStyleLoad = () => {
      console.log('BaseMapLibreMap: style loaded');
      setStyleLoaded(true);
      if (onStyleReady && !styleReadyCalledRef.current) {
        console.log('BaseMapLibreMap: calling onStyleReady');
        onStyleReady(map);
        styleReadyCalledRef.current = true;
      }
    };
    map.on('style.load', handleStyleLoad);
    if (map.isStyleLoaded()) handleStyleLoad();

    return () => {
      console.log('BaseMapLibreMap: map cleanup');
      map.off('style.load', handleStyleLoad);
      setTimeout(() => {
        map.remove();
        mapRef.current = null;
        setStyleLoaded(false);
        styleReadyCalledRef.current = false;
      }, 0);
    };
  }, [shadowRoot, onStyleReady]);

  // Add/remove GeoJSON source/layer when style is loaded and data changes
  useEffect(() => {
    const map = mapRef.current;
    if (!map || !geojsonData || !styleLoaded) return;
    console.log('BaseMapLibreMap: adding geojson source/layer');
    // Remove existing layer/source if present
    if (map.getLayer('geojson-points-layer')) map.removeLayer('geojson-points-layer');
    if (map.getSource('geojson-points')) map.removeSource('geojson-points');

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

    return () => {
      console.log('BaseMapLibreMap: removing geojson source/layer');
      const currentMap = mapRef.current;
      if (!currentMap) return;
      if (currentMap.getLayer('geojson-points-layer')) currentMap.removeLayer('geojson-points-layer');
      if (currentMap.getSource('geojson-points')) currentMap.removeSource('geojson-points');
    };
  }, [geojsonData, styleLoaded]);

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

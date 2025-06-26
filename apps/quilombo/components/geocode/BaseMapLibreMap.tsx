'use client';

import { useEffect, useRef, useState } from 'react';
import { createPortal } from 'react-dom';
import maplibregl from 'maplibre-gl';
import type { Feature, FeatureCollection } from 'geojson';

import ENV from '@/config/environment';
import type { GroupLocationFeatureProperties } from '@/types/model';
import { getImageUrl } from '@/utils';

const MAPLIBRE_CSS = 'https://unpkg.com/maplibre-gl@^3/dist/maplibre-gl.css';

interface BaseMapLibreMapProps {
  geojsonData?: Feature | FeatureCollection;
  mapStyleUrl?: string;
  initialCenter?: [number, number];
  initialZoom?: number;
  onStyleReady?: (map: maplibregl.Map) => void;
  additionalCssUrls?: string[];
  children?: React.ReactNode;
}

const FALLBACK_ICON_ID = 'fallback-marker';
const FALLBACK_ICON_URL = '/favicon-16x16.png';

/**
 * MapLibre map component that implements a shadow root to isolate the map from the rest of the page.
 * Calls onStyleReady(map) only after the map's style is loaded.
 * Appends any additionalCssUrls as <link rel="stylesheet"> to the shadow root.
 *
 * It also implements a GeoJSON layer to display data on the map.
 *
 * @param geojsonData - GeoJSON data to display on the map
 * @param mapStyleUrl - URL of the map style
 * @param initialCenter - Initial center of the map
 * @param initialZoom - Initial zoom level of the map
 * @param onStyleReady - Callback function to be called when the map's style is loaded
 * @param additionalCssUrls - Array of CSS URLs to append to the shadow root
 * @param children - Children components to be rendered inside the map
 */
const BaseMapLibreMap = ({
  geojsonData,
  mapStyleUrl = `https://api.maptiler.com/maps/basic/style.json?key=${ENV.mapTilerKey}`,
  initialCenter = [0, 20],
  initialZoom = 1.2,
  onStyleReady,
  additionalCssUrls,
  children,
}: BaseMapLibreMapProps) => {
  const hostRef = useRef<HTMLDivElement>(null);
  const containerRef = useRef<HTMLDivElement>(null);
  const [shadowRoot, setShadowRoot] = useState<ShadowRoot | null>(null);
  const mapRef = useRef<maplibregl.Map | null>(null);
  const [styleLoaded, setStyleLoaded] = useState(false);
  const styleReadyCalledRef = useRef(false);

  // Shadow DOM setup
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

  // Add additional CSS URLs to shadow root
  useEffect(() => {
    if (!shadowRoot || !additionalCssUrls) return;
    for (const href of additionalCssUrls) {
      const extraLink = document.createElement('link');
      extraLink.rel = 'stylesheet';
      extraLink.href = href;
      shadowRoot.appendChild(extraLink);
    }
  }, [shadowRoot, additionalCssUrls]);

  // Map creation (once)
  useEffect(() => {
    if (!shadowRoot || !containerRef.current) return;
    const map = new maplibregl.Map({
      container: containerRef.current,
      style: `${mapStyleUrl}?key=${ENV.mapTilerKey}`,
      center: initialCenter,
      zoom: initialZoom,
      attributionControl: false,
    });
    mapRef.current = map;
    styleReadyCalledRef.current = false;

    const handleStyleLoad = () => {
      setStyleLoaded(true);
      if (onStyleReady && !styleReadyCalledRef.current) {
        onStyleReady(map);
        styleReadyCalledRef.current = true;
      }
    };
    map.on('style.load', handleStyleLoad);
    if (map.isStyleLoaded()) handleStyleLoad();

    return () => {
      map.off('style.load', handleStyleLoad);
      setTimeout(() => {
        map.remove();
        mapRef.current = null;
        setStyleLoaded(false);
        styleReadyCalledRef.current = false;
      }, 0);
    };
  }, [shadowRoot, mapStyleUrl, initialCenter, initialZoom, onStyleReady]);

  // Add/remove GeoJSON source/layer when style is loaded and data changes
  useEffect(() => {
    const map = mapRef.current;
    if (!map || !geojsonData || !styleLoaded) return;

    // Remove existing layers/sources if present
    if (map.getLayer('clusters')) map.removeLayer('clusters');
    if (map.getLayer('cluster-count')) map.removeLayer('cluster-count');
    if (map.getLayer('unclustered-point')) map.removeLayer('unclustered-point');
    if (map.getSource('geojson-points')) map.removeSource('geojson-points');

    // Add fallback marker icon if not present
    if (!map.hasImage(FALLBACK_ICON_ID)) {
      const img = new window.Image(16, 16);
      img.onload = () => map.addImage(FALLBACK_ICON_ID, img, { pixelRatio: 2 });
      img.src = FALLBACK_ICON_URL;
    }

    // Add group logo icons
    if ('features' in geojsonData) {
      geojsonData.features.forEach((feature) => {
        const props = feature.properties as GroupLocationFeatureProperties;
        if (props?.groupLogo && !map.hasImage(props.groupId)) {
          const img = new window.Image(16, 16);
          img.onload = () => map.addImage(props.groupId, img, { pixelRatio: 2 });
          img.src = getImageUrl(props.groupLogo) ?? FALLBACK_ICON_URL;
        }
      });
    }

    map.addSource('geojson-points', {
      type: 'geojson',
      data: geojsonData,
      cluster: true,
      clusterMaxZoom: 14,
      clusterRadius: 40,
    });

    // Cluster circles
    map.addLayer({
      id: 'clusters',
      type: 'circle',
      source: 'geojson-points',
      filter: ['has', 'point_count'],
      paint: {
        'circle-color': ['step', ['get', 'point_count'], '#60a5fa', 10, '#2563eb', 30, '#1e40af'],
        'circle-radius': ['step', ['get', 'point_count'], 16, 10, 24, 30, 32],
      },
    });

    // Cluster count labels
    map.addLayer({
      id: 'cluster-count',
      type: 'symbol',
      source: 'geojson-points',
      filter: ['has', 'point_count'],
      layout: {
        'text-field': '{point_count_abbreviated}',
        'text-font': ['Open Sans Bold', 'Arial Unicode MS Bold'],
        'text-size': 14,
      },
      paint: {
        'text-color': '#fff',
      },
    });

    // Unclustered points: use group logo or fallback icon
    map.addLayer({
      id: 'unclustered-point',
      type: 'symbol',
      source: 'geojson-points',
      filter: ['!', ['has', 'point_count']],
      layout: {
        'icon-image': ['coalesce', ['get', 'groupLogo'], FALLBACK_ICON_ID],
        'icon-size': 2,
        'icon-allow-overlap': true,
      },
    });

    return () => {
      const currentMap = mapRef.current;
      if (!currentMap) return;
      if (currentMap.getLayer('clusters')) currentMap.removeLayer('clusters');
      if (currentMap.getLayer('cluster-count')) currentMap.removeLayer('cluster-count');
      if (currentMap.getLayer('unclustered-point')) currentMap.removeLayer('unclustered-point');
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

'use client';

import { useEffect, useRef, useState } from 'react';
import { createPortal } from 'react-dom';
import maplibregl from 'maplibre-gl';
import { createMapLibreGlMapController } from '@maptiler/geocoding-control/maplibregl-controller';
import { GeocodingControl } from '@maptiler/geocoding-control/react';
import type { Feature, MapController } from '@maptiler/geocoding-control/types';

import ENV from '@/config/environment';

type Props = {
  initialFeature?: Feature | null;
  onSelectionChange: (feature: Feature, coordinates: [number, number]) => void;
};

const MAPLIBRE_CSS = 'https://unpkg.com/maplibre-gl@^3/dist/maplibre-gl.css';
const GEOCODER_CSS = 'https://unpkg.com/@maptiler/geocoding-control/style.css';

/** Shadow-DOM wrapped map that is immune to Tailwind styles */
const LocationMap = ({ onSelectionChange }: Props) => {
  const hostRef = useRef<HTMLDivElement>(null);
  const containerRef = useRef<HTMLDivElement>(null);

  const [shadowRoot, setShadowRoot] = useState<ShadowRoot | null>(null);
  const [controller, setController] = useState<MapController | null>(null);

  /* Mount Shadow DOM + MapLibre on first render */
  useEffect(() => {
    if (!hostRef.current) return;
    /* ←─────────────── new guard ───────────────→ */
    if (hostRef.current.shadowRoot) {
      setShadowRoot(hostRef.current.shadowRoot); // reuse it
      return; // skip rest of setup
    }
    /* ←──────────────────────────────────────────→ */

    const shadow = hostRef.current.attachShadow({ mode: 'open' });
    setShadowRoot(shadow);

    /* Inject CSS from CDN */
    for (const href of [MAPLIBRE_CSS, GEOCODER_CSS]) {
      const link = document.createElement('link');
      link.rel = 'stylesheet';
      link.href = href;
      shadow.appendChild(link);
    }
  }, []);

  /* Initialize map after both shadowRoot and containerRef are set */
  useEffect(() => {
    if (!shadowRoot || !containerRef.current) return;

    const map = new maplibregl.Map({
      container: containerRef.current,
      style: `https://api.maptiler.com/maps/basic/style.json?key=${ENV.mapTilerKey}`,
      center: [4.35, 50.85],
      zoom: 12,
      attributionControl: false,
    });

    map.on('style.load', () => setController(createMapLibreGlMapController(map, maplibregl)));

    return () => {
      setController(null);
      setTimeout(() => {
        map.remove();
      }, 0);
    };
  }, [shadowRoot]);

  const shadowContent = (
    <>
      <div style={{ width: '100%', height: '100%' }} ref={containerRef} />
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
                onSelectionChange(f.feature, f.feature.geometry.coordinates as [number, number]);
              }
            }}
          />
        </div>
      )}
    </>
  );

  const shadowPortal = shadowRoot
    ? createPortal(
        <div style={{ width: '100%', height: '100%', position: 'relative' }}>{shadowContent}</div>,
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
        background: 'rgba(255,0,0,0.1)', // TEMP: for debugging
      }}
    >
      {shadowPortal}
    </div>
  );
};

export default LocationMap;

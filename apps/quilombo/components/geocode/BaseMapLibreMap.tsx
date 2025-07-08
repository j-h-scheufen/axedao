'use client';

import { useEffect, useRef, useState, forwardRef } from 'react';
import { createPortal } from 'react-dom';
import maplibregl from 'maplibre-gl';

import ENV from '@/config/environment';

const MAPLIBRE_CSS = 'https://unpkg.com/maplibre-gl@^3/dist/maplibre-gl.css';

export interface BaseMapLibreMapProps {
  mapStyleUrl?: string;
  initialCenter?: [number, number];
  initialZoom?: number;
  onMapReady?: (map: maplibregl.Map) => void;
  additionalCssUrls?: string[];
  children?: React.ReactNode;
}

export const DEFAULT_CENTER: [number, number] = [10, 16];
export const DEFAULT_ZOOM = 0.8;

/**
 * MapLibre map component that implements a shadow root to isolate the map from the rest of the page.
 * Calls onMapReady(map) only after the map's created and the style is loaded.
 * Appends any additionalCssUrls as <link rel="stylesheet"> to the shadow root.
 *
 * @param mapStyleUrl - URL of the map style to load. The MapTiler API key will be appended to this URL.
 * @param initialCenter - Initial center coordinates of the map
 * @param initialZoom - Initial zoom level of the map
 * @param onMapReady - Callback function to be called when the map's created and the style is loaded
 * @param additionalCssUrls - Array of CSS URLs to append to the shadow root
 * @param children - Children components to be rendered inside the map
 */
const BaseMapLibreMap = forwardRef<HTMLDivElement, BaseMapLibreMapProps>(
  (
    {
      mapStyleUrl = 'https://api.maptiler.com/maps/basic/style.json',
      initialCenter = DEFAULT_CENTER,
      initialZoom = DEFAULT_ZOOM,
      onMapReady,
      additionalCssUrls,
      children,
    },
    ref
  ) => {
    const hostRef = useRef<HTMLDivElement>(null);
    const containerRef = useRef<HTMLDivElement>(null);
    const [shadowRoot, setShadowRoot] = useState<ShadowRoot | null>(null);
    const mapRef = useRef<maplibregl.Map | null>(null);
    const [styleLoaded, setStyleLoaded] = useState(false);
    const styleReadyCalledRef = useRef(false);
    const onMapReadyRef = useRef(onMapReady);

    // Update the ref when onMapReady changes
    useEffect(() => {
      onMapReadyRef.current = onMapReady;
    }, [onMapReady]);

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

    // Map creation - only depends on shadowRoot and mapStyleUrl
    // biome-ignore lint/correctness/useExhaustiveDependencies: suppress to prevent infinite map recreation
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
        if (onMapReadyRef.current && !styleReadyCalledRef.current) {
          onMapReadyRef.current(map);
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
    }, [shadowRoot, mapStyleUrl]);

    // Handle center and zoom changes after map is created
    useEffect(() => {
      const map = mapRef.current;
      if (!map || !styleLoaded) return;

      // Only set center/zoom if they're different from current values
      const currentCenter = map.getCenter();
      const currentZoom = map.getZoom();

      if (currentCenter.lng !== initialCenter[0] || currentCenter.lat !== initialCenter[1]) {
        map.setCenter(initialCenter);
      }

      if (currentZoom !== initialZoom) {
        map.setZoom(initialZoom);
      }
    }, [initialCenter, initialZoom, styleLoaded]);

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
        ref={(node) => {
          hostRef.current = node;
          if (typeof ref === 'function') {
            ref(node);
          } else if (ref) {
            (ref as React.RefObject<HTMLDivElement | null>).current = node;
          }
        }}
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
  }
);

export default BaseMapLibreMap;

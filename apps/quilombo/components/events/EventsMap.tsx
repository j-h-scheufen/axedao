'use client';

import { useMemo, useRef, useEffect, useState, useCallback } from 'react';
import Supercluster from 'supercluster';
import { ScatterplotLayer, TextLayer, IconLayer } from '@deck.gl/layers';
import { MapboxOverlay } from '@deck.gl/mapbox';
import type { PickingInfo } from '@deck.gl/core';

import BaseMapLibreMap from '../geocode/BaseMapLibreMap';
import { getGeoJsonFeatureLabel } from '@/components/_utils/geojson';
import EventPopover from './EventPopover';
import type { EventLocationFeatureCollection, EventLocationFeatureProperties } from '@/types/model';

const SATELLITE_STYLE_URL = 'https://api.maptiler.com/maps/satellite/style.json';

interface EventsMapProps {
  eventLocations: EventLocationFeatureCollection;
}

const EventsMap = ({ eventLocations }: EventsMapProps) => {
  // Add state for bounds and zoom
  const [bounds, setBounds] = useState<[number, number, number, number] | null>(null);
  const [zoom, setZoom] = useState(1);
  const overlayRef = useRef<MapboxOverlay | null>(null);
  const [activeMarker, setActiveMarker] = useState<{
    event: EventLocationFeatureProperties;
    lngLat: [number, number];
  } | null>(null);
  const [popoverPos, setPopoverPos] = useState<{ x: number; y: number } | null>(null);
  const mapRef = useRef<maplibregl.Map | null>(null);
  const mapContainerRef = useRef<HTMLDivElement | null>(null);

  // Static event icon atlas state
  const [eventIconAtlas, setEventIconAtlas] = useState<{
    image: HTMLImageElement;
    mapping: Record<string, { x: number; y: number; width: number; height: number; mask: boolean }>;
  } | null>(null);

  // Create event icon atlas once on mount
  useMemo(() => {
    const createEventIconAtlas = async () => {
      const ICON_SIZE = 32;
      const ICON_PADDING = 2;
      const ICONS_PER_ROW = 4;

      // Event type to icon file mapping
      const eventTypeIcons: Record<string, string> = {
        general: '/images/events/event-black-64.png',
        workshop: '/images/events/workshop-black-64.png',
        batizado: '/images/events/batizado-black-64.png',
        public_roda: '/images/events/roda-black-64.png',
      };

      // Utility to load an image as a Promise
      const loadImage = (src: string) =>
        new Promise<HTMLImageElement>((resolve, reject) => {
          const img = new window.Image();
          img.crossOrigin = 'anonymous';
          img.onload = () => resolve(img);
          img.onerror = reject;
          img.src = src;
        });

      try {
        const iconEntries = Object.entries(eventTypeIcons);
        const images = await Promise.all(iconEntries.map(([_, url]) => loadImage(url)));

        const rows = Math.ceil(images.length / ICONS_PER_ROW);
        const canvas = document.createElement('canvas');
        canvas.width = ICONS_PER_ROW * (ICON_SIZE + ICON_PADDING) - ICON_PADDING;
        canvas.height = rows * (ICON_SIZE + ICON_PADDING) - ICON_PADDING;

        const ctx = canvas.getContext('2d')!;
        const mapping: Record<string, any> = {};

        images.forEach((img, i) => {
          const x = (i % ICONS_PER_ROW) * (ICON_SIZE + ICON_PADDING);
          const y = Math.floor(i / ICONS_PER_ROW) * (ICON_SIZE + ICON_PADDING);
          ctx.drawImage(img, x, y, ICON_SIZE, ICON_SIZE);

          const eventType = iconEntries[i][0];
          mapping[eventType] = {
            x,
            y,
            width: ICON_SIZE,
            height: ICON_SIZE,
            mask: false,
          };
        });

        const atlasImg = new window.Image();
        atlasImg.src = canvas.toDataURL();
        await new Promise((resolve) => {
          atlasImg.onload = resolve;
        });

        setEventIconAtlas({ image: atlasImg, mapping });
      } catch (error) {
        console.error('Failed to create event icon atlas:', error);
      }
    };

    createEventIconAtlas();
  }, []); // Empty dependency array - only run once

  // Prepare GeoJSON features for supercluster
  const geojsonPoints = useMemo(() => {
    if (!eventLocations) return [];
    return eventLocations.features
      .filter((f) => f.geometry.type === 'Point')
      .map((feature) => ({
        type: 'Feature',
        geometry: feature.geometry,
        properties: {
          ...feature.properties,
        },
      }));
  }, [eventLocations]);

  // Setup supercluster index
  const superclusterRef = useRef<Supercluster<any>>(null);

  useEffect(() => {
    if (geojsonPoints.length > 0) {
      superclusterRef.current = new Supercluster<any>({
        radius: 40,
        maxZoom: 12,
      });
      superclusterRef.current.load(geojsonPoints as any);
    }
  }, [geojsonPoints]);

  // Get clusters for current viewport/zoom
  const clusters = useMemo(() => {
    if (!superclusterRef.current || !bounds) return [];
    return superclusterRef.current.getClusters(bounds, Math.round(zoom));
  }, [bounds, zoom]);

  // Separate clusters and individual points
  const { clusterData, pointData } = useMemo(() => {
    const clusterArray: any[] = [];
    const pointArray: any[] = [];
    clusters.forEach((feature: any) => {
      const [longitude, latitude] = feature.geometry.coordinates;
      if (feature.properties.cluster) {
        clusterArray.push({
          coordinates: [longitude, latitude] as [number, number],
          point_count: feature.properties.point_count,
          _dataVersion: `${eventLocations.features.length}-${eventLocations.features[0]?.properties?.eventId || 'no-events'}`,
        });
      } else {
        pointArray.push({
          ...feature.properties,
          coordinates: [longitude, latitude] as [number, number],
          _dataVersion: `${eventLocations.features.length}-${eventLocations.features[0]?.properties?.eventId || 'no-events'}`,
        });
      }
    });
    return { clusterData: clusterArray, pointData: pointArray };
  }, [clusters, eventLocations.features.length, eventLocations.features[0]?.properties?.eventId]);

  const handleClick = useCallback((info: PickingInfo) => {
    if (info?.object) {
      setActiveMarker({
        event: info.object as EventLocationFeatureProperties,
        lngLat: info.object.coordinates,
      });
    }
  }, []);

  // ScatterplotLayer for clusters (circles) - different color for events
  const clusterLayer = useMemo(
    () =>
      new ScatterplotLayer<any>({
        id: 'event-cluster-layer',
        data: clusterData,
        pickable: true,
        getPosition: (d) => d.coordinates,
        getRadius: (d) => Math.max(20, 15 + Math.log2(d.point_count) * 6),
        getFillColor: [127, 217, 42, 200],
        getLineColor: [255, 255, 255, 200],
        getLineWidth: 2,
        stroked: true,
        filled: true,
        opacity: 0.9,
        radiusMinPixels: 15,
        radiusMaxPixels: 80,
        updateTriggers: {
          getPosition: [eventLocations.features.length, eventLocations.features[0]?.properties?.eventId || ''],
          getRadius: [eventLocations.features.length, eventLocations.features[0]?.properties?.eventId || ''],
        },
      }),
    [clusterData, eventLocations.features.length, eventLocations.features[0]?.properties?.eventId]
  );

  // TextLayer for cluster counts
  const clusterTextLayer = useMemo(
    () =>
      new TextLayer<any>({
        id: 'event-cluster-text-layer',
        data: clusterData,
        pickable: false,
        getPosition: (d) => d.coordinates,
        getText: (d) => String(d.point_count),
        getSize: 14,
        getColor: [255, 255, 255],
        getTextAnchor: 'middle',
        getAlignmentBaseline: 'center',
        fontFamily: 'Arial, sans-serif',
        fontWeight: 'bold',
        background: false,
        backgroundPadding: [0, 0, 0, 0],
        updateTriggers: {
          getPosition: [eventLocations.features.length, eventLocations.features[0]?.properties?.eventId || ''],
          getText: [eventLocations.features.length, eventLocations.features[0]?.properties?.eventId || ''],
        },
      }),
    [clusterData, eventLocations.features.length, eventLocations.features[0]?.properties?.eventId]
  );

  // Individual event markers - use event type icons
  const pointLayer = useMemo(() => {
    if (!eventIconAtlas) return null;
    return new IconLayer<any>({
      id: 'event-point-layer',
      data: pointData,
      pickable: true,
      getPosition: (d) => d.coordinates,
      iconAtlas: eventIconAtlas.image.src,
      iconMapping: eventIconAtlas.mapping,
      getIcon: (d) => d.eventType,
      getSize: 48,
      onClick: handleClick,
      updateTriggers: {
        getPosition: [eventLocations.features.length, eventLocations.features[0]?.properties?.eventId || ''],
        getIcon: [eventLocations.features.length, eventLocations.features[0]?.properties?.eventId || ''],
      },
    });
  }, [
    pointData,
    handleClick,
    eventIconAtlas,
    eventLocations.features.length,
    eventLocations.features[0]?.properties?.eventId,
  ]);

  const handleMapReady = useCallback(
    (map: maplibregl.Map) => {
      mapRef.current = map;
      const updateBoundsAndZoom = () => {
        const b = map.getBounds();
        setBounds([b.getWest(), b.getSouth(), b.getEast(), b.getNorth()]);
        setZoom(map.getZoom());
      };
      updateBoundsAndZoom();
      map.on('moveend', updateBoundsAndZoom);
      map.on('zoomend', updateBoundsAndZoom);
      const overlay = new MapboxOverlay({
        layers: [clusterLayer, clusterTextLayer, pointLayer].filter(Boolean),
        interleaved: false,
      });
      overlayRef.current = overlay;
      map.addControl(overlay);

      return () => {
        if (overlayRef.current) {
          map.removeControl(overlayRef.current);
          overlayRef.current = null;
        }
      };
    },
    [clusterLayer, clusterTextLayer, pointLayer]
  );

  // Update overlay when layers change
  useEffect(() => {
    if (overlayRef.current) {
      overlayRef.current.setProps({
        layers: [clusterLayer, clusterTextLayer, pointLayer].filter(Boolean),
      });
    }
  }, [clusterLayer, clusterTextLayer, pointLayer]);

  useEffect(() => {
    if (activeMarker && mapRef.current && mapContainerRef.current) {
      const { x, y } = mapRef.current.project(activeMarker.lngLat);
      const rect = mapContainerRef.current.getBoundingClientRect();
      setPopoverPos({
        x: rect.left + x,
        y: rect.top + y,
      });
    } else {
      setPopoverPos(null);
    }
  }, [activeMarker]);

  // Get address for popover
  const getAddressForEvent = useCallback(
    (event: EventLocationFeatureProperties) => {
      const originalFeature = eventLocations?.features.find((f) => f.properties?.eventId === event.eventId);
      if (originalFeature) {
        return getGeoJsonFeatureLabel(originalFeature);
      }
      return 'Event location';
    },
    [eventLocations]
  );

  if (!eventLocations || !eventIconAtlas) {
    return (
      <div className="w-full h-96 bg-gray-100 rounded-lg flex items-center justify-center">
        <div className="text-gray-500">Loading events map...</div>
      </div>
    );
  }

  if (eventLocations.features.length === 0) {
    return (
      <div className="w-full h-96 bg-gray-50 rounded-lg flex items-center justify-center">
        <div className="text-gray-500">No events found for this search</div>
      </div>
    );
  }

  return (
    <>
      <BaseMapLibreMap ref={mapContainerRef} mapStyleUrl={SATELLITE_STYLE_URL} onMapReady={handleMapReady} />
      {activeMarker && popoverPos && (
        <EventPopover
          event={activeMarker.event}
          address={getAddressForEvent(activeMarker.event)}
          x={popoverPos.x}
          y={popoverPos.y}
          onClose={() => setActiveMarker(null)}
        />
      )}
    </>
  );
};

export default EventsMap;

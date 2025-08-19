'use client';

import { useMemo, useRef, useEffect, useState, useCallback } from 'react';
import Supercluster from 'supercluster';
import { ScatterplotLayer, TextLayer, IconLayer } from '@deck.gl/layers';
import { MapboxOverlay } from '@deck.gl/mapbox';
import type { PickingInfo } from '@deck.gl/core';

import BaseMapLibreMap from '../geocode/BaseMapLibreMap';
import { getGeoJsonFeatureLabel, isCluster, isPointFeature } from '@/components/_utils/geojson';
import EventPopover from './EventPopover';
import type {
  ClusterDatum,
  ClusterFeature,
  EventLocationFeatureCollection,
  EventLocationFeatureProperties,
  EventLocationPointDatum,
} from '@/types/model';
import { EVENT_ICONS } from '@/config/constants';

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

  // 1) Create the supercluster index
  const clusterIndex = useMemo(() => {
    const index = new Supercluster<EventLocationFeatureProperties, ClusterFeature>({ radius: 40, maxZoom: 12 });
    index.load(eventLocations.features.filter(isPointFeature));
    return index;
  }, [eventLocations]);

  // 2) Derive clusters from the *current* index, bounds and zoom
  const clusters = useMemo(() => {
    if (!clusterIndex || !bounds) return [];
    return clusterIndex.getClusters(bounds, Math.round(zoom));
  }, [clusterIndex, bounds, zoom]);

  // Separate clusters and individual points
  const { clusterData, pointData } = useMemo(() => {
    const clusterArray: ClusterDatum[] = [];
    const pointArray: EventLocationPointDatum[] = [];

    clusters.forEach((feature) => {
      const [longitude, latitude] = feature.geometry.coordinates;
      if (isCluster(feature)) {
        clusterArray.push({
          coordinates: [longitude, latitude] as [number, number],
          point_count: feature.properties.point_count,
        });
      } else {
        pointArray.push({
          ...feature.properties,
          coordinates: [longitude, latitude] as [number, number],
          eventType: feature.properties.eventType || 'general',
        });
      }
    });
    return { clusterData: clusterArray, pointData: pointArray };
  }, [clusters]);

  const handleClick = useCallback((info: PickingInfo<EventLocationPointDatum>) => {
    if (info?.object) {
      setActiveMarker({
        event: info.object,
        lngLat: info.object.coordinates,
      });
    }
  }, []);

  const layers = [
    // ScatterplotLayer for clusters (circles)
    new ScatterplotLayer<ClusterDatum>({
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
    }),

    // TextLayer for cluster counts
    new TextLayer<ClusterDatum>({
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
    }),

    // Individual event markers - use event type icons
    new IconLayer<EventLocationPointDatum>({
      id: 'event-point-layer',
      data: pointData,
      pickable: true,
      getPosition: (d) => d.coordinates,
      // Auto-packing mode: return an object with url/width/height
      getIcon: (d) => ({ url: EVENT_ICONS[d.eventType] ?? EVENT_ICONS.general, width: 64, height: 64, mask: false }),
      getSize: 48,
      sizeUnits: 'pixels',
      onClick: handleClick,
    }),
  ].filter(Boolean);

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
      const overlay = new MapboxOverlay({ layers, interleaved: false });
      overlayRef.current = overlay;
      map.addControl(overlay);
      return () => {
        if (overlayRef.current) {
          map.removeControl(overlayRef.current);
          overlayRef.current = null;
        }
      };
    },
    [layers]
  );

  useEffect(() => {
    if (overlayRef.current) {
      overlayRef.current.setProps({ layers });
    }
  }, [layers]);

  useEffect(() => {
    if (!activeMarker || !mapRef.current || !mapContainerRef.current) return;

    const update = () => {
      if (!mapRef.current || !mapContainerRef.current) return;
      const { x, y } = mapRef.current.project(activeMarker.lngLat);
      const rect = mapContainerRef.current.getBoundingClientRect();
      setPopoverPos({ x: rect.left + x, y: rect.top + y });
    };

    update();
    mapRef.current.on('move', update);
    return () => {
      mapRef.current?.off('move', update);
    };
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

  if (!eventLocations) {
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
      {activeMarker && (
        <EventPopover
          event={activeMarker.event}
          address={getAddressForEvent(activeMarker.event)}
          x={popoverPos?.x || 0}
          y={popoverPos?.y || 0}
          onClose={() => setActiveMarker(null)}
        />
      )}
    </>
  );
};

export default EventsMap;

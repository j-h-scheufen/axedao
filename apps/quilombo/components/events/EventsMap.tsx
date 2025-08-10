'use client';

import { useMemo, useRef, useEffect, useState, useCallback } from 'react';
import Supercluster from 'supercluster';
import { IconLayer, ScatterplotLayer, TextLayer } from '@deck.gl/layers';
import { MapboxOverlay } from '@deck.gl/mapbox';
import type { PickingInfo } from '@deck.gl/core';
import { useAtomValue } from 'jotai';
import { Calendar, Clock, MapPin } from 'lucide-react';

import BaseMapLibreMap from '../geocode/BaseMapLibreMap';
import { getGeoJsonFeatureLabel } from '@/components/_utils/geojson';
import type { EventLocationFeatureCollection, EventLocationFeatureProperties } from '@/types/model';

const SATELLITE_STYLE_URL = 'https://api.maptiler.com/maps/satellite/style.json';

interface EventsMapProps {
  eventLocations: EventLocationFeatureCollection;
}

// Event popover component
const EventPopover = ({
  event,
  address,
  x,
  y,
  onClose,
}: {
  event: EventLocationFeatureProperties;
  address: string;
  x: number;
  y: number;
  onClose: () => void;
}) => {
  const formatDate = (dateString: string, isAllDay: boolean) => {
    const date = new Date(dateString);
    if (isAllDay) {
      return date.toLocaleDateString();
    }
    return date.toLocaleString();
  };

  return (
    <div
      className="fixed z-50 bg-white rounded-lg shadow-lg border p-4 max-w-sm"
      style={{
        left: x + 10,
        top: y - 10,
        transform: 'translateY(-100%)',
      }}
    >
      <div className="flex justify-between items-start mb-2">
        <h3 className="font-semibold text-gray-900 line-clamp-2">{event.eventName}</h3>
        <button type="button" onClick={onClose} className="text-gray-400 hover:text-gray-600 ml-2">
          ×
        </button>
      </div>

      {event.eventDescription && <p className="text-sm text-gray-600 mb-2 line-clamp-2">{event.eventDescription}</p>}

      <div className="space-y-1 text-sm">
        <div className="flex items-center text-gray-600">
          <Calendar className="w-4 h-4 mr-2" />
          <span>{formatDate(event.eventStart, event.eventIsAllDay)}</span>
        </div>

        {event.eventEnd && (
          <div className="flex items-center text-gray-600">
            <Clock className="w-4 h-4 mr-2" />
            <span>Until {formatDate(event.eventEnd, event.eventIsAllDay)}</span>
          </div>
        )}

        <div className="flex items-center text-gray-600">
          <MapPin className="w-4 h-4 mr-2" />
          <span className="line-clamp-1">{address}</span>
        </div>
      </div>

      <div className="mt-2 pt-2 border-t">
        <span className="inline-block px-2 py-1 text-xs font-medium bg-blue-100 text-blue-800 rounded">
          {event.eventType}
        </span>
      </div>
    </div>
  );
};

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
        });
      } else {
        pointArray.push({
          ...feature.properties,
          coordinates: [longitude, latitude] as [number, number],
        });
      }
    });
    return { clusterData: clusterArray, pointData: pointArray };
  }, [clusters]);

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
        getFillColor: [59, 130, 246, 200], // Blue color for events
        getLineColor: [255, 255, 255, 200],
        getLineWidth: 2,
        stroked: true,
        filled: true,
        opacity: 0.9,
        radiusMinPixels: 15,
        radiusMaxPixels: 80,
      }),
    [clusterData]
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
      }),
    [clusterData]
  );

  // Individual event markers - use blue color to distinguish from groups
  const pointLayer = useMemo(
    () =>
      new ScatterplotLayer<any>({
        id: 'event-point-layer',
        data: pointData,
        pickable: true,
        getPosition: (d) => d.coordinates,
        getRadius: 12,
        radiusUnits: 'pixels',
        getFillColor: [59, 130, 246, 255], // Blue color for events
        getLineColor: [255, 255, 255, 255],
        getLineWidth: 2,
        lineWidthUnits: 'pixels',
        stroked: true,
        filled: true,
        onClick: handleClick,
      }),
    [pointData, handleClick]
  );

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

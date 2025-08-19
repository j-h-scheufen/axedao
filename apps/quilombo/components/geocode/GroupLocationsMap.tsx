'use client';

import { useMemo, useRef, useEffect, useState, useCallback } from 'react';
import Supercluster from 'supercluster';
import { IconLayer, ScatterplotLayer, TextLayer } from '@deck.gl/layers';
import { MapboxOverlay } from '@deck.gl/mapbox';
import type { PickingInfo } from '@deck.gl/core';
import { useAtomValue } from 'jotai';

import { groupLogoAtlasAtom } from '@/hooks/state/location';
import BaseMapLibreMap from './BaseMapLibreMap';
import { getGeoJsonFeatureLabel, isCluster, isPointFeature } from '@/components/_utils/geojson';
import GroupLocationPopover from './GroupLocationPopover';
import type {
  ClusterDatum,
  ClusterFeature,
  GroupLocationFeatureCollection,
  GroupLocationFeatureProperties,
  GroupLocationPointDatum,
} from '@/types/model';

const SATELLITE_STYLE_URL = 'https://api.maptiler.com/maps/satellite/style.json';

interface GroupLocationsMapProps {
  locations: GroupLocationFeatureCollection;
}

const GroupLocationsMap = ({ locations }: GroupLocationsMapProps) => {
  const groupLogoAtlas = useAtomValue(groupLogoAtlasAtom);

  // Add state for bounds and zoom
  const [bounds, setBounds] = useState<[number, number, number, number] | null>(null);
  const [zoom, setZoom] = useState(1);
  const overlayRef = useRef<MapboxOverlay | null>(null);
  const [activeMarker, setActiveMarker] = useState<{
    location: GroupLocationFeatureProperties;
    lngLat: [number, number];
  } | null>(null);
  const [popoverPos, setPopoverPos] = useState<{ x: number; y: number } | null>(null);
  const mapRef = useRef<maplibregl.Map | null>(null);
  const mapContainerRef = useRef<HTMLDivElement | null>(null);

  const handleClick = useCallback((info: PickingInfo<GroupLocationPointDatum>) => {
    if (info?.object) {
      setActiveMarker({
        location: info.object,
        lngLat: info.object.coordinates,
      });
    }
  }, []);

  // 1) Create the supercluster index
  const clusterIndex = useMemo(() => {
    const index = new Supercluster<GroupLocationFeatureProperties, ClusterFeature>({ radius: 40, maxZoom: 12 });
    index.load(locations.features.filter(isPointFeature));
    return index;
  }, [locations]);

  // 2) Derive clusters from the *current* index, bounds and zoom
  const clusters = useMemo(() => {
    if (!clusterIndex || !bounds) return [];
    return clusterIndex.getClusters(bounds, Math.round(zoom));
  }, [clusterIndex, bounds, zoom]);

  // Separate clusters and individual points
  const { clusterData, pointData } = useMemo(() => {
    const clusterArray: Array<{ coordinates: [number, number]; point_count: number }> = [];
    const pointArray: Array<GroupLocationFeatureProperties & { coordinates: [number, number]; icon: string }> = [];

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
          icon: feature.properties.groupLogo ? feature.properties.groupId : 'fallback',
        });
      }
    });
    return { clusterData: clusterArray, pointData: pointArray };
  }, [clusters]);

  const layers = [
    // ScatterplotLayer for clusters (circles)
    new ScatterplotLayer<ClusterDatum>({
      id: 'cluster-layer',
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
      id: 'cluster-text-layer',
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

    // Individual group markers with white border (composite approach)
    new ScatterplotLayer<GroupLocationPointDatum>({
      id: 'point-border-layer',
      data: pointData,
      pickable: false,
      getPosition: (d) => d.coordinates,
      getRadius: 17,
      radiusUnits: 'pixels',
      getLineColor: [255, 255, 255, 255],
      getLineWidth: 2,
      lineWidthUnits: 'pixels',
      stroked: true,
      filled: false,
    }),

    // IconLayer for group logos (only render when atlas is ready)
    groupLogoAtlas &&
      new IconLayer<GroupLocationPointDatum>({
        id: 'point-icon-layer',
        data: pointData,
        pickable: true,
        getPosition: (d) => d.coordinates,
        iconAtlas: groupLogoAtlas.image.src,
        iconMapping: groupLogoAtlas.mapping,
        getIcon: (d) => (d.icon in groupLogoAtlas.mapping ? d.icon : 'fallback'),
        getSize: 32,
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
  const getAddressForLocation = useCallback(
    (location: GroupLocationFeatureProperties) => {
      const originalFeature = locations?.features.find((f) => f.properties?.locationId === location.locationId);
      if (originalFeature) {
        return getGeoJsonFeatureLabel(originalFeature);
      }
      return location.locationName || 'Unknown location';
    },
    [locations]
  );

  if (!locations || !groupLogoAtlas) {
    return (
      <div className="w-full h-96 bg-gray-100 rounded-lg flex items-center justify-center">
        <div className="text-gray-500">Loading map...</div>
      </div>
    );
  }

  if (locations.features.length === 0) {
    return (
      <div className="w-full h-96 bg-gray-50 rounded-lg flex items-center justify-center">
        <div className="text-gray-500">No locations found for this search</div>
      </div>
    );
  }

  return (
    <>
      <BaseMapLibreMap ref={mapContainerRef} mapStyleUrl={SATELLITE_STYLE_URL} onMapReady={handleMapReady} />
      {activeMarker && (
        <GroupLocationPopover
          location={activeMarker.location}
          address={getAddressForLocation(activeMarker.location)}
          x={popoverPos?.x || 0}
          y={popoverPos?.y || 0}
          onClose={() => setActiveMarker(null)}
        />
      )}
    </>
  );
};

export default GroupLocationsMap;

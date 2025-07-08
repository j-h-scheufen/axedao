'use client';

import { useMemo, useRef, useEffect, useState, useCallback } from 'react';
import Supercluster from 'supercluster';
import { IconLayer, ScatterplotLayer, TextLayer } from '@deck.gl/layers';
import { MapboxOverlay } from '@deck.gl/mapbox';
import type { PickingInfo } from '@deck.gl/core';
import { useAtomValue, useSetAtom } from 'jotai';

import { locationsAtom, groupLogoAtlasAtom } from '@/hooks/state/location';
import BaseMapLibreMap from './BaseMapLibreMap';
import { getGeoJsonFeatureLabel } from '@/components/_utils/geojson';
import GroupLocationPopover from './GroupLocationPopover';
import type { GroupLocationFeatureProperties } from '@/types/model';

const SATELLITE_STYLE_URL = 'https://api.maptiler.com/maps/satellite/style.json';

const GroupLocationsMap = () => {
  const { data: locations, isPending, error } = useAtomValue(locationsAtom);
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

  // Prepare GeoJSON features for supercluster
  const geojsonPoints = useMemo(() => {
    if (!locations) return [];
    return locations.features
      .filter((f) => f.geometry.type === 'Point')
      .map((feature) => ({
        type: 'Feature',
        geometry: feature.geometry,
        properties: {
          ...feature.properties,
        },
      }));
  }, [locations]);

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
          icon: feature.properties.groupLogo ? feature.properties.groupId : 'fallback',
        });
      }
    });
    return { clusterData: clusterArray, pointData: pointArray };
  }, [clusters]);

  // ScatterplotLayer for clusters (circles)
  const clusterLayer = useMemo(
    () =>
      new ScatterplotLayer<any>({
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
    [clusterData]
  );

  // TextLayer for cluster counts
  const clusterTextLayer = useMemo(
    () =>
      new TextLayer<any>({
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
    [clusterData]
  );

  // Individual point markers with white border (composite approach)
  const pointBorderLayer = useMemo(
    () =>
      new ScatterplotLayer<any>({
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
    [pointData]
  );

  const handleClick = useCallback((info: PickingInfo) => {
    if (info?.object) {
      setActiveMarker({
        location: info.object as GroupLocationFeatureProperties,
        lngLat: info.object.coordinates,
      });
    }
  }, []);

  // IconLayer for group logos (only render when atlas is ready)
  const pointIconLayer = useMemo(() => {
    if (!groupLogoAtlas) {
      console.log('[Map] groupLogoAtlas not ready');
      return null;
    }
    console.log('[Map] groupLogoAtlas mapping:', groupLogoAtlas.mapping);
    console.log('[Map] groupLogoAtlas image src:', groupLogoAtlas.image.src);
    console.log(
      '[Map] pointData:',
      pointData.map((d) => ({ icon: d.icon, coordinates: d.coordinates }))
    );
    return new IconLayer<any>({
      id: 'point-icon-layer',
      data: pointData,
      pickable: true,
      getPosition: (d) => d.coordinates,
      iconAtlas: groupLogoAtlas.image.src,
      iconMapping: groupLogoAtlas.mapping,
      getIcon: (d) => (d.icon in groupLogoAtlas.mapping ? d.icon : 'fallback'),
      getSize: 32,
      onClick: handleClick,
    });
  }, [pointData, handleClick, groupLogoAtlas]);

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
        layers: [clusterLayer, clusterTextLayer, pointBorderLayer, pointIconLayer].filter(Boolean),
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
    [clusterLayer, clusterTextLayer, pointBorderLayer, pointIconLayer]
  );

  useEffect(() => {
    if (overlayRef.current) {
      overlayRef.current.setProps({
        layers: [clusterLayer, clusterTextLayer, pointBorderLayer, pointIconLayer].filter(Boolean),
      });
    }
  }, [clusterLayer, clusterTextLayer, pointBorderLayer, pointIconLayer]);

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

  if (isPending) {
    return (
      <div className="w-full h-96 bg-gray-100 rounded-lg flex items-center justify-center">
        <div className="text-gray-500">Loading map...</div>
      </div>
    );
  }

  if (error) {
    console.error('GroupLocationsMap error:', error);
    return (
      <div className="w-full h-96 bg-red-50 rounded-lg flex items-center justify-center">
        <div className="text-red-500">Error loading map data</div>
      </div>
    );
  }

  if (!locations || locations.features.length === 0) {
    return (
      <div className="w-full h-96 bg-gray-50 rounded-lg flex items-center justify-center">
        <div className="text-gray-500">No locations available</div>
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

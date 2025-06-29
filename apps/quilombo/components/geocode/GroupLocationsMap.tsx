'use client';

import { useMemo, useRef, useEffect, useState, useCallback } from 'react';
import Supercluster from 'supercluster';
import { IconLayer } from '@deck.gl/layers';
import { MapboxOverlay } from '@deck.gl/mapbox';
import { useAtomValue } from 'jotai';

import { locationsAtom } from '@/hooks/state/location';
import BaseMapLibreMap from './BaseMapLibreMap';
import { getImageUrl } from '@/utils';

const SATELLITE_STYLE_URL = 'https://api.maptiler.com/maps/satellite/style.json';

const GroupLocationsMap = () => {
  const { data: locations, isPending, error } = useAtomValue(locationsAtom);

  // Add state for bounds and zoom
  const [bounds, setBounds] = useState<[number, number, number, number] | null>(null);
  const [zoom, setZoom] = useState(1);
  const overlayRef = useRef<MapboxOverlay | null>(null);

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
          icon: getImageUrl(feature.properties?.groupLogo) || '/favicon-16x16.png',
        },
      }));
  }, [locations]);

  // Setup supercluster index
  const superclusterRef = useRef<Supercluster<{ icon: string; groupId?: string; name?: string }>>(null);
  useEffect(() => {
    if (geojsonPoints.length > 0) {
      superclusterRef.current = new Supercluster<{ icon: string; groupId?: string; name?: string }>({
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

  // Prepare data for IconLayer: clusters and points
  const markerData = useMemo(() => {
    const data = clusters.map((feature: any) => {
      const [longitude, latitude] = feature.geometry.coordinates;
      if (feature.properties.cluster) {
        // Cluster marker
        return {
          icon: '/favicon-16x16.png', // Use a special cluster icon if you want
          coordinates: [longitude, latitude] as [number, number],
          point_count: feature.properties.point_count,
          cluster: true,
        };
      }
      // Single point marker
      return {
        icon: feature.properties.icon,
        groupId: feature.properties.groupId,
        name: feature.properties.name,
        coordinates: [longitude, latitude] as [number, number],
        cluster: false,
      };
    });
    return data;
  }, [clusters]);

  const iconLayer = useMemo(
    () =>
      new IconLayer<any>({
        id: 'group-locations-icon-layer',
        data: markerData,
        pickable: true,
        getPosition: (d) => d.coordinates,
        iconAtlas: '/favicon-16x16.png',
        iconMapping: {
          marker: { x: 0, y: 0, width: 16, height: 16, mask: false },
        },
        getIcon: (d) => 'marker',
        getSize: 32,
        getColor: (d) => (d.cluster ? [0, 128, 255, 200] : [255, 255, 255]),
      }),
    [markerData]
  );

  const handleMapReady = useCallback(
    (map: maplibregl.Map) => {
      // Set initial bounds and zoom
      const updateBoundsAndZoom = () => {
        const b = map.getBounds();
        setBounds([b.getWest(), b.getSouth(), b.getEast(), b.getNorth()]);
        setZoom(map.getZoom());
      };
      updateBoundsAndZoom();
      map.on('moveend', updateBoundsAndZoom);
      map.on('zoomend', updateBoundsAndZoom);

      // Create and add deck.gl overlay
      const overlay = new MapboxOverlay({ layers: [iconLayer], interleaved: false });
      overlayRef.current = overlay;
      map.addControl(overlay);

      // Cleanup function for the overlay
      return () => {
        if (overlayRef.current) {
          map.removeControl(overlayRef.current);
          overlayRef.current = null;
        }
      };
    },
    [iconLayer]
  );

  // Update deck.gl overlay when iconLayer changes
  useEffect(() => {
    if (overlayRef.current) {
      overlayRef.current.setProps({ layers: [iconLayer] });
    }
  }, [iconLayer]);

  // Now do conditional rendering
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

  return <BaseMapLibreMap mapStyleUrl={SATELLITE_STYLE_URL} onMapReady={handleMapReady} />;
};

export default GroupLocationsMap;

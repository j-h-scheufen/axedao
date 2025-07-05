'use client';

import { useMemo, useRef, useEffect, useState, useCallback } from 'react';
import Supercluster from 'supercluster';
import { IconLayer, ScatterplotLayer, TextLayer } from '@deck.gl/layers';
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
          icon: getImageUrl(feature.properties?.groupLogo) || '/favicon-32x32.png',
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

  // Separate clusters and individual points
  const { clusterData, pointData } = useMemo(() => {
    const clusterArray: any[] = [];
    const pointArray: any[] = [];

    clusters.forEach((feature: any) => {
      const [longitude, latitude] = feature.geometry.coordinates;
      if (feature.properties.cluster) {
        // Cluster data
        clusterArray.push({
          coordinates: [longitude, latitude] as [number, number],
          point_count: feature.properties.point_count,
        });
      } else {
        // Individual point data
        pointArray.push({
          icon: feature.properties.icon,
          groupId: feature.properties.groupId,
          name: feature.properties.name,
          coordinates: [longitude, latitude] as [number, number],
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
        getRadius: (d) => Math.max(20, 15 + Math.log2(d.point_count) * 6), // Smaller circles
        getFillColor: [127, 217, 42, 200], // Primary color from HeroUI theme with transparency
        getLineColor: [255, 255, 255, 200], // White border with transparency
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
        getColor: [255, 255, 255], // White text
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

  const pointIconLayer = useMemo(
    () =>
      new IconLayer<any>({
        id: 'point-icon-layer',
        data: pointData,
        pickable: true,
        getPosition: (d) => d.coordinates,
        iconAtlas: '/favicon-32x32.png',
        iconMapping: {
          marker: { x: 0, y: 0, width: 32, height: 32, mask: false },
        },
        getIcon: (d) => 'marker',
        getSize: 32,
      }),
    [pointData]
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

      // Create and add deck.gl overlay with all layers
      const overlay = new MapboxOverlay({
        layers: [clusterLayer, clusterTextLayer, pointBorderLayer, pointIconLayer],
        interleaved: false,
      });
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
    [clusterLayer, clusterTextLayer, pointBorderLayer, pointIconLayer]
  );

  // Update deck.gl overlay when layers change
  useEffect(() => {
    if (overlayRef.current) {
      overlayRef.current.setProps({
        layers: [clusterLayer, clusterTextLayer, pointBorderLayer, pointIconLayer],
      });
    }
  }, [clusterLayer, clusterTextLayer, pointBorderLayer, pointIconLayer]);

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

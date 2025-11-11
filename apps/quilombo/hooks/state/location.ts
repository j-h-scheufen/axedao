import { atomWithQuery } from 'jotai-tanstack-query';
import { atom } from 'jotai';

import { fetchLocationsOptions } from '@/query/location';
import type { GroupLocationFeatureCollection } from '@/types/model';

// Global locations for map view
export const locationsAtom = atomWithQuery<GroupLocationFeatureCollection>(() => fetchLocationsOptions());

export const filteredLocationsAtom = atom<GroupLocationFeatureCollection | null>(null);

// --- Sprite Atlas for Group Logos ---
// This atom depends on locationsAtom and builds a sprite atlas for group logos using Next.js image optimization API.
// It returns { image: HTMLImageElement, mapping: ... } or null if not ready.

export interface GroupLogoAtlas {
  image: HTMLImageElement;
  mapping: Record<string, { x: number; y: number; width: number; height: number; mask: boolean }>;
}

const FALLBACK_ICON = '/favicon-32x32.png';
const ICON_SIZE = 32;
const ICON_PADDING = 2;
const ICONS_PER_ROW = 8;

// Utility to load an image as a Promise
const loadImage = (src: string) =>
  new Promise<HTMLImageElement>((resolve, reject) => {
    const img = new window.Image();
    img.crossOrigin = 'anonymous';
    img.onload = () => resolve(img);
    img.onerror = reject;
    img.src = src;
  });

// Helper to get the API image URL for a given groupLogo CID
function getApiImageUrl(cid: string | undefined): string {
  if (!cid) return FALLBACK_ICON;
  return `/api/image?cid=${encodeURIComponent(cid)}`;
}

// Derived atom: builds the atlas when locations change
export const groupLogoAtlasAtom = atom(async (get) => {
  const locations = get(locationsAtom).data;
  if (!locations) return null;
  const iconEntries = locations.features.map((feature) => {
    const cid = feature.properties?.groupLogo;
    const url = getApiImageUrl(cid);
    return {
      iconName: !cid ? 'fallback' : feature.properties.groupId,
      url,
    };
  });
  const uniqueEntries = [
    { iconName: 'fallback', url: FALLBACK_ICON },
    ...iconEntries.filter(
      (entry, idx, arr) => entry.url !== FALLBACK_ICON && arr.findIndex((e) => e.iconName === entry.iconName) === idx
    ),
  ];
  const images = await Promise.all(uniqueEntries.map((e) => loadImage(e.url)));
  const rows = Math.ceil(images.length / ICONS_PER_ROW);
  const canvas = document.createElement('canvas');
  canvas.width = ICONS_PER_ROW * (ICON_SIZE + ICON_PADDING) - ICON_PADDING;
  canvas.height = rows * (ICON_SIZE + ICON_PADDING) - ICON_PADDING;
  const ctx = canvas.getContext('2d');
  if (!ctx) throw new Error('Failed to get 2d context');
  const mapping: Record<string, { x: number; y: number; width: number; height: number; mask: boolean }> = {};
  images.forEach((img, i) => {
    const x = (i % ICONS_PER_ROW) * (ICON_SIZE + ICON_PADDING);
    const y = Math.floor(i / ICONS_PER_ROW) * (ICON_SIZE + ICON_PADDING);
    ctx.drawImage(img, x, y, ICON_SIZE, ICON_SIZE);
    mapping[uniqueEntries[i].iconName] = {
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
  return { image: atlasImg, mapping };
});

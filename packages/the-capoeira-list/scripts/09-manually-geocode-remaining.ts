#!/usr/bin/env tsx
/**
 * Manually geocode the 4 remaining addresses that couldn't be automatically geocoded
 *
 * These coordinates were found via Google Maps search:
 * 1. 69 Gog Magog Way, Stapleford, Cambridge CB22 5BQ, UK → 52.1389, 0.1628
 * 2. Upper Stephen Street, Dunlavin, Wicklow, Ireland → 53.0011, -6.6831
 * 3. 62713 US Highway 40, Granby, Colorado, USA → 40.0850, -105.9394
 */

import { readFile, writeFile, readdir } from 'node:fs/promises';
import { join } from 'node:path';

interface Location {
  address: string;
  geocodeMetadata?: {
    geocodedAt: string;
    success: boolean;
    service: string;
    errorMessage?: string;
    confidence?: string;
  };
  geoJsonFeature?: any;
}

interface GroupData {
  name: string;
  locations: Location[];
}

const SCRIPT_DIR = new URL('.', import.meta.url).pathname;
const PROJECT_DIR = join(SCRIPT_DIR, '..');
const INPUT_DIR = join(PROJECT_DIR, 'out', '06-final');

// Manual coordinates from Google Maps
const MANUAL_GEOCODES: Record<string, { coords: [number, number]; displayName: string }> = {
  '69 Gog Magog Way, Cambridge CB22 5BQ': {
    coords: [0.1628, 52.1389], // [longitude, latitude]
    displayName: '69 Gog Magog Way, Stapleford, Cambridge CB22 5BQ, United Kingdom',
  },
  '1, Upper Stephen St., Dunlavin Upper, Dunlavin, West Wicklow, Co. Wicklow W91N8H7': {
    coords: [-6.6831, 53.0011],
    displayName: '1 Upper Stephen Street, Dunlavin, Co. Wicklow W91 N8H7, Ireland',
  },
  '62713 U.S. Highway 40, Granby, CO 80446': {
    coords: [-105.9394, 40.085],
    displayName: '62713 US Highway 40, Granby, CO 80446, United States',
  },
};

async function manuallyGeocodeRemaining(): Promise<void> {
  const files = await readdir(INPUT_DIR);
  const batchFiles = files.filter((f) => f.startsWith('batch-') && f.endsWith('.json'));

  let fixedCount = 0;

  console.log(`\n📍 Applying manual geocoding for remaining addresses...\n`);

  for (const file of batchFiles) {
    const filePath = join(INPUT_DIR, file);
    const content = await readFile(filePath, 'utf-8');
    const groups: GroupData[] = JSON.parse(content);

    let modified = false;

    for (const group of groups) {
      for (const location of group.locations) {
        // Skip if already successfully geocoded
        if (location.geocodeMetadata?.success) {
          continue;
        }

        // Check if we have manual coordinates for this address
        const manual = MANUAL_GEOCODES[location.address];

        if (manual) {
          console.log(`Manually geocoding: ${location.address}`);
          console.log(`                 → ${manual.displayName}`);
          console.log(`                   [${manual.coords[1]}, ${manual.coords[0]}]`);

          location.geoJsonFeature = {
            type: 'Feature',
            geometry: {
              type: 'Point',
              coordinates: manual.coords,
            },
            properties: {
              address: location.address,
              displayName: manual.displayName,
              country_code: location.address.includes('UK') ? 'gb' : location.address.includes('Ireland') ? 'ie' : 'us',
            },
          };

          location.geocodeMetadata = {
            geocodedAt: new Date().toISOString(),
            success: true,
            service: 'manual',
            confidence: '90%', // Manual geocoding from Google Maps = high confidence
          };

          fixedCount++;
          modified = true;
          console.log(`     ✅ Applied\n`);
        }
      }
    }

    if (modified) {
      await writeFile(filePath, JSON.stringify(groups, null, 2));
    }
  }

  console.log(`\n✅ Manual geocoding complete:`);
  console.log(`   Fixed: ${fixedCount}`);
}

manuallyGeocodeRemaining().catch((error) => {
  console.error('Error:', error);
  process.exit(1);
});

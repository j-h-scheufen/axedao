#!/usr/bin/env tsx
/**
 * Fix addresses that failed to geocode by simplifying/correcting them
 */

import { readFile, writeFile, readdir } from 'node:fs/promises';
import { join } from 'node:path';

interface Location {
  name?: string | null;
  address: string;
  rawText: string;
  geocodeMetadata?: {
    geocodedAt: string;
    success: boolean;
    service: 'nominatim';
    errorMessage?: string;
    confidence?: string;
  };
  geoJsonFeature?: any;
}

interface GroupData {
  name: string;
  website: string;
  locations: Location[];
}

const SCRIPT_DIR = new URL('.', import.meta.url).pathname;
const PROJECT_DIR = join(SCRIPT_DIR, '..');
const INPUT_DIR = join(PROJECT_DIR, 'out', '06-final');

// Nominatim API configuration
const NOMINATIM_BASE_URL = 'https://nominatim.openstreetmap.org';
const REQUEST_DELAY = 1100;
const USER_AGENT = 'CapoeiraListProject/1.0 (github.com/j-h-scheufen/axedao)';

function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

/**
 * Manual address corrections for failed geocodes
 */
const ADDRESS_FIXES: Record<string, string> = {
  // UK addresses - simplify to essentials
  '69 Gog Magog Way, Cambridge CB22 5BQ': '69 Gog Magog Way, Stapleford, Cambridge, UK',
  "St Mark's Church, Wentworth Terrace, Sunderland, SR4 7AD": 'Wentworth Terrace, Sunderland SR4 7AD, UK',

  // Ireland addresses - remove building names, keep essential info
  "Core 3, St Kevins, French Mullen House, Charlemont St, Saint Kevin's, Dublin 2, D02 Y993":
    'Charlemont Street, Dublin 2, Ireland',
  'Old Airport Rd, Toberbunny, Co. Dublin, K67 YV06': 'Old Airport Road, Dublin, Ireland',
  '1, Upper Stephen St., Dunlavin Upper, Dunlavin, West Wicklow, Co. Wicklow W91N8H7':
    'Upper Stephen Street, Dunlavin, Wicklow, Ireland',

  // US addresses - add state names, simplify
  '11048 Baymeadows Rd Unit 4, Jacksonville, FL': '11048 Baymeadows Road, Jacksonville, Florida, USA',
  '8802 Corporate Square Ct Suite 404, Jacksonville, FL': '8802 Corporate Square Court, Jacksonville, Florida, USA',
  '62713 U.S. Highway 40, Granby, CO 80446': '62713 US Highway 40, Granby, Colorado, USA',

  // South Korea - simplify to city
  'Park across from Wolpyeong Station / Indoor if inclement weather, Daejeon, South Korea':
    'Wolpyeong Station, Daejeon, South Korea',

  // Brooklyn park - just use the park name and borough
  'Lincoln Terrace Park, Crown Heights, Brooklyn, NY': 'Lincoln Terrace Park, Brooklyn, New York, USA',
};

async function geocodeAddress(address: string): Promise<any | null> {
  try {
    const url = new URL('/search', NOMINATIM_BASE_URL);
    url.searchParams.set('q', address);
    url.searchParams.set('format', 'geojson');
    url.searchParams.set('limit', '1');
    url.searchParams.set('addressdetails', '1');

    const response = await fetch(url.toString(), {
      headers: {
        'User-Agent': USER_AGENT,
      },
    });

    if (!response.ok) {
      throw new Error(`HTTP ${response.status}: ${response.statusText}`);
    }

    const data = await response.json();

    if (data.features && data.features.length > 0) {
      const feature = data.features[0];
      return {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: feature.geometry.coordinates,
        },
        properties: {
          address: address,
          displayName: feature.properties.display_name,
          country_code: feature.properties.address?.country_code,
          boundingBox: feature.bbox ? [feature.bbox[1], feature.bbox[3], feature.bbox[0], feature.bbox[2]] : undefined,
        },
      };
    }

    return null;
  } catch (error) {
    console.error(`Failed to geocode "${address}":`, error);
    return null;
  }
}

async function fixFailedGeocodes(): Promise<void> {
  const files = await readdir(INPUT_DIR);
  const batchFiles = files.filter((f) => f.startsWith('batch-') && f.endsWith('.json'));

  let fixedCount = 0;
  let stillFailedCount = 0;

  console.log(`\n🔧 Fixing failed geocodes with manual corrections...\n`);

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

        // Check if we have a manual fix for this address
        const correctedAddress = ADDRESS_FIXES[location.address];

        if (correctedAddress) {
          console.log(`Fixing: ${location.address}`);
          console.log(`     → ${correctedAddress}`);

          // Try to geocode with corrected address
          const geoJsonFeature = await geocodeAddress(correctedAddress);

          if (geoJsonFeature) {
            location.address = correctedAddress; // Update address
            location.geoJsonFeature = geoJsonFeature;
            location.geocodeMetadata = {
              geocodedAt: new Date().toISOString(),
              success: true,
              service: 'nominatim',
              confidence: '75%', // Manual correction = slightly lower confidence
            };
            fixedCount++;
            modified = true;
            console.log(`     ✅ Success: ${geoJsonFeature.properties.displayName}\n`);
          } else {
            stillFailedCount++;
            console.log(`     ❌ Still failed\n`);
          }

          await sleep(REQUEST_DELAY);
        }
      }
    }

    // Only write if modifications were made
    if (modified) {
      await writeFile(filePath, JSON.stringify(groups, null, 2));
    }
  }

  console.log(`\n✅ Address fixes complete:`);
  console.log(`   Fixed: ${fixedCount}`);
  console.log(`   Still failed: ${stillFailedCount}`);
}

fixFailedGeocodes().catch((error) => {
  console.error('Error:', error);
  process.exit(1);
});

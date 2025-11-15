#!/usr/bin/env tsx
/**
 * Re-geocode locations that were fixed in the data quality process
 *
 * This script reads from 05-fixes-applied/ and re-geocodes any locations
 * that are missing geocodeMetadata (indicating they need fresh geocoding).
 */

import { readFile, writeFile, readdir } from 'node:fs/promises';
import { join } from 'node:path';
import { mkdir } from 'node:fs/promises';

interface Location {
  name?: string | null;
  address: string;
  schedule?: string | null;
  contactPerson?: string | null;
  email?: string | null;
  phone?: string | null;
  rawText: string;
  geoJsonFeature?: {
    type: 'Feature';
    geometry: {
      type: 'Point';
      coordinates: [number, number];
    };
    properties: {
      address: string;
      name?: string;
      displayName?: string;
      countryCode?: string;
      boundingBox?: [number, number, number, number];
    };
  };
  geocodeMetadata?: {
    geocodedAt: string;
    success: boolean;
    service: 'nominatim';
    errorMessage?: string;
    confidence?: string;
  };
}

interface GroupData {
  name: string;
  website: string;
  leader: unknown;
  mainContact: unknown;
  sources: any[];
  locations: Location[];
}

const SCRIPT_DIR = new URL('.', import.meta.url).pathname;
const PROJECT_DIR = join(SCRIPT_DIR, '..');
const INPUT_DIR = join(PROJECT_DIR, 'out', '05-fixes-applied');
const OUTPUT_DIR = join(PROJECT_DIR, 'out', '06-final');

// Nominatim API configuration
const NOMINATIM_BASE_URL = 'https://nominatim.openstreetmap.org';
const REQUEST_DELAY = 1100; // 1.1 seconds to respect 1 req/sec limit
const USER_AGENT = 'CapoeiraListProject/1.0 (github.com/j-h-scheufen/axedao)';

/**
 * Sleep for specified duration
 */
function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

/**
 * Clean and normalize an address for better geocoding results
 */
function cleanAddress(address: string): string {
  let cleaned = address;

  // Remove parenthetical notes/directions
  cleaned = cleaned.replace(/\([^)]*\)/g, '').trim();

  // Fix common typos
  const typoFixes: Record<string, string> = {
    Windor: 'Windsor',
  };

  for (const [typo, correct] of Object.entries(typoFixes)) {
    if (cleaned.includes(typo)) {
      cleaned = cleaned.replace(new RegExp(typo, 'g'), correct);
    }
  }

  // Clean up whitespace
  cleaned = cleaned.replace(/\s+/g, ' ').trim();

  return cleaned;
}

/**
 * Geocode an address using Nominatim
 */
async function geocodeAddress(address: string): Promise<Location['geoJsonFeature'] | null> {
  const cleaned = cleanAddress(address);

  try {
    const url = new URL('/search', NOMINATIM_BASE_URL);
    url.searchParams.set('q', cleaned);
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
          address: cleaned,
          displayName: feature.properties.display_name,
          country_code: feature.properties.address?.country_code,
          boundingBox: feature.bbox ? [feature.bbox[1], feature.bbox[3], feature.bbox[0], feature.bbox[2]] : undefined,
        },
      };
    }

    return null;
  } catch (error) {
    console.error(`Failed to geocode "${cleaned}":`, error);
    return null;
  }
}

/**
 * Process all groups and re-geocode locations that need it
 */
async function reGeocodeFixedLocations(): Promise<void> {
  // Create output directory
  await mkdir(OUTPUT_DIR, { recursive: true });

  // Read all batch files
  const files = await readdir(INPUT_DIR);
  const batchFiles = files.filter((f) => f.startsWith('batch-') && f.endsWith('.json'));

  let totalLocations = 0;
  let locationsToGeocode = 0;
  let geocodeSuccesses = 0;
  let geocodeFailures = 0;

  console.log(`\n🌍 Re-geocoding fixed locations...`);

  for (const file of batchFiles) {
    console.log(`\nProcessing ${file}...`);

    const filePath = join(INPUT_DIR, file);
    const content = await readFile(filePath, 'utf-8');
    const groups: GroupData[] = JSON.parse(content);

    for (const group of groups) {
      for (const location of group.locations) {
        totalLocations++;

        // Skip if already geocoded
        if (location.geocodeMetadata && location.geoJsonFeature) {
          continue;
        }

        locationsToGeocode++;
        console.log(`  Geocoding: ${location.address}`);

        // Geocode the location
        const geoJsonFeature = await geocodeAddress(location.address);

        if (geoJsonFeature) {
          location.geoJsonFeature = geoJsonFeature;
          location.geocodeMetadata = {
            geocodedAt: new Date().toISOString(),
            success: true,
            service: 'nominatim',
            confidence: '80%', // Default confidence
          };
          geocodeSuccesses++;
          console.log(`    ✅ Success: ${geoJsonFeature.properties.displayName}`);
        } else {
          location.geocodeMetadata = {
            geocodedAt: new Date().toISOString(),
            success: false,
            service: 'nominatim',
            errorMessage: 'No results found',
          };
          geocodeFailures++;
          console.log(`    ❌ Failed: No results found`);
        }

        // Rate limiting: wait between requests
        await sleep(REQUEST_DELAY);
      }
    }

    // Write updated groups to output
    await writeFile(join(OUTPUT_DIR, file), JSON.stringify(groups, null, 2));
  }

  console.log(`\n✅ Re-geocoding complete:`);
  console.log(`   Total locations: ${totalLocations}`);
  console.log(`   Locations needing geocoding: ${locationsToGeocode}`);
  console.log(`   Successes: ${geocodeSuccesses}`);
  console.log(`   Failures: ${geocodeFailures}`);

  if (geocodeFailures > 0) {
    console.log(`\n⚠️  ${geocodeFailures} locations failed to geocode - review manually`);
  }
}

// Run the script
reGeocodeFixedLocations()
  .then(() => {
    console.log('\n✅ Done! Data ready in out/06-final/');
  })
  .catch((error) => {
    console.error('❌ Error:', error);
    process.exit(1);
  });

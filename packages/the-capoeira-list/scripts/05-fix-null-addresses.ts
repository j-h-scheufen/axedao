#!/usr/bin/env tsx
/**
 * Phase 5: Fix NULL Address Fields
 *
 * This script adds addresses to locations that have NULL address fields
 * but can be geocoded by landmark/venue names.
 */

import { readFile, writeFile, readdir } from 'node:fs/promises';
import { join } from 'node:path';
import { createHash } from 'node:crypto';

interface GeoJsonFeature {
  type: 'Feature';
  geometry: {
    type: 'Point';
    coordinates: [number, number];
  };
  properties: {
    address: string;
    displayName?: string;
    countryCode?: string;
    boundingBox?: [number, number, number, number];
  };
}

interface Location {
  name?: string;
  address?: string;
  schedule?: string;
  contactPerson?: string | null;
  email?: string | null;
  phone?: string | null;
  rawText?: string;
  geoJsonFeature?: GeoJsonFeature;
  geocodeMetadata?: {
    geocodedAt: string;
    success: boolean;
    service: 'nominatim';
    errorMessage?: string;
    confidence?: string;
  };
}

interface GroupData {
  name: string | null;
  website: string | null;
  leader: unknown;
  mainContact: unknown;
  sources: string[];
  resources?: string[];
  locations: Location[];
  notes: string;
  rawRecord: string;
  filterMetadata?: unknown;
  validationMetadata?: unknown;
}

const SCRIPT_DIR = new URL('.', import.meta.url).pathname;
const PROJECT_DIR = join(SCRIPT_DIR, '..');
const INPUT_DIR = join(PROJECT_DIR, 'out', '03-geocoded');
const REPORT_FILE = join(PROJECT_DIR, 'out', '05-null-fixes-report.json');
const CACHE_FILE = join(PROJECT_DIR, 'out', 'geocode-cache.json');

// Nominatim API configuration
const NOMINATIM_BASE_URL = 'https://nominatim.openstreetmap.org';
const REQUEST_DELAY = 1100;
const USER_AGENT = 'CapoeiraListProject/1.0 (github.com/j-h-scheufen/axedao)';

interface GeocodeResult {
  success: boolean;
  feature?: GeoJsonFeature;
  confidence?: string;
  errorMessage?: string;
}

// Geocode cache
const geocodeCache: Map<string, GeocodeResult> = new Map();

/**
 * NULL Address Fixes: Map location name to new address
 */
const NULL_ADDRESS_FIXES: Record<string, string> = {
  // UK Universities
  'Lecture Room 5, The Arts Building': 'Bristol Rd, Birmingham, B15 2TT, UK',
  'Bangor University Capoeira Society': 'Bangor University, Bangor, LL57 2DG, UK',
  'Hallam Capoeira Society': 'Sheffield Hallam University, Sheffield, S1 1WB, UK',

  // US Universities
  'Northeastern University': 'Northeastern University, Boston, MA',
  'University of Mass- Boston': 'University of Massachusetts Boston, Boston, MA',

  // US Other
  'Mar Vista Family Center': 'Mar Vista, Los Angeles, CA 90066',
  'Grubb YMCA': '1611 11th St, Des Moines, IA 50314',
  'Moulton Elementary': 'Moulton Elementary, Des Moines, IA',
};

/**
 * Load geocode cache from file
 */
async function loadCache(): Promise<void> {
  try {
    const content = await readFile(CACHE_FILE, 'utf-8');
    const cacheData = JSON.parse(content);
    for (const [key, value] of Object.entries(cacheData)) {
      geocodeCache.set(key, value);
    }
    console.log(`Loaded ${geocodeCache.size} cached geocode results`);
  } catch (_error) {
    console.log('No existing cache found');
  }
}

/**
 * Save geocode cache to file
 */
async function saveCache(): Promise<void> {
  const cacheData: Record<string, GeocodeResult> = {};
  for (const [key, value] of geocodeCache.entries()) {
    cacheData[key] = value;
  }
  await writeFile(CACHE_FILE, JSON.stringify(cacheData, null, 2));
}

/**
 * Generate cache key for an address
 */
function getCacheKey(address: string): string {
  const normalized = address.toLowerCase().trim().replace(/\s+/g, ' ');
  return createHash('md5').update(normalized).digest('hex');
}

/**
 * Sleep for specified duration
 */
function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

/**
 * Geocode an address using Nominatim
 */
async function geocodeAddress(address: string): Promise<GeocodeResult> {
  const cacheKey = getCacheKey(address);
  if (geocodeCache.has(cacheKey)) {
    return geocodeCache.get(cacheKey);
  }

  await sleep(REQUEST_DELAY);

  try {
    const url = new URL('/search', NOMINATIM_BASE_URL);
    url.searchParams.set('q', address);
    url.searchParams.set('format', 'json');
    url.searchParams.set('limit', '1');
    url.searchParams.set('addressdetails', '1');

    const response = await fetch(url.toString(), {
      headers: { 'User-Agent': USER_AGENT },
    });

    if (!response.ok) {
      const errorMessage = `HTTP ${response.status}: ${response.statusText}`;
      const result = { success: false, errorMessage };
      geocodeCache.set(cacheKey, result);
      return result;
    }

    const data = await response.json();

    if (!Array.isArray(data) || data.length === 0) {
      const errorMessage = 'No results found';
      const result = { success: false, errorMessage };
      geocodeCache.set(cacheKey, result);
      return result;
    }

    const location = data[0];
    const lat = parseFloat(location.lat);
    const lon = parseFloat(location.lon);

    if (Number.isNaN(lat) || Number.isNaN(lon)) {
      const errorMessage = 'Invalid coordinates returned';
      const result = { success: false, errorMessage };
      geocodeCache.set(cacheKey, result);
      return result;
    }

    let boundingBox: [number, number, number, number] | undefined;
    if (location.boundingbox && Array.isArray(location.boundingbox) && location.boundingbox.length === 4) {
      boundingBox = [
        parseFloat(location.boundingbox[0]),
        parseFloat(location.boundingbox[1]),
        parseFloat(location.boundingbox[2]),
        parseFloat(location.boundingbox[3]),
      ];
    }

    const result = {
      success: true,
      feature: {
        type: 'Feature' as const,
        geometry: {
          type: 'Point' as const,
          coordinates: [lon, lat] as [number, number],
        },
        properties: {
          address,
          displayName: location.display_name,
          country_code: location.address?.country_code?.toUpperCase(),
          boundingBox,
        },
      },
      confidence: location.importance ? `${(location.importance * 100).toFixed(0)}%` : undefined,
    };

    geocodeCache.set(cacheKey, result);
    return result;
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : 'Unknown error';
    const result = { success: false, errorMessage };
    geocodeCache.set(cacheKey, result);
    return result;
  }
}

/**
 * Main execution
 */
async function main() {
  console.log('=== Phase 5: Fix NULL Address Fields ===\n');

  if (Object.keys(NULL_ADDRESS_FIXES).length === 0) {
    console.log('⚠️  No NULL address fixes defined!');
    return;
  }

  console.log(`Found ${Object.keys(NULL_ADDRESS_FIXES).length} NULL address fixes to apply\n`);

  await loadCache();

  const files = (await readdir(INPUT_DIR)).filter((f) => f.endsWith('.json')).sort();

  let totalFixed = 0;
  let totalSucceeded = 0;
  let totalFailed = 0;
  let apiCalls = 0;

  const fixResults: Array<{
    groupName: string;
    locationName: string;
    newAddress: string;
    success: boolean;
    displayName?: string;
    errorMessage?: string;
  }> = [];

  for (const filename of files) {
    const inputPath = join(INPUT_DIR, filename);
    const content = await readFile(inputPath, 'utf-8');
    const groups: GroupData[] = JSON.parse(content);

    let fileModified = false;

    for (const group of groups) {
      for (const location of group.locations) {
        // Check if this is a NULL address location we need to fix
        if (location.address !== null) continue;
        if (!location.name) continue;

        const newAddress = NULL_ADDRESS_FIXES[location.name];
        if (!newAddress) continue;

        console.log(`\nFixing: ${group.name || 'Unnamed'}`);
        console.log(`  Location: "${location.name}"`);
        console.log(`  New Address: "${newAddress}"`);

        // Set the address
        location.address = newAddress;
        totalFixed++;
        fileModified = true;

        // Geocode the new address
        apiCalls++;
        const result = await geocodeAddress(newAddress);

        if (result.success && result.feature) {
          location.geoJsonFeature = result.feature;
          location.geocodeMetadata = {
            geocodedAt: new Date().toISOString(),
            success: true,
            service: 'nominatim',
            confidence: result.confidence,
          };
          totalSucceeded++;
          console.log(`  ✓ SUCCESS (${result.confidence || 'N/A'})`);
          console.log(`  → ${result.feature.properties.displayName}`);

          fixResults.push({
            groupName: group.name || 'Unnamed',
            locationName: location.name,
            newAddress,
            success: true,
            displayName: result.feature.properties.displayName,
          });
        } else {
          location.geocodeMetadata = {
            geocodedAt: new Date().toISOString(),
            success: false,
            service: 'nominatim',
            errorMessage: result.errorMessage,
          };
          totalFailed++;
          console.log(`  ✗ FAILED: ${result.errorMessage}`);

          fixResults.push({
            groupName: group.name || 'Unnamed',
            locationName: location.name,
            newAddress,
            success: false,
            errorMessage: result.errorMessage,
          });
        }
      }
    }

    // Write back if modified
    if (fileModified) {
      await writeFile(inputPath, JSON.stringify(groups, null, 2));
      console.log(`\n✓ Updated ${filename}`);
    }
  }

  await saveCache();

  // Generate report
  const report = {
    phase: 5,
    description: 'Fix NULL address fields and geocode',
    timestamp: new Date().toISOString(),
    summary: {
      totalFixes: Object.keys(NULL_ADDRESS_FIXES).length,
      locationsFixed: totalFixed,
      geocodingSucceeded: totalSucceeded,
      geocodingFailed: totalFailed,
      apiCalls,
    },
    fixes: fixResults,
  };

  await writeFile(REPORT_FILE, JSON.stringify(report, null, 2));

  console.log('\n=== Summary ===');
  console.log(`Total NULL fixes defined: ${Object.keys(NULL_ADDRESS_FIXES).length}`);
  console.log(`Locations found & fixed: ${totalFixed}`);
  console.log(`Successfully geocoded: ${totalSucceeded}`);
  console.log(`Failed to geocode: ${totalFailed}`);
  console.log(`API calls made: ${apiCalls}`);
  console.log(`\nReport saved to: ${REPORT_FILE}`);

  if (totalFailed > 0) {
    console.log('\n⚠️  Some fixes still failed to geocode.');
    console.log('Review the failed addresses and try different variations.');
  }
}

main().catch((error) => {
  console.error('Error:', error);
  process.exit(1);
});

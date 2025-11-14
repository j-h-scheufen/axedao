#!/usr/bin/env tsx
/**
 * Phase 5: Split Multi-Address Location Fields
 *
 * This script identifies location entries with multiple addresses concatenated
 * into a single field and splits them into separate location records.
 *
 * The original rawText is preserved in each split location.
 *
 * Usage:
 * pnpm tsx scripts/05-split-multi-addresses.ts
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
const REPORT_FILE = join(PROJECT_DIR, 'out', '05-split-report.json');
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
 * Multi-address patterns to split
 * Each entry: original address -> array of individual addresses
 */
const MULTI_ADDRESS_SPLITS: Record<string, string[]> = {
  // Grupo Omulu Capoeira Guanabara - 4 locations
  '2868 Mission Street, San Francisco CA 94110, 3435 Cesar Chavez St. Studio 204, San Francisco CA 94110, 672 South Van Ness, San Francisco CA 94110, 3813 24th Street, San Francisco CA 94110':
    [
      '2868 Mission Street, San Francisco, CA 94110',
      '3435 Cesar Chavez St, Studio 204, San Francisco, CA 94110',
      '672 South Van Ness, San Francisco, CA 94110',
      '3813 24th Street, San Francisco, CA 94110',
    ],

  // Capoeira Mandinga Santa Rosa - 2 locations
  '172 N Main Sebastopol CA 95472, 56 W 6th Street Santa Rosa,( )CA 95401, 8/20/17)': [
    '172 N Main Street, Sebastopol, CA 95472',
    '56 W 6th Street, Santa Rosa, CA 95401',
  ],

  // Round 11: Category B multi-address splits (10 fields → ~40 locations)

  // London - 8 addresses
  '078 4134 2874, 25 The Broadway HA7 4DA, 90 Mycenae Road, Blackheath, SE3 7SE. Room 15 - 2 Floor, 4 Bravingtons Walk,Kings Cross London N1 9GA, 361-373 City Rd, London, EC1, Ainsworth Rd   London, James Lane, Leytonstone, London E11 1NS, Woodville Rd, London N16 8NA, Kayani Ave London N4 2HF':
    [
      '25 The Broadway, HA7 4DA, UK',
      '90 Mycenae Road, Blackheath, SE3 7SE, UK',
      '4 Bravingtons Walk, Kings Cross, London, N1 9GA, UK',
      '361-373 City Road, London, EC1, UK',
      'Ainsworth Road, London, UK',
      'James Lane, Leytonstone, London, E11 1NS, UK',
      'Woodville Road, London, N16 8NA, UK',
      'Kayani Avenue, London, N4 2HF, UK',
    ],

  // Brooklyn - 4 addresses
  '197 Clifton Place Brooklyn, NY 11216, 216 Greene Ave, Brooklyn, NY 11238, 778 Nostrand Avenue, Brooklyn, NY 11216, 1368 Fulton Street, Brooklyn, NY 11216':
    [
      '197 Clifton Place, Brooklyn, NY 11216',
      '216 Greene Ave, Brooklyn, NY 11238',
      '778 Nostrand Avenue, Brooklyn, NY 11216',
      '1368 Fulton Street, Brooklyn, NY 11216',
    ],

  // Cleveland suburbs - 2 addresses
  '20437 Hannan Pkwy, Walton Hills, OH 44146 http://ohiocapoeira.com/, 23945 Mercantile Rd, Beachwood, OH 44122Kids ages 6-12:Tues  6:00 - 6:45pm':
    ['20437 Hannan Parkway, Walton Hills, OH 44146', '23945 Mercantile Rd, Beachwood, OH 44122'],

  // Brooklyn - 6 addresses
  '303 3rd Avenue, Brooklyn, NY 11215, 3 Lafayette Avenue, Brooklyn, NY, 106 Calyer St., Greenpoint, Brooklyn, 361 Manhattan Ave., 432 3rd Avenue Brooklyn, NY 11215, 419 Waverly Avenue - Brooklyn, NY 11238':
    [
      '303 3rd Avenue, Brooklyn, NY 11215',
      '3 Lafayette Avenue, Brooklyn, NY',
      '106 Calyer St, Greenpoint, Brooklyn, NY',
      '361 Manhattan Ave, Brooklyn, NY',
      '432 3rd Avenue, Brooklyn, NY 11215',
      '419 Waverly Avenue, Brooklyn, NY 11238',
    ],

  // London - 3 addresses
  "368 North End Rd, London SW6 1LY, 17 Duke's Rd, London WC1H 9PY, Pineapple Studios, 7 Langley St, Covent Garden, London WC2H 9JA":
    [
      '368 North End Road, London, SW6 1LY, UK',
      "17 Duke's Road, London, WC1H 9PY, UK",
      '7 Langley Street, Covent Garden, London, WC2H 9JA, UK',
    ],

  // San Diego - 3 addresses
  '3780 Hancock Street, Suite F, San Diego, CA 92110., 880 Garnet Ave, San Diego, CA 9210, 9730 Hopkins Dr. La Jolla, CA 92093':
    [
      '3780 Hancock Street, San Diego, CA 92110',
      '880 Garnet Ave, San Diego, CA 92109',
      '9730 Hopkins Dr, La Jolla, CA 92093',
    ],

  // NYC - 8 addresses
  '635 Riverside Drive, #11A, New York, NY 10031, 721 Broadway, New York, NY 10003, 405 West 55th Street New York, NY 10019, 352-226-0056, 2121 Broadway at 74th Street, 69 W 14th St,  New York, New York 10011, 28 West 25th Street, 2nd floorNY, NY 10017, 27 N Moore St, New York, NY 10013, 25 Pine St., 4th Fl. New York, NY 10005':
    [
      '635 Riverside Drive, New York, NY 10031',
      '721 Broadway, New York, NY 10003',
      '405 West 55th Street, New York, NY 10019',
      '2121 Broadway, New York, NY 10023',
      '69 W 14th St, New York, NY 10011',
      '28 West 25th Street, New York, NY 10010',
      '27 N Moore St, New York, NY 10013',
      '25 Pine St, New York, NY 10005',
    ],

  // Queens - 2 addresses
  '718-309-7605, 49-10 43rd Ave. Woodside, NY 11377, 41-20 Queens Boulevard, Sunnyside, NY 11104': [
    '49-10 43rd Ave, Woodside, NY 11377',
    '41-20 Queens Boulevard, Sunnyside, NY 11104',
  ],

  // Santa Barbara - 2 addresses
  '805-259-7874, 805-259-8318, 370 Hollister Ave, Ste. A, Santa Barbara, CA 93117, 2009 De La Vina St. Santa Barbara, CA 93101':
    ['370 Hollister Ave, Santa Barbara, CA 93117', '2009 De La Vina St, Santa Barbara, CA 93101'],

  // London Walthamstow - 3 addresses (duplicate removed)
  'Northcote Road Walthamstow, London, E17 6PQ (off Palmerston Road), 07583908028, 61 Leswin Road, N16 7NX, 07501903792, 10, Truro Road, Walthamstow, E17 7BY, 07739080102, 10 Truro Road, Walthamstow, E17 7BY':
    [
      'Northcote Road, Walthamstow, London, E17 6PQ, UK',
      '61 Leswin Road, London, N16 7NX, UK',
      '10 Truro Road, Walthamstow, E17 7BY, UK',
    ],
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
          countryCode: location.address?.country_code?.toUpperCase(),
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
  console.log('=== Phase 5: Split Multi-Address Location Fields ===\n');

  if (Object.keys(MULTI_ADDRESS_SPLITS).length === 0) {
    console.log('⚠️  No multi-address splits defined!');
    return;
  }

  console.log(`Found ${Object.keys(MULTI_ADDRESS_SPLITS).length} multi-address fields to split\n`);

  await loadCache();

  const files = (await readdir(INPUT_DIR)).filter((f) => f.endsWith('.json')).sort();

  let totalSplit = 0;
  let totalNewLocations = 0;
  let totalGeocoded = 0;
  let totalFailed = 0;
  let apiCalls = 0;

  const splitResults: Array<{
    groupName: string;
    originalAddress: string;
    splitAddresses: Array<{
      address: string;
      success: boolean;
      displayName?: string;
      errorMessage?: string;
    }>;
  }> = [];

  for (const filename of files) {
    const inputPath = join(INPUT_DIR, filename);
    const content = await readFile(inputPath, 'utf-8');
    const groups: GroupData[] = JSON.parse(content);

    let fileModified = false;

    for (const group of groups) {
      const newLocations: Location[] = [];

      for (const location of group.locations) {
        if (!location.address) {
          newLocations.push(location);
          continue;
        }

        // Check if this address should be split
        const splitAddresses = MULTI_ADDRESS_SPLITS[location.address];
        if (!splitAddresses) {
          newLocations.push(location);
          continue;
        }

        console.log(`\nSplitting: ${group.name || 'Unnamed'}`);
        console.log(`  Original: "${location.address}"`);
        console.log(`  Splitting into ${splitAddresses.length} locations:`);

        const result: (typeof splitResults)[0] = {
          groupName: group.name || 'Unnamed',
          originalAddress: location.address,
          splitAddresses: [],
        };

        totalSplit++;
        fileModified = true;

        // Create a new location for each split address
        for (let i = 0; i < splitAddresses.length; i++) {
          const newAddress = splitAddresses[i];
          console.log(`\n  Location ${i + 1}: "${newAddress}"`);

          // Geocode the new address
          apiCalls++;
          const geocodeResult = await geocodeAddress(newAddress);

          const newLocation: Location = {
            ...location,
            address: newAddress,
            // Preserve original rawText so we can always go back
            rawText: location.rawText,
          };

          if (geocodeResult.success && geocodeResult.feature) {
            newLocation.geoJsonFeature = geocodeResult.feature;
            newLocation.geocodeMetadata = {
              geocodedAt: new Date().toISOString(),
              success: true,
              service: 'nominatim',
              confidence: geocodeResult.confidence,
            };
            totalGeocoded++;
            console.log(`    ✓ SUCCESS (${geocodeResult.confidence || 'N/A'})`);
            console.log(`    → ${geocodeResult.feature.properties.displayName}`);

            result.splitAddresses.push({
              address: newAddress,
              success: true,
              displayName: geocodeResult.feature.properties.displayName,
            });
          } else {
            newLocation.geocodeMetadata = {
              geocodedAt: new Date().toISOString(),
              success: false,
              service: 'nominatim',
              errorMessage: geocodeResult.errorMessage,
            };
            totalFailed++;
            console.log(`    ✗ FAILED: ${geocodeResult.errorMessage}`);

            result.splitAddresses.push({
              address: newAddress,
              success: false,
              errorMessage: geocodeResult.errorMessage,
            });
          }

          newLocations.push(newLocation);
          totalNewLocations++;
        }

        splitResults.push(result);
      }

      // Replace the group's locations with the new split locations
      if (fileModified) {
        group.locations = newLocations;
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
    description: 'Split multi-address location fields into separate locations',
    timestamp: new Date().toISOString(),
    summary: {
      multiAddressFieldsSplit: totalSplit,
      newLocationsCreated: totalNewLocations,
      geocodingSucceeded: totalGeocoded,
      geocodingFailed: totalFailed,
      apiCalls,
    },
    splits: splitResults,
  };

  await writeFile(REPORT_FILE, JSON.stringify(report, null, 2));

  console.log('\n=== Summary ===');
  console.log(`Multi-address fields split: ${totalSplit}`);
  console.log(`New locations created: ${totalNewLocations}`);
  console.log(`Successfully geocoded: ${totalGeocoded}`);
  console.log(`Failed to geocode: ${totalFailed}`);
  console.log(`API calls made: ${apiCalls}`);
  console.log(`\nReport saved to: ${REPORT_FILE}`);

  if (totalFailed > 0) {
    console.log('\n⚠️  Some split addresses failed to geocode.');
    console.log('Review the failed addresses in the report.');
  }
}

main().catch((error) => {
  console.error('Error:', error);
  process.exit(1);
});

#!/usr/bin/env tsx
/**
 * Phase 4: Manual Address Corrections & Re-geocoding
 *
 * This script allows iterative manual correction of failed geocoding attempts.
 *
 * Usage:
 * 1. Edit the CORRECTIONS object below with address fixes
 * 2. Run: pnpm tsx scripts/04-fix-failed-addresses.ts
 * 3. Review results, repeat with more corrections
 *
 * The script will:
 * - Apply your corrections to the geocoded batch files
 * - Re-geocode the corrected addresses
 * - Update the files in place
 * - Generate a correction report
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
const REPORT_FILE = join(PROJECT_DIR, 'out', '04-corrections-report.json');
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
 * ============================================================================
 * CORRECTIONS: Add your manual address fixes here
 * ============================================================================
 *
 * Format:
 *   "ORIGINAL_ADDRESS": "CORRECTED_ADDRESS"
 *
 * The script will find locations with the original address and update them
 * with the corrected address, then re-geocode.
 *
 * Tips:
 * - Fix typos (Windor → Windsor)
 * - Add missing commas before state (Rockville MD → Rockville, MD)
 * - Add country for UK addresses (Cambridge CB22 5BQ → Cambridge, CB22 5BQ, UK)
 * - Remove suite numbers at the front (201 3811 Edmonton → 3811 Edmonton)
 * - Add missing street types (S. Menlo → S. Menlo Ave)
 */
const CORRECTIONS: Record<string, string> = {
  // Round 14: Iterative review with user

  // US - Small city fallbacks (streets don't exist in OSM)
  '14119 Mariah Ct Chantilly, VA': 'Chantilly, VA 20151',
  '5910 Gateway Drive, Alpharetta, GA 30004': 'Alpharetta, GA 30004',

  // US - Zip code fallbacks (better than whole city for large cities)
  '2400 North Forsyth Road Unit 201 Orlando, FL 32807-6439': '32807, Orlando, FL',
  '605 E. Sixth Street, Tucson, AZ 85705': '85705, Tucson, AZ',

  // US - Remove suite/phone numbers and malformed text
  '4128 El Camino Ave. #8, Sacramento, CA 95821, 916-417-1084': '4128 El Camino Ave, Sacramento, CA 95821',
  '4/5/19), 908.432.2405, 54 Coles St, Jersey City, NJ 07302(': '54 Coles St, Jersey City, NJ 07302',
  '650.279.4107, 2420 N St., Sacramento': '2420 N St, Sacramento, CA',
  '347.880.2127, 130 Rhodes St, New Rochelle, NY': '130 Rhodes St, New Rochelle, NY',
  '890 River Road Unit 4, Edgewater, NJ 07020, 8:30-10:00pm': '890 River Road, Edgewater, NJ 07020',
  '646.379.4468, 520 8th Ave New York, NY': '520 8th Ave, New York, NY',

  // US - Replace venue description with university address
  'Dance/Gymnastics area, or Field Hockey court': 'Maharishi University of Management, Fairfield, IA 52557',

  // US - Replace phone-only with actual address from rawText
  '718-309-7605': '445 East 69th St, New York, NY',

  // US - Remove room details from universities
  'Western Washington University Viking Union multipurpose room': 'Western Washington University, Bellingham, WA',

  // UK - Remove phone prefix
  '07873 847703., Richard Street,Shadwell,London E1 2JP': 'Richard Street, Shadwell, London, E1 2JP, UK',

  // Hong Kong - Remove room/floor details
  'Room A, 7/F, Capri Building. 130 Austin Road Tsim Sha Tsui. Kowloon, Hong Kong':
    '130 Austin Road, Tsim Sha Tsui, Kowloon, Hong Kong',

  // Malaysia - Remove building name
  '19-3 Right Angle, Jalan 14/22, Section 14, 46100, Petaling Jaya, Selangor, Malaysia':
    'Jalan 14/22, Section 14, Petaling Jaya, Selangor, Malaysia',
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
  console.log('=== Phase 4: Manual Address Corrections & Re-geocoding ===\n');

  if (Object.keys(CORRECTIONS).length === 0) {
    console.log('⚠️  No corrections defined!');
    console.log('\nPlease edit this script and add corrections to the CORRECTIONS object.');
    console.log('Example:');
    console.log('  "11910 Parklawn Dr, Rockville MD": "11910 Parklawn Dr, Rockville, MD"');
    return;
  }

  console.log(`Found ${Object.keys(CORRECTIONS).length} corrections to apply\n`);

  await loadCache();

  const files = (await readdir(INPUT_DIR)).filter((f) => f.endsWith('.json')).sort();

  let totalFixed = 0;
  let totalSucceeded = 0;
  let totalFailed = 0;
  let apiCalls = 0;

  const correctionResults: Array<{
    originalAddress: string;
    correctedAddress: string;
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
        if (!location.address) continue;

        // Check if this address needs correction
        const correction = CORRECTIONS[location.address];
        if (!correction) continue;

        console.log(`\nCorrecting: ${group.name || 'Unnamed'}`);
        console.log(`  Original: "${location.address}"`);
        console.log(`  Corrected: "${correction}"`);

        // Update the address
        location.address = correction;
        totalFixed++;
        fileModified = true;

        // Re-geocode
        apiCalls++;
        const result = await geocodeAddress(correction);

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

          const originalAddress = Object.keys(CORRECTIONS).find((k) => CORRECTIONS[k] === correction) || correction;
          correctionResults.push({
            originalAddress,
            correctedAddress: correction,
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

          const originalAddress = Object.keys(CORRECTIONS).find((k) => CORRECTIONS[k] === correction) || correction;
          correctionResults.push({
            originalAddress,
            correctedAddress: correction,
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
    phase: 4,
    description: 'Manual address corrections and re-geocoding',
    timestamp: new Date().toISOString(),
    summary: {
      totalCorrections: Object.keys(CORRECTIONS).length,
      addressesFixed: totalFixed,
      geocodingSucceeded: totalSucceeded,
      geocodingFailed: totalFailed,
      apiCalls,
    },
    corrections: correctionResults,
  };

  await writeFile(REPORT_FILE, JSON.stringify(report, null, 2));

  console.log('\n=== Summary ===');
  console.log(`Total corrections defined: ${Object.keys(CORRECTIONS).length}`);
  console.log(`Addresses found & fixed: ${totalFixed}`);
  console.log(`Successfully geocoded: ${totalSucceeded}`);
  console.log(`Failed to geocode: ${totalFailed}`);
  console.log(`API calls made: ${apiCalls}`);
  console.log(`\nReport saved to: ${REPORT_FILE}`);

  if (totalFailed > 0) {
    console.log('\n⚠️  Some corrections still failed to geocode.');
    console.log('Review the failed addresses and try different corrections.');
  }
}

main().catch((error) => {
  console.error('Error:', error);
  process.exit(1);
});

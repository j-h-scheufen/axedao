#!/usr/bin/env tsx
/**
 * Phase 3 TEST: Geocode Sample Addresses
 *
 * This test script processes a small sample of groups to validate:
 * 1. Filtering logic (reachable + capoeira-related)
 * 2. Geocoding quality with various address formats
 * 3. API rate limiting and error handling
 */

import { readFile, writeFile, readdir } from 'node:fs/promises';
import { join } from 'node:path';

interface Location {
  name?: string;
  address?: string;
  schedule?: string;
  contactPerson?: string | null;
  email?: string | null;
  phone?: string | null;
  rawText?: string;
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
      country_code?: string;
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
const INPUT_DIR = join(PROJECT_DIR, 'out', '02-validated');
const OUTPUT_FILE = join(PROJECT_DIR, 'out', '03-geocode-test-results.json');

// Nominatim API configuration
const NOMINATIM_BASE_URL = 'https://nominatim.openstreetmap.org';
const REQUEST_DELAY = 1100; // 1.1 seconds to respect 1 req/sec limit
const USER_AGENT = 'CapoeiraListProject/1.0 (github.com/j-h-scheufen/axedao)';

// Test sample size
const MAX_GROUPS = 50;

/**
 * Sleep for specified duration
 */
function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

/**
 * Clean and normalize an address for better geocoding results
 */
function cleanAddress(address: string): { cleaned: string; modifications: string[] } {
  let cleaned = address;
  const modifications: string[] = [];

  // QUICK WIN #2: Remove parenthetical notes/directions
  const parentheticalPattern = /\([^)]*\)/g;
  const parentheticalMatch = cleaned.match(parentheticalPattern);
  if (parentheticalMatch) {
    cleaned = cleaned.replace(parentheticalPattern, '').trim();
    modifications.push(`Removed parenthetical: ${parentheticalMatch.join(', ')}`);
  }

  // Common typos in location names
  const typoFixes: Record<string, string> = {
    Windor: 'Windsor',
  };

  for (const [typo, correct] of Object.entries(typoFixes)) {
    if (cleaned.includes(typo)) {
      cleaned = cleaned.replace(new RegExp(typo, 'gi'), correct);
      modifications.push(`Fixed typo: ${typo} → ${correct}`);
    }
  }

  // Remove building/room prefixes that appear before street addresses
  // Pattern: "Building Name, Floor info, ACTUAL ADDRESS"
  const buildingPrefixPattern =
    /^([A-Za-z\s]+(?:building|hall|center|room|suite|floor|gym).*?,\s*(?:\d+(?:st|nd|rd|th)\s+floor.*?,\s*)?)/i;
  const match = cleaned.match(buildingPrefixPattern);
  if (match) {
    const prefix = match[1];
    cleaned = cleaned.substring(prefix.length).trim();
    modifications.push(`Removed building prefix: "${prefix}"`);
  }

  // QUICK WIN #3: Handle suite/unit numbers better
  // Pattern 1: Suite number at FRONT of address (e.g., "201 3811 Edmonton Trail")
  const frontSuitePattern = /^(\d{1,4})\s+(\d{4,})/;
  const frontSuiteMatch = cleaned.match(frontSuitePattern);
  if (frontSuiteMatch && frontSuiteMatch[1].length <= 4) {
    cleaned = cleaned.replace(frontSuitePattern, '$2');
    modifications.push(`Removed front suite number: ${frontSuiteMatch[1]}`);
  }

  // Pattern 2: Suite in middle (e.g., "Avenue, 107, City")
  cleaned = cleaned.replace(/,\s*\d{1,4}\s*,/g, ',');

  // Pattern 3: Letter suites (Suite B8, Suite E, #103, etc.)
  const suitePattern = /(?:suite|ste|unit|apt|room|rm|#)\s*[A-Z]?\d+[A-Z]?/gi;
  const suiteMatch = cleaned.match(suitePattern);
  if (suiteMatch) {
    cleaned = cleaned.replace(suitePattern, '').trim();
    modifications.push(`Removed suite: ${suiteMatch.join(', ')}`);
  }

  // QUICK WIN #1: Fix comma/spacing issues
  // Add comma before state abbreviation if missing (US states)
  const statePattern = /\b([A-Z][a-z]+(?:\s+[A-Z][a-z]+)?)\s+([A-Z]{2})\b(?!\s*\d)/;
  const stateMatch = cleaned.match(statePattern);
  if (stateMatch && !cleaned.includes(`${stateMatch[1]}, ${stateMatch[2]}`)) {
    cleaned = cleaned.replace(statePattern, '$1, $2');
    modifications.push(`Added comma before state: ${stateMatch[2]}`);
  }

  // Fix missing space before zip code (e.g., "Los Angeles,90016")
  cleaned = cleaned.replace(/,(\d{5})/g, ', $1');

  // Remove leading/trailing commas and extra spaces
  cleaned = cleaned.replace(/^,\s*/, '').replace(/\s*,$/, '').replace(/\s+/g, ' ').trim();

  // Remove duplicate commas and fix spacing
  cleaned = cleaned
    .replace(/,+/g, ',')
    .replace(/,\s*,/g, ',')
    .replace(/\s*,\s*/g, ', ');

  return { cleaned, modifications };
}

/**
 * Geocode an address using Nominatim
 */
async function geocodeAddress(address: string): Promise<{
  success: boolean;
  feature?: {
    type: 'Feature';
    geometry: {
      type: 'Point';
      coordinates: [number, number];
    };
    properties: {
      address: string;
      displayName?: string;
      country_code?: string;
      boundingBox?: [number, number, number, number];
    };
  };
  confidence?: string;
  errorMessage?: string;
}> {
  await sleep(REQUEST_DELAY);

  try {
    const url = new URL('/search', NOMINATIM_BASE_URL);
    url.searchParams.set('q', address);
    url.searchParams.set('format', 'json');
    url.searchParams.set('limit', '1');
    url.searchParams.set('addressdetails', '1');

    const response = await fetch(url.toString(), {
      headers: {
        'User-Agent': USER_AGENT,
      },
    });

    if (!response.ok) {
      const errorMessage = `HTTP ${response.status}: ${response.statusText}`;
      return { success: false, errorMessage };
    }

    const data = await response.json();

    if (!Array.isArray(data) || data.length === 0) {
      const errorMessage = 'No results found';
      return { success: false, errorMessage };
    }

    const location = data[0];
    const lat = parseFloat(location.lat);
    const lon = parseFloat(location.lon);

    if (Number.isNaN(lat) || Number.isNaN(lon)) {
      const errorMessage = 'Invalid coordinates returned';
      return { success: false, errorMessage };
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

    return result;
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : 'Unknown error';
    return { success: false, errorMessage };
  }
}

/**
 * Main execution
 */
async function main() {
  console.log('=== Phase 3 TEST: Geocoding Sample ===');
  console.log(`Sample size: ${MAX_GROUPS} groups`);
  console.log(`Input directory: ${INPUT_DIR}`);
  console.log('');

  // Get all JSON files
  const files = (await readdir(INPUT_DIR)).filter((f) => f.endsWith('.json')).sort();

  // Collect filtered groups from all files
  const filteredGroups: GroupData[] = [];
  let totalInput = 0;
  let _totalFiltered = 0;

  for (const filename of files) {
    const content = await readFile(join(INPUT_DIR, filename), 'utf-8');
    const allGroups: GroupData[] = JSON.parse(content);
    totalInput += allGroups.length;

    const groupsFromFile = allGroups.filter(
      (group) =>
        group.validationMetadata?.websiteStatus === 'reachable' &&
        group.validationMetadata?.websiteValidation?.isCapoeiraRelated === true
    );

    filteredGroups.push(...groupsFromFile);

    if (filteredGroups.length >= MAX_GROUPS) {
      break;
    }
  }

  const sampleGroups = filteredGroups.slice(0, MAX_GROUPS);
  _totalFiltered = totalInput - filteredGroups.length;

  console.log(`Total groups in files read: ${totalInput}`);
  console.log(`Groups meeting criteria: ${filteredGroups.length}`);
  console.log(`Sample to geocode: ${sampleGroups.length}`);
  console.log('');

  const results: Array<{
    groupName: string;
    website: string;
    locations: Array<{
      locationName?: string;
      address?: string;
      geocodeSuccess: boolean;
      displayName?: string;
      coordinates?: [number, number];
      confidence?: string;
      errorMessage?: string;
    }>;
  }> = [];

  let totalLocations = 0;
  let successCount = 0;
  let failCount = 0;
  let skipCount = 0;

  // Process each group
  for (let i = 0; i < sampleGroups.length; i++) {
    const group = sampleGroups[i];
    console.log(`\n[${i + 1}/${sampleGroups.length}] ${group.name || 'Unnamed'}`);
    console.log(`  Website: ${group.website}`);
    console.log(`  Locations: ${group.locations.length}`);

    const locationResults: Array<{
      locationName?: string;
      address?: string;
      geocodeSuccess: boolean;
      displayName?: string;
      coordinates?: [number, number];
      confidence?: string;
      errorMessage?: string;
    }> = [];

    for (let j = 0; j < group.locations.length; j++) {
      const location = group.locations[j];
      totalLocations++;

      if (!location.address) {
        console.log(`    Location ${j + 1}: SKIPPED (no address)`);
        skipCount++;
        locationResults.push({
          locationName: location.name,
          geocodeSuccess: false,
          errorMessage: 'No address provided',
        });
        continue;
      }

      console.log(`    Location ${j + 1}: "${location.address}"`);

      // Try original address first
      let result = await geocodeAddress(location.address);

      // If failed, try with cleaned address
      if (!result.success) {
        const { cleaned, modifications } = cleanAddress(location.address);
        if (cleaned !== location.address && modifications.length > 0) {
          console.log(`      → Cleaning address: ${modifications.join('; ')}`);
          console.log(`      → Retry with: "${cleaned}"`);
          result = await geocodeAddress(cleaned);
        }
      }

      if (result.success && result.feature) {
        successCount++;
        console.log(`      ✓ SUCCESS (${result.confidence || 'N/A'})`);
        console.log(`      → ${result.feature.properties.displayName}`);
        console.log(`      → Coords: [${result.feature.geometry.coordinates.join(', ')}]`);
        locationResults.push({
          locationName: location.name,
          address: location.address,
          geocodeSuccess: true,
          displayName: result.feature.properties.displayName,
          coordinates: result.feature.geometry.coordinates,
          confidence: result.confidence,
        });
      } else {
        failCount++;
        console.log(`      ✗ FAILED: ${result.errorMessage}`);
        locationResults.push({
          locationName: location.name,
          address: location.address,
          geocodeSuccess: false,
          errorMessage: result.errorMessage,
        });
      }
    }

    results.push({
      groupName: group.name || 'Unnamed',
      website: group.website || 'N/A',
      locations: locationResults,
    });
  }

  // Save results
  await writeFile(OUTPUT_FILE, JSON.stringify(results, null, 2));

  console.log('\n=== TEST RESULTS ===');
  console.log(`Groups tested: ${sampleGroups.length}`);
  console.log(`Total locations: ${totalLocations}`);
  console.log(`Successfully geocoded: ${successCount} (${((successCount / totalLocations) * 100).toFixed(1)}%)`);
  console.log(`Failed: ${failCount}`);
  console.log(`Skipped (no address): ${skipCount}`);
  console.log('');
  console.log(`Results saved to: ${OUTPUT_FILE}`);
}

main().catch((error) => {
  console.error('Error:', error);
  process.exit(1);
});

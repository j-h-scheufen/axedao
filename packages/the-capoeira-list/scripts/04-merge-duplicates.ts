#!/usr/bin/env tsx
/**
 * Phase 4a: Merge Duplicate Groups
 *
 * Merges groups that have the same name and website by:
 * 1. Combining their locations into a single record
 * 2. Preserving all unique location data
 * 3. Keeping the most complete group metadata
 */

import * as fs from 'node:fs';
import * as path from 'node:path';

interface Location {
  name: string | null;
  address: string;
  displayName?: string;
  coordinates?: [number, number];
  schedule?: string | null;
  contactPerson?: string | null;
  email?: string | null;
  phone?: string | null;
  rawText?: string;
}

interface Group {
  name: string;
  website: string;
  leader?: {
    title?: string | null;
    nickname?: string | null;
    name?: string | null;
  };
  mainContact?: {
    name?: string | null;
    email?: string | null;
    phone?: string | null;
  };
  locations: Location[];
  notes?: string;
  rawRecord?: string;
}

interface MergeStats {
  totalGroups: number;
  duplicatesFound: number;
  groupsMerged: number;
  locationsPreserved: number;
  finalGroupCount: number;
}

interface MergeReport {
  groupName: string;
  website: string;
  duplicateCount: number;
  locations: Array<{
    address: string;
    displayName?: string;
    coordinates?: [number, number];
    source: string; // Which duplicate this came from
  }>;
  shouldMerge: boolean;
  reason: string;
}

function getGroupKey(group: Group): string {
  // Use name + website as unique key (case-insensitive)
  return `${group.name}|||${group.website}`.toLowerCase();
}

function mergeDuplicates(inputDir: string, outputDir: string): { stats: MergeStats; reports: MergeReport[] } {
  const stats: MergeStats = {
    totalGroups: 0,
    duplicatesFound: 0,
    groupsMerged: 0,
    locationsPreserved: 0,
    finalGroupCount: 0,
  };

  const mergeReports: MergeReport[] = [];

  // Track groups by their key
  const groupMap = new Map<string, Group[]>();

  console.log('Reading batch files...');

  // Read all input files
  const files = fs
    .readdirSync(inputDir)
    .filter((f) => f.startsWith('batch-') && f.endsWith('.json'))
    .sort();

  for (const file of files) {
    const filePath = path.join(inputDir, file);
    const groups: Group[] = JSON.parse(fs.readFileSync(filePath, 'utf-8'));
    stats.totalGroups += groups.length;

    for (const group of groups) {
      const key = getGroupKey(group);
      if (!groupMap.has(key)) {
        groupMap.set(key, []);
      }
      groupMap.get(key)?.push(group);
    }
  }

  console.log(`\nFound ${stats.totalGroups} total groups`);
  console.log(`Unique group keys: ${groupMap.size}`);

  // Analyze and merge duplicates
  const mergedGroups: Group[] = [];

  for (const [_key, duplicates] of groupMap.entries()) {
    if (duplicates.length > 1) {
      stats.duplicatesFound++;

      // Generate merge report
      const report = generateMergeReport(duplicates);
      mergeReports.push(report);

      if (report.shouldMerge) {
        stats.groupsMerged += duplicates.length;

        console.log(`\n🔀 Merging ${duplicates.length} duplicates: ${duplicates[0].name}`);

        // Merge all duplicate records into one
        const merged = mergeDuplicateRecords(duplicates);
        stats.locationsPreserved += merged.locations.length;
        mergedGroups.push(merged);

        console.log(`  └─ Result: ${merged.locations.length} locations`);
      } else {
        console.log(`\n⚠️  NOT merging ${duplicates.length} duplicates: ${duplicates[0].name}`);
        console.log(`  └─ Reason: ${report.reason}`);
        // Keep all duplicates as separate groups
        mergedGroups.push(...duplicates);
        stats.locationsPreserved += duplicates.reduce((sum, d) => sum + d.locations.length, 0);
      }
    } else {
      // Not a duplicate, keep as-is
      mergedGroups.push(duplicates[0]);
      stats.locationsPreserved += duplicates[0].locations.length;
    }
  }

  stats.finalGroupCount = mergedGroups.length;

  // Split merged groups back into batches (roughly equal size)
  const batchSize = Math.ceil(mergedGroups.length / files.length);
  console.log(`\nWriting ${files.length} output batches (${batchSize} groups each)...`);

  for (let i = 0; i < files.length; i++) {
    const start = i * batchSize;
    const end = Math.min(start + batchSize, mergedGroups.length);
    const batch = mergedGroups.slice(start, end);

    const outputFile = path.join(outputDir, `batch-${String(i + 1).padStart(2, '0')}.json`);
    fs.writeFileSync(outputFile, JSON.stringify(batch, null, 2));
    console.log(`  ✓ ${path.basename(outputFile)}: ${batch.length} groups`);
  }

  return { stats, reports: mergeReports };
}

function generateMergeReport(duplicates: Group[]): MergeReport {
  const locations = duplicates.flatMap((dup, index) =>
    dup.locations.map((loc) => ({
      address: loc.address,
      displayName: loc.displayName,
      coordinates: loc.coordinates,
      source: `Duplicate #${index + 1}`,
    }))
  );

  // Check if locations are geographically distant
  const hasCoordinates = locations.filter((loc) => loc.coordinates).length;
  let maxDistance = 0;

  if (hasCoordinates >= 2) {
    // Calculate max distance between any two locations
    for (let i = 0; i < locations.length; i++) {
      for (let j = i + 1; j < locations.length; j++) {
        if (locations[i].coordinates && locations[j].coordinates) {
          const dist = calculateDistance(locations[i].coordinates!, locations[j].coordinates!);
          maxDistance = Math.max(maxDistance, dist);
        }
      }
    }
  }

  // Decision: Don't merge if locations are >500km apart (likely different branches)
  const shouldMerge = maxDistance === 0 || maxDistance < 500;
  const reason =
    maxDistance > 500
      ? `Locations are ${Math.round(maxDistance)}km apart - likely different regional groups`
      : 'Locations are close or same - safe to merge';

  return {
    groupName: duplicates[0].name,
    website: duplicates[0].website,
    duplicateCount: duplicates.length,
    locations,
    shouldMerge,
    reason,
  };
}

function calculateDistance(coord1: [number, number], coord2: [number, number]): number {
  // Haversine formula for distance between two points on Earth
  const [lon1, lat1] = coord1;
  const [lon2, lat2] = coord2;

  const R = 6371; // Earth's radius in km
  const dLat = toRadians(lat2 - lat1);
  const dLon = toRadians(lon2 - lon1);

  const a =
    Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(toRadians(lat1)) * Math.cos(toRadians(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);

  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  return R * c;
}

function toRadians(degrees: number): number {
  return degrees * (Math.PI / 180);
}

function mergeDuplicateRecords(duplicates: Group[]): Group {
  // Start with the first record as base
  const merged: Group = JSON.parse(JSON.stringify(duplicates[0]));

  // Collect all unique locations
  const locationMap = new Map<string, Location>();

  for (const duplicate of duplicates) {
    for (const location of duplicate.locations) {
      // Use coordinates or address as key to detect duplicate locations
      const locKey = location.coordinates
        ? `${location.coordinates[0]},${location.coordinates[1]}`
        : location.address.toLowerCase();

      if (!locationMap.has(locKey)) {
        locationMap.set(locKey, location);
      } else {
        // If location already exists, prefer one with more complete data
        const existing = locationMap.get(locKey)!;
        const merged = mergeLocations(existing, location);
        locationMap.set(locKey, merged);
      }
    }

    // Merge other fields (prefer non-null/non-empty values)
    if (!merged.leader?.name && duplicate.leader?.name) {
      merged.leader = duplicate.leader;
    }
    if (!merged.mainContact?.email && duplicate.mainContact?.email) {
      merged.mainContact = { ...merged.mainContact, email: duplicate.mainContact.email };
    }
    if (!merged.mainContact?.phone && duplicate.mainContact?.phone) {
      merged.mainContact = { ...merged.mainContact, phone: duplicate.mainContact.phone };
    }
    if (!merged.notes && duplicate.notes) {
      merged.notes = duplicate.notes;
    }
  }

  // Replace locations with merged set
  merged.locations = Array.from(locationMap.values());

  return merged;
}

function mergeLocations(loc1: Location, loc2: Location): Location {
  // Prefer location with coordinates
  if (loc1.coordinates && !loc2.coordinates) return loc1;
  if (loc2.coordinates && !loc1.coordinates) return loc2;

  // Prefer location with more fields filled
  const score1 = Object.values(loc1).filter((v) => v !== null && v !== undefined).length;
  const score2 = Object.values(loc2).filter((v) => v !== null && v !== undefined).length;

  return score2 > score1 ? loc2 : loc1;
}

// Main execution
const inputDir = path.join(process.cwd(), 'out', '04-data-quality');
const outputDir = inputDir; // Overwrite in place

console.log('================================================================================');
console.log('DUPLICATE GROUP MERGER');
console.log('================================================================================\n');

const { stats, reports } = mergeDuplicates(inputDir, outputDir);

// Save detailed merge report
const reportPath = path.join(process.cwd(), 'out', 'merge-report.json');
fs.writeFileSync(reportPath, JSON.stringify(reports, null, 2));

// Print summary report
console.log(`\n${'='.repeat(80)}`);
console.log('MERGE REPORT SUMMARY');
console.log('='.repeat(80));

for (const report of reports) {
  console.log(`\n${report.shouldMerge ? '✅ MERGED' : '⚠️  NOT MERGED'}: ${report.groupName}`);
  console.log(`Website: ${report.website}`);
  console.log(`Duplicates: ${report.duplicateCount}`);
  console.log(`Reason: ${report.reason}`);
  console.log('Locations:');
  for (const loc of report.locations) {
    const coords = loc.coordinates
      ? `[${loc.coordinates[1].toFixed(4)}, ${loc.coordinates[0].toFixed(4)}]`
      : 'No coords';
    console.log(`  - ${loc.source}: ${loc.displayName || loc.address}`);
    console.log(`    ${coords}`);
  }
}

console.log(`\n${'='.repeat(80)}`);
console.log('MERGE COMPLETE');
console.log('='.repeat(80));
console.log(`Total groups processed: ${stats.totalGroups}`);
console.log(`Duplicate sets found: ${stats.duplicatesFound}`);
console.log(`Groups merged: ${stats.groupsMerged}`);
console.log(`Final group count: ${stats.finalGroupCount}`);
console.log(`Locations preserved: ${stats.locationsPreserved}`);
console.log(`Groups removed: ${stats.totalGroups - stats.finalGroupCount}`);
console.log(`\nDetailed report saved to: ${reportPath}`);
console.log('\n✅ Analysis complete!');

#!/usr/bin/env tsx

import fs from 'node:fs';
import path from 'node:path';
import { randomUUID } from 'node:crypto';

/**
 * Converts the geocoded JSON batch files into SQL INSERT statements
 * for importing capoeira groups into the database.
 */

// Type definitions matching the JSON structure
interface Leader {
  title?: string;
  nickname?: string;
  name?: string;
}

interface MainContact {
  name?: string | null;
  email?: string | null;
  phone?: string | null;
}

interface GeoJsonFeature {
  type: 'Feature';
  geometry: {
    type: 'Point';
    coordinates: [number, number]; // [lon, lat]
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
    service: string;
    confidence?: string;
    errorMessage?: string;
  };
}

interface Group {
  name: string | null;
  website?: string | null;
  leader?: Leader | null;
  mainContact?: MainContact | null;
  locations: Location[];
  sources?: string[];
  resources?: string[];
  notes: string;
  rawRecord: string;
}

/**
 * Escapes single quotes in SQL strings
 */
function escapeSqlString(str: string | null | undefined): string {
  if (!str) return '';
  return str.replace(/'/g, "''");
}

/**
 * Formats a value for SQL insertion (NULL or quoted string)
 */
function sqlValue(value: string | null | undefined): string {
  if (value === null || value === undefined || value === '') {
    return 'NULL';
  }
  return `'${escapeSqlString(value)}'`;
}

/**
 * Formats a JSON value for SQL JSONB insertion
 */
function sqlJsonValue(obj: unknown): string {
  return `'${escapeSqlString(JSON.stringify(obj))}'`;
}

/**
 * Assembles the group description per requirements
 */
function buildGroupDescription(group: Group): string {
  const lines: string[] = [];

  // Disclaimer (always first, followed by blank line)
  lines.push(
    'This group and its data were imported from the public data collection at http://home.znet.com/capoeira_list/index.htm. ' +
      'If you have reason to object to this data being included here, kindly send an email to support@quilombo.net.'
  );
  lines.push(''); // Blank line after disclaimer

  // Leader information (on its own line)
  if (group.leader) {
    const { title, nickname, name } = group.leader;
    const leaderParts: string[] = ['Leader:'];

    if (title) {
      leaderParts.push(title.toUpperCase());
    }
    if (nickname) {
      leaderParts.push(nickname);
    }
    if (name) {
      leaderParts.push(`(${name})`);
    }

    if (leaderParts.length > 1) {
      lines.push(leaderParts.join(' '));
    }
  }

  // Main contact (on its own line, if exists and is not just email)
  if (group.mainContact) {
    const { name, phone } = group.mainContact;
    if (name || phone) {
      const contactParts: string[] = ['Main Contact:'];
      if (name) contactParts.push(name);
      if (phone) contactParts.push(`- ${phone}`);

      if (contactParts.length > 1) {
        lines.push(contactParts.join(' '));
      }
    }
  }

  // Notes (on its own line)
  if (group.notes?.trim()) {
    lines.push(`Notes: ${group.notes.trim()}`);
  }

  return lines.join('\n');
}

/**
 * Assembles the location description per requirements
 */
function buildLocationDescription(location: Location): string | null {
  const parts: string[] = [];

  if (location.schedule) {
    parts.push(`Schedule: ${location.schedule}`);
  }

  if (location.phone) {
    parts.push(`Phone: ${location.phone}`);
  }

  if (location.email) {
    parts.push(`Email: ${location.email}`);
  }

  return parts.length > 0 ? parts.join('\n') : null;
}

/**
 * Generates SQL INSERT statement for a group
 */
function generateGroupInsert(group: Group, groupId: string): string {
  const name = sqlValue(group.name);
  const description = sqlValue(buildGroupDescription(group));
  const email = sqlValue(group.mainContact?.email);

  // Build links JSON array
  const links: Array<{ type: string; url: string }> = [];
  if (group.website) {
    links.push({ type: 'website', url: group.website });
  }
  const linksJson = sqlJsonValue(links);

  return `INSERT INTO groups (id, created_at, updated_at, name, description, email, links, created_by, claimed_by, claimed_at)
VALUES ('${groupId}', NOW(), NOW(), ${name}, ${description}, ${email}, ${linksJson}::jsonb, NULL, NULL, NULL);`;
}

/**
 * Generates SQL INSERT statements for all locations of a group
 */
function generateLocationInserts(group: Group, groupId: string): string[] {
  return group.locations
    .filter((loc) => loc.geoJsonFeature) // Only process locations with valid geocoding
    .map((location) => {
      const locationId = randomUUID();
      const name = sqlValue(location.name);
      const description = sqlValue(buildLocationDescription(location));
      const feature = sqlJsonValue(location.geoJsonFeature);

      return `INSERT INTO group_locations (id, group_id, name, description, feature)
VALUES ('${locationId}', '${groupId}', ${name}, ${description}, ${feature}::jsonb);`;
    });
}

/**
 * Main function to process all batch files and generate SQL
 */
async function main() {
  const scriptDir = path.dirname(new URL(import.meta.url).pathname);
  const packageDir = path.join(scriptDir, '..');
  const inputDir = path.join(packageDir, 'out', '03-geocoded');
  const outputFile = path.join(packageDir, 'out', 'import-groups.sql');

  console.log(`Reading geocoded data from: ${inputDir}`);

  // Read all batch files
  const batchFiles = fs
    .readdirSync(inputDir)
    .filter((file) => file.startsWith('batch-') && file.endsWith('.json'))
    .sort();

  console.log(`Found ${batchFiles.length} batch files`);

  const sqlStatements: string[] = [];
  let totalGroups = 0;
  let totalLocations = 0;
  let skippedGroups = 0;

  // Header
  sqlStatements.push('-- Capoeira Groups Import SQL');
  sqlStatements.push(`-- Generated: ${new Date().toISOString()}`);
  sqlStatements.push('-- Source: The Capoeira List (http://home.znet.com/capoeira_list/)');
  sqlStatements.push('');
  sqlStatements.push('BEGIN;');
  sqlStatements.push('');

  // Process each batch file
  for (const batchFile of batchFiles) {
    const filePath = path.join(inputDir, batchFile);
    console.log(`Processing ${batchFile}...`);

    const fileContent = fs.readFileSync(filePath, 'utf-8');
    const groups = JSON.parse(fileContent) as Group[];

    sqlStatements.push(`-- Batch: ${batchFile} (${groups.length} groups)`);
    sqlStatements.push('');

    for (const group of groups) {
      // Skip "Cai na Capoeira" as it already exists
      if (group.name === 'Cai na Capoeira') {
        console.log(`  Skipping existing group: ${group.name}`);
        skippedGroups++;
        continue;
      }

      // Skip groups without valid locations
      const validLocations = group.locations.filter((loc) => loc.geoJsonFeature);
      if (validLocations.length === 0) {
        console.log(`  Skipping group without valid locations: ${group.name}`);
        skippedGroups++;
        continue;
      }

      const groupId = randomUUID();

      sqlStatements.push(`-- Group: ${group.name || 'Unnamed'}`);
      sqlStatements.push(generateGroupInsert(group, groupId));
      sqlStatements.push('');

      const locationInserts = generateLocationInserts(group, groupId);
      sqlStatements.push(...locationInserts);
      sqlStatements.push('');

      totalGroups++;
      totalLocations += validLocations.length;
    }
  }

  // Footer
  sqlStatements.push('COMMIT;');
  sqlStatements.push('');
  sqlStatements.push(`-- Summary: ${totalGroups} groups, ${totalLocations} locations imported`);
  sqlStatements.push(`-- Skipped: ${skippedGroups} groups`);

  // Write output
  fs.writeFileSync(outputFile, sqlStatements.join('\n'), 'utf-8');

  console.log('');
  console.log('✓ SQL generation complete!');
  console.log(`  Output: ${outputFile}`);
  console.log(`  Groups: ${totalGroups}`);
  console.log(`  Locations: ${totalLocations}`);
  console.log(`  Skipped: ${skippedGroups}`);
}

main().catch((error) => {
  console.error('Error generating SQL:', error);
  process.exit(1);
});

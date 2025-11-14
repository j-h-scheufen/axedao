#!/usr/bin/env tsx
/**
 * Add names to locations that have NULL names
 * Extracts street name from address field
 */

import { readFile, writeFile, readdir } from 'node:fs/promises';
import { join } from 'node:path';

const SCRIPT_DIR = new URL('.', import.meta.url).pathname;
const PROJECT_DIR = join(SCRIPT_DIR, '..');
const INPUT_DIR = join(PROJECT_DIR, 'out', '03-geocoded');

// Extract venue name from rawText or street name from address
function extractLocationName(rawText: string | undefined, address: string): string {
  // First, try to extract venue/building name from rawText
  if (rawText) {
    const lines = rawText
      .split('\n')
      .map((l) => l.trim())
      .filter((l) => l.length > 0);

    // Look for venue keywords in the first few lines (before the address)
    const venueKeywords = [
      'Center',
      'Centre',
      'Studio',
      'School',
      'Academy',
      'Hall',
      'Building',
      'Club',
      'Gym',
      'YMCA',
      'Community',
      'Church',
      'Temple',
      'University',
      'College',
      'Institute',
      'Association',
      'Society',
      'Alliance',
      'Dance',
      'Arts',
      'Sports',
      'Leisure',
      'Recreation',
      'Fitness',
    ];

    for (const line of lines.slice(0, 3)) {
      // Skip if line is a phone number
      if (/^\d{3}[-.\s]?\d{3}[-.\s]?\d{4}/.test(line)) continue;

      // Skip if line matches the address exactly
      if (line.toLowerCase().includes(address.toLowerCase().substring(0, 20))) continue;

      // Skip schedule information
      if (/\d{1,2}:\d{2}/.test(line) || /mon|tue|wed|thu|fri|sat|sun/i.test(line)) continue;

      // Skip SOURCE lines
      if (/^SOURCE:/i.test(line)) continue;

      // Check if line contains venue keywords
      const hasVenueKeyword = venueKeywords.some((keyword) => new RegExp(`\\b${keyword}\\b`, 'i').test(line));

      if (hasVenueKeyword && line.length < 60) {
        return line;
      }
    }
  }

  // Fallback: Extract street name from address
  const cleaned = address.replace(
    /, (United States of America|United Kingdom|UK|USA|Canada|Ireland|Brazil|Malaysia|Hong Kong|China)$/i,
    ''
  );

  // Try pattern: number + street name, then comma
  let match = cleaned.match(/^[\d-]+\s+(.+?),/);
  if (match) {
    return match[1].trim();
  }

  // Try pattern: street name before first comma
  match = cleaned.match(/^([^,]+),/);
  if (match) {
    const part = match[1].trim();
    return part.replace(/^[\d-]+\s+/, '');
  }

  // Fallback: return first part
  return cleaned
    .split(',')[0]
    .trim()
    .replace(/^[\d-]+\s+/, '');
}

async function main() {
  console.log('=== Add Location Names ===\n');

  const files = (await readdir(INPUT_DIR)).filter((f) => f.endsWith('.json')).sort();

  let totalUpdated = 0;

  for (const filename of files) {
    const inputPath = join(INPUT_DIR, filename);
    const content = await readFile(inputPath, 'utf-8');
    const groups = JSON.parse(content);

    let fileModified = false;

    for (const group of groups) {
      for (const location of group.locations) {
        if ((location.name === null || location.name === '') && location.address) {
          const locationName = extractLocationName(location.rawText, location.address);
          location.name = locationName;
          totalUpdated++;
          fileModified = true;

          if (totalUpdated <= 10) {
            console.log(`${group.name || 'Unnamed'}`);
            console.log(`  Address: ${location.address}`);
            console.log(`  RawText: ${(location.rawText || '').split('\n')[0]}`);
            console.log(`  → Name: "${locationName}"\n`);
          }
        }
      }
    }

    if (fileModified) {
      await writeFile(inputPath, JSON.stringify(groups, null, 2));
      console.log(`✓ Updated ${filename}`);
    }
  }

  console.log('\n=== Summary ===');
  console.log(`Total locations updated: ${totalUpdated}`);
  console.log('✓ All locations now have names');
}

main().catch((error) => {
  console.error('Error:', error);
  process.exit(1);
});

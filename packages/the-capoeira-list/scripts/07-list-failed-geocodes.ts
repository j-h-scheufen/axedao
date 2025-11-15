#!/usr/bin/env tsx
/**
 * List all locations that failed to geocode for manual review
 */

import { readFile, writeFile, readdir } from 'node:fs/promises';
import { join } from 'node:path';

interface Location {
  name?: string | null;
  address: string;
  rawText: string;
  geocodeMetadata?: {
    success: boolean;
    errorMessage?: string;
  };
}

interface GroupData {
  name: string;
  website: string;
  locations: Location[];
}

const SCRIPT_DIR = new URL('.', import.meta.url).pathname;
const PROJECT_DIR = join(SCRIPT_DIR, '..');
const INPUT_DIR = join(PROJECT_DIR, 'out', '06-final');
const OUTPUT_FILE = join(PROJECT_DIR, 'out', 'failed-geocodes.md');

async function listFailedGeocodes(): Promise<void> {
  const files = await readdir(INPUT_DIR);
  const batchFiles = files.filter((f) => f.startsWith('batch-') && f.endsWith('.json'));

  const failed: Array<{ group: string; website: string; address: string; rawText: string }> = [];

  for (const file of batchFiles) {
    const filePath = join(INPUT_DIR, file);
    const content = await readFile(filePath, 'utf-8');
    const groups: GroupData[] = JSON.parse(content);

    for (const group of groups) {
      for (const location of group.locations) {
        if (location.geocodeMetadata && !location.geocodeMetadata.success) {
          failed.push({
            group: group.name,
            website: group.website,
            address: location.address,
            rawText: location.rawText,
          });
        }
      }
    }
  }

  // Generate markdown report
  const report = [
    '# Failed Geocoding Locations',
    '',
    `Found ${failed.length} locations that failed to geocode.`,
    '',
    '## Manual Review Required',
    '',
    ...failed.map((item, idx) => {
      return `### ${idx + 1}. ${item.group}\n**Website:** ${item.website}\n**Address:** ${item.address}\n**Raw Text:**\n\`\`\`\n${item.rawText}\n\`\`\`\n`;
    }),
  ];

  await writeFile(OUTPUT_FILE, report.join('\n'));

  console.log(`\n📝 Failed geocoding report written to: ${OUTPUT_FILE}`);
  console.log(`   Total failures: ${failed.length}`);

  // Also print to console
  console.log(`\n❌ Failed Geocodes:\n`);
  failed.forEach((item, idx) => {
    console.log(`${idx + 1}. [${item.group}] ${item.address}`);
  });
}

listFailedGeocodes().catch((error) => {
  console.error('Error:', error);
  process.exit(1);
});

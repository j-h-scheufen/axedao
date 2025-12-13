#!/usr/bin/env node
/**
 * Migration script: Convert publicLinks/links from JSONB to text[]
 *
 * Transforms:
 *   FROM: '[{"type": "website", "url": "https://..."}]'::jsonb
 *   TO:   ARRAY['https://...']::text[]
 *
 * Also handles empty arrays:
 *   FROM: '[]'::jsonb
 *   TO:   ARRAY[]::text[]
 */

const fs = require('fs');
const path = require('path');
const { glob } = require('glob');

// Find all SQL files in entities subdirectories
const sqlFiles = glob.sync('entities/**/*.sql', {
  cwd: __dirname,
  absolute: true,
});

console.log(`Found ${sqlFiles.length} SQL files to process`);

let filesModified = 0;
let linksConverted = 0;

sqlFiles.forEach((filePath) => {
  const content = fs.readFileSync(filePath, 'utf-8');
  let modified = false;
  let newContent = content;

  // Pattern 1: Convert JSONB arrays with links to text arrays
  // Matches: '[{"type": "...", "url": "https://..."}]'::jsonb
  // OR:      '[ {"type": "...", "url": "https://..."} ]'::jsonb (with whitespace)
  const jsonbArrayPattern =
    /'?\[[\s\n]*\{[^}]*"url":\s*"([^"]+)"[^}]*\}[\s\n,]*(?:\{[^}]*"url":\s*"([^"]+)"[^}]*\}[\s\n,]*)*\]'?::jsonb/g;

  // Collect all URLs from the matched JSONB
  newContent = newContent.replace(jsonbArrayPattern, (match) => {
    // Extract all URLs from the JSONB structure
    const urlMatches = [...match.matchAll(/"url":\s*"([^"]+)"/g)];
    const urls = urlMatches.map((m) => m[1]);

    if (urls.length === 0) {
      return 'ARRAY[]::text[]';
    }

    const urlList = urls.map((url) => `'${url}'`).join(', ');
    modified = true;
    linksConverted += urls.length;
    return `ARRAY[${urlList}]::text[]`;
  });

  // Pattern 2: Convert empty JSONB arrays
  // Matches: '[]'::jsonb or []::jsonb
  newContent = newContent.replace(/'?\[\]'?::jsonb/g, () => {
    modified = true;
    return 'ARRAY[]::text[]';
  });

  // Write back if modified
  if (modified) {
    fs.writeFileSync(filePath, newContent, 'utf-8');
    filesModified++;
    console.log(`✓ ${path.relative(__dirname, filePath)}`);
  }
});

console.log(`\nMigration complete:`);
console.log(`  Files modified: ${filesModified}`);
console.log(`  Links converted: ${linksConverted}`);

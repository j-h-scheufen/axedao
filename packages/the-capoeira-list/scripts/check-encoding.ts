#!/usr/bin/env tsx
/**
 * Check for text encoding issues in group names by comparing
 * SQL import file with original source data.
 */

import * as fs from 'node:fs';
import * as path from 'node:path';

const ROOT_DIR = path.join(__dirname, '..');
const SQL_FILE = path.join(ROOT_DIR, 'out', 'import-groups.sql');
const SOURCE_FILES = [path.join(ROOT_DIR, 'data', 'allcities20.txt'), path.join(ROOT_DIR, 'data', 'citydata.txt')];

// Common Portuguese characters that might be incorrectly encoded
const PT_CHARS = [
  'á',
  'é',
  'í',
  'ó',
  'ú',
  'â',
  'ê',
  'ô',
  'ã',
  'õ',
  'ç',
  'Á',
  'É',
  'Í',
  'Ó',
  'Ú',
  'Â',
  'Ê',
  'Ô',
  'Ã',
  'Õ',
  'Ç',
];

// Common incorrect replacements
const _ENCODING_ISSUES = [
  { correct: 'é', wrong: ['e', "e'"] },
  { correct: 'á', wrong: ['a', "a'"] },
  { correct: 'í', wrong: ['i', "i'"] },
  { correct: 'ó', wrong: ['o', "o'"] },
  { correct: 'ú', wrong: ['u', "u'"] },
  { correct: 'â', wrong: ['a', 'a^'] },
  { correct: 'ê', wrong: ['e', 'e^'] },
  { correct: 'ô', wrong: ['o', 'o^'] },
  { correct: 'ã', wrong: ['a', 'a~'] },
  { correct: 'õ', wrong: ['o', 'o~'] },
  { correct: 'ç', wrong: ['c'] },
];

/**
 * Extract group names from SQL file
 */
function extractSqlGroupNames(sqlContent: string): Map<string, string> {
  const groups = new Map<string, string>();
  const regex = /INSERT INTO groups \([^)]+\)\s*VALUES \('([^']+)',\s*NOW\(\),\s*NOW\(\),\s*'([^']+)'/g;

  let match: RegExpExecArray | null;
  match = regex.exec(sqlContent);
  while (match !== null) {
    const [, _id, name] = match;
    groups.set(name.toLowerCase(), name);
    match = regex.exec(sqlContent);
  }

  return groups;
}

/**
 * Extract group names from source files
 */
function extractSourceGroupNames(content: string): Set<string> {
  const names = new Set<string>();
  const lines = content.split('\n');

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i].trim();

    // Group names are typically indented and followed by contact info
    // They appear after city names (which are not indented)
    if (
      line &&
      /^[A-Z]/.test(line) &&
      !line.startsWith('http') &&
      !line.startsWith('phone') &&
      !line.startsWith('SOURCE')
    ) {
      // Check if it looks like a group name (contains "Capoeira", "Grupo", "Academia", etc.)
      if (/capoeira|grupo|academia|escola|centro|associa[cç][aã]o|projec?to/i.test(line)) {
        names.add(line);
      }
    }
  }

  return names;
}

/**
 * Normalize string for comparison (remove accents for matching)
 */
function normalizeForComparison(str: string): string {
  return str
    .toLowerCase()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '') // Remove diacritics
    .replace(/[^a-z0-9\s]/g, '') // Remove special chars
    .replace(/\s+/g, ' ')
    .trim();
}

/**
 * Normalize whitespace and punctuation for better matching
 */
function _normalizeWhitespace(str: string): string {
  return str
    .replace(/\s+/g, ' ') // Collapse multiple spaces
    .replace(/\s*-\s*/g, ' - ') // Normalize hyphens
    .replace(/\s*,\s*/g, ', ') // Normalize commas
    .replace(/[.,;:!?]+$/g, '') // Remove trailing punctuation
    .replace(/\(([^)]+)\)/g, ' $1 ') // Remove parentheses but keep content
    .trim();
}

/**
 * Find potential encoding issues
 */
function findEncodingIssues(
  sqlNames: Map<string, string>,
  sourceNames: Set<string>
): Array<{
  sql: string;
  source: string;
  issue: string;
  characters: string[];
}> {
  const issues: Array<{ sql: string; source: string; issue: string; characters: string[] }> = [];

  // Create a map of normalized source names for matching
  const normalizedSourceMap = new Map<string, string>();
  for (const name of sourceNames) {
    const normalized = normalizeForComparison(name);
    normalizedSourceMap.set(normalized, name);
  }

  // Check each SQL name against source names
  for (const [, sqlName] of sqlNames) {
    const normalized = normalizeForComparison(sqlName);
    const sourceName = normalizedSourceMap.get(normalized);

    if (sourceName) {
      // Check if source has special characters that SQL doesn't
      const sourceHasAccents = PT_CHARS.some((char) => sourceName.includes(char));
      const sqlHasAccents = PT_CHARS.some((char) => sqlName.includes(char));

      if (sourceHasAccents && !sqlHasAccents) {
        // Find which characters were lost
        const lostChars = PT_CHARS.filter((char) => sourceName.includes(char) && !sqlName.includes(char));

        issues.push({
          sql: sqlName,
          source: sourceName,
          issue: 'Lost accents/special characters',
          characters: lostChars,
        });
      }
    }
  }

  return issues;
}

/**
 * Main function
 */
function main() {
  console.log('🔍 Checking for text encoding issues in group names...\n');

  // Read SQL file
  const sqlContent = fs.readFileSync(SQL_FILE, 'utf-8');
  const sqlNames = extractSqlGroupNames(sqlContent);
  console.log(`✓ Found ${sqlNames.size} groups in SQL file`);

  // Read source files
  const allSourceNames = new Set<string>();
  for (const sourceFile of SOURCE_FILES) {
    const content = fs.readFileSync(sourceFile, 'utf-8');
    const names = extractSourceGroupNames(content);
    console.log(`✓ Found ${names.size} groups in ${path.basename(sourceFile)}`);
    names.forEach((name) => allSourceNames.add(name));
  }
  console.log(`✓ Total unique source names: ${allSourceNames.size}\n`);

  // Find encoding issues
  const issues = findEncodingIssues(sqlNames, allSourceNames);

  if (issues.length === 0) {
    console.log('✅ No encoding issues found!');
    return;
  }

  console.log(`❌ Found ${issues.length} encoding issues (lost accents/special characters):\n`);
  console.log('SQL Name → Correct Name (Source) | Lost Characters');
  console.log('='.repeat(80));

  const charCount = new Map<string, number>();

  for (const issue of issues) {
    console.log(`${issue.sql} → ${issue.source}`);
    console.log(`  Lost characters: ${issue.characters.join(', ')}\n`);

    // Count character occurrences
    for (const char of issue.characters) {
      charCount.set(char, (charCount.get(char) || 0) + 1);
    }
  }

  console.log(`\n${'='.repeat(80)}`);
  console.log('\n📊 Summary by character:');
  const sortedChars = Array.from(charCount.entries()).sort((a, b) => b[1] - a[1]);
  for (const [char, count] of sortedChars) {
    console.log(`  '${char}': ${count} instances`);
  }
  console.log(`\n  Total: ${issues.length} groups with encoding issues`);

  // Generate SQL fix commands
  console.log(`\n${'='.repeat(80)}`);
  console.log('\n🔧 Suggested fixes (SQL UPDATE statements):\n');

  for (const issue of issues) {
    const escapedOld = issue.sql.replace(/'/g, "''");
    const escapedNew = issue.source.replace(/'/g, "''");
    console.log(`-- ${issue.sql} → ${issue.source}`);
    console.log(`UPDATE groups SET name = '${escapedNew}' WHERE name = '${escapedOld}';`);
    console.log();
  }
}

main();

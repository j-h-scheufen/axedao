#!/usr/bin/env tsx

import fs from 'node:fs';
import path from 'node:path';

/**
 * Fixes character encoding issues in the geocoded JSON files.
 * Specifically targets corrupted UTF-8 sequences that resulted in � replacement characters.
 */

interface EncodingFix {
  pattern: RegExp;
  replacement: string;
  description: string;
}

// Common Portuguese character fixes for Windows-1252/ISO-8859-1 misencoding
const ENCODING_FIXES: EncodingFix[] = [
  // HTML entities (fix first)
  { pattern: /&gt;/g, replacement: '>', description: 'HTML greater-than entity' },
  { pattern: /&lt;/g, replacement: '<', description: 'HTML less-than entity' },
  { pattern: /&amp;/g, replacement: '&', description: 'HTML ampersand entity' },
  { pattern: /&quot;/g, replacement: '"', description: 'HTML quote entity' },

  // Capital letters with accents
  { pattern: /IJEX�/g, replacement: 'IJEXÁ', description: 'IJEXÁ (capital A with acute)' },
  { pattern: /ABAD�/g, replacement: 'ABADÁ', description: 'ABADÁ (capital A with acute)' },
  { pattern: /CABOCL�/g, replacement: 'CABOCLÔ', description: 'CABOCLÔ (capital O with circumflex)' },
  { pattern: /Evolu��o/g, replacement: 'Evolução', description: 'Evolução (c with cedilla + a with tilde)' },

  // Words with specific patterns
  { pattern: /Dend�/g, replacement: 'Dendê', description: 'Dendê (e with circumflex)' },
  { pattern: /Sabi�/g, replacement: 'Sabiá', description: 'Sabiá (a with acute)' },
  { pattern: /Gua�ba/g, replacement: 'Guaíba', description: 'Guaíba (i with acute)' },
  { pattern: /Ja�/g, replacement: 'Jaú', description: 'Jaú (u with acute)' },
  { pattern: /S�o/g, replacement: 'São', description: 'São (a with tilde)' },
  { pattern: /Bras�lia/g, replacement: 'Brasília', description: 'Brasília (i with acute)' },
  { pattern: /Goi�s/g, replacement: 'Goiás', description: 'Goiás (a with acute)' },
  { pattern: /Goi�nia/g, replacement: 'Goiânia', description: 'Goiânia (a with circumflex)' },
  { pattern: /Maring�/g, replacement: 'Maringá', description: 'Maringá (a with acute)' },
  { pattern: /Cascavel \(Paran�\)/g, replacement: 'Cascavel (Paraná)', description: 'Paraná (a with acute)' },
  { pattern: /Nega�a/g, replacement: 'Negaça', description: 'Negaça (c with cedilla)' },
  { pattern: /Chit�o/g, replacement: 'Chitão', description: 'Chitão (a with tilde)' },
  { pattern: /Indio�/g, replacement: 'Indio', description: 'Indio (remove stray replacement char)' },

  // Currency symbols (UK pounds)
  { pattern: /�(\d)/g, replacement: '£$1', description: 'UK pound symbol before digit' },

  // Punctuation - en-dash used in time ranges
  { pattern: /(\d)�(\d)/g, replacement: '$1–$2', description: 'en-dash in time ranges' },
  { pattern: /(\d:\d{2})�(\d)/g, replacement: '$1–$2', description: 'en-dash after time' },

  // Generic patterns - apply these last as they're more general
  { pattern: /�([a-z])/g, replacement: 'á$1', description: 'lowercase a with acute before consonant' },
  { pattern: /�([A-Z])/g, replacement: 'Á$1', description: 'capital A with acute before consonant' },

  // Common word endings
  { pattern: /ca� /g, replacement: 'caá ', description: 'caá (a with acute)' },
  { pattern: /� /g, replacement: 'á ', description: 'á at end of word' },
  { pattern: /�\)/g, replacement: 'á)', description: 'á before closing paren' },
  { pattern: /�,/g, replacement: 'á,', description: 'á before comma' },
  { pattern: /�\./g, replacement: 'á.', description: 'á before period' },
  { pattern: /�$/g, replacement: 'á', description: 'á at end of string' },
  { pattern: /�"/g, replacement: 'á"', description: 'á before quote' },
];

interface FixReport {
  fileName: string;
  fixesApplied: Array<{
    field: string;
    before: string;
    after: string;
    fixDescription: string;
  }>;
  remainingIssues: Array<{
    field: string;
    value: string;
    context: string;
  }>;
}

/**
 * Applies encoding fixes to a string value
 */
function fixEncodingIssues(value: string, fixes: EncodingFix[]): { fixed: string; applied: string[] } {
  let fixed = value;
  const applied: string[] = [];

  for (const fix of fixes) {
    if (fix.pattern.test(fixed)) {
      fixed = fixed.replace(fix.pattern, fix.replacement);
      applied.push(fix.description);
    }
  }

  return { fixed, applied };
}

/**
 * Recursively fixes encoding in an object
 */
function fixObjectEncoding(
  obj: unknown,
  path: string = '',
  fixes: EncodingFix[]
): Array<{ field: string; before: string; after: string; fixDescription: string }> {
  const changesLog: Array<{ field: string; before: string; after: string; fixDescription: string }> = [];

  if (typeof obj === 'string') {
    if (obj.includes('�')) {
      const { fixed, applied } = fixEncodingIssues(obj, fixes);
      if (fixed !== obj) {
        changesLog.push({
          field: path,
          before: obj,
          after: fixed,
          fixDescription: applied.join(', '),
        });
      }
      return changesLog;
    }
    return changesLog;
  }

  if (Array.isArray(obj)) {
    obj.forEach((item, index) => {
      const itemChanges = fixObjectEncoding(item, `${path}[${index}]`, fixes);
      changesLog.push(...itemChanges);
    });
    return changesLog;
  }

  if (typeof obj === 'object' && obj !== null) {
    for (const [key, value] of Object.entries(obj)) {
      const fieldPath = path ? `${path}.${key}` : key;

      if (typeof value === 'string' && value.includes('�')) {
        const { fixed, applied } = fixEncodingIssues(value, fixes);
        if (fixed !== value) {
          (obj as Record<string, unknown>)[key] = fixed;
          changesLog.push({
            field: fieldPath,
            before: value,
            after: fixed,
            fixDescription: applied.join(', '),
          });
        }
      } else if (typeof value === 'object') {
        const nestedChanges = fixObjectEncoding(value, fieldPath, fixes);
        changesLog.push(...nestedChanges);
      }
    }
  }

  return changesLog;
}

/**
 * Finds remaining encoding issues after fixes
 */
function findRemainingIssues(
  obj: unknown,
  path: string = ''
): Array<{ field: string; value: string; context: string }> {
  const issues: Array<{ field: string; value: string; context: string }> = [];

  if (typeof obj === 'string') {
    if (obj.includes('�')) {
      // Get context (20 chars before and after)
      const index = obj.indexOf('�');
      const start = Math.max(0, index - 20);
      const end = Math.min(obj.length, index + 21);
      const context = obj.substring(start, end);

      issues.push({
        field: path,
        value: obj,
        context: `...${context}...`,
      });
    }
    return issues;
  }

  if (Array.isArray(obj)) {
    obj.forEach((item, index) => {
      const itemIssues = findRemainingIssues(item, `${path}[${index}]`);
      issues.push(...itemIssues);
    });
    return issues;
  }

  if (typeof obj === 'object' && obj !== null) {
    for (const [key, value] of Object.entries(obj)) {
      const fieldPath = path ? `${path}.${key}` : key;
      const nestedIssues = findRemainingIssues(value, fieldPath);
      issues.push(...nestedIssues);
    }
  }

  return issues;
}

/**
 * Main function to process all geocoded files
 */
async function main() {
  const scriptDir = path.dirname(new URL(import.meta.url).pathname);
  const packageDir = path.join(scriptDir, '..');
  const inputDir = path.join(packageDir, 'out', '03-geocoded');
  const _outputDir = inputDir; // Overwrite in place
  const reportFile = path.join(packageDir, 'out', '15-encoding-fix-report.json');

  console.log('Fixing character encoding issues...');
  console.log(`Input directory: ${inputDir}`);

  const batchFiles = fs
    .readdirSync(inputDir)
    .filter((file) => file.startsWith('batch-') && file.endsWith('.json'))
    .sort();

  console.log(`Found ${batchFiles.length} batch files to process`);

  const allReports: FixReport[] = [];
  let totalFixes = 0;
  let totalRemainingIssues = 0;

  for (const batchFile of batchFiles) {
    const filePath = path.join(inputDir, batchFile);
    console.log(`\nProcessing ${batchFile}...`);

    const fileContent = fs.readFileSync(filePath, 'utf-8');
    const groups = JSON.parse(fileContent);

    const report: FixReport = {
      fileName: batchFile,
      fixesApplied: [],
      remainingIssues: [],
    };

    // Apply fixes to each group
    for (let i = 0; i < groups.length; i++) {
      const groupChanges = fixObjectEncoding(groups[i], `groups[${i}]`, ENCODING_FIXES);
      report.fixesApplied.push(...groupChanges);
    }

    // Find remaining issues
    for (let i = 0; i < groups.length; i++) {
      const groupIssues = findRemainingIssues(groups[i], `groups[${i}]`);
      report.remainingIssues.push(...groupIssues);
    }

    // Write fixed data back to file
    fs.writeFileSync(filePath, JSON.stringify(groups, null, 2), 'utf-8');

    console.log(`  ✓ Applied ${report.fixesApplied.length} fixes`);
    if (report.remainingIssues.length > 0) {
      console.log(`  ⚠ Found ${report.remainingIssues.length} remaining issues (needs manual review)`);
    }

    totalFixes += report.fixesApplied.length;
    totalRemainingIssues += report.remainingIssues.length;
    allReports.push(report);
  }

  // Write report
  fs.writeFileSync(reportFile, JSON.stringify(allReports, null, 2), 'utf-8');

  console.log(`\n${'='.repeat(60)}`);
  console.log('✓ Encoding fix complete!');
  console.log(`  Total fixes applied: ${totalFixes}`);
  console.log(`  Remaining issues: ${totalRemainingIssues}`);
  console.log(`  Report: ${reportFile}`);

  if (totalRemainingIssues > 0) {
    console.log('\n⚠ Manual review needed for remaining issues.');
    console.log('  Check the report file for details.');
  }

  // Print sample of remaining issues for quick review
  if (totalRemainingIssues > 0) {
    console.log('\nSample of remaining issues:');
    const sampleIssues = allReports.flatMap((r) => r.remainingIssues).slice(0, 10);

    sampleIssues.forEach((issue, idx) => {
      console.log(`  ${idx + 1}. ${issue.field}: ${issue.context}`);
    });

    if (totalRemainingIssues > 10) {
      console.log(`  ... and ${totalRemainingIssues - 10} more (see report)`);
    }
  }
}

main().catch((error) => {
  console.error('Error fixing encoding:', error);
  process.exit(1);
});

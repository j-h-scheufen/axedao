#!/usr/bin/env tsx
/**
 * Data Quality Analysis Script
 *
 * Analyzes the geocoded capoeira group data for:
 * 1. Addresses that are actually phone numbers
 * 2. Duplicate groups (same name + website)
 * 3. Duplicate locations (same coordinates or address)
 * 4. Missing or invalid data
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

interface QualityIssue {
  type: 'phone-as-address' | 'duplicate-group' | 'duplicate-location' | 'missing-data' | 'invalid-geocode';
  severity: 'high' | 'medium' | 'low';
  groupName: string;
  website: string;
  details: string;
  suggestion?: string;
}

const PHONE_PATTERN = /^\+?[\d.\-() ]+$/;
const SUSPICIOUS_PHONE = '646.379.4468';

function isPhoneNumber(address: string): boolean {
  // Check if address looks like a phone number
  if (PHONE_PATTERN.test(address)) {
    // Additional check: phone numbers are typically shorter than real addresses
    const digitsOnly = address.replace(/\D/g, '');
    return digitsOnly.length >= 7 && digitsOnly.length <= 15;
  }
  return false;
}

function extractAddressFromRawText(rawText: string | undefined, phone: string): string | null {
  if (!rawText) return null;

  const lines = rawText
    .split('\n')
    .map((l) => l.trim())
    .filter((l) => l.length > 0);

  // Find the phone number line
  const phoneIndex = lines.findIndex((l) => l.includes(phone));
  if (phoneIndex === -1) return null;

  // Look for address lines after the phone (skip leader names in quotes)
  for (let i = phoneIndex + 1; i < lines.length; i++) {
    const line = lines[i];
    // Skip quoted names and SOURCE lines
    if (line.startsWith('"') || line.startsWith('SOURCE:')) continue;
    // This is likely the address
    if (line.length > 5 && !PHONE_PATTERN.test(line)) {
      // Collect multiline addresses
      const addressParts = [line];
      if (i + 1 < lines.length && !lines[i + 1].startsWith('SOURCE:')) {
        addressParts.push(lines[i + 1]);
      }
      return addressParts.join(', ');
    }
  }

  return null;
}

function analyzeDataQuality(geocodedDir: string): QualityIssue[] {
  const issues: QualityIssue[] = [];
  const groupKeys = new Set<string>();
  const locationKeys = new Map<string, { group: string; website: string }>();

  // Read all geocoded batch files
  const files = fs
    .readdirSync(geocodedDir)
    .filter((f) => f.startsWith('batch-') && f.endsWith('.json'))
    .sort();

  console.log(`Analyzing ${files.length} batch files...`);

  for (const file of files) {
    const filePath = path.join(geocodedDir, file);
    const groups: Group[] = JSON.parse(fs.readFileSync(filePath, 'utf-8'));

    for (const group of groups) {
      // Check for duplicate groups (same name + website)
      const groupKey = `${group.name}|||${group.website}`.toLowerCase();
      if (groupKeys.has(groupKey)) {
        issues.push({
          type: 'duplicate-group',
          severity: 'high',
          groupName: group.name,
          website: group.website,
          details: 'Duplicate group with same name and website',
          suggestion: 'Remove duplicate entry or merge locations',
        });
      }
      groupKeys.add(groupKey);

      // Analyze locations
      for (const location of group.locations) {
        // Check if address is actually a phone number
        if (isPhoneNumber(location.address)) {
          const correctAddress = extractAddressFromRawText(location.rawText, location.address);

          issues.push({
            type: 'phone-as-address',
            severity: 'high',
            groupName: group.name,
            website: group.website,
            details: `Address field contains phone number: ${location.address}`,
            suggestion: correctAddress
              ? `Correct address: ${correctAddress}`
              : 'Check rawText field for actual address',
          });
        }

        // Check for the specific suspicious phone number
        if (location.address === SUSPICIOUS_PHONE) {
          issues.push({
            type: 'phone-as-address',
            severity: 'high',
            groupName: group.name,
            website: group.website,
            details: `Location has suspicious phone number ${SUSPICIOUS_PHONE} as address`,
            suggestion: 'This phone number appears in many records - likely a parsing error',
          });
        }

        // Check for duplicate locations (same coordinates)
        if (location.coordinates) {
          const [lon, lat] = location.coordinates;
          const coordKey = `${lat.toFixed(6)},${lon.toFixed(6)}`;

          if (locationKeys.has(coordKey)) {
            const existing = locationKeys.get(coordKey)!;
            if (existing.group !== group.name || existing.website !== group.website) {
              issues.push({
                type: 'duplicate-location',
                severity: 'medium',
                groupName: group.name,
                website: group.website,
                details: `Location has same coordinates as ${existing.group} (${existing.website})`,
                suggestion: 'Verify if these are actually different locations',
              });
            }
          }
          locationKeys.set(coordKey, { group: group.name, website: group.website });
        }

        // Check for invalid geocoding (Eastern Europe when group is clearly US-based)
        if (location.displayName && location.rawText) {
          const isEasternEurope =
            location.displayName.includes('Česko') ||
            location.displayName.includes('Jihomoravský') ||
            location.displayName.includes('Nosálovice');
          const isUSAddress =
            location.rawText.includes('NY') ||
            location.rawText.includes('Brooklyn') ||
            location.rawText.includes(', CA') ||
            location.rawText.includes(', TX');

          if (isEasternEurope && isUSAddress) {
            issues.push({
              type: 'invalid-geocode',
              severity: 'high',
              groupName: group.name,
              website: group.website,
              details: 'Location geocoded to Eastern Europe but rawText indicates US address',
              suggestion: 'Re-geocode with correct address from rawText',
            });
          }
        }
      }
    }
  }

  return issues;
}

function generateReport(issues: QualityIssue[]): void {
  console.log(`\n${'='.repeat(80)}`);
  console.log('DATA QUALITY ANALYSIS REPORT');
  console.log(`${'='.repeat(80)}\n`);

  // Group by type
  const byType = issues.reduce(
    (acc, issue) => {
      if (!acc[issue.type]) acc[issue.type] = [];
      acc[issue.type].push(issue);
      return acc;
    },
    {} as Record<string, QualityIssue[]>
  );

  console.log(`Total Issues Found: ${issues.length}\n`);

  for (const [type, typeIssues] of Object.entries(byType)) {
    console.log(`\n## ${type.toUpperCase().replace(/-/g, ' ')} (${typeIssues.length} issues)`);
    console.log('-'.repeat(80));

    // Show first 10 of each type
    for (const issue of typeIssues.slice(0, 10)) {
      console.log(`\n**Group:** ${issue.groupName}`);
      console.log(`**Website:** ${issue.website}`);
      console.log(`**Severity:** ${issue.severity}`);
      console.log(`**Details:** ${issue.details}`);
      if (issue.suggestion) {
        console.log(`**Suggestion:** ${issue.suggestion}`);
      }
    }

    if (typeIssues.length > 10) {
      console.log(`\n... and ${typeIssues.length - 10} more`);
    }
  }

  // Summary statistics
  console.log(`\n${'='.repeat(80)}`);
  console.log('SUMMARY');
  console.log('='.repeat(80));
  console.log(`High Severity: ${issues.filter((i) => i.severity === 'high').length}`);
  console.log(`Medium Severity: ${issues.filter((i) => i.severity === 'medium').length}`);
  console.log(`Low Severity: ${issues.filter((i) => i.severity === 'low').length}`);

  // Save detailed report
  const reportPath = path.join(process.cwd(), 'out', 'data-quality-report.json');
  fs.writeFileSync(reportPath, JSON.stringify(issues, null, 2));
  console.log(`\nDetailed report saved to: ${reportPath}`);
}

// Main execution
const geocodedDir = path.join(process.cwd(), 'out', '03-geocoded');

if (!fs.existsSync(geocodedDir)) {
  console.error('Error: Geocoded data directory not found:', geocodedDir);
  process.exit(1);
}

console.log('Starting data quality analysis...');
const issues = analyzeDataQuality(geocodedDir);
generateReport(issues);

console.log('\n✅ Analysis complete!');

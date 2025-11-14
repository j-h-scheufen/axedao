#!/usr/bin/env tsx
/**
 * Phase 2: Website Validation and Data Enrichment
 *
 * This script:
 * 1. Validates that websites are reachable and contain capoeira-related content
 * 2. Extracts additional contact information, addresses, and schedules when found
 * 3. Checks alternative URLs in the 'sources' and 'resources' arrays
 * 4. Generates a detailed report of validation results
 */

import { readFile, writeFile, readdir } from 'node:fs/promises';
import { join } from 'node:path';
import { mkdir } from 'node:fs/promises';

interface GroupData {
  name: string | null;
  website: string | null;
  leader: {
    title?: string;
    nickname?: string;
    name?: string;
  } | null;
  mainContact: {
    name?: string;
    email?: string | null;
    phone?: string | null;
  } | null;
  sources: string[];
  resources?: string[];
  locations: Array<{
    name?: string;
    address?: string;
    schedule?: string;
    contactPerson?: string | null;
    email?: string | null;
    phone?: string | null;
    rawText?: string;
  }>;
  notes: string;
  rawRecord: string;
  filterMetadata?: unknown;
  validationMetadata?: {
    validatedAt: string;
    phase: number;
    websiteStatus: 'reachable' | 'unreachable' | 'no_website' | 'invalid_url';
    websiteValidation?: {
      statusCode: number;
      isCapoeiraRelated: boolean;
      contentSnippet?: string;
      redirectUrl?: string;
      errorMessage?: string;
    };
    alternativeUrls?: Array<{
      url: string;
      source: 'sources' | 'resources';
      status: 'reachable' | 'unreachable' | 'invalid_url';
      isCapoeiraRelated?: boolean;
    }>;
    enrichedData?: {
      extractedEmails?: string[];
      extractedPhones?: string[];
      extractedAddresses?: string[];
    };
  };
}

interface ValidationReport {
  phase: number;
  description: string;
  timestamp: string;
  summary: {
    totalGroups: number;
    websitesReachable: number;
    websitesUnreachable: number;
    websitesInvalid: number;
    noWebsite: number;
    capoeiraContentConfirmed: number;
    alternativeUrlsFound: number;
    dataEnriched: number;
  };
  fileResults: Array<{
    file: string;
    totalGroups: number;
    validationResults: {
      reachable: number;
      unreachable: number;
      invalid: number;
      noWebsite: number;
    };
  }>;
}

const SCRIPT_DIR = new URL('.', import.meta.url).pathname;
const PROJECT_DIR = join(SCRIPT_DIR, '..');
const INPUT_DIR = join(PROJECT_DIR, 'out', '01-filtered');
const OUTPUT_DIR = join(PROJECT_DIR, 'out', '02-validated');
const REPORT_FILE = join(PROJECT_DIR, 'out', '02-validation-report.json');

// Timeout for fetching websites (ms)
const FETCH_TIMEOUT = 10000;
// Delay between requests (ms) to be respectful
const REQUEST_DELAY = 500;

/**
 * Sleep for a specified duration
 */
function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

/**
 * Validate if a URL is well-formed
 */
function isValidUrl(urlString: string): boolean {
  try {
    const url = new URL(urlString);
    return url.protocol === 'http:' || url.protocol === 'https:';
  } catch {
    return false;
  }
}

/**
 * Check if content appears to be capoeira-related
 */
function isCapoeiraRelated(content: string): boolean {
  const keywords = [
    'capoeira',
    'berimbau',
    'roda',
    'mestre',
    'professor',
    'instrutor',
    'batizado',
    'abadá',
    'ginga',
    'angola',
    'regional',
  ];

  const lowerContent = content.toLowerCase();
  const matchCount = keywords.filter((keyword) => lowerContent.includes(keyword)).length;

  // Consider it capoeira-related if at least 2 keywords are found
  return matchCount >= 2;
}

/**
 * Extract potential contact information from content
 */
function extractContactInfo(content: string): {
  emails: string[];
  phones: string[];
} {
  const emails: string[] = [];
  const phones: string[] = [];

  // Garbage email domains to filter out
  const garbageDomains = [
    'sentry.io',
    'sentry.wixpress.com',
    'sentry-next.wixpress.com',
    'googletagmanager.com',
    'google-analytics.com',
    'facebook.com',
    'twitter.com',
    'instagram.com',
    'wix.com',
    'wixsite.com',
    'example.com',
    'test.com',
    'localhost',
  ];

  // Email pattern
  const emailRegex = /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/g;
  const foundEmails = content.match(emailRegex);
  if (foundEmails) {
    // Deduplicate and filter garbage
    const uniqueEmails = [...new Set(foundEmails)];
    for (const email of uniqueEmails) {
      const domain = email.split('@')[1]?.toLowerCase();
      // Filter out garbage domains and emails that look like hashes
      if (domain && !garbageDomains.includes(domain) && !/^[a-f0-9]{32,}@/.test(email)) {
        emails.push(email.toLowerCase());
      }
    }
  }

  // Phone pattern (various formats) - must be 10-15 digits total
  // More restrictive pattern that requires formatting characters
  const phoneRegex = /(\+?\d{1,3}[-.\s()])?\(?\d{3}\)?[-.\s]\d{3}[-.\s]\d{4}/g;
  const foundPhones = content.match(phoneRegex);
  if (foundPhones) {
    // Deduplicate and validate
    const uniquePhones = [...new Set(foundPhones)];
    for (const phone of uniquePhones) {
      // Extract just digits
      const digits = phone.replace(/\D/g, '');
      // Valid phone numbers are 10-15 digits (covers US and international)
      if (digits.length >= 10 && digits.length <= 15) {
        // Exclude numbers with too many repeated digits (like 888-888-8888)
        const uniqueDigits = new Set(digits.split(''));
        if (uniqueDigits.size >= 4) {
          phones.push(phone);
        }
      }
    }
  }

  return { emails, phones };
}

/**
 * Validate a website URL
 */
async function validateWebsite(url: string): Promise<{
  status: 'reachable' | 'unreachable' | 'invalid_url';
  statusCode?: number;
  isCapoeiraRelated?: boolean;
  contentSnippet?: string;
  redirectUrl?: string;
  errorMessage?: string;
  contactInfo?: { emails: string[]; phones: string[] };
}> {
  if (!isValidUrl(url)) {
    return { status: 'invalid_url' };
  }

  try {
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), FETCH_TIMEOUT);

    const response = await fetch(url, {
      signal: controller.signal,
      headers: {
        'User-Agent': 'Mozilla/5.0 (compatible; CapoeiraListBot/1.0)',
      },
      redirect: 'follow',
    });

    clearTimeout(timeoutId);

    // Check if redirected
    const redirectUrl = response.url !== url ? response.url : undefined;

    if (!response.ok) {
      return {
        status: 'unreachable',
        statusCode: response.status,
        redirectUrl,
        errorMessage: `HTTP ${response.status}`,
      };
    }

    // Get content type
    const contentType = response.headers.get('content-type') || '';
    if (!contentType.includes('text/html')) {
      return {
        status: 'reachable',
        statusCode: response.status,
        redirectUrl,
        isCapoeiraRelated: false,
        contentSnippet: `Non-HTML content: ${contentType}`,
      };
    }

    // Read and analyze content
    const content = await response.text();
    const isRelated = isCapoeiraRelated(content);
    const contactInfo = extractContactInfo(content);

    // Get a snippet for manual review
    const snippet = content
      .substring(0, 500)
      .replace(/<[^>]*>/g, ' ')
      .replace(/\s+/g, ' ')
      .trim();

    return {
      status: 'reachable',
      statusCode: response.status,
      isCapoeiraRelated: isRelated,
      contentSnippet: snippet,
      redirectUrl,
      contactInfo,
    };
  } catch (error) {
    const errorMessage = error instanceof Error ? error.message : 'Unknown error';
    return {
      status: 'unreachable',
      errorMessage,
    };
  }
}

/**
 * Validate alternative URLs from sources/resources
 */
async function validateAlternativeUrls(group: GroupData): Promise<
  Array<{
    url: string;
    source: 'sources' | 'resources';
    status: 'reachable' | 'unreachable' | 'invalid_url';
    isCapoeiraRelated?: boolean;
  }>
> {
  const results: Array<{
    url: string;
    source: 'sources' | 'resources';
    status: 'reachable' | 'unreachable' | 'invalid_url';
    isCapoeiraRelated?: boolean;
  }> = [];

  // Check sources
  for (const url of group.sources || []) {
    await sleep(REQUEST_DELAY);
    const validation = await validateWebsite(url);
    results.push({
      url,
      source: 'sources',
      status: validation.status,
      isCapoeiraRelated: validation.isCapoeiraRelated,
    });
  }

  // Check resources if they exist
  for (const url of group.resources || []) {
    await sleep(REQUEST_DELAY);
    const validation = await validateWebsite(url);
    results.push({
      url,
      source: 'resources',
      status: validation.status,
      isCapoeiraRelated: validation.isCapoeiraRelated,
    });
  }

  return results;
}

/**
 * Process a single group
 */
async function processGroup(group: GroupData, index: number, total: number): Promise<GroupData> {
  console.log(`  [${index + 1}/${total}] ${group.name || 'Unnamed'}`);

  const validationMetadata: GroupData['validationMetadata'] = {
    validatedAt: new Date().toISOString(),
    phase: 2,
    websiteStatus: 'no_website',
  };

  // Validate primary website
  if (group.website) {
    await sleep(REQUEST_DELAY);
    const validation = await validateWebsite(group.website);
    validationMetadata.websiteStatus = validation.status;
    validationMetadata.websiteValidation = {
      statusCode: validation.statusCode || 0,
      isCapoeiraRelated: validation.isCapoeiraRelated || false,
      contentSnippet: validation.contentSnippet,
      redirectUrl: validation.redirectUrl,
      errorMessage: validation.errorMessage,
    };

    // Extract contact info if found
    if (validation.contactInfo) {
      validationMetadata.enrichedData = {
        extractedEmails: validation.contactInfo.emails,
        extractedPhones: validation.contactInfo.phones,
      };
    }

    console.log(
      `    Website: ${validation.status} (${validation.isCapoeiraRelated ? 'capoeira-related' : 'unrelated or unclear'})`
    );
  } else {
    console.log(`    Website: none`);
  }

  // Validate alternative URLs
  if ((group.sources && group.sources.length > 0) || (group.resources && group.resources.length > 0)) {
    const altResults = await validateAlternativeUrls(group);
    if (altResults.length > 0) {
      validationMetadata.alternativeUrls = altResults;
      const reachableAlts = altResults.filter((r) => r.status === 'reachable');
      console.log(`    Alternative URLs: ${reachableAlts.length}/${altResults.length} reachable`);
    }
  }

  return {
    ...group,
    validationMetadata,
  };
}

/**
 * Process a single file
 */
async function processFile(filename: string): Promise<{
  file: string;
  totalGroups: number;
  validationResults: {
    reachable: number;
    unreachable: number;
    invalid: number;
    noWebsite: number;
  };
}> {
  console.log(`\nProcessing ${filename}...`);

  const inputPath = join(INPUT_DIR, filename);
  const outputPath = join(OUTPUT_DIR, filename);

  const content = await readFile(inputPath, 'utf-8');
  const groups: GroupData[] = JSON.parse(content);

  const processedGroups: GroupData[] = [];
  const results = {
    reachable: 0,
    unreachable: 0,
    invalid: 0,
    noWebsite: 0,
  };

  for (let i = 0; i < groups.length; i++) {
    const processed = await processGroup(groups[i], i, groups.length);
    processedGroups.push(processed);

    const status = processed.validationMetadata?.websiteStatus;
    if (status === 'reachable') results.reachable++;
    else if (status === 'unreachable') results.unreachable++;
    else if (status === 'invalid_url') results.invalid++;
    else if (status === 'no_website') results.noWebsite++;
  }

  await writeFile(outputPath, JSON.stringify(processedGroups, null, 2));

  return {
    file: filename,
    totalGroups: groups.length,
    validationResults: results,
  };
}

/**
 * Main execution
 */
async function main() {
  console.log('=== Phase 2: Website Validation and Data Enrichment ===');
  console.log(`Input directory: ${INPUT_DIR}`);
  console.log(`Output directory: ${OUTPUT_DIR}`);
  console.log('');

  // Create output directory
  await mkdir(OUTPUT_DIR, { recursive: true });

  // Get all JSON files
  const files = (await readdir(INPUT_DIR)).filter((f) => f.endsWith('.json'));

  console.log(`Found ${files.length} files to process\n`);

  const fileResults: ValidationReport['fileResults'] = [];
  const summary = {
    totalGroups: 0,
    websitesReachable: 0,
    websitesUnreachable: 0,
    websitesInvalid: 0,
    noWebsite: 0,
    capoeiraContentConfirmed: 0,
    alternativeUrlsFound: 0,
    dataEnriched: 0,
  };

  // Process each file
  for (const filename of files) {
    const result = await processFile(filename);
    fileResults.push(result);

    summary.totalGroups += result.totalGroups;
    summary.websitesReachable += result.validationResults.reachable;
    summary.websitesUnreachable += result.validationResults.unreachable;
    summary.websitesInvalid += result.validationResults.invalid;
    summary.noWebsite += result.validationResults.noWebsite;
  }

  // Count additional stats by reading all output files
  for (const filename of files) {
    const content = await readFile(join(OUTPUT_DIR, filename), 'utf-8');
    const groups: GroupData[] = JSON.parse(content);

    for (const group of groups) {
      if (group.validationMetadata?.websiteValidation?.isCapoeiraRelated) {
        summary.capoeiraContentConfirmed++;
      }
      if (group.validationMetadata?.alternativeUrls && group.validationMetadata.alternativeUrls.length > 0) {
        summary.alternativeUrlsFound++;
      }
      if (group.validationMetadata?.enrichedData) {
        summary.dataEnriched++;
      }
    }
  }

  // Generate report
  const report: ValidationReport = {
    phase: 2,
    description: 'Website validation and data enrichment through web scraping',
    timestamp: new Date().toISOString(),
    summary,
    fileResults,
  };

  await writeFile(REPORT_FILE, JSON.stringify(report, null, 2));

  console.log('\n=== Summary ===');
  console.log(`Total groups: ${summary.totalGroups}`);
  console.log(`Websites reachable: ${summary.websitesReachable}`);
  console.log(`Websites unreachable: ${summary.websitesUnreachable}`);
  console.log(`Invalid URLs: ${summary.websitesInvalid}`);
  console.log(`No website: ${summary.noWebsite}`);
  console.log(`Capoeira content confirmed: ${summary.capoeiraContentConfirmed}`);
  console.log(`Groups with alternative URLs: ${summary.alternativeUrlsFound}`);
  console.log(`Groups with enriched data: ${summary.dataEnriched}`);
  console.log('');
  console.log(`Report saved to: ${REPORT_FILE}`);
  console.log(`Validated data saved to: ${OUTPUT_DIR}`);
}

main().catch((error) => {
  console.error('Error:', error);
  process.exit(1);
});

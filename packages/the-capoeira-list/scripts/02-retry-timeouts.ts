#!/usr/bin/env tsx
/**
 * Phase 2.5: Retry Timeout Errors
 *
 * This script retries website validations that timed out in Phase 2
 * with a longer timeout (30 seconds instead of 10 seconds).
 */

import { readFile, writeFile, readdir } from 'node:fs/promises';
import { join } from 'node:path';

interface GroupData {
  name: string | null;
  website: string | null;
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
    };
  };
}

const SCRIPT_DIR = new URL('.', import.meta.url).pathname;
const PROJECT_DIR = join(SCRIPT_DIR, '..');
const VALIDATED_DIR = join(PROJECT_DIR, 'out', '02-validated');
const REPORT_FILE = join(PROJECT_DIR, 'out', '02-retry-report.json');

// Longer timeout for retries (30 seconds)
const RETRY_TIMEOUT = 30000;
const REQUEST_DELAY = 500;

/**
 * Sleep for a specified duration
 */
function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
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

  const emailRegex = /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/g;
  const foundEmails = content.match(emailRegex);
  if (foundEmails) {
    const uniqueEmails = [...new Set(foundEmails)];
    for (const email of uniqueEmails) {
      const domain = email.split('@')[1]?.toLowerCase();
      if (domain && !garbageDomains.includes(domain) && !/^[a-f0-9]{32,}@/.test(email)) {
        emails.push(email.toLowerCase());
      }
    }
  }

  const phoneRegex = /(\+?\d{1,3}[-.\s()])?\(?\d{3}\)?[-.\s]\d{3}[-.\s]\d{4}/g;
  const foundPhones = content.match(phoneRegex);
  if (foundPhones) {
    const uniquePhones = [...new Set(foundPhones)];
    for (const phone of uniquePhones) {
      const digits = phone.replace(/\D/g, '');
      if (digits.length >= 10 && digits.length <= 15) {
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
 * Retry website validation with longer timeout
 */
async function retryWebsite(url: string): Promise<{
  status: 'reachable' | 'unreachable';
  statusCode?: number;
  isCapoeiraRelated?: boolean;
  contentSnippet?: string;
  redirectUrl?: string;
  errorMessage?: string;
  contactInfo?: { emails: string[]; phones: string[] };
}> {
  try {
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), RETRY_TIMEOUT);

    const response = await fetch(url, {
      signal: controller.signal,
      headers: {
        'User-Agent': 'Mozilla/5.0 (compatible; CapoeiraListBot/1.0)',
      },
      redirect: 'follow',
    });

    clearTimeout(timeoutId);

    const redirectUrl = response.url !== url ? response.url : undefined;

    if (!response.ok) {
      return {
        status: 'unreachable',
        statusCode: response.status,
        redirectUrl,
        errorMessage: `HTTP ${response.status}`,
      };
    }

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

    const content = await response.text();
    const isRelated = isCapoeiraRelated(content);
    const contactInfo = extractContactInfo(content);

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
 * Process a single file
 */
async function processFile(filename: string): Promise<{
  file: string;
  retriesAttempted: number;
  retriesSucceeded: number;
  retriesFailed: number;
}> {
  const filePath = join(VALIDATED_DIR, filename);
  const content = await readFile(filePath, 'utf-8');
  const groups: GroupData[] = JSON.parse(content);

  let retriesAttempted = 0;
  let retriesSucceeded = 0;
  let retriesFailed = 0;
  let modified = false;

  for (const group of groups) {
    const isTimeout = group.validationMetadata?.websiteValidation?.errorMessage === 'This operation was aborted';

    if (isTimeout && group.website) {
      retriesAttempted++;
      console.log(`  Retrying: ${group.name} (${group.website})`);

      await sleep(REQUEST_DELAY);
      const validation = await retryWebsite(group.website);

      // Update validation metadata
      if (group.validationMetadata?.websiteValidation) {
        group.validationMetadata.websiteStatus = validation.status;
        group.validationMetadata.websiteValidation = {
          statusCode: validation.statusCode || 0,
          isCapoeiraRelated: validation.isCapoeiraRelated || false,
          contentSnippet: validation.contentSnippet,
          redirectUrl: validation.redirectUrl,
          errorMessage: validation.errorMessage,
        };

        if (
          validation.contactInfo &&
          (validation.contactInfo.emails.length > 0 || validation.contactInfo.phones.length > 0)
        ) {
          group.validationMetadata.enrichedData = {
            extractedEmails: validation.contactInfo.emails,
            extractedPhones: validation.contactInfo.phones,
          };
        }

        modified = true;

        if (validation.status === 'reachable') {
          retriesSucceeded++;
          console.log(`    ✓ Success: ${validation.isCapoeiraRelated ? 'capoeira-related' : 'unrelated'}`);
        } else {
          retriesFailed++;
          console.log(`    ✗ Still failed: ${validation.errorMessage}`);
        }
      }
    }
  }

  // Write back if modified
  if (modified) {
    await writeFile(filePath, JSON.stringify(groups, null, 2));
  }

  return {
    file: filename,
    retriesAttempted,
    retriesSucceeded,
    retriesFailed,
  };
}

/**
 * Main execution
 */
async function main() {
  console.log('=== Phase 2.5: Retry Timeout Errors ===');
  console.log(`Validated directory: ${VALIDATED_DIR}`);
  console.log(`Retry timeout: ${RETRY_TIMEOUT}ms (${RETRY_TIMEOUT / 1000}s)`);
  console.log('');

  const files = (await readdir(VALIDATED_DIR)).filter((f) => f.endsWith('.json'));
  console.log(`Found ${files.length} validated files\n`);

  const fileResults: Array<{
    file: string;
    retriesAttempted: number;
    retriesSucceeded: number;
    retriesFailed: number;
  }> = [];

  let totalRetries = 0;
  let totalSucceeded = 0;
  let totalFailed = 0;

  for (const filename of files) {
    console.log(`Processing ${filename}...`);
    const result = await processFile(filename);
    fileResults.push(result);

    totalRetries += result.retriesAttempted;
    totalSucceeded += result.retriesSucceeded;
    totalFailed += result.retriesFailed;

    if (result.retriesAttempted === 0) {
      console.log('  No timeouts to retry');
    }
    console.log('');
  }

  // Generate report
  const report = {
    phase: 2.5,
    description: 'Retry timeout errors with longer timeout (30s)',
    timestamp: new Date().toISOString(),
    retryTimeout: RETRY_TIMEOUT,
    summary: {
      totalRetries,
      totalSucceeded,
      totalFailed,
      successRate: totalRetries > 0 ? ((totalSucceeded / totalRetries) * 100).toFixed(2) : 0,
    },
    fileResults,
  };

  await writeFile(REPORT_FILE, JSON.stringify(report, null, 2));

  console.log('=== Summary ===');
  console.log(`Total retries attempted: ${totalRetries}`);
  console.log(`Succeeded on retry: ${totalSucceeded}`);
  console.log(`Still failed: ${totalFailed}`);
  console.log(`Success rate: ${report.summary.successRate}%`);
  console.log('');
  console.log(`Report saved to: ${REPORT_FILE}`);
  console.log(`Updated files in: ${VALIDATED_DIR}`);
}

main().catch((error) => {
  console.error('Error:', error);
  process.exit(1);
});

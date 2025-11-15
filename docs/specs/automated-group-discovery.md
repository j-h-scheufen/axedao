# Automated Capoeira Group Discovery & Onboarding System

**Version:** 1.0
**Last Updated:** 2025-11-14
**Status:** Specification
**Target Platform:** Vercel (Next.js 15)

---

## Executive Summary

Transform group discovery from manual submission to an intelligent, assisted workflow that progressively automates while maintaining quality control. Start with a human-powered process deployable immediately, then incrementally add automation until the system can handle most submissions autonomously.

**Core Value Propositions:**
1. **For Users**: "Just give us the website and we'll take it from here"
2. **For Admins**: Research assistant that pre-fills forms, saving 80%+ time
3. **For the Platform**: Keep database fresh with quarterly automated updates

---

## Table of Contents

1. [Incremental Delivery Strategy](#incremental-delivery-strategy)
2. [System Architecture](#system-architecture)
3. [Database Schema](#database-schema)
4. [Phase 1: Human-Powered Workflow](#phase-1-human-powered-workflow-week-1)
5. [Phase 2: Semi-Automated Research](#phase-2-semi-automated-research-week-2-3)
6. [Phase 3: Auto-Approve with Review](#phase-3-auto-approve-with-review-week-4-5)
7. [Phase 4: Fully Automated](#phase-4-fully-automated-week-6)
8. [Technical Implementation Details](#technical-implementation-details)
9. [Cost Analysis](#cost-analysis)
10. [Success Metrics](#success-metrics)
11. [Future Enhancements](#future-enhancements)

---

## Incremental Delivery Strategy

### Why Incremental?

**Problems with "Big Bang" Launch:**
- Months before production value
- High risk of failed automation
- No user feedback loop
- All-or-nothing investment

**Benefits of Incremental Approach:**
- ✅ Ship to production in Week 1
- ✅ Immediate value (better than current manual process)
- ✅ Learn from real usage before automating
- ✅ Each phase is independently valuable
- ✅ Can pause automation at any phase if needed

### Delivery Phases Overview

| Phase | Human Effort | Automation | Time to Deploy | Value Delivered |
|-------|-------------|------------|----------------|-----------------|
| **Phase 1** | 100% | 0% | Week 1 | Quality-controlled group creation |
| **Phase 2** | 50% | 50% | Week 2-3 | 50% faster admin workflow |
| **Phase 3** | 20-30% | 70-80% | Week 4-5 | 80% auto-approved submissions |
| **Phase 4** | 5-10% | 90-95% | Week 6+ | Fully scaled, minimal oversight |

---

## System Architecture

### Vercel-Compatible Design Principles

**No Infrastructure Requirements:**
- ❌ No Redis/BullMQ (use database queue)
- ❌ No long-running workers (use serverless functions)
- ❌ No custom servers (pure Next.js API routes)
- ✅ Vercel Cron Jobs for scheduled tasks
- ✅ Vercel Serverless Functions (300s timeout with Pro)
- ✅ PostgreSQL for all state management

### High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        User-Facing Flow                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  User submits URL                                                │
│         ↓                                                        │
│  Create discovery_request (status: pending)                     │
│         ↓                                                        │
│  Notify admin team                                              │
│         ↓                                                        │
│  [Phase 1] Admin manually researches                            │
│  [Phase 2] Admin clicks "Auto-Research" → AI assists            │
│  [Phase 3] Auto-research + queue for review if low confidence   │
│  [Phase 4] Fully automated with monitoring only                 │
│         ↓                                                        │
│  Admin approves → Create group + Send verification email        │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Technology Stack

**Core Framework:**
- Next.js 15 App Router (already in use)
- Drizzle ORM (already in use)
- PostgreSQL with PostGIS (already in use)

**New Dependencies:**
```json
{
  "dependencies": {
    // Web scraping (Phase 2+)
    "playwright": "^1.40.0",
    "cheerio": "^1.0.0",

    // AI extraction (Phase 2+)
    "openai": "^4.20.0",
    "zod-to-json-schema": "^3.22.0",

    // Duplicate detection (Phase 2+)
    "fuse.js": "^7.0.0",
    "string-similarity": "^4.0.4",

    // Email (Phase 1)
    "resend": "^3.0.0",
    "react-email": "^2.0.0",
    "@react-email/components": "^0.0.12",

    // Rate limiting (Phase 2+)
    "p-limit": "^5.0.0"
  }
}
```

---

## Database Schema

### New Tables

#### `discovery_requests`
Stores all group discovery submissions (user-initiated or batch).

```typescript
export const discoveryRequests = pgTable('discovery_requests', {
  id: uuid('id').defaultRandom().primaryKey(),

  // Source
  sourceUrl: text('source_url').notNull(),
  sourceType: text('source_type', {
    enum: ['user_submission', 'batch_update', 'admin_manual']
  }).notNull(),
  submittedBy: uuid('submitted_by').references(() => users.id),

  // Status tracking
  status: text('status', {
    enum: ['pending', 'researching', 'needs_review', 'approved', 'rejected', 'duplicate']
  }).default('pending').notNull(),

  // Research results (populated by Phase 2+)
  extractedData: jsonb('extracted_data'), // Raw extraction from AI
  qualityScore: numeric('quality_score', { precision: 3, scale: 2 }),
  extractionConfidence: numeric('extraction_confidence', { precision: 3, scale: 2 }),

  // Duplicate detection
  potentialDuplicates: jsonb('potential_duplicates'), // Array of group IDs
  duplicateConfidence: numeric('duplicate_confidence', { precision: 3, scale: 2 }),

  // Review
  reviewedBy: uuid('reviewed_by').references(() => users.id),
  reviewedAt: timestamp('reviewed_at'),
  reviewNotes: text('review_notes'),

  // Outcome
  createdGroupId: uuid('created_group_id').references(() => groups.id),
  rejectionReason: text('rejection_reason'),

  // Metadata
  createdAt: timestamp('created_at').defaultNow().notNull(),
  updatedAt: timestamp('updated_at').defaultNow().notNull()
});
```

#### `research_sessions`
Track automated research attempts (Phase 2+).

```typescript
export const researchSessions = pgTable('research_sessions', {
  id: uuid('id').defaultRandom().primaryKey(),
  requestId: uuid('request_id').references(() => discoveryRequests.id).notNull(),

  // Scraping results
  scrapedAt: timestamp('scraped_at').notNull(),
  scrapedContent: text('scraped_content'), // Full HTML (truncated)
  scrapedScreenshot: text('scraped_screenshot'), // Base64 or S3 URL

  // AI extraction
  aiModel: text('ai_model'), // e.g., "gpt-4o"
  aiPromptTokens: integer('ai_prompt_tokens'),
  aiCompletionTokens: integer('ai_completion_tokens'),
  aiCost: numeric('ai_cost', { precision: 10, scale: 4 }),

  // Extraction results
  extractionSuccess: boolean('extraction_success').notNull(),
  extractionError: text('extraction_error'),

  // Validation
  isCapoeiraRelated: boolean('is_capoeira_related'),
  capoeiraConfidence: numeric('capoeira_confidence', { precision: 3, scale: 2 }),

  createdAt: timestamp('created_at').defaultNow().notNull()
});
```

#### `group_verification_tokens`
Email verification for group owners.

```typescript
export const groupVerificationTokens = pgTable('group_verification_tokens', {
  id: uuid('id').defaultRandom().primaryKey(),
  groupId: uuid('group_id').references(() => groups.id).notNull(),
  email: text('email').notNull(),
  token: uuid('token').defaultRandom().notNull().unique(),

  status: text('status', {
    enum: ['pending', 'verified', 'expired', 'rejected']
  }).default('pending').notNull(),

  expiresAt: timestamp('expires_at').notNull(),
  verifiedAt: timestamp('verified_at'),
  verifiedBy: uuid('verified_by').references(() => users.id),

  // Email tracking
  sentAt: timestamp('sent_at'),
  openedAt: timestamp('opened_at'),
  clickedAt: timestamp('clicked_at'),

  createdAt: timestamp('created_at').defaultNow().notNull()
});
```

#### `discovery_jobs`
Simple database-backed job queue for async processing (Phase 3+).

```typescript
export const discoveryJobs = pgTable('discovery_jobs', {
  id: uuid('id').defaultRandom().primaryKey(),

  jobType: text('job_type', {
    enum: ['research', 'geocode', 'email', 'batch_update']
  }).notNull(),

  payload: jsonb('payload').notNull(), // Job-specific data

  status: text('status', {
    enum: ['pending', 'processing', 'completed', 'failed']
  }).default('pending').notNull(),

  attempts: integer('attempts').default(0).notNull(),
  maxAttempts: integer('max_attempts').default(3).notNull(),

  startedAt: timestamp('started_at'),
  completedAt: timestamp('completed_at'),

  error: text('error'),
  result: jsonb('result'),

  createdAt: timestamp('created_at').defaultNow().notNull(),
  scheduledFor: timestamp('scheduled_for').defaultNow().notNull()
});
```

### Schema Extensions to Existing Tables

#### `groups` table additions:

```typescript
// Add to existing groups table
{
  // Verification status
  verified: boolean('verified').default(false).notNull(),
  verifiedAt: timestamp('verified_at'),
  verifiedBy: uuid('verified_by').references(() => users.id),

  // Discovery metadata
  discoveredFrom: text('discovered_from'), // Source URL
  discoveredAt: timestamp('discovered_at'),
  discoveryRequestId: uuid('discovery_request_id').references(() => discoveryRequests.id),

  // Quality indicators
  dataQualityScore: numeric('data_quality_score', { precision: 3, scale: 2 }),
  lastResearchedAt: timestamp('last_researched_at')
}
```

---

## Phase 1: Human-Powered Workflow (Week 1)

**Goal:** Replace current self-service group creation with quality-controlled submission process.

### User-Facing Flow

#### 1. Discovery Submission Page
**Route:** `/discover` (public)

**Features:**
- Simple form: URL input + optional notes
- URL validation (must be valid HTTP/HTTPS)
- User account optional (can submit anonymously or while logged in)
- Clear expectations: "We'll research and add your group within 2 business days"
- Success message: "Thanks! We'll email you when your group is live"

**Example UI:**
```
┌──────────────────────────────────────────────┐
│  Help Us Discover Capoeira Groups            │
├──────────────────────────────────────────────┤
│                                               │
│  Know a Capoeira group we should list?       │
│  Just give us their website and we'll take   │
│  it from here!                                │
│                                               │
│  Website URL: [____________________________] │
│                                               │
│  Additional notes (optional):                 │
│  [_________________________________________] │
│  [_________________________________________] │
│                                               │
│  [Submit for Review]                          │
│                                               │
│  What happens next?                           │
│  1. Our team researches the group            │
│  2. We add them to the directory             │
│  3. We send a verification email             │
│  4. Group owner can claim and manage         │
│                                               │
└──────────────────────────────────────────────┘
```

**API Route:** `POST /api/discovery/submit`

**Implementation:**
```typescript
// apps/quilombo/app/api/discovery/submit/route.ts
export async function POST(request: Request) {
  const { url, notes, submittedBy } = await request.json();

  // Validate URL
  const urlSchema = z.string().url();
  if (!urlSchema.safeParse(url).success) {
    return Response.json({ error: 'Invalid URL' }, { status: 400 });
  }

  // Check for duplicate submission
  const existing = await db
    .select()
    .from(discoveryRequests)
    .where(eq(discoveryRequests.sourceUrl, url))
    .where(eq(discoveryRequests.status, 'pending'))
    .limit(1);

  if (existing.length > 0) {
    return Response.json({
      error: 'This website has already been submitted and is pending review'
    }, { status: 409 });
  }

  // Create discovery request
  const [request] = await db.insert(discoveryRequests).values({
    sourceUrl: url,
    sourceType: 'user_submission',
    submittedBy,
    status: 'pending',
    notes
  }).returning();

  // Send notification to admin team
  await sendAdminNotification(request);

  // Send confirmation email to submitter (if logged in)
  if (submittedBy) {
    await sendSubmitterConfirmation(request);
  }

  return Response.json({
    success: true,
    requestId: request.id
  });
}
```

### Admin-Facing Flow

#### 2. Admin Review Queue
**Route:** `/admin/discovery-queue` (admin-only)

**Features:**
- List view of pending requests
- Sort by: date, submitter, status
- Filter by: status, date range
- Quick actions: Open website, Start research, Reject
- Batch actions: Assign to me, Mark as duplicate

**Example UI:**
```
┌────────────────────────────────────────────────────────────┐
│  Group Discovery Queue              [Filters ▼] [Refresh] │
├────────────────────────────────────────────────────────────┤
│                                                             │
│  12 Pending | 5 In Review | 3 Need Approval                │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐  │
│  │ 📋 Pending                                           │  │
│  ├─────────────────────────────────────────────────────┤  │
│  │ www.capoeirabayarea.com                             │  │
│  │ Submitted by: john@example.com (2 hours ago)        │  │
│  │ [Open Site] [Start Research] [Reject]               │  │
│  └─────────────────────────────────────────────────────┘  │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐  │
│  │ 📋 Pending                                           │  │
│  │ capoeirasaopaulo.com.br                             │  │
│  │ Submitted anonymously (1 day ago)                    │  │
│  │ [Open Site] [Start Research] [Reject]               │  │
│  └─────────────────────────────────────────────────────┘  │
│                                                             │
└────────────────────────────────────────────────────────────┘
```

#### 3. Manual Research & Entry Form
**Route:** `/admin/discovery-queue/[requestId]/research`

**Features:**
- Display submitted URL in iframe/new tab
- Form to manually enter discovered data
- All fields from group creation form
- Support for multiple locations
- Duplicate search helper (manual search existing groups)
- Save as draft (status: needs_review)
- Submit & create group (status: approved)
- Reject with reason

**Form Fields:**
- Group name*
- Lineage (Angola/Regional/Contemporânea/Unknown)
- Leader (title, nickname, full name)
- Main contact (email*, phone)
- Social media (Facebook, Instagram, YouTube)
- Locations (add multiple):
  - Location name
  - Address*
  - City*
  - State/Province
  - Country*
  - Schedule (class times)
- Notes (internal admin notes)

**Actions:**
- [Check for Duplicates] - Search existing groups by name
- [Save Draft] - Save progress, status: needs_review
- [Reject Submission] - Provide reason, status: rejected
- [Create Group] - Create group, send verification email, status: approved

**API Route:** `POST /api/discovery/[requestId]/complete`

**Implementation:**
```typescript
// apps/quilombo/app/api/discovery/[requestId]/complete/route.ts
export async function POST(
  request: Request,
  { params }: { params: { requestId: string } }
) {
  const session = await auth();
  if (!session?.user?.isAdmin) {
    return Response.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const data = await request.json();
  const { action, groupData, rejectionReason } = data;

  if (action === 'reject') {
    await db.update(discoveryRequests)
      .set({
        status: 'rejected',
        reviewedBy: session.user.id,
        reviewedAt: new Date(),
        rejectionReason
      })
      .where(eq(discoveryRequests.id, params.requestId));

    return Response.json({ success: true });
  }

  if (action === 'create_group') {
    // Validate group data
    const validated = GroupCreationSchema.parse(groupData);

    // Create group
    const [group] = await db.insert(groups).values({
      ...validated,
      verified: false,
      discoveryRequestId: params.requestId,
      discoveredFrom: sourceUrl,
      discoveredAt: new Date()
    }).returning();

    // Update request status
    await db.update(discoveryRequests)
      .set({
        status: 'approved',
        createdGroupId: group.id,
        reviewedBy: session.user.id,
        reviewedAt: new Date()
      })
      .where(eq(discoveryRequests.id, params.requestId));

    // Create verification token
    if (validated.mainContact?.email) {
      const token = await createVerificationToken(
        group.id,
        validated.mainContact.email
      );

      // Send verification email
      await sendGroupVerificationEmail({
        to: validated.mainContact.email,
        groupName: validated.name,
        verificationUrl: `${process.env.NEXT_PUBLIC_APP_URL}/verify/${token.token}`
      });
    }

    return Response.json({
      success: true,
      groupId: group.id
    });
  }
}
```

#### 4. Email Notification to Admins
**Trigger:** On discovery request submission

**Template:**
```
Subject: New Group Discovery Request

A new Capoeira group has been submitted for review.

Website: {sourceUrl}
Submitted by: {submitterEmail or "Anonymous"}
Submitted at: {createdAt}

Review now: {appUrl}/admin/discovery-queue/{requestId}
```

**Implementation:**
```typescript
// apps/quilombo/lib/email/admin-notifications.ts
async function sendAdminNotification(request: DiscoveryRequest) {
  const admins = await db
    .select()
    .from(users)
    .where(eq(users.role, 'admin'));

  await resend.emails.send({
    from: 'Capoeira List <notifications@thecapoeiralist.com>',
    to: admins.map(a => a.email),
    subject: 'New Group Discovery Request',
    html: renderAdminNotificationEmail(request)
  });
}
```

### Phase 1 Deliverables

**Week 1 Checklist:**
- [ ] Database migration for new tables
- [ ] `/discover` public submission page
- [ ] `POST /api/discovery/submit` endpoint
- [ ] Admin queue list page `/admin/discovery-queue`
- [ ] Admin research form `/admin/discovery-queue/[id]/research`
- [ ] `POST /api/discovery/[id]/complete` endpoint
- [ ] Email notifications (admin alert, submitter confirmation)
- [ ] Basic duplicate search UI (manual)
- [ ] Deploy to production
- [ ] Update navigation (add "Submit Group" link)
- [ ] Documentation for admin team

**Success Criteria:**
- Admins can process submissions end-to-end
- 100% of new groups go through quality review
- Average research time: <15 minutes per group
- Zero duplicate groups created

---

## Phase 2: Semi-Automated Research (Week 2-3)

**Goal:** Save 50% of admin time by auto-filling research form.

### New Feature: "Auto-Research" Button

**User Experience:**
1. Admin opens research form
2. Clicks "Auto-Research" button
3. System scrapes website and extracts data
4. Form is pre-filled with extracted data
5. Admin reviews and corrects as needed
6. Admin approves and creates group

**What Gets Automated:**
- ✅ Web scraping (Playwright)
- ✅ AI extraction (OpenAI GPT-4o)
- ✅ Capoeira content verification
- ✅ Basic duplicate detection
- ✅ Geocoding
- ❌ Final approval (human required)

### Technical Implementation

#### 1. Web Scraper Module
**File:** `apps/quilombo/lib/discovery/scraper.ts`

**Features:**
- Playwright for dynamic sites
- Cheerio fallback for static sites
- robots.txt compliance check
- Screenshot capture for admin reference
- 30-second timeout

**Implementation:**
```typescript
import { chromium } from 'playwright';
import * as cheerio from 'cheerio';
import axios from 'axios';

interface ScrapeResult {
  success: boolean;
  content: string;
  screenshot?: string; // Base64
  error?: string;
}

export async function scrapeWebsite(url: string): Promise<ScrapeResult> {
  // Check robots.txt
  const allowedToScrape = await checkRobotsTxt(url);
  if (!allowedToScrape) {
    return {
      success: false,
      content: '',
      error: 'Scraping not allowed by robots.txt'
    };
  }

  try {
    // Try Playwright first (handles JavaScript)
    const browser = await chromium.launch({ headless: true });
    const page = await browser.newPage();

    await page.goto(url, {
      waitUntil: 'networkidle',
      timeout: 30000
    });

    const content = await page.content();
    const screenshot = await page.screenshot({
      type: 'png',
      fullPage: true
    });

    await browser.close();

    return {
      success: true,
      content,
      screenshot: screenshot.toString('base64')
    };
  } catch (error) {
    // Fallback to Cheerio for static sites
    try {
      const { data } = await axios.get(url, {
        timeout: 10000,
        headers: {
          'User-Agent': 'CapoeiraListBot/1.0 (+https://thecapoeiralist.com/bot)'
        }
      });

      return {
        success: true,
        content: data
      };
    } catch (fallbackError) {
      return {
        success: false,
        content: '',
        error: `Failed to scrape: ${error.message}`
      };
    }
  }
}

async function checkRobotsTxt(url: string): Promise<boolean> {
  try {
    const domain = new URL(url).origin;
    const { data } = await axios.get(`${domain}/robots.txt`, {
      timeout: 5000
    });

    // Simple check: if contains "Disallow: /", respect it
    if (data.includes('Disallow: /')) {
      return false;
    }

    return true;
  } catch {
    // If no robots.txt, assume allowed
    return true;
  }
}
```

#### 2. AI Extraction Module
**File:** `apps/quilombo/lib/discovery/ai-extractor.ts`

**Features:**
- OpenAI GPT-4o with Structured Outputs
- Zod schema validation
- Confidence scoring
- Capoeira content verification

**Zod Schema:**
```typescript
import { z } from 'zod';

export const ExtractedGroupSchema = z.object({
  // Group identity
  name: z.string().describe('Name of the Capoeira group'),
  lineage: z.enum(['Angola', 'Regional', 'Contemporânea', 'Unknown'])
    .describe('Capoeira lineage or style'),

  // Leadership
  leader: z.object({
    title: z.string().optional()
      .describe('Capoeira title (Mestre, Contra-Mestre, Professor, etc.)'),
    nickname: z.string().optional()
      .describe('Capoeira nickname/apelido'),
    fullName: z.string().optional()
      .describe('Full legal name')
  }).optional(),

  // Contact info
  mainContact: z.object({
    email: z.string().email().optional(),
    phone: z.string().optional()
  }).optional(),

  // Social media
  socialMedia: z.object({
    facebook: z.string().url().optional(),
    instagram: z.string().optional().describe('Instagram handle or URL'),
    youtube: z.string().url().optional()
  }).optional(),

  // Locations (array)
  locations: z.array(z.object({
    name: z.string().optional().describe('Location or venue name'),
    address: z.string().describe('Street address'),
    city: z.string(),
    state: z.string().optional(),
    country: z.string(),
    schedule: z.string().optional()
      .describe('Class schedule (days and times)')
  })).min(1),

  // Meta
  isActive: z.boolean()
    .describe('Whether the group appears to be currently active'),
  confidence: z.number().min(0).max(1)
    .describe('Confidence in the extraction (0-1)')
});

export type ExtractedGroup = z.infer<typeof ExtractedGroupSchema>;
```

**Implementation:**
```typescript
import OpenAI from 'openai';
import { zodToJsonSchema } from 'zod-to-json-schema';

const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY
});

export async function extractCapoeiraGroupData(
  webContent: string
): Promise<ExtractedGroup> {
  // Step 1: Verify Capoeira content
  const isCapoeira = await verifyCapoeiraContent(webContent);
  if (!isCapoeira) {
    throw new Error('Content does not appear to be Capoeira-related');
  }

  // Step 2: Extract structured data
  const completion = await openai.chat.completions.create({
    model: 'gpt-4o',
    messages: [
      {
        role: 'system',
        content: `You are an expert at extracting Capoeira group information from websites.

Extract structured data about Capoeira groups including:
- Group name and lineage
- Leader information (Mestre, Contra-Mestre, Professor, etc.)
- Contact information (email, phone)
- Social media profiles
- Training locations with addresses and schedules
- Whether the group appears active

Be thorough and accurate. If unsure about a field, omit it rather than guessing.`
      },
      {
        role: 'user',
        content: `Extract Capoeira group information from this website content:\n\n${webContent.substring(0, 8000)}`
      }
    ],
    functions: [{
      name: 'extract_capoeira_group',
      description: 'Extract structured Capoeira group information from website',
      parameters: zodToJsonSchema(ExtractedGroupSchema),
      strict: true // Enable structured outputs
    }],
    function_call: { name: 'extract_capoeira_group' },
    temperature: 0.1 // Low temperature for factual extraction
  });

  const functionCall = completion.choices[0].message.function_call;
  if (!functionCall?.arguments) {
    throw new Error('No data extracted from website');
  }

  const extracted = JSON.parse(functionCall.arguments);

  // Step 3: Validate with Zod
  const validated = ExtractedGroupSchema.parse(extracted);

  return validated;
}

async function verifyCapoeiraContent(content: string): Promise<boolean> {
  const capoeiraKeywords = [
    'capoeira', 'berimbau', 'roda', 'mestre', 'contra-mestre',
    'professor', 'ginga', 'angola', 'regional', 'contemporânea',
    'batizado', 'cordão', 'cordel', 'axé', 'mandinga'
  ];

  const lowerContent = content.toLowerCase();
  const matchCount = capoeiraKeywords.filter(keyword =>
    lowerContent.includes(keyword)
  ).length;

  // Require at least 3 Capoeira-related keywords
  return matchCount >= 3;
}
```

#### 3. Duplicate Detection Module
**File:** `apps/quilombo/lib/discovery/duplicate-detector.ts`

**Features:**
- Fuzzy matching with fuse.js
- Multi-field comparison (name, address, website)
- Confidence scoring

**Implementation:**
```typescript
import Fuse from 'fuse.js';

interface DuplicateMatch {
  groupId: string;
  groupName: string;
  confidence: number;
  matchedFields: string[];
}

export async function findPotentialDuplicates(
  extractedData: ExtractedGroup
): Promise<DuplicateMatch[]> {
  // Get all existing groups
  const existingGroups = await db.select().from(groups);

  // Fuzzy search by name
  const fuse = new Fuse(existingGroups, {
    keys: ['name', 'website'],
    threshold: 0.3,
    includeScore: true
  });

  const nameMatches = fuse.search(extractedData.name);

  const duplicates: DuplicateMatch[] = [];

  for (const match of nameMatches) {
    if (match.score && match.score < 0.4) {
      const confidence = 1 - match.score;
      const matchedFields = [];

      if (match.score < 0.2) matchedFields.push('name');

      // Check website match
      if (match.item.website &&
          normalizeUrl(match.item.website) === normalizeUrl(extractedData.website)) {
        matchedFields.push('website');
        confidence += 0.3;
      }

      duplicates.push({
        groupId: match.item.id,
        groupName: match.item.name,
        confidence: Math.min(confidence, 1),
        matchedFields
      });
    }
  }

  return duplicates.sort((a, b) => b.confidence - a.confidence);
}

function normalizeUrl(url?: string): string {
  if (!url) return '';
  return url
    .toLowerCase()
    .replace(/^https?:\/\//, '')
    .replace(/^www\./, '')
    .replace(/\/$/, '');
}
```

#### 4. Auto-Research API Endpoint
**Route:** `POST /api/discovery/[requestId]/auto-research`

**Implementation:**
```typescript
// apps/quilombo/app/api/discovery/[requestId]/auto-research/route.ts
export async function POST(
  request: Request,
  { params }: { params: { requestId: string } }
) {
  const session = await auth();
  if (!session?.user?.isAdmin) {
    return Response.json({ error: 'Unauthorized' }, { status: 401 });
  }

  try {
    // Get discovery request
    const [discoveryRequest] = await db
      .select()
      .from(discoveryRequests)
      .where(eq(discoveryRequests.id, params.requestId))
      .limit(1);

    if (!discoveryRequest) {
      return Response.json({ error: 'Request not found' }, { status: 404 });
    }

    // Step 1: Scrape website
    const scrapeResult = await scrapeWebsite(discoveryRequest.sourceUrl);

    if (!scrapeResult.success) {
      return Response.json({
        error: 'Failed to scrape website',
        details: scrapeResult.error
      }, { status: 500 });
    }

    // Step 2: Extract data with AI
    const extractedData = await extractCapoeiraGroupData(scrapeResult.content);

    // Step 3: Check for duplicates
    const potentialDuplicates = await findPotentialDuplicates(extractedData);

    // Step 4: Geocode locations
    for (const location of extractedData.locations) {
      try {
        const coords = await geocodeAddress(
          `${location.address}, ${location.city}, ${location.country}`
        );
        location.coordinates = coords;
      } catch (error) {
        console.error(`Geocoding failed for ${location.address}:`, error);
      }
    }

    // Step 5: Calculate quality score
    const qualityScore = calculateQualityScore(extractedData);

    // Step 6: Save research session
    await db.insert(researchSessions).values({
      requestId: params.requestId,
      scrapedAt: new Date(),
      scrapedContent: scrapeResult.content.substring(0, 50000),
      scrapedScreenshot: scrapeResult.screenshot,
      aiModel: 'gpt-4o',
      extractionSuccess: true,
      isCapoeiraRelated: true,
      capoeiraConfidence: extractedData.confidence
    });

    // Step 7: Update discovery request
    await db.update(discoveryRequests)
      .set({
        status: 'needs_review',
        extractedData: extractedData as any,
        qualityScore,
        extractionConfidence: extractedData.confidence,
        potentialDuplicates: potentialDuplicates as any
      })
      .where(eq(discoveryRequests.id, params.requestId));

    return Response.json({
      success: true,
      extractedData,
      qualityScore,
      potentialDuplicates,
      screenshot: scrapeResult.screenshot
    });
  } catch (error) {
    console.error('Auto-research failed:', error);
    return Response.json({
      error: 'Auto-research failed',
      details: error.message
    }, { status: 500 });
  }
}

function calculateQualityScore(data: ExtractedGroup): number {
  let score = 0;

  // Required fields (40%)
  if (data.name) score += 0.15;
  if (data.locations.length > 0) score += 0.15;
  if (data.locations[0].city && data.locations[0].country) score += 0.10;

  // Contact info (30%)
  if (data.mainContact?.email) score += 0.20;
  if (data.mainContact?.phone) score += 0.10;

  // Completeness (20%)
  if (data.leader) score += 0.10;
  if (data.socialMedia?.facebook || data.socialMedia?.instagram) score += 0.10;

  // Confidence (10%)
  score += data.confidence * 0.10;

  return Math.min(score, 1);
}
```

### Updated Admin Research Form

**New UI Elements:**
- [Auto-Research] button at top of form
- Loading indicator during research
- "Pre-filled by AI" badges on auto-populated fields
- Screenshot of website for reference
- Duplicate warning banner if potential matches found
- Confidence indicator for each extracted field

**Example Flow:**
1. Admin opens form, sees empty fields
2. Clicks "Auto-Research" → Loading spinner
3. Form populates with extracted data (5-10 seconds)
4. Admin reviews, corrects "Mestre" title that was missed
5. Admin sees duplicate warning: "80% match with existing group"
6. Admin compares and confirms it's different location
7. Admin approves and creates group

### Phase 2 Deliverables

**Week 2-3 Checklist:**
- [ ] Install dependencies (playwright, openai, fuse.js)
- [ ] Implement scraper module with robots.txt check
- [ ] Implement AI extractor with Zod schemas
- [ ] Implement duplicate detector
- [ ] Create `POST /api/discovery/[id]/auto-research` endpoint
- [ ] Update admin form with "Auto-Research" button
- [ ] Add extracted data preview UI
- [ ] Add duplicate warning banner
- [ ] Add confidence indicators
- [ ] Test with 20 real Capoeira websites
- [ ] Measure extraction accuracy (target: 80%+)
- [ ] Deploy to staging for admin testing

**Success Criteria:**
- 80%+ extraction accuracy (vs. manual)
- Average admin time reduced to <8 minutes per group
- Zero false positive duplicates created
- Admins report improved workflow satisfaction

---

## Phase 3: Auto-Approve with Review (Week 4-5)

**Goal:** Automatically approve high-confidence submissions, humans only review edge cases.

### Logic: Auto-Approve Criteria

**A submission is auto-approved if ALL conditions met:**
1. ✅ Quality score ≥ 0.80
2. ✅ Extraction confidence ≥ 0.85
3. ✅ No potential duplicates (confidence < 0.60)
4. ✅ Email address found (for verification)
5. ✅ At least 1 location with complete address
6. ✅ Website accessible and Capoeira-related

**Otherwise → Human review queue**

### Automated Flow

**User submits URL:**
```
1. Create discovery_request (status: pending)
   ↓
2. Trigger auto-research (immediate or via cron)
   ↓
3. Scrape → Extract → Validate
   ↓
4. Calculate quality score
   ↓
5a. If HIGH QUALITY:
    - Create group automatically
    - Send verification email
    - Notify submitter: "Group added!"
    - Status: approved

5b. If LOW QUALITY or DUPLICATE:
    - Queue for human review
    - Notify admin team
    - Status: needs_review
```

### Implementation

#### 1. Auto-Research Trigger

**Option A: Immediate (Serverless Function)**
```typescript
// In POST /api/discovery/submit
if (process.env.AUTO_RESEARCH_ENABLED === 'true') {
  // Trigger async (don't await)
  triggerAutoResearch(request.id).catch(console.error);
}
```

**Option B: Scheduled (Vercel Cron)**
```typescript
// apps/quilombo/app/api/cron/process-discoveries/route.ts
export async function GET(request: Request) {
  // Verify cron secret
  if (request.headers.get('Authorization') !== `Bearer ${process.env.CRON_SECRET}`) {
    return Response.json({ error: 'Unauthorized' }, { status: 401 });
  }

  // Get pending requests
  const pending = await db
    .select()
    .from(discoveryRequests)
    .where(eq(discoveryRequests.status, 'pending'))
    .limit(10); // Process 10 at a time

  const results = [];

  for (const request of pending) {
    try {
      // Run auto-research
      const result = await autoResearchAndDecide(request);
      results.push(result);

      // Rate limiting: 2 second delay
      await new Promise(resolve => setTimeout(resolve, 2000));
    } catch (error) {
      console.error(`Failed to process ${request.id}:`, error);
    }
  }

  return Response.json({ processed: results.length });
}
```

**Vercel cron config:**
```json
// vercel.json
{
  "crons": [{
    "path": "/api/cron/process-discoveries",
    "schedule": "*/15 * * * *"  // Every 15 minutes
  }]
}
```

#### 2. Auto-Research & Decide Function

```typescript
// apps/quilombo/lib/discovery/auto-processor.ts
interface ProcessResult {
  requestId: string;
  decision: 'approved' | 'needs_review' | 'rejected';
  reason: string;
  groupId?: string;
}

export async function autoResearchAndDecide(
  request: DiscoveryRequest
): Promise<ProcessResult> {
  try {
    // Step 1: Scrape
    const scrapeResult = await scrapeWebsite(request.sourceUrl);
    if (!scrapeResult.success) {
      return {
        requestId: request.id,
        decision: 'needs_review',
        reason: 'Failed to scrape website'
      };
    }

    // Step 2: Extract
    const extractedData = await extractCapoeiraGroupData(scrapeResult.content);

    // Step 3: Detect duplicates
    const duplicates = await findPotentialDuplicates(extractedData);
    const hasDuplicates = duplicates.some(d => d.confidence > 0.60);

    // Step 4: Geocode
    for (const location of extractedData.locations) {
      try {
        const coords = await geocodeAddress(
          `${location.address}, ${location.city}, ${location.country}`
        );
        location.coordinates = coords;
      } catch (error) {
        // Geocoding failure doesn't block auto-approval
        console.error(`Geocoding failed:`, error);
      }
    }

    // Step 5: Quality scoring
    const qualityScore = calculateQualityScore(extractedData);

    // Step 6: Save research session
    await db.insert(researchSessions).values({
      requestId: request.id,
      scrapedAt: new Date(),
      scrapedContent: scrapeResult.content.substring(0, 50000),
      extractionSuccess: true,
      isCapoeiraRelated: true,
      capoeiraConfidence: extractedData.confidence
    });

    // Step 7: Update request with extracted data
    await db.update(discoveryRequests)
      .set({
        extractedData: extractedData as any,
        qualityScore,
        extractionConfidence: extractedData.confidence,
        potentialDuplicates: duplicates as any
      })
      .where(eq(discoveryRequests.id, request.id));

    // Step 8: Decision logic
    const shouldAutoApprove = (
      qualityScore >= 0.80 &&
      extractedData.confidence >= 0.85 &&
      !hasDuplicates &&
      extractedData.mainContact?.email &&
      extractedData.locations.length > 0 &&
      extractedData.isActive
    );

    if (shouldAutoApprove) {
      // Auto-approve: Create group
      const groupId = await createGroupFromExtraction(
        extractedData,
        request.id,
        request.sourceUrl
      );

      await db.update(discoveryRequests)
        .set({
          status: 'approved',
          createdGroupId: groupId
        })
        .where(eq(discoveryRequests.id, request.id));

      // Send verification email
      await sendGroupVerificationEmail({
        groupId,
        email: extractedData.mainContact.email!,
        groupName: extractedData.name
      });

      // Notify submitter
      if (request.submittedBy) {
        await sendSubmitterSuccess(request, groupId);
      }

      return {
        requestId: request.id,
        decision: 'approved',
        reason: 'High quality extraction',
        groupId
      };
    } else {
      // Needs human review
      await db.update(discoveryRequests)
        .set({ status: 'needs_review' })
        .where(eq(discoveryRequests.id, request.id));

      // Notify admin team
      await sendAdminReviewNotification(request, {
        qualityScore,
        confidence: extractedData.confidence,
        hasDuplicates,
        issues: [
          qualityScore < 0.80 && 'Low quality score',
          extractedData.confidence < 0.85 && 'Low extraction confidence',
          hasDuplicates && 'Potential duplicates found',
          !extractedData.mainContact?.email && 'No email address',
          !extractedData.isActive && 'Group may be inactive'
        ].filter(Boolean)
      });

      return {
        requestId: request.id,
        decision: 'needs_review',
        reason: 'Did not meet auto-approval criteria'
      };
    }
  } catch (error) {
    console.error('Auto-research failed:', error);

    // On error, queue for human review
    await db.update(discoveryRequests)
      .set({
        status: 'needs_review',
        reviewNotes: `Auto-research error: ${error.message}`
      })
      .where(eq(discoveryRequests.id, request.id));

    return {
      requestId: request.id,
      decision: 'needs_review',
      reason: `Error: ${error.message}`
    };
  }
}

async function createGroupFromExtraction(
  data: ExtractedGroup,
  requestId: string,
  sourceUrl: string
): Promise<string> {
  const [group] = await db.insert(groups).values({
    name: data.name,
    website: sourceUrl,
    verified: false,
    discoveryRequestId: requestId,
    discoveredFrom: sourceUrl,
    discoveredAt: new Date(),
    dataQualityScore: data.confidence,
    // ... map other fields
  }).returning();

  // Create locations
  for (const location of data.locations) {
    await db.insert(locations).values({
      groupId: group.id,
      name: location.name,
      address: location.address,
      city: location.city,
      state: location.state,
      country: location.country,
      coordinates: location.coordinates,
      schedule: location.schedule
    });
  }

  // Add leader if present
  if (data.leader) {
    await db.insert(groupLeaders).values({
      groupId: group.id,
      title: data.leader.title,
      nickname: data.leader.nickname,
      fullName: data.leader.fullName
    });
  }

  return group.id;
}
```

#### 3. Admin Review Dashboard Enhancements

**Priority Queue:**
- Sort by: Quality score (lowest first)
- Highlight: Potential duplicates
- Show: Auto-research results with confidence indicators
- Quick Actions: Approve, Edit & Approve, Reject, Merge with existing

**Duplicate Resolution UI:**
```
┌──────────────────────────────────────────────────────────┐
│  ⚠️  Potential Duplicate Detected                        │
├──────────────────────────────────────────────────────────┤
│                                                           │
│  Submitted Group:                                         │
│  Capoeira Angola São Paulo                               │
│  www.capoeirangola-sp.com                                │
│                                                           │
│  ──────────────────────────────────────────────────────  │
│                                                           │
│  Existing Group (85% match):                             │
│  Grupo Capoeira Angola São Paulo                         │
│  www.capoeira-angola-saopaulo.com                        │
│                                                           │
│  Matched Fields: Name (90%), City (100%)                 │
│                                                           │
│  [View Existing] [They're Different] [Merge/Update]      │
│                                                           │
└──────────────────────────────────────────────────────────┘
```

### Phase 3 Deliverables

**Week 4-5 Checklist:**
- [ ] Implement auto-research & decide logic
- [ ] Create auto-approval criteria config
- [ ] Set up Vercel cron job for processing queue
- [ ] Add decision logging to database
- [ ] Implement `createGroupFromExtraction()` function
- [ ] Enhanced admin dashboard with priority queue
- [ ] Duplicate resolution UI
- [ ] Admin override controls (force approve/reject)
- [ ] Analytics dashboard (approval rate, avg confidence, etc.)
- [ ] Email notifications for all outcomes
- [ ] Test with 50 diverse websites
- [ ] Measure auto-approval rate (target: 70%+)
- [ ] Deploy to staging, then production

**Success Criteria:**
- 70%+ submissions auto-approved
- <5% false approvals (admin must fix)
- Zero duplicate groups created
- Admin review queue manageable (<30 pending)
- Average processing time: <5 minutes per submission

---

## Phase 4: Fully Automated (Week 6+)

**Goal:** Scale to handle hundreds of submissions with minimal oversight.

### New Capabilities

#### 1. Batch Update System
**Purpose:** Quarterly refresh of all existing groups

**Process:**
- Query all groups with `lastResearchedAt > 90 days ago`
- Re-scrape their websites
- Compare new extraction vs. current data
- If significant changes detected → Queue for admin review
- If minor changes detected → Auto-update
- If website unreachable → Flag as "potentially inactive"

**Implementation:**
```typescript
// apps/quilombo/lib/discovery/batch-updater.ts
export async function batchUpdateGroups(limit: number = 20) {
  const staleGroups = await db
    .select()
    .from(groups)
    .where(
      or(
        isNull(groups.lastResearchedAt),
        lt(groups.lastResearchedAt, sql`NOW() - INTERVAL '90 days'`)
      )
    )
    .limit(limit);

  const results = [];

  for (const group of staleGroups) {
    try {
      // Re-scrape and extract
      const scrapeResult = await scrapeWebsite(group.website);
      const newData = await extractCapoeiraGroupData(scrapeResult.content);

      // Compare with existing data
      const changes = detectSignificantChanges(group, newData);

      if (changes.isSignificant) {
        // Queue for human review
        await db.insert(discoveryRequests).values({
          sourceUrl: group.website,
          sourceType: 'batch_update',
          status: 'needs_review',
          extractedData: newData as any,
          createdGroupId: group.id,
          reviewNotes: `Significant changes detected: ${changes.summary}`
        });

        results.push({ groupId: group.id, action: 'queued_for_review' });
      } else if (changes.hasMinorChanges) {
        // Auto-update
        await updateGroupFromExtraction(group.id, newData);
        results.push({ groupId: group.id, action: 'auto_updated' });
      } else {
        // No changes
        await db.update(groups)
          .set({ lastResearchedAt: new Date() })
          .where(eq(groups.id, group.id));

        results.push({ groupId: group.id, action: 'no_changes' });
      }

      // Rate limit: 3 second delay
      await new Promise(resolve => setTimeout(resolve, 3000));
    } catch (error) {
      console.error(`Batch update failed for ${group.id}:`, error);
      results.push({
        groupId: group.id,
        action: 'error',
        error: error.message
      });
    }
  }

  return results;
}

function detectSignificantChanges(
  existing: Group,
  newData: ExtractedGroup
): { isSignificant: boolean; hasMinorChanges: boolean; summary: string } {
  const changes = [];

  // Check name change
  if (normalizeString(existing.name) !== normalizeString(newData.name)) {
    changes.push('Name changed');
  }

  // Check location count
  const existingLocationCount = existing.locations?.length || 0;
  const newLocationCount = newData.locations.length;
  if (Math.abs(existingLocationCount - newLocationCount) > 1) {
    changes.push(`Location count: ${existingLocationCount} → ${newLocationCount}`);
  }

  // Check if website is down
  if (!newData.isActive) {
    changes.push('Website appears inactive');
  }

  // Significant if 2+ major changes
  const isSignificant = changes.length >= 2;

  // Minor changes: schedule updates, phone number changes, etc.
  const hasMinorChanges = !isSignificant && changes.length > 0;

  return {
    isSignificant,
    hasMinorChanges,
    summary: changes.join(', ')
  };
}
```

**Cron Schedule:**
```json
// vercel.json
{
  "crons": [
    {
      "path": "/api/cron/process-discoveries",
      "schedule": "*/15 * * * *"
    },
    {
      "path": "/api/cron/batch-update-groups",
      "schedule": "0 2 * * 0"  // Sunday 2am
    }
  ]
}
```

#### 2. Monitoring Dashboard
**Route:** `/admin/discovery-analytics`

**Metrics:**
- **Submission funnel:**
  - Submissions received
  - Auto-approved (%)
  - Queued for review (%)
  - Rejected (%)
- **Quality metrics:**
  - Average quality score
  - Average extraction confidence
  - Duplicate detection accuracy
- **Performance:**
  - Average processing time
  - API costs (OpenAI, Google Maps)
  - Error rate
- **Admin efficiency:**
  - Average review time
  - Reviews completed per admin
  - Time saved vs. manual process

**Implementation:**
```typescript
// apps/quilombo/app/admin/discovery-analytics/page.tsx
export default async function AnalyticsPage() {
  const metrics = await calculateMetrics();

  return (
    <div>
      <h1>Discovery System Analytics</h1>

      <StatCard
        title="Submissions (Last 30 Days)"
        value={metrics.totalSubmissions}
        trend={metrics.submissionTrend}
      />

      <StatCard
        title="Auto-Approval Rate"
        value={`${metrics.autoApprovalRate}%`}
        target="70%"
      />

      <StatCard
        title="Avg Quality Score"
        value={metrics.avgQualityScore.toFixed(2)}
        target="0.80"
      />

      <ChartCard
        title="Submission Funnel"
        data={metrics.funnelData}
      />

      <ChartCard
        title="Processing Time Over Time"
        data={metrics.processingTimeData}
      />

      <AlertsCard
        alerts={metrics.alerts}
      />
    </div>
  );
}

async function calculateMetrics() {
  const thirtyDaysAgo = new Date(Date.now() - 30 * 24 * 60 * 60 * 1000);

  const submissions = await db
    .select()
    .from(discoveryRequests)
    .where(gte(discoveryRequests.createdAt, thirtyDaysAgo));

  const totalSubmissions = submissions.length;
  const autoApproved = submissions.filter(s => s.status === 'approved').length;
  const needsReview = submissions.filter(s => s.status === 'needs_review').length;
  const rejected = submissions.filter(s => s.status === 'rejected').length;

  const avgQualityScore = submissions
    .filter(s => s.qualityScore)
    .reduce((sum, s) => sum + Number(s.qualityScore), 0) / submissions.length;

  return {
    totalSubmissions,
    submissionTrend: '+15%', // Calculate vs. previous period
    autoApprovalRate: ((autoApproved / totalSubmissions) * 100).toFixed(1),
    avgQualityScore,
    funnelData: {
      submitted: totalSubmissions,
      autoApproved,
      needsReview,
      rejected
    },
    alerts: [
      avgQualityScore < 0.7 && {
        type: 'warning',
        message: 'Average quality score below target'
      },
      autoApproved / totalSubmissions < 0.6 && {
        type: 'warning',
        message: 'Auto-approval rate below 60%'
      }
    ].filter(Boolean)
  };
}
```

#### 3. Cost Optimization

**Strategies:**
- Cache scraped content for 7 days (avoid re-scraping same URL)
- Use GPT-3.5-turbo for Capoeira verification (cheaper)
- Use GPT-4o only for structured extraction
- Batch geocoding requests
- Monitor API usage and set budget alerts

**Cost Tracking:**
```typescript
// apps/quilombo/lib/discovery/cost-tracker.ts
interface CostEntry {
  service: 'openai' | 'google_maps' | 'resend';
  operation: string;
  cost: number;
  timestamp: Date;
}

export async function trackCost(entry: CostEntry) {
  await db.insert(costTracking).values(entry);

  // Check if approaching budget limit
  const monthTotal = await getMonthlyTotal();
  const budget = Number(process.env.MONTHLY_API_BUDGET) || 100;

  if (monthTotal > budget * 0.9) {
    await sendBudgetAlert(monthTotal, budget);
  }
}

async function getMonthlyTotal(): Promise<number> {
  const startOfMonth = new Date();
  startOfMonth.setDate(1);
  startOfMonth.setHours(0, 0, 0, 0);

  const costs = await db
    .select({ total: sum(costTracking.cost) })
    .from(costTracking)
    .where(gte(costTracking.timestamp, startOfMonth));

  return Number(costs[0]?.total || 0);
}
```

#### 4. Advanced Features

**A. Social Media Discovery**
- Scrape Facebook/Instagram for group pages
- Extract location data from social posts
- Cross-reference with existing groups

**B. Community Submissions**
- Allow users to submit corrections/updates
- Gamification: Points for verified submissions
- Trust score system for frequent contributors

**C. Multi-Language Support**
- Portuguese content extraction (Brazilian groups)
- Spanish content extraction (Latin American groups)
- Automated translation of group descriptions

**D. Event Discovery**
- Extract upcoming events (batizados, workshops)
- Create event calendar
- Notify users of nearby events

### Phase 4 Deliverables

**Week 6+ Checklist:**
- [ ] Implement batch update system
- [ ] Create batch update cron job
- [ ] Build monitoring dashboard
- [ ] Implement cost tracking
- [ ] Add budget alerts
- [ ] Scraping cache layer (7-day TTL)
- [ ] Advanced duplicate detection (ML-based)
- [ ] Social media discovery (Phase 4B)
- [ ] Community submission workflow
- [ ] Multi-language support
- [ ] Event discovery
- [ ] Performance optimization
- [ ] Load testing (100 concurrent submissions)
- [ ] Production monitoring setup

**Success Criteria:**
- 90%+ auto-approval rate
- <1% false approvals
- Handle 100+ submissions per day
- Monthly API costs < $50
- Admin review time < 1 hour per day
- System uptime > 99.9%

---

## Technical Implementation Details

### API Routes Summary

| Route | Method | Purpose | Auth |
|-------|--------|---------|------|
| `/api/discovery/submit` | POST | User submits URL | Public |
| `/api/discovery/[id]` | GET | Get discovery request details | Admin |
| `/api/discovery/[id]/auto-research` | POST | Trigger auto-research | Admin |
| `/api/discovery/[id]/complete` | POST | Approve/reject submission | Admin |
| `/api/cron/process-discoveries` | GET | Process pending queue | Cron |
| `/api/cron/batch-update-groups` | GET | Batch update existing groups | Cron |
| `/verify/[token]` | GET | Group owner verification | Public |
| `/api/groups/verify` | POST | Complete verification | Public |

### Environment Variables

```bash
# OpenAI
OPENAI_API_KEY=sk-...

# Google Maps (optional, fallback to Nominatim)
GOOGLE_MAPS_API_KEY=...

# Resend
RESEND_API_KEY=re_...

# Cron security
CRON_SECRET=... # Generate with: openssl rand -base64 32

# Feature flags
AUTO_RESEARCH_ENABLED=true
AUTO_APPROVE_ENABLED=true

# Thresholds
AUTO_APPROVE_QUALITY_THRESHOLD=0.80
AUTO_APPROVE_CONFIDENCE_THRESHOLD=0.85
DUPLICATE_CONFIDENCE_THRESHOLD=0.60

# Budget
MONTHLY_API_BUDGET=50 # USD

# App URLs
NEXT_PUBLIC_APP_URL=https://thecapoeiralist.com
```

### Security Considerations

**Rate Limiting:**
- User submissions: 3 per hour per IP
- API endpoints: 100 per minute per user
- Cron jobs: Protected by secret header

**Input Validation:**
- URL whitelist: Only HTTP/HTTPS
- XSS protection: Sanitize all scraped content
- SQL injection: Use Drizzle parameterized queries

**Data Privacy:**
- Only scrape publicly accessible content
- Honor robots.txt directives
- Delete scraped screenshots after 30 days
- GDPR: Allow group owners to request data deletion

**API Key Protection:**
- Store in Vercel environment variables
- Never expose in client-side code
- Rotate keys quarterly
- Monitor for unusual usage patterns

### Error Handling

**Scraping Failures:**
- Retry with exponential backoff (1s, 2s, 4s)
- Fallback to Cheerio if Playwright fails
- Queue for manual review if all attempts fail

**AI Extraction Failures:**
- Log full error details
- Queue for manual review
- Track failure rate per model

**Geocoding Failures:**
- Don't block group creation
- Flag location for admin review
- Retry with Google Maps if Nominatim fails

**Email Failures:**
- Retry 3 times with exponential backoff
- Log failure reason
- Admin dashboard shows failed emails

### Testing Strategy

**Unit Tests:**
- Scraper with mock responses
- AI extractor with sample HTML
- Duplicate detector with test cases
- Quality scoring algorithm

**Integration Tests:**
- Full discovery flow (submit → research → approve)
- Verification flow (email → claim → manage)
- Batch update process

**Manual Testing:**
- Test with 20 diverse Capoeira websites
- Test edge cases (slow sites, non-Capoeira, duplicates)
- Test admin workflow end-to-end
- Test email deliverability

**Performance Testing:**
- Load test: 100 concurrent submissions
- Stress test: 1000 batch updates
- Measure API costs under load

---

## Cost Analysis

### Per-Submission Costs

**Phase 2-3 (Semi-Automated):**
- OpenAI GPT-4o: $0.02-0.05 per extraction
- Google Maps Geocoding: $0.005 per location
- Resend: $0 (free tier: 100/day, 3000/month)
- **Total: ~$0.025-0.055 per submission**

**Phase 4 (Fully Automated):**
- Same as above
- Additional: Batch updates (quarterly)
- **Total: ~$0.03-0.06 per submission**

### Monthly Cost Projections

**Scenario 1: 100 new submissions/month**
- OpenAI: $2-5
- Google Maps: $0.50
- Resend: $0 (free tier)
- **Total: $2.50-5.50/month**

**Scenario 2: 500 new submissions/month**
- OpenAI: $10-25
- Google Maps: $2.50
- Resend: $0-10 (may exceed free tier)
- **Total: $12.50-37.50/month**

**Scenario 3: 1000 new submissions/month**
- OpenAI: $20-50
- Google Maps: $5
- Resend: $20 (paid plan)
- **Total: $45-75/month**

### Batch Update Costs

**All 242 existing groups (quarterly):**
- One-time: $6-13
- Annual: $24-52

### Cost Optimization Tips

1. **Cache aggressively**: Store scraped content for 7 days
2. **Use cheaper models**: GPT-3.5 for verification, GPT-4o for extraction
3. **Batch geocoding**: Group multiple addresses per API call
4. **Monitor budgets**: Set up alerts at 80% of budget
5. **Free tiers**: Maximize Resend free tier (3000 emails/month)

---

## Success Metrics

### Phase 1 (Week 1)
- ✅ Deployment complete
- ✅ 10 test submissions processed successfully
- ✅ Admin team trained and comfortable with workflow
- ✅ Average processing time: <15 minutes

### Phase 2 (Week 2-3)
- ✅ 80%+ extraction accuracy
- ✅ Admin time reduced by 50%
- ✅ Zero duplicates created
- ✅ 20 real groups processed successfully

### Phase 3 (Week 4-5)
- ✅ 70%+ auto-approval rate
- ✅ <5% false positives (manual correction needed)
- ✅ Admin review queue manageable (<30 pending)
- ✅ 50 groups processed successfully

### Phase 4 (Week 6+)
- ✅ 90%+ auto-approval rate
- ✅ Handle 100+ submissions/day
- ✅ Monthly costs < $50
- ✅ System uptime > 99.9%
- ✅ Admin review time < 1 hour/day

### Long-Term (6 months)
- 🎯 1,000+ groups in database
- 🎯 50%+ verified by owners
- 🎯 Quarterly batch updates automated
- 🎯 User-driven discovery (not just admin)
- 🎯 Database 90%+ up-to-date

---

## Future Enhancements

### Phase 5+ Ideas

**A. Advanced AI Features:**
- GPT-4 Vision for extracting info from images (flyers, schedules)
- Sentiment analysis on reviews/comments
- Automatic group classification (kids-friendly, competition-focused, etc.)

**B. Mobile App Integration:**
- Submit group by taking photo of flyer
- OCR to extract contact info
- GPS-based discovery ("groups near me")

**C. API for Partners:**
- Public API for event organizers
- Embed "Find Groups" widget on external sites
- Integration with Facebook Events

**D. Machine Learning:**
- Train custom model on Capoeira group websites
- Improve duplicate detection with embeddings
- Predict group quality from website features

**E. Community Features:**
- User reviews and ratings
- Photo galleries per group
- Discussion forums per group
- Student check-ins and attendance tracking

---

## Conclusion

This specification provides a complete roadmap for building an automated Capoeira group discovery system that:

1. **Starts simple**: Human-powered workflow deployable in Week 1
2. **Scales progressively**: Each phase adds more automation
3. **Works on Vercel**: No infrastructure, pure serverless
4. **Stays cost-effective**: <$50/month for hundreds of submissions
5. **Maintains quality**: Human review for edge cases

**Next Steps:**
1. Review and approve this specification
2. Create feature branch: `feat/automated-group-discovery`
3. Start with Phase 1 database migration
4. Deploy Phase 1 to production within Week 1
5. Iterate based on real usage and feedback

---

**Document Version:** 1.0
**Last Updated:** 2025-11-14
**Maintained By:** Development Team
**Review Schedule:** After each phase completion

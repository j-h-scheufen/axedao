# The Capoeira List

This package hosts files originally received from "The Capoeira List" project (http://home.znet.com/capoeira_list/) which contain a manually collected and curated list of capoeira groups across the globe, including publicly available information about locations, group representatives, and contacts.

This package provides scripts for extracting, cleaning, and processing these files to derive structured data suitable for database import.

## Directory Structure

```
packages/the-capoeira-list/
├── groups-json/          # Cleaned JSON data (117 files, 1,263 groups)
├── scripts/              # Processing pipeline scripts
│   ├── 01-filter-quality.sh         # Phase 1: Quality filtering
│   ├── 02-validate-websites.ts      # Phase 2: Website validation
│   ├── 03-geocode-locations.ts      # Phase 3: Geocoding
│   └── run-pipeline.sh              # Master pipeline script
├── out/                  # Output directory (created by scripts)
│   ├── 01-filtered/      # Phase 1 output
│   ├── 02-validated/     # Phase 2 output
│   ├── 03-geocoded/      # Phase 3 output (final data)
│   ├── *-report.json     # Processing reports
│   └── geocode-cache.json # Geocoding cache
└── README.md
```

## Data Quality Overview

After cleanup of misparsed entries, from 1,263 groups:

- **1,262** (99.9%) have names
- **872** (69%) have websites
- **910** (72%) have leaders
- **790** (62.5%) have at least one location
- **629** (49.8%) have name + website + location

**Cleanup Applied:**
- Fixed 30 misparsed entries (section headers/location names incorrectly captured as group names)
- Removed 3 note entries that weren't actual groups
- Corrected leader information and character encoding issues

The pipeline is designed to filter, validate, and enrich this data for database import.

## Processing Pipeline

The pipeline consists of three phases:

### Phase 1: Quality Filtering

**Script:** `01-filter-quality.sh`

Filters groups based on minimum quality criteria:

- ✓ Must have a **name**
- ✓ Must have at least one **location with address**
- ✓ Must have either a **website** OR a **leader** (preferably both)
- ✗ Excludes groups marked as **inactive** in notes

**Output:** Groups that meet all criteria, with metadata about filtering

**Expected Result:** ~629 groups (49.7% of original data)

### Phase 2: Website Validation & Data Enrichment

**Script:** `02-validate-websites.ts` (requires Node.js/tsx)

For each group:

1. **Validates primary website:**
   - Checks if URL is reachable
   - Analyzes content for capoeira-related keywords
   - Extracts contact information (emails, phone numbers)
   - Records redirects and HTTP status

2. **Validates alternative URLs:**
   - Checks URLs in `sources` and `resources` arrays
   - Identifies working alternatives

3. **Enriches data:**
   - Extracts emails and phone numbers from website content
   - Stores content snippets for manual review

**Features:**
- Respects rate limits (500ms delay between requests)
- User-agent identification
- Timeout handling (10 seconds)
- Detailed error reporting

**Output:** Groups with website validation metadata and enriched contact data

### Phase 3: Geocoding

**Script:** `03-geocode-locations.ts` (requires Node.js/tsx)

For each location in each group:

1. **Geocodes addresses** using OpenStreetMap Nominatim API
2. **Converts to GeoJSON Feature format:**
   ```json
   {
     "type": "Feature",
     "geometry": {
       "type": "Point",
       "coordinates": [longitude, latitude]
     },
     "properties": {
       "address": "...",
       "displayName": "...",
       "countryCode": "US",
       "boundingBox": [...]
     }
   }
   ```
3. **Adds geocoding metadata** (success, confidence, errors)

**Features:**
- **Geocoding cache** to avoid redundant API calls
- Respects Nominatim rate limits (1 request/second)
- Proper user-agent identification
- Detailed error reporting
- Cache persistence across runs

**Output:** Final data ready for database import with GeoJSON locations

## Usage

### Prerequisites

1. **jq** (for Phase 1):
   ```bash
   # macOS
   brew install jq

   # Linux
   apt-get install jq
   ```

2. **tsx** (for Phases 2 & 3):
   ```bash
   npm install -g tsx
   # or
   pnpm add -g tsx
   ```

### Running the Pipeline

#### Run all phases:
```bash
cd packages/the-capoeira-list
./scripts/run-pipeline.sh
```

#### Run specific phases:
```bash
# Only Phase 1 (quality filtering)
./scripts/01-filter-quality.sh

# Only Phase 2 (website validation)
./scripts/run-pipeline.sh --phase-2-only

# Only Phase 3 (geocoding)
./scripts/run-pipeline.sh --phase-3-only

# Skip specific phases
./scripts/run-pipeline.sh --skip-phase-2
```

#### Get help:
```bash
./scripts/run-pipeline.sh --help
```

### Processing Time Estimates

- **Phase 1:** < 1 minute (pure jq filtering)
- **Phase 2:** ~8-10 hours (website validation with 500ms delays, ~600 groups × 2 URLs avg)
- **Phase 3:** ~15-20 minutes (geocoding with 1.1s delays, ~800 locations, cache helps on reruns)

**Total:** ~9-11 hours for complete pipeline on fresh data

### Reports

Each phase generates a JSON report in `out/`:

- `01-filter-report.json` - Filtering statistics
- `02-validation-report.json` - Website validation results
- `03-geocode-report.json` - Geocoding statistics

Reports include:
- Total counts (input/output)
- Success/failure breakdown
- File-by-file results
- Timestamps and criteria used

## Data Schema

### Final Output Schema (Phase 3)

Each group in the final output contains:

```typescript
{
  // Basic info
  name: string | null;
  website: string | null;
  leader: {
    title?: string;      // e.g., "professor", "mestre"
    nickname?: string;   // e.g., "Espantalho"
    name?: string;       // Full name
  } | null;
  mainContact: {
    name?: string;
    email?: string | null;
    phone?: string | null;
  } | null;

  // Locations with GeoJSON
  locations: Array<{
    name?: string;
    address?: string;
    schedule?: string;
    contactPerson?: string | null;
    email?: string | null;
    phone?: string | null;
    rawText?: string;

    // GeoJSON Feature (Phase 3)
    geoJsonFeature?: {
      type: "Feature";
      geometry: {
        type: "Point";
        coordinates: [number, number]; // [lon, lat]
      };
      properties: {
        address: string;
        displayName?: string;
        countryCode?: string;
        boundingBox?: [number, number, number, number];
      };
    };

    // Geocoding metadata
    geocodeMetadata?: {
      geocodedAt: string;
      success: boolean;
      service: "nominatim";
      confidence?: string;
      errorMessage?: string;
    };
  }>;

  // Alternative sources
  sources: string[];
  resources?: string[];

  // Original data
  notes: string;
  rawRecord: string;

  // Processing metadata
  filterMetadata?: { ... };      // Phase 1
  validationMetadata?: { ... };  // Phase 2
}
```

## Database Import

The final output (`out/03-geocoded/*.json`) is ready for import into the Quilombo groups table.

### Mapping to DB Schema

See `apps/quilombo/db/schema.ts` for the `groups` table schema:

- `name` → `groups.name`
- `website` → `groups.links` (as SocialLink)
- `leader.nickname` → Find or create user, set as `groups.leader`
- `locations[].geoJsonFeature` → `group_locations.feature`
- `notes` → Can be stored in `groups.description` or separate notes field

**Important:**
- Groups imported this way have **no admins** initially
- They are **subject to claiming** via the group claim system
- `groups.createdBy` should be set to a system user or null
- `groups.claimedBy` is null until someone claims it

### Import Script (TODO)

A future import script should:

1. Read final JSON files from `out/03-geocoded/`
2. For each group:
   - Create group record
   - Create location records with GeoJSON features
   - Handle duplicates (check by name + location)
   - Log import results

## Caching

### Geocode Cache

The geocoding script maintains a persistent cache in `out/geocode-cache.json`:

- **Key:** MD5 hash of normalized address
- **Value:** Geocoding result (success/failure, coordinates, metadata)
- **Benefits:**
  - Avoids redundant API calls on reruns
  - Faster processing for duplicate addresses
  - Respects API rate limits

**To clear cache:** Delete `out/geocode-cache.json`

## API Usage & Rate Limits

### OpenStreetMap Nominatim

- **Rate limit:** 1 request per second
- **Usage policy:** https://operations.osmfoundation.org/policies/nominatim/
- **User-agent:** Properly identified as `CapoeiraListProject/1.0`
- **Caching:** Implemented to minimize requests

### Website Validation

- **Rate limit:** 500ms delay between requests (self-imposed)
- **Timeout:** 10 seconds per request
- **User-agent:** `Mozilla/5.0 (compatible; CapoeiraListBot/1.0)`

## Troubleshooting

### Phase 1 Issues

**Error: `jq: command not found`**
- Install jq: `brew install jq` (macOS) or `apt-get install jq` (Linux)

**Error: `No such file or directory: groups-json/`**
- Ensure you're running from the `packages/the-capoeira-list` directory

### Phase 2 Issues

**Error: `tsx: command not found`**
- Install tsx globally: `npm install -g tsx` or `pnpm add -g tsx`

**Slow processing**
- Phase 2 is intentionally slow to respect rate limits
- Use `--skip-phase-2` to skip on subsequent runs if websites haven't changed

**Timeout errors**
- Some websites are slow or unreachable
- Errors are logged in validation metadata
- Failed validations can be manually reviewed in reports

### Phase 3 Issues

**Error: `429 Too Many Requests`**
- Nominatim rate limit exceeded
- The script respects rate limits, but check if other processes are using the API
- Wait and retry

**Many geocoding failures**
- Check addresses in original data
- Some addresses may be incomplete or malformed
- Review `03-geocode-report.json` for details

**Cache corruption**
- Delete `out/geocode-cache.json` and rerun Phase 3

## Future Enhancements

- [ ] Create database import script
- [ ] Add duplicate detection (similar names, nearby locations)
- [ ] Implement manual review interface for flagged groups
- [ ] Add support for additional geocoding services (Google, Mapbox) as fallback
- [ ] Extract class schedules into structured format
- [ ] Add data quality scoring (0-100) based on completeness
- [ ] Create visualization dashboard for processing results
- [ ] Add support for incremental updates (process only new/changed groups)

## License

This package and the original data are subject to the licensing terms of "The Capoeira List" project.

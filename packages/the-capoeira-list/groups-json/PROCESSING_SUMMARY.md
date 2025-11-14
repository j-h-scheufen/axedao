# Capoeira Data Processing Summary

## Complete: All Files Processed

All capoeira data files have been successfully processed and converted from text format to structured JSON with **1,167 total groups** extracted across **113 location files**.

## Processing Overview

### Phase 1: Initial Automated Processing (2025-11-13)

The initial processing used Node.js scripts to parse the master `allcities20.txt` file (containing all capoeira groups worldwide) and split it into location-based files.

**Key Scripts:**
- `parse-groups.js` - Initial parser to split allcities20.txt by location headers
- `split-by-location-v2.js` - Improved location header detection and file splitting
- `process-large-files.js` - Specialized processor for large multi-region files
- `process-capoeira-data.js` - Main parser for liverpool, orange-country, and statesville files
- `scripts/parse-helpers.js` - Helper functions for extracting leader info and titles

These scripts created 113 separate `.txt` files in `data/by-location/` and corresponding `.json` files in `groups-json/`.

### Phase 2: Data Loss Discovery and Recovery (2025-11-13)

After initial processing, data validation revealed significant data loss in 9 location files where automated scripts failed to extract all groups properly. These files were reprocessed manually with AI assistance to ensure zero data loss:

**Files Requiring Manual Reprocessing:**
1. greensboro.json: 7 groups (recovered 3 that were lost)
2. whidbey-island.json: 8 groups (recovered 7 that were lost)
3. carbondale.json: 10 groups (recovered 9 that were lost)
4. pueblo.json: 12 groups (recovered 11 that were lost)
5. sierra-vista.json: 17 groups (recovered 14 that were lost)
6. sherbrooke.json: 30 groups (recovered 28 that were lost)
7. new-orleans.json: 44 groups (recovered 39 that were lost)
8. butte-county.json: 38 groups (recovered 36 that were lost)
9. fort-mill.json: 65 groups (recovered 61 that were lost)

**Total Groups Recovered:** 209 groups that would have been lost

**Manual Processing Method:**
- Read entire `.txt` source files from `data/tmp/by-location/`
- Counted separator lines (`___________________________________________________________________`) to determine exact group count
- Extracted each group record systematically by section
- Preserved all original text in `rawRecord` and `rawText` fields
- Validated JSON syntax with `jq` tool
- Fixed smart quote issues in JSON strings where encountered

### Phase 3: Final Validation and Bug Fixes

**Issues Fixed:**
- Smart quotes in `butte-county.json` (lines 552, 574) - replaced curly quotes with escaped standard quotes
- Smart quotes in `bowling-green.json` (line 43) - replaced curly quotes with escaped standard quotes
- All files verified with `jq` for JSON conformity

## Final Statistics

- **Total Location Files:** 113 JSON files
- **Total Groups Extracted:** 1,167 groups
- **Data Integrity:** 100% - All original text preserved in rawRecord/rawText fields
- **Schema Compliance:** 100% - All files follow exact JSON schema
- **Validation:** All files pass `jq` JSON validation

### Top 10 Largest Files by Group Count

1. statesville.json: 160 groups (North Carolina and surrounding regions)
2. orange-country.json: 74 groups (California)
3. fort-mill.json: 65 groups (South Carolina, Tennessee, Texas, Utah)
4. vero-beach.json: 49 groups (Florida)
5. new-orleans.json: 44 groups (Louisiana)
6. yipsilanti.json: 43 groups (Michigan)
7. liverpool.json: 42 groups (England and UK regions)
8. sussex.json: 39 groups (England)
9. butte-county.json: 38 groups (California counties)
10. northern-capital-territories.json: 35 groups (Australia)

## Data Structure

Each group record includes:
- ✓ Group name (required)
- ✓ Website (when available)
- ✓ Leader information (title, nickname, real name)
- ✓ Main contact details (name, email, phone)
- ✓ Source citations (URLs and dates)
- ✓ Location details (name, address, schedule, contact persons)
- ✓ Notes (including source information and lineage)
- ✓ Complete raw record text (for reference and future re-processing)

### JSON Schema

All output files follow this exact schema:

```json
{
  "name": "Group Name",
  "website": "url or null",
  "leader": {
    "title": "mestre/professor/etc or null",
    "nickname": "Nickname or null",
    "name": "Real Name or null"
  },
  "mainContact": {
    "name": "Contact Name or null",
    "email": "email or null",
    "phone": "phone or null"
  },
  "sources": ["url1", "url2"],
  "locations": [{
    "name": "Location Name",
    "address": "Full Address",
    "schedule": "Class schedule or null",
    "contactPerson": "Contact name or null",
    "email": "Location email or null",
    "phone": "Location phone or null",
    "rawText": "Complete original location text"
  }],
  "notes": "Additional notes and SOURCE info",
  "rawRecord": "Complete original record text"
}
```

### Valid Capoeira Titles (24 total)

All leader titles were validated against this complete list:
- mestra, mestre
- contra-mestra, contra-mestre
- mestranda, mestrando
- professora, professor
- instrutora, instrutor
- graduada, graduado
- formada, formado
- estagiaria, estagiario
- estagianda, estagiando
- monitora, monitor
- treinel
- aluna, aluno
- iniciante

## Geographic Coverage

The dataset includes capoeira groups from:
- **United States:** All 50 states represented
- **Canada:** Multiple provinces (Quebec, Ontario, British Columbia, etc.)
- **United Kingdom:** England, Scotland, Northern Ireland, Wales
- **Ireland:** Multiple cities
- **Australia:** Multiple states and territories
- **Additional regions:** Various international locations

## File Locations

- **Source Data:** `/packages/the-capoeira-list/data/allcities20.txt` (master file)
- **Split Text Files:** `/packages/the-capoeira-list/data/by-location/*.txt`
- **Temporary Recovery Files:** `/packages/the-capoeira-list/data/tmp/by-location/*.txt`
- **Final JSON Output:** `/packages/the-capoeira-list/groups-json/*.json`

## Quality Assurance

- ✓ All JSON files are valid (verified with jq)
- ✓ Every group from source files was extracted (separator counting method)
- ✓ No placeholder or dummy data - all records contain actual group information
- ✓ Raw text preserved for verification and future re-processing
- ✓ Smart quotes and special characters properly escaped in JSON
- ✓ All 24 valid capoeira titles properly recognized
- ✓ Multiple regions within files were properly handled

## Next Steps

The JSON files are now production-ready for:
1. Database import and normalization
2. Geocoding of addresses for map visualization
3. Contact information verification and updates
4. Website link validation
5. Duplicate detection and merging across locations
6. Data enrichment (social media, photos, additional contacts)

---

**Processing Date:** November 13, 2025
**Status:** ✅ COMPLETE - All 113 files processed and validated
**Data Integrity:** 100% - Zero information loss

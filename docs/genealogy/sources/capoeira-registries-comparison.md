# Capoeira Registries & Directories: Competitive Landscape Analysis

**Date**: 2025-11-19
**Purpose**: Comparative analysis of existing Capoeira registry platforms
**Category**: Competitive Research

---

## Executive Summary

Seven major platforms attempt to catalog Capoeira groups, mestres, and lineages. Scale varies dramatically from **6 groups (Lalaue Article) to 1,446 groups (Brazilian Government Registry)**. None have successfully implemented comprehensive lineage tree visualization combined with organizational structure modeling.

### Platform Comparison at a Glance

| Platform | Scale | Focus | Lineage Model | Data Quality |
|----------|-------|-------|---------------|--------------|
| **IPHAN Brazil** | 1,446 groups | Cultural heritage registry | None | Official, structured |
| **Portal Capoeira** | 548 academias | Directory/search | "Linhagem" field | User-contributed |
| **CapoeiraHub** | ~30 groups, hundreds of mestres | Lineage tree visualization | Single relationship type | User-contributed, incomplete |
| **Fandom Wiki** | 29 groups | Wiki documentation | Category-based (Filhos de Bimba) | Community wiki |
| **CapoeiraWiki** | Unknown (dozens) | Encyclopedia | Narrative only | Community wiki |
| **Lalaue Article** | 6 groups | Editorial content | Narrative descriptions | Journalistic |
| **Onde Acho Capoeira** | ~15 groups | Brazilian classifieds directory | None | User-contributed |

---

## Platform 1: IPHAN Brazil (Official Government Registry)

**URL**: https://capoeira.iphan.gov.br/grupo

### Overview

**Purpose**: Brazilian cultural heritage preservation under IPHAN (Instituto do Patrimônio Histórico e Artístico Nacional)

**Scale**: **~1,446 registered groups** (largest known registry)

**Scope**: Groups, individual capoeiristas, researchers, academic publications

### Data Model

**Organization Fields Captured**:
```typescript
{
  // Identity
  name: string,
  entityType: 'association' | 'school' | 'group' | 'confederation' | 'federation' | 'league',

  // Location
  municipality: string,
  state: string,           // Brazilian states
  region: string,          // International regions if outside Brazil

  // Capoeira Classification
  style: 'Angola' | 'Regional' | 'Contemporary' | 'Street Capoeira' | 'Other',

  // Cultural Significance
  culturalDesignation: 'ponto de cultura' | 'ponto de memória' | null,

  // Infrastructure
  hasHeadquarters: boolean,

  // (Individual profiles include biographical data)
}
```

**Organizational Features**:
- Hierarchical filtering by entity type (confederation → federation → league → association → school → group)
- Geographic filtering (Brazilian municipalities, international regions)
- Style-based categorization
- Cultural significance tagging

**Lineage/Relationship Modeling**: ❌ **None detected**
- No explicit teacher-student relationships
- No organizational hierarchies (parent-child groups)
- No founder/mestre associations visible in structure

### Approach

**Governmental/Institutional**:
- Treats Capoeira as **intangible cultural heritage**
- Documentary purpose, not regulatory
- Public resource for stakeholders, researchers, policy-makers
- No certification or licensing function
- Systematic mapping and archival focus

### Strengths

1. **✅ Largest scale**: 1,446 groups vs. 30-548 elsewhere
2. **✅ Official recognition**: Government-backed, authoritative
3. **✅ Structured data**: Consistent entity types, geographic data, style classification
4. **✅ Cultural context**: Recognizes heritage significance (ponto de cultura, ponto de memória)
5. **✅ Entity type hierarchy**: Confederation → Federation → League → Association → School → Group

### Limitations

1. **❌ No lineage tree**: Missing teacher-student relationships
2. **❌ No group hierarchies**: Can't model sede/filiais or affiliations
3. **❌ No mestre profiles**: Focused on organizations, not individuals
4. **❌ Brazil-centric**: International groups likely underrepresented
5. **❌ No verification**: User-submitted data quality unclear
6. **❌ No visual discovery**: Likely text-based lists, no interactive maps or trees

### Relevance for Quilombo

**Data Source Potential**:
- Could import 1,446 groups as starting dataset
- Entity type taxonomy useful for `group_types` enum
- Style classification aligns with our model
- Cultural designation could inspire badge/verification system

**Differentiation**:
- Quilombo can add lineage relationships IPHAN lacks
- International coverage where IPHAN is Brazil-focused
- Visual discovery (map, tree) vs. documentary registry

---

## Platform 2: Portal Capoeira (Academia Directory)

**URL**: https://portalcapoeira.com/diretorio-de-academias/

### Overview

**Purpose**: Searchable directory of Capoeira academias

**Scale**: **548 academias** (second largest)

**Scope**: Individual academias/schools with geographic and lineage data

### Data Model

**Academia Fields Captured**:
```typescript
{
  // Identity
  title: string,               // Academia name

  // Leadership
  responsavel: string,         // Responsible party (mestre/professor name as string)
  linhagem: string,            // Lineage (explicitly captured!)

  // Location
  location: string,
  coordinates?: {lat, lng},    // For map/radius search

  // Contact
  phone: string[],
  website: string,

  // Metadata
  category: string,            // Primary category
  tags: string[],              // e.g., "capoeira angola", mestre names
  viewCount: number,           // Popularity metric
  dateAdded: Date,
}
```

**Search & Discovery**:
- Multi-layered filtering (category, location, tags, custom fields)
- Radius search (geographic proximity in km/miles)
- Sort by: alphabetical, date, popularity, random
- Tagged with mestre names and lineage terms

**Lineage/Relationship Modeling**: ✅ **"Linhagem" field exists**
- Explicitly captures lineage information
- Example: "Mestre Silvestre e Mestre Flávio Tucano"
- Appears to be free-text string (not structured relationships)
- Enables tracking traditions and genealogical connections

### Approach

**Community Directory**:
- User-contributed listings
- Search and discovery focused
- Geographic emphasis (find academias near you)
- Lineage awareness but unstructured

### Strengths

1. **✅ Explicit lineage field**: Only platform besides CapoeiraHub to capture lineage
2. **✅ Good scale**: 548 academias is substantial
3. **✅ Geographic search**: Radius-based discovery
4. **✅ Popularity tracking**: View counts show community engagement
5. **✅ Contact info**: Phone, website for each academia
6. **✅ Tag-based discovery**: Flexible categorization

### Limitations

1. **❌ Lineage is unstructured**: Free-text string, not relational graph
2. **❌ No mestre profiles**: Names as strings, not linked entities
3. **❌ No organizational hierarchies**: Can't see group networks (e.g., all ABADÁ schools)
4. **❌ No visual lineage tree**: Text-based directory only
5. **❌ Verification unclear**: Anyone can submit?
6. **❌ 548 still incomplete**: Thousands of academias exist globally

### Relevance for Quilombo

**Validation**:
- Proves "Linhagem" (lineage) is valued by community
- Geographic search is important (users want "near me")
- Popularity/engagement metrics work (view counts)

**Differentiation**:
- Quilombo can make lineage **structured and relational** (not free-text)
- Link lineage to visual tree and group hierarchies
- Comprehensive coverage (import IPHAN + Portal Capoeira + more)

---

## Platform 3: Capoeira Fandom Wiki

**URL**: https://capoeira.fandom.com/wiki/Catégorie:Groupes

### Overview

**Purpose**: Community wiki documentation

**Scale**: **29 groups** (smallest registry)

**Scope**: Groups with wiki pages, emphasis on historical documentation

### Data Model

**Group Entry Structure**:
```typescript
{
  // Identity
  name: string,

  // Visual
  logo?: string,               // Group logo/image

  // Documentation
  wikiPageUrl: string,         // Link to full article

  // Categorization
  parentCategory: string,      // e.g., "Filhos de Bimba"
  subcategories: string[],     // Organizational branches

  // Metadata
  trendingStatus?: boolean,    // Featured/trending flag
}
```

**Organizational Structure**:
- **Alphabetical index** (A, B, C... Z sections)
- **Hierarchical categorization**: All groups under "Filhos de Bimba" (Bimba's descendants)
- Some groups have subcategories (e.g., "Centro Cultural Senzala", "Muzenza Capoeira")
- One featured group: "Centro Cultural Senzala" (trending pages)

**Lineage/Relationship Modeling**: ⚠️ **Category-based lineage**
- Primary relationship: Connection to "Filhos de Bimba" lineage
- Implicit lineage through wiki categories
- No explicit founder/mestre attribution on index (likely in individual pages)
- Wiki taxonomy rather than formal genealogical database

### Approach

**Wiki-based Documentation**:
- Community-authored encyclopedia
- Narrative focus over structured data
- Lineage through categorical inheritance ("children of Bimba")

### Strengths

1. **✅ Rich narrative**: Wiki format allows detailed storytelling
2. **✅ Lineage categorization**: "Filhos de Bimba" shows conceptual lineage
3. **✅ Visual branding**: Includes group logos
4. **✅ Community ownership**: Anyone can contribute

### Limitations

1. **❌ Tiny scale**: Only 29 groups (vs. 1,446 in IPHAN)
2. **❌ No structured lineage**: Category inheritance not same as relationship graph
3. **❌ Regional bias**: "Filhos de Bimba" excludes Angola lineage groups
4. **❌ No search/discovery**: Alphabetical list only
5. **❌ No geographic data**: Can't find groups by location
6. **❌ No verification**: Wiki vandalism risk

### Relevance for Quilombo

**Lessons**:
- Category-based lineage insufficient (need explicit relationships)
- Visual branding (logos) matters for group identity
- Narrative documentation valuable alongside structured data

**Differentiation**:
- Quilombo needs ALL lineages (not just Bimba → Regional)
- Structured data + narrative, not either/or
- Scale matters (29 groups not useful)

---

## Platform 4: CapoeiraWiki (Encyclopedia)

**URL**: https://capoeirawiki.org/wiki/Mestre_(title) and https://capoeirawiki.org/wiki/Capoeira_organizations

### Overview

**Purpose**: Encyclopedia-style documentation of Capoeira knowledge

**Scale**: Unknown (dozens of mestre and organization articles)

**Scope**: Mestre biographies, organization descriptions, cultural context

### Data Model

**Mestre Documentation**:
```typescript
{
  // Identity
  name: string,
  title: 'Mestre' | 'Contra-Mestre' | ...,

  // Biography
  narrative: string,           // Long-form text
  photoGallery: string[],      // Images of mestre and students

  // Categorization
  categories: ['Capoeira mestres', 'Titles and ranks in capoeira'],

  // Relationships (implicit)
  relatedArticles: string[],   // Links to students, organizations
}
```

**Organization Documentation**:
```typescript
{
  // Identity
  name: string,

  // Founding
  founder: string,             // Mestre name (as text, not link)
  foundingYear: number,
  foundingLocation: string,

  // Description
  philosophy: string,
  styleFocus: string,
  geographicReach: string,     // "over 30 countries"
  branches?: string,           // "branches in X countries"

  // Internal Structure
  hierarchy: string,           // Narrative description of mestre → instructor → student
  beltSystem: string,          // Description (not structured)
}
```

**Lineage/Relationship Modeling**: ❌ **Narrative only**
- No explicit lineage structures or relationship graphs
- Teacher-student relationships mentioned in biographies (text)
- Photo captions like "Mestre Bimba and his students" provide context
- Relationships must be inferred from individual articles
- Links between articles (e.g., "See also: Contra-mestre (title)") suggest hierarchy

### Approach

**Encyclopedia Documentation**:
- Prioritizes **biographical catalogs over structural relationships**
- Narrative-driven, not database-driven
- Describes vertical hierarchy within groups, not inter-organizational relationships
- Mestre-to-organization linking through **author relationships** in narrative

### Strengths

1. **✅ Rich context**: Definitions, philosophy, cultural significance
2. **✅ Photo galleries**: Visual documentation of mestres and students
3. **✅ Internal hierarchy descriptions**: Explains mestre → instructor → student structures
4. **✅ Cross-linking**: Related articles for exploration

### Limitations

1. **❌ No structured lineage**: Relationships only in narrative text
2. **❌ No database**: Can't query "all students of Mestre X"
3. **❌ Flat organization listing**: No inter-organizational relationships
4. **❌ No temporal data**: When did training occur?
5. **❌ No geographic discovery**: Can't find organizations by location
6. **❌ Scale unclear**: Unknown completeness

### Relevance for Quilombo

**Lessons**:
- Definitions and context matter (what is a "mestre"?)
- Photo galleries valuable for cultural preservation
- Narrative + structured data both needed

**Differentiation**:
- Quilombo provides structured queryable relationships
- Database enables "all students of X", "all groups in Y city"
- Combine narrative biographies with relational graph

---

## Platform 5: Lalaue Article (Editorial)

**URL**: https://www.lalaue.com/learn-capoeira/biggest-capoeira-groups-worldwide/

### Overview

**Purpose**: Editorial article ranking biggest Capoeira groups

**Scale**: **6 groups** (curated list)

**Scope**: Major international organizations only

### Groups Listed

1. **Senzala** (founded 1963)
   - "Probably the most famous Capoeira group in the world"
   - Started by three brothers in Rio de Janeiro
   - Trained under Bimba and Pastinha
   - Organizes International Festival of Capoeira in France

2. **Cordão de Ouro** (founded 1966)
   - Created by Mestre Suassuna
   - First capoeira group in São Paulo
   - Overcame initial prejudice through government support

3. **Grupo Axé Capoeira** (founded 1982)
   - Headquartered in Vancouver
   - Operates academies across multiple continents
   - "More than 10,000 students"
   - Performs at various events

4. **Grupo Muzenza** (founded 1972)
   - Expanded by Mestre Burgues
   - Teaches both Angola and Regional styles
   - "More than 20,000 students"
   - Operates in "26 Brazilian states" and "47 countries"

5. **ABADÁ-Capoeira** (founded 1988)
   - Based in Rio de Janeiro
   - Blends Regional and Angola with modernization
   - "Around 70,000 members"
   - "Over 60 countries"

6. **Capoeira Brasil** (founded 1989)
   - Practices Contemporary Capoeira
   - Founded by three Mestres trained under Senzala
   - "Over 40 countries"

### Criteria for "Biggest"

**Metrics used**:
- Membership numbers (ABADÁ: 70k, Muzenza: 20k, Axé: 10k)
- Geographic spread (ABADÁ: 60+ countries, Muzenza: 47, Capoeira Brasil: 40+)
- Global prominence/fame (Senzala: "most famous")

### Lineage Information

**Historical connections documented**:
- Most trace to Bimba and/or Pastinha (legendary masters)
- Senzala → Capoeira Brasil (generational transmission)
- Emphasis on transmission of authentic traditions

### Data Model

**Narrative-only**:
```typescript
{
  name: string,
  foundingYear: number,
  founder: string,
  headquarters: string,
  membershipSize: string,      // "70,000 members" (free-text)
  geographicSpread: string,    // "60 countries" (free-text)
  style: string,               // Narrative description
  notableAchievements: string, // Events, performances, etc.
  lineage: string,             // Narrative description of connections
}
```

### Relevance for Quilombo

**Validation**:
- **Confirms our case study selection**: 4 out of 6 groups listed are from our case studies (CDO, Axé, Muzenza, ABADÁ)
- Membership size MATTERS to community (numerical scale is valued)
- Geographic spread is a key metric (countries reached)
- Lineage connections to legends (Bimba, Pastinha) are emphasized

**Additional groups to study**:
- **Senzala**: "Most famous" group we haven't studied yet
- **Capoeira Brasil**: Large Contemporary group (40+ countries)

**Differentiation**:
- Quilombo can provide EXACT membership counts (not estimates)
- Structured geographic data (not "60 countries" but actual locations)
- Verifiable lineage graphs vs. narrative claims

---

## Cross-Platform Data Model Comparison

### Lineage/Relationship Modeling

| Platform | Approach | Relationship Types | Temporal Data | Queryable |
|----------|----------|-------------------|---------------|-----------|
| **IPHAN** | None | ❌ 0 | ❌ No | ✅ Yes (by location, style, entity type) |
| **Portal Capoeira** | Free-text "Linhagem" field | ⚠️ 1 (unstructured) | ❌ No | ⚠️ Partial (keyword search) |
| **CapoeiraHub** | Graph with "learned from" | ✅ 1 (structured) | ❌ No | ✅ Yes (visual tree) |
| **Fandom Wiki** | Category inheritance | ⚠️ Implicit | ❌ No | ❌ No (alphabetical list) |
| **CapoeiraWiki** | Narrative only | ❌ 0 | ❌ No | ❌ No (articles only) |
| **Lalaue** | Narrative descriptions | ❌ 0 | ⚠️ Founding years | ❌ No (article) |
| **Onde Acho Capoeira** | None | ❌ 0 | ⚠️ Founding years | ⚠️ Partial (by ID, category) |
| **Quilombo (Planned)** | Structured graph | ✅ 7+ types | ✅ Yes | ✅ Yes |

### Organization/Group Data

| Platform | Groups Count | Entity Types | Hierarchies | Verification |
|----------|--------------|--------------|-------------|--------------|
| **IPHAN** | 1,446 | ✅ 6 types (confederation → group) | ❌ Not modeled | ⚠️ Official registry (unclear verification) |
| **Portal Capoeira** | 548 | ❌ Flat academias | ❌ Not modeled | ❌ Unknown |
| **CapoeiraHub** | ~30 | ❌ Flat groups | ❌ Disconnected from lineage | ❌ User-contributed |
| **Fandom Wiki** | 29 | ❌ Flat groups | ⚠️ Subcategories | ❌ Wiki (anyone can edit) |
| **CapoeiraWiki** | Unknown (dozens) | ❌ Flat organizations | ⚠️ Described in text | ❌ Wiki (anyone can edit) |
| **Lalaue** | 6 (curated) | ❌ N/A | ❌ Not modeled | ✅ Editorial curation |
| **Onde Acho Capoeira** | ~15 | ❌ Flat groups | ❌ Not modeled | ❌ Unknown |
| **Quilombo (Planned)** | Hundreds+ | ✅ Multiple types | ✅ Parent-child, affiliations | ✅ Verification badges |

### Geographic Coverage

| Platform | Geographic Scope | Discovery Method | Scale |
|----------|------------------|------------------|-------|
| **IPHAN** | Brazil + international | Filter by municipality/state/region | 1,446 |
| **Portal Capoeira** | Global | Radius search, location filter | 548 |
| **CapoeiraHub** | Global | Map visualization | ~30 |
| **Fandom Wiki** | Unclear | None (alphabetical list) | 29 |
| **CapoeiraWiki** | Global | None (articles mention locations) | Unknown |
| **Lalaue** | Global (editorial focus) | None (article) | 6 |
| **Onde Acho Capoeira** | Brazil-only | Category browsing, ID-based | ~15 |
| **Quilombo (Planned)** | Global | Map + filters | Hundreds+ |

---

## Key Insights Across Platforms

### 1. Scale Disparity is Enormous

**Range**: 6 groups (Lalaue) to 1,446 groups (IPHAN)

**Implications**:
- No platform has achieved comprehensive coverage + rich data model
- IPHAN has scale but lacks lineage/relationships
- CapoeiraHub has lineage tree but only 30 groups
- Portal Capoeira is middle ground (548 academias, "Linhagem" field)

**Opportunity for Quilombo**: Combine IPHAN's scale with CapoeiraHub's lineage modeling

### 2. Lineage Modeling is Universally Weak

**Approaches observed**:
1. **None** (IPHAN, CapoeiraWiki, Lalaue)
2. **Free-text field** (Portal Capoeira: "Linhagem")
3. **Category inheritance** (Fandom Wiki: "Filhos de Bimba")
4. **Single relationship type** (CapoeiraHub: "learned from")
5. **Narrative only** (CapoeiraWiki, Lalaue)

**No platform has**:
- Multiple relationship types (student_of, influenced_by, co_founded, family, etc.)
- Temporal data (when did training occur?)
- Integrated lineage + organizational hierarchies

**Opportunity for Quilombo**: First platform with comprehensive relationship modeling (7+ types, temporal data)

### 3. Official Recognition Exists (IPHAN)

**Brazilian government**:
- Treats Capoeira as **intangible cultural heritage**
- Maintains official registry (1,446 groups)
- No regulatory/licensing function (documentary only)
- Structured taxonomy (entity types, styles, geographic data)

**Implications**:
- Validates importance of systematic documentation
- Government sees cultural preservation value
- Official data source for import to Quilombo
- Potential partnership opportunity (IPHAN data → Quilombo)

### 4. Community Values Lineage Information

**Evidence**:
- Portal Capoeira explicitly captures "Linhagem" field (548 academias)
- CapoeiraHub built entire platform around lineage tree
- Lalaue article emphasizes connections to Bimba/Pastinha
- Fandom Wiki uses "Filhos de Bimba" as primary categorization

**User need confirmed**: People want to know "who taught whom" and trace traditions

### 5. Our Case Study Groups ARE the Biggest

**Validation from Lalaue**:
- 4 out of 6 "biggest groups worldwide" are from our case studies:
  - Cordão de Ouro ✅
  - Grupo Axé Capoeira ✅
  - Grupo Muzenza ✅
  - ABADÁ-Capoeira ✅
- Plus Ngoma (traditional Angola) as contrasting example ✅

**Additional major groups identified**:
- **Senzala** (1963): "Most famous" group, founded Capoeira Brasil lineage
- **Capoeira Brasil** (1989): Large Contemporary group (40+ countries)

**Our research is well-targeted**: Studying the actual major players + diverse examples

### 6. Geographic Discovery is Important

**Platforms with location features**:
- IPHAN: Filter by municipality/state/region
- Portal Capoeira: Radius search ("find academias within 10km")
- CapoeiraHub: Map visualization

**User need**: "Find Capoeira groups near me"

**Quilombo has this**: Geolocation data + map views already planned

### 7. Verification is Missing Everywhere

**No platform has robust verification**:
- IPHAN: Official registry but unclear verification process
- Portal Capoeira: User-submitted (quality unknown)
- CapoeiraHub: User-contributed (accuracy issues observed)
- Wikis: Anyone can edit (vandalism risk)
- Lalaue: Editorial curation (only 6 groups)

**Our Cordão de Ouro research showed**: Groups claiming unauthorized affiliation is a real problem

**Opportunity for Quilombo**: First platform with verification badges, admin approval, self-reported vs. verified distinction

### 8. Narrative + Structured Data Both Needed

**Platforms split into camps**:
- **Structured only**: IPHAN (dry data, no stories)
- **Narrative only**: CapoeiraWiki, Lalaue (rich context, not queryable)
- **Hybrid**: CapoeiraHub (biographies + structured lineage)

**Best approach**: Combine both
- Structured data enables queries ("all students of X")
- Narrative biographies tell stories (cultural preservation)
- Quilombo should do both

---

## Platform 6: Onde Acho Capoeira (Brazilian Classifieds Directory)

**URL**: https://www.ondeachocapoeira.com

### Overview

**Purpose**: Brazilian classifieds directory organizing capoeira culture infrastructure

**Scale**: **~15 documented groups** (small scale)

**Scope**: Groups, news, events, rodas, academias, calendars, shops - comprehensive capoeira ecosystem

### Data Model

**Group Fields Captured**:
```typescript
{
  // Identity
  id: number,                  // Unique identifier (e.g., "grupo?id=14")
  name: string,                // Group name

  // Leadership
  founder?: string,            // Founder/leader name
  co_leader?: string,          // Co-leader if applicable

  // Classification
  style?: 'Angola' | 'Regional' | 'Contemporânea',

  // Location
  city?: string,
  state?: string,
  country: 'Brazil',           // Brazil-only registry
  founded_year?: number,

  // Additional info (varies by entry)
  description?: string,
  contact?: {...},
}
```

**Content Categories**:
- **Notícias** (News): Capoeira news and announcements
- **Eventos** (Events): Workshops, batizados, encontros
- **Rodas**: Listings of regular rodas
- **Grupos**: Group profiles
- **Academias**: Individual school listings
- **Calendários**: Event calendars
- **Lojas**: Capoeira equipment/clothing shops

**Ranking Feature**:
- "Top 5 Groups" ranking system
- Criteria unclear (possibly user engagement, popularity)

**Lineage/Relationship Modeling**: ❌ **None detected**
- No explicit teacher-student relationships
- No organizational hierarchies
- Founder names captured as text (not linked entities)

### Approach

**Classifieds/Directory Model**:
- Content-rich ecosystem (not just groups)
- News, events, rodas, shops integrated
- Brazil-focused registry
- User-contributed listings
- Commercial aspect (shops, advertising potential)

### Strengths

1. **✅ Ecosystem approach**: Not just groups - news, events, rodas, shops
2. **✅ Brazil-focused**: Dedicated Brazilian capoeira infrastructure
3. **✅ Multiple content types**: Comprehensive beyond just group listings
4. **✅ Ranking feature**: "Top 5 Groups" adds engagement
5. **✅ Accessible URLs**: Direct group access via ID (e.g., grupo?id=14)

### Limitations

1. **❌ Very small scale**: Only ~15 groups (vs. 1,446 in IPHAN, 548 in Portal Capoeira)
2. **❌ No lineage**: No teacher-student relationships
3. **❌ No organizational structure**: Can't model headquarters/branches
4. **❌ Brazil-only**: No international coverage
5. **❌ Ranking criteria unclear**: "Top 5" based on unknown metrics
6. **❌ No verification system**: Quality control unknown
7. **❌ Limited data per group**: Minimal structured information

### Relevance for Quilombo

**Model Validation**:
- Confirms ecosystem approach has value (news + events + groups integrated)
- Ranking/comparison features engage users
- Commercial integration (shops) shows monetization potential

**Data Source Potential**:
- Too small for bulk import (only ~15 groups)
- Overlap with IPHAN likely (Brazil-only)
- May contain some Brazil-only groups not in other registries

**Differentiation**:
- Quilombo's international scope vs. Brazil-only
- Quilombo's structured lineage vs. none
- Quilombo's scale (hundreds+) vs. ~15 groups
- Quilombo's verification system vs. unclear quality control

**Lessons**:
- Ecosystem integration valuable (events, news alongside groups)
- Ranking/comparison features drive engagement
- Brazil-focused registries exist but are small-scale

---

## Data Sources for Quilombo Import

### High-Priority Import Candidates

**1. IPHAN Brazil Registry** (1,446 groups)
- **Pros**: Largest scale, official data, structured entity types, geographic data
- **Cons**: No lineage, Brazil-centric, no mestre profiles
- **Import strategy**: Bulk import as baseline group dataset
- **Fields to map**: entity type → `group_types`, style → `style`, location → `geolocation`

**2. Portal Capoeira** (548 academias)
- **Pros**: "Linhagem" field captures lineage, contact info, geographic data
- **Cons**: Unstructured lineage (free-text), verification unclear
- **Import strategy**: Parse "Linhagem" field to extract mestre names, geocode locations
- **Fields to map**: responsavel → initial founder/leader, linhagem → relationship seeds

### Lower-Priority Sources

**3. CapoeiraHub** (hundreds of mestres, 30 groups)
- **Pros**: Structured lineage graph, biographical data, birth/death dates
- **Cons**: Only 30 groups, incomplete, ethical concerns about scraping
- **Import strategy**: Reach out for partnership/data sharing (don't scrape)
- **Fields to map**: learned_from → student_of relationships, biographies

**4. Wikis** (Fandom, CapoeiraWiki)
- **Pros**: Rich narrative context, historical documentation
- **Cons**: Unstructured, small scale, narrative-only
- **Import strategy**: Manual curation for historical mestres (Bimba, Pastinha, etc.)
- **Use case**: Seed data for managed profiles (deceased legends)

---

## Competitive Positioning: Quilombo's Unique Value

### What Quilombo Will Offer That NOBODY Else Has

**1. Comprehensive Lineage + Organizational Integration**
- ✅ 7+ relationship types (student_of, influenced_by, co_founded, family, trained_alongside, supervises, autonomous_continuation)
- ✅ Temporal data (when/how long)
- ✅ Group hierarchies integrated with lineage (founder → group → branches)
- ✅ Visual lineage tree + organizational charts

**2. Scale + Rich Data Model**
- ✅ Import 1,446+ groups (IPHAN baseline) + Portal Capoeira + more
- ✅ Structured relationships (not free-text "Linhagem")
- ✅ Both mestre profiles AND group networks
- ✅ Narrative biographies + queryable database

**3. Verification System**
- ✅ Verified vs. self-reported badges
- ✅ Parent organization approval workflows
- ✅ Community moderation
- ✅ Solves "unauthorized affiliation" problem (CDO case)

**4. Web3/DAO Features**
- ✅ DAO governance for community decisions
- ✅ NFT certificates (future: like CDO's Certificado de Alvará but on-chain)
- ✅ Token-based incentives for data contribution
- ✅ Decentralized trust (no single authority)

**5. Complete Integration**
- ✅ Groups ↔ Mestres ↔ Events ↔ DAO Governance
- ✅ Navigate from lineage tree → group → locations → events
- ✅ No silos (unlike CapoeiraHub where groups disconnected from lineage)

**6. Cultural Heritage + Modern Tech**
- ✅ Respects tradition (like IPHAN's cultural preservation)
- ✅ Modern UX (interactive maps, visual trees, mobile-first)
- ✅ Multilingual (PT, EN, ES, FR - broader than most)
- ✅ Community ownership (DAO) not corporate control

### What Quilombo Can Learn From Competitors

**From IPHAN**:
- ✅ Entity type taxonomy (confederation → federation → league → association → school → group)
- ✅ Cultural designation system (ponto de cultura, ponto de memória)
- ✅ Official recognition matters (not just user-generated)

**From Portal Capoeira**:
- ✅ "Linhagem" field proves lineage is valued
- ✅ Radius search for geographic discovery
- ✅ Popularity metrics (view counts) engage community

**From CapoeiraHub**:
- ✅ Visual lineage tree is engaging and intuitive
- ✅ Biographical narratives alongside structured data
- ✅ User-contribution model works if managed properly

**From Wikis**:
- ✅ Narrative context and definitions matter
- ✅ Photo galleries for cultural documentation
- ✅ Community authorship (but need moderation)

**From Lalaue**:
- ✅ Membership size and geographic spread are important metrics
- ✅ Ranking/comparison features (biggest, oldest, etc.)
- ✅ Historical connections to legends (Bimba, Pastinha) are emphasized

---

## Recommendations for Quilombo Development

### Phase 1: Foundation (MVP)

**Import Base Data**:
1. Import IPHAN's 1,446 groups as baseline
2. Parse Portal Capoeira's "Linhagem" field to seed relationships
3. Manually curate top 20 mestre profiles (Bimba, Pastinha, Camisa, etc.)

**Implement Core Features**:
1. Group directory with map visualization (like Portal Capoeira + CapoeiraHub)
2. Basic lineage tree with "student_of" relationship (like CapoeiraHub)
3. Mestre profiles with biographies (like CapoeiraHub)
4. Entity type taxonomy (from IPHAN)

### Phase 2: Rich Relationships

**Expand Lineage Model**:
1. Add 6 additional relationship types (influenced_by, co_founded, family, etc.)
2. Add temporal data (startedAt, endedAt)
3. Distinguish primary teacher vs. influences
4. Style transitions over time (Marrom: Regional → Angola)

**Integrate Groups + Lineage**:
1. Link groups to founders via group_roles table
2. Show organizational hierarchies (sede → filiais)
3. Model affiliations (certified, independent, autonomous)
4. Navigate bidirectionally (person → groups, group → lineage)

### Phase 3: Verification + Community

**Verification System**:
1. Verified badges for confirmed data
2. Parent organization approval workflows
3. Self-reported vs. verified distinction
4. Community moderation tools

**User Contributions**:
1. Allow users to submit new profiles (pending approval)
2. Claim managed profiles (merge accounts)
3. Suggest corrections/additions
4. Rate/review groups

### Phase 4: Web3 + Advanced Features

**DAO Governance**:
1. Community votes on data disputes
2. Token incentives for quality contributions
3. NFT certificates for official affiliations
4. Decentralized trust mechanisms

**Advanced Discovery**:
1. "Find my lineage" tool (trace your path to Bimba/Pastinha)
2. "Degrees of separation" (like LinkedIn)
3. Recommendation engine ("groups like this one")
4. Historical timelines (group evolution over decades)

---

## Conclusion

**The landscape is fragmented**:
- IPHAN has scale (1,446 groups) but no lineage
- Portal Capoeira has lineage field (548 academias) but unstructured
- CapoeiraHub has structured lineage tree but only 30 groups
- Wikis have narrative context but no queryable data

**Nobody has combined**:
- Comprehensive scale (1,000+ groups)
- Rich relationship model (7+ types, temporal data)
- Integrated groups + lineage
- Verification system
- Modern UX (visual trees, interactive maps)
- Web3/DAO features

**Quilombo can be the first platform to deliver all of this**.

The research validates the need (6 platforms attempting this), confirms our case study selection (4/6 biggest groups), and reveals the gaps we can fill.

**Next steps**:
1. Reach out to IPHAN for official data partnership
2. Parse Portal Capoeira "Linhagem" field for relationship seeds
3. Consider CapoeiraHub collaboration (don't compete, complement)
4. Begin implementing Phase 1 MVP with imported baseline data

**Key insight**: This is not a "nice to have" feature. Multiple platforms, including the Brazilian government, recognize this as important cultural heritage work. Quilombo can be the definitive platform by combining the best of all approaches.

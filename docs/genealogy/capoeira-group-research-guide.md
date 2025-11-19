# Capoeira Group Research Guide: Systematic Case Study Methodology

**Purpose**: This guide provides a systematic approach to researching Capoeira groups for case study documentation, ER modeling, and genealogy tree population.

**Last Updated**: 2025-11-19
**Version**: 1.1

**Recent Updates**:
- Added Phase 1.3: Name Disambiguation Check (multiple groups may share same name)
- Added Phase 3.4: Co-Founder Separation Investigation
- Added Phase 5.4: JavaScript-Heavy Websites handling
- Added section in Phase 3.1: Handling Conflicting Dates
- Added Common Pitfalls #11-14 based on Filhos de Angola case study

---

## Research Objectives

When researching a Capoeira group, we aim to discover:

1. **Founding & History**: Who, when, where, why, and how the group was established
2. **Lineage & Relationships**: Teacher-student chains, influences, family connections
3. **Organizational Structure**: How the group is organized, governed, and expands
4. **Geographic Presence**: All locations, leaders, and how they relate to headquarters
5. **Cultural Characteristics**: Philosophy, style, social mission, unique practices
6. **Data Model Patterns**: Relationship types, hierarchy models, organizational patterns that inform our schema

---

## Phase 1: Initial Discovery

### 1.1 Basic Web Searches (Parallel Execution)

Execute these searches simultaneously to gather initial information:

```
Search 1: "[Group Name] capoeira founder history"
Search 2: "[Group Name] locations international branches"
Search 3: "[Group Name] organizational structure"
Search 4: "[Founder Name] lineage [Style]" (if founder known)
Search 5: "[Group Name] Instagram Facebook social media"
```

**What to look for**:
- Official websites (if they exist)
- News articles, blog posts about the group
- Academic papers (if the group is notable)
- Social media accounts
- Directory listings (Lalaue, CapoeiraHub, etc.)

### 1.2 Identify Primary Sources

From search results, identify:

**Official sources** (highest priority):
- Official website (gruppo-name.com, gruppo-name.org, etc.)
- Official Instagram/Facebook (usually @groupname or @groupnameofficial)
- Founder's personal social media

**Semi-official sources**:
- Location-specific websites (groupname-city.com)
- Student-run pages
- Affiliated organization sites

**Third-party sources**:
- CapoeiraWiki (capoeirawiki.org)
- **CapoeiraHistory.com** - comprehensive overview site with group info, mestre biographies
- Lalaue.com directory
- News articles
- Academic papers

**Competitive/reference sources**:
- CapoeiraHub.net (if group is listed)
- Portal Capoeira (portalcapoeira.com) directory
- IPHAN registry (if Brazilian)

### 1.3 Name Disambiguation Check

**IMPORTANT**: Multiple groups may share the same name (e.g., "Filhos de Angola" - two different groups exist).

**Disambiguation searches**:
```
"[Group Name] founded [year range]"
"[Group Name] [City 1]" vs "[Group Name] [City 2]"
"[Group Name] Mestre [Founder A]" vs "[Group Name] Mestre [Founder B]"
```

**What to verify**:
- Founding year (are there multiple groups with different founding dates?)
- Founding location (Rio vs Salvador, etc.)
- Primary founder name (different mestres with same group name?)

**If multiple groups found**:
1. Document ALL groups found with disambiguation details
2. Clarify which group is the focus of this case study
3. Include disclaimer noting other group(s) exist with same name
4. Use full name + founding year + location for clarity

**Disambiguation format**:
```
Group A: "Filhos de Angola - GCFA Salvador (1984, Mestre Laércio/Roberval)"
Group B: "Filhos de Angola - Rio de Janeiro (1960, Mestre Roque)"
```

---

## Phase 2: Founder & Lineage Research

### 2.1 Founder Biography

**Data to capture**:
```typescript
founder: {
  full_name: string,
  known_as: string,              // "Mestre [Apelido]"
  apelido: string,               // Nickname/capoeira name
  birth_date: Date,              // Or approximate decade
  birth_location: string,        // City, State/Region, Country
  current_location: string,
  moved_timeline: string[],      // ["Bahia (1960s)", "Rio (1970s)", etc.]
}
```

**Search patterns**:
```
"[Founder Full Name] capoeira"
"Mestre [Apelido] biography"
"Mestre [Apelido] born [location]"
"[Founder Name] early life training"
```

### 2.2 Training Lineage

**Critical to identify**:

**Primary teacher(s)**:
- Who was the main mestre?
- Where and when did training occur?
- What rank was achieved?
- What style was learned?

**Secondary influences**:
- Other mestres who influenced the founder
- Distinguish between primary teacher and influences
- Workshops, guest instructors, observational learning

**Style transitions** (if applicable):
- Did founder switch styles during lifetime?
- When and why did transition occur?
- Who were teachers in each style period?

**Lineage chain to trace**:
```
Legendary Figure (Pastinha, Bimba, etc.)
  ↓
Second Generation Mestre
  ↓
Third Generation Mestre
  ↓
Founder of Group Being Studied
  ↓
Current Generation Students
```

**Data structure**:
```typescript
lineage_chain: {
  regional_period?: {
    primary_teacher: PersonId,
    influences: PersonId[],
    started_at: string,
    ended_at: string | null,
    rank_achieved: string,
    location: string
  },
  angola_period?: {
    // Same structure
  },
  contemporanea_period?: {
    // Same structure
  }
}
```

### 2.3 Family Relationships

**Look for**:
- Brothers co-founding (ABADÁ: Camisa + Camisa Roxa, Muzenza: Paulão + brother Mintirinha)
- Father-son succession (Axé: Barrão → Barrãozinho)
- Siblings in organization
- Married couples teaching together
- Family dynasties

**Search patterns**:
```
"Mestre [Name] brother sister family"
"[Group Name] family succession"
"Mestre [Name] son daughter"
```

### 2.4 Academic Credentials & Research

**IMPORTANT**: Track academic credentials related to capoeira as they provide legitimacy and scholarly contributions.

**What to look for**:
- **Physical Education degrees** focusing on capoeira
- **Cultural Studies / Anthropology** research on capoeira
- **Sociology** research on capoeira communities
- **International Relations** focused on capoeira globalization
- **Music / Ethnomusicology** on capoeira music traditions
- **Publications**: Books, articles, theses about capoeira
- **University affiliations**: Teaching positions, guest lectureships
- **Film/Media work**: Choreography, consulting, documentary participation

**Search patterns**:
```
"Mestre [Name] university degree"
"[Founder Name] PhD thesis capoeira"
"[Founder Name] book publication"
"Mestre [Name] professor university"
"[Founder Name] M.A. masters capoeira"
"[Founder Name] physical education"
"[Founder Name] research anthropology sociology"
"[Founder Name] choreographer film"
```

**Data to capture**:
```typescript
academic_credentials: {
  person_id: uuid,
  degree_level: 'bachelors' | 'masters' | 'phd' | 'postdoc',
  field_of_study: string,
  institution: string,
  graduation_year: number,
  thesis_title?: string,
  thesis_focus_capoeira: boolean,

  publications?: [{
    type: 'book' | 'article' | 'thesis' | 'chapter',
    title: string,
    year: number,
    publisher?: string,
    url?: string
  }],

  teaching_positions?: [{
    institution: string,
    role: string,                        // "Guest lecturer", "Professor", etc.
    years: string,
    courses_taught?: string[]
  }],

  film_media_work?: [{
    type: 'film_choreography' | 'documentary' | 'consultant',
    title: string,
    year: number,
    role: string
  }]
}
```

**Examples from case studies**:
- **Mestre Sucuri** (Capoeira Zoador): M.A. in International Relations, Waseda University (2012), thesis on "Globalization of Afro-Brazilian Popular Culture in Japan"; 2 published books
- **Mestre Amen** (Capoeira Batuque Japão): Film choreographer for "Only the Strong" (1993), "Kickboxer IV"

**Why this matters**:
- Academic credentials add legitimacy to teaching
- Research contributes to capoeira scholarship
- Books/publications preserve knowledge for future generations
- Film work brings mainstream cultural awareness
- University positions facilitate institutional partnerships

---

## Phase 3: Group Evolution & History

### 3.1 Founding Context

**Data to capture**:
```typescript
founding: {
  date: Date | string,           // "1982" or "early 1990s"
  location: string,              // City, State, Country
  context: string,               // Why was it founded?
  founding_type: 'original' | 'split' | 'blessed_split' | 'successor_continuation',

  // If split from another group
  parent_group?: string,
  split_reason?: string,         // "ideological differences", "geographic", etc.
  is_amicable?: boolean,
  blessed_by?: string[],         // Padrinhos who approved (if blessed split)
}
```

**Questions to answer**:
- Was this an original founding or split from another group?
- If split: Why? Amicable or hostile? Blessed by elders?
- What was the original motivation/mission?
- What problem was being solved or need being filled?

**Search patterns**:
```
"[Group Name] founded [year]"
"[Group Name] history"
"[Founder Name] left [Previous Group]"
"[Founder Name] split from [Group]"
"padrinho [Founder Name]" (for blessed splits)
```

**IMPORTANT: Handling Conflicting Dates**

When sources provide conflicting dates (e.g., "founded 1987" vs "founded 1991"):
1. **Do NOT arbitrarily pick one** - this loses information
2. **Document ALL dates found** with sources
3. **Flag for community verification**
4. **Use primary date** (most commonly cited or most authoritative source) + document conflicts

```typescript
founding: {
  date_primary: Date,              // Most reliable/common
  date_conflicts: Date[],          // Other dates found
  sources: {
    primary: string,               // Source for primary date
    conflicting: string[]          // Sources for conflicting dates
  },
  needs_verification: boolean      // Flag for community review
}

// Example:
date_primary: "1991"
date_conflicts: ["1987"]
sources: {
  primary: "ABCA official website, multiple group sites",
  conflicting: ["One blog post from 2010"]
}
needs_verification: true
```

### 3.2 Name Evolution

**Track all name changes**:
```typescript
name_history: [{
  name: string,
  started_at: string,
  ended_at: string | null,
  name_type: 'primary' | 'alternate' | 'old',
  change_reason?: 'political_statement' | 'rebranding' | 'founder_change' | 'geographic' | 'other',
  change_context?: string
}]
```

**Examples from case studies**:
- Ngoma: "Marrom e Alunos" (1990-2018) → "Ngoma" (2018-present, political statement)
- Ngoma Scotland: "Mão No Chão" → "Ngoma Scotland"
- Finland: "Mestre Marrom e Alunos" → "Tambor Vivo" / "Ngoma"

**Search for**:
- Old names in social media handles
- "Previously known as..."
- "Renamed to..."
- "Formerly called..."

### 3.3 Key Milestones

**Capture significant events**:
- Founding date
- First international location
- Leadership changes
- Name changes
- Major organizational restructuring
- Opening of headquarters/cultural centers
- Splits or new groups forming from this one
- Recognition/awards

### 3.4 Co-Founder Separation Investigation

**CRITICAL**: When multiple co-founders are identified, investigate whether they stayed together or separated.

**Why this matters**:
- Co-founders may continue under same group name but independently (different organizations)
- Co-founders may stay within network but lead different regions
- One co-founder may become primary coordinator while others diverge
- This affects organizational model classification and relationship mapping

**Examples from case studies**:
- **GCFA (Filhos de Angola)**: 4 co-founders → separated
  - Mestre Laércio: coordinates GCFA international network
  - Mestre Roberval: coordinates GCFA Sverige (within network)
  - Mestre Rosalvo: founded Academia Jangada (independent)
  - Mestre Cabore: unknown

- **Senzala**: "The 12 initial members went in different directions and new mestres were graded"

**Search patterns**:
```
"[Founder Name A] [Group Name]" (search for each co-founder individually)
"founding masters separated"
"co-founders went different directions"
"[Founder A] and [Founder B] split"
"[Founder Name] continues [Group Name]"
```

**Data to capture**:
```typescript
co_founder_separation: {
  occurred: boolean,
  separation_date?: Date | string,        // Approximate if known
  separation_type: 'amicable' | 'conflict' | 'unknown',

  co_founders_paths: [{
    founder_id: uuid,
    continuation_type: 'coordinates_network' | 'within_network' | 'independent' | 'unknown',
    new_organization?: string,            // If founded separate org
    current_location?: string,
    relationship_to_original: string      // Describe relationship
  }]
}
```

**Questions to answer**:
1. Do all co-founders still work together? Or separated?
2. If separated, when approximately did this happen?
3. Did they remain friendly/amicable or was there conflict?
4. Does each co-founder continue using the group name, or did some create new organizations?
5. If still using group name, are they coordinated or fully independent?

---

## Phase 4: Organizational Structure

### 4.1 Leadership Model

**Identify the pattern**:

```typescript
leadership_model:
  | 'single_founder'              // One mestre leads everything
  | 'co_founders'                 // 2-3 equal founders (Camisa + Roxa, CB's 3 founders)
  | 'collaborative_red_belts'     // Multiple co-equal leaders (Senzala)
  | 'co_leadership'               // Founder + co-founder with different roles (Ngoma: Marrom + Tatiana)
  | 'succession'                  // Founder → successor (Muzenza: Paulão → Burguês)
  | 'family_succession'           // Father → son (Axé: Barrão → Barrãozinho)
```

**Current leadership**:
- Who leads the overall organization?
- Is leadership shared or singular?
- What are roles/responsibilities of each leader?
- How are decisions made?

**Succession planning**:
- Is there an appointed successor?
- Family member being groomed?
- Collaborative leadership with no single successor?

### 4.2 Organizational Model Type

**Critical classification** - determines how locations relate to headquarters:

```typescript
organizational_model:
  | 'autonomous_continuation'     // Ngoma: students independent, voluntary connection
  | 'nucleus_network'             // Angoleiros: semi-autonomous núcleos with central tie
  | 'certified_affiliates'        // CDO: trademark license, fees, approval required
  | 'registered_network'          // Muzenza: registered instructors, central registry
  | 'branch_hierarchy'            // Axé, CB: hierarchical arms → branches
  | 'decentralized_legal'         // ABADÁ: independent legal entities, shared brand
  | 'blessed_split'               // CB from Senzala: formalized departure with approval
  | 'franchise'                   // Commercial franchise model (if exists)
```

**How to identify**:
1. **Autonomous continuation**: Students establish own groups, maintain name voluntarily, no fees/licensing
2. **Nucleus network**: Formal núcleo structure, regular gatherings, semi-autonomous but connected
3. **Certified affiliates**: Trademark, licensing fees, approval processes, contractual
4. **Registered network**: Central registry of instructors, formal registration
5. **Branch hierarchy**: Clear organizational chart with arms/divisions/branches
6. **Decentralized legal**: Each location is separate legal entity sharing brand only

**Questions to answer**:
- Do new locations need approval from headquarters?
- Are there fees or dues paid to central organization?
- Is there a trademark or licensing system?
- Are locations legally connected or just culturally?
- How much autonomy do local leaders have?

### 4.3 Hierarchical Structure

**Document the chain of command**:

```
Headquarters (Rio)
├─ Regional Arm (Mestre X's division)
│   ├─ Local Branch (City A, led by Professor Y)
│   └─ Local Branch (City B, led by Professor Z)
└─ Regional Arm (Mestre W's division)
    └─ Local Branch (City C, led by Instrutor V)
```

**Or nucleus model**:
```
Headquarters (Feira de Santana, Mestre Cláudio)
├─ Núcleo Berlin (Treinel Tito)
├─ Núcleo Paris (Contra-Mestre Stéph)
├─ Núcleo Helsinki (Contra-Mestre Bom Cabelo)
└─ [20+ other núcleos...]
```

**Or autonomous model**:
```
Mestre Marrom (Rio)
  → CM Stéph (Paris, autonomous)
  → CM Bom Cabelo (Helsinki, autonomous)
  → Treinel Xaxado (Berlin, autonomous)
  → CM Dion Dragas (Scotland, autonomous)
  [No formal hierarchy, personal loyalty]
```

### 4.4 Legal Structure (If Determinable)

```typescript
legal_structure:
  | 'for_profit_corporation'
  | 'non_profit_501c3'           // USA tax-exempt (CB Los Angeles)
  | 'non_profit_association'      // European e.V., association
  | 'registered_trademark'        // CDO has trademarked name
  | 'informal_network'           // No legal entity
  | 'mixed'                      // Different structures in different countries
```

**Look for**:
- "501(c)(3)" in USA materials
- "e.V." (eingetragener Verein) in Germany
- "Association Loi 1901" in France
- Trademark symbols (®, ™)
- Business registration information
- Tax ID numbers mentioned

---

## Phase 5: Geographic Presence & Locations

### 5.1 Systematic Location Discovery

**Search patterns** (execute in parallel):
```
Search 1: "[Group Name] [City]" (for each major city: Berlin, Paris, New York, São Paulo, London, etc.)
Search 2: "[Group Name] locations map"
Search 3: "[Group Name] academias schools"
Search 4: "[Group Name] international"
Search 5: "site:[groupname.domain] locations"
```

**Social media search**:
```
Instagram: Search hashtags #GroupName, #GroupNameCity
Facebook: Search "Group Name [City]"
Look for: @groupname_berlin, @groupname_paris, etc.
```

### 5.2 Data to Capture Per Location

```typescript
location: {
  city: string,
  country: string,
  region?: string,               // State, province, etc.

  // Leadership
  leader_name: string,           // "Treinel Xaxado"
  leader_rank: string,           // Treinel, Professor, Contra-Mestre, etc.
  leader_background?: string,    // "Trained 10 years in Rio with Mestre X"

  // Operational details
  established_date?: Date | string,
  venue?: string,                // "Mehrgenerationenhaus Gneisenaustraße 12"
  schedule?: string,             // "Thursdays 18:00-20:00"
  fee_structure?: string,        // "Donation basis", "€50/month", etc.

  // Contact
  website?: string,
  email?: string,
  phone?: string,
  instagram?: string,
  facebook?: string,

  // Relationship to parent
  relationship_type: 'headquarters' | 'nucleus' | 'branch' | 'affiliate' | 'autonomous' | 'franchise',
  organizer_id?: string,         // Who established this location

  // Metadata
  still_active: boolean,
  last_verified_date: Date,
  data_source: string[]          // URLs where info was found
}
```

### 5.3 Special Location Types

**Headquarters**:
- Clearly identify the main/original location
- Often where founder lives/teaches
- May have special name (Casa Ngoma, Casa Mãe, Sede, etc.)

**Cultural Centers**:
- Some groups have dedicated cultural spaces beyond training
- Casa Ngoma (Rio), Benção Brasil (Los Angeles CB)
- Often have social programs, events, community functions

**Historical Locations**:
- Where group was founded (may no longer be active there)
- Important historical sites
- First international location

### 5.4 JavaScript-Heavy Websites

**Problem**: Modern websites using client-side rendering (React, Vue, Angular, etc.) may not be accessible via WebFetch.

**Symptoms**:
- WebFetch returns only HTML/CSS/JavaScript framework code
- No actual content (text, names, locations) in the response
- Looks like empty page template or loading placeholder

**Examples encountered**:
- filhosdeangola.eu (Berlin) - JavaScript-rendered, couldn't extract content

**Solutions**:
1. **Don't waste time** trying to extract from JS-heavy sites
2. **Use alternative sources**:
   - Social media accounts (Instagram, Facebook often have same info)
   - Affiliated núcleos' websites (other locations may have static sites)
   - Cached versions (Google Cache, Wayback Machine)
   - Location-specific sites (city branches often have simpler sites)
   - Third-party directories (Lalaue, CapoeiraHub)
3. **Note the limitation** in case study
4. **Try WebSearch** for specific information instead of WebFetch

**Workaround pattern**:
```
Instead of: WebFetch("https://js-heavy-site.com")
Try: WebSearch("[Group Name] [City] location contact")
```

### 5.5 Multiple Locations in Same City

**IMPORTANT**: Don't assume one group = one location per city. **Multiple locations of the same group may exist in the same city** under different instructors.

**Why this matters**:
- Same group, multiple instructors teaching independently in same city
- Different fee structures, venues, branding
- Students may have cross-visitation rights
- Affects location count and organizational structure understanding

**Search patterns**:
```
"[Group Name] [City]" (may return multiple locations)
"[Instructor A Name] [Group Name] [City]"
"[Instructor B Name] [Group Name] [City]"
"[Group Name] [City] location" (check for plural: "locations")
```

**Example from case studies**:
- **Ngoma Capoeira Angola in Berlin** has TWO locations:
  1. **Gneisenaustraße** (Treinel Xaxado + CM Mel) - donation basis
  2. **Forum Brasil** (Mestre Forró) - €35-47/month
  - Both instructors graduated under Mestre Marrom
  - Students encouraged to visit both without extra payment
  - Different branding ("Ngoma Berlin" vs. "Forum Brasil")

**Data structure consideration**:
```typescript
same_city_multi_location: {
  city: string,
  group_id: uuid,
  locations: [{
    location_id: uuid,
    instructor_ids: uuid[],
    venue: string,
    fee_structure: string,
    branding: string,
    established_year?: number
  }],

  cross_visitation_allowed: boolean,
  extra_payment_required: boolean,
  organizational_relationship: 'independent' | 'coordinated' | 'hierarchical',

  notes: string  // Explain the relationship between locations
}
```

**Investigation steps**:
1. When you find a location, search for the instructor's name + city
2. Search for other known instructors from same group in that city
3. Check if group website lists multiple addresses in same city
4. Look for social media accounts with city-specific handles (@groupname_city vs @groupname_city_location2)
5. Investigate if locations have different names/branding but same lineage connection

**Questions to answer**:
- Are the locations coordinated or fully independent?
- Do students pay separately or have mutual access?
- Do locations share branding or have distinct identities?
- Are all locations official or is one primary and others affiliated?

**Don't miss this**: If you find one instructor in a city, **actively search for other instructors** from the same group in that city before concluding location research.

---

## Phase 6: Social Media & Digital Presence

### 6.1 Social Media Discovery

**Systematic search for each platform**:

**Instagram**:
```
@[groupname]
@[groupname]oficial
@[groupname]official
@[groupname]_[city]
@[groupname][city]
@capoeira[groupname]
```

**Facebook**:
```
"[Group Name]"
"[Group Name] Official"
"[Group Name] [City]"
"Grupo Capoeira [Name]"
```

**YouTube**:
- Often has videos showing rodas, events, training
- Can reveal locations not documented elsewhere
- Shows teaching style, philosophy

**TikTok** (increasingly common):
- Younger groups may have presence
- Shows contemporary engagement

### 6.2 Data to Capture

```typescript
social_media_account: {
  platform: 'instagram' | 'facebook' | 'youtube' | 'tiktok' | 'twitter',
  handle: string,
  url: string,
  follower_count?: number,
  is_official: boolean,
  is_location_specific: boolean,
  location_id?: string,          // If location-specific
  uses_old_name: boolean,        // E.g., London still "MarromCapoeiraAlunos"
  language: string,
  last_post_date?: Date,
  active: boolean,
  verified: boolean,             // Blue checkmark
  data_found: string[]           // What useful info was in profile/posts
}
```

### 6.3 Patterns to Observe

**Centralized vs. Decentralized**:
- **Centralized**: One official account for entire organization
- **Decentralized**: Each location has own account (Ngoma, Angoleiros)
- **Hybrid**: Official account + location accounts

**Naming patterns**:
- Consistent naming (@groupname_city) vs. varied
- Old names persisting in some accounts
- Official vs. unofficial accounts

**Activity levels**:
- Regularly updated or dormant?
- Type of content (events, training videos, philosophy, social issues)
- Engagement levels (likes, comments, shares)

---

## Phase 7: Students & Next Generation

### 7.1 Key Students to Identify

**High-priority students**:
- Contra-Mestres (likely to lead locations)
- Professores leading locations
- Family members of founder
- Long-term students (10+ years)
- Students who established new locations
- Students who have gone on to found their own groups

**Search patterns**:
```
"Contra-Mestre [Name] [Group Name]"
"[Founder Name] students"
"[Group Name] instructors"
"Professor [Name] [City]"
```

### 7.2 Data to Capture

```typescript
student: {
  name: string,
  rank: string,
  location: string,              // Where they teach
  background: string,            // How long trained with founder, where

  relationship_to_founder:
    | 'student_of'
    | 'long_term_student'        // 10+ years
    | 'family_member'
    | 'co_founder'               // If they were there from start
    | 'successor',               // Appointed successor

  leadership_role?: {
    location: string,
    role: string,                // "Leads Berlin nucleus", "Director of X", etc.
    since: Date | string
  },

  established_locations?: string[],  // Locations they founded

  notable_for?: string,          // "Women's leadership", "Social programs", etc.
}
```

### 7.3 Generational Tracking

**Identify generations**:
```
Generation 1: Legendary founders (Pastinha, Bimba)
Generation 2: Their direct students (Senzala founders, Gato Preto, etc.)
Generation 3: Students of Gen 2 (Marrom, Camisa, Boneco, etc.)
Generation 4: Current group founders
Generation 5: Current students/leaders
```

**Look for**:
- How many generations from legendary figures?
- Are there multi-generational families in the group?
- Is next generation being trained to lead?

---

## Phase 8: Cultural Characteristics & Philosophy

### 8.1 Style Classification

**Primary style** (based on IPHAN categories + additional classifications):
```typescript
style:
  | 'angola'           // Traditional Capoeira Angola
  | 'regional'         // Mestre Bimba's Regional style
  | 'contemporanea'    // Contemporary/modern capoeira
  | 'capoeira'         // Generic capoeira (style unspecified/unclassified)
  | 'capoeira_de_rua'  // Street capoeira
  | 'mixed'            // Groups teaching multiple distinct styles
  | 'other'            // Other styles not fitting above categories

style_details?: {
  angola?: {
    traditional: boolean,
    lineage_emphasis: boolean,
    particular_influences: string[]
  },
  regional?: {
    bimba_method: boolean,
    competitive: boolean,
    systematized: boolean
  },
  contemporanea?: {
    blends: string[],            // What elements are blended
    modern_innovations: string[]
  },
  capoeira?: {
    reason_unspecified: string   // Why style not classified (e.g., "pre-dates Angola/Regional split")
  },
  capoeira_de_rua?: {
    context: string,             // Urban/street context characteristics
    formalization_level: 'informal' | 'semi_formal' | 'formal'
  },
  mixed?: {
    teaches_both: boolean,       // Like Muzenza teaching Angola + Regional
    style_by_class: boolean      // Separate classes for each style
  },
  other?: {
    description: string,         // Describe the unique style
    influences: string[]         // What traditions/styles influence it
  }
}
```

**Style transitions**:
- Does group teach only one style or multiple?
- Has style evolved over time?
- Do students learn one style or both?

### 8.2 Philosophy & Values

**Look for explicitly stated**:
```typescript
philosophy: {
  mission_statement?: string,
  core_values?: string[],
  social_mission?: string,

  emphasis: {
    cultural_preservation: boolean,
    social_justice: boolean,
    community_service: boolean,
    competitive_success: boolean,
    traditional_transmission: boolean,
    innovation: boolean,
    commercialization: boolean,
    accessibility: boolean
  },

  political_dimension?: {
    has_political_stance: boolean,
    focus: string[],             // "Anti-racism", "African roots", "Social justice", etc.
    statements_made: string[]    // Name changes, public positions, etc.
  }
}
```

**Search for**:
- Mission statements on websites
- About pages
- Founder interviews
- Social media posts about values
- Actions taken (scholarship programs, community work, political statements)

### 8.3 Unique Practices

**Cultural integration**:
- Samba Rural (Angoleiros do Sertão)
- Maculelê, Puxada de Rede, Samba de Roda
- Other Afro-Brazilian practices
- Music emphasis (instrument making, singing requirements)

**Training philosophy**:
- Strict discipline vs. creative freedom
- Balance of structure and spontaneity (Senzala)
- Musical excellence requirements (Angoleiros)
- Open rodas vs. closed training

**Community practices**:
- Public rodas (Angoleiros: Saturday mornings on avenue)
- Favela-based community integration (Ngoma)
- Donation-based classes
- Scholarship programs
- Social projects (Casa Ngoma youth programs)
- Afro-feminist collectives (Filhas de Dandara)

### 8.4 Women's Leadership

**Explicitly track**:
- Female co-founders (Contra-Mestra Tatiana in Ngoma)
- Female contra-mestres and mestres
- Women's leadership programs
- Feminist collectives or initiatives
- Gender balance in leadership

**This is significant** because Capoeira has historically been male-dominated. Groups explicitly promoting women's leadership represent important cultural shift.

---

## Phase 9: Data Model Pattern Identification

### 9.1 Relationship Types Present

**As you research, identify which relationship types exist**:

```typescript
// Person-to-Person Relationships
student_of              // Direct teacher-student
trained_under           // More casual than student_of
influenced_by           // Inspiration, not formal teaching
trained_alongside       // Peers, same generation
co_founded              // Founded group together
biological_sibling      // Brothers, sisters
biological_child        // Parent-child
married_to              // Spouses
padrinho                // Godfather blessing (blessed splits)
blessed_by              // Elder approval for new group
supervises              // Current hierarchical relationship
succeeded_by            // Leadership succession

// Person-to-Group Relationships
founded                 // Founded the group
co_founded              // Co-founded the group
leads                   // Current leader
teaches_at              // Teaches at location
trained_at              // Trained at this group
autonomous_continuation // Established autonomous group maintaining connection
nucleus_organizer       // Organized a nucleus

// Group-to-Group Relationships
parent_child            // Headquarters → branch
nucleus_of              // Nucleus → headquarters
blessed_split           // New group blessed by old group
affiliate_of            // Affiliated but independent
franchise_of            // Licensed franchise
descended_from          // Historical descent (no current org tie)
```

**Document which ones are present in the group being studied**.

### 9.2 Organizational Patterns

**Identify which patterns apply**:

**Expansion patterns**:
- Students move and establish locations (autonomous)
- Organization opens new branches (hierarchical)
- Certification/licensing of new affiliates (commercial)
- Núcleos organized by advanced students (semi-autonomous)

**Control patterns**:
- Central control (all decisions at HQ)
- Regional autonomy (regional arms have authority)
- Complete autonomy (no central authority)
- Collaborative decision-making

**Financial patterns**:
- Donation-based (pay what you can)
- Fixed fees per location
- Annual dues to headquarters
- Licensing fees for name/brand
- Completely free (community-based)
- Commercial (profit-oriented)

**Verification patterns**:
- Trademark protection (CDO)
- Registration system (Muzenza)
- No formal verification (Ngoma, ABADÁ)
- Parent org approval required

### 9.3 Schema Implications

**As you research, note**:

**New fields needed**:
- Did research reveal data that our schema doesn't capture?
- What new enums or types are needed?
- What relationships aren't modeled yet?

**New tables needed**:
- Do we need a `belt_systems` table for group-specific ranks?
- Should `name_history` be its own table?
- Do we need `cultural_practices` table?

**Validation of existing schema**:
- Does our planned schema handle this group's structure?
- Are there edge cases not covered?
- Do enums need additional values?

---

## Phase 10: Documentation & Synthesis

### 10.1 Case Study Document Structure

**Use consistent structure** for all case studies:

```markdown
# Case Study: [Group Name]

**Date**: YYYY-MM-DD
**Founded**: [Year/Period]
**Location**: [City, Country] ([X+ international locations])
**Style**: [Angola/Regional/Contemporânea/Capoeira/Capoeira de Rua/Mixed/Other]
**Scale**: [Local/National/International with countries]

---

## IMPORTANT DISCLAIMER

[Standard disclaimer about limited scope, not representative, preliminary research]

---

## Founder: [Mestre Name]

### Biography
- Full name, known as, birth date/location
- Current base
- Key life milestones

### Training Lineage
- Early training period
- Transition periods (if any)
- Primary teachers
- Influences
- Complete lineage chain visualization

---

## Group Evolution & Organizational History

### Name Changes
- Track all name changes with dates and reasons

### Leadership Structure
- Current leadership model
- Key leaders and their roles
- Succession planning

---

## International Presence (X+ Confirmed Locations)

### [Country/Region]
For each location:
- City, venue
- Leader name and rank
- Schedule, fees
- Contact info, social media
- Relationship to headquarters

---

## Social Media Presence

### Main/Official Accounts
### Location-Specific Accounts
### Patterns Observed

---

## Organizational Model: [Model Type]

### Core Philosophy
How the organization operates

### Contrast with Other Models
Comparison table

---

## Cultural Practices & Philosophy

### [Key characteristics]
### [Unique practices]
### [Social mission]

---

## Students & Next Generation

List of known students with details

---

## Data Model Insights

### New Patterns Identified
### Schema Considerations
### Relationship Types Present

---

## Comparison: [Group] vs. [Similar Group]

Table comparing with similar organizational model

---

## Unknown / Questions for Further Research

Numbered list of open questions

---

## References

- Web sources
- Social media
- Academic papers
- Personal experience

---

## Key Takeaway

Summary of what makes this group unique and data model implications
```

### 10.2 Cross-Referencing

**After completing case study**:

1. **Update comparison documents**:
   - Add to capoeira-registries-comparison.md if relevant
   - Cross-reference with similar groups

2. **Note for ER modeling**:
   - Document new relationship types discovered
   - Note new fields/enums needed
   - Identify schema gaps

3. **Add to research log**:
   - What worked well in research
   - What was difficult to find
   - What sources were most valuable
   - What should be prioritized in future research

### 10.3 Data Extraction for Population

**From completed case study, extract structured data**:

```json
{
  "group": {
    "name": "...",
    "founded": "...",
    "founder_id": "...",
    "style": "...",
    "organizational_model": "...",
    // ... all fields
  },
  "persons": [
    {
      "name": "...",
      "born": "...",
      "rank": "...",
      // ... all fields
    }
  ],
  "locations": [...],
  "relationships": [
    {
      "from": "...",
      "to": "...",
      "type": "...",
      "context": "...",
      // ... all fields
    }
  ],
  "social_media": [...],
  "sources": [...]
}
```

This structured data can then populate the database.

---

## Research Quality Checklist

Before considering a case study complete, verify:

### Founder & Lineage (Critical)
- [ ] Founder full name and apelido identified
- [ ] Birth date/location (at least approximate)
- [ ] Primary teacher(s) identified with style context
- [ ] Complete lineage chain to legendary figure (Bimba/Pastinha)
- [ ] Style transitions documented (if any)
- [ ] Influences beyond primary teacher noted

### Group History (Critical)
- [ ] Founding date (year or decade minimum)
- [ ] Founding location identified
- [ ] Founding context explained (original vs. split)
- [ ] Name changes documented with dates and reasons
- [ ] Current leadership identified

### Geographic Presence (High Priority)
- [ ] Headquarters location confirmed
- [ ] At least 70% of locations identified (based on group claims)
- [ ] Each location has leader name
- [ ] Organizational relationship of locations to HQ determined

### Organizational Model (Critical for ER)
- [ ] Organizational model type classified
- [ ] Legal structure noted (if determinable)
- [ ] Expansion pattern identified
- [ ] Control/autonomy level documented

### Relationships (Critical for ER)
- [ ] At least 3 relationship types identified
- [ ] Family relationships noted (if any)
- [ ] Co-founder relationships documented (if any)
- [ ] Student-teacher chains mapped

### Cultural & Philosophy (Medium Priority)
- [ ] Style confirmed (Angola/Regional/Contemporânea/Capoeira/Capoeira de Rua/Mixed/Other)
- [ ] Unique practices documented
- [ ] Social mission/philosophy captured (if stated)
- [ ] Political dimensions noted (if any)

### Social Media (Medium Priority)
- [ ] Main official account identified (or confirmed none exists)
- [ ] Decentralized vs. centralized pattern noted
- [ ] At least 50% of location accounts found

### Documentation (Required)
- [ ] Case study document created following template
- [ ] Sources cited for all claims
- [ ] Disclaimers included
- [ ] Data model insights section completed
- [ ] Open questions documented

### Data Model (Critical)
- [ ] New relationship types identified
- [ ] Schema gaps noted
- [ ] Unique patterns documented
- [ ] Comparison with similar groups included

---

## Common Pitfalls to Avoid

### 1. Drawing Conclusions Too Quickly
**Problem**: Making generalizations from limited data
**Solution**: Always include disclaimer, use phrases like "appears to", "suggests", "from available data"

### 2. Confusing Correlation with Structure
**Problem**: Assuming informal associations are formal organizational ties
**Solution**: Distinguish between "associated with", "affiliated with", "branch of", "inspired by"

### 3. Missing Name Variations
**Problem**: Not finding all locations because they use different names
**Solution**: Search for founder name, old group names, variations, abbreviations

### 4. Relying on Single Source
**Problem**: One website/source may have outdated or incomplete info
**Solution**: Always cross-reference multiple sources, check dates

### 5. Ignoring Inactive Locations
**Problem**: Listings may include defunct locations
**Solution**: Check "last updated", social media activity, verify current status

### 6. Assuming Hierarchy Where None Exists
**Problem**: Interpreting autonomous continuation as branch structure
**Solution**: Look for actual evidence of hierarchy (fees, approval, reporting)

### 7. Missing Female Leadership
**Problem**: Focusing only on male mestres, missing contra-mestras
**Solution**: Explicitly search for female leaders, co-founders, women's programs

### 8. Overlooking Political Dimensions
**Problem**: Treating groups as purely athletic/cultural when they have political missions
**Solution**: Look for political statements, social programs, name meanings, community work

### 9. Not Tracking Style Transitions
**Problem**: Assuming lineage is static (Regional OR Angola)
**Solution**: Look for phrases like "switched to", "transitioned", "studied both"

### 10. Incomplete Social Media Mapping
**Problem**: Finding official account but missing 20 location accounts
**Solution**: Systematically search for @groupname_[city] patterns, hashtags, related accounts

### 11. Name Disambiguation Not Considered
**Problem**: Multiple groups may share the same name (e.g., "Filhos de Angola" - two different groups founded 1960 Rio vs 1984 Salvador)
**Solution**: When researching a group name, search with "[Group Name] + founder" and "[Group Name] + location + year" to identify if multiple groups exist. Include founding year, location, and primary founder in disambiguation.

### 12. Conflicting Dates Resolved Arbitrarily
**Problem**: Sources may provide conflicting dates (e.g., ABCA founded 1987 vs 1991) and picking one arbitrarily loses information
**Solution**: Document ALL conflicting dates with sources, flag for community verification. Use data structure like `{date_primary: Date, date_conflicts: Date[], needs_verification: boolean}`

### 13. JavaScript-Heavy Websites Not Accessible
**Problem**: Modern websites with client-side rendering (JavaScript frameworks) may not be accessible via WebFetch (only HTML/CSS/JS framework code returned, no actual content)
**Solution**: Note limitation when encountered, use alternative sources (social media, affiliated núcleos' websites, cached versions, or location-specific sites). Don't spend time trying to extract from JS-heavy sites.

### 14. Co-Founder Separation Not Investigated
**Problem**: Multiple co-founders may separate over time, continuing under same name independently or within network (e.g., GCFA - Rosalvo independent, Roberval within network, Laércio coordinates)
**Solution**: When multiple co-founders identified, explicitly search for "[Founder Name] + [Group Name]" individually to identify if they went separate directions. Look for phrases like "founding masters separated creating other groups".

---

## Time Estimates

**Minimal case study** (if limited info available):
- 1-2 hours of research
- Basic founder, lineage, locations documented
- Main organizational model identified

**Standard case study** (good information available):
- 3-4 hours of research
- Comprehensive founder/lineage
- Most locations identified
- Organizational model well-documented
- Students identified

**Comprehensive case study** (rich information, like Ngoma or Angoleiros):
- 5-6 hours of research
- Complete founder biography
- All locations mapped with leaders
- Detailed organizational model
- Students, social programs, philosophy documented
- Social media fully mapped
- Comparison with similar groups

**Follow-up research** (updating existing case study):
- 1-2 hours
- Verify existing info still current
- Search for new locations
- Update social media follower counts
- Check for organizational changes

---

## Iteration & Improvement

**This guide should evolve**:

After each case study:
1. Note what worked well
2. Note what was difficult
3. Identify new patterns not in guide
4. Update search patterns if better ones found
5. Add new relationship types as discovered
6. Refine data model insights section

**Quarterly review**:
- Review all case studies completed
- Identify common gaps
- Update methodology based on learnings
- Refine documentation template
- Update schema recommendations

---

## Summary: Quick Research Workflow

For quick reference, the research workflow in order:

1. **Initial Discovery**: 5 parallel web searches
2. **Founder Research**: Biography, lineage, teachers
3. **History**: Founding, name changes, evolution
4. **Structure**: Leadership, organizational model, hierarchy
5. **Locations**: Systematic geographic mapping
6. **Social Media**: Platform-by-platform search
7. **Students**: Key students and next generation
8. **Culture**: Philosophy, practices, unique characteristics
9. **Data Patterns**: Relationship types, schema implications
10. **Documentation**: Write case study following template
11. **Extraction**: Extract structured data for database
12. **Quality Check**: Verify against checklist
13. **Cross-Reference**: Compare with similar groups, update comparisons

Following this systematic approach ensures:
- **Consistency** across all case studies
- **Completeness** of data gathering
- **Comparability** between groups
- **Usefulness** for ER modeling
- **Efficiency** in research process

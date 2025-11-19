# CapoeiraHub Analysis: Existing Genealogy Tree Implementation

**Date**: 2025-11-19
**URL**: https://www.capoeirahub.net/
**Category**: Competitor/Reference Analysis

---

## Overview

**CapoeiraHub** is an existing platform that has already implemented a genealogy tree for Capoeira mestres, along with group discovery features. This document analyzes their data model, features, and lessons learned for Quilombo's development.

### What They Built

- **Mestres/Professores Lineage Tree**: Visual graph showing teacher-student relationships
- **Groups Directory**: ~30 groups with map locations and ratings
- **Community Features**: User accounts, ability to add profiles, rating system
- **Multilingual**: English, French, Portuguese

### Scale

- **Mestres/Professores**: Hundreds of practitioners in the family tree (dozens at minimum based on profiles viewed)
- **Groups**: ~30 listed (significantly incomplete - missing most groups)
- **Launch**: © 2022 (relatively new)

---

## Scraped Data Overview (2025-11-19)

### Mestres & Professores Catalogued

**Historical Legends** (deceased):
- Mestre Pastinha (Angola lineage root)
- Mestre Bimba (Regional lineage root)
- Mestre Waldemar
- Mestre João Pequeno
- Mestre João Grande
- Mestre Cobrinha Verde
- Mestre Boca Rica
- Mestre Valmir Damasceno Santos

**Contemporary Mestres** (partial list from visible profiles):
- Mestre Moraes
- Mestra Janja Araújo (notable: female mestre)
- Mestra Paulinha
- Mestre Poloca
- Mestre Anastácio Marrom *(from our Ngoma case study!)*

**Contra-Mestres** (partial list):
- Contra-Mestre Shari
- Contra-Mestre Trevor Whittingham
- Contra-Mestre Rafael de Lemba
- Contra-Mestre Raphael Souza
- Contra-Mestre Satoko
- Contra-Mestre Gamela
- Contra-Mestre Bruno (Belgrade, Serbia - student of Marrom)
- Contra-Mestra Aleksandra Jaksic (Belgrade, Serbia - student of Marrom)

**Professores** (partial list):
- Professor Marinheiro (Newark, New Jersey)
- Professor Peixe (Orlando, Florida)

**Additional ranks visible**: Treinels, Graduados (hundreds in the interactive family tree)

### Groups Catalogued (30 total)

**Sample by Region**:

**Europe**:
- Capoeira Angola Center of Mestre João Grande Italy (Sacile, Italy)
- Balanço da meia lua (Ljubljana, Slovenia)
- Escola Matumbé Capoeira Angola - Roma (Rome, Italy)
- Ngoma Capoeira Angola - Kragujevac (Kragujevac, Serbia)
- Afro Ritmo Capoeira Osijek (Osijek, Croatia)
- Capoeira Senzala Novi Sad (Novi Sad, Serbia)
- Ngoma Capoeira Angola Paris (Paris, France)
- Centro de Capoeira Angola Angoleiro Sim Sinhô (Athens, Greece)

**Americas**:
- Capoeira Angola Center (New York, NY)

**Asia-Pacific**:
- Capoeira Árvore Da Vida | Borneo (Kuching, Sarawak)

**Notable**: Multiple Ngoma Capoeira Angola locations (Paris, Kragujevac, Serbia) confirming the distributed nature of Marrom's school that we documented in our case study.

### Case Study Comparison: Mestre Anastácio Marrom

We can directly compare CapoeiraHub's data with our own research on Mestre Marrom to understand data completeness and accuracy issues.

| Aspect | CapoeiraHub Data | Our Case Study Data | Notes |
|--------|------------------|---------------------|-------|
| **Birth** | September 11, 1963 (Itabuna, Bahia) | Not captured | CapoeiraHub has better biographical data |
| **Current Location** | Rio de Janeiro (Morro da Babilônia) | Rio de Janeiro (Morro da Babilônia) | ✅ Match |
| **Style** | Angola only | Regional (1970s-1990) → Angola (1990-present) | ❌ CapoeiraHub missing style transition |
| **Primary Teachers** | Mestre Canela, Mestre Peixinho | Cobrinha Verde → Gato Preto → Marrom | ❌ Different lineage chains |
| **Influences** | Gato Preto, Angolinha, Nô, João Grande | Gato Preto mentioned in our research | ✅ Partial overlap |
| **Students** | 3 people (Belgrade, Kragujevac Serbia only) | Multiple locations (Rio, Berlin, Serbia) | ❌ CapoeiraHub missing Berlin outpost |
| **Group Name** | Not clearly linked | "Mestre Marrom e Alunos" (old), "Ngoma Capoeira Angola" (2018+) | ❌ CapoeiraHub doesn't capture name change |
| **Casa Ngoma** | Founded 2020 | Name change to Ngoma noted as 2018 | ⚠️ Date discrepancy (Casa vs. Group naming) |
| **Community Focus** | 25 years in Morro da Babilônia | Favela-based, social justice focus, donation model | ✅ Partial match |
| **Political Dimension** | Not captured | Ngoma = African word, political statement (2018) | ❌ CapoeiraHub misses cultural/political context |

**Key Takeaways from Comparison**:
1. **Biographical data**: CapoeiraHub stronger (birth date/place)
2. **Lineage complexity**: Both have different teacher chains, suggesting multiple valid perspectives or incomplete data
3. **Style transitions**: CapoeiraHub can't model changes over time (Regional → Angola)
4. **Geographic completeness**: CapoeiraHub missing Berlin location (where user trains!)
5. **Temporal data**: No dates on relationships, missing organizational name changes
6. **Cultural context**: Missing political/social dimensions of group evolution

**This illustrates the challenge**: Even with user-contributed data from the community, both sources have gaps. No single source has complete truth.

### Coverage Gap: Missing Major Groups

From our case studies, we documented 5 major Capoeira organizations. Here's what CapoeiraHub has:

| Group | Size/Reach | In CapoeiraHub? | Notes |
|-------|-------------|-----------------|-------|
| **Grupo Axé Capoeira** | International network (Canada, USA, Brazil) | ❌ NOT FOUND | Founded 1982 by Mestre Barrão, major international presence |
| **Cordão de Ouro** | Founded 1967, one of largest/oldest | ❌ NOT FOUND | Has trademarked certification system, global presence |
| **Grupo Muzenza** | 706 registered instructors, 61 countries | ❌ NOT FOUND | One of the largest international networks |
| **ABADÁ-Capoeira** | 41,000-80,000 members, largest organization | ❌ NOT FOUND | Co-founded by Mestre Camisa (student of Bimba) - Camisa IS in CapoeiraHub but ABADÁ groups aren't |
| **Ngoma Capoeira Angola** | Small traditional Angola school | ✅ PARTIAL | 2 locations listed (Paris, Serbia) but Berlin missing |

**Critical Finding**: CapoeiraHub has 4 out of the 5 largest international networks completely missing from their groups directory. They DO have some of the founder mestres (Camisa, Marrom) in the lineage tree, but the groups themselves are not catalogued.

**This confirms**:
- ~30 groups is indeed vastly incomplete
- Focus has been on mestres lineage tree, not comprehensive group directory
- Opportunity for Quilombo to provide much more complete group data

---

## Data Model Analysis

### Person Profiles (Mestres & Professores)

**Two tiers**:
1. **Mestres** (Master level) - `/mestres/` URLs
2. **Professores** (Professor level) - `/professores/` URLs

**Data Fields Captured**:
```typescript
{
  // Identity
  id: string,                    // MongoDB-style ID
  label: string,                 // Display name (e.g., "Mestre Bimba")
  slug: string,                  // URL slug (id + name)

  // Biographical
  fullName: string,              // Full legal name
  birthDate: Date,               // Birth date
  deathDate?: Date,              // Death date (if deceased)
  location: string,              // Current or historical location

  // Capoeira
  style: 'Angola' | 'Regional' | 'Contemporânea',
  role: 'mestre' | 'professor',  // Hierarchical distinction

  // Biography
  biography: string,             // Long-form narrative

  // Media
  image: string,                 // Profile photo (Cloudinary hosted)

  // Contact
  email?: string,                // Contact email (some profiles)

  // Relationships (stored separately)
  learnedFrom: Array<PersonId>,  // Teachers
  students: Array<PersonId>,     // People they taught

  // Visualization
  position: { x: number, y: number },  // Graph coordinates

  // Metadata
  authorId: string,              // Who created/maintains this profile
  isAdmin: boolean,              // Permission flag
}
```

### Relationship Model

**SIMPLE: Only "Learned From"**

- Only one relationship type captured
- **Teacher → Student** direction
- Bidirectional display (teachers above, students below in tree)
- No distinction between:
  - Primary teacher vs. influences
  - Formal training vs. workshops
  - Long-term vs. short-term
  - Co-founders
  - Family relationships

**Example from Mestre Bimba**:
- **Learned from**: Mestre Bentinho
- **Students**: Mestre Gigante, Mestre Lua Rasta, Mestre Camisa, Mestre Nenel

**Example from Mestre Camisa**:
- **Learned from**: Mestre Bimba, Mestre Camisa Roxa (brother)
- Note: Brother relationship NOT explicitly captured, just both listed as teachers

**Example from Mestre Moraes**:
- **Learned from**: Mestre João Grande, Mestre Pastinha
- **Students**: Mestra Janja, Mestre Cobrinha, and 4 others listed

### Groups Data Model

```typescript
{
  // Identity
  id: string,
  title: string,                 // Group name

  // Leadership
  mestre: string,                // Primary mestre
  teacher: string,               // Teacher at this location

  // Location
  location: string,              // Address/city
  coordinates: {
    latitude: number,
    longitude: number
  },

  // Status
  hasEndDate: boolean,
  isFinished: boolean,

  // Community
  rating: number,                // 0-5 stars, user-contributed

  // Visualization
  popUpMarkup: string,           // HTML for map popup
}
```

**Observations**:
- Only ~30 groups listed (vastly incomplete)
- No apparent link between groups and mestres/professores profiles
- Rating system exists but unclear if widely used
- Map visualization using Mapbox + GeoJSON

---

## Visual Implementation

### Lineage Tree Graph

**Technology**: Interactive graph visualization (appears to be D3.js or similar)

**Features**:
- **Nodes**: Circles representing people
  - Color-coded by role (gold for mestres, yellow/green for students)
  - Profile photo inside node
  - Name label
- **Edges**: Directional arrows showing teacher→student
  - Color indicates direction (green for teachers, yellow for students)
- **Interactivity**:
  - Click node → go to profile page
  - Zoom/pan
  - Center on selected person
- **Layout**: Force-directed or manual positioning (x/y coordinates stored)

**Example Visualization** (Mestre Bimba):
```
        [Mestre Bentinho]
               ↓
         [Mestre Bimba] ← CENTER
          ↙    ↓    ↓    ↘
    [Gigante] [Lua] [Camisa] [Nenel]
```

### Map Visualization (Groups)

**Technology**: Mapbox with GeoJSON

**Features**:
- Interactive map with markers
- Popups showing group info + rating
- Presumably filterable/searchable

---

## What They Got Right

### 1. Simple Relationship Model (MVP)

**Decision**: Only "learned from" relationship
- Easy to understand
- Easy to contribute (users can add)
- Creates usable lineage tree
- Avoids complexity of multiple relationship types

**Works for**: Basic genealogy visualization

**Limitation**: Misses nuance (primary teacher, influences, co-founders, family, etc.)

### 2. Visual Genealogy Tree

**Interactive graph** is engaging and intuitive
- See lineage at a glance
- Explore relationships visually
- Understand who taught whom

**Better than**: Text lists or tables

### 3. User-Contributed Content

**Community model**:
- Users can create accounts
- Add new mestres/professores
- Add new groups
- Rate groups

**Benefits**:
- Scales without full-time data entry team
- Community ownership
- Distributed knowledge gathering

**Risks**:
- Quality control challenges
- Potential disputes over data accuracy
- Vandalism/spam

### 4. Hierarchical Distinction (Mestre vs. Professor)

**Two tiers** reflect real hierarchy:
- Mestres are apex (teachers of teachers)
- Professores are advanced but still learning
- Matches Capoeira culture

**Better than**: Flat structure with no distinction

### 5. Biographical Narratives

**Long-form biographies** tell the story:
- Not just data points
- Cultural context
- Personal journeys
- Engaging to read

**Example**: Professor Peixe's bio describes his 30-year journey from childhood to teaching

### 6. Deceased Mestres Included

**Historical figures** like Bimba and Pastinha:
- Preserves lineage to roots
- Honors ancestors
- Enables complete tree

**Similar to**: Quilombo's "managed profiles" concept

---

## What They Missed / Could Improve

### 1. Only ~30 Groups (Vastly Incomplete)

**Problem**: Hundreds (thousands?) of groups exist worldwide
- Axé has unknown number
- CDO has many countries
- Muzenza has 706 instructors
- ABADÁ has 80,000 members

**30 groups** is a fraction of 1%

**Why**: Likely user-contributed model hasn't scaled, or they focused on quality over quantity

### 2. No Link Between Groups and Lineage Tree

**Disconnect observed**:
- Groups list mestre/teacher names as strings
- Not linked to mestre/professor profiles
- Can't navigate from group → mestre's lineage tree
- Can't see "all groups founded by Mestre X"

**Missed opportunity**: Should be deeply integrated

### 3. Single Relationship Type Too Simple

**"Learned from" only** misses:
- **Primary teacher** vs. influences
- **Co-founders** (Camisa + Camisa Roxa both listed as Camisa's teachers, but they're brothers!)
- **Family relationships** (father-son, brothers)
- **Trained alongside** (peers/generation)
- **Organizational roles** (founder, leader, representative)
- **Temporal data** (trained 1990-1995 vs. 2000-2010)

**Result**: Relationship nuance lost

### 4. No Organizational Structure Data

**Missing**:
- Group hierarchies (headquarters, branches)
- Affiliation types (certified, affiliated, independent)
- Organizational history (splits, merges)
- Regional structures (núcleos, coordinators)

**Just**: List of groups with locations

### 5. No Temporal Dimension

**Relationships lack time**:
- When did they train together?
- How long?
- Different teachers at different life stages?

**Example**: Marrom trained Regional (1970s-1990), then Angola (1990s-present)
- CapoeiraHub can't capture this style transition

### 6. Limited Scale

**Why only ~30 groups?**

Possible reasons:
- **Manual curation** (didn't scale)
- **Lack of community adoption** (users didn't contribute)
- **Quality over quantity** (intentionally limited)
- **Resource constraints** (small team, limited time)

**Quilombo advantage**: Starting with existing import data + community features

### 7. No Verification System

**How to ensure accuracy?**
- Anyone can create/edit profiles?
- How to handle disputes?
- Who verifies lineage claims?

**CDO's certification issue** (unauthorized groups claiming affiliation) would be a problem here

**Need**: Verification badges, admin approval, community moderation

### 8. No Group Network Modeling

**Missing**:
- Parent-child group relationships
- Accreditation/certification status
- Branch vs. affiliated vs. independent

**Just**: Flat list of groups

---

## Data Model Comparison: CapoeiraHub vs. Our Research

| Aspect | CapoeiraHub | Our Research Findings |
|--------|-------------|----------------------|
| **Person Tiers** | Mestre, Professor | Full hierarchy (Aluno → Monitor → Instrutor → Professor → Contra-Mestre → Mestre) |
| **Relationship Types** | 1 ("learned from") | 7+ (student_of, influenced_by, trained_under, co_founded, trained_alongside, family, supervises) |
| **Temporal Data** | No | Yes (startedAt, endedAt for relationships) |
| **Style Tracking** | Static field | Style can change over time (Marrom: Regional → Angola) |
| **Group Hierarchy** | None | Extensive (sede/filiais, núcleos, affiliations, certifications) |
| **Organizational Roles** | None | Many (founder, co-founder, leader, director, representative, regional coordinator) |
| **Family Relationships** | No | Yes (brothers, father-son as distinct from training) |
| **Verification** | Unclear | Needed (verified vs. self-reported) |
| **Deceased Profiles** | Yes | Yes (managed profiles concept) |
| **Biography** | Yes (long-form) | Yes (person_profiles.biography) |
| **Groups-People Link** | No | Yes (group_roles, person→group relationships) |
| **Scale** | ~30 groups | Aiming for comprehensive |

---

## Lessons for Quilombo

### 1. Start Simple, Add Complexity Later

**CapoeiraHub's approach**:
- ONE relationship type to start
- Built working tree visualization
- Can add relationship types later if needed

**Quilombo could**:
- Start with `student_of` only (MVP)
- Add `co_founder`, `family`, etc. in phases
- Don't over-engineer upfront

**But**: Our research shows multiple relationship types ARE essential for accuracy

### 2. Visualization is Key

**Graph visualization** makes data accessible:
- Non-technical users can explore
- Visual lineage is engaging
- Better UX than tables/lists

**Quilombo should**:
- Plan for interactive genealogy tree UI
- Use D3.js, Cytoscape, or similar
- Make it central feature, not afterthought

### 3. User-Contributed Content Works (If Managed)

**Benefits**:
- Community ownership
- Distributed knowledge
- Scales without huge team

**Requirements**:
- Verification system (admin approval)
- Dispute resolution process
- Moderation tools
- Clear contribution guidelines

**Quilombo advantage**: Starting with imported data = quality baseline

### 4. Biographical Narratives Matter

**Not just data points**:
- Stories engage users
- Cultural preservation
- Richer than "Name, Date, Location"

**Quilombo should**:
- Emphasize biography field
- Encourage storytelling
- Long-form content, not just structured data

### 5. Separate Tiers (Mestre vs. Professor)

**Reflects real hierarchy**:
- Useful for filtering/display
- Matches cultural reality

**Quilombo has**:
- Full `title` enum (Aluno → Mestre)
- More granular than CapoeiraHub's two tiers

### 6. Map Visualization for Groups

**Geographic discovery** is important:
- Users want "groups near me"
- Map with markers is intuitive
- Already planned for Quilombo

**Quilombo already has**:
- Geolocation data
- Map views
- Better than CapoeiraHub's ~30 groups

### 7. Integration is Critical

**CapoeiraHub's biggest miss**:
- Groups disconnected from lineage tree
- Can't see "groups founded by this mestre"
- Can't navigate group → lineage

**Quilombo must**:
- Link groups ↔ people tightly
- `group_roles` table with founder, leader, etc.
- Navigate bidirectionally (person→groups, group→people)

### 8. Completeness Matters

**30 groups is not useful**:
- Vast majority missing
- Low utility for discovery
- Users will go elsewhere

**Quilombo should**:
- Import all available data
- Encourage comprehensive coverage
- Make it THE definitive source

---

## Technical Implementation Insights

### Graph Visualization

**CapoeiraHub uses**:
- X/Y coordinate positioning (stored in DB)
- Force-directed layout OR manual positioning
- Color-coding by role
- Directional edges
- Interactive (zoom, pan, click)

**Technologies (likely)**:
- D3.js (most common for graph viz)
- Or Cytoscape.js
- Or custom Canvas/SVG rendering

**Data structure**:
```json
{
  "nodes": [
    {
      "id": "mestre-bimba-id",
      "label": "Mestre Bimba",
      "x": 500,
      "y": 300,
      "color": "#ffd166",
      "image": "https://cloudinary.com/..."
    }
  ],
  "edges": [
    {
      "from": "mestre-bentinho-id",
      "to": "mestre-bimba-id",
      "type": "learned_from"
    }
  ]
}
```

### Map Visualization

**CapoeiraHub uses**:
- Mapbox for base map
- GeoJSON for markers
- Custom popups with HTML

**Quilombo already has**:
- Geolocation infrastructure
- Can enhance with similar map features

---

## Scraping Feasibility

### Can We Scrape CapoeiraHub Data?

**Technically possible**:
- Web pages are public
- Data is in HTML (not API-gated)
- Profile URLs follow patterns

**Ethically questionable**:
- Someone else's work
- Potentially copyright issues
- Would be taking without permission

**Legally risky**:
- Terms of service likely prohibit scraping
- Could face legal issues

**Better approach**:
- Respect their work
- Use as reference/inspiration
- Build our own data from:
  - Public sources (group websites, Wikipedia, etc.)
  - Community contributions
  - Import scripts from existing data
  - User-submitted profiles

**Could consider**:
- Reaching out to CapoeiraHub for partnership/data sharing
- Offering to contribute data back
- Collaborating rather than competing

---

## Competitive Analysis

### CapoeiraHub vs. Quilombo

| Feature | CapoeiraHub | Quilombo (Planned) |
|---------|-------------|-------------------|
| **Lineage Tree** | ✅ Yes, visual graph | ✅ Planned, more detailed |
| **Relationship Types** | 1 type | 7+ types |
| **Temporal Data** | ❌ No | ✅ Yes |
| **Groups** | ~30 (incomplete) | Hundreds+ (importing existing) |
| **Group-Person Links** | ❌ No | ✅ Yes (group_roles) |
| **Group Hierarchies** | ❌ No | ✅ Yes (parent-child, affiliations) |
| **Verification** | ❌ Unclear | ✅ Planned (verified badges) |
| **Managed Profiles** | ✅ Yes (deceased mestres) | ✅ Yes (claimable profiles) |
| **Biography** | ✅ Yes | ✅ Yes |
| **Geolocation** | ✅ Yes (30 groups) | ✅ Yes (many groups) |
| **Web3** | ❌ No | ✅ Yes (DAO features) |
| **Community Features** | ✅ User accounts, ratings | ✅ Plus DAO governance |
| **Multilingual** | ✅ EN, FR, PT | Planned (i18next) |

**CapoeiraHub strengths**:
- Already launched and functional
- Visual lineage tree working
- Simple, focused

**Quilombo advantages**:
- More comprehensive data model
- Better integration (groups ↔ people)
- Web3/DAO features (unique)
- Starting with more data (imports)
- More relationship types (accuracy)

**Not competing**:
- Different focus (Quilombo is broader - DAO, events, community)
- Could coexist or even collaborate
- CapoeiraHub focused on genealogy only

---

## Recommendations for Quilombo

### Do's (Learn from CapoeiraHub)

1. **✅ Prioritize visual genealogy tree** - make it central, engaging
2. **✅ Support user-contributed profiles** - community knowledge
3. **✅ Include deceased mestres** - complete lineage to roots
4. **✅ Long-form biographies** - tell stories, not just data
5. **✅ Distinguish hierarchical levels** - mestre/professor/etc.
6. **✅ Map visualization for groups** - geographic discovery

### Don'ts (Avoid CapoeiraHub's limitations)

1. **❌ Don't use only one relationship type** - need nuance
2. **❌ Don't disconnect groups from lineage** - integrate tightly
3. **❌ Don't skip temporal data** - when/how long matters
4. **❌ Don't ignore group hierarchies** - organizational structure is important
5. **❌ Don't launch with incomplete data** - 30 groups isn't useful
6. **❌ Don't skip verification system** - quality control essential

### Unique Value Props for Quilombo

1. **Web3/DAO features** - CapoeiraHub doesn't have this
2. **Comprehensive group data** - starting with hundreds of groups
3. **Rich relationship model** - 7+ types vs. 1
4. **Organizational structure** - hierarchies, affiliations, certifications
5. **Temporal tracking** - lineage changes over time
6. **Verification system** - trusted data with badges
7. **Integration** - groups ↔ people ↔ events ↔ DAO governance

---

## Data We Could Extract (If Ethical/Legal)

**IF we decided to scrape** (not recommended without permission):

### Mestres/Professores

From each profile, could extract:
- Name, full name
- Birth/death dates
- Location
- Style
- Biography
- Teachers (learned from)
- Students
- Profile photo URL

**Estimated**: Dozens to hundreds of profiles

### Groups

From groups list:
- Group name
- Mestre, teacher
- Location, coordinates
- ~30 groups total

**But again**: Not recommended without permission

---

## Alternative: Collaboration Opportunity

### Reach Out to CapoeiraHub?

**Potential partnership**:
- Share data bidirectionally
- Cross-link platforms
- Complementary features (they: genealogy focus, we: broader community + DAO)
- Mutual benefit

**Offer to contribute**:
- Our imported group data
- Our research on organizational structures
- Enhanced relationship model
- Verification system

**Could be win-win**:
- They get more data
- We get their lineage data
- Both communities benefit
- Avoids duplication of effort

**Worth considering**: Reach out to info@capoeirahub.net?

---

## Conclusion

**CapoeiraHub has built** exactly what we're planning (genealogy tree) but:
- Simpler relationship model (1 type vs. our 7+)
- Missing group-people integration
- Incomplete group data (~30 vs. hundreds+)
- No organizational structure modeling
- No verification system
- No Web3/DAO features

**Quilombo can learn from**:
- Their visual tree implementation
- User-contribution model
- Biographical narratives approach
- Mestre/Professor distinction

**Quilombo can improve on**:
- Richer relationship types
- Tight group-people integration
- Comprehensive data (not just 30 groups)
- Verification/trust system
- Organizational hierarchies
- Temporal tracking
- Web3/governance features

**Not competitors** - different enough to coexist, or even collaborate.

**Key insight**: Someone else HAS done this, which validates the need. We can build on their learnings and go further.

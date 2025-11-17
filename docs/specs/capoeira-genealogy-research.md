# Capoeira Genealogy & Lineage Research Report

**Version:** 1.1
**Last Updated:** 2025-11-17
**Status:** Research Report
**Purpose:** Inform database design for capturing Capoeira lineage relationships

---

## Executive Summary

This research report analyzes the structures and relationships within the Capoeira community to inform database design for capturing comprehensive genealogy information. The goal is to create a "genealogy tree of Capoeira" that traces lineages back to historical mestres and captures the rich network of relationships that define the art.

**Key Findings:**
1. **Complex M:N Relationships**: Capoeiristas often train under multiple mestres throughout their journey
2. **Role-Based Relationships**: Multiple relationship types exist (student-of, influenced-by, trained-under, co-founder)
3. **Hierarchical Titles**: Well-defined ranking system from aluno to mestre with regional variations
4. **Group Affiliations**: People can have multiple group affiliations over time (lineage changes)
5. **Temporal Dimension**: Relationships change over time (e.g., trained with X from 1990-1995, then with Y)
6. **Three Main Styles**: Angola, Regional, and Contemporânea have distinct lineages and philosophies
7. **Group Networks**: Complex hierarchies exist between groups (headquarters-branches, affiliations, núcleos, splits)

---

## Table of Contents

1. [Capoeira Organizational Structures](#capoeira-organizational-structures)
2. [Relationship Types & Roles](#relationship-types--roles)
3. [Title Hierarchy & Variations](#title-hierarchy--variations)
4. [Lineage Patterns](#lineage-patterns)
5. [Real-World Examples](#real-world-examples)
6. [Group-to-Group Relationships](#group-to-group-relationships)
7. [Database Schema Recommendations](#database-schema-recommendations)
8. [References & Data Sources](#references--data-sources)

---

## Capoeira Organizational Structures

### Typical Group Hierarchy

Most Capoeira groups follow a hierarchical structure:

```
Grupo/Associação (Group/Association)
├─ Mestre(s) - Founder(s) and/or Leader(s)
├─ Contra-Mestre(s) - Senior instructors, "right hand" to Mestre
├─ Professor/Professora - Authorized instructors
├─ Instrutor/Instrutora - Assistant instructors
├─ Monitor/Monitora - Teaching assistants
└─ Students (various cord levels)
```

### Group Roles Beyond Hierarchy

Groups have additional organizational roles:

- **Founder** - Person who originally created/named the group
- **Co-founder** - Multiple people may found a group together
- **Leader** - Current leader (may differ from founder, especially if founder deceased)
- **Director** - Administrative leadership (may be separate from teaching hierarchy)
- **Representative** - Regional representatives for international groups

### Examples from Research

**Grupo Capoeira Brasil** (founded January 14, 1989):
- **Founders**: Mestre Boneco, Mestre Paulinho Sabiá, Mestre Paulão Ceará (3 co-founders)
- **Structure**: One of the largest international groups with standardized ranking

**Centro Esportivo de Capoeira Angola (CECA)** (founded 1941):
- **Founder**: Mestre Pastinha
- **Co-leader**: Mestre João Pequeno
- **Successors**: After Pastinha, João Pequeno continued the lineage

**Cai Na Capoeira** (founded January 2012):
- **Founder**: Contra Mestre Cabeção
- **Assistant Instructor**: Instrutora Areia
- **Academia**: Affiliated with Cordão de Ouro (parent organization)

---

## Relationship Types & Roles

### Primary Relationship: Student-Of (Aluno de)

The foundational relationship in Capoeira lineage. A capoeirista may have:

- **Primary Mestre** - Main teacher who gave them their foundation
- **Multiple Mestres** - Common to train under multiple mestres across different periods
- **Sequential Training** - Train under Mestre A, then later under Mestre B

**Example from research:**
- Mestre João Pequeno was student of both Mestre Pastinha AND Mestre Gilvenson

### Secondary Relationships

**1. Influenced By (Influenciado por)**
- Different from direct student relationship
- Studied their methods/philosophy without direct training
- Important for understanding evolution of styles

**2. Trained Under (Treinou com)**
- May have attended workshops, seminars, or short-term training
- Less formal than "student-of" but still significant
- Common in modern international Capoeira

**Example from research:**
- Instrutora Areia: "Began training in 2007 with Capoeira Mandinga Com Expressão, continued under Professora Casca Dura, joined Cai Na Capoeira in 2011"
- Multiple lineage transitions showing different relationship types

**3. Co-Founded With (Co-fundador com)**
- Peer relationship, not hierarchical
- Important for group history
- Example: Grupo Capoeira Brasil's three co-founders

**4. Teaches/Taught (Ensina/Ensinou)**
- Reverse of student relationship
- Important for building complete lineage trees
- Example: Mestre Pastinha taught both João Grande and João Pequeno

**5. Trained Alongside (Treinou junto com)**
- Peer relationship, same generation
- Helps establish "family trees" within a mestre's school
- Often called "brothers/sisters" in Capoeira culture

---

## Title Hierarchy & Variations

### Standard Progression (Most Groups)

From lowest to highest rank:

1. **Aluno/Aluna** (Student) - Beginner
2. **Iniciante** (Initiate) - Early student
3. **Estagiário/Estagiária** (Intern/Trainee)
4. **Estagiando/Estagianda** (In training)
5. **Monitor/Monitora** (Monitor) - Can assist with teaching
6. **Treinel** (Used in some groups)
7. **Graduado/Graduada** (Graduate)
8. **Instrutor/Instrutora** (Instructor) - Authorized to teach basics
9. **Professor/Professora** (Professor) - Authorized to teach and represent group
10. **Contra-Mestre/Contra-Mestra** (Counter-Master) - Senior instructor, assists mestre
11. **Mestrando/Mestranda** (Becoming Mestre)
12. **Mestre/Mestra** (Master) - Highest rank

### Group-Specific Variations

**Grupo Capoeira Brasil:**
- Uses **"Formando"** instead of Contra-Mestre (brown cord) - means "graduating"
- Uses **"Formado"** for black cord - means "graduated"
- **Important distinction**: Black cord ≠ Mestre. Must be officially recognized as Mestre over time

**Capoeira Angola Groups:**
- Often **do not use formal cord/belt systems**
- Rank by discretion of one's mestre
- Title progression less formalized
- Emphasizes **malícia** (cunning/wisdom) and **mandinga** (spiritual knowledge) over technical rank

**Regional/Contemporary Groups:**
- More standardized cord systems
- Clear progression with defined requirements
- Emphasis on technical proficiency and teaching ability

### Gender-Specific Titles

Portuguese has masculine/feminine forms:
- Mestre (M) / Mestra (F)
- Contra-Mestre (M) / Contra-Mestra (F)
- Professor (M) / Professora (F)
- Instrutor (M) / Instrutora (F)
- etc.

**Database implication**: Store title as neutral string, not tied to gender

---

## Lineage Patterns

### Pattern 1: Linear Lineage (Simple Chain)

```
Mestre Benedito
    ↓
Mestre Pastinha (student of Benedito)
    ↓
Mestre João Grande (student of Pastinha)
    ↓
Mestre Moraes (student of João Grande)
    ↓
Mestre Cobra Mansa (student of Moraes)
```

**Characteristics:**
- Clear, unbroken chain
- Typical of traditional Angola lineages
- Often emphasizes purity of lineage

### Pattern 2: Multiple Teachers (M:N Relationship)

```
Mestre Pastinha ──┐
                   ├──→ Mestre João Pequeno
Mestre Gilvenson ─┘

Mestre Bimba ─────┐
                   ├──→ Mestre Eziquiel
(Other influences)┘
```

**Characteristics:**
- Common in modern Capoeira
- Enriches one's game with multiple influences
- More complex to represent in database

### Pattern 3: Lineage Divergence (Branching)

```
Mestre Bimba (Regional)
    ├──→ Mestre Acordeon → International expansion
    ├──→ Mestre Nenel (son) → Filhos de Bimba preservation
    ├──→ Mestre Camisa → ABADÁ-Capoeira (structured pedagogy)
    ├──→ Mestre Itapoan → Academic approach
    └──→ Mestre Eziquiel → Capoeira Luanda (US expansion)
```

**Characteristics:**
- Shows how one mestre's influence spreads
- Different branches emphasize different aspects
- Important for understanding style variations

### Pattern 4: Style Evolution & Hybridization

```
Capoeira Angola (Pastinha lineage)
            +
Capoeira Regional (Bimba lineage)
            ↓
Capoeira Contemporânea (1960s, Grupo Senzala)
    ↓
Modern International Capoeira
```

**Characteristics:**
- Represents evolution of styles over time
- Not person-to-person, but concept-to-concept
- Important for understanding philosophical differences

### Pattern 5: Group Lineage (Academia/Group Succession)

```
CECA (Mestre Pastinha, 1941)
    ├─ Co-led by João Pequeno after Pastinha
    ├─ Escola de João Pequeno (João Pequeno's own school)
    │   └──→ Grupo Semente do Jogo de Angola (Mestre Jogo de Dentro)
    └─ João Grande moves to NYC, teaches there

GCAP (Grupo Capoeira Angola Pelourinho)
    └─ Founded by Mestre Moraes (student of João Grande/Pequeno)
        └─ FICA (Mestre Cobra Mansa, student of Moraes)
```

**Characteristics:**
- Groups spawn from other groups
- Group affiliation changes as people move or found new groups
- Temporal dimension important (when did split/founding occur)

---

## Real-World Examples

### Example 1: Mestre Pastinha Lineage (Angola)

**Mestre Vicente Pastinha** (1889-1981)
- **Student of**: Mestre Benedito
- **Founded**: Centro Esportivo de Capoeira Angola (CECA), 1941
- **Style**: Capoeira Angola
- **Known for**: Preserving traditional Angola, philosophical approach
- **Notable students**:
  - Mestre João Pequeno (also trained with Mestre Gilvenson)
  - Mestre João Grande

**Mestre João Pequeno** (1917-2011)
- **Student of**: Mestre Pastinha, Mestre Gilvenson
- **Co-leader**: CECA (with Pastinha)
- **Later founded**: His own school
- **Notable students**:
  - Mestre Jogo de Dentro (founded Grupo Semente do Jogo de Angola)
  - Mestre Barba Branca (1956-2021)
  - Mestre Pé de Chumbo

**Mestre João Grande** (born 1933)
- **Student of**: Mestre Pastinha
- **Location**: Moved to New York City, internationalized Angola
- **Notable students**:
  - Mestre Moraes (also trained with João Pequeno)

**Mestre Moraes** (born 1950)
- **Student of**: João Grande, João Pequeno
- **Founded**: Grupo Capoeira Angola Pelourinho (GCAP)
- **Known for**: Revival of Capoeira Angola, academic approach
- **Notable students**:
  - Mestre Cobra Mansa (co-founded FICA)

### Example 2: Mestre Bimba Lineage (Regional)

**Mestre Bimba** (Manuel dos Reis Machado, 1900-1974)
- **Student of**: Mestre Bentinho
- **Founded**: Academia de Capoeira Regional (first legal Capoeira school)
- **Style**: Capoeira Regional (created the style)
- **Known for**: Systematizing Capoeira, structured pedagogy, bringing legitimacy
- **Notable students**:
  - Mestre Nenel (son, founded Filhos de Bimba)
  - Mestre Acordeon
  - Mestre Camisa (founded ABADÁ-Capoeira)
  - Mestre Eziquiel
  - Mestre Pirajá
  - Mestre Itapoan

### Example 3: Complex Multi-Lineage (Cordão de Ouro Network)

**Mestre Suassuna** (Reinaldo Ramos Suassuna, born 1938)
- **Student of**: Mestre Sururu, Mestre Abiné, Mestre Tonho Role (3 mestres!)
- **Co-founded**: Associação de Capoeira Cordão de Ouro (with Mestre Brasília)
- **Known for**: Musical innovation, international influence
- **Style**: Contemporânea (blend of Angola and Regional)

**Mestre Esquilo**
- **Student of**: Mestre Suassuna
- **Location**: Sete Lagoas, Brazil (Cordão de Ouro representative)
- **Notable students**:
  - Contra Mestre Cabeção

**Contra Mestre Cabeção**
- **Student of**: Mestre Esquilo
- **Founded**: Cai Na Capoeira (January 2012, Hudson Valley, NY)
- **Group affiliation**: Cordão de Ouro
- **Teaching**: 25+ years experience in Brazil, Israel, US
- **Assistant**: Instrutora Areia

**Instrutora Areia**
- **Training history**:
  - 2007: Began with Capoeira Mandinga Com Expressão (Rochester, NY)
  - Trained under: Professora Casca Dura (Cordão de Ouro)
  - 2011: Joined Cai Na Capoeira under Contra Mestre Cabeção
- **Example of**: Multiple lineage transitions, common in modern Capoeira

### Example 4: Group Founding with Multiple Founders

**Grupo Capoeira Brasil** (founded January 14, 1989)
- **Founders** (3 co-founders):
  - Mestre Boneco (Luiz Simas) - student of Mestre Peixinho
  - Mestre Paulinho Sabiá (Paulo A. S.) - student of Mestre Peixinho
  - Mestre Paulão Ceará (Paulo César) - student of Mestre Peixinho
- **Previous affiliation**: All came from Grupo Senzala
- **Style**: Contemporânea
- **Known for**: Innovative contemporary style, international reach
- **Current leader**: Mestre Boneco
- **Unique ranking**: Uses "Formando" and "Formado" instead of standard titles

### Example 5: Deceased Mestre with Managed Profile

**Mestre Barba Branca** (1956-2021) - Example of managed profile
- **Student of**: Mestre João Pequeno
- **Born**: March 28, 1956
- **Passed**: November 13, 2021
- **Style**: Angola
- **Use case**: Profile could be created/managed by:
  - His students who continue his lineage
  - Members of his group
  - Family members
  - Other mestres who knew him

---

## Group-to-Group Relationships

Beyond individual lineages, Capoeira groups themselves form complex networks of affiliation, succession, and organizational hierarchy. Understanding these relationships is crucial for building a complete genealogy tree.

### Terminology: Academia, Escola, Grupo, Associação

**There is no universally accepted definition** for when to use Academia, Escola, Grupo, or Associação - these terms are used somewhat interchangeably. However, patterns emerge:

**Academia (Academy)**
- Often refers to a physical school/training space
- Example: "Academia de Mestre Bimba" (Mestre Bimba's original school)
- Can be a single location or the headquarters of a larger network
- Sometimes used to denote more formal, structured teaching environments

**Escola (School)**
- Similar to Academia, often used for traditional or Angola-focused groups
- Example: "Escola Tradicional de Capoeira Angola"
- Emphasizes pedagogical mission and preservation of tradition

**Grupo (Group)**
- Most common term for Capoeira organizations
- Often used for organizations that span multiple locations
- Examples: "Grupo Capoeira Brasil", "Grupo Axé Capoeira", "Grupo Muzenza"
- Emphasizes community and shared identity across locations

**Associação (Association)**
- Often used for umbrella organizations or networks
- Example: "Associação de Capoeira Cordão de Ouro"
- May encompass multiple grupos or academias
- Sometimes has more formal legal/organizational structure

### Organizational Network Patterns

#### Pattern 1: Sede e Filiais (Headquarters and Branches)

The most common organizational structure:

```
Sede (Headquarters)
├─ Filial São Paulo (Branch in São Paulo)
├─ Filial Rio de Janeiro (Branch in Rio de Janeiro)
└─ Filial Internacional (International branches)
    ├─ Filial Nova York
    ├─ Filial Londres
    └─ Filial Tokyo
```

**Characteristics:**
- **Sede** (headquarters) is the original/main location, usually where founder teaches
- **Filiais** (branches) are satellite locations maintaining direct affiliation
- Branches typically:
  - Use the same name/branding
  - Follow the same curriculum and graduation system
  - Pay dues/fees to the parent organization
  - Send students to central events (batizados, workshops)
  - Have instructors who trained at the sede or with the founding mestre

**Real Example - ABADÁ-Capoeira:**
- Sede: Rio de Janeiro, Brazil (founded 1988 by Mestre Camisa)
- 80,000+ students across 70+ countries
- Filiais in every Brazilian state + 30 countries
- Centralized coordination through Mestre Camisa and regional coordinators
- Standardized ranking system across all branches

#### Pattern 2: Núcleos (Nuclei/Cores)

An organizational unit between a single location and a full branch:

```
Grupo Principal
├─ Núcleo Salvador (core group in Salvador)
├─ Núcleo Recife (core group in Recife)
└─ Núcleo Europa (European nucleus)
    ├─ Classes in Berlin
    ├─ Classes in Paris
    └─ Classes in Madrid
```

**Characteristics:**
- **Núcleo** = "nucleus" or "core" in Portuguese
- Represents a regional cluster of related activities
- May include multiple training locations under one coordinator
- More flexible than formal filial structure
- Common in large international organizations

**Real Example - ABADÁ-Capoeira:**
- Uses "núcleo" terminology extensively
- Each núcleo has a coordinator (often a Mestre or Contra-Mestre)
- Núcleos organize regional events and coordinate with headquarters
- Example: Grão Mestre Camisa Roxa coordinates European núcleos

#### Pattern 3: Affiliated Groups (Loose Network)

Groups maintain affiliation with a larger organization while retaining autonomy:

```
Cordão de Ouro (Parent Organization)
├─ Cai Na Capoeira (Affiliated, but independent)
│   └─ Founded by Contra Mestre Cabeção
│   └─ States affiliation with Cordão de Ouro
│   └─ Uses CDO curriculum but has own identity
├─ Other affiliated academias
└─ Independent instructors representing CDO
```

**Characteristics:**
- Group maintains its own name and identity
- States affiliation with parent organization ("somos Cordão de Ouro")
- May use parent's curriculum, philosophy, or ranking system
- Leader typically trained under parent organization's mestres
- Relationship can be formal (registered) or informal (cultural)

**Real Example - Cordão de Ouro:**
- Founded 1967 by Mestre Suassuna
- Has núcleos in Brazil and internationally
- Requests that professors, contramestres, and mestres register officially
- Maintains registry for "organization and control of affiliates"
- Some affiliates operate quite independently while maintaining connection

**Real Example - Cai Na Capoeira:**
- Founded 2012 by Contra Mestre Cabeção (Hudson Valley, NY)
- Explicitly states: "Academia: Associação de Capoeira Cordão de Ouro"
- Cabeção trained under Mestre Esquilo (CDO representative in Brazil)
- Has own name/branding but identifies as part of CDO network

#### Pattern 4: Group Succession/Splitting

Groups spawn from other groups, creating genealogical relationships:

```
Grupo Senzala (1960s, Rio de Janeiro)
    │
    ├─→ Grupo Capoeira Brasil (1989, founders were Senzala members)
    │   └─ Founded by Mestre Boneco, Paulão Ceará, Paulinho Sabiá
    │
    └─→ Other groups founded by Senzala graduates
```

**Characteristics:**
- Founding members trained together in parent group
- Split may be friendly (natural growth) or contentious (disagreement)
- New group often maintains some philosophical/stylistic DNA from parent
- Creates "lineage" of groups, not just people

**Real Example - Grupo Capoeira Brasil:**
- Founded January 14, 1989
- All three co-founders (Boneco, Paulão, Paulinho) came from Grupo Senzala
- All trained under Mestre Peixinho (Senzala)
- Created their own style: "Capoeira Regional Contemporânea"
- Now one of largest groups worldwide (40+ countries)

#### Pattern 5: Multi-Level Hierarchy (Organization → Association → Local Groups)

Complex organizational structures with multiple levels:

```
International Organization
└─ Regional Associations
    └─ Local Groups/Academias
        └─ Individual Training Locations
```

**Example Hierarchy:**
```
ABADÁ-Capoeira International (Organization)
├─ ABADÁ-Capoeira Brasil (National Association)
│   ├─ ABADÁ Rio de Janeiro (Regional Group)
│   │   ├─ Academia Sede (Headquarters)
│   │   ├─ Academia Copacabana
│   │   └─ Academia Tijuca
│   └─ ABADÁ São Paulo (Regional Group)
│       └─ Multiple academias
└─ ABADÁ-Capoeira North America (Regional Association)
    ├─ ABADÁ San Francisco (Local Group)
    │   ├─ SF Mission location
    │   └─ SF SOMA location
    ├─ ABADÁ Washington DC
    └─ ABADÁ New York
```

**Characteristics:**
- Multiple organizational tiers
- Each level has coordination/leadership
- Reporting structure upward to international headquarters
- Shared branding, curriculum, events across all levels
- Financial/administrative relationships between levels

### Regional Representatives and Coordinators

Large organizations use regional representatives to manage geographic expansion:

**Role: Regional Representative/Coordinator**
- Authorized by founding mestre to represent the organization in a region
- Typically holds rank of Mestre or senior Contra-Mestre
- Responsibilities:
  - Coordinate local núcleos/branches
  - Organize regional events
  - Approve new instructors in the region
  - Report to headquarters
  - Ensure quality control and adherence to organization's standards

**Example - Cordão de Ouro Structure:**
- Mestre Suassuna: Founder and international leader
- Mestre Esquilo: Representative in Sete Lagoas, Brazil
  - Teaches at local level
  - Graduates students (like Contra Mestre Cabeção)
  - Students may found their own affiliated groups

**Example - ABADÁ Structure:**
- Mestre Camisa: Founder, based in Rio de Janeiro
- Grão Mestre Camisa Roxa: European coordinator
  - Organizes "Jogos Europeus" (European games/events)
  - Coordinates multiple European núcleos
- Regional Mestres in North America, Asia, etc.

### Group Lifecycle: Formation, Growth, Succession

**Stage 1: Foundation**
- Mestre founds group (often after training in another group)
- Initial academy/escola established
- Students begin training

**Stage 2: Expansion - Branch Creation**
- Senior students move to new cities
- Open new locations (filiais) under parent organization's name
- Maintain connection through regular visits, shared events

**Stage 3: Regional Network**
- Multiple branches across region/country
- Need for coordination → appoint regional representatives
- Establish núcleos structure

**Stage 4: International Growth**
- Expansion beyond country of origin
- International coordinators appointed
- Adaptation to local contexts while maintaining identity

**Stage 5: Succession/Evolution**
- Original founder ages or passes away
- Successor(s) appointed or emergent
- Possible splits: some branches may become independent
- New groups may form from graduating students

### Database Implications

To capture these group-to-group relationships, we need:

**1. Group Hierarchy Table**
```typescript
export const groupHierarchy = pgTable('group_hierarchy', {
  id: uuid('id').defaultRandom().primaryKey(),

  // Which groups are related
  parentGroupId: uuid('parent_group_id').references(() => groups.id),
  childGroupId: uuid('child_group_id').references(() => groups.id),

  // Type of relationship
  relationshipType: groupRelationshipTypeEnum('relationship_type').notNull(),
  // Types: 'headquarters_branch', 'affiliation', 'split_from', 'merged_into', 'nucleus'

  // Temporal
  startedAt: date('started_at'),
  endedAt: date('ended_at'), // null if still active

  // Context
  notes: text('notes'),

  // Metadata
  createdAt: timestamp('created_at').notNull().defaultNow(),
});
```

**2. Groups Table Enhancements**
```typescript
export const groups = pgTable('groups', {
  // ... existing fields ...

  // Organizational structure
  organizationType: organizationTypeEnum('organization_type'),
  // Types: 'sede', 'filial', 'nucleo', 'affiliated', 'independent'

  parentOrganizationId: uuid('parent_organization_id').references(() => groups.id),
  // Direct parent in hierarchy (e.g., ABADÁ SF → ABADÁ International)

  // Registration/affiliation
  affiliatedWith: varchar('affiliated_with'),
  // Name of parent org (for informal affiliations)

  isHeadquarters: boolean('is_headquarters').default(false),
  // True if this is the sede/main location
});
```

**3. Group Roles Enhancement (Regional Representatives)**
```typescript
// Add to groupRoleTypeEnum:
'regional_coordinator',  // Coordinates region for parent organization
'international_representative', // Represents organization in a country
'nucleus_coordinator',   // Coordinates a nucleus/core group
```

### Real-World Group Network Examples

#### Example 1: ABADÁ-Capoeira Network

```
ABADÁ-Capoeira (HQ: Rio de Janeiro)
Founded: 1988 by Mestre Camisa
├─ Núcleo Brazil
│   ├─ Rio de Janeiro (Sede)
│   ├─ São Paulo
│   └─ 26+ other states
├─ Núcleo Europe (Coordinator: Grão Mestre Camisa Roxa)
│   ├─ Portugal
│   ├─ Germany (Berlin)
│   ├─ UK
│   └─ Others
├─ Núcleo North America
│   ├─ ABADÁ San Francisco
│   ├─ ABADÁ Washington DC
│   ├─ ABADÁ New York (Bronx)
│   ├─ ABADÁ Marin
│   └─ ABADÁ Florida
└─ Núcleos in 70+ countries total
```

**Data to capture:**
- ABADÁ International → has_branch → ABADÁ San Francisco (started 1998)
- Grão Mestre Camisa Roxa → regional_coordinator → Europe Núcleo
- ABADÁ San Francisco → affiliated_with → ABADÁ International

#### Example 2: Cordão de Ouro Network

```
Cordão de Ouro
Founded: 1967 by Mestre Suassuna
├─ Brazil
│   ├─ São Paulo (Sede)
│   ├─ Sete Lagoas (Mestre Esquilo)
│   └─ Multiple cities
├─ International Affiliates
│   ├─ USA
│   │   ├─ Las Vegas
│   │   ├─ Hawaii
│   │   └─ Cai Na Capoeira (Hudson Valley, NY)
│   │       Founded by Contra Mestre Cabeção
│   │       Lineage: Suassuna → Esquilo → Cabeção
│   ├─ South Africa
│   ├─ Norway
│   └─ UK
```

**Data to capture:**
- Cordão de Ouro → has_affiliate → Cai Na Capoeira (started 2012)
- Cai Na Capoeira → split_from → (none - original foundation)
- Mestre Esquilo → regional_representative → Sete Lagoas region
- Contra Mestre Cabeção → student_of → Mestre Esquilo

#### Example 3: Grupo Capoeira Brasil Network

```
Grupo Capoeira Brasil
Founded: 1989 by Mestre Boneco, Paulão Ceará, Paulinho Sabiá
Split from: Grupo Senzala
├─ Sede: Niterói, Brazil
├─ Brazil nationwide
├─ North America
│   ├─ Los Angeles (Mestre Boneco)
│   ├─ Burbank
│   └─ San Francisco (Mestre Aranha)
├─ Europe
├─ Asia
└─ 40+ countries total
```

**Data to capture:**
- Grupo Capoeira Brasil → split_from → Grupo Senzala (date: 1989-01-14)
- GCB Los Angeles → branch_of → GCB International
- Mestre Boneco → co_founder → Grupo Capoeira Brasil
- Mestre Boneco → student_of → Mestre Peixinho (Senzala)

### Query Examples for Group Relationships

**Query 1: Find all branches of a group**
```sql
SELECT
  child.name,
  child.location,
  gh.relationship_type,
  gh.started_at
FROM group_hierarchy gh
JOIN groups child ON child.id = gh.child_group_id
WHERE gh.parent_group_id = 'abada-international-id'
  AND gh.relationship_type = 'headquarters_branch'
  AND gh.ended_at IS NULL
ORDER BY gh.started_at;
```

**Query 2: Trace group lineage (which groups spawned from which)**
```sql
WITH RECURSIVE group_lineage AS (
  -- Base: Start with a group
  SELECT
    g.id,
    g.name,
    1 as generation
  FROM groups g
  WHERE g.name = 'Grupo Senzala'

  UNION ALL

  -- Recursive: Find groups that split from it
  SELECT
    g.id,
    g.name,
    gl.generation + 1
  FROM group_lineage gl
  JOIN group_hierarchy gh ON gh.parent_group_id = gl.id
  JOIN groups g ON g.id = gh.child_group_id
  WHERE gh.relationship_type = 'split_from'
)
SELECT * FROM group_lineage ORDER BY generation;

-- Result:
-- Grupo Senzala (generation 1)
-- → Grupo Capoeira Brasil (generation 2)
```

**Query 3: Find all affiliates of an organization**
```sql
SELECT
  child.name,
  child.location,
  gh.notes,
  u.name as founded_by
FROM group_hierarchy gh
JOIN groups child ON child.id = gh.child_group_id
LEFT JOIN users u ON u.id = child.created_by
WHERE gh.parent_group_id = 'cordao-de-ouro-id'
  AND gh.relationship_type = 'affiliation'
  AND gh.ended_at IS NULL;
```

### Challenges in Modeling Group Relationships

**Challenge 1: Ambiguous Affiliations**
- Some groups have informal affiliations (cultural, not contractual)
- How to distinguish between "official branch" and "inspired by"?
- Solution: Use `relationship_type` enum + `notes` field for context

**Challenge 2: Multiple Parent Organizations**
- Can a group be affiliated with multiple parent organizations?
- Rare, but possible (e.g., group practices both Angola and Regional)
- Solution: Allow multiple `group_hierarchy` records

**Challenge 3: Changing Affiliations**
- Groups may switch affiliations over time
- Instructor trained in Group A, founded Group B, later joined Group C's network
- Solution: Use `ended_at` field, allow historical records

**Challenge 4: Self-Identification vs Official Recognition**
- Group claims affiliation, but parent org doesn't recognize them
- Important for preventing fraudulent claims
- Solution: Add `verified_by` field, require admin approval for hierarchy claims

**Challenge 5: Naming Consistency**
- Same group may be known by different names in different regions
- "ABADÁ-Capoeira San Francisco" vs "ABADÁ SF" vs "ABADÁ São Francisco"
- Solution: Canonical name in DB + aliases/search optimization

---

## Database Schema Recommendations

### Core Principle: Separate Concerns

**Don't overload the `users` table.** Instead:
1. `users` table = authentication & basic profile
2. `person_profiles` table = extended biographical info (for everyone, not just managed profiles)
3. `person_relationships` table = M:N relationships between people
4. `group_roles` table = M:N relationships between people and groups (with roles and time periods)

### Recommended Schema

#### 1. Extended User Profiles Table

```typescript
// person_profiles - Extended biographical information
export const personProfiles = pgTable('person_profiles', {
  id: uuid('id').defaultRandom().primaryKey(),
  userId: uuid('user_id').references(() => users.id, { onDelete: 'cascade' }).notNull(),

  // Biographical info
  birthDate: date('birth_date'),
  birthPlace: varchar('birth_place'),
  passedDate: date('passed_date'), // null if still alive
  passedPlace: varchar('passed_place'),

  // Extended profile content
  biography: text('biography'), // Long-form description, background story
  achievements: text('achievements'), // Major accomplishments, awards
  style: styleEnum('primary_style'), // Primary style they practice/teach

  // Legacy/lineage importance
  isHistoricalFigure: boolean('is_historical_figure').default(false), // Mestre Bimba, Pastinha, etc.
  isManaged: boolean('is_managed').default(false), // True if admin-managed (not active account)
  managedBy: uuid('managed_by').references((): AnyPgColumn => users.id), // Which admin manages this

  // Metadata
  createdAt: timestamp('created_at').notNull().defaultNow(),
  updatedAt: timestamp('updated_at').notNull().$onUpdate(() => new Date()),
  verifiedAt: timestamp('verified_at'), // When profile was verified accurate
  verifiedBy: uuid('verified_by').references((): AnyPgColumn => users.id),
});

// NOTE: Every user gets a person_profile entry
// If isManaged = false → normal user profile
// If isManaged = true → admin-created profile (claimable)
```

**Key Design Decisions:**
- `userId` is NOT NULL - every profile belongs to a user record (even managed ones)
- Managed profiles use the same `users` table but with special status
- `biography` field allows rich storytelling (mestres' background stories)
- `isHistoricalFigure` helps surface important lineage figures
- Separate from `users` to avoid cluttering authentication table

#### 2. Person-to-Person Relationships Table

```typescript
// Enum for relationship types
export const relationshipTypeEnum = pgEnum('relationship_type', [
  'student_of',        // Primary student relationship
  'trained_under',     // Informal/short-term training
  'influenced_by',     // Studied methods without direct training
  'taught',            // Reverse of student_of (derived, for queries)
  'co_founded_with',   // Peer relationship, founded group together
  'trained_alongside', // Peer relationship, same generation/school
  'mentored',          // Informal mentorship (not formal student)
]);

// person_relationships - M:N relationships between people
export const personRelationships = pgTable('person_relationships', {
  id: uuid('id').defaultRandom().primaryKey(),

  // Who is related to whom
  personId: uuid('person_id').references(() => users.id, { onDelete: 'cascade' }).notNull(),
  relatedPersonId: uuid('related_person_id').references(() => users.id, { onDelete: 'cascade' }).notNull(),

  // Relationship metadata
  relationshipType: relationshipTypeEnum('relationship_type').notNull(),

  // Temporal information (optional but valuable)
  startedAt: date('started_at'), // When relationship began
  endedAt: date('ended_at'),     // When relationship ended (null if ongoing)

  // Context
  notes: text('notes'), // Additional context, e.g., "Trained primarily in Angola style"

  // Verification
  verifiedAt: timestamp('verified_at'),
  verifiedBy: uuid('verified_by').references(() => users.id),

  // Metadata
  createdAt: timestamp('created_at').notNull().defaultNow(),
  createdBy: uuid('created_by').references(() => users.id).notNull(), // Who recorded this relationship
}, (t) => [
  // Prevent duplicate relationships
  uniqueIndex('person_relationship_unique').on(t.personId, t.relatedPersonId, t.relationshipType),
  index('person_relationships_person_idx').on(t.personId),
  index('person_relationships_related_idx').on(t.relatedPersonId),
  index('person_relationships_type_idx').on(t.relationshipType),
]);
```

**Key Design Decisions:**
- Directed relationships: A is student of B (not bidirectional)
- Temporal dimension captures "trained from 1990-1995"
- Multiple relationship types between same two people (e.g., "trained_alongside" then later "taught")
- `verifiedBy` allows community verification of lineage claims
- `createdBy` tracks who added this information (accountability)

#### 3. Group Roles & Affiliations Table

```typescript
// Enum for roles within groups
export const groupRoleTypeEnum = pgEnum('group_role_type', [
  'founder',       // Founded the group
  'co_founder',    // Co-founded with others
  'leader',        // Current leader
  'director',      // Administrative director
  'mestre',        // Mestre affiliated with group
  'contra_mestre', // Contra-mestre affiliated with group
  'professor',     // Professor
  'instructor',    // Instructor
  'member',        // General member
  'representative', // Regional representative
  'student',       // Student member
]);

// group_roles - M:N relationships between people and groups with roles
export const groupRoles = pgTable('group_roles', {
  id: uuid('id').defaultRandom().primaryKey(),

  // Who and which group
  userId: uuid('user_id').references(() => users.id, { onDelete: 'cascade' }).notNull(),
  groupId: uuid('group_id').references(() => groups.id, { onDelete: 'cascade' }).notNull(),

  // Role information
  role: groupRoleTypeEnum('role').notNull(),

  // Temporal information
  startedAt: date('started_at'), // When they joined/assumed role
  endedAt: date('ended_at'),     // When they left (null if current)

  // Context
  notes: text('notes'), // E.g., "Regional representative for Northeast US"

  // Metadata
  createdAt: timestamp('created_at').notNull().defaultNow(),
  createdBy: uuid('created_by').references(() => users.id),
}, (t) => [
  index('group_roles_user_idx').on(t.userId),
  index('group_roles_group_idx').on(t.groupId),
  index('group_roles_role_idx').on(t.role),
  // Allow same person to have multiple roles in same group
  // (e.g., founder AND leader)
]);
```

**Key Design Decisions:**
- Replace simple `groups.founder` varchar with rich relationship data
- Captures role changes over time (e.g., someone was member, became instructor, then professor)
- Multiple simultaneous roles possible (founder + leader + mestre)
- Historical record: can see who founded a group even if they later left

#### 4. Update Groups Table

```typescript
// groups table changes
export const groups = pgTable('groups', {
  // ... existing fields ...

  // REMOVE: founder: varchar('founder') - replaced by group_roles table
  // KEEP: leader: uuid('leader_id') - for quick access, but also in group_roles

  // Add optional parent organization
  parentGroupId: uuid('parent_group_id').references((): AnyPgColumn => groups.id),

  // Academia/affiliation (e.g., "Cordão de Ouro" for Cai Na Capoeira)
  affiliatedWith: varchar('affiliated_with'), // Name of parent organization

  // ... rest of existing fields ...
});
```

#### 5. Profile Claims Table (New)

```typescript
// Enum for profile claim statuses
export const profileClaimStatusEnum = pgEnum('profile_claim_status', [
  'pending',
  'approved',
  'rejected',
]);

// profile_claims - Similar to group_claims but for claiming managed profiles
export const profileClaims = pgTable('profile_claims', {
  id: uuid('id').defaultRandom().primaryKey(),

  // Which managed profile is being claimed
  claimedUserId: uuid('claimed_user_id')
    .references(() => users.id, { onDelete: 'cascade' })
    .notNull(),

  // Who is claiming it (existing user account)
  claimerUserId: uuid('claimer_user_id')
    .references(() => users.id, { onDelete: 'set null' })
    .notNull(),

  // Status tracking
  status: profileClaimStatusEnum('status').notNull().default('pending'),
  requestedAt: timestamp('requested_at').notNull().defaultNow(),
  processedAt: timestamp('processed_at'),
  processedBy: uuid('processed_by').references(() => users.id),

  // Justification
  userMessage: text('user_message').notNull(), // Why they are this person
  adminNotes: text('admin_notes'), // Admin's decision notes

  // Verification evidence (optional)
  evidenceUrls: json('evidence_urls').$type<string[]>(), // Links to proof
}, (t) => [
  index('profile_claim_claimed_idx').on(t.claimedUserId),
  index('profile_claim_claimer_idx').on(t.claimerUserId),
  index('profile_claim_status_idx').on(t.status),
]);
```

**Key Design Decisions:**
- Similar workflow to group claims (proven pattern)
- `claimedUserId` = the managed profile being claimed
- `claimerUserId` = the active user account claiming it
- Upon approval, accounts merge (details in implementation spec)

### Data Model Diagram

```
┌─────────────┐
│   users     │
│  (core)     │
└──────┬──────┘
       │ 1:1
       ↓
┌─────────────────┐
│ person_profiles │  ← Extended bio info (everyone has this)
│  - biography    │
│  - birthDate    │
│  - isManaged    │
└─────────────────┘

       ↕ M:N (self-referencing through person_relationships)

┌──────────────────────┐
│ person_relationships │
│  - student_of        │
│  - trained_under     │
│  - influenced_by     │
│  - startedAt         │
│  - endedAt           │
└──────────────────────┘

       ↕ M:N (through group_roles)

┌─────────────┐
│   groups    │
│  - name     │
│  - style    │
└─────────────┘

┌──────────────┐
│ group_roles  │  ← Replaces simple "founder" field
│  - founder   │
│  - leader    │
│  - member    │
│  - startedAt │
│  - endedAt   │
└──────────────┘

┌──────────────────┐
│ profile_claims   │  ← Claiming workflow
│  - pending       │
│  - approved      │
└──────────────────┘
```

### Migration Strategy

**Phase 1: Extend Existing Schema (Non-Breaking)**
1. Add `person_profiles` table
2. Add `person_relationships` table
3. Add `group_roles` table
4. Add `profile_claims` table
5. Keep existing `groups.founder` field for backward compatibility

**Phase 2: Data Migration**
1. Create `person_profiles` entry for all existing users
2. Migrate `groups.founder` data to `group_roles` table
3. Mark migrated data as `verifiedBy = system`

**Phase 3: Deprecation (Future)**
1. Update all code to use new tables
2. Remove `groups.founder` field in future migration

---

## Query Patterns & Use Cases

### Use Case 1: Display User's Complete Lineage

**Question**: "Show me the lineage tree for Contra Mestre Cabeção"

```sql
-- Recursive CTE to build lineage tree upward
WITH RECURSIVE lineage AS (
  -- Base: Start with the person
  SELECT
    pr.id,
    pr.person_id,
    pr.related_person_id,
    pr.relationship_type,
    1 as generation,
    u.name,
    u.nickname,
    u.title
  FROM person_relationships pr
  JOIN users u ON u.id = pr.related_person_id
  WHERE pr.person_id = 'cabeção-user-id'
    AND pr.relationship_type = 'student_of'

  UNION ALL

  -- Recursive: Go up the tree
  SELECT
    pr.id,
    pr.person_id,
    pr.related_person_id,
    pr.relationship_type,
    l.generation + 1,
    u.name,
    u.nickname,
    u.title
  FROM person_relationships pr
  JOIN lineage l ON l.related_person_id = pr.person_id
  JOIN users u ON u.id = pr.related_person_id
  WHERE pr.relationship_type = 'student_of'
)
SELECT * FROM lineage ORDER BY generation DESC;

-- Result:
-- Mestre Suassuna (generation 4)
--   ↓
-- Mestre Esquilo (generation 3)
--   ↓
-- Contra Mestre Cabeção (generation 2)
--   ↓
-- Instrutora Areia (generation 1)
```

### Use Case 2: Find All Students of a Mestre

**Question**: "Who were Mestre Pastinha's students?"

```sql
SELECT
  u.id,
  u.name,
  u.nickname,
  u.title,
  pr.started_at,
  pr.ended_at,
  pr.notes
FROM person_relationships pr
JOIN users u ON u.id = pr.person_id
WHERE pr.related_person_id = 'pastinha-user-id'
  AND pr.relationship_type = 'student_of'
ORDER BY pr.started_at;

-- Result:
-- João Pequeno (trained 1920s-1940s)
-- João Grande (trained 1940s-1950s)
-- Many others...
```

### Use Case 3: Group History with Founders

**Question**: "Show me the founding history of Grupo Capoeira Brasil"

```sql
SELECT
  u.name,
  u.nickname,
  u.title,
  gr.role,
  gr.started_at,
  gr.notes
FROM group_roles gr
JOIN users u ON u.id = gr.user_id
WHERE gr.group_id = 'gcb-group-id'
  AND gr.role IN ('founder', 'co_founder')
ORDER BY gr.started_at;

-- Result:
-- Mestre Boneco (co_founder, 1989-01-14)
-- Mestre Paulinho Sabiá (co_founder, 1989-01-14)
-- Mestre Paulão Ceará (co_founder, 1989-01-14)
```

### Use Case 4: Person's Group Affiliation History

**Question**: "Show me Instrutora Areia's training history"

```sql
SELECT
  g.name as group_name,
  gr.role,
  gr.started_at,
  gr.ended_at,
  gr.notes
FROM group_roles gr
JOIN groups g ON g.id = gr.group_id
WHERE gr.user_id = 'areia-user-id'
ORDER BY gr.started_at;

-- Result:
-- Capoeira Mandinga Com Expressão (student, 2007, 2011, "Began training")
-- Cordão de Ouro - Rochester (student, 2008?, 2011, "Trained under Professora Casca Dura")
-- Cai Na Capoeira (instructor, 2011, present, "Joined as assistant instructor")
```

### Use Case 5: Find Common Lineage (Shared Teacher)

**Question**: "Do these two people share any teachers?"

```sql
SELECT
  u.name as shared_teacher,
  u.nickname,
  u.title
FROM person_relationships pr1
JOIN person_relationships pr2
  ON pr1.related_person_id = pr2.related_person_id
  AND pr1.relationship_type = pr2.relationship_type
JOIN users u ON u.id = pr1.related_person_id
WHERE pr1.person_id = 'person-a-id'
  AND pr2.person_id = 'person-b-id'
  AND pr1.relationship_type IN ('student_of', 'trained_under');

-- Example: João Pequeno and João Grande both studied under Pastinha
```

### Use Case 6: Style Lineage Tracing

**Question**: "Trace the Angola lineage from Mestre Benedito"

```sql
WITH RECURSIVE angola_tree AS (
  -- Base: Start with Benedito
  SELECT
    u.id,
    u.name,
    u.nickname,
    pp.primary_style,
    1 as generation,
    ARRAY[u.name] as lineage_path
  FROM users u
  JOIN person_profiles pp ON pp.user_id = u.id
  WHERE u.nickname = 'Mestre Benedito'

  UNION ALL

  -- Recursive: Find students
  SELECT
    u.id,
    u.name,
    u.nickname,
    pp.primary_style,
    at.generation + 1,
    at.lineage_path || u.name
  FROM angola_tree at
  JOIN person_relationships pr ON pr.related_person_id = at.id
  JOIN users u ON u.id = pr.person_id
  JOIN person_profiles pp ON pp.user_id = u.id
  WHERE pr.relationship_type = 'student_of'
    AND pp.primary_style = 'angola' -- Filter to Angola style
)
SELECT * FROM angola_tree ORDER BY generation, name;
```

---

## Implementation Priorities

### Phase 1: Core Relationships (MVP)
**Goal**: Capture basic lineage information

**Tables to implement:**
1. `person_profiles` (extended biographical info)
2. `person_relationships` (student-of relationships only)
3. `group_roles` (founder/leader/member only)

**Use cases enabled:**
- Display basic lineage tree (who trained under whom)
- Show group founders
- Basic biographical info for mestres

### Phase 2: Rich Relationships
**Goal**: Capture complex relationship types

**Enhancements:**
1. Add more `relationship_type` options (influenced_by, trained_alongside, etc.)
2. Add temporal data (startedAt, endedAt)
3. Add verification workflow

**Use cases enabled:**
- Multiple teachers
- Training history over time
- Peer relationships

### Phase 3: Claimable Profiles
**Goal**: Enable managed profiles and claiming

**Tables to implement:**
1. `profile_claims` (claiming workflow)
2. Add `isManaged` flag to `person_profiles`

**Use cases enabled:**
- Create profiles for deceased mestres
- Active users can claim their pre-made profiles
- Community can manage historical figures' profiles

### Phase 4: Advanced Features
**Goal**: Community verification and genealogy exploration

**Enhancements:**
1. Public lineage tree visualization
2. Community verification of relationships
3. Historical figure tagging
4. Style evolution tracking

**Use cases enabled:**
- Interactive "Capoeira family tree"
- Community-verified lineage claims
- Educational lineage browsing

---

## References & Data Sources

### Online Resources Consulted

1. **CapoeiraGens Database** (http://capogens.appspot.com)
   - Existing genealogy database for Capoeira
   - Uses click-to-traverse tree structure
   - Demonstrates demand for this feature

2. **Grupo Capoeira Brasil** (multiple sources)
   - Wikipedia: https://en.wikipedia.org/wiki/Grupo_Capoeira_Brasil
   - Demonstrates unique ranking system (Formando/Formado)

3. **Individual Group Websites**
   - Cai Na Capoeira (example in our data)
   - Various group "About Us" pages showing lineage descriptions

4. **Capoeira Style Documentation**
   - Angola vs Regional vs Contemporânea differences
   - Historical lineages traced to Pastinha and Bimba

### Existing Data Files

1. **packages/the-capoeira-list/data/generated/capoeira-lineage-with-descriptions.json**
   - Hand-curated lineage data
   - Shows person-to-person relationships
   - Includes biographical descriptions

2. **packages/the-capoeira-list/data/allcities20.txt** (too large to read fully)
   - Group import data with lineage notes
   - Examples of "student of" relationships

### Key Insights from Research

1. **Complexity is the norm**: Simple parent-child trees don't work. M:N relationships are standard.
2. **Time matters**: Relationships change over time (different teachers at different life stages)
3. **Roles are important**: Not just "member" - founder, leader, representative all have meaning
4. **Verification is critical**: Lineage claims need community verification to maintain integrity
5. **Gender-neutral storage**: Store titles as strings, don't hard-code gender
6. **Deceased vs Active**: Need to distinguish profiles of living vs deceased mestres
7. **Style differences**: Angola, Regional, Contemporânea have different cultures around lineage

---

## Appendix: Terminology Glossary

- **Mestre/Mestra**: Master, highest rank in Capoeira
- **Contra-Mestre/Contra-Mestra**: Counter-master, senior instructor, right hand to mestre
- **Professor/Professora**: Authorized instructor, can represent the group
- **Instrutor/Instrutora**: Assistant instructor
- **Graduado/Graduada**: Graduate, advanced student
- **Aluno/Aluna**: Student
- **Formando**: "Graduating" - used by Grupo Capoeira Brasil instead of Contra-Mestre
- **Formado**: "Graduated" - GCB's term for black cord (not yet Mestre)
- **Corda/Cordão**: Cord/belt used to indicate rank
- **Academia**: School/Academy (organization)
- **Grupo**: Group (organization)
- **Associação**: Association (umbrella organization)
- **Batizado**: Baptism ceremony where students receive first cord
- **Troca de Cordas**: Cord exchange/graduation ceremony
- **Roda**: Circle where Capoeira is played
- **Jogo**: Game/play (the actual Capoeira practice)
- **Malícia**: Cunning, trickery, street wisdom - valued especially in Angola
- **Mandinga**: Magic, spiritual power, ancestral wisdom

---

**End of Research Report**

**Next Steps**: Use this research to inform the implementation specification for the "Claimable Profiles" feature.

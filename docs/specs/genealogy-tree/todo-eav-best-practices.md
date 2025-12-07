# EAV/Triple-Store Best Practices for Genealogy Schema

> **Status**: Future improvements beyond prototype phase
> **Last Updated**: 2024-12-07

This document captures best practices from EAV (Entity-Attribute-Value) models, RDF triple stores, and knowledge graph implementations that should inform future development of the genealogy feature.

## Table of Contents

- [Current Implementation Assessment](#current-implementation-assessment)
- [Recommended Improvements](#recommended-improvements)
- [Implementation Priority](#implementation-priority)
- [Research Sources](#research-sources)

---

## Current Implementation Assessment

### What We're Doing Well

#### 1. Hybrid Approach
We correctly use a hybrid model where core entity attributes (name, birthYear, style) are in relational columns while relationships are in the EAV `statements` table. This follows the recommended pattern of keeping "critical to interpretation" fields relational.

**Reference**: [EAV Data Model Best Practices - Inviqa](https://inviqa.com/blog/understanding-eav-data-model-and-when-use-it)

#### 2. Typed Predicates
Using an enum for predicates (`predicateEnum`) prevents typos and maintains a controlled vocabulary, addressing a key EAV weakness where "every typo becomes a new attribute."

**Reference**: [EAV Anti-Pattern Discussion - Stack Exchange](https://softwareengineering.stackexchange.com/questions/93124/eav-is-it-really-bad-in-all-scenarios)

#### 3. Statement-Level Metadata (Reification)
We already have `confidence`, `source`, `notes`, `startedAt`, `endedAt` on statements. This is essentially **reification** - attaching metadata to relationships themselves, which is crucial for genealogical data with uncertain provenance.

**Reference**: [RDF Reification for Trustworthiness - PMC](https://pmc.ncbi.nlm.nih.gov/articles/PMC8634049/)

#### 4. Composite Indexes
Good indexing strategy with subject/predicate and object/predicate composite indexes matching common SPARQL query patterns (s-s joins, s-o joins).

**Reference**: [Querying Wikidata: Comparing Database Engines - Springer](https://link.springer.com/chapter/10.1007/978-3-319-46547-0_10)

#### 5. Typed Properties JSONB
`StatementProperties` provides predicate-specific metadata without schema bloat, similar to how RDF-star handles statement annotations.

---

## Recommended Improvements

### 1. Inverse Predicate Handling

**Problem**: In knowledge graphs, relationships often have inverses (`student_of` ↔ `teacher_of`). Currently we rely on query direction, but this creates API complexity.

**Options**:
- **A) Store both directions** - Data duplication, but simpler queries
- **B) Define inverse mappings** - Handle at query/API layer
- **C) Materialize inverses** - As a view or computed column

**Recommendation**: Option B - Create a `PREDICATE_INVERSES` mapping in code:

```typescript
// config/constants.ts
export const PREDICATE_INVERSES: Partial<Record<Predicate, { inverse: string; label: string }>> = {
  student_of: { inverse: 'teacher_of', label: 'Students' },
  baptized_by: { inverse: 'baptized', label: 'Baptized' },
  founded: { inverse: 'founded_by', label: 'Founded By' },
  member_of: { inverse: 'has_member', label: 'Members' },
  leads: { inverse: 'led_by', label: 'Led By' },
};
```

**Benefits**:
- No data duplication
- Enables bidirectional queries at API level
- UI can show "Students of X" and "Teachers of X" from same data

---

### 2. Transitive Closure for Lineage Queries

**Problem**: The most common genealogy query is "find all ancestors/descendants of X". Currently this requires recursive queries or multiple round trips.

**Best Practices from Wikidata**: SPARQL uses property paths (`wdt:P31/wdt:P279*`) for arbitrary-depth traversal.

**Options**:
- **A) Closure Table** - Pre-compute all ancestor-descendant pairs
- **B) Recursive CTE** - Compute on demand (current implicit approach)
- **C) Materialized Paths** - Store path strings like `/pastinha/joaoGrande/moraes`

**Recommendation**:

**Phase 1 (Prototype)**: Add a dedicated query function using PostgreSQL recursive CTE:

```typescript
// db/queries/genealogy.ts
export async function fetchLineage(
  personId: string,
  direction: 'ancestors' | 'descendants',
  maxDepth: number = 5
): Promise<{ person: SelectPersonProfile; depth: number; path: string[] }[]> {
  // Uses WITH RECURSIVE to traverse student_of/trained_under relationships
}
```

**Phase 2 (Production)**: Consider a closure table for `student_of`/`trained_under` lineage predicates:

```sql
CREATE TABLE genealogy.lineage_closure (
  ancestor_id UUID NOT NULL,
  descendant_id UUID NOT NULL,
  depth INTEGER NOT NULL,
  path UUID[] NOT NULL,
  PRIMARY KEY (ancestor_id, descendant_id)
);
```

**Reference**: [Wikidata SPARQL Tutorial - Property Paths](https://www.wikidata.org/wiki/Wikidata:SPARQL_tutorial)

---

### 3. Enhanced API Expansion Parameters

**Problem**: Our `includeRelationships=true` parameter is binary. Knowledge graph APIs typically offer more granular control.

**Current**:
```
GET /persons/123?includeRelationships=true
```

**Better Patterns**:

```typescript
// Selective expansion (JSON:API style)
GET /persons/123?expand=students,teachers,groups

// Depth-limited expansion
GET /persons/123?expand=lineage(depth=3,direction=ancestors)

// Or GraphQL-style
query {
  person(id: "123") {
    name
    students { name, title }
    teachers { name }
    lineage(depth: 3) { name, generation }
  }
}
```

**Recommendation**: Implement selective expansion with depth control:

```typescript
// Types
type ExpandOption =
  | 'students'      // People this person taught
  | 'teachers'      // People who taught this person
  | 'groups'        // Groups this person is associated with
  | 'lineage'       // Full ancestor/descendant tree
  | 'relationships' // All relationships (current behavior)

// API
GET /api/genealogy/persons/[personId]?expand=students,teachers&depth=2
```

---

### 4. Entity Resolution / SameAs Handling

**Problem**: Genealogy data often has the same person referenced differently across sources. Wikidata and other knowledge graphs use `owl:sameAs` or equivalent.

**Use Cases**:
- "Mestre Bimba" vs "Manuel dos Reis Machado" (same person, different names)
- Duplicate entries that need consolidation
- External links to other databases (Wikipedia, etc.)

**Options**:

**A) Add `same_as` predicate**:
```typescript
// Add to predicates array
'same_as' // person-to-person: indicates these are the same individual
```

**B) Dedicated alias/merge system**:
```sql
CREATE TABLE genealogy.entity_aliases (
  canonical_id UUID NOT NULL,
  alias_id UUID NOT NULL,
  alias_type TEXT, -- 'merged', 'alternate_name', 'external_reference'
  external_uri TEXT, -- For links to Wikipedia, etc.
  PRIMARY KEY (canonical_id, alias_id)
);
```

**Recommendation**: Start with the `same_as` predicate for simplicity, evolve to dedicated table if needed.

---

### 5. Bounded Graph Data Endpoint

**Problem**: Our `/api/genealogy/graph` returns ALL nodes and links, which won't scale.

**Best Practices**: Knowledge graph APIs always provide bounds.

**Recommended Parameters**:

```typescript
GET /api/genealogy/graph?
  center=<entityId>&          // Start from specific entity (optional)
  depth=2&                    // How many hops from center (default: 2)
  maxNodes=100&               // Limit result size (default: 100)
  maxLinks=500&               // Limit links (default: 500)
  nodeTypes=person,group&     // Filter node types
  predicates=student_of,founded  // Filter relationship types
```

**Implementation**:

```typescript
export async function fetchBoundedGraphData(options: {
  centerId?: string;
  centerType?: EntityType;
  depth?: number;
  maxNodes?: number;
  maxLinks?: number;
  nodeTypes?: EntityType[];
  predicates?: Predicate[];
}): Promise<GraphData>
```

**Reference**: [Wikidata Query Optimization](https://www.wikidata.org/wiki/Wikidata:SPARQL_query_service/query_optimization)

---

### 6. First-Class Provenance/Sources

**Problem**: Our `source` field is a string. For serious genealogical research, provenance should be first-class entities.

**Current**:
```typescript
statements.source: varchar // "Historical records, Wikipedia"
```

**Recommended Schema**:

```sql
CREATE TABLE genealogy.sources (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  -- Source identification
  type TEXT NOT NULL, -- 'oral_history', 'document', 'video', 'academic', 'website', 'book'
  title TEXT NOT NULL,
  author TEXT,

  -- Access information
  url TEXT,
  isbn TEXT,
  doi TEXT,

  -- Dates
  published_at DATE,
  accessed_at DATE,

  -- Reliability assessment
  reliability TEXT, -- 'primary', 'secondary', 'tertiary'
  notes TEXT,

  -- Metadata
  created_at TIMESTAMP DEFAULT NOW(),
  created_by UUID
);

-- Many-to-many: statements can have multiple sources
CREATE TABLE genealogy.statement_sources (
  statement_id UUID REFERENCES genealogy.statements(id) ON DELETE CASCADE,
  source_id UUID REFERENCES genealogy.sources(id) ON DELETE CASCADE,
  page_reference TEXT, -- Specific page/section
  quote TEXT, -- Relevant excerpt
  PRIMARY KEY (statement_id, source_id)
);
```

**Benefits**:
- Sources can be reused across statements
- Enables "show all claims from this source" queries
- Supports academic citation standards
- Allows reliability weighting in confidence calculations

**Reference**: [RDF Provenance Approaches Survey - Oxford Academic](https://academic.oup.com/dsh/advance-article/doi/10.1093/llc/fqaf076/8219704)

---

### 7. Query Optimization: Batch Fetching

**Problem**: Current API fetches statements separately from entities, causing N+1 query patterns.

**Current Pattern**:
```typescript
const persons = await fetchAllPersons();
const statements = await fetchAllStatements();
// Filter/join in JavaScript...
```

**Recommended Pattern**:

```typescript
// Single query with PostgreSQL JSON aggregation
export async function fetchGraphDataOptimized(options: GraphOptions): Promise<GraphData> {
  const result = await db.execute(sql`
    WITH relevant_statements AS (
      SELECT s.*
      FROM genealogy.statements s
      WHERE s.predicate = ANY(${options.predicates || predicates})
    ),
    involved_persons AS (
      SELECT DISTINCT p.*
      FROM genealogy.person_profiles p
      WHERE p.id IN (
        SELECT subject_id FROM relevant_statements WHERE subject_type = 'person'
        UNION
        SELECT object_id FROM relevant_statements WHERE object_type = 'person'
      )
    ),
    involved_groups AS (
      SELECT DISTINCT g.*
      FROM genealogy.group_profiles g
      WHERE g.id IN (
        SELECT subject_id FROM relevant_statements WHERE subject_type = 'group'
        UNION
        SELECT object_id FROM relevant_statements WHERE object_type = 'group'
      )
    )
    SELECT
      (SELECT json_agg(p.*) FROM involved_persons p) as persons,
      (SELECT json_agg(g.*) FROM involved_groups g) as groups,
      (SELECT json_agg(s.*) FROM relevant_statements s) as statements
  `);

  return transformToGraphData(result);
}
```

**Benefits**:
- Single round-trip to database
- Database handles filtering efficiently
- Reduces memory pressure on application server

---

## Implementation Priority

### Phase 1: Prototype Enhancements
1. **Add lineage traversal query** - `fetchLineage(personId, direction, depth)` using recursive CTE
2. **Enhance graph endpoint** - Add `center`, `depth`, `maxNodes` parameters
3. **Create predicate inverse mapping** - For cleaner bidirectional queries in UI

### Phase 2: Production Readiness
4. **Implement selective expansion** - Replace boolean `includeRelationships` with granular `expand` parameter
5. **Add `same_as` predicate** - For entity resolution
6. **Optimize batch fetching** - Single-query graph data retrieval

### Phase 3: Research-Grade Features
7. **Create sources table** - First-class citation management
8. **Consider closure table** - For frequently-queried lineage paths
9. **Add external URI linking** - Connect to Wikipedia, other capoeira databases

---

## Research Sources

### EAV/Data Modeling
- [EAV Data Model Best Practices - Inviqa](https://inviqa.com/blog/understanding-eav-data-model-and-when-use-it)
- [Guidelines for EAV in Biomedical Databases - PMC](https://pmc.ncbi.nlm.nih.gov/articles/PMC2110957/)
- [Entity-Attribute-Value Model - Wikipedia](https://en.wikipedia.org/wiki/Entity–attribute–value_model)
- [EAV Discussion - Software Engineering Stack Exchange](https://softwareengineering.stackexchange.com/questions/93124/eav-is-it-really-bad-in-all-scenarios)
- [EAV vs Relational - wq Framework](https://wq.io/guides/eav-vs-relational)

### RDF/Triple Stores
- [Triplestore - Wikipedia](https://en.wikipedia.org/wiki/Triplestore)
- [RDF Triple Stores vs Property Graphs - Neo4j](https://neo4j.com/blog/knowledge-graph/rdf-vs-property-graphs-knowledge-graphs/)
- [Survey of RDF Stores & SPARQL Engines - arXiv](https://arxiv.org/pdf/2102.13027)

### Knowledge Graphs & SPARQL
- [Wikidata SPARQL Query Service](https://www.wikidata.org/wiki/Wikidata:SPARQL_query_service)
- [Wikidata SPARQL Tutorial](https://www.wikidata.org/wiki/Wikidata:SPARQL_tutorial)
- [Wikidata Query Optimization](https://www.wikidata.org/wiki/Wikidata:SPARQL_query_service/query_optimization)
- [Querying Wikidata: Comparing Databases - Springer](https://link.springer.com/chapter/10.1007/978-3-319-46547-0_10)
- [Wikidata Graph Pattern Benchmark - AllegroGraph](https://allegrograph.com/wikidata-benchmark/)

### Reification & Provenance
- [Singleton Property vs Reification - PMC](https://pmc.ncbi.nlm.nih.gov/articles/PMC4350149/)
- [RDF Reification for Trustworthiness - PMC](https://pmc.ncbi.nlm.nih.gov/articles/PMC8634049/)
- [Benchmarking RDF Metadata Representations - IEEE](https://ieeexplore.ieee.org/document/9364401)
- [Provenance with RDF-star - Metaphacts](https://blog.metaphacts.com/citation-needed-provenance-with-rdf-star/)
- [Provenance Context Entity (PaCE) - PMC](https://pmc.ncbi.nlm.nih.gov/articles/PMC4303908/)
- [Representing Provenance in RDF - Oxford Academic](https://academic.oup.com/dsh/advance-article/doi/10.1093/llc/fqaf076/8219704)

### Named Graphs
- [Named Graph Pattern - Data Incubator](https://patterns.dataincubator.org/book/named-graphs.html)

---

## Design Questions for Future Consideration

1. **Lineage depth**: What's the typical use case - showing 2-3 generations or full ancestry trees?

2. **Graph visualization**: Will we use D3.js force-directed, a tree layout, or something else? This affects optimal data shape.

3. **Sources/citations**: How important is tracking WHERE each piece of information came from?

4. **Query patterns**: What queries will be most common?
   - "Show me this person's teachers"
   - "Show me everyone in this lineage"
   - "Show me the full network"
   - "Find path between two people"

5. **External linking**: Should we support linking to external databases (Wikipedia, other capoeira archives)?

6. **Versioning**: Do we need to track changes to statements over time (who changed what, when)?

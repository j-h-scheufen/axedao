# Case Study Second-Pass Review Instructions

**Purpose:** Systematically review each case study against the genealogy data model proposal to validate completeness, identify missing relationships, and ensure the predicates accurately capture real-world scenarios from the admin perspective.

**Context:** The data model in `/docs/specs/genealogy-data-model-proposal.md` was derived from an initial pass through all 33 case studies. Due to context limitations during that pass, some nuances may have been missed. This second pass reviews each case study individually with full context.

---

## Case Studies to Review (33 total)

1. abada-capoeira.md
2. acad-angola-dobrada.md
3. angoleiros-do-sertao.md
4. cai-na-capoeira.md
5. capoeira-angola-center-kibera-kenya.md
6. capoeira-angola-nzinga-germany.md
7. capoeira-aruanda-australia.md
8. capoeira-batuque-japao.md
9. capoeira-beira-mar.md
10. capoeira-longe-do-mar-mexico.md
11. capoeira-mandinga-aotearoa.md
12. capoeira-mandinga-hangzhou.md
13. capoeira-zoador-japan.md
14. ceca-academia-joao-pequeno.md
15. cordao-de-ouro.md
16. escola-capoeira-angola-okupandula-angola.md
17. escola-nestor-capoeira.md
18. escravos-brancos-teresina-piaui.md
19. fica-hawaii-icaf.md
20. filhos-de-angola.md
21. gcaig-irmaos-guerreiros.md
22. gcap-grupo-capoeira-angola-pelourinho.md
23. grupo-axe-capoeira.md
24. grupo-candeias-goiania-brazil.md
25. grupo-capoeira-brasil.md
26. grupo-muzenza.md
27. grupo-oriaxe-argentina.md
28. grupo-senzala.md
29. grupo-zimba-teresina-piaui.md
30. joao-grande-capoeira-angola-center.md
31. mandingueiros-dos-palmares.md
32. marinheiro-russia.md
33. ngoma-capoeira-angola.md

---

## Current Predicate Reference

### Person-to-Person Predicates (7)

#### Training & Lineage
| Predicate | Description |
|-----------|-------------|
| `student_of` | Current, active primary student-teacher relationship |
| `trained_under` | Historical/past training (workshops, seminars, guest instruction) |
| `influenced_by` | Studied methods/philosophy without direct training |

> **Note:** `trained_alongside` was removed. Peer relationships ("capoeira siblings") are derivable from temporal overlap of training statements.
>
> **Note:** `successor_to` was removed. "Succession" lacks context without knowing which group/role. Leadership succession is derivable from sequential `leads` statements. Teaching lineage succession is implicit in `student_of`.

#### Mentorship & Recognition
| Predicate | Description |
|-----------|-------------|
| `mentored` | Informal guidance beyond formal student relationship |
| `received_title_from` | Person received title/rank FROM mestre. Use `title_grant` property with `TitleEnum` |
| `baptized` | Bestowed apelido (nickname) at batizado. Use `baptism` property with `apelido_given` |

> **Note:** `blessed_departure` was removed. Blessed departures are captured at the group level via `split_from_group` with `split_type: 'blessed'` and `blessed_by[]` property.

#### Family
| Predicate | Description |
|-----------|-------------|
| `family_of` | Family relationship. Use `family` property with `relationship_type` |

**`family_of` relationship types:**
- `parent` - Biological parent (child derived as inverse)
- `sibling` - Biological sibling (symmetric)
- `spouse` - Married or life partner (symmetric)
- `padrinho` - Godfather/godmother - capoeira ceremonial role (directional)
- `other` - Other family (use `other_type` property, e.g., "cousin", "uncle")

> **Note:** `biological_parent_of`, `biological_child_of`, `sibling_of`, `spouse_of`, and `padrinho_of` were consolidated into `family_of`.
>
> **Note:** `childhood_friends_with` and `worked_together_with` were removed. Non-capoeira relationships can be captured in biography fields. Peer training is derivable from shared `student_of` statements.
>
> **Note:** Co-founders are derived from multiple `co_founded` person-to-group statements on the same group.
>
> **Note:** `split_from_person` was removed. Person splits are captured by `departed_from` (person-to-group) with `departure_type` property.

---

### Person-to-Group Predicates (10)

#### Founding & Leadership
| Predicate | Description |
|-----------|-------------|
| `founded` | Created/established the group |
| `co_founded` | Equal partner in founding |
| `leads` | Current primary leader/coordinator |
| `regional_coordinator_of` | Coordinates region for international group |

> **Note:** `successor_leader_of` was removed. Leadership succession is derivable from sequential `leads` statements with timeline (Person A's `leads` ends when Person B's `leads` begins).
>
> **Note:** `international_representative_of` was removed. Representatives are captured by `teaches_at`/`leads` with timeline.

#### Membership & Affiliation
| Predicate | Description |
|-----------|-------------|
| `member_of` | General formal membership (implies training) |
| `teaches_at` | Active instructor at group (with title/rank as property) |
| `cultural_pioneer_of` | First to bring capoeira to region/country for this group |
| `associated_with` | Loose/informal affiliation. Use `association_type` property |
| `graduated_from` | Completed training/batizado at group (no longer member) |
| `departed_from` | Left group. Use `departure_type` property: neutral, blessed, contentious, expelled |

**`associated_with` association types:**
- `supporter` - Supports the group without formal membership
- `patron` - Financial or influential supporter
- `informal_affiliate` - Trains occasionally, not registered member
- `friend` - Friend of the group/mestre
- `honorary` - Honorary association (recognized but not active)

> **Note:** `studies_at` was removed. Formal membership (`member_of`) implies training.
>
> **Note:** `individual_member_of` was replaced by `associated_with` with `association_type` property.
>
> **Note:** `expelled_from` was consolidated into `departed_from` with `departure_type: 'expelled'` property.

---

### Group-to-Group Predicates (8)

#### Hierarchical/Organizational
| Predicate | Description |
|-----------|-------------|
| `part_of` | Hierarchical organizational relationship. Use `affiliation_type` property |

> **Affiliation types:** `branch`, `nucleus`, `affiliate`, `official_filial`
>
> **Note:** `headquarters_of`, `branch_of`, `nucleus_of`, `affiliate_of`, `official_filial_of` consolidated into `part_of`.

#### Evolution & Succession
| Predicate | Description |
|-----------|-------------|
| `split_from_group` | Group formed by splitting from parent. Use `split_type` property: neutral, blessed, contentious |
| `merged_into` | Group merged into another |
| `absorbed` | Group absorbed another (inverse) |
| `succeeded` | Group continues legacy of defunct group |
| `evolved_from` | Significant organizational transformation (NOT simple name changes) |

> **Note:** `blessed_split_from` was consolidated into `split_from_group` with `split_type: 'blessed'` property.
>
> **Note:** `evolved_from` is for genuine organizational transformations where a new entity emerges. For **name changes within the same organization** (e.g., "Marrom e Alunos" → "Ngoma"), use the `name_history` field on the groups table instead.

#### Affiliation & Cooperation
| Predicate | Description |
|-----------|-------------|
| `affiliated_with` | Formal or cultural affiliation |
| `cooperates_with` | Regular cooperation without formal structure |

> **Note:** `shares_lineage_with` was removed. Shared lineage is derivable from graph traversal.

---

## Review Process

### Step 1: Read the Case Study
Read the entire case study file to understand:
- Who founded the group
- Their lineage (who they trained under)
- The group's organizational structure
- Key relationships mentioned
- Unique patterns or situations

### Step 2: Answer the Key Questions

For each case study, systematically answer these questions:

#### A. Founding & Leadership
1. **Who founded the group?** Solo founder or co-founders?
2. **What was the founding context?** Split, original, succession, merger?
3. **Who are the current leaders?** Have there been leadership transitions?
4. **Does leadership involve family (biological) relationships?**

#### B. Lineage Relationships
5. **Who did the founder(s) train under?** Primary teacher vs. multiple influences?
6. **Were there peer relationships?** Training alongside others who became notable?
7. **Are there successor relationships?** Was anyone designated to carry on a legacy?
8. **Any "blessed departures" mentioned?** Formal permission to start their own path?

#### C. Group Structure
9. **What is the organizational model?** Branches, núcleos, affiliates, independent schools?
10. **Are there hierarchical relationships to other groups?** Parent org, headquarters?
11. **Did this group split from another?** Amicably or contentiously?
12. **Are there documented affiliate relationships?**

#### D. Special Cases
13. **Any "orphaned node" situations?** Untraceable lineage?
14. **Any style transitions?** Changed from Regional to Angola or vice versa?
15. **Pioneer period pattern?** Informal teaching before formal group?
16. **Any conflicting information?** Multiple sources disagree?

### Step 3: Admin Perspective Check

Put yourself in the shoes of this group's likely admin (probably the group leader or a senior member). Ask:

1. **"How would I set up my mestre's lineage?"**
   - Which predicate(s) would I use?
   - Is the distinction between `student_of` and `trained_under` clear enough?
   - Would I know which one to pick?

2. **"How would I connect my group to our parent organization?"**
   - Is `branch_of` vs `nucleus_of` vs `affiliate_of` clear?
   - Do I understand the hierarchical implications?

3. **"How would I record our founder's story?"**
   - Can I capture the full founding narrative?
   - Are there relationships that are hard to express?

4. **"Are there important relationships I can't represent?"**
   - Something mentioned in the case study that has no predicate?
   - A nuance that gets lost with current predicates?

### Step 4: Reciprocal Relationship Analysis

For each relationship type found in the case study:

1. **Is it naturally bidirectional?**
   - `sibling_of` → yes (if A is sibling of B, B is sibling of A)
   - `student_of` → no (inverse would be "teacher_of")

2. **Does the model handle the inverse correctly?**
   - We derive inverses via queries, not storage
   - Is this approach sufficient for this case?

3. **Would the admin need to enter both directions?**
   - Ideally NO - one-sided entry should suffice
   - If both parties need to manage, does confidence/verification handle this?

4. **What if one party disputes the relationship?**
   - Example: Person A claims `student_of` Person B, but B doesn't recognize A
   - Does `disputed` confidence level handle this?

### Step 5: Document Findings

For each case study, produce a summary:

```markdown
## [Case Study Name]

### Relationships Identified
- [List the key relationships mentioned in the case study]
- [Map each to the proposed predicate]

### Validation Results
- ✅ **Covered:** [Relationships well-captured by existing predicates]
- ⚠️ **Needs Clarification:** [Relationships that fit awkwardly]
- ❌ **Missing:** [Relationships with no good predicate match]

### Admin Perspective Notes
- [How would this group's admin set things up?]
- [Any confusion or ambiguity they might face?]

### Reciprocal Relationship Notes
- [Any special considerations for inverse relationships?]

### Proposed Changes (if any)
- [New predicates needed]
- [Predicate renames or clarifications]
- [Property additions]
```

---

## Decision Framework

When evaluating whether to add/change predicates:

### Add a New Predicate IF:
1. Multiple case studies show the same pattern AND
2. No existing predicate captures it well AND
3. The distinction is semantically important (not just a label difference)

### Modify Existing Predicate IF:
1. The name is confusing or misleading AND
2. A clearer name exists AND
3. The change doesn't break existing meanings

### Use Properties Instead IF:
1. The relationship type is the same but details differ
2. Example: `teaches_at` with `{title: 'mestre'}` vs `{title: 'professor'}`

### Accept Current Model IF:
1. Existing predicates can express the relationship
2. Even if not a perfect semantic match, it's "close enough"
3. Adding more predicates would create more confusion

---

## Patterns to Watch For

Based on the initial analysis, be especially attentive to:

1. **Co-founder dynamics** - How they split, reconcile, or continue together
2. **Family capoeira** - Biological relationships intertwined with training
3. **International expansion** - Pioneer patterns, representative roles
4. **Informal → formal transitions** - Pioneer periods, núcleo → branch evolution
5. **Cross-group training** - People who trained under multiple mestres from different groups
6. **Generational succession** - How leadership passes (designated vs. assumed)
7. **Name/identity changes** - Groups that evolved, merged, or rebranded
8. **"Orphaned" lineages** - Where the trail goes cold
9. **Dispute patterns** - Contentious splits, expelled members, claimed relationships

---

## Output Format

After reviewing each case study, provide:

1. **Summary of key relationships** from the case study
2. **Mapping to predicates** - which predicates apply
3. **Gaps or issues** - what doesn't fit well
4. **Recommendations** - specific changes to propose (if any)
5. **Confidence** - how certain are you about the analysis

Keep responses focused and actionable. The goal is to either:
- Confirm the model handles this case well, OR
- Propose specific, justified changes

---

## Session Management

Due to context limits, process ONE case study per session turn. After presenting findings, await user feedback before proceeding to the next.

**Workflow:**
1. Read case study file
2. Apply the review process above
3. Present findings in the documented format
4. Await user decision on proposed changes
5. (If changes approved) Note them for later incorporation
6. Proceed to next case study

This ensures thorough analysis without context overflow.

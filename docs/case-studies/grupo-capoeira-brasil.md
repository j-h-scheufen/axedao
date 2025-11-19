# Case Study: Grupo Capoeira Brasil

**Date**: 2025-11-19
**Founded**: January 14, 1989
**Location**: Rio de Janeiro, Brazil (global presence)
**Style**: Capoeira Regional Contemporânea
**Scale**: International (Brazil, Australia, China, France, Germany, Hong Kong, USA, and more - 40+ countries)

---

## IMPORTANT DISCLAIMER

**Limited Scope**: This case study examines ONE group out of hundreds (possibly thousands) of Capoeira organizations worldwide.

**Not Representative**: Observations here reflect only Grupo Capoeira Brasil's specific structure and history. Other groups may have completely different organizational models.

**Preliminary Research**: All insights are preliminary and based on publicly available information. Community verification is essential before drawing any general conclusions about Capoeira organizational patterns.

**No Universal Patterns**: Capoeira Brasil's "blessed split" from Senzala represents one type of group formation, but this does not mean it's a common pattern. Further research across diverse group types is required.

---

## Founding History

### The Founders (Three Senzala Red Cords)

**Founded January 14, 1989** by three Mestres who had all trained under Grupo Senzala:

1. **Mestre Boneco** (Luis Roberto Simas)
2. **Mestre Paulinho Sabiá** (Paulo César da Silva Sousa)
3. **Mestre Paulão Ceará** (Paulão Sales Neto)

### Lineage Chain

**Direct lineage**:
- Mestre Bimba → Grupo Senzala founders → Mestre Camisa → Boneco/Sabiá/Ceará → Grupo Capoeira Brasil

**Generational structure**:
1. **First Generation**: Mestre Bimba (legendary founder of Regional)
2. **Second Generation**: Grupo Senzala (Paulo, Rafael, Gilberto Flores + others, 1963)
3. **Third Generation**: Mestre Camisa (Senzala red belt)
4. **Fourth Generation**: Boneco, Sabiá, Ceará (Camisa's students, Senzala red belts)
5. **New Branch**: Grupo Capoeira Brasil (1989)

---

## Context: The Late 1980s Senzala Schism

### Why They Left Senzala

**"Different ideologies"**: During the late 1980s, many of Grupo Senzala's "Corda Vermelhas" (Red Cords - highest graduation) left to pursue their own work due to ideological differences.

**What the ideological differences were**: Not documented in available sources, but could include:
- Teaching methodology disagreements
- Organizational structure preferences
- Geographic expansion strategies
- Financial/commercial approaches
- Stylistic evolution (Contemporânea vs. traditional Regional)

**Important**: This was NOT a hostile split or unauthorized use of Senzala's name. It was a **formalized, blessed departure**.

### The "Padrinhos" (Godfathers) - Formal Blessing

Grupo Capoeira Brasil was inaugurated **"under the supervision and blessing of its padrinhos"**:

**Senzala founders who blessed the new group**:
- **Mestre Gato** (original Senzala founder)
- **Mestre Peixinho** (original Senzala founder)
- **Mestre Rafael Flores** (original Senzala founder, one of the three Flores brothers)

**Additional elders who blessed the founding**:
- **Mestre Suassuna** (founder of Cordão de Ouro)
- **Mestre Itapoã**
- **Mestre Ezekiel** (deceased)

### Implications

**This "padrinho" structure shows**:
1. Respect for lineage and elders (seeking blessing, not defying)
2. Formal approval process for creating new groups
3. Acknowledgment that ideological differences are acceptable
4. Maintenance of relationships despite organizational separation
5. Cross-group connections (Suassuna from CDO blessing Senzala students)

**Not observed in other groups studied**: This formalized "blessing" relationship appears unique among the case studies so far.

---

## Organizational Structure

### Leadership Model

**Three co-founders**, similar to Senzala's original three Flores brothers but different from Senzala's current collaborative red belt model.

**Primary founder/leader**: Mestre Boneco appears to be the primary leader or most publicly visible founder:
- Los Angeles branch describes itself as "a branch of Mestre Boneco's arm in the group"
- Boneco's name appears first in most listings
- Suggests possible hierarchy among the three co-founders (unlike Senzala's co-equal red belts)

**Unclear**:
- Are all three co-founders equal, or is Boneco primary?
- Do Sabiá and Ceará lead their own "arms" of the group?
- Is there a central headquarters or council?

### International Expansion - Branch Model

**Geographic presence** (40+ countries):
- **Brazil**: Multiple locations (Rio de Janeiro, São Paulo, etc.)
- **North America**: USA (Los Angeles, San Francisco, East Bay, etc.)
- **Europe**: France, Germany
- **Asia**: China, Hong Kong
- **Oceania**: Australia
- **Caribbean**: Curacao

**Branch structure** (Los Angeles example):
- "We are a branch of Mestre Boneco's arm in the group"
- Suggests hierarchical relationship: Mestre Boneco → regional "arms" → local branches
- Each branch led by instructors/professors under Boneco's supervision

**Unclear**:
- Do branches operate autonomously or require central approval?
- Is there a licensing/certification system (like CDO's Certificado de Alvará)?
- How are new branches authorized?

### Legal Structure (USA)

**501(c)(3) Non-Profit** (at least in USA locations):
- **Benção Brasil**: Cultural center operating as 501(c)(3)
- Described as "commitment to bringing the culture of Brazil and the art of Capoeira to the communities of Southern California"
- Emphasis on "cultural awareness, health, fitness and fun"

**Program structure** (Los Angeles example):
1. **Adult Program**
2. **Youth Program**
3. **Tiny Tots** (children under 6)

**Implications**:
- Community-focused, not commercial
- Tax-exempt status in USA
- Educational/cultural mission
- Similar to Ngoma's donation-based community model (but at much larger scale)

---

## Style: Capoeira Regional Contemporânea

### Lineage Influences

**Drawing from multiple sources**:
1. **Mestre Bimba's Regional**: Via Senzala lineage
2. **Senzala's Contemporânea**: Training under Mestre Camisa
3. **Traditional Angola**: Mentioned as influence alongside Regional

**"Contemporânea" style**:
- Modern evolution of Capoeira
- Blends Regional and Angola elements
- Emphasizes contemporary interpretation
- Not bound strictly to Bimba's or Pastinha's original forms

### Comparison with Other Groups

- **Senzala**: Regional/Contemporânea (pioneers of Contemporânea in 1960s-70s)
- **Capoeira Brasil**: Regional Contemporânea (continuing Senzala's evolution)
- **Muzenza**: Teaches both Angola and Regional (dual style)
- **ABADÁ**: Blends Regional and Angola with modernization
- **Ngoma**: Exclusively Angola (traditional)
- **Cordão de Ouro, Axé**: Primarily Regional

---

## Data Model Insights

### 1. Blessed Split / Padrinho Relationship

**New relationship types needed**:

```typescript
// Person-to-person: Elder blesses younger mestre's new group
person_relationships: {
  relationship_type: 'padrinho',  // Godfather blessing
  from_person_id: uuid,           // Mestre Gato, Peixinho, Rafael Flores, Suassuna, etc.
  to_person_id: uuid,             // Boneco, Sabiá, Ceará
  context: 'blessed_new_group_founding',
  blessed_at: Date                // January 14, 1989
}

// Group-to-group: New group created with parent's blessing
group_relationships: {
  relationship_type: 'blessed_split',
  parent_group_id: uuid,          // Grupo Senzala
  child_group_id: uuid,           // Grupo Capoeira Brasil
  split_reason: 'ideological_difference',
  is_amicable: boolean,           // true
  blessed_by: uuid[],             // Array of person_ids who gave blessing
  split_date: Date                // January 14, 1989
}
```

### 2. Generational Lineage Tracking

**Four generations documented**:
1. Bimba (first generation, Regional founder)
2. Senzala founders (second generation, 1963)
3. Mestre Camisa (third generation, Senzala student)
4. Boneco/Sabiá/Ceará (fourth generation, Camisa's students)
5. Current students of Capoeira Brasil (fifth generation)

**Schema needs**:
```typescript
// Track generational distance from legendary figures
person_profiles: {
  generation_from_bimba?: number,    // Boneco = 4 generations
  generation_from_pastinha?: number, // For Angola lineages
  lineage_chain: string[]            // ["Bimba", "Senzala", "Camisa", "Boneco"]
}
```

### 3. Branch Hierarchies ("Arms" of the Group)

**Structure observed**:
- Mestre Boneco has an "arm" (regional division)
- Los Angeles branch is "a branch of Mestre Boneco's arm"
- Suggests: Founder → Regional Arms → Local Branches

**Schema consideration**:
```sql
-- Hierarchical group relationships
CREATE TYPE branch_level AS ENUM ('headquarters', 'regional_arm', 'local_branch', 'affiliate');

CREATE TABLE group_hierarchies (
  id uuid PRIMARY KEY,
  parent_group_id uuid REFERENCES groups(id),
  child_group_id uuid REFERENCES groups(id),
  branch_level branch_level,
  responsible_mestre_id uuid REFERENCES person_profiles(id),  -- e.g., Boneco for his "arm"
  established_at Date,
  UNIQUE(child_group_id)  -- Each group has only one parent
);
```

### 4. Cross-Group Elder Blessing

**Mestre Suassuna (CDO) blessed Senzala students' new group**:
- Shows inter-group relationships
- Elders from different organizations support new generations
- Not limited to parent group's approval

**Relationship consideration**:
```typescript
// Elders from DIFFERENT groups can bless new groups
person_relationships: {
  relationship_type: 'cross_group_blessing',
  from_person_id: uuid,        // Mestre Suassuna (CDO)
  to_person_id: uuid,          // Boneco (forming Capoeira Brasil from Senzala)
  from_group_id: uuid,         // Cordão de Ouro
  to_new_group_id: uuid,       // Grupo Capoeira Brasil
  context: 'elder_support_for_new_group'
}
```

### 5. Non-Profit Legal Structure

**501(c)(3) status**:
- Not all groups are commercial enterprises
- Some operate as cultural/educational non-profits
- Mission-driven vs. profit-driven

**Field consideration**:
```typescript
groups: {
  legal_structure: 'for_profit' | 'non_profit_501c3' | 'non_profit_other' | 'informal' | 'association',
  tax_exempt: boolean,
  mission_statement?: string,
  non_profit_focus?: string[]  // ['cultural_preservation', 'youth_education', 'community_health']
}
```

### 6. Program Differentiation (Age-Based)

**Three program tiers** (Los Angeles):
- Adult Program
- Youth Program
- Tiny Tots (under 6)

**Could inspire**:
- Event categorization by age group
- Program offerings at different locations
- Not critical for genealogy tree but relevant for group characteristics

---

## Comparison with Other Groups Studied

| Aspect | Capoeira Brasil | Senzala (Parent) | Others |
|--------|----------------|------------------|--------|
| **Founding** | 3 co-founders (Senzala students) | 12 initial members (3 Flores brothers + 9) | Varies (1-2 founders typically) |
| **Founding Context** | Blessed split from parent group | Original founding | Most are original foundings |
| **Lineage** | 4th generation from Bimba | 2nd generation from Bimba | Varies |
| **Style** | Regional Contemporânea | Regional/Contemporânea | Angola (Ngoma), Regional (CDO, Axé), Blended (ABADÁ, Muzenza) |
| **Leadership** | 3 co-founders (Boneco primary?) | Collaborative red belts | Usually single leader or co-founders |
| **Expansion** | Branch structure ("arms" → branches) | Decentralized red belts | Varies (CDO certified, ABADÁ decentralized, Axé centralized) |
| **Legal Structure** | 501(c)(3) non-profit (USA) | Unknown | CDO has trademark/fees, others unknown |
| **Scale** | 40+ countries | International (UK, Germany, Singapore, etc.) | Varies widely |
| **Age Programs** | Adult, Youth, Tiny Tots | Not documented | Not commonly documented |

---

## Unknown / Unclear Aspects

**Questions requiring further research**:
1. What were the specific "ideological differences" that led to the split?
2. Are Boneco, Sabiá, and Ceará equal co-founders, or is there hierarchy?
3. How many total branches/locations does Capoeira Brasil have?
4. Is there a certification or licensing system for new branches?
5. How is the group governed? Central council? Individual founder autonomy?
6. Do branches pay fees to headquarters (like CDO model)?
7. What is the relationship between Capoeira Brasil and Senzala today?
8. Have any other groups split from Senzala besides Capoeira Brasil?
9. Are there other "blessed splits" in Capoeira history, or is this unique?
10. How does the 501(c)(3) structure in USA relate to Brazil headquarters?

---

## Sources

1. **CapoeiraBrasil.com**: Organizational structure, founding history, Los Angeles branch
2. **AranhaCapoeira.com**: Detailed history of founding and Senzala connection
3. **Web search**: Multiple Capoeira Brasil affiliate websites (San Francisco, East Bay, Curacao, France)
4. **Lalaue.com**: "Biggest Capoeira Groups Worldwide" article
5. **BencaoBrasil.org**: 501(c)(3) cultural center information

---

## Notes for Database Implementation

**Unique characteristics requiring schema consideration**:
1. ✅ Blessed split from parent group (formalized approval)
2. ✅ Padrinho (godfather) relationships with multiple elders
3. ✅ Cross-group blessing (Suassuna from CDO blessing Senzala students)
4. ✅ Generational lineage tracking (4 generations from Bimba)
5. ✅ Branch hierarchy ("arms" → local branches)
6. ✅ 501(c)(3) non-profit legal structure
7. ✅ Age-differentiated programs

**Relationship types to support**:
- `padrinho`: Elder blesses younger mestre's new group
- `blessed_split`: New group created with parent group's approval
- `cross_group_blessing`: Elder from different organization supports new group
- `trained_under`: Boneco/Sabiá/Ceará trained under Mestre Camisa
- `co_founder`: Three mestres co-founded the group
- `branch_of`: Hierarchical organizational relationships

**Group characteristics**:
- Founding context: "amicable split with blessing"
- Legal structure: Non-profit (at least in USA)
- Style: "Regional Contemporânea"
- Scale: 40+ countries
- Program offerings: Age-differentiated

**This case study, combined with Senzala, reveals**:
- How groups form through ideological splits while maintaining respect
- Formalized blessing/approval processes in Capoeira culture
- Multi-generational lineage transmission
- Different organizational models can emerge from same parent (collaborative Senzala → hierarchical Capoeira Brasil)

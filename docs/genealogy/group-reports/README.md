# Group Reports

**Purpose:** Document capoeira groups, academies, and organizations - from historical proto-groups through modern international organizations.

---

## Overview

This directory catalogs capoeira groups at various levels of documentation:

1. **Historical Proto-Groups** - Early organized capoeira training spaces (pre-1930s)
2. **Founding Academies** - The first formalized capoeira academies (1930s-1960s)
3. **Major Lineage Groups** - International organizations with documented lineages
4. **Regional Groups** - Significant groups with regional influence

---

## Directory Structure

All group files are stored as flat files in this directory (no subdirectories) for simplicity:

```
group-reports/
├── README.md                    # This file - overview and guidelines
└── [group-name].md              # Individual group files
```

### Key Files (to be created as groups are processed)

**Historical Proto-Groups:**
- `gengibirra.md` - First organized center of Capoeira Angola in Bahia (~1920s-1941)
- `maltas.md` - 19th century Rio de Janeiro capoeira gangs

**Founding Academies:**
- `centro-de-capoeira-regional.md` - Mestre Bimba's academy (1932)
- `ceca.md` - Centro Esportivo de Capoeira Angola / Pastinha's academy (1941)

**Major Lineage Groups:**
- To be documented via `/import-group` command

---

## Profile Types

Each group file should indicate their profile type:

| Type | Description | Import to DB? |
|------|-------------|---------------|
| `proto_group` | Pre-formalization training spaces or gangs | Maybe |
| `founding_academy` | Original academies of Bimba/Pastinha generation | Yes |
| `major_lineage` | International organizations with multiple branches | Yes |
| `regional_group` | Significant groups with regional influence | Yes |
| `branch` | Local branch/nucleus of larger organization | Yes |

---

## File Template

Each group file should follow this structure:

```markdown
# [Group Name] ([Founded Year])

**Significance:** [One-line summary]

**Profile Type:** `[type]`

**SQL Import:** `docs/genealogy/sql-imports/groups/[name].sql` (if processed)

## Basic Information

| Field | Value |
|-------|-------|
| Official Name | |
| Aliases | |
| Founded | |
| Founded Location | |
| Style | |
| Current Status | Active / Dissolved |
| Headquarters | |

## History

[Detailed narrative history]

## Founding & Leadership

| Role | Person | Period |
|------|--------|--------|
| Founder | | |
| Current Leader | | |

## Philosophy

[Group's stated philosophy/mission]

## Notable Members

[Key figures associated with the group]

## Lineage Connections

- **Parent Group:** (if applicable)
- **Split From:** (if applicable)
- **Notable Branches:** (list major branches)

## Sources

- [Source 1](url)
- [Source 2](url)
```

---

## Handling Uncertainty

For historical groups, information is often incomplete or contested:

- **Dates:** Use "c." for circa, "~" for approximate, "?" for unknown
- **Names:** Note alternate names and abbreviations
- **Relationships:** Distinguish between documented and oral tradition
- **Status:** Note if group is active, dissolved, or uncertain

---

## Relationship Types

Groups can have several types of relationships:

### Hierarchical
- **part_of** - Branch/nucleus belongs to parent organization
- **split_from_group** - Group formed by splitting from another

### Evolutionary
- **evolved_from** - Major organizational transformation
- **merged_into** - Group merged into another

### Cooperative
- **affiliated_with** - Formal affiliation (non-hierarchical)
- **cooperates_with** - Regular cooperation without formal structure

---

## Era Definitions

| Era | Period | Characteristics |
|-----|--------|-----------------|
| Pre-Formalization | Before 1930 | Informal training, criminalization |
| Foundation | 1930-1960 | First academies, legalization |
| Expansion | 1960-1990 | Groups spread across Brazil |
| Globalization | 1990+ | International expansion |

---

## Key Historical Groups to Document

### Proto-Groups (Pre-1930)
- **Gengibirra** - First organized Capoeira Angola center in Bahia
- **Maltas of Rio** - Nagoa vs Guaiamú factions
- **Quarto/Espanha factions** - Recife carnival capoeira

### Founding Academies (1930s-1940s)
- **Centro de Cultura Física Regional** - Mestre Bimba (1932)
- **CECA** - Centro Esportivo de Capoeira Angola / Mestre Pastinha (1941)

### Major Lineage Groups (1960s+)
- **Grupo Senzala** - Founded Rio 1963
- **ABADÁ-Capoeira** - Mestre Camisa, split from Senzala 1988
- **Capoeira Brasil** - Split from Senzala
- **GCAP** - Grupo de Capoeira Angola Pelourinho
- **Filhos de Bimba** - Continuing Bimba's lineage

---

## Why Document Groups?

Capoeira genealogy isn't just person-to-person; groups form the organizational structure through which lineages flow:

1. **Training Context:** Where mestres taught and students learned
2. **Lineage Branches:** Groups represent branches of the genealogy tree
3. **Style Evolution:** Groups often define and preserve specific styles
4. **Community Identity:** Group affiliation is central to capoeirista identity
5. **Historical Record:** Groups document the professionalization of capoeira

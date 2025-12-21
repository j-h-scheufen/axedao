# Capoeira Genealogy Project

> *Em homenagem aos que nos ensinaram* — In honor of those who taught us

This directory contains the research, reports, and import pipeline for the genealogy database.

---

## Directory Structure

```
docs/genealogy/
├── README.md                     ← You are here
│
├── person-reports/               ← Researched profiles (190+ and growing)
│   ├── pastinha.md
│   ├── bimba.md
│   └── ...
│
├── group-reports/                ← Capoeira organizations
│   ├── README.md                # Documentation guidelines
│   └── ...
│
├── case-studies/                 ← Deep dives into major organizations
│   └── ...                      # 30+ organizational analyses
│
├── sources/                      ← Research methodology
│   ├── research-sources.md      # Source reliability tiers
│   └── ...
│
├── import-backlog/               ← Discovery tracking
│   ├── persons-backlog.md       # People discovered, pending research
│   ├── persons-done.md          # Completed imports
│   └── groups-backlog.md        # Groups to research
│
└── sql-imports/                  ← Database import files
    ├── README.md                 # Technical SQL workflow
    └── ...
```

---

## The Discovery Process

One of the most interesting aspects of this project is how research compounds.

### How It Works

When researching one person, the AI encounters many other names—teachers, students, rivals, training companions, family members. Instead of ignoring these, the pipeline **captures every name** and adds it to a backlog for future research.

For example, researching Mestre Pastinha uncovered:
- His teacher **Benedito** (African from Angola)
- Students like **João Grande**, **João Pequeno**, **Curió**, **Boca Rica**
- Training companions from the Gengibirra roda
- Female capoeiristas like **Maria Homem** mentioned in his writings

Each of these becomes a backlog entry with:
- Where they were discovered (source person/document)
- Whether they should be imported (capoeirista vs. historian vs. unclear)
- Notes about what's known so far

### The Backlog

From [`import-backlog/persons-backlog.md`](./import-backlog/persons-backlog.md):

| Apelido | Discovered From | Status | Notes |
|---------|-----------------|--------|-------|
| Curió | Pastinha import | pending | Student of Pastinha (b. 1937); still active at 88 |
| Rosa Palmeirão | Salomé import | ? | Legendary valentona; needs investigation |
| Chicão | Salomé import | pending | Defeated Pedro Porreta on Sept 28, 1929 |

This means the more we research, the more we discover. Each import reveals connections that lead to more people and groups.

---

## Person Reports

Each report follows a consistent structure:

| Section | Content |
|---------|---------|
| **Basic Info** | Name, apelido, dates, birthplace |
| **Biography** | Bilingual (English + Portuguese) |
| **Teachers** | Primary and secondary, with confidence levels |
| **Students** | Notable students trained |
| **Connections** | Rivals, companions, family |
| **Sources** | All references used |

### Example: Mestre Pastinha

From [`person-reports/pastinha.md`](./person-reports/pastinha.md):

> At ten years old, an elderly African neighbor named Benedito, native of Angola, watched Pastinha being bullied and offered to teach the boy capoeira. For three years, young Vicente learned the art at Benedito's house at Rua das Laranjeiras, n° 26. When asked who taught him capoeira, he simply replied: "Um africano"—an African.

---

## Case Studies

Before building the import pipeline, we studied how major capoeira organizations structure themselves—ranking systems, governance, lineage tracking, web presence.

These informed how we model relationships in the database (50+ predicate types like `student_of`, `founded`, `split_from_group`).

See [`case-studies/`](./case-studies/) for analyses of ABADÁ, Cordão de Ouro, Senzala, FICA, and 30+ other organizations.

---

## The Import Commands

Two AI commands power the research:

| Command | Purpose |
|---------|---------|
| `/import-person` | Research a capoeirista, generate profile + relationships |
| `/import-group` | Research a group, generate profile + relationships |

Defined in [`.claude/commands/`](../../.claude/commands/).

### What the Commands Do

1. **Check existing work** — Don't duplicate effort
2. **Search multiple sources** — Portuguese and English, tiered by reliability
3. **Follow clues** — Mentioned events, cited papers, named individuals
4. **Generate bilingual report** — Markdown with English + Portuguese
5. **Create SQL imports** — Structured data for the database
6. **Update backlogs** — Add discovered names for future research

### Source Tiers

From [`sources/research-sources.md`](./sources/research-sources.md):

| Tier | Sources | Reliability |
|------|---------|-------------|
| 1 | Velhos Mestres, Capoeira History, Wikipedia | Highest |
| 2 | Portal Capoeira, IPHAN, CapoeiraWiki | Good |
| 3 | Social media | Activity verification only |
| 4 | Academic papers | Context-dependent |

---

## Relationship Types

The database tracks connections with specific predicates:

**Person → Person**: `student_of`, `trained_under`, `influenced_by`, `baptized_by`, `received_title_from`, `family_of`

**Person → Group**: `founded`, `co_founded`, `leads`, `member_of`, `teaches_at`, `departed_from`

**Group → Group**: `part_of`, `split_from_group`, `evolved_from`, `merged_into`, `affiliated_with`

Each relationship includes confidence level (`verified`, `likely`, `unverified`, `disputed`) and date precision.

---

## Current Progress

| Metric | Count |
|--------|-------|
| Person profiles | 190+ |
| Group profiles | 30+ |
| Case studies | 33 |
| Backlog entries | 100+ |

This is ongoing work. The backlog is still growing.

---

## Contributing

**Found an error?** Claim the profile in the app, or open a GitHub issue.

**Know someone missing?** Check the backlog first, then let us know.

**Technical contributions?** See [`sql-imports/README.md`](./sql-imports/README.md) for the SQL workflow.

---

## Links

- **Live Genealogy Graph**: [quilombo.net/genealogy](https://quilombo.net/genealogy)
- **SQL Workflow**: [`sql-imports/README.md`](./sql-imports/README.md)
- **Import Commands**: [`.claude/commands/`](../../.claude/commands/)

# Person Reports

**Purpose:** Document capoeira figures for the genealogy database - from mythological ancestors through modern mestres.

---

## Overview

This directory catalogs research on capoeira figures across all eras. "Layer Zero" covers the historical and mythological figures who form the cultural foundation before the modern era (pre-1930s). Later layers include the lineages descending from Mestre Bimba and Mestre Pastinha.

### Layer Zero Categories:

1. **African Royalty & Resistance Leaders** - Figures who inspire capoeira philosophy and group names
2. **Quilombo Leaders** - Leaders of escaped slave communities where proto-capoeira may have developed
3. **Proto-Mestres** - The generation that taught Bimba, Pastinha, and their contemporaries
4. **Legendary Capoeiristas** - Semi-mythical figures like Besouro Mangangá
5. **19th Century Capoeiristas** - Named practitioners from the 1800s

---

## Directory Structure

All person files are stored as flat files in this directory (no subdirectories) for simplicity:

```
person-reports/
├── README.md                    # This file - overview and guidelines
├── concepts.md                  # Cultural concepts (mandinga, corpo fechado, etc.)
├── lineage-overview.md          # Lineage tree and network diagrams
└── [person-name].md             # Individual person files
```

### Key Files

**Overview Documents:**
- `concepts.md` - Cultural concepts (Mandinka, corpo fechado, patuá, Ogum, etc.)
- `lineage-overview.md` - Lineage tree diagram and oral transmission networks

---

## Profile Types

Each person file should indicate their profile type

| Type | Description | Import to DB? |
|------|-------------|---------------|
| `inspirational_figure` | Not a capoeirista, but culturally foundational (royalty, resistance leaders) | No |
| `resistance_leader` | Quilombo/resistance leader, symbolic connection to capoeira | No |
| `cultural_concept` | Not a person (e.g., Mandinka people, corpo fechado) | No |
| `proto_mestre` | African-born generation who taught the founders | Yes |
| `historical_capoeirista` | Documented capoeirista from pre-1930s era | Yes |
| `early_mestre` | First generation of formally recognized mestres (Bimba, Pastinha, etc.) | Yes |
| `mestre` | Modern mestres with documented lineage | Yes |
| `contra_mestre` | Contra-mestres with documented lineage | Yes |
| `professor` | Professors/teachers with documented lineage | Yes |
| `historian` | Researcher/documentarian of capoeira | Maybe |

---

## File Template

Each person file should follow this **bilingual structure** (English and Brazilian Portuguese):

```markdown
# [Name] / [Full Name] ([Years])

**SQL Import:** `docs/genealogy/sql-imports/persons/[name].sql`

**Significance / Significância:**
- EN: [One-line summary in English]
- PT: [Resumo em português]

**Profile Type:** `[type]`

## Basic Information / Informações Básicas

| Field / Campo | Value / Valor |
|---------------|---------------|
| Full Name / Nome Completo | |
| Apelido | |
| Born / Nascimento | |
| Died / Falecimento | |
| Location / Local | |
| Title / Título | |
| Style / Estilo | |

## Biography / Biografia

### English
[Detailed narrative biography in English]

### Português
[Biografia detalhada em português]

## Achievements / Conquistas

### English
[Awards, recognitions, notable accomplishments]

### Português
[Prêmios, reconhecimentos, conquistas notáveis]

## Style Notes / Notas de Estilo

### English
[Notes about their capoeira style, if applicable]

### Português
[Notas sobre o estilo de capoeira, se aplicável]

## Teachers / Mestres

- [Name] - [relationship notes EN/PT]

## Students / Alunos

- [Name] - [relationship notes EN/PT]

## Connections / Conexões

[Other relationships - peers, associates, rivals]

## Date Discrepancies / Discrepâncias de Datas

| Field | Primary | Alternative | Notes |
|-------|---------|-------------|-------|
| | | | |

## Sources / Fontes

- [Source 1](url)
- [Source 2](url)
```

### Bilingual Content Guidelines

**All narrative content should be written in both languages:**
- `bio` / `biografia` - The main biography section
- `achievements` / `conquistas` - Notable accomplishments
- `style_notes` / `notas_de_estilo` - Style descriptions
- Statement notes - Relationship context

**What stays in one language:**
- Names and apelidos (proper nouns)
- Place names (use original language, typically Portuguese)
- Source citations (keep in original language of source)

**Research tip:** Many sources are already in Portuguese. When researching, capture the Portuguese text first, then translate to English. This ensures authenticity!

---

## Handling Uncertainty

For Layer Zero figures, information is often incomplete or contested:

- **Dates:** Use "c". for circa, "fl". for floruit (flourished), "?" for unknown
- **Names:** Note alternate spellings and names
- **Relationships:** Distinguish between documented and oral tradition
- **Confidence:** Note when sources disagree

---

## Symbolic vs. Documented Relationships

Many Layer Zero figures have **symbolic** rather than documented connections to capoeira:

- **Zumbi dos Palmares:** No evidence he practiced capoeira, but spiritually foundational
- **Queen Nzinga:** Origin of the word "ginga", but not a capoeirista
- **Besouro Mangangá:** Documented capoeirista with many embellished legends

When documenting, clearly distinguish:
1. What is historically documented
2. What is oral tradition
3. What is modern interpretation/mythology

---

## Era Definitions

| Era | Period | Characteristics |
|-----|--------|-----------------|
| Pre-Colonial | Before 1500 | African origins, Kongo/Angola |
| Colonial | 1500-1822 | Slavery, quilombos, proto-capoeira |
| Imperial | 1822-1889 | Criminalization, maltas, urban capoeira |
| Old Republic | 1889-1930 | Brutal suppression, near-extinction |
| Modern | 1930-1979 | Bimba's legalization, academies |
| Contemporary | 1980+ | Start of global diaspora |

Layer Zero primarily covers the Colonial, Imperial, and Old Republic eras.

---

## Why the Documentation Gap?

Capoeira's history has significant gaps because:

1. **Oral tradition:** Capoeira was passed through practice, not writing
2. **Criminalization:** Practitioners hid their identities
3. **Slavery records:** Enslaved people were often unnamed in records
4. **Police bias:** Records focus on arrests, not lineages
5. **Academic neglect:** Serious research began only in the 1960s-70s

This makes every documented name precious - and requires careful handling of uncertainty.

---

## Key Primary Sources

### Academic Researchers
- **Waldeloir Rego** - "Capoeira Angola: Ensaio Sócio-Etnográfico" (1968)
- **Carlos Eugênio Líbano Soares** - "A Capoeira Escrava" (2001)
- **Frede Abreu** - Extensive documentation of Bahian capoeira
- **Mestre Noronha** - "O ABC da Capoeira Angola" (manuscripts, published 1993)

### Archives
- Arquivo Nacional Rio de Janeiro (ANRJ)
- Arquivo Público do Estado do Rio de Janeiro, Niterói
- Instituto Histórico e Geográfico Brasileiro

### Historical Texts
- Plácido de Abreu, "Os Capoeiras" (1886) - First book on capoeira
- Manuel Antônio de Almeida, "Memórias de um Sargento de Milícias" (1854)

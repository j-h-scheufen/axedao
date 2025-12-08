# Bilingual Content Convention

The genealogy module stores content in both **English (en)** and **Brazilian Portuguese (pt-BR)** to honor capoeira's cultural origins and serve its global community.

## Why Bilingual?

1. **Cultural authenticity**: Capoeira is a Brazilian art form. Many primary sources, oral histories, and technical terms are in Portuguese.
2. **Global reach**: The genealogy module serves practitioners worldwide who speak English.
3. **Research efficiency**: When researching, capture Portuguese text first (often the original), then translate. This preserves authenticity.

---

## Schema Convention

All narrative/descriptive text fields follow the `_en` / `_pt` suffix pattern:

### Person Profiles (`genealogy.person_profiles`)

| Column | Description |
|--------|-------------|
| `bio_en` | Biography in English |
| `bio_pt` | Biografia em português |
| `achievements_en` | Notable accomplishments in English |
| `achievements_pt` | Conquistas notáveis em português |
| `style_notes_en` | Notes about capoeira style in English |
| `style_notes_pt` | Notas sobre estilo de capoeira em português |

### Group Profiles (`genealogy.group_profiles`)

| Column | Description |
|--------|-------------|
| `description_en` | Group description in English |
| `description_pt` | Descrição do grupo em português |
| `philosophy_en` | Group philosophy/mission in English |
| `philosophy_pt` | Filosofia/missão do grupo em português |
| `history_en` | Group history in English |
| `history_pt` | História do grupo em português |
| `style_notes_en` | Notes about style in English |
| `style_notes_pt` | Notas sobre estilo em português |

### Statements (`genealogy.statements`)

| Column | Description |
|--------|-------------|
| `notes_en` | Relationship notes in English |
| `notes_pt` | Notas sobre relacionamento em português |

### JSONB Properties (`statements.properties`)

For `context` and `association_context` fields within JSONB:

```typescript
type BilingualText = {
  en?: string;
  pt?: string;
};

// Example usage in properties
{
  "association_context": {
    "en": "Both trained in Salvador during the 1920s",
    "pt": "Ambos treinaram em Salvador durante os anos 1920"
  }
}
```

---

## What Does NOT Get Translated

These fields remain in a single language (typically the original):

| Field | Reason |
|-------|--------|
| `name` | Personal names are proper nouns |
| `apelido` | Capoeira nicknames are Portuguese terms |
| `birth_place`, `death_place` | Geographic names stay canonical |
| `source` | Citations should be in the source's original language |
| `name_aliases` | Group aliases are proper nouns |

---

## Research Workflow

### Step 1: Gather sources
Many primary sources are in Portuguese (Velhos Mestres, academic papers, interviews). Gather these first.

### Step 2: Write Portuguese content
When the source is Portuguese, write the `_pt` content first. This preserves the original language and nuance.

### Step 3: Translate to English
Translate the Portuguese content to English for the `_en` fields. This ensures consistency.

### Step 4: Verify both
Review both versions for accuracy and completeness.

---

## Markdown Report Structure

Person and group reports in `/docs/genealogy/person-reports/` and `/docs/genealogy/group-reports/` should use this structure:

```markdown
## Biography / Biografia

### English
[English biography text]

### Português
[Texto da biografia em português]

## Achievements / Conquistas

### English
[English achievements text]

### Português
[Texto das conquistas em português]
```

---

## SQL Import Structure

SQL imports in `/docs/genealogy/sql-imports/` use the bilingual columns directly:

```sql
INSERT INTO genealogy.person_profiles (
  ...
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt
) VALUES (
  ...
  E'[English biography]',
  E'[Biografia em português]',
  '[English achievements]',
  '[Conquistas em português]'
);
```

---

## Frontend Considerations

The API returns both language versions. Frontend components should:

1. **Detect user locale**: Use browser locale or user preference
2. **Display appropriate version**: Show `_en` or `_pt` content based on locale
3. **Fallback**: If one language is missing, show the other with a translation notice

Example TypeScript:

```typescript
function getBilingualContent(
  content: { en?: string; pt?: string },
  locale: 'en' | 'pt'
): string | undefined {
  return content[locale] || content[locale === 'en' ? 'pt' : 'en'];
}
```

---

## Migration Notes

The bilingual columns were added in migration `20251208140001_add_bilingual_content_columns.sql`.

This migration:
- Renames `bio` → `bio_en`, `bio_pt` (person_profiles)
- Renames `achievements` → `achievements_en`, `achievements_pt` (person_profiles)
- Renames `style_notes` → `style_notes_en`, `style_notes_pt` (person_profiles, group_profiles)
- Renames `description` → `description_en`, `description_pt` (group_profiles)
- Renames `philosophy` → `philosophy_en`, `philosophy_pt` (group_profiles)
- Renames `history` → `history_en`, `history_pt` (group_profiles)
- Renames `notes` → `notes_en`, `notes_pt` (statements)

**Important**: Existing data will need to be migrated. Since the existing data is in English, a data migration script should copy existing content to `_en` columns.

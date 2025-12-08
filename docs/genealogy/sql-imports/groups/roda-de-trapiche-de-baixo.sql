-- ============================================================
-- GENEALOGY GROUP IMPORT: Roda de Trapiche de Baixo
-- Generated: 2025-12-08
-- Primary Sources:
--   - https://velhosmestres.com/en/besouro
--   - https://papoeira.com/en/who-was-besouro-preto-de-manganga/
--   - https://capoeiradabahia.com.br/rota/roteiro-turistico-alo-meu-santo-amaro/
-- ============================================================

BEGIN;

-- ============================================================
-- GROUP PROFILE
-- ============================================================
-- IMPORTANT: This was NOT a formal school or registered organization.
-- It was an informal community of capoeiristas who lived in the same
-- neighborhood and trained together regularly. We document it as a
-- "proto_group" to capture the social structure through which capoeira
-- knowledge was transmitted in the pre-formalization era.
-- ============================================================

INSERT INTO genealogy.group_profiles (
  -- Identity
  name,
  description,
  style,
  style_notes,
  logo,
  links,
  -- Identity enhancements
  name_aliases,
  name_history,
  -- Founding details
  founded_year,
  founded_year_precision,
  founded_location,
  -- Extended content
  philosophy,
  history,
  -- Organizational
  legal_structure,
  is_headquarters,
  -- Status
  is_active,
  dissolved_at
) VALUES (
  -- Identity
  'Roda de Trapiche de Baixo',
  'An informal community of capoeiristas in Santo Amaro da Purificação, Bahia, centered around Besouro Mangangá and his companions. NOT a formal school—Trapiche de Baixo was a neighborhood where capoeiristas lived, trained together on Sundays and at folk festivals, and held memorable rodas. This proto-group represents the social structure through which capoeira was transmitted from African ex-slaves (Tio Alípio) to the legendary Besouro and his generation, and onward to Cobrinha Verde.',
  NULL, -- Pre-codification; Angola/Regional distinction didn't exist
  'Pre-codification era. Practiced traditional Bahian capoeira before the Angola/Regional split. Included knife techniques, mandinga, and spiritual practices (corpo fechado).',
  NULL, -- No logo for informal historical group
  '[{"type": "website", "url": "https://velhosmestres.com/en/besouro"}, {"type": "website", "url": "https://papoeira.com/en/who-was-besouro-preto-de-manganga/"}]'::jsonb,
  -- Identity enhancements
  ARRAY['Capoeira do Trapiche de Baixo'],
  '[]'::jsonb, -- No name changes
  -- Founding details
  1908, -- When Besouro began training; Tio Alípio arrived ~1888
  'approximate'::genealogy.date_precision,
  'Trapiche de Baixo, Santo Amaro da Purificação, Bahia, Brazil',
  -- Extended content
  NULL, -- No formal philosophy for informal group
  E'Trapiche de Baixo was a waterfront neighborhood in Santo Amaro da Purificação—described as "the poorest neighborhood of Santo Amaro." Around 1888, Tio Alípio, an African ex-slave and Babalaô from Dahomey who had been held at the Engenho Pantaleão sugar mill, moved to the area and began teaching capoeira.

Around 1908, the young Manoel Henrique Pereira (later Besouro Mangangá) moved to Trapiche de Baixo at age 13. One source describes the neighborhood as "a suburban zone of the city which becomes his school." He learned capoeira from Tio Alípio while working in the sugar cane fields.

A community formed around Besouro and his companions—Paulo Barroquinha, Boca de Siri (Siri de Mangue), Noca de Jacó, Doze Homens (Maria Doze Homens), and Canário Pardo—all residents of Trapiche de Baixo. They held "memorable capoeira rodas that hypnotized anybody that would go by" and trained together on Sundays and at folk festivals. Sources describe them as "a gang of capoeira resistance fighters who trained together on Sundays, and could always be relied upon to back one another up."

Because capoeira was illegal (criminalized in the 1890 Penal Code), training was done in secret. When police appeared, Besouro would send students away and face authorities alone.

Around 1912, Besouro began teaching his cousin Cobrinha Verde (age 4). When Besouro was killed in July 1924, "capoeira rodas across Bahia ceased for weeks as a sign of mourning." The informal community dispersed, though members continued practicing elsewhere. Siri de Mangue and Canário Pardo later taught Mestre Waldemar; Cobrinha Verde eventually worked with Mestre Pastinha and taught João Grande and João Pequeno.',
  -- Organizational
  'informal'::genealogy.legal_structure,
  true, -- This was the only location
  -- Status
  false, -- Dissolved
  '1924-07-08'::date -- Besouro's death effectively ended the community
)
ON CONFLICT (name) DO UPDATE SET
  description = EXCLUDED.description,
  style = EXCLUDED.style,
  style_notes = EXCLUDED.style_notes,
  logo = EXCLUDED.logo,
  links = EXCLUDED.links,
  name_aliases = EXCLUDED.name_aliases,
  name_history = EXCLUDED.name_history,
  founded_year = EXCLUDED.founded_year,
  founded_year_precision = EXCLUDED.founded_year_precision,
  founded_location = EXCLUDED.founded_location,
  philosophy = EXCLUDED.philosophy,
  history = EXCLUDED.history,
  legal_structure = EXCLUDED.legal_structure,
  is_headquarters = EXCLUDED.is_headquarters,
  is_active = EXCLUDED.is_active,
  dissolved_at = EXCLUDED.dissolved_at,
  updated_at = NOW();

-- ============================================================
-- STATEMENTS (Relationships)
-- ============================================================

-- Person-to-Group relationships will be added when person SQL files
-- are updated. Key relationships to create:
--
-- Tio Alípio → founded (or co_founded) → Roda de Trapiche de Baixo
-- Besouro Mangangá → member_of / teaches_at → Roda de Trapiche de Baixo
-- Paulo Barroquinha → member_of → Roda de Trapiche de Baixo
-- Siri de Mangue → member_of → Roda de Trapiche de Baixo
-- Noca de Jacó → member_of → Roda de Trapiche de Baixo
-- Maria Doze Homens → member_of → Roda de Trapiche de Baixo
-- Canário Pardo → member_of → Roda de Trapiche de Baixo
-- Cobrinha Verde → member_of → Roda de Trapiche de Baixo

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'group',
  'groups/roda-de-trapiche-de-baixo.sql',
  NULL,
  ARRAY[]::text[],
  'First proto-group in genealogy: informal capoeira community in Santo Amaro centered around Besouro Mangangá (~1908-1924)'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;

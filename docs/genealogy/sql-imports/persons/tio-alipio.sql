-- ============================================================
-- GENEALOGY PERSON IMPORT: Tio Alípio
-- Generated: 2025-12-08
-- Primary Sources:
--   - https://velhosmestres.com/br/besouro-1908
--   - https://velhosmestres.com/en/besouro
--   - https://velhosmestres.com/en/besouro-1888
--   - Mestre Cobrinha Verde interview (via Velhos Mestres)
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE
-- ============================================================

INSERT INTO genealogy.person_profiles (
  -- Identity
  name,
  apelido,
  title,
  portrait,
  public_links,
  -- Capoeira-specific
  style,
  style_notes,
  -- Life dates
  birth_year,
  birth_year_precision,
  birth_place,
  death_year,
  death_year_precision,
  death_place,
  -- Extended content
  bio,
  achievements
) VALUES (
  -- Identity
  'Alípio',
  'Tio Alípio',
  NULL, -- Pre-formal title era; no titles existed in this period
  NULL, -- No images exist of this historical figure
  '[{"type": "website", "url": "https://velhosmestres.com/br/besouro-1908"}, {"type": "website", "url": "https://velhosmestres.com/en/besouro"}]'::jsonb,
  -- Capoeira-specific
  NULL, -- Pre-codification; Angola/Regional distinction didn't exist yet
  'Pre-codification era. Taught traditional capoeira that included knife techniques (facas) and spiritual practices (boas orações) as an integrated system.',
  -- Life dates
  NULL, -- Birth year unknown
  'unknown'::genealogy.date_precision,
  'Dahomey (present-day Benin), Africa',
  NULL, -- Death year unknown
  'unknown'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil', -- Presumed; he was living there after abolition
  -- Extended content
  E'Tio Alípio was an African man who was brought to Brazil in chains to work at the Engenho Pantaleão sugar mill in Santo Amaro da Purificação, Bahia. According to historical accounts preserved by Mestre Cobrinha Verde, he was "the most famous master in Santo Amaro."

His mother came from Africa on a slave ship that departed from the Port of São Jorge da Mina in Dahomey (present-day Benin). Alípio was enslaved while still young by a wealthy family. At the plantation, he endured the sufferings of slavery until abolition in 1888.

Beyond his skill as a capoeirista, Alípio was a Babalaô—a spiritual priest in the Candomblé tradition. This dual role as martial arts teacher and spiritual leader was common among African capoeira masters, who transmitted both fighting techniques and religious practices as an integrated cultural system.

After the Lei Áurea (Golden Law) abolished slavery in May 1888, Alípio moved to Trapiche de Baixo, the poorest neighborhood of Santo Amaro. There he continued to practice and teach capoeira, though the art remained criminalized under the 1890 Penal Code.

His most famous student was the young Manoel Henrique Pereira, later known as Besouro Mangangá. Besouro came to study under Alípio around 1908, when he was about thirteen years old. The old African taught him "os mistérios da capoeira, do jogo, das facas e das boas orações" (the mysteries of capoeira, of the game, of knives and of good prayers) in the sugarcane fields around the plantation. The teaching took place in secrecy, as being caught meant severe punishment.

The significance of Tio Alípio extends beyond his own life. He represents the direct transmission of African martial and spiritual traditions to Brazilian soil. Through his student Besouro, and Besouro''s student Cobrinha Verde, his teachings eventually reached Mestre João Grande and Mestre João Pequeno—creating a lineage that connects living masters to the era of slavery.

Note: Some sources claim Alípio was "sentenced to death" for teaching capoeira. This has not been verified in any primary sources and may be a later embellishment. What is documented is that during this period, capoeira practitioners faced severe legal penalties including imprisonment and internal exile.',
  'Teacher of Besouro Mangangá; considered "the most famous master in Santo Amaro" by Mestre Cobrinha Verde; key link in the chain connecting African capoeira traditions to the documented lineage'
)
ON CONFLICT (apelido) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name,
  title = EXCLUDED.title,
  portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links,
  style = EXCLUDED.style,
  style_notes = EXCLUDED.style_notes,
  birth_year = EXCLUDED.birth_year,
  birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place,
  death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision,
  death_place = EXCLUDED.death_place,
  bio = EXCLUDED.bio,
  achievements = EXCLUDED.achievements,
  updated_at = NOW();

-- ============================================================
-- STATEMENTS (Relationships)
-- ============================================================

-- --- Person-to-Group: Membership & Teaching ---

-- Tio Alípio was member_of Roda de Trapiche de Baixo (from 1888 after abolition)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  confidence, source, notes
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1888-01-01'::date, 'year'::genealogy.date_precision,
  'likely'::genealogy.confidence,
  'Velhos Mestres: "Em 1888, Alípio mudou para Trapiche de Baixo"',
  'After abolition in 1888, Tio Alípio moved to Trapiche de Baixo neighborhood where he lived and continued practicing/teaching capoeira.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Tio Alípio' AND g.name = 'Roda de Trapiche de Baixo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;

-- Tio Alípio teaches_at Roda de Trapiche de Baixo
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  confidence, source, notes
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'teaches_at'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1888-01-01'::date, 'year'::genealogy.date_precision,
  'likely'::genealogy.confidence,
  'Velhos Mestres, Cobrinha Verde interview: "O mestre mais famoso dentro de Santo Amaro chamava-se Alípio"',
  'Tio Alípio was the primary capoeira teacher in Santo Amaro area, teaching in the sugarcane fields and Trapiche de Baixo neighborhood.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Tio Alípio' AND g.name = 'Roda de Trapiche de Baixo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;

-- --- Person-to-Person: Teacher relationship ---
-- NOTE: The student_of statement (Besouro → Tio Alípio) is defined in besouro-manganga.sql
-- After running this import, the besouro-manganga.sql statement will be able to reference Tio Alípio.

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/tio-alipio.sql',
  NULL,
  ARRAY['groups/roda-de-trapiche-de-baixo.sql'],
  'African ex-slave, Babalaô, and teacher of Besouro Mangangá; "the most famous master in Santo Amaro" per Cobrinha Verde'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;

-- ============================================================
-- NOTES
-- ============================================================
--
-- Birth/death years unknown. Active in Santo Amaro from at least 1888
-- (after abolition) through early 1900s/1910s when teaching Besouro.
--
-- Birth place is listed as Dahomey (Benin), though technically his
-- mother came from there - he may have been born in Africa or Brazil.
-- The sources say "filho de uma negra que veio num tumbeiro trazida
-- do Porto de São Jorge da Mina, do Daomé" which describes his mother's
-- origin, not necessarily his birthplace. Listed as Dahomey for simplicity.
--
-- Geographic note: São Jorge da Mina (Elmina) is in present-day Ghana,
-- while Dahomey is present-day Benin. These were distinct slave-trading
-- regions, though slaves from Dahomey were sometimes processed through
-- Elmina. The source conflates these; the person's actual African origin
-- may have been anywhere in the Gold Coast/Slave Coast region.
--
-- "Sentenced to death" claim: Some secondary sources mention this but
-- no primary sources have been found. Noted as unverified in the bio.
--
-- Pending relationships to enable when Besouro file is re-run:
-- - student_of: Besouro Mangangá → Tio Alípio (in besouro-manganga.sql)
-- ============================================================

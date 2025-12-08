-- ============================================================
-- GENEALOGY PERSON IMPORT: Besouro Mangangá
-- Generated: 2025-12-08
-- Primary Sources:
--   - https://en.wikipedia.org/wiki/Besouro_Mangang%C3%A1
--   - https://velhosmestres.com/en/besouro
--   - https://papoeira.com/en/who-was-besouro-preto-de-manganga/
--   - https://capoeirawiki.org/wiki/Besouro_Mangang%C3%A1
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
  'Manoel Henrique Pereira',
  'Besouro Mangangá',
  NULL, -- Mestre by reputation, not formal title; title enum doesn't apply to pre-codification era
  NULL, -- No verified historical portrait exists
  '[{"type": "website", "url": "https://en.wikipedia.org/wiki/Besouro_Mangang%C3%A1"}, {"type": "website", "url": "https://velhosmestres.com/en/besouro"}, {"type": "website", "url": "https://www.lalaue.com/learn-capoeira/besouro/"}]'::jsonb,
  -- Capoeira-specific
  NULL, -- Pre-codification; Angola/Regional distinction didn't exist yet
  'Pre-codification era. Practiced traditional Bahian capoeira before the Angola/Regional split. Sometimes referred to as "Angola tradition" by later mestres.',
  -- Life dates
  1895,
  'year'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil',
  1924,
  'exact'::genealogy.date_precision,
  'Santa Casa de Misericórdia, Santo Amaro da Purificação, Bahia, Brazil',
  -- Extended content
  E'Manoel Henrique Pereira was born in 1895 in Santo Amaro da Purificação, in the Recôncavo region of Bahia—an area with deep African cultural roots. His father was João Matos Pereira, nicknamed "João Grosso," and his mother was Maria Haifa (also recorded as Maria Auta Pereira). According to Mestre Cobrinha Verde, his cousin, "Besouro''s father was named João, nicknamed João Grosso, and his mother was Maria Haifa. Maria Haifa was my aunt, so Besouro was my cousin, and was raised as my brother."

As a boy, Besouro learned capoeira from Tio Alípio, an African ex-slave and Babalaô (Candomblé priest) who had been brought to Brazil in chains to work at the Engenho de Pantaleão sugar mill. Training took place in Trapiche de Baixo, the poorest neighborhood of Santo Amaro, done in secret because capoeira was forbidden by law.

His nickname "Besouro" (beetle) came from his ability to escape dangerous situations—people said he could scurry away or take flight like a beetle, evading capture. "Mangangá" derives from the African word for a type of medicine taken in a ritual believed to create a "corpo fechado" (closed body), attributed to him because of his apparent invincibility to bullets and blades.

Beyond Tio Alípio, Besouro trained with a circle of capoeiristas who would meet on Sundays: Paulo Barroquinha, Canário Pardo, Siri de Mangue, and Maria Doze Homens. Together they formed what some sources call a "gang of capoeira resistance fighters." He became a dangerous knife fighter (faquista), known for playing with a straight razor using his foot.

Besouro served in the army, stationed at the 31st Infantry Battalion. In September 1918, when police seized a berimbau from his group, he went to the police station in São Caetano, Salvador, to recover it. When the officer refused, Besouro attacked with companions. Repelled by police aided by local residents, he retreated to the 31st Infantry Battalion, gathered soldiers, and returned with a squad of 30 men to arrest the police officers. The neighborhood of São Caetano came to a halt. He was subsequently expelled from the army.

After the military, he worked as a saveirista (dock worker for traditional boats), as a vaqueiro (cowboy), and in sugar-cane plants. Historian Antonio Liberac Cardoso Simões Pires notes: "His practices cannot be associated with banditry, because Besouro has always characterized himself as a worker throughout his life, never being arrested for robbery, theft, or common criminal activity."

He began teaching his younger cousin, Rafael Alves França (later Mestre Cobrinha Verde), when Rafael was just four years old, around 1912. On his deathbed, according to Cobrinha Verde, "Besouro called together all his students and told me that I, Cobrinha Verde, was the only one to whom he was giving his spirit to teach capoeira."

In July 1924, at around age 29, Besouro accepted work at the Maracangalha plantation from Dr. Zeca, a local landowner. According to legend, he unwittingly carried a note—being illiterate—that read "kill the man who is delivering this card." He was surrounded by approximately forty armed men. When they opened fire, he dodged the bullets as usual. But his protective patuá had allegedly been stolen by a woman the night before. Eusébio de Quibaca stabbed him in the back with a knife carved from tucum wood—a material said to have magical properties capable of penetrating a corpo fechado. The knife had been blessed by a sorceress specifically for this purpose.

Besouro was stabbed on July 6, 1924. He did not die immediately but was taken to the Santa Casa de Misericórdia hospital in Santo Amaro, where he died on July 8. His death certificate records: "Manoel Henrique, dark mulatto, single, 24 years old, native of Urupy, resident at Usina Maracangalha, profession of cattle herder, entered on the 8th of July 1924 at 10:30 hours of the day and died at seven o''clock in the evening, (due to) an injury piercing the section of the abdomen."

Shortly after his death, Besouro became a mythical capoeira hero. His fame spread nationally from the 1930s and internationally as capoeira expanded to other continents. He is celebrated in countless songs and stories. A 2009 Brazilian film "Besouro" (directed by João Daniel Tikhomiroff, with Ailton Carmo in the title role) dramatized his life.',
  'Folk hero celebrated in countless capoeira songs; subject of 2009 Brazilian film "Besouro"; teacher of Mestre Cobrinha Verde who carried his legacy to subsequent generations including Mestre João Grande and Mestre João Pequeno'
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

-- --- Person-to-Person: Training & Lineage ---

-- Besouro was student of Tio Alípio
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  confidence, source, notes
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1908-01-01'::date, 'approximate'::genealogy.date_precision,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Papoeira.com, Wikipedia - multiple sources agree',
  'Learned capoeira from Tio Alípio in Trapiche de Baixo, Santo Amaro, from a young age. Tio Alípio was an African ex-slave and Babalaô who worked at Engenho de Pantaleão.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Besouro Mangangá' AND o.apelido = 'Tio Alípio'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;

-- Cobrinha Verde was student of Besouro
-- NOTE: Pending - Cobrinha Verde needs SQL import first

-- Besouro was family_of Cobrinha Verde (cousins)
-- NOTE: Pending - Cobrinha Verde needs SQL import first

-- Besouro associated_with training companions (Paulo Barroquinha, Canário Pardo, Siri de Mangue, Maria Doze Homens)
-- NOTE: These require SQL imports for those individuals first

-- --- Person-to-Group: Roda de Trapiche de Baixo ---

-- Besouro was member_of Roda de Trapiche de Baixo
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  confidence, source, notes
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1908-01-01'::date, 'approximate'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Papoeira.com - multiple sources document his training in Trapiche de Baixo',
  'Besouro moved to Trapiche de Baixo at age 13 (~1908) and trained/taught there until his death in 1924. The neighborhood "became his school."'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Besouro Mangangá' AND g.name = 'Roda de Trapiche de Baixo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;

-- Besouro teaches_at Roda de Trapiche de Baixo
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  confidence, source, notes
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'teaches_at'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1912-01-01'::date, 'approximate'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Papoeira.com - documented teaching Cobrinha Verde from 1912',
  'Besouro taught capoeira in secret at Trapiche de Baixo. When police appeared, he would send students away and face authorities alone.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Besouro Mangangá' AND g.name = 'Roda de Trapiche de Baixo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;

-- --- Person-to-Person: Recognition ---

-- Besouro baptized Cobrinha Verde (gave him his apelido)
-- NOTE: Pending - Cobrinha Verde needs SQL import first

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/besouro-manganga.sql',
  NULL,
  ARRAY['groups/roda-de-trapiche-de-baixo.sql', 'persons/tio-alipio.sql'],
  'Legendary capoeirista (1895-1924); learned from Tio Alípio; taught Cobrinha Verde; member of Roda de Trapiche de Baixo'
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
-- Birth year discrepancy: Most sources say 1895, some say 1897.
-- Using 1895 as the more commonly cited date.
--
-- Death certificate states age 24, which would suggest birth ~1900,
-- but this conflicts with oral history placing him as already teaching
-- by 1912. The 1895 date is more consistent with the timeline.
--
-- No authentic historical portrait photograph exists. The 2009 film
-- features actor Ailton Carmo, not actual images of Besouro.
--
-- Title field left NULL because:
-- 1. Formal titles (Mestre, etc.) didn't exist in the modern sense during his era
-- 2. He is called "Mestre" by reputation/legend, not formal conferral
-- 3. The title enum is designed for the post-codification ranking system
--
-- Pending relationships to import when those persons have SQL:
-- - family_of/teacher_of: Cobrinha Verde
-- - associated_with: Paulo Barroquinha, Canário Pardo, Siri de Mangue, Maria Doze Homens
--
-- Active relationships:
-- - student_of: Tio Alípio (enabled after tio-alipio.sql created)
-- ============================================================

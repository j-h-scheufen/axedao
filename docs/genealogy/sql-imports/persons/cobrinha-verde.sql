-- ============================================================
-- GENEALOGY PERSON IMPORT: Cobrinha Verde
-- Generated: 2025-12-08
-- Primary Sources:
--   - https://velhosmestres.com/en/cobrinhaverde (Velhos Mestres)
--   - https://velhosmestres.com/br/cobrinha-1912-1 (Pastinha's registration book)
--   - https://capoeira.online/history/mestres/cobrinha-verde/
--   - https://capoeira-connection.com/capoeira/2011/10/capoeira-and-mandingas-mestre-cobrinha-verde-1921-1983/
--   - https://nossa-tribo.com/mestre-cobrinha-verde-o-primo-de-besouro-manganga/
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
  'Rafael Alves França',
  'Cobrinha Verde',
  'mestre'::genealogy.title,
  NULL, -- No public domain portrait available
  '[{"type": "website", "url": "https://velhosmestres.com/en/cobrinhaverde"}, {"type": "website", "url": "https://capoeira.online/history/mestres/cobrinha-verde/"}]'::jsonb,
  -- Capoeira-specific
  'angola'::genealogy.style,
  'Transitional era figure. Learned pre-codification capoeira from Besouro and the Santo Amaro mestres; later collaborated with both Mestre Bimba and Mestre Pastinha, identifying primarily with the Angola tradition.',
  -- Life dates
  1912,
  'exact'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil',
  1983,
  'year'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- Extended content
  E'Rafael Alves França was born on October 24, 1912, in Santo Amaro da Purificação—a town in the Recôncavo Baiano that he called "the birthplace of Bahian capoeira." His parents were João Alves França and Maria Narcisa Bispo. They were married only in the church, not by the state, so Rafael bore only his father''s surname.

His connection to capoeira began through blood: his aunt Maria Haifa was the mother of Besouro Mangangá. Besouro was raised by Cobrinha''s mother, making them effectively brothers as well as cousins. At four years old, in 1916, Rafael began learning capoeira from Besouro. His cousin gave him the nickname "Cobrinha Verde" (little green snake) because of his exceptional speed and agility with his legs. According to Cobrinha himself: "It was Besouro himself, my mestre, who gave me my nickname Cobrinha Verde because I was very quick. I was so fast that one day he put me in a room and threw knives at me, to see if I could defend myself. I caught the knives twice."

Beyond Besouro, he learned from many other mestres in Santo Amaro: Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, and Neco Canário Pardo. Neco specifically taught him the machete, while a woman named Tonha Rolo do Mar—who later moved to Feira de Santana—taught him the razor technique.

His mystical education came from an African named Tio Pascoal, a neighbor of his grandmother. From Pascoal he learned the mandingas of the patuá, prayers, and corpo fechado (closed body protection)—just as Tio Alípio had taught Besouro. Cobrinha Verde claimed to possess a patuá with magical powers: "It was alive and would jump when left on a virgin plate." But the amulet eventually left him because of an error he committed—he never revealed what that error was.

At seventeen, in 1929, Cobrinha joined the band of Colonel Horácio de Matos in the Lençóis region of the Bahian sertão. He defended the colonel''s men: "Horácio de Matos'' men weren''t a bunch of bandits. He was fighting to be president of the north. He thought there should be two presidents in the country. He had a lot of money, he wasn''t a bandit." They earned 10 mil-réis per day to fight with police. One incident from 1925 became legendary: Cobrinha was targeted by 18 shots, but no bullet hit him as he "jumped and spun in all directions." He spent three years and six months with the band. One midnight, while awaiting police in Serra do Gentio do Ouro, he dreamed his father''s spirit asked him to leave. He woke, filled two backpacks with spare bullets, and fled while everyone slept.

He traveled to Manaus, where he lived with an indigenous woman and had two children. Around age 22, he joined the 1930 Revolution under Getúlio Vargas, fighting in Alagoinhas and then for six months in São Paulo. He achieved the rank of 3rd Sergeant at the old Quartel do CR garrison in Campo Grande. Of his battalion of 85 men, only he survived. "Perhaps it was because of my malice," he said.

One confrontation in Santo Amaro became legendary: a local delegate named Veloso—grandfather of musicians Caetano Veloso and Maria Bethânia—was known for beating young black men in the streets. One night, returning from a samba in Catolé, Cobrinha passed under a peanut tree by the river and encountered the delegate with his soldiers. Veloso''s men pointed him out: "Aren''t you Cobrinha Verde, the tough guy around here, who goes around beating up the police?" Cobrinha replied: "No, I''m not a troublemaker. I have never killed or dishonored anyone." Veloso said "Prepare-se para apanhar" (Prepare to get beaten) and reached for his gun. When he drew it, Cobrinha pulled his eighteen-inch facão and struck him with the flat of the blade, stunning him. The two soldiers attacked; Cobrinha beat them both, and they fled. He thrashed the delegate firmly with the flat of the blade but left him without a single scratch.

After leaving the army, in 1935 he began teaching capoeira at Fazenda Garcia—and here is a remarkable detail often overlooked: he gave instruction to Mestre Bimba and helped him teach his students at Bogum, Engenho Velho da Federação. This places Cobrinha as an influence on Regional capoeira''s development, not just Angola.

He also collaborated with Mestre Pastinha''s academy, instructing students in singing, berimbau playing, and capoeira movements. Pastinha''s official membership book, opened in 1946, lists him as member number 28, admitted August 12, 1955, at age 44, single, profession pedreiro (stonemason), living at Curuzu, Vila Operária de Baixo, 17A.

His roda became one of the most respected in Salvador, alongside those of Mestre Bimba, Mestre Pastinha, and Mestre Waldemar. For many years he taught at his Centro Esportivo de Capoeira Angola Dois de Julho, located at Alto de Santa Cruz in Nordeste de Amaralina.

He claimed to be the first capoeirista to travel outside Salvador for presentations: "I was the first person to travel outside of Salvador and present capoeira. I traveled to São Paulo. After me, then Bimba, Canjiquinha, and Caiçara began to travel."

His students included João Grande, João Pequeno, Gato Preto (José Gabriel Góes), Gigante (also known as Bigodinho), Moreno, and his own son Júlio. However, João Grande later clarified to sociologist Waldeloir Rego that he was not formally Cobrinha''s student—his only master was Pastinha. The truth appears nuanced: João Grande and João Pequeno came to Pastinha''s academy already skilled players, and Cobrinha helped instruct them there without being their primary master.

Cobrinha Verde was one of the only capoeiristas who knew the "Santa Maria" game—a dangerous technique of fighting with a razor blade wedged between the toes. He also introduced to Capoeira Angola the practice of touching the floor repeatedly during play, as if releasing mandinga or asking for protection. This gesture became emblematic of Angola capoeira and was spread by Mestre João Grande, who learned it from Cobrinha.

In 1962, film actor and producer Roberto Batalin invited him to record an LP with Mestre Traíra and Mestre Gato Preto. The album "Capoeira da Bahia" was recorded at Mestre Waldemar''s residence, with photographs taken at the Market Ramp and Port Quais in Salvador. The liner notes were written by playwright Dias Gomes; drawings by Carybé; photos by Salomão Scliar and Marcel Gautherot. Released on the Xauã label, it is now considered a masterpiece and one of the earliest musical documents of capoeira. After the 1964 military coup, a new edition removed Dias Gomes''s name due to his political positions.

Cobrinha Verde never charged money to teach capoeira—he worked as a pedreiro (bricklayer/stonemason) to support himself. This fulfilled a deathbed promise to Besouro. According to Cobrinha: "On his deathbed, Besouro called together all his students and told me that I, Cobrinha Verde, was the only one to whom he was giving his spirit to teach capoeira."

By 1982, at age 74 (based on the 1912 birthdate from Pastinha''s records), Cobrinha Verde was the last surviving "old master" in Bahia. A February 1982 article in O Globo found him living with his son Júlio in Itapoã, suffering from serious cardiac problems. Despite illness and age, when a roda formed in Terreiro de Jesus, he rolled up his jacket sleeves and showed "the ability and the malandragem that he still had."

He died in 1983, leaving a legacy that bridges the legendary era of Besouro to the documented lineage that continues today.',
  'Bridge between Besouro Mangangá and the modern lineage; introduced the floor-touching mandinga gesture to Capoeira Angola; collaborated with both Mestre Bimba and Mestre Pastinha; recorded landmark LP "Capoeira da Bahia" (1962); master of the Santa Maria razor technique; claimed to be first capoeirista to present outside Salvador'
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

-- Cobrinha Verde was student_of Besouro Mangangá (primary teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  confidence, source, notes
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1916-01-01'::date, 'year'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Cobrinha Verde interviews; multiple sources confirm',
  'Began learning capoeira from Besouro at age 4 in 1916. Besouro was his cousin (aunt Maria Haifa was Besouro''s mother) and raised as his brother. On his deathbed, Besouro passed his "spirit to teach capoeira" to Cobrinha Verde.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;

-- Cobrinha Verde was family_of Besouro Mangangá (cousins)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  properties,
  confidence, source, notes
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '{"relationship_type": "other"}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Capoeira Online, Nossa Tribo - multiple sources confirm family relationship',
  'Cobrinha Verde''s aunt Maria Haifa was Besouro''s mother. Besouro was raised by Cobrinha''s mother Maria Narcisa Bispo, making them effectively brothers as well as cousins.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;

-- --- Person-to-Person: Trained under multiple mestres in Santo Amaro ---
-- NOTE: These require SQL imports for Maitá, Licurí, Joité, Dendê, Gasolina,
-- Siri de Mangue, Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso,
-- Neco Canário Pardo, and Tonha Rolo do Mar first.
-- Statements will be added when those persons are imported.

-- --- Person-to-Person: Spiritual Teaching ---
-- NOTE: Tio Pascoal (African mandingueiro) - needs SQL import
-- Cobrinha Verde learned mandingas, patuá, prayers, corpo fechado from him

-- --- Person-to-Person: Cobrinha Verde as Teacher ---
-- NOTE: João Grande trained_under Cobrinha Verde - needs João Grande SQL import first
-- João Grande learned the floor-touching mandinga gesture from Cobrinha Verde
-- at Pastinha's academy. Though João Grande clarified to Waldeloir Rego that
-- Pastinha was his only "master", he did receive specific instruction from Cobrinha.
-- When João Grande is imported, add:
--   João Grande trained_under Cobrinha Verde (~1955-1983)
--   Source: "This act was later spread by Mestre João Grande, who had learned from Cobrinha Verde"
--   Note: João Grande denied being Cobrinha's formal student, but learned specific techniques

-- --- Person-to-Person: Recognition ---

-- Besouro baptized Cobrinha Verde (gave him his apelido)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  properties,
  started_at, started_at_precision,
  confidence, source, notes
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'baptized_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '{"apelido_given": "Cobrinha Verde"}'::jsonb,
  '1916-01-01'::date, 'approximate'::genealogy.date_precision,
  'verified'::genealogy.confidence,
  'Velhos Mestres, Cobrinha Verde interview: "It was Besouro himself, my mestre, who gave me my nickname Cobrinha Verde (little green snake) because I was very quick."',
  'Besouro named him "Cobrinha Verde" (little green snake) because of his exceptional speed and agility with his legs.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Cobrinha Verde' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, started_at) DO NOTHING;

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/cobrinha-verde.sql',
  NULL,
  ARRAY['persons/besouro-manganga.sql'],
  'Mestre Cobrinha Verde (1912-1983); cousin and student of Besouro; bridge between legendary era and documented lineage'
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
-- Birth Year Discrepancy:
-- Sources cite 1908, 1912, 1917, and 1921 as possible birth years.
-- Using October 24, 1912 based on:
-- 1. Pastinha's official registration book (member #28, admission 1955)
-- 2. Ladainha by Mestre Mau: "Este Mestre é Cobrinha / Nasceu em Santo Amaro em 1912"
-- The 1908 claim arises from the narrative that he started at age 4 in 1912,
-- but this likely misinterprets training start year as birth year.
--
-- Training started 1916, not 1912:
-- If born October 1912, then age 4 would be ~1916, which is when Besouro
-- (born 1895) would have been about 21 and established as a capoeirista.
--
-- Death Year:
-- All sources agree on 1983. Velhos Mestres BR gives May 12, 1983.
-- Using 'year' precision since exact date has only one source.
--
-- João Grande clarification:
-- João Grande told Waldeloir Rego he was NOT Cobrinha Verde's student -
-- his only master was Pastinha. However, João Grande learned specific
-- techniques from Cobrinha, notably the floor-touching mandinga gesture
-- that became iconic in Capoeira Angola. This qualifies as a trained_under
-- relationship (historical training, not primary teacher-student bond).
-- Use trained_under predicate, not student_of, when João Grande is imported.
--
-- Centro Esportivo de Capoeira Angola Dois de Julho:
-- Cobrinha's own academy at Alto de Santa Cruz, Nordeste de Amaralina.
-- Needs group import to create founded/leads relationships.
--
-- Pending relationships (require SQL imports):
-- - trained_under: Maitá, Licurí, Joité, Dendê, Gasolina, Siri de Mangue,
--   Doze Homens, Esperidião, Juvêncio Grosso, Espinho Remoso, Neco Canário Pardo
-- - trained_under: Tonha Rolo do Mar (razor technique)
-- - influenced_by: Tio Pascoal (mandingas, corpo fechado)
-- - associated_with: Mestre Bimba (helped teach at his academy 1935)
-- - associated_with: Mestre Pastinha (member of CECA, collaborated)
-- - associated_with: Mestre Waldemar (respected contemporaries)
-- - associated_with: Mestre Traíra, Mestre Gato Preto (LP recording)
-- - founded: Centro Esportivo de Capoeira Angola Dois de Julho
-- ============================================================

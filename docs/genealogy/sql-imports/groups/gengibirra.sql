-- ============================================================
-- GENEALOGY GROUP IMPORT: Gengibirra (Centro Nacional de Capoeira de Origem Angola)
-- Generated: 2025-12-08
-- Primary Source: Mestre Noronha's manuscripts via velhosmestres.com, nossa-tribo.com
-- ============================================================
-- DEPENDENCIES: persons/noronha.sql, persons/livino.sql, persons/totonho-de-mare.sql, persons/amorzinho.sql, groups/ceca.sql
-- ============================================================
--
-- HISTORICAL CONTEXT:
-- Gengibirra was the first organized center for Capoeira Angola in Bahia,
-- founded in the 1920s at Ladeira de Pedra in the Liberdade neighborhood
-- of Salvador. The name "Gengibirra" refers to the geographic area.
-- In 1941, the center was handed to Mestre Pastinha, who later registered
-- it officially as Centro Esportivo de Capoeira Angola (CECA).
--
-- NOTE: This group entry represents the historical Gengibirra center
-- (1920s-1941), distinct from Pastinha's CECA which evolved from it.
--
-- ============================================================

BEGIN;

-- ============================================================
-- GROUP PROFILE (all columns from genealogy.group_profiles)
-- ============================================================

INSERT INTO genealogy.group_profiles (
  -- Identity
  name,
  style,
  logo,
  links,
  -- Identity enhancements
  name_aliases,
  name_history,
  -- Founding details
  founded_year,
  founded_year_precision,
  founded_location,
  -- Extended content (bilingual)
  description_en,
  description_pt,
  style_notes_en,
  style_notes_pt,
  philosophy_en,
  philosophy_pt,
  history_en,
  history_pt,
  -- Organizational
  legal_structure,
  is_headquarters,
  -- Status
  is_active,
  dissolved_at
) VALUES (
  -- Identity
  'Gengibirra',
  'angola'::genealogy.style,
  NULL,  -- No logo available for historical group
  '[{"type": "website", "url": "https://velhosmestres.com/en/featured-9"}, {"type": "website", "url": "https://nossa-tribo.com/mestre-totonho-de-mare/"}, {"type": "website", "url": "https://capoeirahistory.com/classical-texts-of-capoeira-history-the-manuscripts-of-mestre-noronha/"}, {"type": "website", "url": "https://en.wikipedia.org/wiki/Capoeira_Angola"}]'::jsonb,
  -- Identity enhancements
  ARRAY['Centro Nacional de Capoeira de Origem Angola', 'Centro de Capoeira Angola', 'Roda do Gengibirra', 'Roda de Gengibirra', 'Jinjibirra'],
  '[{"name": "Centro Nacional de Capoeira de Origem Angola", "startedAt": "1920-01-01", "endedAt": "1941-02-23", "context": "Original name used by founders"}, {"name": "CECA (handed to Pastinha)", "startedAt": "1941-02-23", "context": "Transitioned to Mestre Pastinha, registered as Centro Esportivo de Capoeira Angola"}]'::jsonb,
  -- Founding details
  1920,
  'decade'::genealogy.date_precision,
  'Ladeira de Pedra, Liberdade, Salvador, Bahia, Brazil',
  -- Extended content (bilingual)
  E'Gengibirra was the first organized center for Capoeira Angola in the state of Bahia, founded in the 1920s at Ladeira de Pedra in the Gengibirra area of the Liberdade neighborhood, Salvador. According to Mestre Noronha''s manuscripts, the center was founded by 22 mestres, with four recognized as "donos e proprietários" (owners and proprietors): Noronha himself, his brother Livino, Totonho de Maré, and Amorzinho. The center adopted green and yellow - the colors of the Brazilian flag - as its official colors, symbolized on the clothes worn by its members.\n\nThe rodas at Gengibirra were led by Mestre Amorzinho, a civil guard whose profession provided protection from police harassment during a time when capoeira was still criminalized. The center established formal combat rules and attracted the best capoeiristas of Salvador, becoming the primary gathering place for traditional capoeira angola practitioners.\n\nIn 1941, following Amorzinho''s death, the surviving mestres handed the center to Mestre Pastinha, who was invited by his former student Aberrê to witness a Sunday roda. Pastinha subsequently registered the center officially as Centro Esportivo de Capoeira Angola (CECA) and relocated it to Pelourinho, beginning a new era in the formalization of capoeira angola.',
  E'O Gengibirra foi o primeiro centro organizado de Capoeira Angola no estado da Bahia, fundado na década de 1920 na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade, Salvador. De acordo com os manuscritos de Mestre Noronha, o centro foi fundado por 22 mestres, com quatro reconhecidos como "donos e proprietários": o próprio Noronha, seu irmão Livino, Totonho de Maré e Amorzinho. O centro adotou o verde e amarelo - as cores da bandeira brasileira - como suas cores oficiais, simbolizadas nas roupas usadas por seus membros.\n\nAs rodas no Gengibirra eram lideradas por Mestre Amorzinho, um guarda civil cuja profissão oferecia proteção contra a perseguição policial durante um período em que a capoeira ainda era criminalizada. O centro estabeleceu regras formais de combate e atraiu os melhores capoeiristas de Salvador, tornando-se o principal ponto de encontro dos praticantes de capoeira angola tradicional.\n\nEm 1941, após a morte de Amorzinho, os mestres sobreviventes entregaram o centro a Mestre Pastinha, que foi convidado por seu ex-aluno Aberrê para assistir a uma roda de domingo. Pastinha posteriormente registrou o centro oficialmente como Centro Esportivo de Capoeira Angola (CECA) e o transferiu para o Pelourinho, iniciando uma nova era na formalização da capoeira angola.',
  -- Style notes (bilingual)
  E'Pre-stylistic era capoeira angola. The center established formal combat rules documented by Noronha: "The capoeirista who is dragged by a rasteira in a demonstration or a rabo de arraia or a joelhada or a balão boca de calças or a escoramento de coxa is considered defeated." This represents one of the earliest documented codifications of capoeira competition rules.',
  E'Capoeira angola da era pré-estilística. O centro estabeleceu regras formais de combate documentadas por Noronha: "O capoeirista que for arrastado por uma rasteira em uma demonstração ou um rabo de arraia ou uma joelhada ou um balão boca de calças ou um escoramento de coxa é considerado derrotado." Isso representa uma das primeiras codificações documentadas de regras de competição de capoeira.',
  -- Philosophy (bilingual)
  E'Preservation of traditional capoeira angola during the era of criminalization. The center served as a sanctuary where mestres could practice, teach, and preserve the art despite legal persecution. The green and yellow colors represented Brazilian national pride and the legitimacy of capoeira as a cultural practice.',
  E'Preservação da capoeira angola tradicional durante a era de criminalização. O centro serviu como um santuário onde os mestres podiam praticar, ensinar e preservar a arte apesar da perseguição legal. As cores verde e amarelo representavam o orgulho nacional brasileiro e a legitimidade da capoeira como prática cultural.',
  -- History (bilingual)
  E'Gengibirra traces its origins to the 1920s when capoeira was still criminalized in Brazil (the ban was only lifted in the 1930s). According to Mestre Noronha, before the Gengibirra center, there was an earlier attempt to organize the "Conjunto de Capoeira de Angola Conceição da Praia," also led by Noronha.\n\nThe founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra included: Noronha, Livino, Maré (Totonho de Maré), Amorzinho, Raimundo ABR (Aberrê), Percílio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pé de Abelha, Zehí, Feliciano Bigode de Seda, Bom Nome (Bonome), Henrique Cara Queimada, Onça Preta, Cimento, Argemiro Grande, Olho de Pombo, Antônio Galindeu (Antonio Galindo), Antônio Boca de Porco, Cândido Pequeno (Argolinha de Ouro), Lúcio Pequeno, and Paquete do Cabula.\n\nAmorzinho, as a civil guard, provided crucial protection from police persecution. The center operated as the primary gathering place for traditional capoeiristas throughout the 1920s and 1930s.\n\nOn February 23, 1941, at the roda in Gengibirra, Mestre Aberrê introduced Mestre Pastinha to the assembly. Amorzinho, recognizing Pastinha''s capabilities, asked him to assume responsibility for preserving and teaching traditional capoeira angola. According to Noronha''s manuscripts, after Amorzinho''s death (c. 1943), the mestres formally handed the center to Pastinha.\n\nPastinha registered the center officially as Centro Esportivo de Capoeira Angola (CECA) and eventually relocated it to the Pelourinho neighborhood, where it became internationally famous.',
  E'O Gengibirra tem suas origens na década de 1920, quando a capoeira ainda era criminalizada no Brasil (a proibição só foi suspensa na década de 1930). De acordo com Mestre Noronha, antes do centro do Gengibirra, houve uma tentativa anterior de organizar o "Conjunto de Capoeira de Angola Conceição da Praia," também liderado por Noronha.\n\nOs mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra incluíam: Noronha, Livino, Maré (Totonho de Maré), Amorzinho, Raimundo ABR (Aberrê), Percílio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pé de Abelha, Zehí, Feliciano Bigode de Seda, Bom Nome (Bonome), Henrique Cara Queimada, Onça Preta, Cimento, Argemiro Grande, Olho de Pombo, Antônio Galindeu (Antonio Galindo), Antônio Boca de Porco, Cândido Pequeno (Argolinha de Ouro), Lúcio Pequeno e Paquete do Cabula.\n\nAmorzinho, como guarda civil, oferecia proteção crucial contra a perseguição policial. O centro operou como o principal ponto de encontro dos capoeiristas tradicionais durante as décadas de 1920 e 1930.\n\nEm 23 de fevereiro de 1941, na roda do Gengibirra, Mestre Aberrê apresentou Mestre Pastinha à assembleia. Amorzinho, reconhecendo as capacidades de Pastinha, pediu-lhe que assumisse a responsabilidade de preservar e ensinar a capoeira angola tradicional. De acordo com os manuscritos de Noronha, após a morte de Amorzinho (c. 1943), os mestres formalmente entregaram o centro a Pastinha.\n\nPastinha registrou o centro oficialmente como Centro Esportivo de Capoeira Angola (CECA) e eventualmente o transferiu para o bairro do Pelourinho, onde se tornou internacionalmente famoso.',
  -- Organizational
  'informal'::genealogy.legal_structure,
  true,  -- is_headquarters (original location)
  -- Status
  false,  -- is_active (transitioned to CECA in 1941)
  '1941-02-23'::date  -- dissolved_at (handed to Pastinha)
)
ON CONFLICT (name) DO UPDATE SET
  style = EXCLUDED.style,
  logo = EXCLUDED.logo,
  links = EXCLUDED.links,
  name_aliases = EXCLUDED.name_aliases,
  name_history = EXCLUDED.name_history,
  founded_year = EXCLUDED.founded_year,
  founded_year_precision = EXCLUDED.founded_year_precision,
  founded_location = EXCLUDED.founded_location,
  description_en = EXCLUDED.description_en,
  description_pt = EXCLUDED.description_pt,
  style_notes_en = EXCLUDED.style_notes_en,
  style_notes_pt = EXCLUDED.style_notes_pt,
  philosophy_en = EXCLUDED.philosophy_en,
  philosophy_pt = EXCLUDED.philosophy_pt,
  history_en = EXCLUDED.history_en,
  history_pt = EXCLUDED.history_pt,
  legal_structure = EXCLUDED.legal_structure,
  is_headquarters = EXCLUDED.is_headquarters,
  is_active = EXCLUDED.is_active,
  dissolved_at = EXCLUDED.dissolved_at,
  updated_at = NOW();

-- ============================================================
-- STATEMENTS (Relationships)
-- Only generate for entities that EXIST in our dataset
-- ============================================================

-- --- Person-to-Group: Founding ---
-- Note: Person-to-Group statements are generated when importing the person.
-- The following are documented here for reference and future import:

-- Cândido Pequeno co_founded Gengibirra (person exists)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com',
  'One of 22 founding mestres; recognized as "champion of capoeira in the State of Bahia"',
  'Um dos 22 mestres fundadores; reconhecido como "campeão da capoeira do Estado da Bahia"'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Cândido Pequeno' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Aberrê co_founded Gengibirra (person exists - Raimundo ABR in founding list)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; listed as "Raimundo ABR" in founding mestres',
  'One of 22 founding mestres; listed as "Raimundo ABR"; later introduced Pastinha to the roda in 1941',
  'Um dos 22 mestres fundadores; listado como "Raimundo ABR"; posteriormente apresentou Pastinha à roda em 1941'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Aberrê' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING PERSON-TO-GROUP STATEMENTS (require person imports first)
-- ============================================================
--
-- The following relationships are documented but cannot be generated
-- until the respective persons are imported:
--
-- FOUR "OWNERS AND PROPRIETORS" (donos e proprietários):
-- 1. Noronha co_founded Gengibirra (pending person import)
-- 2. Livino co_founded Gengibirra (pending person import)
-- 3. Totonho de Maré co_founded Gengibirra (pending person import)
-- 4. Amorzinho co_founded Gengibirra (pending person import)
--    - Also: Amorzinho leads Gengibirra (as civil guard/roda leader)
--
-- OTHER FOUNDING MESTRES (22 total):
-- - Percílio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pé de Abelha,
--   Zehí, Feliciano Bigode de Seda, Bom Nome, Henrique Cara Queimada,
--   Onça Preta, Cimento, Argemiro Grande, Olho de Pombo, Antônio Galindeu,
--   Antônio Boca de Porco, Lúcio Pequeno, Paquete do Cabula
--   (all pending person imports)
--
-- MEMBERSHIP/ATTENDANCE:
-- - Pastinha member_of Gengibirra (attended roda 1941, pending person import)
--
-- ============================================================

-- ============================================================
-- GROUP-TO-GROUP STATEMENTS
-- ============================================================

-- Note: CECA (Centro Esportivo de Capoeira Angola) evolved from Gengibirra
-- This relationship should be created when CECA is imported:
-- CECA evolved_from Gengibirra (started_at: 1941-02-23)

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'group',
  'groups/gengibirra.sql',
  NULL,
  ARRAY['persons/noronha.sql', 'persons/livino.sql', 'persons/totonho-de-mare.sql', 'persons/amorzinho.sql', 'groups/ceca.sql']::text[],
  'First organized center for Capoeira Angola in Bahia; founded 1920s at Ladeira de Pedra, Liberdade, Salvador; handed to Pastinha in 1941'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;

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
  E'Gengibirra was the first organized center for Capoeira Angola in the state of Bahia, founded in the 1920s at Ladeira de Pedra in the Liberdade neighborhood, Salvador. The center was established during a dangerous period - the Penal Code of 1890 criminalized capoeira with imprisonment of 2-6 months, and police chief Pedro Gordilho ("Pedrito") terrorized practitioners with his mounted cavalry from 1920-1927.\n\nAccording to Mestre Noronha''s manuscripts, 22 mestres founded the center, with four recognized as "donos e proprietarios" (organizational leaders): Noronha, his brother Livino, Totonho de Mare, and Amorzinho. The center adopted green and yellow - the colors of the Brazilian flag - as its official colors.\n\nAmorzinho''s role as a civil guard (guarda civil) was critical. Portal Capoeira states: "Pela sua funcao, o guarda civil PROTEGIA o pessoal todo que praticava aquela Arte marginal, contravencao proibidissima no pais inteiro." As a uniformed preventive police officer, he could warn of operations, vouch for gatherings, and intervene if other officers arrived - providing institutional protection from within the system that persecuted capoeira.\n\nIn 1941, Amorzinho recognized Mestre Pastinha''s capabilities and handed him leadership. After Amorzinho''s death in 1943, "CECA was abandoned by all the Masters" - without their protector, the mestres scattered. Pastinha registered the center as Centro Esportivo de Capoeira Angola (CECA) and relocated it to Pelourinho, where it became internationally famous.',
  E'O Gengibirra foi o primeiro centro organizado de Capoeira Angola no estado da Bahia, fundado na decada de 1920 na Ladeira de Pedra, no bairro da Liberdade, Salvador. O centro foi estabelecido durante um periodo perigoso - o Codigo Penal de 1890 criminalizava a capoeira com prisao de 2-6 meses, e o chefe de policia Pedro Gordilho ("Pedrito") aterrorizava praticantes com sua cavalaria montada de 1920 a 1927.\n\nDe acordo com os manuscritos de Mestre Noronha, 22 mestres fundaram o centro, com quatro reconhecidos como "donos e proprietarios" (lideres organizacionais): Noronha, seu irmao Livino, Totonho de Mare e Amorzinho. O centro adotou o verde e amarelo - as cores da bandeira brasileira - como suas cores oficiais.\n\nO papel de Amorzinho como guarda civil foi critico. O Portal Capoeira afirma: "Pela sua funcao, o guarda civil PROTEGIA o pessoal todo que praticava aquela Arte marginal, contravencao proibidissima no pais inteiro." Como oficial uniformizado da policia preventiva, ele podia avisar sobre operacoes, atestar reunioes e intervir se outros oficiais chegassem - fornecendo protecao institucional de dentro do sistema que perseguia a capoeira.\n\nEm 1941, Amorzinho reconheceu as capacidades de Mestre Pastinha e lhe passou a lideranca. Apos a morte de Amorzinho em 1943, "o CECA foi abandonado por todos os Mestres" - sem seu protetor, os mestres se dispersaram. Pastinha registrou o centro como Centro Esportivo de Capoeira Angola (CECA) e o transferiu para o Pelourinho, onde se tornou internacionalmente famoso.',
  -- Style notes (bilingual)
  E'Pre-stylistic era capoeira angola. The center established formal combat rules documented by Noronha: "The capoeirista who is dragged by a rasteira in a demonstration or a rabo de arraia or a joelhada or a balão boca de calças or a escoramento de coxa is considered defeated." This represents one of the earliest documented codifications of capoeira competition rules.',
  E'Capoeira angola da era pré-estilística. O centro estabeleceu regras formais de combate documentadas por Noronha: "O capoeirista que for arrastado por uma rasteira em uma demonstração ou um rabo de arraia ou uma joelhada ou um balão boca de calças ou um escoramento de coxa é considerado derrotado." Isso representa uma das primeiras codificações documentadas de regras de competição de capoeira.',
  -- Philosophy (bilingual)
  E'Preservation of traditional capoeira angola during the era of criminalization. The center served as a sanctuary where mestres could practice, teach, and preserve the art despite legal persecution. The green and yellow colors represented Brazilian national pride and the legitimacy of capoeira as a cultural practice.',
  E'Preservação da capoeira angola tradicional durante a era de criminalização. O centro serviu como um santuário onde os mestres podiam praticar, ensinar e preservar a arte apesar da perseguição legal. As cores verde e amarelo representavam o orgulho nacional brasileiro e a legitimidade da capoeira como prática cultural.',
  -- History (bilingual)
  E'Gengibirra traces its origins to the 1920s when capoeira was still criminalized in Brazil. The Penal Code of 1890 (Article 402) made "exercises of agility and bodily skill known by the denomination Capoeiragem" punishable by two to six months imprisonment, with gang membership as an aggravating factor. This law remained in effect until 1940.\n\nThe founding years of Gengibirra (1920s) coincided with the most intense period of persecution under Pedro de Azevedo Gordilho ("Pedrito"), the brutal police chief whose mounted cavalry terrorized capoeiristas throughout Salvador from 1920-1927. His persecution was so notorious that capoeiristas created the "Cavalaria" toque - a berimbau rhythm mimicking approaching horses - to warn when police were near.\n\nAccording to Mestre Noronha, before Gengibirra there was an earlier attempt to organize the "Conjunto de Capoeira de Angola Conceicao da Praia." The founding mestres of the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra included: Noronha, Livino, Mare (Totonho de Mare), Amorzinho, Raimundo ABR (Aberre), Percilio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pe de Abelha, Zehi, Feliciano Bigode de Seda, Bom Nome, Henrique Cara Queimada, Onca Preta, Cimento, Argemiro Grande, Olho de Pombo, Antonio Galindeu, Antonio Boca de Porco, Candido Pequeno (Argolinha de Ouro), Lucio Pequeno, and Paquete do Cabula.\n\nAmorzinho''s role as a civil guard (guarda civil) was critical to the center''s survival. Portal Capoeira states: "Pela sua funcao, o guarda civil PROTEGIA o pessoal todo que praticava aquela Arte marginal, contravencao proibidissima no pais inteiro." As a uniformed member of the preventive police force, he could warn of planned operations, vouch for gatherings, and intervene if other officers arrived - providing institutional protection from within the system that persecuted capoeira.\n\nOn February 23, 1941, Mestre Aberre introduced Mestre Pastinha to the assembly. Amorzinho recognized Pastinha''s capabilities and asked him to assume leadership. According to Noronha''s manuscripts, after Amorzinho''s death (1943), the mestres formally handed the center to Pastinha. Sources note: "with Amorzinho''s death, CECA was abandoned by all the Masters" - without their protector within the system, the mestres scattered. The center would not fully recover until 1955.\n\nPastinha registered the center as Centro Esportivo de Capoeira Angola (CECA) and relocated it to Pelourinho, where it became internationally famous.',
  E'O Gengibirra tem suas origens na decada de 1920, quando a capoeira ainda era criminalizada no Brasil. O Codigo Penal de 1890 (Artigo 402) tornava "exercicio de agilidade e destreza corporal conhecida pela denominacao Capoeiragem" punivel com dois a seis meses de prisao, com participacao em malta como agravante. Esta lei permaneceu em vigor ate 1940.\n\nOs anos de fundacao do Gengibirra (decada de 1920) coincidiram com o periodo mais intenso de perseguicao sob Pedro de Azevedo Gordilho ("Pedrito"), o brutal chefe de policia cuja cavalaria montada aterrorizou capoeiristas por toda Salvador de 1920 a 1927. Sua perseguicao foi tao notoria que os capoeiristas criaram o toque "Cavalaria" - um ritmo de berimbau imitando cavalos se aproximando - para avisar quando a policia estava perto.\n\nDe acordo com Mestre Noronha, antes do Gengibirra houve uma tentativa anterior de organizar o "Conjunto de Capoeira de Angola Conceicao da Praia." Os mestres fundadores do Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra incluiam: Noronha, Livino, Mare (Totonho de Mare), Amorzinho, Raimundo ABR (Aberre), Percilio, Geraldo Chapeleiro, Juvenal Engraxate, Geraldo Pe de Abelha, Zehi, Feliciano Bigode de Seda, Bom Nome, Henrique Cara Queimada, Onca Preta, Cimento, Argemiro Grande, Olho de Pombo, Antonio Galindeu, Antonio Boca de Porco, Candido Pequeno (Argolinha de Ouro), Lucio Pequeno e Paquete do Cabula.\n\nO papel de Amorzinho como guarda civil foi critico para a sobrevivencia do centro. O Portal Capoeira afirma: "Pela sua funcao, o guarda civil PROTEGIA o pessoal todo que praticava aquela Arte marginal, contravencao proibidissima no pais inteiro." Como membro uniformizado da forca policial preventiva, ele podia avisar sobre operacoes planejadas, atestar reunioes e intervir se outros oficiais chegassem - fornecendo protecao institucional de dentro do sistema que perseguia a capoeira.\n\nEm 23 de fevereiro de 1941, Mestre Aberre apresentou Mestre Pastinha a assembleia. Amorzinho reconheceu as capacidades de Pastinha e pediu-lhe que assumisse a lideranca. De acordo com os manuscritos de Noronha, apos a morte de Amorzinho (1943), os mestres formalmente entregaram o centro a Pastinha. As fontes observam: "com o falecimento de Amorzinho, o CECA foi abandonado por todos os Mestres" - sem seu protetor dentro do sistema, os mestres se dispersaram. O centro so se recuperaria totalmente em 1955.\n\nPastinha registrou o centro como Centro Esportivo de Capoeira Angola (CECA) e o transferiu para o Pelourinho, onde se tornou internacionalmente famoso.',
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
--
-- RELATIONSHIP MODEL FOR GENGIBIRRA:
-- - All 22 founding mestres: co_founded (with founding_role property)
-- - The 4 "donos e proprietários": ALSO get "leads" with time range
-- - "Donos e proprietários" = organizational leadership, not property ownership
--   (Ladeira de Pedra was a public street, not privately owned)
--
-- ============================================================

-- --- Person-to-Group: Founding (co_founded) ---

-- Cândido Pequeno co_founded Gengibirra (founding mestre)
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
  '{"founding_role": "founding_mestre"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com',
  'One of 22 founding mestres; recognized as "champion of capoeira in the State of Bahia"',
  'Um dos 22 mestres fundadores; reconhecido como "campeão da capoeira do Estado da Bahia"'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Cândido Pequeno' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Aberrê co_founded Gengibirra (founding mestre)
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
  '{"founding_role": "founding_mestre"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; listed as "Raimundo ABR" in founding mestres',
  'One of 22 founding mestres; listed as "Raimundo ABR"; later introduced Pastinha to the roda in 1941',
  'Um dos 22 mestres fundadores; listado como "Raimundo ABR"; posteriormente apresentou Pastinha à roda em 1941'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Aberrê' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Geraldo Chapeleiro co_founded Gengibirra (founding mestre)
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
  '{"founding_role": "founding_mestre"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Geraldo Chapeleiro' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Onça Preta co_founded Gengibirra (founding mestre)
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
  '{"founding_role": "founding_mestre"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com',
  'One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola',
  'Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Onça Preta' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Totonho de Maré co_founded Gengibirra (dono e proprietário)
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
  '{"founding_role": "dono_proprietario"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com; nossa-tribo.com',
  'One of four "donos e proprietários" (organizational leaders) of Gengibirra alongside Noronha, Livino, and Amorzinho',
  'Um dos quatro "donos e proprietários" (líderes organizacionais) do Gengibirra ao lado de Noronha, Livino e Amorzinho'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Totonho de Maré' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- --- Person-to-Group: Leadership (leads) ---
-- The 4 "donos e proprietários" had organizational leadership roles

-- Totonho de Maré leads Gengibirra (1920s-1941)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'leads'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  '{"leadership_role": "dono_proprietario", "context": "One of four organizational leaders recognized by Noronha; leadership ended when center was handed to Pastinha"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com; nossa-tribo.com/mestre-totonho-de-mare/',
  'One of four "donos e proprietários" providing organizational leadership. Term indicates custodianship/leadership, not property ownership (Ladeira de Pedra was a public street).',
  'Um dos quatro "donos e proprietários" fornecendo liderança organizacional. O termo indica custódia/liderança, não propriedade (Ladeira de Pedra era uma rua pública).'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Totonho de Maré' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Amorzinho co_founded Gengibirra (dono e proprietário)
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
  '{"founding_role": "dono_proprietario"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com; nossa-tribo.com',
  'One of four "donos e proprietários" (organizational leaders) of Gengibirra alongside Noronha, Livino, and Totonho de Maré. Civil guard who protected the roda.',
  'Um dos quatro "donos e proprietários" (líderes organizacionais) do Gengibirra ao lado de Noronha, Livino e Totonho de Maré. Guarda civil que protegia a roda.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Amorzinho' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Amorzinho leads Gengibirra (1920s-1943) - organizational leadership AND roda leader
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties, confidence, source,
  notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'leads'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '{"leadership_role": "dono_proprietario", "additional_role": "roda_leader", "context": "Amorzinho was the roda leader and used his position as civil guard to protect the practitioners from police harassment. His death in 1943 triggered the dispersal of mestres and eventual full transfer to Pastinha."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com; Portal Capoeira; Pastinha accounts',
  'One of four "donos e proprietários" AND the primary roda leader. His profession as civil guard provided crucial protection from police. Pastinha called him "the owner of that capoeira." His death in 1943 triggered CECA''s dispersal.',
  'Um dos quatro "donos e proprietários" E o líder principal de roda. Sua profissão como guarda civil fornecia proteção crucial contra a polícia. Pastinha o chamou de "o dono daquela capoeira." Sua morte em 1943 desencadeou a dispersão do CECA.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Amorzinho' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING PERSON-TO-GROUP STATEMENTS (require person imports first)
-- ============================================================
--
-- FOUR "DONOS E PROPRIETÁRIOS" - Organizational Leaders:
-- (Term means organizational leadership, not property ownership)
--
-- 1. Noronha - co_founded + leads (IMPORTED - see noronha.sql)
--    - co_founded: founding_role = "dono_proprietario"
--    - leads: 1920s-1941, leadership_role = "dono_proprietario"
--
-- 2. Livino - co_founded + leads (IMPORTED - see livino.sql)
--    - co_founded: founding_role = "dono_proprietario"
--    - leads: 1920s-1941, leadership_role = "dono_proprietario"
--    - Note: Brother of Noronha; also co-managed Centro da Conceição da Praia
--
-- 3. Totonho de Maré - co_founded + leads (GENERATED ABOVE)
--
-- 4. Amorzinho - co_founded + leads (GENERATED ABOVE)
--    - co_founded: founding_role = "dono_proprietario"
--    - leads: 1920s-1943, leadership_role = "dono_proprietario" + "roda_leader"
--    - Civil guard (guarda civil) who led rodas and provided protection
--      from police harassment. His death in 1943 triggered transition to Pastinha.
--
-- OTHER FOUNDING MESTRES (18 more, for 22 total):
-- All use co_founded with founding_role = "founding_mestre"
-- - Percílio, Juvenal Engraxate, Geraldo Pé de Abelha, Zehí,
--   Feliciano Bigode de Seda, Bom Nome (Bonome), Henrique Cara Queimada,
--   Cimento, Argemiro Grande, Olho de Pombo, Antônio Galindeu,
--   Antônio Boca de Porco, Lúcio Pequeno, Paquete do Cabula
--   (all pending person imports)
--
-- Already generated (in this file or person SQL files):
-- - Cândido Pequeno (founding_mestre) - GENERATED ABOVE
-- - Aberrê (founding_mestre) - GENERATED ABOVE
-- - Geraldo Chapeleiro (founding_mestre) - GENERATED ABOVE
-- - Onça Preta (founding_mestre) - GENERATED ABOVE
-- - Noronha (dono_proprietario) - see noronha.sql
-- - Livino (dono_proprietario) - see livino.sql
-- - Totonho de Maré (dono_proprietario) - GENERATED ABOVE
-- - Amorzinho (dono_proprietario + roda_leader) - GENERATED ABOVE
--
-- MEMBERSHIP/ATTENDANCE:
-- - Pastinha member_of Gengibirra (Feb 23, 1941) - see pastinha.sql
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

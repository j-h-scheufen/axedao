-- ============================================================
-- GENEALOGY PERSON IMPORT: Amorzinho
-- Generated: 2025-12-11
-- Primary Source: Mestre Noronha manuscripts, velhosmestres.com, Portal Capoeira
-- ============================================================
-- DEPENDENCIES: groups/gengibirra.sql, persons/noronha.sql, persons/livino.sql, persons/totonho-de-mare.sql, persons/pastinha.sql, persons/aberre.sql
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (~1890-1900 with 'decade' precision):
-- No birth date documented. As a civil guard (guarda civil) leading rodas
-- and being one of the four "donos e proprietários" of Gengibirra founded in
-- the 1920s, Amorzinho was likely an established adult by then. He died in
-- 1943. If he was 40-55 at death, birth would be ~1888-1903.
-- Using 1895 as midpoint estimate with decade precision.
--
-- DEATH: 1943 - documented in Portal Capoeira article. Died shortly after
-- Aberrê (September 1942). His death triggered the dispersal of mestres and
-- eventually led to Pastinha assuming full leadership.
--
-- NAME: "Amorzinho" is his capoeira apelido (nickname meaning "little love").
-- Also spelled "Amouzinho" in some sources.
--
-- ============================================================

BEGIN;

-- ============================================================
-- PERSON PROFILE (all columns from genealogy.person_profiles)
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
  style_notes_en,
  style_notes_pt,
  -- Life dates
  birth_year,
  birth_year_precision,
  birth_place,
  death_year,
  death_year_precision,
  death_place,
  -- Extended content (bilingual)
  bio_en,
  bio_pt,
  achievements_en,
  achievements_pt,
  -- Researcher notes (bilingual)
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  NULL,  -- Full name unknown
  'Amorzinho',
  'mestre'::genealogy.title,
  NULL,
  '[{"type": "website", "url": "https://velhosmestres.com/en/featured-9"}, {"type": "website", "url": "https://nossa-tribo.com/mestre-totonho-de-mare/"}, {"type": "website", "url": "https://jogodavidaweb.wordpress.com/2017/02/23/criacao-do-centro-esportivo-de-capoeira-angola/"}, {"type": "website", "url": "https://portalcapoeira.com/capoeira/c-e-c-a-1-seculo-de-capoeira/"}, {"type": "website", "url": "https://papoeira.com/en/who-was-mestre-pastinha/"}, {"type": "website", "url": "https://www.lalaue.com/learn-capoeira/mestre-pastinha/"}]'::jsonb,
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional capoeira angola. Mestre Noronha remembered Amorzinho as skilled in "cabeceiro" (headwork/head techniques). He was known as one of "the greatest mestres of Bahia" in his era.',
  E'Capoeira angola tradicional. Mestre Noronha lembrava de Amorzinho como habilidoso em "cabeceiro" (técnicas de cabeça). Era conhecido como um dos "maiores mestres da Bahia" em sua época.',
  -- Life dates
  1895,
  'decade'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  1943,
  'year'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- Extended content (bio_en)
  E'Mestre Amorzinho was a civil guard (guarda civil) in Salvador, Bahia, and one of the most important figures in the founding of organized Capoeira Angola. His profession provided crucial protection for capoeiristas during an era when the art was still criminalized in Brazil, allowing the rodas at Gengibirra to flourish without police harassment.

In the 1920s, Amorzinho was among the 22 founding mestres who established the Centro Nacional de Capoeira de Origem Angola at Ladeira de Pedra in the Gengibirra area of the Liberdade neighborhood—the first organized center for Capoeira Angola in the state of Bahia. More than just a founding mestre, he was one of four "donos e proprietários" (owners and proprietors) of Gengibirra, alongside Mestre Noronha, his brother Livino, and Totonho de Maré.

Amorzinho served as the roda leader at Gengibirra, where the best capoeiristas of Salvador gathered on Sundays. Mestre Noronha remembered him as skilled in "cabeceiro" (head techniques), though he noted that Amorzinho "liked the branca" (white rum/cachaça). Despite this, he was described as one of "the greatest mestres of Bahia."

The pivotal moment in Amorzinho''s legacy came on February 23, 1941, when Raimundo Aberrê brought Mestre Pastinha to witness the Sunday roda at Gengibirra. According to Pastinha''s own account: "When I arrived there, I looked for the capoeira owner, who was Amorzinho, who was a civil guard. He called Amorzinho, Amorzinho in the grip of my hand went and handed over capoeira for me to take care of." Amorzinho reportedly said: "I have been waiting a long time to give you this capoeira for you to master."

However, Mestre Noronha''s manuscripts offer a different chronology, suggesting that the formal transfer of leadership occurred only after Amorzinho''s death. Noronha wrote: "Because of the death of Amorzinho, the guard, we handed over the Centre to Mestre Pastinha to take care."

Amorzinho died in 1943, shortly after Aberrê passed away in September 1942. His death had a profound impact on the nascent Capoeira Angola organization. According to sources, "with Amorzinho''s death, CECA was abandoned by all the Masters." The center would only fully recover and "gain momentum" (engrenaria) in 1955.

The legacy of Amorzinho lives on through his role in establishing the organizational foundation that Mestre Pastinha would later develop into the Centro Esportivo de Capoeira Angola (CECA). His position as a civil guard who used his authority to protect rather than persecute capoeiristas represents a crucial transition in capoeira''s history from an outlawed practice to an organized cultural tradition.',
  -- bio_pt
  E'Mestre Amorzinho era um guarda civil em Salvador, Bahia, e uma das figuras mais importantes na fundação da Capoeira Angola organizada. Sua profissão oferecia proteção crucial para os capoeiristas durante uma era em que a arte ainda era criminalizada no Brasil, permitindo que as rodas no Gengibirra prosperassem sem assédio policial.

Na década de 1920, Amorzinho estava entre os 22 mestres fundadores que estabeleceram o Centro Nacional de Capoeira de Origem Angola na Ladeira de Pedra, na área do Gengibirra, no bairro da Liberdade—o primeiro centro organizado de Capoeira Angola no estado da Bahia. Mais do que um mestre fundador, ele era um dos quatro "donos e proprietários" do Gengibirra, ao lado de Mestre Noronha, seu irmão Livino e Totonho de Maré.

Amorzinho servia como líder de roda no Gengibirra, onde os melhores capoeiristas de Salvador se reuniam aos domingos. Mestre Noronha o lembrava como habilidoso em "cabeceiro" (técnicas de cabeça), embora tenha notado que Amorzinho "gostava da branquinha" (cachaça). Apesar disso, era descrito como um dos "maiores mestres da Bahia."

O momento crucial no legado de Amorzinho veio em 23 de fevereiro de 1941, quando Raimundo Aberrê trouxe Mestre Pastinha para assistir à roda de domingo no Gengibirra. Segundo o próprio relato de Pastinha: "Quando eu cheguei lá, ele procurou o dono da capoeira, que era o Amorzinho, que era um guarda civil. Chamou o Amorzinho, o Amorzinho no aperto da minha mão foi e entregou a capoeira pra eu tomar conta." Amorzinho teria dito: "Há muito tempo espero para lhe dar esta capoeira para você comandar."

No entanto, os manuscritos de Mestre Noronha oferecem uma cronologia diferente, sugerindo que a transferência formal de liderança ocorreu apenas após a morte de Amorzinho. Noronha escreveu: "Por causa da morte de Amorzinho, o guarda, nós entregamos o Centro a Mestre Pastinha para cuidar."

Amorzinho morreu em 1943, pouco depois de Aberrê falecer em setembro de 1942. Sua morte teve um impacto profundo na nascente organização de Capoeira Angola. Segundo as fontes, "com o falecimento de Amorzinho, o CECA foi abandonado por todos os Mestres." O centro só se recuperaria totalmente e "engrenaria" de vez em 1955.

O legado de Amorzinho vive através de seu papel em estabelecer a fundação organizacional que Mestre Pastinha posteriormente desenvolveria no Centro Esportivo de Capoeira Angola (CECA). Sua posição como guarda civil que usou sua autoridade para proteger em vez de perseguir capoeiristas representa uma transição crucial na história da capoeira de uma prática proibida para uma tradição cultural organizada.',
  -- achievements_en
  E'One of four "donos e proprietários" (organizational leaders) of Gengibirra alongside Noronha, Livino, and Totonho de Maré
One of 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola (1920s)
Roda leader at Gengibirra
Used position as civil guard to protect capoeiristas from police harassment during criminalization era
Passed leadership of Capoeira Angola to Mestre Pastinha (1941)
His protection enabled the preservation and organization of traditional Capoeira Angola',
  -- achievements_pt
  E'Um dos quatro "donos e proprietários" (líderes organizacionais) do Gengibirra ao lado de Noronha, Livino e Totonho de Maré
Um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola (década de 1920)
Líder de roda no Gengibirra
Usou sua posição como guarda civil para proteger capoeiristas do assédio policial durante a era de criminalização
Passou a liderança da Capoeira Angola para Mestre Pastinha (1941)
Sua proteção permitiu a preservação e organização da Capoeira Angola tradicional',
  -- notes_en
  E'BIRTH YEAR ESTIMATION (1895, decade precision): No birth date documented. As a civil guard leading rodas and being one of the four "donos e proprietários" of Gengibirra founded in the 1920s, Amorzinho was likely an established adult by then. He died in 1943. If he was 40-55 at death, birth would be ~1888-1903. Using 1895 as midpoint estimate.

DEATH: 1943 per Portal Capoeira article. Died shortly after Aberrê (September 1942). His death triggered the dispersal of mestres from CECA.

NAME VARIANTS: Amorzinho (primary), Amouzinho (alternate spelling). "Amorzinho" means "little love" in Portuguese.

CHARACTER NOTE: Mestre Noronha described him as skilled in "cabeceiro" (headwork) but noted he "gostava da branquinha" (liked white rum/cachaça). Despite this, he was called one of "the greatest mestres of Bahia."

CHRONOLOGY CONFLICT: Two versions exist for the transfer of leadership to Pastinha:
1. Pastinha''s account: Amorzinho handed him leadership at the roda on Feb 23, 1941
2. Noronha''s account: Leadership was formally transferred AFTER Amorzinho''s death in 1943
Both may be true: Amorzinho may have expressed his wish in 1941, but formal transfer occurred after his death.

OCCUPATION: Civil guard (guarda civil) - this was crucial as his position provided protection from police harassment during the criminalization era.

PENDING RELATIONSHIPS:
- Amorzinho associated_with Livino (co-founder of Gengibirra) - requires statement creation
- Amorzinho associated_with Aberrê (invited Pastinha to Gengibirra; died 1942, shortly before Amorzinho)',
  -- notes_pt
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1895, precisão de década): Nenhuma data de nascimento documentada. Como guarda civil liderando rodas e sendo um dos quatro "donos e proprietários" do Gengibirra fundado na década de 1920, Amorzinho provavelmente era um adulto estabelecido na época. Morreu em 1943. Se tinha 40-55 anos na morte, nascimento seria ~1888-1903. Usando 1895 como estimativa do ponto médio.

MORTE: 1943 per artigo do Portal Capoeira. Morreu pouco depois de Aberrê (setembro de 1942). Sua morte desencadeou a dispersão dos mestres do CECA.

VARIANTES DE NOME: Amorzinho (principal), Amouzinho (grafia alternativa). "Amorzinho" significa "pequeno amor" em português.

NOTA DE CARÁTER: Mestre Noronha o descreveu como habilidoso em "cabeceiro" mas notou que ele "gostava da branquinha" (cachaça). Apesar disso, era chamado de um dos "maiores mestres da Bahia."

CONFLITO CRONOLÓGICO: Duas versões existem para a transferência de liderança para Pastinha:
1. Relato de Pastinha: Amorzinho lhe passou a liderança na roda em 23 de fevereiro de 1941
2. Relato de Noronha: A liderança foi formalmente transferida APÓS a morte de Amorzinho em 1943
Ambas podem ser verdadeiras: Amorzinho pode ter expressado seu desejo em 1941, mas a transferência formal ocorreu após sua morte.

PROFISSÃO: Guarda civil - isso foi crucial pois sua posição fornecia proteção contra assédio policial durante a era de criminalização.

RELACIONAMENTOS PENDENTES:
- Amorzinho associated_with Livino (co-fundador do Gengibirra) - requer criação de statement
- Amorzinho associated_with Aberrê (convidou Pastinha para Gengibirra; morreu em 1942, pouco antes de Amorzinho)'
)
ON CONFLICT (apelido, COALESCE(apelido_context, '')) WHERE apelido IS NOT NULL DO UPDATE SET
  name = EXCLUDED.name,
  title = EXCLUDED.title,
  portrait = EXCLUDED.portrait,
  public_links = EXCLUDED.public_links,
  style = EXCLUDED.style,
  style_notes_en = EXCLUDED.style_notes_en,
  style_notes_pt = EXCLUDED.style_notes_pt,
  birth_year = EXCLUDED.birth_year,
  birth_year_precision = EXCLUDED.birth_year_precision,
  birth_place = EXCLUDED.birth_place,
  death_year = EXCLUDED.death_year,
  death_year_precision = EXCLUDED.death_year_precision,
  death_place = EXCLUDED.death_place,
  bio_en = EXCLUDED.bio_en,
  bio_pt = EXCLUDED.bio_pt,
  achievements_en = EXCLUDED.achievements_en,
  achievements_pt = EXCLUDED.achievements_pt,
  notes_en = EXCLUDED.notes_en,
  notes_pt = EXCLUDED.notes_pt,
  updated_at = NOW();

-- ============================================================
-- STATEMENTS (Relationships)
-- Only generate for entities that EXIST in our dataset
-- ============================================================

-- --- Person-to-Person: Contemporary Associations ---

-- Amorzinho associated_with Noronha (co-founder of Gengibirra)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, a.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, n.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Both were among the four ''donos e proprietários'' (owners and proprietors) of the Centro Nacional de Capoeira de Origem Angola at Gengibirra in the 1920s, alongside Livino and Totonho de Maré. Amorzinho led the rodas while Noronha provided organizational support."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com; nossa-tribo.com',
  'Amorzinho and Noronha were two of the four "owners and proprietors" of Gengibirra, co-founding the first organized Capoeira Angola center in Bahia. Noronha later documented Amorzinho''s role in his manuscripts.',
  'Amorzinho e Noronha foram dois dos quatro "donos e proprietários" do Gengibirra, co-fundando o primeiro centro organizado de Capoeira Angola na Bahia. Noronha depois documentou o papel de Amorzinho em seus manuscritos.'
FROM genealogy.person_profiles a, genealogy.person_profiles n
WHERE a.apelido = 'Amorzinho' AND n.apelido = 'Noronha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Amorzinho associated_with Totonho de Maré (co-founder of Gengibirra)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, a.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, t.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Both were among the four ''donos e proprietários'' (owners and proprietors) of the Centro Nacional de Capoeira de Origem Angola at Gengibirra in the 1920s, alongside Noronha and Livino."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com; nossa-tribo.com',
  'Amorzinho and Totonho de Maré were two of the four "owners and proprietors" of Gengibirra, co-founding the first organized Capoeira Angola center in Bahia.',
  'Amorzinho e Totonho de Maré foram dois dos quatro "donos e proprietários" do Gengibirra, co-fundando o primeiro centro organizado de Capoeira Angola na Bahia.'
FROM genealogy.person_profiles a, genealogy.person_profiles t
WHERE a.apelido = 'Amorzinho' AND t.apelido = 'Totonho de Maré'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Amorzinho associated_with Livino (co-founder of Gengibirra)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, a.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, l.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Both were among the four ''donos e proprietários'' (owners and proprietors) of the Centro Nacional de Capoeira de Origem Angola at Gengibirra in the 1920s, alongside Noronha and Totonho de Maré."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; velhosmestres.com; nossa-tribo.com',
  'Amorzinho and Livino were two of the four "owners and proprietors" of Gengibirra, co-founding the first organized Capoeira Angola center in Bahia.',
  'Amorzinho e Livino foram dois dos quatro "donos e proprietários" do Gengibirra, co-fundando o primeiro centro organizado de Capoeira Angola na Bahia.'
FROM genealogy.person_profiles a, genealogy.person_profiles l
WHERE a.apelido = 'Amorzinho' AND l.apelido = 'Livino'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Amorzinho associated_with Pastinha (handed leadership to him)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, a.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, p.id,
  '1941-02-23'::date, 'exact'::genealogy.date_precision,
  '1943-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Amorzinho handed leadership of the Centro Nacional de Capoeira de Origem Angola (Gengibirra) to Pastinha on February 23, 1941. According to Pastinha: ''Amorzinho in the grip of my hand went and handed over capoeira for me to take care of.'' Amorzinho reportedly said: ''I have been waiting a long time to give you this capoeira for you to master.''"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Pastinha account; Mestre Noronha manuscripts; velhosmestres.com; jogodavidaweb.wordpress.com',
  'Amorzinho passed leadership of Capoeira Angola to Pastinha in 1941. This transfer (whether on the day or after Amorzinho''s death in 1943) was foundational to CECA''s establishment.',
  'Amorzinho passou a liderança da Capoeira Angola para Pastinha em 1941. Esta transferência (seja no dia ou após a morte de Amorzinho em 1943) foi fundamental para o estabelecimento do CECA.'
FROM genealogy.person_profiles a, genealogy.person_profiles p
WHERE a.apelido = 'Amorzinho' AND p.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Amorzinho associated_with Aberrê (Aberrê brought Pastinha to Gengibirra)
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, a.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, ab.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '1942-09-01'::date, 'month'::genealogy.date_precision,
  '{"association_context": "Aberrê was one of the 22 founding mestres of Gengibirra (listed as ''Raimundo ABR'' in Noronha''s manuscripts) and a key associate of Amorzinho. In 1941, Aberrê brought Pastinha to the Gengibirra roda and introduced him to Amorzinho, facilitating the transfer of leadership. Aberrê died in September 1942, shortly before Amorzinho died in 1943."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts; Pastinha account; Portal Capoeira',
  'Aberrê was a founding mestre of Gengibirra who brought Pastinha to meet Amorzinho in 1941. Both died within months of each other (Aberrê Sept 1942, Amorzinho 1943).',
  'Aberrê era um mestre fundador do Gengibirra que trouxe Pastinha para conhecer Amorzinho em 1941. Ambos morreram com meses de diferença (Aberrê set. 1942, Amorzinho 1943).'
FROM genealogy.person_profiles a, genealogy.person_profiles ab
WHERE a.apelido = 'Amorzinho' AND ab.apelido = 'Aberrê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- --- Person-to-Group: Founding & Leadership ---

-- Amorzinho co_founded Gengibirra (1920s) - as dono e proprietário
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  ended_at, ended_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"founding_role": "dono_proprietario"}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com; nossa-tribo.com',
  'One of four "donos e proprietários" (organizational leaders) of Gengibirra alongside Noronha, Livino, and Totonho de Maré. Also one of the 22 founding mestres of the Centro Nacional de Capoeira de Origem Angola.',
  'Um dos quatro "donos e proprietários" (líderes organizacionais) do Gengibirra ao lado de Noronha, Livino e Totonho de Maré. Também um dos 22 mestres fundadores do Centro Nacional de Capoeira de Origem Angola.'
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
  properties,
  confidence, source, notes_en, notes_pt
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
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/amorzinho.sql',
  NULL,
  ARRAY['groups/gengibirra.sql', 'persons/noronha.sql', 'persons/livino.sql', 'persons/totonho-de-mare.sql', 'persons/pastinha.sql', 'persons/aberre.sql']::text[],
  'Civil guard (~1895-1943); one of four "donos e proprietários" of Gengibirra; roda leader; passed leadership to Pastinha; his protection enabled capoeira during criminalization era'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;

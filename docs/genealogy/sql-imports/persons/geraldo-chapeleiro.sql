-- ============================================================
-- GENEALOGY PERSON IMPORT: Geraldo Chapeleiro
-- Generated: 2025-12-09
-- Primary Source: https://velhosmestres.com/br/destaques-2
-- ============================================================
-- DEPENDENCIES: groups/gengibirra.sql, groups/roda-do-matatu-preto.sql
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (1900 with 'decade' precision):
-- Active capoeirista at Matatu Preto training circle in 1935.
-- Co-founder of Centro de Capoeira Angola at Ladeira de Pedra in 1920s.
-- If 25-45 years old when founding in early 1920s, birth = ~1875-1900.
-- If 35-50 when active at Matatu Preto in 1935, birth = ~1885-1900.
-- Using 1900 as reasonable estimate for someone active in both periods.
--
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
  NULL,
  'Geraldo Chapeleiro',
  NULL,
  NULL,
  '[]'::jsonb,
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional capoeira Angola practitioner from Salvador, Bahia. Active in the Gengibirra era. Style distinctions (Angola/Regional) were just emerging during his active period.',
  E'Praticante tradicional de capoeira Angola de Salvador, Bahia. Ativo na era da Gengibirra. As distinções de estilo (Angola/Regional) estavam apenas emergindo durante seu período de atividade.',
  -- Life dates
  1900,
  'decade'::genealogy.date_precision,
  'Salvador, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Geraldo Chapeleiro was one of the founding mestres of the Centro de Capoeira Angola at Ladeira de Pedra in the Liberdade neighborhood of Salvador, Bahia during the 1920s. This center, also known as Gengibirra, was the first organized capoeira Angola institution in the state of Bahia.\n\nHe was part of an illustrious group of 22 founding mestres that included Mestre Noronha, Livino, Maré, Amorzinho, Juvenal Engraxate, Onça Preta, Cândido Pequeno, and others. The colors of the center were green and yellow, the colors of the Brazilian flag, and they established clear combat rules for their capoeira Angola practice.\n\nGeraldo Chapeleiro was also a regular participant in the Sunday rodas at Matatu Preto in the Matatu neighborhood. According to Mestre Canjiquinha''s testimony from 1935, he was among the capoeiristas who gathered there: "There, on Sundays, all these capoeiristas would come - Onça Preta, Geraldo Chapeleiro, Totonho Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha, the late Barboza, and this citizen called Antonio Raimundo, nicknamed by everyone Aberrê."\n\nIn 1941, along with the other surviving founding mestres, Geraldo Chapeleiro participated in handing over their Centro Nacional de Capoeira de Origem Angola to Mestre Pastinha, who would go on to elevate the center to prominence. This transfer occurred after the death of Amorzinho, who had been the guard and a key leader of the group.\n\nHis name is preserved through the testimonies of old mestres and in the songs (cantigas) of capoeira, keeping his memory alive in the collective consciousness of the capoeira community.',
  E'Geraldo Chapeleiro foi um dos mestres fundadores do Centro de Capoeira Angola na Ladeira de Pedra, no bairro da Liberdade, em Salvador, Bahia, durante a década de 1920. Este centro, também conhecido como Gengibirra, foi a primeira instituição organizada de capoeira Angola no estado da Bahia.\n\nEle fez parte de um ilustre grupo de 22 mestres fundadores que incluía Mestre Noronha, Livino, Maré, Amorzinho, Juvenal Engraxate, Onça Preta, Cândido Pequeno e outros. As cores do centro eram verde e amarelo, as cores da bandeira brasileira, e eles estabeleceram regras claras de combate para a prática da capoeira Angola.\n\nGeraldo Chapeleiro também era participante assíduo das rodas de domingo no Matatu Preto, no bairro do Matatu. De acordo com o depoimento de Mestre Canjiquinha de 1935, ele estava entre os capoeiristas que se reuniam lá: "Lá, aos domingos, vinham todos esses capoeiristas - Onça Preta, Geraldo Chapeleiro, Totonho Maré, Creoni, Chico Três Pedaços, Pedro Paulo Barroquinha, finado Barboza, e esse cidadão chamado Antônio Raimundo, apelidado por todos de Aberrê."\n\nEm 1941, junto com os outros mestres fundadores sobreviventes, Geraldo Chapeleiro participou da entrega do Centro Nacional de Capoeira de Origem Angola para Mestre Pastinha, que elevaria o centro à proeminência. Esta transferência ocorreu após a morte de Amorzinho, que era o guarda e um líder chave do grupo.\n\nSeu nome é preservado através dos depoimentos dos velhos mestres e nas cantigas de capoeira, mantendo sua memória viva na consciência coletiva da comunidade capoeirista.',
  -- Achievements
  'Co-founder of the first organized Capoeira Angola center in Bahia (Gengibirra, 1920s)',
  'Cofundador do primeiro centro organizado de Capoeira Angola na Bahia (Gengibirra, década de 1920)',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1900, decade precision): Active capoeirista at Matatu Preto training circle in 1935. Co-founder of Centro de Capoeira Angola at Ladeira de Pedra in 1920s. If 25-45 years old when founding in early 1920s, birth = ~1875-1900. If 35-50 when active at Matatu Preto in 1935, birth = ~1885-1900. Using 1900 as reasonable estimate.\n\nDEATH: Unknown. No records of his death have been found.\n\nNAME: Only known by the apelido "Geraldo Chapeleiro." "Chapeleiro" means hatmaker/hatter in Portuguese, likely indicating his profession.\n\nSOURCES: Primary source is Mestre Canjiquinha''s testimony (1989) about the Matatu Preto gatherings circa 1935, and Mestre Noronha''s manuscripts about the Gengibirra founding.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1900, precisão de década): Capoeirista ativo no círculo de treino do Matatu Preto em 1935. Cofundador do Centro de Capoeira Angola na Ladeira de Pedra nos anos 1920. Se tinha 25-45 anos quando fundou no início dos anos 1920, nascimento = ~1875-1900. Se tinha 35-50 anos quando ativo no Matatu Preto em 1935, nascimento = ~1885-1900. Usando 1900 como estimativa razoável.\n\nMORTE: Desconhecida. Nenhum registro de sua morte foi encontrado.\n\nNOME: Conhecido apenas pelo apelido "Geraldo Chapeleiro." "Chapeleiro" significa fabricante de chapéus em português, provavelmente indicando sua profissão.\n\nFONTES: Fonte primária é o depoimento de Mestre Canjiquinha (1989) sobre os encontros do Matatu Preto por volta de 1935, e os manuscritos de Mestre Noronha sobre a fundação da Gengibirra.'
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
-- ============================================================

-- NOTE: Generic "trained together at Matatu Preto" associations removed.
-- Co-attendance is now captured via member_of Roda de Trapiche de Baixo.
-- Only specific documented interactions should be person-to-person.

-- --- Person-to-Group: Co-founded Gengibirra ---

-- Geraldo Chapeleiro co_founded Gengibirra
INSERT INTO genealogy.statements (
  subject_type, subject_id,
  predicate,
  object_type, object_id,
  started_at, started_at_precision,
  properties,
  confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, p.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Noronha manuscripts via velhosmestres.com',
  'One of 22 founding mestres of the Centro de Capoeira Angola at Ladeira de Pedra (Gengibirra).',
  'Um dos 22 mestres fundadores do Centro de Capoeira Angola na Ladeira de Pedra (Gengibirra).'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Geraldo Chapeleiro' AND g.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- --- Person-to-Group: Membership at Roda do Matatu Preto ---

-- Geraldo Chapeleiro member_of Roda do Matatu Preto
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
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  '1930-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"membership_context": "Regular participant in Sunday training sessions at Matatu Preto in the 1930s."}'::jsonb,
  'verified'::genealogy.confidence,
  'Mestre Canjiquinha testimony (1989); velhosmestres.com',
  'Regular at the Matatu Preto Sunday training sessions in Salvador during the 1930s, alongside Aberrê, Onça Preta, Totonho de Maré, and others.',
  'Frequentador das sessões de treino de domingo no Matatu Preto em Salvador durante os anos 1930, ao lado de Aberrê, Onça Preta, Totonho de Maré e outros.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Geraldo Chapeleiro' AND g.name = 'Roda do Matatu Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/geraldo-chapeleiro.sql',
  NULL,
  ARRAY['groups/gengibirra.sql', 'groups/roda-do-matatu-preto.sql']::text[],
  'Founding mestre of Centro de Capoeira Angola (Gengibirra) 1920s; regular at Matatu Preto training circle 1935'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;

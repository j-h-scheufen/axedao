-- ============================================================
-- GENEALOGY PERSON IMPORT: Chico Três Pedaços
-- Generated: 2025-12-09
-- Primary Source: https://issuu.com/revistacapoeirando/docs/capoeirando_ed_3/s/29434691
-- ============================================================
-- DEPENDENCIES: groups/roda-do-matatu-preto.sql
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (1895 with 'decade' precision):
-- First documented legal case is from 1923 (attacking police officer).
-- Second documented case is from July 23, 1927 (headbutt assault).
-- If 25-35 years old during these incidents, birth = ~1888-1902.
-- Using 1895 as midpoint estimate.
-- Active at Matatu Preto training circle in 1935.
-- Mentioned by Mestre Pastinha among legendary capoeiristas.
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
  'João Francisco Pires',
  'Chico Três Pedaços',
  NULL,
  NULL,
  '[{"type": "website", "url": "https://issuu.com/revistacapoeirando/docs/capoeirando_ed_3/s/29434691"}]'::jsonb,
  -- Capoeira-specific
  'angola'::genealogy.style,
  E'Traditional capoeira practitioner from Salvador, Bahia. Active in the First Republic era (1920s-1930s). Known for his street fighting skills and use of capoeira techniques including the cabeçada (headbutt). Style distinctions (Angola/Regional) were just emerging during his active period.',
  E'Praticante tradicional de capoeira de Salvador, Bahia. Ativo na era da Primeira República (1920s-1930s). Conhecido por suas habilidades de luta de rua e uso de técnicas de capoeira incluindo a cabeçada. As distinções de estilo (Angola/Regional) estavam apenas emergindo durante seu período de atividade.',
  -- Life dates
  1895,
  'decade'::genealogy.date_precision,
  'Salvador, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'João Francisco Pires, known as Chico Três Pedaços (meaning "Chico Three Pieces"), was one of the most notorious capoeiristas of early 20th century Salvador, Bahia. His nickname alone reveals something of his character - Mestre Pastinha noted that "just by the nicknames you can tell what they were like, how they fought."\n\nHis reputation as a valentão (tough guy) is documented through multiple court cases preserved in the Public Archive of the State of Bahia. In 1923, he was denounced for wounding police officer Ludgero Alves de Sant''Anna with a razor. On the night of July 23, 1927, in the historic center of Salvador (now the Pelourinho Historic Center), he was accused of injuring José Raymundo dos Santos with a cabeçada (headbutt) at a café called "Café Para Todos." Three witnesses testified against him, but a forensic examination contradicted the accusations, and he was acquitted.\n\nIn total, there are four legal processes against Três Pedaços in the state archives - one for theft and three for bodily harm. He was among the capoeiristas defended by Major Cosme de Farias, the legendary "rábula" (self-taught lawyer) who defended over 30,000 people including thieves, prostitutes, gamblers, and the poor. Farias employed emotional appeals rather than strict legal arguments, portraying his clients as "defenseless people trusting in justice''s righteousness."\n\nChico Três Pedaços was also part of the regular Sunday rodas at Matatu Preto in the Matatu neighborhood, alongside Onça Preta, Geraldo Chapeleiro, Totonho Maré, Creoni, Pedro Paulo Barroquinha, Barboza, and Mestre Aberrê. According to Mestre Canjiquinha''s testimony, these gatherings were a vital part of the capoeira community in Salvador during the 1930s.\n\nMestre Pastinha included Três Pedaços in his roster of legendary capoeiristas of past generations, alongside names like Bigode de Seda, Américo Ciência, Amorzinho, Doze Homens, and others. The book "Mestres e capoeiras famosos da Bahia" features him with the subtitle "Faca de corte" (Sharp blade), a testament to his formidable reputation.\n\nMany of the capoeiristas like Três Pedaços were alleged to have served as political operatives (capangas) for governors Joaquim José de Seabra (1855-1942) and Antônio Moniz (1881-1940), reflecting the complex relationship between capoeira, street violence, and political power during the First Republic.',
  E'João Francisco Pires, conhecido como Chico Três Pedaços, foi um dos capoeiristas mais notórios do início do século XX em Salvador, Bahia. Seu apelido por si só revela algo de seu caráter - Mestre Pastinha observou que "só pelos apelidos dá para saber como eram, como lutavam."\n\nSua reputação como valentão é documentada através de múltiplos processos judiciais preservados no Arquivo Público do Estado da Bahia. Em 1923, ele foi denunciado por ferir o policial Ludgero Alves de Sant''Anna com uma navalha. Na noite de 23 de julho de 1927, no centro histórico de Salvador (atual Centro Histórico do Pelourinho), ele foi acusado de ferir José Raymundo dos Santos com uma cabeçada em um café chamado "Café Para Todos." Três testemunhas depuseram contra ele, mas um exame forense contradisse as acusações, e ele foi absolvido.\n\nNo total, há quatro processos legais contra Três Pedaços nos arquivos estaduais - um por furto e três por lesões corporais. Ele estava entre os capoeiristas defendidos pelo Major Cosme de Farias, o lendário "rábula" (advogado autodidata) que defendeu mais de 30.000 pessoas incluindo ladrões, prostitutas, jogadores e pobres. Farias empregava apelos emocionais ao invés de argumentos legais estritos, retratando seus clientes como "pessoas indefesas confiando na retidão da justiça."\n\nChico Três Pedaços também fazia parte das rodas regulares de domingo no Matatu Preto, no bairro do Matatu, junto com Onça Preta, Geraldo Chapeleiro, Totonho Maré, Creoni, Pedro Paulo Barroquinha, Barboza e Mestre Aberrê. De acordo com o depoimento de Mestre Canjiquinha, esses encontros eram uma parte vital da comunidade capoeirista em Salvador durante a década de 1930.\n\nMestre Pastinha incluiu Três Pedaços em sua lista de capoeiristas lendários de gerações passadas, junto com nomes como Bigode de Seda, Américo Ciência, Amorzinho, Doze Homens e outros. O livro "Mestres e capoeiras famosos da Bahia" o apresenta com o subtítulo "Faca de corte", um testemunho de sua formidável reputação.\n\nMuitos dos capoeiristas como Três Pedaços eram supostamente capangas políticos dos governadores Joaquim José de Seabra (1855-1942) e Antônio Moniz (1881-1940), refletindo a complexa relação entre capoeira, violência de rua e poder político durante a Primeira República.',
  -- Achievements
  'Listed among legendary capoeiristas by Mestre Pastinha; featured in "Mestres e capoeiras famosos da Bahia" with subtitle "Faca de corte" (Sharp blade)',
  'Listado entre os capoeiristas lendários por Mestre Pastinha; apresentado em "Mestres e capoeiras famosos da Bahia" com subtítulo "Faca de corte"',
  -- Researcher notes (bilingual)
  E'BIRTH YEAR ESTIMATION (1895, decade precision): First documented legal case is from 1923 (attacking police officer). Second documented case is from July 23, 1927 (headbutt assault). If 25-35 years old during these incidents, birth = ~1888-1902. Using 1895 as midpoint estimate.\n\nDEATH: Unknown. No records of his death have been found.\n\nNAME: Full name João Francisco Pires documented in court records. "Três Pedaços" meaning "Three Pieces" - origin of nickname unclear but likely related to his fighting prowess.\n\nLEGAL RECORDS: Four cases in Arquivo Público do Estado da Bahia - one theft, three bodily harm. Additional case from 1923 involving police officer Ludgero Alves de Sant''Anna.\n\nSOURCES: Primary sources are court records via Revista Capoeirando article, Mestre Canjiquinha''s testimony (1989) about Matatu Preto gatherings, and Mestre Pastinha''s 1967 interview listing legendary capoeiristas.',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1895, precisão de década): Primeiro caso legal documentado é de 1923 (atacando policial). Segundo caso documentado é de 23 de julho de 1927 (agressão com cabeçada). Se tinha 25-35 anos durante esses incidentes, nascimento = ~1888-1902. Usando 1895 como estimativa do ponto médio.\n\nMORTE: Desconhecida. Nenhum registro de sua morte foi encontrado.\n\nNOME: Nome completo João Francisco Pires documentado em registros judiciais. "Três Pedaços" significando "Três Pedaços" - origem do apelido incerta mas provavelmente relacionada à sua habilidade de luta.\n\nREGISTROS LEGAIS: Quatro casos no Arquivo Público do Estado da Bahia - um furto, três lesões corporais. Caso adicional de 1923 envolvendo policial Ludgero Alves de Sant''Anna.\n\nFONTES: Fontes primárias são registros judiciais via artigo da Revista Capoeirando, depoimento de Mestre Canjiquinha (1989) sobre os encontros do Matatu Preto, e entrevista de Mestre Pastinha de 1967 listando capoeiristas lendários.'
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

-- --- Person-to-Group: Membership at Roda do Matatu Preto ---

-- Chico Três Pedaços member_of Roda do Matatu Preto
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
  'Mestre Canjiquinha testimony (1989); velhosmestres.com/br/destaques-2',
  'Part of the Matatu Preto Sunday training group in Salvador during the 1930s, alongside Aberrê, Onça Preta, Geraldo Chapeleiro, Totonho de Maré, Creoni, Paulo Barroquinha, and Barboza.',
  'Parte do grupo de treino de domingo no Matatu Preto em Salvador durante os anos 1930, ao lado de Aberrê, Onça Preta, Geraldo Chapeleiro, Totonho de Maré, Creoni, Paulo Barroquinha e Barboza.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Chico Três Pedaços' AND g.name = 'Roda do Matatu Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- --- Person-to-Person: Associations ---

-- Chico Três Pedaços associated_with Aberrê (Matatu Preto training circle)
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
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1935-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were regular participants in the Sunday rodas at Matatu Preto in Salvador; documented in Mestre Canjiquinha''s testimony (1989)"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mestre Canjiquinha testimony (1989), velhosmestres.com',
  'Fellow capoeiristas who trained together at Matatu Preto training circle',
  'Capoeiristas que treinavam juntos no círculo de treino do Matatu Preto'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chico Três Pedaços' AND o.apelido = 'Aberrê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Chico Três Pedaços associated_with Geraldo Chapeleiro (Matatu Preto training circle)
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
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1935-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were regular participants in the Sunday rodas at Matatu Preto in Salvador; documented in Mestre Canjiquinha''s testimony (1989)"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mestre Canjiquinha testimony (1989), velhosmestres.com',
  'Fellow capoeiristas who trained together at Matatu Preto training circle',
  'Capoeiristas que treinavam juntos no círculo de treino do Matatu Preto'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chico Três Pedaços' AND o.apelido = 'Geraldo Chapeleiro'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Chico Três Pedaços associated_with Onça Preta (Matatu Preto training circle)
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
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1935-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were regular participants in the Sunday rodas at Matatu Preto in Salvador; documented in Mestre Canjiquinha''s testimony (1989)"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mestre Canjiquinha testimony (1989), velhosmestres.com',
  'Fellow capoeiristas who trained together at Matatu Preto training circle',
  'Capoeiristas que treinavam juntos no círculo de treino do Matatu Preto'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chico Três Pedaços' AND o.apelido = 'Onça Preta'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Chico Três Pedaços associated_with Paulo Barroquinha (Matatu Preto training circle)
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
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1935-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were regular participants in the Sunday rodas at Matatu Preto in Salvador; documented in Mestre Canjiquinha''s testimony (1989)"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mestre Canjiquinha testimony (1989), velhosmestres.com',
  'Fellow capoeiristas who trained together at Matatu Preto training circle',
  'Capoeiristas que treinavam juntos no círculo de treino do Matatu Preto'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chico Três Pedaços' AND o.apelido = 'Paulo Barroquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Chico Três Pedaços associated_with Creoni (Matatu Preto training circle)
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
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1935-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Both were regular participants in the Sunday rodas at Matatu Preto in Salvador; documented in Mestre Canjiquinha''s testimony (1989)"}'::jsonb,
  'likely'::genealogy.confidence,
  'Mestre Canjiquinha testimony (1989), velhosmestres.com',
  'Fellow capoeiristas who trained together at Matatu Preto training circle',
  'Capoeiristas que treinavam juntos no círculo de treino do Matatu Preto'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Chico Três Pedaços' AND o.apelido = 'Creoni'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/chico-tres-pedacos.sql',
  NULL,
  ARRAY['groups/roda-do-matatu-preto.sql']::text[],
  'Notorious Salvador capoeirista (1920s-1930s); legal records document multiple incidents; regular at Matatu Preto training circle; listed by Mestre Pastinha among legendary figures'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;

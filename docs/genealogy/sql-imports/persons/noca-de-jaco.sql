-- ============================================================
-- GENEALOGY PERSON IMPORT: Noca de Jacó
-- Generated: 2025-12-09
-- Primary Source: https://velhosmestres.com/br/besouro
-- ============================================================
-- DEPENDENCIES: persons/besouro-manganga.sql, groups/roda-de-trapiche-de-baixo.sql
-- NOTE: Person-to-person dependencies removed; co-attendance now via group membership
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (1890 with 'decade' precision):
-- Noca de Jacó was a companion of Besouro Mangangá (b. 1895, d. 1924) in the
-- capoeira rodas of Trapiche de Baixo. As an adult companion (not student),
-- he was likely within 5-10 years of Besouro's age. If Besouro was born 1895
-- and they were contemporaries in the 1910s-1920s, Noca de Jacó was likely
-- born 1885-1900. Using 1890 as midpoint estimate.
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
  -- Researcher notes
  notes_en,
  notes_pt
) VALUES (
  -- Identity
  'Ernesto Ferreira da Silva',
  'Noca de Jacó',
  NULL,
  NULL,
  '[]'::jsonb,
  -- Capoeira-specific
  NULL,
  E'Pre-modern era capoeira; practiced before style distinctions (Angola/Regional) existed. Part of the oral tradition era in Santo Amaro da Purificação.',
  E'Capoeira da era pré-moderna; praticava antes das distinções de estilo (Angola/Regional). Parte da era de tradição oral em Santo Amaro da Purificação.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Santo Amaro da Purificação, Bahia, Brazil',
  NULL,
  'unknown'::genealogy.date_precision,
  NULL,
  -- Extended content (bilingual)
  E'Noca de Jacó, whose full name was Ernesto Ferreira da Silva, was a capoeirista from Santo Amaro da Purificação who trained alongside the legendary Besouro Mangangá in the early 20th century. His apelido likely references a connection to someone named Jacó - perhaps his father or mentor ("Noca of Jacó").\n\nAccording to Professor Leiteiro, Noca de Jacó was among the companions of Besouro alongside Paulo Barroquinha, Boca de Siri, Doze Homens, and Canário Pardo. All were residents of Trapiche de Baixo - described as "the poorest neighborhood of Santo Amaro" - and "were his companions in the memorable capoeira rodas that hypnotized anybody who would go by."\n\nThese Sunday gatherings in Trapiche de Baixo and at folk parties were where the young Besouro first made a name for himself, distinguished by "agility, the quickness of thought, the calmness and the surprise, besides having a body closed by strong sorcery and prayers."\n\nNoca de Jacó is documented in academic scholarship - his name appears in "Mestres e capoeiras famosos da Bahia" (Famous Masters and Capoeiristas of Bahia), a scholarly work available on JSTOR, with a chapter titled "Noca de Jacó: Mulher de amigo meu..." (Noca de Jacó: My friend''s woman...). The chapter title suggests he may have been involved in a notable incident or story involving another man''s wife.\n\nBeyond these references, little else is recorded about Noca de Jacó. Like many of his contemporaries in the Trapiche de Baixo circle, he exists in history primarily as a name in the oral tradition, one of the practitioners who shaped the legendary era of Bahian capoeira in Santo Amaro alongside Besouro Mangangá.',
  E'Noca de Jacó, cujo nome completo era Ernesto Ferreira da Silva, foi um capoeirista de Santo Amaro da Purificação que treinou ao lado do lendário Besouro Mangangá no início do século XX. Seu apelido provavelmente faz referência a uma conexão com alguém chamado Jacó - talvez seu pai ou mentor ("Noca de Jacó").\n\nSegundo o Professor Leiteiro, Noca de Jacó estava entre os companheiros de Besouro junto com Paulo Barroquinha, Boca de Siri, Doze Homens e Canário Pardo. Todos eram moradores do Trapiche de Baixo - descrito como "o bairro mais pobre de Santo Amaro" - e "eram seus companheiros nas memoráveis rodas de capoeira que hipnotizavam qualquer um que passasse."\n\nEsses encontros de domingo no Trapiche de Baixo e nas festas populares eram onde o jovem Besouro começou a fazer seu nome, distinguido por "agilidade, rapidez de pensamento, calma e surpresa, além de ter um corpo fechado por fortes feitiçarias e orações."\n\nNoca de Jacó está documentado na literatura acadêmica - seu nome aparece em "Mestres e capoeiras famosos da Bahia," uma obra acadêmica disponível na JSTOR, com um capítulo intitulado "Noca de Jacó: Mulher de amigo meu..." O título do capítulo sugere que ele pode ter estado envolvido em um incidente ou história notável envolvendo a esposa de outro homem.\n\nAlém dessas referências, pouco mais está registrado sobre Noca de Jacó. Como muitos de seus contemporâneos no círculo do Trapiche de Baixo, ele existe na história principalmente como um nome na tradição oral, um dos praticantes que moldou a era lendária da capoeira baiana em Santo Amaro ao lado de Besouro Mangangá.',
  NULL,
  NULL,
  -- Researcher notes
  E'BIRTH YEAR ESTIMATION (1890, decade precision): Companion of Besouro Mangangá (b. 1895, d. 1924) in Trapiche de Baixo rodas. As a contemporary adult companion, likely within 5-10 years of Besouro''s age. Using 1890 as midpoint estimate.\n\nFULL NAME: Ernesto Ferreira da Silva (per CDO Sergipe website listing of mestres da capoeiragem).\n\nDEATH: Unknown. No records found.\n\nNAME MEANING: "Noca de Jacó" likely means "Noca [of] Jacó" - possibly indicating his father or mentor was named Jacó.\n\nACADEMIC REFERENCE: Documented in "Mestres e capoeiras famosos da Bahia" (JSTOR) with chapter "Noca de Jacó: Mulher de amigo meu..." suggesting an incident involving another man''s wife.\n\nPENDING RELATIONSHIPS:\n- Noca de Jacó associated_with Besouro Mangangá (companions at Trapiche de Baixo)\n- Noca de Jacó associated_with Paulo Barroquinha (companions at Trapiche de Baixo)\n- Noca de Jacó associated_with Boca de Siri (companions at Trapiche de Baixo)\n- Noca de Jacó associated_with Doze Homens (companions at Trapiche de Baixo)\n- Noca de Jacó associated_with Neco Canário Pardo (companions at Trapiche de Baixo)',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1890, precisão de década): Companheiro de Besouro Mangangá (n. 1895, m. 1924) nas rodas do Trapiche de Baixo. Como companheiro adulto contemporâneo, provavelmente dentro de 5-10 anos da idade de Besouro. Usando 1890 como estimativa do ponto médio.\n\nNOME COMPLETO: Ernesto Ferreira da Silva (per website CDO Sergipe listagem de mestres da capoeiragem).\n\nMORTE: Desconhecida. Nenhum registro encontrado.\n\nSIGNIFICADO DO NOME: "Noca de Jacó" provavelmente significa "Noca [de] Jacó" - possivelmente indicando que seu pai ou mentor se chamava Jacó.\n\nREFERÊNCIA ACADÊMICA: Documentado em "Mestres e capoeiras famosos da Bahia" (JSTOR) com capítulo "Noca de Jacó: Mulher de amigo meu..." sugerindo um incidente envolvendo a esposa de outro homem.\n\nRELACIONAMENTOS PENDENTES:\n- Noca de Jacó associated_with Besouro Mangangá (companheiros no Trapiche de Baixo)\n- Noca de Jacó associated_with Paulo Barroquinha (companheiros no Trapiche de Baixo)\n- Noca de Jacó associated_with Boca de Siri (companheiros no Trapiche de Baixo)\n- Noca de Jacó associated_with Doze Homens (companheiros no Trapiche de Baixo)\n- Noca de Jacó associated_with Neco Canário Pardo (companheiros no Trapiche de Baixo)'
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

-- Noca de Jacó associated_with Besouro Mangangá
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
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  '{"association_context": "Training companions at Trapiche de Baixo capoeira rodas in Santo Amaro da Purificação; documented by Professor Leiteiro"}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres - Besouro (velhosmestres.com/br/besouro)',
  'Companions who trained together in the memorable capoeira rodas at Trapiche de Baixo that "hypnotized anybody who would go by"',
  'Companheiros que treinavam juntos nas memoráveis rodas de capoeira no Trapiche de Baixo que "hipnotizavam qualquer um que passasse"'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Noca de Jacó' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- NOTE: Generic "trained together at Trapiche de Baixo" associations removed.
-- Co-attendance is now captured via member_of Roda de Trapiche de Baixo.
-- Only specific documented interactions should be person-to-person.

-- --- Person-to-Group: Membership at Roda de Trapiche de Baixo ---

-- Noca de Jacó member_of Roda de Trapiche de Baixo
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
  '1910-01-01'::date, 'approximate'::genealogy.date_precision,
  '1924-07-08'::date, 'exact'::genealogy.date_precision,
  '{"membership_context": "Training companion at Trapiche de Baixo. Part of Besouro''s circle that met on Sundays and holidays."}'::jsonb,
  'verified'::genealogy.confidence,
  'José Brigido Dorneles Antunes (via Antonio Liberac); Velhos Mestres; Professor Leiteiro',
  'One of Besouro''s companions at Trapiche de Baixo alongside Paulo Barroquinha, Boca de Siri, Doze Homens, and Canário Pardo. They were a gang of capoeira resistance fighters who trained together on Sundays.',
  'Um dos companheiros de Besouro no Trapiche de Baixo ao lado de Paulo Barroquinha, Boca de Siri, Doze Homens e Canário Pardo. Eram uma turma de lutadores de resistência da capoeira que treinavam juntos aos domingos.'
FROM genealogy.person_profiles p, genealogy.group_profiles g
WHERE p.apelido = 'Noca de Jacó' AND g.name = 'Roda de Trapiche de Baixo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/noca-de-jaco.sql',
  NULL,
  ARRAY['persons/besouro-manganga.sql', 'groups/roda-de-trapiche-de-baixo.sql'],
  'Companion of Besouro Mangangá at Trapiche de Baixo capoeira rodas in Santo Amaro; full name Ernesto Ferreira da Silva'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;

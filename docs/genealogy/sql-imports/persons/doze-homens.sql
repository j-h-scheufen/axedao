-- ============================================================
-- GENEALOGY PERSON IMPORT: Doze Homens
-- Generated: 2025-12-09
-- Primary Source: https://velhosmestres.com/br/besouro
-- ============================================================
-- DEPENDENCIES: persons/besouro-manganga.sql, persons/besourinho.sql, persons/paulo-barroquinha.sql, persons/boca-de-siri.sql, persons/noca-de-jaco.sql, persons/neco-canario-pardo.sql, persons/siri-de-mangue.sql
-- ============================================================
--
-- BIRTH YEAR ESTIMATION (1890 with 'decade' precision):
-- Doze Homens was both:
-- 1) A companion of Besouro Mangangá (b. 1895, d. 1924) at Trapiche de Baixo
-- 2) Killed during Pedrito persecution (1920-1926)
-- 3) A teacher of Maria dos Anjos and Salomé (1920s-1930s)
-- If teaching women in 1920s and contemporary of Besouro, likely born 1880-1900.
-- Using 1890 as midpoint.
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
  NULL,
  'Doze Homens',
  NULL,
  NULL,
  '[]'::jsonb,
  -- Capoeira-specific
  NULL,
  E'Pre-modern era capoeira; practiced before style distinctions (Angola/Regional) existed. Part of the oral tradition era in Salvador and Santo Amaro.',
  E'Capoeira da era pré-moderna; praticava antes das distinções de estilo (Angola/Regional). Parte da era de tradição oral em Salvador e Santo Amaro.',
  -- Life dates
  1890,
  'decade'::genealogy.date_precision,
  'Bahia, Brazil',
  1925,
  'approximate'::genealogy.date_precision,
  'Salvador, Bahia, Brazil',
  -- Extended content (bilingual)
  E'Doze Homens ("Twelve Men") was a capoeirista who lived a double life in early 20th century Bahia - both as a companion of the legendary Besouro Mangangá in Santo Amaro and as a teacher who trained some of the first documented female capoeiristas in Salvador.\n\nAt Trapiche de Baixo, the poorest neighborhood of Santo Amaro da Purificação, Doze Homens was among the circle of capoeiristas who trained with Besouro. According to Professor Leiteiro, he was one of Besouro''s companions alongside Paulo Barroquinha, Boca de Siri, Noca de Jacó, and Canário Pardo - practitioners who participated in "the memorable capoeira rodas that hypnotized anybody who would go by."\n\nA 1944 journal entry by José Brigido Dorneles Antunes records: "Besouro was the biggest attraction of my childhood. His simulated fights with Doze Homens, Ioiô, Nicori and other Capoeirista friends, the sound of the berimbau and of the pandeiro, comprised of amazing shows that depicted strength, flexibility and finesse."\n\nIn Salvador, between the 1920s and 1930s, Doze Homens taught two women named Salomé and Maria dos Anjos, who were known for their passion for batuque and samba. According to testimony from Mestre Atenilo, he personally knew both women and described them as individuals of strong character. Their names persist in contemporary capoeira songs performed during rodas.\n\nTragically, Doze Homens was among the capoeiristas killed during the brutal persecution conducted by Police Chief Pedro de Azevedo Gordilho - the infamous "Pedrito" - who assumed command in 1920. Mestre Onça Preta recalled the fallen: "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino, and many others." The killings were not in open combat but through assassination after capture - bodies would appear days later thrown into the forest, backs opened by knife cuts.\n\nDoze Homens'' legacy extends beyond his own skill. Through Maria dos Anjos, the nickname "Maria Doze Homens" entered capoeira legend - though whether this referred to her training under Mestre Doze Homens, or to feats of defeating twelve men, remains disputed in oral tradition.',
  E'Doze Homens ("Doze Homens") foi um capoeirista que viveu uma vida dupla no início do século XX na Bahia - tanto como companheiro do lendário Besouro Mangangá em Santo Amaro quanto como professor que treinou algumas das primeiras mulheres capoeiristas documentadas em Salvador.\n\nNo Trapiche de Baixo, o bairro mais pobre de Santo Amaro da Purificação, Doze Homens estava entre o círculo de capoeiristas que treinavam com Besouro. Segundo o Professor Leiteiro, ele era um dos companheiros de Besouro junto com Paulo Barroquinha, Boca de Siri, Noca de Jacó e Canário Pardo - praticantes que participavam das "memoráveis rodas de capoeira que hipnotizavam qualquer um que passasse."\n\nUm registro de diário de 1944 por José Brigido Dorneles Antunes registra: "Besouro foi a maior atração da minha infância. Suas lutas simuladas com Doze Homens, Ioiô, Nicori e outros amigos capoeiristas, o som do berimbau e do pandeiro, compunham espetáculos incríveis que retratavam força, flexibilidade e fineza."\n\nEm Salvador, entre os anos 1920 e 1930, Doze Homens ensinou duas mulheres chamadas Salomé e Maria dos Anjos, que eram conhecidas por sua paixão pelo batuque e samba. Segundo testemunho de Mestre Atenilo, ele conheceu pessoalmente ambas as mulheres e as descreveu como indivíduos de caráter forte. Seus nomes persistem em canções de capoeira contemporâneas executadas durante as rodas.\n\nTragicamente, Doze Homens estava entre os capoeiristas mortos durante a perseguição brutal conduzida pelo Chefe de Polícia Pedro de Azevedo Gordilho - o infame "Pedrito" - que assumiu o comando em 1920. Mestre Onça Preta recordou os caídos: "Besourinho, Doze Homens, Mãozinha, Antônio Galindéu, Geraldo Chapeleiro, Finado Manteiga, Nagé, Paulo César de Moura, Gasolinha, Juvelino, e muitos outros." As mortes não eram em combate aberto, mas por assassinato após captura - os corpos apareciam dias depois jogados no mato, as costas abertas de facadas.\n\nO legado de Doze Homens se estende além de sua própria habilidade. Através de Maria dos Anjos, o apelido "Maria Doze Homens" entrou na lenda da capoeira - embora se isso se referia ao seu treinamento sob Mestre Doze Homens, ou a feitos de derrotar doze homens, permanece disputado na tradição oral.',
  E'Teacher of early female capoeiristas Salomé and Maria dos Anjos',
  E'Professor das primeiras mulheres capoeiristas Salomé e Maria dos Anjos',
  -- Researcher notes
  E'BIRTH YEAR ESTIMATION (1890, decade precision): Contemporary of Besouro (b. 1895) at Trapiche de Baixo; teacher of women in 1920s; killed during Pedrito persecution (1920-1926). If teaching adults in 1920s, likely born 1880-1900. Using 1890.\n\nDEATH YEAR ESTIMATION (~1925): Killed during Pedrito persecution which ran 1920-1926. Using midpoint.\n\nNAME: "Doze Homens" means "Twelve Men." The origin of the name is unknown - possibly referring to fighting prowess.\n\nDISTINCT FROM MARIA DOZE HOMENS: This is the male capoeirista teacher; Maria Doze Homens was a separate female capoeirista who may have trained under him (see person-reports/maria-doze-homens.md).\n\nSTUDENTS: Salomé and Maria dos Anjos (per Mestre Atenilo testimony to Bira Almeida).\n\nPENDING RELATIONSHIPS:\n- Doze Homens associated_with Besouro Mangangá (companions at Trapiche de Baixo)\n- Doze Homens associated_with Besourinho (fellow Pedrito persecution victim)',
  E'ESTIMATIVA DO ANO DE NASCIMENTO (1890, precisão de década): Contemporâneo de Besouro (n. 1895) no Trapiche de Baixo; professor de mulheres nos anos 1920; morto durante perseguição de Pedrito (1920-1926). Se ensinava adultos nos anos 1920, provavelmente nasceu 1880-1900. Usando 1890.\n\nESTIMATIVA DO ANO DE MORTE (~1925): Morto durante perseguição de Pedrito que durou 1920-1926. Usando ponto médio.\n\nNOME: "Doze Homens" significa "Doze Homens." A origem do nome é desconhecida - possivelmente referindo-se à proeza de luta.\n\nDISTINTO DE MARIA DOZE HOMENS: Este é o capoeirista homem professor; Maria Doze Homens era uma capoeirista mulher separada que pode ter treinado com ele (ver person-reports/maria-doze-homens.md).\n\nALUNOS: Salomé e Maria dos Anjos (per testemunho de Mestre Atenilo para Bira Almeida).\n\nRELACIONAMENTOS PENDENTES:\n- Doze Homens associated_with Besouro Mangangá (companheiros no Trapiche de Baixo)\n- Doze Homens associated_with Besourinho (vítimas da perseguição de Pedrito)'
)
ON CONFLICT (apelido) WHERE apelido IS NOT NULL DO UPDATE SET
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

-- Doze Homens associated_with Besouro Mangangá
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
  '{"association_context": "Training companions at Trapiche de Baixo capoeira rodas in Santo Amaro; simulated fights documented in 1944 journal entry by José Brigido Dorneles Antunes"}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres - Besouro (velhosmestres.com/br/besouro); 1944 journal entry',
  'Companions who performed "simulated fights" together; Besouro was described as doing "amazing shows that depicted strength, flexibility and finesse" with Doze Homens',
  'Companheiros que realizavam "lutas simuladas" juntos; Besouro foi descrito fazendo "espetáculos incríveis que retratavam força, flexibilidade e fineza" com Doze Homens'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Doze Homens' AND o.apelido = 'Besouro Mangangá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Doze Homens associated_with Besourinho (fellow Pedrito persecution victim)
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
  '1920-01-01'::date, 'year'::genealogy.date_precision,
  '1926-01-01'::date, 'year'::genealogy.date_precision,
  '{"association_context": "Both killed during Pedrito persecution (1920-1926); listed together by Mestre Onça Preta among the fallen capoeiristas"}'::jsonb,
  'verified'::genealogy.confidence,
  'Velhos Mestres - Onça Preta (velhosmestres.com/br/destaques-34)',
  'Both were among the old mestres massacred by Police Chief Pedrito''s cavalry squadron',
  'Ambos estavam entre os velhos mestres massacrados pelo esquadrão de cavalaria do chefe de polícia Pedrito'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Doze Homens' AND o.apelido = 'Besourinho'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Doze Homens associated_with Paulo Barroquinha (Trapiche de Baixo)
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
  '{"association_context": "Companions at Trapiche de Baixo in Santo Amaro; both part of Besouro Mangangá''s circle; documented by Professor Leiteiro"}'::jsonb,
  'likely'::genealogy.confidence,
  'Professor Leiteiro account via velhosmestres.com/br/besouro',
  'Part of Besouro''s training circle at Trapiche de Baixo, Santo Amaro',
  'Parte do círculo de treino de Besouro no Trapiche de Baixo, Santo Amaro'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Doze Homens' AND o.apelido = 'Paulo Barroquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Doze Homens associated_with Boca de Siri (Trapiche de Baixo)
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
  '{"association_context": "Companions at Trapiche de Baixo in Santo Amaro; both part of Besouro Mangangá''s circle; documented by Professor Leiteiro"}'::jsonb,
  'likely'::genealogy.confidence,
  'Professor Leiteiro account via velhosmestres.com/br/besouro',
  'Part of Besouro''s training circle at Trapiche de Baixo, Santo Amaro',
  'Parte do círculo de treino de Besouro no Trapiche de Baixo, Santo Amaro'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Doze Homens' AND o.apelido = 'Boca de Siri'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Doze Homens associated_with Noca de Jacó (Trapiche de Baixo)
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
  '{"association_context": "Companions at Trapiche de Baixo in Santo Amaro; both part of Besouro Mangangá''s circle; documented by Professor Leiteiro"}'::jsonb,
  'likely'::genealogy.confidence,
  'Professor Leiteiro account via velhosmestres.com/br/besouro',
  'Part of Besouro''s training circle at Trapiche de Baixo, Santo Amaro',
  'Parte do círculo de treino de Besouro no Trapiche de Baixo, Santo Amaro'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Doze Homens' AND o.apelido = 'Noca de Jacó'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Doze Homens associated_with Neco Canário Pardo (Trapiche de Baixo)
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
  '{"association_context": "Companions at Trapiche de Baixo in Santo Amaro; both part of Besouro Mangangá''s circle; documented by Professor Leiteiro"}'::jsonb,
  'likely'::genealogy.confidence,
  'Professor Leiteiro account via velhosmestres.com/br/besouro',
  'Part of Besouro''s training circle at Trapiche de Baixo, Santo Amaro',
  'Parte do círculo de treino de Besouro no Trapiche de Baixo, Santo Amaro'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Doze Homens' AND o.apelido = 'Neco Canário Pardo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Doze Homens associated_with Siri de Mangue (Trapiche de Baixo / Recôncavo)
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
  '{"association_context": "Both from Besouro''s circle in Santo Amaro/Recôncavo region; Siri de Mangue was training companion of Besouro; Doze Homens also taught women in the region"}'::jsonb,
  'likely'::genealogy.confidence,
  'Papoeira.com; velhosmestres.com/br/besouro',
  'Both part of Besouro''s extended network in the Recôncavo region',
  'Ambos parte da rede estendida de Besouro na região do Recôncavo'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Doze Homens' AND o.apelido = 'Siri de Mangue'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- IMPORT LOG
-- ============================================================

INSERT INTO genealogy.import_log (entity_type, file_path, checksum, dependencies, notes)
VALUES (
  'person',
  'persons/doze-homens.sql',
  NULL,
  ARRAY['persons/besouro-manganga.sql', 'persons/besourinho.sql', 'persons/paulo-barroquinha.sql', 'persons/boca-de-siri.sql', 'persons/noca-de-jaco.sql', 'persons/neco-canario-pardo.sql', 'persons/siri-de-mangue.sql'],
  'Companion of Besouro at Trapiche de Baixo; teacher of Salomé and Maria dos Anjos; killed during Pedrito persecution'
)
ON CONFLICT (entity_type, file_path) DO UPDATE SET
  imported_at = NOW(),
  checksum = EXCLUDED.checksum,
  dependencies = EXCLUDED.dependencies,
  notes = EXCLUDED.notes;

COMMIT;

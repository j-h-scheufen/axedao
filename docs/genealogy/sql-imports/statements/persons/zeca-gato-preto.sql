-- ============================================================
-- STATEMENTS FOR: Zeca (Gato Preto)
-- Generated: 2026-01-10
-- ============================================================
-- Contains all relationships where Zeca (Gato Preto) is the SUBJECT.
-- Note: Uses apelido_context 'Gato Preto' to distinguish from other Zecas
-- ============================================================

-- Zeca student_of Gato Preto (primary teacher - his father, from 1963)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'year'::genealogy.date_precision,
  '2002-08-06'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'capoeirawiki.org/wiki/Mestre_Zeca, velhosmestres.com',
  'Zeca began training under his father Mestre Gato Preto at age 7 in 1963. He continued learning throughout his father''s life, also growing up in the academies of Salvador''s greatest Angola mestres. Relationship ended with Gato Preto''s death on August 6, 2002.',
  'Zeca começou a treinar com seu pai Mestre Gato Preto aos 7 anos em 1963. Continuou aprendendo ao longo da vida de seu pai, também crescendo nas academias dos maiores mestres de Angola de Salvador. Relacionamento terminou com a morte de Gato Preto em 6 de agosto de 2002.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeca' AND s.apelido_context = 'Gato Preto'
  AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zeca trained_under Canjiquinha (trained alongside in academies as child)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirawiki.org/wiki/Mestre_Zeca',
  'Growing up in Salvador''s Angola academies, Zeca trained alongside legendary masters including Mestre Canjiquinha. This was part of his childhood apprenticeship under his father''s guidance.',
  'Crescendo nas academias de Angola de Salvador, Zeca treinou ao lado de mestres lendários incluindo Mestre Canjiquinha. Isto fazia parte de sua aprendizagem infantil sob a orientação de seu pai.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeca' AND s.apelido_context = 'Gato Preto'
  AND o.apelido = 'Canjiquinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zeca trained_under Caiçara (trained alongside in academies as child)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'trained_under'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1963-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'capoeirawiki.org/wiki/Mestre_Zeca',
  'Growing up in Salvador''s Angola academies, Zeca trained alongside legendary masters including Mestre Caiçara. This was part of his childhood apprenticeship under his father''s guidance.',
  'Crescendo nas academias de Angola de Salvador, Zeca treinou ao lado de mestres lendários incluindo Mestre Caiçara. Isto fazia parte de sua aprendizagem infantil sob a orientação de seu pai.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeca' AND s.apelido_context = 'Gato Preto'
  AND o.apelido = 'Caiçara'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zeca family_of Gato Preto (son relationship)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1956-04-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"relationship_type": "son"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/gatopreto, capoeirawiki.org',
  'Zeca (José Souza Góes) was the son of Mestre Gato Preto (José Gabriel Góes). Born April 16, 1956, he was known as Gatinho (little cat) and Gato III (third in the Gato lineage).',
  'Zeca (José Souza Góes) era filho de Mestre Gato Preto (José Gabriel Góes). Nascido em 16 de abril de 1956, era conhecido como Gatinho e Gato III (terceiro na linhagem Gato).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeca' AND s.apelido_context = 'Gato Preto'
  AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Zeca family_of Gato II (brother relationship - younger points to older per convention)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1956-04-16'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{"relationship_type": "brother"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/gatopreto',
  'Zeca (José Souza Góes, born 1956) and Gato II (Sinésio Souza Góes, born 1950) are brothers, both sons of Mestre Gato Preto. Per convention, sibling relationship stored from younger to older.',
  'Zeca (José Souza Góes, nascido 1956) e Gato II (Sinésio Souza Góes, nascido 1950) são irmãos, ambos filhos de Mestre Gato Preto. Por convenção, relacionamento de irmãos armazenado do mais novo para o mais velho.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeca' AND s.apelido_context = 'Gato Preto'
  AND o.apelido = 'Gato II'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Zeca co_founded Capoeira 3 Amigos - needs group import first
-- Zeca co_founded Filhos de Oxalá - needs group import first
-- Zeca associated_with Mau (co-founder relationship) - Mau exists, but relationship
--   will be better captured via co_founded when groups are imported
-- Zeca associated_with Mala (co-founder relationship) - Mala not yet imported
-- ============================================================

-- Note: Espinho Remoso exists in dataset, but relationship is better documented
-- through their shared work at Gato Preto's academies. Adding as associated_with:

-- Zeca associated_with Espinho Remoso (colleagues at Gato Preto's academies)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1976-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "colleagues at Gato Preto academies"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/gato-1976-1',
  'Zeca and Espinho Remoso worked together managing Mestre Gato Preto''s academies in Salvador (Rua do Báu in Garcia and Boca do Rio) during the 1970s while Gato Preto traveled internationally.',
  'Zeca e Espinho Remoso trabalharam juntos gerenciando as academias de Mestre Gato Preto em Salvador (Rua do Báu no Garcia e Boca do Rio) durante os anos 1970 enquanto Gato Preto viajava internacionalmente.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zeca' AND s.apelido_context = 'Gato Preto'
  AND o.apelido = 'Espinho Remoso'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

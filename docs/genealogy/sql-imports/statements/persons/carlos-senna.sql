-- ============================================================
-- STATEMENTS FOR: Carlos Senna
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Carlos Senna is the SUBJECT.
-- ============================================================

-- Carlos Senna student_of Bimba
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1949-01-01'::date, 'year'::genealogy.date_precision,
  '1955-10-25'::date, 'exact'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'ABCA, Capoeira News, Velhos Mestres',
  E'Carlos Senna began training at Mestre Bimba''s Centro de Cultura Física Regional in 1949 at age 18. He completed his formatura (graduation) in 1950, earned the nickname "Senna Preto", was appointed Technical Director in 1954, and departed on October 25, 1955 to found Senavox.',
  E'Carlos Senna começou a treinar no Centro de Cultura Física Regional de Mestre Bimba em 1949 aos 18 anos. Completou sua formatura em 1950, ganhou o apelido "Senna Preto", foi nomeado Diretor Técnico em 1954, e partiu em 25 de outubro de 1955 para fundar a Senavox.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Carlos Senna' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Carlos Senna associated_with Itapoan (co-founded IBEC; transferred Bimba's remains)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1978-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "IBEC co-founders; transferred Mestre Bimba''s remains together"}'::jsonb,
  'verified'::genealogy.confidence,
  'Capoeira News, ABCA, books.scielo.org',
  E'Carlos Senna and Itapoan were fellow students of Mestre Bimba who maintained a professional relationship. In July 1978, they traveled to Goiânia with Dona Alice to retrieve Mestre Bimba''s remains and transfer them to Salvador. They were also co-founders of IBEC (Instituto Brasileiro de Estudos de Capoeira).',
  E'Carlos Senna e Itapoan foram colegas alunos de Mestre Bimba que mantiveram relação profissional. Em julho de 1978, viajaram a Goiânia com Dona Alice para resgatar os restos mortais de Mestre Bimba e transferi-los para Salvador. Também foram cofundadores do IBEC (Instituto Brasileiro de Estudos de Capoeira).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Carlos Senna' AND o.apelido = 'Itapoan'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Carlos Senna associated_with Acordeon (co-founded IBEC)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "IBEC co-founders"}'::jsonb,
  'verified'::genealogy.confidence,
  'Capoeira News, ABCA, books.scielo.org',
  E'Carlos Senna and Acordeon were co-founders of IBEC (Instituto Brasileiro de Estudos de Capoeira), along with Arára, Itapoan, and Sacy.',
  E'Carlos Senna e Acordeon foram cofundadores do IBEC (Instituto Brasileiro de Estudos de Capoeira), junto com Arára, Itapoan e Sacy.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Carlos Senna' AND o.apelido = 'Acordeon'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Carlos Senna associated_with Saci (co-founded IBEC)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"association_context": "IBEC co-founders"}'::jsonb,
  'verified'::genealogy.confidence,
  'Capoeira News, ABCA, books.scielo.org',
  E'Carlos Senna and Sacy were co-founders of IBEC (Instituto Brasileiro de Estudos de Capoeira), along with Arára, Itapoan, and Acordeon.',
  E'Carlos Senna e Sacy foram cofundadores do IBEC (Instituto Brasileiro de Estudos de Capoeira), junto com Arára, Itapoan e Acordeon.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Carlos Senna' AND o.apelido = 'Saci'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Carlos Senna associated_with Arára - IBEC co-founder; needs import first
-- Carlos Senna family_of Yoji Senna - son (Mestre Yoji Senna); needs import first

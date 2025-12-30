-- ============================================================
-- STATEMENTS FOR: Crispim
-- Generated: 2025-12-18
-- ============================================================
-- Contains all relationships where Crispim is the SUBJECT.
-- ============================================================

-- Crispim student_of Bimba (his father and teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  '1974-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'cdosergipe.wixsite.com; capoeiraceaca.wordpress.com; portalcapoeira.com',
  E'Primary teacher. Crispim was Bimba''s eldest son and trained under him from childhood. Ended with Bimba''s death in 1974.',
  E'Professor principal. Crispim era o filho mais velho de Bimba e treinou com ele desde a infância. Terminou com a morte de Bimba em 1974.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Crispim' AND s.apelido_context IS NULL
  AND o.apelido = 'Bimba' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Crispim family_of Bimba (son)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL,
  NULL, NULL,
  '{"relationship_type": "son"}'::jsonb, 'verified'::genealogy.confidence,
  'cdosergipe.wixsite.com; portalcapoeira.com; madrugacapoeira.webnode.page',
  E'Eldest son of Mestre Bimba with Maria dos Anjos (first partner).',
  E'Filho mais velho de Mestre Bimba com Maria dos Anjos (primeira companheira).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Crispim' AND s.apelido_context IS NULL
  AND o.apelido = 'Bimba' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Crispim associated_with Atenilo (inner circle companions)
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
  '{"association_context": "Both named as part of Bimba''s inner circle of trusted companions. Training contemporaries at Centro de Cultura Física Regional".}'::jsonb,
  'verified'::genealogy.confidence,
  'recantodasletras.com.br; Itapoan''s writings',
  E'Both were part of Bimba''s inner circle of trusted companions alongside Brás Amansa Brabo. Contemporaries at Bimba''s academy.',
  E'Ambos faziam parte do círculo íntimo de companheiros de confiança de Bimba junto com Brás Amansa Brabo. Contemporâneos na academia de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Crispim' AND s.apelido_context IS NULL
  AND o.apelido = 'Atenilo' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Crispim associated_with Brás Amansa Brabo (inner circle companions)
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
  '{"association_context": "Both named as part of Bimba''s inner circle of trusted companions. Training contemporaries at Centro de Cultura Física Regional".}'::jsonb,
  'verified'::genealogy.confidence,
  'recantodasletras.com.br; Itapoan''s writings',
  E'Both were part of Bimba''s inner circle of trusted companions alongside Atenilo. Contemporaries at Bimba''s academy.',
  E'Ambos faziam parte do círculo íntimo de companheiros de confiança de Bimba junto com Atenilo. Contemporâneos na academia de Bimba.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Crispim' AND s.apelido_context IS NULL
  AND o.apelido = 'Bras Amansa Brabo' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Crispim associated_with Waldemar (Vadiação film participants)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both participated in the pioneering 1954 film Vadiação, documenting Salvador capoeira masters".}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeiraceaca.wordpress.com; sementedojogodeangoladf.wordpress.com',
  E'Both appeared in "Vadiação" (1954) by Alexandre Robatto Filho.',
  E'Ambos apareceram em "Vadiação" (1954) de Alexandre Robatto Filho.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Crispim' AND s.apelido_context IS NULL
  AND o.apelido = 'Waldemar' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Crispim associated_with Traíra (Vadiação film participants)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both participated in the pioneering 1954 film Vadiação, documenting Salvador capoeira masters".}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeiraceaca.wordpress.com; sementedojogodeangoladf.wordpress.com',
  E'Both appeared in "Vadiação" (1954) by Alexandre Robatto Filho.',
  E'Ambos apareceram em "Vadiação" (1954) de Alexandre Robatto Filho.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Crispim' AND s.apelido_context IS NULL
  AND o.apelido = 'Traíra' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Crispim associated_with Caiçara (Vadiação film participants)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both participated in the pioneering 1954 film Vadiação, documenting Salvador capoeira masters".}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeiraceaca.wordpress.com; sementedojogodeangoladf.wordpress.com',
  E'Both appeared in "Vadiação" (1954) by Alexandre Robatto Filho.',
  E'Ambos apareceram em "Vadiação" (1954) de Alexandre Robatto Filho.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Crispim' AND s.apelido_context IS NULL
  AND o.apelido = 'Caiçara' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ------------------------------------------------------------
-- Crispim associated_with Bugalho
-- Both participated in film Vadiação (1954)
-- ------------------------------------------------------------
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1954-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "Both participated in the pioneering 1954 film Vadiação, documenting Salvador capoeira masters"}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeiraceaca.wordpress.com; sementedojogodeangoladf.wordpress.com',
  E'Both appeared in "Vadiação" (1954) by Alexandre Robatto Filho, a pioneering documentary of Salvador capoeira masters.',
  E'Ambos apareceram em "Vadiação" (1954) de Alexandre Robatto Filho, um documentário pioneiro dos mestres de capoeira de Salvador.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Crispim' AND s.apelido_context IS NULL
  AND o.apelido = 'Bugalho' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Crispim associated_with Curió - Both in Vadiação (1954); Curió not yet imported
-- Crispim associated_with Nagé - Both in Vadiação (1954); Nagé not yet imported (distinct from Nagé Pedrito victim)
-- Crispim associated_with Zacarias Boa Morte - Both in Vadiação (1954); needs import
-- Crispim associated_with Rosendo - Both in Vadiação (1954); needs import

-- ============================================================
-- STATEMENTS FOR: Valdomiro Malvadeza (CECA student)
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Valdomiro Malvadeza is the SUBJECT.
-- Uses apelido = 'Valdomiro Malvadeza' AND apelido_context = 'CECA student'
-- to distinguish from José Martins "Malvadeza" (Curió's father).
-- ============================================================

-- ============================================================
-- TRAINING RELATIONSHIPS
-- ============================================================

-- Valdomiro Malvadeza student_of Pastinha (trained at CECA)
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
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://velhosmestres.com/br/pastinha-1969-1',
  E'Valdomiro Malvadeza trained under Mestre Pastinha at CECA (Centro Esportivo de Capoeira Angola) in Salvador. He was part of the core group who formed the bateria at Pastinha''s rodas and recorded on the 1969 LP.',
  E'Valdomiro Malvadeza treinou sob Mestre Pastinha no CECA (Centro Esportivo de Capoeira Angola) em Salvador. Ele fazia parte do grupo principal que formava a bateria nas rodas de Pastinha e gravou no LP de 1969.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valdomiro Malvadeza' AND s.apelido_context = 'CECA student'
  AND o.apelido = 'Pastinha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- GROUP MEMBERSHIPS
-- ============================================================

-- Valdomiro Malvadeza member_of CECA
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'member_of'::genealogy.predicate,
  'group'::genealogy.entity_type, g.id,
  NULL, NULL,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeira-connection.com/capoeira/2011/10/interview-with-mestre-gato-preto/',
  E'Valdomiro was a member of CECA (Centro Esportivo de Capoeira Angola) in Salvador, serving as part of the bateria. Mestre Gato Preto confirmed: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria".',
  E'Valdomiro era membro do CECA (Centro Esportivo de Capoeira Angola) em Salvador, servindo como parte da bateria. Mestre Gato Preto confirmou: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria".'
FROM genealogy.person_profiles s, genealogy.group_profiles g
WHERE s.apelido = 'Valdomiro Malvadeza' AND s.apelido_context = 'CECA student'
  AND g.name = 'CECA'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- ASSOCIATIONS
-- ============================================================

-- Valdomiro Malvadeza associated_with João Pequeno (bateria companions)
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
  '{"association_context": "bateria_companions"}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeira-connection.com/capoeira/2011/10/interview-with-mestre-gato-preto/',
  E'Valdomiro and João Pequeno played together in the bateria at Mestre Pastinha''s rodas at CECA. Per Gato Preto: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria".',
  E'Valdomiro e João Pequeno tocavam juntos na bateria nas rodas de Mestre Pastinha no CECA. Conforme Gato Preto: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valdomiro Malvadeza' AND s.apelido_context = 'CECA student'
  AND o.apelido = 'João Pequeno'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Valdomiro Malvadeza associated_with Gato Preto (bateria companions)
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
  '{"association_context": "bateria_companions"}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeira-connection.com/capoeira/2011/10/interview-with-mestre-gato-preto/',
  E'Valdomiro and Gato Preto played together in the bateria at Mestre Pastinha''s rodas at CECA. Per Gato Preto: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria".',
  E'Valdomiro e Gato Preto tocavam juntos na bateria nas rodas de Mestre Pastinha no CECA. Conforme Gato Preto: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valdomiro Malvadeza' AND s.apelido_context = 'CECA student'
  AND o.apelido = 'Gato Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Valdomiro Malvadeza associated_with Albertino da Hora (bateria companions)
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
  '{"association_context": "bateria_companions"}'::jsonb, 'verified'::genealogy.confidence,
  'https://capoeira-connection.com/capoeira/2011/10/interview-with-mestre-gato-preto/',
  E'Valdomiro and Albertino da Hora (also known as "Moreno") played together in the bateria at Mestre Pastinha''s rodas at CECA. Per Gato Preto: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria".',
  E'Valdomiro e Albertino da Hora (também conhecido como "Moreno") tocavam juntos na bateria nas rodas de Mestre Pastinha no CECA. Conforme Gato Preto: "Na roda, João Pequeno, Moreno, Albertino, Valdomiro e eu fazíamos a bateria".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Valdomiro Malvadeza' AND s.apelido_context = 'CECA student'
  AND o.apelido = 'Albertino da Hora'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Valdomiro associated_with Roberto Satanás - 1969 LP recording (Roberto Satanás pending import)
-- Valdomiro associated_with Raimundo Pequeno/Natividade - 1969 LP recording (pending import)

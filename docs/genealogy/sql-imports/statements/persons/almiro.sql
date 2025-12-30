-- ============================================================
-- STATEMENTS FOR: Almiro
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Almiro is the SUBJECT.
-- ============================================================

-- Almiro student_of Vermelho 27
-- Based on available sources: Almiro received his mestre certification in 1983 at
-- Academia do Bimba during Vermelho 27's leadership. No sources found confirming
-- direct training under Mestre Bimba, though his estimated birth year (~1950) would
-- have made this possible.
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
  '1983-01-01'::date, 'year'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'Received mestre 1983 at Academia do Bimba during Vermelho 27 leadership; no sources found confirming direct Bimba training',
  E'Based on available sources, Vermelho 27 appears to have been his primary teacher. Almiro received his mestre certification in 1983 at Academia do Bimba, during the period when Vermelho 27 led the school. No sources found confirming direct training under Mestre Bimba, though his estimated birth year (~1950) would have made this possible.',
  E'Com base nas fontes disponíveis, Vermelho 27 parece ter sido seu professor principal. Almiro recebeu sua certificação de mestre em 1983 na Academia do Bimba, durante o período em que Vermelho 27 liderava a escola. Nenhuma fonte encontrada confirmando treinamento direto sob Mestre Bimba, embora seu ano de nascimento estimado (~1950) teria tornado isso possível.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Almiro' AND o.apelido = 'Vermelho 27'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Almiro received_title_from Vermelho 27 (inferred)
-- Received mestre title in 1983 at Academia do Bimba while Vermelho 27 led it
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1983-01-01'::date, 'year'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "mestre"}}'::jsonb, 'likely'::genealogy.confidence,
  'BBAC website: received Mestre certification at Academia do Bimba in 1983',
  E'Received Mestre certification at the Academia do Bimba in 1983. Vermelho 27 was leading the academy at this time, making him the likely conferrer of the title.',
  E'Recebeu certificação de Mestre na Academia do Bimba em 1983. Vermelho 27 estava liderando a academia nesta época, tornando-o o provável conferidor do título.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Almiro' AND o.apelido = 'Vermelho 27'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Almiro leads Associação de Capoeira Mestre Bimba (1983-1986) - group not yet imported
-- Almiro departed_from Associação de Capoeira Mestre Bimba (1986, neutral - invited to USA)
-- Almiro founded Bahia Brazil Art Center (2004) - group added to backlog
-- Almiro cultural_pioneer_of USA Pacific Northwest (1986) - person-to-region, not standard predicate

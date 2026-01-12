-- ============================================================
-- STATEMENTS FOR: Virgílio de Ilhéus
-- Generated: 2026-01-12
-- ============================================================
-- Contains all relationships where Virgílio de Ilhéus is the SUBJECT.
-- ============================================================

-- Virgílio de Ilhéus received_title_from João Grande (contra-mestre title in 1950s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'received_title_from'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1955-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"title_grant": {"title": "contra-mestre", "location": "Ilhéus, Bahia"}}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-48',
  E'João Grande granted Virgílio the contra-mestre title in the 1950s. João Grande was born in Itagi, near Ilhéus, and was known locally as "João Bate-Estaca".',
  E'João Grande concedeu a Virgílio o título de contra-mestre nos anos 1950. João Grande nasceu em Itagi, perto de Ilhéus, e era conhecido localmente como "João Bate-Estaca".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Virgílio de Ilhéus' AND o.apelido = 'João Grande'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Virgílio de Ilhéus student_of Caranha (primary teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1944-07-28'::date, 'exact'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com/en/featured-48',
  E'Caranha initiated Virgílio into capoeira on July 28, 1944, when Virgílio was 9 or 10 years old. Caranha was his primary teacher. At that time, there were no formal capoeira academies in Ilhéus—training was informal, on the streets.',
  E'Caranha iniciou Virgílio na capoeira em 28 de julho de 1944, quando Virgílio tinha 9 ou 10 anos. Caranha foi seu mestre principal. Naquela época, não havia academias formais de capoeira em Ilhéus—o treinamento era informal, nas ruas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Virgílio de Ilhéus' AND o.apelido = 'Caranha'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- These teachers require import before statements can be created:
--
-- Virgílio de Ilhéus trained_under Chico da Onça
--   One of the local Ilhéus mestres who taught Virgílio in the 1940s
--
-- Virgílio de Ilhéus trained_under Claudemiro
--   One of the local Ilhéus mestres who taught Virgílio in the 1940s
--
-- Virgílio de Ilhéus trained_under Álvaro (Ilhéus)
--   One of the local Ilhéus mestres who taught Virgílio
--   May need apelido_context to distinguish from other Álvaros
--
-- Virgílio de Ilhéus trained_under Elíscio
--   One of the local Ilhéus mestres who taught Virgílio
--
-- Virgílio de Ilhéus trained_under João Valença
--   One of the local Ilhéus mestres who taught Virgílio
--
-- Virgílio de Ilhéus trained_under Barreto (Ilhéus)
--   One of the local Ilhéus mestres who taught Virgílio
--   May need apelido_context to distinguish from other Barretos
--
-- ============================================================
-- GROUP RELATIONSHIPS (groups not yet in dataset)
-- ============================================================
-- Virgílio de Ilhéus founded ACAM (Associação de Capoeira Angola Mucumbo)
--   Founded 2002 in Ilhéus
--
-- Virgílio de Ilhéus founded UCASUB (União de Capoeiristas do Sul da Bahia)
--   Founded December 28, 2004; served as first president; later departed
--   Use predicate: founded or co_founded
--   Would need departure_from statement with departure_type: neutral

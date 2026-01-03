-- ============================================================
-- STATEMENTS FOR: Gilvan
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Gilvan is the SUBJECT.
-- Gilvan has no apelido_context (unlike Joel who uses 'São Paulo').
--
-- NOTE: Contemporaries in Grupo dos Nove and Praça da República rodas
-- are NOT included as associated_with - being in the same group/scene
-- does not constitute a meaningful direct relationship.
-- ============================================================

-- Gilvan family_of Joel (SP) - brother
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1944-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"relationship_type": "brother"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com/br/destaques-54, fontedogravata.org',
  'Brothers; both born in Bahia (Santo Amaro/Feira de Santana region); both migrated to São Paulo in 1960s; both members of Grupo dos Nove (1971); Joel gave impassioned speech at Paulo Gomes funeral noting he had "already lost his brother Gilvan"',
  'Irmãos; ambos nascidos na Bahia (região de Santo Amaro/Feira de Santana); ambos migraram para São Paulo nos anos 1960; ambos membros do Grupo dos Nove (1971); Joel fez discurso emocionado no funeral de Paulo Gomes observando que "já havia perdido seu irmão Gilvan"'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gilvan' AND s.apelido_context IS NULL
  AND o.apelido = 'Joel' AND o.apelido_context = 'São Paulo'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Gilvan associated_with Bimba (Grupo dos Nove recognition, 1971)
-- Direct recognition by Bimba during his 1971 São Paulo visit
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1971-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{"association_context": "Recognized as one of Grupo dos Nove pioneers by Bimba during 1971 São Paulo visit"}'::jsonb,
  'verified'::genealogy.confidence,
  'velhosmestres.com, journals.openedition.org',
  'Bimba visited São Paulo in 1971 at invitation of Mestre Onça; personally recognized Gilvan as one of the "Grupo dos Nove" (Group of Nine) pioneers of capoeira in São Paulo',
  'Bimba visitou São Paulo em 1971 a convite de Mestre Onça; reconheceu pessoalmente Gilvan como um do "Grupo dos Nove" pioneiros da capoeira em São Paulo'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Gilvan' AND s.apelido_context IS NULL
  AND o.apelido = 'Bimba' AND o.apelido_context IS NULL
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Gilvan student_of Arara (Fernando Vasconcelos)? - UNCONFIRMED
-- Note: Brother Joel learned from Arara. Gilvan's teacher is unknown.
-- Arara is in backlog but not yet imported. If confirmed, add relationship after import.
--
-- Gilvan member_of Roda da Praça da República - GROUP in backlog
-- Add after group is imported
--
-- ============================================================
-- NOT INCLUDED (contemporaries, not direct relationships):
-- ============================================================
-- Suassuna, Brasília, Limão, Silvestre, Pinatti, Zé de Freitas, Onça (SP)
-- - Fellow members of Grupo dos Nove (1971)
-- - Being recognized together does not constitute direct relationship between them
--
-- Ananias
-- - Both frequented Praça da República rodas
-- - Being at the same roda does not constitute direct relationship

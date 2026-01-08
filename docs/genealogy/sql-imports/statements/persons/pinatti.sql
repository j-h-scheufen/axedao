-- ============================================================
-- STATEMENTS FOR: Pinatti
-- Generated: 2026-01-02
-- ============================================================
-- Contains all relationships where Pinatti is the SUBJECT.
--
-- NOTE: Redundant associated_with statements removed.
-- Relationships implied by shared group membership (co_founded, member_of)
-- do not need separate associated_with statements.
-- ============================================================

-- Pinatti influenced_by Lamartine Pereira (via book "Capoeira sem Mestre")
-- Note: Not a direct teacher-student relationship, but philosophical/methodological influence
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'influenced_by'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'year'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"influence_type": "book/methodology"}'::jsonb, 'verified'::genealogy.confidence,
  'Wiki Urucungo, Portal Capoeira',
  'Pinatti learned capoeira from Lamartine''s book "Capoeira sem Mestre" (1962) before training with Zé de Freitas',
  'Pinatti aprendeu capoeira pelo livro de Lamartine "Capoeira sem Mestre" (1962) antes de treinar com Zé de Freitas'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pinatti' AND o.apelido = 'Lamartine Pereira'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pinatti student_of Zé de Freitas
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1962-01-01'::date, 'decade'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'Museu da Pessoa, Wiki Urucungo',
  'Consolidated his capoeira training with Zé de Freitas at CMTC Club; connected with Bahian community through him',
  'Consolidou seu treinamento de capoeira com Zé de Freitas no Clube CMTC; conectou-se com comunidade baiana através dele'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pinatti' AND o.apelido = 'Zé de Freitas'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Pinatti associated_with Suassuna (training partners - personal relationship)
-- Note: This is a direct personal relationship not implied by any shared group membership
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1960-01-01'::date, 'decade'::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"association_context": "training partners"}'::jsonb, 'verified'::genealogy.confidence,
  'Wiki Urucungo',
  'Met and trained together in the early 1960s before formal academies',
  'Conheceram-se e treinaram juntos no início dos anos 1960 antes das academias formais'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Pinatti' AND o.apelido = 'Suassuna'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- GROUP RELATIONSHIPS (groups not yet in dataset)
-- ============================================================
-- Pinatti co_founded Academia São Bento Pequeno (SP) - Aug 1, 1969
-- Pinatti leads Academia São Bento Pequeno (SP) - ongoing
-- Pinatti co_founded Federação Paulista de Capoeira - Jul 14, 1974
-- Pinatti leads Federação Paulista de Capoeira - 1970s (as president)
-- Pinatti member_of Roda da Praça da República - 1960s-1980s
-- ============================================================
-- REDUNDANT (implied by group relationships once imported):
-- - Limão, Paulão: implied by co_founded São Bento Pequeno
-- - Brasília, Silvestre, Joel, Gilvan: implied by member_of Roda da Praça da República
-- - Onça, Gladson, Mello, Polim, José Andrade: implied by co_founded Federação Paulista de Capoeira
-- ============================================================

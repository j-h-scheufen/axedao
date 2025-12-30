-- ============================================================
-- STATEMENTS FOR: Ermival
-- Generated: 2025-12-25
-- ============================================================
-- Contains all relationships where Ermival is the SUBJECT.
-- ============================================================

-- Ermival student_of Bimba (primary teacher)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1966-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, abadarodos.wordpress.com, camisaroxa.com',
  E'Followed his older brother Camisa Roxa to Mestre Bimba''s academy in Salvador. Graduated as aluno formado alongside brothers Pedrinho and José Tadeu (Mestre Camisa).',
  E'Seguiu seu irmão mais velho Camisa Roxa até a academia de Mestre Bimba em Salvador. Formou-se como aluno formado junto com os irmãos Pedrinho e José Tadeu (Mestre Camisa).'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ermival' AND s.apelido_context IS NULL AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Ermival family_of Camisa Roxa (brothers)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"relationship_type": "brothers"}'::jsonb, 'verified'::genealogy.confidence,
  'velhosmestres.com, abadarodos.wordpress.com',
  E'Ermival was a younger brother of Camisa Roxa. Both were born at Fazenda Estiva, Jacobina, Bahia. Camisa Roxa brought Ermival to train with Mestre Bimba after becoming family patriarch.',
  E'Ermival era irmão mais novo de Camisa Roxa. Ambos nasceram na Fazenda Estiva, Jacobina, Bahia. Camisa Roxa levou Ermival para treinar com Mestre Bimba após tornar-se patriarca da família.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Ermival' AND s.apelido_context IS NULL AND o.apelido = 'Camisa Roxa'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Note: Ermival's family connections to Pedrinho and Camisa are implicit
-- through their shared family_of relationship to Camisa Roxa.
-- All four brothers point to Camisa Roxa as eldest brother and family patriarch.

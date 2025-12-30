-- ============================================================
-- STATEMENTS FOR: Josias da Silva
-- Generated: 2025-12-29
-- ============================================================
-- Contains all relationships where Josias da Silva is the SUBJECT.
-- ============================================================

-- Josias da Silva student_of Paulo Gomes
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1965-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'capoeirahistory.com, acaz.site',
  'Josias da Silva was a disciple of Mestre Paulo Gomes, who moved to São João de Meriti (Coelho da Rocha neighborhood) in the 1960s. Josias was one of Paulo Gomes''s principal disciples in Baixada Fluminense.',
  'Josias da Silva foi discípulo de Mestre Paulo Gomes, que se mudou para São João de Meriti (bairro Coelho da Rocha) nos anos 1960. Josias foi um dos principais discípulos de Paulo Gomes na Baixada Fluminense.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Josias' AND o.apelido = 'Paulo Gomes'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Josias da Silva founded Associação de Capoeira Josias da Silva
-- PENDING: Group not yet imported
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   ...
-- )
-- WHERE s.apelido = 'Josias' AND o.name = 'Associação de Capoeira Josias da Silva'

-- ============================================================
-- PENDING RELATIONSHIPS (objects not yet in dataset)
-- ============================================================
-- Josias founded Associação de Capoeira Josias da Silva - group not yet imported

-- ============================================================
-- STATEMENTS FOR: Banduê
-- Generated: 2025-12-26
-- ============================================================
-- Contains all relationships where Banduê is the SUBJECT.
-- ============================================================

-- Banduê student_of Bimba
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
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'O Globo (Feb 16, 1982) archived at velhosmestres.com/br/cobrinha-1982-3',
  'Listed in 1982 O Globo article as one of the Regional mestres who were "almost all direct disciples of the legendary Bimba". Training dates unknown.',
  'Listado no artigo do O Globo de 1982 como um dos mestres Regional que eram "quase todos discípulos diretos do lendário Bimba". Datas de treinamento desconhecidas.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Banduê' AND o.apelido = 'Bimba'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- No pending relationships identified. All contemporaries from 1982 O Globo
-- article are peers, not direct relationship targets:
-- - Itapuã, Vinte e Nove, Brás Amansa Brabo, Vermelho 27, Medicina,
--   Capazans, Ezequiel, Hélio Xaréu (all fellow Bimba disciples, no
--   documented relationship beyond shared lineage)

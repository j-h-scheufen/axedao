-- ============================================================
-- STATEMENTS FOR: King Kong
-- Generated: 2026-01-12
-- ============================================================
-- Contains all relationships where King Kong is the SUBJECT.
-- ============================================================

-- King Kong student_of Inauá
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
  'ikiogato.comunidades.net; velhosmestres.com/br/destaques-34',
  E'Primary teacher; King Kong was "disciple of Mestre Inauá Mendes, who was himself a disciple of Mestre Onça Preta from Bahia". Trained in Rio de Janeiro.',
  E'Mestre principal; King Kong foi "discípulo de Mestre Inauá Mendes, que por sua vez foi discípulo de Mestre Onça Preta da Bahia". Treinou no Rio de Janeiro.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'King Kong' AND o.apelido = 'Inauá'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- King Kong founded Grupo Capoeirarte
-- PENDING: Group not yet in dataset
-- INSERT INTO genealogy.statements (
--   subject_type, subject_id, predicate, object_type, object_id,
--   started_at, started_at_precision, ended_at, ended_at_precision,
--   properties, confidence, source, notes_en, notes_pt
-- )
-- SELECT
--   'person'::genealogy.entity_type, s.id,
--   'founded'::genealogy.predicate,
--   'group'::genealogy.entity_type, o.id,
--   NULL, NULL,
--   NULL, NULL,
--   '{}'::jsonb, 'likely'::genealogy.confidence,
--   'ikiogato.comunidades.net',
--   E'Founded Grupo Capoeirarte and serves as its president. Based in Engenho Novo, Rio de Janeiro.',
--   E'Fundou o Grupo Capoeirarte e serve como seu presidente. Baseado no Engenho Novo, Rio de Janeiro.'
-- FROM genealogy.person_profiles s, genealogy.group_profiles o
-- WHERE s.apelido = 'King Kong' AND o.name = 'Grupo Capoeirarte'
-- ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- The following relationships have objects that need to be imported first.
-- These statements should be generated when those entities are created:
--
-- King Kong founded Grupo Capoeirarte - Grupo Capoeirarte needs import first (backlog)
-- King Kong associated_with Roda Viva (via lineage to Mestre Bom Fim) - Roda Viva needs import first (backlog)
--
-- STUDENTS (will go in student's statement files when imported):
-- Baia student_of King Kong - Baia needs import first (backlog)
-- Empadinha student_of King Kong - Empadinha needs import first (backlog)

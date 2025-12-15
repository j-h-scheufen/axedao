-- ============================================================
-- STATEMENTS FOR: Zé Bedeu
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Zé Bedeu is the SUBJECT.
--
-- NOTE: For relationships where Zé Bedeu is the OBJECT (e.g., Roque's
-- uncle, Chico Preto's brother), those statements belong in the
-- subject's file (roque.sql, chico-preto.sql).
-- ============================================================

-- ============================================================
-- FAMILY RELATIONSHIPS
-- ============================================================

-- Zé Bedeu family_of Chico Preto (brothers)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'family_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL::date, NULL::genealogy.date_precision,
  NULL::date, NULL::genealogy.date_precision,
  '{"relationship_type": "brother"}'::jsonb,
  'likely'::genealogy.confidence,
  'https://capoeuropa.org/historia-da-escola/',
  'Brothers - documented through biography of Chico Preto''s son Mestre Roque, who describes Zé Bedeu as his uncle (tio)',
  'Irmãos - documentado através da biografia do filho de Chico Preto, Mestre Roque, que descreve Zé Bedeu como seu tio'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Zé Bedeu' AND o.apelido = 'Chico Preto'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Zé Bedeu is father and teacher of Marco Buscapé
-- Marco Buscapé student_of Zé Bedeu - should go in marco-buscape.sql when created
-- Marco Buscapé family_of Zé Bedeu (son) - should go in marco-buscape.sql when created
--
-- NOTE: Marco Buscapé is NOT in the dataset yet (marked as "?" in backlog)
-- When Marco Buscapé is imported, the statements should be added to his file:
--   - Marco Buscapé student_of Zé Bedeu
--   - Marco Buscapé family_of Zé Bedeu (relationship_type: son)
-- ============================================================

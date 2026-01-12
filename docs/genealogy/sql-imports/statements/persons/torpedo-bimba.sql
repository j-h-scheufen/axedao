-- ============================================================
-- STATEMENTS FOR: Torpedo (Bimba lineage)
-- Generated: 2026-01-12
-- ============================================================
-- Contains all relationships where Torpedo (Bimba) is the SUBJECT.
-- Uses apelido_context 'Bimba' to distinguish from Torpedo in Roque/Poeira lineage.
-- ============================================================

-- Torpedo student_of Bimba
-- Primary teacher relationship - Torpedo trained and graduated from Bimba's academy
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'student_of'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, -- Start date unknown
  '1969-01-01'::date, 'year'::genealogy.date_precision, -- Ended with graduation
  '{}'::jsonb,
  'verified'::genealogy.confidence,
  'Multiple sources: Mestre Camisa interviews, ABADÁ-Capoeira documentation',
  E'Torpedo graduated as aluno formado from Mestre Bimba''s Centro de Cultura Física Regional in 1969, alongside Camisa, Macarrão, and Onça Negra. Graduation ceremony at Nordeste de Amaralina.',
  E'Torpedo formou-se como aluno formado do Centro de Cultura Física Regional de Mestre Bimba em 1969, junto com Camisa, Macarrão e Onça Negra. Cerimônia de formatura no Nordeste de Amaralina.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Torpedo' AND s.apelido_context = 'Bimba'
  AND o.apelido = 'Bimba' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- NOTE: Graduation companions (Camisa, Macarrão, Onça Negra) documented in bio and notes.
-- No associated_with statements needed - context is clear from narrative.

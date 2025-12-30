-- ============================================================
-- STATEMENTS FOR: Angélica Endiabrada
-- Generated: 2025-12-19
-- ============================================================
-- Contains all relationships where Angélica Endiabrada is the SUBJECT.
-- ============================================================

-- Angélica Endiabrada associated_with Maria Doze Homens
-- Connection documented in book chapter "Briga por moqueca"
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "rivalry - briga por moqueca documented in Mestres e capoeiras famosos da Bahia (2009)"}'::jsonb,
  'likely'::genealogy.confidence,
  'Pedro Abib, Mestres e capoeiras famosos da Bahia (2009)',
  E'Rival/contemporary of Maria Doze Homens. Their conflict documented in book chapter "Maria Doze Homem e Angélica Endiabrada: Briga por moqueca" (Fight over moqueca).',
  E'Rival/contemporânea de Maria Doze Homens. Seu conflito documentado no capítulo do livro "Maria Doze Homem e Angélica Endiabrada: Briga por moqueca".'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Angélica Endiabrada' AND o.apelido = 'Maria Doze Homens'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Angélica Endiabrada associated_with Salomé
-- Contemporaries, both valentonas of 1910s-1920s era
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1910-01-01'::date, 'decade'::genealogy.date_precision,
  '1920-01-01'::date, 'decade'::genealogy.date_precision,
  '{"association_context": "contemporaries - both valentonas in Salvador"}'::jsonb,
  'likely'::genealogy.confidence,
  'Multiple sources including Espeto Capoeira, Portal Capoeira',
  E'Contemporary valentona alongside Salomé. Both listed among legendary female capoeiristas of early 20th century Bahia.',
  E'Valentona contemporânea de Salomé. Ambas listadas entre as lendárias capoeiristas femininas do início do século XX na Bahia.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Angélica Endiabrada' AND o.apelido = 'Salomé'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Angélica Endiabrada associated_with Rosa Palmeirão - needs import first (pending: ?)
-- Angélica Endiabrada associated_with Chicão - needs import first (pending: yes)
-- Angélica Endiabrada associated_with Massú - needs import first (pending: ?)
-- Angélica Endiabrada associated_with Catu - needs import first (pending: ?)
-- Angélica Endiabrada associated_with Almerinda - needs import first
-- Angélica Endiabrada associated_with Menininha - needs import first
-- Angélica Endiabrada associated_with Adelaide Presepeira - needs import first
-- Angélica Endiabrada associated_with Idalina - needs import first

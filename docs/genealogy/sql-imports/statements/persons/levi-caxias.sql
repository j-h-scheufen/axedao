-- ============================================================
-- STATEMENTS FOR: Levi (Duque de Caxias)
-- Generated: 2025-12-30
-- ============================================================
-- Contains all relationships where Levi (Caxias) is the SUBJECT.
-- ============================================================

-- Levi student_of Khorvo
-- NOTE: Khorvo not yet in dataset - see PENDING RELATIONSHIPS below

-- Levi associated_with Gegê (fellow "mestre imprescindível" of Caxias)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"association_context": "Fellow ''mestres imprescindíveis'' of Duque de Caxias; contributed together to Museu Vivo da Capoeira"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://lurdinha.org/site/roda-livre-de-caxias-completa-50-anos/',
  E'Levi and Gegê are recognized as two of the three "mestres imprescindíveis" (indispensable masters) of Duque de Caxias, alongside Mestre Raimundo. Their traditions contributed to the Museu Vivo da Capoeira, based mainly in the 2nd and 3rd districts of Caxias.',
  E'Levi e Gegê são reconhecidos como dois dos três "mestres imprescindíveis" de Duque de Caxias, ao lado de Mestre Raimundo. Suas tradições contribuíram para o Museu Vivo da Capoeira, baseado principalmente no 2º e 3º distritos de Caxias.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Levi' AND s.apelido_context = 'Duque de Caxias'
  AND o.apelido = 'Gegê'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- Levi associated_with Raimundo (Caxias) (fellow "mestre imprescindível")
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  NULL, NULL, NULL, NULL,
  '{"association_context": "Fellow ''mestres imprescindíveis'' of Duque de Caxias; contributed together to Museu Vivo da Capoeira"}'::jsonb,
  'verified'::genealogy.confidence,
  'https://lurdinha.org/site/roda-livre-de-caxias-completa-50-anos/',
  E'Levi and Raimundo are recognized as two of the three "mestres imprescindíveis" (indispensable masters) of Duque de Caxias, alongside Mestre Gegê. Their traditions contributed to the Museu Vivo da Capoeira.',
  E'Levi e Raimundo são reconhecidos como dois dos três "mestres imprescindíveis" de Duque de Caxias, ao lado de Mestre Gegê. Suas tradições contribuíram para o Museu Vivo da Capoeira.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Levi' AND s.apelido_context = 'Duque de Caxias'
  AND o.apelido = 'Raimundo' AND o.apelido_context = 'Duque de Caxias'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Levi student_of Khorvo
--   - Khorvo was co-founder of Kapoarte group (Jan 20, 1965) with Mintirinha, Paulão, Piriquito, Silas
--   - Later left Kapoarte to form his own group
--   - Source: capoeirahistory.com/kapoarte-group/
--   - Needs import first
--
-- Levi co_founded Silêncio com a Fera
--   - First capoeira group of Macaé (1974)
--   - Co-founded with Dengo and other friends
--   - Disbanded when Levi moved to Duque de Caxias
--   - Needs group import (historical, may be low priority)
--
-- NOTE ON DENGO:
-- - Mestre Dengo (Manoel da Cruz Vieira, b. 1957) is Levi's student
-- - However, the statement "Dengo student_of Levi" goes in DENGO's file, not Levi's
-- - Dengo not yet in dataset - add to persons-backlog

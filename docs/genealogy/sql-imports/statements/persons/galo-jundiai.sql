-- ============================================================
-- STATEMENTS FOR: Galo (Jundiaí)
-- Generated: 2026-01-12
-- ============================================================
-- Contains all relationships where Galo (Jundiaí) is the SUBJECT.
-- ============================================================

-- Galo (Jundiaí) associated_with Tarzan (teaching colleagues in Jundiaí 1974-early 1980s)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1974-01-01'::date, 'year'::genealogy.date_precision,
  '1982-01-01'::date, 'approximate'::genealogy.date_precision,
  '{"association_context": "teaching_colleagues"}'::jsonb, 'verified'::genealogy.confidence,
  'portalcapoeira.com, jr.jor.br, lalaue.com',
  'Galo and Tarzan taught alongside each other in Jundiaí from 1974 (when Tarzan arrived from CDO) until early 1980s when both left the city. Together they introduced capoeira to the Jundiaí region and trained the next generation of practitioners including Mestre Rã.',
  'Galo e Tarzan ensinaram lado a lado em Jundiaí de 1974 (quando Tarzan chegou do CDO) até o início dos anos 1980 quando ambos deixaram a cidade. Juntos introduziram a capoeira na região de Jundiaí e treinaram a próxima geração de praticantes incluindo Mestre Rã.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Galo' AND s.apelido_context = 'Jundiaí'
  AND o.apelido = 'Tarzan' AND COALESCE(o.apelido_context, '') = ''
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Galo (Jundiaí) founded Academia de Capoeira Rio Vermelho
--   The first capoeira academy in Jundiaí. Group not yet in dataset.
--   Add to groups backlog.
--
-- Galo (Jundiaí) associated_with Hércules (Campinas)
--   Mentioned alongside Galo and Tarzan as friends in Campinas context.
--   Person not yet in dataset. Needs investigation.
--
-- ============================================================
-- NOTE: Reverse relationships (students OF Galo) are stored in
-- the students' statement files:
-- - Rã student_of Galo (Jundiaí) → ra.sql
-- - Bilisquinho student_of Galo (Jundiaí) → bilisquinho.sql (when imported)
-- ============================================================

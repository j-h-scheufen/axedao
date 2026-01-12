-- ============================================================
-- STATEMENTS FOR: Sete Molas
-- Generated: 2026-01-09
-- ============================================================
-- Contains all relationships where Sete Molas is the SUBJECT.
-- Note: Uses apelido_context 'Liberdade school' to distinguish from
-- Waldemar (who was also nicknamed "Sete Molas").
-- ============================================================

-- Sete Molas associated_with Waldemar (contemporary mestres with adjacent rodas in Liberdade)
-- VALID: Specific documented connection - "had a roda close to Waldemar's" (Araújo 2010)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'associated_with'::genealogy.predicate,
  'person'::genealogy.entity_type, o.id,
  '1940-01-01'::date, 'decade'::genealogy.date_precision,
  NULL, NULL,
  '{"association_context": "contemporary mestres with adjacent rodas in Liberdade"}'::jsonb,
  'likely'::genealogy.confidence,
  'velhosmestres.com (Araújo 2010)',
  'Sete Molas had a roda close to Waldemar''s in Liberdade. Both were contemporary mestres active in the 1940s-1950s.',
  'Sete Molas tinha uma roda perto da de Waldemar na Liberdade. Ambos eram mestres contemporâneos ativos nas décadas de 1940-1950.'
FROM genealogy.person_profiles s, genealogy.person_profiles o
WHERE s.apelido = 'Sete Molas' AND s.apelido_context = 'Liberdade school'
  AND o.apelido = 'Waldemar'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- CONTEMPORARIES (documented in notes_en/notes_pt and .md report, NOT as SQL statements)
-- ============================================================
-- Per João Grande's 1989/2011 testimony, the following were listed together as
-- elite practitioners at Waldemar's roda: Evanir, Tatá, Bom Cabelo, Chita, Macário,
-- Sete Molas, Zacarias. However, being listed together does not constitute a
-- specific documented connection - these are contemporaries, not associates.
-- ============================================================

-- ============================================================
-- PENDING RELATIONSHIPS (object not yet in dataset)
-- ============================================================
-- Sete Molas founded Escola de Sete Molas - group needs import first

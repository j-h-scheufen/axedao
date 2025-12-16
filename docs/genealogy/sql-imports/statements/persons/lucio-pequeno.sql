-- ============================================================
-- STATEMENTS FOR: Lúcio Pequeno
-- Generated: 2025-12-15
-- ============================================================
-- Contains all relationships where Lúcio Pequeno is the SUBJECT.
-- ============================================================

-- Lúcio Pequeno co_founded Gengibirra (Centro Nacional de Capoeira de Origem Angola)
-- Source: Mestre Noronha's manuscripts (O ABC da Capoeira Angola, 1976/1993)
INSERT INTO genealogy.statements (
  subject_type, subject_id, predicate, object_type, object_id,
  started_at, started_at_precision, ended_at, ended_at_precision,
  properties, confidence, source, notes_en, notes_pt
)
SELECT
  'person'::genealogy.entity_type, s.id,
  'co_founded'::genealogy.predicate,
  'group'::genealogy.entity_type, o.id,
  '1922-01-01'::date, 'year'::genealogy.date_precision,
  NULL, 'unknown'::genealogy.date_precision,
  '{}'::jsonb, 'likely'::genealogy.confidence,
  'Mestre Noronha, O ABC da Capoeira Angola (1976/1993)',
  'Listed among the 22 founding mestres of Gengibirra in Mestre Noronha''s manuscripts. Precise founding year uncertain but documented as 1920s; using 1922 based on some sources.',
  'Listado entre os 22 mestres fundadores do Gengibirra nos manuscritos de Mestre Noronha. Ano exato de fundação incerto mas documentado como década de 1920; usando 1922 baseado em algumas fontes.'
FROM genealogy.person_profiles s, genealogy.group_profiles o
WHERE s.apelido = 'Lúcio Pequeno' AND s.apelido_context IS NULL
  AND o.name = 'Gengibirra'
ON CONFLICT (subject_type, subject_id, predicate, object_type, object_id, COALESCE(started_at, '0001-01-01'::date)) DO NOTHING;

-- ============================================================
-- POSSIBLE RELATIONSHIPS (uncertain, not imported)
-- ============================================================
-- Lúcio Pequeno family_of Cândido Pequeno
-- REASON NOT IMPORTED: Shared surname suggests possible relationship,
-- but NO SOURCE explicitly confirms family connection. The relationship
-- is speculative based on surname only. Would require discovering
-- primary evidence to import.
-- ============================================================
